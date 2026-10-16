Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C17E35AA66C;
	Fri, 16 Oct 2026 18:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792173625; cv=none; b=tMkXHT+gD6RBC4thXr7mio+1HLX6xIAjEl2xwW0Ql36t5nzu1hKKTvXiULrhfw5kNtU4FIlWikt5xu3E9sWB2Fgnc9dz5ZYZ4HGQsGQFva/CWu9l8I8PM59CyA2BDqovO8kdtfmgtaVT405/9mIJJ2CxRswmwquX2MAyiJsOYQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792173625; c=relaxed/simple;
	bh=sZXnSuIwIppbM1aqwnBdMic0pTtpB9emzmkp0qukc8g=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Q6wBRhaLVL8NCbRr52mCm3pLLzF8J0tf2Is7yPXYOb+256arBqnafalx/qvhCVWYEA8V6s6dIxUOf56dUDa+mR3I5JLHRNUQ28VSXLNirNTuYqloDmBRXlbf3Hla66PyfmsH3sMTHuvoo2sVFt2l99AtJkZVykchuUiC7OievCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=nrcqtG49; arc=none smtp.client-ip=192.134.164.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="nrcqtG49"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=lRBxtdH2PUaUeo2Vjem9KpwWjfHm2fZaH3Sjwg7NnMU=;
  b=nrcqtG49xJZS+h5ZM+bFdvT7DENbKpjESpC87iqvWyiX8M6+mB/GdeRY
   Sf/a74Uf5qUTd1gjK4tFwyElANGtmA+ArZQCgOPDfQkJNNEXYGFg4rD7S
   xtZ6Jhy2y3yXXNrfbRdN1suWYryhOxFDSijYvJ4Ful0/8oOdMMfbq1G64
   M=;
X-CSE-ConnectionGUID: 4UCOJhGNRZm0COodBSB9Fg==
X-CSE-MsgGUID: 4KygORgDRbWy08ujCVEewQ==
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.27,162,1787004000"; 
   d="scan'208";a="300627534"
Received: from static.host-68-71-1-178.nrbn.ca (HELO hadrien) ([68.71.18.178])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2026 20:00:17 +0200
Date: Fri, 16 Oct 2026 14:00:15 -0400 (EDT)
From: Julia Lawall <julia.lawall@inria.fr>
To: Sasha Levin <sashal@kernel.org>
cc: workflows@vger.kernel.org, ksummit@lists.linux.dev, 
    linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
    Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
    Randy Dunlap <rdunlap@infradead.org>, Mark Brown <broonie@kernel.org>, 
    Theodore Ts'o <tytso@mit.edu>, 
    Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    Leon Romanovsky <leon@kernel.org>, 
    Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
    Thorsten Leemhuis <linux@leemhuis.info>, 
    "Michael S. Tsirkin" <mst@redhat.com>, Kees Cook <kees@kernel.org>, 
    Geert Uytterhoeven <geert@linux-m68k.org>, 
    Dan Carpenter <error27@gmail.com>, Miguel Ojeda <ojeda@kernel.org>
Subject: Re: [PATCH v3 6/7] agents: add a skill to find other instances of
 a fixed bug
In-Reply-To: <20261016152828.3765695-7-sashal@kernel.org>
Message-ID: <957f530-7954-3e2c-9975-d369af37270@inria.fr>
References: <20261016152828.3765695-1-sashal@kernel.org> <20261016152828.3765695-7-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Fri, 16 Oct 2026, Sasha Levin wrote:

> A bug fixed in one place often exists elsewhere, in copied code, sibling
> drivers, or other users of the same interface, and reviewers routinely
> ask whether that was checked. Left alone, agents tend to audit the whole
> tree by reading it. Add a skill that states the defect as a rule,
> searches for it through shared interfaces, copied code, the introducing
> series and earlier fixes, and verifies each candidate before reporting
> it.
>
> When Coccinelle is available, the skill searches with a semantic patch:
> it looks for an existing one under scripts/coccinelle/, checks that the
> rule marks the fixed site in the code before the fix, runs it over the
> whole tree with coccicheck, and checks which code spatch could not
> parse. These steps live in references/coccinelle.md, which the agent
> reads only when it uses Coccinelle.

