Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794414572;
	b=vYtW4o3RrpiuxnzzJxkBeFPpwMAhyc24Kc+ssEJX0vVspHDXyVclVodbMbn0v2KVxKLO
	 vaWmLdys/JhUrQmu5N/O6c3yWBRDZNR2qT3lFDCmoIIYa0UPnx2YGFncrCJFRN7wIcTOp
	 JP9LE4E4Jpo7h3hOVih4XifGKq+vpBNOo4UhCcHexqpLdH03rfCZfSi5YQm7IMOjlH5X+
	 M5DEpEqd07G5PeRtWhrCl2D+DN+UIvI3gU9ElT8ju4+hQF3lbJtdGlBhorLRXC1pi31K3
	 1KS4bASHioXxc0W/SiW/E0LZAGEBc9SsQMBwUtNjf5PISPbpoor2izpfsTIhGj0qE0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794414572;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=kIIpUdcYbCc97fJ/nZL3tfOeMSipetiHJ2bLLYEWKuY=;
	b=z1VTgvvvs5S3G5kWvofAzN8SClCb1Zlxo4fSXEeqD0ZGuLBvMJiHGC897fdxLUa+6Z8U
	 nMhnYKfQmBIwbzXo70DMqRJ6jEv4HHxVOdO6JIR3qsiqY6w8awT6x4xw8ET6CcRJN0zmi
	 JRh512U0jNBgnOGJyTFPrGeeioNCPufwzQJckbc73YA6TKCDxN5Bs/In9xXwmlCk/YkwH
	 UX3aS8w7CSnOqpH/jtp3r2OTsJIn2TVu4bKzuurqdU6N1aFTDb5nzp1BkzKETNDfSkFpS
	 yCKUn53Aq/pN3Tr9JKVoG5O4UkqRBJj8VMs1Lblk2Slx+GYQ+TON2RUekRkkiE8yp2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zaqrsZYE;
	arc=none smtp.remote-ip=74.125.229.5
Received: from mail-dy2-f5.google.com (mail-dy2-f5.google.com [74.125.229.5])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31982606A8B0
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 16:29:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31982606A8B0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zaqrsZYE
Received: by mail-dy2-f5.google.com with SMTP id 5a478bee46e88-36f936424f2so1258052eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:29:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794414570; x=1795019370; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kIIpUdcYbCc97fJ/nZL3tfOeMSipetiHJ2bLLYEWKuY=;
        b=zaqrsZYEn/rR2d/zkRH+W1WF/RIN9/OXs84kC7LtYU1JK9QVHG3kiLcxLfYv2Gkvks
         zXOCdozil/FXUXkRhobZhfmSEhL8Sw5MmdLvjOtcceVQaS2xZq/G8lZwkJdLsREZwjcI
         EOD3xxOvOlbAmRIehezHeeR4QmaxbhpYdIKZ5uO4qJW/0nBzQ+AUBKvpHyTs6b4JoFRL
         ONYcdXspL2tON9/OneK+F1bGTtJ02qWmfxbB+lFvKJ9cO4OFlR4Imxftx/enYevQC9BJ
         LxZdwCZrckAHHsdPKaRJJDZFl4wtlUVcOqWR1vdqUQTLAPjsXS0lHfUvp1r7n4jMTwv+
         FfbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794414570; x=1795019370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kIIpUdcYbCc97fJ/nZL3tfOeMSipetiHJ2bLLYEWKuY=;
        b=R9V+0BJckUlLn0D+h68s1OK0Bf+57GDGs2O7Qe9fcIOBoeM/2Fjao1murJZr0IVLUm
         kT61guB2dlBUmtivgAiQq4op7LpnNskY5e/trRAICX0R3OBBwp/UBrP2zkRwkJ77DZSd
         WEvENK2BPk6pGWeHD7sT6Hl3txRjLJEGW/12jJ5Ks3B4ttZoYjVLR/e/mVOAgqFY48qU
         gvXUdfHmk0LKRWflP7NyAM0z2Xioj9FVpClQguHnSac33Rsb0h5isuC7pIgMkpQ30+Gy
         4nBKvZCXi4HO1gMJnJ9i47CvEjUSs/YYddH4I6iuQKV7NRn6v/X2mQsDX6GYzaUhKfjh
         FepQ==
X-Forwarded-Encrypted: i=1; AL+hErFRRfJfLe37zJ5MK8SV5d6xa2U0aQbl15KGq9yyQK4kNcXmmLzXew/C/9IKHUbIToC9MuZvZQxAdpJ3mQw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/gytdKTFaBp8VXDtqeTPNmUngg5dj1JZF1o22bfJ6zosr513d0
	t5T/KCXTJvcIEuRGogFdTlcOLOQGuFRr+Nf9iiPtFW3ryo3aK8FNnUUl
X-Gm-Gg: AYBFou1Q+KrlVwmmvfAOzEUUDt+kLODKg/+T7ZHtH/xKD3KT4qkxAhZK6bEOoj8uKtC
	5zWGqc6UyUW7LsiQ2TMFucClJKANfchXG5iuMClWbnvPdyrIOWR5a9O2NVqNa2QIaN++W3TLUDy
	nAp9ntz6W+Bj2x3BdmNHRzhgOmaFWknI750Hl4jttY0FXnHWDrFKUPA4qFqn9ljtQ14oAbSrlhl
	6ImjoKiPd/HldGWkmg4Mbea4IxDAwOrtXXtzuIqRzJjr3p6+ZUmawiJcPk8vHi3Y3JcBcLtT0CD
	mPTE2HSDmFIJHokzdtTO8EhspltBsmnnJ+RJfAwj8BRd3CHuG+W0I6upG0uFOL6mBKVb3lBEE5m
	n4Q2R3lqJH1EZi/08GDSpAisyIaAB1ZwYhCFeYbaUgk89kcRhXjkF/OXHFw7Rvc98v44eA/57ma
	sS6ekc5ZD3ApjSdRbHA/xF1U8cAaTUAylfQ5eeWXeArwTyCIksrRMLf114O61yBdZ/iKD0bpDG6
	1sDhj9pjKEsWht+TpEanBhp2KjCWQoi0h1d1veoAnqA9RxesFuy3mPyWztEMiqtQCuO7OogqEKl
	/njY+7tLCiAQlQI0QutW5mBjGcxpzykPQWKj647w428GiWD/Hw==
X-Received: by 2002:a05:7301:428d:b0:375:c5e1:931d with SMTP id 5a478bee46e88-37686171ed4mr3330492eec.25.1794414569971;
        Wed, 11 Nov 2026 08:29:29 -0800 (PST)
Received: from AERO17.taila7786d.ts.net ([45.95.212.227])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520bf3e18sm34892599eec.16.2026.11.11.08.29.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 08:29:29 -0800 (PST)
From: Pufan Jin <cyan2254650260@gmail.com>
To: Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH v2 1/2] dt-bindings: soc: xilinx: Add ALINX AX7Z020B board
Date: Wed, 11 Nov 2026 11:29:16 -0500
Message-ID: <20261111162917.97532-2-cyan2254650260@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261111162917.97532-1-cyan2254650260@gmail.com>
References: <20261111162917.97532-1-cyan2254650260@gmail.com>
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

Link: https://www.alinx.com/
Signed-off-by: Pufan Jin <cyan2254650260@gmail.com>
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

