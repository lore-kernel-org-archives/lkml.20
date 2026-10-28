Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793197288;
	b=VqxlXFVmdrC6saEhi/0gz6ivj560Fz9vx7uDomYZqvYXl7UG5YqzfBEFknbsR/7Zu0wC
	 RtxvX9xEsghorAFrrefIPKTbysfZXztkLLmrjNSJMU3fJv5Fr0qUMmaecCBRHlOeiZcRE
	 0hDoWAUL5s2BVSyF+zNyuIepENrmaxzaCndj1bSBSH4pATeaVBk4yvdGZBOYcCrw0qONz
	 vKiXew9soKEMl9v/TWS7v7L1prbVqSz9QNxUrtPHVaaSQnwOAcCVXhIchf9upIzKoarMV
	 YBT1q8I25Lgb3IGuo/01E9NGL8IAZKBPx7j1+7K3rGQPZ67ZksypxK7sSFMoUx/cgug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793197288;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=iVPlVEgXcfYnc5ByflI8cqyqM/yX51vQqKw2Q7ZDD9M=;
	b=cEA/LAneIndCE6ZnaQdcJQLZv5qJGfmlrkExuQqde8vab4hsd531bl0OuAqoyNqtpMgm
	 WpeHbzW5em0mgw8AkXNELHJI/Gd1NoG6T971AOsUOiR+Uoz2itbMa4TdCfGniFv3G6C4o
	 os3qzDmaL+/ySpmI9wOaMDKtV77/7mbNf6dC2vWjHmyybU6BWTcY2+xUSE2NTFBGhloMB
	 INtRrhGmqZk2vxVrpOjcNO50eKXlXU7aaQhNx3cKG+xW/PBRvKbDrtbTtKSYeXaoSBNmB
	 kBdq/WMtmQo9QNDds5uL3fiCeQf596CWSIxnUoOeWaPG1XjUWf7aSTTfL0fHSoiz2nw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nYBYvAxt;
	arc=none smtp.remote-ip=209.85.210.180
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F11C606A31F
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:21:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F11C606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nYBYvAxt
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-88cfa501c5cso548727b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 07:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793197283; x=1793802083; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iVPlVEgXcfYnc5ByflI8cqyqM/yX51vQqKw2Q7ZDD9M=;
        b=nYBYvAxtQdanTSZ59b3PuIx5c1SuFOrfLYb/dMQsaq2CcGQPSP4C9zAeW4zoAHwNoV
         mtctK+YdQfGnsgomBssdpL879SI8U7T5Mpks8tY65xwxOcNZVnLN4sm6OhrAFsRiVqLw
         QfWKKdVWlPhis9AmPbqx2cxTLMQz+un+WFfQRwHziCrjbc3DHatMD2Ol52+CwaqFuIgD
         U6Y3mSS6mFXb7RmAiBvnSenuyWjgRMjy2/hFMg/u3crczo3+kQ1tdSs6hUrnLfe8aRUL
         Coo/jQYoOZK6GJ/ykBjSlTz5OCjHAXGB962VAGGlWfAWS8q/H6YZgHFJM8bnmZYqtF01
         9BAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793197283; x=1793802083;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iVPlVEgXcfYnc5ByflI8cqyqM/yX51vQqKw2Q7ZDD9M=;
        b=1P4W2NDlv8MkPPlXUhFXrckahCcd1sm8ufbNfxxHxH5nTcTfN5Z9e8+JFvPf3z2m5G
         f2gXX3UrK2Pa3WudWu2mQhN/agqJKLL6zibSTiyrUbH1fHZOHYpBvuCSc8FKpOfaAz8H
         mbNmnjxFrEseMrMjCg3W5RsVOE7P0Nca2V5Is0b2vQzmTs7OTAKweykr7ffDfNpYKs2I
         /bz2U2lRu65qTKs7tGuUzI5l/nQk9SKozW7n17QsVL05SiWaOmi8nwkwe7mxinFJNHt9
         2cXsBFMPdyZsJ/7XA/MT7HuAFEXrAh1X/LjwzGyz7ao/daJ9Gn63RT79OgZHkqyHZ3Sb
         pnDA==
X-Forwarded-Encrypted: i=1; AKwUvByoYsdnj5Eu4Vnj9eJq2KPhS9Gu7ePKDNLeAQWBmJUzqsgFSNgNm6KAKtG/Mus/6GzYYhEvhdOZ1czg8EE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKO4RkbOVznMKvJCs3VGLHiGZyW63lJ5ZV1lKpCoxD0HEibG/Ew
	V2zPaO1HF0eKpNpIQwF2mR8/7PHE+9CoqO8y7IPOU4WWdbZzVtM1QrnC
