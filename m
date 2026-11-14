Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794676861;
	b=ZAzh9RLsUoIuLebG5VE8nrTAc51TweYqvZ+NHwFBfVDVChbf+itsaf4Z/Ew5zbtKDP92
	 bBbBSb88eYTw8OTOiWh23dHxnHyTEVRrWOD1jNSuRGZMpEZUNlowZnfMO3Ms6fjl0d3Bq
	 n7ATXpb/52sZijMnwt+xAlO6xlARj+LfDcx+sjm2ar+WV066MHm1j52qls+yf70YNesYr
	 Km+zh/PhzRizBZQxm6RbbqSxKFoKFEyb/q4CFwc+/xbEYYD/fAD/ke8S1szaiC/Km06xS
	 1krwnsxRexAn3EwHj7wpTM3EeA+6yrDrv5BQD2+oqzZV2YeVC6MIM0JsdaP0o4EfT0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794676861;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=OE0WjxLLrE3A9lY9DuO2yvYGktTA/H5dP7T78Fl8WrQ=;
	b=5qu/aU1Tb4vK7pELOQI2dMqbofqSAF6LQLMQtTy4Tk/ZaP7S/eJd4SzE5fbUC8O/4fSL
	 sRwXTiOlGFaSTlBST6Q7d1mAQlEx9bgrpYNUirY+fhLgot+zBghAGun26iwTKKAaiqSVu
	 cByxSGc/vOImAmstZ03D0TVrecYPMze1h13apTarIrEYGU0P97qBAq96bvqnv9NpUNq25
	 Iu8lLS3X6bx1vz/h2l7cuKTWPioqdFIGkwm7WmhKHTgmCg41PJNlj+/Hpsghcd7eLnD6I
	 rManui3nEHKKHR0Q1oX7iJ6z6iu9FuzCHCek+pYYAxNgZxYmzPhebme9vIpjnZ1RPug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=L9Y7t1b2;
	arc=none smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FE35606A323
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 17:21:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FE35606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=L9Y7t1b2
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b596afb4c5so2579979a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 09:21:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1794676859; x=1795281659; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OE0WjxLLrE3A9lY9DuO2yvYGktTA/H5dP7T78Fl8WrQ=;
        b=L9Y7t1b26tvL/YAVend1GF3/zvElMG3l8cU7K95rtjReKXX8XhEjtZn9omgTomTz0E
         yq0/43JC18sP43LqxQ/xT4GbuGuKhNDlXeWgRAFFxuZva4+XzYKhyb949ZDKsmwsUc2H
         60lW7s3apY+R5aT1BhUIHvwlZXrGeoVpGjstCmVsNVKg9BPpFgjs0cLHemRRqwejXLdR
         q1zNeVpxwBX6NovdXkTfrGl/os0AuIgrpLXSnf5ipKgkmLNUOKOfR/wWAkMlBFrRRFui
         uAh8HdWV89urxxb9ZKZ1b7vGPBn0wQVIT3GQjrqQoPigPvqW4O2X7ZzoCoolNT05iRVZ
         aO6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794676859; x=1795281659;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OE0WjxLLrE3A9lY9DuO2yvYGktTA/H5dP7T78Fl8WrQ=;
        b=Clb6QBjO91QDYeuJYY/IEWf6n/soPueP3HDOSoRY5YK/brhMXmikUbxCCCXSIbK3pR
         2Vo4dux6C7GKOZIJ+zOt/tiu7APhkgwENK5Pm19ijkgBm5OGvUWXTilxdrg/l7sbxVfm
         XxCiUXdZeqEBQonE3v+K3OGaPvPLy6tm3lvaPagYE2TJaN7sMi5Yiex4rEtOOE8mNWeP
         s4afu6UXPWoPfYI2WHoXaQI6LAInyhV3MuPcTsGgr0b8qG4qNE2CDMZ5MFTZFVUw6iRa
         4Lpyw5h+IK6YBEHGUhTTpIQzM9B/t3vBqP0+m7vUNFIHuDMRIG0KOFWnxEJvkR4Eo7lg
         HTmQ==
X-Forwarded-Encrypted: i=1; AL+hErFZwBQc93K3rmHC7YPbB4gAr+6/JSH2d2rwDGvMTf8xcM/XwAFXB74ejxFMSsicJpj3UDfsAOKKbIws/qw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9WNy3Wg4T8pjKBa1Zp66TuPKH8kihOkz7Y65lRtjXr72wKWPOF
	7IK2XDB/i0xtIr1/cUIKMrjsXTb90bYduJooWE8vhe8b1yKnqWGrSQeYJXCXn7q1ig==
