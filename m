Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793048232;
	b=NlbIMNVu+Ab7YXDcT5UIf0UblS0iuEN+XBdCfADkRXSaW9ExzRmiNPb49S9jaQdCYTHw
	 KqFHxQSpHDDrwwBdj0GRjEciLgMQxvCyBDZ2GnpArr4YpxHGY+M6ZKuQwAPJA44haDxVL
	 GFqwH7j5u8HahrA5WcWu+6UHbcatW+pXf+1FRb4g6RSSTHtjoLzrgQyAuCZpsilwpDhdh
	 EbS8/8IhPHNDXqm/CZgy6NwRoSICCldPv4diyRg+huLPKFY9DVnquWPNOwRWmY4OnP6C2
	 MA1HLFMuvgrGM9U366Rd5hx5wEK6AiwdLG5/EUq9lZI/UC6+vj7FURehkV+Wpuxwmog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793048232;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=s299POfyzmrQX1i/IaTXeUG1mmAHpsaqzKPXCh90kkQ=;
	b=DQFrRHhgmqex22tpzMcdo8Omq5NuMxOuvHe7p5FzkbXIKgQT2tB1b7cB6IcB8pLiH6Qa
	 6jzjW+WjSYfdvnledRizL0tnfh4vlyMHeO8GPWz9WmPWvSDdessqRILUsV6fojUYvXGlR
	 jYtp64ZekI6QBk6eOM3vxal5RRVq+VKV4smxxCo+WJBAIuseUgpYefKA6GAJootDVxhtU
	 csV2MpsgcBIZVdTrbl7IDq0KwczvkdzhcHP+AA0Y1giSWIgo343+wG8Uig2v+ni5189g2
	 iww1VVwqE0ocet8upJNfiH8LnledtMot3QBUVuWaZOy7gl1khcGt0XgPAwYnEuVyFkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=iRGTPN0k;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F10C606A325
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 20:57:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F10C606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=iRGTPN0k
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso17014265e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 13:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793048231; x=1793653031; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s299POfyzmrQX1i/IaTXeUG1mmAHpsaqzKPXCh90kkQ=;
        b=iRGTPN0ksHCtDg0lyoI6ZsqiqCLjOCO7/A2bb7q+DMMr+00o89Ncs8lDd0QAsJ6Cq1
         SbKGhZU4Dc05Z4zbE2yAnKHp7JyGPXMiGbTdMy0pSsaeHeRGZI/ZA0QwNg+Q0AnxdCOz
         ivxphwFwhGFqVnIvs/K9LqOZskCaFkIyWDE5YmUHFM7KWkuazY2xhfkV8SdT8/oQoDcW
         nR6WSzrNktQ+6sukE/Bh3KmILIDBeU3M6tpR7wMqUpjYJTGKs4iRfVph1CxzUa+0KZHu
         gE00b07FjrhEJBGkSVAuNpB9j7b3H2ZW9rE55ezIqGGwaGQnXs8zxA7ITqhDtAbaCK82
         1u/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793048231; x=1793653031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=s299POfyzmrQX1i/IaTXeUG1mmAHpsaqzKPXCh90kkQ=;
        b=JPWQFqP/F2CGYmESb+joOcS7Rg+qxeonvG/N+ZlXuctn0qGJ+zJKK6HQzIcymPTFks
         4BTotWNuHy3H0gIeYduNlTY8luLVuK03eA9Rto/TIe2Hr7FXfI7BgQEA60Pr90KB/qmL
         2tXyxMz+ig0I2S/5l/qNv2Ba8kQBUOQfHGjaAaRw5NzWsSI0NExYStZ6YhqTfWtbS7S0
         XCT5coT3V6zekjj3sbwdqqjEQ9C7xWcacjOcJbxlgmZCvTyflWH0JmXlwPEJRt/j4VgQ
         UrJUET1Nyuqr+oFZ5qHummhfTHJC4DQSuguGnIX/u9MC+ZRS9otO9QrqI3MHOhkQhR9i
         g7YA==
X-Forwarded-Encrypted: i=1; AKwUvBygnNXOgFhhbPqaV418+hVspYbmCK3HojX6V5pEpufrP9PG2aeTzauVL+Z+OF+VRJxB44Z8tP//RwrOHCo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJuiqqkrCGRE1fDLVGtbBfbLxifwqnvXB4sXF7bWi6ixFceHeju
	uOX6UwNADVQHFXkowGhd2zOgdO+lgPVcgqDEhNJbcLQe8SkAzOQvCLrb
