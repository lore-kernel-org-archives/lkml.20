Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794863395;
	b=zjq/3+tpgVVhHBQT5/32H8kQmf5ziDYD/Z0mV1L3NMlxH42rGBuQ2k+NUmwVufP8PSQt
	 ggvfpYRtB/dyvJF34F4ABlLZhL2Zg6M7IxSs3USPQXFZi3GRJNiejOD3sK+FD9MtwGfnd
	 9hQWGugsHS45qYB5T8gXu3R4kYD5QzUmBWQHZXsuohzM4qCdlLtj1JrlJ7PlX00dbiaq7
	 /c9KHE4Qb3NP9j+cTHDIG4tCwPylJOMO5sT9gIyyORg7MYJU9LGndmLcU/kklTDR7VSFg
	 ahzDWiwVBH++GanpGzyyTiUqFUl+GfkxJJqHXRQlfabXE3QDUA7SeSJoSYjabeGDVmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794863395;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=Yh/+MQvK1b1bcv68JYPLNZYWga4ugttJPubbV8w+EUI=;
	b=FMvVcQQiH6X0z8fqGeUykmTh2RavTwYvZ5AZGvGe4ACtw86IZxwkvTE/M1lxFGqP/ssK
	 MAFi1ysLkmbf/c/qFojL4A5FSdBpehvx3x7C8cb0+durKlvYBFBgcx0BnvEpshPL2/nRw
	 IPqWqQj9OSWQow6IS1MtYfdCVJjw6ThVQB05i6rgOzVqLCrT7ia4gJM+hReiLX1mWVy/p
	 lJggD85WQy0b8Esa8q510L9X408wAUc6ikJKc4l53UhMmcvrsi7w3DVJOGt8Bx4ht2NHe
	 ombiHApT96bk7fZJig25fdj3Nf75P61Mg12MZZZ5SkHaXYAOKLHkfp3G89OOuJrqoxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=O5Cm0z4j;
	arc=none smtp.remote-ip=209.85.216.100
