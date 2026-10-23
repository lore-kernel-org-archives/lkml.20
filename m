Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792749850;
	b=YA4o4eqz9oZhWVucRcJWye1XmArpQ1e2+ftWwrRta5T/a4oJG/i2y2mKdT0ISf+kPic/
	 8O+gwOi0T52X504L4a9gY0QNHg7G1EVDJRTnrWXQgYGWfI+RNNz7mQiUn/Dg4SrExNr/P
	 WD/0JmmiPi1tEMiO0BzSK+3SqFH62pPSY9UIlJLk16L12R9dKQr35lsRX2TfSpUGa8y4I
	 kDAsCRUygKJl5qbnKrScLnqiBXXIvUADbnJuLA3bWZWB6TE0FibpUMl03OFaVenNwcWHD
	 GfpH4Iy7Xg8dve0BhUOpBEEzK2vRozLSDNnenjxu7ZIZ4ZPyyRnK/avdiEYgD/jExaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792749850;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=cTsNKU2kYOf2rxmtGG/9JRKLpirEPzdL4P8zLLZqK4o=;
	b=bwJYtbb9uIhTXmQayiLh6YHitR5mV4Oo/lAOukZ18/32xrXDAViZZtD2AmP3Iwa+Fopf
	 xFV23803ydfv72wzeEitzL34i4EAgLSqb++UFzm3kq13L8oWrj/oGAyB64xDahirSSu+O
	 qQ52pFdTNUFCDIGDVWwSztPv4VJDrxGmx6oennTVPTcxTf3i/HKTG/CH4ONJN+5ZmHOf4
	 C6bsl/ujGYvtd0OIvgsWzFvpfEhYpjZ9dDCHpah85hdu0WgmzLBMKw9ywXccZXiWJqJgs
	 uY0GUq7mK2nO/VxmXM/52cFAz16Z2hU85lQ0V8nZZnR8v291cwBoDd+3nhBdaHXf59Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=S2CaE4kk;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ACFB606A33F
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:04:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5ACFB606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=S2CaE4kk
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a1d75f2f11so4046005e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 03:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1792749849; x=1793354649; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cTsNKU2kYOf2rxmtGG/9JRKLpirEPzdL4P8zLLZqK4o=;
        b=S2CaE4kk3jH9Uyh64w6TN6cAvNVq8cP3cD86Qgw3Wvp7NLqwcjeXlsrNpdEthrK9LP
         cwMUkpnwqOJ7XtuW5UskVPPAqZC7ul2fhA7u1hfxzqROmCoDYOCe6T7L8tkQ9A3+Hp19
         ILFlwXibu5I81PDs3tQUCGJuudBc3w7z8lXYHUOpeIpMazDDPk7hwkIDrAHSrDXB7Cj1
         paXDGApq7Ya3IAz4S+nZeu0wYqtzIdMML4Kb9yWksm/qYKPKpk0aFwh15hhDfR21Z9YJ
         Jjq2sWPovpOgvLxYJBsQXmvBGTmwHaTMrWgURM12d/NI2TjW49OPv205Yx4lkAliOw29
         pyCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792749849; x=1793354649;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cTsNKU2kYOf2rxmtGG/9JRKLpirEPzdL4P8zLLZqK4o=;
        b=NG84htZFILy0BlvMBFBgaVCGtb22i52BTcecACYccpAHaptVkluE762T10l1rSRc9a
         Am5gG/luSinLIgZZ0YxlIIivxMuFz/AL1yRRSMA/xg022wfkv+L3fwO2zaNo26P74nIt
         O9VU+aTTYbMpphj++vnDGZT80nSKEfL8ySJgfq1ofoVNQOmeftGJS3vUXOwESCF00dRP
         dEzZZZmvj0lbt7O8n7KPN1S4Mz+apqlHBGJoyavVqWLMVyDRy9fEfQQ42PmFwdd6drdC
         3BFA0b/ZXUAjPCDFSz0AWX4AptPJXe5ClSG+0Mxf8VHZ2yURErI9cCpNohJu3qYgJ53C
         QBGQ==
