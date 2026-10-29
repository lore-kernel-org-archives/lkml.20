Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793308611;
	b=PxR0rfa1dntIs0aeblPPTmFDsK4pNb5EyNqi97QXYyU9fHwItyX+ZTet/tUw/B2t0BTw
	 5wkd5AAngF1Qx6OM3Jn5oEf5Wa7EQrZe+WChe6ZXM6DkH9Sm+uG7inftwqEZndpDw8/KF
	 kkfPHtigHoJseeYfpZ+zb6X7JCWdykzpzyEk5aXilOGEElmB6FY/6gCsEITyzSkPNXdPU
	 mso9AlGEbRkGaHKNAOs6EKuRSQYebqVvDqKZEsvyFiahGaRvcMj7ya2ZKgMm4MzUL3Rii
	 SDrP9lzr2sj1HQJr54OgJiFZKv9N6tY3wJLZFwsUC+dwjMu52c/nGTCFcQJqO4GlgYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793308611;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=uTkZJ0Yzp0GGufzljGd6jbiq9eMnJlsjmW0Q6mSjuiU=;
	b=pr+8DtB2om5HcTIsJxghkrJL19uSSU6hixi188GBX9XrwVZ2v2AZ+f3O76ZdoVMwVMRS
	 kwkrNiDEBqgVlPmXEgUcgKLIhFQIsUsnnYePxxDpz6njihPHq6V4aaSk5JZb7Wx6A2PPm
	 xoadDbOTp/JMxZqdm1AhJANFDtUCunKnLrA7I4Z2WS1F/TbKBa1Om/aGC1uUVfNM7ud4O
	 SgP6N/jDQwUmwWhJt6VXJKx4FbxlkuwC4Z4i75VSM1UcBioa7kJ0l/N9Py6HK/yIiLvyh
	 Xrn57A0TVR8PxQBT9Hl3sS6Xu8aFLjYOR/rpVS9BPITi4emkhyLv1knVmjPm3ODrICg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=R66GEi33;
	arc=none smtp.remote-ip=209.85.210.227
