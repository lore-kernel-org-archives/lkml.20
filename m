Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794515010;
	b=KBJXcGC8owtLqMVfh9ewQnFO2ivutwcBxtxDGIJbUlwQQKdWH6Qr5ks9Tb2SxiHkNeNl
	 G/A81aoWpUjzRZdBdt0TIHLLr/UUTITPgI69C5PHhq93Yym/4cpwn/JzGn35cjzdl/ho/
	 NeZpJPs4rBzIdYkgQhXaLgc/cqdy2vsl3/AsI93OtNVwIBgWZw4mo9T56ASAQz999GWM1
	 8NcwPe7MGIyMvr3s9l5FtB52o0KfnxL61z2idnxYo1L6TjEFGus6UlZcxFpGIv+qQ3cup
	 QPQEROoOOZoqAd3+ndEOWs1ARkDQ2d1RbWl/RI9nDeWuEqaF6aE0Vq117ieTXTS6M7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794515010;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=f3q8URw5PrUeM8KtcT2QY/VOWaWL14y/F0CXWVvDMCw=;
	b=OaaLlioIFHnDqg4xM89Pl4O6ASQ1+cQeGIc/yaZWPV7B0WolLLLDOoj7hI6OdCDdCbzi
	 DYzF22wC/W6tuwNecNdgPciZC2cn1bwrTUSB1PSEWhcyT8wFSPovSYNIHgMVRCHxMuFjU
	 meM7vPYRbtkShFgAFjZEvPhg6YDKk38DET0TVm0RcFcEHfr2hwwyiDqNX/FavEcmanFVy
	 yJyAf+ghesoFtdA7G9M5BHGOu1k26iYcWnzQki54N4SsNTVgztHig83qNA15cEVLoSKSd
	 7A0oXkKQkqdnR/t/MRY8ov66lKpZMI1ElhxOersd/Q9safpxI5pSnd1R+qxN6x9pWGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SCNXcR5H;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AAC3606A323
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 20:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SCNXcR5H
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A02B61F000C4
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 20:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794515009;
	bh=f3q8URw5PrUeM8KtcT2QY/VOWaWL14y/F0CXWVvDMCw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=SCNXcR5HIK3Ip7lQdOBXl+DlYWm/K/Ua5V36JjC9st0oaEJGt6ZlYm8AqysA3mKPu
	 YeWXQ/qWRU0wDkE0TXaqOehX2DVQ6/gvyrp4b7A2GdRA3wFWr/dvAJQ8VdQEmx6G7P
	 /FhBUIwQukqxyfJqA6xatIgleBp5TWOPhh2CjmroZ69uEfaIlmlEjKdBYjKlEmGQ3L
	 73bnoMrDMuk/OHfuefgwRvS4CskhBH+ZFVXqSZp1pC7UDdad7RK/dqqZVOlckicy7D
	 DPaPNB5aawhJGYstWPcFAUkQ6fPaxCOHxWCUcL4d5au3c5I+lRxY09nAQJgx0SqipQ
	 h8VGqYjnZ/6Hw==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3ada7d53082so3525241fa.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 12:23:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHtu0ZIAZndW7zc5PbtrWPtAtCe9oc6YAzV+N6Vx9qLE75UlpDkWRM7vkR2Sop/XA4FQoinA8G1ZVufOI8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+S5R9LlW+kBDjC30aqjs4JB2PASK61TaqqZtPV3XMyxhqqByI/
	L6+tIp3XhWLPRRXfbCbMaG0aOJ9WSXPlislV1Mrt1uY2VmPGDgKTokjnEl4hLaNaoM924n0rQCH
	e1mjLN+a7UEP/ENCUijH+2hlsSuY8j6Y=
X-Received: by 2002:a05:651c:1b0e:b0:3ad:fc9d:3b94 with SMTP id
 38308e7fff4ca-3ae1bf196e3mr9291491fa.2.1794515008087; Thu, 12 Nov 2026
 12:23:28 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111225940.1573565-1-tytso@mit.edu> <20261111225940.1573565-5-tytso@mit.edu>
In-Reply-To: <20261111225940.1573565-5-tytso@mit.edu>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Thu, 12 Nov 2026 21:23:15 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0j9YUEzVkwo3H9FexJkTNKiDyeaq+ZsZbCMkOmBJJ93LQ@mail.gmail.com>
X-Gm-Features: AclHuK9LaLG2jOUXPsxnHfw7JQLjQ_67ZDK1dknb5rFvYzKuJf_eaGDnPyBCvfU
Message-ID: <CAJZ5v0j9YUEzVkwo3H9FexJkTNKiDyeaq+ZsZbCMkOmBJJ93LQ@mail.gmail.com>
Subject: Re: [PATCH v5 4/6] agents: add a skill to find other instances of a
 fixed bug
