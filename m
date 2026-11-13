Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794557800;
	b=0Em8R4XwKIo4DWu3XzGcS93FFUqsbV7NwAuQ6UFBNFXCrok/v2sM/3/S9MmqcXCmuPbV
	 TLeH84nyj8FOjb0SpALw/N9dcy1Ny3acjCmztPG7zkIOw5fuAIgdsgO6uZ43yre0x0e8D
	 D/8OOdgcTEMsKNfbV0N146FoUfP0q3A/NvYOQZV+UVBSjonwpnbCtyJY9Y8sEC6uaq5Pr
	 GgTg0HDa8bCKAJh5c7rfy6OL4Gk9DfUwpSXOzhNdWWpjai6Ey/1RPzYvVuDCcqJGNKIym
	 gJ23OR/Q/GTNgGFiWfCIST3T8SthD3Ax3i93CljdDR0n8TrCLETg7wrJklNdZUuvlww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794557800;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=gW1TFXrxe4ATUFniHdL2t1wb8zLbd3jJ3aJxWRfHEww=;
	b=kAKTXxHxG/QgZQ5/SAN7E1vszKDE54zfcXdzicPfFwUX2RMDY31sygsgAjtgBWAsbc9j
	 uXBE1Juqm1fh7vR4IPe6f+/P9Ax/nMRGTLnjaJ1rvWHRr/tw7oTS/v+dxxNg5dqfnLPfo
	 LBNRK1f0kQrpz6foKrGkaSQICatCwUA33sYJQWSSV78QV2N6KLHJUVY1GEp4/ZRZXyC6s
	 WnxOtIfjV5jFqTeDIz0XCuXevlahsrtvXsMcOT5lNLGuyS+RnaroW6RFM5Z16gbaW3KuR
	 fpeB29Hh33LHD2ZSxld+5Wga4WmVLUfOR2CKo2kx09V8mtWJVhMWAFgcbpdzcn0yhOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=OZ0TtoaH;
	arc=none smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 330BF606A33A
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:16:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 330BF606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=OZ0TtoaH
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b581b6b0e9so937322a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:16:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1794557798; x=1795162598; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gW1TFXrxe4ATUFniHdL2t1wb8zLbd3jJ3aJxWRfHEww=;
        b=OZ0TtoaHRNUCuyN+OfM7Jk1lrmCuCjwTTasUeeUsisIE93qvKbPIny/mIqEc1gBNKa
         tjBiklMLMkNAw6diqZ7UsW089xvDqnIlkgLwio6tCE3z8DlTjDJGhIZ/cU143aO5tAW8
         TlbghxxzGLxLW1js2cmshTxFzzXrLj0zcWHaXhApr+6OWYvYGZexYLpw6AuzIglPmbv+
         TFZEERW6rx65pCsn6OUNVolIE+o3CycNx7qdO2KQWwnr1AC3T52gsff61uYy9IlscfTo
         uUDDJJGbr1iDeegh2e6u2jthx/0HXMiN7vaV8GdRXqGJm3y5caEx8I0/5YCgwnYaZ7H4
         xKFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794557798; x=1795162598;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gW1TFXrxe4ATUFniHdL2t1wb8zLbd3jJ3aJxWRfHEww=;
        b=j34bEnBsObfUT7k8fKsLMPzH5YPwhaMYhab6/0HWpzBsoBKrWlGkYa1WPOXWer28Mr
         o6RbSFLpq7ScFpyXBEn0fFXFDH9LECvnAJwqmNIqh3aSKyURz3WaQOHsgSbFZZsY5bgl
         RxrvDPctbrjUYzCb0qVBzQTEHBcC2GWN23CyvnVzKzMWc6ODc7t0cr+XgY6aelBElAjP
         vsPvK1X5sv9/17ZldzZfsskVyOiopT3nF+9zJ51A/EMV6b77Rr5y104G5DjAvDpXRZa8
         L/gwlfeu8Kv1pE0Cph6lYRWvYTiwAYK6piZ7p5hzjEmeSDA3Ou7jmZUfqFrGZdHJzeYz
         f2TA==
