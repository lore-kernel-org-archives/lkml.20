Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793716287;
	b=lVikgMfURHRpBgsWYjFkf9WfC2tAItbQYnu0yM2DOY3+vg1mbLm7n/K7snMFZ3owCFfH
	 xso+U/A8MkKNTdqA/CrST8AkBh+9EcneEyJBgOPcZI3DrV4CZwtKNZIOLfV/6gR86dUpL
	 gxMe/+YBh7noiMoV2u1XBV0na6pXNIaLO8rWPI2I/6TPh+vxNo3zLUIyqHhazLhMXXKH0
	 p0yw1vWQqsxUmD3xABkjU/YXDvilyglYSfMfksr8+AioXzYZztj2y/VOMmQCA+Gl/Sv2J
	 LLfoUbSmmAyhshLUolXpE2ZJakYXIEvsOIxyWIMYVBym+vcQ+IkOb6p/nLjU5rfHyew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793716287;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:In-Reply-To:
	 References:Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=c+hvimF6nQkiqAYkp9zrSjR1jjPwz/uqjAtTj/2pCgA=;
	b=XQAMQEhT6SEqhbBWDUd3Xx2F29deHgAY+nL3pgQVUdwS4aQ+ATegwTmKdrFps9J5sVrd
	 iVc9jcr092eq0j735ztbZ986dVViNnvvxKQlg0O+jop5DEUmsZlDabX4I5vcjZTB+HaQt
	 jziaVxwgM+TA/GjBR9o56IwWVtGKOP85l2ueNyBnpbhJsHE84HWrtY+Lkj0sdZOayzqS9
	 FuK+ZCAekxIDNoSsimXGmMcgS2BIWqfM6iOKlhoibQIUaw0eMrz/HgMxcUvvlzGkXTbHn
	 ZMTrmAB4lp4CSPXvakVnNiaIVORQlIoiXDLRuYhbQ76zJ422jrSjvKm9Ke0N6sIFZuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="bccSw/9f";
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1CE16083608
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 14:31:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1CE16083608
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=bccSw/9f
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1aefd1bf74aso780582c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 06:31:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1793716286; x=1794321086; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c+hvimF6nQkiqAYkp9zrSjR1jjPwz/uqjAtTj/2pCgA=;
        b=bccSw/9fzlOOlFcbWjiZwUnf1UQws4mHr2WiRgd5F7GigM5SBfd/Ad5GBvOVrPq3lS
         S25xNVuACzPzy3+mi+5rB/NpfkvdfYDJP9HTD+LIxF7DsjUpZrxQ/itJLuwB3nwsydbg
         wDtbdSCxuq0MHb8yVdfho8gSyKTqGpNfsgtAT5N3YdiZI3ly2wPtuF9c1yPu45xUwzr1
         41EXX5JcRx+qMJy0hrkJig7NR7hjC0TchpZ2jTYrA8qw8LhTBK37rdLzx5ZgPHmoxYBZ
         bmnEiGGmficMEzYdU2oMjnGa/R6R/nThKGOXRPmu6rGdbDruUdPgjyopPkM6iG4uza5f
         fMUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793716286; x=1794321086;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c+hvimF6nQkiqAYkp9zrSjR1jjPwz/uqjAtTj/2pCgA=;
        b=dvTfYfa/DTAzAbWJiVAhVS3oGHlHr3mpZf/5w9BkB4cw4kZzP3z3vD7eEOLWcLsotA
         0aJVTEnGR5ztFoOKSiwvuvPf9nMIaSPGZSwudQrXEW1iVRfAB6GAURkp2LjXhUNS1dnt
         QCdzhXoXBq7p99oPmQxxU1eUAO9oW26Eks3p7OF819ONAaRPmtuCk0gEkBHFAEXTlkZB
         lQCZ77rgcWA5r8s/6Qhl3UN90eXeurH+NkUpU3xt58us3tBJ/7jrrDxCABAVIA8dVB07
         n/I5f6hO0+/Rm/d1qR+J0vFFisyzEOdQU+Bq4stPUkBeXgRB3czEnY/5wr0I6kZ9+HBI
         GK8Q==