Received: from mail-pj1-f100.google.com (mail-pj1-f100.google.com [209.85.216.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D540B606A883
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 21:09:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D540B606A883
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=O5Cm0z4j
Received: by mail-pj1-f100.google.com with SMTP id 98e67ed59e1d1-3b3af93b85cso88825a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:09:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794863394; x=1795468194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yh/+MQvK1b1bcv68JYPLNZYWga4ugttJPubbV8w+EUI=;
        b=2GW5HxJB4Ju6OpzG6U7LmQRs0HJZ1W4D5UnHNbkO2vyoehjtzvuRlm6gN1tnFiqR2C
         UgcSz0jGH0ROw1E9jkExsz5KgWjcBOQgvzgylp/Lu296spHR4sR2AKzsk8w//uqcslj0
         Hrwc0mEplv89xaX5XuAdnZTGb27u/sDOxhA2haA13lhkZBsYkSkZCx1JCzqE77Lq0KTn
         bakvV+93VoIPN1wqnUJIW6GWW3Y34ti9QrgQ1z4yKpAchEVhoEaOl38h+Tz6hi0+/Q/q
         AALRDJdRbT4QxXSQJKFz2nrNuRToYfSMUhKg6+eU3aqW7EP8SHfacasIDfhAsYBdhV0x
         xBQQ==
X-Forwarded-Encrypted: i=1; AL+hErHPQkXbVMjBFfweZws+M5JghY2sCSJwU1NxRIdcXBvGE+yxZmaUFEisujXHOBhyLmgAvk+j1mjoJLpjYAI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+K+9UpIA+8Mb6zwphErYtzHLAwvSWvfPu0iIWyp+2of+Oz8qWJ
	kqyopceQYPudqauluYDcF/wa4WdVPfCwWvpeGxo3s2teKmC9ZXE7nMwBUbYAzhh/0Q1/xLisvYg
	DTua4GI/8X0bPi5m7OjcrkHdWz5J9CV904jwU5Fkn+ulCPbucvAUadN09ixPTn3bhlyJ/uUkdQU
	z/5i1+5zn0nAMUYxCYdNmL+LlM0k7T4bSdqD/NvbfsCR/TT0e6zJW6uP+c1aV3xWa3JJ0p+JILL
	WiU4JF3sTrKJqPgCZLUe7It
X-Gm-Gg: AZFdTZcSuSHBzOgYqzni//3GKrCdMkIuz1O2Q85rYy2MNfmxqJOjJXZqMLoRNF2dShf
	9hbLvIVEMWesOAiwskN4kRWXb+Mqmg63zGbYeqDSQojz9H5DeMSwNFiou1jealjGQr4cI6kFCj4
	NG+7D4l4gWVmO6QN67OstGQh7qpwiFUdfGgkSLSTKEi3OF0XjoCounbEjbg5NJ+0zJXA8MZ9tNg
	F6MgecoeXsep9ZaXhT5Du9jgWrJ1XWzboRJX5CLDJrAuiGJ9ZoC3Ux58c/27coqXPKiJGkfRg2A
	nysrANDqrm4M5mqdjQtgBj9KubNw9+UR7ohV5riyhLXIB0I8P/Eedlp5OgZGtw11IuPVtmvI+xx
	CyEON0AHpmPsY1zxB1Hei5bC1B6R1LGju1thaojfCxwSt1b2wf0exP9C/wuj5yoz8exl/xj7W3A
	OvTEBHsTZNlDGsYieCCQaQVYqgS0Wayx0brgvgsXGZhfc=
X-Received: by 2002:a17:90b:4a88:b0:3b0:a7b5:c037 with SMTP id 98e67ed59e1d1-3b1b07fecf9mr11133988a91.1.1794863394068;
        Mon, 16 Nov 2026 13:09:54 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b3abeca517sm393187a91.8.2026.11.16.13.09.53
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Nov 2026 13:09:54 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91eb05c8241so70104366d6.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:09:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794863393; x=1795468193; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yh/+MQvK1b1bcv68JYPLNZYWga4ugttJPubbV8w+EUI=;
        b=O5Cm0z4j8Zg8Xho0rMMfx9izr/LQV6QrP1Qpdto++5n+JZYE0wzsUuRdfjWzRQ+13m
         yznyIV3zGkSXpbMXH5agK24zoCz6E9b241sOgmEY5j/SqgejPU+22/gTR1hS5KVgzbxY
         zRw/2fDN+Px6BFcjo8sy+AxFRZQceLMdo2xBo=
X-Forwarded-Encrypted: i=1; AL+hErH/cYFJPzNqIAJv6x9aS1iZMQTpjHKJBXF20QP9PP+o85Hi9Z7H+b18xA4lkXcxZA3Bx9aqBsOtWdsV/yQ=@vger.kernel.org
X-Received: by 2002:a05:6214:4602:b0:91f:16c9:1005 with SMTP id 6a1803df08f44-91f241c1b04mr174700476d6.25.1794863392964;
        Mon, 16 Nov 2026 13:09:52 -0800 (PST)
X-Received: by 2002:a05:6214:4602:b0:91f:16c9:1005 with SMTP id 6a1803df08f44-91f241c1b04mr174700276d6.25.1794863392522;
        Mon, 16 Nov 2026 13:09:52 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-920fe17eaaesm3601396d6.33.2026.11.16.13.09.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:09:52 -0800 (PST)
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
Subject: [PATCH net v6 3/8] net: dsa: b53: clear stale state when creating an ARL entry
Date: Mon, 16 Nov 2026 13:09:37 -0800
Message-ID: <20261116210943.1352656-4-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116210943.1352656-1-florian.fainelli@broadcom.com>
References: <20261116210943.1352656-1-florian.fainelli@broadcom.com>
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
anything when deleting an entry which is not present, instead of writing
back stale bin contents. The return value for that case is unchanged (0).

Fixes: 5d65b64a3d97 ("net: dsa: b53: Add support for MDB")
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/net/dsa/b53/b53_common.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/dsa/b53/b53_common.c b/drivers/net/dsa/b53/b53_common.c
index 1f5776dfaae2..dac6013f8fe2 100644
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

