Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792513041;
	b=KI+cx2xeTlVfyynRxJsdoxuZ7BDqH5BPT386mQQrS67zl2djMOdMuDKnV43g/Kk2Q9Ir
	 dKzbjLaW54gkCYuQA8gjCpyp5KTXHZHkWzLv4KagMh/SS+ZDQtkXNwDYQEG/OfCnJQFFj
	 BlMpsOy2gpfwtW5LMXbiACdfGzjKiNcXvkNjZrVvPNLsmE/6x80mXJr7AGolHRCDZMP7V
	 CfEacSd/dj4zSYhF/xTkAdPYXTOvfoQEZtq5jMBl8U6MEAR0oKhxZruwP2E1R6wMg9LyH
	 frFEdGbLDjPFnonGGKLHsww1JgesEOu0NdsF5EXg2zPNzK+uaLTFqCSJbQpsyUGV4NQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792513041;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=q513xcmGnfa7lzAgcns8bUOb8TYkCTu/EB99iJIdxSw=;
	b=tcLqrmEj8WfpJFA5HMMILrDoSjpwzIn0BSvqaDcQrJt/RrlPJxkeryyZyMUibFTo/o0/
	 XMA+6iZ9vdnrP0vEWSK8LZeUL6a+C8mFhsaCOXT1F0LHLYss4x13tAw/bCdf+Jjf7pS7k
	 86NnQOjRY8GHwZeJAl6QT6cD6UXPHhdyQ0grnRGR8ikQWiGu2YNNgPaifzna9l1mTn7DL
	 GnfsUEavHWm4XG3bZ//tlmSXcmm0jvdd8DsVZtV6GBq1d0s+YlElql/6ZK/1uLHsWRCp6
	 LmP983n4AR3du0ZKZMot9jLaKRBkYqx/w3XqIsgsCS9d7Xcbn1Gip5Dy8WVQqON9BFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=idHEdUZn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58BD160A2604;
	Tue, 20 Oct 2026 16:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=idHEdUZn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 400A41F000CB;
	Tue, 20 Oct 2026 16:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792513041;
	bh=q513xcmGnfa7lzAgcns8bUOb8TYkCTu/EB99iJIdxSw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=idHEdUZn/loUh9YcUYk9WjkUfWAXZT7W3hM+AgG1EbElm420biZtILpGFqXmOyES9
	 K4kTmz622krGwz0ubFgmqUmWgF6X2vrkvBKU+BWsxYtyeEGrl2CfesmHnD+Phe0lGy
	 aiyw+dInB22pZFB+geBarT0LuT2u9zl7tGzzWw8d/eAxEpfq9xYKF0StnFVTYO2Kc1
	 cNKq898LcYtOXUN5YaJUqydrQuCIsoQKhU9T33tx1JKDglhiatUrO+caxq+XIJud3V
	 QRd1kQHjxKcI3l3fhLWungs2226quu9JVQXZVOtke4E50LFli35Lu0skIpHnVgG6rh
	 dNUGUQgCBOWNQ==
From: Sasha Levin <sashal@kernel.org>
To: workflows@vger.kernel.org,
	ksummit@lists.linux.dev
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Mark Brown <broonie@kernel.org>,
	Theodore Ts'o <tytso@mit.edu>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Leon Romanovsky <leon@kernel.org>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	Thorsten Leemhuis <linux@leemhuis.info>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Kees Cook <kees@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Dan Carpenter <error27@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alexei Starovoitov <alexei.starovoitov@gmail.com>,
	Julia Lawall <julia.lawall@inria.fr>,
	SJ Park <sj@kernel.org>,
	Bradley Morgan <brads@mainlining.org>,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH v4 5/5] agents: add a skill to write commit messages
Date: Tue, 20 Oct 2026 12:16:42 -0400
Message-ID: <20261020161642.3713052-6-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261020161642.3713052-1-sashal@kernel.org>
References: <20261020161642.3713052-1-sashal@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Assistants are asked to commit a fix with a detailed message, and the
find-fixes and stable-tag skills leave their tags for that message, but
nothing says how to write it. Messages written by assistants tend to be
long, and Linus recently asked that pull request text written with an
LLM be less verbose and prefer the imperative voice.

Add a skill that sends the agent to the parts of submitting-patches.rst,
5.Posting.rst and the maintainer documentation that cover commit
messages, cover letters and pull requests, and to the P: profiles of the
changed files. It adds what agents get wrong: stating only what the
change and the supplied sources support, keeping the text short and in
the imperative mood, and adding no tags that were not supplied.

When a semantic patch found the bug, the message includes it, or its path
when it is under scripts/coccinelle/, so that reviewers and the
Coccinelle developers can see it and run it again.

Point the bug-fix procedure in coding-assistants.rst at the skill.

