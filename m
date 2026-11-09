Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794253282;
	b=ZC9Ef4FVacTWzaD9GODTmLNalQND2zuUnlRwiXtxrkkAZf7P0aLqCD4trlNL1iBHQpEF
	 8DEt6ajA0uoKDHHDnHM69bDGs/xh+0uE/PJ/80BcUlRogc7tbtwrBuWMJtp270DwEegsY
	 XNJ/mwkI12u1xhE4KsIOHwxIufL4BFUn3tb93QHRPLgwmR7nst2I4j9K/6UfBvJW6wJuY
	 sELb1EJT6XI5Rln4yrBL9jBz9vBf/1HvZVcY5yk/jesvuZGOhRBbiZl8aaVr37n9/ODzU
	 M0RItrez9DmrE5zIzXBvjwV85ihPMbZ0aHljjmxvB+wMzpbvKeKmsTr0nMdBk8SZwsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794253282;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=CJBOrzmZfEeEjj8zj4QInIClRy264Xeumf7USqg34nY=;
	b=rukEE70YBjXUnnxDX7Mf7iUNukcz+Lsp0v1k5XPMJsgrgl491YcoqOhyBFnMjV+1BrF6
	 nTVQFsPv6s5h2d8LastCBKmxR+R357Y9UEm3qEpVwKwlcVWVWA1v/hiTnXIgfN6aewfWq
	 PNJiG6JuTWt9J+oGJ4N846H72H3u1d0V5g/nOAE4TTCgvUv/EmducxXuM5DbHCVKJd2D0
	 WsYtteImTRnz5qyFZQbl78kx9S8Ygl6KBQ5igTqsnSXXY1Dffj2VxE4sc2R1yT4T/DmaR
	 IBbop4//oSP/RDrUAJKKFimNtWKgQ4XX6BU+o0RDKvr6oZur4e3TMjIdEP1qY2QpCEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Syl3R4er;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D3E160A2615
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 19:41:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D3E160A2615
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Syl3R4er
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-492690dd5daso906779f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 11:41:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794253281; x=1794858081; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CJBOrzmZfEeEjj8zj4QInIClRy264Xeumf7USqg34nY=;
        b=Syl3R4erXBKjFGEeg3LRXecQao4OngqM9IZHhMFMkF/8J3JWGVTCRttp6jPM0xq/oN
         IQM5EWR6YncRE04TcsU3BAfkd5IygbgQ7SIv5ezI/x5VzSo9ceB9+f2WqIwFb6SCg1BQ
         wLRZUNkyEgYDUAQH8dEAaFgYWWvvNOfE92qh9+dHppwzFmcTFJcdyD+Hxag0tp8rWzFI
         0eeJb5WjoJVpcn59cj2B91oDaZoqohxqGy22BeDaHEcRL6ZOaPrOoKyERnkMjKtWxTK7
         N/1N4YFa+Zm60iIljr+7gwgP+k7X1YfoSb86jJ0EmLjhJIuXApgldJYa85sQKOmUrENJ
         zm4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794253281; x=1794858081;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CJBOrzmZfEeEjj8zj4QInIClRy264Xeumf7USqg34nY=;
        b=HBVOgxRrDsaV80GfM9A6SUGhmIhYv9eCJ+5CF+46AyFrlZRPOWOtyu9KJAJ5xwSIli
         Ow4GkskZRNwMF0iiJ26cYxa+WfbsuJ1GsSecy2nnILFI55078S7uzNvUzMSdO3bbijFp
         gUJFzkLpEOctmNaQBnuaje8NzwaIOr0eqrwVz0qjMdoQYGXRIlZ8ZsAbJ+wOKM79LKwE
         oqZKOEhxxsa/oJ4SF1tnq7zRjVflWL6YOaFrpzHAvQADHRb8rsi8gg1RW5MHXSwTvRtT
         IK324VyGGc6OVHSDV3o4v/ypR8si39+tqw6G6Ln3Vf58UG9iKTW05tPvV+GWP8N1SEy6
         9vuw==
X-Forwarded-Encrypted: i=1; AL+hErEZB6tlOILOerjhaF8F8QAnmArxdOFjwrvA8Zyy6QMpJ7zy4I6ftRigApbj8yqiw4sulafiCIPVTdwgkgo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9bvt11KRYC/BAYR78Z4TjfZplTDRNnXcUGKRM3mJaXWJzlA1jp
	wNXZQNtbBlpFxRAdb53bsgDmnOXUPJFTrJg/EHkqmHLozLm55nh8T7Jcmyxt5g==
