Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAB5E52ED2F
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 16:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789575854; cv=none; b=W7jZ2GNzoS+oOdm37eEg4M/h5QOmASLCW9OJQTySwkoSbn12p435y7NJOk/ZtzNJAZqQydLYbA6S8ioKU99d4cD1aFgzsvcAIGL6kcr/o0UGo2r3GMdWgN+CtHivLFn/2V28U/qAFMrguacYj/ZfsHE3cwKJwDY4giMYEpiApYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789575854; c=relaxed/simple;
	bh=ngHy1BRmwRuVWcjURHW3vBTNNYcsBndiD1VA3Og2SHM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=suQ6TvR+pjXEONy3LjKx7puVL6f3x6AxvuQ0kz9OEzSlazGiQv4ZmLIlSuAds0q1aqCP9Pt7iX28upM2e3c75Yy13SS0Jen7Gky4VaWh49K5zYZPNdjSdX7RxG1mnkwNkkWUNPKNyCmO0awLJF40Fs4flrYhrHpjs1tt/kVbEmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iYN9oVRY; arc=none smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iYN9oVRY"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b74e0c2e4dso1274955e87.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 09:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789575844; x=1790180644; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YzAx82TXon+rjcyUNQDTJprZM/vboyxwuHGWfLQKQbo=;
        b=iYN9oVRYbtut7T2OLCc0S63QMCfU91Kc/cA9geOxLNfjDhIsVUBmtiUo81PoWpE48j
         zsJNz5EBSijK0/cXe9VumrqbHM8CZaXZmR1zXwul8IwBSrdqPu6Fy6Ofv7M+idb8I4ns
         IQt7Ky1JqGn3wWBK0tjdul9mo5TQElq7WTph3SjdZVZbXEy5TwFnFy2eQnIoIQSYxe8P
         Sfhe3ncGxUfdKCgRFIePKSCkEx9rKrYv0ofutT5m3i1iz64WWZdWvUUwi2eOutyCXPof
         4zNQCewO0O2MgFyG0vOlcyJo0DGxser/ZD0xv0xQeQCbG4+ncDIbyts0XRLQMD+rxB9y
         7sOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789575844; x=1790180644;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YzAx82TXon+rjcyUNQDTJprZM/vboyxwuHGWfLQKQbo=;
        b=tTXG/Tx+inCptAxdpAtNkaMNUOLO7a25mjGl43YM9aGcac86XnzZ2/VECM7+XFPg8V
         mv9p38fWajzAjcopYSfjYYw71FayZLj5UeCZ4KR718zyRBvMTIjiibYYA887JwiCn8De
         2BeBrx9as4omPYXjE5R3US00mHWpgl1lVnGNTFoJbIByDAWodZ0uW9UdQ12+MeXK/Z4V
         mDAkZxdzTEb+7JgX43EuYi+A8GgX+6QoKndimccXY/CJLBHggqc9rllzTXwZyYyzbBdc
         huWKb/ZC6w+kKmu913YGTjXvKU95QeprUWwdF3dEMUNnKw5PZW2ntQa1k7qIVJE1n6ck
         STQA==
X-Forwarded-Encrypted: i=1; AKwUvByjb1dWz/Nu1ipYHOvpb8NEC+UTHNq5IPzUBwfW5CRJc3Kx48Gmrm2QjK8eqG3l5/1GVg8WOsmqk3ZpXow=@vger.kernel.org
X-Gm-Message-State: AFuF++k3WdDE4eGrG/WdeoUukLVOg33weStrnAYyyiw70PQGIxhlI60y
	bxRAA6v2EVc60eUxZQ+oDieNP5i0xKXwvUzSVZ4dMEBBsaGaT+WttqUSH1xqi46cwg==
X-Gm-Gg: AYBFou0IjvBaAtU1WAjXUBYgucf0pbOiS8NzY/EB1PHHKSQvvv0U0r8r4/kn+nDbJ61
	8n4fXAizJZviyVc7wGARikWIVa4bWbxYUky/F5IEMD80BoDh7F4XL9KHlzzJ41zL97JcTn5oENo
	46FvoE0pR7i8opkwmrIt/pWuJ/2LoDRxm6T7UtBAG6EI8HVawhZL2ho3qLUUT1h9m+YBg17apTu
	JOhGwHsIYf34KLKqXyWg46QxcAGutsawCsIWO9lK0rAKFPruK1jLxvZkJjw1FcVAhSd2a2ijoea
	KuFN7eJNdUKwVBY5fkPWjwKbvGnPK5d+wVRBd6UUjj/2lHm9ViU4kYEP0HZX8hxJcwo3PhIkr2s
	FinJiEYyqRzZrsC1aZ4qx3JQ3nj2kV01r0Gh5ej8GAstT+YwVxoPfk1TPPsG0A+PUJlfrPi05qd
	YJGB1xxoIc0+mhtqEDpzT+96xUUOdRhuNj9lgo616qmXx5tvQM41eubW2lAaRje+s041P+AncyC
	C8AKvovoDwn978k/oTHJri9
