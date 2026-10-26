Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793016573;
	b=dxFwXq8ABEvyEQe11TFe9w1USJ2MQyp6lkyix6rv5Iu+lxlDaC2TKzLxMOTINnObDCrI
	 efCKT2WZhvDs1DpVJjq+8vqLHzJzsINkwxIU3Dt0AzEs6Efzz7qKsTrsZaOGtSqnJO9U9
	 HHV3qrobzksuTs0cxjmnkvImLE5A9BIk/mk0l9c4CsrupczfC9H05njDsrvT9/j1XJIld
	 Plw+YEeholg0EV14MIOgNiAcEjXa3NNcMLkvg3zkQH9CS+btmGevLCjhjPP5GriNnP2A3
	 vWUk9u8VClTfC25P0ogJVHbuGyHoBAtrpWVfGCQAmGE39xIsWAJLnaVvKi3WYtIZyRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793016573;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1XPOBam7G51rl7n3GTaB7HD60REecu6em+DTE1e8j8E=;
	b=wB4112iYFcV2j8RsRMHcPpn9XIh3sGEgAU/nlTSacLqij2OMEr/3DIQIROFIiGJpf1LL
	 YXv0Gm48dWUnlqi1SKD2ildUHvUqxJmySay4siCqs2C/WzukI7gbIM+cRlIJxPs/5vBE3
	 MCd9A1nDijzP9ckAocOXxaSSIJaJMNThdWbrVBMaIsw0Iohcvb6zvaL97xHJKtirl7rWl
	 f0+dP76RXUupKSbrLqLGOd7uR3KlBBQPTHd6AKbRR7llH769VATcfOp1lEQKyPHi4CDOX
	 YZJ68NPmEZwgHhLSnQv+rAMRGazl9/GHRIYABVoRsq8gPjvWPhrCDWcbzNRwuKHbtlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IOOm4Ef4;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FBF7606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 12:09:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FBF7606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IOOm4Ef4
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a210470b49so23245315e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 05:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793016571; x=1793621371; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1XPOBam7G51rl7n3GTaB7HD60REecu6em+DTE1e8j8E=;
        b=IOOm4Ef4YDTqKiGToDXLmbxqjqQL1TIvvhk4ERP/ch8VUtWXD3OyfF8p+pG1NnZ5es
         1JHByO622WHqoByvRR3qc0KFrjoNSLhPEtS/e6kyE2qtkHRZz+YN2uKJHltG52/MjNXm
         S2Xp1R+AzbvgHiV1DFxRvyUasvOfVknS+PARmwyTg1YfamwiJqi8gNiAv8JQkVbHaD2d
         nSgxiGBhnWjdv/Fh0lRfRyOzDgRES19kECggb9GYwIDWimthSxLb/PxGfdWNh94HkxiM
         Ft3YgjyPk//uVZ32BqWrkLlgSF6k8mLAXe+x4dTxhU3cibtdeFvxARYLlkOUJFBfKfN8
         +VdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793016571; x=1793621371;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1XPOBam7G51rl7n3GTaB7HD60REecu6em+DTE1e8j8E=;
        b=nKh1hgxKfE1dLLcmmwHkOD4KThnQ3a/qh517kS6oDp9jssAmROl/E3gZUmXQS29pJQ
         /4dBg+SyaOJ6ivgNsWcV4AMgyVP9gpkc/K4VabrrvtVi+coVFQdp9L8NzqaVaSdoQzXF
         pzzpTbkNq+EmHdXz2Sh9dHLnfiG+tp+xSskA8FEy8gDwRypGKwNDqnj5cKvhBo5T8pMz
         mwaleaDFKrfkSH4tNnn+emYMKRDODJgR8NOiv4D3fJXC4T3RACV9K9v/LLomIEo8j8C1
         CJYpk/AGjTrXouNpDWITa3E5usmXMFF7Takh8XZZDQYyuxRCL19DAAkWyY4jyM0+xUQ2
         iVIQ==
X-Forwarded-Encrypted: i=1; AKwUvBwqOWZ1UxgzZS7EHlIX6GkHsK9vY09Z8+KpNjYqLe4x7m5/mBXr/ppKpzr1vZqI/b5/2H5i94qmU9UEtKk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJI27rTUJkKsrstL8Nhh39rMRGv7sGlLWR2j42zy7bmX1rfp1Fy
	2RgOqizJPC9U4/2TuM4Twz5+QICxEJD+JRg9KHtFR2Al3qXbiZeFUd5K