X-Gm-Gg: AYBFou1mQLygCZbNFrBMzfPU3oku197LomJqAdPszf2dnjT5F0KfGIF99OiVky8EN63
	Zgt4TEqnt7ofNr4iMHmcuNKZzTwnsWZfzE2VUgJ4GRZCTT39dW5dlsDq+vjMMW03r1rdBPqZUl8
	jQOVBTxRh5bMP5C5XVkxJtYWFHG3XWelMBM/yrxBRfBiixEgGs8XW7sp43bDB3v4OiGISNavKb5
	i8xkxz5p7r0WF6StrE0/+W/f//Xml3sjRyRg/844wS5fwOicGfgl4gsolpFng2cM8E42yyzIoQv
	/LShzI1eotO4+Co7+lKbkueh5HNBz2cfpLpyDtBNAgDJFu5KnBGPcXaBXzN6uR4m3P7dt6HYGmu
	nz0YSODatvev3toCdSt7tppCoVZEOZaHkERRZHZjpW1PydlLjFDA0h7Y8A1NUFr08lwH+R7uwQv
	Gopx2+NNKafBoJ0mubo6A1vFkwfQuDdTTWkr5jm+XThfI6rxyIEOr9elId8pCXDYLPuy2lYlKhx
	fY3CLAS3z5WuWFCSKUH9PiQbzvDEmJI+tf0bOvhTPQVtb5OUxDngsSrcwtb3piOQ5eV8lNg4LbB
	THeLPkXlKuo2VAufenj9eJvH2vgi5WJU9DsFVBmfvU3Tj4ditLDyPCVURw==
X-Received: by 2002:a05:6000:4283:b0:491:5b1:fa73 with SMTP id ffacd0b85a97d-49827cf2a91mr1085864f8f.0.1794253280640;
        Mon, 09 Nov 2026 11:41:20 -0800 (PST)
Received: from [192.168.0.253] (5403F394.catv.pool.telekom.hu. [84.3.243.148])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-49836b8eb11sm714822f8f.57.2026.11.09.11.41.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 11:41:20 -0800 (PST)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Mon, 09 Nov 2026 20:41:06 +0100
Subject: [PATCH 5/7] spi: spi-qpic-snand: use the common
 qcom_nandc_set_read_loc_first() function
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261109-qpic-snand-use-common-functions-v1-5-1e8601e2db84@gmail.com>
References: <20261109-qpic-snand-use-common-functions-v1-0-1e8601e2db84@gmail.com>
In-Reply-To: <20261109-qpic-snand-use-common-functions-v1-0-1e8601e2db84@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Md Sadre Alam <md.alam@oss.qualcomm.com>, 
 Sricharan Ramabadhran <quic_srichara@quicinc.com>, 
 Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>, 
 linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.3

The common function from the 'qpic_common' module provides the same
functionality as the locally implemented counterpart.

Use the common function and remove the local one in order to reduce
code duplication.

No functional changes intended.

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
 drivers/spi/spi-qpic-snand.c | 27 ++++-----------------------
 1 file changed, 4 insertions(+), 23 deletions(-)

diff --git a/drivers/spi/spi-qpic-snand.c b/drivers/spi/spi-qpic-snand.c
index 6774a0a5db2a..ad91edd5f6df 100644
--- a/drivers/spi/spi-qpic-snand.c
+++ b/drivers/spi/spi-qpic-snand.c
@@ -122,27 +122,6 @@ struct qpic_spi_nand {
 	bool quad_mode;
 };
 
-static void qcom_spi_set_read_loc_first(struct qcom_nand_controller *snandc,
-					int reg, int cw_offset, int read_size,
-					int is_last_read_loc)
-{
-	__le32 locreg_val;
-	u32 val = FIELD_PREP(READ_LOCATION_OFFSET_MASK, cw_offset) |
-		  FIELD_PREP(READ_LOCATION_SIZE_MASK, read_size) |
-		  FIELD_PREP(READ_LOCATION_LAST_MASK, is_last_read_loc);
-
-	locreg_val = cpu_to_le32(val);
-
-	if (reg == NAND_READ_LOCATION_0)
-		snandc->regs->read_location0 = locreg_val;
-	else if (reg == NAND_READ_LOCATION_1)
-		snandc->regs->read_location1 = locreg_val;
-	else if (reg == NAND_READ_LOCATION_2)
-		snandc->regs->read_location2 = locreg_val;
-	else if (reg == NAND_READ_LOCATION_3)
-		snandc->regs->read_location3 = locreg_val;
-}
-
 static void qcom_spi_set_read_loc_last(struct qcom_nand_controller *snandc,
 				       int reg, int cw_offset, int read_size,
 				       int is_last_read_loc)
@@ -514,8 +493,10 @@ static void qcom_spi_set_read_loc(struct qcom_nand_controller *snandc, int cw, i
 		return qcom_spi_set_read_loc_last(snandc, reg_base, cw_offset,
 						  read_size, is_last_read_loc);
 	else
-		return qcom_spi_set_read_loc_first(snandc, reg_base, cw_offset,
-						   read_size, is_last_read_loc);
+		return qcom_nandc_set_read_loc_first(snandc, reg_base,
+						     cw_offset,
+						     read_size,
+						     is_last_read_loc);
 }
 
 static void

-- 
2.56.0

