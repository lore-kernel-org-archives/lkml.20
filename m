Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794053857;
	b=WVR+hhYmE4JNAsEuBe7FEMG1BbhH1fGUNUKsO0/TraY/gPpc+y8pJTw23V049skb4idS
	 7YA81L52SLxzanhjdxJFEG3S4sU3L3/WB+eZ6IUYHeUf1yjBZeJ6R5XLcWyV8FEQPCUk7
	 BNAncnBctUCicwFGYptJDJtBkPaqEkwxLyfeYNXq/H+Q++a0MXPTWjQNThIjSmrblZrHf
	 mKGG/WZnmp20ETVpsmfZpJbgpcSjUzzvtTtvysiM6CI0Cj+YqTqs1KTzP7QveFFG0V3kO
	 TVfobyJYN/c0aSzrWD/LnbGoGuJkwVkVDVCDt7xl/8+WukNWK03f4X8emMZ6t0goJDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794053857;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=+LTjmG4hsfDMCjMMjlOaOrFD/YTDusiKSuFamLI40ko=;
	b=hKWONen4rBg7hUSeX9gLvOQCMrYSitvsciH08HO532hM6OdkJvQYGU7wMYZ237pDCY4u
	 9+43PBhgXN73o82QWPj30DIwJxIZFgKwCBqs8gUGUUBJeh7rt2artGwOz/uej11MfJGw2
	 6z+m7utB6jKEj79u+Brg/fhvwEMImEZPhHBC6t1jmw8A+iT2qJgyBZ6PXgSnl/Scr7cPN
	 4FcAbZ11K+7Rjw0yVLp7/RWmS9t6qeD6tqfK80OhTlgkHrQD140TqBLTal2XJBv9j2BW3
	 dZr90gLx7MC1aQI8ua1aP2ahMFqsKXv/pN/j1+wh6uA7ICRQbNuDz2MazicwmJX77Gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TSEBpHBG;
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76BAE606A330
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 12:17:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76BAE606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TSEBpHBG
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2e8f2c3ad6bso8785645ad.1
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 04:17:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794053856; x=1794658656; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+LTjmG4hsfDMCjMMjlOaOrFD/YTDusiKSuFamLI40ko=;
        b=TSEBpHBG9youCAn2APNHS9CvqsQApN/oIEkCTkdkoDgMmDSJ2UneLOVy1Rt9Ef1QM6
         0gRk63y4nFUEsUn1GL8piCSOV3tYrb5DfznWvoLylcrG/JHs6B4p4h3sGPQKyWOzkl9+
         1Xc5gLKKYS22avhwHcpiqPsBA85buETRw3ByL/AJ95hULgKn7+43AhAFORDHQTEUUYKg
         vKtqe22rio8YZXeJZdr5EzLDKK3rQWcGvDI5yGwCLd8rhVgmcW85ixDTmZosIob3Y8vx
         ZfX3MX0SJNRqADDjQtx7G0RCJrlFkANNlbW8jJOIzQAFXYv9zxaITrExGhwNAZMG7nKX
         WHAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794053856; x=1794658656;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+LTjmG4hsfDMCjMMjlOaOrFD/YTDusiKSuFamLI40ko=;
        b=lmTP5b+1Jcb+j9GRNDj4qu0me+dOssS2b2/ebbecdWDhvPVscUH6CGyVCbF4PbX+Z9
         Jh6attdk85qYpCLbnrRNXoi17qV0+XlRf4jhTEEz2ShM26I8UKnGghe+rhjkDX182E4D
         j8Q+AL8DEBGRjIIJWKZOWZz7suff2Mv3msqZmWE9j2X+y8Fx2HisaEdtSm/h/UxfEUyj
         PBDdOH/IFQdH6KO59zitUuokTlgT7BMdOyhV5Q1w894B27v5Q6wX+M3E0FsKWUchYehz
         EWMwmLxJMLlTIZqxNIBPWJ4Eu0DoY36+A4Jq0yJg2YraRQ/UUZIc39Hov2rvBkGJQajl
         4I9Q==
X-Forwarded-Encrypted: i=1; AL+hErFRNZ4tATUrPpPUvkwAX+tlIbAmRRppYyr+QfpFKyqcW51h9fjJHsQcV26ArNgiOQ5H+UYgOu8kklSgPXI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/GhPKGSKFdXxbIChzQR3oFI6haM1fZyrGkRJjnygby4C1Hnrg5
	VWJApOAs1NDmHE87GTEUyYd9vRVUvXT+rFy/5HRZHG1QAwKMkXRwA6Un
