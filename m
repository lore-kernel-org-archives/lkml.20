Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794428631;
	b=hB7NP6GqoPsAbvkHL/DFYnnP/UjsuESj81/tHB4vHe1+Xw33zhG6KFGug9wt8h87FMtQ
	 CjMd7PIEoGlOMiqH52bfFnCqBfc+NqJ4Md1GIjHVwNkOajsoCzPiiCo984XYmti86Hgc7
	 jd1PrGZlPkiU2kaGq5Rg/NN7hdg5tu75+R1TW6XKuPNSeD4+wO2Hpza9H+YwO+W36oNDz
	 CKx741jHnJGO3DoSvc2KS2KxJh8+NF3QZT63aScRY9GogMmirYznweL9jXE0Ibwd9VjCm
	 TkhvagjngNiAuXqYz4WgHDXNH5pQqnaFBwixRRkeEzR1+T5Wrp6pTAlSBPs8f1WTAOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794428631;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=/nAJpmYdLSgdSm/NN0lcHuxpyLL5jp+OxMh8y+0EDcs=;
	b=Xyhu7hAmyerSyxwSnsBSMHDupCjiAr6MITx1G6L/3uHlA16B6Qt8pLZMlOUwyZ45zoC3
	 4aR0Z5M9lCCyQg7X8KPvtLHGg/20RReOC7i6e1XSY+NHQbEqotN5bwKRE6Ozw4vgs87+O
	 Q3/bh3AhXgUAIx1TI9PABSasX0VmAMuOFW5Oo9rTMmvIUXqNzza6flyZx38bf2nZNVHNn
	 sU8PR72/nhOLk3r2DsVhwgTxl0FfbOwU8wXKK+I4/jKBGc8jZBYCD+Lebyvk5bz2J1cUZ
	 WryUyG5tRf8oGJZxytn+NTdvmAJtFwnurwa3vqtEsJCqQ9YY+uEJOdkdYNOoGrJIbnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jq7Tj9Tc;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84EF1606A330
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 20:23:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84EF1606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jq7Tj9Tc
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-492f0a1b685so2440496f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 12:23:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794428630; x=1795033430; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/nAJpmYdLSgdSm/NN0lcHuxpyLL5jp+OxMh8y+0EDcs=;
        b=jq7Tj9TcQUnWPrYvokOb+rKU4VzAuYMv9fm9krXCNvfKJBIuthFdJiY9BhF76o+la8
         q8/pQIgdA95MBvSV9IHXQrhoPEQe8mPM3WVaCrmCeXTJ3wH8iBgVPzXdZ4cTYvYGgNtf
         d8H1rzBZ7Qz3cn8t7CTiZDf9KLozplXpxlWRGjeNl2W0C1u2xXN476PcA6K9l7Vmge1+
         rzxWgVYS4hJATp8DiCRfISrjlzvN6UnOfnDllYEpBYendtCmKP3zHTeDAPIxKTgtTheN
         HNUgIXkDwZZyxxDW08vbdoYRN7HOmKj4j2gsUKjcp2M5WZCa5Gsuqt7tyJBYQw7JdKUg
         C4AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794428630; x=1795033430;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/nAJpmYdLSgdSm/NN0lcHuxpyLL5jp+OxMh8y+0EDcs=;
        b=tDAZI+mkv4N8teIN+c7G5duXasJFL+PnzNO7WM3jLXCSMNDfZhvdmn1yfwFhV1jtgR
         hXQK3hSlAn9hSkEvIvKhIYbfE77AQO1IUpe8q/QMJsIefkIdvwV+oNORFbMiIW0r+StU
         bPPRWzDwdwv5ocdJasxDTm+iFA86Vtl3nYt2IZ10b5aUyPX/XHDXNMdIFgWQIk5WS+6I
         +WOMiWnQ3M1QOz5H1ce+L0jPTp8fjjSQn9Ctc2NS1OvVKifEpzCUrjdapHsF6AMrL6A5
         jgXndIPouTB93SSVNo47Kz8QMGvxO1UaUglW+mt9JVm9ko15il5L/8VJ7iIn67kcutdD
         CBKA==
