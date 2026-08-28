Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19AE1392C2A
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 23:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787959090; cv=none; b=Mqdt6gZPlGIwizTVY5MiF7WddUuM5v5Rzy6/cQYeVQioNyQETYZqk+Lls4i1oKRphG1gsj42tocFiSAxWZM6F8QBNa5aiK6n5m4olo6BaO8URgDIECVtOdXXHzsbkD7v3ubVKmW/1ktdqe3RWgEbgmv3XSXg9XcvpRK7ieCX9UE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787959090; c=relaxed/simple;
	bh=nJ+QZDsE+bh8f+mn2u8v660wXJGAZHXVGBjCbEvjcd8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NDAKcStXOjjc81t9prf2LHNVHcXbr/Yi37L8XXk+QVcp7Vw2MZghCTcFzyY5N0fzW17FHMGxXBv36Yd+uhliIL8GTwU40tCKqyduqR2sfyqAqg5BTrlpXpByHhfV0A68dxoDhS6DR0YvE3qJ06jS8Je6vOljJ+hsM74Mfpt/2Ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GHrWEOk7; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GHrWEOk7"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49b8687630fso9851625e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 16:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787959087; x=1788563887; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hbNXNUsbJJs3dF/DfgTaL47t7uOjQRpSFIW3utnz9Kk=;
        b=GHrWEOk7ctL4HamGcpdMAZq9KaNIc92oR+7AGOmcDU7fAmIyo8qRhckL7x4zl+0WsZ
         S/E8vKfbH8FDNf4lVlZUahLBLO/GjNz/X+LvgCNv6EhACNpz2gb7KMPRNRBW3BOF91Sf
         UWncJfuB1dhQbhkmuPYrMiExlNOSlR5KGaob2T+0VKRzabC2p9X5M6moaxnvKxEyqLOi
         xAE0pvmggC1tuoqHWCEG1OG5lOd1xBrmS2Xf7pxNoicN/ggjin9oRVokh7ZU5xK+3hzz
         hp26cBcwntmyTbPX1CMcy/YdDvz+34G7Kgv8CxNrt9S16PfrnfRo8Uu64r+EwPriHWV6
         IysQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787959087; x=1788563887;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hbNXNUsbJJs3dF/DfgTaL47t7uOjQRpSFIW3utnz9Kk=;
        b=H9U6BcKn0j6fDiFyPP0vsdvPuDNjyTUIyI7ZjfeqoekbIgtNksUilqTAfLi50J8t41
         fy5xtzRvNl6DspD3gp7bIB0+lwZyNTshBIyN5FKmDKr79GLs1qkd1bcf50+f45o8fER+
         8VcqqNNlGn4HCuMJRukSJ7/aaAiVbNFsSRgAr3LudqVUXgirfMt6H+42NsUFOmuZWZpV
         7TU7r8IlMnY0f35Tu244GdnW4ZspbZk+1DmFisNgbQv8AB/3GRcSHc0vD1ysfNC+bf9k
         +dKNm0194+gxcZin9/L8MXnuFLkt+GHxkE6BWUimvN6zQ1Fl7b6cyRHzhPDd9G/FrGPf
         zg/g==
X-Forwarded-Encrypted: i=1; AHgh+RoDfLx6SEUcA1nSE7+cZOhUduu2MAN9v5ZuTvecTUxCRmct5DaYrVMx71OnBIsuFCggoGgwxVn1a1kaGCk=@vger.kernel.org
X-Gm-Message-State: AFuF++nuZlSgWovpGoptreE8Db6fOhzqz9Ki7yHfWRlbiY/As2aOULys
	NeW9sFKjUW7u/RozSSKBi0ZOCCoTvxdCyx2MGptUsPMI1zd5gxiRE40=
X-Gm-Gg: AR+sD10QLThWLDmNE/Nz63tlbSYNkv7gij6q0djEr/bBEpsssaUmWNK0qyRKcnkzrJW
	BBwJVCC/ZC/vxdG/OIr92APhQ7ev72+WtGsJbVIm/9y6JE3tjoIJYp6rQqiDQQEbUy9su6+8vC6
	4EUQ9Y3dGpQL0TpQzyUS24myo8ncEoxoGlj7CL8PHtyE3l+QnZwlmLwt3h/5KF9rDlFtNGIBDCo
	jLpO4eTH3Vu7QgvUU3Yw6NG+m6y0Uxuc1Lh6QlTE/CFFL6tnfi1yYKvbhPFdqUk6BlQfAKZuYIm
	fXI4vj0w43GtNEKggno/boo14R97w5a0D9v9guA9tJD1T7NGl9nnEpgWlPNd2Y4JxmiEgjc/nSl
	i2F022v9K78gkZwNG0Ucop9PadhwjV5H6wL28u1frhh8Vjzskquq0ltRmTt+6GgXfLtcYxngasK
	RpCB5PB6l1bwzV3/GZVk9hqW3EC5z+KRYQOq6bhPmxHcGD3tTL4UtW58q36XUxYW6AxmQMVsKlN
	K/71TpRJrGL
