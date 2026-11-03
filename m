Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.6
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793749919;
	b=rSXJhVdIzQ7K8hctT/OYbS+WuYTmms28xgDXKB7fm7OZTUKnz0vcpSTAw6LZyWupNHhj
	 ZwX7YghIjcC4Vxj/mdM5QqGSYfOXM6GPQux5eXHOMSowmJ0OaZ/qj7Vt8dHNVECsQf9vm
	 0MWh6pYPZY2yuBARS9+pslepDpB8tRS715lfeYlktjqVfnUtfZNjebmT+Z8tIYtmQmLOL
	 vJxyWFORb6RzSPom4yQMH5ZGRVv5PdbMIQluDnMiESdLVdRFGUI/PrbyZiEAbpwJ1ISmC
	 EZWnFsCWtR6Zflux6IUxiPfJKODhS7hgOW3Poj90xnhJKuFRyXIDOqeK7llgIRkasOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793749919;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=fJ7IQIOXNs//1G8hg9c5EGbjN6OnBWvPLJeIH74gcIY=;
	b=RJagWEjLF0QJkybt/MxXu00L2hRFra8WCG1LUUxM6fxC+9+6MlJy85yF3cpKiAi1wOYX
	 2ol/pBBgZY8+L4xQfwyoqxXu0Hlh0GulmX68fmRjnOIzhip1nvXtMBugOLBnd3fc91F4j
	 EQTeSSwi7UBIPt7ORtK3nCkotvwtC3dKLDP9jAKrIPeYQUEvJIrCHOl1Bbr7ZJ66bRxmG
	 oN5alJ05jWUrcCZMK7bAALGhTfRn+O+aWiSvtjYvkETORg98s4ySKw+gTRJp/E5mJUy6D
	 OzQh02OFVqpVe/VtMT2Ncr2fXFOsly6IBOdgiTwAoeRd9H1fVNsXHu3oaVUGlZdCLHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZWA6wz+g;
	arc=none smtp.remote-ip=74.125.229.6
Received: from mail-dy2-f6.google.com (mail-dy2-f6.google.com [74.125.229.6])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C01C606D819
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 23:51:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C01C606D819
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZWA6wz+g
Received: by mail-dy2-f6.google.com with SMTP id 5a478bee46e88-35adc681e1aso106691eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 15:51:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793749917; x=1794354717; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fJ7IQIOXNs//1G8hg9c5EGbjN6OnBWvPLJeIH74gcIY=;
        b=ZWA6wz+gpgHjh1WQ5eaQidrNz4Hzm3YQ8yeDFG++7giIdaEL6V0GQwJaQi1OskRj0k
         +zip9+d3WalbJESP2kwkC022l+JuQR654DJvkHmcsyNWZMTCvN0ElGkjE2tAcUQYah5/
         gSpizDmU3DsXOnWZpLiDpfqOmhZ8YQaP/9tWHA1qp5AhqlxO89TPz8gwG04DxQ8lgaan
         pOiYTu0jO990rh37d2ZAEwe0SqDrBe4tBitHRe7tiwWn0Dmk/K87zRQ2aeznObVW2CHt
         roz7IHwemorr2dqr8E+YfCKI4huU4b5tkmn1VJDT5U6JVMlV7QRteohMjbiWP3pu9S0p
         pU5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793749917; x=1794354717;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fJ7IQIOXNs//1G8hg9c5EGbjN6OnBWvPLJeIH74gcIY=;
        b=noeoF9xBL0S9UQ23hGBDNz6Lut5d68i42+iBVEVF7db9O4nHzf1Gi0G46zz2sQqjwL
         lcepIADOgpPFFYHt9UPz258vM0E0rrovgSH9bmYSm0KUB+mGupClLJYhpHbUDFpDPE3J
         JP4C5GD7gwVH5CYYKR+Mr4OZ9EzrkQaYWIA8Bb2TF1ZJyV77rNrpsaMXMWuMK/2hhvRU
         1pALvIYQoXfM6z6nJJW40E3qX0wO7IpT1CfzUDygA5dK8W8yBKCKUlGE2nOZ0Xefzer9
         kAuajpuSBgqqlYbV+ZESWrc9qO6gb312+MabNtHSlhi2N9i+Ou/qwe8FR1bxsJlZgA8R
         gppA==
X-Forwarded-Encrypted: i=1; AKwUvBwGrcyfOfWXCu4sNsxJdNYKLXoK5wXZHEIMeE2ID2fFi8Zn1BP48p0dGuCxjTZpElHV8+bnp1PlQhtxsHI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ayNjY4g34CjN6r6sXo0NT0u9nP1iC5wGMF/GuwZaKJauCrlxX
	wXvXaWbKrjdTp/eh0oH+TcJje9gzEnOnMtYay06wtWw+4q1iTHxR/oB3
X-Gm-Gg: AYBFou2bDu9uDMQOfTab5WDDwj5JEFYwYOfxT61urBW00SUqON/KMzV6gk5NVhdpLjX
	FVitdKhQvLugRjVivs5ADakBDDvLay75bICsQ2X6WFUJuUFNxigL+DyVZiwg8r5MKEf9lR0lBqz
	XEhijsa01q26WcD9IgBpS1lFA5us186bRb/v1hXMoiZhvO26lQrNEx5MbgYCRJpzsotH4ttTJJS
	6AufWPTbH/BWyLgJTMlgIoaFUSxWeXIVGs+dRTmauGIOBCAhalvzSgsv0auP4XBKsrNarEYnam/
	0eqxkiYtvQwlqxM57gIveZh6qWcciBq5606tONZNlEuogb8aG51tdhrsvw/ixVscPYLJhJIfnpI
	MF8LTUwXw4Mb17lIcesA4EvLTfRq+R10Houkgm0G0GCrfc4+j6mR3VlcJFPehZypMhwSYroUB+a
	ljN5nkuOUMHkQYAAO7PRHlYx93ziGND2qh/0pLCskGwitK6Gs/QlLIXqQYvqZirwvv7fvbykaJ0
	X+dIK2OCXhxmQrWrUr7dbiaW7xBPoRaTRDcXFQIn/QohXttRLXIpmtm33Rmx3MmqsRcYvSfA3Ir
	ivakAYxjr0S9MBvRzYcsx0A=
X-Received: by 2002:a05:693c:87d0:20b0:36a:18a:e00f with SMTP id 5a478bee46e88-36a42406487mr23417013eec.34.1793749916956;
        Tue, 03 Nov 2026 15:51:56 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:71::])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca39b8eb3sm1876335eec.27.2026.11.03.15.51.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 15:51:56 -0800 (PST)
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
	sdf@fomichev.me,
	almasrymina@google.com,
	bobbyeshleman@meta.com,
	asml.silence@gmail.com,
	razor@blackwall.org,
	daniel@iogearbox.net,
	leitao@debian.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net-next v2 2/7] net: devmem: charge the frag length to TX skb truesize
Date: Tue,  3 Nov 2026 15:51:47 -0800
Message-ID: <20261103235152.1904727-3-sdf@fomichev.me>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261103235152.1904727-1-sdf@fomichev.me>
References: <20261103235152.1904727-1-sdf@fomichev.me>
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

