Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793187101;
	b=2DHCCp2fmUyO/VciPN8FCxn34VY3xjA9MFtwN2ujV1NfbtcQ56JFe81Q4rPniTLDSJ9t
	 vmO7MFUIQoF8KC7c9Jc7kCw7Poh7MDYEmf2F73B7u9r0D4RxNKARYK3AIQC2OiDPv0y7X
	 14cv9RNRyT76YeymuKNNxspy8c9OP8LvX/BgzqGwkqGDOxTBLCAOKuFgaIa1rmvruC1Qe
	 pc8ivwCzmaipceCrkkF6ihBybqwTX49NyBY+tA2naRO3AIPMWHpiTjyA2UV3pjviQAn9o
	 HY8VHX+CWmcnbkpShuy5DwMbFove8SfKpRnDCwTUDaetYEO37RimA85+iLJge94jCPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793187101;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ZuVQNaWid9pWYXFR5sJM/0dx1+C32mmdmGQdiGyQ+Qs=;
	b=aJifrJctZnOyV32Q+U+tAwR54jZIT+OolUryLOJRmmAjqwwy4TEalsjzyctL+enBsaNF
	 JSqmB0ZNTHnq2tZnJGeYV/KW0D1m4GlzzHwwCtRRclueMWRANsMjOFmsHhCpq1rh0LihZ
	 1EexsJmbWGaoArSXQGZ1SwG1wsqTNHA3rFYiulZcuCY9MrDLaPKK9DAHF2dPGFy6jqngW
	 KVYU3HSYOgdsPF1qd9+AbQ7AFx3usf3ujfaY6gHmMROGeqB2H5E/TO6PDzEWyCREKXCoC
	 ZdYp51T32AaVn40FBE6mWuRwGYpsVbw8VA89v+3SLFvs2tprCxKiYfTBlySqFJ3zVpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="rzC/RiYb";
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D0D6606A321
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 11:31:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D0D6606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rzC/RiYb
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so6036535e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 04:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793187100; x=1793791900; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZuVQNaWid9pWYXFR5sJM/0dx1+C32mmdmGQdiGyQ+Qs=;
        b=rzC/RiYbWvBXA2P565MellKyXzy3OLBZHsPXUzchhH9CD9zSbNGGuQPPT6M+tYvTCh
         Yuk3owPEQXYdclywO47Aa8Feei31oXB0GOBAxAzDxGgQ8YFQeagzW0GeuDO/n2RxJKjG
         19GAzCGFDXZwwWUsPH5Nm03BEzVsE1XJ6od4B6jI1FzJZcFIBHu80YIwgbNOFBrpu2EX
         Ny/OwLurBh9eljPCKwhK2stMULN9YUKrX0y2QYYBMZ+mRBR95ViPp/VHpkeZbctfNX+K
         sJHJDw8OvegYMUdFmcPTt8j86nfLsMu1ZsIkRlTLvK1G51x49TkUBZe0GmJLXTOBj2Fo
         AkwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793187100; x=1793791900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZuVQNaWid9pWYXFR5sJM/0dx1+C32mmdmGQdiGyQ+Qs=;
        b=TWH30xGoTnT0JvZB7PZCvI4U83riX7fFm10Mr636UpkUBdB448BIMfZKQB512ZRS8E
         T4YOnmJM2WBzwgARjjFswV5ruRbeSBkDc/58idVhbCj4TBzw8MmSrNcQYHTC06prGlK+
         xLY1g7iifPwoNsNZhg50oJZL8O+7IZ3Yxm443pCb3qYmftmdyn1JZFMba+xslXDJ8ThE
         r4Mjb4h/C3e6UDf7/AH1YqFOscyyHWxBOIYqmT/oty1LHRiQ9/tnMIpxZK/xxvx+5xF4
         g8230A5/khiIb+7sUjYloJYbqMKq8LPaelcR3OQrlyL4NVYaZMaUspEj7ZiBvCT//72Y
         a9/A==
X-Forwarded-Encrypted: i=1; AKwUvBySg5dtNjVcJO7N0JyQf8LmCfq5V6OP+JdDMiDH/iVF+Wx3JTd3WFcVVdAbNSPHOtusLQc5BKNuJ2PEG4I=@vger.kernel.org
X-Gm-Message-State: AFq9FYIOlUzEQcx2lb03eL6DBVcjW7xoARqUi7BWfOsPN47dbZCu4aaz
	RuMd8PDRw3znDt+FqgauITyjpjf0F2lk36U+A/5M3UEtdcNq3hEdWRab
