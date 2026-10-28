Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793202860;
	b=ZE59MnoouAaJo5RJ3ZW2fWIQ/D25zW/lrcIMOVp7FFKsnSWyIkIEnv64PrH4OwPEaH11
	 4AqOdMnJJjYPbldsVOHoPwojf6kcLe0tg/WmUUixu9owWoF9wWCUghGNzmlALRO+Gn4Pb
	 KlbE0h5Q71aBCHG2+UpVsCPDIcCY8i6VRlz9+GmUPECGOTKAcZSJVpHZaD0ue3LZWDka0
	 2Qp3ktaKGZfnRohxyftusTUSOrRsPx8aFXgObGsCB8cSFrM0fn/btRQXzhMEQ9stRKWoR
	 3/7O4lj/L9tv+ky9SfmOliqvhoPvWVTm3qmzQbxpGrFeefn2TeVL4sGWMthf5A0ZdEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793202860;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=nOQQ4FV9ljkth31bB4LLMsIJDcvWTQeL1zQqaIAUkSI=;
	b=LdWJMX8Z1iW4nDw4ml1R5APTyNklOCaZh6MNT/FKMitlPxMwqybRUnUV5H1IY7vE0iCu
	 E2knRTZ3yvmjFVx6QeQNWM8qZVf0nINp8vG/YmphgRiQc3Pv5kneEGWXw6ndU3I+ThBWt
	 kJzZgCLo/ovHDdRcod0A6RZrT18RlIwxQ/okPMkFxPLFIiKOUMeLo/dPkwb42+dPf21Xn
	 rG1lZWf92MgVsh3A5jog7jkKAePv2O+0FTeRvWQYD7NH9Aq5sCKgO95uSYT8it0znw1c0
	 wkbqWMWAoi7lvtlKRO8XLeNI4044eFvgeDHXv5iOkSHwkoPJwJbj0Z07ZaBmsQ/ljKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=q4ZcMaxW;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69F16606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:54:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69F16606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=q4ZcMaxW
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a210470b49so9153735e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793202854; x=1793807654; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nOQQ4FV9ljkth31bB4LLMsIJDcvWTQeL1zQqaIAUkSI=;
        b=q4ZcMaxWzdLtkA3zzlJS/tOaVgjyxV3N+LUDCU+2Yf0uTfBtM08gd5FHOmFJ6KPCbp
         EuxYd9avWQqzpQjWqNf31QPqzF3f8BKWkCZMlIDAPhvQwmU/1mggUdG/2uCvudRhghE1
         XR/2kNDcCVmFpPSK1sXqCgQ+kY6trEB3/6EoGB+rNCklMfhHjz+BALtjiBy8ZIV1tFhI
         O8u/yQ0auX/cNS97ZqHy1/hcnNUjydDycPgqNGbv+cgBzm026VxFNfN2UjfN2/iYIF3t
         ymLnDUgVF4OayaK/bxTwTSIVDMBdy5Nt3q/sFxeJtw2Izdgv8gXKi0/mIZNvS9ATphZC
         HJmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793202854; x=1793807654;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nOQQ4FV9ljkth31bB4LLMsIJDcvWTQeL1zQqaIAUkSI=;
        b=KpB7kwFjZBsypXC/YQkl+j10+CKqyIsuOrsbonYyTCf/GdR//o0jMy8yzvexI7gMBx
         /pfPPWwLLMkFX0d68HHrGf4KtxVVHlL1In8dfXwhy9H0GdKkxXsu65+jSiIGWLpYm6se
         gdTmR5m/g4Dm2jmX7PNP476ldu2RCBsySSMifOdz6GJA40o9D/6gpTvyQgzU+I2cSth7
         AY22EPHuTthHilBwXBaZWeg51+VFcfgpQqCUHZFZXZ+PYDhNbp2FeXktJjQTtggdrXk3
         YmgYDMum0S6JJ3pWTZyiy7/ZWsOno3U2vZFoqAlvAg4tDEqKaQCzuogtGtg2moM8/NJE
         1yJQ==
X-Forwarded-Encrypted: i=1; AKwUvBzm1ugACWFDUczrLJWkGv2dopWnvEePa+PlvPXb55WohAXdA0Kn08KQVxBg5DBQo4FsYoM6j5jJqfNrXc4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJalaZ7QDonCpgsZMyzPpSM3wyreGuD4+zZKPUIeatr9Fz7ZuM3
	6QjgiCjT/QjX81JfZaOoEuNds+Z6mrSXZOzg6oOt3mB/b/8wA+nGs2g/bEydc2LZdtc=
