Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794282635;
	b=Zz2g5QQvHbd/uCZruQDpKeNVk4N1WXW50ZKnIhsNR9z9bVmxuiFl4SLxyFFef63mAaWN
	 EM+kPSOWuRO3GOdsQC4tSKIJYL6mYCxiZsAFi0S9T4+wxoDlOJW2UoPkSPP0tEQko/jL+
	 4Ki8zElnP7aZKsMDxkClBz/SCQlAkSMwiqOAY6zhMn/PxfZqlY2br+6vsgDHnqs3g9UHq
	 jzK4x244+6dNjO2F7cJp8w/bNwQR/03fcUO1EkJi+x+TmawPoEFimIbFHweXb/HYgUKyH
	 l0Pjq2zVeBzZ/ZkkAdBSSzgvLHuFV0ljtuXWgtLO+5IudBEAh0JujW1iuGTyMsG4LXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794282635;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=F1nWwBgmaBdULC/P07cKbjOH87XcJJ51z/HTXJDp+iE=;
	b=ABk+YDnu/WrkTzICMh0ge6ahPQp+d/1WXwDpXQQVjVYUIgRHPq5j3Pr0J9liV4eM0wsX
	 lI4DY8/7U2V6i2LO92lh8PRAlKD9I6gtIG3sBznKGBt52VWnt1XULHhCTPkOQXfMTrUhA
	 d1Kv00nQ+pd0+N6F3C14I6+KWgpzQYdO7/bV5KrxQmbiY+pLXyEg1gvprF7W1HwV7B5cK
	 D/rzgcM645t57J9YckMMox3OHdn1e7vBPNXPvEdKHg6EOsyO+zYuzM8RDWXa5NJUNScKS
	 SRCi0S5QL6vO6rQ524Yo0/2fBq5wDh+ucWInG53BVMKw6/F0H9ou4VQvxNkpHIHo4zw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b="Qd/KyMiW";
	arc=none smtp.remote-ip=209.85.216.100
