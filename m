Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.128
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794421206;
	b=UyHXudPumHpcToYX2Ck870PQim+7MuBZJzgDVG9/bY6J0pVQIkeS0HTtm2yo0ah7tB11
	 SHZr4R6lu3Spe0gbtYYuAUOtrMnn1dkFOx5G77igcWZ178YJ5VOci3i+nWIGuLMxwJOhB
	 azDk+rnsOAVqpMTaGLZsIWfLd+7E7wdNx/ddth2QEyTA+ESGp5WiJRorWTF041axNH+xF
	 QA76kSs11ANZxQ8DKiBewDT4bIr+Fh52X/p0xiGO7T+PtOoNPAiRY96prMsaf+LtP8Lix
	 ScuxG2WpXmXVCGdcfegxhlPPfF8wzM+NFWQN9fcxn0aT9yeyuEtdiCAYNSz2Un95KJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794421206;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=4ATWOnBJ9RFdbmFDw97qO4eCVawI+9yor++pN+g5ZH4=;
	b=qJsWJGyfnVI9xms6Z4fZX5mPEwBy1ORJEO9t4DpN4sESpvnzhQX3NXHkinEFUrUETdMu
	 IaCaPbFQi6K+dYib/a0QTxwJpeTtazFXSE4LLG991j++e1qz5xlBvO8yyOudb+zdIT704
	 uPoDkwFQcAaUUZuV9CtivYEuM002zAx6N0OewnUsTW34+AgQnTZ1ZQlRj7lGNWvmTUmAn
	 sOVzEJnW/cQUA4gVJhOuJe7q528Zf48Mm/wnuHmvMP2b7RGwmMzyLcp/RM+nVSCxffXa5
	 2IswbRRDTR/rY2uLb9zISKm+WF8o6VOM1t2qQQ179ZfH6XTyDUWPmf7ixsdJRGnaq7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XXdF+Zbs;
	arc=none smtp.remote-ip=74.125.231.128
Received: from mail-oo2-f0.google.com (mail-oo2-f0.google.com [74.125.231.128])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38FE660A2635
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 18:20:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38FE660A2635
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XXdF+Zbs
Received: by mail-oo2-f0.google.com with SMTP id 46e09a7af769-84e8a9fae57so1751960a34.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 10:20:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794421205; x=1795026005; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4ATWOnBJ9RFdbmFDw97qO4eCVawI+9yor++pN+g5ZH4=;
        b=XXdF+ZbsCKWyrkWPbc1BswoxqLG0HiCBcf5c/i6Osr8z00x1Auak7nzuGNyhUAOkrj
         AeZvDhj4q96FkNZOrrApNl5gllZtKE4rNpaFl29rDhY7OhRFUp35l4AiGTMKadsSNPfk
         wXs8QR5baI05JWmakrfOPTsfXESGZktYFHS0f+UwyGvC9ZNR+YCqz0fRP8gFtgthKRN2
         9OxjMIbyVLpTjwPUnaAe17M2riz+b1QVG8i0HXTGnH9wSjsOZD6hwftQ2N+2PIQ+2YkL
         JaNasfw15yA91EmlEa61pIeSTxbSXFTTbhcL9Ys3i0rhsPziDoIubFxMP4s2X2/d7qHd
         wD9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794421205; x=1795026005;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4ATWOnBJ9RFdbmFDw97qO4eCVawI+9yor++pN+g5ZH4=;
        b=nhPHAvHgtxYh5tXCA3SXqDliogsN6jwiC6W8+s4SBkgE/p3iRNBGHZ9aqPFdJ5RR6a
         elOZo2Y7dlGqnmrpI/LnTmr3W/2ACpsmR/mMhGWcsNryIGlvCFapI0MdHEXLNgW4vKyi
         gsiVE1C0iLZTc+yJoBl1TGl9zP0Ta00XN6IxE+5i5N/AB3CPHwggZoibTbWflW6oP/kU
         aIu9YHHArXBiynLnjDDXitW0TmAp7dHoRxuCOi9yJkuvWIDvmRtiOrQQOBJEqrQ4RRR0
         za0xIR+n62qNemJH2fJUuX+4LYj8hlfMeRpZ+C2vA+pX+pAOJOm6E0GLePifkJE4VlDb
         6Zhg==
X-Forwarded-Encrypted: i=1; AL+hErFcploXNV23dH76jCquKpLJ0VToI+YY4O6oiw0RVIKDP+XxGnjnvj9f8Bv2z0tVKIg5crLnOmZIWrrOt7k=@vger.kernel.org
X-Gm-Message-State: APuU4Z+xb4v5X0fH0KZwngcP4tcOX9WGPPSvVUIN86JJUEvDs9LQ4hXy
	Tlbvgzd/B+q0Wz6l+plp7Up6ZOhgc8fvkzLeSOsLAQBVR/miNLmLCaDR
