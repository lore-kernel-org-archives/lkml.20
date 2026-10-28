Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793231471;
	b=l81QmyYEqGubB9qEU1E5dBBgESU+bpSh+1J7phiB2X9tR9x/7BXOaiCZMvZe7pb4XlmI
	 BUKOS80xnu0d1yWGd3XYclmlgwaP6HV90Y4nE2nFFtdt6vYPDb8N7QJMmLfU7iR5nsPWv
	 DR0ct/0hJiJtUPcQN7z/q/BCBGA/C+iRMLoeSwIUsylucIKdI0TL/czfFdvHZi1ZgnOvO
	 kso61EmfK2uXizm5XxbigD+TjSjJ6lTbEEqF4TnL+mRYcqZBWcLnOmj1MzrKnGeFgNj3w
	 AAZPmcGWRlhTjtGHqUWCPSo+Ux8ZyKAU1fQwQ6/dvwbnLKEbeYE7nJLoackutPyxfFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793231471;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=lgFFymOVFSBRHf7/adfIU8nmoW/OAqhrDRgNC52A1Jw=;
	b=bcom7A+QaDzxJy2wX64BjANAhmRxVyQpSfLcb/fQDVU6gkGm+QnDygz1tm0HUmtrDMmS
	 FOnmcSWqlboWriFK+prVeWyvl2PLNH9ZdLcY94qDIHbBKhc0Fsffg6KUVSIrqK9x7nmoq
	 CQBOc72BCQJlRaBT0/SOli279//KMbmtEWN4Cd4O6n0k61W1jmZgfJsibti4IXNAYimom
	 GvW5UKdEERhf80eBpXmQLge866NPd8X4wxhcOnRhlZrdmNZ0+C2ekFBLBPbeEC2UZNEcK
	 u5Tou+ddEQSCrPKf9GKnQFb7JGXBHfI/gRQf3ABPIAL7uBw3C4Ff4x6xHq3vmMs4edA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b="cDC2P/qJ";
	arc=none smtp.remote-ip=209.85.216.98
