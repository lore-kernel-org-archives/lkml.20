Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794349688;
	b=RI2wbT4gbO1RNkBzDuQpXh+okGJ1xNHV1zUvlRh1OhAbg4UhR82TM7Sco9S+yIRxhA/Y
	 nnJecDbuCX2S8oEM9t0SKtTppz91zN4QxMMro1w6tyEaAJVLSRxGFMya2gDZ+Jr70tSzJ
	 Y4/9MxXGaAeV2t21GHcwNTkz66zSAKSaXVKqCtWs6DyARRPFfAc71S4J7+qdHNIZps10A
	 5udpN3gpP2idpSBaC5/BiHYuUSzgQ0ir+8CtxGulqus+53olRBuVJ3qDGeQym1vTbDLl3
	 JxYNmlSCrAJOrNOxyNKvoOH4z8Ww451GqDcPYUeu91PKYXaADSn9hfOB+LOFxbHf3RA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794349688;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=R6vbE0PtbYBdzOcdkK69nfI2NMGSRYdaGf+o1bvzgiw=;
	b=V+nBFIbKecT1NRxa0d4hfybEcaNAdaWnWy1oPdIn5I04FStZgaq7Wvnk/CbOu3wIhwL+
	 PbsvKFi8e6efsITb2kh+BnmBYbWV+AtWrCLWfR2bpWA7YjCNZmuM/QaRKcd19aQJXIZ21
	 +2TIGso82FEUKlts1Lu08lrFHlL4R6e/CEqCW0sTexdnZSMfdeVOfWtHNRm7n6pzXxSAW
	 xNWhJHhbmsebxRvh/LyOAnLQZC3jFVp50cMC3LEITCMbBnVnje4AqHDH4/TbVvIUo8OUc
	 sN30u4IYLkLzsGozVkfSYIr9WyLjGxiA1oew96ESQzCuKodHAqkB8f+T6awdQG6D9dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=modelmiser.com;
	spf=pass smtp.mailfrom=modelmiser.com;
	dkim=pass header.d=modelmiser.com header.i=@modelmiser.com header.a=rsa-sha256 header.s=protonmail header.b=g7zvKaL4;
	arc=none smtp.remote-ip=109.224.244.20
Received: from mail-24420.protonmail.ch (mail-24420.protonmail.ch [109.224.244.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33641606A326
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 22:28:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33641606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=modelmiser.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=modelmiser.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=modelmiser.com header.i=@modelmiser.com header.a=rsa-sha256 header.s=protonmail header.b=g7zvKaL4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=modelmiser.com;
	s=protonmail; t=1794349685; x=1794608885;
	bh=R6vbE0PtbYBdzOcdkK69nfI2NMGSRYdaGf+o1bvzgiw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=g7zvKaL4lKwN2N+VfFEQTvirHWJZKH0GhxAC3xz7O3PICsC3q3N/TweRADNXGhXp+
	 8J8Km0R7I8MjiY7DP5HLBdTLHjRzLBHZ0nhhohHwdmCAsU6KcWpNE4LTU6IkRbxK+N
	 V6eCC7itw9+IzTSqzhDa94I/CnVle3l8vDWqoLm/weQJU6tQPoPwcmW2HMZ4HiQOnu
	 ZPDqNqnFfstrnTbiUUzsa04Y2jNPIPZ+qr0RsqNPCs2/snK94gKkmEQLcfALsvW3es
	 s8ew+WwVQEnD9753SBg0wHMPFzhh4rgt37dSAbop897CAwfkSfrY2fTnGegODnE9dK
	 n8FWyFu+dXMiA==
Date: Tue, 10 Nov 2026 22:27:59 +0000
To: =?utf-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>
From: Chad Aldreda <ca@modelmiser.com>
Cc: Hans de Goede <hansg@kernel.org>, =?utf-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, platform-driver-x86@vger.kernel.org, stable@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] platform/x86: dell-smo8800: keep the state until the last file is closed
Message-ID: <20261110222752.2902827-2-ca@modelmiser.com>
In-Reply-To: <20261110210359.upmeyc4b4xksfva2@pali>
References: <20261107204950.88952-2-ca@modelmiser.com> <20261110210359.upmeyc4b4xksfva2@pali>
Feedback-ID: 232753253:user:proton
X-Pm-Message-ID: 55ee3176eb9293db6a8a8609f158030110622166
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, 10 Nov 2026, Pali Roh=C3=A1r wrote:
> Hello, I have not checked this patch too deeply, but I have feeling that
> something is probably wrong if we need to add a new manual refcounter
> around a whole device.

Fair question. The count covers only the lifetime of struct
smo8800_device: one reference while the driver is bound and one per
open /dev/freefall file. It is needed because the struct comes from
devm_kzalloc(), which frees it when the driver unbinds, while a file
opened before the unbind stays open and still reaches it through
file->private_data.

> Anyway, this freefall logic was originally copied from the lis3lv02d.c
> driver, which now lives in the file:
> linux/drivers/misc/lis3lv02d/lis3lv02d.c
> So if in the freefall device of dell-smo8800.c is some error then
> probably the same issue would be in the freefall device of lis3lv02d.c.

Thanks for the pointer. lis3lv02d does not have this use-after-free: its
freefall state is the static global lis3_dev, which is never freed, and
its file operations reach it through the miscdevice embedded there. It
does share the other half: a read() blocked at remove is not woken there
either, but with static state that only leaves the reader asleep until a
signal, without touching freed memory.

Making smo8800_device static like lis3_dev would also fix the
use-after-free. I kept it per device because with static state a file
left open across an unbind and bind keeps the device marked open, so new
opens get -EBUSY until it is closed, and the old file sees the new
binding's events, as in lis3lv02d. Either way I would keep the wakeup
at remove, so that a blocked read() returns -ENODEV instead of sleeping
until a signal. If you prefer the static version, I can send a v2 doing
that.

Chad

This reply was drafted with an AI assistant (Claude Opus 5.5).

