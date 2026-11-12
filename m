Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794498793;
	b=qZXZP1Ovi5DPWMjdtnvfVreWXJNW1JRhZJGApywea2y7dpXIwRRvykAVueFPaYsQ+bUO
	 +bLrdvIN5RMK5DeCxRTQHBPLQEi1FI2uKjSkKd5OvRS61CN54HIXW4pHUhbM9qfN6RJ5D
	 LLweeZ11bED6P8DFjkFma3tPsbeTBCDwBd4mO7+kh8GIhUHWGf/HzM1zr6+RT4xGQ2bqU
	 lUi4wrzK1cxOJMRYnqEfxliY97IgttybUfHqNkculq1gNCRjJC8sUlXGid9VRKVrga75V
	 kk64KosQsGJCM35c1PNjatzBuXSavEybPW9vTgINhL9rMuXF8ySbrBy6uaDR4ItWNHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794498793;
	h=DMARC-Filter:DKIM-Signature:To:From:Received:X-Original-From:
	 Content-Transfer-Encoding:In-Reply-To:Date:Content-Type:Cc:
	 Mime-Version:X-Lms-Return-Path:X-Mailer:References:Subject:
	 Message-Id;
	bh=K06gDojWKv8kBAvBJxxG/GcVlghtU9ORU6nDXVfY6I8=;
	b=mD9NHsfOeWei6QqyJCVLQzzqpbtY0yJzEjvJ2TLGJWE0FXKzRHshBE0wkNY82DqJFCdC
	 Ns6XPd9b4PywgGEywOeG93Hg8qN3duZrCc01mIvPSpF99TjQW3MKGxb7EYffijmG6ncj/
	 Yy/tRPaWyRGNhPYleym5I1p6jGzQo2zo8SF1LhFxmYSEkSsTaZ3L23bPEzirA1zQk9ZwP
	 1utkhFvO5jTuYneBFFpb3ZJr7BvceHoUKCO88O6qiWHOSL3BOArZwO9Pi/YM5uln2b/+w
	 UqQ3y79608sRnDj+VzZhnvonOHF5BCftvczSke399A21mccI/Q18fr30tU+931HPlJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fygo.io;
	spf=pass smtp.mailfrom=fygo.io;
	dkim=pass header.d=fygo-io.20200929.dkim.larksuite.com header.i=@fygo-io.20200929.dkim.larksuite.com header.a=rsa-sha256 header.s=s1 header.b=VTWXN3z9;
	arc=none smtp.remote-ip=209.127.231.42
Received: from va-2-42.ptr.blmpb.com (va-2-42.ptr.blmpb.com [209.127.231.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF2E606A321
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 15:53:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5AF2E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fygo.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fygo.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fygo-io.20200929.dkim.larksuite.com header.i=@fygo-io.20200929.dkim.larksuite.com header.a=rsa-sha256 header.s=s1 header.b=VTWXN3z9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=fygo-io.20200929.dkim.larksuite.com; t=1794498786;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=K06gDojWKv8kBAvBJxxG/GcVlghtU9ORU6nDXVfY6I8=;
 b=VTWXN3z99V84dXz4X2YnvQJBl2bivIy6UCL3sKIFP5K8tzZUXHgMkR7doTzOW4h2a459jd
 i6yOXd4BvlvfYxVSJ2dol0taxI1v75LxX2UYwAZBJCoXdccRjztsytik+/d99tITogWrwu
 I+iMvwk7K83iIbKLpv0VjAJo0cr93zkOTjk+1mOAh3TdKduKp4KJiDwUAo6JdykdxAfND4
 Mk1wyidcorL8mWSr9vYr+xJM5HZ6jk/LHkpMv7V5XjjGyZbqjgH4CkVy4KLwVp7/EOMKRO
 foDP5p8YO3I0EoAZ7mDHwXYW7SbOWT8QqXirVewzOxD/8gzVoIougXjw9TxW5A==
To: "Chen Fan" <fan.chen@easystack.cn>
From: "Coly Li" <colyli@fygo.io>
Received: from smtpclient.apple ([120.245.65.72]) by smtp.larksuite.com with ESMTPS; Thu, 12 Nov 2026 15:53:05 +0000
X-Original-From: Coly Li <colyli@fygo.io>
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20261105131954.1195428-1-fan.chen@easystack.cn>
Date: Thu, 12 Nov 2026 23:52:52 +0800
Content-Type: text/plain; charset=UTF-8
Cc: <kent.overstreet@linux.dev>, <linux-bcache@vger.kernel.org>, 
	<linux-kernel@vger.kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Lms-Return-Path: <lba+26af5e0e2+dd5749+vger.kernel.org+colyli@fygo.io>
X-Mailer: Apple Mail (2.3864.700.51.1.1)
References: <20261105131954.1195428-1-fan.chen@easystack.cn>
Subject: Re: [PATCH 1/1] bcache: fix use-after-free when waiting for dirty-init threads
Message-Id: <9E1C5618-2488-4291-9DDA-83143B4FD3BC@fygo.io>

Hi Chen Fan,

Thanks for the patch.=20

> 2026=E5=B9=B411=E6=9C=885=E6=97=A5 21:19=EF=BC=8CChen Fan <fan.chen@easys=
tack.cn> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> We use multiple threads to count dirty sectors in parallel (read-only).
> bch_sectors_dirty_init() waits for the last dirty-init thread to set
> state.started to 0.
>=20
> However, after the last thread sets state.started to 0 but before it call=
s
> wake_up(&state->wait), bch_sectors_dirty_init() may observe started =3D=
=3D 0,
> return from wait_event() directly, and free local variable state.
> The subsequent wake_up(&state->wait) then accesses freed memory, because
> bch_sectors_dirty_init() has already exited.
>=20
> Fix this by using a completion to wait for all dirty-init threads, so tha=
t
> no dirty-init thread can still access state after the wait completes.
>=20
> This issue was triggered in our environment with the following stack:
> ------------[ cut here ]------------
> [30433.391386] Internal error: Oops: 0000000096000047 [#1] SMP
> [30433.585804] CPU: 54 PID: 48242 Comm: bch_dirtcnt[1] Kdump: loaded Tain=
ted: G  6.6.0-98.0.0.90.aarch64 #1
> [30433.718972] Call trace:
> [30433.722722]  native_queued_spin_lock_slowpath+0x33c/0x420
> [30433.729401]  __wake_up_common_lock+0xbc/0x118
> [30433.735050]  __wake_up+0x20/0x38
> [30433.739575]  bch_dirty_init_thread+0x1c0/0x1f8 [bcache]
> [30433.746169]  kthread+0xf0/0x108
> [30433.750583]  ret_from_fork+0x10/0x20
> [30433.755425] Code: 91002020 8b040284 f862d8a5 aa0403e2 (f8256841)
>      ---[ end trace ]---
>=20
> Signed-off-by: Chen Fan <fan.chen@easystack.cn>


Recently I am overwhelmed by the CVE flood, let me respond you (and other p=
atches) next week.

Best regards,

Coly Li