X-Received: by 2002:a05:600c:620e:b0:49c:c0d4:53d9 with SMTP id 5b1f17b1804b1-49cc0d4545emr77747415e9.14.1787959087181;
        Fri, 28 Aug 2026 16:18:07 -0700 (PDT)
Received: from surface.. ([217.61.227.23])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49c5a8e0657sm54933605e9.13.2026.08.28.16.18.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 16:18:06 -0700 (PDT)
From: "D. Manresa" <dmanresa@gmail.com>
To: Jakob Berg Jespersen <dev@berg.pm>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	=?UTF-8?q?K=C3=A9vin=20L=27h=C3=B4pital?= <kevin.lhopital@bootlin.com>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Fernando Rimoli <fernandorimoli11@gmail.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 2/2] media: i2c: ov5693: fix horizontal flip polarity and Bayer phase
Date: Sat, 29 Aug 2026 01:18:05 +0200
Message-ID: <20260828231805.29790-1-dmanresa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260729-sp7plus-ov-flips-v2-2-91884b81a8f5@berg.pm>
References: <20260729-sp7plus-ov-flips-v2-0-91884b81a8f5@berg.pm> <20260729-sp7plus-ov-flips-v2-2-91884b81a8f5@berg.pm>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 29 Jul 2026, Jakob Berg Jespersen wrote:
> The sensor's native readout is horizontally mirrored and the FORMAT2
> FLIP_HORZ bits (reg 0x3821) un-mirror it; the init table sets them by
> default (0x3821 = 0x1e). The driver sets those bits for V4L2_CID_HFLIP=1,
> so the control is inverted: HFLIP=1 yields the un-mirrored image and
> HFLIP=0 the mirrored one. Invert the polarity so HFLIP=0 yields the
> unflipped image.

Tested on the front camera of a Surface Pro 7+ (OV5693 behind an IPU6,
patch applied on v6.19 sources, loaded on a linux-surface 6.19.8 kernel),
Bayer phases read from raw 2592x1944 captures. Partial results - the
polarity fix checks out, the 0x3810 compensation appears to sit on the
wrong flip state on my unit:

1) The polarity inversion is correct. Independent confirmation: the
   register tables inside the vendor Windows driver (ov5693.sys from the
   Surface MSI) keep the 0x3821 FLIP_HORZ bits set in every mode
   (0x3821 = 0x1e/0x1f), and Windows delivers the un-mirrored image; with
   your patch HFLIP=0 keeps them set, as the init table intends. HFLIP
   also toggles the mirror geometry correctly in both directions here.

2) The 0x3810 write does what the commit message says in the relative
   sense: the two flip states come out with the SAME Bayer phase, so
   toggling HFLIP no longer changes the colours.

3) However, on my unit BOTH states then decode as GBRG, one column off the
   reported SBGGR10. I measured the four register combinations
   independently (phase identified from raw frames by green-pair
   statistics and confirmed by demosaicing a known-colour scene under each
   hypothesis):

     FLIP_HORZ bits set     + 0x3810=0  (your HFLIP=0):  GBRG
     FLIP_HORZ bits cleared + 0x3810=1  (your HFLIP=1):  GBRG
     FLIP_HORZ bits cleared + 0x3810=0:                  BGGR (clean)
     FLIP_HORZ bits set     + 0x3810=1:                  does not stream

   i.e. here it is the un-mirrored readout (bits set) that carries the
   one-column phase shift, and the mirrored readout that is SBGGR-clean -
   the opposite of what the patch compensates. The last row is why the
   compensation cannot simply be moved to the other state: with the
   FLIP_HORZ bits set the sensor refuses to stream with a one-column
   window offset (perpetual "Frame sync error" on the IPU6 CSI-2
   receiver, reproduced across repeated attempts); shifting the crop
   window by one column instead should work, but I have not tested that.

4) For completeness: in the 2x2-binned readout the Surface uses for
   video (a downstream patch of mine, not in mainline), the mirror does
   not move the Bayer phase at all - same behaviour I measured on the
   OV8865 - so there the 0x3810 parity must stay constant across flip
   states.

Since you and Fernando verified colours correct in both flip states on
your units, and point 3 is exactly the opposite assignment, maybe the
two of us are not decoding the same thing - or the modules differ. Could
you double-check the absolute phase at HFLIP=0 on your unit from a raw
capture of a known-colour scene (not through an ISP that may be
auto-correcting, and not with the sensor's test pattern - on my unit the
colour-bar generator is inserted after the flip/window stage and shows
the same order and phase in every flip state, so it cannot see this)?

Happy to test a v3. For patch 1/2 of this series everything checks out
on my unit; sent a Tested-by there separately.

D. Manresa <dmanresa@gmail.com>
