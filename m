Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.228.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793327588;
	b=YQr/StxzZ9kDt7aEy2+21Bk8th9bW4M7GHgTsbLcLpca56cbCWdNfH03//OGLoPrUeyx
	 vKAo0ozXARxydnEwrbyLZGr1SwUA3rGADV0UQ0i/Qvzhr77n3Z5kh1+5vlMtY8Z4DJ6O1
	 vlcuK7vatXn2ZK3tShWSl7gDR1Nj+glT6uLBia8yY6vsdL1wrDJSb+Hvl/08Ig0eCni8M
	 982FSA0UV1Iduqe/yrl7ldltjVnfW1uE3HbC77uTOGckgzerx/uh8rFcw6o+iTkZcWAoP
	 Ir7Uwx1HEHoW4kyykz1Hvfd2PNfWpQ4RIM881NwbWoiUKVW6wth0AJAIZV4wzXVO1qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793327588;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=SIKkfA67UvQRqidJv7Hfli6cr7/y7nUfM2Bx1BgiLkE=;
	b=srf7saPlvNN/MQZ2c8ea8KvB7qMP6vIKT99GJUooDUZ8bQriTPvFr63wuOtFkEIFV5QI
	 bcZNJ9O/n2P6umTPd2U8hZzHj5wQtZU2VayGbW6xFo14AuOJg+JSs86+phREDGxhpsAFE
	 uC+Tvwt3kd6vUYNAwxa28PsQoaQng3QVaTKw+v6ZQVo4ZxuCKBVBBXVk2M0f6g85Pt/Ms
	 ppkHzHPkomX4a2yGaLhf6bO3JtJr4ssqIHUi3O86TnP2IRJE5vyXkYOvX/XT7y5CgaYFE
	 LtqzA2oa4VGqE5ml65YapD3RCCoEGn4TByiEEDos4whrpNQj6Mfex3kSYoKzYorVVBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QyXdKLmK;
	arc=none smtp.remote-ip=74.125.228.8
Received: from mail-pz2-f8.google.com (mail-pz2-f8.google.com [74.125.228.8])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C711B606A323
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 02:33:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C711B606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QyXdKLmK
Received: by mail-pz2-f8.google.com with SMTP id 41be03b00d2f7-cd1da63bff6so2623a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 19:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793327587; x=1793932387; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SIKkfA67UvQRqidJv7Hfli6cr7/y7nUfM2Bx1BgiLkE=;
        b=QyXdKLmKaR0WHK0cJTyFaUEpfibyyQ5fW3kfeppI+vJOMhX/FDqjeS5UvEkcfOh/Uo
         1Wshvu8W9MHdPi+8huvuLQyvCeClepU067PEo9L6qJSpL3CLideAGORYNP+htWkiex35
         cuuJAzAs60zHbt9J/E0/3obXUk5lF8JFwiBzv/wsVpJ1WGdxrVyuTWIJjTIDNVs2eKAo
         x8+ehuhDeYWrDvVihQjj1onRG9tt+RHuw9H+aoVnYhPozwBhthzYcwLwFNEn889tbE78
         qia9oIKxu6TAi7PmpnL4ocyoXPtmVJtBOpTsYLyaFb6R2iZyosdbH9WnJkpghCJWGGoc
         Mc9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793327587; x=1793932387;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SIKkfA67UvQRqidJv7Hfli6cr7/y7nUfM2Bx1BgiLkE=;
        b=sZ11XQtAFBODgVt7VZor7mCy3a9zxdrLQNPioqwTV6cmPYYEWYZKEgYPoM5SeDqzAQ
         t2XyPTRX6mttpAKa+5DcXForTwKo5vD/h+e/rUC+lkmw36L0TeutnHen1752ZOgWJmUe
         3SU32uQKjAqNvBI366H4OVUyftS/xbLkoP2wq+2KqspEqKlQbIMIYSAPpJhEDv4IgRz2
         3VGhvckfyikNrZEzEPX6/dpPHdWmson0XTPbzfg1Bp+92Dnkmx8AjCLfP7DBx6mQEtB/
         LR0BVrE2W+BPfUJhVzXTBDwII0pAnP0LFmJYBCdutl1kEVrn9c1TsbJSJIDfOax91Hz9
         wKwA==
X-Forwarded-Encrypted: i=1; AKwUvBxWsZ0ktFoFwLh+Gb0nCEo4pQkjxHpQNwmZBwNydUpCOuwNMgOKw3YOjgoySSpeAm76GCJCdOIkCkuMYWE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJDiALohVL8fpVQ8lWFPVWOPZD0f69r5pFNm0CMOhVXbBGzgsAP
	MEQo+VgKi41Hd6tWfbpKsY2q8/bhO5OPmUJwLJLgSgLyGgRt6p5hgpt9
