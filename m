Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794868698;
	b=mT/RlFrz5VNNn4Cb1Uxk/MJp0kma25i93Tgur+XTFHPmHIM8uR8H0f7tyCnCasRieK9d
	 qZXM/inHXqH60URYkNhImboLgF947sqtFuCZElK9I7c55GK9hQ6KwMuz6PmMJM+NFV+xZ
	 FYMEdNqSn85zn1D5RX/XixtyeD4UVQr+8guynjlP5//8dC54vVYlrsBZbKrA9M9i0Qsd0
	 JswITTUgynfqZy0VVG0fnX0FPeLb+oQxZ0qgHT+6hMVWczdeEK1QgYreyt8TiWR0aJDtE
	 mly9NBKU5gkANw3PEZFeWUqQGVCTTfrj1gJfLLedLOd8ObgpLmwjIvLJYgzvfErZNpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794868698;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=y3Irv8gnA50dP3BHRAY1GWOYLzyQzy8xzre6UHoXv+0=;
	b=QdTXNQtVcLrpoOJ5UGTIqTC513aJFbhdwW4dRdGP3s10IBX+42mDwEy7KZDsdtqISR6t
	 ULoo5kT3NFvYjJW1zeqB8mqrFa3LMVIoEYwI4t07ejknsCiPlZnHzpsDPjAHNxJyOpgkV
	 8/uNP3Lx1r0uvigcBmkENXogAtwVKt6Gfw8KM9QN9R+Z3uxNd7bcyyey3Q1K2sYAxCMEO
	 vfU4yn42gImXsY/hhVA7EQCVl1Nv6mNqhpZ1MNnON9IpgPL/pgCRYp2RoirAKB1Tz2/OL
	 nSFqBW88j0+CCHhhnx6b6+0dRD2p8d7JZJr94hRDuedWlQhJtLZPU622qdB6dYR3DDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qjjWXvcq;
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A2D4606A897
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 22:38:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A2D4606A897
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qjjWXvcq
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c247f6687dcso717255566b.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 14:38:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794868696; x=1795473496; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y3Irv8gnA50dP3BHRAY1GWOYLzyQzy8xzre6UHoXv+0=;
        b=qjjWXvcqKWNa7pAFOTMeSE6B2E+p+77wVXq2bS4Pi1PE++2wSGnEoBRlgM+3A9D0Wc
         tyoIyQeOOvVrA8Dno7mwLd0Z8XMk7nbR/jDTF85e84bRPnvTPiEUFWKMXnJ8UaxR1HET
         EsqDajdKiZx3jQuyeSiQKtxi/+Oyrb5y+HbvAzucQnqTmipJQhPtV+H8e76cIVTehMz3
         kzCAEGluYQyccyGiuuNznVXh4ZE/KkENATQLypnvtX7UzLYRBjM+FkAJr/lAE0OS4oof
         GKFYzi/IWidS3d0ozzjmHXWkpk+d5zLd1rAN7kAmW6hVCZevXoI5oxuRnJC1tskIpU5Z
         /JvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794868696; x=1795473496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=y3Irv8gnA50dP3BHRAY1GWOYLzyQzy8xzre6UHoXv+0=;
        b=BVevo0tJPYigHFFl+xEmWB520sL+9r4X0pdXXSmLQY/OKZDInDBP4UbSBDg91PtE4R
         RWufXCuKzYRik74KGKFz/qxsqItfU16SIeWA4ehkXErXa8W3oxrIVI6izOfIa0PVDf9t
         z62BVvh+GfEEjnMJtZnv+zFmRzvKUQnTPS6k2YLXgthCjtHcxAV0LSyf5sZ4nbMCM8Bf
         0e/EPA9jp1iB+t662Qv0e7KNnEfqsr07sSvaHcWHd0z9lDy+ttQ3gQnDMejBVPsX/qhZ
         Zhuss8VGlLkuyJ4jLdZfILrWNAckhoXRAhevSzyiBDks3sAC028JCqRj43AgkoqpVTbG
         +yhA==
X-Forwarded-Encrypted: i=1; AL+hErFfgSAGZjPdlekiDOZua3+pxdCEtC9IwQ8vQTltd452C1Ds5Fc4oedYVoLhbGod6JLjdRetflgko8kxK4o=@vger.kernel.org
X-Gm-Message-State: APuU4Z/tVdKpvAlIPtc6ljSg6IsAwYrEonEV1f83qrZCaVsPspvrmTZW
	XA+p7mTOzZYYW0CtsSIvYbo6c7VnWgpRUz2wWKUsNnNpyA4Lfr37v4Jw
