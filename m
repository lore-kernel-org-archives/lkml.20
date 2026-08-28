Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 859C43D0BE4
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 11:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787916711; cv=none; b=LUct96Pbf9dQoVkK945wy0y5TFrH17bf3XTdQNqFbEfpz4TcxMgN9oAa1+LCHEcTdEi1GAkoPa9IimGCQmULzumw27+pb88oztwn49xze0QkmsSQLUbxWzuVar6SH7CNP7FetwJnkH0LTX5+O6pBA7VDtzJleVLtcHuQrtb1YqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787916711; c=relaxed/simple;
	bh=q59W0IMnGe6dIIXJ7uN8WhP/SPji5OZbpNsdNJVZnkU=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=cQgH9KFj2zJN39s9ZMoMV2tDkXQb7yG7j2hMyzBeq//zXyNVzWC5u/14olEd10n0kEau7bI1DaUhPJavmZGOt7w+3l6bWsY1Wu4U5EIP1Js8AQmq3dN1htNS6KBYXKAUYQB34qYUoWLulL+K+yn+FUpAwJcP7saiDYUjds2aLyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=f0VFEEQ+; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=ECZP0S2J; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="f0VFEEQ+";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="ECZP0S2J"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1787916685; bh=q59W0IMnGe6dIIXJ7uN8WhP
	/SPji5OZbpNsdNJVZnkU=; b=f0VFEEQ+HGqNnmleXvSdvGShcNmhZqTqHYU6Gzlkot7pZxLMF+
	UWJCrywICoyKInBIoGocz06gYdD/06EppW8BVhYb0MC4jFWvWjGzNqdjjC9ddQ0IX1+NB4+BW+g
	vGNdO4oUQoxZD5m/2jh48JjvLB4SuoRiPy1ISyvJ7VogkpRlUe/nbYCHs4/wZa4BPLEi7PVAjgo
	6vqquKLxa/MfmhyIRk09hhnOsWh2K13FZtRAw0s4fATYtq0/L0FCe4NqXqLy3VebbvNkv5cxjX8
	t8XyofqRbHc883e7ib+Lxg5PyV9JgbXnrb4Edi0iMA5eAyb4j2tvDbh9ljKHUT1/ftg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1787916685; bh=q59W0IMnGe6dIIXJ7uN8WhP
	/SPji5OZbpNsdNJVZnkU=; b=ECZP0S2J9zOx+AoVEeUpPXgMDx1nXuUB+2YpYS2gzdDfTXsBVn
	EozhO4PUTKJCgScKf4wQDJRW4I1maaHDh0Bw==;
Date: Fri, 28 Aug 2026 12:31:26 +0100
From: Bradley Morgan <brads@mainlining.org>
To: Ard Biesheuvel <ardb@kernel.org>, Will Deacon <will@kernel.org>
CC: Catalin Marinas <catalin.marinas@arm.com>,
 Mark Rutland <mark.rutland@arm.com>, James Morse <james.morse@arm.com>,
 Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] arm64: hibernate: dust off the suspend/cleanup rework
In-Reply-To: <4cc971de-2fc9-496a-a5f5-002bd6b6bd43@app.fastmail.com>
References: <20260825205839.14571-1-brads@mainlining.org> <4cc971de-2fc9-496a-a5f5-002bd6b6bd43@app.fastmail.com>
Message-ID: <42165318-B65A-4BD4-ADE0-1DBD7F82416B@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On 28 August 2026 11:32:27 BST, Ard Biesheuvel <ardb@kernel.org> wrote:
>Hi Bradley,
>

Ard!

>On Tue, 25 Aug 2026, at 22:58, Bradley Morgan wrote:
>> Everything object compiles and passes checkpatch and sparse. I could not
>> boot or run a hibernate cycle on real hardware here, so that still wants
>> doing before anyone gets excited.
>>
>
>You can easily test hibernate under QEMU/mach-virt: just create a file on
>the host, mkswap it and pass it to the VM as a virtio drive (e.g.,
>/dev/vda)
>You can then swapon it in the VM and do 'echo disk >/sys/power/state',
>which
>will perform the hibernate and exit QEMU. If you then restart it with
>'resume=/dev/vda' on the command line, it will perform the resume from
>hibernate at boot.
>

Ack. Tried on PKVM last night.

>I've had a go with your series on a NV capable system (Mac Mini M2).
>Without
>the series applied, I can hibernate and resume 4 vCPUs without issue, so
>it
>is not entirely clear to me what your series intends to fix.
>
>With the series applied resume from hibernate still works - I did see one
>intermittent failure where the secondaries failed to come up, but I only
>saw it once and so I cannot say for certain whether your series triggered
>it or not.
>
>Tested-by: Ard Biesheuvel <ardb@kernel.org>
>

For the whole series?

>
>
>
>
>
>
>

--- Thanks!
https://lore.kernel.org/all/EE579805-42F2-4C58-B752-F28779EEB717@grrlz.net/