X-Gm-Gg: AYBFou2zWbj5+Dr/FhCIpet5oqpUkj3Ho0SeTw7AfHJRTpAak4OemR4hd61wmHtbuCj
	Yam9ka98f+1BT7CXjIk6hJscc+E/Y0dvvwovnI7x1Pj2zFE3Vq5t6CQtks/jGUxTypzVNmmaBBm
	KNbwZVlv9ZW2epnMU2MrT+6eT0ZHu9b4cLx0RlWJC2LzCvLhimilnIfepPxopLa1Jc6uzT6QTdq
	Bmq9U/O3o3E+IMyf9/JKPwTMYQgUpCqgnYCYWx5TrmLGPZwh0f2l5/ozVAj2qTF8nGLgYGVQHFP
	S9+3ZD+b/8NojIdP0ZkeVXeR3D6qdTu4wao+uR5zewPgWUWvwqq6oEYrR6hG1R7EazDnnM+vTWU
	jQwGAoFOjaYsFUnmeMwuGXdW1zV5GfvClEDeGX13u3+tzpan3FMlWUOqCqeww65BT9tUpDhkeYF
	eAdTthhVKEkeWrMBLEUk9w/F5xXPWe7WD7oNkc1Q8GdPjoYHYad7thUGzyrxUB9oYFyK8OFO9/3
	9uAp6TGAy22QeoL9Ekd9XBMdoairwZhNgFXQBhEIPmJu4OWLPBCnaIhBj1+Yafj1UUjwauSlPjZ
	o1qyEknRu1cW8O9u1AhyxNbpq9anehDCz/eZ4k0LPpaeAoCVALQqmag=
X-Received: by 2002:a05:6a00:a256:b0:882:2195:5a73 with SMTP id d2e1a72fcca58-8a9bfde0494mr516804b3a.29.1793327587137;
        Thu, 29 Oct 2026 19:33:07 -0700 (PDT)
Received: from localhost.localdomain ([58.247.233.220])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a9eef95f2dsm152216b3a.10.2026.10.29.19.33.00
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 29 Oct 2026 19:33:06 -0700 (PDT)
From: Rongzheng Wang <testwrzwrz@gmail.com>
To: netdev@vger.kernel.org
Cc: Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
	Magnus Karlsson <magnus.karlsson@intel.com>,
	Jason Xing <kerneljasonxing@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	stable@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rongzheng Wang <testwrzwrz@gmail.com>
Subject: [PATCH net v4 1/2] xsk: defer software checksum until the skb is complete
Date: Fri, 30 Oct 2026 10:32:47 +0800
Message-Id: <20261030023248.78802-2-testwrzwrz@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261030023248.78802-1-testwrzwrz@gmail.com>
References: <20261030023248.78802-1-testwrzwrz@gmail.com>
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

When XDP_UMEM_TX_SW_CSUM is used with multi-buffer TX, xsk_skb_metadata()
calls skb_checksum_help() while only the first descriptor has been added to
the skb. The checksum therefore covers just the first fragment, and
skb_checksum_help() sets ip_summed to CHECKSUM_NONE, so the remaining
fragments are never included in the checksum.

Move the software checksum calculation to the point where the last
descriptor has been added to the skb.

On a checksum failure the packet is now dropped instead of being returned
to the application for a retry. This path is not reachable with the
existing metadata validation, but the behavior change is intentional.

Fixes: 11614723af26 ("xsk: Add option to calculate TX checksum in SW")
Cc: stable@vger.kernel.org
Signed-off-by: Rongzheng Wang <testwrzwrz@gmail.com>
---
 net/xdp/xsk.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/net/xdp/xsk.c b/net/xdp/xsk.c
index 33475b180ea6..aa6b010192ad 100644
--- a/net/xdp/xsk.c
+++ b/net/xdp/xsk.c
@@ -1011,14 +1011,6 @@ static int xsk_skb_metadata(struct sk_buff *skb, void *buffer,
 		skb->csum_start = hr + csum_start;
 		skb->csum_offset = csum_offset;
 		skb->ip_summed = CHECKSUM_PARTIAL;
-
-		if (unlikely(pool->tx_sw_csum)) {
-			int err;
-
-			err = skb_checksum_help(skb);
-			if (err)
-				return err;
-		}
 	}
 
 	if (flags & XDP_TXMD_FLAGS_LAUNCH_TIME)
@@ -1030,6 +1022,15 @@ static int xsk_skb_metadata(struct sk_buff *skb, void *buffer,
 	return 0;
 }
 
+static int xsk_skb_sw_csum(struct sk_buff *skb, struct xsk_buff_pool *pool)
+{
+	if (unlikely(pool->tx_sw_csum &&
+		     skb->ip_summed == CHECKSUM_PARTIAL))
+		return skb_checksum_help(skb);
+
+	return 0;
+}
+
 static struct sk_buff *xsk_build_skb_zerocopy(struct xdp_sock *xs,
 					      struct xdp_desc *desc)
 {
@@ -1275,6 +1276,12 @@ static int __xsk_generic_xmit(struct sock *sk)
 		if (xp_mb_desc(&desc)) {
 			xs->skb = skb;
 			continue;
+		} else {
+			err = xsk_skb_sw_csum(skb, xs->pool);
+			if (unlikely(err)) {
+				xsk_drop_skb(skb);
+				goto out;
+			}
 		}
 
 		err = __dev_direct_xmit(skb, xs->queue_id);
-- 
2.39.5 (Apple Git-154)

