Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82862456E1E
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 11:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788434801; cv=none; b=ZARHLrHmTKxn0cQ2sXpv9ORm5kfsvXaRArthreQ54uow6VWFWJWfEVhEdBbsjPOGGElE2xAAen9krwzJHQslBKTm7uDTuwKM3El6F52WvY+tfECWRULWJk64QmbWK0WwdFpluEOMknZL1gkclDtclkPARzrejMIY2b5aZ5Io/d4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788434801; c=relaxed/simple;
	bh=5ns20G46yDgPBY7CH66qmLcNuiaZJQmrIm2n95ZscWI=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=pCnCYT+p3UeQ/8oQDxyMzWQlnxzIXfCzR4ZVS/t+XFJ0Ha38YTfoaYvetWLD7Kp4WVrLks/L7fjNw5QGzexKgcuILBbfQnIiMi2ZhEcGIanpGZybgi8vyVU0zko4ceIh9NVouxZWi64pkwVDSkz6r3gcVdhzp+U2Ml29BbyahA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=L2N0EeIY; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=COOcbrii; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="L2N0EeIY";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="COOcbrii"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1788434773; bh=aM69eWvXf0pk8FFzXR6VeRD
	/taqS38wshkXyedGu8FM=; b=L2N0EeIY3aQ/LhHjBrhYMrAqp5pZbgx9SSNCmtJbQla0/1bh1u
	sMnSaryx50WpaxxYwX/2NSs6ifycqsSXQMyxvZzzow1V1ktsarIBUsC3lV4ADkAR8rqCvQ+Mdrr
	cU5OwpdICmmWAaMnkQTIzMgSAYBVsNkljdA8PojrynhPURbx3KRnD9TxHodsntqxk92sJbDX+F+
	qB+UiENeLP8us6ROZSeMTQcvv8Mf0Iqfw40tDi60Cza2pZAms5uKv/kHWft0kssWEyZHX1dOntB
	zz3djdszNVZ6keN8Ncy+oLi7LhQC7o24YuTqxAxPzeKsOIWc8Rz4Ma+C9at9zPr4BaQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1788434773; bh=aM69eWvXf0pk8FFzXR6VeRD
	/taqS38wshkXyedGu8FM=; b=COOcbriixYqkLvy9qMUEsYtjYcCqeCnvbnOBJaC0Qv+44/BCMr
	sH6sOB2+EM9byMGoR7YUNbAd+ySV6zvEvqCA==;
Date: Thu, 03 Sep 2026 12:26:11 +0100
From: Bradley Morgan <brads@mainlining.org>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>
CC: Catalin Marinas <catalin.marinas@arm.com>, James Morse <james.morse@arm.com>,
 Marc Zyngier <maz@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] arm64: hibernate: dust off the suspend/cleanup rework
In-Reply-To: <aplRx8f5NprO9dSU@willie-the-truck>
References: <20260825205839.14571-1-brads@mainlining.org> <apgpnjnJ4suhHh-v@J2N7QTR9R3.cambridge.arm.com> <B23E199A-2D3D-48B4-A7E9-9664371A7361@mainlining.org> <apgsm92KtXA7xh6H@J2N7QTR9R3.cambridge.arm.com> <aplRx8f5NprO9dSU@willie-the-truck>
Message-ID: <CA3C4FFB-FEAE-4537-B0DE-DEBB06D053FE@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On 3 September 2026 11:53:59 BST, Will Deacon <will@kernel.org> wrote:
>On Wed, Sep 02, 2026 at 03:03:07PM +0100, Mark Rutland wrote:
>> On Wed, Sep 02, 2026 at 02:51:22PM +0100, Bradley Morgan wrote:
>> > On 2 September 2026 14:50:22 BST, Mark Rutland <mark.rutland@arm.com>
>> > wrote:
>> > >On Tue, Aug 25, 2026 at 08:58:32PM +0000, Bradley Morgan wrote:
>> > >> This comes out of the hibernate resume discussion where Will asked
>if
>> > >> the restored kernel's hyp vectors are reinstalled before we come
>back
>> > >> from swsusp_arch_suspend() and free the reserved pages. Rather than
>> > >> answer with a one off fix, this series reworks resume to look like
>a
>> > >> resume from idle, which makes the answer fall out on its own.
>> > >> 
>> > >> The series leans on Mark Rutland's old work for inspiration, he had
>the
>> > >> same end goal in a branch from back then:
>> > >> 
>> > >>  
>> >
>>https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git/log/?h=arm64/suspend/cleanup
>> > >
>> > >Most of the series seems to be a rebased of those patches, just with
>> > >paraphrased commit messages and my S-o-B lines dropped. As commented
>on
>> > >patch 4, I do not think that is appropriate.
>> > 
>> > Same question as patch 2
>> > 
>> > If you want your S-O-B added, ok fine, but yeah.
>> 
>> As on patch 2, please read the documentation before continuing futher.
>> 
>> > Do you think this series itself is good? 
>> 
>> No. At present I think it's in a worse state than it was in my branch,
>> because portions have changed, with no rationale and no clear benefit.
>> 
>> Hence my ask to Catalin and Will to NOT pick this up for now.
>
>I wasn't going to pick them up with the incorrect authorship, but it's
>worth noting that Bradley's patch _does_ fix one of the hibernation
>problems and has been tested by Vladimir:
>
>https://lore.kernel.org/all/20260809213615.11646-1-include@grrlz.net/
>
>I would prefer to take your complete set of patches, but if you don't
>want that then should I just take the above for now? Prior to this
>series, there has been no activity for nearly two years on your branch,
>so I'd prefer to get _something_ in, even if it only fixes some of the
>problems.
>

So your taking the bugfix? I'll do V2 later, you'd need to review my sleep
patch tho. 

>Will

--- Thanks!
https://lore.kernel.org/all/EE579805-42F2-4C58-B752-F28779EEB717@grrlz.net/
