Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794506634;
	b=NM1YtTQQSh/kqnC2q3+lIsrBPkXO5r4w1EW08pF3pYcHzEYsMXHC+lWO2PkxjXj4gfwS
	 GKbwI8+ILdath2rjxoupThv3gE0jzsR9bfqnbkKRfP6M90aHksnSbBG+G6HHTjiVZcnZz
	 NEVP8N3xHvkXu3Ew59VYP+Wx8CGD3tU8d9zNWrOeTba8Gdr/S6vdsW6W/iKd0pwxq7WOh
	 ELJZyaB17CYFj8dZfl1ES3B6+C+QKW3738TiXvhi8v6AU03+TuHAZXRIG6ev4G+sIyM0J
	 bdIZ3s0mWFRhNPEj+ZiV1D4V20z5Wxf18FLkBJt9Sg9LS3E8ro8Nlqq7RpHBmq44SPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794506634;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=F1nWwBgmaBdULC/P07cKbjOH87XcJJ51z/HTXJDp+iE=;
	b=pCtQqipOTijKe7Ouwi2+Q+JTV9ot3UuEgHb8UWZn3nmZsqr6GYeLXMOHeN3yNA9bKIHY
	 Ceunscl12HVATrgEHVoLa8mTAU3g3ECaGatu+/TLmB/Hu8v/zSd89eALbrX/5cNtBs/oI
	 1+gNr4utBgjpVrGMcjdeL/xGc5h4zBwq9RTMQgtHU59wKK+75zglKcv7HxRgaBY/lnv+/
	 IOPcrqdjzZMT8u77nD8bIktJgLI4uPeZb8Q52DHI6G+QZimsXRJKo4stLMpgNs7JRCpNH
	 eWhsAySqiHO9EHcB+iYJKVU8EwwjpXAWjvXPHtjBMKM+wMsme/bL04drC8URyoklbkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=VJfN0ejN;
	arc=none smtp.remote-ip=209.85.160.225
