Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793378157;
	b=Q0Kbtsq2K2RciriEweih5dyRl9XfdGGUAe903pPsOwZE3A3JQxYQcThwLOm/8BRbCeFN
	 aftTf3kD64xxayCek9Ht0DetEvxBS3uxo9OFxUYbXTi8vBoPptiXLcicl2yQfhpSRzWKx
	 gOo7xvRWyI9OcTZxncsdjxITDfiTmTouiPKsUyFhfEJETl+wWtSh/EHOdE8IlIRAiPGOd
	 MvL+PaQOYRl3mQRlHwJHcI23nNesUq+8gCs1jneQlkrMMJBuJZ/oalnyHowvdMTEEvPIR
	 Cdw98518CZ4VcJVk1A7ZgbhPCG15kklxGivYDSTpCVKm87A/id07f7SX9BAv1TlquQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793378157;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=23od8DmpvWDfo/E8vWkMFm8Mgr0j+i5aqW1qwqV93mE=;
	b=DVhku1gS890us7RkgXv6uXYTUvKTwScW/FcqcV2isi7f2TrinHD/RxiGTJgpxGmdzh6a
	 i0vt3qA6GDNuuVyrHRIZ2q24IDjwIuGLQmSMimeKiMZXvDp3jaXg5Oy1zWa/O7HfLkr6c
	 K7PV0bYlnk8PNt2NEcWG2HGZ/vTn5N0JMD3bxPyMUAv5DFlw2GbdhOtPuIs0CUcNv3m8I
	 /uJzwVFF9OnAlsDNcO+COCT4zkdG305ZNsh6isPqKD3UYfd7yu0enqRcrAJk8hTkhsLfm
	 l3M7HGJt5YvnRMSwo4T7L2mRdvONhASRCkN5RWDCjYjdPq4hDygWB418CRV2jZ7TMDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=CDaUhb0a;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8844A606A33A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 16:35:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8844A606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=CDaUhb0a
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso9754825e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 09:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1793378156; x=1793982956; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=23od8DmpvWDfo/E8vWkMFm8Mgr0j+i5aqW1qwqV93mE=;
        b=CDaUhb0aVpcuWHeEzW1qpAUwJdY8fd9D4yceRkrhGNb8EXPzZ+0zPB9Cx0EpM0JVsB
         vGxaN/k2ERRLlEoy9eGoF2/rjz+5uEBNFhMOuB8/q6ft66eyVpZhErpX23k2emAgxXfD
         xgccTfaudwjEcLTq/tbVBJRtxgUuONqvjOnTc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793378156; x=1793982956;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=23od8DmpvWDfo/E8vWkMFm8Mgr0j+i5aqW1qwqV93mE=;
        b=fDCL8SQQqtD29oMMj06NXp6n8rvKzljG/f1w9aN7yyWiVXgRJPdFT/R3GFIw5CW7oA
         kGWp41xn6W6pL+TMmq8ANkKW9TW4pwmIZyvjVBst9VFc/iOA6WWikepz5HVQfaWOoIGe
         Z5AatU3ePAwp32nYG+AIJ1eyeQPLu7M6copy4qAg1ioTFujE28WDFXp/xfroinNh6+XI
         2+ic0S9fwrWyAnPe5Bt7FhK3CU6rV2DDRfLrazUqU01snfUrI0wrPli2Z0aYfQUTReo+
         Okk2nCeZpVs3rG53a7Na6HAnCgz+Qe2SL6onhL6LhCRoTxjNxEM94SGNI+cO0sfqvjiM
         BiAA==
X-Gm-Message-State: AFq9FYJj/vdArBAn9bN9rQAvBC23QHkKmYeRoEfzbZuoYDRJYlC/v1XH
	TLlzo92dx6nGDHkCIbhVvLV/Xy/33IQycGwUY41AekDpKF+uSypWmGaMxsNUOUkIT8X3WWZv1xs
	xxGll
