Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794488971;
	b=VkDjwd+tYEatWR2a9CpmQGJ3QTBGS322itA65bvrotZ0xfQGzh01vE6GIa0GRRs541nR
	 4sby9ZHwKml9F19xkOEds+rLD3mO0GrooQ59F5qmVr2BZpBbhJ4kcMEuEURj2m20RmdDE
	 vgFPlZhf3JuxnsgxngPiXPyVqBQhCaV9gAzkrlYCgktEiqKXgJsfe4iyJ8fpaiyjtOL9C
	 5l19vEZ3NHnBS8SqIIg0i3aJMijg3vjIggrKRmGYa8O1VC/FqR8URdK+EOTuVn+2D6Iq1
	 8GNyLQixa5pcZqtpz7T5HQpaF0QqPRaL5egH6TqIxB0GqU7guJpWEYkYA28GLrCB7BQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794488971;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=1T2riPt6TLd4tcqfYZXiptHpoqngeOa750Ao6dYlwko=;
	b=03M5OE117xXukr8/yY5XnR83tf6NFM+0VFg9AWPlZsQxXnbfY1n5CDnDwy2F5zii5kEa
	 zR+Q0AEWbAGhGp/m1c8zDWTV4jM2ZF2BVFVciHoO40UO2BOk3UaPXqC0zhYytJC2Usqb9
	 R8XG709Gd9CCWixMEuNDwtd+eD2lfDWFkuwNvs89QDlkmeImBwubgvBAiHrPM7FImV8nC
	 /oRy86Zv5xex4LseMGlgL59lUfzZmdOQ4/w/vAsZ44veKQKylmzFMYo6Ci9vblDQQcZ0F
	 wFWIfd04ZwPVR5NgFEBeXpksh4Q7cbc7MK2/oTMv9RlnNwLMTsolQaoqDmYc9z/FDiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qxov5I2I;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C423606A323
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 13:09:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C423606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qxov5I2I
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-36eb1cb7aabso6356927eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 05:09:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794488970; x=1795093770; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1T2riPt6TLd4tcqfYZXiptHpoqngeOa750Ao6dYlwko=;
        b=qxov5I2IZo8kun0LWvzjMa4f2Ag9JiOEzkd/e3mbn0ufvTU2tw5msqluKEwHhGKB1O
         YoCm7YX1GvkAqtiHlE6ChKlZDLGeQbbEE+A0+ZaAQ4GgmBCxDoepbVGkfn9nHRMXGG9V
         0eR0PISJ0vWPBN+XwFdc8xZzO8/dE2Fb6h+n9ksleDLiU4esZvV1hSQWB6pwh4Zc2w+z
         LQH5gWQX0mUkyd73zlhxeqzyPqQj+FY3e1KR3RsYZXwz5M9N68xO8SGtxewj60yx+5bM
         4gNg3T7UcjrktchfLCRXbTJS6wIJQ4KtVgdGeXLuU244sXeLXxq6RdTD7sk0MdblJRtF
         u7Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794488970; x=1795093770;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1T2riPt6TLd4tcqfYZXiptHpoqngeOa750Ao6dYlwko=;
        b=PFF+2qdkMW15/pwakLwebKq18fqA89vrInPe5vdW+ulzZ/O8+TmqzY5+xtIYx0S12r
         g4dD7Tu0O/i6oS+M5d51a1yK7LjqhenhV8sq2lrxzC4h4bBRTNdDweY61nplfvfn7k8T
         Xah2N2a2XoiIof5m9hL0Zx1t8swARjuf7gNQLHB1vsvaRamNdb/W5ysjIlkQK9x+/Hpi
         F2yn9smOtb2caMePFAs3l4se3bckA0IoTR2YkIZ5vJOtomsMim9eUl/3Zx5PKnrI00PZ
         s8rV3T3x8ik48LfhZoFYiPV2W0s3NGx47fMaNpFCUC5NkwSrGu+C5x+U9W3yd/N+B+34
         hdWA==
X-Gm-Message-State: APuU4Z9tEHoe3igozEu8u0DvfqVBd6/nHxGkViwAFXOx8TDU1zTSjP8G
	4sAaWKRMA0gotwXzNKdmLvnfI507pUMs8vXOF8wM8q4SEeamjBC1F7FnqWCvSPFt
