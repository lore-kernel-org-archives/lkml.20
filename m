Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794605479;
	b=VJaLJC5+WzYR5H6KK5I9ml2kSn+9Dpn9301o3vERMiy9PR8g4CbXkHW0pvEIgLnXwodd
	 sCM0GGhW75rIBBP2zDPNbW9WuCxMMU5lcqFF0uEPJlDxVYezejtYAM4PSEcFuA6L8D/vj
	 hFAOpnIreNAC0OMTDBC1mFPuZG0SKnbvhAxtrjpRKNvYpfSA8h/jeUrhlaWhZaVMjwH0y
	 MJBSni3T/Q1RKgARWLmqFmsMXNza2brKjXP5QD+1by8cMMz0CbJtOtqd2F2DH8k0fQDMj
	 Bc2ETR9ajCezpv0HwcQUQiHlXR+TijAEKf5kFmkZJAAVHWU10pKlYua+WnoJzRJQGrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794605479;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=lUw0nvKlEMgxXW/vhONj7EZkx2F585mM1fi84MvMFks=;
	b=v9jZoJnScxbIq+bFzc/HUXLdMx0dcbGiv4xoHX+0HSOYBt/10NKI7xpJjbIIEIArAUJc
	 JntWS7JXvzxdAph6ZHTC89qhjzPBB9O01fVoNjInte5nFT3RJQ36cL+e2B6LUGcNwvsy2
	 K62G6KsO469lr8hMkJckzg1fO6H6Qu1eufpXwlKRE/tKd2yt8ikMkSqi/8Ufv82UUXGlk
	 Y76j8QcOxxJYbu21KOj4zTsh1bkrmqMT2oTOZYqvF2evCEVsh+9pbTn7ATNyBOvzV0nxg
	 fb3dPLK2PVYNPq5sM5pSTYV4HHXcyL6H+4B4a/lc0p/brurTspSe7artf8uTyYvg0NA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Y4TkbF94;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 044A0606A8A2
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 21:31:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 044A0606A8A2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Y4TkbF94
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso1856532f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:31:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794605477; x=1795210277; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lUw0nvKlEMgxXW/vhONj7EZkx2F585mM1fi84MvMFks=;
        b=Y4TkbF94zey82nSeBb3iN2vJMq9WyyExLKzmunK3mXchFxyh5RriHVdVSamoqJlrrI
         UDV+FDsikj5NDmzScT86VduAplDOj+aXJkffRZ8YIIwDWsA87kCuLnLdMpGGE6LPcITL
         JBXgf89A/KSrKK3RjNnpUgBm8PvrZXaVvOLaI+EULN5a3dj4+kdDQ1jBT8Fw6v6NKdje
         PzqXkrDbNjMsbFTeK32YiN6NrQ4xa4yIurO648sAy/9C1Xll3V2FMFdlVTvh8WeompJ5
         OYmIUnMG4Vb7XG81qUGBwp/K4NExZaoDQK5BPOy/cJPvZtIdzufhqM6+nushwGRlsoXr
         qAEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794605477; x=1795210277;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lUw0nvKlEMgxXW/vhONj7EZkx2F585mM1fi84MvMFks=;
        b=03xRH0IAEWTWpcQ/y6/UmwVs+rw1opayEqOdZpMekLKpA8HX6q0JyceVOquADHxb2a
         2HchxmRVN2acRBAN9q/ksIE0hwfpONzLg52wJsxQmGDBqxTDKgAx0hgElwxdcTbKbTkC
         3UEo34FXt1tr3fsvl0qy2Ndc5dXch/E/DcxnrN+UygVNi1+2y8xbu4h5xHcib16lZTfL
         We5bM7lh5yK8BwahcgyBUvf2eHnCZ+FzmechQ+GfgSwMtL+2nOr4wJv8wqQydkZuBy3N
         rr+iJFYyRzD9ws3JuwCDSZQiQV+9iBBrm1V5sesJ80b+6ad0uNFJDfGoM5Z5ftDaHRSc
         gsdA==
X-Forwarded-Encrypted: i=1; AL+hErHeytxUJv5FcF2ZljkXhKhfFsZew2g2pz8M7MUDcsygu7lKtmaaZI8apG4oAre6An8jl0Yld2GS0x/5iS4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+yel/Xxu5mj0AYCQlnX+TRkQjmRbwmo77XMDTP2OL63BB7l+ye
	UDrHTtCLcJiyMFMhWOagDuOGW/fCrnNHO65Cks5oIG0XbLbcpmKVS/AlLXIwwVFh2Ro=