X-Gm-Gg: AYBFou3pP/4n7G0wbCRG9/w6Vf9zi3QpvHN+EeyXRznogBDazVtjUM6lbD32Nd5caNw
	pvgHOD2tzWeQ8D7ls9djSp7Lh0TLs5SHXWsh2HsdgC+llmlFWvNJ2oLs7HlZ8hKwh1H4/IRlMPv
	d82+PWDU/C+9FvvfLETE5C3YvNKa+GtOKHZNv4ZIm3cFGgt933FBnMPYKTjOyHZCcMtzgOMWTvp
	7abqWNLWyXgTwpWDjp3Piske49+vxYE/aBov7z43KP1NglKUDukVTICnYtoF49TS4lShQAlPfRo
	Uo86zbYIqp9/260wg94JEhBUH9zHLEH6Wew5pKBnhEvxv3k+vC1rxoZqobpO8lo0a/CSScyLb0z
	cJEq4xDxK+GXeBlMsv3KJ+JDaE41RXjQ6FpPkVl1Mt5PUq9UQNPRochJD9S15TR3fKu8Hgm+Iap
	bM7ua7OBY7uH03JgWoVjg+8Ado/KDOCvFDzmLyvj7XaBkwVKItpSBZCixczRXCo+7On3uVHhSMw
	jZQOVOdF0NmCWtXk3NY7PlfRzOBJwM0ikkvW1cfpG6fGZ0hH5KCatJGmdxlgdGNHrAOVPncOUhL
	dHlzkEYP+afKKiHqUbPNF3YHy6t2MUZPAmc2L6zfED6N/V95hchruIpfwq7mJ4uc9GYocHyVFQ2
	sHQPvX3H2Bi96OAhksv8Oj0sbnjjqjvtDJrkq/fUK7jhzIVFgpIL+lkYQfXsb0RHWa4YgOthiNM
	tOzwXAMDsjLHXOiAInz2esY2g2Pg==
X-Received: by 2002:a05:600c:870f:b0:4a2:1196:db0e with SMTP id 5b1f17b1804b1-4ac1899348bmr57052675e9.30.1793378155859;
        Fri, 30 Oct 2026 09:35:55 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b723fcsm4084806f8f.14.2026.10.30.09.35.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 09:35:55 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Frank Li <Frank.Li@nxp.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Joseph Guo <qijian.guo@nxp.com>,
	Josua Mayer <josua@solid-run.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Mehmet Fide <mehmet.fide@screeningeagle.com>,
	Rob Herring <robh@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Stefano Radaelli <stefano.r@variscite.com>,
	devicetree@vger.kernel.org
Subject: [PATCH 2/5] dt-bindings: arm: fsl: support Engicam i.Core MX8M Plus FE C.TOUCH 2.0 board
Date: Fri, 30 Oct 2026 17:35:41 +0100
Message-ID: <20261030163547.2682583-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261030163547.2682583-1-dario.binacchi@amarulasolutions.com>
References: <20261030163547.2682583-1-dario.binacchi@amarulasolutions.com>
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

Add devicetree bindings for Engicam i.Core MX8M Plus Fast Ethernet
C.TOUCH 2.0 board based on the Engicam i.Core MX8M Plus Fast Ethernet
SoM (System-on-Module).

Unlike the i.Core MX8M Plus SoM, the Fast Ethernet variant embeds an
RMII 10/100 Ethernet PHY, so a dedicated SoM compatible is added.

The use of an enum for a single element is justified by the future
addition of other boards based on the same SoM.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 Documentation/devicetree/bindings/arm/fsl.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index c8290a83205b..5835c25bca90 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1222,6 +1222,13 @@ properties:
           - const: engicam,icore-mx8mp             # i.MX8MP Engicam i.Core MX8M Plus SoM
           - const: fsl,imx8mp
 
+      - description: Engicam i.Core MX8M Plus Fast Ethernet SoM based boards
+        items:
+          - enum:
+              - engicam,icore-mx8mp-fe-ctouch2     # i.MX8MP Engicam i.Core MX8M Plus FE C.TOUCH 2.0 Board
+          - const: engicam,icore-mx8mp-fe          # i.MX8MP Engicam i.Core MX8M Plus FE SoM
+          - const: fsl,imx8mp
+
       - description: Ka-Ro TX8P-ML81 SoM based boards
         items:
           - enum:
-- 
2.43.0

