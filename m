Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793156391;
	b=Q9DERFAg1rxtx7UFZhr6FT/V/x7V1YonV/S1ypbMwhk3Tc57w7WcShEAdJZo4xEJsJZ5
	 xQjAg2FiX/b+efElnRWdQiB2xiDPt8wmn77WRJRBpD++lyag5A1SW6Fo8B0uL8w3A/W2s
	 6R8Dk1/TJERJE1USmMvhUMyslpDkDdKNtM7DBUS0pYArMzT97kL2P/8k8zc+AMJf/1eoe
	 NEcLNU5i9f1lsLXtpVWaNVbHT1IglfZ566aZmgpy/gkUBux9JfQAvqXwFAbin4Y5ZHdhi
	 VaE0Q+2KYQ4RlA+QJaS2h7G6bpGzh60ZLaLROIHvYiDCqLI2q4K5PFSv2BxyUHPw0oA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793156391;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=zmhLt1fcIW49TsxftipVDOrL5MaEf1i51ozTS3vuQE0=;
	b=GqgtrE0M/XAfiQsJRG/VFZ0+ByuOZd1UbFf45uG0ERfm7GZJZNR5NfqgAC6HHiRqnd6Q
	 A9Go1HJSBquOjcmIvPDgwNEfb/kcKSwUKjryBvMr47zS9+6heGeUOrAZOsXiePs7mqYQy
	 kXH7nwHE1sUWBFV4f88b6U/Og4zaWBRenKnxKi4xr78EsdNPo3MZz0r3eEEgSaICB7S9j
	 NfXK3w92BGoFXlOhasg2g9ZqHS1b30XZ0mckAakNY7LEIITeuGg8AKQCfbf1lrOE77ROM
	 0AEDFDJRfK8idm/IRxhb2LpmsFv6BPwwfZ05qSk/n13oVpGB+D4GHvrEtSVFfEsg3Gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tiXxZ5B2;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A63606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 02:59:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81A63606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tiXxZ5B2
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-36a17a332ecso650427eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 19:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793156390; x=1793761190; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zmhLt1fcIW49TsxftipVDOrL5MaEf1i51ozTS3vuQE0=;
        b=tiXxZ5B23CrDdxwaxzsxnGEx/Tmy+ieUOR5s3xjD47whazeW89JHVTusEC3WEyH3sH
         sDVk/oaCL0wMEI25vEUyDqxLEGKyk2I+ox1vbPuaiMB6FEGn4xWsfPEfGrtIFkH4AJl1
         4DQrTs7V83Z9e+MtmJQGvhT5q5OpIoQTwhoAyqeOx+HDaixt5Cmr+3oLxYm06nVeVh6D
         x6MnAVJ9wJdA6pfjTd2ixEaxL40VpD04BiUPh9KynHYksDjwcia6elBYNQPLous61f4r
         kKISIi/84w/YC6qThME4mO6oKSbkMRzjkcGDbma0TSbjB9VNaWZVPciibd7ffMXdNS6y
         YWeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793156390; x=1793761190;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=zmhLt1fcIW49TsxftipVDOrL5MaEf1i51ozTS3vuQE0=;
        b=x31ApDwYu5f3I2CrWPhOD8reaq5aBLQL8yG3NdKnmjr5BcOpNK70mlGWnj493F/Hw9
         MXlMCdXGk7+9tDnMry+ADUn9HqMgWJ1uyxCa0Pt6JV6BnBlt+lwJUDrJD85zcVIiFVld
         XUzgbtmGcBMwNjpVE82zuNwYD001jyBvC6nH2IPlJPZPO/H/LDwSYZCyKdhTkHFwJAyP
         dqZ/BipY5TWK+KLfBXuIRIQL+48q6gZupNjjXMt1hhbQ6e3juNsrvuFSO5oTwSUcV0uS
         BP/RqqZsH3iqqcYuBF3FhbL8k/01deOpJGw3cfLaEHkFuxKBOwun1jlOagv1ceYCSIoX
         dL8Q==
X-Forwarded-Encrypted: i=1; AKwUvBwiRj+vVHLlNyhuH5RQMv5nMxe0RHjjk2NuZ1wqaHgcufSrz6APyupi2ARTnLA6KNB1mIqMV2cKIcMYSBc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIGtaLDC1TWnOiim2myzcFLo7t6pyBeiNYjUOA4dIddCQ3HOD7P
	bPMkCRPIoWLcjXd7qh1PzvBWHPS1ylrMX6h89o92EOJxsrxlEt54o9di
X-Gm-Gg: AYBFou1nOc11H595nCUZLD7D0kStl9JepDhNFAfN86GLJhpa1Smf7zFs+f00SFULsrh
	ESn+o6AOiT/OaPDxnDTTauoYx0bdmMAzdbWG457xv37eeTLfSH7k9BVFPQB92FoTMxaopOtY42r
	6+Fvt+MWLx8ayYYRshETwJsEWpdA40agfm1JdUZvMAYndo7tPdfdyU21kqqdUye1sybskX+FkFS
	SSlCK5GXSNDBFjBjQVRXlezBO2vYO0IWG4zZwsYL3K1j27fC4fy52hjTGYbCvGRBIo4Ef2TPUvm
	/6MzIVyzdLROwXlXEUhoI9yduB8Rib/T0vtk0SHnEoSBiIl3YjhVioqYrzo/eCoB0Y50zE1vEeL
	nx60pPjlj231U/eWcaxDddbsTNNe1Www9ahIbdXbd9/aDSU/lNzSaeCe3XXYktQ+27AmmPIWv2W
	VxIMA64YKZK3iGeHqvlf6RALZa1CP3tNaQxhp7U5/SjRdZK9hreUWd4+95YwP2HN75/TXqkVL6o
	Z1T3Pae9BDONSL0TW1w1iybkn7SZgHHCvMmRcqpiS9sWalxhpqtsGaimgcWGBt6ZYzwW1M+r6Hm
	A5koOsinAkje4HOFDJ6j2arKiMA=
