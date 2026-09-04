Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B91344E037
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 22:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788559886; cv=none; b=FstMrrj5xLWEGhLPV9JX2lQnLnBcbFqgy5gQnONhjtEjtHwBUcoLAIDKueDIMs9VB46NfTDEuTWP68YUnD2Wr1ENlNBH/Kk+gWFEv8HMwdTWJuD0K/ELyNaflnZpusZiu+21clkeLoCcgJ09ijQe6Bp2E3Pnso0xRGBtEiIzYLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788559886; c=relaxed/simple;
	bh=GJPVs2NQci4j2hQP0V6E0YPPvN8JlhkXSX7vksZ1gUg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RsjNo784x+mdWRO1cjK6mDFaFvgG5YOXLOkPnL3ptcqYDrNtEmgyl84iBC6LRF40JNimFM0CN1vLLfD8W+OQn2JpTt36atebfDXVuxBJkq7iPSBVZPbaKzJZa1DApNaneyw/xupxsGn0TpSk0ZrmDk7sq8c9Q022LNvRaaSr8+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=DUjFL/Gq; arc=none smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="DUjFL/Gq"
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-4b333de9451so1757388b6e.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 15:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788559880; x=1789164680; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RaUDv6jZm7IW5T2ncwIblB7pFriUxG8BMMkD58QXmUY=;
        b=DUjFL/GqBpCAQ6ofwufiLtoNQker3TV0cxCVCaLP0Q8fUKOBuKpOEOKcPzhpw7xX9b
         ACFOzkrW76weag2DYJryPQXYTPVn2eJw1+UASTOcvq7U/TmqsjDg6iKWBhmS517iN1gx
         hQuOjg6zzz7wPamHfwzxn5iXgo0l+KyDQAWE/0FNisq+aQchnEJTiRSxan9jWxKQkI+M
         bPGg0eBzYXd18ZW9FCWJ2qXoID7a8/PA6IlCL/gKnHAQoEdyNQUiSUdmP6ByAMo3/XSz
         ps+u9mdXxZyiWE0BPOFKmpbTEtQ/iewoqpR0oE/vA4JuIdu4iLs4znA5VSuax14kKSG1
         XKnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788559880; x=1789164680;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RaUDv6jZm7IW5T2ncwIblB7pFriUxG8BMMkD58QXmUY=;
        b=qFdlQg4qxxbmVs4X+kU1aiUOScgFQVPNy7uefJ1oVngyE3QBSrR7N7PM4+uaAra54s
         t1rsrNSOfDgWw5oln/HT3zrv0qs5wgd/4bVwNmYeAZXEGPPTxORvg/Nhgh8i2UVlDYg5
         RVZHbcy0ssc/zILlscKGemKFOAB14FzSn75k9xjWi05wY02oEIxWyhdU/ARZ4FiKgjJC
         go2rP+kMFJS2TvJV2vUAiNZS64r8piKAqf+RK5SN/YUSljUOARWjd4BtPeZVC0X6BnNM
         0+Cx2i87JG1ajI+kWdIfYxjx7L7M/XVRyqXXtkFZdgt3neER8A4K+HFMWjTVFL1bmlsB
         vMfQ==
X-Forwarded-Encrypted: i=1; AKwUvBynkAsk2HTxNzVHHahLIjqtiYPmuKTOoLENPWGLhitkvAiU6xixRH57EbhJ/sWVriTIT49CDGD9xBn/nnk=@vger.kernel.org
X-Gm-Message-State: AFuF++lnZEZDILCS8fN0nNoiE8145zYGPmAJcJa+F37VQacMjMrTexZf
	fJr3Iwj/3hIWM7YkeXf32V+FRrXEGm46SyYbfikMvgXtnAYUtCyoGLUFb6bxlrCKOnk=