Could I get some feedback from this?  I would be interested to know about
code that it can't parse.  Maybe AI could write a semantic patch and try
it?

julia


>
> Tested on the parent of commit 989fe6771266 ("drm/nouveau/gsp: fix
> mismatched alloc/free for kvmalloc()"): both the existing
> api/kfree_mismatch.cocci and the example rule mark the two kfree() calls
> that commit fixed, and a whole-tree run found the same bug in four other
> drivers that were later fixed separately.
>
> The sites found are reported, not fixed; each needs its own fix, Fixes
> tag and stable decision. Point the bug-fix procedure in
> coding-assistants.rst at the skill.
>
> Assisted-by: LLM
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>  Documentation/process/coding-assistants.rst   |  5 +-
>  agents/skills/find-siblings/SKILL.md          | 31 +++++++++
>  .../find-siblings/references/coccinelle.md    | 66 +++++++++++++++++++
>  3 files changed, 101 insertions(+), 1 deletion(-)
>  create mode 100644 agents/skills/find-siblings/SKILL.md
>  create mode 100644 agents/skills/find-siblings/references/coccinelle.md
>
> diff --git a/Documentation/process/coding-assistants.rst b/Documentation/process/coding-assistants.rst
> index fc4e98fd96e11..a89a33980c41f 100644
> --- a/Documentation/process/coding-assistants.rst
> +++ b/Documentation/process/coding-assistants.rst
> @@ -39,6 +39,8 @@ The following skills are available:
>    checks an existing one.
>  * agents/skills/stable-tag/SKILL.md decides whether a fix goes to stable and
>    returns its stable tag, or checks an existing one.
> +* agents/skills/find-siblings/SKILL.md looks for the same bug elsewhere in the
> +  tree.
>
>  Licensing and Legal Requirements
>  ================================
> @@ -101,7 +103,8 @@ these steps:
>  5. Build and verify that the fix works either using the reproducer or by
>     re-running a complete analysis; drop any fix that doesn't work and try
>     another one. The fix must not add build warnings and must pass the
> -   checkpatch.pl checks (see submitting-patches.rst).
> +   checkpatch.pl checks (see submitting-patches.rst). Then look for the same
> +   bug elsewhere with the find-siblings skill.
>  6. Commit the working fix with a detailed message describing the problem, the
>     solution, a Fixes tag determined with the find-fixes skill, and a stable tag
>     if the stable-tag skill calls for one. Do not add a Signed-off-by tag, and
> diff --git a/agents/skills/find-siblings/SKILL.md b/agents/skills/find-siblings/SKILL.md
> new file mode 100644
> index 0000000000000..471ce8d9c0bd6
> --- /dev/null
> +++ b/agents/skills/find-siblings/SKILL.md
> @@ -0,0 +1,31 @@
> +---
> +# SPDX-License-Identifier: GPL-2.0-only
> +name: find-siblings
> +description: >-
> +  Find other places in the Linux kernel tree that have the same defect as a
> +  bug being fixed, and verify each candidate. Use after fixing or reviewing
> +  a bug fix, or when asked whether the same bug exists elsewhere.
> +---
> +
> +# Find other instances of a bug
> +
> +Follow the rules for skills in Documentation/process/coding-assistants.rst.
> +
> +- State the defect as a rule that does not depend on local names, such as
> +  "memory from kvmalloc() is released with kfree()".
> +- Search the tree as it was before the fix, not the working tree. Look at
> +  other users of the same interface, field or lock, code copied from the same
> +  origin, the rest of the series that introduced the bug, and earlier fixes
> +  for the same defect. Limit history searches to the relevant directories.
> +- If Coccinelle is available (`spatch --version` works), search for the
> +  defect with a semantic patch as
> +  [references/coccinelle.md](references/coccinelle.md) describes. Otherwise
> +  use text searches and report that limit.
> +- A match is a lead. Read each candidate with its callers, locking and object
> +  lifetimes, and classify it as confirmed, safe or undetermined, with the
> +  reason. Check whether a confirmed site is already fixed in the current tree
> +  or in a pending tree such as linux-next.
> +
> +Return the searches you ran and their scope, and the classified sites with
> +their maintainers. Do not fix the sites: each confirmed one is a separate bug
> +that needs its own fix, Fixes tag and stable decision.
> diff --git a/agents/skills/find-siblings/references/coccinelle.md b/agents/skills/find-siblings/references/coccinelle.md
> new file mode 100644
> index 0000000000000..6b09ce9d04c8c
> --- /dev/null
> +++ b/agents/skills/find-siblings/references/coccinelle.md
> @@ -0,0 +1,66 @@
> +<!-- SPDX-License-Identifier: GPL-2.0-only -->
> +
> +# Searching for a bug pattern with Coccinelle
> +
> +Documentation/dev-tools/coccinelle.rst describes `make coccicheck` and its
> +options. The semantic patch language is documented at
> +https://coccinelle.gitlabpages.inria.fr/website/docs/.
> +
> +1. Look under `scripts/coccinelle/` for a semantic patch that already covers
> +   the defect. Read its rules rather than its name: `kfree()` of memory from
> +   `kvmalloc()` is covered by `api/kfree_mismatch.cocci`, while
> +   `api/kvmalloc.cocci` only flags an open-coded `is_vmalloc_addr()` test.
> +
> +2. Otherwise, write a semantic patch outside the repository. Match only what
> +   the defect needs, not names or statements specific to the fixed site. Mark
> +   the lines of interest with `*`, and declare `virtual context`: coccicheck
> +   passes `-D context`, and spatch rejects a mode the file does not declare.
> +   A minimal rule for memory from `kvmalloc()` released with `kfree()`, a
> +   case that `api/kfree_mismatch.cocci` covers more completely:
> +
> +       virtual context
> +
> +       @@
> +       expression E;
> +       @@
> +       E = \(kvmalloc\|kvzalloc\|kvcalloc\|kvmalloc_array\)(...);
> +       ...
> +       * kfree(E);
> +
> +3. Check that it finds the site you fixed. Coccinelle reads the files on
> +   disk, where the fix is usually already applied, so copy the file as it was
> +   before the fix to a directory outside the repository and run
> +   `spatch -D <mode> --very-quiet --sp-file <rule> <copy>`, with a mode the
> +   rule declares on a `virtual` line, such as `context` or `report`. Without
> +   `-D`, rules that depend on a mode do not run and nothing is reported. The
> +   rule must mark the fixed site in that copy, and nothing in the fixed
> +   version. If it misses the site, correct the rule before searching further.
> +
> +4. Search the whole tree:
> +
> +       make coccicheck MODE=context COCCI=<rule> DEBUG_FILE=<new log file>
> +
> +   - Use a `MODE` the rule declares on a `virtual` line, as in step 3.
> +   - In context mode the output is a diff, and each line starting with `-`
> +     is a line the rule marked; report mode prints one warning per site.
> +     coccicheck searches the files on disk, so a site you already fixed
> +     there is not marked; step 3 covers it.
> +   - The kernel's `.cocciconfig` makes spatch skip files that do not contain
> +     the rule's identifiers, so a whole-tree search is usually quick when the
> +     rule names distinctive functions. Add `M=<dir>/` only if it is not.
> +   - Give `COCCI` and `DEBUG_FILE` as absolute paths. With `M=`, coccicheck
> +     runs from that directory.
> +   - Read the log. Without `DEBUG_FILE`, spatch errors are discarded and a
> +     broken rule shows only as "coccicheck failed". coccicheck refuses to
> +     reuse an existing log file.
> +   - Header files are searched only with `SPFLAGS=--include-headers`, or with
> +     a `// Options: --include-headers` line at the top of the rule.
> +
> +5. Check what was not searched. Coccinelle skips code it cannot parse without
> +   saying so. Run `spatch --parse-c` on the searched files or directories: a
> +   nonzero `nb bad` count means part of them was skipped. Search those files
> +   another way and report the gap.
> +
> +If the rule marks many sites that turn out to be safe, tighten it, for example
> +with `when !=` constraints, and run it again rather than discarding candidates
> +by hand.
> --
> 2.53.0
>
>
>