X-Received: by 2002:a05:6512:2246:b0:5b2:a558:b222 with SMTP id 2adb3069b0e04-5b8b6615f0fmr1898403e87.10.1789575844328;
        Wed, 16 Sep 2026 09:24:04 -0700 (PDT)
Received: from [127.0.0.1] (sekoohaka.ddns.net. [151.243.208.241])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8b57cc66fsm1036205e87.37.2026.09.16.09.24.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 09:24:03 -0700 (PDT)
From: Maria Lisina <sekoohaka.sarisan@gmail.com>
Date: Wed, 16 Sep 2026 21:23:50 +0500
Subject: [PATCH v7 4/4] mfd: intel-lpss: Switch to debugfs_remove()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-intel-lpss-debugfs-v7-4-eb51d41f55e0@gmail.com>
References: <20260916-intel-lpss-debugfs-v7-0-eb51d41f55e0@gmail.com>
In-Reply-To: <20260916-intel-lpss-debugfs-v7-0-eb51d41f55e0@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Lee Jones <lee@kernel.org>
Cc: mfd@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Maria Lisina <sekoohaka.sarisan@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=905;
 i=sekoohaka.sarisan@gmail.com; h=from:subject:message-id;
 bh=ngHy1BRmwRuVWcjURHW3vBTNNYcsBndiD1VA3Og2SHM=;
 b=kA0DAAoBE+t+6pmjn6IByyZiAGqqwpijb0mm7Z7Aa077tn0XyyBD0ZIUfG0CBN9avF4tnmKJr
 YkCMwQAAQoAHRYhBDwdkoo52qDkNGIzSxPrfuqZo5+iBQJqqsKYAAoJEBPrfuqZo5+iEmIQAJdE
 imQtboGbbGZFwvZXG4zc+1xYG9mNj+soYy1M5Z6tfMDrFgewk4EyhePERC+dtOsex43rufmawUQ
 42H6YPVjyiHizeUR5b1m3iolu9nl2g6b2YCQ/VVLX/+j0JafQMrKrtG3SAun4wkjjytQS6QT/nJ
 xPcNye9km7pwiN04ISH6iL5xbo5iKH0Q3j9nveAwDF/+8o4urlOGE5hiqganq4vdVa/Q5w14Gpq
 QQLVMC+0ZCNiyKgfaGS6V/Id847JZW5Y7GHri4zmkBclJKUsiW4aamR3YBcDTHJnXTayd+EYhMz
 fGxXBAyGauem6YArXfQCtLIcrtohbMivG//yJFLqfQ0uKhWtafgFjVOIKzU3p9+TF2a4bmhfydq
 ubGOQ/MGKRPEsZzAX3TzjuE7dzSpaIKVdhpqS8DSrw/KfpuMDwJoOfQC7cnyWtfKTbWrnAEC6q3
 FojX4pHf2fbl3pRPiekMfOIeD7PYSo0lAbOyIlOpcfmlnLTEVgIzvB8HIdwkL8ibQPmlBaK1ki9
 OLgFp8gckg6hHlEkxOgNBTLGhImW78S0n3ktvzi25mZn8AtFnz27fg3Ufi2xy1gccz8WFS+yq0j
 4IURBj5mXxtu0As9EErT8A6kd55aCELvFuwnCW9TdboV/2Xgr0sktFTjEx9/b2BEydF/RebaCzw
 Gss9N
X-Developer-Key: i=sekoohaka.sarisan@gmail.com; a=openpgp;
 fpr=3C1D928A39DAA0E43462334B13EB7EEA99A39FA2

debugfs_remove_recursive() is deprecated and has become
an alias to debugfs_remove(), replace it with the direct
debugfs_remove() call instead.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Maria Lisina <sekoohaka.sarisan@gmail.com>
---
 drivers/mfd/intel-lpss.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/intel-lpss.c b/drivers/mfd/intel-lpss.c
index 170cc004a9449cb352e3e1ef22ceb35759368ff4..29f30ef0da9902a9353eb9c12f6121b4a7ed8c6e 100644
--- a/drivers/mfd/intel-lpss.c
+++ b/drivers/mfd/intel-lpss.c
@@ -156,7 +156,7 @@ static void intel_lpss_debugfs_add(struct intel_lpss *lpss)
 
 static void intel_lpss_debugfs_remove(struct intel_lpss *lpss)
 {
-	debugfs_remove_recursive(lpss->debugfs);
+	debugfs_remove(lpss->debugfs);
 }
 
 static void intel_lpss_ltr_set(struct device *dev, s32 val)

-- 
2.47.3

