Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D33774A3F08
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 15:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788363231; cv=none; b=NA3N11h3xNpa/LHMjKCfdYDRwU65sKXgsCBpaphgKEfUOHvHTyqvzm14lhA1P6qp3btPSBlYOwGC5HSDhkc6YlayI21huX1tI6KCmO5x2q0g8PzB8CnMH7uVpDfqo7kDWaCKsWPzPowKJmp7oLz0BTMMyXVdym5hrGaRjhy/ezc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788363231; c=relaxed/simple;
	bh=T7pKUyl3z5BxSHBlyGhVtjmftGpVYY18S1WKzqyaReE=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=Eb2i2IfKfvbtIuIGv07DxIrLyTJcv64B0K8BaO1nSAY27HDObhSE9hhsW2a/41xLrvMrsRgGRjgnxw7JAuSWTC3ue0El4YEUKxNX+9UYEY/OxLyZ3lyndIMEmHX+asGrkZDbmRFNWeQpGxzmcsmNraICCYGENyQ4o5JF8GGlWS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=rbKPC77v; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=UDczQYde; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="rbKPC77v";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="UDczQYde"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1788363226; bh=xWRL/71/13sRML0I9ovZkoT
	ukFA4K4ZgczCX4kTAUHM=; b=rbKPC77vUfF7kgqDP0bQ14Yyc50qS9IY5FDi29X2YtCxerVmb6
	OhszGvV0m1cDuCQiQEy7lbLxI3P30Rz3eJVlcr7oKMyM3LHLZfpfhu5kS7w3NqX8Q5n+zAyomZ2
	evENZxMjHV8FfHIZyuxdP7ZJng70CSqDzQYPcyjpeddoWBqmCy9lf/tZCps8rcg7wGLEDpGfGZf
	HOc9CD+tvsN++LZIPapo0gyuiBBWY7FSQww1XvfwH4L+iVdYc5olR5pMGSgu6Vx0xRwsnYNHFbv
	6k+Me0xHxc/L7okxSzNGuuHmJwOU9cpz7EnUw0tE03gEhekJ57LHTz0n1oj6KbdUvfQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1788363226; bh=xWRL/71/13sRML0I9ovZkoT
	ukFA4K4ZgczCX4kTAUHM=; b=UDczQYdejHqmtWnBE38qWpkfPEAkkly+/2hD+zOq3V96lQIWjO
	IkFb8gcLMvw4tVmhB8trHom/X4gqyJhOEQDA==;
Date: Wed, 02 Sep 2026 16:33:43 +0100
From: Bradley Morgan <brads@mainlining.org>
To: Fuad Tabba <fuad.tabba@linux.dev>
CC: xry111@xry111.site, ben.horgan@arm.com, catalin.marinas@arm.com,
 james.morse@arm.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, maz@kernel.org, will@kernel.org
Subject: =?US-ASCII?Q?Re=3A_arm64=3A_MPAM2=5FEL2_and_MPAMHCR=5FEL2?=
 =?US-ASCII?Q?_are_left_UNKNOWN_under_arm64=2Enompam?=
In-Reply-To: <CA+EHjTxrJB_3ks_rqGAFyihyFwKJEEJYk2ZTMLLXgoMWM+GO_w@mail.gmail.com>
References: <2368f72ea9a447057456eb37450e1c25f4bdddff.camel@xry111.site> <452D9DEB-606C-4B54-B8B6-27E03573A9DE@mainlining.org> <CA+EHjTxrJB_3ks_rqGAFyihyFwKJEEJYk2ZTMLLXgoMWM+GO_w@mail.gmail.com>
Message-ID: <22876BF5-AAA3-4ABE-9BD0-E4D3D97B123D@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On 2 September 2026 16:31:02 BST, Fuad Tabba <fuad.tabba@linux.dev> wrote:
>On Wed, 2 Sept 2026 at 16:29, Bradley Morgan <brads@mainlining.org> wrote:
>>
>> On 2 September 2026 16:26:55 BST, Xi Ruoyao <xry111@xry111.site> wrote:
>> >On Thu, 2026-08-27 at 09:41 +0100, Ben Horgan wrote:
>> >> > not, could the caveat go the other way round: arm64.nompam is for
>> >> > systems where firmware ignores MPAM, and should only be set on a
>> >> > machine that does not boot without it?
>> >>
>> >> Yes, seems fine.
>> >
>> >Sorry for the late reply.  This is indeed the original purpose for
>> >arm64.nompam, a dirty hack when we have no other ways to make the
>system
>> >boot.  If you think it causes an inconsistent state I'd not complain
>> >against adding a loud warning or something.
>>
>> Sorry to impede in the discussion, would you like me to submit a patch
>for
>> that?
>
>No, thanks. It's written already in the form Ben suggested. Will send it
>soon.
>
>/fuad
>
>>
>> >
>> >
>>
>> --- Thanks!
>>
>https://lore.kernel.org/all/EE579805-42F2-4C58-B752-F28779EEB717@grrlz.net/
Ok, could you cc me in it?
--- Thanks!
https://lore.kernel.org/all/EE579805-42F2-4C58-B752-F28779EEB717@grrlz.net/