Received: from mail-pj1-f100.google.com (mail-pj1-f100.google.com [209.85.216.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 196E460A2636
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 03:50:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 196E460A2636
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Qd/KyMiW
Received: by mail-pj1-f100.google.com with SMTP id 98e67ed59e1d1-3b0d09df973so1197897a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 19:50:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794282634; x=1794887434;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F1nWwBgmaBdULC/P07cKbjOH87XcJJ51z/HTXJDp+iE=;
        b=p+USulPCzglbr8EtD1vWYXY+7jZCUChAV5RwiAysZnT2P44xx9UdaIw2ShvXQ80sd9
         9VlN7lj1brogUzGD2recYyES/vNbUlyUj4JKmHCpJVrC2SpsEp5BEFUR6XrpebSCmM1T
         IHWL7my0BvXKNhKvbNf10dOBtyIMYTJikWEFH1qEQxXrCs6Rqs5fiZWQVqMwsb6ek1ai
         emyMGsdTAk+kVniet88DYyNzLrOtxPpRPU5iUk1a5wCHzAkXvcKQywjE00vMTqaAe1bx
         vrAPqfTVL7XG3cAjZPHY+mNJCPNVA6hKIPdP3w5OYftUuq4YbT4AE6O52VKQBQzj8mZE
         uYUw==
X-Forwarded-Encrypted: i=1; AL+hErEHnC4lwkrz+BpmbCY59iAMwVZH+ne1RtStGDyNR4rAUEFAlMEHWXLoJsfbPX/GezQ4fdbVw2rgz2C6kuE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+FlzqXFpSQBbjNv+ltOnyyagjwHjIABXEjx05IW3D0x6z2/7YP
	iZhDzxv1VFkBy/N0EBPOBRdQ0MNYJ9/nZQQG5YmAKeO5f5vn6WZfGXDJm2tGLbP9UGfBpuBg0Jg
	zbUmLpsiF0FtKEfLdzLeJZfAjvTpYj2v7UYp/+ReodSyxVJAGp3j2D6Z4hv91KJMSkRJiEltB7h
	72HBSoYl0vH1BVfh7+JUfsJ/hAtAQJvTuw+0EFTSJYpgXOq423TPEc+th2udv++72mDJg69nHnj
	FfM1ObXUByZT/7mjTnxl1M0
X-Gm-Gg: AYBFou233FPjpr8y+ie/lcL0XqydUv/BA5j5Dxv3XUBufHdh1n9F479JogsJXxlZhtk
	urVcf08J9fcSjq83jlTq7b4JKPafMqhr1ivi4FSgGkGosT0w6KhrtjuUKg2hl2H4dh2WYcthkTd
	kig70aW/J1BqZdGaQNSxxhpexipHVm/KtY5xwOmExUi8+AMujX1gPHDqcWWs94lPAOGmYxHGDre
	FfsLqF6AQNL9n9b2uQbYhOFrqBQVRLzLqepCBGAIuR2I/16Q0qRhIFK+IRuK23zwrFFsTuwH0gG
	OscCO02YpigdNuxRT7d4n454PAus7j5cVVe/dIeGAXmZy4aHJEog4eUkqk7YFtLTu/Pr0Sz72F2
	FhidnOWcUO/0p7y63upvG2U240Vgb1LeCZ5kBVTVAiE1HNeANk1SjvE0cG/n1zO6KXaegMq43WJ
	uiY3hAVrMnSYLNEMPl8l3ZmHWLnZSiNfnaf8w8P3Rq
X-Received: by 2002:a17:90b:4a8d:b0:3a4:bd4e:6d15 with SMTP id 98e67ed59e1d1-3b166f9ebc9mr1695905a91.34.1794282634321;
        Mon, 09 Nov 2026 19:50:34 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b16700d812sm1002171a91.4.2026.11.09.19.50.33
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 09 Nov 2026 19:50:34 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91eb16ea5c3so46348086d6.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 19:50:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794282633; x=1794887433; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F1nWwBgmaBdULC/P07cKbjOH87XcJJ51z/HTXJDp+iE=;
        b=Qd/KyMiWfVl9rs0UdvjuF98skgddg49fwJEgt3PjKssx+Ic38yqf1AmbtO71H9C0mR
         lPn6dVT3brha8zLJcrSFM7chVsL+pou66pi6aKeIBpIetjeNmKfe09mL0LZ8Q94SbHRO
         pEls+zytdnfPJ7knL/W0/dWKdz2HsPSibZ2Ng=
X-Forwarded-Encrypted: i=1; AL+hErEPwIX6qthx9q0NHhKR7pR76fqaPxDx8+9/V93khz20IKWK+R6M1Db2MSVMiBOu7J8rFZpMpyWWpVhoz7Q=@vger.kernel.org
X-Received: by 2002:ac8:5fce:0:b0:54f:71de:8d2e with SMTP id d75a77b69052e-5552722e6demr24037131cf.23.1794282632721;
        Mon, 09 Nov 2026 19:50:32 -0800 (PST)
X-Received: by 2002:ac8:5fce:0:b0:54f:71de:8d2e with SMTP id d75a77b69052e-5552722e6demr24036911cf.23.1794282632269;
        Mon, 09 Nov 2026 19:50:32 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5550af612dfsm13740951cf.8.2026.11.09.19.50.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 19:50:30 -0800 (PST)
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
	Vivien Didelot <vivien.didelot@gmail.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net v4 3/8] net: dsa: b53: clear stale state when creating an ARL entry
Date: Mon,  9 Nov 2026 19:50:13 -0800
Message-ID: <20261110035018.2169370-4-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261110035018.2169370-1-florian.fainelli@broadcom.com>
References: <20261110035018.2169370-1-florian.fainelli@broadcom.com>
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

When an ARL lookup does not find the requested MAC and VID, b53_arl_read()
returns the first free bin index but leaves the entry populated with the
last bin examined. The multicast add path then ORs the requested port into
that unrelated entry's forwarding bitmap, potentially forwarding packets
to ports which are not members of the multicast group.

Clear the entry before creating a new one. Also return without writing
anything when deleting an entry which is not present, instead of making
a new entry from stale bin contents.

Deleting an entry which is not present now returns -ENOENT, including
when the lookup ran out of space (-ENOSPC), where it previously returned
0 in that case.

Fixes: 5d65b64a3d97 ("net: dsa: b53: Add support for MDB")
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/net/dsa/b53/b53_common.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/dsa/b53/b53_common.c b/drivers/net/dsa/b53/b53_common.c
index ca2ba8c157b7..cc42b2a4870a 100644
--- a/drivers/net/dsa/b53/b53_common.c
+++ b/drivers/net/dsa/b53/b53_common.c
@@ -2055,9 +2055,13 @@ static int b53_arl_op(struct b53_device *dev, int op, int port,
 			addr, vid);
 		return is_valid ? ret : 0;
 	case -ENOENT:
+		if (!is_valid)
+			return 0;
+
 		/* We could not find a matching MAC, so reset to a new entry */
 		dev_dbg(dev->dev, "{%pM,%.4d} not found, using idx: %d\n",
 			addr, vid, idx);
+		memset(&ent, 0, sizeof(ent));
 		break;
 	default:
 		dev_dbg(dev->dev, "{%pM,%.4d} found, using idx: %d\n",
-- 
2.53.0

