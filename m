Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794282630;
	b=JA7aY8nou5j/H91qnJp12a5XrYqqX0xkfwtqCvGNu3u531tIDYK5Y9nEp+XWbSfznRaw
	 tfG42wgBZLtCVuHkysGX9iQIcKbmY8Ghv1S1Tr7SsgXZzsJbliS/vbXrbfQ+ZPI6dI64C
	 u8UcVXEH92vsRU1ZMuSZD/G8x8iYAvRKSys/s/kQhE51nmLjAcQthgSu2bgkb5x6prS7k
	 EQlJrOhmJIWv5pUoqDdFe3n1XMfwiDFIRkvBRVUyQR4MP5F4otUM/CuJWH1tPGhns8h4G
	 dqgJW3t8KE0Mh8Nx4LLT2u2A4UjRBhq0wURalGHuZqe+xN9iXef9G2Xltp54IbVdXQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794282630;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=OUNtryZiIEIq19vN65HJanQDCXRhp3Ynr4zR++YUTaA=;
	b=W3FuFxD6GV8CtYe3kHLSg8nEM0JY7oTxhlw3zcAhL51ZHsWVdBZMBuCnQn4C22g7k+Zx
	 e/Y8ppIkZzkhWEDBE1Uwk7PRcEU4xX+/0rQiKlmWk7P2govTY9kaYnb5UqZPkgc8gUJ25
	 14oHF1ezYVwJbYupgpe7FLZshPeqrDpihWaozr0awHHS7a9CW7CmzCjVy+tflUsPnG80f
	 GygAheNziXChv5ctXuRCrBgdyLZt+Cm9cMe0JJ5PqNBCC9AR1tAcMTc6hyR4ThSL4ZTNn
	 zlqdnV+AKe1wHPgZPxn6pKhbVF8KO/Q3u7MFWd/VuioXLkY9fx7v4vDcJKQ1i1ZsWDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=gsXnAEuo;
	arc=none smtp.remote-ip=209.85.214.226
