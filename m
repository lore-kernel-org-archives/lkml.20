Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.153
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793678215;
	b=1Y9oz9yVbT9JY/v7T3OdNQwYDYA+1IlwVBkFXTV3wlehBAsg3vz5GDb1zdKVz0sIewok
	 ba0g6HknIIWmX+OCiC26OyrN2fH7abmyf2+sPgBMcUOOw6IWB4nkgS/1Gc5HT55m/+QIc
	 Tizfqc3+YgDEr8PWaKLGSqAXO+vLdb7tsdCWljj63yGnTUGbwOh5IurasIGkkbh/LAFCM
	 Jqe9em8GsWIYbONfrFa4Gg9xD3G4UU7+RyQTIyI3ufL5yL+Ffh3355D8RGO2oG6SN+J+J
	 LdRzizdsm+VLQSOhpcd8ZdXpRT/SpCS12UtbFeSAUeonrpLn97fbPVra4Omy7UO9EmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793678215;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:From:To:Cc:Subject:Message-ID:Mail-Followup-To:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=F0G83jYZkoeK7X+4lsZ1ri3XY9D1DB4ib75GAnjzYyw=;
	b=KSnBiGSsUzH9BHoOcCB0/L0EMUPMH2umzVX211fB93RE0oVDVo7HQkV6F0x63qYiYRJ0
	 V9gTY79RggKnMFsiTtunu8tucUomaWyJ3E/f9wgkQXrdKIlneRluXO4x5RMnHawRGZ49W
	 F7VZo+U1A21SNOZnh3y74H8DuQqtiDlUjiZLIg+0DzmdAObgTC8Ux8+vxjySxuhLJ/UWK
	 NTm8UHpX3sRbPsLrzreojgjgYeThRTw3jJDWmwuRPxTbleiEmUrqWUR78VTSMEZGLSG9a
	 7KL6Vz3YLFB4V9N8zRVCL39QWj13mX8CHPoabbvctnX1zAa86G1RU4KODJhIX7EUN9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sakamocchi.jp;
	spf=pass smtp.mailfrom=sakamocchi.jp;
	dkim=pass header.d=sakamocchi.jp header.i=@sakamocchi.jp header.a=rsa-sha256 header.s=fm2 header.b="RZg/RX8b";
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b="FPB+/k0A";
	arc=none smtp.remote-ip=202.12.124.153
Received: from fhigh-b2-smtp.messagingengine.com (fhigh-b2-smtp.messagingengine.com [202.12.124.153])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B6DA606A329
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 03:56:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B6DA606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.a=rsa-sha256 header.s=fm2 header.b=RZg/RX8b;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=FPB+/k0A
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id BC23C7A00E4
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 22:56:53 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Mon, 02 Nov 2026 22:56:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1793678213; x=
	1793764613; bh=F0G83jYZkoeK7X+4lsZ1ri3XY9D1DB4ib75GAnjzYyw=; b=R
	Zg/RX8bW1P0UdJms6xHDE5Hiuke640MW/p2RkCDOIYa7wWlSZosYlv1qtcvJ1G/n
	vmNxRmp4kSXdJcx6AektQ99VmjrGra2RBGm76t0hEQo3IPdWJY/fAm2+bX7lm1KK
	XhmgS7ADXmCTGJB6VyzWKD89RI9SFY4yCMJerpbw83yjHlc5I9DKAe+X+NPwn63p
	PrXD6T3xAkGALWwd1M8HVml+LykguSOeYwCeR8ZAspWLXwxF3NVHNM91qITFhW6o
	tTkC9NUseOSAgs6gG7G1mRaLdZPfrYun5FaQua4+4/gKZyIo4sCCckrnnOjbGrC/
	5JrhbENFkAZwQ1w3vd7mw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1793678213; x=1793764613; bh=F0G83jYZkoeK7X+4lsZ1ri3XY9D1DB4ib75
	GAnjzYyw=; b=FPB+/k0AC8BgauodZkBp3YosO6VVWXc670uxQQRhAou24In9uEV
	128KacTE7vCIFwXqp9IOCPf+T7L0mE5FQl3sT7YSQPZnrl4re4rlydgGNbKJLRNt
	2Dcm6lMdXcdkliYoX69iQcSkeWuZDsT0i32A8Ad3WIGdouWdpe4wfQrQr/2mizs5
	tKa1ROxAkZDoDMJi1FuhVNsVZf4LTyzU0n0X11ofmtk/pghzo91xyQoNRncwTGAe
	v/Qizo1gzHeFAjqx9KakGJjcQE2gBFqPHyd8iG0gDNaADOAyMqs7ecfDkvFx+cRm
	GeI+Wr2apif23y0uQr9N+337x6OCFGkojHQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=sakamocchi.jp a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793678213; d=sakamocchi.jp;
	mf=PG8tdGFrYXNoaUBzYWthbW9jY2hpLmpwPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:nKXYCiw6m/RQKjoc1nsPINJxeDAuLNOAmY2oVBcN6HmhwQu
	SV+j2hAEa9Cab+DW6mJdEvKXkOWPKmkQqncl6Q0+IJ+yLUZgTfNfU1Vsn5gHr1RQ
	Q2yyGVxwlkVyLSAltii+7Hme0ehdWqB0Xpdwe1WRqDGP/OGfI+2W9e/wShV0cUyR
	1tH5Q42VzwtWT2goMtc8CYhX9AvtWRPyf6uxgj7x6YafL6xsULScfUOYRtx8NYM6
	32SQR1T7saC6VoRrIhEYiruhLHucEc68xtKpxGMWgE6Emvwqs9FtnF/QjvT5UB7/
	COyRNUftK01vug2uAtD+101E8tZrjyocjovsP8Q==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=13;
	hn=cc,content-disposition,content-type,date,feedback-id,from,
	in-reply-to,mail-followup-to,message-id,mime-version,references,
	subject,to;
