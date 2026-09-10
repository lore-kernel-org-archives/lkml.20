Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B37936212C
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 21:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789074900; cv=none; b=WrMkZmRhHYdL9oqHv+Bx7tBw410gyEtugMXq5N0zWR0CiEfr9UDcMabo5DCjZzqhLQYbWJMxWGEz5rLKJ0kYCKtY1coWtdJaFcz796XUyF+B/A1x/5Ai8ItfrrBCltNUgPTP2yHR5DvfmSul9uaZDVvqqopyHG7xQVSRwB1OQzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789074900; c=relaxed/simple;
	bh=4mIrQseGaDrWXOkGj+VmtS3xT3kzP+fkmkBCoKYUU7I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rtkiwDsWJmrV/z4kMyiKXg+o0oFPG94VPOzth7wIe4MTa+Edzwy4udBztrjCjoyZOxeKXWJKeXxol6l7zJS+G/UHd3lY59UCi1ThD8uy5MNbWawGpHXxfgOBP5TYlgfdZ5RO8DoSKd7Vs8IaIWUgJhf9Hs5tcH0cu3X8IovNSjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=BmtCe44l; arc=none smtp.client-ip=209.85.167.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="BmtCe44l"
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-4b28d7c729fso246038b6e.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 14:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789074884; x=1789679684; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oxj4NP1Iiq6S7QGXGCteoLSsgcXgpsaLfh9MJtp5gfo=;
        b=BmtCe44lKd4Es0fmw33kmaqs32b333/l7tIcJ+hv2+V4QBuBwvtG4hr9gm+x88F+At
         mODX9PKF5bkwgC9S5kf3jp+CUcT8aV/T2XC5jVPMXxgV2yyQ0OAQlFuaiyYEplq4n8HW
         Pje5ySQ56H5jnxewz8FYlZzsY5Iw8AcetHIPRt7x69LHG4pBH8lvPQLygMeNBypREyeI
         Q0obBapCP2ma/Q26ti1G2xS8AzeTiuaV97CJ6xk2dp7DiYxj44dAds+Op80CmV+q1gsh
         7HvI7gVSBteDIQ5p6NibskIOeGiNLbce36a82aEaTdw1bzr4VbOG9xy57kC8TG/0OCk/
         FG1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789074884; x=1789679684;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oxj4NP1Iiq6S7QGXGCteoLSsgcXgpsaLfh9MJtp5gfo=;
        b=UJ6ICxB7tMpVo8Uy4HFA3BlOb+TOU4+nbRt53o9kp2nhTlRpxzof7dV/pwP07lNCpw
         Q5pzq2eolEAbtKBuOFPwHj4dAj+MxUVrt7gtMdj4+gfh3KcQXFD6AY1Czk/uQR40qET0
         5JC4ZtMDuKqKufZpdL4038mSjEdz4Cqy12vQIGmWXrhziw8VJzYF/edGjOGyWb3dhVrO
         jo3h1yjIhb6/daDOhHM0glQHQkf3vFiOqe9Xlt2I7et2HfK80TzD0FMlSFuXjmtKN8Fd
         bZ9YuDF/mDdqK4MfCPJLwVInVqXyiqT3l4fxIGIhFne3XUHDEm9jb/OMzl/RYaYMyrzO
         OMbg==
X-Forwarded-Encrypted: i=1; AKwUvBwxoMGT/U8PqEvFFOJ6KA6JFvgcMn64dQEdSl0NTGeoU0jO6DcRKGFvyM81wN2Lnu0rqVkkCt+83rVIHSo=@vger.kernel.org
X-Gm-Message-State: AFuF++lvyEBZg02Ss9CWw540Nde/VjdS6oWieB3gpGxNJ6RJVgZPEred
	EkuSMedWpsxfGDZ3sgKxqa8vpmPjETiIePtnblZisR93aptkgWIqfJhQts1ZgmwaaYLOKgnEmdk
	bxdAS
