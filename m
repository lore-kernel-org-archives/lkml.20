Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793646882;
	b=rIaFhd+Axv1JoupCx5padIYODWSkd6+FHWq2xj+fnxVW+pShqIXIp+GtHLjid2dO87wl
	 RVIPZ1aTCuPcoJAcj+UHMNA4bSnmbnBmRS6tRdPF3Zj+dN1DCSVBlMOCTWutYRaeJ3Suv
	 s1k83rX4c2LL4DNzjQXXzqoub2AfgPiq+93o4U3FMnGfBbgNd8RLz/q6RhZhA3V0kxGy0
	 aQvrAF7FDz9mM43JrPP+kVXdJ/EcEKgNIjKagBFQRf5FsS58PD/81hN/IBAtogDVYEL1/
	 Ny2p4W4cO3MNH0pOyThnfpU+KXF6KeyHAHn07cWoGvGtKjgQ0kpEkoqkM9YeoKAAhWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793646882;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=j2ho1C5cLiBr/3aZdyT0DQh3Y6a9MYv3XZDcIqBQFTI=;
	b=MuREeX6FkTJ4iWGOZ3Ypy5fl/vWKk88zSd/W4B3pMv5v9lFRoEjKDijzaK8TozbIsxz5
	 8F3S9PEoPgo92XzqSJRvlkn+ywPXil73Bp2+Ve7PhbIZ5ZhrNrW2yzKxL8GnMDLs4pNkO
	 e4RELLCtCLwARvOoNIlMT1iF0tD8Gwj/SrWgp90VYv5tRj10Ud0qvZttW6L5jdYYTax2z
	 TYiRVBinr4/booxQr6rkirE2YQl8m2kdgsOLLKmnP7ZeXL++Jmwr6bBQXQ1fRERmhgGq+
	 QKLy9EBO3Ta85BM3U1G1kL+gRc4AmPwE1+KCTZcRkiPdSYT6jYz/3QZtMcP/877yroQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h1pyNmTK;
	arc=none smtp.remote-ip=74.125.229.135
Received: from mail-dl2-f7.google.com (mail-dl2-f7.google.com [74.125.229.135])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50E69606A334
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 19:14:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50E69606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h1pyNmTK
Received: by mail-dl2-f7.google.com with SMTP id a92af1059eb24-14345ae29c5so1391984c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 11:14:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793646880; x=1794251680; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j2ho1C5cLiBr/3aZdyT0DQh3Y6a9MYv3XZDcIqBQFTI=;
        b=h1pyNmTKcYcQnUiwUTUVjsqTy0kaz03M4BfbS/GlAuNuz+KfHvuLTfOEYvXGI94d8f
         mgxcWfCy4TxFZT/E6tvueuMo1h0KNnkcD0qVDqdv8OtZBnhPoVxWI63l2B0uQSmpe+O1
         gMsd1rTaRUkDE93+77cEJSqmfKefeSX1f9DTlEPuq0PHainXMPJHlJ86zYUq+AKO44MA
         FDFugdFz+CKDPm3z6Ze+stKoZjGNnFlMMGX6mXCskfH6CvSS5RQdUIXRK+utpSa/B2dw
         qDCxwytTP3hJcWgQvdfc9UhEYO4rEHkSUXQ0djJNa/9puuJC81CBPEPvGwnWuKJSE46K
         Bmcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793646880; x=1794251680;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=j2ho1C5cLiBr/3aZdyT0DQh3Y6a9MYv3XZDcIqBQFTI=;
        b=bhAPaOgTrdPjbojAVkGdoU1CrpdBYEaMmAyePqgaGLuXZPqoN44OwPbvC3BR2QpFQc
         t63Lnf4ffCWa39jg/5TgAIxuAKM5tBW6k63U2zKeVbJaygP2hJXTKX0icXeaPF0AlN/O
         pRWhZEeFQVqGUMz8kI0VxWPWApK1IDmIWfEpNNynKKrkyYpz4Ia87EIN3RrM5P2pHXDt
         //VG+FUWWxdh5sVHZ0kY3zFQjUACUlrnf/ql35Sy0+NnIsyIdRdkcI3cbuPeMUE+/FJx
         AnlmFqrvyo+MQjz9eDG2Q7Grf7dKwThsPqLaJeDJurLk2r3QSA6AxjIM+E/01hQlByMz
         Q4Pg==
