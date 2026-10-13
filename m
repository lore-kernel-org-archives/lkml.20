Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F2F484255
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 04:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791866549; cv=none; b=gNDY7yDowdL0T8MQ4o57adoikLlmhzxK/OevueVUIFXYPe0doz9hH+z9EG8F1cCHdT9mVNI4QMG6P7jVShz2jOdmgxqDzI85EN4/fJtkzmcijZF/BaUXTpTZ2XZRFY7EPy1KJFAIJkSp4/A0L80/rui970uLRngXoiZk0gaY+UI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791866549; c=relaxed/simple;
	bh=Ol+s2vk0ZLT1IYUizgYgeYGgE7WjYKbhbbABaqF1TpE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ihH8AfG4gbOHbIb/KTWXo+lpQFMWX7RoXF/i3+GkRmzeQZ1iAs19Ig7uQu6cIf99MFqYkcfNz25cU6HWq78k+M8iSMYqpRig+MCqpiLnm3BYpZVo1OU2keMtvCISZxy8qYw0zW1RQGrlJpvBIubun17Chat1gYVVRe6IL0P9W9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Zagz6uSH; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=IxImz4XX; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Zagz6uSH";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="IxImz4XX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791866546;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DN0jtBkRWMnfUDmUYaFvEQ8VuOuU0jix5BANuQb8I80=;
	b=Zagz6uSHKW6++w7/7nUJJjkUpeQ+Q4KYTmEdq1OanRXunR+qrcU4lO2bamRbNsMCod8Pz/
	B4kiggWnfI/J7+jrU2NlU3q2Pfv9RDXNpN7svdZbpMrVRc/J0l6ohia8uTSvLGJW77FeZC
	AawR8JEW1S+7qZ2iFT1BFY5abvV8eME=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-590-reavabX2MXKA5_xVzTJ0dA-1; Tue, 13 Oct 2026 04:42:25 +0000
X-MC-Unique: reavabX2MXKA5_xVzTJ0dA-1
X-Mimecast-MFC-AGG-ID: reavabX2MXKA5_xVzTJ0dA_1791866544
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4a17c024b89so23235615e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 21:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1791866544; x=1792471344; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DN0jtBkRWMnfUDmUYaFvEQ8VuOuU0jix5BANuQb8I80=;
        b=IxImz4XXJvQIv+o/0vr32POpWtNY1c6zcFz0zaGH/wO2UatZ7LLcxiFkRfmHOorZLQ
         sQr8N8gr9Z2+ny2kWegrcQCqXUUHKbYsOLv1RjMSeOxdjM9fRiJ+6F7puka4uy3ZuGFE
         JmQrycIi89OeauWkezFlBERMxu04761rGwylXJpr4tjmmYlfBXq2U+P03eIwLp1JxgBd
         7lTdM70RjaD5CgxfJ/AXKGAJ3VO0++xtBKFOPwGVz/Sba2NbO34kx4Q10aYt63zp1cPz
         tRaDAdJ1QSqvdWmAsFCeFTI2qgzRVG4lDOpMCZlK3ryldvcr5kq8+PQ9U8Svr/exQKL1
         7fbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791866544; x=1792471344;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DN0jtBkRWMnfUDmUYaFvEQ8VuOuU0jix5BANuQb8I80=;
        b=LVCEa4hb07hzgYyV/636tsU+CE5ITssrSESVn4TX/Qo1W/JO/KimTYdUEZCwEQvMA+
         Cr7o5ncrXq8FViOz3uZ/BswklwSx33bKRrP5JTZV7Z4t50Q3i70po4Br1qZQVmAJBhRS
         y0R316Iq2uwBOScw4guxCjjdiFPxkQ8nuBVa/O7j/tcomtspsT8/YYpZyExho+L13uP4
         7q1SJPLVbhVKSYxVKLXcyJGPL6rprsbCNHHrDhjGTAeT2cYU47qJrbY7DSn1ocwqt0Rw
         b2IffeuUML47JVB5K4/94bmRAcVS+nQhM80E/EVMNtE7OsulTJmmEWGQ21Z/e5NiqLnX
         nXUg==
