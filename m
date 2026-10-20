Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=5.75.144.95
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792522483;
	b=jzj+mIj/I789T6bqjwB1JmBS+UcOXpniq0kq+EZCzzXkmRzBG1/bmE/E34jpDdfYNZDe
	 L4C0/DxbB6UOxfXHr9LPIzhIRYGEUO0T9hiC0scIJz+TxxWXA2+Pdnot4Wzd31JNRdptk
	 PkJreuwy/lMqyxe0KZq96SlS8XDFYdgGVA+83BCiPnf+FJBcb9Y28XMxYTM3CHd3xnqb3
	 rxORpr/qBRXyqMgbo+J1Piwk5EGfht8wZFwf8LH6IXS3yXexABTGroIUTSh12YJ1kWQLV
	 kfeVjsxRAf/ehKwqlOZW9rcSGxaYs0neYqWthOUEtI6Ne0PReYzrJpiy1QGhTVYWjMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792522483;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:Date:From:To:CC:Subject:
	 In-Reply-To:References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=Gv37jKTovYwPpi+mAZX6EXS4G9Iivo86YVUQKN9nrMg=;
	b=1IIAdXn22fijHAdFy9O+1oo14BS838ifDI//UHNtCGTwaUEMmTEELWdFi2qjLUEIbSSF
	 2E+UDPrQGvablox0vh/wYl7uJRZujm46do3be0OkGwCaRh0ketqhllwOrnZt3q4FJ0OOC
	 xCq3W5R9QisJLka8Yq0+zEoC17L++/gId+LGuusF0Yfc1WapMurJx9IYiTBsM+2VxPpeQ
	 XKMr3vQzkusjoIpLT7aB94Y6Etxg1TDqUzPAL+22tBBfb+2kpK2sk/5jdfPNWu8OZh/ny
	 HS9ui29js8ZnegT122nXsvR4gx+v05gpGrNEfuH2e4r1rCnNxui0/2wR5e4dbFvNkeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mainlining.org;
	spf=pass smtp.mailfrom=mainlining.org;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=rsa-sha256 header.s=202507r header.b=io6yBBsk;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=ed25519-sha256 header.s=202507e header.b=chzPD2Bt;
	arc=none smtp.remote-ip=5.75.144.95
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 088BA606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 18:54:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 088BA606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mainlining.org header.i=@mainlining.org header.a=rsa-sha256 header.s=202507r header.b=io6yBBsk;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=ed25519-sha256 header.s=202507e header.b=chzPD2Bt
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1792522479; bh=Gv37jKTovYwPpi+mAZX6EXS
	4G9Iivo86YVUQKN9nrMg=; b=io6yBBskYojib9aiBYbzQ2EA0zx/VihK1rPVonGnD0ag4CTGgT
	IU8LEmzzxeYPzHJvkPRCVdo1QncdjelCAEtCyydaTqTkjiEEKXV5SR6K68Z0OPAnq0Q64dc9EgD
	tU6Q12DuLUp0L2cOYZmFmqNOT190KxZ7j5nbgZWwbsB5zBI2+azcaiwyERlYrjl9mFriP/RP19u
	n5JXcjsWUgi4FEnyaZgWwxXha0xOmblW04GICyEVdzkzNi0CYrv477YiTW8VI21Kz4vWLgdSlnd
	2GlPWJCjfssMoEDMF4nH1TV73/PdVYZUsMbaePXVsvfYGgrTTzslcyJV5ujXza4cqDQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1792522479; bh=Gv37jKTovYwPpi+mAZX6EXS
	4G9Iivo86YVUQKN9nrMg=; b=chzPD2BtHJNgjIrGMseWc4pW6nXJH19ekUD8QHLnRp1cdoCTjn
	Vdy53VjgTvKSLXqb4cpnsFyj2ZQiMQAH/xAg==;
Date: Tue, 20 Oct 2026 19:54:38 +0100
From: Bradley Morgan <brads@mainlining.org>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, paulmck@kernel.org,
 torvalds@linux-foundation.org
CC: linux-kernel@vger.kernel.org, kernel-team@meta.com,
 Arnd Bergmann <arnd@kernel.org>
Subject: Re: [GIT PULL] Add two-byte cmpxchg emulation function for v7.4
In-Reply-To: <2f65337241e230cd26c130bc3183ad230c7c40e4.camel@physik.fu-berlin.de>
References: <fca9b4b9-75e1-4837-9c73-6f28cb8237e0@paulmck-laptop> <2f65337241e230cd26c130bc3183ad230c7c40e4.camel@physik.fu-berlin.de>
Message-ID: <62138DD6-F054-4992-810C-EDE92C835346@mainlining.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On 20 October 2026 19:48:32 BST, John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:
>Hi Paul,
>
>On Fri, 2026-10-16 at 20:51 -0700, Paul E. McKenney wrote:
>> However, it sadly does not permit easy implementation of all algorithms
>> needing on two-byte atomic operations because there are some systems
>still
>> supported by Linux that do not have native two-byte store instructions.
>> There is reason to believe that these systems will soon no longer be
>> supported by Linux.
>
>Since this paragraph has produced a headline today [1], would you mind
>clarifying what you meant here? What architectures are you talking about?
>
>Thanks,
>Adrian
>
>> [1] https://www.phoronix.com/news/Linux-7.4-Two-Byte-CMPXCHG

Annoyingly my name isn't on there :(

But I'm happy it IS a headline :)

>
>

--- Thanks!
https://lore.kernel.org/all/EE579805-42F2-4C58-B752-F28779EEB717@grrlz.net/
