Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793394988;
	b=YymUhiy/CMaIO0M3766u6IUN0zKp/Eq5hNwkzbJr4E9CQkPJcWymMOAiYHflY5sT5xVK
	 cSCPwa0g7ZdNC8TPxgIZEoTtdAvTR0aEFsp4tKBh94pRyk1ETqkmw5AFqlxmaszh4knaf
	 qZZiYeCU+qPbkej2nSqhFwKOZzM9Hc8vt8JEms4WauIdAQIq0uDh+juuLmRW6B/ge3eBg
	 Wc479PPO+TF7W4ba4PJmO9W7QuqEvFd6cCTYlKr5NgPuBrGT3px14sLii+cJ+6hhy1mgO
	 ftU2THpXXvbi6rAFRxKIt8PttDK1MQD9bW7Vx78yalyf/pS/c2DexWuh3EHWShyrOOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793394988;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=wh0SeQdNWzsZyoJ4vl/0g4hHaNPzl6qxcqRd7BCWar8=;
	b=iDxkHnV8yFqBflFwu3JsX0x5WpRXwU5r9FCbdJV7kzjVTJdeYfFqSplWL+vfFTSyS2b8
	 13vLuXwGU2g/tPUGZ00CX6PBphlVSkhhydCsbQgVmX6uifKN2iPaeDhF3QEMlSTKq2HUX
	 1fY77qKdQtwWIpxZzMuzw3tEgqM+nCPfZmq/6hNZZB9EnBnsTLvdUDYPlIUUQ3/W33x8+
	 +/xwRGjD3+9bYztoTkOD0Dvk2G2s2esAG4jkj1nntPadr5ka6TodJbY0A62VQ06osEoM/
	 dW9Bt3Ku19jxtcG8DEeATJQ73o88VfXUh871vCiPqKtmDxKEnCY1+zpR9Z95MtGHTZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=LRwUa2Iq;
	arc=none smtp.remote-ip=209.85.217.97