X-Gm-Gg: AYBFou1LdwkkuINqa+F82pR4kCYD73lmm7eXOr+pXTIkKFk7qhwCN4TeUZMMrAgr4r1
	PPTHfmxU7nRQil1XqmE+w/5hFFftalc2wpAuzoKqekYf4zbytO+EghAgpAiog2cI+kbiX5BOF/l
	jZPcp0XzQwdNjH/nSvR2VzTE7CuEbwYrXZEVRBnRvfWHnxutGWu0ResifFvXZBrhz///xt/+nIh
	PrIAF8tIfRuWu6lz2EBuvbvvnhHQsau+54qXaKQd6rvUY3ckbIoT/FaP3eJShUq6g1xqhQoqUUw
	5kXeFOqE8Q3ENNvNGoaylfTw6PMGICZb8ljbXFsI8HS5/gzrVCU3fh8rpevEtEnKpLCrT3s4H9p
	VwrVEbpNNAlMljfOxHQbOEP7lbRTSzydGoFnqSx1ObOU9IHXYHRuJhTuZldreefHR0vVco2R3KA
	E0l7syvib3sI8W6kMegeRW/bDAiZ+OuVB+1K0j7rccYsWBqLyBk0yH08t4B0VAMTAYqqMN1lDHn
	Xa/EK3is9jmDkce05YyWWJMXFhupNj1u+bSycZdl48LyGgY/WVwix0g
X-Received: by 2002:a05:600c:8518:b0:4a1:a49e:a925 with SMTP id 5b1f17b1804b1-4a35acebf0bmr155156235e9.35.1793048230602;
        Mon, 26 Oct 2026 13:57:10 -0700 (PDT)
Received: from pop-os.. ([87.248.177.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a029332sm193725085e9.4.2026.10.26.13.57.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 13:57:10 -0700 (PDT)
From: Albu Victor-Marian <albu.victor.m@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>,
	Albu Victor-Marian <albu.victor.m@gmail.com>
Subject: [PATCH 1/3] staging: rtl8723bs: convert rate and mode check macros to inline
Date: Mon, 26 Oct 2026 22:56:57 +0200
Message-ID: <20261026205659.181065-2-albu.victor.m@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261026205659.181065-1-albu.victor.m@gmail.com>
References: <20261026205659.181065-1-albu.victor.m@gmail.com>
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

Convert IS_HT_RATE(), IS_CCK_RATE(), IS_OFDM_RATE() and is_legacy_only()
to static inline functions.

No functional change intended.

Compile tested only.

Signed-off-by: Albu Victor-Marian <albu.victor.m@gmail.com>
---
 drivers/staging/rtl8723bs/include/ieee80211.h | 21 +++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/ieee80211.h b/drivers/staging/rtl8723bs/include/ieee80211.h
index 9767013887af..9741daef3b87 100644
--- a/drivers/staging/rtl8723bs/include/ieee80211.h
+++ b/drivers/staging/rtl8723bs/include/ieee80211.h
@@ -152,7 +152,10 @@ enum network_type {
 
 #define SUPPORTED_24G_NETTYPE_MSK (WIRELESS_11B | WIRELESS_11G | WIRELESS_11_24N)
 
-#define is_legacy_only(net_type)  ((net_type) == ((net_type) & (WIRELESS_11BG)))
+static inline bool is_legacy_only(uint net_type)
+{
+	return net_type == (net_type & WIRELESS_11BG);
+}
 
 #define is_supported_24g(net_type) ((net_type) & SUPPORTED_24G_NETTYPE_MSK ? true : false)
 
@@ -392,10 +395,20 @@ enum {
 	MGN_UNKNOWN
 };
 
-#define IS_HT_RATE(_rate)				(_rate >= MGN_MCS0 && _rate <= MGN_MCS31)
-#define IS_CCK_RATE(_rate)				(_rate == MGN_1M || _rate == MGN_2M || _rate == MGN_5_5M || _rate == MGN_11M)
-#define IS_OFDM_RATE(_rate)				(_rate >= MGN_6M && _rate <= MGN_54M  && _rate != MGN_11M)
+static inline bool IS_HT_RATE(uint rate)
+{
+	return rate >= MGN_MCS0 && rate <= MGN_MCS7;
+}
 
+static inline bool IS_CCK_RATE(uint rate)
+{
+	return rate == MGN_1M || rate == MGN_2M || rate == MGN_5_5M || rate == MGN_11M;
+}
+
+static inline bool IS_OFDM_RATE(uint rate)
+{
+	return rate >= MGN_6M && rate <= MGN_54M  && rate != MGN_11M;
+}
 
 /* NOTE: This data is for statistical purposes; not all hardware provides this
  *       information for frames received.  Not setting these will not cause
-- 
2.43.0