X-Gm-Gg: AYBFou3kAZYBjivKbF+mZw3Sq4RzBJdQesMebnemJ8gL6vkvp0Z0GpnuglFajyfApne
	b/NgBmKmDpsuz5c5W+L/f7jGQaeBu9GvxsQI7GsmhR+tB4Iw9alA2vGtLDTa74n6uNFkjs0qBvG
	KVU4Qf/BvITZ/sy27/LPpNAoEXKKkfpR5i+RG/T0NM7b46utiVrwlgiTDjScl8hWI48ONdb6ZwE
	JoZsvDg1t8MBvxphX0+Hng4hrNzvsQhvJ2VZMET0gAz/RHAo3hsme+7SQ9d3a/jLkH7Kb6t9+2z
	56B9eWmOuODu2Q0oAd5inzym26FurBoakMQJlrdcuV2DcBoHuzYuh8FnVc7tCOyRG4vISE2tPI4
	TD6gOPE9x8hiNXHpKbJ5mntUd5z51vhAO/d27Zepe44pvatjSibpwO8AtyRoniHYpLRA3g9IiJX
	p+z5pGOZe69CWT2URPZVAXIy4diTy8A7wq5azN10ShD/T1GomxviJ4HSMTrApfHcEfJJclfhSea
	TKEDy52Ao9n+c5yBmvHIyskUglgEut3YT60+yek3t37TKuVv5oDO84cDN1b7UVw3ciTLreLxemw
	IcjTqEZQU778w9FwU0U3f+kcVhT+skD65JLeiyFoe+qoSZ3Y2G2gw3/9grIfbIr+oPel8kBtgPb
	QBYHF
X-Received: by 2002:a05:600c:8b86:b0:4a3:59c9:a754 with SMTP id 5b1f17b1804b1-4a35acb17bfmr117309135e9.22.1793016571251;
        Mon, 26 Oct 2026 05:09:31 -0700 (PDT)
Received: from threadripper-fedora-workstation (dh207-14-234.xnet.hr. [88.207.14.234])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a00e1b0sm152200695e9.3.2026.10.26.05.09.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 05:09:30 -0700 (PDT)
From: Robert Marko <robimarko@gmail.com>
To: andersson@kernel.org,
	abelvesa@kernel.org,
	sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	konradybcio@kernel.org,
	taniya.das@oss.qualcomm.com,
	ansuelsmth@gmail.com,
	john@phrozen.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Robert Marko <robimarko@gmail.com>
Subject: [PATCH v2 1/4] clk: qcom: ipq-cmn-pll: Correct IPQ8074 NSS NoC rate
Date: Mon, 26 Oct 2026 13:08:12 +0100
Message-ID: <20261026120920.1667982-1-robimarko@gmail.com>
X-Mailer: git-send-email 2.56.0
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

The IPQ8074 NSS NoC bias output feeds the GCC NSS NoC clock without
a divider.

GCC and SSDK (Qualcomm vendor switch driver from SDK) both configure that
clock for 461.5 MHz, while the CMN PLL driver reports its parent at
416.5 MHz.

Report the 461.5 MHz output rate so consumers see the correct rate.

Fixes: 4e36f8ab45c4 ("clk: qcom: ipq-cmn-pll: Add IPQ8074 SoC support")
Signed-off-by: Robert Marko <robimarko@gmail.com>
---
Changes in v2:
- New patch to correct the IPQ8074 NSS NoC bias clock rate.

 drivers/clk/qcom/ipq-cmn-pll.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/ipq-cmn-pll.c b/drivers/clk/qcom/ipq-cmn-pll.c
index 74a2043632b7..76678a4d6b7d 100644
--- a/drivers/clk/qcom/ipq-cmn-pll.c
+++ b/drivers/clk/qcom/ipq-cmn-pll.c
@@ -237,7 +237,7 @@ static const struct cmn_pll_fixed_output_clk ipq6018_output_clks[] = {
 
 static const struct cmn_pll_fixed_output_clk ipq8074_output_clks[] = {
 	CLK_PLL_OUTPUT(IPQ8074_BIAS_PLL_CC_CLK, "bias_pll_cc_clk", 300000000UL),
-	CLK_PLL_OUTPUT(IPQ8074_BIAS_PLL_NSS_NOC_CLK, "bias_pll_nss_noc_clk", 416500000UL),
+	CLK_PLL_OUTPUT(IPQ8074_BIAS_PLL_NSS_NOC_CLK, "bias_pll_nss_noc_clk", 461500000UL),
 	{ /* Sentinel */ }
 };
 
-- 
2.56.0

