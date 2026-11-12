Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794509669;
	b=4sK8+KMi6ueZ4s5yBFn7WygWpF2VK7MwKannf6LPZ/sTCAaV85RtmfyzD9zuo970eLMg
	 Ers3pVu+gKCzFjTprQXvbTwXdpV3ITH9qCV9pUggsB/wkBh2ztIpu1UkzmBjBZrvvZixt
	 sIRAKbH5bAHBEQZsTDNWzzptYCEk+iDJlDeGpr81xpmGuvEW1L8zcpCXiXEvPfxogheZG
	 zAPbbyrKTDlZeZeRWsNJIOjhGt03pzfFSpINZxiianT1C8PGeBu7uatLSl3mAq32MF+WD
	 DpKJQWwyQVYR6GkZvXxIPJNNQlc/QHV5gbwpzPouxemhMeLWNeHvZ3yAfky5hlgd21g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794509669;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=G84wSK0nUUfLUVTY4c0GD6hajZc/iWKJjasXJCCFPjQ=;
	b=S5FU1rUqvLVv28zUbYzOKT0ugdpfii7v/PqMgS5myy+Re1KN6vih314n1a/Ml4aXcRW5
	 JzQntSeX0jZMCZF1o3dkAJyto524ATFiPv7zV2uRwWp9NGmcu+vd8eiCbupByqsLBbuKI
	 ZkOFQBdfiABkiRZZGFArJwrY1k9VNTz9+vlezhTU1oPdV6YcTcEArvxVidp4Oeu2weDMg
	 zbOuekRR5X3y4bkRmytqQ/hAeOPgdp94yOvAeOUUAPbGeny9we0fjMrB5wrYbv+L7QpUs
	 6NE6q8n1/XjJ0H+BxKkgIX35tp2X429zI7dnnF4V6Qz5FazV+unduBwP/CC0uSQEQDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ika8RJU1;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6BFB606A33F
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 18:54:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6BFB606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ika8RJU1
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-36d1b3b9974so17132eec.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:54:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794509668; x=1795114468; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G84wSK0nUUfLUVTY4c0GD6hajZc/iWKJjasXJCCFPjQ=;
        b=ika8RJU180o7R0uM/ThueU1zLpH83uj4J9/WII8cpnYHL7Pnh5XD13+K/eoscIleR5
         gQMtaESU43b1KiF3Jvu/VcMf21hQ6vFfMldzrEUFEV49bmYLXbdNIX6CrrQ24Fp4w342
         tfbl8ymt7yHWyUu34ERw8PLR89M3l0hRjHRd1e5wnptYykXoLaywqeqaaa7D9wifhO0B
         s4s+0pw5vSi/nGJ0mHveKevjIrEiO0w87gbGsIhzeFykTs8gBI1es4JwhxOMFvSVVe6T
         Y5TOowq1AywZ21LAz+nI3gXHPjIwYrdN2Dn97di7zGJNFbZPq6birXMp+rzKIue8BSFS
         nSwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794509668; x=1795114468;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G84wSK0nUUfLUVTY4c0GD6hajZc/iWKJjasXJCCFPjQ=;
        b=iS9Uja8DMLDjcBiaI/8GT8dFKLTAWSJXyxOhG2Ou4OAqyFUT9IUJq4lIOedCIIVNoX
         2KVpnehqcPV4jKjJr+V76ZJ3xA888Q1AolYNaYjR5Q91dJN6l18oWDl+uxzMO9vqbRv/
         MXKfDvfZVfRfOYgdWA/a+QgGR11scDzeOSDjF7teel1uFGzV8+wQda+Utw7LLTnWpovO
         antGSaXJ8vdqPgJXzkSujheKIDsfrH7ofSq0Ocd/ApZSm4fwrNnUdvCUUahyWtCRsRBx
         9p78S3lqvdl2MSv65M6IYKWeG44uTF4iHfdDNH84eA8goAlMCAJRzw8judd5ooXeMw3F
         bB8Q==
X-Forwarded-Encrypted: i=1; AL+hErENmlxyF3rBpuX0dIV76mLx+MABUukRkNk6kksF9yHn1DDcLh6svbR7npxxxft2ltwhd9CvxMAyCyK/nsY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9rIKINcKzTFXq8hVeVsmouAmNu6L7bEmRMaAtlX/DXz9bfiJ4W
	e3XPrKgYAQV7ZgJKIgQy4rNrqBH1rElkqYFyymSk2+AgsRZTjsiSYbdm
