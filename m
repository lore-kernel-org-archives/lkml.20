Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793105408;
	b=jCDGjqrO774v9SasBhjWjuA2U6IYJ4BdThSN80CA/ubTigfMx2LVzJk44lheo6wb5gLm
	 5DyF+dt8nU5g0qWOFlLV1VLrrS4cKN6bb8W0F6IYnwjtvDiL5qZdr16drUQvmlefCQhHQ
	 1YPuyDpfDsHn/3XyLLhxC7wWGv1wiGqtUiviPLsD4tv9vxnxm/nDlt+MQsRBJLsNaTVe0
	 Kic2vh6bbL8wY5HcImjooA+E3TW1JHh1okMocCezj5B0WRV++bjH7wQDtWsLZWgsXCk0C
	 G8pawLEe9n1kLFybT1vtaJZn4Lf7ZD9mFhccS2K2CRs68mWsmvACBIk55PxTRxe9N7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793105408;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=5maieUrV3gg0OvUYuumtngfF5Rbt74fkE8XBQYCal3Q=;
	b=BGeEF9uS4S/Xwsv9eCU12rgLcrVdlVwtEa9UGf1OoP3125+e7V+2KrHEyWoLBd8ULeKd
	 XHF0q18qCpG1XeZfXIJGHNElmmxAZF0Up9mQ5YiZY4Ttj3UuAP6YpJYRS0AC6nuJ09LaH
	 yAgo1wvo9MAXjGRVZ3n3oHul8XvWJY6gt+CwMoNBkJyMDWwjm6rI012HRtXBy4721GdB+
	 Inps9EzuEEKCmCJLCjsskwe8fQxwiTndhrML3bE2TQm/Cj5AzMS+T8A31lgHn2W+6L9eY
	 mBG5OOUBymfVm48b53zvU4b6ndYduUR1JJ/iqjRe6iBJQ4N70aKCxnPq1PxPcA/+9Ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hRl9iP1r;
	arc=none smtp.remote-ip=209.85.167.54
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD94660A2606
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:50:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD94660A2606
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hRl9iP1r
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5bb7c6980f1so1787129e87.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 05:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793105406; x=1793710206; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5maieUrV3gg0OvUYuumtngfF5Rbt74fkE8XBQYCal3Q=;
        b=hRl9iP1rX7Yescz/IkmbkH6cXyf/ED1aKA7Xz0y5VNBAW8maE8GgmBLi1Wh1HJz5Xq
         zK07nv2LlnsuYPggwoPLVCpg9cILU7yxCYhUI8kfh//X0q4h84Uxy4WnAqOym2Z8oQ94
         870cWd01UkCi1PlsYPmlcE4siKtHAmuIkZEvSG/jnBk6fQ5mVK2vhe27IgRTfeNsKKDl
         YMuUVPSGHaTgX13h5g1TJatd7M9jShSpYRsgvpTcBOVfsiSGUtW2jk4UkN8GZ1buI9G5
         uY4QIKF9bGFC6ba9VYdtJIgBxMjedCj7bDXcmJ1v/U2lGc93fGlda0Wo+SvL83E1oZsb
         G2PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793105406; x=1793710206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5maieUrV3gg0OvUYuumtngfF5Rbt74fkE8XBQYCal3Q=;
        b=0X/eCwWzIIPkR/iDTqA25Abkk5Fw0R0TD27GLl7rDd8jWrMcLomaT+WWPlvUy2hi1N
         UTOqCxHGVTkuXOKTn2H7ptmaLi3pkoLOOmOFqQgB682mDTQZ9rTEYceMmMm288F9LL5z
         N9HK93mb2Wfp+N7A8CfWsDwwi3EpNmiw1zfHXRbCrGREQ/pfDxm2xktNHEOgxEkp0KRO
         iwTPtxY0v5H8ENx29Rn2yhmaiSaMnNsLzBAP5r6oKBmZg4sDQ35Zt5upVY9QKCh4CdVs
         8xrT61355ccVSj/9xqx4BsNKpW8VOHhDbIX/VOuU+homF8KXk/miTuOWabL25OFe1Yr/
         h43g==
X-Forwarded-Encrypted: i=1; AKwUvBzrsJ8dOmpR6n16O9HLRPbwLn37ldmbsB/qpmVIxr9zJRUT9kP6wDsJZgzZLxvSk8DDc6KQcyuAqRbN870=@vger.kernel.org
X-Gm-Message-State: AFq9FYImAYxBU3xjgUB1XseTVo8Lb3ASmj22YQBxeICYJ/GfBsrcVigO
	FWIGN8QvB5WWevhggnlhBYTZ7S89bnmXm1XT0DW400rd6kRoRSSg7t89
