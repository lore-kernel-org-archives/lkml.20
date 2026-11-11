Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794403907;
	b=4h/WTVubU/f8FgmxEXqIRioxtKeI6vy+UJ3bjOYIiEIfyWRpYfW9D2qLZfAop/FZL7pn
	 y/PL0gWFm6SGxlYm4i8V5JVWKzW3K8peT1lhkHdoOiWspaRaIee3kKmKCat4Ln704NyNh
	 klX+Ybg3oJWIvWUIzz4jrmSipG66saRd9WvV8QQcFuAMb9W13EAnKh2CQe64x0wD5/3hh
	 D7GLvqsGEfaBtlpTCy/nCjvnPZ7clZyYA2Wr1+3960XoxVolRzyT39zmJoQb312VhtHp2
	 vxc7EmHMiLDmtEBzWjz6kvB8sZJ7g8aswNepXcwzWmoC64VpIbzYBU4SB+O4ubxqe/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794403907;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=gDkCPzQ/fTCTlPmLlCXyz89P1VioVc68pLa4Q0ahyVc=;
	b=t4NMR2Z2tajB/ZeMuxzumlbvAi/aedChicDs3S/+8BTAO3jEgcd7sv9UezMYm83m4ZbN
	 2bOt1UX+0IyR72cNGoxpn8WZHOmmv7dALhEauMrvm7IRb1Am+s0rFdzW3mIHkJrow9p35
	 8B4xhmHReZMP2vZOBxXNht00yxgVSzpp3UBBb92q60ze7WsG6Yk9COVw9o0shdAT3qc4H
	 AIid07xDM5Fg9eZIhs2tVLrVH9Q4ynEkMnuVC+Jwd//w7k8jN7lQ3+EQLRmWfbQxlLrGq
	 SCMM/HQDTmZkk33ThhC3sYNrBWjtbGDrJ7Yr3vDMbxALGjTG/fOItnogaTRK8BgG4og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=bytesatwork.ch;
	spf=pass smtp.mailfrom=bytesatwork.ch;
	dkim=pass header.d=bytesatwork-ch.20260707.gappssmtp.com header.i=@bytesatwork-ch.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=iUcyu9Sc;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79574606A8B5
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:31:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79574606A8B5
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bytesatwork.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytesatwork.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytesatwork-ch.20260707.gappssmtp.com header.i=@bytesatwork-ch.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=iUcyu9Sc
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-492f0a1b685so2173181f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 05:31:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytesatwork-ch.20260707.gappssmtp.com; s=20260707; t=1794403906; x=1795008706; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gDkCPzQ/fTCTlPmLlCXyz89P1VioVc68pLa4Q0ahyVc=;
        b=iUcyu9Sck45Kxmq/0s8TOCF6HLyN6AnOmFf45/RJxUDqf7Rl3sRYUl2duyVuZbJ15H
         w4AtaKkfo7IJfun7IYoOL9NadnZYVoTgLLqZK950a6ReRIiNugWsUJhf5c6pUciZni8x
         prqt34UB475UCSb8O3Ulbif1JD/93qWxbRf/bo2yrFX5yHPpILV+V6zwxRE+6LQgDJcC
         09dpq7oCPrPbS8F4LVeEl0yoTp/yEKT7bKDqe24kPURKYs+52jA9K5DqFNfSOtVBtnMG
         a5egcQIUSBciYkqtg4mnYkmqnMeNMy4rMht2cOBfiAED8hRrJvbNmuPHrAXp22QV8jkj
         /Uqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794403906; x=1795008706;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gDkCPzQ/fTCTlPmLlCXyz89P1VioVc68pLa4Q0ahyVc=;
        b=om9OMliRYpT1cnj52BSxUdCgiK7CzSWq0WEDQnMLu9CZNgsGuTUnGVHmW/EnEroyGA
         dHxq3gvu2JSbSlb8Uvym00fk/QT/rmuVwRg1rpZWPW53JberZrHv2suzdfNeoOIqMCkS
         uqNwzAB3Hd1Q2IjAXDUpZqFMJ6Fs6j98Sgnx54UkOFUNcKqVzZOiD8OweOiTJnid1BOm
         N/drk/OrGeAdw4wH02fgn8h3PdQQd+NIRt3aqLvLyoAxllzdChsh14mdDvOvsVUjCEJE
         lPDtFz3x229moZekaCsLMb+rIFrGNUio663Sj384qoQZhhN755FG1SfB8r3X4yzklVc4
         U3Zg==
