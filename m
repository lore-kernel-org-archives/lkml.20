Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793814983;
	b=h3QKTlyerhYC0mwxQIu/BhSApcNZOSY+BMPwi3N6gayD+NBlCQKoXyXU3odpatxlK5jt
	 5WanxfAVOZbiVkkxEt4gavzg7NwhchnU6K03UA8jY9nWjrXywhkpgoYpA8ek/Vsw0bqCc
	 0qfYH3tK6GlFruUjhMV08IYOGCf6sOkIDOjYNbIv3w9SBJZAjdw1YBAEnWUsdDioBpIN5
	 A6Y/LRnWj8+QfJzRiLBpC5LpKpjw+oUZ5I9ZWeO/Q+q0jRj9v0RcG3IFT3Xx7cV3GKHni
	 +aLRPdutxMOa7fLnz9zoC5SDvx8SlG3gV5C3eb09b8JVQqpkyYW6bhC5+qQtOde/Xpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793814983;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=rzXpUJyGcK8Q9EiSJqd8qoWJyxkZrBy9n/iPsMdJd00=;
	b=WSteYQns4X0ytBk+8w05bwN//YYxNMZ+knho0EVxzj0bE9oo7H5X3uPvqwDKnqNSeQ86
	 uLDMVhOL2kogbNvKzryPb3Zn86KnqHpoPqoYUTcJo0g76Y0Yw1ugKKNXtd/wV715XHIM8
	 a36bsq0V2VmiS2TbP/DmexgnKECHkRqDriRAagXF7/yyOG8FQu90Yn41jM6IN6ILKV12u
	 2GxlgE7lTKm43bTq5hoqghB1xxTp3PP244hQQkL+zBdU2GvkOmS+R/K/pMhjW2V8oJl0H
	 kOVBp2D3JiolY7Ef3Y8RX63I+40JsNCzJzj4nuSAL1f1ZwzkDsWSKD5uS+jrbzva0YQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vjGZDyA3;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84E16606D80B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 17:56:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84E16606D80B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vjGZDyA3
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-14fc585291cso985979c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 09:56:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793814983; x=1794419783; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rzXpUJyGcK8Q9EiSJqd8qoWJyxkZrBy9n/iPsMdJd00=;
        b=vjGZDyA3DUG6/AdGvuNo8PVYADmy06ub0XzuQlVvcB9QPSklGlTmlfIJlI8CXKaxuH
         Nxf+wfW5TN93qvFbCGbGWB1mhJWg3sSKVAZxWUDip82m32IgFFFvY9zJerG9Ah4GFKz8
         jSpHp/q3ap3wYdLbs9B7Stp4ZHGtXD+XPqQgM2Zj2Zm2o3Mr0widotN7c2x4xVFs/F/z
         0JnvyA6zrUBjrNQG9RKsEhfrvpSZVkcFRyD5ZosyYdBup4cF+FuxL5Ux0hAT2RVtbOue
         oAWIwkdgvSujlQ0ArLmQYemkukbBo9wkpqsMPcb4+l6RKHOvKgdkmXwdc9b4CQqUoD86
         ApuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793814983; x=1794419783;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rzXpUJyGcK8Q9EiSJqd8qoWJyxkZrBy9n/iPsMdJd00=;
        b=P3m0upJ5FN0RZPjoIF1F/+nABL7QJpDlEktQ4Dh1eq7IRaR4TGx1F+NitITM+LFvSD
         vuJt8z5X+yx+1jw1b6aG/8hBRdvjaVii1GAwm+2r22h2t4odbfZQy3oMaSz0cRxg/z2y
         0K0Hxw3GC/Qrc4EUxN/8kOgUPIlPPlZCvgmWwkn+Vvp6DXKgcwr3hiDdwufj3qT3RGZw
         tuklBE2fubGSyz+ehtrgubjPLUTn+QNTrqS18Q52KNrn8iZK4Yvhl8m/BoenpYhvKe0f
         h5k2ETCzGmzHmJOkRpCdHIybPWFn0WCSpQ2yfQxX6hbjRIeWeCCmknVzEhODgPPTiQgG
         6R9w==
X-Forwarded-Encrypted: i=1; AKwUvBx+RNj3FVaqgzIa+GSZFvDi5nAJgu445kfyMPtl4G2TdU3OmDm1fBK+IvD77DsPcm2ym/gDnDR6JOBVRP0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/FM23UogKQC9pIM7D0QfzNLH1uclUzMJrwlQzYjQYsU2kjo/Xg
	/Q1iZ2QPMj4kHJZGfenamHrguS32Tpi8pXULKrUiDvTMuXl15OS5VnIV
