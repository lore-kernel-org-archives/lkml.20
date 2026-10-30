Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793394846;
	b=Nau/MdVlnN8JuCJVEp/sfAPX7VLiAUK2TWgFeyPd+uQtLhQsoX4s9bPyczbH2/aZuqAs
	 aqH71pSwHuUJhMc2De7XayshTQRT76zrh/rwm3AqDR1X1Yh5yRFu5RkzW8iJPXtnBAkcj
	 x11f6C8rBW/U1cQcmvDNEmXi9jOxzxB0q32fI2J2Gpb+0kZ65Srv4A/oE4tb2S/+7RAgj
	 +zoT42hnj+DOJAcPqaPd4ubY9a41N9f7792dzeIUaEeuOrnvUJYNqLdCE/MJYGjj5wttm
	 AS0vdeEZ2DA9Joc5uHOzxk1DKMY1G88x9pvKD4rIHTz2fwjTlkT1A8w/ENbMOSH73Kw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793394846;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=VE9FP15nXziNfc38hUW7/8pvy2yncMFC7Oe6vk9W/Ko=;
	b=s8+pXmDyGYmuRj+379RjvUk1djJAFj3UP4He8wBuJtbn/PiOH8nkiUWnRTgQ6w89spwy
	 CygEGs6s10QYdR0S3nOOTChfWH5tpnC2l22yv9O9g4+o8Fr7PFNjU1UsmTYQ4PFww5WJO
	 Ja3+l3YmRnkk5XU2hj2DjYqxyHMnS/2vDFdz8pHD1eQCkbo6lXGecnSmGJ/0baKZUX0nj
	 knqgQAPsGPmnx4KVrIx6XlfV5791M6Bl0x7f7/O/pNWqoC/gAhRpldY8Sm+Xfo3dfimFy
	 sHmk7w1Hfg1M4NDqdnks1vPPDBdRjhu5k15tHvTWRbh5E8jKPN4S4ravV1g8O1KyQVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=NXhdcdE6;
	arc=none smtp.remote-ip=209.85.216.100