X-Gm-Gg: AYBFou1TZKWlcLqq9AA4R6vhpHVx4lNRqyF2GGt90qsj5cTXulDdpFq+1lgO3Q8L35/
	cGS4hcrcNgHJMGP7S3w27CEB3enGNzO1VjKnZwIE5LaYPyxB0ifdvVXxmsqOVV25DuU1Y+aqCs6
	WnA9b1ATnY/3FIdUN1DxQxI25/4gcEkDqBj+W3L5coD14KJ0bKr9/UgvcYhajdcMkyYd7cPRVD9
	mAVbeppRhe981IoPYfxGwZuuW5glksWiGVtvgCokRz+E8MYZwOi+1Wf1m/v89E7ZIS70XjRWaF4
	3Xj6x9atBL/TNidDSJJGy17JQcqbRUKBRJ5kuCXKTnjCYvq3b2aFbpk97RTCvqaNX19rejxived
	Ol32vq5d0D5NtVbnhZpv314H+2gxwDRPnP5UWO6PsTew5CyKcCxYQ1OdogMu9Tg5kcdWIv6dWhD
	M4dC/oKgmZArJC4bBnW8CSvYnzXW2nkB019/hEqb55r71DjZ1dZCerNYUNSVl518kg9iEUrY7js
	S4b63xUtYOdMnO0mldt2ZFxEYP5oupiTT26nM1ANytInndv7w/RRLUsbM4hCP20/rB8eiw+biJ0
	hfdK2BIN9qVeTxojHid67Hf7hexdLsDOCWhlZqgt+SaEjUqr0RejS2PJgmkCnyvr
X-Received: by 2002:ac2:4c47:0:b0:5bc:b15d:beb9 with SMTP id 2adb3069b0e04-5bfb71c6b52mr3628166e87.29.1793105405831;
        Tue, 27 Oct 2026 05:50:05 -0700 (PDT)
Received: from yantra.. (nekmmqtcmoboczbkdcs-1.v6.elisa-laajakaista.fi. [2001:99a:d7d:c300:55c8:a52b:6ba2:979c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7e7cb24sm2052803e87.25.2026.10.27.05.50.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 05:50:05 -0700 (PDT)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: Alex Lanzano <lanzano.alex@gmail.com>,
	Andy Shevchenko <andy@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	David Lechner <dlechner@baylibre.com>,
	Guenter Roeck <groeck@chromium.org>,
	Jagath Jog J <jagathjog1996@gmail.com>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Jinseob Kim <kimjinseob88@gmail.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Remi Buisson <remi.buisson@tdk.com>
Cc: chrome-platform@lists.linux.dev,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rupesh Majhi <zoone.rupert@gmail.com>,
	Marco Elver <elver@google.com>,
	Bart Van Assche <bvanassche@acm.org>
Subject: [PATCH v4 3/9] iio: core: mark the mode lock helpers __context_unsafe
Date: Tue, 27 Oct 2026 14:49:48 +0200
Message-ID: <20261027124954.110697-4-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261027124954.110697-1-zoone.rupert@gmail.com>
References: <20261027124954.110697-1-zoone.rupert@gmail.com>
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

__iio_dev_mode_lock() and __iio_dev_mode_unlock() are declared to take
and release indio_dev, a token for the mode lock, because the mutex
itself is private to the core. Their bodies take and release the mutex
instead, which context analysis reports once it is on for the core.
Mark both definitions __context_unsafe().

Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>
---
Cc: Marco Elver <elver@google.com>
Cc: Bart Van Assche <bvanassche@acm.org>

 drivers/iio/industrialio-core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/iio/industrialio-core.c b/drivers/iio/industrialio-core.c
index d73f2541375f..e9a5d1d905c1 100644
--- a/drivers/iio/industrialio-core.c
+++ b/drivers/iio/industrialio-core.c
@@ -2252,6 +2252,7 @@ EXPORT_SYMBOL_GPL(__devm_iio_device_register);
  * iio_device_try_claim_buffer_mode() pairs or related helpers instead.
  */
 void __iio_dev_mode_lock(struct iio_dev *indio_dev)
+	__context_unsafe(/* returns with mlock held */)
 {
 	mutex_lock(&to_iio_dev_opaque(indio_dev)->mlock);
 }
@@ -2262,6 +2263,7 @@ EXPORT_SYMBOL_GPL(__iio_dev_mode_lock);
  * @indio_dev: the iio_dev associated with the device
  */
 void __iio_dev_mode_unlock(struct iio_dev *indio_dev)
+	__context_unsafe(/* releases mlock */)
 {
 	mutex_unlock(&to_iio_dev_opaque(indio_dev)->mlock);
 }
-- 
2.43.0