X-Gm-Gg: AYBFou3VkDQ00l+4kjLNsBVp7x7gq4Atm0N8jGbG1M8ccVFCq7IhPT1ViyBVy2vj2UW
	JQlNIhuZ6/0NNONKxhRebpmRohNoxGbsa6XDAh4RnGsjNZUNJzUS5jFvAhTDE5F4RH0G/HU/osu
	rC5APhC9x/VpZ60tIjiOc7+/Ug2enNWXhsbI5S5evUc6tJpX11WX2MQvJlDXNBv8B0drult9Aaj
	bB3C/7tyNBPqHeTwwEh2PoZKdveZwewFlDNIlMkWYCK3SSTMEmXv+tXU1fDe/xYR8eTjDTiMOGp
	3IXAZgQ13xMFQCeRncuOsiuSS04OiYudcz+ZH/aVr8lXBX5JcUu39xxCqR3TSswlE9mJCG5dFZl
	AEvV6yYNk32DmCg0YsMQJ5KeOHSE1yiR/8pQLGPC9r7A8yFQqG7O5ml3BtoEqjSPnDyENDfBvLM
	CYPN9Vwf2Sykg2+16Mmfu5t8TD8an9sS2vLr+5ujvleBtFYl4mVvn5Mbw27tkRGajwVS8K0FpXe
	Q4ItGnpEJINI7Ya9W5NTTX1lsA5Gy3awW3vHdJPyLzIYDblazM4qCA+2yvQCRoqQaQbvc2x2Qy8
	yegubggWbvOoh2eJR/rkS5woz3iw0WX5Wl7pHrukBreqIEB4yxyp4sHRAFlv7W//YHtvUi113Eh
	onkSZ9itDEovKVaitJLfebKzjCEITx8tC/bbPcKhX2DcSWBz2sBMT2GF0Rt8k7sBFmo0sRuiHLm
	lHdrfQyYZRO/5c8piiJQOmA2lURqH/lqcN2BN0AFKMyw==
X-Received: by 2002:a05:7022:92b:b0:144:fb42:52 with SMTP id a92af1059eb24-1ac5de4e892mr29959665c88.28.1793814982418;
        Wed, 04 Nov 2026 09:56:22 -0800 (PST)
Received: from kapoor.iiserb.ac.in ([203.18.51.212])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245ac2f44sm10135773c88.0.2026.11.04.09.56.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 09:56:16 -0800 (PST)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Gwendal Grignou <gwendal@chromium.org>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnav Kapoor <kapoorarnav43@gmail.com>
Subject: [PATCH] iio: proximity: sx9360: use an int array for the sampling frequency range
Date: Wed,  4 Nov 2026 23:26:04 +0530
Message-ID: <20261104175608.205872-1-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
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

sx9360_samp_freq_interval[] is an array of struct { int val; int val2; }
that read_avail() hands to the IIO core by casting it to int *. That
relies on the struct having no padding. Declare it as an array of
int[2], like other IIO drivers do for their available ranges, so the
layout is plain and the cast no longer drops const.

No functional change.

Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com>
---
This is the int array conversion Andy suggested while reviewing the
sampling frequency fix. It goes on top of that fix, commit d252425c1533
("iio: proximity: sx9360: fix sampling frequency write and available
range") in fixes-togreg, so it can wait until that reaches togreg.

Compile-tested only (W=1); I don't have SX9360 hardware.

 drivers/iio/proximity/sx9360.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/iio/proximity/sx9360.c b/drivers/iio/proximity/sx9360.c
index 2a9b37df8f62..def69a060c0b 100644
--- a/drivers/iio/proximity/sx9360.c
+++ b/drivers/iio/proximity/sx9360.c
@@ -181,10 +181,7 @@ static const struct iio_chan_spec sx9360_channels[] = {
  * The interval is not linear, but given there is 2047 possible value,
  * Returns the fake increment of (Max-Min)/2047
  */
-static const struct {
-	int val;
-	int val2;
-} sx9360_samp_freq_interval[] = {
+static const int sx9360_samp_freq_interval[][2] = {
 	{ 0, 238535 },  /* 4MHz / (8192 * 2047) */
 	{ 0, 238419 },
 	{ 488, 281250 },  /* 4MHz / 8192 */
@@ -376,7 +373,7 @@ static int sx9360_read_avail(struct iio_dev *indio_dev,
 	case IIO_CHAN_INFO_SAMP_FREQ:
 		*type = IIO_VAL_INT_PLUS_MICRO;
 		*length = ARRAY_SIZE(sx9360_samp_freq_interval) * 2;
-		*vals = (int *)sx9360_samp_freq_interval;
+		*vals = (const int *)sx9360_samp_freq_interval;
 		return IIO_AVAIL_RANGE;
 	default:
 		return -EINVAL;

base-commit: 340d44bdf9db0f095f99845b5ad8628781d79b6f
-- 
2.53.0

