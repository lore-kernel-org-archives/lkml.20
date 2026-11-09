Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794238522;
	b=fkDqINpH2rQ8lFLY34SMTMPaqGtI1P9Sj7P3HjCtKJy+WKNufjE5KWAOCZ2Ucl6elQBe
	 OvpZFbWobY3KnVmA3+Gy36gj04b6Ro7MxOE9/nnV1eBN4YLjeo+Gpp3z2s1qzwsBzWCwD
	 +sJ4PVwSfqoIrchmbB7sPQdgyUD96H+/TxfK01jNGbPOmBeuz8BbDbvTgolEDmDhkzkG/
	 ZILSkh8mn1Ltdtcm06HAQhfUvX8p6NHf9HkbHGVz0CJGee8dzMK7f4wKWx6olZK8EDRuB
	 +7Fd+LxIv8VxFms9OSGisaLSXOnIPUGGhbSOZwofYxOGSajA2O/nf1pcj6nfCg9hEew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794238522;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BFv8QKeFMEcn/AkR3HpsBBFhs/lrtsz/7GH+0grBKvw=;
	b=bCjj3wb2I6N807d5yPmNcKx4tXQcmSHmVf70n1GhjBC8wJGEJGIMxDDM7LBN5V/Thmcr
	 jE3dIOeY/ETTUpEw3MEu2S8dO34witLu3cXJUVVUM9QYX0uGq3EMHn8VrXe1V4yJfpfUG
	 L6jIjIc59VgbW+oEsgkcV8g/CR8Chg9yJjN415OTmGp6B1N5W6P9QaD8FuAcU8ByUIAlX
	 QXxuoUXa+pRS4KlF706aAAVJGtjyri6QYkE6VPrbSHWpc3ZGFJGt+iletj/pEAIgtCgYP
	 NnDoZ5kEAdJLdvVpDZ9UBmlMSczNMjoj6mpPZQinP6xaoxmkVW4aLbH3G1Y3bp42+ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S9yhyMmQ;
	arc=none smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 842B6606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 15:35:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 842B6606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S9yhyMmQ
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2e9995ce866so6913555ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 07:35:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794238521; x=1794843321; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BFv8QKeFMEcn/AkR3HpsBBFhs/lrtsz/7GH+0grBKvw=;
        b=S9yhyMmQUkUJPTK2IsTCNrMVaZ6Gq5OhDXskouAZ6oTWtLutDCUs+sDP7Be9scSGl8
         5k1VkVLDDKl7yKZYBqVhx4C7SdUPvfSw3AmMfJd4wNWLpzmL0aClb2v9vGH70JVK/eUt
         yXNWfMLxyd45ab6dgeSaR1DkY4lh3+pZ+nM+oWYfJHDUu8D4xNSo5kXdDfkR4povdNAg
         D8EncdJ5VV1IGf1FrPWvjfxT3LDITuUAw4LY0/SA6fA93xewJuc2Cdp6jsmDEB0Vj36h
         y4XVzybyUDt80vfwM2TshniAboxbqMfUiNRylRMis53lJryIJg7N25nSAaaxCw7/0iVf
         CxXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794238521; x=1794843321;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BFv8QKeFMEcn/AkR3HpsBBFhs/lrtsz/7GH+0grBKvw=;
        b=qDR3QpUq9sy9FQNlhnfBEKfrZCepY0Dg27dFDiuqR5+dwf9Cy9gdnXUJk8S+WhKjrG
         MbqhHDnTHewiioOgRc3ellAkfJMlgLiJvvoPRfIfffwZQ0xLUIM/dRMMNmr/5QxLspS2
         9g5xqLK/EQF6pVSj8Ts6J9rQtnY1B2wQdf0CJiRGgEsHHijd+Awfk1QumYDOdFJvj9PC
         js0SBfX5vuwWv0x4o/ccjFfbSNKH6YXR6LbjiniqGQajuKyzJCrrV+yGByOwUsKEpVzB
         Ie79MXgw4RTVHZzB6fOtMSQaRoecpB/HKkl0/0nJsW4Ts00tOHlKOLZuE2a8P2KJ8Cx6
         69ow==
