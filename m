Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793630957;
	b=VKwCscXdrbd2jGbDSotHKaVuNzEFjTmB4cR/XJgeH4NvkL5fkuD3e0Tg6ZQ+cMtn3R3L
	 vHNWFSrTFyrhSHJtmaLKyKtYdHsCw6qnRav0cv0Ym3FTUoCGx5XuBzTlbPautP4jWWdh/
	 66Y8vyzi+VkYZHmPSwrL17Uxbfh8TRs8WRhcJkRw/LxqMsgOO3oCNeFw4dU+NYl2+ZswN
	 zoqxPX++yjwp4QTP7iUcbDdeOtlVdvKP5ir76+LjF+wbzMVni5sVqP5wqiBWXK5qY43N4
	 96De6yG2rKMZEyBruDMd1tSTZscMyVCe1g31deZ4N5yyU5ga0+akWiF/VrOMSY+ygAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793630957;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=K/V5t+jqFiHhP0+zyx64+sk+HwdaCdpfP+GPzqrY/v0=;
	b=o/XwkpMfPscNTv1sMT6o2qWCNFfTsGB+mqaGzHv/TECWalz8+5uXBmGLYfn4KDyyGpwO
	 huiGAu6VbmwdCKqGMf12LVw8DTXIDL1ml1MfW3JawKlpYt7s6NEHw9OcLkVwvKEUcg08R
	 TarkrO+3N8w0EMPsKoQ2/TVqJqScX5pSObZCXVvPKvgagrKjsSFvalHFbLM4f5hVGdlRI
	 HbaIcM3JfsAqAlEK9rIdpGESsBTamrozVrNQHJ3OzdfI+u+4m5KARxt8XeSdxgMTt/bLN
	 /T8B3bBNOL4OOfpCwIcC4QMKKOHzKdcRi+qmM4QcQTPuhlxrvyzCJzUrdhaVH42SSkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=rWNWv6uH;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C17A6087A25
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 14:49:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C17A6087A25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=rWNWv6uH
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so29765305e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 06:49:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793630956; x=1794235756; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K/V5t+jqFiHhP0+zyx64+sk+HwdaCdpfP+GPzqrY/v0=;
        b=rWNWv6uHyaGaK6LrFg8qFru6mVZ4exHOSisVkTk6L20iqAGNIWFp/9ob8AR+oKdbj2
         DdnHefWTPExVwIIb1bI25AgVV80vzO05vepSyXroaQIBDxLpRi0AmQV5fQLV9Kn13lID
         F8iJ7Q3Bsq91cqz/wklKz0yhyddwGLJjNC5q2A0wxE/P+wKC6/ZFIjqXL2gujeKBQUJr
         PESZ6LeheiBy6/CQcm6tBoRVl0ydPrxi0k0eOZeLAThX1esvXm0Ue48Tcs87q6gd0epI
         EBGRIY/whhJvOxKBKTRcJh28zmqlkGnejYhqtD2sYz60Q0ZlyoDnteHYqJIQKvAKVzYa
         OCOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793630956; x=1794235756;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K/V5t+jqFiHhP0+zyx64+sk+HwdaCdpfP+GPzqrY/v0=;
        b=zWU3WrUzSI5zfSaa9eTSrCr4Drmgz1BjfMCxDYtTjgFp2//NfVZ22kbITGH7SkKo6W
         cBV+Ts+SwW7etBtVWEKMbkdxscKAB8BuFvlZHkV20KeQbrStO0UrrO1GaZBYhi0gZc0B
         a8DQZXXMB277K7RV1NlYOjOfmOP1sxtzul4Nehrediwyf58nAUE7U9euiZwVIjWYvP58
         +XGvB/sE/1Lq2VWDdR8xzKz8OsrndZCIJuH7ChV1WQd5UgcH2U6MxPmGc/XYfqoVrVHm
         fJvpQnH8PQrecdjNeqfUdvr68ojSb8fJoAdk5NKjmg5l0M9hnH590IBwvQd/t3jhwVDx
         P00A==
X-Forwarded-Encrypted: i=1; AKwUvByh4WAUZ5avuOSpkSWWwVgPLCqgflUZC166/nYA8u67Hr0R6KPoVSuHHOQt6ug6RtaZA2w7ilc+LxdvlaY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKCkyWEJV39alBD3UyN9JDE6xtLViP16o/1iXI079TWGdLzWAB8
	7bCVZ6Nsat0VkXQhy8FVEKrCchKmFpCNOdRww1iKKVkXcj2tiTi/+7H9KGXgM2JVKHI=
X-Gm-Gg: AYBFou31qRUKT1rGysX12H+sWLZWWzs+TxX8faMszyclV30k2perTP2IV4pIe0MCW9X
	9d5MJ+BvmNCAhZ5q1MSIUPcVfSyKSl7fRCe2SynBAsbi7kYwDuAvp+T5DopL6iVT6xXAtRs7ppd
	BfSPfk5Lp3p2IIrs70tQ2Ial6ZxnmKDQ8vW8Au6Tj3RUlgG7wlt51IE0JNMt007rYKcv2aK7jx9
	OcshC8lrAAdm+bOcg55jxZVHdk1qloxJEx5pBztDwCOtK1DvgXRS3pPTKQNAXkl3MOSLJcE+cjG
	kRoUbn3gPmSGkGAU0MXVPWGG5aBmB7b1v0R+6+YoBLSbEm0wmtGWat3oKzKrUA6i8u5iV8p0Yvk
	To9wst4iARwUlujsY3uLJuHXYFquVc1ar4eFTmfd5rQXXScu0c3kjq7V+Vl1ATkX4aVMK9avaP5
	b0yI7zMLy1JWhBedHiCuRBeAURxSW3rexbsT/UIdcLESURSlacCjtPsdxdX9Fr3FXGUmp/NO3oO
	FoHMXtS576WnPJ9e66yst5VP5N7iO0vBSIZ+zTwleP2buSJK2sKK4hGCBUaF/cB9+hI86cCtuSe
	JoyhY5v5dZj3FORUO5J/cpqAZ6eTJVk50SjxClwTS/SmBSqFXHL3UjEUA244G98TqqSb4R4B