X-Gm-Gg: AYBFou0XoyHcQT504vK4nwg2ONbQ7B2ahY0iubG+ymlj1YRwPkD9AryCZH1ic3Qttbp
	K1EMHjpXBnub7y1qr00w/03YvzB1xrI7VZyvZlzNRbQfYCnuYLjeZKBdOfXPDl2Dy6JuMH5LUHw
	AFpBEPfJ+tYkNjxwPVgYQiQDL6dHfJtVjpqsVzqsCS9EJ/o8qw2APSWf8rU+DdqttaSzewUTaFd
	VCtKR//Ka5/H0iecXUHU7BOOkaGk0UGYj1dUfxZ05ntucW/6Z+KIl58kqV9CGEee/mZn9x5OFa2
	Vth51uiF8D6fNJuouBK+Q3U+TnhkVAAVWrhAoPNkYSSQ0SRqdIeRUZjAquJJEJw0WbGF4tgAgtT
	l0TRaMt58unZEQy7R2US2oEkoSPU8//6N8jbuqK3Zw3term+/6kJj79lTJ4I4X1gWhG4/dpC7fA
	gqzkyDxAEa8WbvB7oRmUQR7b0XA8UX437xWe3A8RGIj8eKyLkywugYHeT/uxnZQJl40QbFZCuzP
	A4O1Z4wmddkjwAloa5EXNPymPZdnArmld3VktCCz5ROdp04cCvPtY+4Gc0p25TuJLOJ0S6mBEBU
	nMAorxkpISqOQTx8Lsja3G6QqUxMRm7WHxa0jqcze186+urigcVQ1haT8LBJbiiyGSdN1BucHvs
	U5/h1kU+R5PYwMHngyFY=
X-Received: by 2002:a05:6830:2b08:b0:85f:2832:6a9e with SMTP id 46e09a7af769-860f28162dfmr3039526a34.7.1794421204976;
        Wed, 11 Nov 2026 10:20:04 -0800 (PST)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-860dcb5f847sm4824708a34.8.2026.11.11.10.20.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 10:20:04 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Wed, 11 Nov 2026 12:19:53 -0600
Subject: [PATCH 4/5] arm64: dts: mediatek: mt8173-amazon-suez: Enable the
 volume keys
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
Message-Id: <20261111-rbrue-suez-upstreaming-amazon-suez-dts-v1-4-77b47cdea702@gmail.com>
References: <20261111-rbrue-suez-upstreaming-amazon-suez-dts-v1-0-77b47cdea702@gmail.com>
In-Reply-To: <20261111-rbrue-suez-upstreaming-amazon-suez-dts-v1-0-77b47cdea702@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794421198; l=1176;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=LLpoR3iw1kaqxYPJDFxiXt3CwLjEI88IEyMOU6ecomg=;
 b=EIrYCD4qDZS8ejbMBRlTKqTEnwo/3Ulc5Kn6KPn4xB1rCIw+hZ9UrVfNDVz0yk0KNiQToEl33
 BPHHMIEBaerC5i8AxGY8qWMSsqKkkjU/ywf2pCEqkga00yBk0Ibf0c9
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=

The volume keys are keys 0 and 1 of the SoC keypad. The controller
reports a pressed key in every row of its column, so describe its whole
8 by 9 layout, which keeps each reported position inside the key map.

Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
The key map and the debounce time are the vendor kernel's.
---
 arch/arm64/boot/dts/mediatek/mt8173-amazon-suez.dts | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173-amazon-suez.dts b/arch/arm64/boot/dts/mediatek/mt8173-amazon-suez.dts
index 6fd7777eb491..7dc0d818a44d 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-amazon-suez.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8173-amazon-suez.dts
@@ -250,6 +250,17 @@ light-sensor@23 {
 	};
 };
 
+&keyboard {
+	/* Each key is reported in all eight rows of its column */
+	keypad,num-rows = <8>;
+	keypad,num-columns = <9>;
+	linux,keymap = <MATRIX_KEY(0, 0, KEY_VOLUMEUP)
+			MATRIX_KEY(0, 1, KEY_VOLUMEDOWN)>;
+	debounce-delay-ms = <32>;
+	wakeup-source;
+	status = "okay";
+};
+
 /* Consumes the VPU, which is disabled below */
 &mdp_rdma0 {
 	status = "disabled";

-- 
2.56.0

