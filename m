Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793917275;
	b=LqN3fV4VvBX6gPotWDb4s3uQ1CENwfvCVuCrn45b3BCI78dQER6Ik2G8416z8vtQwPeE
	 AGbRJPcunTGnNg6ReMru7jb9tOzS4OBQIIOsgrlaqoIlm/9oY8/6iBYo0wzCULmkxeLZM
	 169GhGH0cOQA7FYHJ7EY0APQQhD1VyiQO26zxrYCDfNIK40ukFd7jfob2Zwpd5Dxw5drm
	 CQUB54S1YuO8F5/KAqV0FNyAGiVWjIDn1zVjZaq4jR0zlXYvfvf3a5HQpt12bJdoMOAXn
	 85kZaJXvIQYmfgtHXoEa3oeFVxtCJmcR9Mfx9FT18nlTQiua7xLMNJTAT5Mf/svXgow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793917275;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=Ppas129PwuUiw2Xw8Lcjz7A3XE0ezJjL976wMeb8fos=;
	b=0JX30cPOvFLgJOytsKiwx4WJbPdOHoL939sT/nTefQCTGboUDwZAKZjBUX4eyM/+8/pG
	 HBEscSxEg85/gs+K8+kbzWWpu7rZme6HoukX/x4wKWbIGJVzwWR4249KaA81PItg+BG/i
	 gHGilPbXCca5TKWklbItSXmpCwgynfZgIZ/BID55IXF+UMVO/UIo6Tj22hJpIpSVq8Nql
	 C7UI9/Fcw5UPhhh4z/s5fxXstDMxVtbdHVkK69ORPoeqwHpJcMCr359FCAb/Y90vQWCEg
	 XIzuzNhMfJQNz75+1+rBib5AwBNZaemAIZiAZJh+fg3Hl+MzOQAOcFLiSh8ZbsLT08g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ei07+fDw;
	arc=none smtp.remote-ip=74.125.229.8
Received: from mail-dy2-f8.google.com (mail-dy2-f8.google.com [74.125.229.8])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E2C9606D81F
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 22:21:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E2C9606D81F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ei07+fDw
Received: by mail-dy2-f8.google.com with SMTP id 5a478bee46e88-36a6ce64b95so616eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 14:21:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793917262; x=1794522062; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ppas129PwuUiw2Xw8Lcjz7A3XE0ezJjL976wMeb8fos=;
        b=ei07+fDwVksjzCrwDH10oAlXvu/ahqITqWe8qoe1bC7FXoipcduGF83vODfy+8RG4b
         DbJWVQXwdB8brnziFnLnjzrcg9QWK4kPPYyKAZ55quymum6L0ksay1Ps7FWvjzzcqX6y
         iPpt9MF0fN3iMWibQtwcW8leLr/v9+sxjVep6so4TwLRDz/waR4liSB62fLaVAULBsxB
         vBS2pJJ88SsioL4u5X+jvRzJJaX6RUJXayEyJt6FRrYKh+tUjeZ/AoxNcxveEWC7KdWS
         xoK/Oz1eVOUEi5dzMcZ/k51F48eIQEgec2XnG++AmLK0zNN6LcPEuHcRO877EwUyaikp
         Z71g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793917262; x=1794522062;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ppas129PwuUiw2Xw8Lcjz7A3XE0ezJjL976wMeb8fos=;
        b=iW5SLxOIYLBPrm4GWxdCgjX+Bpg5P13RVLxhV7ROpqc6tb8LywENSlNsxkhHFPSTmb
         Oa7hc9FqnFtpIuxxRke2bETX/kALeCUwuNp55WGxSdhN747ZeQNleTBM9gwjQPm21wfR
         sMiOf/d/YPtkjcNdHBoFI4RFCDS//GVClPz+kSfEq7f41p4NB5NqTKJVduk3rswh85Af
         eq8SUqfYIe0RREYeOxKHi3+7H1t8C3VKeVuXC8C/FWuvqFIPJbujxH+xyInwuemSGu6i
         dx6UQlqOV0RayPjZNWqkz263wYFye8duuFWWya9Fw2tir73MBlvAfz4QBwCDne/Zz3md
         Wjag==
X-Forwarded-Encrypted: i=1; AKwUvBzjLsAaqOy7Y9ZenSx9vwiI0U0mh4DosTRuhPWzAZTGjFIiWBF4Q+yj9c9aRBGbxhlLeS0kKvbtq/pb6I0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Q3ccKmmioYsXqRj2GDjr8FAd6KGZ8ev0QZkKFmH+tYFo5frFI
	nGIdJFtGGzJGCNBRTq246Iy0X055+SVAwLbEclonDfYDvYynoup2Y0Mi
