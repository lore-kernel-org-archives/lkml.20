Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792623193;
	b=lEij7qfkCVIfTcRbmoMpjZaxwzJ/6X0RBFGfdnFLsRR2UfRxq79F0DsW9bnKni0gnJdN
	 0oE8qXXSxbAO1qzLvDdStg4MdLapoGNbcLcz1z4c4zX3sqUnZ5YuS3ORUHE4Ft88UPtgl
	 UIFf3Mxb/IjjP3OouMMCIoiLux3ImYYpMaaprXM6oK5ujzNhYjgJ63ymtOh6fQ0xALCob
	 mVYrcGO/+dyx/DB3Ux7657jZYtfolBXqnpENSuJ5JCRV0fR8MeO34f/x1uKx8d4DQ/dWZ
	 my51sL1V9jiGWlW6AiAUVJVNEYwUAMEDZm534ATzm1sX1vQLkAelzNS+lfZiPxDN/Ng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792623193;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=9dBd0LsCLxCDmDC84llNmb0TWCl+Ku3zRuVheUNJrJY=;
	b=4BtF8Wi3+ciIW7uYpSxKdpVO3zG2ZDmzAw9o7tdSlKYksKB7aw0LqN7kcusjAl4xOfAY
	 f6tP4MpzcESdLZrUPfhzJj1ByAE0j593Xo0b0wdIxj1/F4D8c15N0OrEniVW8xO5FgWVZ
	 RnclAeyptbmY3htL8sSWQtGTymgoTuaHb/hM4SwXfVMmV5MRpcycUqrfB6VA06JMTIkWy
	 AsE/F7SmUhzTuYvUDbquG43QYT1AwRv0Ej4Vn7l5gUhzfklxmO1uFpNqhlHg8vLMNlZmh
	 kBelR3qZq2vq3qOkSNvWlpdCpMRhRMwtGsy6t1xPyGTVnVfcjrRWqeYchOBMoPIMeyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=a3oXmX6k;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EDC2606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 22:53:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0EDC2606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=a3oXmX6k
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-33fb4680717so3048367eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 15:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792623192; x=1793227992; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9dBd0LsCLxCDmDC84llNmb0TWCl+Ku3zRuVheUNJrJY=;
        b=a3oXmX6ki1f4RU80cDLqopO3xl0tZFydPl/dho8cigX3Rzlk47duV8ehC8eGRmV8lQ
         8t4a2veqBsfAk5SojxEnUNYBX7PcYxkUDDuclbwtc/OtEOJbHCIk1VeZsZDEAy9u0y/s
         gk40u1jK3981mrnBIK3mPYZ+W0MDAS+P2cWDj7B2Hd6q/8K2VBYrYBXUILzWpvxXHOcc
         Lui9pvIVXyd3IAfLiAQrvdjBuuOe1LcEis3ToJ6HtXQrB0LJ2YECp3yZQZXiZ4RswI+V
         J4Vq7fBPLW8fY7krnMjIlVsM+6uxDIpMcW9+OG2Fz6t0eYEc4aojM0cLQ1n5BIa5Ph1T
         WeNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792623192; x=1793227992;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9dBd0LsCLxCDmDC84llNmb0TWCl+Ku3zRuVheUNJrJY=;
        b=CwoLBAWvp2HLkZGHYQm26vdxL982ANkoLg0pPgBMs1lUdWK9MLfCqfWK7LRUlsz5m+
         pjepeNr1f7E7S8V79GFthE+gA2nUQ3HPCEH7Md9cZG82FYxZRIri/lUq0bpXE4cgXPRv
         rHyzLGpGo7smQjuYjFOZFtgjdDerXpuZnon4nHMvRBTAmIa/KJ0akzSb26b/j4MeF/xu
         ODqAWzVQk++43d2qN3ehGwX/YRc6FNkSQRhy7i8j4mQm353d1U4d7QWnR7cOvtetvMln
         BdZ3ZoXJpMvVXMmck04Huv7GnChsQ2VyAkFzM3z5q6V7CU4/r/pYjjCTltcddaHLRud3
         P0Kg==
X-Forwarded-Encrypted: i=1; AKwUvByOWbL7g2eLdJS1sjW9K2OLK3FcyGEnMXAI1zrTDjCCl33PHXvpBPWneKHO4aoStKQVBu46gQTWjt6wKdM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJgZukH/YoUPmKNG+y5utGg74fYEExWv81q2JFU+1t2oNAvuTpo
	7Qhe0afQejiRT+LaVz7K4Ku2PRSCp6oGn84Q9mfqxcNpZ1UPzJqzx38X9I002sMp
