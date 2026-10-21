Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792627300;
	b=4lbFVfgAgXglfl/Pqsj8ZCsJ1civEQx9zWN4bQA0hhh23as/xCJ8+j7ydzM27L2FAUTh
	 gcRCevokKSEnG5ZDNNfBTKhyGhSE1BFMpuGxRvgqwj6e718FCAX0tlERR4RLZO1esHAEo
	 4XSvuNU7g0S3Jm4HY2jws+scK96mvbuUASKuBE8q1JWVxyjUuO8hEMQTrunLZIMfLbjwZ
	 Qm5bN4YzKgSwl2LzfDhbylX49GGMtB6roL88f5N0bef5KBHj8uBVo7fOxqeI66xFsvubd
	 pu5erd1WsBMXAdfLMcshtQYxqUqun/F6l+0Xs7kCMW4VI3kx6I9JYM+P0+WwBRS/uMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792627300;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=/GMv02swmZTGafXC+zgXG/S425qXp9I+QwglxrC5H34=;
	b=DXSnX9AlDV4yRh6zV2BlIkzpdlxLJ+aPy7QWUJrbx/gIC0KNxPhFNQBE3ghIFfL4yGAV
	 po1UoiIMVtdSFj1/PyHYXRp+nIyxDh/Dp8gaC/VHJvOV+Iu3S6ImU3kVMNAnMRORcbqAA
	 5qvKjrIaG5YzHjHmwdCqfgAUsbsh8AnEOKz/GJMTcsSDsd6vzlrE8KDUZctT0/UfWOJ7L
	 UE2fsOx9vbj/f9EMHNBmxBf2kzRaltlZNXDxkE6b9giRyjsAT8zh9eF03YScTu7deGWBQ
	 U5UkPECdk2MYBPoHLmZ6jgUKHddJzCNZKXGdgiMX+fBGxcqS0Tyi2URtflQHdYrgk3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=MWkMTRS8;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0405160A4AC3
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 00:01:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0405160A4AC3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=MWkMTRS8
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-33fb4680717so3160253eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 17:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792627299; x=1793232099; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/GMv02swmZTGafXC+zgXG/S425qXp9I+QwglxrC5H34=;
        b=MWkMTRS8ZhEtf2LO+YZAG/BGXXBLmrdQVgMsI4F2HXEMzbhWeBHLHQYi4y/LMBdAuE
         t+X+1E1LrDwxZnfXFjOrXD3Q8p6k2ll3d8KnpEKtfzaAW2Zfq9I5BEq7b0l1Uju77Edd
         AqUGcdg3o+3Ffgl0cv8pZlA2yuCobNDyh8PuE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792627299; x=1793232099;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/GMv02swmZTGafXC+zgXG/S425qXp9I+QwglxrC5H34=;
        b=kUGJER67nR1rYEKo5bR/gaeSliVL9q3/84wbkRy5SIk/JzGSidSgXS4uNegN3ZSdaX
         Hdea6wRxCKDFEr+BPkA7nc0l83XA3UsRg53v42iAtuFF1jH3ss9TmDeeFKSXN9WgpL1+
         RohvF2cGp/NoZ66UIYMruuvZRcF/eR+AYHTpCqRSaAZXyIE+XvmgECu0s7eKfa+33Vpv
         wMS9om3PgsPIgNk8WsSChnzQzEenu6ThE7moMS86dfYWN+j9mTOHhxRqbD/Gc91EPSPG
         oMoteZuSoC+pDMew0Nx2jY/iSIOkD5W4FuZA7HJdxZ2OXZ9Bd8vk48f8BCRwBKlEgf+W
         9XJQ==
X-Forwarded-Encrypted: i=1; AKwUvByf8c2y0IiVjSHX8csWQlvwe9hz6ETCbG5u6Brv0aJuKdzHY17By0zFFPVwx/RPcwJSzE36DfCL3poWBVQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIofSxMDtRrVTcbmGoNzAbjEVG0kf0SUvyouoTHSz4DyCmlJoHQ
	PvAZNHobWlZljAQk6Qfdc9K+zmSnqVlmAb5MNNImxui/SzOcyzxmcKLV9GPODdXL1w==
