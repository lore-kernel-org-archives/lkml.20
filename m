Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793203591;
	b=x7tu1Vr5+KmQZOrJ51lQKNAclyPt+rRyeYGpWM92mMS9+hnwJyYyxPirzNti2H2joC1U
	 rCtRxmrj3iq/Soaqmtc9ymBf/IIatJPOcvtnMkgSTwlo6sILD5iMWIreiAdJkhVhu38YX
	 0AS+sxyMxbQKBDp/JQycoE3cYqZQRNVxSGfkjFglJTbuqnGiP1jgXKtE6d0vVn5NeRd+3
	 4OA+FCon9jtBX8dareWnMfDHBLNhSJ3NyIwLTYjlYykzof8XoZIDqfrpNCle5JNnDv4em
	 gLQVsXJF6/XbMJt2S71m+drEBU2IQz9PiriC0kf7PHgmX0/B4fS9nmWLSeBoAfCPVQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793203591;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=pA88NLv/TBiOG5702LaEvC3C13NKIBA4nDe3RPxHldU=;
	b=Kko5ZOYXc0rh2BYWDL52bNMz4UK+AP/n8j0jq3ZjxwSzsDXdk3qtDkRyZeFgjvn1SMII
	 zLTi5sH86Cp3im65OhZNOIwhWyKr1yRD5qBYIHvJ5RMGXB9Qbi2jDbxtAst8Eaj+zPFxG
	 EFgLHfI0xl8R2/XOGpOZyeXMxssyL7JXX/cbTsZsKZntnJq7DqizSsuhnbmHzF0R3tJhh
	 Mg3jjTgibHuG0Xg+PMVpYAzjdIHiETU7VoDqNl+Qd8H+JL+k+2nq0R7FD7qIzRAQxLBFB
	 4XnUDl+e1QFNbHwvAciiRSYvY64KdwCyrwHSf0Zy+95fJDih1pT8f2scnDnQedWyLiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=mX2vO3FY;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B39260A261D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 16:06:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B39260A261D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=mX2vO3FY
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a35db1f202so9124405e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793203590; x=1793808390; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pA88NLv/TBiOG5702LaEvC3C13NKIBA4nDe3RPxHldU=;
        b=mX2vO3FYnHDZl/aSq8Rl1okNk3szjaAEGBAdFyXIfANi2eJ3tIOK0tRXggIUspgJmV
         DGF2iZxGghby2FdsmAp9SWkyCZgaWZmWtXdUzcimJBRO4UGioATMGetZwSFHZbQhWtuQ
         7XUrgcxi3JETJF4x64nCoR5+YQMJ2aN0FMTaAvYObBJJpLTadws9zGoihr7SODscq7b1
         LNXzxEh2RoYYwQNXNeZ9FSsursflhr8h1IKxZF1Cs7Re1P9KolYunddpyBkaPCRw9fvh
         TPkb0vPc0Z17qJdC7CiMntAUk0jinvtSb7LCDoIDqhokETAw6//mM2ESsqVXltNzCGq2
         uNew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793203590; x=1793808390;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pA88NLv/TBiOG5702LaEvC3C13NKIBA4nDe3RPxHldU=;
        b=PpeM9RwyklL+vDAOafRU7GLSb/At1JkcqzQX7AfxVjy6XuzKEl8whV2GyHztGNz+hX
         C7ujO9Z0OYzQ7gnUGIAxlFHxYHkH0yIoDOMLwHMjYaHrKa8Kt1pRfocAtYKanmUBU/dX
         schaY0C+LQY5gLAK9QAPFtSo/QCv8gH6gTWgrv+/vFZxoXAf7DBluPQ8kkY0caFgiZP1
         D7GR5OBNRxYbFl2znJoqYqAIhLwdUYJjCmxaZLhNsObFDBBAEpNclUPFfB6AxKYD+p+V
         XzLGgkCX1bQ1quBva/9XtIukxe7A7ZQFXERLvEAVW6aQha+qR9TERhOiT2qXRdRhPIqb
         aNYg==
X-Forwarded-Encrypted: i=1; AKwUvBw14DaVrbngUxbynVDTWT64jM68aF/Qt3wMNQA7nLAto1tWY1NsieUvHpw64SkPC6hEDZwIemAvEH85Buk=@vger.kernel.org
X-Gm-Message-State: AFq9FYL7EdwfF7cetCDdJUDkptdsBwUHMduhjY3Bm2QpIE2EhY4CheVI
	VjjseS+nM5jgRAUqDh0/qDkWMuVPJf34J6o7J6+FMaVGVam7lNgSYqmEWFhUHImlh0wjVxWRggM
	4Vm8tkCM42w==
