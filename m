Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.194
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794511977;
	b=qcx1Ipj2K0IUkEC9WiEnagwdQ2x+IEDdaFNRna/L81tMM6bRKYjX1MtsQMQNqnpFZ4p9
	 IHY5uREWpLNNGCJBIrNfo5nurkUhcgQBVuHNfv0ec8JsFHM1W5sPBqcmsGX1pHn2L07K4
	 OxhmRCvnng421kcAktH32otn1CzVVN9VPfqNgLd4zUhKbEzX7w2BgMlNx1B//M+Ss6m/b
	 CAKpNIJpNKGQ0iMrSKa3zarwegGWgL4q2WZD5sW2tT95VCFFrg/iDUmbM90AarzEEsT6t
	 W2bOoL3vQUiPT9LRiacpWCE6lZjmse2QBenBBemZnhAxgWWYB32foqCjjtN/HdJIq4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794511977;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1HwqTVVnFT7TKtTWFLYes0RUTc1B02SxtEVX6833g/A=;
	b=1D7dcROfZCGTdH6AVYj8o/xzRbQkDK3i2zumFUK26LvASiTGgDBHkDciN6xmk1AcYXc9
	 Owwdocm6SMQV/7E7tFU5k4lnMCkqkg4FNxnMECXrdH/5SJ1p4xse1tGmPNfr8hlBPaXQa
	 kD7sIMrHPCspLgNkluNiFfw6xYV++yl16jy25WLw6ZcZz3PGNbeftf6ZJRM1rf03IeyJk
	 KrY5I7whfg7VvY8gsrReKAT9MomgyY97xsQ+5sCVHkbzR2d5bS/oueB8n7hIqthkz9Dbh
	 hSlLAKyRN/8TFJVv23jCx4j13/TY3M9f5bdjlcRBc0t1OsMnmTz9kXaXQr0fIwjWPqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HTkpkPeU;
	arc=none smtp.remote-ip=74.125.82.194
Received: from mail-dy1-f194.google.com (mail-dy1-f194.google.com [74.125.82.194])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70D4C606A881
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 19:32:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70D4C606A881
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HTkpkPeU
Received: by mail-dy1-f194.google.com with SMTP id 5a478bee46e88-37600b0db49so1139513eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 11:32:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794511975; x=1795116775; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1HwqTVVnFT7TKtTWFLYes0RUTc1B02SxtEVX6833g/A=;
        b=HTkpkPeUlYafXD9LQAkhIwrFERLVcjpR1F0zM7YZy20qARACQ5/DJlbJSqzNRe+WuY
         0krYA9XgsD7CvmRtA4khk3TcsBL1IcK768e8B9zLuqCfchIsdDWn9qr9I6c7QpOOuRIp
         hK3UQcAH9dozFXqYBm44inFlBaV0yroaNlkrV0lbKxZWZddqKcsaCWzihgmsJONyI722
         pIXLAiouVrczqHqS2Br24TjcP2LBaHn66Kv67Cn4lsGPs91wfJfNlPNSvrJzDgI+jICy
         SYIlANeiMeIFzfkaBLYQPN6nxTvMvXfAsAAK36UNUx/sdQmDN0xYNvH8G0EEUJAYDWXf
         qjmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794511975; x=1795116775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1HwqTVVnFT7TKtTWFLYes0RUTc1B02SxtEVX6833g/A=;
        b=X0Tig/29s+F0iAAO36zMdlxDDftVT/qqEyfK+A8kSsQvIOj2POtYksAdK8CLPjigGM
         syFgAMZGLsAFrCaYWcqtXjdBOuJGs+RIu4XY39G4Yr7xAUzpInvgaAJGxmkS9y3PNvNS
         xmay24Uy3/uiEVRYurMwq0ZqIhMHTD7dHc3AOE6EYSXVBTkutBHIvwHcJO0pwzi1fDAX
         ST5aDDltD1H/ruGQiAKc3dYcfznPAigxGey98y8rdtNHA48E+zkVVZUgL1aQx1wSY/d3
         4MVi4OqbQkCipQAvgtnWZM3Qzfslwf+H+dFbDN6MpzdVqpHoWq3gKno5gT5q+yXfu5aE
         WlJA==
