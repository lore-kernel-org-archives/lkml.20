Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.126.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794830014;
	b=Nbu9d7z3qphF5G7D/o2sf4qSVC2k8cT2e/5JSQvSMPAF6rJJYh+ukYys9pz3r9EL5kLF
	 nBldXsSFKAhtocCC8GDXNPnClY4JUcsBl4LNdoMmLzI/Oz1OaRW8/6UNWOevRuxdAU4Ak
	 HRiJH0qZfU8TFUPKHthu/m2Z5vjqIe0PkHzJP2lM/DbJPXm8RexaONdj9AVagD4p2JjrD
	 y+mrFMcS/OPqfai6GKX+82k+EIDsUHXbIdgyDnrkL1+p42J897rD1UAHxT3/LVUF23Qam
	 Rb6x5AURIukH2SO5lMqf6pBQUxdEeaRDZ6THFmXjl4vykCsdKxvr7iQ9Bff2fzUL/nQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794830014;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=5jgBXOT6I9cn3it3iPrPD4z/TeZ0uZFawFtLTc2JggU=;
	b=v2tAvsgeZMQU7sumBykOcLQNNPkhmzzgebwi6fRIZhrCowptvuYJFFveLoV4/7zG7uXB
	 SeBq1B9yXVDitspK2bUkMbsss/ErwTEGQtyvWoWsxl1S5gBH+26YoUfuqgGBic5xJg+o3
	 m5NesoDiy3PIcZ6nhnHVOVai00e+FHaaA67E3UFjeqdeaXl5RocqDhGj3G6HttJ2v4iwx
	 f7Pe+HHpolJ665fpE8x+wh0/ETC5ubZd8041zWDkl168VyIBpxsiCe+QMgX/U1UHZz8bO
	 b0iCUDL5PvZOMPBOY1tcBxwOiQpM5ovbDusJFglcSn941A4rkI9FY0aIC4wWDkraQmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=jonasjelonek.de;
	spf=pass smtp.mailfrom=jonasjelonek.de;
	dkim=pass header.d=jonasjelonek.de header.i=jonas@jonasjelonek.de header.a=rsa-sha256 header.s=s1-ionos header.b=yDWPsjXb;
	arc=none smtp.remote-ip=212.227.126.135
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B91AD606A33E
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 11:53:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B91AD606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jonasjelonek.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jonasjelonek.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=jonasjelonek.de header.i=jonas@jonasjelonek.de header.a=rsa-sha256 header.s=s1-ionos header.b=yDWPsjXb
DKIM2-Signature:  i=1; m=1; t=1794830011;
 mf=PGpvbmFzQGpvbmFzamVsb25lay5kZT4=;
 rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
 d=jonasjelonek.de;
 s=s1-ionos:rsa-sha256:StBLohjExw1EFDCLKZKSA5wlwSlg
   Tp8yZEHwHUg8Jou34jGiRSb7gyHwDBL4oGOkEV0w2xPAg/HUqOM7NXIr/YdKOQm7TZgJAZGaSQ3
   Pv8p6U1BC5tGpTnm76No7vNGuXDbOHUOXkGJryoe/ijLkooY9bAwmtUf+3NLNRluMhIuhMpSp22
   Ebi6238xleiTt0sbUjyxhrbSovOW5b9B/bJi5IdY1/R8Hp1M/2OA6rmxTemv8WzkS+4uNtJTT/+
   pYjC0IaZRwjUQdZluLZeN97L+KW4eC6IOQPn99Vn3a0bw4Sj6XSQbDG4ufc/t2J8mlIS0aIKtT+
   65Y2H3B32v8GAA==;
