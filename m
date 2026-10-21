Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792586122;
	b=NUKznX9B2prkcttk/poKAu5DQ387mIV4QXXhBF7Lxj9lSN7TumiX+H5Kxgfk3Ekqec//
	 9IM9TS2aJVa2pRGc2Hg710s9AyA3zxJAhKsgRdxoX+P9oC+x8U7Ru7pUXy4LTVDiQ7c0m
	 DMvnsqyUkb1B8q6WkPJ/hqvX47C+tp00Nug9NhroIJ0FUnktNy/kIDKBW/kIlMQnHPblj
	 dVO2ajivOaWjpgQYMuUOS+rLz3Uo9ytf14p3IY2hGGdQ98d18hI5BMWWemTODHY8QB/FB
	 JYuC8y05TuTadDAJiPScmW3gtn2Fnmt4uA7b129U/ddIKVR+ky1YFPhhsQVXyyAnl5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792586122;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=uVtw8U6rcnazFJXWapfAKo/5JBSTjKE2HoWBd7UBtGo=;
	b=mZgZ+Pc3nyjYfmPD9rvzlVKN5BXT/VcIoa6MhWArHtSNEaWWJ42Cc1+Wa3WLa39O4XsQ
	 yhJTCWLZHvN2QSEndoMezW4KnT7ySPHFhNs09zKDih/zg9s+UMbqTAPe6emPKCyeeLRj4
	 TInGNSE16HoP/aqTU+g1/aAQhRDk5FAUv8+fU7Z0D+ugY2LgOTgux6plGRXuvzgcp7aBF
	 ERMKKHps+op70Dzun3GrkGK/Cjn/u33YtmCnWiFX1peqzen4zBhnZj2iYx0qhHduHBv3T
	 B75DjMMnLDHTPmf8mjN7OiVLG+2H3PBetOeV3D1GqeTlvkw2psB1b/nytBNyXm582JQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=q2X0HcmN;
	arc=none smtp.remote-ip=209.85.215.180
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F0A4606A32D
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 12:35:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F0A4606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=q2X0HcmN
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cc4b1f7e8f4so252169a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 05:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792586122; x=1793190922; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uVtw8U6rcnazFJXWapfAKo/5JBSTjKE2HoWBd7UBtGo=;
        b=q2X0HcmNYB4LJEBMLYmKcYD5f7vBKgYYqCdDPMP1NmbE4mUp0nc23ZbES5Yztwgozn
         Tb5aiXWxWtFEaCBf89pakmottmBXCak3vbPC3Rw4WdixUdnMSx2qvC+dOmLKpFbirzMz
         /KrKQs4WJreTIPYPsgzWrSlapJDjnCQbROFqa3e7I9OjhVBn0yeQOb5tSQ49qwDKIN4L
         0Y31CaMQCPAJ879ufkwJOPcYrQpV3ZJEY5UyuJaFVas4B83AOKT5d05RnwD6xqROfg0k
         2qy9DXKNoG3OEaR548/lscZ/cvB1peyDZO09LimDtfRBMgPeL7JVYQMNVI9Id1IkVRBH
         rf2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792586122; x=1793190922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uVtw8U6rcnazFJXWapfAKo/5JBSTjKE2HoWBd7UBtGo=;
        b=udQK2VDDOJoTMyF0OceMU4uboRBNmHZxNnjLkN8x/hQ8pL0SXpQmPDzMtzT0wvn2EY
         fQAntmhPMC01Ngjrux3nWEylJ8gk1YAPQ1yMQn3LUjdeA/QXJDKRFwHwJlFgMxKVJJsW
         +dhkvWEmkIGjTO6x6/X6u5eXYbUPTuPnwBKT94TqbU49fdVNKOjSEy1bvIEUEA5Lbf/Q
         fdfL0OHOqWhAsBYJ3GHyMy8voOSC4Zvtyw5K38Wsxw5ERrn0QIK/lAb1fNjArGU35TGd
         tlFxokpqvoloNY16nthkVdtw/XnhLt/JoFBNYjyMIyrhohxW0SJn8FD+tYrAHvGguUwN
         SVig==
X-Forwarded-Encrypted: i=1; AKwUvBy7zY8+hYJoE0Eq2mTL8v0PRsmOOdXuV9AXZ7+jFFDVL0ZAhmRaRZNYDT7/GiyqnRRuVy1nDdI/khBD64w=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ5NVPA7nkMsLk/wgUkdmg277WS0Q1u3SFf9jHtlrkPAb+jOx2s
	YZ6GMLBYW/mJsnxuyg+Hpq9R3xbFHTT8+hojeg5qCmP4/hgwpKumCoVL
X-Gm-Gg: AYBFou1evB5ymwW+XiiXR6VWMvwB9wspyDanDyeKd23HWjLy4+8SqMYkBGQB69zBgdh
	KdhCGKAG/ZinGSS5tsPvb8jcHJ50u85tiRMTIINQ9LSsBDFy7HtYHgnHVEvEAdtoI/pF9nGlZzE
	8/eKYjUMnAidssw+xukoYRus7qTKE+iNXPWO/tY859310DDxZv8ylTP9WE+c0ZMNEeLW18dE3nj
	la/4Q9ayvXVeYJP5XDo3fYLcwzt1BG2I1PnVT0jKDqiBikyHm+r1dZTnQXSse2N/FgvUzrcDApg
	sRTViUvUATHaqnD7p0SxCg7+ZLYMFmIYL1c8BvGYp5LRjW12CCEVRuDP/B3Z+y7wgwYjny1BnHh
	cYGpOE4Ie1zI4P/lMVgcbmncF3diYf9qgyE/I8eCfweyiRxpDwYtzgwr6juvbQI+eNCQCHs6MFP
	LzLNSNHcqHgb5JMFw1l4syN8aL60NSiIo4ZBmRMEg20kSDWxn/9ITcq9Hay3BIIqZlW3xLoog1i
	LG3sdd76qyuG0YjRanJPfpGmcyqHVnnhaJ5sh9/WJQpJyG/pX0kkpWN
X-Received: by 2002:a17:90b:1dcf:b0:3ac:4e18:238c with SMTP id 98e67ed59e1d1-3ad86f10199mr1431595a91.49.1792586121968;
        Wed, 21 Oct 2026 05:35:21 -0700 (PDT)
Received: from qby-nixos-laptop ([20.89.137.63])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad85f56b03sm1823615a91.3.2026.10.21.05.35.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 05:35:21 -0700 (PDT)
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
Subject: [PATCH v13 6/7] platform/x86: bitland-mifs-wmi: Fallback to balanced platform profile if last performance profile is not available
Date: Wed, 21 Oct 2026 20:34:13 +0800
Message-ID: <20261021123414.25516-7-qby140326@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261021123414.25516-1-qby140326@gmail.com>
References: <20261021123414.25516-1-qby140326@gmail.com>
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
index a54eb5bba1e8..f4f37ae2f424 100644
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

