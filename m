Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792666642;
	b=uWjh/IvorwkcQn5u/BKAf6++sa7JiRJxqJb64poc5o+w+fe8exT6klAbKvCdKDxQVlBI
	 VPSrgBHb6jtUuH7vFgwxh8skn1imyiw8KpsPYIs7wVYeL8avM/DxzY0YnX3SRb7+WxmpD
	 hU04Rup2FU+O2rPmmh9z3XRxbimszKMYbNJGdkz8iTvFsCqwhsGhAiixjLeFwZn8lQh98
	 s/LkLuqjnT9BrTAQg5q3SCoFN4sTAnjer2fUaNFpKyO3x8hUaKfozZtxMv+XPk52aeAWl
	 4/29DRMoLn9JTGMRNjZv9xrdX80fzaJ/rwEEtVu1ki5FRV94145wPGHMXi/jNQ2tNBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792666642;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Wcf9ayI+PhziZJsTA9zMEgN066P2QJYrsntK3Tijyo8=;
	b=Gk6IyANKkJ1Y5mwp9Qhw2TfddT7tINDAwI2iSSx1FXA6ubuOz2r+UgTpyPCt3bQDCTj4
	 nF2v281Ocaekje/Aa/6nrxVFT4ny5h4KY/o0R8tpd88PiNFyuhgacNEvonXVbLoHyQSk7
	 Y5AhLFWXqqVdayR8YmoZzvs61t1ETME16hXSIEYzD4ZYzRhvNF2vybOh+nUYvL39iuv+s
	 5JAKQZ5WWNrHidL7AnNmWiwCrUDx8J7ex/oV9ZmJ/bsWNApt8LAIRveGq5wQHAktUYEo6
	 XxYJ+rKDgA18dTizGqoqd919uYsEUssMTwdhRfEhKZke8lQMG5e7EsEIlyF72W7QdFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=lqmdeDom;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21E54606A31B;
	Thu, 22 Oct 2026 10:57:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21E54606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=lqmdeDom
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c30:59f6:be2b:2877:6bc4:392])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3997C1F8;
	Thu, 22 Oct 2026 12:55:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1792666501;
	bh=MuaOAuNQ6g93IMSFzI5SHLSDh/gqv8B26+XuvsAsZk0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lqmdeDomp8enHL3NQacB2IdC5oEvD9wDuAuq8gZOkComESYBawKoZ9O4fiJpE2yEW
	 USh3FA6d/0v2/i4bGteGF4Ck8Zv/Ei+uRc/A5BxlcqX7U34YSu7wf2aH1pdjARMrgm
	 XqXZi8EbFuoXJXcTBLEsiIWQMzhyU2VHJVFT7eHE=
From: Jai Luthra <jai.luthra@ideasonboard.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Jai Luthra <jai.luthra@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: media: i2c: imx678: Add IMX676 (Starvis 2)
Date: Thu, 22 Oct 2026 16:26:22 +0530
Message-ID: <20261022105623.4179467-1-jai.luthra@ideasonboard.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261019-media-starvis2-v5-0-eef935347ce9@raspberrypi.com>
References: <20261019-media-starvis2-v5-0-eef935347ce9@raspberrypi.com>
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

Sony IMX676 is another Starvis 2 sensor with similar electrical
properties as the rest of them, so add the compatible strings for it
here.

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---

Hi all,

   This 2-patch series adds support for Sony IMX676, another Starvis 2 sensor, 
   in this combined driver. I decided to send it as a reply to Dave's series 
   so it can be reviewed together.

   Dave, if you are okay with my changes, please feel free to pick these
   (and possibly squash this bindings patch in your original one) if you post 
   a v6.

   I would also be happy to post a v2 as a separate series if there are 
   significant comments :-)

Thanks,
    Jai

---
 Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml
index 027872a134f2..9644f7c54251 100644
--- a/Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml
@@ -38,6 +38,11 @@ properties:
               - sony,imx675-aamr
               - sony,imx675-aaqr
           - const: sony,imx675
+      - items:
+          - enum:
+              - sony,imx676-aamr
+              - sony,imx676-aacr
+          - const: sony,imx676
       - items:
           - enum:
               - sony,imx678-aamr
-- 
2.55.0

