Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793072971;
	b=ewkXsyROMKeUmueZLz3cCfTiGfIvtaJFh2RINfbdka/5F3/bwY8v5zZSQa+we1Ro0auq
	 Z1TvjRReMXyo8vFYULB7UVa+Oouv8fl+GV1/OU/UeBFuihCNtrMEXvdyApXgPED7mq3KD
	 IANz/T4aIcuutaj/c4mUJaioVEySGwKiI5rcWODYihCLqQxgGpvUPBkuzh6iWI1GQHQCU
	 AUvPG5YfmXcop2ZbhZ04wnojRCAEnODug7dcOWzAdAq9GoXB9Be9e+oSbYwMc5TKLQ1jT
	 oUpK1SKNKPJyVlJhcxP+RCAwt2Wlj0GPfuZ47cpJftgae63bR0vPoo6YU5iNoLAf0/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793072971;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=bVKdd+rg0dOMU+J41LGwwuebdjS7SkBQhNfNvVlqcdA=;
	b=fRFl3e8tKoGf1q1kDduCBSkPn9CnPFDBNw443Ys1BuM2gBAUo7MzHYVJRR4SbHWkR00O
	 UTsPPtHF6i64MEbCQ99gJThYJ9/HS1F14vBBRkR5EkFD81iFA2oqgSQof+tfI0RhArylu
	 mN0G2RKGAyJDda56sNUELoO89Ta91CDXeyIWU5tBTka/wfL363FVTLnUFRoaJDnyp2DB9
	 vrbQGYfw4oXVuyedm9m5nEEKuhMUlgF4vdrDGHzFaNhxHM3+8kTk9CUz1qAM3xoxzBxvr
	 bfFgufceSM/SLJ03CjTx0HL4Pk71txJFMRNbiNPN4sj3hwtZm9UPJZ+aadO4QTb70kQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=oW8dlnMW;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF01C606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 03:49:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF01C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=oW8dlnMW
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-35d0be18c71so700794eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 20:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793072970; x=1793677770; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bVKdd+rg0dOMU+J41LGwwuebdjS7SkBQhNfNvVlqcdA=;
        b=oW8dlnMWBVL9nfftPc68vTnWcbQuATCdgR/vljP1DDi278fcmXoC0YqgqF0+bteOt8
         G8l120776hYEeaXZ8lOSekKRkELk87685tj5zEPeyKaXxjxdQfE1pDdtf8xx9G5UUDwV
         7AhzfRINwk/nq1yUeKMGUIkWWMYD9MS8R/xFo6nxu2a6L1KosvD6k/Cv/jFoqlUUCQMp
         P3v3FL7L1bJfCi5klSn+yJktsz+CRHzmNfFuuC+q67ZPujrfsJolAmEJHMeYTbg2nRHB
         OgySQnwvvkaZCBj26camPhSRDwG6mc8Q/p89yB0XLYhsU8aIjelqWpxbdjsz4NXZU02w
         y3Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793072970; x=1793677770;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bVKdd+rg0dOMU+J41LGwwuebdjS7SkBQhNfNvVlqcdA=;
        b=AWeWrKkxRiwPqdQLe335Sj7OfVBNTRFNeb9n8tEpGioe3KtPUZgPDrfrdyZu+basFv
         Ys5yfR1pMX4s47pCyLaScUyIOXmOqzvxinYWwjwB8l48XuQ45pN1cLjbLvjDo7H51Pcv
         0Hr5T4W1HfY2LZXjaDQm1OkR2nIZsNSEvKVvXpxOWIUj4OImbPxetKYT103WoBeHunwA
         VVRaYhz8wfNAbOyVuc1BNkN6NzRG+ZIJ/jw9aET0NxtWezTca+7V02lRS3kJf8MkCV6B
         AMsGj+/4eDNw0BksYqMu0E/BJ3+TPO9ecak/Yv9cVweVVW1k4t8yXyQXWRg1IPIgZkv9
         kTiA==
X-Forwarded-Encrypted: i=1; AKwUvBzjHQFeFcWSSqa8+E/8G6hEo1LRzKDqMEoZvL0Bg7hDghjDhxveqKNnGfW3hIGTA6PyVO8jU1gFj86M5dA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIubZA0w9waLYec4svSsirKRpKOqha7wh9zuu/pe28535U3rmkA
	xG3JEoYDQsYYexfLVWlLdvdhfjAnEzCp5jtrjExXzw7nuTwArHaNIj50
X-Gm-Gg: AYBFou0m/PVjyEnrTS4vhW2+KIzAktbBcS9aVKeq8p7JbaM+zZWNGjPsrHsiMnPFbrL
	to8vmziOkUuiNLPkASEURKf5KOjMsxIXbSowcFfA3fxCIOQVvuLmU3DYbOjAuGRpuYS9isZYuV1
	AKecsbVioxmxvVzI9sZn+7hUPKcX9keLDV6srTqxr5BMsF/sVo/oduoZHA16n7ZWgSsLVnkSqLa
	ekqEkR6REmqAWjuLM2fxl1f0wuEvMeZ7NO5inC+CdfCC4q/2Wq4Bs14fGEp0nSVebc4MwKmbkFQ
	1oL4TLSFT3gNyl0L44LPv4hxW/DespMPfhAC/VO2kGFQmHD1JmExlbZCYGVrV2Hb4IUyyv29XBq
	YtA71WgmXaelR2WnkxFH6o2pFTWLIANVeh85DGo7Nts67+Is/oYS1F2awDKwA97MWdcnzmSbUxP
	XXisvXFF/Smwd0YaeMDx+z9pJ5oNA/gJw7hYeZwOQtWePt7vzeohRx2ijkM70miaveSTHYFpVY5
	Kxhj48r7w8TEzVE2cieLGWbSzBrQmHextB8SBhkhnS52ECfcBVGtfL7x98kWBN2HLjselQ=
X-Received: by 2002:a05:7022:47:b0:14e:5e6b:e6e2 with SMTP id a92af1059eb24-1a3c904cc2fmr2284657c88.18.1793072970015;
        Mon, 26 Oct 2026 20:49:30 -0700 (PDT)
Received: from debian.prasanth ([103.177.82.12])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a2a5a515sm26430012c88.19.2026.10.26.20.49.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 20:49:29 -0700 (PDT)
From: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	ryan_chen@aspeedtech.com,
	billy_tsai@aspeedtech.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	andrew@lunn.ch,
	Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Subject: [PATCH v9 1/2] dt-bindings: arm: aspeed: Add ASRock Rack B650D4U
Date: Tue, 27 Oct 2026 09:19:10 +0530
Message-ID: <20261027034911.99482-2-prasanth.padarthi10@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261027034911.99482-1-prasanth.padarthi10@gmail.com>
References: <20261027034911.99482-1-prasanth.padarthi10@gmail.com>
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

Document the ASRock Rack B650D4U BMC, which uses an ASPEED AST2600.

Signed-off-by: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index b7e70868e..3e6133e2b 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -79,6 +79,7 @@ properties:
           - enum:
               - ampere,mtjefferson-bmc
               - ampere,mtmitchell-bmc
+              - asrock,b650d4u-bmc
               - aspeed,ast2600-evb
               - aspeed,ast2600-evb-a1
               - asus,ast2600-kommando-ipmi-card
-- 
2.47.3

