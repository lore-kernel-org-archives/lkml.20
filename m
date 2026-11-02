Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793657736;
	b=PEN6s96yAA/UTeN/98ufqG+t/Pm23pPjbqTbk287ADeycmmsZ2UOHAtgyZ1i8GU4L3hx
	 7SmiP+iti6WdNQWgWbDofjDYctgFQT3ZWcqE1/2IHepPTNAHvP9GHAwQcG8WyRnrNu7JI
	 0xVIRFxGsQDN3iRHs5q/sQy9mlMYqpG1v7wSKSWPz+zk21RocKr1E6H0jH9v7TemcmNoH
	 x9D+/FahmGPBWadM7guw+Pcb6x9eU/kPWn5u7ARtcC5kJyrPJQO7gtTV6QOIcf2efYnLB
	 nwxl4HiwX5VpcHA+LBHDFfFm4jG0RNe9pk2ixiALNkNVSO7Rwx724C/ubcBxls41+Gg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793657736;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=QzAycytcomj7YtaQRGxKObOzpf4opDuIErlVoBcZTss=;
	b=XAiLzDfnDsI1Aj/exT63cVUSW18+AyD4/yHzlfbeGuJ6ujnXIRNSBTD0I9tZIz8Zf6xT
	 W91GusH2q3HnmA3G5iUTGCAKiQ6es9E1pQiFwoQ5AzxlVmKk9uylZRqB5NpiFKt80S4LI
	 GrF/ufyotXMwuQKz1YUWc9bFoUSi6DBHrHnqn7QUpnXdokoXONBuhVo7uUGpA3tGE+6ax
	 rZt+D43vVnL3xhcqQ0lNj65tybUCqh/BRcuDkSvBnXfgkLDd0LXGlf7iWcFCF3GJE+B5S
	 RdxMS6hUkEWtI7fQXuUa4C+q/syDm2N4yhZK2DDkhQJQUJp4FZty0z3Y0oMxlQqvMyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GGzavak3;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3600D606A337
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 22:15:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3600D606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GGzavak3
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48e46e449e8so2152220f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 14:15:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793657734; x=1794262534; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QzAycytcomj7YtaQRGxKObOzpf4opDuIErlVoBcZTss=;
        b=GGzavak3e0tA7DrLmdafsU9MiTNFGXwVcuNo3wc33/hneDtK5/ziKFuxm2xZUq9+sx
         7h9D6opsLVutH4YG38lhjZEJTB4QciVNBUdN8o2+++QXDq5c/Al40ZYrt2XJt8KHfBXN
         nfoKkzp9m/fsJ+V8wdO1YsCGD4tWKPadxIfzNSfBoC8pRusOvtp/POf04BU8TRyLSrve
         t2JQS2NlbB+eSegEqjlxUSPPwi+pCkaN11FOU/itEAVIu27HAHqW1Oh3wvGigsSp7u2A
         FP/eb9r5ai4NEme3Gb5seyYGK0gnwNY3U0FnkhHf9WkZE1bmvx/YLZXJvnTarb+lX1M/
         FCew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793657734; x=1794262534;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QzAycytcomj7YtaQRGxKObOzpf4opDuIErlVoBcZTss=;
        b=M4iRwDLqot9SqirBoRxKjuaysAq+V3NUWokwo2szpQKhR4OpGKdU4PjwgAwuDhE+fb
         NJ7SgLYsDobZ5RWekUcDY0UKwqmsk+wqypmxJoQo/7SmBCEOk8m1gUQjxFF0KO6WckZb
         FZ7kjbRD/l3i7ab0ZymqCjbghRthmXmDbWFYe/wiVgZkvejnUDyRWsvmlzEamhK5PxgA
         h3LIxYL6XH84drblzoCL+x9H88ZWd4udFJCWVoweccvBepF61nz37CRUB5B8xvf1j7zh
         7fFfPddPWMc5h/LkzHsaPoajDgEliJZFgoCDwCZ1ZOCk/XBtD8hRcbUqlozX3O4TKzpN
         ufpQ==
X-Forwarded-Encrypted: i=1; AKwUvBzftv42bsp6iKj1norYGHvYDqOVmxBx6ItVR2ox4M3+vhtmEP01Y/roB82aSB4GbZulzRS2EkpehJn1OTQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8rm9N4XrL/xrJSEF7/lNuExbCO8qbMjt81sz5ALNPq9pyyAql0
	t1MBtW7YceGXSWlv8JzPlRXB705vIQ4YZ98wINS9CP++HRYFPw/66cc=
