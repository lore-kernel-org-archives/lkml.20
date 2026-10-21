Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792627290;
	b=KvAoP1T4BJQwGo0Xzl3+Lp5+Icjrs6raa4hAEkk6lCn1/MMpBC/8RfWjNQIeKc1XNNjH
	 U10T/RUYUgpjbFvU+rOsGN5UIGUZqoVqbIN2EvAXaa0gtAyHvTXhGTS3g29XYArbiAhM/
	 WSnrsgHmHPGsoamTSXwG0jISpYP3nZ2dbzHDffA3WJhGCFlNDN/X2e+X07oKEUVh5VN/T
	 NdOivSN6ps792zqPy5+4qEm+PpWZQCLu723ermNNBFvWs49hSsaYoYah0xAw3MFYAJXJO
	 J20YH+oJRgcX02JPpn2UQZyQ9SwknSCKyK1jmGwfl2OkarwCVVlVs7tehboABSbdbmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792627290;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=qGPgAY2uzbFWVW1gwGK7OSQ0FTtWRIw5OwqDXn3zsW8=;
	b=m4ahbBvfIA8Ng9GRGgCPVKjQL7xAe4YO9UQnH5z0lL0oMd27x7aZ0cuwWlKhbcbKlAmF
	 q8bFVP+TbvEwnxqBBlsrj7qXd/UAU62mn831fFCw2ST1n8ZJBpfa4Ra4cSYaTLYgdb8sL
	 0CTque+GeTFXz+wyixX7sc3GpDrtic1Rowg3ohW7H3YKpzJRIZisdi8zGpUVu2+wC5cK3
	 DjvHsV2Z0HdT8ACxuUHoLGhn7wSAD9BuhZfR/0xHrpBpn8av1zLOmsl34zn+e77qkTHnt
	 GtAhQr04I+976Bh4fHzg9iLfJcI/eD9qdVN6GmK8yrfzC7N051JwDFJ4aaBBjy/mLxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=WIFND+kT;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A390860A3803
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 00:01:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A390860A3803
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=WIFND+kT
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-3282db206d3so3012092eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 17:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792627289; x=1793232089; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qGPgAY2uzbFWVW1gwGK7OSQ0FTtWRIw5OwqDXn3zsW8=;
        b=WIFND+kTBwBCsBYJNd1wpQLhBQ+sITxmOuOQV6VZxXbnAKapDVGgjeSp26Q37/WxrX
         CupVn8dGVWLQLfysitFEgwtRNtjR/s1eV/liJOqQVF69QLg8Yum64TcWI1pFs2S7yAUy
         ogArNfoZMqceGQfsV5l+PUi6SDdOX+qgbIvYI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792627289; x=1793232089;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qGPgAY2uzbFWVW1gwGK7OSQ0FTtWRIw5OwqDXn3zsW8=;
        b=J4LnC3eoKGIEDBwEkaaIk5LYMg8jOAit+294r4FxtzUsvrylC2dVcjveJJNyvEtXIu
         TEO/PbNOpYdEgV3lYAgRMofkrtsmUF/yh42XWa4qHHEdS2sZuIE6sLvsi07ZUuGoo0hN
         mLfPbKNhjuMewpvwy3+rupbwzQfqv8i75oTPhe0SLrc4+BUZE5PWwBbnGhSUk6ZZ5/iE
         7GZzvO/PiEFV3p3bduWWQAO57jD2Vke0FBA8Fu7WpG54U+eviNYThNjumMx/y1ygaAHG
         mczdDu5GHYBLsE9SffGQusLsMbofRpCirFaCUurg6N6qVaP26iSinIoh/nq38J0WHodT
         ZeGQ==
X-Forwarded-Encrypted: i=1; AKwUvBxkR0YrS9EpSvEZUWlXbETpv2YWfriTsLPlsgb9ks+hPiVIG8qjqKPQMZ0V/IqkWcUK5jJ8RkyzT1G+DT8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIkKNw/0WzcBHSJY8yLpTTk2NdFoey/Qew3ESe1uoYhWEFLMfp9
	muAmZvgUmHqV5N0SSMz4nT9tISpIXZyVALM5OCl8hvOJMEi7O3S+SSqZ1Y/CETz86Q==
