Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794614406;
	b=BDMQsgWPROykw5286Y/2pITz+4A/TeIsMfxJxGtBaqx60xSrJvjP8g/p8aWN7KcOHJ8p
	 yAbxQaH/nMptJ9Pyt8rLgOwtvZw1K6cjgnxDFGocrvolSj4kHCnU/1+o0kKmqzbCrYPqt
	 rNza5r1yeDVwUYCxPi0SBzg8KxxHyLauEevQH68p8dUQwvT1O3QculBQUKqlizql9ypkZ
	 OnaWyxwSbwS34dxkhTiSbzHkOfZrNRQW7o2scTmF90+AMPKQepnNoljM5SH8/gV27NHoi
	 XJkCsG38QN5B7TeDfCHrzepJphuQ2I9kOR4h3u6pfX/pewgZkFH4n4V9jHYQNQs6RDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794614406;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=IGSul/JbY9ftJg8MsxdaD9RtU8ZYOBU8DTFoA5trNZ0=;
	b=AM94qW2a1Hljep9FB7t33gdOvoD3xSzvWeq3II+aHjbgQssQHMBi/aCyvSWv91ujor9I
	 y0l8mNflRqcVDJeSEdv1JiWbMFXGK3h06CQQU29bgJ+ctTH4s2SMPvNmOBUOiiLFJikAO
	 UWcvwwH15yNkKFzbpve06INAvHjo4gL+/W3/tLV3I4KYzeTlK1VY4nvos/joo13+5rSHm
	 eSJfDNnaNKKIaqTJyF6C1HCj0LqXzWwIN2TpzBgK7LGt4nf8T2+cY35Ns6dwWWI1MhEJ+
	 TGMHpcQ50uvh7S6aAqddQrLdG/+D+uw5259xQeUOQmtmOPSqLjhXV+9KdeFr7pQhvbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mJaSdAdb;
	arc=none smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7167606A88B
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 00:00:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7167606A88B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mJaSdAdb
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c4d5b2db4bbso386195366b.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 16:00:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794614404; x=1795219204; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IGSul/JbY9ftJg8MsxdaD9RtU8ZYOBU8DTFoA5trNZ0=;
        b=mJaSdAdbEeAPm1sF7lZDu7kYW7qI/K86+q0BlhQ6GVJfL00ZxKXBSfPBY+UCO+P1c6
         NS4sQadt7gnuGaElD1jNGCrQ7JF0MiUvbizQMhVIiOfienwz4CZxOFh1E/7Q5PosDsEN
         J0xXgwQcWgkMXmR8su71qgTz77yB3xzVw3+GsJm7nURkFG9HFTz38QKL81RYAFVps5bA
         9Qsmo64v/hdGMk/b/pqPaWwcGzqtPBdrGY9LPcsbBnc9FNxNkLwDgwoWgFQioTNvDHn5
         gXip/HoXB3WgohdKsSxRNSj8bw7a5VbXBkmNog6XS//gY1/1BsaUnxbjjCjISsoDsG6N
         s4Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794614404; x=1795219204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IGSul/JbY9ftJg8MsxdaD9RtU8ZYOBU8DTFoA5trNZ0=;
        b=lWTDCJQIq5ZPzAqiLoUaXPjMPisyGhp1pIuMKCHxJD/EE2sNjeAKO674nxzRBgyJzO
         LTfmnjuDCsD3ShZVxr37s4DZhPDSGVVS6CEtT98wqtmtC2IxhojuaS//063VUpE9HQS6
         lCr/YcG4K1gZGd+WxTRMzilmRLvmgf3do7hb691PEG/3D0x0ncfA0UsKnL5u9XiTeTgC
         G8R4L/Y4l/HaAg5dTwEFoufGcYu0YZKHvj+5dH0Q38d9BhOJrFuzgXYJgyeuodUGD4l2
         NhfK3FFaM7p1fUzWynDXxp7/j+SOtH/zRKEZciCRLqLNWCQjnUTD04iwp6P8kBzeBCTX
         9YBQ==
