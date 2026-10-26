Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793010129;
	b=mw9xX/w3oIoxHnSizDqFw8Jf4bqCTzawE3SWzcnTGW3KlTCDt/L6K/oCHoAD+b68NBY3
	 A3TMAyhGOFrdxD5nWRxF2OTtoNJbCXuy3X3wUfRzPJE4ujwwVcY00UR2QApwaMpr1LjsD
	 jQfHAna1WC9vdnuZdxZhCcNx4R2R30dQa/XJJTeN77MqG3hCVTj4r/GQ0lk+AZ3fGU5ss
	 zhML0Cm3KnYE6TkvM7lpyRvYe9Bxd+9Asi8dXlOzBM8q72gDAwCZtHeWflBGcVyPF4Han
	 7WPHKlX97M2jiWHjMNQlULwbKh2qcs5GSne0Jj8k+SSK+ab/PgItCOG2uFD/14xWRzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793010129;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6ycmAB6PxtVDAOSxkc4Ku8pcl/F85BhrFwHWXHoa634=;
	b=nlnizlfWVvVnqUhlpObYm+W+NBTcE5CdY0tvGrZUn08/y9dszCqwoUl5j0EiEMVzjbW5
	 rpSVBYpwqMof6eurkw/e+L11psZjMeQiVqv+oqnpaMnh/qFfou5uhr4fw5XIPq1GtzD84
	 0ND0Gxnt6jginVHX9dQVtX+O0k0UdQyOVsX/QICV+YZZFv0Dh5MmcxcoEIqeCx26zRK0m
	 sEKm8VBiJ/MonLwVGc84LIBpMw5Z7ZSnqAnR40ZIoLBQFdWzE1zdp9rORsyvLy61MFtd9
	 1SVOJ0g2gTMrtmxfzM446DiZLFuEnYDRRuVcvYNZw+o/a96QQmi612B6en29l+hHvRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gU3+1lmO;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C41F60A2637
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:22:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C41F60A2637
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gU3+1lmO
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3ac9f49b984so1725441a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 03:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793010128; x=1793614928; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6ycmAB6PxtVDAOSxkc4Ku8pcl/F85BhrFwHWXHoa634=;
        b=gU3+1lmO8MRBjumstxABnQkjClXrqaJybo4d1B19kkjLJtiGB9wQ7y76/6i7+eNGR7
         BjfkLu5vBgC6KyVur3vp0k1UWNvaHhrGhuJdIpcH/2Sgk1cQFzdYuMvmk5WJi872AEco
         /Qup1xEDoOOyr66xvZFEqIdx+1wA9cG/c37L25CxdZGlLDAwvbMT0hD8gFUfi+d/4sY4
         IcGgA0TRqs/CbqqX7QaSrksXoaH7Uf8vxl02tUMGsE41Y4TqPmJmpPz5VEHmjMmh+C0j
         zETptfoR0Rm8aXaylNMvqVmh5vRiKiBWvrnUrZNGzi3l4cHPySJFYXJ8pSjetm3GvRaf
         EbfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793010128; x=1793614928;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6ycmAB6PxtVDAOSxkc4Ku8pcl/F85BhrFwHWXHoa634=;
        b=LGPAfYEfGl930Px5YSWx0IJxtNH9Osk+lxZ75TUYzsqi50GTNc48tdDa0W0tG257a4
         yPjp7pKohWF6tg2dg6St+W93zI6TSx8p1nmO2Mdm95gNQAT2EP4/NunpQ8IRp6tD2+7n
         t6vXKraNbQ1ZLNPz0NYxxs525EOgP9wjCWUKHuKa7ULVfu5si9x0wx7VygUZME4/HEA5
         LUjSS1biiHAsJA7AFX62Y/Sa9dO4xhpe0Rd8jSrHGS+Q5A9WrkcTrP+prVn4w6X3hTOt
         Y8V77VGIhVb7aBovS5y3QsEhncbxS97NRCTihTbEfLMO5X47u1iQFSsbWQH0Ym+c7l8y
         yBHg==
X-Forwarded-Encrypted: i=1; AKwUvBwWHE6yRjMPQ95xFtblYmlhh5ermHaFEdJdE2ZROYU8XBuStU8rpC0WJY7wgzY0wrDrymiT0ciNMQRdRN0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJZadyUD3A+cmBfsrUx0oYnnW6vMZV+KfFMPS0WARP8/KYeVGOQ
	cCbcAxRVPqwqLdV4mZVp5Qib2ryhL2r2uwIp+CSA2dBgZMbcWXVskZzA
