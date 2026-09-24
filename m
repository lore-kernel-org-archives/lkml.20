Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2CEF3002CF;
	Thu, 24 Sep 2026 13:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790257793; cv=none; b=pQ2zK4/yqH+YtMeAfRmgdgqwdlj+CUWLCIXYs/Ykc9gwHVy0ETHVgOqkp8m43P4jNSkgbjaU+4lHLn3+20YNfkAzYjfGjjMyVTDq560sX9XOQtcqWgvmYyXO7U23vNYU+dao4FxqYJbKhNkBeIluZ3LioQeoPNDLa/oX/hEGZ8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790257793; c=relaxed/simple;
	bh=L9jdbxdU+cyqjS7Mqp7UTFMeO1hjaIxFFAPQ2lSOcN0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TWEqa3KVLvE4WfL98RtrmEGuCJfpu5UKu0T2/3ZQtK25zywQ/rdKy3LmVpMszr6uI+4s2q+N4/EtfkKPKTlux4OM2JoxK5aNppCXeNl6iNLUe2JqiNysRPC/q6VY9Bb55UoLPMpuPetwolXx9GxI8fqGnGWJov2aRbSGnJVsiO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NcKgNXn1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NcKgNXn1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 030921F000FF;
	Thu, 24 Sep 2026 13:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790257790;
	bh=MRnlUR5F46eq+JtF4GuViCy6aj2enWdJaZfKwgd5wDU=;
	h=From:To:Cc:Subject:Date;
	b=NcKgNXn12fAyh58PAEOoF4nU2B3Qc6gjCpEnrm2ufiafSg0Gc01P8/4kZWZ1PKZky
	 QQug8twn+tYXz7NtRKKhUFLobu2aRq90ooLcxgnkJYOnFpwZXmzje+GS8A6oAnN2K9
	 wWyfmCd3CHm1NfPeq1UU+9S96MCsaipV14BnEGd6n+9SrN3VRNTVAsJThKL7Iv/rV6
	 L4qCJkV1Nu0qOVWmIjH/ijwpgN4POay/JYx7EOX8e1PhsL4/lsTRNSFS7q3rIqmRQh
	 S3GoCaHa8pSWziBAtMlEJKVpPmofDaA7Ya2hfm4w/TnQlCd9pE/zjvt0XG8M/na/Ao
	 AOiu5ySnsWjeg==
From: Sasha Levin <sashal@kernel.org>
To: corbet@lwn.net
Cc: workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-kernel@vger.kernel.org,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH] docs: add AGENTS.md as a symlink to README
Date: Thu, 24 Sep 2026 09:49:45 -0400
Message-ID: <20260924134945.3095661-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Most coding agents have standardized on AGENTS.md as the file they load
automatically from the root of a repository. README already tells AI
tools to read and follow Documentation/process/coding-assistants.rst,
but that only helps if the agent decides to read README before acting,
which in practice it often doesn't.

Add a top-level AGENTS.md symlink to README, so agents load it on their
own and follow its pointer to the AI guidelines. This keeps a single
entry point for every reader, and avoids adding a separate copy of the
policy that could drift from the RST.

As an example, two different agents were asked to "create a new commit
renaming the release (in the Makefile) to AI Test".

Without AGENTS.md, the first agent added a Signed-off-by for the user on
its own. It should never have done that: only the human submitter can
certify the Developer Certificate of Origin, after reviewing the change.
It also used its own attribution tag instead of Assisted-by:

> Makefile: rename release to AI Test
>
> Co-Authored-By: <model name> <noreply@...>
> Signed-off-by: Sasha Levin <sashal@kernel.org>

The second agent added no attribution at all:

> Rename release to AI Test

With AGENTS.md in place, neither agent added a Signed-off-by, and both
used the Assisted-by tag. README itself mentions neither tag, so both
agents followed its pointer to coding-assistants.rst:

> Makefile: rename release to "AI Test"
>
> Change the release name from "Baby Opossum Posse" to "AI Test".
>
> Assisted-by: LLM

> Makefile: rename release to AI Test
>
> Assisted-by: LLM

Both agents also followed the kernel's general guidelines more closely.
The second agent's subject gained the "subsystem: summary phrase" form
that submitting-patches.rst asks for, instead of a bare "Rename release
to AI Test", and the first agent added a body describing the change.

Assisted-by: LLM
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 AGENTS.md | 1 +
 1 file changed, 1 insertion(+)
 create mode 120000 AGENTS.md

diff --git a/AGENTS.md b/AGENTS.md
new file mode 120000
index 0000000000000..100b93820ade4
--- /dev/null
+++ b/AGENTS.md
@@ -0,0 +1 @@
+README
\ No newline at end of file
-- 
2.53.0

