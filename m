Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793394841;
	b=cCWWHj4ssmPHxSdit8ooSn55LShZpe7tHjzMvlO699/lEsFsD0lxPYjbbXe78cTI5HoU
	 lOrJ+MF4e+MuGwpjsYYjx6XMuvutUvAjL6IpXq/GmNCegw2z5OmJBbnnIGcNPg8sLYXPr
	 hNa29ELyD0W1E/ulgEFqIj8th+9iOiAhxP++Js7M84uifBFxY4VY0BK4MAA+8sN+CEnaZ
	 bCGmPeg7NSUNCFPQYmx8gw01H3UOG7YCMiiThqL6x9S0mq4DyhiR4X3q9DhaW06d+PBBP
	 TzJyyDCkhKJFxTUKBY/g0PsfGqi+SBfs2EKJ4ZYJVdifLlu+Z8SN0gsTfKiDJk4AvEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793394841;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=r7/S1yrh0Xh4BzOz3EN4N+JMRy3rpsmCaRVhbCsIs9Y=;
	b=kN+a++L2yQevmrp/my0YNZcPaagLzwMHErhHgF/xsL9vmB/R7pMXQ0CUNOEdNFVE6jz9
	 OE0dtMYjLrJJIYMizNPVzWstIdGmNeANVRB+THXkKktk7LPtnYBnMnurgnladpYMmt77J
	 0PoCQVNmDZ+Mwt7RQM0pTIN27cC3G2s3FpMc4EmEv1eTZJPKwa4fYrP+mM9feTRL5lma4
	 /sWYXBkf35cGXfWVRSmizOqjt8HB0T+XytVLJIDyiWW5mVPn/oygI0Aoey4XfjmAHro+S
	 0g+IiSc6j2VyUtyBiDZzCGCq2zQLnm0FAftCs64SGeQROmgT31nhzTOW1JcAj8bCe4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=RaHcKpl8;
	arc=none smtp.remote-ip=209.85.222.226
