Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD2F335E95F
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 01:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788659060; cv=none; b=qNyFCb1L1pI8yM//jeKXLyFe2omqL49qXb+n9kERAZ8Hawlfd+XRmdaUS5uFyTjSvg9unrqF5XIjxWhCYKSrk0ei2usiPsIyKv+zFZLXbVB7S/HPKbMhKTGDdZvPs7Pow0Fq+OuB4kl9tdatW/Su+Vpddcu1WOQwRrl0q6hCOe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788659060; c=relaxed/simple;
	bh=YxIpk6QkpYjSQquf/Jh8r113i695kj9fMB3adFZeP44=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=Td+kmSRhqdplTkWbvhzd+kAOsU+RBJFhDgu0BoImgaeQPNa7FpNwIHcsVJcoPGEJvLdkMOmAc8Rw6ZU/JFzDFY7EAG9f0MyoW3UO2dhkzt41AobFFcJfl5cVrb+zS5hip/ogrO5/idEtaSXsPP2ky9tPN3m8cR2ssmzK29hnwNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cBvovkFj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cBvovkFj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6AE91F00A3D;
	Sun,  6 Sep 2026 01:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788659058;
	bh=mbrkhjXglhWeP9AyylMvYWDvOU+tbAELvSslJPWWkr4=;
	h=Date:From:To:Cc:Subject:References;
	b=cBvovkFj1zSYejdhsCSET1ppZ9OO0/evvICcp3KnO4m+jRUFkA2VCj6hQ6C3sQIfa
	 nWVJ81+Lyprp5tLej339Nk8LaiBM4u1pp6zD/M1alMWCCp9DWHh0fiaas9fMY4xbiU
	 0nEqDyHVDO2jyfrBMCp5yDGXDgC8gkSawqgshH+k+35RHnbRxO1/9Nnv1ByA2VhY6C
	 hXGB+s6/ISkFui7hcBDTX8+1B36z+CxHYhqWgnTscIUsjpAqXO+j/MsYuz4jHvRjam
	 msmuIfCX6m4ceuelMDXbDMIGXgjw3weTEKuyEyPHpZvt2DPHo5MKzYsCnDtkrnUJUU
	 DfMIHNRUYdZOA==
Received: from rostedt by gandalf with local (Exim 4.99.4)
	(envelope-from <rostedt@kernel.org>)
	id 1x2whQ-00000006JBg-033W;
	Sat, 05 Sep 2026 16:09:16 -0400
Message-ID: <20260905200915.865970617@kernel.org>
User-Agent: quilt/0.69
Date: Sat, 05 Sep 2026 16:08:34 -0400
From: Steven Rostedt <rostedt@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Vincent Donnefort <vdonnefort@google.com>
Subject: [for-linus][PATCH 07/12] tracing: Fix to avoid creating trace instances with duplicate names
References: <20260905200827.773347757@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

From: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>

Since commit e645535a954a ("tracing: Add option to use memmapped
memory for trace boot instance") changed trace_array_get_by_name() to
trace_array_create_systems(), enable_instances() does not reuse the
same name instance. Therefore, if an administrator mistakenly specifies
multiple `trace_instance=` options with duplicate names, all are
created but only the first is accessible via tracefs.

Check whether an instance with the same name already exists before
creating a new one, and reject duplicates with a warning.

Link: https://patch.msgid.link/178847790399.283263.5313150997200138426.stgit@devnote2
Fixes: e645535a954a ("tracing: Add option to use memmapped memory for trace boot instance")
Signed-off-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
---
 kernel/trace/trace.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
index 722d0ba2d233..138e983c3c2f 100644
--- a/kernel/trace/trace.c
+++ b/kernel/trace/trace.c
@@ -9710,6 +9710,11 @@ __init static void enable_instances(void)
 		if (flag_delim)
 			*flag_delim++ = '\0';
 
+		if (trace_array_find(name)) {
+			pr_warn("Tracing: Instance %s already exists\n", name);
+			continue;
+		}
+
 		if (backup) {
 			if (backup_instance_area(backup, &addr, &size) < 0)
 				continue;
-- 
2.53.0