X-Gm-Gg: AYBFou02r5o3V+Yvo9CbdwI9pm8bOvxqFb4pV8qIIVFZN96UB+goEuGJEUwnK5HQiyG
	828oJ38xyznoB6A6U7jgU7Z9RKhy2ry0hvjCZFjyOj7HZEldv+Bbevf0zRxblk+WiWZw75gafM2
	UNj7+EPzOzmwq6xmmcUzZhKOAIoN2S9a4KMBzifWxgw5sm3Fq7tfQcudmaddHoHboDpQOso857/
	17SRcr0bepqu3Xh1w4ZiI86uYjRiNUDp2pM3h6OCZYtlVCohvVnk7q1DtLPsKJvylM9BUydbxCT
	GejvGoCIkeAOqgPoZ+uFK8Bl/JEQvhQoApDy+zIagjE8mzHNYcbZYN52dXRs+EMGVQOX8vlqDMb
	RbYAJSpbllIZKn6SqPuX8SdQrpnWGNStglK4BkK5Kijid2Q3XFqFCFHR8EhqtSM/WPzpZAKWhBq
	V+mxUIHJzzco4U4xsGwMiAYwIWyraRI3A2NzFu/92k8qgAu5QX+tQuY4hlBn9xbq2Yh9vfiV3dv
	xaT3uLLn9iRAGRM7LgXrX7vju3fxCB7YRD4RHLnRys8TIfZF02UmFmMpBPDe2OltkEfu+sBVbwQ
	VbAkcd+yMFA+4dObu8FWazN/p5Hum4XP1IjtnXLqsZx0KqnGHj5IPqGiPuO7g++DYw/EmhIJNtm
	BBmyt63RivwyYMXoXSgpTxGWMzQ==
X-Received: by 2002:a05:600d:8496:20b0:4a1:992f:d0e7 with SMTP id 5b1f17b1804b1-4a96677324cmr41899385e9.16.1793203589613;
        Wed, 28 Oct 2026 09:06:29 -0700 (PDT)
Received: from z13-ek5.local ([151.40.161.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa81a896ecsm1625875e9.9.2026.10.28.09.06.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 09:06:29 -0700 (PDT)
From: Ettore Chimenti <ettore.chimenti@linaro.org>
Date: Wed, 28 Oct 2026 17:06:06 +0100
Subject: [PATCH v2 5/9] ARM: dts: omap: dm816x: Correct speed for sysclk5
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
Message-Id: <20261028-patch-ektor5-dm8168-dts-v2-5-4544429251e2@linaro.org>
References: <20261028-patch-ektor5-dm8168-dts-v2-0-4544429251e2@linaro.org>
In-Reply-To: <20261028-patch-ektor5-dm8168-dts-v2-0-4544429251e2@linaro.org>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Christopher Obbard <chris.obbard@oss.qualcomm.com>, 
 Andrew Goodbody <andrew.goodbody@linaro.org>, 
 Paul Walmsley <paul@pwsan.com>, Russell King <linux@armlinux.org.uk>, 
 Rouven Czerwinski <rouven.czerwinski@linaro.org>
Cc: linux-omap@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Ettore Chimenti <ettore.chimenti@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793203582; l=905;
 i=ettore.chimenti@linaro.org; s=20261014; h=from:subject:message-id;
 bh=PhDr6kpoBVqdoNYvmZIO1sO7TmGrj5fxqBZLDfq+g74=;
 b=Ve5ogxnAtZbereXXv0mgHSa0OWS6nuHnMRIs7juPg0Xxqcdyy48+rKoPrzs7fTTee5kOME2TL
 uMCbLUMJEGsDSU0zMp4yL/ovJSLbJeyb30romwpOuisL69qnsLoYj5d
X-Developer-Key: i=ettore.chimenti@linaro.org; a=ed25519;
 pk=wCaUblFVaqhuBTQt/hAtysafsAaEsqj/yOD9SPlz6NM=

From: Andrew Goodbody <andrew.goodbody@linaro.org>

The default code for setting up the clocks results in sysclk5 running at
1.6GHz whereas it is expected to run at half that ie 813MHz. Force the
divider to be /2 to achieve the 813MHz speed.

Signed-off-by: Andrew Goodbody <andrew.goodbody@linaro.org>
Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
---
 arch/arm/boot/dts/ti/omap/dm816x-clocks.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/ti/omap/dm816x-clocks.dtsi b/arch/arm/boot/dts/ti/omap/dm816x-clocks.dtsi
index 76ebc6c3c3e5..cb990773b098 100644
--- a/arch/arm/boot/dts/ti/omap/dm816x-clocks.dtsi
+++ b/arch/arm/boot/dts/ti/omap/dm816x-clocks.dtsi
@@ -144,7 +144,7 @@ sysclk5_ck: sysclk5_ck@310 {
 		#clock-cells = <0>;
 		compatible = "ti,divider-clock";
 		clocks = <&sysclk4_ck>;
-		ti,max-div = <1>;
+		ti,dividers = <2>;
 		reg = <0x0310>;
 	};
 

-- 
2.56.0