X-Forwarded-Encrypted: i=1; AKwUvBxfhMk/V/C9mprUaR3CYhwP2PS5SJksMCOnQ7BZzfA4tu6ucFTalgUCvDHdf3NTh6FDvwbLn9qI9hQcqYQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKEdNbVx2by7rEuwTPacQuDC10bmiJ4M7T8g6UnUUVJPz+1ghZN
	+GK9d6suKj28CHfUGvRKFxf4Acj7Y5wOtfhirAbvFP4ly9YVtLLcNxmJSGpX0bNk8ITW65YcLhq
	WZTII7oq6/3BJl4hJZo9XazhHEk4ti40q8TMQrpQW4uYQmMy0z2t3Jl9IOH+VRlBVYw==
X-Gm-Gg: AYBFou1oXyxZjQfs04pkQDLrrwXbSqPYfpJjcRt3nlDHik1k6+/yurAPKxzCHO7te2V
	DZUU/BElMpNDiSMdVTHdz1N3DMRK5YnUL0Ymuav4I+p2IC55t3x4yb1ouZ4jnTnfOrkOjh9v9k2
	YI3CN3TuQ1c43I5iwGklPzKDoIfPgr9zvo2zLzejBf+LuI5RXQkw+PcXITidy734TKgQly1+6dq
	7QJYGGVpHAU0p1rW9dWaucIU9WhTqF8ojbiyJ7o8pHlxmEFKTOQ4nuwwuO5kX+8SK0MrDDIP3iK
	wZueIPl5aYJl3g3KiuiKIdMLcD7pRLZ7NIlz9DE8v3wpvyeAcj26VAB2xr/YnYUo937oyw==
X-Received: by 2002:a05:600c:a11c:b0:4a1:97c6:d2e8 with SMTP id 5b1f17b1804b1-4a197c6d902mr105451775e9.32.1791866543526;
        Mon, 12 Oct 2026 21:42:23 -0700 (PDT)
X-Received: by 2002:a05:600c:a11c:b0:4a1:97c6:d2e8 with SMTP id 5b1f17b1804b1-4a197c6d902mr105451435e9.32.1791866542907;
        Mon, 12 Oct 2026 21:42:22 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:3fd7:5300:3d6b:52a4:a23f:9d0b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a199e5db12sm225328815e9.2.2026.10.12.21.42.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 21:42:22 -0700 (PDT)
Date: Tue, 13 Oct 2026 00:42:19 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Sasha Levin <sashal@kernel.org>
Cc: workflows@vger.kernel.org, ksummit@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Mark Brown <broonie@kernel.org>, Theodore Ts'o <tytso@mit.edu>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Leon Romanovsky <leon@kernel.org>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	Thorsten Leemhuis <linux@leemhuis.info>
Subject: Re: [PATCH v2 2/5] agents: add a skill to determine Fixes tags
Message-ID: <20261013003535-mutt-send-email-mst@kernel.org>
References: <20261012213452.1863248-1-sashal@kernel.org>
 <20261012213452.1863248-3-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261012213452.1863248-3-sashal@kernel.org>

On Mon, Oct 12, 2026 at 05:34:49PM -0400, Sasha Levin wrote:
> Blame and existing Fixes tags can point to code movement instead of the
> change that introduced a bug. Add a read-only investigation procedure
> that traces historical behavior and checks candidate commits against
> their parents before returning a tag with supporting evidence.
> 
> Keep the skill entry point and procedure together under
> agents/skills/find-fixes/. Connect the procedure to the coding-assistant
> guidance so bug fixes get verified attribution before finalization.
> 
> If the origin cannot be established, return no trailer and keep the fix
> as a draft. Applying the tag and writing the commit message remain outside
> the skill.
> 
> Validated with controlled histories covering moved code, changed
> preconditions, incorrect tags, shallow history, and reintroduction after
> a revert, as well as a real kernel fix.
> 
> Assisted-by: LLM
> Signed-off-by: Sasha Levin <sashal@kernel.org>

Current documentation states:

	A Fixes: tag indicates that the patch fixes a bug in a previous commit. It
	is used to make it easy to determine where an issue originated, which can help
	review a bug fix. This tag also assists the stable kernel team in determining
	which stable kernel versions should receive your fix. This is the preferred
	method for indicating a bug fixed by the patch. See :ref:`describe_changes` 
	for more details.


the second part is easy to miss, so "what about an old bug in commit A
commit B exposes" and "what if the bug both in commit A and commit B"
are pretty common questions.




Worth answering, maybe, and maybe here: the implication of the "stable
kernel team" rule is that the meaning of the tag is actually: "if you
have commit A then you need this commit".