X-Gm-Gg: AYBFou0kmoodzx/8iNxon+j7jyw3E1pFAhHq/0tNzO9IhKCE56C6tnfpzMC66WH6NOR
	4jscG33mv73GAcq60PfgWM8YFb60WEV1hJpC+ln6EOiE47AXLBsLKNugAUkSthIugwWrcPBQFXZ
	RGsfMsQwZsN7gmQgGnPqOoOqg20hiVcPkLnwUMB6e2TErTtE1epPSH9CpDbu0sUFJvvs+8TfS+4
	2iDwYj/PN03thYqEjhRLHFtn5YBH8taeRvct8U+X0ylJw8HllrvuL7FtYIBJFYBvmM6GsKY0Sa2
	Ecw094IyL/v5+3USQ31kL+yfOCQ0SnmaXQdppLapX93IlcXR4p7RxsaeCb+hIWPhktwQCtHhNNO
	CP/UjcH5jth/P7n5d5qNP5M2D6XhWr4W1T5JMkJULjbclPvgx9RyNoqJb5+8bpWOzS1JwT7pebf
	0QlMe/AIFcBB1n2Y5/79f54D/cU+v+dWYrKTmU/CHBtiuF7k2dbV4IoPAx02eBTBnFOBIYUCzlZ
	262wIPxRrADZxDGJxIP5fx8l0LiPoTpkoI18w==
X-Received: by 2002:a17:90b:2b8f:b0:3a2:bb9f:f87d with SMTP id 98e67ed59e1d1-3adeb5a57afmr3846519a91.21.1793010128168;
        Mon, 26 Oct 2026 03:22:08 -0700 (PDT)
Received: from qby-nixos-laptop ([2a13:edc0:18:16f::a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebe6af0dsm7877467a91.5.2026.10.26.03.21.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 03:22:07 -0700 (PDT)
From: Mingyou Chen <qby140326@gmail.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilya Gladyshev <ilya.gladyshev@linux.dev>
Cc: KentoNion <kento@kekto.ru>,
	platform-driver-x86@vger.kernel.org,
	ted eric <ericted8810@gmail.com>,
	Armin Wolf <W_Armin@gmx.de>,
	linux-kernel@vger.kernel.org,
	Chris Taraszka <chris@miget.com>,
	Matias Civadda <matias.civadda2342001@gmail.com>,
	=?UTF-8?q?=E9=AB=98=20=E4=BF=8A=E6=96=87?= <btx342@gmail.com>,
	powerfullz <wleizc7319@gmail.com>,
	=?UTF-8?q?=E5=AD=99=20=E8=AA=89=E9=93=AD?= <wolf109909@outlook.com>,
	=?UTF-8?q?Milo=C5=A1=20Vlku?= <vlku.milos.fun@gmail.com>,
	Rsplwe <i@rsplwe.com>,
	Bozhen Peng <bozhenpeng93@gmail.com>,
	Anton Karasev <uselessfire@gmail.com>,
	Jame Jao <jaojame6@gmail.com>,
	Serhiy Shliapuhin <shlyapugin@gmail.com>,
	Mingyou Chen <qby140326@gmail.com>
Subject: [PATCH v14 6/6] platform/x86: bitland-mifs-wmi: Fallback to balanced platform profile if last performance profile is not available
Date: Mon, 26 Oct 2026 18:21:01 +0800
Message-ID: <20261026102101.224568-7-qby140326@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261026102101.224568-1-qby140326@gmail.com>
References: <20261026102101.224568-1-qby140326@gmail.com>
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

On Bitland laptops, performance profiles require an external power
supply. If the system enters suspend in a performance profile and the AC
adapter is unplugged while the machine is asleep, laptop_profile_set()
fails with -EOPNOTSUPP during resume when attempting to re-apply
saved_profile.

Returning an error from the resume callback simply because the power
cable was removed during sleep is undesirable, as the device is
otherwise
fully functional.

Gracefully handle this condition by falling back to
PLATFORM_PROFILE_BALANCED
whenever restoring the saved profile returns -EOPNOTSUPP. Update
saved_profile accordingly and notify user space via
platform_profile_notify() so daemons such as power-profiles-daemon stay
in sync with the actual hardware state.

Signed-off-by: Mingyou Chen <qby140326@gmail.com>
---
 drivers/platform/x86/bitland-mifs-wmi.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x86/bitland-mifs-wmi.c
index 3f8f1ebb10fb..a431d3fef774 100644
--- a/drivers/platform/x86/bitland-mifs-wmi.c
+++ b/drivers/platform/x86/bitland-mifs-wmi.c
@@ -392,13 +392,27 @@ static int bitland_mifs_wmi_suspend(struct device *dev)
 static int bitland_mifs_wmi_resume(struct device *dev)
 {
 	struct bitland_mifs_wmi_data *data = dev_get_drvdata(dev);
+	int ret;
 
 	/* Skip event device */
 	if (!data->pp_dev)
 		return 0;
 
+	ret = laptop_profile_set(dev, data->saved_profile);
+
+	if (ret == -EOPNOTSUPP && data->saved_profile != PLATFORM_PROFILE_BALANCED) {
+		dev_dbg(dev, "Cannot restore profile %d (likely on battery), falling back to balanced\n",
+			data->saved_profile);
+
+		ret = laptop_profile_set(dev, PLATFORM_PROFILE_BALANCED);
+		if (!ret) {
+			data->saved_profile = PLATFORM_PROFILE_BALANCED;
+			platform_profile_notify(data->pp_dev);
+		}
+	}
+
 	dev_dbg(dev, "Resuming, restoring profile %d\n", data->saved_profile);
-	return laptop_profile_set(dev, data->saved_profile);
+	return ret;
 }
 
 static DEFINE_SIMPLE_DEV_PM_OPS(bitland_mifs_wmi_pm_ops,
-- 
2.56.0

