Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793649333;
	b=KWnWRXmSMQ8ZBpn1yErqhxA1u/O4qleqxHbP3saT07e/y9u/aNf79SCxVHe8U7wJUlQM
	 u9jgcrsvRSqFeJQD311PTIvDyurKoAIu+0qOBva+bUREfwkjZAEMBUawo5KPoH0ULx2El
	 H52Tx4SvL9mUSadZdw1SYbR0DEvEpSZy2AAzLjnVwB7j/dyzrR0X15e1L1qOCuwBE5Q/1
	 vGphU8qkjnjxt3bs8EWz9erK4o3E8W5Katj+subyygQnK2bNM8OEykrKjKqQ4EskUgaYd
	 iLURoW1tXNRdoU5ZMiObb8O/WI8dYAhRkWFzhqqR1HucweVfjjcbQJtkBbdtgzGkoRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793649333;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=QlRh548rr3RZodybaeLisbTTWEcq7cqJLOra+2wCfg4=;
	b=rbKA50zAlLgmdzgFTlqyUYeyhghUR4ZX5Bj/Di9FMPpaBQ3J/PWJJiAocLQwKvVt+0it
	 oZhEOCesyYfZ+8jErZ7ic87SWHEL/Ojp6uc2HOQuhEOVRTUeyZ5XYFGgWeuDZ9jl6E2XG
	 8ASNv7bIpu+RQvZEpS+o5HTwnbMXUXzlurOHzBRToU/9kU65iTdfQcludXLeSbqY4eTLc
	 ocatJcnUC7riOosgIEPM4G9nmDnGJLaDKL9gTY5hGbQ6i7EKtuA9WXIha2ZY+lraTdRvj
	 Ww8JNVWVufyYI5//G1JMrW41DWyJbIt5MZTW6/i6D8ThCP0SGIfvtG0i8i90xl8l+CA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0tI1YuB+;
	arc=none smtp.remote-ip=209.85.160.48
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53016082BFA
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 19:55:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A53016082BFA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0tI1YuB+
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-46556b9e02cso2771716fac.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 11:55:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793649331; x=1794254131; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QlRh548rr3RZodybaeLisbTTWEcq7cqJLOra+2wCfg4=;
        b=0tI1YuB+zs0KnuaGqYlU+SONfRwA1e6goPMu/fCLW9InZ7R8U01d6RPKRjSui9PEct
         b5JM1a7zKE7fCmN7epJ2Z054NrJO3TfJjvfHTupc2yRHmgMJyhBnISUYZRrOrnLaINWg
         hZrrofcF+AszR11YUdigxcATbtGBh6s54IMrG4amIUM0lfRtWG8CLTjuuSOntmPOcsf6
         bgFkFbCxikjF5KXRYdjkTQsQM+8NBZzeu/AMRpa0nAr5R9DIjZDUurxTGQNhT7/JyISC
         pgQjZX/AGDiBW77knu2gtoY62Rrlrm8pXQ5Ctd5nrMkFCW61KYG6Da2FoGtTWjC0Ptg9
         CmvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793649331; x=1794254131;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QlRh548rr3RZodybaeLisbTTWEcq7cqJLOra+2wCfg4=;
        b=Rx+veVcVmy1C3Nh4y7kh/WI8KHWFi+mAHIgvLK/uPR/H4cFoxqVLi61QAfMK4kSFzZ
         kkliWNyVk9Tu4H46VBtuijEOt+may+T2vIInNFsur2Fn6JpmYxKzlxcKQDLaM9CA71n2
         lfWNlQ+dQOHogZXJtpQdKp115URa+nyr12LXFmuugZhiqHiq4oXoP3864sv6BFwiO+MO
         QmXF/j1V63dHNQVl0yt0H8oErNc0Uv/vYQkydJIeDhV7wTmLq5I1L72gDLxhfa1GqmER
         ePKRBz10Z8zEdBeFnHljJhe1+knHvagArxkIaQD1EAaSXwdyBHV1XuIib9/fQeaQ33sR
         d/sQ==