Received: from mail-pf1-f227.google.com (mail-pf1-f227.google.com [209.85.210.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1645D60A2625
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 21:16:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1645D60A2625
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=R66GEi33
Received: by mail-pf1-f227.google.com with SMTP id d2e1a72fcca58-89f639ba307so1090441b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 14:16:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793308610; x=1793913410;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uTkZJ0Yzp0GGufzljGd6jbiq9eMnJlsjmW0Q6mSjuiU=;
        b=mGDbh4/spzU9/5Jd2fI560EDZpsnjKMI1X+o+AH+fnB8hVqfFUY8z8YV/gFdc85kvc
         Xo3QGwdjbfQ/3mfSO6zo3+WttqUBNNAXsBH5OPDkjbl8Ci010TbPReDfiBC5nbofBzS4
         wLfFAfb/YfRZKYoijBDxuk7cZ5saDDGocn2nEosE5IbtHXfGq5KXfqZjjYzUNuqX9ZQy
         mu92u1ibk1opqXybxSJen6l//hMQfQ7kfOaoJNPIdTcKmeTIvDjmFFOWW7mAvhsVT7ho
         YFh+R4i06QfPDJDLWqzEL0CxrjjnVZh/pLaRkvzg2EQGhWmLSDEo4L8JBGFwUP5uB3vM
         qrUw==
X-Forwarded-Encrypted: i=1; AKwUvBw54B8q0wRsjmbqQxVPxmMLmbJIRrIK2ST5B3B48sNR54iT8VgVglkXB977mQ8mSiAxEmQxGQR85j2o1xg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKH4aOUSCfrMJDdNLgXP8E6VuuvxnB1uxQpGRGEmVHSGF1kuIJQ
	UF/c1dzrP3cRzSTJfxGE3OnmKwowU+L8IgFPj0vT9s1k9B3wq+iMjv9NgU1yEf/vpb6XjLEPJtd
	bW5nAeofvsgSQoytb+Xr89hKB/V9Us6Q1m2iNFlB8LkVzdc/WcfGtcIO9uJhlQC/G5O5QaO5tEF
	cGeIjd4LSIdZbTMjsEgVL1PyKkSpS8ibSlnGX1i/l1YsFEEJIQs9suNdEiaCHdH0G1XWVijWK9b
	IFMmF2oNEpk7RSisFVX/o/XheM=
X-Gm-Gg: AYBFou2me8xYO+1Vd3VHqdALmsfQg5X7AqRX0ZTWedhYJMlntbCsA694r+4+uGC12BO
	uix4QCZevECpuaRM6jk/v29c0uxnUdVRVxUVmPX5xRKhRQ5yzUSwj2u49ULbBZQR/lvyvrBRRAC
	m8NnH/CHIFAb1oMVT9Vjz2qAfVK4KfSuscdjoqHT2VHLA0kGXhGtAglC+fczo78CU/5JWL3HEs6
	YLlPXPz1ImZ9Rr74QEovf8svWvL+Lt8P2HYqz/ebQVQaCWWVjWVgxLDIZd9Nbo+ByRMnFFRDj8S
	KWgWXpjAbuBiALtElbtTknN2iEL+Lf91BVbGISwQV+JVNT56P+9h/VpHvTmK4kwLfBtcX/nMBU1
	8OObGmc2aBQtNsTi90pcYwIiTX+u6GeQ/hqDPjTwlDcGEHgkRaTQvURlqSIUWx7kBCW+LWe5yt6
	9Fi9MBER/BhMnih0TngVL8BZvSzRSJIQcdCMsKbj6C
X-Received: by 2002:a05:6300:67c7:b0:3e1:2ea4:fea9 with SMTP id adf61e73a8af0-3e928a800d7mr506120637.6.1793308610389;
        Thu, 29 Oct 2026 14:16:50 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 41be03b00d2f7-cdb07255aa1sm1697a12.23.2026.10.29.14.16.50
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 29 Oct 2026 14:16:50 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f2c0e6653so270970185a.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 14:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793308609; x=1793913409; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uTkZJ0Yzp0GGufzljGd6jbiq9eMnJlsjmW0Q6mSjuiU=;
        b=R66GEi33VwtFUWALyLN11O93c8XeXlKXcVlh+2of8G0izBqMG4woxUD14WyIMX4sXr
         aoUFLXcrt83raob2Xb55LnhPuko1iV3jrroKPRB+T1aukONcywdDiM5iB49cvVClkjLc
         QVeBKYrW2wRubmIKWpF1GbfJ3qOy5kv95unuc=
X-Forwarded-Encrypted: i=1; AKwUvBxIqbAk/XNfwmbCCv3mIJzmlJFAIkDKo0LzvhZaJmWtYHcMP5YmDG8osFjmxvp5hxuRIpzUylRjLr1jxMc=@vger.kernel.org
X-Received: by 2002:a05:620a:3707:b0:93f:5445:c661 with SMTP id af79cd13be357-944217b3b9emr80322185a.57.1793308609084;
        Thu, 29 Oct 2026 14:16:49 -0700 (PDT)
X-Received: by 2002:a05:620a:3707:b0:93f:5445:c661 with SMTP id af79cd13be357-944217b3b9emr80317985a.57.1793308608547;
        Thu, 29 Oct 2026 14:16:48 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ca314f888sm6326926d6.35.2026.10.29.14.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 14:16:47 -0700 (PDT)
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
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Jon Mason <jon.mason@broadcom.com>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net v4 2/2] net: dsa: b53: restore the NSP IMP port 2 Gbps mode
Date: Thu, 29 Oct 2026 14:15:40 -0700
Message-ID: <20261029211540.4123250-3-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261029211540.4123250-1-florian.fainelli@broadcom.com>
References: <20261029211540.4123250-1-florian.fainelli@broadcom.com>
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

The Northstar Plus IMP port uses the switch's proprietary 2 Gbps mode for
its internal link to the AMAC.  Its fixed-link description reports 1 Gbps,
so applying that speed clears PORT_OVERRIDE_SPEED_2000M and leaves the two
ends of the internal link configured at different speeds.

Force the 2 Gbps mode and flow control for BCM5301x and NSP CPU ports.  The
mismatch caused switch output queue discards on both copper and SerDes
ports, with one discard for every TCP retransmission.  With both ends
restored to their high-speed modes, iperf3 reports no retransmissions.

Fixes: b6a8a5477fe9 ("net: dsa: b53: fix resetting speed and pause on forced link")
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/net/dsa/b53/b53_common.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/net/dsa/b53/b53_common.c b/drivers/net/dsa/b53/b53_common.c
index 0880310c9ce3..743fc04da0a4 100644
--- a/drivers/net/dsa/b53/b53_common.c
+++ b/drivers/net/dsa/b53/b53_common.c
@@ -1663,9 +1663,15 @@ static void b53_phylink_mac_link_up(struct phylink_config *config,
 	}
 
 	if (mode == MLO_AN_FIXED) {
-		/* Force flow control on BCM5301x's CPU port */
-		if (is5301x(dev) && dsa_is_cpu_port(ds, port))
-			tx_pause = rx_pause = true;
+		/* Force flow control and 2Gbits/sec on BCM5301x and NSP CPU
+		 * ports
+		 */
+		if ((is5301x(dev) || dev->chip_id == BCM58XX_DEVICE_ID) &&
+		    dsa_is_cpu_port(ds, port)) {
+			tx_pause = true;
+			rx_pause = true;
+			speed = 2000;
+		}
 
 		b53_force_port_config(dev, port, speed, duplex,
 				      tx_pause, rx_pause);
-- 
2.53.0