X-Received: by 2002:a05:7300:c88:b0:369:eec1:1d7e with SMTP id 5a478bee46e88-36a2011245fmr2678360eec.11.1793156389380;
        Tue, 27 Oct 2026 19:59:49 -0700 (PDT)
Received: from [127.0.1.1] ([2406:da16:4ab:8700:3d3b:2065:9087:3429])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a237bddb7sm1377850eec.3.2026.10.27.19.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 19:59:49 -0700 (PDT)
From: Liu Yufei <lyf98405@gmail.com>
Date: Wed, 28 Oct 2026 10:59:26 +0800
Subject: [PATCH] iio: imu: bmi270: fix zero timestamp in triggered buffer
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261028-bmi270-fix-timestamp-v1-1-99c0e5fe7d0c@gmail.com>
X-B4-Tracking: v=1; b=H4sIAA1l4WoC/yXMSwqEMBBF0a1IjS1IgvjprYiDREuthqikogji3
 ju2wwPv3QuEApPAJ7sg0MHC65Kg8wz62S4TIQ/JYJQptTI1Os+mUjjyiZE9SbR+w6K2uilc2Qx
 OQ7pugdLgn22717K7L/XxacF9/wCHtErLeAAAAA==
X-Change-ID: 20261028-bmi270-fix-timestamp-48a194b69db1
To: Alex Lanzano <lanzano.alex@gmail.com>, 
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Gustavo Silva <gustavograzs@gmail.com>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jonathan Cameron <jic23@kernel.org>, stable@vger.kernel.org, 
 Liu Yufei <lyf98405@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793156377; l=2048;
 i=lyf98405@gmail.com; s=20261028; h=from:subject:message-id;
 bh=A/1srCpfd1UGOdpJgwH+wipqcVfWHT5hKzmppz1xS28=;
 b=zes8qii00NcuE45PPu4stJ4xIYMjnHPkeaU4SW86Z6Tts6kgcxp+jNZYZKP+DQD8HFWvEzC4v
 ZVUz4JILlhbAuqBUFmVzhyVSvWcFzX6BPQDuPVG3/de4T6fhpBDmLe2
X-Developer-Key: i=lyf98405@gmail.com; a=ed25519;
 pk=lc+pS6pGKgsSIrWd9Plh5gs4dnZRQT6qkyv+hvAy7hs=

When the device's own data ready trigger is used, the trigger is
polled with iio_trigger_poll_nested() from the threaded IRQ handler.
In that path the pollfunc top half, iio_pollfunc_store_time(), is
never run, so pf->timestamp is left at zero and every sample pushed
to the buffer carries a zero timestamp.

Take the timestamp in the trigger handler itself and drop the top
half, so that a valid timestamp is provided for all triggers.

Fixes: a1854d55f54b ("iio: imu: bmi270: add support for data ready interrupt trigger")
Cc: stable@vger.kernel.org
Signed-off-by: Liu Yufei <lyf98405@gmail.com>
---
 drivers/iio/imu/bmi270/bmi270_core.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/iio/imu/bmi270/bmi270_core.c b/drivers/iio/imu/bmi270/bmi270_core.c
index fbcf6bb87acc..40ed1ee5ac58 100644
--- a/drivers/iio/imu/bmi270/bmi270_core.c
+++ b/drivers/iio/imu/bmi270/bmi270_core.c
@@ -840,6 +840,7 @@ static irqreturn_t bmi270_trigger_handler(int irq, void *p)
 	struct iio_poll_func *pf = p;
 	struct iio_dev *indio_dev = pf->indio_dev;
 	struct bmi270_data *data = iio_priv(indio_dev);
+	s64 timestamp = iio_get_time_ns(indio_dev);
 	int ret;
 
 	guard(mutex)(&data->mutex);
@@ -852,7 +853,7 @@ static irqreturn_t bmi270_trigger_handler(int irq, void *p)
 		goto done;
 
 	iio_push_to_buffers_with_timestamp(indio_dev, &data->buffer,
-					   pf->timestamp);
+					   timestamp);
 done:
 	iio_trigger_notify_done(indio_dev->trig);
 	return IRQ_HANDLED;
@@ -1630,8 +1631,7 @@ int bmi270_core_probe(struct device *dev, struct regmap *regmap,
 	if (ret)
 		return ret;
 
-	ret = devm_iio_triggered_buffer_setup(dev, indio_dev,
-					      iio_pollfunc_store_time,
+	ret = devm_iio_triggered_buffer_setup(dev, indio_dev, NULL,
 					      bmi270_trigger_handler, NULL);
 	if (ret)
 		return ret;

---
base-commit: 09f742b49cb2728086d78be2b0b35e4d1d71fc85
change-id: 20261028-bmi270-fix-timestamp-48a194b69db1

Best regards,
--  
Liu Yufei <lyf98405@gmail.com>