X-Gm-Message-State: AFq9FYK7kE3Xgjs9DHxSdtn/n49JNKzsNyzALWJga/k6pLWLZq2DsQya
	H0kLgh6IRBJao7bYwSCh+49O05FlpMfdCqftUtwlKvocHjFow+h9Hn2h
X-Gm-Gg: AYBFou1xcVyjfcBThoRVew5Z9NTQgqfGu76tXUG3eHiEvnzd7XrpD1VVM981P9QwfxH
	+FgQal3VK9C+6XfKNkfbduPiEnQdp24NW8r/iO38cPf6PBg0RsHxObqHJwrMKFtby0TW2kKwpvu
	lo7VG+YBY0EWG4FaJKXZ7Onv5Swhs3T1MR++ltYSKOoTBJPGFUgzu8bkFxegDaKiFSmhqqThMrx
	ZFTRjqTSi12vtN2SeW/gApL/lqgWJEDvxdvsp2Y1tZKHFTJw975MNUjgMDQJGr9H6yX3uJOm6pX
	UpiYE/bc8Mm3ogU9xJyqV0hqls7rDYWe26STUVReqeVOsMYQ6gOftWAStlx57pbN4fLcH930CM0
	PgNpCKOAlNSgqPU3IsocX9zJVt12LTpT8w9WR3g7reyQiSyApl4RtQ62VO3nwjltahrD3rnMAlM
	HJXnoDvP79Bz0zeBr78NxN/ykZuwnH44amCjYGlUuoGjh0g8K1BuBczon3ZqqHGnL1mIQLQZzSP
	Y8Qt0hP010WmgNPPRKf2KM8sSYrM9RBzIS9tCu8QCt4vjP+Jt9U+SXXrKi5NyvHM9tF4J8dDNtF
	gojQ1YjWyu7Q1qz9CrfoybHGnTrN1auWXlEj7imnH+Is+WCcM4AD/7SBgL7iVGXj8p8X9ci3yrv
	M6A/AxYWcUJVZZMMFL7FP5dEPPVGX5Aa3novTUzP6b5Cetxl9e2shQZDouLjO10CgD8BatjqHxM
	4ndK/VCvgnycEYy90ToyEz4UuUsWxOP1mwd+3rwNB0mnW27XKiWiA=
X-Received: by 2002:a05:6870:f150:b0:48f:e0f6:bd51 with SMTP id 586e51a60fabf-4a8e0ac1b8emr6815144fac.38.1793649331212;
        Mon, 02 Nov 2026 11:55:31 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a921353dcfsm7809249fac.0.2026.11.02.11.55.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:55:30 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 02 Nov 2026 12:55:21 -0700
Subject: [PATCH v6 6/8] dt-bindings: serial: snps-dw-apb-uart: add
 Allwinner A523
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
Message-Id: <20261102-submit-h616-uart-fifo-v1-v6-6-25afcb346b0c@gmail.com>
References: <20261102-submit-h616-uart-fifo-v1-v6-0-25afcb346b0c@gmail.com>
In-Reply-To: <20261102-submit-h616-uart-fifo-v1-v6-0-25afcb346b0c@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, James Hilliard <james.hilliard1@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2

The A523 UART integration has different FIFO depths across its controllers
and reports each controller's depth in the FIFO Clock Control register.
Its receive thresholds are fractions of that depth, and its optional
register layout differs from the generic DesignWare integration.

Add a compatible for this integration, also used by A527 and T527, with
snps,dw-apb-uart as a fallback.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
index fc1289073241..ea6ce99178e3 100644
--- a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
@@ -61,6 +61,7 @@ properties:
       - items:
           - enum:
               - allwinner,sun50i-h616-uart
+              - allwinner,sun55i-a523-uart
               - anlogic,dr1v90-uart
               - brcm,bcm11351-dw-apb-uart
               - brcm,bcm21664-dw-apb-uart

-- 
2.53.0