X-Forwarded-Encrypted: i=1; AL+hErGVVda6U5KnOPm+kajuU23vHW5eUGsCVdC1iYsQF28HAHJgOiGxG8Ftq23ViLa5j4rfC+w/eS9TwZEleKs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8XzSU5sL0xu8QjLESph7Kc4d1xiihBgJZVvEpujEalk9Dcxc3a
	9ZYkcd/vJ/B+PU/wfqJXGrkLpjuzz0I6eolpGcA1vCCEKAq4lJOfoLeE
X-Gm-Gg: AYBFou25FuWd5N390et3PbsCCNGWN9Vy3vIjUI1MH/WLLPThf1UUPB1pWleydRzSZJY
	RJqVkN/XagcNWF5MLSrhwI9dnbglRNgQDQD4jwr9K5JAuRVKmPxjC6ckFYDRP4RB5LvT4/6lSPU
	G49zUe/jRAWte91QssHdvImq7Qtzcra4jR2KDBkVg/ceWnRtJRtwSxe1SQJkXFsKqLL3qS8wUZ9
	a0pdRGzE6CO8u7vpy6bbm4mToucv7fhggYTG8OSyYLZzd76LuHTLdjMB0Adw1vdDhENN3anFnYv
	Kp8KUTXpzGZP69jOS6UgxeAqX0FkDd65rEWqUYc6Qo7vLoluqdrdKJtIDLbnAH9K7yq2BMFR5en
	fPInFpralwKVKmD8V1zX9VHGth7YIIGaj9yH53SPlTe3N6KcDj9gy4WqvjUD3yCRuvp3RHObPkF
	Sv8+sRrmGjkxO9fXjhbIndrKqwznDo5kySgTuqF9Qao0CbqEt+oi7igKy2E3T/tHjy9/A/5wGDA
	19c6usZ4t4mqlHOQ5dAiFAn6/is5KAhhW84OBU3keI42rtL/XYW/Rw65bNGHOxPcPJDasIi83N9
	BJiFz9I4iNLzUKE9KN+v8YGwwj/XGc46a/swWR9MgjsIcY0IitMkBd1lVqfI+T0bnlT0zRk=
X-Received: by 2002:a05:7300:7fa6:b0:36d:38e0:79f3 with SMTP id 5a478bee46e88-377e1af812emr4156057eec.25.1794511975341;
        Thu, 12 Nov 2026 11:32:55 -0800 (PST)
Received: from AERO17.taila7786d.ts.net ([45.95.212.224])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955a1c5c2sm565379eec.14.2026.11.12.11.32.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 11:32:54 -0800 (PST)
From: Pufan Jin <cyan2254650260@gmail.com>
To: Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andrew Lunn <andrew@lunn.ch>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 1/2] dt-bindings: soc: xilinx: Add ALINX AX7Z020B board
Date: Fri, 13 Nov 2026 03:32:44 +0800
Message-ID: <20261112193245.250149-2-cyan2254650260@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261112193245.250149-1-cyan2254650260@gmail.com>
References: <20261112193245.250149-1-cyan2254650260@gmail.com>
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

Document the ALINX AX7Z020B development board, built around the ALINX
AC7Z020 system on module.

Signed-off-by: Pufan Jin <cyan2254650260@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml b/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml
index c9f99e0df2..e3bd3d7660 100644
--- a/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml
+++ b/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml
@@ -34,6 +34,11 @@ properties:
               - xlnx,zynq-zc770-xm013
           - const: xlnx,zynq-7000
 
+      - items:
+          - const: alinx,ax7z020b
+          - const: alinx,ac7z020
+          - const: xlnx,zynq-7000
+
       - items:
           - const: avnet,zynq-microzed
           - const: xlnx,zynq-microzed
-- 
2.56.0

