Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793222598;
	b=uoI1n4Eqm19gX8HBToF+Xxznzk1FrqOPxgEEBFy6SR6gBOFCjQZw+osdvDZbgxRorP6y
	 GVwOGf0XE42D2j2WIZWHPnwmW88kCfPsHoIXQyAUFeqpfMflqsGLiIUJsolv6LZWInhCt
	 360gGdHyinE6RWvRszSQq+VKslJFCXBhw5y92ULh8MLqwPSkEGPf5J5dkg4zJV4xRqoNv
	 UJnzA3/sLoywgOMfRPufpJUV1aUYcrj3MvivEgu906iI47q7z+DAJLKBiTroUTW1gxAny
	 Ps04vAD3u1tk1HC0/afzLMt5FlerOGQexImq8a4s/jFsKKriGou1nd6fx8goE9oVy8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793222598;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=r7/S1yrh0Xh4BzOz3EN4N+JMRy3rpsmCaRVhbCsIs9Y=;
	b=1ZKNtb7b6AWRqmqsxo0E97DA4qip4oW4tl0/rNXm7AXKmRWzj9uSwvA6Zl2iP8axXQHd
	 ih2kxuAJ2HlnwYEcLCUJgrcA3KBlE12UjWnDh84RgXV9qqVwrHCL5vJSviGjZmrIGaMxT
	 Dh1nzsEx9Ekjw/GCFDzuLk9ThAkB1+M308iHzK9mHEyU3bOKFwQII1X4bGaSjzlGDKoKK
	 7+esL5uC2Nzt+vFQ7EHlpXlXYJwdjNqY5J2A3OcO5Ghirf2EjTP4ckSzyvnBvJ9zC/m/s
	 +Mt+KJi/7mxQqVXrEj6iGlmjqJEwH8gLRrftDmc4ZPF9TvfxTpGCVMCfTn9QGYMEAdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b="dSfw/E3h";
	arc=none smtp.remote-ip=209.85.214.227
