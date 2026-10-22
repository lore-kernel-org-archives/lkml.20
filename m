Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792695443;
	b=LY5H7xIbmxAV9e0aAlFVyBe7U34l3j81pUUooUGnvHkCe1IWKWnJQzVmj6Xu1maAfzSH
	 cRot7U+5artYH1P6saDBscPRVIDYxe/p5UDLIzxRSe30PbVO6OQ/a6pENqWlcCUvnqCES
	 RC+/iyn5VIOkR8y66KkF+sqU+eREBKtauS6HZ65H5DeO3sRdGNzwpoi1QzHWdvHzd3iQq
	 hXaRi7kGX/l4Xo2zLgrjiN1HW0dcTxUxEfnttPrl9IZuxRRLZ5+jFEIVYKTBLVHyLo5Nk
	 8mNBENpab6BUvoGI6ZwqcRScJb70u2S2ukaHO+/PvLwrQB9zSgvXz64mca6yvOhZmig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792695443;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=rEz2DJU5xtg+qo92FpdybUYGy6jNujiV1g+Xw84W7WQ=;
	b=q8Fe2D9vr7mxLmP1nr6q2N05XViwuNzCj5Sv+VEr55XCvvyi8Smdijn7YiSqhJCZgu9k
	 Fv9dP8MdiNWr4GKuHCas49L/MCLIHIx5bP0pIGXMYmdcxVTUbb4qZwh2DFJd9HTTXMVOc
	 C4Z61mQxlt87DseR9KmmD26pXshg1lRJV3CZ9m+zNX9HLQhZR5ROUEDlnwSSDV5C2M3et
	 SSNWetw/y+GpUFqzQkjuuh6UptfaRq4zUNXRHw+p2MerFaE99XQ47Raf4aPuNn4vLdp53
	 hq/jkSYtvWvauZkxWKWNXUpY4+796KI7BBcyrMTx9FhETOsp9s1kG/Sge+iDzY2zEiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AVpASINv;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6931606A330
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 18:57:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6931606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AVpASINv
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48c4d870d54so76575f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 11:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792695441; x=1793300241; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rEz2DJU5xtg+qo92FpdybUYGy6jNujiV1g+Xw84W7WQ=;
        b=AVpASINv3/+gIk07o3cZ4mqOKifekdjWq63VFK+94SiZrLUp21Qg4skNwLfIxkCldS
         +t7KV9LnqYlD3Ea4PZe326XriH7qkvIc2h5YkoLixpo/jBmWCb7ALDCmc5/oT/SEcq5U
         QTCnvFoueYXinrrjjE8okFCIBSsGoF4W0E/UMKTgfaSkLv3mDNXQ411sUzUL+56C6De7
         CLv9EVxSMne8fCDmqVmd8EfXEjO/AsNIMoc23oKUBZxxpkKk6KMClwnVj43zEVTOz3x6
         eHVYz6mfuo4k4u6C4HMJABXfL7cNmTDlbPjfBoLTAn83tQFJGvv46cIavJDJpx4viy3Q
         1Yjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792695441; x=1793300241;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rEz2DJU5xtg+qo92FpdybUYGy6jNujiV1g+Xw84W7WQ=;
        b=kZVDvJoCALbU1aD50VPPSNRMAiGQjoMryJvIH2jIV+S2D+2gj5jVlcXXEshN0hYsnW
         tpG/lfkuB3jEL/qlNVeVGZlyfD6uspUBFScf7QdYEbFM5UvV8tLL6SGb5imLdUgdcMc5
         7l+PsaQCEbOAz0qpP4mhBNCpCuWLiekfKZC6BGa2cEwkUGpTSkQbX09MGO5EDoFPZ9Ve
         JCozUix/8Kd3S5aDqHdga+uJgYRZkpVA2Cd6Mgn+sG02NOEoz3sseDz2ahaucWs+/IL7
         aFo4/Feh/fvl2dfxpCECAJzYornqfAIGx1TVLbHVSVbzSCCRzcCUI0gluKyay6AB51BJ
         2L2Q==
