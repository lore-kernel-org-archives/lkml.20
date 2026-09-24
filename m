Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 745E349CF47;
	Thu, 24 Sep 2026 15:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790262498; cv=none; b=itmyu0tBZpl3X3LkcoLjYuyaM2b2V089vUacO8v0ru0lMW8+Z16ghUmS45mljYvtiLQzPKtKryVqpS53SgzlDdQLu48iAsYvekfhtu/RExJAs/1x6YQJlK2PAIXZgDtovPhog+mnQhYRhsFLuVza92ND1q27mGBHqbwznMiDRhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790262498; c=relaxed/simple;
	bh=zrH2QxJzGs0wIjek2Pxs3AQjf58gRQZjiiMfulyuJuk=;
	h=Date:From:To:CC:Subject:In-Reply-To:Message-ID:MIME-Version:
	 Content-Type; b=HFS3wHfgRngjAoKiOpaHqeP4GDOW3h2CrBgd64xv0J1muBrxAKQtGemfqtwufLmbx9m65L4rlI060Fy4lmdnOHpPE0zAtG7z2ylKYZxtMPYeDIKjhqRYr5MjD5u9pwFa5gK/nkQk1IfJVhyu+4DjmmknkSDq8CgZ9ffBrzzWOHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=I+BOOndh; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=bOaOdTdT; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="I+BOOndh";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="bOaOdTdT"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1790262486; bh=zrH2QxJzGs0wIjek2Pxs3AQ
	jf58gRQZjiiMfulyuJuk=; b=I+BOOndhXAR4g3ZktxbD+mj4EELzjG6nvfttcnDjLmK2XnenOv
	fNDEt9yIrFP36PE+pajcVQeQYl1teDdJXAt4NbdP5ddu3xXIXRjl/6iSFmI9QuxkqTjN6mjvof7
	rzwSSTUaocuIPu5mZs/jy61uk3B/4g724eRm2JZA4yYTWmvma29bQMoChjlyM8x1A+k/dG0CBgn
	80CxHddM0j3wH9e880XQeqyLtw12rzStW28VYgljrw58K9hU2KJhV7ugY0i+9aWSXwmNfW16rst
	6UoqWW2JwZm7RtCaNSHIEnffxws3nC5/uIr/fjFOghqhlUthF+Ik65stvrNzRg3woAw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1790262486; bh=zrH2QxJzGs0wIjek2Pxs3AQ
	jf58gRQZjiiMfulyuJuk=; b=bOaOdTdTjy+9mtVuQ8cHxzC5clqEENlugyLR7vruyTTYTxOcc4
	19FmEI1KxyqtKer/V4r6wiYhgyD+EmXC1iAA==;
Date: Thu, 24 Sep 2026 16:08:08 +0100
From: Bradley Morgan <brads@mainlining.org>
To: sashal@kernel.org
CC: corbet@lwn.net, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 rdunlap@infradead.org, skhan@linuxfoundation.org, workflows@vger.kernel.org
Subject: Re: [PATCH] docs: add AGENTS.md as a symlink to README
In-Reply-To: <20260924134945.3095661-1-sashal@kernel.org>
Message-ID: <C1ABA2A9-E1BD-4A89-B5BC-59C06D807D0D@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On 24 September 2026 14:49:45 BST, Sasha Levin <sashal@kernel.org> wrote:
>Most coding agents have standardized on AGENTS.md as the file they load
>automatically from the root of a repository. README already tells AI
>tools to read and follow Documentation/process/coding-assistants.rst,
>but that only helps if the agent decides to read README before acting,
>which in practice it often doesn't.
>
>Add a top-level AGENTS.md symlink to README, so agents load it on their
>own and follow its pointer to the AI guidelines. This keeps a single
>entry point for every reader, and avoids adding a separate copy of the
>policy that could drift from the RST.
>
>As an example, two different agents were asked to "create a new commit
>renaming the release (in the Makefile) to AI Test".
>
>Without AGENTS.md, the first agent added a Signed-off-by for the user on
>its own. It should never have done that: only the human submitter can
>certify the Developer Certificate of Origin, after reviewing the change.
>It also used its own attribution tag instead of Assisted-by:
>
>> Makefile: rename release to AI Test
>>
>> Co-Authored-By: <model name> <noreply@...>
>> Signed-off-by: Sasha Levin <sashal@kernel.org>
>
>The second agent added no attribution at all:
>
>> Rename release to AI Test
>
>With AGENTS.md in place, neither agent added a Signed-off-by, and both
>used the Assisted-by tag. README itself mentions neither tag, so both
>agents followed its pointer to coding-assistants.rst:
>
>> Makefile: rename release to "AI Test"
>>
>> Change the release name from "Baby Opossum Posse" to "AI Test".
>>
>> Assisted-by: LLM
>
>> Makefile: rename release to AI Test
>>
>> Assisted-by: LLM
>
>Both agents also followed the kernel's general guidelines more closely.
>The second agent's subject gained the "subsystem: summary phrase" form
>that submitting-patches.rst asks for, instead of a bare "Rename release
>to AI Test", and the first agent added a body describing the change.
>
>Assisted-by: LLM
>Signed-off-by: Sasha Levin <sashal@kernel.org>

NAK, we could add to memories that to read soandso file before every
patch, and then it wouldn't increase tokens then?

>---
> AGENTS.md | 1 +
> 1 file changed, 1 insertion(+)
> create mode 120000 AGENTS.md
>
>diff --git a/AGENTS.md b/AGENTS.md
>new file mode 120000
>index 0000000000000..100b93820ade4
>--- /dev/null
>+++ b/AGENTS.md
>@@ -0,0 +1 @@
>+README
>\ No newline at end of file
>

--- Thanks!
"I'm not a very positive person" - Linus torvalds