X-Gm-Gg: AYBFou0/9aAQ/oEssQ9bWKCm5CHsAqXkHuXwXi9OYCiXXXme2G9OOQAyXLzLZoZd1zb
	uYQ0nRMYcGH0eRamtsrpsIfx3pRlkwsXW314f3i89Se/ny0i6Voy2UgRNXBEAfrupnYrmtmSi7Z
	rAX004Y15n3Vr++E7C65OVTYD2xZ3HQ8jFnCVZOcD8V2+ht9qq8u+A2e0vcAomSZHWlduDRlWiW
	Kkar66KqkKpKGksCyuUSKdVz2y/Y/uTw6SP3JVUStcWDbLPUCYPigSUortQoux4bhYKPlAXEUxp
	Xz2hNaBK5JtTd/CpaWG1Ueh2JfVqTruJEE8yQ9zG2EguhL/K+Pcu7Ym4szNRhFmOyXd/bgTjG5K
	GhvHJsJ7tiqd9PKu2ovnlpGMi9Kxaj1Sxeb9YFMYB9/seWv7sj5g43W33V8bhgngiGOc1AoKgfs
	Vbldwt4LNUx9juBL4dsPndRW7RqOOXfNda3boEMNmisxohdYvlKjbttLzLiHUcj9gMtAzbLJ0Ks
	4QzLAEhK58x+kecrt16XTZE+d+JztxmwCMresYoAYf/kqMjdeLFqYw+GkM6s7/IfhQwkYsQ1vSQ
	er/WcHJEhK9Y2DbD5JBXk/qponfJChuOzELJ1AB0t53lsBuOYZ9aXTEv+dEheac2kAApYRMhPjk
	=
X-Received: by 2002:a17:903:22c2:b0:2ed:2e3f:20db with SMTP id d9443c01a7336-2ed41c1f858mr55545125ad.46.1794053855695;
        Sat, 07 Nov 2026 04:17:35 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac1:76a0:28::1d2:30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed47d5f35asm12773555ad.49.2026.11.07.04.17.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 04:17:35 -0800 (PST)
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
Subject: [PATCH net-next v4 7/8] net: dsa: motorcomm: Translate FDB VID for VLAN-unaware bridges
Date: Sat,  7 Nov 2026 20:16:28 +0800
Message-ID: <20261107121631.1040612-8-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261107121631.1040612-1-mmyangfl@gmail.com>
References: <20261107121631.1040612-1-mmyangfl@gmail.com>
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

A VLAN-unaware bridge reports VID 0 for its FDB entries, but lookups run
with the unaware FID (VID 4095). Entries added through switchdev were
installed under FID 0 and could never be hit by the hardware lookups.

Translate the unaware FID and VID 0 back and forth, so the software
mapping stays symmetric with the hardware lookups.

Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/net/dsa/motorcomm/chip.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/net/dsa/motorcomm/chip.c b/drivers/net/dsa/motorcomm/chip.c
index 1b05ac29ecd7..e41fe4859bfe 100644
--- a/drivers/net/dsa/motorcomm/chip.c
+++ b/drivers/net/dsa/motorcomm/chip.c
@@ -590,6 +590,9 @@ yt921x_fdb_dump(struct yt921x_priv *priv, u16 ports_mask,
 	res = yt921x_fdb_read(priv, addr, &vid, &pmask, &index, &status);
 	if (res)
 		return res;
+
+	if (vid == YT921X_VID_UNWARE)
+		vid = 0;
 	if ((pmask & ports_mask) && !is_multicast_ether_addr(addr)) {
 		res = cb(addr, vid,
 			 status == YT921X_FDB_ENTRY_STATUS_STATIC, data);
@@ -618,6 +621,8 @@ yt921x_fdb_dump(struct yt921x_priv *priv, u16 ports_mask,
 		if (!pmask)
 			break;
 
+		if (vid == YT921X_VID_UNWARE)
+			vid = 0;
 		if ((pmask & ports_mask) && !is_multicast_ether_addr(addr)) {
 			res = cb(addr, vid,
 				 status == YT921X_FDB_ENTRY_STATUS_STATIC,
@@ -740,6 +745,10 @@ yt921x_fdb_leave(struct yt921x_priv *priv, const unsigned char *addr,
 	u32 val;
 	int res;
 
+	/* See yt921x_fdb_join() */
+	if (!vid)
+		vid = YT921X_VID_UNWARE;
+
 	/* Check for presence */
 	res = yt921x_fdb_has(priv, addr, vid, &index);
 	if (res)
@@ -782,6 +791,13 @@ yt921x_fdb_join(struct yt921x_priv *priv, const unsigned char *addr, u16 vid,
 	u32 val2;
 	int res;
 
+	/* A vlan-unaware bridge reports vid 0, but untagged lookups on its
+	 * ports run with the unaware FID; map so that static entries match the
+	 * hardware lookups.
+	 */
+	if (!vid)
+		vid = YT921X_VID_UNWARE;
+
 	/* Check for presence */
 	res = yt921x_fdb_has(priv, addr, vid, &index);
 	if (res)
-- 
2.53.0

