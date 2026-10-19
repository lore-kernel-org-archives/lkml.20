Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E93B49E5CF
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 09:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792402945; cv=none; b=Cx5DsiRPbe++LK1Qlj/gg6zUU52HXpH60hefSs98Wdxvb4zPU50HY3wihthXk0cauf13stToNgoz5XeQGq9LW+fJAeZliy/Zre44X1JL938YreaKBOTofXe5WAa1SJUOmBbSWFZq2iOSxr7OijrvbVA+uO3o3t6oMaup9d8tJdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792402945; c=relaxed/simple;
	bh=n11FAT6INvbhCYJ2QIyftHuFqKCdXt94mNN52/j4ylI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZzqpWBjH5A4g1uIOUGz48cRz9zahe24ZeGksrs1rzGpnb5J7TIOFyDUiZS18bcPBhknEiJmjqK2gr4sE5AEcdpdoh529IyZbKkg5eOKXwi4a7mpZZAJMN35MoAYQ3kYb3RSDkzU8IX0jNKwy9EHJdlKXzaCw0Q4iUg5ORgZnR/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de; spf=pass smtp.mailfrom=bairaktaris.de; dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b=fFB07yMs; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b="fFB07yMs"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c423b145922so152968566b.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 02:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1792402942; x=1793007742; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3Pz3/gqrTV/SKKDEFpGlc+W7jSRg3mmfHystnBQbO8w=;
        b=fFB07yMs9H8LcPfz/d96jA83VfUV2d81tya2chjDSUMFnAmSKmNCYzBPKzNHbU6bS4
         r/r3DyH0hiQ7ipjsJZRFMMh1ZvATJw6qSDBJqAUoaKR+mcIg59knRJ0fWA8oUxA18HcH
         vdarrswP0Kz6lUYIADNpDq6/YW+48foQAUpMC17KFwTk8K1mHJeMX3hgKKXcuGsBhzRm
         U3+4Jdx/4lYRTRpYiWkVm9DVtvDzuWaovgwKkXsPFO+fpgpbOHOJN3mkHPZKqTypIfVK
         5pU3wixVS0wm8bGZVogh63N3RtjgTtDEWNUUz2KnVzUbrOGHEWbkSeh8xTJ7KI16y26x
         9RUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792402942; x=1793007742;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3Pz3/gqrTV/SKKDEFpGlc+W7jSRg3mmfHystnBQbO8w=;
        b=WDaKIfWJWoWwBGcCu6iqfdTwNLm0pJrMjBYJwXzAVC+KxeB8IFHky5WVN6s40Y6LLp
         4r2xuVhYtv9iO3Z4JSVkSJ3FMBIxGBt+HKKIUp4l9wdgWvYmkFotG3U8ikp1kAKEtwaX
         BCrapQ3v1r/m5jylJ+a0t6CcFdi9E1vv5SCpW8yDHByGWZeVRjThTxhg9gFNqTFczFOA
         oa0b+PwAoS/3LAssokU5xkqIseoJZD5MPRAqpYxX2hgeOVT2ronpY42SjG7Xi3GVizXU
         r+vsr5E1ZUfsgqksJCgoJnMw6W4mVBk48cidI0A9ayeMnkRlGbCplOMSiWHHf+QzNvKl
         AgKg==
X-Forwarded-Encrypted: i=1; AKwUvBwDPnEKz5ksMw5JZ9wA9DS3SAzTwioJA2XLDW4n3O+shBdSEWHV3BdtDGaQUSxQNJwCv+iZOraJLtHx6zY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJCw4eWLuur+hCONWPq4AKyEyYX84ISMK4H9zScycOxcy1HNTWF
	cUS8dmzIWecTB40UrBimdfNQnpckkyWn5lLuQaSRc7Shb2PI3LjZ1gfciUcKhkDOXQ==