Received: from mail-pj1-f100.google.com (mail-pj1-f100.google.com [209.85.216.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28DCE60A263D
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:14:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28DCE60A263D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=NXhdcdE6
Received: by mail-pj1-f100.google.com with SMTP id 98e67ed59e1d1-3ac6794fe45so920518a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:14:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793394845; x=1793999645;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VE9FP15nXziNfc38hUW7/8pvy2yncMFC7Oe6vk9W/Ko=;
        b=AK335djH7cGub4GmyoUIUYYIVGPJThM/UEaJ0/emzIm4j+5CVM+d7hQXMgXkzQzmz9
         //XTwCycOYITT49ge/7oSMUT4wp+Rsq4J99zk9nIYAG1lAH0xa8wL2zp9e2b3F6XMHnL
         msImVsBYmeLVUbHssdpMpNRlENZ2kV4baPo1cDR6NqSYkEd5BQLF71kZFxs4nzXMhtlq
         n0xEKRaCxUmEJ6IU0QtjyEwCy5C8FbuCwi6B9Z6WPK+xnhvzK8uHEOjXOU1CQbPbvUiw
         1g3gIVBOQvPIEG+ywls1/ZgR6chKLRmsGw0c1W/e8EPIpi179FmtsdN+CYzNAOkreDG0
         If5A==
X-Forwarded-Encrypted: i=1; AKwUvBzizV0028yW8sBKSOG/Km3SwW8y+aDZCwBH35xQPo1Rsj0Oa5jqwY5ZP52MFj37wp2usCdlpH+UiygOPEA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLpysk9GVAJKFrOWrx3hKCy8Qs1aS4Q0w5sEDzZW5f6K/oUKubq
	8GMe/3S4bnRoVhlYJEMu0LKB39RMA173SoMwiDgxOivibC85n2063GE2Am95VCsJ8OARnxfV37U
	rblMPCQYyV52nXKEtCv6Cv/t98Af7/f6jQf46rIc6hWiw56n83C47TzZtaZ1lJZxxsj0cNm3Nla
	dOYGFEI60c2FEs7jid4eORvTUx6qBPZmO+I9Dh2NIZUUbFeVh+T6tAvGdHmPlj+PXvCE9IhE2em
	7l22RyV+FvvsCjO4BzH1XkVs5g=
X-Gm-Gg: AYBFou2BiDgk2HCGz/iqPS7KyD86XUPUPLbs1kKprb+s04ezyUE1XQQPFC+m0Z0rIjp
	reYYvKLY+FVVxM7WJn3DDeW1oegy7ryA0MwuE92LZUAA9rw3Un1ev5oFUhfqzlh65k0r0GduQvG
	9lJO64zGCos7sphU1NK/FC4+Gc663K1R/tqeEx1SDePWCRenIAqIR5ngkS4LbMB7Q9d7wvf/xAw
	DUr6aTZHAZ+i7X5m/yJHsslbY2S71apJOi+Ai4lulgE/BTqQ/vnkMK7ef120NBFHVtoUTyxuL/7
	3bw/yB7eaXU6Ppn1BXoFtf0pkd9g7VT+pWhVSSUvRKpQqOLw660WjzReQUVEV2EOQbV+Z8EdRJD
	eDtoM3BZv7B0xa33sZXBxMqVR5KanXpfZNv3Ow5hxQDCgd5BOBMs5TPj2B4QN9xUFuwbugA4Qaw
	8dh59zvQrJcdzvgRpnMtfDkjpKKhbs08M39Wntn0uO
X-Received: by 2002:a17:90b:4b8c:b0:3a8:9d0d:ca50 with SMTP id 98e67ed59e1d1-3ae897c853cmr3023788a91.10.1793394845528;
        Fri, 30 Oct 2026 14:14:05 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae88072814sm914301a91.3.2026.10.30.14.14.04
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 30 Oct 2026 14:14:05 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3662e7a9299so4276386eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793394843; x=1793999643; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VE9FP15nXziNfc38hUW7/8pvy2yncMFC7Oe6vk9W/Ko=;
        b=NXhdcdE6/ioUAnSFfeuJl5J14BIirzaIxwUw4JXAkdMx2L0A4aDftOlrioA4PxHn/7
         gqZgf2+wA9p4je5v5JhNtGAkkVFphQzio7n9cY4gbaowF8hH+MjwA5ZP+nClaNMDOGwt
         9gCckfmCW/6lE4Z84z26uNno3cdCJ3fveMUlc=
X-Forwarded-Encrypted: i=1; AKwUvBy5/I5L4svcN6ChYte7Z5V/cCZhk9h4kK9o2QZWU0BZnQAvbMzInL5cWlf0BtJAPB78rU72NTp8wiObVjs=@vger.kernel.org
X-Received: by 2002:a05:7301:7d1a:b0:343:fb75:a5f2 with SMTP id 5a478bee46e88-36a42340bd5mr4468273eec.9.1793394842979;
        Fri, 30 Oct 2026 14:14:02 -0700 (PDT)
X-Received: by 2002:a05:7301:7d1a:b0:343:fb75:a5f2 with SMTP id 5a478bee46e88-36a42340bd5mr4468231eec.9.1793394842178;
        Fri, 30 Oct 2026 14:14:02 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42669128sm10574595eec.3.2026.10.30.14.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 14:14:00 -0700 (PDT)
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
Subject: [PATCH net v3 3/8] net: dsa: b53: clear stale state when creating an ARL entry
Date: Fri, 30 Oct 2026 14:13:45 -0700
Message-ID: <20261030211350.287566-4-florian.fainelli@broadcom.com>
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
 drivers/net/dsa/b53/b53_common.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/net/dsa/b53/b53_common.c b/drivers/net/dsa/b53/b53_common.c
index 559d4b360c82..c38e8c5838bd 100644
--- a/drivers/net/dsa/b53/b53_common.c
+++ b/drivers/net/dsa/b53/b53_common.c
@@ -1990,11 +1990,15 @@ static int b53_arl_op(struct b53_device *dev, int op, int port,
 	case -ENOSPC:
 		dev_dbg(dev->dev, "{%pM,%.4d} no space left in ARL\n",
 			addr, vid);
-		return is_valid ? ret : 0;
+		return is_valid ? ret : -ENOENT;
 	case -ENOENT:
+		if (!is_valid)
+			return ret;
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

