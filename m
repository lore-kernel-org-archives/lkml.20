Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793032181;
	b=G2wcAkOiMS5USKCPeNmCLaUmTKRBZGVaZqEEcpzsHp1t23Til3PG1Wwl2TJn/YKE2CxC
	 99TpLgGvRelx/7nsIHY1Qj5Lh3uCXbZe93heXRfOQSwtQAskZivlyu2ZPf7VG5oADV1zw
	 LtJ8ql2Vd3CiClhkqR13C7/WidSkN7RiVf/MsWLG6Wr6qCmJqnEHfo1knAV81wdeOBC1P
	 740HfIFXuucIpTreSEgKOgK8CIVnzuBwMUq6ImwkBZfyMOD/2dRqQEz1BS4RXrpox4R2E
	 xk8SAMZzeHeDYiBdkvVz1j3L8yyHpwmb3FWoaKsTJttyVH9awui+A727+emIeRPEb8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793032181;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=mVqOMpq3Ta7/EkEuSA8a9XwsNItOYVhbbTfvvwa7Cic=;
	b=5qJE4R3jC4F4gdkXeewYYpw6a5uGpzKDLaUCBkjHVgmfq8hdBUe5B7fZntrQmi3l8Gnd
	 qPzxXdm/cbRisKNEQp8R3/nr4L/Vmbhflol0WuzypLt6EXKNnACCX0QWi4Dq1/psHLAKA
	 uz995PEfkz5/xocpKVtiUdQjjUfhJ3w4cplMs4oCUnHizI8VUxnHc7Ku+pFTSqeAh3mpj
	 wKUuNqBjG25pbLU4BebfJbicW99CtVCfWhbsqiGATthfcBngjJhOWYOVJJ7ntRhz1s5fU
	 HVDwRuNEskBI2dNFZaW0jWdrSCgMtGVhCj8y43+FjybqbxROTQ6DrXJ5Ytn6QEb24gA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=M0H1m06w;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2CD2606A328
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 16:29:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2CD2606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=M0H1m06w
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a208d93758so37556285e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793032179; x=1793636979; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mVqOMpq3Ta7/EkEuSA8a9XwsNItOYVhbbTfvvwa7Cic=;
        b=M0H1m06w86qx83avAUunAWljGDYrXBDGWAJqT5FWkttcbsrLbj7O9cQrcJpgE/fEmS
         jfJrrRIW32a4OPion1nYpxHFBp4iihJyR1fbH6DwYxe+eYo763pd/IUGxjkrWZ53rEPt
         87LlcVXqhrFNonv6BpmMQzQOYJrz5dfY0u6HfabCKf6j051j1AjPr6EGUgn9NOB4ezV0
         /cNP7/0TDdtXXIjj6DD8CNavz6DbKqyhSkdzWuZQQ1EUC0vDkwMRytv3SChXyRLIigVC
         EGVEwYjDvskZY3lu2C2PqLq58ZY+VBupSYPEVlMPaEQa2Oz0XBIZsSDtkKV9Wam7weLw
         DdkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793032179; x=1793636979;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mVqOMpq3Ta7/EkEuSA8a9XwsNItOYVhbbTfvvwa7Cic=;
        b=wtT2nyVSPF4ZwG5FaG2Jn3k38H4Jhi5bz9DUpi7tlEmjXDGHT4Iwrmzs1yZJGwcJV/
         ZwSDOYc54RbQxF5hIHFLGgy8inZMG4BZhPD5Ekjh81aEV5rw0DGIU059jom7wWE7rjbT
         uZAouuSCEu9zqVx7A1evv71n1Canc/y2gM8f9fD3/Xov5AtiaGNOWJSaIiT3mTfivmOn
         h22tMDraozWH3P2KrDkNid0xilF76S5mZO407Mh9vQlqeMUNKAPAcwUOFVM1hK6ud9B1
         0KgIa/yjGJ/7TrWV4Jcm+/nBt788WPzfGRJTYDaq3PMPzK02B/lGomPPtw7jB0TuW3Nq
         rHow==
X-Forwarded-Encrypted: i=1; AKwUvBz2hudvInssXPHFPu1FQ1QbI6ClFfPLSl7fVZTdFa6X4Vbht1YqdyD0PYa3LUSoq+6C4O3xvOtkmELHv7M=@vger.kernel.org
X-Gm-Message-State: AFq9FYKdG+erdfjC/j8Vc505g1UuUGoF/buieEgMggm/bMWwFQwarKyy
	utTz4OcBO3eiHgYgLP6BHJS6ZWMvjZ6wrlyv7jGetgt77tkVsNK4xa82tfGGkBxufKtkM0wzOrc
	CkeO5h44=