X-Gm-Gg: AYBFou1txJ14GX9DLUk/2GLdp8E0wsJgnmUg2W1PB/ozgVdojTWOBdv1O7h0g9oiAxQ
	FNfTd5a61bW++pkdTHlTQNon+zqkV2gKYeXKUvT9vzM2+1sR/QZEG/BSPNY35EJwY2J7hj1wV/Y
	yCBfpNqakH/YxwHJMKJFF4AEmYeH7+lOwftIW5DRJZ8UrKlDNNElQxEGeI8GPKSthjpHKWr72qz
	XXz0athVQktRjZeZjTCPpQ0eYCur29MfSRDSnRkXDO0NLmcKZJuDbNqBsZLdrA5zL5H/tUd+87e
	Q/eQZo837llQVByL75qARQeSvLE3z5cqCmvrxt6JNOhhmiHp+a7jLEKgyMqlti4i4EN7Q03LIv4
	irkvNcES3MTlllLqm7/DbM/RpYX2fU8OJju9pBNOn+smyphn9wvrAnAcyH8zL4PtFwjs18tRP7F
	b396iMpMBRTXtl4bK96ZBoOxdubB/22QjzZ4xqwk6y3DeR5y5mN9SwMUKsH3VrcleWYHagLdWJa
	ydyrk/hkKZpr7559tA2CY2sTowI2CMqF6kXK1Nv4XVYFkTM5YI3n59qIiCNytwEaoRKoDdmXGsy
	69wziaFrF4ZY0f+QTljI9ne6x5JylZoJ5iCnCSl80ZzSkTrdktZRprgIWbK8D+dJYhMpnQ+VteG
	+KJ9c87z3CTMp9pw1PiGNQFN7KTZz2qorzR6RMy53UfoWcMpRH4sR5RP8ity5k/QuaqSGKKXa+S
	9qnE13pWNL2xcJIcZLiqUmBkscO19QaON0+XVLUNCmS5D3Z5+bh92XlcmKk9IOOay7Bsw6sk/Jj
	YqhamXmp1U4d759UAZPwbrk1pIx9aSJwWq5NAQ2oFtLPXZg7RbhVGL6AtReDyGgNnnHkfy9bwOz
	EGTL
X-Received: by 2002:a05:6402:320a:b0:6b5:6546:f7f2 with SMTP id 4fb4d7f45d1cf-6b7c0d144demr4458124a12.37.1794676859188;
        Sat, 14 Nov 2026 09:20:59 -0800 (PST)
Received: from Desktop.fritz.box ([185.181.130.189])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c21b1a08sm2462848a12.5.2026.11.14.09.20.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 09:20:58 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: jeff.johnson@oss.qualcomm.com
Cc: jjohnson@kernel.org,
	baochen.qiang@oss.qualcomm.com,
	vasanthakumar.thiagarajan@oss.qualcomm.com,
	manikanta.pubbisetty@oss.qualcomm.com,
	kvalo@kernel.org,
	sriram.ramachandran@oss.qualcomm.com,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH ath-next 0/2] wifi: ath11k/ath12k: drop TKIP frames too short for the Michael MIC
Date: Sat, 14 Nov 2026 18:20:56 +0100
Message-ID: <20261114172056.678298-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <002f7e3f-e4e5-4c7b-b683-c2add5b6377c@oss.qualcomm.com>
References: <20261111080620.244164-1-julius@bairaktaris.de> <002f7e3f-e4e5-4c7b-b683-c2add5b6377c@oss.qualcomm.com>
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

On Thu, 12 Nov 2026 10:40:50 -0800, Jeff Johnson wrote:
> Is this a theoretical change or are you able to have firmware pass too short
> frames to the host?

Not shown on hardware yet. The overflow is in the host code and a
harness that runs the driver's MIC path under ASan hits it, but whether
the firmware hands such a fragment pair to the host is the open part.

I'll measure it on an IPQ8074 with ath11k. That needs a USB adapter
that can inject raw TKIP fragments, which I'm buying now. I'll reply
with the capture and dmesg either way; if the firmware drops the frame
before the host sees it, I'll withdraw the series.

Julius