X-Received: by 2002:a05:600c:34cf:b0:4a1:dbdf:17a8 with SMTP id 5b1f17b1804b1-4ac150b3d01mr246636885e9.2.1793630955558;
        Mon, 02 Nov 2026 06:49:15 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf5b27e46sm447287005e9.3.2026.11.02.06.49.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 06:49:15 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 02 Nov 2026 15:49:05 +0100
Subject: [PATCH v5 2/3] unaligned: introduce be56 unaligned accessors
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
Message-Id: <20261102-topic-sm8x50-iio-max34417-adc-v5-2-0ffa5e5f2d5c@linaro.org>
References: <20261102-topic-sm8x50-iio-max34417-adc-v5-0-0ffa5e5f2d5c@linaro.org>
In-Reply-To: <20261102-topic-sm8x50-iio-max34417-adc-v5-0-0ffa5e5f2d5c@linaro.org>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Hennerich <Michael.Hennerich@analog.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, linux@analog.com, 
 Marius Cristea <marius.cristea@microchip.com>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1503;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=q+s9IUw++9sNzM9FIO/G1OqBY3KuaSP0G+EMey77yQE=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBq6KLn7W/XNqDRG6ymWAJYw2576T5UyM8w2QGAAVwF
 uECyAhiJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCauii5wAKCRB33NvayMhJ0a4YEA
 CW/ceDj2KIYJjKXvikOgSgTOTmfGfSTkfJWIgrntcIlNUe/NS2RvGYiUQWi8X/iNCYMkXiUoN9rj6Q
 r/XJmqJROqvBB9iVvUkdZUcKQTddRZSYB2a/jFkZ9GHSHfagzxGtnupo7hJvxlhYUR6I/t9QYpOyb2
 BWUf4gZ/rfgt5Soj+QASIoUUrNgoJyVHp33lCak6B8qP/jnb9/CHkKSmxEirZqtL9E13Pp+sZvJcZJ
 NpJmEmVzD65Nwf2PPg9IFCDa1rteLed7G/fdckHA2JXvPf2sW3i6HhecjPAp/CdVrq3wvVhSjegmkK
 R9JGwveX5T7kcsh+fLvMwExC72fVopUYZmQnaCowmm/AjtKtc5oBOYSerxl1iA8YIGj+HVCOLP0gXv
 GeJjeJxjF6hlv3BPl64veIX+5f7iWQNhqKBs1v1HX/ypDyRD2NkS3jj6JsQt1/J+r7Vem3IaV4d96K
 KLnraLKIXuzdrnONZhCu9G3/zeHetSQO8C5sOKUHJJkPfjOgwuk2jPbEFsOllQzoiS2mZuC7rePur5
 /r/BGixeyjyqtafe2NeM4/PsvnzqZCBD6BdQ2C4ui6r+N1bsaljLxoCfyag65oeKJAisZPtMflyTM5
 2l+iBqJd43j6QC5BUvpqBNR7GHz5Vapmf2LC26tCDmAMZxVsYaZoP67e3csw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

From: Marius Cristea <marius.cristea@microchip.com>

The MAX34417, IIO driver, is using some unaligned 56-bit registers.
Provide some helper accessors in preparation for the new driver.

Signed-off-by: Marius Cristea <marius.cristea@microchip.com>
[narmstrong: update commit message and move to include/linux/unaligned.h]
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 include/linux/unaligned.h | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/include/linux/unaligned.h b/include/linux/unaligned.h
index 4a9651017e3c..2105743b1800 100644
--- a/include/linux/unaligned.h
+++ b/include/linux/unaligned.h
@@ -143,4 +143,31 @@ static inline u64 get_unaligned_be48(const void *p)
 	return __get_unaligned_be48(p);
 }
 
+static inline void __put_unaligned_be56(const u64 val, u8 *p)
+{
+	*p++ = (val >> 48) & 0xff;
+	*p++ = (val >> 40) & 0xff;
+	*p++ = (val >> 32) & 0xff;
+	*p++ = (val >> 24) & 0xff;
+	*p++ = (val >> 16) & 0xff;
+	*p++ = (val >> 8) & 0xff;
+	*p++ = val & 0xff;
+}
+
+static inline void put_unaligned_be56(const u64 val, void *p)
+{
+	__put_unaligned_be56(val, p);
+}
+
+static inline u64 __get_unaligned_be56(const u8 *p)
+{
+	return (u64)p[0] << 48 | (u64)p[1] << 40 | (u64)p[2] << 32 |
+		(u64)p[3] << 24 | p[4] << 16 | p[5] << 8 | p[6];
+}
+
+static inline u64 get_unaligned_be56(const void *p)
+{
+	return __get_unaligned_be56(p);
+}
+
 #endif /* __LINUX_UNALIGNED_H */

-- 
2.34.1