X-Gm-Gg: AYBFou36Lb+sBP2obQJum5Ek77IKyShxZZisOt8B5FOGunBLsSm0J2LdMaiDvm+yo4i
	jZyaFNc0vbsiz6veWVRtv3g1suQSEIfXU06dFA1rAyC2MlmI7DYEddsJituJsGTORhsOAMVsvfu
	tTnWSiYYXsIzZ7gPYuJmdv94FAefDN3nbBU/4JtieQwoXsOC3H1BOUatvbsvC2av7sMJlFaPV3t
	vFksqu+HSET+or9hCGVSynVHvLXRvH1DUgZUMrkH2Nsnyz5wRPX2edjhGkp07ma6heKbq7RPVGj
	cfyA+6mhM2R9BjmH79dwIcArNwiPXd2A6H2Teu/xd8GH536NkmKks0FXk8qviDOuBxYLndz967a
	TWBVodz5jcRzjo0Ic6fS79Xai6Tml+YRokGJwWluIX8Yq52LUdlkOi5zpnC72RRObPfQv3xgtYA
	zIJEGHqCmXOpeZWBiiW66RDIsY5+I7QWNMx5kgDofxpWZmiPgF47mUYkPIUVL110x+LTzqePDG8
	zB5lmlvgDiX5u3esMOkXn4CiHjK9lWVem/wtMcxXoMxReVRnF2ciOsC8xLN6/k67OfZ1oNXK6ph
	UHAX6btVk966cqBA1fH9yqyx6JXtiptjILu5wgKMIz56i57uRnsCH/Af8531opZJXCZOUZo596v
	c7nyTczy8cf6rreB/Gl2JK/QRhw==
X-Received: by 2002:a05:6000:4808:b0:48c:4a62:9af7 with SMTP id ffacd0b85a97d-49c712ac577mr8479439f8f.28.1794605477439;
        Fri, 13 Nov 2026 13:31:17 -0800 (PST)
Received: from z13-ek5.local ([151.40.161.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c609c8a77sm7447727f8f.49.2026.11.13.13.31.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 13:31:17 -0800 (PST)
From: Ettore Chimenti <ettore.chimenti@linaro.org>
Date: Fri, 13 Nov 2026 22:30:49 +0100
Subject: [PATCH v3 3/4] clk: ti: fapll: print clock name that fails to
 register
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
Message-Id: <20261113-patch-ektor5-dm8168-clk-v3-3-a42cd1edc5f3@linaro.org>
References: <20261113-patch-ektor5-dm8168-clk-v3-0-a42cd1edc5f3@linaro.org>
In-Reply-To: <20261113-patch-ektor5-dm8168-clk-v3-0-a42cd1edc5f3@linaro.org>
To: Tero Kristo <kristo@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Tony Lindgren <tony@atomide.com>, 
 Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Andrew Goodbody <andrew.goodbody@linaro.org>, 
 Rouven Czerwinski <rouven.czerwinski@linaro.org>
Cc: linux-omap@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Ettore Chimenti <ettore.chimenti@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794605472; l=826;
 i=ettore.chimenti@linaro.org; s=20261014; h=from:subject:message-id;
 bh=B0LneKztqvoYqUGoopWi+2un+koOSmHaVdRmdLk82Hw=;
 b=CtNUW1hP6KMI8YN0W1Cp0N+O81Trkq8lga9jGVtb6c+zVucXupTCQIA9gWYojp9PDIrrA93Ah
 wbwN7HKaXLWCGAh9JuY8MP3xsWIfx7VnD+NuvqFIhl3iD9AO4sqXcTz
X-Developer-Key: i=ettore.chimenti@linaro.org; a=ed25519;
 pk=wCaUblFVaqhuBTQt/hAtysafsAaEsqj/yOD9SPlz6NM=

From: Rouven Czerwinski <rouven.czerwinski@linaro.org>

Improve the error message when a clock fails to register by including
the clock's name and its parent's name for better debugging.

Signed-off-by: Rouven Czerwinski <rouven.czerwinski@linaro.org>
Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
---
 drivers/clk/ti/fapll.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/ti/fapll.c b/drivers/clk/ti/fapll.c
index bb9986508578..7d6a4dd4fc8c 100644
--- a/drivers/clk/ti/fapll.c
+++ b/drivers/clk/ti/fapll.c
@@ -524,7 +524,7 @@ static struct clk * __init ti_fapll_synth_setup(struct fapll_data *fd,
 
 	clk = clk_register(NULL, &synth->hw);
 	if (IS_ERR(clk)) {
-		pr_err("failed to register clock\n");
+		pr_err("failed to register clock '%s' for parent '%s'\n", name, parent);
 		goto free;
 	}
 

-- 
2.56.1