X-Gm-Message-State: APuU4Z9DcyPqKNPnXoLqOHIjWhgkwmne5S1Z3MRU+FwK48cmXYgCRhpg
	X/v1AmiBnEdpRGWFS8PDMKr5e4TNp73k4T1KomdoyG1ag+v2/R+IQjztnB5SLcHHffU=
X-Gm-Gg: AYBFou2JofxJ5VNWXFyqHRx0DA+rWTnntIRO4TNM2ss9lGoAnBnDbZtGUUM7IUNcHkZ
	fqoeV9Rf2AC/0kid/GEDIoCfXWaOto0T7ZS9XVLIaLjWAMLlEGD8T5IGINkcBkLGL/VUODwklfN
	Xa2geGkTHqB7sIG4LDFUdWFPpWCcppUXMTeCT4yR04pGZWupgrcvOlpogavtAOqFTRpkMjbYhQ4
	b9S863B6FzsFp0cjGpQjox6UUHNBkBt4e4l13wIfMoQ5y+pIMgxfNunnO7LZZ+B8J/VGhYj3qC0
	DywXeW0dYhOf0d4lKQsW4WCnGskMZ6Gd91sp8oSfJGmuWG5z7/ScemQeSgAopcvkUSOdokSQdnU
	DFitg7rViZNdIRcNfguPaGenf1odcETAV28nPQR0Ninx97xpXalulRVgFlcSiSoRRyoHeyle1tk
	5mVgCenrykmLwlcp+1DtDvwdD0Bm+PljxltObZEEdhGRhTiEoUB2H+Sh8Zg7fjXdCrkLDl7X+It
	wXNdLZL4ub1XEeoEYJomoVvPQl310VhOJwc+uw44CNqdSNTiK+/hhMseR1e6QnuGpcgDBgg6v8v
	pnulqoQsRiq4L3fEr1DF5naMoLBwry4NrPCmMJvf8JEhPjclJVWAFad919oSN4bKYL9q13KPS2m
	EEG4NRWEEDeQs
X-Received: by 2002:a05:7022:b0c6:b0:185:6c8c:d860 with SMTP id a92af1059eb24-1ac599f50b1mr19273200c88.5.1793716285874;
        Tue, 03 Nov 2026 06:31:25 -0800 (PST)
Received: from [192.168.1.106] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b23b847348sm9534779c88.4.2026.11.03.06.31.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 06:31:25 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: dlemoal@kernel.org, hch@lst.de, linux-block@vger.kernel.org, 
 shao.mingyin@zte.com.cn
Cc: linux-kernel@vger.kernel.org
In-Reply-To: <20261031221610676B5VoVcwMgkoDNVZH2bVDO@zte.com.cn>
References: <20261031221610676B5VoVcwMgkoDNVZH2bVDO@zte.com.cn>
Subject: Re: [PATCH] zloop: reject mismatched conventional zone files on
 restore
Message-Id: <179371628470.3691261.11003519751886691863.b4-ty@b4>
Date: Tue, 03 Nov 2026 07:31:24 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Sat, 31 Oct 2026 22:16:10 +0800, shao.mingyin@zte.com.cn wrote:
> When restoring a zloop device, zloop_init_zone() checks that the size of
> each conventional zone file matches the configured zone size.  The check
> prints an error and then jumps to out_fput, which releases the zone file
> and returns the value left in "ret" by the preceding vfs_getattr() call,
> that is, zero.  zloop_ctl_add() therefore treats the zone as initialized
> and continues with a zone->file pointer that was already released; any
> I/O to that zone then dereferences it.
> 
> [...]

Applied, thanks!

[1/1] zloop: reject mismatched conventional zone files on restore
      commit: 09c2e203e0ea8b68e7c9500401fa0ab60baf1a9d

Best regards,
-- 
Jens Axboe