X-Forwarded-Encrypted: i=1; AL+hErErPbGF3kfQWOqTE9C6FnFXhEQqD+pmF2WDoIEhzhdy0+SmiD2ni3PA0XJqkKZTjSQPs1WUK6TFtSNz3wo=@vger.kernel.org
X-Gm-Message-State: APuU4Z86GrnOlqQu2jP5MsqmiH0zWc+NX82GjSjpPKVFs3cNclW+s35U
	5bJeXq76Bp3VVmWA/bnqnV9B7W6zXl7TE229CK6NgBOQpywJDtB/6X7M
X-Gm-Gg: AYBFou28mJYzFsC+UYGaamh17512V3miug0EnUv7tq5Ka1XfkfNPMK1EUMFJdoZs2Ol
	JufSls5cRwPR1wR/eLCTKjvAoKncGkbAOrzEGbKkcVofmyvaiKny3fDKIvpSPw7SACBx7KTXKoG
	og/w+0aGgHARUihOxxwTmxarB05yI96BEDCHn4k++8ejeNBddsdI08GO8NvYT5qWJyeseuZ1U4y
	hD6iPnuf8Bg2p3G3tLcVQOBVSU6iNjRkd6vIv7vgMBQfch/71Ucp8edvCc4v6TNLePD4fda5PJs
	1rO43hj0gVzqXCpQoruDyzihkACnTWE54ieOajM4W1m/X5j1SLi7QtmL/7vyg6fa9lGUDew6Vov
	q3SROqWlPuOhB4uPp0ZJIpGPydkpVLLmTBLJucHJ4ti8u/FnatWBHm/a9AKmLyui+NnAUFcnPFX
	qx3nI93jTpwZLJ5sQNQC4FGX3hLHq1uuWwR1ylwdTAbMz4tcYhcOTHFRlT4DJo9QYSGBRT8nTPs
	CXYZvlOIRmBF0sfPAaqKxQTPEbOeBdHM3P/e4E/a53s9eUxT/rDEijVj3kMcGnvZXrluaEm7R8k
	hdiKIL2z8OSSmgeUNUPVjUlktVFVwtlglL5gbyaGDnQiCGkpt6VMGjy4MNGuj+nHGP/fVMjbs/1
	+49NrRJxOjPlMFvoLqlRGbse7r7JgKVwvBdL6Plh39tnCjLCR/C9r9j4=
X-Received: by 2002:a05:6000:40e1:b0:48d:ed0a:e064 with SMTP id ffacd0b85a97d-499c64fd304mr6044596f8f.24.1794428629757;
        Wed, 11 Nov 2026 12:23:49 -0800 (PST)
Received: from Lord-Beerus.station ([93.146.104.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4983284c990sm12079305f8f.3.2026.11.11.12.23.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 12:23:49 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Joseph Guo <qijian.guo@nxp.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Josua Mayer <josua@solid-run.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Mehmet Fide <mehmet.fide@screeningeagle.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>
Subject: [PATCH v2 1/3] dt-bindings: arm: fsl: Add Variscite VAR-SMARC-MX8M Plus
Date: Wed, 11 Nov 2026 21:23:10 +0100
Message-ID: <b8f4c61c0171ed19c8fb60b702e4fd2e2c9d7b95.1794420001.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1794420001.git.stefano.r@variscite.com>
References: <cover.1794420001.git.stefano.r@variscite.com>
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

From: Stefano Radaelli <stefano.r@variscite.com>

Add compatible strings for the Variscite VAR-SMARC-MX8M Plus module
and its Echo development board.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - No changes.

 Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index d0126f54b387..397e1cae92d2 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1354,6 +1354,12 @@ properties:
           - const: variscite,var-dart-mx8mp # Variscite DART-MX8MP SOM
           - const: fsl,imx8mp
 
+      - description: Variscite VAR-SMARC-MX8M Plus based boards
+        items:
+          - const: variscite,var-smarc-mx8mp-echo
+          - const: variscite,var-smarc-mx8mp
+          - const: fsl,imx8mp
+
       - description: Variscite VAR-SOM-MX8M Plus based boards
         items:
           - const: variscite,var-som-mx8mp-symphony
-- 
2.47.3