X-Forwarded-Encrypted: i=1; AKwUvBw9ytgZKT+9K4cUj5mSxf2QoPV519xmQHyEIGAUeNyacQPe7Vt3lbn0xm5KV3ck0m63bj3fZbCTfJ/UQfA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIwAoRUDaVIuDoorbP5hQMKCKWtTudlXZccJ97GzDv2MrbxsYIu
	U/g66JLiFMCLFcqLSQ9waKr1XEbCJ2AZ3kvlBplmcksbVTGd+8YWhv66ts1wUn+sAww=
X-Gm-Gg: AYBFou349gOFz2caUOzgpT4BERJ/kvDJFZQYqL+7fvLUP+13KFQ7iTPXFpV/IO6kLss
	T3nHa4Yz8z85C5UK0Gj63hpjyltNx15u8KdIASDHn63cgv7COJLyBk66+NGBi9aIlm7ERSUFh0s
	B3yLN9cFHT8UnoIpvvSFvyiuEphIVfmBdt687wOIl/jjVwGF3odkkcO9og4iUJ3RZbKAj8jXyqb
	NUiAJjgzA4RquCa/Q/3gtureFIeU5JmEHuKZ18YKst0fE15U9GWt/VhYc7C2EQi6yW/8Wi5bVO2
	FXgWMoE8J9KWGZ5W3R+y3lETIaWOM9zvY3pkvs33qnx6XQ6nRYH6pG6Vjlwq/fSnUhcG7+5Ci08
	dBaTnC0Z/pvT/ohFeJb2Y3cggJAfIKR8mDN4M6iZrkRJq0Tzkf8z7kJ6XAjlYxNSa2zrd5DKzXC
	GcD+Tk4UpNDT3Mgyb1gMisf3EaFDyC2boTR2ZiYlasVYDLUTo8c5LoAEk5oTE1oFW+KGXe0upM0
	cO3IY6NKdQT/Y2B1DDzPR7vWS8bsjq/hAZ50KzApw1k+BSUu+fzqw==
X-Received: by 2002:a05:6000:136a:b0:48d:fd5b:504d with SMTP id ffacd0b85a97d-48e264b1ff5mr8730839f8f.31.1792695440986;
        Thu, 22 Oct 2026 11:57:20 -0700 (PDT)
Received: from localhost ([2a02:8308:b092:fd00:d900:ff27:14a1:f032])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e379e6daasm144016f8f.30.2026.10.22.11.57.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 11:57:20 -0700 (PDT)
From: Jan Remes <ciakval@gmail.com>
Date: Thu, 22 Oct 2026 20:56:41 +0200
Subject: [PATCH v4 2/4] iio: light: tsl2591: add I2C device ID table
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
Message-Id: <20261022-first-patch-v4-2-90b2fc6e8e28@mycroftmind.com>
References: <20261022-first-patch-v4-0-90b2fc6e8e28@mycroftmind.com>
In-Reply-To: <20261022-first-patch-v4-0-90b2fc6e8e28@mycroftmind.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Joe Sandom <joe.g.sandom@gmail.com>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jan Remes <jan.remes@mycroftmind.com>, Jonathan Cameron <jic23@kernel.org>
X-Mailer: b4 0.16.0

From: Jan Remes <jan.remes@mycroftmind.com>

Add an I2C ID table so that driver can match devices assigned via sysfs
or through board info.

Signed-off-by: Jan Remes <jan.remes@mycroftmind.com>
---
 drivers/iio/light/tsl2591.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/iio/light/tsl2591.c b/drivers/iio/light/tsl2591.c
index f56d31404c25..8cfce720efb9 100644
--- a/drivers/iio/light/tsl2591.c
+++ b/drivers/iio/light/tsl2591.c
@@ -1149,7 +1149,14 @@ static const struct of_device_id tsl2591_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, tsl2591_of_match);
 
+static const struct i2c_device_id tsl2591_id[] = {
+	{ .name = "tsl2591" },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, tsl2591_id);
+
 static struct i2c_driver tsl2591_driver = {
+	.id_table = tsl2591_id,
 	.driver = {
 		.name = "tsl2591",
 		.pm = pm_ptr(&tsl2591_pm_ops),

-- 
2.53.0