X-Gm-Gg: AYBFou29/8Vz3HCcOcSZL0KFepvjSGKrNE+XH57D0op5MFPw29Sv5fTMUeGTKwcmsSH
	2bHfOZgt1rujH9Lu3HEzXm3SIyfVBWB81ph5cFMpRsv/9IQ0AgyTmA6e6NsPevINJ7hGstE7iIx
	Ylg6ZhVyVRNP9Hk1AUkI5jnj8B3CyxzMvaCj2+teh4gqiSotwM9M7aCloavFYRwwxnMXStv8ucv
	UQVWZJOU+WPf4or7Xlj+x/6HU7hLA4PPCCSV08Ni0jmdaw+HNjdZUiRpJMEYo17rly+UIcj+C6q
	GV8AHdWXDbTpfRGefDw5wOqOaiah31j+OcdlBx6VKQGHoLWgVHbqSroIiFVPXDrW0c8Y7K32i/N
	NRclc/iBIJ217lfdo1xE5T591K/ScBWshwZZe4TFtJk7CJbB1DfPOpwYvDJnGKwCm71KrmGlUHg
	CWgQ3Kcq3oT2Mz+bVawbyq3hFXQnTAFnuvTMF0wfBZGeFZXYr8FUqxCYvJEdo1tHKEo4QHffRXO
	wPtdjWaJiePPzVmJGaTnumc7iWX276vORMAonIHBzPPBRxeA6lQ6EjcWj/TO27a0hxIllIl9WaZ
	RqMsrHLUWu9JusM0kEenpAIcnbjqt795VCWR2yk9a+R1jaq7aVEiBU8hxNzLOLkuupVRLsVCsvF
	cUgxgk016X8qRIvHmNeiKvtEcO7HX1yLx
X-Received: by 2002:a05:7301:6d0b:b0:360:ca2f:ce38 with SMTP id 5a478bee46e88-3674c93bdf3mr5050567eec.12.1792623191663;
        Wed, 21 Oct 2026 15:53:11 -0700 (PDT)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36740cc8c6dsm11688901eec.12.2026.10.21.15.53.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 15:53:11 -0700 (PDT)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Arnav Kapoor <kapoorarnav43@gmail.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] iio: core: fix signed integer overflow in
Date: Thu, 22 Oct 2026 04:22:48 +0530
Message-ID: <20261021225306.623361-1-kapoorarnav43@gmail.com>
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

__iio_str_to_fixpoint() accumulates the integer part of the parsed number
into an int. Feeding it a string with more digits than an int can hold
overflows that variable, which is undefined behaviour. The same happens
when the parsed value is INT_MIN and the sign is applied afterwards.

The parser is reachable from userspace via the writable IIO channel
attributes, for example the "sampling_frequency" or "in_voltage_scale"
ones, and via the exported iio_str_to_fixpoint() helper used by a
number of IIO drivers. A user writing a long enough string therefore
triggers a signed integer overflow.

Accumulate the integer and the fractional part in a s64 and reject
values that do not fit into an int with -ERANGE. The limit for the
integer part depends on the sign as the sign is applied only after the
whole string has been parsed.

Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com>
---
 drivers/iio/industrialio-core.c | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/drivers/iio/industrialio-core.c b/drivers/iio/industrialio-core.c
index d73f2541375f..40f4375163c3 100644
--- a/drivers/iio/industrialio-core.c
+++ b/drivers/iio/industrialio-core.c
@@ -1008,7 +1008,8 @@ static ssize_t iio_read_channel_info_avail(struct device *dev,
 static int __iio_str_to_fixpoint(const char *str, int fract_mult,
 				 int *integer, int *fract, bool scale_db)
 {
-	int i = 0, f = 0;
+	s64 i = 0, f = 0;
+	s64 limit;
 	bool integer_part = true, negative = false;
 
 	if (fract_mult == 0) {
@@ -1024,12 +1025,21 @@ static int __iio_str_to_fixpoint(const char *str, int fract_mult,
 		str++;
 	}
 
+	/*
+	 * The integer part is accumulated as a magnitude and the sign is only
+	 * applied once the whole string has been parsed. Hence the limit
+	 * depends on the sign.
+	 */
+	limit = negative ? (s64)INT_MAX + 1 : INT_MAX;
+
 	while (*str) {
 		if ('0' <= *str && *str <= '9') {
 			if (integer_part) {
-				i = i * 10 + *str - '0';
+				i = i * 10 + (*str - '0');
+				if (i > limit)
+					return -ERANGE;
 			} else {
-				f += fract_mult * (*str - '0');
+				f += (s64)fract_mult * (*str - '0');
 				fract_mult /= 10;
 			}
 		} else if (*str == '\n') {
@@ -1059,8 +1069,11 @@ static int __iio_str_to_fixpoint(const char *str, int fract_mult,
 			f = -f;
 	}
 
-	*integer = i;
-	*fract = f;
+	if (f < INT_MIN || f > INT_MAX)
+		return -ERANGE;
+
+	*integer = (int)i;
+	*fract = (int)f;
 
 	return 0;
 }