Received: from mail-pl1-f226.google.com (mail-pl1-f226.google.com [209.85.214.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C6BA606A339
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 03:50:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C6BA606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=gsXnAEuo
Received: by mail-pl1-f226.google.com with SMTP id d9443c01a7336-2e9d1114320so12447165ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 19:50:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794282629; x=1794887429;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OUNtryZiIEIq19vN65HJanQDCXRhp3Ynr4zR++YUTaA=;
        b=FC3LwUIQiu5CxOOoGw2xW24S206XbYiL0A8g4Ab3oxr8m0GYRYPBaRe2IVzsSohBPB
         Nd1+2fOlNc+XVlwdBk5Srtx/tfLYLVpkJk5I2N6VGYkZSyJk3gnK8FRHhYMA9VHG+YkW
         dsNJlBBzyaifqPmU3glan2nOfSeqijNELKzuerz6jX44LKP/6ptEHYbgMS0w43Ht35JA
         28pet2NZz2n1t8Fmlnj39vqEcOGiAbCaGXu8NIkChyYpWBOVuZhcxF5WN0dbjhyI+K9P
         AIPSH01/U3voQlds8rNPElvItdiDyY1ShA3xiN4QsXNhyzKPJsQx4tD2+88QKUF1yjAy
         MRzw==
X-Forwarded-Encrypted: i=1; AL+hErFTv9Ex1tWDMH1DwvXd93KDAnGd8eTqP722Y6JKlDEGUgiGxTb9sj2CH/Jv+qgfanmYrxaHA8m6IsN7NPo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/O9lrz+iHDzeEYBXPf51gaiPaqM0HINwoWyi96NumoOiiYOUoo
	ncceh3a4SOHRPPeEPgFflHALaxJWLYf7TVXa4P/PMW3NROgomaW9+aEZh0Slka6dTQfwuKnaxRI
	sojxDr+5YUAZRt00qtRo5h9CgarVE+8FRVMTtnHvFB2PQUWFmT3yOrADcmSHpKq5LNQevWnV53H
	MdnFQwj0kCN16XOkJz1aMTIXIGOS4xRuRL8xflujtJLLmve8+VeVyixwNs9dfoCiVIrTcA5nA+x
	MQGV14DEC7jIoiK6kdzoolO
X-Gm-Gg: AYBFou2QjYkJURqKYSjE5MHN3/YxWIfTXtk8SpreuhuRcN01m7XWucQFpj3CkD4RxiE
	N0HKaz1f5bOzK95bVos6nl7ioQB/R7tCw0CRet91oY2jdsBPlL7chqueY//MoYjvxdV5GG4PddR
	cpKpLyjSZeHXgb/EbAu4SXj9qVlOxenOAazUagsFYflkMwnUs5UkGO1i7mK1lLNLBGy+gWLMPko
	OlY5/i6Xi0sFlV/l9Ixk+6KCbCgbGZKnmeACm6KPovauVo0G53IxiAFhWXXnhkADRI+3CEUODoI
	0Xc+FEQ+gy+ZnExkzHdPbfisYTxINBmQR6pnpw8ilQThdfMz0yM3/jKBUUZms9+aL0a3dhXabPG
	6pmZv0d/zj6PRVEPOkY9iW2OOJTKgy1drFJDjFsTLVaYkyx6Y1SonQ/pB0hk6rzGfEOTTnpdSFE
	mT/Cy7mcNJ7rFSQAKxpvQH07PxGIVcKZAnACPegsMG
X-Received: by 2002:a17:902:d542:b0:2e9:98c4:ad3c with SMTP id d9443c01a7336-2edb912d227mr12809565ad.11.1794282628802;
        Mon, 09 Nov 2026 19:50:28 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-22.dlp.protect.broadcom.com. [144.49.247.22])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2edb65c0660sm307515ad.52.2026.11.09.19.50.28
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 09 Nov 2026 19:50:28 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-535066512b0so33794141cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 19:50:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794282627; x=1794887427; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OUNtryZiIEIq19vN65HJanQDCXRhp3Ynr4zR++YUTaA=;
        b=gsXnAEuo8qY6VPDRCsVGl3CxNweCbDF2TU8WDL8lY8FTE2u9AYJ64fN4+vAtFQ+nUX
         u53aD+1ue1dvClc9jgvYI4tf4Uc3b8nUp7j8t9L/h97wbh9zu6nmDU4n6E977n7uYgva
         d0vmj0c+SUR9szBGW4ZNcqxxCNaG3wMuBX9G0=
X-Forwarded-Encrypted: i=1; AL+hErHr5xCa6ALlw3lF5QnyIuVobJYHlgX8ny4iFYX/uD7K2dgJigwqogoMWNWE9ixDkCOmpXvGQHwEz5TB2mg=@vger.kernel.org
X-Received: by 2002:a05:622a:34b:b0:536:33bf:7bf5 with SMTP id d75a77b69052e-5552791b822mr25725661cf.29.1794282627584;
        Mon, 09 Nov 2026 19:50:27 -0800 (PST)
X-Received: by 2002:a05:622a:34b:b0:536:33bf:7bf5 with SMTP id d75a77b69052e-5552791b822mr25725501cf.29.1794282627206;
        Mon, 09 Nov 2026 19:50:27 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5550af612dfsm13740951cf.8.2026.11.09.19.50.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 19:50:26 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonas Gorski <jonas.gorski@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Vivien Didelot <vivien.didelot@gmail.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net v4 1/8] net: dsa: b53: initialize the jumbo frame size register offset
Date: Mon,  9 Nov 2026 19:50:11 -0800
Message-ID: <20261110035018.2169370-2-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261110035018.2169370-1-florian.fainelli@broadcom.com>
References: <20261110035018.2169370-1-florian.fainelli@broadcom.com>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

The chip data specifies both the jumbo port mask and frame size register
offsets, but b53_switch_init() only copies the former into the device.
Since the device is zero-initialized, b53_set_jumbo() writes the frame
size to offset zero instead of the chip-specific size register at 0x05
or 0x08.

Copy jumbo_size_reg from the chip data along with jumbo_pm_reg so frame
size updates reach the intended register.

Fixes: 967dd82ffc52 ("net: dsa: b53: Add support for Broadcom RoboSwitch")
Reviewed-by: Jonas Gorski <jonas.gorski@gmail.com>
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/net/dsa/b53/b53_common.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/dsa/b53/b53_common.c b/drivers/net/dsa/b53/b53_common.c
index a2a5754c413c..ca2ba8c157b7 100644
--- a/drivers/net/dsa/b53/b53_common.c
+++ b/drivers/net/dsa/b53/b53_common.c
@@ -3172,6 +3172,7 @@ static int b53_switch_init(struct b53_device *dev)
 			dev->vta_regs[1] = chip->vta_regs[1];
 			dev->vta_regs[2] = chip->vta_regs[2];
 			dev->jumbo_pm_reg = chip->jumbo_pm_reg;
+			dev->jumbo_size_reg = chip->jumbo_size_reg;
 			dev->imp_port = chip->imp_port;
 			dev->num_vlans = chip->vlans;
 			dev->num_arl_bins = chip->arl_bins;
-- 
2.53.0