Received: from mail-pj1-f98.google.com (mail-pj1-f98.google.com [209.85.216.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5D8D606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 23:51:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5D8D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=cDC2P/qJ
Received: by mail-pj1-f98.google.com with SMTP id 98e67ed59e1d1-3acb11973c3so1219961a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 16:51:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793231470; x=1793836270;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lgFFymOVFSBRHf7/adfIU8nmoW/OAqhrDRgNC52A1Jw=;
        b=yQ8L2z9rYXgQDxjtjdhHb8pzd5i+b2AFZx4A6R3EjNsOEqlGX7WWQqM6vl12PJGss1
         G8VE91EkBtkbNlV9cgf+kyqQSqj8VBM3daLE25gX6qwoHbYOgyclXj5lJoRHcOtl6akA
         LlZF1iJeTpDc6+4WEOiOBac9dhFByrAQ4MaeTk8622MgN6Y2739pN/yI2bJYxuhp2KJs
         tKVlVK5gBnTC+IA1plZaLjASSpmNZ0Q4UumDtCmGNxAbzEw0uRjhc3C+puPXCeUUSP9l
         ojZu4kQCvVpI3Bxp3YsrirmSiq/QHDLtW3C5qOuvsKxzYKtXxBBzff9T+cUC+V0njMJm
         NQGQ==
X-Forwarded-Encrypted: i=1; AKwUvByMOHKMt0qGqM8nFqoISOTUzWs/4SLKHCpqOw28hHQn+LNAY30Fz1RMm2oVxin91V+T9wZvLd2iLhxohog=@vger.kernel.org
X-Gm-Message-State: AFq9FYLXUnU65M0s33p5pL0XKR6mXMXeXYarzaXbyy3z4LDMY56IrlTT
	vwHLGrcxY6ePqwVEAJXgtHDpzre39ySVY3U7gd8RPbLTKIeSmftfaz8Z4yh92IhDwdAy9KLzjHu
	SLYvJYGPK8ejGDgFDkoUJCD8+cRyE+Wn+49Fd/f8DFXoqwQYt3yZ/tcQqK2dCo7/udTQSped/wF
	Zj2XRBsUtSpIeRMvW8/HdnSA1zka/l3geOn9z41s99fyifsuiy1irEayqP9cn1tW/+fIQt9x5lW
	TFd8mmAkWeI2JwZ2EB0rfKN
X-Gm-Gg: AYBFou19fmuwmUifN5/vyDrGVe6lQQlr2dTPQ7jBbmFDmHOZHan7TIUi+8R4UyChcMq
	yLjnlUNsq5RQAop/CnARojYPGZVV6DH8l+Hnch/rKvlJ5yFcICK6s9ksCK5zmNrWe8X/qRecbeC
	fskl9DFzXQo78wvYw7AJZNpoa5Wy519s72rVdPJcRJHv2uhFmtY/woRl5MnNsHD2vDCpLdUsQLM
	MJ4jTUUS2gPaM+eULmDXEF2f/jufrpE5pB/NS2ZoVIdEwVauPKxtTRw+Ezg1H58GpYlFM878KX3
	y2/4ozxuCIebF2sB23T+azKMUjoNdvWq2MtU3Qe/iRehk/GPw3wDtK4fobMTvMSf2eVONOSfVtv
	yjK42aoO1Xqfl8RRhL7FdM6MN8lMYC3uohK4cL7MCILboRdjpQCzJFiAOhw/2YdpRVh27zBc/SI
	4Nutl2RbZAkemAqoKxB+4Qk3F5bg6PdGCjt64OXQAY
X-Received: by 2002:a17:90b:5404:b0:3ad:870d:1bfa with SMTP id 98e67ed59e1d1-3ae5819bbe8mr2788604a91.23.1793231470035;
        Wed, 28 Oct 2026 16:51:10 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-23.dlp.protect.broadcom.com. [144.49.247.23])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae57a0bb3esm1146720a91.3.2026.10.28.16.51.09
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 28 Oct 2026 16:51:10 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9308eafb465so308908885a.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 16:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793231468; x=1793836268; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lgFFymOVFSBRHf7/adfIU8nmoW/OAqhrDRgNC52A1Jw=;
        b=cDC2P/qJzFUmJCNr4DCFyqHlpVSSWiHOdXPDUtxf0eWtfNiuvGFV6uE69bwN62DQHU
         vDb7Jk11KLcCCJdDynGbfig0cCl6nZDCT0UxW7pJASVuJV3t4cIRU5FJa0PF8hfn3MRb
         /h1HvaP7uh6B46pNHGzU8o8Q50KntatRRYu4E=
X-Forwarded-Encrypted: i=1; AKwUvByGkC8SPCo10FHX16FL1hqXW7NwLlXeGad+V+6T2CGpY81CERPDeEJW2/dphOXyvAyfH3wQyxWMf2uaK6I=@vger.kernel.org
X-Received: by 2002:a05:620a:4008:b0:939:de48:e41f with SMTP id af79cd13be357-94408c97559mr630502885a.31.1793231468611;
        Wed, 28 Oct 2026 16:51:08 -0700 (PDT)
X-Received: by 2002:a05:620a:4008:b0:939:de48:e41f with SMTP id af79cd13be357-94408c97559mr630500385a.31.1793231468280;
        Wed, 28 Oct 2026 16:51:08 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c84ca44e3sm23074216d6.10.2026.10.28.16.51.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 16:51:07 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonas Gorski <jonas.gorski@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net v3 0/2] net: dsa: b53: Fix IGMP/MLD snooping
Date: Wed, 28 Oct 2026 16:50:58 -0700
Message-ID: <20261028235100.3892374-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

This patch series fixes IGMP and MLD snooping for b53, these were found
by running multicast membership/learning tests.

Changes in v3:

- move general IGMP/MLD snooping comment to be applicable to all
  switches, move comments about zero controls where they belong
- added IGMP snooping programming for older switches, too

Changes in v2:

- export the helper and call it from bcm_sf2.c as well as spotted by
  Sashiko

Florian Fainelli (2):
  net: dsa: b53: Enable IGMP and MLD control packet CPU copies
  net: dsa: b53: Enable legacy IGMP snooping controls

 drivers/net/dsa/b53/b53_common.c | 74 ++++++++++++++++++++++++++++++++
 drivers/net/dsa/b53/b53_priv.h   |  1 +
 drivers/net/dsa/b53/b53_regs.h   | 19 ++++++++
 drivers/net/dsa/bcm_sf2.c        |  5 +++
 4 files changed, 99 insertions(+)

-- 
2.53.0