X-Gm-Gg: AYBFou2+3sXxm0SW0G6qxq4CQ83Z7MiezR36CTeSXP9tw2h6q/YEjBL24Ot2f/7ULKn
	s6ewj/5TYo3S8TvtCCfu2sTMxTWkWqbcBSfB+ZWZVKjoBOxGoWeHV+zkpmf9e1siH6zXXM5PUcD
	otzSCmATFrFhELUKCKZz5Z+ovXOs8NwhS4u13BJzPZP6xlImhcz8WpxonVVt4QTHWgs7vSiDUVa
	KLGabdAB85FcbRMMsKz2EwyqPV2Sq+3jYco12YRUqguNExQJ7qmFinTqfJBp8m/jXzx72C8FSsy
	pD/zb+WqHczW2WjGNU+qyxfNSyHmabphGtNFFLuOCJUsPiaE1o4ED8fkudnQHSY0OCwrlNK5MyB
	qEbq9g+hIS2QCR1GHMI4WRf5S4VnjEInsnW3SO/2Xc6N4xlz9usaLUXgmdTX7Svk3iNVn8rkCjw
	dwpSJgdbHLeJH7AMczZgEH7uCLqDj4e8OyQn6tJnSnHOVebIRUfwgoSRUOu+ox+C/UmmJ7mgUoO
	Oq9XAMZBRFd1/nHqSTNuhmZJ7B6FODB0/D0bMTXeFLTpTRRA1NazELngFBTXAsUQUIgdNuKGi/o
	pKZmpslWrH88W9FGPM58QJ5PHrYUSOb9qxlzgPk7fRZh6QAcy/1Y62DQyjXDjq6bD+cj6rx3D/f
	cFy6zbzzuzM5k6b22Tph+CmNJRA==
X-Received: by 2002:a05:600c:b99:b0:4a1:a45a:88f with SMTP id 5b1f17b1804b1-4a966c4113amr58228835e9.20.1793202853801;
        Wed, 28 Oct 2026 08:54:13 -0700 (PDT)
Received: from z13-ek5.local ([151.40.161.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7f3229dbsm1468515e9.1.2026.10.28.08.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:54:13 -0700 (PDT)
From: Ettore Chimenti <ettore.chimenti@linaro.org>
Date: Wed, 28 Oct 2026 16:53:52 +0100
Subject: [PATCH v2 4/4] clk-816x: add sys_ck clock as sys_clkin_ck alias
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
Message-Id: <20261028-patch-ektor5-dm8168-clk-v2-4-dc6bf0fabae4@linaro.org>
References: <20261028-patch-ektor5-dm8168-clk-v2-0-dc6bf0fabae4@linaro.org>
In-Reply-To: <20261028-patch-ektor5-dm8168-clk-v2-0-dc6bf0fabae4@linaro.org>
To: Tero Kristo <kristo@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Tony Lindgren <tony@atomide.com>, 
 Michael Turquette <mturquette@linaro.org>, 
 Andrew Goodbody <andrew.goodbody@linaro.org>, 
 Rouven Czerwinski <rouven.czerwinski@linaro.org>
Cc: linux-omap@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ettore Chimenti <ettore.chimenti@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793202849; l=1025;
 i=ettore.chimenti@linaro.org; s=20261014; h=from:subject:message-id;
 bh=2inYdETjS1/0iXkUB93PtZKo6J17s5dPHUL/VIsncwk=;
 b=KfKesliDrKOJaJsoOLl5wvIYXtdqzsuOVACvkkiMCyuQmRlW4wxObOxLKTb+dw4dQDl5pQ8+0
 Z4Gm9Vpl6RRCP4hfAcfJ0BGifdHJT5goKzi/vMLGlxR0ldewux+zQFt
X-Developer-Key: i=ettore.chimenti@linaro.org; a=ed25519;
 pk=wCaUblFVaqhuBTQt/hAtysafsAaEsqj/yOD9SPlz6NM=

This patch adds a new clock alias for the DM816x system, mapping
'sys_ck' to 'sys_clkin_ck'. This change is necessary because the voltage
management driver searches for 'sys_ck' in these systems and fails
without this alias. By including 'sys_ck' as an alias for
'sys_clkin_ck', we ensure compatibility with existing drivers that may
reference 'sys_ck'.

Tested-by: Andrew Goodbody <andrew.goodbody@linaro.org>
Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
---
 drivers/clk/ti/clk-816x.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/ti/clk-816x.c b/drivers/clk/ti/clk-816x.c
index 3b8e483aec92..fe6f66fc5a05 100644
--- a/drivers/clk/ti/clk-816x.c
+++ b/drivers/clk/ti/clk-816x.c
@@ -57,6 +57,7 @@ static struct ti_dt_clk dm816x_clks[] = {
 	DT_CLK(NULL, "timer_sys_ck", "sys_clkin_ck"),
 	DT_CLK(NULL, "timer_32k_ck", "sysclk18_ck"),
 	DT_CLK(NULL, "timer_ext_ck", "tclkin_ck"),
+	DT_CLK(NULL, "sys_ck", "sys_clkin_ck"),
 	{ .node_name = NULL },
 };
 

-- 
2.56.0

