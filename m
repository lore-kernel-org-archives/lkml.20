Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D4F4424D57
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787750595; cv=none; b=uS+sZ5n4vNCR9i2pZqHsslArZweQX8k6f4PKBj9UNP2T3MgtTxDAdk4m1Z2GOi/eW/OZ8FPHcIqVBmv3my1ZKdSAVFrICnxzjvdmO73F8Qy8WPtbMLEHjjFhFoyLI7o/WyJ1UGQAg4oDRzdvNAgfaFJWA4e3UHeix3Qr0r47x2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787750595; c=relaxed/simple;
	bh=s55Ii6QEsvGG1AvHe17eNCXjO9Ihg5gS51wo2byNVTg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kneMo8B3xDicnAXmuxY+uFYgeHYsLVFW8ISBTrUbmSg3N8L9oZyXVHtt8557oxzh+Kvwv5yuX0BQd7IcBEuJsCXmJyzoILIdruxwOmzOhIPKOFDwCpXX5zXaUbGJR3SZHsrpM0/QQlZzAcc3j/1tx7qIycnBbVGgtK8cH8m6pgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ibTRWEMp; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ibTRWEMp"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6a051904222so892697a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 06:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787750590; x=1788355390; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+2BPxcfXD6mUVU6jhTybUN7wv/xdZ8rSO2UHVcgmlHg=;
        b=ibTRWEMplCUYvirEHALzbkzArGsObDxC7qYscA6PUXLkRcklRGl/JsPqst1HZtc7Vl
         EwP8KIK2qvjAo4r1ZpIloqRaNok3qJyH9iLEok8cSEzpu99ymOgUYl71zWeI/CUy0zO0
         ignqj5FqtcUx9IPSyJ51TMXZyhBe1mt/9cLpykpGHFHRtubZuaKd5eRbHi5FNhfN7w+g
         AYUeJRvLl1SpAct7BziyOyNUfFWhmJ05d4UYzHGcZmvm142SjI6sWge1//T8iyCWHfWE
         WEaczTGPwwewXJmYechX2oxxxTU6rVSrs/ij3CcwVV78j4NxNF0xfd1yNB7CTw+C/BQp
         TuRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787750590; x=1788355390;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+2BPxcfXD6mUVU6jhTybUN7wv/xdZ8rSO2UHVcgmlHg=;
        b=eXzWLNuuWMorCGBLcmYwc0fMSIFKc8P8DuJN55HSq2bO7fWYE4RlUbyRcgmXSw6zia
         bKYQOnXj7sT8fhNS+ZEZemc8w60pnXqoDZBvfPvE9ZAYLtVK+JAxjuMlSd0XM7Z8nI3K
         L/cPA7pwwV78ZVZJgShQKU65GVSW20775EHEtDEMv5fUGXK4kYTG4YjfmdO3f/UfKZ5x
         vv8CVjB1pPqcrYiiU5GhfW2bmrR9teARfw/k3YJatrfzz5UBaXf9C9ryyg64hJWtD8ZV
         U8qXAENTU6Tv4asXcepdwbK0kv6dkFm/Dwsdebq/wtDVNGrgDQFkITvKqvAFAwL67M+s
         k82w==
X-Forwarded-Encrypted: i=1; AHgh+RoO+Zhov2pZQOjRIK1bDIyXPyOb0FrZlYSNgKHVvQGyyKG4v4nspBFFHXafgxtnkwlHhnYtFyzJfNtMb2U=@vger.kernel.org
X-Gm-Message-State: AFuF++mC8F582q8ecgB674GJrdiu02jgUxzEUC1YLagHDgFRuOBL7Vmu
	Ei5fMBC58YY2JkOirrEkm/J2JUMiqTY84d/S9RwZc+SSguHFmLGIcRTKaqsVeP21