Received: from mail-qt1-f225.google.com (mail-qt1-f225.google.com [209.85.160.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F73C60A260E
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 18:03:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F73C60A260E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=VJfN0ejN
Received: by mail-qt1-f225.google.com with SMTP id d75a77b69052e-5363316fa0cso49444541cf.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:03:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794506633; x=1795111433;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F1nWwBgmaBdULC/P07cKbjOH87XcJJ51z/HTXJDp+iE=;
        b=BJpELZCZ6aJk0JdJmzJF94fEd+DPM5/D4O+SFCPB59LZ35xikaMrbTuxKD3jvFNKJT
         Tc00geOHCcObopjzXErZltEX8KgujBqwU/dCif7Ux7HxKgahFr1dkB6uRGli9W2PE+pO
         sfWKmdB2+RwdJQ5eghK55sevMU8F95C5H9OG+LALXiNZd/c67/aJIkWu9gbrL8K/XatU
         1zaIp5mREnbK9LWAqaC2TZiAXJtMKstvm///0D0FpRwOugilvvIM7vQK0eSh1S8vzIk/
         2k0KhKIdSUvhEFR+/Ql26ZuCE9txh9Vsp75/0Us6bShCnrJBHnXMd0UnthEaKJmRDAuz
         XsaA==
X-Forwarded-Encrypted: i=1; AL+hErGa0VzcTrCLtihtMC/R4WY7mgz4lgUoECkEpuDpbS5d3NyRc28NtGrA3CjGzYAXIJk082o3mMpIlDuSQl4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+mz5InamU3fsT9Y0bintxco11i0E21SCTBdhiH736zCSG3jpX+
	g49l+PFFNXLJFRQXDO3N57bI54O49xlfcCbJWoQcb6P9QQfUMf2cPK45WU6Prr4dXFBgpbkip8m
	Dc7fwl2jxDVLPJL5mwsx9XDHoX7snFSs3275wHAmpQNh8NX5jBggvrsjfx0OydprUWk2KxSzKEU
	UhpTpqd7+lZEF4rzI91kR9W/snDbSg7VIoWJ47DV5RGPgZfwfwy8dCmhBBmr9zGzuw407J1IBb1
	d/aBIrlB4NNjZZRV/akE/6g
X-Gm-Gg: AYBFou1td5L6sh4pgZfnrClxRNhXStJpQHszcv41Y8ydtRoHxba5mUkypjuZhDLdgmp
	vqWwgd9MUmwBoCRTK3oxi4v3n0nsngli8voEfJFJKR0eeJHkHW8t/RJ2I1wu/mRTxm2pElMeFZd
	EN8iGnhP01usbBIjTAwelNCk7+OGDUDOMY4Yg3UD6LD5kONH2fXkQqPGEM2Z/FiGKaokAWfi/S3
	89gqc83tKn9t9F0nNa/khp9UZSaJrHQ3hdiJ5pE2d8OJ+mlqILzYBGecHikh+j4VPG4YvseQaKb
	MZRps0h6jFpFkjhpPY7rBSQlTxFj7tKiC1wVzWy7csvLWosS6hWoV1HIPl7a/ejnlRLwtDHjfLj
	qsFKIWNz0mFN5wTpun4vfS+YVMSw4ELAZzVI6D/kVJJ4g+l5mLfLdYN2aC1/E5WnHzKE2t4o63v
	rVt/USjLCRLAXVKJSsC0Z4xVkeTgiEM03zDJzKt0aR
X-Received: by 2002:a05:620a:684a:b0:93f:3358:3ed7 with SMTP id af79cd13be357-9494bb399acmr24548785a.54.1794506633401;
        Thu, 12 Nov 2026 10:03:53 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-22.dlp.protect.broadcom.com. [144.49.247.22])
        by smtp-relay.gmail.com with ESMTPS id af79cd13be357-9492cc0e543sm58862985a.12.2026.11.12.10.03.52
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 12 Nov 2026 10:03:53 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8bb1a7b0e52so63063b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:03:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794506631; x=1795111431; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F1nWwBgmaBdULC/P07cKbjOH87XcJJ51z/HTXJDp+iE=;
        b=VJfN0ejNQNb8UwpdqxN8f+7hjmMXpMAHLJF4p0fO2DrBOsR3xqxN75znIErrZk48yD
         R9don0LOaX/kOy6hKVccnZRv1sg5cooueCnN+H7Wp5H8gDixR2vmERMW6W7fIrrAtxUn
         mfmJBrymnWBAJY7vHw9Nxicd4MBQPXH+ddQCw=
X-Forwarded-Encrypted: i=1; AL+hErF3+/yi1CGT74M0kWn3U8xVOX1zodTaAW0GnSb5DSOrea0ApF79RMiTLTm61/lRl2ofwfpRZTJwZMp7eRU=@vger.kernel.org
X-Received: by 2002:a05:6a20:9396:b0:3e2:6e81:27 with SMTP id adf61e73a8af0-3f2fece36f3mr6603615637.70.1794506631041;
        Thu, 12 Nov 2026 10:03:51 -0800 (PST)
X-Received: by 2002:a05:6a20:9396:b0:3e2:6e81:27 with SMTP id adf61e73a8af0-3f2fece36f3mr6603579637.70.1794506630588;
        Thu, 12 Nov 2026 10:03:50 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc18abc06sm95004a12.22.2026.11.12.10.03.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 10:03:48 -0800 (PST)
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
Subject: [PATCH net v5 3/8] net: dsa: b53: clear stale state when creating an ARL entry
Date: Thu, 12 Nov 2026 10:01:57 -0800
Message-ID: <20261112180202.324504-4-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112180202.324504-1-florian.fainelli@broadcom.com>
References: <20261112180202.324504-1-florian.fainelli@broadcom.com>
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

