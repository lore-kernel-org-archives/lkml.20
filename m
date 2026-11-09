Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794218725;
	b=EXBOKtoJKrVJfgAKC3gRMLNKBVpB0Hmmxw4fVR6riOoi7AH09ejC4sHD2dBonBlDVsFP
	 U65hwGIwA3TnrQ3Wpg3yfYq4fhIUkN+RzsnV4GqGhSoNTrKkOXx2m1L6JCWfosfvTvpxv
	 eo2jyWIzuSWjujzWvUR+WWGXvSgL7yKvNf+PC6EjZQP6Zdt4a+DZ/gJrBg+cayzuh0a96
	 72yk0Vjl+0W/xrkLgNPk3c9P7YPazghTsUXi1bmKzaE2e8JhCn5FwE5zhw8/SAFl+i9Sr
	 6Kg2EmKoXtHIHWcv2cin/Z6agza1zIeW4NTo/C7O8lowRaalHDxLxn7f3Dn8OSCpx7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794218725;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=DsOK3xaIdRnyMSa9XbrX3s3+g6voTmIrmONsKMzeqsQ=;
	b=ofUBc06RWaW3nu3UDN9y2pV+NcufqWt8+TElee9ID/7B0sWblD2CoyDerHRbWb7kV490
	 dBEE++kIVsEjQMbxyz4v22m07IsLM4nXF/g2qb0Mr90hlmSbWFh6XiX7RJwhUvyYA55x3
	 WnhlixE9GyASCVJalIbJhoHZenfH2hlanusK7m4n+lSGgLZuiNijdvr9+ZWuQnuk3B6hz
	 dgye2Br5q0PjnEZheJfnAl/difWkBVNdbewzCpqqw5ndNfhsJhrkxvc+88HaYvT/UlUvu
	 2/XYEn86PwGtrSTxm7uld2F9QuTe/bVCW3+gGHakPZXJp+tycuNMVNoArnpfVnnWwwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wlromTHX;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3AAF606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 10:05:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3AAF606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wlromTHX
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-372bdb942dbso948041eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 02:05:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794218724; x=1794823524; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DsOK3xaIdRnyMSa9XbrX3s3+g6voTmIrmONsKMzeqsQ=;
        b=wlromTHXqlNDcGqKiVJjw0vw8vMkcQ1/dgdG8oGvptPI4AKx5hzvAG2oPLaNgi3FBT
         XraKeqI/g8Gp0q0uMl2+LBqAgILgLLZc5vCw5niwDJPw7nKvkPpMs7ntvKsBSXRqkjna
         NVHAEaV8MmPp9AVPrRot9jIqdzXn/WpvtKgR+SzbYBa+0Svk8rib0suTI2KlgKul0Yxz
         HgDP4YKrJuv/N93lA8UcqFu5pGeZaDig9ONXQELh3tWEp7lKyUCgT8uEYmdx8Wkx2Xuj
         qDH8HYZUQ517c1Sge5DDjO5vNfJIzN6PWXTRo7OVriuRACwBtT6vWoUsqe3EQbnw7gtG
         onTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794218724; x=1794823524;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DsOK3xaIdRnyMSa9XbrX3s3+g6voTmIrmONsKMzeqsQ=;
        b=q/dZCafru7Asi8rGn5c+bTRnUgaGAh8adEeqNTkvEtkBwR4sq/urQmv5hCnl7nIxt7
         VnoAyHYFp2XQRTIxYOxUXT4KjKuIFNhem/4aN16FdpQrVsYcr+CyYR/CQNnaPeH4BCEQ
         BiurAqa98XHz05SnWMpC2NDzSPT4glPgM9ql+Fp38htQv0hmKTpkUQbDzpEsz+tU4I14
         bPShTwOquCTB+vGSoJGDKxdLMVlw0gZUf3MqLaA/nYJ8WY5fA/3bypFFZpY5XcS/1qAV
         EkVQZftfTMluueCMPM2Ju0ZGogurMl9VkCeHrFpv4Jv+ntuDtJsrYXlx2K7Zdrqk7bBj
         sidQ==
X-Forwarded-Encrypted: i=1; AL+hErGyyBG/XrakjI8c60PfMSa/gmMQq3Pe/f561EJ6ru/F/4hjzXnIW2Bik1lEzUCh1YvToJ5+7iUn6B5hMus=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Km3Zg6u5eSVXrd1PXFYfESy6s1zuXLUmkZuat4bSJjsc7oi1e
	ke31kqpFmzza2utLWwzEMMOY8D9/a3mcJMkCS/uc0y3HgAo0Vi7h8B2d