Received: from mail-vs1-f97.google.com (mail-vs1-f97.google.com [209.85.217.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E918606A31F
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:16:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E918606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=LRwUa2Iq
Received: by mail-vs1-f97.google.com with SMTP id ada2fe7eead31-7cc53938a8fso725140137.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:16:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793394986; x=1793999786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wh0SeQdNWzsZyoJ4vl/0g4hHaNPzl6qxcqRd7BCWar8=;
        b=NgKmg23pE+j2CwGOEE7hZrU5pM6B76SyaGXM5sgFRQyJ8tyRscAU0A0mUUQIJVhYil
         6qrssva2TWjuNoLyCYgAqRrdRCOpJQd4Q88hxpSvng73unwIYQMyJVcnKnbnai1PhMGz
         FEh6P75lVHYOFbU/cGBCB+8gtXF4o7O547n8kW1WGfmHoQZbYLzV/9UtXSzDs5OoX0sI
         1EhNV+5yujeyFbY4O9iRPjn5hb7hSiSY2DUKgbgFujj9NkSA040juBdmiWFPp2d13u0K
         oB/cts8xA6oD8JKMEDmtrIKFM2XX48y5L9ONuEYLENzqvNl6joaEWbMMrhKNrfr0/3s2
         KSuQ==
X-Forwarded-Encrypted: i=1; AKwUvBw6OnHzAeUrUzRGLOV3L6mjKj91lFuFbcUwkn4ZmV2mnlnWBvsctpnDnpy+yZm9rn/ktqIPlvG8HyCJQJw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIK7KCrmEW1+TXMKaJjqRq3hosOAhVa0NvrCZQ5oRmoObWHLiIQ
	GhPyXJsFG5wsMvvHW+UtMAkMnqh+3dcfb06upvy32e0GquC4E/+D329k1EH/idmQc/DVnNdugpq
	rP7sJTrKgF1QUt648z+RcktiLJCcsw98ZkMiOpsDjPBiuRBZ4+RPjcE07fcsrt2Uz/CroA1rJvt
	R9dpIZMEf7WSOYaxHTm/01ZVKlTPmC9hqhlZSkyDf1fBAycZfE1FAIfxRcQC9s4zM05zgwsk01X
	++hdlAevILBFb0GxI4IFKTXnwU=
X-Gm-Gg: AYBFou0f1QS30zOsUhwfSbxzSc9lxKRzhnK6+dupDSAItYwJFtJaa2HK+N2ak3iwQZK
	rQvNIqysd/0UGM65H/dnb+Qvxb9eI8LWDcAubFlnFJ12P0hosxQTjqJjGYTxZZssAZh1Gmvi7lW
	Xjb25vjkBniy2aspowxXzkx3e0JmW2yZNFE1FbtvWSM2KLF6mrOfMfXKnUDeKxAx31SNcin3pfq
	n5d/4CU+1fmMkEZ6uHZm0N0bEZdzVKBjodbNPmCoSCo8BhIB/mUzDq74n8VnbIX4Ad3SuZFjrQx
	SfbR6HQT75LoMD7XRww35QTRSe1jOEpbuU7sEJk82xldSrIrTvnklzLjThi3Xlqsxt3cZK6XcyB
	j3SMkYClAf94TaCvbOV2ot4/v2I1klUVryGkl3rsNpTLmMlN9d48ekTayFlkcRGVZsUc3rx2WBU
	zu9rVqUpgvbYEmtpsRL/e0E8jeqUHxGUK8+HLH9EX7
X-Received: by 2002:a05:6102:578e:b0:7cc:2fd1:7122 with SMTP id ada2fe7eead31-7d072c3295cmr1971940137.18.1793394986434;
        Fri, 30 Oct 2026 14:16:26 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id a1e0cc1a2514c-992ee3b0c96sm117723241.8.2026.10.30.14.16.26
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 30 Oct 2026 14:16:26 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36a1e2485fdso2731522eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793394985; x=1793999785; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wh0SeQdNWzsZyoJ4vl/0g4hHaNPzl6qxcqRd7BCWar8=;
        b=LRwUa2Iqd8B6LLZctA6rXiL4e8vN4/Ai7p/i8Ae6VTlLAspykxkPVk9Q6Atz3NDqO4
         o/6vIR0Gk5GYFHPy/APTqM+mCCT09cL6kgrs2NKQM0lrmvFkzARIX2rtX5C0Y1z5i4dC
         2N38BIxImCVOHIBQLlKwfbSbfseBJy9hA5rpE=
X-Forwarded-Encrypted: i=1; AKwUvBxYSNQhbLOLI3Ckfqj5kwaddp5xcv/w5HNj5dYRVLY8ej1Piu4tKLbQH5rjYhzdSJEzj0PYhB4qbVLPz/s=@vger.kernel.org
X-Received: by 2002:a05:7301:152e:b0:366:83dd:4713 with SMTP id 5a478bee46e88-36a4249ba39mr4582329eec.30.1793394985245;
        Fri, 30 Oct 2026 14:16:25 -0700 (PDT)
X-Received: by 2002:a05:7301:152e:b0:366:83dd:4713 with SMTP id 5a478bee46e88-36a4249ba39mr4582301eec.30.1793394984512;
        Fri, 30 Oct 2026 14:16:24 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42935b4asm13513535eec.16.2026.10.30.14.16.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 14:16:23 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonas Gorski <jonas.gorski@gmail.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Vivien Didelot <vivien.didelot@gmail.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net v3 2/8] net: dsa: b53: fix the SRAB grant timeout check
Date: Fri, 30 Oct 2026 14:16:11 -0700
Message-ID: <20261030211617.288562-3-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261030211617.288562-1-florian.fainelli@broadcom.com>
References: <20261030211617.288562-1-florian.fainelli@broadcom.com>
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

b53_srab_request_grant() polls for a grant up to 20 times, but checks for
an iteration count of five to detect a timeout. This rejects a grant
received on the sixth poll and reports success when all 20 polls finish
without a grant. The latter allows a register access to proceed without
ownership of the switch resources.

Check for exhaustion of all 20 iterations instead.

Fixes: 967dd82ffc52 ("net: dsa: b53: Add support for Broadcom RoboSwitch")
Reviewed-by: Jonas Gorski <jonas.gorski@gmail.com>
Reviewed-by: Daniel Machon <daniel.machon@microchip.com>
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/net/dsa/b53/b53_srab.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/dsa/b53/b53_srab.c b/drivers/net/dsa/b53/b53_srab.c
index 83a03fca142a..f4689078ccd5 100644
--- a/drivers/net/dsa/b53/b53_srab.c
+++ b/drivers/net/dsa/b53/b53_srab.c
@@ -105,7 +105,7 @@ static int b53_srab_request_grant(struct b53_device *dev)
 			break;
 		usleep_range(10, 100);
 	}
-	if (WARN_ON(i == 5))
+	if (WARN_ON(i == 20))
 		return -EIO;
 
 	return 0;
-- 
2.53.0