> ---
>  Documentation/process/coding-assistants.rst |  23 ++-
>  agents/skills/find-fixes/SKILL.md           |  23 +++
>  agents/skills/find-fixes/guide.rst          | 177 ++++++++++++++++++++
>  3 files changed, 220 insertions(+), 3 deletions(-)
>  create mode 100644 agents/skills/find-fixes/SKILL.md
>  create mode 100644 agents/skills/find-fixes/guide.rst
> 
> diff --git a/Documentation/process/coding-assistants.rst b/Documentation/process/coding-assistants.rst
> index 3288b32e993f5..8d42d3c10f9ce 100644
> --- a/Documentation/process/coding-assistants.rst
> +++ b/Documentation/process/coding-assistants.rst
> @@ -70,6 +70,21 @@ Example::
>  
>    Assisted-by: LLM coccinelle sparse
>  
> +Determining Fixes tags
> +======================
> +
> +Before finalizing a bug-fix patch or its commit message, an assistant must
> +follow agents/skills/find-fixes/guide.rst to determine and verify the
> +introducing commit. This also applies to fixes for externally reported
> +bugs and to checking an existing Fixes tag during review. The skill entry
> +point is agents/skills/find-fixes/SKILL.md.
> +
> +The skill returns an attribution result only. It does not modify files or
> +commit messages, and invoking it does not authorize creating or amending a
> +commit. If the origin remains unresolved, report the missing evidence and
> +keep the fix as a draft. The calling workflow must hold finalization until
> +the attribution is resolved.
> +
>  Procedure for finding and fixing bugs
>  =====================================
>  
> @@ -93,9 +108,11 @@ these steps:
>     re-running a complete analysis; drop any fix that doesn't work and try
>     another one. The fix must not add build warnings and must pass the
>     checkpatch.pl checks (see submitting-patches.rst).
> -6. Commit the working fix with a detailed message describing the problem, the
> -   solution and a Fixes tag. Do not add a Signed-off-by tag, and add an
> -   Assisted-by tag, as described above.
> +6. Determine the Fixes tag as described above. Once attribution is resolved,
> +   commit the working fix with a detailed message describing the problem,
> +   the solution and the verified Fixes tag. This commit is part of the
> +   fix-preparation workflow, not the attribution skill. Do not add a
> +   Signed-off-by tag, and add an Assisted-by tag, as described above.
>  7. Identify the maintainers and lists using scripts/get_maintainer.pl.
>     Documentation/process/security-bugs.rst shows how to do that.
>  8. Indicate what could not be done. If the fix could not be built or tested, or
> diff --git a/agents/skills/find-fixes/SKILL.md b/agents/skills/find-fixes/SKILL.md
> new file mode 100644
> index 0000000000000..14978976fdd46
> --- /dev/null
> +++ b/agents/skills/find-fixes/SKILL.md
> @@ -0,0 +1,23 @@
> +---
> +# SPDX-License-Identifier: GPL-2.0-only
> +name: find-fixes
> +description: >-
> +  Determine the bug-introducing commit and return a verified Fixes tag for
> +  a Linux kernel fix. Use when preparing or reviewing bug-fix patches,
> +  drafting their commit messages, or checking an existing Fixes tag.
> +---
> +
> +# Determine a Fixes tag
> +
> +Read and follow [the investigation procedure](guide.rst), relative to this
> +skill directory. The canonical path in the kernel repository is
> +`agents/skills/find-fixes/guide.rst`. If necessary, locate the
> +repository root with `git rev-parse --show-toplevel`.
> +
> +Perform attribution only. Return the tag and its supporting evidence, or
> +an unresolved result explaining the missing evidence. Return no other
> +trailers or commit-message draft as part of the skill. Do not change files,
> +the index, refs, or commit messages, and do not apply the tag or create a
> +commit. An unresolved result must contain no Fixes trailer or placeholder;
> +it tells the calling workflow to hold finalization. Applying a determined
> +tag belongs to that workflow.
> diff --git a/agents/skills/find-fixes/guide.rst b/agents/skills/find-fixes/guide.rst
> new file mode 100644
> index 0000000000000..7b58c526f3149
> --- /dev/null
> +++ b/agents/skills/find-fixes/guide.rst
> @@ -0,0 +1,177 @@
> +.. SPDX-License-Identifier: GPL-2.0-only
> +
> +.. _find_fixes:
> +
> +Finding the commit to name in a Fixes tag
> +=========================================
> +
> +A ``Fixes:`` tag identifies the commit that introduced the bug being fixed.
> +Finding that commit requires an explanation of the failure and evidence from
> +the history. The last commit touching a line, the oldest matching text, an
> +existing tag, and a reproducer's first failure are useful leads; none alone
> +establishes the answer.
> +
> +This procedure applies to bug fixes, including fixes for externally reported
> +issues and reviews of proposed Fixes tags. It determines a tag using read-only
> +inspection. It does not authorize changing files, applying patches, checking
> +out revisions, fetching history, or creating or amending commits. Any additional
> +testing or changes require the authority of the surrounding task.
> +
> +Establish the issue and the history
> +-----------------------------------
> +
> +Record the issue, the proposed fix, and the version being fixed:
> +
> +* For a commit, resolve its full object ID and inspect its message, diff, and
> +  parents. For an ordinary commit, its parent is the pre-fix base. For a merge,
> +  identify which parent or combined state the fix addresses.
> +* For a patch, identify its base revision. For uncommitted changes, distinguish
> +  the staged and unstaged changes and record the base commit. Do not include
> +  unrelated work in the analysis. Note relevant untracked files separately.
> +* Explain the exact failure: the operation, inputs or interleaving, affected
> +  configuration, and invariant that is violated. Identify the functions and
> +  callers needed to explain it, not just the lines changed by the fix.
> +
> +Resolve revisions against the repository being inspected. For example, with
> +``fix`` set to the supplied revision::
> +
> +    git rev-parse --show-toplevel
> +    git rev-parse --verify --end-of-options "$fix^{commit}"
> +    git show --no-patch --format=fuller "$fix"
> +    git rev-list --parents -n 1 "$fix"
> +    git show --format= --find-renames "$fix"
> +
> +Use ``git diff --cached`` and ``git diff`` to inspect staged and unstaged work.
> +Read the surrounding code at the pre-fix base with ``git show <base>:<path>``.
> +Do not assume the current checkout contains the historical implementation.
> +
> +If the base or failure mechanism cannot be established, report what is missing
> +before selecting an introducer. A broad description such as "a race" is not
> +enough to distinguish different bugs in the same function.
> +
> +Trace candidate introductions
> +-----------------------------
> +
> +Start with the operations responsible for the failure. Inspect their history
> +and the history of relevant callers, contracts, guards, and data structures.
> +Treat any supplied Fixes tag, blame result, or bisection result as a candidate
> +to investigate, rather than as the conclusion.
> +
> +Useful read-only searches include the following. Here ``base``, ``path``,
> +``old_path``, ``new_path``, and ``candidate`` refer to identified revisions or
> +paths; replace the example line range and expressions with relevant ones::
> +
> +    git blame -M -C -L 100,140 "$base" -- "$path"
> +    git log --follow -p "$base" -- "$path"
> +    git log -p -S 'relevant expression' "$base" -- "$old_path" "$new_path"
> +    git log -p -G 'relevant.*pattern' "$base" -- "$old_path" "$new_path"
> +    git show --find-renames "$candidate" -- "$old_path" "$new_path"
> +    git rev-list --parents -n 1 "$candidate"
> +
> +Blame and pickaxe narrow the search; they do not prove causality. ``-S`` finds
> +changes in occurrence counts, while ``-G`` finds matching changed lines. Follow
> +renames, copies, splits, and equivalent older implementations explicitly when
> +a search stops at code movement. Inspect complete candidate changes and their
> +context, including relevant files outside the fix's diff.
> +
> +Search all relevant ancestry, not just first-parent history. Choose history
> +endpoints from the actual base and repository refs; do not assume a remote
> +named ``origin`` or a branch named ``master``. When examining history outside
> +the base's ancestry, explain how it relates to the affected tree.
> +
> +Prove the causal transition
> +---------------------------
> +
> +For each plausible candidate, compare its relevant parent state with the state
> +after the commit. Explain the invariant before and after the change, why the
> +candidate introduces the defect, and how the proposed fix addresses that same
> +defect. Inspect the earlier implementation even if the function or filename
> +did not yet exist under its current name.
> +
> +Distinguish three events:
> +
> +* Introduction of the code or pattern. This is provenance, and may predate any
> +  defect in it.
> +* Introduction of the semantic defect. This is the change that makes the
> +  implementation violate the applicable contract or invariant.
> +* A later trigger, newly reachable path, or change that makes the failure easier
> +  to observe. This may expose an existing defect, or may itself introduce the
> +  defect by changing the contract or execution context.
> +
> +Do not select a rename or refactor if it merely carries an existing defect.
> +Conversely, do not blame old code that was correct under the earlier contract.
> +When a later change exposes a latent defect, identify both commits and explain
> +why the older implementation was already defective. The location of the fix
> +does not prove that the oldest version of the modified code was wrong. If the
> +distinction cannot be justified, keep the result unresolved.
> +
> +A reproducer that fails after the candidate and succeeds before it provides
> +useful evidence when both tests exercise equivalent conditions. Build failures,
> +missing features, unsupported configurations, and changes to the test itself
> +are not evidence of a good parent. A bisection may locate an activation change
> +rather than the semantic origin. Historical source analysis is acceptable when
> +it establishes the transition; describe its reasoning and limits without
> +claiming tests were run.
> +
> +Handle discontinuities in history
> +---------------------------------
> +
> +* **Merges:** inspect each relevant parent. A bad merge resolution or the
> +  interaction of two branches can introduce a defect absent from either parent;
> +  do not assume that the first parent alone explains the transition.
> +* **Reverts and reintroductions:** trace whether the defect was removed and
> +  subsequently restored. Establish the introduction relevant to the affected
> +  lineage instead of automatically choosing the earliest occurrence.
> +* **Backports:** distinguish the upstream commit from its downstream copy and
> +  inspect any adaptation. For an upstream defect, identify the upstream origin
> +  and document its relationship to the affected branch. If the defect exists
> +  only because of a backport adaptation, identify that downstream introduction.
> +  An upstream SHA need not be an ancestor of a downstream base; verify the
> +  correspondence from the changes rather than ancestry or subjects alone.
> +* **Multiple causes:** keep independent bugs separate. If a single fix repairs
> +  distinct introductions, justify each separately before proposing multiple
> +  tags. Do not list competing guesses as multiple Fixes tags.
> +* **Incomplete history:** check ``git rev-parse --is-shallow-repository`` and
> +  whether the required commits and historical blobs are available. A shallow
> +  boundary, missing object, or initial import is not proof of introduction.
> +  If the defect predates available history, including pre-Git history, report
> +  that limit rather than assigning the first available commit by default.
> +
> +Existing tags and external reports can suggest candidates, but inspect the
> +actual historical changes. Reject alternatives with a concrete reason, such
> +as unchanged behavior across a file split or a caller that could not supply
> +the problematic input under the earlier contract.
> +
> +Return a conclusion supported by evidence
> +-----------------------------------------
> +
> +Return the attribution result to the caller. Drafting a commit message or
> +adding other trailers is outside this procedure.
> +
> +For a determined result, provide:
> +
> +* The issue and fix/base revisions analyzed.
> +* The full introducing commit ID and an explanation of the parent-to-candidate
> +  transition, citing the relevant historical code or test results.
> +* Any distinct activation commit, material rejected candidates, and limitations
> +  such as tests not run or history not available.
> +* The proposed Fixes tag, rendered from the verified commit's Git metadata.
> +
> +For example, after resolving ``candidate`` to the selected full commit ID::
> +
> +    git rev-parse --verify --end-of-options "$candidate^{commit}"
> +    git show --no-patch --abbrev=12 --format='Fixes: %h ("%s")' "$candidate"
> +
> +Git extends the abbreviation if necessary to make it unique in the available
> +repository. Preserve the exact subject and keep the tag on one line, as
> +described in Documentation/process/submitting-patches.rst. Formatting checks
> +such as ``scripts/checkpatch.pl`` do not validate the causal conclusion.
> +
> +For an unresolved result, provide the candidates, evidence, missing information,
> +and the next investigation that could distinguish them. Do not emit a Fixes
> +trailer or placeholder. The calling bug-fix workflow must hold finalization
> +and surface the unresolved origin instead of fabricating a tag or silently
> +treating the investigation as complete.
> +
> +Determining a Fixes tag does not establish stable eligibility or replace the
> +requirements in Documentation/process/stable-kernel-rules.rst.
> -- 
> 2.53.0