X-Gm-Gg: AYBFou184JNMVLhKhx9gha4JX9xj+YrX4W0CI2RkLkhTz7rHJSn1eZ2yp5au2xVsNiP
	fPHNqrb0GABCCeBVhEkhKXf7CoKtln3p6nFlP5kilYm297t+poEIOmrOlC+ZTsia0MchtQCWQml
	N2kIC9awaNHOZOdRfbEEQ1M866n6itgYfL/1umDGFjYnSXtfl+kG7NocPpnmNY/h8BJvdsW1Rbq
	Gdje/zgtAODudzbnuxDYQ9w5p2PKSP1KUAv+aurAwDvqy1x0qzFfcgA+NfRAh+bTW7gu94Csttp
	K2utgSkgrwzvlvmQhA3Cd++cD9hiNg8Jd4xXJQDeXBTPBVYgJuyNd66hUNA/+Pc7JBRLcyuO6yG
	JHMVulLDnkg0Baxzv4eWNKcsdMH5ftTBC2Qo0QfGaOC15pvrbmu7fG5mOGaOpjQ8HCdA9riMNwq
	eDhrWpcrzZgGsZKW/q4t59duEc7qA2c1B68q0MVQlpfgp8wKmN6CR/gthR02AfLgVADg==
X-Received: by 2002:a05:6808:a550:20b0:4b9:e6ab:d089 with SMTP id 5614622812f47-4b9e6abd678mr3315635b6e.41.1788559880038;
        Fri, 04 Sep 2026 15:11:20 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:4324:3ccf:e2bf:d545])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b970d1ff95sm3187113b6e.6.2026.09.04.15.11.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 15:11:19 -0700 (PDT)
From: "David Lechner (TI)" <dlechner@baylibre.com>
Date: Fri, 04 Sep 2026 17:09:50 -0500
Subject: [PATCH v2 05/10] iio: ABI: add sysfs attribute for _burnoutraw
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-iio-adc-ti-ads112c14-filter-support-v2-5-f86592360658@baylibre.com>
References: <20260904-iio-adc-ti-ads112c14-filter-support-v2-0-f86592360658@baylibre.com>
In-Reply-To: <20260904-iio-adc-ti-ads112c14-filter-support-v2-0-f86592360658@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: Chris Hall <c-hall@ti.com>, Patrick Edwards <pedwards@ti.com>, 
 Kurt Borja <kuurtb@gmail.com>, linux-iio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, "David Lechner (TI)" <dlechner@baylibre.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1104; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=GJPVs2NQci4j2hQP0V6E0YPPvN8JlhkXSX7vksZ1gUg=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBqm0HR8vc0nLpD3rmWBwQsDtQqjue9MwC8svTxx
 o2vIkzgsUeJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaptB0QAKCRDCzCAB/wGP
 wM8zCACV0PFxMXpRibNU/88tMO13HOkj5mrxhXGkWH3OiiSeNwFDsR8IOgbMKetmaRXALi5u4a9
 1uy5YOQ7A3c5stUkBq+IIM5MSGPC4moal/yuvheoHlbikiw8qS6tn2mgV4HM4D/xi8KHTtJnbMB
 JuXtV2cnuV+yT9RW68F8S4ktiLYa1ECdqJBxBGIwwOHM9A7Qxg+uX770EZHhXlqE3QxlYNdOYlM
 Wcq78ExR6GiaMaOInO3xnwUu3cnaL9fghW8dw/WAkj4ZFvSJXu1NoOAfz0uIsFjknlnxbzKn/Yo
 l63HNX+vWbVmn/WgvY8i4SWKfa//8L3WMjWIMdLEh2NOOZh2
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Add a new _burnoutraw attribute to the IIO ADC ABI. This is likely only
applicable to ADCs (but is seen on multiple chips and vendors) so it
gets its own file instead of being added to the main IIO ABI file.

Signed-off-by: David Lechner (TI) <dlechner@baylibre.com>
---
 Documentation/ABI/testing/sysfs-bus-iio-adc | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-iio-adc b/Documentation/ABI/testing/sysfs-bus-iio-adc
new file mode 100644
index 000000000000..e1309b371efb
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-bus-iio-adc
@@ -0,0 +1,9 @@
+What:		/sys/bus/iio/devices/iio:deviceX/in_resistanceY_burnoutraw
+What:		/sys/bus/iio/devices/iio:deviceX/in_voltageY_burnoutraw
+What:		/sys/bus/iio/devices/iio:deviceX/in_voltageY-voltageZ_burnoutraw
+KernelVersion:	7.4
+Contact:	linux-iio@vger.kernel.org
+Description:
+		Raw value from channel Y read using a single conversion with
+		the channel burnout current enabled. This is typically used
+		for diagnostic purposes to detect an open or shorted input.

-- 
2.43.0