X-Gm-Gg: AYBFou3gwuXnfAmpI9k60+G+Kdh6fqZ1VRJeRVRMXEeDPgAuG3H3q1GrF0QcyVsGPSw
	dSUzcHTOt5f/4P0FPEPbv80F5MdzDJGu68GFg3tgrxbmbYTWKT8tjC6bCjcis6Pipieci8uK982
	Z8SxsArvLoYAWT8AiCmrRg8w0IE2JoRizwMQ/EqwOqDRE4BGgT22wV3JBze1/RM2F9hpG0CCKpq
	fOJ/F/GhBRBDdrq/kHG87mikedkRiezsDibXQD0G5ib/p3pxPGJU/UbIsxg5Z07MntaERBaJfxp
	73mMOnFLumEu9EzHLU9hL8r73FHc5QQfOgcBHl+hAmOu1nHOeQYCQ66DUQPO2ThhRi6wdVxFQIM
	cUXdVd8JTtB4v6Ygk64aKiClVv6ISiqXgccIXjs4CyyyK117GbGWTdf6ZRJeGFEmN8V+hyFrM/w
	WC/Y0zJe+lWu3g+SGxLSmT1MIgEkIibZXYDXlHhjpyMqhWGx9D1rx7SMnjGbFbPogLaEVaV/M+H
	hSAoeyyCa3CKxd0FtXfaQ/i8IG0EpF+pCEa0JKwkNoQzU7MffGTjA/kkkXBDL5DtmsjHZgngCFq
	xAkrngmPebLTEP8qA86ow95EwzJ0FiERuT/s5hEvslFe
X-Received: by 2002:a05:7300:33a7:b0:36c:f88b:caae with SMTP id 5a478bee46e88-37686469c40mr5812080eec.22.1794488969615;
        Thu, 12 Nov 2026 05:09:29 -0800 (PST)
Received: from xploitoverload ([2a09:bac1:36a0:120::1c5:160])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751ff2ab59sm27030433eec.6.2026.11.12.05.09.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 05:09:28 -0800 (PST)
From: Kalpesh Solanki <skalpesh942@gmail.com>
To: Jay Vosburgh <jv@jvosburgh.net>,
	netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Oliver Hartkopp <socketcan@hartkopp.net>,
	Jiale Yao <yaojiale02@163.com>,
	Kalpesh Solanki <skalpesh942@gmail.com>
Subject: [PATCH] bonding: reject IEEE 802.15.4 and 6LoWPAN devices in bond_enslave
Date: Thu, 12 Nov 2026 18:38:33 +0530
Message-ID: <20261112130833.233208-1-skalpesh942@gmail.com>
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

When the first non-Ethernet slave is enslaved to a bond,
bond_setup_by_slave() copies slave_dev->type to the bond device.
However, the bonding driver does not set up subsystem-specific
mid-layer contexts or private structures:

1. IEEE 802.15.4 routines (such as ieee802154_llsec_dump_table(),
   nl-phy.c, and socket callbacks) identify WPAN devices by dev->type
   alone and unconditionally dereference dev->ieee802154_ptr and
   dev->ml_priv (ieee802154_mlme_ops). Because bonding never allocates
   these, this results in a NULL pointer dereference.

2. The 6LoWPAN netdevice notifier (lowpan_event()) identifies devices
   by dev->type == ARPHRD_6LOWPAN and treats netdev_priv(dev) as
   struct lowpan_dev. On a bond master, netdev_priv() is struct bonding,
   so writes to lowpan_dev(dev)->ctx.table flags on events like
   NETDEV_DOWN corrupt the bonding driver's private state.

The team driver closed an identical gap in commit 9043be310c6a ("team:
reject CAN, IEEE 802.15.4 and 6LoWPAN devices in team_port_add"). Bonding
previously only blocked CAN devices in commit 8ba68464e478 ("bonding:
refuse to enslave CAN devices").

Reject ARPHRD_IEEE802154, ARPHRD_IEEE802154_MONITOR, and ARPHRD_6LOWPAN
devices in bond_enslave().

Fixes: 8ba68464e478 ("bonding: refuse to enslave CAN devices")
Signed-off-by: Kalpesh Solanki <skalpesh942@gmail.com>
---
 drivers/net/bonding/bond_main.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/net/bonding/bond_main.c b/drivers/net/bonding/bond_main.c
index 7019e5d8fdc..b3b003e39b2 100644
--- a/drivers/net/bonding/bond_main.c
+++ b/drivers/net/bonding/bond_main.c
@@ -1894,9 +1894,12 @@ int bond_enslave(struct net_device *bond_dev, struct net_device *slave_dev,
 	struct sockaddr_storage ss;
 	int res = 0, i;
 
-	if (slave_dev->type == ARPHRD_CAN) {
+	if (slave_dev->type == ARPHRD_CAN ||
+	    slave_dev->type == ARPHRD_IEEE802154 ||
+	    slave_dev->type == ARPHRD_IEEE802154_MONITOR ||
+	    slave_dev->type == ARPHRD_6LOWPAN) {
 		BOND_NL_ERR(bond_dev, extack,
-			    "CAN devices cannot be enslaved");
+			    "CAN, IEEE 802.15.4 and 6LoWPAN devices cannot be enslaved");
 		return -EPERM;
 	}
 
-- 
2.53.0

