Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793912859;
	b=Vk2IN4vkXXX+PFR7yzKvrg4rtv4v3lEszX0kHSwnV7lUjVFZs89wtOtSi1jaT4VwvqnJ
	 xuWgSPmCkS86rvGnfxN0434xlriQ/xxO2a6WITZW1XBZ81YXqrn4MkibnrPo8tPPkIWOE
	 4NKz0ip23obAQyMZBYsbKO0xxdT1Wzt3niU7Psr4IpfAE6nWJZToVheM+vto0gEj6t8l3
	 /Du6qU0hk6sdzI6Ll70qCkyLnt4KjoDFgerBRJjFMT1KiSck/rcPQXbj43ETR6RoB+3uF
	 84MCwZVMA/pQH5AuItOIRx+X4Y7qdtXCgX9+aFjZmHeycfVaKojzQuq+GRZoBmR0XSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793912859;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=VS8ybXF4DCq5tAk5+ls9haIcLFew0SWRjbxVZMJULQI=;
	b=FQdU7xPOn32xcgu1dZExNbzQAbKyQbhWjdXWY8I33rJWZaVscbJixntyuNNiYQFyDjnQ
	 BPqWiJmwsfLsbu771uOkiyEoqpitMwB5jbMfSf0w01qNf91LdRLRAY15tGV4BP46arpWQ
	 gfVgvt9hsn2X/QHBQERAwgZ0n9z5BVLSFDW+2Q4uA6G+rEDOjQxXCkwfkft8rmHSLfzw1
	 HAhc6kAYorRoLOPdja+vCYklRjBKPknv73ZWWKYAeCEGr0dlrZK2WGFVTE5Jh13aJeAId
	 qOisf1078yAuhctTNNG9atGN0XHhGMNBaEYdk5DK7Z8Rpga9i6zad5jgy1Gf+6cklXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XZy3YxFG;
	arc=none smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F5F4606D819
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 21:07:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F5F4606D819
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XZy3YxFG
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b570ff3dfdso1888668a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 13:07:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793912858; x=1794517658; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VS8ybXF4DCq5tAk5+ls9haIcLFew0SWRjbxVZMJULQI=;
        b=XZy3YxFG+3cGG+T5kBozOquwkPWP3VH2fwBdqQQxzxYuGgdrpjF08edZqheGfhnGuh
         0fFYkCy/qhZ2Z8DicM7RnnBsCqCA0jaowux1UT/y13rrnImGvwrPcGQIwcL7MrNJUBPB
         Vo+dszNzN+Rfm++Al6+X41HGi2c5xpVymDnhJwyIH4RN9UpPWpTU4Hdl3ohDcsfSJtZb
         ZmGeJPnAx8UZ8xXnw4m5kfjHTN6++SVufTEARK4MGGnlffuE60tDYzNY/KXDzasUM5vC
         /uFiuLLJEYafCuP5bjmBsApAB5G0LviZ16hG0Foyov66PSiBU9Kcy+GoEm7E+QyI2Tvw
         /dpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793912858; x=1794517658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VS8ybXF4DCq5tAk5+ls9haIcLFew0SWRjbxVZMJULQI=;
        b=DrkgAj4FaYBCfETCXUf0Jxpebm/sWF3LEDeGRlWtbDCunM3lpeV3Ql355phSPnozXm
         06otvOFKNzJfS2lVjahuBhJS98EHEfqEbKFLLUT5PN8MA0nQekmSA0GDOQR01IpB3NWs
         yPp1SU82fMgFYcrQSWM2TLgwGEe4Ta06TeXJuNiNw7rhXQu/9g4VTPGGXmBzY92jBP6/
         fgk/swID5aGcrOKdQ22W2W51YcoRLxdZDm0kB+4fcGcnSldgg17PnG7WJr8NXEe73FA4
         7UGW6rIJW6CPxLVRIatvoiDdNNkf/FzjnrdmakSnGZNL6IR5QKZwZJu2uDXcwnSSW+iu
         9gSg==
