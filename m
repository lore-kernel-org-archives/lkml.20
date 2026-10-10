Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A29340D59C
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 10:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791629956; cv=none; b=rP79hMHrop+uZcNklWLklt5rxRHJbu2cbpvzXHMHkcta3K50QUiuxGXznYFWvtD3AkW/Kmi7ktnYwQ6UuEVsMZWsNUoPvmtf4m6l6Xj9NHrwK1C06ycB+mpq+NHgF+GsHEQuKyNf2B40Ybu1s0w1Wv3bgsSYBL9/s8QqFR0JrX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791629956; c=relaxed/simple;
	bh=8rU4lcGem9r8npg9voyJwgRjQfcdPrmgPfj8qzzKnnc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=azkp3GfkNRRVs8b7CeVTr12S+bfL2YnLBkREiESQmreo/m9vdjj0EPMfNC84hyV9pininfL26yeRnGlGnyOMyGzX83T+Y/G754s7+3vg0CBnVcrbuqNGi/pwqnU8GiQrz7b+y48gGWxKm3Qs+0zjOSxTorJi5ELIUZH2YV3piDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48b9d8055dfso423608f8f.3
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 03:59:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791629952; x=1792234752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pdKVlCj4REX0NWkQYtOCVGuCUyIjtnl9DbGH17gD2u8=;
        b=GDxv8yecrAdYBQNYfyfuQIWVTdBukFmh1Rkw72/XtfVaCDOfXtinZQ7XEp7ttpgGUZ
         5gG8YZzavzYGAHHFLutoIpxKakGawbNxMRK9PCZB3Ye+9QLYWUiLC0LCyrBihRLM5LO8
         kGa0fewxD1NhNJytO6vV27OJcCmH7wrF9CU0faNrnnCP1CTJ79OOBB9tiSiTpY4Lkegy
         9/k82ouDTXNcdkVvIUI+UozRmz23/u2rnEzlKvcEof63Pd4CLtdy2CedNFGI3DWRs7AE
         MHRfK0x0VA4dL0ZiISmRK07PzgulnFWUpV4E2EomE0LrQ3xeXOq+7/RXAFBlDukwVMNK
         n8hA==
X-Forwarded-Encrypted: i=1; AKwUvBx5TykRHi8ta5mrD7RlKvYNkXz+tkgej4oBZkb0fTv62WL29Q67g69ZS3cjkSMan3hitq207cE5lkLzUyk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKiu1mOE4lyvk4IT5PJ3qAi3SlSqu3x8WAfW9ZaTLzIe00aTGHY
	m8Dt+yHM6NwFDpeUzQo+ESvVALue/es5Y5nmyEufqXLlrkvCZjH+sU/4
X-Gm-Gg: AYBFou3nDac63I6QgBM2yyR+3k/VcrXQCc4OyeK8f6VOmTatv4SCC0uQXMifG0xrbVj
	RS9xJlkpAu1qnQTc0Kltj9b4fmN+pPvbLsLV5PoSC7eyUJ4FKW3Dr375k7q9lAQLc/XZlMnIDdX
	z2yzAeMu39WoA7Nu2wiHn8gdjvMC+jUF9qw+EMW9T9VSHzTiBqkj35J4sOMSJ9/l6AwkghDoYys
	wwaYHXCFXcpsupB533v0TFGTytLgWwDY6NFaj5v4qTum3UHYwOap03K0XThizpWC0pDnJAoOiOw
	7g2HzuvzJeH3n1KIpEJK/3kHcGt8JCwY3SlSDQCH72Oc4PdNl9xKyvKjuAFPCcCVwskaqTqOZZp
	sBpw3HsXqXLvJ4HAQXmlzWtpGChxqKWaAtRKkhwR/DRK4XoH6UCqLZqEtDWbetBF5PKQSeyfwI+
	h8TRwhGCFDQfkQg8eV/YwyeONI4VQ7TGbT6x6vPSPBypu33CmPB3BWe/4qrqr0Rn8MUrf6cDyOS
	Kiiu9vZcJB5yeAcz62WUxiAB4kl1rUjl/E=
X-Received: by 2002:a05:6000:2dc5:b0:48b:2a1:dfe3 with SMTP id ffacd0b85a97d-48dbace3b32mr6883381f8f.41.1791629952539;
        Sat, 10 Oct 2026 03:59:12 -0700 (PDT)
Received: from threads.localdomain ([84.70.176.222])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9ae17e9sm8709526f8f.57.2026.10.10.03.59.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 03:59:12 -0700 (PDT)
From: Lucas Tanure <tanure@linux.com>
To: xianwei.zhao@amlogic.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 8/8] dt-bindings: net: ethernet-controller: tabulate who adds the RGMII delays
Date: Sat, 10 Oct 2026 11:59:00 +0100
Message-ID: <20261010105900.247342-9-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261010105900.247342-1-tanure@linux.com>
References: <20261010105900.247342-1-tanure@linux.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The informative section explains in prose how phy-mode, the delay
properties in the MAC node and the mode handed to the PHY fit together,
and says itself that developers often get this wrong. A reader has to
work through several paragraphs before answering the one question they
usually have: for this phy-mode and these properties, which part adds
which delay.

Add a table that answers it at a glance, with one row for every
combination the properties allow.

Assisted-by: LLM
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 .../bindings/net/ethernet-controller.yaml      | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/ethernet-controller.yaml b/Documentation/devicetree/bindings/net/ethernet-controller.yaml
index 1bafd687dcb1..bba27a9feb61 100644
--- a/Documentation/devicetree/bindings/net/ethernet-controller.yaml
+++ b/Documentation/devicetree/bindings/net/ethernet-controller.yaml
@@ -339,6 +339,24 @@ additionalProperties: true
 # has added. Failure to remove the delay will result in a
 # non-functioning link.
 #
+# Put together, with the two properties in the MAC node, this is who
+# adds each delay:
+#
+#   phy-mode    tx-internal-delay-ps  rx-internal-delay-ps  TX delay    RX delay
+#   rgmii       -                     -                     PCB trace   PCB trace
+#   rgmii-id    -                     -                     PHY         PHY
+#   rgmii-id    present               -                     MAC         PHY
+#   rgmii-id    -                     present               PHY         MAC
+#   rgmii-id    present               present               MAC         MAC
+#   rgmii-txid  -                     -                     PHY         PCB trace
+#   rgmii-txid  present               -                     MAC         PCB trace
+#   rgmii-rxid  -                     -                     PCB trace   PHY
+#   rgmii-rxid  -                     present               PCB trace   MAC
+#
+# A property for a clock the PCB already delays is not in this table.
+# It is either the fine tuning described next, or a mistake the MAC
+# should report as a fatal error.
+#
 # Sometimes there is a need to fine tune the delays. Often the MAC or
 # PHY can perform this fine tuning. In the MAC node, the Device Tree
 # properties 'rx-internal-delay-ps' and 'tx-internal-delay-ps' should
-- 
2.56.0