X-Gm-Gg: AYBFou01jdpD2VL2JBcHNubU8GSWK8cJQcolNsWxY+iWxM1KuBTHvDZIzJBKGTlWfen
	zmo2p6PP7+QIgRrs6FB+t6axTq/kl0OknmDxLP0D/NrMjDYvR5KplR8Rl9vK9i5rLK2RSqn7J7B
	QHyOFGIl3YrfXakLKKaJ9QmO1gTdvVGagoYvgzLS8i4Pf8hweXDPgHTN9f0u3EhYsE9abZSWK0Q
	fq6ClPJxbqi2aWpDFheMo3v9oUOJQNJ4+i/ljNbzPgjWtR+xba0ZjPQQDBfA8A4RkLZ01nOI79J
	i9cQXLV20gha6/zWz/reGIdbZPCUEizmif2WMnwbw1mQ49jrOYBGgP3O/2+8hbmvtSI6mAKKfw/
	ogf6D8XFu2VIpKSWqEKd7l4tDkQAG573b8DLonBM3nj7zcY4j+B8TAyiSKEJnGPKL29i6m7QAVE
	ajYaNpCMdT1I4GsnqQllIWSIy/wwRDtr3IpQ7TRaRMGx+7Pt6Ft7dLYUyVE6A9/3AC2sSrt08iN
	vyBH9v3EJTBtEqENn9r839ESdgOrfhkWgo7IZ+KwfkZ51oKkSkGyssYZFvuchK1PnFbid6V1YKt
	IRE5Ia9iqwU/7WZTo00=
X-Received: by 2002:a05:693c:62d2:b0:351:13b4:9c59 with SMTP id 5a478bee46e88-3674a40e089mr4985582eec.2.1792627298780;
        Wed, 21 Oct 2026 17:01:38 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:14ab:bfeb:ac88:458f])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-368ee692656sm909622eec.28.2026.10.21.17.01.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 17:01:37 -0700 (PDT)
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
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 12/17] iio: imu: kmx61: Discard pm_runtime_put_autosuspend() return values
Date: Wed, 21 Oct 2026 16:57:13 -0700
Message-ID: <20261021165858.v2.12.Ibb6be74faca4446a1147537fa1a82bb6b9d5c580@changeid>
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

The kmx61 driver propagates the return value of
pm_runtime_put_autosuspend(), which is not particularly useful.

Returning an error code from pm_runtime_put_autosuspend() merely means
that it has not queued up a timer or work item to check whether or not
the device can be suspended and there are many perfectly valid
situations in which that can happen, like after writing "on" to the
device's runtime PM "control" attribute in sysfs for one example.

For this reason, modify this driver to simply discard the
pm_runtime_put_autosuspend() return value.

Note: kmx61_set_power_state() is a possible inlining candidate, but it
performs some non-trivial logic on the {acc,mag}_ps fields, so I leave
it alone.

This will facilitate a planned change of the
pm_runtime_put_autosuspend() return type to void in the future, similar
to commit 3afd8df02433 ("PM: runtime: Change pm_runtime_put() return
type to void").

Signed-off-by: Brian Norris <briannorris@chromium.org>
---

Changes in v2:
 * Split iio patch into per-driver patches

 drivers/iio/imu/kmx61.c | 25 ++++++++++---------------
 1 file changed, 10 insertions(+), 15 deletions(-)

diff --git a/drivers/iio/imu/kmx61.c b/drivers/iio/imu/kmx61.c
index a4962b88ef58..9d626882adb0 100644
--- a/drivers/iio/imu/kmx61.c
+++ b/drivers/iio/imu/kmx61.c
@@ -747,16 +747,15 @@ static int kmx61_set_power_state(struct kmx61_data *data, bool on, u8 device)
 		data->mag_ps = on;
 	}
 
-	if (on)
+	if (on) {
 		ret = pm_runtime_resume_and_get(&data->client->dev);
-	else
-		ret = pm_runtime_put_autosuspend(&data->client->dev);
-	if (ret < 0) {
-		dev_err(&data->client->dev,
-			"Failed: kmx61_set_power_state for %d, ret %d\n",
-			on, ret);
-
-		return ret;
+		if (ret < 0) {
+			dev_err(&data->client->dev,
+				"%s: failed to resume: %d\n", __func__, ret);
+			return ret;
+		}
+	} else {
+		pm_runtime_put_autosuspend(&data->client->dev);
 	}
 #endif
 	return 0;
@@ -801,15 +800,11 @@ static int kmx61_read_raw(struct iio_dev *indio_dev,
 			return ret;
 
 		ret = kmx61_read_measurement(data, base_reg, chan->scan_index);
-		if (ret < 0) {
-			kmx61_set_power_state(data, false, chan->address);
+		kmx61_set_power_state(data, false, chan->address);
+		if (ret < 0)
 			return ret;
-		}
 		*val = sign_extend32(ret >> chan->scan_type.shift,
 				     chan->scan_type.realbits - 1);
-		ret = kmx61_set_power_state(data, false, chan->address);
-		if (ret)
-			return ret;
 		return IIO_VAL_INT;
 	}
 	case IIO_CHAN_INFO_SCALE:
-- 
2.56.0.218.g1ec904b173-goog