X-Forwarded-Encrypted: i=1; AKwUvBwXYuBwXt+dGOXyVFzUjr/JZGOaWrrSp1Dq51yKpfEiIG84nx0uOj5wusSpEcESkD/oiimr4O6IMYdcX2I=@vger.kernel.org
X-Gm-Message-State: AFq9FYKHK06XX43d5XTniXRqf5DxdO53vvUMOqRuo6HJfWN9IbXV1IHs
	MfwAXmL65YSBaa1WNDyL/ALzUawEODxgIlh0hlnnoxj/NfN3Ny1KHUwrzlT/OAnzfpU=
X-Gm-Gg: AYBFou2st91DcSH5eUaKEj54m5ztWjz54/bYcSD/EmyWFoGFFC2+tu6WroYyr40/aid
	/1wQDtEAj7YRNvuzDjyWvoWqkLbHKa0rbJ5bwFSihmjV/ercxTSFdjinA+3/VLlyj+oDiu+yOH+
	o9qLcurHjQyrQDRFNIGHU7c4wLYNeEGZ3G+d27jhf6m9GMpSbJwzzFW6PxCmRJE+WvvjJBP9v4A
	kZ42WV+gT+R137wUbBmhXOSB8EU0FAoz94N16PwXyPGeUs6m5xAutbsTBgERVClQQuMQNarotSg
	LNt8QFeDBQV2OJPEf38Fp9zuSVRZ752sCf4+CZ1HsYLmu7ffa8YKu9GM55MwJzMf0tFvCjxMR+X
	5+bZhDjpd/CB1es7katSjdkfOiVIZ5cFlWYqZW+KHGc0l5DgVqB8iS07tryO8dOyLO0u4TDoWiY
	glWe08iA4Tl+D3/ZPdVQqE+AkuAbamJLCFgJuLMhQgvxsjXUcyIvOv24ul/vaP3Yf9e0EFOfu+C
	BKcEgbNhwJMbCGG0xbp/X+jnQiuM+A78Lsne3wNHVRldLn0bT27QEnYEmQSRzImKvYUzB0VnQUe
	OlSeE6j/iGxKYG7Xgm2WdRLjC2RyGG7Cpg==
X-Received: by 2002:a05:600c:4ecc:b0:49f:e701:51c8 with SMTP id 5b1f17b1804b1-4a211c917e3mr26963135e9.9.1792749847336;
        Fri, 23 Oct 2026 03:04:07 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:9c3:9990:6877:44a0:5297:9502])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a21045df9dsm75761435e9.8.2026.10.23.03.04.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 23 Oct 2026 03:04:07 -0700 (PDT)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Lee Jones <lee@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>
Cc: Olivier Louvignes <olivier@mgcrea.io>,
	Sebastian Reichel <sre@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/7] dt-bindings: power: supply: axp20x-usb-power: Add the AXP2101
Date: Fri, 23 Oct 2026 12:03:58 +0200
Message-ID: <20261023100401.67592-5-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261023100401.67592-1-olivier@mgcrea.io>
References: <20261023100401.67592-1-olivier@mgcrea.io>
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

The AXP2101's USB power supply reports whether VBUS is present and the
input current limit, like the AXP717's; its registers differ, so it gets
its own compatible.

Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
---
 .../bindings/power/supply/x-powers,axp20x-usb-power-supply.yaml  | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/power/supply/x-powers,axp20x-usb-power-supply.yaml b/Documentation/devicetree/bindings/power/supply/x-powers,axp20x-usb-power-supply.yaml
index 2ec036405ae4..1c582aa5e1d0 100644
--- a/Documentation/devicetree/bindings/power/supply/x-powers,axp20x-usb-power-supply.yaml
+++ b/Documentation/devicetree/bindings/power/supply/x-powers,axp20x-usb-power-supply.yaml
@@ -25,6 +25,7 @@ properties:
           - x-powers,axp223-usb-power-supply
           - x-powers,axp717-usb-power-supply
           - x-powers,axp813-usb-power-supply
+          - x-powers,axp2101-usb-power-supply
       - items:
           - const: x-powers,axp803-usb-power-supply
           - const: x-powers,axp813-usb-power-supply
-- 
2.39.5