X-Gm-Gg: AYBFou0MH2RPG7mNceFdzc0dNqprtwxW6wDKfLgmhwLJRzGf433AWc6ZqHePGlX/sMq
	0kUNoh0xVgcvbymykQg73z2VdrEvmxTeABq2W4Qkcdj7eJ28l35Fzrl0ScbPmkhIg4Vj1SHakpi
	APmLCHzfG9Mj/pV1obDjUJGeSUr4P7fYq1BrzFyjCzPmErmCIh6/MHYjdPFaiQiOP015T2gXlP7
	4d0WwraVkiVlw39olClZFiGv/ObQCpjtgvBGTTufebI0EauOodb6gJjONrqnGg3L8pqLVdO31ND
	C4rM32VhpRB2Il2NpXchBCY1cHDAw5JhuTj/MFlbaTKu1ZTtraMJ5/JQXCsCL5706NzQA55UmX0
	W7LO6k6RkfJ989IpM1JBfZiPreDIpjLuDW0gADHxC/wkRPRoU55JwhEZAtVUXk+KJ0krBcujnQK
	YYC3K+OUSd5zQnKtocw2HJ0tuMiDaUXhes3eY5I8vchrsM/v6yS6iPunHDf5YHjHiuJ/2bXkgy5
	NX0W2n/vqZ1EEH+zoQq1FGU34ZnjYBEeiOEe/A3om1EZfxh91KcY9E/4z4DJdujnCXmmRMcrnhm
	lrFoTjr5zex50SWJKOk=
X-Received: by 2002:a05:693c:8092:b0:368:2548:c08b with SMTP id 5a478bee46e88-368255807aemr2585617eec.21.1792627288539;
        Wed, 21 Oct 2026 17:01:28 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:14ab:bfeb:ac88:458f])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-36740cc848fsm10850448eec.13.2026.10.21.17.01.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 17:01:27 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: Jonathan Cameron <jic23@kernel.org>
Cc: =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>,
	linux-pm@vger.kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	linux-iio@vger.kernel.org,
	Brian Norris <briannorris@chromium.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 08/17] iio: chemical: atlas-sensor: Discard pm_runtime_put_autosuspend() return values
Date: Wed, 21 Oct 2026 16:57:09 -0700
Message-ID: <20261021165858.v2.8.I55d76837b3feb481080e43d358375445ca0993c6@changeid>
X-Mailer: git-send-email 2.56.0.218.g1ec904b173-goog
In-Reply-To: <20261021235818.3059519-1-briannorris@chromium.org>
References: <20261021235818.3059519-1-briannorris@chromium.org>
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
Content-Transfer-Encoding: 8bit

The atlas-sensor driver propagates the return value of
pm_runtime_put_autosuspend(), which is not particularly useful.

Returning an error code from pm_runtime_put_autosuspend() merely means
that it has not queued up a timer or work item to check whether or not
the device can be suspended and there are many perfectly valid
situations in which that can happen, like after writing "on" to the
device's runtime PM "control" attribute in sysfs for one example.

For this reason, modify this driver to simply discard the
pm_runtime_put_autosuspend() return value.

This will facilitate a planned change of the
pm_runtime_put_autosuspend() return type to void in the future, similar
to commit 3afd8df02433 ("PM: runtime: Change pm_runtime_put() return
type to void").

Signed-off-by: Brian Norris <briannorris@chromium.org>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---

Changes in v2:
 * Split iio patch into per-driver patches

 drivers/iio/chemical/atlas-sensor.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/iio/chemical/atlas-sensor.c b/drivers/iio/chemical/atlas-sensor.c
index 1d4a9919df1a..48598475512f 100644
--- a/drivers/iio/chemical/atlas-sensor.c
+++ b/drivers/iio/chemical/atlas-sensor.c
@@ -426,9 +426,7 @@ static int atlas_buffer_predisable(struct iio_dev *indio_dev)
 	if (ret)
 		return ret;
 
-	ret = pm_runtime_put_autosuspend(&data->client->dev);
-	if (ret)
-		return ret;
+	pm_runtime_put_autosuspend(&data->client->dev);
 
 	return 0;
 }
-- 
2.56.0.218.g1ec904b173-goog