Received: from mail-pl1-f227.google.com (mail-pl1-f227.google.com [209.85.214.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58791606A327
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 21:23:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58791606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=dSfw/E3h
Received: by mail-pl1-f227.google.com with SMTP id d9443c01a7336-2e99b1e5b4cso9583465ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:23:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793222598; x=1793827398;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r7/S1yrh0Xh4BzOz3EN4N+JMRy3rpsmCaRVhbCsIs9Y=;
        b=2LwGOPaCfMKonnX2mIQSVGp+Hz++kpdu9MS6WOGyEhIWIUPswinRrw9DOXVTf0vS+s
         7uYiuGChTKeu+mlCLbtVkBR9N8Fv3ZcnwiGw5gbV33y0CTogE7HR4Bz3SUSnxCcZh23b
         9yVbQUPiszKq6KF8anIbL7hcCchaQkTWvAM2VZHrwQot/fGWunbaoGWajriPRUivhSFa
         GEb6CePOZnHJUyrjN5hbyBD9xsXFbvujw7+OoGxafmD2RyPz/qPaTCm2wQbPDahozWyh
         KmY+gYEukwKMoQatK3ZC8TBFsfJStgETZMHE3gu7iU/BCLeVsYFiePgGxxL7OMXY7yaY
         gXoQ==
X-Forwarded-Encrypted: i=1; AKwUvBy/lGszhR7Q7uxMzva/0Twb3q1oujTkau/AgR/bbKpOtokLaWLRciXBH8MoQrRC8pE5gi5iS5CY80o//6Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYJET83vmqCO9diC1NRCz84RYT8fvcgukCXqZFhbNsUHXeXrWZ4p
	J8XDAwDs8gyoofXbI1D7lvPyZYqdYVCA2FFmO1gqyNzW+HI29e0Iqs3ZnDFqQA1crIzSw+n3Omg
	PZZ/ocPISQSHKaIY/cMlxKh5ugPt8xHMQgwpQlUi8En25Jk8CWqgHJ0LhM9rK9BLEyGTNpUl/jx
	Dm8z32rOewoVW8xjKZdHavy9Qoz8/zKU5Fueh3OL343bG0w8KXOK47fl40dm1g/RvjK+fM9dHqG
	ojOJrRySvmt5mVzF0DX30Cx
X-Gm-Gg: AYBFou1/hCjZGWkJAe+qo6gJsOEPARIU4nvHZXGI6h6apLfmB+l3fD/c6kd8zhrdT5G
	bhBKSOc86PLZHFpTvr80+iUuOFfh95HRhkDu0Bw7ihVRpQNuuy0auPeT6zWoqc/5vNgByKI+Eho
	eCwb+1oj4q5GFOW3B7eATTnbf6V0KLIaLid+ezqgHuKQRO1c10xJHhoJSZ4RLVI3XffQlQbdzHM
	TgLyeFdCyJgZB41qz4JHgL6fic1HCwn+VFKKGil3m5SypWVr77Bd+miJLqEK4uweYZepqxTsmq3
	2lRcnRHnZeVsQsaBztvNDhkEtM3oF7kYYbOtkr8ivllt/IJxJrwMMA+YT8CSX+IkkipWndGrkRn
	GOF2gWNjUv+RjVtCmnSrlZArENqPhcQ/WMMvglJ+ZWAZ/yGSSTUnzLi+p18IF+/IDIPo/cwnQv+
	EcRCleaP6l8JBY3WosaK2lLhYgySbfVezsHwLOO6wX
X-Received: by 2002:a17:90b:264c:b0:3a4:fe48:d410 with SMTP id 98e67ed59e1d1-3ae5811fd93mr2712179a91.30.1793222597615;
        Wed, 28 Oct 2026 14:23:17 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-23.dlp.protect.broadcom.com. [144.49.247.23])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae6e1fb921sm546828a91.0.2026.10.28.14.23.17
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 28 Oct 2026 14:23:17 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91c84af45c8so18235866d6.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793222596; x=1793827396; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r7/S1yrh0Xh4BzOz3EN4N+JMRy3rpsmCaRVhbCsIs9Y=;
        b=dSfw/E3hAq6aXElazM9z2ErlpBFRtIhBYszqqDWBvGgmc/ltuipTXWVAHfYKP4U5aL
         6R25qFumJqNuVjAvjg8wRACR165qCuiUaz65asN/cBXiPLF0yIxQb+P8DT40BHdhT2Aq
         l5ZsBqjFNEWafjP+2jX1jeS41MNSxst0oDH5I=
X-Forwarded-Encrypted: i=1; AKwUvBxdFMrJknyFzisXcs/fIdpQwRsiYYYakZ00qlURDCbXNQI4zfIeVIXyQSpK2+AMEE0RmBY6nne1WBl78og=@vger.kernel.org
X-Received: by 2002:a05:620a:2906:b0:93b:d7a3:45cc with SMTP id af79cd13be357-94408d03ea8mr517635985a.53.1793222596304;
        Wed, 28 Oct 2026 14:23:16 -0700 (PDT)
X-Received: by 2002:a05:620a:2906:b0:93b:d7a3:45cc with SMTP id af79cd13be357-94408d03ea8mr517633285a.53.1793222595965;
        Wed, 28 Oct 2026 14:23:15 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-940f0669112sm1368755185a.10.2026.10.28.14.23.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 14:23:15 -0700 (PDT)
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
Subject: [PATCH net v2 1/5] net: dsa: b53: initialize the jumbo frame size register offset
Date: Wed, 28 Oct 2026 14:23:06 -0700
Message-ID: <20261028212310.3847553-2-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261028212310.3847553-1-florian.fainelli@broadcom.com>
References: <20261028212310.3847553-1-florian.fainelli@broadcom.com>
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