Link: https://lore.kernel.org/r/CAHk-=wgXU50=KgZNZc1JDxsSxg9Z+DjG1_2yU-fNXpZtUe4XDw@mail.gmail.com
Link: https://lore.kernel.org/r/50531bd9-f3ea-2d45-7b3a-a96a446a8fcc@inria.fr
Assisted-by: LLM
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 Documentation/process/coding-assistants.rst | 10 +++--
 agents/skills/commit-message/SKILL.md       | 45 +++++++++++++++++++++
 2 files changed, 51 insertions(+), 4 deletions(-)
 create mode 100644 agents/skills/commit-message/SKILL.md

diff --git a/Documentation/process/coding-assistants.rst b/Documentation/process/coding-assistants.rst
index a89a33980c41f..9cae53cc5d8b9 100644
--- a/Documentation/process/coding-assistants.rst
+++ b/Documentation/process/coding-assistants.rst
@@ -41,6 +41,8 @@ The following skills are available:
   returns its stable tag, or checks an existing one.
 * agents/skills/find-siblings/SKILL.md looks for the same bug elsewhere in the
   tree.
+* agents/skills/commit-message/SKILL.md writes, rewrites or reviews a commit
+  message or cover letter, and writes the text of a pull request.
 
 Licensing and Legal Requirements
 ================================
@@ -105,10 +107,10 @@ these steps:
    another one. The fix must not add build warnings and must pass the
    checkpatch.pl checks (see submitting-patches.rst). Then look for the same
    bug elsewhere with the find-siblings skill.
-6. Commit the working fix with a detailed message describing the problem, the
-   solution, a Fixes tag determined with the find-fixes skill, and a stable tag
-   if the stable-tag skill calls for one. Do not add a Signed-off-by tag, and
-   add an Assisted-by tag, as described above.
+6. Commit the working fix with a message written with the commit-message skill,
+   describing the problem, the solution, a Fixes tag determined with the
+   find-fixes skill, and a stable tag if the stable-tag skill calls for one. Do
+   not add a Signed-off-by tag, and add an Assisted-by tag, as described above.
 7. Identify the maintainers and lists using scripts/get_maintainer.pl.
    Documentation/process/security-bugs.rst shows how to do that.
 8. Indicate what could not be done. If the fix could not be built or tested, or
diff --git a/agents/skills/commit-message/SKILL.md b/agents/skills/commit-message/SKILL.md
new file mode 100644
index 0000000000000..c75f028c56da9
--- /dev/null
+++ b/agents/skills/commit-message/SKILL.md
@@ -0,0 +1,45 @@
+---
+# SPDX-License-Identifier: GPL-2.0-only
+name: commit-message
+description: >-
+  Write, rewrite or review the commit message for a Linux kernel change or
+  the cover letter for a patch series, and write the signed tag and pull
+  request text for a subsystem pull. Use when committing or preparing
+  patches, when asked to improve or check a commit message, or when
+  preparing a pull request for an upstream maintainer.
+---
+
+# Write a commit message
+
+Read "Describe your changes", the sections on tags, "The canonical patch
+format" and "Commentary" in Documentation/process/submitting-patches.rst, and
+Documentation/process/5.Posting.rst for cover letters. Follow the maintainer
+profiles, the `P:` entries in MAINTAINERS, for the changed files; they take
+precedence. Follow the rules for skills and for attribution in
+Documentation/process/coding-assistants.rst, and
+Documentation/process/generated-content.rst when a tool found the problem.
+When editing someone else's message, also follow
+Documentation/maintainer/modifying-patches.rst.
+
+- State only what the diff and the sources you were given support, such as a
+  bug report, a crash log, test results, or the list discussion found with
+  `lei q` on lore.kernel.org. If the reason for the change is not known,
+  return no message and say what is missing.
+- Take the Fixes and stable tags from the find-fixes and stable-tag skills.
+  Add other tags only when they were supplied or given on the list. Never add
+  a Signed-off-by.
+- If a semantic patch found the bug, include it in the message between
+  `// <smpl>` and `// </smpl>` lines. For one under scripts/coccinelle/, give
+  its path instead.
+- Use the imperative mood and keep the message as short as its content
+  allows. Leave out markdown, labels such as "Root cause:", intensifiers, a
+  restatement of the subject, and the story of the investigation.
+- Check the result with `scripts/checkpatch.pl --no-signoff`.
+
+For the signed tag and email of a pull request, follow
+Documentation/maintainer/pull-requests.rst,
+Documentation/maintainer/rebasing-and-merging.rst and
+Documentation/maintainer/messy-diffstat.rst. Summarize what the pull contains
+and why from the commit messages in the range, in the same voice, without
+repeating the shortlog. Ask the caller for conflict resolutions and testing
+that the history does not show.
-- 
2.53.0

