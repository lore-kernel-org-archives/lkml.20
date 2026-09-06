Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CD6433CEA7
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 01:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788659157; cv=none; b=J4qp28j+OPOj0VXXpUna1GOW2qpgigrT3fQrrelOsa1/i3WotWQfawrydasZKfaqCpW85L+4SRkrqSuiObvHZHyojPhSRtfwNwPa/aFC7TMQ6C4NUxNq9BoxM7IEhy+eB+NBJKbfFhNdl610tS0Eu3UJqFYyh+dT/KUcAiba4IA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788659157; c=relaxed/simple;
	bh=YxIpk6QkpYjSQquf/Jh8r113i695kj9fMB3adFZeP44=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=YNu0C9ZrI0TPQ7qSpRxUylZNhuFsKgdjwGra38EI9dMPDNZ1Byxs9s5saB+TZ1cUJRikF9UuvG0s5WhgJr8tw9BvxdpI+wdGe+4xEk6qZOQj427AvhLi9GxyfprGHQ6rk29gLtYTnls4ONoH5Opte3LCpmWcZGy5HHmdapAoJPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E9e1hNm6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E9e1hNm6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69DE61F00ADF;
	Sun,  6 Sep 2026 01:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788659147;
	bh=mbrkhjXglhWeP9AyylMvYWDvOU+tbAELvSslJPWWkr4=;
	h=Date:From:To:Cc:Subject:References;
	b=E9e1hNm6ePV9+aWfYWdHiKwUkApb+LHPXFwTCZB6ujZlIEF2Bby8XAY+063kk0gyp
	 5xgOtCWu4T/4smHf7O7nCVTbuoBG0kDwOw2Y4TiYw3SpcYFIM12xAcpD0PWORp6v4i
	 sAzfhzh17Qj2eZ7UU1i+WsMzpGq06QhW289OiCEQmV9yx0ClQmfYeunVEBX0WX87Mn
	 jtblIDdZr95gFk5I1KVoAEXG0PaPg5vbuK+9oT/60ocEm/v28hWLIv5sDYL3euI5yu
	 gC8m+KiLxn4+n50ieZsMc5cdglJfy5C0Ig1fTCuEicuoNyrYD4G0qOE9gNLYtmAY8g
	 GeVXQrrGpLc9w==
Received: from rostedt by gandalf with local (Exim 4.99.4)
	(envelope-from <rostedt@kernel.org>)
	id 1x31yC-00000006PQd-1QFs;
	Sat, 05 Sep 2026 21:46:56 -0400
Message-ID: <20260906014656.204901338@kernel.org>
User-Agent: quilt/0.69
Date: Sat, 05 Sep 2026 21:45:38 -0400
From: Steven Rostedt <rostedt@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Vincent Donnefort <vdonnefort@google.com>
Subject: [for-linus][PATCH 07/12] tracing: Fix to avoid creating trace instances with duplicate names
References: <20260906014531.720267751@kernel.org>
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