X-Gm-Gg: AYBFou1CYaHb6/R2Cg7FpElprrSurkGjVsgFGFIVmLZgY2DduPyuccqyMt0Mnwa5g5N
	3IRz4XkahRk9/50A5ZFB/D8ga7J5hIZ5YKHuhQZm3RswFtlVU6czQNIoFu8Wnh7J4sb6iJhI2jI
	D8RDI4vM2BeNlx1LSAPFHk2cj4wosw6b0UBerxMHGq+StE6r7aAJR2PksQa38fnhYO7kQP2ur3w
	xktZz7ayHuLxUciQoIz+4/GouRvEh2slcvM7HhPFG+Tf54IEJWLaeo+ZhEePUrtJlVg9lprXHPT
	jhiddF+iuHw5++sBG71hel+6NCFUk2G++A6wKdZZ1hndaHT9v2LDgEzQMM/VL9iUwRun77tdubz
	+PVxppmRqXkrfEOa81vVJB0yEpjcDUaMjwey6icE7oig3najveL9zxAIQwamJYtZ6fhIRYjTWgQ
	kU7TkeaSiUJHqSRDKzgQrmDLSjbFWMmakvqo/+A1qJUjyCRMpJdNLRZVld6WgRCDlRhXIHnaoIC
	j0SHBoMNMGWBaVqUHWzA2U3yg72bgFcSzjkEJAMvNNbIGfxE7JfRyU7coyC7MX0MSqxQRh5pOUn
	IGQWbjgKWoW1wHvxOt3Qf+Ho/cP5cg5kG02fT2n/1cm8
X-Received: by 2002:a05:7301:1808:b0:36e:f2f2:37fa with SMTP id 5a478bee46e88-36f75443f3emr684024eec.8.1793917262361;
        Thu, 05 Nov 2026 14:21:02 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:61::])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa8e3a718sm39021eec.4.2026.11.05.14.21.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 14:21:01 -0800 (PST)
From: Stanislav Fomichev <sdf.kernel@gmail.com>
X-Google-Original-From: Stanislav Fomichev <sdf@fomichev.me>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	edumazet@kernel.org,
	horms@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	michael.chan@broadcom.com,
	pavan.chebbi@broadcom.com,
	saeedm@nvidia.com,
	tariqt@nvidia.com,
	mbloch@nvidia.com,
	alexanderduyck@fb.com,
	kernel-team@meta.com,
	sdf@fomichev.me,
	dimitri.daskalakis1@gmail.com,
	almasrymina@google.com,
	dtatulea@nvidia.com,
	bobbyeshleman@meta.com,
	asml.silence@gmail.com,
	daniel@iogearbox.net,
	razor@blackwall.org,
	leitao@debian.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	leon@kernel.org
Subject: [PATCH net-next v3 2/9] net: devmem: charge the frag length to TX skb truesize
Date: Thu,  5 Nov 2026 14:20:51 -0800
Message-ID: <20261105222058.944293-3-sdf@fomichev.me>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261105222058.944293-1-sdf@fomichev.me>
References: <20261105222058.944293-1-sdf@fomichev.me>
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

Devmem TX charges each frag the net_iov size, PAGE_SIZE today:
zerocopy_fill_skb_from_devmem() adds PAGE_SIZE to skb->truesize per
frag and __zerocopy_sg_from_iter() charges it to sk_wmem_queued. TCP
uncharges in bytes as acked data is trimmed from the skb
(tcp_trim_head()) and uncharges the rest when the skb is freed. A frag
shorter than a page leaves the difference charged until then, which is
small with PAGE_SIZE net_iovs.

TX net_iovs are about to grow up to 2MB, while frags stay bounded by
the skb and many frags share a net_iov. Charging the net_iov size would
charge up to 2MB per frag: a 64KB skb with two frags would charge 4MB
and fill the default 4MB send buffer on its own.

Charge the frag length instead, which also matches what TCP uncharges.

Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>
Reviewed-by: Mina Almasry <almasrymina@google.com>
Reviewed-by: Dragos Tatulea <dtatulea@nvidia.com>
---
 net/core/datagram.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/core/datagram.c b/net/core/datagram.c
index ecc30a6f8302..489d92fe6dae 100644
--- a/net/core/datagram.c
+++ b/net/core/datagram.c
@@ -737,7 +737,7 @@ zerocopy_fill_skb_from_devmem(struct sk_buff *skb, struct iov_iter *from,
 
 		netmem_inc_ref(net_iov_to_netmem(niov));
 		skb_add_rx_frag_netmem(skb, i, net_iov_to_netmem(niov), off,
-				       size, PAGE_SIZE);
+				       size, size);
 		iov_iter_advance(from, size);
 		length -= size;
 		i++;
-- 
2.53.0-Meta