X-Gm-Gg: AYBFou1I91KhL91KF/UKI9nSgWm1NntjeHU0SwDcW5duC8Tj9c2aPfBiltYpqzZTG7A
	EMu2P6HemWbSdyaScRxqGVckb9cq+By5pn1zhd0ZRWlzAJ3eHwapDhcEtGbPo9EHxAnYcmgmPO9
	oFNhgsJsEtPPlurjfclLR3ilIFrhV8LWe+oQmAbjYKYCYNrNXKrIV7qfzoE9eC1I7XwEpJfaWOE
	C0EsTCXycUfxfn9scVAC2gxqyPUduDEiqj3O+xLhF3AT5J7wLv+RE7AnwHaAYPmpRe6E06LaEHP
	zzsSv2YTa4H/2okfDhN2q19HfcOROslVqjWYg/Hsn7JI3eQgdeLvBcylz8XgFDb4QYAxZ+c5KxR
	T2rwbiV+nZBnz9I+/jsTz0k8O0ji/Pa7DluHDpMpisUSgQqs1YeI7tvBiKdw/4wYlwZAZ9IFUWd
	YbZtj1TApArsFnzlqiuKh/qCPvcxl8qBPN4+MxX0OGth4kFHNhSZ+yGmPVYfyzUBPhT5kKiQo2l
	pfagJxd1+NE+4o7FrD8XblnWpSMw0pvhF6wV82KZKqzLHvOqBinRjAB1B1Dh5sAmBMu7RTS8PhK
	BxoQJwNe/YBQShElnpDgf/kOgRMnHNN661Z1L2tduATxJdn95DWNRlHtWKw=
X-Received: by 2002:a05:7301:a0a:b0:375:f846:5b3f with SMTP id 5a478bee46e88-3796057e734mr124077eec.0.1794509667847;
        Thu, 12 Nov 2026 10:54:27 -0800 (PST)
Received: from [192.168.1.4] ([2401:4900:881d:321d:eb39:71d3:15f6:5fe0])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379565d07b3sm339008eec.22.2026.11.12.10.54.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 10:54:27 -0800 (PST)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Fri, 13 Nov 2026 00:24:02 +0530
Subject: [PATCH v4 1/3] ARM: dts: omap36xx: Add unit address to ABB
 regulator node
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
Message-Id: <20261113-ti-l3-noc-v4-1-5084dcf4ffb4@gmail.com>
References: <20261113-ti-l3-noc-v4-0-5084dcf4ffb4@gmail.com>
In-Reply-To: <20261113-ti-l3-noc-v4-0-5084dcf4ffb4@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Santosh Shilimkar <santosh.shilimkar@ti.com>, 
 Sricharan R <r.sricharan@ti.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 goledhruva@gmail.com, m-chawdhry@ti.com, daniel.baluta@gmail.com, 
 simona.toaca@nxp.com, j.bhargav.u@gmail.com, linux-omap@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794509656; l=884;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=mRJd2FscObSZq+5xKtM7LxfhPVQc620l8Gz6i2pWC0w=;
 b=pexz5pY2dcZ6Hx+y6xEeA6ThGdmSU7B3tZuKGyzj8Z85JLBcsN+Djlp1EMwATCKVc8aLWOC2l
 C5Kq5VQzmfxDXCz609R7FvC00IS+VDvOdRXURFrGLIYF1CkcmU3GynC
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

The ti,abb-v1 node abb_mpu_iva has a reg property but no unit address,
which violates the devicetree rule that the unit address must match
the first reg entry.

Add unit address to the ABB node in omap3.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
 arch/arm/boot/dts/ti/omap/omap36xx.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/ti/omap/omap36xx.dtsi b/arch/arm/boot/dts/ti/omap/omap36xx.dtsi
index c217094b50abc..6df66eb7e7eeb 100644
--- a/arch/arm/boot/dts/ti/omap/omap36xx.dtsi
+++ b/arch/arm/boot/dts/ti/omap/omap36xx.dtsi
@@ -92,7 +92,7 @@ uart4: serial@49042000 {
 			clock-frequency = <48000000>;
 		};
 
-		abb_mpu_iva: regulator-abb-mpu {
+		abb_mpu_iva: regulator-abb-mpu@483072f0 {
 			compatible = "ti,abb-v1";
 			regulator-name = "abb_mpu_iva";
 			#address-cells = <0>;

-- 
2.56.0

