Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792737628;
	b=HV1HsZ00ZtumvduXEtmChdpZ0kaxIK/bs7UYyYC7rN+jkh2750zwA0i+lU5YKjuVhNvd
	 U6XOmFXZ6DNafzUzZEqNlAH1+NJJ2C+dHVdZ6zNHodUldfjU9L/OcBNz7LHd2PmNGMOU4
	 bvAiWriww7mNQEmdOeq1d2IUnxNB8HLw/40zE/Uo5+MtNJvB9tjYkqW/fZF6cXKicursH
	 2QMoW5sb/4vWmwqZ7+nvNc8EeLFVagJZP7pgCAtTkJdcwGX9y3sIuS3KwICTblGRRvJ9k
	 LT/u5Z/GBPFQTZlcwPdGcuo+v+OZdLLZ+K/p/qEYWEEOQaoFOYR72wcl7otkCjrrKTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792737628;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=qBC94N5Vlr3FlLO5bq8d1hj8zBP4JCR0k1VspHMjzxs=;
	b=lHCiKvUdc6Ra8Ug5Cr/MnzCTUU+Cn4G0HjyBb0Mw+D3lXrBqfKmb4kCKU4FcJaC98rNa
	 q6k/MqOFZJIj+shEzBIgAX1rLOQOyX0sRWz7UhqtCLZoLBnknXi86iyr1i8cJ8CEVa92m
	 hcULUY/CYe0uUWEylp1WlDLjc901jw4jD+4vXzXVyaqsjXU9IPNqgJnIiMiTorGN4arci
	 bbGvMBruQ+m/Pvbw3iyZvzNT4drDWym96JVlDcFzonikNruVO0bPoex/8Bo5hbYTW3G5v
	 OPj8tRhA/9UqQMCNdHSVrxcV8EJ/STQPnnNXYfo2WQ/5RcL2exvMegzPy/+PSbgSLHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=D8JttAdU;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F0660A380A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 06:40:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30F0660A380A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=D8JttAdU
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48dfdd0678dso360114f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 23:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792737626; x=1793342426; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qBC94N5Vlr3FlLO5bq8d1hj8zBP4JCR0k1VspHMjzxs=;
        b=D8JttAdUXWMA+C1tKErktnwsZZCy3HIUbjnaGh5X7r4L44Zk6RhL8BtNIhqkRk/36D
         IhFbmfHjF5EfcEOihgCUgXSY2+8D8PaXFo+uQ02UUPUUAw2gwAFF19tS0ABrtWDgGPoI
         HeV1vZ9M/nK1FKD6a9Az0iXO04LSuORvWofVstmgcVohmcwvPiihakPXSW2lCaaAmIrM
         44okde0ifL/bu5PZilTkScI6CcMm/uxQrgXHl4ejdowMVXSXesaaRI4KV1JkxQwpFHSe
         lbUVCuoQoCWi6cHLQQoVeoYI7ZAz+2azP2ToWhFHPNSGGzAZ6OxQW0g+zx6nEOJIwLvb
         eWHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792737626; x=1793342426;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qBC94N5Vlr3FlLO5bq8d1hj8zBP4JCR0k1VspHMjzxs=;
        b=sQ4WNcQbNqqdXq1hjtY2eyN+D+gIrJj5sGoOYO0nQEBQ+G55scSt7Yqj68IjKT45E5
         Wg/9g8FTUxlsiSvKIDBOQiJVLYJ2yKFyIMabaGfzsnIU9Z3nj3Q+nQ0VgmZiSu+63X7o
         9fM9CE148UhkgtUEhSLGXx1I5rNsSD/JLdFRJMNrEZAl3c2vgJ8FXoRyLG14pOxLhVLr
         X1x3lrIE1JwtFREi47GxlfqFg4eGUZU1xekqdUgbo0hJkVQsEw/2gSnxKnute/cxzzEX
         a02f5+Xcd5ZzlnxQj13xiaWTd2obcuu11v0SbjyZcURk1mC4cjd1voPxqKaRA3SWY1Pv
         NR3g==
X-Forwarded-Encrypted: i=1; AKwUvByRG6ZhM0INv5E+B0VAXROwDnm2p9Anlx+M8N/ciDyO8HPQuUT+wsNxxDtqqMaHAOp8TXkc0k3VBbi/MZQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIPKLUeeyrZiipMrL1HcOUxgHjnP/u05ok2uclnUEUQS7va4O+C
	hTtLBLGnve82oYgS7p9235rVXjoGTxVGfuFDsysc1RxLD8O6AvsvOqEa
