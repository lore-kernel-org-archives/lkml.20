Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793917263;
	b=eFNZSQaF4aSh8D6wkCA6GFJtP+ly7HYwgNsAEmRa5KcjP/Lgzv2K7xKOgWmYDbcFlSmR
	 3KfpxhWnC/7uacAZjQ30+k1XQXomFBi2pGBJq79lthhHU0jKTvBOlefiwFhhTD9+Tsxfq
	 /Gea83MjlEqitV8ui2osI+X28j17tDQn7olmqlz/tsVhIqdT+K89UVFUHX8zMWcjNW9Yf
	 s68er8Ylx3ptyKAiOj/O+96U7FHsDyYKvj/basMsbdJSObiBuBr/+zcUoeUlczEjdInQw
	 SxpqKJkdfdZ6uNHZeUBiDQXAR+o/xwGoqjxAcROhALOqZyYTD09cZ+VL6VL/VotQ6Yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793917263;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=BAX35U8nNHwzvrvZe/2+mPjA18tDD45pOn0BmV7GNC0=;
	b=o4uAVsCEnY+v8UTaxN1V2ANeVbndNpsnRhEjwU2VnqriyO/3iEKtUS46fSsJOtQLKer+
	 ScJvoYopNzgGyPsL0XDv9fLrCIPgZQLEZWxVipXaIKbTKnqCzxCb3vAJKczSUSHWyJh2s
	 KhKbTJFxSZf6mSM42ilWPA5LQobMjr91qXaxljLpzau19bCFR7xqbv/f5BhR3EKl09n1B
	 H8EOks4Qre/2XlqaB9T+g+HKvytqgeCgG2mLfaPvBmr5sxWWSwey4/LuMTZ4aNlWP8qy9
	 bVQMCJjExjrWsGEAzF7QqZ1BYnMOJkMvGePFIfp7nJKtQzueThkSHP35w63BWN7VLvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e+KzCRPw;
	arc=none smtp.remote-ip=74.125.229.137
Received: from mail-dl2-f9.google.com (mail-dl2-f9.google.com [74.125.229.137])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57429606D807
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 22:21:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57429606D807
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e+KzCRPw
Received: by mail-dl2-f9.google.com with SMTP id a92af1059eb24-1397ad3d891so39002c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 14:21:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793917261; x=1794522061; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BAX35U8nNHwzvrvZe/2+mPjA18tDD45pOn0BmV7GNC0=;
        b=e+KzCRPwGRMk1BKNG+tsQfz+EP0W1rS4Z26bw7m+52ZDtQj2tRPd8kF2bk/cIbpAng
         oGqnOFDZLoU/JqjgFICwTFI1ou/Nv3AnHlnTGRyo8K7mbaGg9wvwossPFQhXfa6VqkZG
         8UlgrnKuX+60euKUPpM1cQwbJLyxunEH1kaU6zYvGzoKEGDA6PTH/YT2PGCENTQkLofL
         OBryTBIZs6DNLJSHweKDiqBC+plTqFqp2ifPBhB6qvV7AQdDT9oB2lBU9Z2XDQouFnAM
         3YZYRzJTaJWSxCbyV0BBHUU02ueo+SWcZesSKmd1c94t74F6KEoYeVRccSoDXKRF3F45
         lnlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793917261; x=1794522061;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BAX35U8nNHwzvrvZe/2+mPjA18tDD45pOn0BmV7GNC0=;
        b=ofWojQun1qQxccPoAFyaL8c4xSjBnvO8gy1Rbqz+n/dcudEfkds/6Am/Sdm3NLclby
         x+1jWdNP2eiWUQvTIgR9coPmKDbkiHiC66TbjhDGyTCxPC8MFk3WNs1IgV0YVGu84D4e
         SP9KPhDlNaf4cm0FUXJofP1jj4tyJ9sXxMPUh5LDZSOHXTXhYYMOgQ7mDAmhFTBX32TB
         tz21iy/4MQLixR6to0M9iq1SJwATwmRcUgYm7VFIeecYGd8ZV5p1ST+BMeGcaPs/PJWU
         3tO8GJ81pYCCYn2fCHClzZlTMjYadtY1oAwXmYfJF2pxkk6RBu7oPpKmTaIZ8VKSmpJ+
         i3GQ==