X-Forwarded-Encrypted: i=1; AL+hErFY9sq95XOG7Bym9OB6/7k7WLjGL353isgJu03NycskvY9l15vtza13KuFOAi191N6aNCsJicsbRf9Qsm0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9BUYRYqsyo0f5/LcMFabOpTkQx3d6hpBW0RsJzasGkdtn41v2w
	usdHdNdEB2uP72cxWS/UOE2mImBz0xC0evBPvUvn1PkSwckN1aqzTFXLZZrrTzuQNAE=
X-Gm-Gg: AYBFou1bC1IeEDYK51y/g4nbCk1iYnfCKaEbjnw9sA4+xHKexpRM6tDVkn94bxSzCG1
	/rrZuvWrQsfEnquJy4OqHoXZtR1ESFYP95/bl5JywwUCsSccjvpwdS5uAJd5MkDhyL7fs3O++gs
	USqs28rq+O6ksKPLx6doaUkd0Dsw7Xe6DyliumowPqovu9r+YL//SKmf26XRDpqhp39eFW7TzWL
	5+YAMdtGlbhYTipnU8dreTTi/HNdIUmTno8WkBc/tzD4Ire9j1mEPRd7jsgWLLzKLgK4hrA2wQ0
	YG5serQWz1XRpRvAajdi0N4gHnYTt2lcgn2VRqdNim5YiKl7v0GhH0XxALnHWLqTKzfXJRSHsV5
	Oc8pUhckD51MDG0yOprMTZNPHyl5AQBDiGgSGiStWaGp8GkvvzU4ib7rubHjHXfJc+iT/ic1AMV
	rGvXLMdrjWTfSHMm8bB+jPXCKbfjrJdfhJ0QuMDJ2sz2d1QOO9V0qlYn1d9empmnkyVXSvNLmuY
	8iEjbDiaIOJcb47jnjeE78BXb2i322PFYSujmlRJLd8L/dM7czdeg+lqqnAuBE2qaS4aKYorBnw
	4wXReNiMe/U6lK4Qz6x+AwtrJuxSmb4px+2rcCCloZoEXjwXbPVFjykZJ6Eo5zDhoe1CmofYJGX
	ZgIQ3zQg=
X-Received: by 2002:a17:907:6d06:b0:c41:26b8:c49c with SMTP id a640c23a62f3a-c50963dc6aemr131877966b.10.1794557798644;
        Fri, 13 Nov 2026 00:16:38 -0800 (PST)
Received: from [172.16.240.104] (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b4214fsm65243866b.35.2026.11.13.00.16.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 00:16:38 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 13 Nov 2026 09:16:35 +0100
Subject: [PATCH 1/4] arm64: defconfig: Enable Qualcomm LCDB regulator
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
Message-Id: <20261113-lcdb-enablement-v1-1-1dc40b49ed82@fairphone.com>
References: <20261113-lcdb-enablement-v1-0-1dc40b49ed82@fairphone.com>
In-Reply-To: <20261113-lcdb-enablement-v1-0-1dc40b49ed82@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Val Packett <val@packett.cool>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794557797; l=687;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=Cb0jzf5yf7B35q4+LHh6E0ES6V+yP2TAPYPGLiJwWJY=;
 b=lLzlMM1LJlgxpG9XLQ5KkHczWQw96AMoeuDzzlMaFbyaG/5se576a7+MKM21WHa+mdbYWI9NR
 DNnaD8ufsFdAdbbFAk0sCSK/641WYpPGX+6bVv4C6lJUq8Hs3VquxKu
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Enable the Qualcomm LCDB regulator driver as module, as it's used on
some devices like the Fairphone 3 and Fairphone 4.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 898f4f1d5952..d0869b08a69e 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -910,6 +910,7 @@ CONFIG_REGULATOR_SGM3804=y
 CONFIG_REGULATOR_TPS65132=m
 CONFIG_REGULATOR_TPS65219=y
 CONFIG_REGULATOR_VCTRL=m
+CONFIG_REGULATOR_QCOM_LCDB=m
 CONFIG_RC_CORE=m
 CONFIG_RC_DECODERS=y
 CONFIG_RC_DEVICES=y

-- 
2.56.1