Received: from mail-qk1-f226.google.com (mail-qk1-f226.google.com [209.85.222.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 029BC606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:14:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 029BC606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=RaHcKpl8
Received: by mail-qk1-f226.google.com with SMTP id af79cd13be357-93f079a63b8so117422285a.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:14:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793394840; x=1793999640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r7/S1yrh0Xh4BzOz3EN4N+JMRy3rpsmCaRVhbCsIs9Y=;
        b=IyxTaWJp/i2OCPvL0CoJ9AvCGeBn6h2YIx8wHuxUfVkVIWOsfAtOfupogYKTeOX26a
         Hu3FrC8fJ/YZP7vK1+zG/kcUyFdu1ltGgA76HKSNrt8r9Pd4zNhSreekD9MmES5Edgt9
         M6/KgdB2fXET5aG2ISF85EUYnrBC1j9m5F9RELJcyIFGNp7UId/MwNjjW2b7siZcFwcH
         9nkoXh3pezS9JZ5UbtPZo/aQSeDimjsnABVwrsL5rEidzHKOS3Rdu9QjXEm4ZHKJpx5u
         pgCRm66Lm4uQNyZEKNQfvLtSnPKIiKRFT+Z1DAwB8+ytb2dkdkf/0L9OS2eEFrewevWk
         abCQ==
X-Forwarded-Encrypted: i=1; AKwUvByIfZK8h0//AALMQQMo9cel66llAS5rmbUwmXD/UbE7H7o4dETwo6l1+8ZwHyCbEEpGxuTdyT39JbMK8mo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKYXvpAfnhCbFphgppi2rkKMhja+v91Sesui5ykPH5IWB2jx6WV
	L1akJs6XSbeKhxxg14omOl7gIjWzk6LM2WY5tVm/sl3k+ZJjqs5LgFGtLJeELQvnljjiWx9dGqG
	EWvhCb3cy99fqHP6S7NtgWHRBpvz5qIvtbDLqKLTLK11PLCdAqL80TY/W25JYqm7Il/Aen/avi6
	RzhnkhRdGKsmLYKZkykgL9APHFN+41172u8qOnYEnfAhmnHwHb2RZzej+xwjkirRs3FnZNWbiUg
	JRbvhCCFv/u5gtzR3XV7tFShvY=
X-Gm-Gg: AYBFou3DG+SOGHJ/PPU4Q2R8FEjTuD8nHraJx+CDpch2tFce6unNpnSeIxGk2roa/HU
	qqWlWQzek3QG4/W+GvmrNv8m3+mQPJ056OAVhuJsLH217WXyK3FJTcDEQgEo7Cj6p7Ydy7oD7Wv
	0Rypp2aOBqgnk6hNZtIIPLAhED5mq32ixkOTBf0pCrJvSFzKsQA2Aw03lR3KCe26PXPJhlE+Q7Z
	hji+Bz6tSmbmHinrx0kB8Mv8L5USeGnsqsIzJT9i0xe1RWF0Ndw+guPPa94raJ/RRKDq1dG4lQK
	myb1+Pt7yaRahcVSnYWRtPpC1OpZ03n6e9x+f25tLjRmSOutkWrof6RKMfJ36ZFyJhVOtMmXAxl
	8ewna4nmdgYgdc8kgcASeQwSNnXXFSog/dCkrqaVc52HW0hUHM+DlXjowfP+oSad0hwZyNWs9Tv
	shBB753r5ezYCKkG+LPMWJWSeYBvtWogaOKC92b0LQ
X-Received: by 2002:a05:620a:2995:b0:93f:1936:b20a with SMTP id af79cd13be357-944217eea5fmr597409685a.76.1793394839920;
        Fri, 30 Oct 2026 14:13:59 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id af79cd13be357-94425807f2csm28454585a.12.2026.10.30.14.13.59
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 30 Oct 2026 14:13:59 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36a1e2485fdso2726358eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793394839; x=1793999639; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r7/S1yrh0Xh4BzOz3EN4N+JMRy3rpsmCaRVhbCsIs9Y=;
        b=RaHcKpl8UsAkdGHP03D8WbCKw7SXZ3DUK9osDNmFZ0OrOmddGG1Y5VI+E+ErFHfxT5
         BKhznPF5HQ87sRxC6OKJMem9b6AXCoVczLeTFwS8UP1s4uPe4OSi2jOV64F3IkuSaV/0
         I/KK4x2qbuw4o3/+OB4h6fMStVShZOO2z8Rrc=
X-Forwarded-Encrypted: i=1; AKwUvBwp0RZrIotrFv0hhCk/uOh6UAKlblY2Ho9T5avxLMQbPSlnMa/87N5XE74h9VZCG3d1IA/wBrjIs0RQb1w=@vger.kernel.org
X-Received: by 2002:a05:7300:cd90:b0:34b:4b99:24ab with SMTP id 5a478bee46e88-36a42454b8emr7287577eec.22.1793394838484;
        Fri, 30 Oct 2026 14:13:58 -0700 (PDT)
X-Received: by 2002:a05:7300:cd90:b0:34b:4b99:24ab with SMTP id 5a478bee46e88-36a42454b8emr7287512eec.22.1793394837655;
        Fri, 30 Oct 2026 14:13:57 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42669128sm10574595eec.3.2026.10.30.14.13.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 14:13:57 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: netde@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonas Gorski <jonas.gorski@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Vivien Didelot <vivien.didelot@gmail.com>,
	netdev@vger.kernel.org (open list:BROADCOM B53/SF2 ETHERNET SWITCH DRIVER),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net v3 1/8] net: dsa: b53: initialize the jumbo frame size register offset
Date: Fri, 30 Oct 2026 14:13:43 -0700
Message-ID: <20261030211350.287566-2-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261030211350.287566-1-florian.fainelli@broadcom.com>
References: <20261030211350.287566-1-florian.fainelli@broadcom.com>
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

The chip data specifies both the jumbo port mask and frame size register
offsets, but b53_switch_init() only copies the former into the device.
Since the device is zero-initialized, b53_set_jumbo() writes the frame
size to offset zero instead of the chip-specific size register at 0x05
or 0x08.

Copy jumbo_size_reg from the chip data along with jumbo_pm_reg so frame
size updates reach the intended register.

Fixes: 967dd82ffc52 ("net: dsa: b53: Add support for Broadcom RoboSwitch")
Reviewed-by: Jonas Gorski <jonas.gorski@gmail.com>
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/net/dsa/b53/b53_common.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/dsa/b53/b53_common.c b/drivers/net/dsa/b53/b53_common.c
index 0880310c9ce3..559d4b360c82 100644
--- a/drivers/net/dsa/b53/b53_common.c
+++ b/drivers/net/dsa/b53/b53_common.c
@@ -3109,6 +3109,7 @@ static int b53_switch_init(struct b53_device *dev)
 			dev->vta_regs[1] = chip->vta_regs[1];
 			dev->vta_regs[2] = chip->vta_regs[2];
 			dev->jumbo_pm_reg = chip->jumbo_pm_reg;
+			dev->jumbo_size_reg = chip->jumbo_size_reg;
 			dev->imp_port = chip->imp_port;
 			dev->num_vlans = chip->vlans;
 			dev->num_arl_bins = chip->arl_bins;
-- 
2.53.0