X-Gm-Gg: AR+sD10qoy4XKXBPz7hAA9ocT0JmIXA+75+KSWaHFGq8rHyo3dJdO9M6rNhPCxhRCN3
	S37ISAQWXMnG1Ubcwezu62Uo+CRLUIoWJ7qia8mE6BUixMmMoqkgrmZ3np8Efxr+Fy7M1IXSw+G
	QIvE7cIX1Zc8DX4QWyG4kFM9u6Yh2FHWtjiaFTGlGNUY677ZdVQbLOs93kPpO1/hcBdUAV9PMEv
	IMD3yctgUtHRl5innTmB19DKU+m7dvU3Y9zzU9EHjuCDzuOzRtlTcaDQfPFXIg2W0yYcp34HULg
	N12SWFltnv1wqyv1sfxYGDt+2e55Q7+b/qiF3ZW7rnTAQjAFaskAY6q6FkWRlPkRrisgNewg/42
	AA9no0eDaRFAiVDw/+38ZziuKtuD2D7NuNs3hq66wEa54YhP4UZZhcxR88pgfjYrLJPnCpQ3C+f
	KT6L7shVXwopEuEuaFwc1JleQUK6jcMSpKAm7OyT24qvRDeclYatzDYoa1PXG4XyjRt8J5rUDYu
	j8FTZI9FOGBqmFM5gQWCewd6+E7EeIB2BNY3u5jdUqKhlnQqHYnLg==
X-Received: by 2002:a05:6402:21c6:b0:6a5:7aad:e75c with SMTP id 4fb4d7f45d1cf-6a5df61e239mr8437572a12.6.1787750590242;
        Wed, 26 Aug 2026 06:23:10 -0700 (PDT)
Received: from 1Z10 ([37.163.238.51])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a5dea83a30sm3633147a12.15.2026.08.26.06.23.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 06:23:09 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jose Maria Martin <jmmartinf@hotmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [PATCH 3/8] media: intel: ipu-bridge: Add Yoga Book camera sensors
Date: Wed, 26 Aug 2026 15:22:51 +0200
Message-ID: <20260826132256.3343451-4-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260826132256.3343451-1-mauriziocasciano7@gmail.com>
References: <20260826132256.3343451-1-mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Yoga Book YB1-X91 uses INT3477 for its OV8858 rear sensor and
OVTI2740 for its OV2740 front sensor. Add link frequencies consumed by
the sensor drivers when the IPU bridge constructs software endpoints.

This supplies endpoint data only; it does not establish that either
sensor can stream on the Yoga Book hardware.

Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
Assisted-by: Codex:gpt-5.6-sol sparse
---
 drivers/media/pci/intel/ipu-bridge.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 1bb3a3e98d6b..47317c423fad 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -65,6 +65,8 @@ static const struct ipu_sensor_config ipu_supported_sensors[] = {
 	IPU_SENSOR_CONFIG("INT33F0", 1, 384000000),
 	/* Omnivision OV2740 */
 	IPU_SENSOR_CONFIG("INT3474", 1, 180000000),
+	/* Omnivision OV8858 */
+	IPU_SENSOR_CONFIG("INT3477", 1, 360000000),
 	/* Omnivision OV5670 */
 	IPU_SENSOR_CONFIG("INT3479", 1, 422400000),
 	/* Omnivision OV8865 */
@@ -93,6 +95,8 @@ static const struct ipu_sensor_config ipu_supported_sensors[] = {
 	IPU_SENSOR_CONFIG("OVTIDB10", 1, 560000000),
 	/* Omnivision OV2680 */
 	IPU_SENSOR_CONFIG("OVTI2680", 1, 331200000),
+	/* Omnivision OV2740 */
+	IPU_SENSOR_CONFIG("OVTI2740", 1, 360000000),
 	/* Omnivision OV5675 */
 	IPU_SENSOR_CONFIG("OVTI5675", 1, 450000000),
 	/* Omnivision OV8856 */
-- 
2.53.0

