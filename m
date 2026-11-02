Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793622200;
	b=rhpwKFYYsmEI/VUNQiOb1H6uUYWCgolrI0Q6CR8j4EN2Lo0/+RqJzUg1Z468QyyH65yJ
	 baVmGuIIwa3sbRYSyRt0NduUc3hSmerjhPCPvzhPOMu3rOL73565yzdj1dvUsCkEKGYCh
	 qrZLL2mvFpM2mGVK4jtEBYJI0qzZqZQnotxXm9x1/ofR2YrvggfOlfSK4ISJfCFbug/FA
	 XjqaF+znF0tsgTjdvpjLhbQvu7TnaXxxa0a/zaLjZ+Fn4EJ1casgnB3WBEc4lGnIFvpGE
	 sGeY1XhdYr8rceRlN8pTtRWcqIPhQM2mAdg2VMHzByjw52aR6XCVfLa4QN2GiC6kzJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793622200;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=3iOIXEmflTG6buskQdm9P4t1/QlWTCynkV6kHZ1H/SU=;
	b=nJI9QLIiDWWABna5nTYXF+s2PyjM7wvzuXD1lQPQH1h3QdNFvo0185/O9T5AtPCkeVWy
	 SZZQAcMDNEud5DpkRfAkLRO8Tp1mnXv/S+5W9QP+1sCmtZYhB+WVhj1OuSp5a/nMbKzxu
	 avcdZ7iWqT/0tiwyEowj/JO81TMUpE1uMxBNLYNM54LqsxjGAJiLeXsMr2fktmPuvDKnF
	 xZBydKqBAetiYe57STV7wKEeAjQCUNsNApD1IpGxMLbT2HaK3FrhyZ6bJG8EI7lQmI0Ty
	 XzosHMVk6KO1dwNN3+lbsZF8v95mlKAd3BoLEygOhJ+UUrya1vwyHDRhPOp//Hy2uNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nLb0neZG;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FDD460A5BE3
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 12:23:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FDD460A5BE3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nLb0neZG
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so22392925e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 04:23:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793622199; x=1794226999; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3iOIXEmflTG6buskQdm9P4t1/QlWTCynkV6kHZ1H/SU=;
        b=nLb0neZGvV479WoBpwIj25pg4oBMQzfLsX/vGfxHBPPiDY1cA13ZLlgn1/wgtcQQGa
         Oh1FlbOSDX8WkTKTJMRkn5iJPTchUVA4GqfUZtImC8ruihRuoP+4m5Zm1QMZvKzKHp7y
         Hyp7r7bLP7aevx1p/53mYyUnpdiM16zGmVI+jym1RoScThd0r6XWkvdRStIHHwwlJr21
         Zsl/j68kcCxWBeQ+Roe/anGUjTMpvruZh96erItD734yuS95manh5mosLywQGDsDAhz3
         c8XiDsiCnUE1M5/HHkQp2abQwA7g5YHuKaHgFNVBL/09nd8wvl552maXufFQUTNQAFT9
         r40g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793622199; x=1794226999;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3iOIXEmflTG6buskQdm9P4t1/QlWTCynkV6kHZ1H/SU=;
        b=YZs4lHYEo6xn5vY1IKtRC5EA/K7ZlrFq17r46lAn1mfCBmqHC5rFkUKyYTSp1cICGW
         TeLQ3Ocmdt+9aZwoRZ6AXBHTcAt4yxgDRs25HYYa0ZL2X1FTLoRuxxWdbJVYO4dfhU7T
         hS0vJZta+j/z9nWCYWM0JEG8TntvrbSFhuC0p7pv7/j6SXkiNSKNGlULOvZ0gkwsI/jd
         ZLMuU5cdQkf3EjWF8C0eLuvTRhvz/0dhF+f2NU++nJSCZkJjNTiv0q9alWYwOz+JrJbC
         fKDeuPvfcM52WOzD/NxLwallemv5AuDB+ZdJhE6oEitdwlAnbgl1x3Vi+DiB93jPCrKF
         Hxug==
