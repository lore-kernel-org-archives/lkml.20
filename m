Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793910769;
	b=yQ3lJ8bSnhjYLfDv6oOmO89sVYYpMxGsqA/oMqPIIumnd3RLNTOqMvrSiqofYLUc3z37
	 JiFZp7w+dIfA86bi9WUVHB7hrAmsSOVq6XHn+q1oQSORRzFc/k6sD1qVbWw/mQm0iWodE
	 DTx4EPrTnUxgRY0l890ruiYGwK/ZG+DArWO0Mb3iNpHW+7EYhIOn34CnEHjbDXo/W/eUR
	 7qs0kJMPpLeUXnrziA+kO4H7kBJmKnx2TzBtwBYG+r+qrsRv3zILuj+aJ7yLvd6HqkFnM
	 hY0ML47D1BTNhQpTYrbbXafrrJBtdfeqsuB2ybAEz6IBJeqGzxaavqqEI+dUqZrsh3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793910769;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Q/sZwDULHUkiy8aVY/nozCvta0v8Hz7jxZdUOnEHfRM=;
	b=pmiCHSIcTtPiuQTY5e5kkPYt+FFcrO4G+XpL9Ig3dNkoqwBn6QWIqyyh4lUv3XTsOd+T
	 4FKI+IQWSBXyXq2ty1hAc+Uqmd4F0+hEpADJo5FBEKGsUqox7+aFQB6y20Y+QpNIpR25u
	 /u5GEBXMOIRuKAmdR2u4SSUPTA8L/W9n77Y7SonTgqz/HCk0s3mUnovXhAdGz8pYjrr89
	 xzKN+upC1n63QRhrB/LRHMepT3mcqhE2o4xTfx85s+X1LLyDKVhKwdce6pVHHoA1vt4Yz
	 dmo4ejgPCfa1dSOpSwKAL9qq926eg4Gg/+3q91iHS+7DU7c54u+JmQkOgodlS1H6P6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OGmgdzyl;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89351606A332
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 20:32:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89351606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OGmgdzyl
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-36a0f27c9f4so4353661eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 12:32:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793910769; x=1794515569; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q/sZwDULHUkiy8aVY/nozCvta0v8Hz7jxZdUOnEHfRM=;
        b=OGmgdzylBss2HmVL0wtcXd6GW+yjn8upmDIUxverqF9QvLbttFajMGBRXY0fqR9MPZ
         gb5FrW16QAc12KEiOKu3uGfG9oSK+V03BJcY80TAyO5w/Lq9GoIl6EqCNS/mGxfWmv3s
         odFZzoRMXjQHrucDfKnsoTkx5dAfjdFCaS4FlkDbA2BZm7JuLK/Y6rNmcJzOwpatAibK
         5R8F4/jugyHXPCxUm8u3FCqtjIiEX/7qUHolFHj5naTadT6g/xjedJsjbK0P1oW8tIHV
         E8TtrBgMBkekcf3r26r16onqoExxZL6aDNpaHjuO69U04ZXX77VKYG1gLlw38GdZCuAK
         OfrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793910769; x=1794515569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q/sZwDULHUkiy8aVY/nozCvta0v8Hz7jxZdUOnEHfRM=;
        b=LgdrrvUzFNQqvwKKOihB33u1N++kCvDQIYCtiKkKpQIYKLue+Fd3GZ8piKKorEPAL0
         VaBXcoigLaBckGy6JaQ95XIU3VeQ5V9eiLKu9Pqk3wHKNeWnLsrYq6vrK2NOJ1MuiTsu
         EnJH0bADCIXJRscZNEY5kcLQjzkNXI7Pa0qMmQJj+kYa98L9A1ZvcOd/XuFN+wYl5ztN
         3cIBf/mLVgZ0LclPNFzNGNbtDiMZAgW0qvzDAeYtEpnKLjkGF2Te5j6z5TA9Krxbn2T2
         3ebPh1g26f51IWEQqmMh0pngGRGoZjI59INnnkkYENAkosM5KKjnnIfOB/oWvtSwzX+c
         k64g==
X-Forwarded-Encrypted: i=1; AKwUvBw+Ca4hfDhvuS7J1nL+UzDG0vg57UII1KaELFAEiSBptmVqY07u0ephh4bu4gQyqyFgFKfrS5ReDMM7R1I=@vger.kernel.org
X-Gm-Message-State: APuU4Z9vnLwtq6e3WkP6Uuu3FhHh9D2V4sbzlwTY8Q9b49EowysmGUSW
	/N7okd9a964pSkazo0Hk/vZmpgPYKE9ddhnNHOyB+VGWF9lydc373xaf
