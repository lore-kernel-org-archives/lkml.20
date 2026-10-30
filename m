Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.216.248.207
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793359816;
	b=PFs0GO1gLA+3yZBMFscpUeu6ZBzZ0d5zi6JdGxeGX9uocYUQSLH3rCWQPBPCt5nCMX9g
	 qPYJQmXR5rKqO52Vu9rFYyvGDO/IgrYJ2A0mmBQInQgO1l1iQXUM8gqICArToITixmzFQ
	 PVBNmBfdPLiL7uPMXdqHKTdCtPyyTv0RYsBK/iZem5sk6TlmP2nSNt2+F8S/3pV3z4s3i
	 BUuA2CLrgS8f0Cj+ifBPUSZ42xV4vJU56qjTSMQSCR8WJ/zJucJKNUcAynBJNJZomfunh
	 5TK0c1sKLEwX4bEfVNLzR7EsgxZjxMGV7UoFV8aZK2LqgA7cdqQQFhgKcxkTGm1k4Xg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793359816;
	h=DMARC-Filter:Date:X-Lima-ML-UUID:DKIM-Signature:From:To:Cc:Subject:
	 Message-ID:In-Reply-To:References:Organization:X-Mailer:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=P9F0Hx3zzFPEhRZXhwMxkkF3mMj+Be93AHgQNYo3wK8=;
	b=HEs7/6eMJjrIgElTwcoeYKbK8phZhjz2j2tLJBs8N3KnGbq13dOkM6DJdA40gKqZIiFL
	 +ITpoHRW4b1Pq8zcJgmKq2jwInY+rGBrdv4JJimbjn4ifaBVg8GRnAgKvlb6JnjwLl14T
	 5S8OQLwFWQ655nuY58UIlCdK1WgUVs5NHgBxj9aAtv4rNuRIo1hhXoSKrdHyNIjecRVQY
	 /AaUoq6R9qIYyHDBhMOYpiq3slmItcDkq5g9K89BVXP3zZXs/VvRmSMCf1eTt6CLSf4mz
	 XEObSIhHwytkzrFzlqAQ9WVvzLHPq2G9sYXhA/3WxWBt3P+TeOTk/DWN5kyX2wwU9eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=deq.rocks;
	spf=none smtp.mailfrom=deq.rocks;
	dkim=pass header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=VoQ8JOOM;
	arc=none smtp.remote-ip=91.216.248.207
Received: from mx5.mail-out.lima-city.de (mx5.mail-out.lima-city.de [91.216.248.207])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 163B3606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 11:30:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 163B3606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=deq.rocks
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=deq.rocks
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=VoQ8JOOM
Date: Fri, 30 Oct 2026 12:30:00 +0100
X-Lima-ML-UUID: cb4c68a3-c4df-444f-b29d-b3be3ecdeeb1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=deq.rocks;
	s=securedbylima-20251205; t=1793359805;
	bh=P9F0Hx3zzFPEhRZXhwMxkkF3mMj+Be93AHgQNYo3wK8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=VoQ8JOOMH4GClI4YH5Jdrqd80ih1F+smHYE6S/wn3HdO5dGjaS6fFjukwafT9J1/I
	 2XBTymfc6kbY421FW0B6zykjikZmi585nL2hLz5jbIHyk16nW/d0JGJQwGR4LQX9TJ
	 rZUVZCkFHTawB+0W4hZEW2eVb7aXFlksBjAz14PUMXQTAPiuSmlAFIDARByWM8diTH
	 MMAPGlxlL8GaodhSBCoIlNfPjAxrWdExYi1ckCfXixX606/lD86ExLpd5fKMGZz/ol
	 /ly7UgjANuU5qkbC6OdZIX261an5MZBqV29BJGlOTZlZaHEsA07I35KkTVB/un2gEd
	 D8jPXCaYHPpMA==
From: =?UTF-8?B?QW5kcsOp?= Eikmeyer <dev@deq.rocks>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Ed Schofield <ed@aicharmers.com>, amd-gfx@lists.freedesktop.org, Kenneth
 Feng <kenneth.feng@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>, Christian
 =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] drm/amd/pm: defer UCLK DPM on selected Apple Navi
 GPUs
Message-ID: <20261030123000.5573e70f@kait2en-mbp15-1>
In-Reply-To: <CADnq5_MsaUDm8rcxr3_0wuEAXywxziAofOO9w-dUxYS9PUoasw@mail.gmail.com>
References: <20260916144014.879355-1-ed@aicharmers.com>
	<CADnq5_MsaUDm8rcxr3_0wuEAXywxziAofOO9w-dUxYS9PUoasw@mail.gmail.com>
Organization: KaiT2en
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 29 Oct 2026 17:57:49 -0400
Alex Deucher <alexdeucher@gmail.com> wrote:

> @Andre Eikmeyer I think this patch should fix your system as well.

Hi Alex,

I guess you have seen it already but the patch doesn't match the 16,1.
Its boards are 7340/020f and 7340/0210, and v4 only matches 0218, 0219
and 021a.

That hang is what I sent a fix for
https://lore.kernel.org/all/20261024162109.307247-1-dev@deq.rocks/

The VBIOS trains the UMC p-states at different frequencies the pp-table
lists. The SMU hangs as soon as UCLK switches into level 2. Deferring
the UCLK enable doesn't change the levels, so the hang just moves from
boot to later under load.

The two patches can coexist after a trivial rebase.

> ...your system...

I need to clarify here. I actually don't own a 16,1. But I maintain a
distro (KaiT2en) that specializes on T2 Macs. So the patches I develop
are extensively tested by the community before submitting. Atharwa is
part of this community. Ed is not, but Atharwa reviewed and tested the
code.

Best,
Andre