X-Forwarded-Encrypted: i=1; AKwUvBzy7BaOt6yRrVd20yTRODy9JbmUJ5j1v8MqAZIwq0sp1OPS2nbdDk88JRDAyzL5OoOEzyOaMTR+sDdrs8s=@vger.kernel.org
X-Gm-Message-State: AFq9FYLHugd6HVFzR+GEr4X3/5HryCStXzgw8IW7saSo1beBlsga4+Yw
	oOwEu6zcuaBzzZf35Ru20MMTom7EPrfPRRdRz1YHlpKCxHLW79/4C2M=
X-Gm-Gg: AYBFou2ramJZgrWXmZmBa/TOf+5UAgqJHUprRbbexsMj78x2rAL8FUm3lwrvlWSQQ64
	cn5TBZdy6AIO1rE1EPNLz4Ju3sN/fTzIKtrrMJuiItPYuTk99iNBwxOT6wW71hGuvR8DmCrzUjj
	qxb7rVBoLI1rbrA4UxIAuKZOatWuaRAnxNHmDCkTRgLQrLrTDC6p0+/2+g6sFaTZwkKoPn5ka3Q
	TXaJ4l6L7u3apmLSPWjllEr5fDYJMtlMm7BM8QV9Dp+Pc1wcNSwZShLKrC97LbBHo6okQUfPuyl
	0AITqIQK/jgZNQfFywQakkUWCDDARFl8swAAECdB07UsJTUeF1YjR0/tLvROfotYo3lEVlUmHyb
	i6n1C+r7uYwh+F339QgKp5PregAwvbt3YFazRnpdLdStsScUJbbEMdB4yrLKIXeC6GnJJPkbWil
	iwsG5Y9wQTgWWoMgSaeZjXqjTA5QCJFylq9Oh8pF1Mq1czUVyJyWa3Y+IJQyUxOB8SIkYN4c8vw
	042NcTmZ/KFaJn1Tp1+YOeZQQrhPwF1NsQK9QOHrJzEU6crf3geDEivbkZDE5Cv0sAhlY7g0w==
X-Received: by 2002:a05:600c:198c:b0:4a1:fc98:1cb1 with SMTP id 5b1f17b1804b1-4ac15584c05mr237157175e9.2.1793622198548;
        Mon, 02 Nov 2026 04:23:18 -0800 (PST)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf67aa704sm255490595e9.8.2026.11.02.04.23.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 04:23:13 -0800 (PST)
From: Tristan Madani <tristmd@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: arend.vanspriel@broadcom.com,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	fariyaf@gmail.com,
	linville@tuxdriver.com,
	kvalo@kernel.org,
	linux-kernel@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH wireless 0/2] wifi: zero-pad SDIO writes to avoid leaking heap data
Date: Mon,  2 Nov 2026 12:23:09 +0000
Message-ID: <20261102122311.181075-1-tristmd@gmail.com>
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

From: Tristan Madani <tristan@talencesecurity.com>

Several wireless drivers round up the length passed to
sdio_memcpy_toio() / sdio_writesb() for alignment purposes but do not
clear the padding bytes.  The SDIO controller then reads past the
original buffer into adjacent heap memory, sending stale kernel data to
the wireless device.

Fix brcmfmac (4-byte alignment) and rsi (block alignment) by
zero-filling the gap before the write.

A third patch for rtw88 hits the same class of bug but needs a rebase
and will follow separately.

Tristan Madani (2):
  wifi: brcmfmac: zero-pad SDIO write to 4-byte boundary
  wifi: rsi: zero-pad SDIO TX to block boundary

 drivers/net/wireless/broadcom/brcm80211/brcmfmac/bcmsdh.c | 3 +++
 drivers/net/wireless/rsi/rsi_91x_sdio.c                   | 3 +++
 2 files changed, 6 insertions(+)

-- 
2.47.3
