Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A84E3EA66
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 06:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791352887; cv=none; b=T6Bv41jK7iU4A2IZV9XtGIUw1KOYKbXroqEqrviH8kMBEjUl9ekiBeU64Jxm0g1IfKaaSGydTt/09yhWb0xDNKfOJCKuYysUN0UBkK6ZClQw8RZiICSXo716U6EkGLWvpYTly8/aqxQJESoe18EwXdsDCYhd+nbg9Ep98hWwVfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791352887; c=relaxed/simple;
	bh=fUkZRVZThPrAIiUI7nNS/oPVIqZ1p+N6QBHZ5r01/C4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=onIL6XxqsJnguR1ixyDEAca4qwwqbQNjEmmz0gAmx0nKHZ/MZFedPR8Sc7xNXDuXOHsEP6JKRQ9RNzznHFDay2hKLmoLxSOfyX0M3VAcMZsKZZ+4bhJiS38SNUjUOLjDPI7lqQ1Qjca+NF/+NNCZUNgUUVqMfTKtpr1M9o6fCbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eb4ZzBax; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eb4ZzBax"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a16af2a232so11428305e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 23:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791352885; x=1791957685; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xPj6yjALXRppnwgH/9Fv6hsVla0KxfcdinEDCye/m1I=;
        b=eb4ZzBaxSsIZgNsCzuEUciBc8eJlHiZUF6gj+w3V5CmMPoasoVzd8Y1c7k8Cgs/4As
         dagweCT/ii+MR8KGWokIuunxySksPKEiY6wQTqPSzd9efW8It5xaFNcjfMtNh8SWHV1t
         3Oec1hVYVmEvl9YsZ1h41htpHiK0cja1PRgWMbu1wccBufvn26ym4CV/M0pN0GRHiwu3
         696yj/ghTYcnnY5X4Bir/TUWIyP1UuSwh9jZLRAFDZ3xGImIPAcoBjb/wStfWCJK+1+9
         Nn36/VWgklMg1NJixlGfhLwMMj+ReLCacQ38go3GtudMXV/ZsCEXdZK6jyxLRLqPaHmx
         KkMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791352885; x=1791957685;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xPj6yjALXRppnwgH/9Fv6hsVla0KxfcdinEDCye/m1I=;
        b=PUF35e7oStyJlaMjENJB0MHF4h0bLLJTdcNvIb8wMhRi9v5Yr4zweBjSRso3WVpABy
         au+4QgzAu/xgkYIh9c02fdHw8T2fQUAM0Bjnwb4AjRGmFYiNbY1TRW0cjV8Trx6cjVKw
         i3KC55sPIimgwqSELK3Jzohb4CJI1aVijVjlOMqCTM3SScick7IKXRhCJWZWqqNsIx4X
         l/GVjzREDSp89BJqUto+/Mgx9j6NiV42zXfw9daJcehIfNPZ0oT7AWZul0g4eHZa7R1L
         uk1xEorHkCE5Zh3MEVTfCyDp9wU6xuAVIAqPGdEJzYBGWPUsnxSS+O8FfKTmLO/G+uOB
         a2RA==
X-Forwarded-Encrypted: i=1; AKwUvByBVEZmZ6db6+JbDIPVI2uZyZmH2dRk2JFKA+zRSPzEsqzIn3aXgxSLmATJeofj6WwfvkZSSjM50tGGJKE=@vger.kernel.org
X-Gm-Message-State: AFuF++mwxubN0W1kFPUXHKG8V2XcAxWIzMRJWSEi26UXm+tj0pd0UTcc
	lv5obQK2XDSYTcXaxtUOBnvVtrJgLpEGlVQMXcEBmS7Hz3jlkhremIc2
X-Gm-Gg: AYBFou10QRTlrE6XVeoZ3TpeEB+RkOYy/n7tfMCNO3/kOkTxVKrdZOOrDXR7+HefvOV
	DNLfP5eaLNrZ4aXzMZZ6nBZfDvHNisWDIxwHcbmTskiyMI0ZduDMIRT+JJ15YygJ+yANmWPviEb
	2Asrx6JPUlKho28QLTxsScjOSOhsaVYl350yFAy0qX0uedMt3iqwY+bRTk6dzToVabyJzmoCKye
	cbVztHsa72EUxHccVGdF7Ka5FzQoQ3jdSCC5wgDccs1/ujY0+QEzBEFHPjSk6qwtlIG28mmqaH4
	Rm5qAxPoiieS6eCSqLaarQ2RaohDr6mY2gUP5/EG18tEGia9wMQkJVQm6h1BPTdJ9L4j5rqV8dz
	OgcgG4FT3mWjeFC4BIrHJI6iqip6vIt7Bn56fUFDv0UWkjIMqB/ec1leNhjfxTNhZeUDlQyhmxq
	bwR4C89D24MVClNi1My2/f6XJXTZnjIDl9oDZFSRqYiZOyt0h91AAbOM5usyc=
X-Received: by 2002:a05:600c:314f:b0:4a0:1c69:f607 with SMTP id 5b1f17b1804b1-4a1806509b5mr13094935e9.29.1791352884569;
        Tue, 06 Oct 2026 23:01:24 -0700 (PDT)
Received: from debian.tfbnw.net ([2620:10d:c092:400::4:711b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a17f4eac2csm49696235e9.0.2026.10.06.23.01.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 23:01:22 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Pablo Mazzini <pmazzini@gmail.com>
Subject: [PATCH v2] pinctrl: sunxi: dt: do not accumulate npins across probe attempts
Date: Wed,  7 Oct 2026 07:01:07 +0100
Message-ID: <20261007060107.62221-1-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

init_pins_table() adds to npins in the driver's static descriptor, so
after a probe deferral the count doubles and the next probe fails with
"pin 0 already registered". Reset it first.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
v2: reset npins instead of counting into a local (Andre)

 drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c b/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c
index 50a16f3bd131..8bcd566593ae 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c
@@ -84,6 +84,7 @@ static struct sunxi_desc_pin *init_pins_table(struct device *dev,
 	 * Find the total number of pins.
 	 * Also work out how much memory we need to store all the pin names.
 	 */
+	desc->npins = 0;
 	for (i = 0; i < SUNXI_PINCTRL_MAX_BANKS; i++) {
 		desc->npins += pins_per_bank[i];
 		if (pins_per_bank[i] < 10) {
-- 
2.52.0