X-Gm-Gg: AYBFou3P/plGxjmIv7oKpGo7ofSgGSJnN5y2PPbcnXuO4IAAql32Qa2x4HDJSiX0DpM
	LTm7r+8sfmSNLBA51lCG1Z/LGBDrklbket5JX3Ig4odD/suXhBVuY7idjoOeUIHp09THPB3FxzN
	LSyd22r39t4SiroDWk7F8RFtRLk2qNAS2Nuvu+bsFiVwf/PnXSV+KWsNDiBYBDsunqiAjm5vhYO
	CVZXeReCv0k95sTdo/uPidNDHossaNr2M/yB+cIfpm5cXroM0UU00IxfDIJSf6D6m7DEr68JZEF
	o+DpGcSj620TLQBL+rthUYnbfdIxTfOgQRLSbu9jtiuL1UnSYP8mrgn1695oGj2MRGSXAoShdeO
	dIoIlErClMZv9kFVVjPl/Ux/dLyE4ixp0ngm4Qzxui/sqFlJbv4tN3srV5Mc7vPUf8/T/hVVEBC
	f//JZtar7jCX3ZgoTcFbSRgg63yCUj+ZUfIBGUT4+1ujKUWDbOnQK+zZtmi/Fsovz/rE1J6BJzz
	A3bKVSYPAAiMbySBF5CXkaU+L0mr4fvtn35o+y/tlXoLwAB1QPz8p2Z3Ul6rJsmuPzJUQMHFxto
	5lyEJCDYCq1Ft2N2iA6G73EizpZNCyERCAkFr3KCLroN4z6e6+U3K9sohfunrelCED3QZP9sU7k
	iVJY4uvBLtT2wJH10g2XdlEURELuhN9HiSfoKloZNkI9iGjchSIwQDwlvSLoC1ZbCfBpXlSqMuy
	D6sSA1uQ==
X-Received: by 2002:a17:907:c819:b0:c41:79f3:72e7 with SMTP id a640c23a62f3a-c419d93b484mr450863866b.18.1792402942396;
        Mon, 19 Oct 2026 02:42:22 -0700 (PDT)
Received: from Desktop.fritz.box ([207.22.61.102])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4090dd124csm348169966b.28.2026.10.19.02.42.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 02:42:21 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	tamizh.raja@oss.qualcomm.com,
	jtornosm@redhat.com,
	baochen.qiang@oss.qualcomm.com,
	rameshkumar.sundaram@oss.qualcomm.com,
	vasanthakumar.thiagarajan@oss.qualcomm.com,
	sriram.ramachandran@oss.qualcomm.com,
	yaojiale02@163.com,
	quic_pradeepc@quicinc.com,
	kvalo@kernel.org,
	sven@narfation.org,
	john@phrozen.org,
	toke@toke.dk
Subject: Re: [PATCH ath-next v5 0/9] wifi: ath11k: airtime queue limits, airtime fairness and a driver TXQ scheduler
Date: Mon, 19 Oct 2026 11:42:20 +0200
Message-ID: <20261019094221.208526-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261018174904.1757161-1-julius@bairaktaris.de>
References: <20261018174904.1757161-1-julius@bairaktaris.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The v4 and v5 covers were measured on different days and bases, so their
numbers do not compare. Both versions on one image (OpenWrt main,
backports 7.2), only ath11k.ko swapped, v4 as posted and v5 on the TX
flow control v7 patches 1-3. One 1x1 VHT80 station on the radio, TCP
download from a wired host, 20 s, three interleaved runs per arm, sender
RTT mean in ms:

                          unpatched       v4              v5
  default, auto rate      237, 242, 242   154, 180, 150   134, 178, 153
  default, VHT MCS 0      530, 536, 541    43,  40,  45    40,  43,  42
  BE 500/1000, auto rate  220, 245, 237    29,  30,  36    32,  37,  51

Every auto rate run carries 92.7 to 95.3 Mbit/s, every MCS 0 run 22.2
to 22.6 Mbit/s. On this base v4 does not reach its own cover numbers
either.

The 62 to 68 ms in the patch 6 table were measured before patch 6 also
pushed the access category of firmware-released frames; the posted
series reads as above.

Julius