X-Forwarded-Encrypted: i=1; AKwUvBwIAk2RuWOQMvYiaUGB6ENs+oUBeNN/DdlDOhPNVLtyHxHj2Jjz0X5BZ4eVQ5EujFEdjsFb8rZHFN6HGVA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/81vWiMSELVFc+ln+MyP6xcIEeA5viyIU2ZqY5LJxE/UiyvW8J
	Xit42bnLAeEeYQF7ycs8UDDoCxPADHiR/VtCIe4l/YtttJIAcn8hY59k
X-Gm-Gg: AYBFou095RNlUW0riXuOrHxuVbu+70A7v9WYp0opvRe6iHxPTrMK02y6d6bKGaRuUCV
	+9xjks4UvISR3X3zHGqI0JyAlfBLPMrg4j8RluQJwSSo1nQdNI8Zz+yGU3l7D0nKz0FvfWe2ZL2
	ssMzo64iejxITbY33yI71jS7XZfzB/Rhe9tnIBYxr16cUxtmNfKZLvjlyydxoTfAlM77tkeUau/
	pKQafKSdioNmTMJR0Lky1wn4JI8d4ZH534KYrmp/J1yxEfDXOsWPg2PM4B2F1LxIiTqSLuWQQmL
	oGqO/VgLoR10Dt/SWQm0YsXBX09SMGZWa5Tv6NRF3ZzezXnKoJ9BdJL1qIb0Bet/rjMpU2DVmyh
	vbOemJT33LRJqbzXly89MllPgVYdbZL+ReGkx2EghPJkYBHSyhGjBvDCWr+TmGBt4qLnuWYo1Eo
	W6jTvWeEMP8zlKitONiDMf2MiBTjBzewCdHbRYYAO50vk3XEspI/SnapPKxWUv7KPydgS8U/RtG
	qR6VsMoOXvkVPukWchTxgTaCOSzUuN8OFC87MEUGoTZD/74DGvNswPBh+RUlQIxJQnMsiTrTmkR
	y7mGn6DpB6N5tZotbbjfNmSxzbkrrwv+WeFR5mIl7r2B
X-Received: by 2002:a05:701b:4346:b0:18d:9eec:e0be with SMTP id a92af1059eb24-1b25d286bafmr512275c88.2.1793917261068;
        Thu, 05 Nov 2026 14:21:01 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:68::])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245b86fbesm20396895c88.1.2026.11.05.14.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 14:21:00 -0800 (PST)
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
Subject: [PATCH net-next v3 1/9] bnxt_en: let the stack segment GSO skbs with too many frags
Date: Thu,  5 Nov 2026 14:20:50 -0800
Message-ID: <20261105222058.944293-2-sdf@fomichev.me>
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

With MAX_SKB_FRAGS > TX_MAX_FRAGS, the xmit path linearizes skbs with
more frags than a packet can have BDs. For GSO skbs, linearizing needs a
large allocation, can produce a head which doesn't fit in a BD with BIG
TCP, and always fails for unreadable skbs. Clear the GSO features of
such skbs in ndo_features_check instead, so that the stack segments
them. Non-GSO skbs are still linearized.

Suggested-by: Eric Dumazet <edumazet@google.com>
Link: https://lore.kernel.org/all/CANn89i+ps_CozfOyRnKav0_LUmSekJ9ExB5JkDbTAVf_ss_98g@mail.gmail.com/
Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>
Reviewed-by: Mina Almasry <almasrymina@google.com>
Reviewed-by: Dragos Tatulea <dtatulea@nvidia.com>
Reviewed-by: Breno Leitao <leitao@debian.org>
Reviewed-by: Michael Chan <michael.chan@broadcom.com>
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

