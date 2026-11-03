Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793679262;
	b=chI9fAjm46F5JE0o4D/hosGjy7Tbh7EfNvdO9mACZctcEj+kZufFoCQVM9iUsw5s5DCV
	 RNjmrFluzk6wI7ZzR2TfHi7JPPBdzuIC+oAcxVvyyr6qfvzM5Clogi8St8ogKxT8ORx8J
	 RUJYPJj0NO0amivbXMtUpgNbQZ4txIcz+Omdgkh/fcedJ5PExZzn4hov3VNg3g/49jYWM
	 ThTMQV68EFmzqLlN5beu5XGebSRv4nLkhmydb4of0Jv6ztd3BztNSAeytPNcyuNGlkQA+
	 XBkAUS8iN31OwQKTJsLMTIQJu5eLxVsmXpX6zSp3EAdE9LEmEviRpA/IH6jz/qm4XMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793679262;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Nj3McratJJ6pEFP0XBRtJ0WdPjrftXOJFNhSnJCxiPU=;
	b=kzNJCwjCvgDSN76dVCDNGOLqr1LoWxZ6p05MRrhJZ1PbT1+yJ8lZvLY59vV6lUyU51Kh
	 HGBr9pdo0pe74AFAgCwE3bSzNKoi6OycAO8BC0k7PpOxCdM5MC8QGPECH6fAI/EpDTMQG
	 KOfVT1agr6FhjnXums3JwbtkrAMcLAU3KU1BB5Xvt2CFVPxPVE0ayPxW9mAmZXDyXag26
	 sRnm2MqyhmBludfjaDYsje4pwolrz5cRBfMUD5mAUXzYCDKF1QTeda+hA3kYTg5J6ORl3
	 /GSg8TQ08PBfw8SfTLmHNq+D9zJjj+74lri7yC+t63vgB7H61JNKLifvFOvIE0Ska5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bZ7P+a3D;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 460A4606A332
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 04:14:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 460A4606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bZ7P+a3D
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3aded3c6103so1759888a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 20:14:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793679262; x=1794284062; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Nj3McratJJ6pEFP0XBRtJ0WdPjrftXOJFNhSnJCxiPU=;
        b=bZ7P+a3DvUJiqy8nxjwt2b63ar5U7DIrlY+60Bo8e+2Lt0UzQ++1cgZoZT0ViU2koy
         FHJzdh8J03Lq/HhHfcmqqKtHGbdzID90L57Ov6xBspr1/t3F4a3EC17m8i4kWwjS5242
         7XcKyewoB5pfq+roI9pQqZMELNPx7AWQvopLgHegGPRJTo9xxNbfAk5jHFqKSgNq45Ov
         au+wgqOlVTGRHLuTCVXOMxZMcll3A1lkYPlhT/L89cMwTD79glZDWvtLsdSbJS9bukHS
         xq4pRd5OUHXRCwJIBsXmgfidfXifYMJWSfNDKtj/BodqoPvTt0hOuSRz6UE4c+nKL/aY
         yiNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793679262; x=1794284062;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nj3McratJJ6pEFP0XBRtJ0WdPjrftXOJFNhSnJCxiPU=;
        b=1VnzASPexsMMPyfYkjF+UTiaOy1MOXnHJ6lD1jmREPyIuwX6I4r9izXEaHlYk+oi7i
         YHOrsAATsYWkje5uvSIV+35ZNjpmPNuj4z3ICrHEq9GQqGqSjeXMxQB+hMOcQP83jWrS
         +uY6a38hhjLFf+uhEHn+cpljRDbetuHq3vgEPsR5hdRiHU61wqAhNCp3sJ6SfDV3KtuG
         JskJ2dMVGKroTB7f3q9LdUfIiXiOhgXGkDW6jM/F/tAVwx6lSNP9fz5ySBKkYog2W6/H
         tk6efEQLu/aAzGLokCkhvJ2aDZH+D5gbSkMUlphYr4ubT4HtYKPkBUZMXSWc96Vgm3/N
         eEHw==
X-Forwarded-Encrypted: i=1; AKwUvBzXOuB3u5fBvyUHz7GL8qMRJEnhgQs3UXgSqs9QmD29wPvrFqdLTF0LdXF65aciuu8e7xAys4kPA0nfmYI=@vger.kernel.org
X-Gm-Message-State: APuU4Z94d503EpKX1xp8mxwei+1T/btQAEeBEyfw3JRmkLqoYbc4se0N
	T7BbpKcOTeKP0nHRQWkvNojFOkKcl8MnkXYhpPEagqY2vJsxWsJgnTo0
X-Gm-Gg: AYBFou15wNViNKekmy1o/uq/7J/iUu2P8gbJKm8j34wxiHEnDs2yfNmM7IcH4Hdoli/
	8CKAv/Oan+HL2M02GkgULC3vsRdF35+efqjcT8hcKgphQbxpDhTOgblxLGFuSQ4/jFmbf6qNLsP
	FA45dV7fRmaNhuSb6c3mTT5tiS+SU9zn9PgP2tNSOIlnMJk//Q9zyYlmqg/BxAeQtR9Xhh03PkL
	dowGsKd3PujnvouMLrB4D0S6F3kGArfo46PCowI7z/90bYaDqh0upLQGOZvSX4VOPr8ZTwbAbnj
	1h/+WCRRvek+SO5/Ps8TXy1BNm1Jv/qyBSfdUfgNDMjFazb6U+2RkQN2uJllQxqcdomPT03NbQE
	i/9KNHMP/duc7ullw9Vi/hunmyrUwQl2RAGSUFQOtHZd+Fo3whwmFgGupdcavT4opX9HlzzCvFP
	ZQaIJlrOYSRzYkwBpzcvQUYl209u5rba1fXS3dwp9PQVKZBdpXstGgSzC/+1eKq8a1xadD71NBZ
	MEDvEz5du2WMPG8HpiCDo0x19dQB8iVZ0W5gByZ8KHtJNpYxGXPDz+QLVS9jBeBeP2drg2Ee6MW
	zAFcT5cSDTNfBy4nPVMvOvkN61dypjj9Hn+Okciqkyzxne5c4XGc
X-Received: by 2002:a17:90b:4e8f:b0:3ac:4e18:238c with SMTP id 98e67ed59e1d1-3ae89806287mr9145855a91.49.1793679261420;
        Mon, 02 Nov 2026 20:14:21 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac1:7680:28::4:396])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c6740a1sm1989659a91.10.2026.11.02.20.14.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 20:14:21 -0800 (PST)
From: David Yang <mmyangfl@gmail.com>
To: linux-crypto@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Olivia Mackall <olivia@selenic.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Danilo Krummrich <dakr@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] hwrng: histb: fix the FIFO batch timeout
Date: Tue,  3 Nov 2026 12:13:58 +0800
Message-ID: <20261103041403.4071708-1-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
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

The poll timeout in histb_rng_wait() was derived for a single word, while
the device feeds the FIFO in batches. Fix the timeout, and print with
dev_*() so that the messages name the device.

David Yang (2):
  hwrng: histb: wait for a batch of words
  hwrng: histb: use device messages

 drivers/char/hw_random/histb-rng.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

-- 
2.53.0