X-Forwarded-Encrypted: i=1; AKwUvByW+B7nRXuR+hY1P0fcIb2o4ivoSuNH11U8ZOvEVd1aQEUk2YTwYdNZXu/PlFjEHjDuEHiZdpAQEc3InRY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLRDJJTZ08ZmZwKxxxUcB2pCP8s/cAWozUYu3KOtg+e02BT4BSm
	fMiQ3TcW2UkSfSqkh7Iu76SDgbh3JmN5Y4hm7LReChI2ylb271vujxdc
X-Gm-Gg: AYBFou0qgaEV1j9e7hMQFrRQokkTMBsQgylPaGv+tzXcufLMoYcZL1q58zZQN48LKY+
	XuXna7i0AI6YbLQo7DhsTM47YtC1J+pxdtoYN56DOy8RjQaQuXrNTfCtMbEE/OPalYeKdoJuVWJ
	+i7Nv86UiKdKyW8dlUE68L0jdNYRVjb6mGQ9MeIz1hxnkba1gmtuQX/9yOICFiY9lSTSv16HKo4
	xrOvCd9x7+jHCDClKVnSV76gbNFJtCvfctdh1pkSIeea3RtsG4qVu7hnvOn+Bozrml9462BuWw0
	2EtQziesieDgIz7uB2r94oBVEK0PBrVuJF14vXgHr3QOd1qHHO95kGZOJwua+OVCw8oZRg04bCw
	TzY88/qxy2Bz982Nyrv1HWUqnliRssFxsyuM2G64gI81byrQaL0hpXObpWF8VDM3WhknD/H8eYf
	chTYS5wjBzl0d3yBHPq2nZTBbI517FJqvDrCEOkb//pipV1egPk3IfScwtlOP3Z9sDdxCrHAvCk
	6fElI2A1nxDuO/fyYHIhEpNGoDUqoxqlYB/CfcizVCMg0GbaO1apbqfqRFdsJXEsck8Q3XZL95h
	Rbno4YYTnQhR2in+l/jo3N0=
X-Received: by 2002:a05:701b:4213:20b0:16c:4eef:a526 with SMTP id a92af1059eb24-1ac5a0b430bmr17520345c88.15.1793646880369;
        Mon, 02 Nov 2026 11:14:40 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:69::])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1854d925sm62825489c88.7.2026.11.02.11.14.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:14:40 -0800 (PST)
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
	daniel@iogearbox.net,
	razor@blackwall.org,
	leitao@debian.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net-next 1/7] bnxt_en: let the stack segment GSO skbs with too many frags
Date: Mon,  2 Nov 2026 11:14:32 -0800
Message-ID: <20261102191438.1059771-2-sdf@fomichev.me>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261102191438.1059771-1-sdf@fomichev.me>
References: <20261102191438.1059771-1-sdf@fomichev.me>
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

With MAX_SKB_FRAGS > TX_MAX_FRAGS, the xmit path linearizes skbs with
more frags than a packet can have BDs. For GSO skbs, linearizing needs a
large allocation, can produce a head which doesn't fit in a BD with BIG
TCP, and always fails for unreadable skbs. Clear the GSO features of
such skbs in ndo_features_check instead, so that the stack segments
them. Non-GSO skbs are still linearized.

Suggested-by: Eric Dumazet <edumazet@google.com>
Link: https://lore.kernel.org/all/CANn89i+ps_CozfOyRnKav0_LUmSekJ9ExB5JkDbTAVf_ss_98g@mail.gmail.com/
Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>
---
 drivers/net/ethernet/broadcom/bnxt/bnxt.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.c b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
index 757c7266ce15..e7a4190a8c78 100644
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
@@ -14300,6 +14300,11 @@ static netdev_features_t bnxt_features_check(struct sk_buff *skb,
 				skb_shinfo(skb)->gso_size))
 		features &= ~NETIF_F_GSO_MASK;
 
+#if (MAX_SKB_FRAGS > TX_MAX_FRAGS)
+	if (skb_shinfo(skb)->nr_frags > TX_MAX_FRAGS)
+		features &= ~NETIF_F_GSO_MASK;
+#endif
+
 	switch (vlan_get_protocol(skb)) {
 	case htons(ETH_P_IP):
 		if (!skb->encapsulation)
-- 
2.53.0-Meta

