Received: from mail-yx2-f11.google.com (mail-yx2-f11.google.com [74.125.224.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A46C4A3D42
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 13:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791553966; cv=none; b=pMQpzYv4r+IYhmUMdzOSJJV2f4QE0FnfuyBQZtIaQkePxGatXcU9pW3iE8f1AWF+ggfaogmtm0PUt9yFYXQsW4OctMyjTg4P4wLejmAn7TALnDfnQQi/NgQwUZTuMCLOfWZ9OssGUpFiJACZ8UnV8h6M6P4w+zs2SWWjKiWFf3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791553966; c=relaxed/simple;
	bh=DXe+yl/758ldn4COJlrHngabU2zRVDG8V3eMr1W9CDk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TODF5fNEZUL/8S1oTJJqg7joROoQjfXmAp0y/TdKAX8WNxLrlzEFkSck7mtVYOyZhvAHy4k0ZSz3Q8TqP19K4WUbUm82gHe2ENqDAFDGpbKZjK4VX/OC5/Qyk+5fNgQjV+FI0PHnhvsWTr/Zj18mW8uXdfeTnniQ4nGl5+H7cAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sy15pmZC; arc=none smtp.client-ip=74.125.224.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sy15pmZC"
Received: by mail-yx2-f11.google.com with SMTP id 956f58d0204a3-66c70f7a790so2364226d50.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 06:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791553963; x=1792158763; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=F7NrTWWsqXS9lZm+YxHOiLKgxHz++wuXFJ1PI/C24fY=;
        b=Sy15pmZCjqzmiCnxqRkCfiOOHXjVjJzO73p5KQbGVIfOiGLEJM6mrvCOTNj9hFkhbR
         0npvggm4tHe0Q34HTIRNtCaCILOuFJ+tIgy3GoJB1KuAnRu2pqJGzUUkoxkrDWyZWQ5w
         WNoVtGICI1H4d8yRKPbU03bAJs8Fqk3FhQyD6/s0QkYb72jN7tG+m4IdRDD2sSEmE4hc
         2U42HFRHH337Idlb1UpieqHUJF+tdKk1/bhUdUejYQHoGHB6l8y/xwm9/N8eHYeW/BSA
         6RIALxcFc8sJtCQYg8hRUXropcUYH61MjqNQcPY4EeOxc0K4uHlZTXPjjMaL+juye3RI
         9Sdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791553963; x=1792158763;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F7NrTWWsqXS9lZm+YxHOiLKgxHz++wuXFJ1PI/C24fY=;
        b=ytOJz+MnFj5tGbPU3ADQcvrSoAYg5KXN88D/7HifeLHG4jCj1iRoIF70XKbNlNF4bB
         JmkqZskJtVkEkxIMiCFm3ef6Ntx7NoGAKbd2ThSjFQVbxC+Kcy43fGai2siKo/+MgmA7
         hU0tbIISB/S2kKKdWg7NpfnZUDOrPRj2XCSAID6NDl6OOp+hAEy+PUWiQcLh4wVLjOgr
         zH868AM+mywbqwRvvkdml9lXBSi+Fxab2meYSESwt0cHDLYQJFLaiL+iWTxAsTOnjSJ0
         i+9gEBszZTrJ0ZwatFY2/W2W5RfNjxvG2Ts4LosVlsSDVFCk9/JTehyFA7TpnKSHpV4g
         0Faw==
X-Forwarded-Encrypted: i=1; AKwUvBw5zuhwyEhT3pHkNSzI/UFKPQ6msQXwG7Mo7bZvLGE4tB4jCQBU91LJ8xbipg86PrIVQMH7BwqGVMwe23Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYKg1efon75bx0T8XEdCuMsAEtgKwiYLVMysRymX8N9wld+HcBAp
	9Vk+PK56nvKAhMd6XkyxuFBiuH/cOA/PomKFWc14pMfQSb4R8cIQlzNX
X-Gm-Gg: AYBFou3R+oBKWZhJ2OgZScXCh0cLp2cQ4c5UyihirgZYsoMC8ir8yN6RR/sXc/h/Cx/
	j0PuZjc3lM+xG1IMqF3WpmmNnKESB25JFif+lPFJGayF4RH+ztRqgry9zCsa2RK3oh7EGjHA0Wb
	PXGXYpjiEQl4z28fuerJCpXNt8ywFFNieY76iY1+U93few6vFLtMmuZgbVnrGCRulWe1XDYzyRD
	kCkxefobR4R81k5bKE5P+IYaw6iLWwCP4dDJQqaqc+VGMQQN3cwi75VFYWwZXhY75SbIlCULar7
	DJ+fq0GJCyfRTyFVgS5gjCpLreKgu5cEcAb7kMg9Cp1cU8WBi1TRHS7av49cklIPaI3uFrJIuvh
	HlSfn96JiZPRPJ58lt1JjBxIHWksTu2AXSNbuNgWl1wvx8Sa1ijjklQ8TAgKKNjNTVFZRp0yS8c
	5DZjzBLgUelp6+PLDaukoeBfOg9qCVGIEbBg4euC7/vunbMy1BOmb9NgYe6OWXHSUDLu2aVi5VY
	APvLgG7ZrdNMx8nG8jtukO7Pn1quuieg5tgng==
X-Received: by 2002:a05:690e:4594:10b0:678:3418:8cef with SMTP id 956f58d0204a3-6793629e1e6mr401658d50.100.1791553962890;
        Fri, 09 Oct 2026 06:52:42 -0700 (PDT)
Received: from localhost.localdomain ([14.116.239.40])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6794057ac87sm111053d50.1.2026.10.09.06.52.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 06:52:40 -0700 (PDT)
From: Henry Martin <bsdhenrymartin@gmail.com>
To: Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Henry Martin <bsdhenrymartin@gmail.com>
Subject: [PATCH net] esp: fix out-of-bounds transport-header read after exthdr walk
Date: Fri,  9 Oct 2026 21:52:32 +0800
Message-ID: <20261009135233.4084239-1-bsdhenrymartin@gmail.com>
X-Mailer: git-send-email 2.43.7
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

esp6_input_done2() computes the transport header offset with
ipv6_skip_exthdr(), which walks the extension header chain using the
packet's self-reported header lengths without ever comparing the
running offset against skb->len, so it can return an offset past the
end of the packet.  esp6_input_done2() then reads the 2-byte source
port at skb->data + offset out of bounds.

esp4's esp_input_done2() has the same class of problem from a
different direction: ihl is taken from the decrypted inner packet and
is not re-validated after esp_remove_trailer() shrank the skb, so the
2-byte source port read at skb_network_header + ihl can land past the
new end of the packet.

Reject the packet with -EINVAL when there is no room for the port at
the computed offset.

This issue was discovered by Tencent CodeBuddy Security.

Fixes: e27cca96cd68 ("xfrm: add espintcp (RFC 8229)")
Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
---
 net/ipv4/esp4.c | 12 ++++++++++++
 net/ipv6/esp6.c | 11 +++++++++++
 2 files changed, 23 insertions(+)

diff --git a/net/ipv4/esp4.c b/net/ipv4/esp4.c
index e76db5817e78e..aaff5a2b659db 100644
--- a/net/ipv4/esp4.c
+++ b/net/ipv4/esp4.c
@@ -744,6 +744,18 @@ int esp_input_done2(struct sk_buff *skb, int err)
 		struct udphdr *uh = (void *)(skb_network_header(skb) + ihl);
 		__be16 source;

+		/*
+		 * ihl is taken from the decrypted inner packet and is not
+		 * re-validated after esp_remove_trailer() shrank the skb;
+		 * make sure the 2-byte source port we read below is within
+		 * the packet.
+		 */
+		if (skb_network_offset(skb) + ihl + sizeof(__be16) >
+		    skb->len) {
+			err = -EINVAL;
+			goto out;
+		}
+
 		switch (x->encap->encap_type) {
 		case TCP_ENCAP_ESPINTCP:
 			source = th->source;
diff --git a/net/ipv6/esp6.c b/net/ipv6/esp6.c
index b1c9b36f76dc4..89e8cdf5a26b2 100644
--- a/net/ipv6/esp6.c
+++ b/net/ipv6/esp6.c
@@ -782,6 +782,17 @@ int esp6_input_done2(struct sk_buff *skb, int err)
 			goto out;
 		}

+		/*
+		 * ipv6_skip_exthdr() can advance past the packet end when the
+		 * last extension header claims an oversized length; the
+		 * transport header below would then be read out of bounds.
+		 * Make sure there is room for the 2-byte source port we read.
+		 */
+		if (offset + sizeof(__be16) > skb->len) {
+			err = -EINVAL;
+			goto out;
+		}
+
 		uh = (void *)(skb->data + offset);
 		th = (void *)(skb->data + offset);
 		hdr_len += offset;
--
2.43.7