X-Gm-Gg: AYBFou32c4ytNHnuao5p1ZvourLerueHABw+XU4Lyl1rH67FYVQ1HsFDYVL9fES8YjE
	qBvWYF/QqnorLxsBaJ6HzwfjJ0eAJiB82aqUwoZ1QyX+Ul5XkxuR+2xkw64bB9FTqxK2LG5FIsg
	gW9k/3a9iRK/6b3r0YWrIDSv7MBPYPsHlNtyhxTXQ88eMO/poKfR/4ok4jIp5IQHbaIthF78F2R
	vD9m9QIIW0t3A6bj1qfpPVNr+RvFS/pK7HrJresMPF14pEp860S0aFDGsT+Hz7g57WyI6dqdjNw
	Euw57k/Y3mXog10vvfkHttY2E+7oQ0buWwLGPBbdbOBZyTAsj/ApbK4lt4ExyRXD6FLXMdnKEGp
	OL6tH9vzgIbwD6xLmWh/44iHsSKMoVFpKz3HeVzSdHD/HeAGOVOcOCBlkQNGNKBA61vziQECxTv
	B/DheAyvKebcbGMPfyfSZvZxRhtHfuptzYNsBc/ZWSgvn+03WgMkTrPizNARocLGZFEqEaoMcnw
	3TA39tm54JJ10RXeR1IMRxCE9toXdgX8j5Q4ecfbu+Upl4dJCgsMs3Lc8bj8TTU/p9X2jcXp2Pi
	GuVlDxbVK9oZ4R0IchvU7lNsRRaj0txhHI4Cd7XF1tNO/nU/LLuLsJPLoFGdzMSi
X-Received: by 2002:a05:600c:4688:b0:4a1:e69d:90e8 with SMTP id 5b1f17b1804b1-4a35aca5a1amr130369075e9.22.1793032179209;
        Mon, 26 Oct 2026 09:29:39 -0700 (PDT)
Received: from localhost (p200300f65f19a904cbccaa7a4d73ac15.dip0.t-ipconnect.de. [2003:f6:5f19:a904:cbcc:aa7a:4d73:ac15])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48e3ebc3932sm18572513f8f.18.2026.10.26.09.29.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 09:29:38 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 08/22] gpio: sodaville: Add missing PCI module annotations
Date: Mon, 26 Oct 2026 17:28:19 +0100
Message-ID:  <5c0a0be0cc9af836f43e6ec97d9bd0616e0f1cd1.1793030820.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.56.0.rc1
In-Reply-To: <cover.1793030820.git.u.kleine-koenig@baylibre.com>
References: <cover.1793030820.git.u.kleine-koenig@baylibre.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=804; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=ruqHUCemP+4NGXs/vpESgcahf11H3mu+ndRqYcbEJvg=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq33+wlz4Fiffhbb1mjTj99I33vPqfYXp0myaDc miD6YeG4T6JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCat9/sAAKCRCPgPtYfRL+ TiT4B/4geXkTgEd1SXkO88ts83dqRPpTmMd2OUe7+jrjna+H9U4VtbaOzYRaTtx3GeotFyL+QRB rb+GgvAKQLQWHl5PjK34oXzv7ux5uJKvLYtNjXrgalIUY2TCUIFU/qEuBr8PMdSMmMH6LyVcStb aVR1ohT9ZnvdDIp1NHI9T1X/Oq/10QT7q2/fPuu7qZsB5tCD8hyyN41IZ+fIWa81RVskDWrxioM qFhq9DPV6j7AS9NDsnJk8154EjBmnc+/R4d/YUFZnHumM9Nmo6PZLQh9INgJOn2vq6/3xSFZvkC FyZJ5w5Gdf85BWrrEeobJ+6UNCn1VN5hlqb2KPyHXCiFEAbx
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

A driver module matching devices using a PCI device id table is
supposed to declare that in the module's metadata. Add this information
to the sodaville driver.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/gpio/gpio-sodaville.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-sodaville.c b/drivers/gpio/gpio-sodaville.c
index e2a784df275c..950aa12815eb 100644
--- a/drivers/gpio/gpio-sodaville.c
+++ b/drivers/gpio/gpio-sodaville.c
@@ -241,6 +241,7 @@ static const struct pci_device_id sdv_gpio_pci_ids[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_SDV_GPIO) },
 	{ 0, },
 };
+MODULE_DEVICE_TABLE(pci, sdv_gpio_pci_ids);
 
 static struct pci_driver sdv_gpio_driver = {
 	.driver = {
-- 
2.56.0.rc1

