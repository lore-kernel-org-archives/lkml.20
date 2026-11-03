Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793749916;
	b=OF1OfZKgk1ORAw+L1fgXUjpJJkVUGEjMsciLKNChfuZAJ+YDJepF4R3HSObxwq4LKco5
	 lG0auoavPWvvs50z3dR5/kk2rW+KHI7QGXc9v7UYX5HX/rHDyLmlvcDoaVOtQ9JTyz3Ie
	 gU+5Xyd3mA2TJrMSEQch0v0b6yNLjIcZ2OcUTaD3eLi42miCdv9LMFLwK6LxBCzWYtLQw
	 NSc7jwIecKZ9/NcfU2gz2AgUEK2HL5lSLjxQFj9wnomaf2Ez1sIeVN9Lrl008YNMVHobc
	 fLHS+IAfV2pMpX9Wl26j5S7d3tMoj9K2EPSowD3Y8nYNkbzKnyQSXBy43VAuirffd5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793749916;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=j2ho1C5cLiBr/3aZdyT0DQh3Y6a9MYv3XZDcIqBQFTI=;
	b=bXzcdDPWYCbvPscead9uUsC4rpJUik4qA14zpYqQM4bQyfyzNUttCEnc3thhNb2EgJJM
	 oinbl5LFGb6kuSS5FQTrIX1KwxSPvZ77huoM+c8kqjK9uE1gLDGNbkiWEQH6ea5rVBggC
	 2Md08qRsLdYrvJLDiMd5t5UZXpXMu5mtCjT6akav3f8HWi4z+X+Bg/tvC6O9WjXiDkOHF
	 Y5bc6npZWmEDaI51/kcDrVqVoARAOArgVfLbchnGbKMHVjZLG5+toiSKJ9gjqJy1xRLFQ
	 FE52Zd/Li+6LHeBkONWTSTXqLQhTvG6Lt0USNTlKMMct39hGjoIVZv6nLWQxjPNjq1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ymIuamZd;
	arc=none smtp.remote-ip=74.125.229.131
Received: from mail-dl2-f3.google.com (mail-dl2-f3.google.com [74.125.229.131])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DD81606A336
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 23:51:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DD81606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ymIuamZd
Received: by mail-dl2-f3.google.com with SMTP id a92af1059eb24-1521c45a248so116243c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 15:51:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793749916; x=1794354716; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j2ho1C5cLiBr/3aZdyT0DQh3Y6a9MYv3XZDcIqBQFTI=;
        b=ymIuamZduOqjQP+JlREaO486TG55zElM5UJP0I+Z7Srd38FOkvIVfnj0cQ19vFaX8T
         vbW1UjHBuM3xOXLeE0vqO7dMUwNoQ8T1pdUy7Su39nL+CjrnAoND3xnXyWjPBrEeQ6ay
         XiGoBmRKi65wZvpxF4WB6wv2tJd6RuAWTpXy+/uWGZzlqO6u4XSV96XvYBl6EdXOfIe3
         yB9H0TjCH0Johjhyr+V+LleBKot5OGITADugJg/+iJZAhZbI1DjgR9th6PXnL7tSCyfL
         ZFJzvNcbRauR4GYj3uHb6VOPD6t9MB2XJHyiK/vAtqMQX+NRxJT62oGDmHNQCG8zJGbt
         W/ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793749916; x=1794354716;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=j2ho1C5cLiBr/3aZdyT0DQh3Y6a9MYv3XZDcIqBQFTI=;
        b=119RfRe4BZEWvU2iofyQArx4Lrrr2HiMqBfut8Ch0aZuwg3ucqKUQ+els6ObyB1fGu
         pBvJd6dDQQIzfmnABQh8776H+8K22LMH+zO+vqrbYWuVmRdRllUmjrZ9WlhWrtxiiICQ
         kDQCbDM6S/UFEwL9H6ngbOETJm2XmimNxOVuWIOb8G3MLpqGztwHm3ovH9kRH9gqsQHi
         6k9e5i3EYrV2nTmHTL1Cb3NWN2RzDriiyj64st8VDc/Z4nyoIcTBS3e6ReY1uqyJF/0R
         rMfJCBepPt7z8IIJoii55EzpmCs+oqutX+uE4D+liAKqbAsajPre2Rvu2Fq05qCmj+W3
         I7ZA==
X-Forwarded-Encrypted: i=1; AKwUvBwCIeLleV5DDRWNh+qVvpGiR4AzhzpbaRvgZtB6OHb8jxQZ9kv/n+Z1Gx+IFDURHIRE6iEhosGJUtz9DlQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9D1thx2cvr6bjxlszGW+orEq1ZoAf61m5+ZKOUbOOMfAFvCPKl
	9s2jNlE2PrQGGYG164CRR5ciRMo4ODZNVaqLxs6qW7CAK2+tqC2qGfAQ
X-Gm-Gg: AYBFou3E7lhNC0aCYHcRQZpv+I9NzL6YN+iRGfVn4uHO/6nYAU3T8pLkQsGkVsmQL53
	uR3ZYm2yMJoobhjYH657MhbPjY1NlVHXQ1OYoc9lHVG497DfW9ELHxrMZNbnhpUu84iSkgcrWs6
	SHAzuMsBnUlgXgeUO/VCCRxzY7/Weuo/GCLsb8XKh/USGU7Ypx0TEhDJ+chWC439l+PdU86Pt2T
	kJsVC7M/YedhsCnaEXU+ffMNJp84TLHz1hliKTGTKf5CrP4mC373R61YgTuQr6EeuTABcxYLOmv
	yLa59k+P4NQsRdV2U5BnTch3YjA4tvu8kVB5GLpVfJRxFtsPiTzX/85+ElsMq/Ctry7mh5D2zEk
	jw5l+S/irk6ZvG3XlHpF/YvsTg8rfRb8jvmrhTI9eYmrWHZF5bkB7LXLmEonzPuLwh2LQ2qxFHx
	uOSACTz+EH1ZrOQlNcmA+gKiZU6rck95IFVvboAGvQEUmkEoWFHb7FAOM/kWBUuYapOyGDRfYsX
	CH6tOpWQLgXjixOnr4zExL5qm6KqWCCUXlOyNeB82BKhw/09w+WIBoPClBvNNL8k7xqK6aCygr/
	4pCETCxtfqdXPVD1Qi4RJDk=
X-Received: by 2002:a05:7022:e807:b0:1b2:4188:840b with SMTP id a92af1059eb24-1b2418884a4mr4392819c88.25.1793749915551;
        Tue, 03 Nov 2026 15:51:55 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:68::])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c4f83fsm3165448c88.17.2026.11.03.15.51.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 15:51:55 -0800 (PST)
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
Subject: [PATCH net-next v2 1/7] bnxt_en: let the stack segment GSO skbs with too many frags
Date: Tue,  3 Nov 2026 15:51:46 -0800
Message-ID: <20261103235152.1904727-2-sdf@fomichev.me>
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