X-Gm-Gg: AYBFou18vaeBVnVasRr2drUulzfrHW4QQVdkYwaLgZXmU4q0tspfSJ+zUkJgfvekqGb
	XrIi5llxXmC8hKsAT+QasKNMSjyIVilKXELLPnoTIkcRVlj3qxrwLT89bCGjPmj+oDxSqWEzzLH
	ClMcMViYSVqp+8PcIs006y4HDwBzkMQqoftOyL0YbEexJCgVzv9lkx4OO4QJcyi4lXRnnU80N3p
	5eg72IlRI0xKwqgJe3y7aX8C8zmLdPlo0GAAVAYbPLI0TeHD/i6IumYwobrzEb0+PbAXYXGpe2P
	/ZYFyn25YHjoqfk0VP9HwNkRmFC33/xX9MGGWXQ/ZExxBNKlJG29qYmUHYSNBeOMPjb47eAFdRt
	H4JNmwK7jABMlUBecSukLIQmU93ZRQlHEUTNV6S2c5+z4jnYTfJK3h4dm9RenzBNEWq4cwPopHU
	7Ucsu2QGb6A81tX0zgXX98V7371ofbUXhRxp/LKUIC9syogycySPqNwuV/BmCSV63g8lpuzS+u0
	BLBRNcNNuoctttIOkO+6q69Q9pFIQJ+BvoGkpHEoG3rSSHsQLx//9jiimcbFikG6HW2fn8Qdfqq
	AbDVbTCUNVtexIQEkicC7JxiwmiBm81H+nyGZY50Uj78LT7YsBKcE5zSZ5ybuWt+pJmh
X-Received: by 2002:a05:6a00:3d48:b0:84e:909:ac03 with SMTP id d2e1a72fcca58-8a6e72dc627mr1999640b3a.10.1793197282428;
        Wed, 28 Oct 2026 07:21:22 -0700 (PDT)
Received: from KRHW1CJW23.bytedance.net ([139.177.225.227])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a6dbfd4d9asm968825b3a.9.2026.10.28.07.21.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 28 Oct 2026 07:21:22 -0700 (PDT)
From: Zhao Li <enderaoelyther@gmail.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Mathy Vanhoef <Mathy.Vanhoef@kuleuven.be>,
	Sven Eckelmann <sven@narfation.org>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] wifi: mac80211: recheck injected headers after removing FCS
Date: Wed, 28 Oct 2026 22:21:01 +0800
Message-ID: <20261028142101.11994-1-enderaoelyther@gmail.com>
X-Mailer: git-send-email 2.56.0
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

Injecting a short frame with IEEE80211_RADIOTAP_F_FCS on a monitor
interface can pass a truncated 802.11 header to transmit handlers.

ieee80211_monitor_start_xmit() validates the linear 802.11 header before
parsing radiotap. Radiotap parsing then removes the four-byte FCS without
rechecking the remaining header length. Software encryption can subtract
the larger header length and pass the resulting negative length as an
unsigned size.

Recheck the required linear header length after pulling the radiotap
header and before handing the frame to the transmit path. Require at
least addr1, which the transmit path reads even for extension frames
whose header is shorter.

LLM assistance was used to find the bug and review.

Fixes: bddc0c411a45 ("mac80211: Fix NULL ptr deref for injected rate info")
Cc: stable@vger.kernel.org
Signed-off-by: Zhao Li <enderaoelyther@gmail.com>
---
Validation: A W=1 module build with MODPOST passed. In a QEMU KASAN
guest on the declared base, six truncated data and QoS-data injections
with the FCS flag reached transmit before the change and were dropped
after it. Injections that keep a full header, including 10-byte ACK and
extension frames, were unchanged. KASAN reported nothing in either
kernel, as expected for a length check. A reproducer is available on
request.
Sparse C=2 passed. Targeted Smatch introduced no new diagnostics.

 net/mac80211/tx.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/net/mac80211/tx.c b/net/mac80211/tx.c
index 32f94761cf32..f2772b1736f0 100644
--- a/net/mac80211/tx.c
+++ b/net/mac80211/tx.c
@@ -2511,6 +2511,12 @@ netdev_tx_t ieee80211_monitor_start_xmit(struct sk_buff *skb,
 	/* remove the injection radiotap header */
 	skb_pull(skb, len_rthdr);
 
+	/* FCS removal may have shortened the 802.11 header. */
+	hdrlen = max_t(int, hdrlen,
+		       offsetofend(struct ieee80211_hdr, addr1));
+	if (skb_headlen(skb) < hdrlen)
+		goto fail_rcu;
+
 	ieee80211_xmit(sdata, NULL, skb);
 	rcu_read_unlock();
 

base-commit: 25e73f1d6868c759c8eb56cad4e411692c5341b4
-- 
2.56.0