X-Gm-Gg: AYBFou3KwMkajpSKTwiixg2B5cIMjWfzpfzEU7Z1xefKFzhwljb2iyIc9KnKgPkFsk/
	XIlo9I8v0dQ7GWfjxcUdH5lXpnaHxbLQ1TnBuqqM2OrJ9u6ONQg5dyVbgUn+fefzJCpnrx9afTd
	GsDans49BcD8wuxSWw3Ivl6bCx5EiFL5Tw/z0yg1vBXxJBmQrEb2sdP6UVBAJSFNNBFHsBFsgWH
	18O9mjv5uF9UtJzeh404zTac7QEs5Wx5gC/5zkzBl2L7MT4/jUwir9r25lqh9AF2kswkFYIvZwf
	pTAd8vlDkMWwKEXi57xoAv1X/D+u6Txmx254qTPzzQ9BIc1gqTVTneK3SG0P8VF/ih4WXlLndEf
	CJSwv9o2NGVOasqU2j5WF7w+MILvBNspxSQGTSrUTYl5FvC5i8D50/guwyJDW28dUPj9ZZf3Oqh
	rYxVZLTQC2dRfFaFAHNEg+McwcvCixzC8kEsBY8vFwfo1Mi918k4I9R2WYl7Xt5gK+yeWsQxAU5
	g3Qml9/mEvwbtEcCga2+qQRDLJTo0saBLgUYRoa4Dkn21Z5Ngwv4LEIn72MNy2dMaEomE6GMzq2
	quSuWTkUKPEeqzQwJ/BMJCLZW81vzchMIldyF/zW0PpXe5DXdjzE71KY6SbWmdhaexOR+g9Bmm8
	oDy3Ob8jrvShyLP6jnpsAy3I5cs2J/XdFnIuacQr+QJTLm2CAL4k8/CYTPUjPdi6kKPtDR5yOCw
	CW+LxSAg5gUU8=
X-Received: by 2002:a05:600c:3f0e:b0:4a3:5da2:38ae with SMTP id 5b1f17b1804b1-4a99781ff60mr36159265e9.14.1793187099590;
        Wed, 28 Oct 2026 04:31:39 -0700 (PDT)
Received: from PC-Marco.lan ([151.59.117.24])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a996aa0ff3sm16684455e9.1.2026.10.28.04.31.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 04:31:39 -0700 (PDT)
From: Marco Ziliani <rylos78@gmail.com>
To: Daniel Scally <dan.scally@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	Chris Simpson <chris@nilk.net>,
	Simon Kruse <simon0x+git@proton.me>,
	"D. Manresa" <dmanresa@gmail.com>,
	Tony Garcia <tony@loafecho.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] media: i2c: ov5693: Keep the Bayer order when flipping at full resolution
Date: Wed, 28 Oct 2026 12:31:36 +0100
Message-ID: <20261028113136.36524-1-rylos78@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <30b2925b-0518-4692-ae2a-f70fd11ce43b@ideasonboard.com>
References: <30b2925b-0518-4692-ae2a-f70fd11ce43b@ideasonboard.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Dan,

On 28/10/2026 09:31, Dan Scally wrote:
> Hm. But what's the right approach? To allow flips without changing the
> media bus format code by offsetting the output rectangle, or to have
> flips change the media bus format that the driver reports and flag the
> flip controls with V4L2_CTRL_FLAG_MODIFY_LAYOUT. At the moment that
> would mean that you couldn't set flips whilst streaming though, which
> is suboptimal.

I went for the offset because it keeps the flips usable while
streaming and keeps the format the driver has always reported, so
nothing changes for existing users. Other drivers do the same: ov13b10
and ov01a10 shift the window offset by one pixel when flipping to keep
the Bayer order, and in imx290 the sensor itself moves the readout by
one pixel for the same reason.

The cost is one extra column of the pixel array, which is why the crop
end is widened by two columns, clamped to the array. The reported
format, crop rectangle and size don't change, and the binned modes are
left alone since the flips don't move their Bayer phase.

If you and Sakari would rather have the MODIFY_LAYOUT approach, I can
switch to it in v2.

Regards,
Marco