Message-Instance: m=1; h=sha256:JsQz10hUWKqS9Ve6Xew7TPCjVDZ/Wtkf9PRryZGxs1U=:O1/Dr6nWWq0sy9RphiU63EjN6WNbwYKKXgWArFI1a60=;
X-ME-Sender: <xms:hVvpavDG62PgH62kO7FyzQObjhAqXyGtcEN54nkTW0SUbv8FkvSo9Q>
    <xme:hVvpajedOQ3oNytP9wvl0rwYCAkKbndto8KALubk8EQkc114RX57smGAqVFHsMUF7
    TT2v5gGepLAJ5LP3cOsgPI6DAqD3sCEBcHbWJKLiBa08TlEDvX0IzM>
X-ME-Received: <xmr:hVvpaiLYQe9AntHqgAQIUKyNyvo3xH0uqj_Aa2cam7iluNv9xR_gmJgDm_athqW3RUTf25FJR1MuOcsLnz2MJAkueeNk>
X-ME-Proxy-Cause: dmFkZTEc07qKKiS32SZ5wC/5XzowjXeuN3QhanZZPTsbA0DkpawygpKlifN3HXx5Vut0ia
    bXsAMlUgpN36VYvtzPDXnF+Bn18vKHpZHhZRCOspJ3O4KxSlEFY3dAVP8pIXbt9uUV9hBJ
    /augml5yyrXEP7z1WmSA3z/rMKTY2ftjWnNqrnIFxi3plOScLiq/M5LVMleFE739Dyrl2w
    NGkSra7us8WvCobuBifHKJQEYkW/BjkbBYGc4xq8PdgsYWHvqquxjSBcFXRbPk/mT0qMkC
    CM4f54TLENC9A7oy1WDLPN+XqTymAA7lhJ9q3aNUeIk//L1b45Hj9mmp2zzur7EuFKVcFE
    vwVYg/3fq7IGshOo5q6f07KNgO9tBOd/bzQD32M4sQsjHlWEXL3TUQQwb+hNbbKfT4HJrd
    WVqXEyQHHbjEXh7gyhQROcx8pdhBJUqnWHRORuXaXneSxKv7jgT19yz8N9Xru+aTzgjmGB
    6NJ/UAj5Y20Dj9LB+z/ctEge3PDqmcH91agU+7pmdLUvBV9/JDQuc567N5/ZXGOUqnx/Vc
    ZA5SzyrvBdmb1BCbHh+rzzOjOUqNzkNiEn+VQ82YsjbL4GvvBCRz0CwBp4qb/P74p+LtRD
    MkvZ7euCFggaPdwhAT0qEoOeWVpZHmZ5GKzZYKOhzTVsMNv7KF/Gc+ni0YzA
X-ME-Proxy: <xmx:hVvpaud9J2D_eLt-dcGXoREB8UpjNn8HU16CiW2Xe319UY4NybKqNw>
    <xmx:hVvpah3Ydqr8WWnWfN_5grPzZZgDHrzgp65Rutw6lKHN1WjtHzcN6w>
    <xmx:hVvpavgJUm2Fy5TWvgi98PHazo8SnYoe0TQ3Oh4Iq-x2QAq1FqFI9g>
    <xmx:hVvpavQWAbZGwaYTF2KA-tpf4t59b7FJeMfzmx8a5Zpguy16aAworg>
    <xmx:hVvpag0L-8GT2Proxi_uQAToBy9Ga4dKMPEwjo8WN_U0_w6L4i9Hxn51>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 2 Nov 2026 22:56:52 -0500 (EST)
Date: Tue, 3 Nov 2026 12:56:50 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firewire: ohci: avoid potential deadlock when queueing
 AT local requests
Message-ID: <20261103035650.GA1229640@sakamocchi.jp>
Mail-Followup-To: linux1394-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org
References: <20261102033058.1184485-1-o-takashi@sakamocchi.jp>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261102033058.1184485-1-o-takashi@sakamocchi.jp>

On Mon, Nov 02, 2026 at 12:30:58PM +0900, Takashi Sakamoto wrote:
> AT local requests are retrieved from the queue in process context
> (workqueue), while requests can be added to the queue from any context
> through __fw_send_request(). The queue is protected by a spinlock, but
> interrupts are still enabled when acquiring the lock in the former case.
> 
> This can lead to a deadlock if the same lock is acquired from interrupt
> context while it is already held.
> 
> Avoid the deadlock by using a pair of spin_lock_irqsave() and
> spin_unlock_irqrestore() to protect access to the queue.
> 
> Fixes: 5fe52c6aa28e ("firewire: ohci: use workqueue to handle error case of AT request/response packet queueing")
> Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
> ---
>  drivers/firewire/ohci.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)

Applied to for-linus branch.


Regards

Takashi Sakamoto