X-Gm-Gg: AYBFou1FiwJ0SOyS0zT5xPMbMi7hAk40MN/FGAX9uxRZ9nI26AFPyqCwNkvpZyLqeUG
	xDkQV3Zvk+Ondkfp1/51/9alXRLZVNaUMS9+M7ZJ2n0lut3jhQjnJSDdghRF8EvjI0QQRwSC6Nr
	rFWXeZtPbEvS7T/ZYQ+Nldw5AsR9lt0AE9WiPVqT1WW4utkVIra0I7BuHz8ze+KjL0+zQHe69zt
	3/i5IT4PxMLUlD0Lu7t93BoA0SvcQgaTCHVip6mNzkpzua2CRD/fnoGvIPBHt6SZK1SBUVQnutT
	c0Ycoo94oil4isvUrwx3PsLO0cRymEFgJGNbsMwR22NqGF0K3XJKPNrkKjnL13mnoF6NSfuwUk+
	M5I3CJNY+Vf+oXPx9873TuvUFOg5bJ4UoP5ab1WAvgdjCUCC/dlEiXPAasH7CHx72dUjRqFyWMP
	/3UTn0oXs1kPBA3iv8CWhb+nvdr6QrfoffqQQgtSwnnRktKhwWhbPccBwb2DuXcxLycxnwRU6MD
	5fRWOWmm3YwkBf9w2vbmql8mAhyTVIYXhAoGeVaNwGh3/CMfhSYZJDl+x7Pg4V4YZtGM2F2TeXx
	2ReopZfraalJtY5n4C1ApbH2m85O0AmYv99zikuawlxw4O3f4VkmPotm9YKj6ghYSNJDejSLT0J
	xt+M=
X-Received: by 2002:a05:600c:3486:b0:4a1:722a:d2a3 with SMTP id 5b1f17b1804b1-4a211eec13amr18677595e9.23.1792737626234;
        Thu, 22 Oct 2026 23:40:26 -0700 (PDT)
Received: from [192.168.1.22] (cst-prg-49-173.cust.vodafone.cz. [46.135.49.173])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e38030c47sm3104782f8f.21.2026.10.22.23.40.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 23:40:25 -0700 (PDT)
From: Tomeu Vizoso <tomeu.vizoso@gmail.com>
X-Google-Original-From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Fri, 23 Oct 2026 08:39:41 +0200
Subject: [PATCH v3 16/16] arm64: dts: ti: k3-j722s: Reference the power
 domains of the C7x timers
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
Message-Id: <20261023-thames-v3-16-3ab40aa17157@tomeuvizoso.net>
References: <20261023-thames-v3-0-3ab40aa17157@tomeuvizoso.net>
In-Reply-To: <20261023-thames-v3-0-3ab40aa17157@tomeuvizoso.net>
To: Nishanth Menon <nm@ti.com>, "Andrew F. Davis" <afd@ti.com>, 
 Randolph Sapp <rs@ti.com>, Jonathan Humphreys <j-humphreys@ti.com>, 
 Andrei Aldea <a-aldea@ti.com>, Chirag Shilwant <c-shilwant@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Beleswar Padhi <b-padhi@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Oded Gabbay <ogabbay@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Robert Nelson <robertcnelson@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 Markus Elfring <Markus.Elfring@web.de>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Suman Anna <s-anna@ti.com>, 
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, Tomeu Vizoso <tomeu@tomeuvizoso.net>, 
 linux-remoteproc@vger.kernel.org, linux-hardening@vger.kernel.org
X-Mailer: b4 0.15.2

Make sure that the timers are powered up so the firmware can use them.

Assisted-by: LLM
Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
---
 arch/arm64/boot/dts/ti/k3-j722s-ti-ipc-firmware.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j722s-ti-ipc-firmware.dtsi b/arch/arm64/boot/dts/ti/k3-j722s-ti-ipc-firmware.dtsi
index 611220ff2655..7639081dc913 100644
--- a/arch/arm64/boot/dts/ti/k3-j722s-ti-ipc-firmware.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j722s-ti-ipc-firmware.dtsi
@@ -166,6 +166,14 @@ &c7x_0 {
 		 <&mailbox0_cluster2 &mbox_c7x_0_client>;
 	memory-region = <&c7x_0_dma_memory_region>,
 			<&c7x_0_memory_region>;
+	/*
+	 * Both timers on each core: core 0's firmware drives TIMER1 and core
+	 * 1's TIMER2; two entries also keep the platform bus from attaching the
+	 * domain to the K3 driver's device.
+	 */
+	power-domains = <&k3_pds 37 TI_SCI_PD_EXCLUSIVE>,
+			<&k3_pds 38 TI_SCI_PD_EXCLUSIVE>;
+	power-domain-names = "timer1", "timer2";
 	status = "okay";
 };
 
@@ -174,5 +182,8 @@ &c7x_1 {
 		 <&mailbox0_cluster3 &mbox_c7x_1_client>;
 	memory-region = <&c7x_1_dma_memory_region>,
 			<&c7x_1_memory_region>;
+	power-domains = <&k3_pds 37 TI_SCI_PD_EXCLUSIVE>,
+			<&k3_pds 38 TI_SCI_PD_EXCLUSIVE>;
+	power-domain-names = "timer1", "timer2";
 	status = "okay";
 };

-- 
2.54.0