Message-Instance:  m=1;
 h=sha256:
   SmYllmTEuTe6K5vTL9hYYVUWvBC4tFcKNkY0FB3DrKM=:
   poi6KlIOGY9ZNz4PT/AsZvV9VS8szQc6Sk+YF5j4MqM=,
  sha512:
   DIsm+svlMaMUxmrFge5Qg1iUJJyZ/y/yMlqtP3Us4JTk1+bcY2hT0cZTCCcC83zG16ZdjaI7HyKSpVLKQlv9SQ==:
   nCxSjFTtx5/h1SEFFArqQulim4/Z5BS+iUNl4SQ0Yev1BBW/1QS/M6FHXiKyO8m4mrZnd4lDk2lIkCaDch2n1w==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jonasjelonek.de;
	s=s1-ionos; t=1794829963; x=1795434763; i=jonas@jonasjelonek.de;
	bh=5jgBXOT6I9cn3it3iPrPD4z/TeZ0uZFawFtLTc2JggU=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=yDWPsjXbeKyfVOmDefT84X+Wb8RQid9qDEnOxl8/6ACA9kCy5trEiqIge9lmwS+k
	 YCZT78SdQHLwPmebIuD3taV/pOLeaKOzIObgTbrJMxvl1X4o+4aaDDfrX05edaDCO
	 bcpYHVoRpgrUYHj53TJeRzBP7Ht85m6D/Z+OoCJl8BsgkOVRSYAH3KI/5WUjZ5/W1
	 k5IyLuDQnPbpUGGwIhNXGAAGxITRQOpJqiVk16oScK6tVWcwu0hrwdoEonR7w1vlO
	 JiSxL9L7rKTLft3OdJYnayF51ooMtKEe3ljOJ1VQkK7oDkegTXRt7xUSmlNX0MwTp
	 GWT+2HHJI0gzH2qPgw==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from client.hidden.invalid by mrelayeu.kundenserver.de (mreue011
 [213.165.67.97]) with ESMTPSA (Nemesis) id 1M4K2r-1xTCNX3DrF-005ySw; Mon, 16
 Nov 2026 12:52:42 +0100
From: Jonas Jelonek <jonas@jonasjelonek.de>
To: Oleksij Rempel <o.rempel@pengutronix.de>,
	Kory Maincent <kory.maincent@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Sander Vanheule <sander@svanheule.net>,
	Russell Senior <russell@personaltelco.net>,
	Jonas Jelonek <jonas@jonasjelonek.de>
Subject: [PATCH net-next v2 1/3] dt-bindings: net: pse-pd: realtek,pse-mcu: add VMAIN supply
Date: Mon, 16 Nov 2026 11:52:22 +0000
Message-ID: <20261116115224.1454885-2-jonas@jonasjelonek.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116115224.1454885-1-jonas@jonasjelonek.de>
References: <20261116115224.1454885-1-jonas@jonasjelonek.de>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:a/yok3CJ549/7WlG9ojllLiYyj2VOq/NSDHh2GVuH+6sRGAJ0l/
 w6VqQvh8IEBD3Pvmeo3YoYXasymimI2Si5SWZ1LVDjvArwShQ0d/UhuFEvVJCYA/n/5kZxa
 3F7jJPaQnK//JD781elQJPsmD75/IftfAnl1C7O/AoI2aaoWb6PrvCsYL6Y5F/wOa4IK0kB
 y3U/dYf9YRLsU6XcgznpA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:zTmmW7wXkoE=;EnJoXBXHceyw04/aNBLhBX60udp
 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

Describe the VMAIN supply at the MCU controller level. The rail feeds the
PoE subsystem as a whole rather than an individual PI. Its regulator power
budget defines the aggregate limit programmed into the MCU.

Require a finite regulator power budget dedicated to this MCU, representin=
g
the PoE power allocation of the system. The rail is available independentl=
y
of the host driver, which uses the supply reference for budget accounting.

Signed-off-by: Jonas Jelonek <jonas@jonasjelonek.de>
Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
=2D--
 .../bindings/net/pse-pd/realtek,pse-mcu-gen1.yaml        | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/pse-pd/realtek,pse-mcu-=
gen1.yaml b/Documentation/devicetree/bindings/net/pse-pd/realtek,pse-mcu-g=
en1.yaml
index 526f8525bb4d..6acb5fb641c1 100644
=2D-- a/Documentation/devicetree/bindings/net/pse-pd/realtek,pse-mcu-gen1.=
yaml
+++ b/Documentation/devicetree/bindings/net/pse-pd/realtek,pse-mcu-gen1.ya=
ml
@@ -92,6 +92,15 @@ properties:
       asserted.
     maxItems: 1
=20
+  vmain-supply:
+    description:
+      Regulator representing the PoE power allocation of the 44-57V VMAIN
+      supply. This MCU must be its only power-budget consumer. Its unclai=
med
+      power budget is used to configure the MCU global PoE power budget. =
The
+      regulator must define a finite regulator-power-budget-milliwatt val=
ue.
+      The supply is available independently of the host driver and is use=
d
+      for power-budget accounting only.
+
 required:
   - compatible
=20
=2D-=20
2.53.0