X-Gm-Gg: AYBFou37L8u7FAoPb2C0gAh73mhCaYVrnQXh9kxRiwD4uh0yoiFgHkn06HDU9MkF/JM
	kSFPxSfqVxrLdlvPTw+AQ8SvCFOVGso0hgNkL7SJXX8I0WvzzlEr1vW6clY3gFCyVsXQzJkBblc
	nObFISaNqr7W1O8h6w5LQ0t8osX3f7Rf+cqTMbYIV/npIDoSIsuY+moW1bSmEfCmV9Ey3x3Qodm
	pHFZpHXf/LTM7PmZhpXnjnpsu05L4XQFfYcRrsVzW4jd7hnNi7GtEhKp5eI58IvowwSQV9q5qWW
	MkWLrMiP5+HUhHtrnF/YFmSr6cZrAz5AZOsmikuIfhXt4PGgvhIBGJDMe8Sd9YyfGdX9vh4fCP4
	ZayixBwvQwy5pVJwfoTby8ieJqA6suJOKAofZQhELLMq7Y2AKQ9ZAy0r/qfj4/yAFs0PY87UWvf
	oPS8eEkvGOmJFaJWNPpr6j3CXT0rmDchvkHemQGhUQmko+tCPEqzULjD5D/lDtYitMvmDNupQQ7
	q4tlVrRlD61uW9wNfIlsBdlfg3pkLQ876oR5/0vKb3W5a4aHrMgvo9X/vDqNAZKsk7lmC7J3j7w
	UVBgTk6lzsZqrBM4Su0sayYwFmX0/z2gyl5vO8RB
X-Received: by 2002:a17:906:dc8c:b0:c46:ba0d:3728 with SMTP id a640c23a62f3a-c50963cb4aamr942275966b.18.1794868695442;
        Mon, 16 Nov 2026 14:38:15 -0800 (PST)
Received: from kordpc.lan ([2a13:e746:396c:c600::8f9])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b7eb14sm477805666b.75.2026.11.16.14.38.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 14:38:15 -0800 (PST)
From: Kordian Chmielewski <kudzo51@gmail.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: netdev@vger.kernel.org,
	Doug Berger <opendmb@gmail.com>,
	Nicolai Buchwitz <nb@tipi-net.de>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net-next v2 0/4] net: mdio: Clause 45 support for mdio-bcm-unimac
Date: Mon, 16 Nov 2026 23:38:13 +0100
Message-ID: <20261116223813.980043-1-kudzo51@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116213449.1682731-1-florian.fainelli@broadcom.com>
References: <20261116213449.1682731-1-florian.fainelli@broadcom.com>
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

On Mon, 16 Nov 2026 13:34:45 -0800, Florian Fainelli wrote:
> This patch series adds support for Clause 45 MDIO operations within the
> mdio-bcm-unimac driver.

Tested v2 on the same TP-Link Archer AX6000 (BCM4908) with OpenWrt and
Linux 6.18.55, again in place of our own C45 support. Patch 1 needed the
context of one hunk adjusted to apply there, because OpenWrt carries a
hack patch that adds a function right after get_phy_c45_devs_in_pkg();
the added and removed lines are unchanged.

The BCM54991E at address 0x1d, which our out-of-tree PHY driver switches
to C45 in probe, still takes its firmware over C45 and links at 1000
Mbit/s, the link comes back after ethtool -r, and 8400 C45 reads through
SIOCGMIIREG gave no errors.

This bus is registered from DT, so the C45 scan does not run on it. For
patch 1, a test module registered a bus without DT whose reads go to the
UniMAC bus and whose writes fail, with read_c45 set and phy_mask leaving
only three empty addresses. On this UniMAC, a C22 or C45 read from an
empty address fails with -EIO. With v1, get_phy_device() for C45
returned -EIO there and mdiobus_register() failed with -EIO. With v2 it
returns -ENODEV, and the bus registers with no PHY found, as it does
with C22 alone.

The new check in unimac_mdio_reset() still never matches here, as no
node on this bus has the ethernet-phy-ieee802.3-c45 compatible; the
PHY's node has only its ID compatible.

Tested-by: Kordian Chmielewski <kudzo51@gmail.com>
