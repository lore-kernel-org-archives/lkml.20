Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794133020;
	b=OuEdMVfu9/93vGI8TcPHbfepL75r3qLAVOByk9iN/h2w0FiWWXx8wARmu/srgtMRTZy2
	 +H2z8qsKPJ1AtO28PqN/o1oDex97HRFns4AiB3znjYAxeT8jXVD2tN/WtOqlSk+ZQV9kj
	 twApoY8Vj72kOeQ/XshsoBbBBp+Cb3QbPHUmuIPxmEDdeJ5DBT9RMonkJPsjAGd+UEw7g
	 5/cWpKOWCuaVtiLMg25sl1Br/6w+OoNUv+oJHqh5+7Mj0S4ROWPjJamJOehTOach77HNb
	 fQ7F1wZQxf+YHPsLDIwMj/bOxLv+JPIeTgPT7NBmyqwN9TNZ9GUEMR2n+UhFKu0cZow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794133020;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=p7p1/+70L7MAnnd+Xm29YcpgFCKWlXPU/TBYjgHj2QM=;
	b=nyXu04Wwx+nTENVIfRZZHQjZJZN4IOYcf0Mxuy1VKam09SAseGE1m4PN523AzyKjInIF
	 T+Ra9YwATUogvL54s4Sq9Xd2Br/FIv2AlIqTtFn551bNgzhCUHzhICe5pE3p3h81Xt+2Y
	 udzsjp5ukxXDZ7ktojPIHHTeFUI9S1cEG6Wj/QUu0XxX2WejzdGFhXNl49COnvoKJxotL
	 dOsmHRpMLl8k7V3R0Nd2Wab3anhTTr5SkQG24DkvYwcdM4SGEFuLmxddJhC19fh60I08F
	 fWWwDO6TTToIM6O+JUEK4k88SeAsr7OKMSmkfK9syH1ZSg8VX8kh4NFvkW2SMSTA5UQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="XYU3/dg+";
	arc=none smtp.remote-ip=209.85.215.169
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9563A606A323
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 10:16:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9563A606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XYU3/dg+
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cd6028ff33fso66239a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 02:16:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794133019; x=1794737819; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=p7p1/+70L7MAnnd+Xm29YcpgFCKWlXPU/TBYjgHj2QM=;
        b=XYU3/dg+ov+8qUPBLbB4lsmzLgl/CBTKJSY2E4K83cM/N8KjsyCQIFk5cX3AyZRgGe
         AIeEAe7Hy8mTxaP/E9O/t9Nii9FqRajzm3Zs2Of+tU0KQvhLImZO8cxa4GsyLQy4epDN
         W/Vhx+oq/ryMvntkxwpfHOh1J2ODs2lAJ6Izau5vdz9FF+6TIjWwP0lnL+weX1e/1ZBk
         7MQfOSurzZAZHG60+ro7Fa3rWXODOS9Bx85W6Be0rzJ06GJPeCU2+kgN4EVRcpHnSdND
         bQ2YzCNtkylq/I519KwMg3OIopeT80lCX3JBx0fHf+a8g6QSK2QeEt6tPDCDsphHUz09
         aBug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794133019; x=1794737819;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p7p1/+70L7MAnnd+Xm29YcpgFCKWlXPU/TBYjgHj2QM=;
        b=SYGp5yCu2unqAdSrLPiZRJu5gfeUIniSgKDtChxtzEfgDwI4OiyOJbXk7Z0Su/wpdB
         2MJ1YTXTNjxGGHO2eEnx31T5+PMxWGTdOlmFefrCUo8/m+D9vovJJOmuWIMcC9UFZL2J
         kPgq+1IirCqF5OznURW9OG4CmUKjckul5dxATMA8LH7IinHrCYnZOP96hgQ73BmXmoZv
         66bxv5o7+TRIe53Nxk8wWRfQp/HFiljLH2f35TxBYvfepBvIFMyr91cPRyd8CoPJz+xQ
         vG/ny5bTO7kvIWfvDVTnoG0xFgOoryaVYi7lo2C+ZJ5AObtvZUzRM4j4etNatfuSeDkR
         NBSw==
X-Forwarded-Encrypted: i=1; AL+hErGExLGFztkf1MeHcl3HrszRvkA2KmkScd3/iX7Q/SZhdOIACUtlCdAtMxS/DpkSklqPOXcmcMTRK/Q4xKM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/C57kfjYMARQ/ekfPD/Up1vd+JxqbFc6rSGfns8ZwpDbkef9tD
	GKQig4EmRqle+OIwHIv9PMADveo9dgiQ6EgPZUPALbpEpfF6NNzJTPIM