X-Forwarded-Encrypted: i=1; AL+hErEUtZrh3yzs+fQ+r1kmQp2otZOBTgzMpvWM8LU0Slxx1j3BBRVPChlvGgkX2dvo0xBdS5JarREsmSV/Z1U=@vger.kernel.org
X-Gm-Message-State: APuU4Z8V1T+qZj3GIUxc68GDNvwXUiISrpzL6AbVOlWQDwKdSrzfxLqq
	ORwF0mC3c4+XJhuHGi1MiHuqcQvkyqu62Q2X0wJy0i6n+IIUmDj+7jpt
X-Gm-Gg: AYBFou0fZ5JUKTJ8QtD6Gc70VX6Duyfa42fm9hPtskB7pJIKuuf+wrGgFfgPWXV59Kf
	jDWTbH69UlU28dwV/KH34mg7QhnSn2gDVx1KMD3BCy2PAEK0cNM8Bmc9H4Cn2DhHpfIsHxI/PVD
	sMkLde3MMO8rvG6brLY6qqRpyScBocTUCC7975Lp0Q2L7H1Tb3iY6CPEdDtlXTkMlOumG1MHpcf
	zmhwti4eajG4DuoNk/I8A1YZnlZ2YqbCkx8AXFaF/ekp2xszcZ8IgJVO/wBtySC1VOVeyx+U/lg
	yqZO8HnP1kx+9PDkcnu9pcn9vkGczob1yy8bAqcEtwl3yJdDwG/+PTPJksy3uH2w3fOqF9ffxXI
	oei7S7UV75y9H7BwuCsk4zH3Tl1Cccz0BrlhQoAXfcujK3eUsKmNfGJcUPaGjxiUQIocTy42dUV
	YADRFpExO/XE+26P3m7LotBPaR0jpSRp+Z9qF9qrhCgQFv/v9Ad0Y9BprZmIK2EpBAFG3eqmfPf
	FMMCl+gAQrhdQI9o1i1R+GCmBItoN12C2Cb5Cl9xLEJtg9PdKI2P/dVFbpiy9rQpFzD/LQtp0JQ
	rKhkqFZwcK6QTOj1E4pEVmZgFsizEKlszK8qbaRE
X-Received: by 2002:a17:906:b1d9:b0:c4c:e91f:e1db with SMTP id a640c23a62f3a-c507c439449mr515074366b.25.1794614404071;
        Fri, 13 Nov 2026 16:00:04 -0800 (PST)
Received: from kordpc.lan ([2a13:e746:396c:c600::8f9])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b42782sm156867766b.38.2026.11.13.16.00.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 16:00:03 -0800 (PST)
From: Kordian Chmielewski <kudzo51@gmail.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: netdev@vger.kernel.org,
	Doug Berger <opendmb@gmail.com>,
	Nicolai Buchwitz <nb@tipi-net.de>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 0/3] net: mdio: Clause 45 support for
Date: Sat, 14 Nov 2026 01:00:01 +0100
Message-ID: <20261114000001.518424-1-kudzo51@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261113211554.2058181-1-florian.fainelli@broadcom.com>
References: <20261113211554.2058181-1-florian.fainelli@broadcom.com>
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

On Fri, 13 Nov 2026 13:15:51 -0800, Florian Fainelli wrote:
> This patch series adds support for Clause 45 MDIO operations within the
> mdio-bcm-unimac driver.

Tested on a TP-Link Archer AX6000 (BCM4908) with OpenWrt and Linux
6.18.55, with this series in place of our own C45 support. The bus has
the switch's internal PHYs, which are C22, and the BCM54991E WAN PHY at
address 0x1d, which is C45.

The BCM54991E takes its firmware over C45 and links at 1000 Mbit/s,
ethtool -r brings the link back, and the WAN carries traffic. 8000
reads through SIOCGMIIREG gave no errors. Such a read, ioctl included,
takes 18 us on average for C45 and 10 us for C22, against 64 and 32 us
with the old polling, which starts with a fixed 30 us delay per frame
(our C45 code used the same wait).

The PHY's DT node has only its ID compatible; our PHY driver, which is
not upstream, switches it to C45 in probe. So the new check in
unimac_mdio_reset() never matched, and since the bus is registered
from DT, the C45 scan at registration did not run either.

Tested-by: Kordian Chmielewski <kudzo51@gmail.com>