To: "Theodore Ts'o" <tytso@mit.edu>
Cc: workflows@vger.kernel.org, ksummit@lists.linux.dev, 
	Sasha Levin <sashal@kernel.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Mark Brown <broonie@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Leon Romanovsky <leon@kernel.org>, 
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>, Thorsten Leemhuis <linux@leemhuis.info>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Kees Cook <kees@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Dan Carpenter <error27@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alexei Starovoitov <alexei.starovoitov@gmail.com>, 
	Julia Lawall <julia.lawall@inria.fr>, SJ Park <sj@kernel.org>, 
	Bradley Morgan <brads@mainlining.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 12:00=E2=80=AFAM Theodore Ts'o <tytso@mit.edu> wrot=
e:
>
> From: Sasha Levin <sashal@kernel.org>
>
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
> reads only when it uses Coccinelle. The semantic patch is returned with
> the results, so that the commit message of a fix can include it.
>
> Tested on the parent of commit 989fe6771266 ("drm/nouveau/gsp: fix
> mismatched alloc/free for kvmalloc()"): both the existing
> api/kfree_mismatch.cocci and the example rule mark the two kfree() calls
> that commit fixed, and a whole-tree run found the same bug in four other
> drivers that were later fixed separately.
>
> The sites found are reported, not fixed. When the same defect turns up
> in several places, the skill also reports whether the interface invites
> it. The missing of_node_put() calls that iterators/for_each_child.cocci
> finds were fixed one driver at a time for years, until
> commit 34af4554fb0c ("of: Introduce for_each_*_child_of_node_scoped() to
> automate of_node_put() handling") made the put automatic. Whether to fix
> the interface or each site is left to the developer.
>
> Point the bug-fix procedure in coding-assistants.rst at the skill.
>
> Link: https://lore.kernel.org/r/DM6DXZJSMPO3.J5PONDJ3HWNP@gmail.com
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> Link: https://patch.msgid.link/20261020161642.3713052-5-sashal@kernel.org
> Signed-off-by: Theodore Ts'o <tytso@mit.edu>

Looks reasonable to me.

Acked-by: Rafael J. Wysocki (Intel) <rafael@kernel.org>

> ---
>  Documentation/process/coding-assistants.rst   |  5 +-
>  agents/skills/find-siblings/SKILL.md          | 36 ++++++++++
>  .../find-siblings/references/coccinelle.md    | 66 +++++++++++++++++++
>  3 files changed, 106 insertions(+), 1 deletion(-)
>  create mode 100644 agents/skills/find-siblings/SKILL.md
>  create mode 100644 agents/skills/find-siblings/references/coccinelle.md
>
> diff --git a/Documentation/process/coding-assistants.rst b/Documentation/=
process/coding-assistants.rst
> index 81ee530a8a7f..c2f9b71650c1 100644
> --- a/Documentation/process/coding-assistants.rst
> +++ b/Documentation/process/coding-assistants.rst
> @@ -39,6 +39,8 @@ The following skills are available:
>    checks an existing one.
>  * agents/skills/stable-tag/SKILL.md decides whether a fix goes to stable=
 and
>    returns its stable tag, or checks an existing one.
> +* agents/skills/find-siblings/SKILL.md looks for the same bug elsewhere =
in the
> +  tree.
>
>  Licensing and Legal Requirements
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> @@ -83,7 +85,8 @@ these steps:
>  5. Build and verify that the fix works either using the reproducer or by
>     re-running a complete analysis; drop any fix that doesn't work and tr=
y
>     another one. The fix must not add build warnings and must pass the
> -   checkpatch.pl checks (see submitting-patches.rst).
> +   checkpatch.pl checks (see submitting-patches.rst). Then look for the =
same
> +   bug elsewhere with the find-siblings skill.
>  6. Commit the working fix with a detailed message describing the problem=
, the
>     solution, a Fixes tag determined with the find-fixes skill, and a sta=
ble
>     tag if the stable-tag skill calls for one.  Do not add a Signed-off-b=
y tag.
> diff --git a/agents/skills/find-siblings/SKILL.md b/agents/skills/find-si=
blings/SKILL.md
> new file mode 100644
> index 000000000000..8d007472675d
> --- /dev/null
> +++ b/agents/skills/find-siblings/SKILL.md
> @@ -0,0 +1,36 @@
> +---
> +# SPDX-License-Identifier: GPL-2.0-only
> +name: find-siblings
> +description: >-
> +  Find other places in the Linux kernel tree that have the same defect a=
s a
> +  bug being fixed, and verify each candidate. Use after fixing or review=
ing
> +  a bug fix, or when asked whether the same bug exists elsewhere.
> +---
> +
> +# Find other instances of a bug
> +
> +Follow the rules for skills in Documentation/process/coding-assistants.r=
st.
> +
> +- State the defect as a rule that does not depend on local names, such a=
s
> +  "memory from kvmalloc() is released with kfree()".
> +- Search the tree as it was before the fix, not the working tree. Look a=
t
> +  other users of the same interface, field or lock, code copied from the=
 same
> +  origin, the rest of the series that introduced the bug, and earlier fi=
xes
> +  for the same defect. Limit history searches to the relevant directorie=
s.
> +- If Coccinelle is available (`spatch --version` works), search for the
> +  defect with a semantic patch as
> +  [references/coccinelle.md](references/coccinelle.md) describes. Otherw=
ise
> +  use text searches and report that limit.
> +- A match is a lead. Read each candidate with its callers, locking and o=
bject
> +  lifetimes, and classify it as confirmed, safe or undetermined, with th=
e
> +  reason. Check whether a confirmed site is already fixed in the current=
 tree
> +  or in a pending tree such as linux-next.
> +- If several sites have the same defect, check whether the interface the=
y use
> +  invites it, for example by making every caller drop a reference by han=
d when
> +  it leaves a loop early. If it does, report that the defect is better f=
ixed
> +  in the interface, along with the sites. The developer decides which wa=
y to
> +  fix it.
> +
> +Return the searches you ran and their scope, with any semantic patch you
> +used, and the classified sites with their maintainers. Do not fix the si=
tes or
> +the interface.
> diff --git a/agents/skills/find-siblings/references/coccinelle.md b/agent=
s/skills/find-siblings/references/coccinelle.md
> new file mode 100644
> index 000000000000..6b09ce9d04c8
> --- /dev/null
> +++ b/agents/skills/find-siblings/references/coccinelle.md
> @@ -0,0 +1,66 @@
> +<!-- SPDX-License-Identifier: GPL-2.0-only -->
> +
> +# Searching for a bug pattern with Coccinelle
> +
> +Documentation/dev-tools/coccinelle.rst describes `make coccicheck` and i=
ts
> +options. The semantic patch language is documented at
> +https://coccinelle.gitlabpages.inria.fr/website/docs/.
> +
> +1. Look under `scripts/coccinelle/` for a semantic patch that already co=
vers
> +   the defect. Read its rules rather than its name: `kfree()` of memory =
from
> +   `kvmalloc()` is covered by `api/kfree_mismatch.cocci`, while
> +   `api/kvmalloc.cocci` only flags an open-coded `is_vmalloc_addr()` tes=
t.
> +
> +2. Otherwise, write a semantic patch outside the repository. Match only =
what
> +   the defect needs, not names or statements specific to the fixed site.=
 Mark
> +   the lines of interest with `*`, and declare `virtual context`: coccic=
heck
> +   passes `-D context`, and spatch rejects a mode the file does not decl=
are.
> +   A minimal rule for memory from `kvmalloc()` released with `kfree()`, =
a
> +   case that `api/kfree_mismatch.cocci` covers more completely:
> +
> +       virtual context
> +
> +       @@
> +       expression E;
> +       @@
> +       E =3D \(kvmalloc\|kvzalloc\|kvcalloc\|kvmalloc_array\)(...);
> +       ...
> +       * kfree(E);
> +
> +3. Check that it finds the site you fixed. Coccinelle reads the files on
> +   disk, where the fix is usually already applied, so copy the file as i=
t was
> +   before the fix to a directory outside the repository and run
> +   `spatch -D <mode> --very-quiet --sp-file <rule> <copy>`, with a mode =
the
> +   rule declares on a `virtual` line, such as `context` or `report`. Wit=
hout
> +   `-D`, rules that depend on a mode do not run and nothing is reported.=
 The
> +   rule must mark the fixed site in that copy, and nothing in the fixed
> +   version. If it misses the site, correct the rule before searching fur=
ther.
> +
> +4. Search the whole tree:
> +
> +       make coccicheck MODE=3Dcontext COCCI=3D<rule> DEBUG_FILE=3D<new l=
og file>
> +
> +   - Use a `MODE` the rule declares on a `virtual` line, as in step 3.
> +   - In context mode the output is a diff, and each line starting with `=
-`
> +     is a line the rule marked; report mode prints one warning per site.
> +     coccicheck searches the files on disk, so a site you already fixed
> +     there is not marked; step 3 covers it.
> +   - The kernel's `.cocciconfig` makes spatch skip files that do not con=
tain
> +     the rule's identifiers, so a whole-tree search is usually quick whe=
n the
> +     rule names distinctive functions. Add `M=3D<dir>/` only if it is no=
t.
> +   - Give `COCCI` and `DEBUG_FILE` as absolute paths. With `M=3D`, cocci=
check
> +     runs from that directory.
> +   - Read the log. Without `DEBUG_FILE`, spatch errors are discarded and=
 a
> +     broken rule shows only as "coccicheck failed". coccicheck refuses t=
o
> +     reuse an existing log file.
> +   - Header files are searched only with `SPFLAGS=3D--include-headers`, =
or with
> +     a `// Options: --include-headers` line at the top of the rule.
> +
> +5. Check what was not searched. Coccinelle skips code it cannot parse wi=
thout
> +   saying so. Run `spatch --parse-c` on the searched files or directorie=
s: a
> +   nonzero `nb bad` count means part of them was skipped. Search those f=
iles
> +   another way and report the gap.
> +
> +If the rule marks many sites that turn out to be safe, tighten it, for e=
xample
> +with `when !=3D` constraints, and run it again rather than discarding ca=
ndidates
> +by hand.
> --
> 2.53.0
>
>
