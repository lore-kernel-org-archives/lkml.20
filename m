Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D17DA3F482C
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 14:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787754912; cv=none; b=fM3LQY9dQjVyncnzVLhnZIdSGiWPHjayB2kjWeQHQu4pTnpyLA30I/UtMoxPmF2J8lSBWwqqrlH05Cvm4mKo8cM0gZlXCM7S6ZacTekhme+pYxeQCckLyGyD6M8gJA8TgG4hTBA9MXNzCsfyG9jeW2iG7sA4bvQzHsVmSQGTb3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787754912; c=relaxed/simple;
	bh=jqfkF0e6vWxKSKLw11Mg207qPvtAzL2cGYddUhr5jCA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aNYjiUq5OuFFvZWj5uYxx+/6i11KWb+R6jI6Dus+jdZramHQqsInCi9tPhWsL98CaasK6I7bpqUOIonOnQKtjRspYJNNLEufm5bgSZDoubzMCHgX5pEbA0DSlXLMg8RZCg9Ltu3ZInOn1MBeGcsYNCvYUEoinbd41xmY0or7UuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jC+zifce; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jC+zifce"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c15e2dab83eso157323666b.1
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 07:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787754909; x=1788359709; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=puj5sHCWZ6EX0dZBwVaC94xWO8GxrdTzFIHs0oZ7wjc=;
        b=jC+zifcexQNx9mY5GKIVks3WRwnLtgFv6EssjnQwxcJ3Oic3mGhw32ry9APPPvEatk
         g/Z9yaOkum4K0CR+YTdqUhQr8L7BS0wdlodWjwPsxb42pQrGnS5kLxzQDWtnYZKGi+oX
         7yZmRBiHo8QDGBYldsX4Rq72LtXY4OMsIVddEcm6JZwCiGhNuwj2PCuilZaGXkwMLa/N
         Dlx4tvxIeQJ8RxmlKl4WcrFBeyl8z8nWzmtpm/OQ6HEnIc4NtbQZrS1TcKXw71mnIDvV
         LE9XFwmqfjt+KVgF5Dke4ZkfQK4sg/QmYeL5SQWEDVrLdbqYbmHW4oel3hDWe5MTxBYX
         uKMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787754909; x=1788359709;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=puj5sHCWZ6EX0dZBwVaC94xWO8GxrdTzFIHs0oZ7wjc=;
        b=KgmNJs9W0MnAUoYxBOGfO2FGSBonfV9CJ6nshVlBvr6H8RsL47nkjospyoCIM1lWfJ
         Etq1Lc+cbPPXLr7McxWYU/zOgYc1oiGWd4IypdmAW2BENQQHA81nFworx/HxSuaDEm1v
         ow37EpUPFMKvsL4CP9NretIedsPD/6WX/BDNp/N//2XRcch+eKxH8gH/jiBhfiEoq6Pj
         85+bmsXrsJYMT3pJsK6DlI9YKqzeQwIXA/uL/uY+OLkTavL6jTf/5GzEBbApWPkeGBtq
         neUYgAqUX3zoXxjBofnitynkM4JfKRxeCCVquOqGpt+I9Pt1E6L7mVZHZTu5xvr46gk8
         8U1w==
X-Forwarded-Encrypted: i=1; AHgh+RqrgJQ5VE3Amq65ZilZoLUAxZrIZG9n8erJn4+nYx60YKPm6/PG0YxzrrcJ2MEz7hTWcdS9+oNpgaOeMC0=@vger.kernel.org
X-Gm-Message-State: AFuF++kTX6foP++6I/6z+MBE9xKceijxWWl//JY7f7nuXY0PWla5rQuD
	XeSDz254cdIkcVHdsAgvpPTaR8UWiUCVVbRt0T+iW/yau5Hq4PQHqx99
X-Gm-Gg: AR+sD11Q/vBADjy4zJ/FW6rczsAaL/U27A4EUGqpxjAcvTQDv+pYxRlahI/6OPYy/Ge
	hpgKsv3xuvP3pG/A3MQGwPZL9bNWaFR4NWxUbyE9rimKzjfmjyRHV6Hd/9l7oTfM43Ia1AcLKO9
	pH4ibkgDBPzqMYGbHyvpMTUS5f9q+NfO+F21A3P8L6mbhU4Vrxjj5W3FU+6GTsk3SUqPRG2V9VG
	1AXjGFvP1WishCbitpZ81CxFpMsDia35oiCOoRVZv2VJMOzxi6mavLyQf3abXopmoFJCau8+Qqa
	2+JXrNCCoMOk89AxmJhpWXhQRdK8tMnxrDkmpP6jSEUd6y+8ki2G2CRE1jFjxd+Aq4PMc+a6T7g
	zBVopiUgadv1vwrd3H8v0gdEnRbnWPPFQ441Avt1eRlUJqI1nNdfRBxyC2gFf2/XnSwQ7eGaONB
	ETFKP3EbbssQ8JBorZCJFJ3e8YtA1eairnyQ3YC0jdJJs6RiZJeJiyz0urpRgDRPJJMsAASAbt3
	jT4pA==
X-Received: by 2002:a17:907:1c87:b0:c21:180c:d82d with SMTP id a640c23a62f3a-c250c3bfa5dmr900955166b.20.1787754908848;
        Wed, 26 Aug 2026 07:35:08 -0700 (PDT)
Received: from localhost.localdomain ([94.240.188.176])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a9ef92csm531690966b.63.2026.08.26.07.35.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 07:35:08 -0700 (PDT)
From: Svyatoslav Nikolenko <nsvatoslav515@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Svyatoslav Nikolenko <nsvatoslav515@gmail.com>
Subject: [PATCH] staging: rtl8723bs: use strscpy() for ifname copy
Date: Wed, 26 Aug 2026 17:34:18 +0300
Message-ID: <20260826143418.5713-1-nsvatoslav515@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace snprintf() with strscpy() when copying ifname into registry_par
to avoid unnecessary format specifier parsing.

Signed-off-by: Svyatoslav Nikolenko <nsvatoslav515@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/os_intfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index f31196f54b3e..dd0c5fc813c8 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -256,7 +256,7 @@ static void loadparam(struct adapter *padapter, struct net_device *pnetdev)
 
 	registry_par->enable80211d = (u8)rtw_80211d;
 
-	snprintf(registry_par->ifname, 16, "%s", ifname);
+	strscpy(registry_par->ifname, ifname, sizeof(registry_par->ifname));
 
 	registry_par->notch_filter = (u8)rtw_notch_filter;
 
-- 
2.47.3