X-Gm-Gg: AYBFou3HlxURqBX/7PtrI5txCiZNVFXnsGihNCLPUaZdafW8oeefdOayq0fd/uTGEdi
	mqmgNYkLsnbEWVxBTaLPVZZHSinkPkB8vUl0OirlIqRlGxPkP2KIKs37xwDdvPI/1PeB2M7SfDP
	X9V5MMg47ikyrW+E/q19dHm02ScUmj13d3lrIUIEDUsKhA3zVqWs0MM7sHHRAASoUPXhbk13Q1S
	zsU5VwzoPrEpfdi+QhmeMD4pDkOfAflsJ5arU5RqMM3jHK9zYHBV3Z8KdCvkNt6ADiWqb0Voou8
	h7U0swXXPcNOhmH6KUQRqbMBrkjRGoQlFiV9OBMJGd9LlLNOqkHpdhZnrV7ue7gzA8Zh2DQwhyJ
	bmg8C9Ryh1KJ3t0/jNW38twYe/jOkN/d/c5g1OMNhlixWEpN2EodKQRsK+W3S8NlpxlzmIJq//D
	deBOxqElULVZt3RdOAojUEnmsC87me9d8rmU/8jYq15+hiiW4aqf6xXLf/X3VtT6fY82ugvKVQE
	R/XZ9I+/4D1S2KoRfGC4dzu7YbFm3ZLWkfol04iOBk4HIP811ONtUCPPtE2yqkCYLuDgHPEo7O3
	PJmVB2VTutCDk+jGGe9UcH8m0Sni7Riywm/OW5UJfsNWurP8UakLnQ==
X-Received: by 2002:a17:90b:1c82:b0:3b0:9cc6:62c1 with SMTP id 98e67ed59e1d1-3b12d6034cemr805671a91.63.1794133018785;
        Sun, 08 Nov 2026 02:16:58 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac1:76a0:28::1d2:30])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b139d0a166sm337295a91.3.2026.11.08.02.16.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 02:16:58 -0800 (PST)
From: David Yang <mmyangfl@gmail.com>
To: netdev@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next] net: dsa: motorcomm: Free the MIB block on port teardown
Date: Sun,  8 Nov 2026 18:15:45 +0800
Message-ID: <20261108101648.1308271-1-mmyangfl@gmail.com>
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

.setup() can run again within one registration: removing another switch
from the tree tears the whole tree down, and re-probing sets every
member switch up again.

The hardware reset at the start of .setup() brings the MIB counters back
to zero, but a MIB block kept across that cycle still holds the old
software buffer, so the next yt921x_mib_read() treats the small value as
a 32-bit wrap and adds 2^32 to every counter it extends.

The old claim, get_stats64() not being synchronized with
.port_teardown(), is not true, so free the MIB block in
.port_teardown(), which pairs with every successful .port_setup()
including the error unwinds, so the next setup allocates zeroed blocks.
Not carrying a fix tag since there are no known multi-chip yt921x users.

Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/net/dsa/motorcomm/chip.c | 18 +++++-------------
 1 file changed, 5 insertions(+), 13 deletions(-)

diff --git a/drivers/net/dsa/motorcomm/chip.c b/drivers/net/dsa/motorcomm/chip.c
index 33e5fc127244..fd737c3e2e18 100644
--- a/drivers/net/dsa/motorcomm/chip.c
+++ b/drivers/net/dsa/motorcomm/chip.c
@@ -1994,11 +1994,11 @@ static void yt921x_dsa_port_teardown(struct dsa_switch *ds, int port)
 	struct yt921x_port *pp = &priv->ports[port];
 	struct yt921x_mib *pm = pp->mib;
 
-	/* get_stats64() might not be synchronized with port_teardown(), hold
-	 * the MIB block till the device teardown
-	 */
-	if (pm)
+	if (pm) {
 		disable_delayed_work_sync(&pm->work);
+		pp->mib = NULL;
+		kvfree(pm);
+	}
 }
 
 static int yt921x_dsa_port_setup(struct dsa_switch *ds, int port)
@@ -2006,12 +2006,11 @@ static int yt921x_dsa_port_setup(struct dsa_switch *ds, int port)
 	struct yt921x_priv *priv = dsa_to_yt921x_priv(ds);
 	struct yt921x_port *pp = &priv->ports[port];
 	const struct yt921x_info *info = priv->info;
-	struct device *dev = yt921x_priv_to_device(priv);
 	struct yt921x_mib *pm = pp->mib;
 	int res;
 
 	if (!pm && (BIT(port) & yt921x_info_ports_mask(info))) {
-		pm = devm_kzalloc(dev, sizeof(*pm), GFP_KERNEL);
+		pm = kvzalloc_obj(*pm);
 		if (!pm)
 			return -ENOMEM;
 		pp->mib = pm;
@@ -2019,10 +2018,6 @@ static int yt921x_dsa_port_setup(struct dsa_switch *ds, int port)
 		pm->port = pp;
 		u64_stats_init(&pm->syncp);
 		INIT_DELAYED_WORK(&pm->work, yt921x_mib_poll);
-		/* Start disabled, so that the enable below always pairs with
-		 * either this disable or the one from a previous teardown
-		 */
-		disable_delayed_work_sync(&pm->work);
 	}
 
 	mutex_lock(&priv->reg_lock);
@@ -2031,9 +2026,6 @@ static int yt921x_dsa_port_setup(struct dsa_switch *ds, int port)
 	if (res)
 		return res;
 
-	if (pm)
-		enable_delayed_work(&pm->work);
-
 	return 0;
 }
 
-- 
2.53.0