X-Forwarded-Encrypted: i=1; AL+hErHKbGxwedKWeo8NFPM6sSgxM7iKInMjsV9xnGhPTx47L+8DUZXzvz8WvYywI8nt//8jelXSoiWIV+sqN1A=@vger.kernel.org
X-Gm-Message-State: APuU4Z8l80JR4pRBKhoR+PmgXoJ35uYj6qVfQ2BH8oKHazL6wLU6dmEa
	0kC+zxeKNPI2QK8iaESJCqMuTHVu4aF26hagrQUVMCDpS/OKpQBfDIE1
X-Gm-Gg: AYBFou3DBnYKZTnbDh+bDIbRJjmjHnyNOCB/8GRQFcT5I2yJriv4PwbLduJblInbEk8
	4V2slTEzqxIbQokmkZSogOTmnt+31zr11ShG20wdwVAFllb9sMGfUBhabVMJsX0IAxk+lPYkypV
	4OQVEJdbnlcIHP0FpYFsjSRZ6GVLkdEt5iEsr62ivhSYBYQJpjn7FFpSmXtEWBq8SNhqplee1rO
	zN9EC2xurANo+cTogzG42cYzwP4zaMOm1s8tlRP4ir6Mvdb71oHgCel1gIE3tvGn3BiitZE1JsC
	jwTiuDsqhziw4fmgmdsN4URJR58PtMCnmMb2HyBHJcwgDq7O3JnwDKUWEjRYWKgD7Ok3eGCS26L
	hsgVpR1KtgVP3D00fi0UjvQdnQl7EmhK6W7gq9mAUlkzVUNph33K+fQ/78/O8kUf0gHRhEja8N4
	BGeYonaxtienmfl/SKG/Zcb/Wo31w5HlkJRB5em/0lo6UYJ0gQY4i/QZyEqRYhI6FKvUSqRedxX
	BXbFjaD3dmksb9GsjMIgdqAv+ZC8d27EQmvCwS9kWWyTy2FXzLK9PhCRJCh54RU/G7+wCIYR7if
	816oTFU8w0rSiwkuH8r3qbgRbwlzBvTX/EAWEcTNYiYi/A4Yu+Xnpr/9K8invxxfBuq5E4VdWpZ
	1xvQ=
X-Received: by 2002:a17:902:e88e:b0:2e8:4066:d247 with SMTP id d9443c01a7336-2ed837d54dbmr42983955ad.33.1794238520706;
        Mon, 09 Nov 2026 07:35:20 -0800 (PST)
Received: from 0.0.4.7.1.0.4.2.ip6.arpa ([2401:7400:c804:b668:b272:9904:c32b:2ee5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed81708c35sm12640135ad.40.2026.11.09.07.35.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 07:35:20 -0800 (PST)
From: Ho Jie Feng <hjf3108@gmail.com>
To: Ulf Hansson <ulfh@kernel.org>
Cc: Maxim Levitsky <maximlevitsky@gmail.com>,
	Alex Dubov <oakad@yahoo.com>,
	linux-mmc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ho Jie Feng <hjf3108@gmail.com>
Subject: [PATCH 0/5] memstick: fixes for mspro_block and ms_block
Date: Mon,  9 Nov 2026 23:34:40 +0800
Message-ID: <20261109153510.7161-1-hjf3108@gmail.com>
X-Mailer: git-send-email 2.56.0
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

This series fixes bugs that I found in the memstick core while writing
the bcm577x5_ms host driver for the Broadcom BCM57765/57785 card reader.

Some of these bugs were really rare, so I used Claude to automatically
fuzz access patterns/events to reproduce some of these issues.

Should I put this with Cc: stable?

Ho Jie Feng (5):
  memstick: mspro_block: don't hand a finished request back to the host
  memstick: mspro_block: wait for running dispatches in
    mspro_block_stop()
  memstick: ms_block: don't erase the old block of an unmapped LBA
  memstick: ms_block: keep the power off during a full msb_reset()
  memstick: ms_block: add the missing newline to the parallel switch
    error

 drivers/memstick/core/ms_block.c    | 11 ++++++++---
 drivers/memstick/core/mspro_block.c |  9 ++++++---
 2 files changed, 14 insertions(+), 6 deletions(-)


base-commit: 461294b587f6fa5bb17d5856e4404b67d666086d
-- 
2.56.0