X-Gm-Gg: AYBFou3v3g/qgWyrtN1+YBT7YLyBQUyMKB6AMHKfQDx9mEZ7ZY6IandSB9Kk82WljAQ
	y11V4l6fx1pYNprThEtPdXnPCM+kgpt+7GiKkl+TcSh0WRgxN/4FM/gGIScYsV5vBvogNPf7xoe
	VU0gsJ5KCqX9Xgxd1pzujZvGcxFVn1IZ2/vmqjfmwYj8yWbgvmvZSpw+m90mWk3dk7zVf8cHaCq
	PJEXGA0QsklY1RfUa7HNKONeQWXgmMJty8UUwzZ/tVPmj87sotlDF7C3CI/yPIy2xtMwDrTNb6u
	8PQftvEafRfeSLe4suCLfiuoTMD64ztg2GP9FlOXLUOBnewIiappL74kuhuZ33PpcOof69iosDR
	YmjVqb0o9Ib7UHTrfCpSLinKr/Ty0xJBpitWDBxlcXI8Tn1GVyHG28O/r2j9VIZLyfnDpiFXmBL
	haPsW21K6D16U551+8MNba/6WfU0NHJRIucR5SIRTxbYmnfMwTI4iGJQK7KnONsBAx99xaIH5Gk
	7sxaV3pwLov902PdcULZd/Gru67DairTT7GI6HRjAKhmD/sBstzUpsA3KphgjnxzIFzlvK5to1n
	Wzk71S3HCiw=
X-Received: by 2002:a05:6000:2611:b0:48e:4e00:b72f with SMTP id ffacd0b85a97d-48e6e50c8ecmr24326939f8f.32.1793657733478;
        Mon, 02 Nov 2026 14:15:33 -0800 (PST)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b725a2sm20662549f8f.13.2026.11.02.14.15.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 14:15:31 -0800 (PST)
From: Tristan Madani <tristmd@gmail.com>
X-Google-Original-From: Tristan Madani <tristan@talencesecurity.com>
To: Brian Norris <briannorris@chromium.org>
Cc: Francesco Dolcini <francesco@dolcini.it>,
	Kalle Valo <kvalo@kernel.org>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH wireless] wifi: mwifiex: zero-pad SDIO TX buffer to block-aligned transfer length
Date: Mon,  2 Nov 2026 22:15:30 +0000
Message-ID: <20261102221530.3469388-1-tristan@talencesecurity.com>
X-Mailer: git-send-email 2.47.3
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

mwifiex_sdio_host_to_card() rounds up the packet length to
MWIFIEX_SDIO_BLOCK_SIZE (256 bytes) for SDIO block-mode transfers.
When the original skb data is shorter than the rounded-up length, the
SDIO controller reads past the valid payload into uninitialized skb
tailroom, transmitting stale data to the wireless device firmware.

Extend the skb to the block-aligned transfer length and zero the
padding when sufficient tailroom is available, preventing the data
leak.

Fixes: 5e6e3a92b9a4 ("wireless: mwifiex: initial commit for Marvell mwifiex driver")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
 drivers/net/wireless/marvell/mwifiex/sdio.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/marvell/mwifiex/sdio.c b/drivers/net/wireless/marvell/mwifiex/sdio.c
index f039d6f19183a..c46a048cc961a 100644
--- a/drivers/net/wireless/marvell/mwifiex/sdio.c
+++ b/drivers/net/wireless/marvell/mwifiex/sdio.c
@@ -2386,6 +2386,9 @@ static int mwifiex_sdio_host_to_card(struct mwifiex_adapter *adapter,
 	/* Transfer data to card */
 	pkt_len = buf_block_len * blk_size;
 
+	if (pkt_len > skb->len && skb_tailroom(skb) >= pkt_len - skb->len)
+		memset(skb_put(skb, pkt_len - skb->len), 0, pkt_len - skb->len);
+
 	if (tx_param)
 		ret = mwifiex_host_to_card_mp_aggr(adapter, payload, pkt_len,
 						   port, tx_param->next_pkt_len
-- 
2.47.3