X-Forwarded-Encrypted: i=1; AL+hErHzTW3Z/5Ub5EE3EejbvDjCZxQuR/uSn6IYKKty32J90W2qdEGO9uU9O3LISh4UQIIx2S3t35FhXGAlcE0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+W4k2Tgw534wy26kcyd68WnZwSM/kJLTzlRJhKk4Rx1pfUhTk2
	S1AO5bG8KkWkPyKPTXS19z9+Wcfw8qEcCcDnTQPVmKog5ynfH+V6TkSfgMw6Pnlh/Ns=
X-Gm-Gg: AYBFou1MOwHrT/F3fFVWQikhCxYtLHJm2N1/eym4/2YI30CRqupOO+O76J9S64CDvkL
	Ng/4igcVpGU7eZNZ7RSaFex7GJhCVt4VIOSEdyF06+T6nXXqhoIydMlZy72qFA7MGG9NhGiVGwx
	hJdY24dimKaZBv+hX3j23g6fELfR7IvvVAj6Tllk2FvNqenw3YFlQXTR+zK5LzMQQpVBNqlxyj/
	lHgkZUshWStaiKRAI9FY8Cll7X+W1MmZq4ehrJMkEfWH8vSvCFAxg76/is3c2JBNrrwojC7R59i
	5UD18SSXzBBaYhDAwhwt3IP46efV3v8LXX274wd03EQ0RSrFYUGsW3r+kjrVTi3LGC3XeuuBQnA
	cY5504TJfwRd+R+7STxiR88GxdtZFwzgNP1rSxhQqM07aZM0taLW2bJQoS5DusCYnm0Ehgwk3Ow
	JfoDgJC6BmYWKAoETJeNH1OEa80b2vV7IBw/WpCu8LXfSzldnsJdWadiDRBv2JOZ5hjIc8+f8YV
	3x/PVZMnpYheLI85DL0YYjuLWAiK/8po2WPeC7MUgCTXrvdWxYTjsAwY4BaTsX7aFQRH12S/e8l
	XRiu5S0j27JZsqBFDD1JYcrqzzyWEl0fOWlxvPafjUWWYeCUN/SkLQL0mtb4KNSG5qduEMBVtXi
	TVKSqd+W6Hg==
X-Received: by 2002:a05:6000:4688:b0:493:8704:ad42 with SMTP id ffacd0b85a97d-49a90b3a0d6mr1095762f8f.7.1794403905804;
        Wed, 11 Nov 2026 05:31:45 -0800 (PST)
Received: from frobdeb.bytesatwork.ch (162.40.150.83.ftth.as8758.net. [83.150.40.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498363df7a5sm11089358f8f.37.2026.11.11.05.31.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 05:31:44 -0800 (PST)
From: Frank Obergfell <frank.obergfell@bytesatwork.ch>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Michael Walle <mwalle@kernel.org>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Daniel Baluta <daniel.baluta@nxp.com>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Alexander Forsch <alexander.forsch@bytesatwork.ch>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Frank Obergfell <frank.obergfell@bytesatwork.ch>
Subject: [PATCH v3 4/5] dt-bindings: arm: fsl: Add byteENGINE i.MX93 platforms
Date: Wed, 11 Nov 2026 14:31:18 +0100
Message-ID: <20261111133119.1063210-5-frank.obergfell@bytesatwork.ch>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261111133119.1063210-1-frank.obergfell@bytesatwork.ch>
References: <20261111133119.1063210-1-frank.obergfell@bytesatwork.ch>
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

Document the vendor prefix for bytesatwork AG and add the compatible
strings for the byteENGINE i.MX93 System on Module (SoM) on the
byteDEVKIT carrier board.

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Frank Obergfell <frank.obergfell@bytesatwork.ch>
---
 Documentation/devicetree/bindings/arm/fsl.yaml         | 7 +++++++
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 2 files changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index c8290a83205b..e4be6fdb5808 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1555,6 +1555,13 @@ properties:
               - fsl,imx93-wireless-frdm   # i.MX93 and IW610G WLCSP (Wi-Fi + BLE + 802.15.4) SiP FRDM Board
           - const: fsl,imx93
 
+      - description: i.MX93 boards with bytesatwork byteENGINE and byteDEVKIT
+        items:
+          - enum:
+              - bytesatwork,bytedevkit-imx93
+          - const: bytesatwork,byteengine-imx93
+          - const: fsl,imx93
+
       - description: i.MX93 boards with Toradex Lino Modules and Verdin Adapter
         items:
           - enum:
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ac2f54adde73..95f386db1d01 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -285,6 +285,8 @@ patternProperties:
     description: B&R Industrial Automation GmbH
   "^bytedance,.*":
     description: ByteDance Ltd.
+  "^bytesatwork,.*":
+    description: bytesatwork AG
   "^calamp,.*":
     description: CalAmp Corp.
   "^calao,.*":
-- 
2.47.3