X-Gm-Gg: AYBFou3423vgY463CJfc4iAHa5v1UtGZ7DtIASwbKHW/zv9UyHFJVfTbduXNrjwR95N
	q5+e4+gYCcz0rk/3x1R3AAjEBz9UDe9vPqafFDF47kn7e/zYX5GazdHEcuU2qjssmzrgh+o13UJ
	c+khB3BiKdxrpHANdLbXlHkC8/r7TZm/eo6TuOUvkE4oebT5PbIjHLvWEuQ32Ex7cx7vdo3mlMJ
	qYMvkqXrOg66EAO9s55Hz07pV1oTOraeJKzl+eCjmvLPmouFa6h+YMzTlkbL8zgyVigDvjMX9G3
	rv9VVmsD/vlm733pDAttQ/aJC1BUsfC24Yd/rA0d+ziAcb8Nu4v0FrM2Ieo9qKrSWtIsZfXJZKc
	Uo4i2CQHFlqFTCxAKCh8K10oeHTwTL6+tXGso7l8eFmf9HA+u/EY1+ccuqD95DhSoyHivqWY9fP
	bcsSzvZ64QxlVQOfAisTtQ3wOyziC6d+An+vBrg77NjEG6ynhLCoMrfQyZ+30CMgGdfJvep/iKx
	9BTOg8FFFwMUEUgwbBLGPSYGVRhxvTa0QGoUbM7HjpwVBo1nMitwmIfk4RejWkv+Cjr5bGpiG65
	oD6QYVk9Bcv85uCHrnrsy6EyhruhpVgMOMR7FQIVOX54
X-Received: by 2002:a05:7301:da0a:b0:36a:1434:c691 with SMTP id 5a478bee46e88-37256bed190mr6227845eec.14.1794218723536;
        Mon, 09 Nov 2026 02:05:23 -0800 (PST)
Received: from localhost.localdomain ([2406:7400:51:5a62:c2b6:f9ff:fe77:10a0])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-372667d60absm12886710eec.26.2026.11.09.02.05.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 02:05:23 -0800 (PST)
From: Amaan Cheval <amaan.cheval@gmail.com>
To: netdev@vger.kernel.org
Cc: joshwash@google.com,
	hramamurthy@google.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	bcf@google.com,
	jordanrhee@google.com,
	przemyslaw.kitszel@intel.com,
	maciej.fijalkowski@intel.com,
	pkaligineedi@google.com,
	maolson@google.com,
	csully@google.com,
	willemb@google.com,
	yangchun@google.com,
	npl@google.com,
	awogbemila@google.com,
	shailend@google.com,
	nktgrg@google.com,
	maxyuan@google.com,
	bpf@vger.kernel.org,
	john.fastabend@gmail.com,
	hawk@kernel.org,
	sdf@fomichev.me,
	daniel@iogearbox.net,
	ast@kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Amaan Cheval <amaan.cheval@gmail.com>
Subject: [PATCH net v5 1/2] gve: refuse XDP on queue formats without XDP support
Date: Mon,  9 Nov 2026 15:34:36 +0530
Message-ID: <20261109100437.331423-2-amaan.cheval@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20261109100437.331423-1-amaan.cheval@gmail.com>
References: <20261109100437.331423-1-amaan.cheval@gmail.com>
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

Commit d8a8ca14c937 ("gve: add XDP_TX and XDP_REDIRECT support for DQ
RDA") enabled XDP on DQO-RDA by dropping the queue_format check from
verify_xdp_configuration(), which until then refused every format but
GQI-QPL. Nothing replaced it: gve_set_netdev_xdp_features() advertises
no XDP features for DQO-QPL and gve_xdp_xmit() rejects it, but the core
only checks that ndo_bpf exists, so a native XDP program, and an AF_XDP
socket on top of it, can still be attached on a queue format the driver
does not support.

The DQO-QPL RX path was never written for that. Its page accounting
assumes the driver keeps a reference of its own across every handoff:
gve_xdp_done_dqo() passes the buffer to xdp_do_redirect() and then
recycles it with gve_reuse_buffer(), so a redirect target that releases
the buffer synchronously, such as an AF_XDP socket in copy mode, can
drop the page's last reference when pagecnt_bias runs out. The page is
then freed while it is still DMA-mapped and registered in the QPL, and
the driver posts it back to the device.

Refuse XDP setup in gve_verify_xdp_configuration() whenever the driver
advertises no XDP features for the current queue format, which today
means DQO-QPL. A zero-copy XSK pool bind is already refused by the core
for the same reason, and a copy-mode bind never reaches the driver and
is harmless without a program.

Fixes: d8a8ca14c937 ("gve: add XDP_TX and XDP_REDIRECT support for DQ RDA")
Cc: stable@vger.kernel.org
Signed-off-by: Amaan Cheval <amaan.cheval@gmail.com>
---
v5:
 - Check dev->xdp_features instead of queue_format, and reword the
   subject and message around that (Joshua).
v4: https://lore.kernel.org/netdev/20261106114551.212675-2-amaan.cheval@gmail.com/

 drivers/net/ethernet/google/gve/gve_main.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/ethernet/google/gve/gve_main.c b/drivers/net/ethernet/google/gve/gve_main.c
index 2437cd8ba633..fe560f5c5408 100644
--- a/drivers/net/ethernet/google/gve/gve_main.c
+++ b/drivers/net/ethernet/google/gve/gve_main.c
@@ -1723,6 +1723,12 @@ static int gve_verify_xdp_configuration(struct net_device *dev,
 	struct gve_priv *priv = netdev_priv(dev);
 	u16 max_xdp_mtu;
 
+	if (!(dev->xdp_features & NETDEV_XDP_ACT_BASIC)) {
+		NL_SET_ERR_MSG_MOD(extack,
+				   "XDP is not supported on this queue format.");
+		return -EOPNOTSUPP;
+	}
+
 	if (dev->features & NETIF_F_GRO_HW) {
 		NL_SET_ERR_MSG_MOD(extack,
 				   "XDP is not supported when HW-GRO is on.");
-- 
2.47.3