X-Forwarded-Encrypted: i=1; AKwUvByTp2XvgkYd04J1PvZXDp/9HacCkm2H8cjWRCElaKJynKF7LoczJ+q0Jflq7jNxbuMVCrxbV7T647wUiGA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9s88TStbx/c2yXw8fYpH9E2gbvUMme0mZYeJgbZ6OvMBe3Koex
	+XVHixA/V3vwMLjNBmC8zkpsB8MJgz4k4VxXjDiy4EmuiOCJ/2jiAfYGe3Tx2pOG1lxu1TEh
X-Gm-Gg: AYBFou26scyrB9q2wc+Gl3j8oB140YPQko3VLl28uvSYWktsobze5JuRd+0fpta66Bb
	DoTMPQYsM4M8UXEJbhVn2NWHDbOWMLERxVYrObu7BRbHdHJ85Sc/duEcDIMIOFOY2W181kEINAo
	uZiYsEzK5rmDFnow94aFqJsdeUMiCzCc9xksI4GDVsMdaTGvBdyVHxbuQ+eQHlv//c5aqpejGFF
	Yub04tn6HZYUZ6EBzdptCXiXuv2oPMYhHig/KVwI+55c+isjnD/8wBqodLGk196eKs58a9MoQ3m
	SR98iW+M/0rHP1r2z7XgO7//1xrKBUjMA6Rkb5R8lps+Q3owS9RjZNMfpp96p7y8V2bSJVJBJRy
	Fp8d0g5WIGenLj/QLHH2ABOrme5mjk3UZVOFKxepIrs3+T5JpgpIWcqTnw3EULJQKCbDg3YHCDM
	uidzkzpZ6v6yum44sGpsxzn4g77ExbJC4ymhIX7/Tp+N3XPusdFvGxq89OCWhSFYR57doeJ8y+S
	F2q01g5xB28EHQnQpaHbiysjQmRPk5LihOSEvwdaoy48pkKMG0YPU0WrpViBxtxeA/oNMKZTa9/
	evVf+eSpIgHCegO2DzPLgoBp0BUntt61wu2NpdnxDlvKYdNXcw==
X-Received: by 2002:a05:6402:13d2:b0:6b5:63b7:5738 with SMTP id 4fb4d7f45d1cf-6b5977ddcf6mr294137a12.10.1793912857834;
        Thu, 05 Nov 2026 13:07:37 -0800 (PST)
Received: from letov ([62.41.24.155])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b55ac6d032sm1966949a12.25.2026.11.05.13.07.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 13:07:37 -0800 (PST)
From: Alexander Letuchiy <asalde.le1@gmail.com>
To: devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	Alexander Letuchiy <asalde.le1@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: [PATCH 2/5] dt-bindings: serial: mediatek,uart: Add compatible for MT6895
Date: Fri,  6 Nov 2026 00:06:00 +0300
Message-ID: <20261105210622.523747-3-asalde.le1@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261105210622.523747-1-asalde.le1@gmail.com>
References: <20261105210622.523747-1-asalde.le1@gmail.com>
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

Add a compatible string for the UART of the MediaTek MT6895 (Dimensity
8100) SoC. It works with the existing driver through the
mediatek,mt6577-uart fallback.

Signed-off-by: Alexander Letuchiy <asalde.le1@gmail.com>
---
 Documentation/devicetree/bindings/serial/mediatek,uart.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/mediatek,uart.yaml b/Documentation/devicetree/bindings/serial/mediatek,uart.yaml
index 5bd8a8853ae0..a3969cfdea7e 100644
--- a/Documentation/devicetree/bindings/serial/mediatek,uart.yaml
+++ b/Documentation/devicetree/bindings/serial/mediatek,uart.yaml
@@ -35,6 +35,7 @@ properties:
               - mediatek,mt6795-uart
               - mediatek,mt6797-uart
               - mediatek,mt6893-uart
+              - mediatek,mt6895-uart
               - mediatek,mt7622-uart
               - mediatek,mt7623-uart
               - mediatek,mt7629-uart
-- 
2.56.0