X-Gm-Gg: AYBFou3nDf3M/5kt3p449B/u8ob0721GgAlI1ePrF59++MF/yDYJCGghY1/T/WsVmEZ
	48cVkVcZvLOC/+H2qtuJZ+FzG1PhywA45tvZLHeUsq3nqo/y0EbW4WgUC1obWnZpn/9ndeDjvTc
	Jlrqp11CVXXPgYV87IbPkBG29v1UH5gsDZGCXSQZ3W53GjE5yQ14Fb7JAh/hiLqhRBMN1qn58h/
	EnBRfcQsJSk2IkTEpQHlynSt8yAjws4mjN37baN0bQ4gF+H+wpfuIq0dNa4JuhAqCs6Qa+GLYvV
	z5JiMJAnuCKkv18KzZRt4iPImKJM3iI1b2sZRVYJQJ0mskLCex8CJQrQ83jDGiIzMZATV949SRl
	qLhUY0+roGMjrsN1oboW5yQWbdO9aCgRJVsWRb3rCYVT5OY1Wgnb+Nmk3OvtOfPBQkxcCXlzkx3
	FMIFg6w7UttclKxPwViLY6lPlxRrlk9jqCPJ0n4NDNIfql7kmWTsLOof5BvN+2E8CYYzobdCl1u
	yzbOzpokGaxCXrwJz1M1Lv0ZtapCS+qlbnWJSkS6CbxaWiGLo0VeB2hVlhk628buWLKFGofeDU4
	YsqJt0y3
X-Received: by 2002:a05:7300:f3c9:b0:365:d42a:f415 with SMTP id 5a478bee46e88-36f7494d0bbmr318179eec.12.1793910768645;
        Thu, 05 Nov 2026 12:32:48 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36f72dc30ebsm632458eec.13.2026.11.05.12.32.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 12:32:47 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
To: linux-mips@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Paul Burton <paulburton@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	=?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= <zhouyanjie@wanyeetech.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-kernel@vger.kernel.org (open list),
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	"H. Nikolaus Schaller" <hns@goldelico.com>,
	Paul Boddie <paul@boddie.org.uk>
Subject: [PATCH 1/3] clk: ingenic: Poll JZ4780 CPU1 power status atomically
Date: Thu,  5 Nov 2026 12:32:40 -0800
Message-ID: <20261105203243.2292647-2-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261105203243.2292647-1-f.fainelli@gmail.com>
References: <20261105203243.2292647-1-f.fainelli@gmail.com>
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

The CPU1 clock enable callback runs under the clock framework's spinlock
with interrupts disabled. Its readl_poll_timeout() can sleep between
reads, which is invalid in this context when SMP powers up CPU1.

Use readl_poll_timeout_atomic() with the existing interval and timeout.
This is a prerequisite for the JZ4780 SMP bring-up path. The original
CPU1 clock implementation by Zhou Yanjie is already upstream.

Cross-built for CI20; the subsequent SMP-enabled image brought up both
CPU cores. Development and validation used Codex assistance.

Fixes: 6673db4f3f26 ("clk: JZ4780: Add function for enable the second core.")
Link: https://lkml.kernel.org/r/1582215889-113034-3-git-send-email-zhouyanjie@wanyeetech.com
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/clk/ingenic/jz4780-cgu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/ingenic/jz4780-cgu.c b/drivers/clk/ingenic/jz4780-cgu.c
index 1e88aef7ac0f..f5983033583a 100644
--- a/drivers/clk/ingenic/jz4780-cgu.c
+++ b/drivers/clk/ingenic/jz4780-cgu.c
@@ -242,7 +242,7 @@ static int jz4780_core1_enable(struct clk_hw *hw)
 	spin_unlock_irqrestore(&cgu->lock, flags);
 
 	/* wait for the CPU to be powered up */
-	retval = readl_poll_timeout(cgu->base + CGU_REG_LCR, lcr,
+	retval = readl_poll_timeout_atomic(cgu->base + CGU_REG_LCR, lcr,
 				 !(lcr & LCR_SCPUS), 10, timeout);
 	if (retval == -ETIMEDOUT) {
 		pr_err("%s: Wait for power up core1 timeout\n", __func__);
-- 
2.53.0