X-Gm-Gg: AYBFou2WD19WNVFIdgpdxFE0lYCNr/aj8IKZv2bpOeH+1qzWCcj3LsiEUJHW5xkNR6K
	Av3FOITsHKhgFJYHX2zO90DI/cZIugc83ACbQ0/vfzPTu6dW8RTXrEvmkz/dMeSVPUkTEUCTuBg
	nNBHORq+dx8zMGbjgWwfR7eC7FGAI2iPa0FnhvBwNDzRcBZIAExgqn2JNTLqVl2/DZrBVgJc1qO
	cSwnXNPRsetx4G1FmIpQjZS0Qq22tFjxQ3TmHsX8DPeKKJ5B08aH9kKUl6El4PwX9fjmtX1o3zA
	VnKByf1FvOhrimji9adJ78DkCA9WY/fz8bGf6izVetWwmcNMy+crqmVH24kL6DClKXOgVV++cNF
	WC9XxWQD+gmYpcznHxOpU0D6DxB4D4I7goqZkaIdg3xskgDSiwy6dBg2VRX8s9AIqmhD6aGxJbe
	YjFBxqBNzRr5hhXdS8SO1iQk7B9QnFL9IXy4Sgd3hVOzaQA+j78mRnjh4O2tsLLaJpWMKwdbzy9
	bjC
X-Received: by 2002:a05:6808:c166:b0:48c:4c00:596a with SMTP id 5614622812f47-4c319341b39mr666976b6e.5.1789074883692;
        Thu, 10 Sep 2026 14:14:43 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:fbf1:d0da:69e0:11a0])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4c330daa42esm347315b6e.4.2026.09.10.14.14.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 14:14:43 -0700 (PDT)
From: "David Lechner (TI)" <dlechner@baylibre.com>
Date: Thu, 10 Sep 2026 16:13:07 -0500
Subject: [PATCH v3 08/10] iio: ABI: add sinc4+sinc1+pf1 filter_type
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-iio-adc-ti-ads112c14-filter-support-v3-8-e5a9b27ddb1a@baylibre.com>
References: <20260910-iio-adc-ti-ads112c14-filter-support-v3-0-e5a9b27ddb1a@baylibre.com>
In-Reply-To: <20260910-iio-adc-ti-ads112c14-filter-support-v3-0-e5a9b27ddb1a@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: Chris Hall <c-hall@ti.com>, Patrick Edwards <pedwards@ti.com>, 
 Kurt Borja <kuurtb@gmail.com>, linux-iio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, "David Lechner (TI)" <dlechner@baylibre.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=859; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=4mIrQseGaDrWXOkGj+VmtS3xT3kzP+fkmkBCoKYUU7I=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBqox2gsnyZz5eiy3zeJH6x3A/wXsvKhVqHWdGmj
 BC9k5l4DsWJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaqMdoAAKCRDCzCAB/wGP
 wA3HB/97UdmxWYF1wSRrDhaegBfjz9KItpeYC9uVju1XB8Y9G0pDaCH97QBz7qKciVFvnSWf7dc
 kZm3B/sTvc4P3ajFHohL83ZmP4luQs2hn1YrtsHSASLoMfdKF099CzY/WccG0xWDzlQBLZq1dZR
 NnR++mG1HU37fQ7hn2aJWQOc2I0dpc6WgJte0ru6DeclKw8n+y9NUcapB9gZb4pcd/H3WaWWG9i
 GXGLLJNSbZSWkOAfTZs1VBZTKCYH3uABjvYLBxuQ2T3S1Nbt/G2cJ8ehw6lkXujF3wxxaD4Jtma
 ua9W7NT7F/j9NNJ+XtQ2Gf9TGAi7Vj9802G/n0QWqBM9qo75
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Document "sinc4+sinc1+pf1" as a valid value for the filter_type
attributes (used by the ti-ads112c14 driver).

Signed-off-by: David Lechner (TI) <dlechner@baylibre.com>
---
 Documentation/ABI/testing/sysfs-bus-iio | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-iio b/Documentation/ABI/testing/sysfs-bus-iio
index a4f5595722ad..a8e1cb8e7490 100644
--- a/Documentation/ABI/testing/sysfs-bus-iio
+++ b/Documentation/ABI/testing/sysfs-bus-iio
@@ -2380,6 +2380,7 @@ Description:
 		* "sinc4+lp" - Sinc4 + Low Pass Filter.
 		* "sinc4+sinc1" - Sinc4 + averaging by 8. Low 1st conversion
 		  time.
+		* "sinc4+sinc1+pf1" - Sinc4 + Sinc1 + device specific Post Filter 1.
 		* "sinc4+rej60" - Sinc4 + 60Hz rejection.
 		* "sinc5" - The digital sinc5 filter. Excellent noise
 		  performance

-- 
2.43.0

