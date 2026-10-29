Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793272116;
	b=YZMrV+b6mpnwtBtun3AAngz5UNOx4Glce3vopXQ4s0ZEYNNzYr9szocxkaLigHnd7toI
	 4BlpTxeTkD5aliKCAlVsqbaVAhqzhQSRyUNmqe5l6UYN9cR+LBmKhE89OqwRrFTJdFyJ7
	 QJmPR9biiH8ic7FgrAZRnd/J7XVMuIL2dNvPPzB8Dvd2CPHxkKq6CQC4VLyoyDGo1H16P
	 XjUBi8pUyYbjoewB1hTqBNGUvwU+ys80KsSQ4sUeKKpwqVPR8cbBeazR5r2Dp++1PRSrL
	 yn926WSNK1WqrxqSi56GlOCY4plZ18lid0wF1XZQMEnC5ScdHNaJar7rt+af4oIXzxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793272116;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=D5Bct6ORVWbKd1PZDSJ4YkoXvIXlK7X6xeDbDKwtWiM=;
	b=PdAjVcbrAK+lcnISJm0WCCgjFJxJXINjYRcHCuheIc5vPDd9jv6jcwO3QXOd1SNLpU4n
	 E5n/VKVl51lUMnvumVJDRSt+vR8yArKheFCBzvduuCUQN3lnBfVzOZI5fj98sXsKVdniL
	 VkOn8JdJRNVqnOYlUnnyLvNXtS7asio851MOicmWkjn+SSJ4QVzyJQQBzX34KrZ4LiWpd
	 y64d1nT3a+fCIwGgQo07SK41P40P7AB7fxpLpYJA4cmXfw22Jj/GTj++dNgeMpjsuB8f5
	 m1md2tpknKIBC5p+fSR3S7EPnIHsX8111PCTd5McdiiRaxJHUBIE95QhrY+v29vruBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XVU2S9f4;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E887B606A323
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 11:08:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E887B606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XVU2S9f4
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so1632487f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 04:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793272114; x=1793876914; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D5Bct6ORVWbKd1PZDSJ4YkoXvIXlK7X6xeDbDKwtWiM=;
        b=XVU2S9f4VIweHZFAxkuAGLpNrTAFXPJAh2+1+VWl9ZWl8azMfLX2uYKK6FnTAgKgNU
         XHTURhdfP0iNlwhm/9j2ZN3nvw8+EpkJBXs1PdlkkuqhzD1yc5n+4of+Hm9H5DGv7BNF
         8WXhfPc0FGrFAy9hkSMv5u6dk5p1shiQ3smIYRNMOhnFwdQRLOFTQN8pi0TNB0VH5eGu
         0tjPxztmUzoQUvei+WoCv4p6sjg6UtWsHiwFymX2uo7T0wd+jRGc4fYWTed/Hu3/QaNS
         g/17ZcspeDY6jHg+o1++iSKLmx7XWnrLHIJHh3m7rnb83Vio0bYWpCJKdI6S+ELOg9vU
         zJMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793272114; x=1793876914;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=D5Bct6ORVWbKd1PZDSJ4YkoXvIXlK7X6xeDbDKwtWiM=;
        b=llJ8IHtknm/WzFaE7kI0wcY87/k602PERgLDDujxa7sOuY3i9o6rRTHr/N7h60oj6Y
         fPyQzl6I4AKPZwGRQlMMAPdW2AcQ6r3m2HA4K2GEEoZ3J593KjueHHG2wRJiRQn4xtwN
         p1SPYOGlhBjpmBzro6qmbvM0BbzmYF7Qsulp0t4wGTDqnyxwcbhlOKB6YyvrF+v0rDpc
         mCmpUvrXnCcms0bzvMCVqcuIzMluh1OjcXTdQMT580R1z65tRoQ8lR3dX43uS8HXZqdi
         siwK/ILXc6TdCs/d+FkiTv2YrCeIRgfKWVJCrmQURNtwgZuG/hpuULPxqXAtOd7RVyLR
         gxyQ==
X-Forwarded-Encrypted: i=1; AKwUvByiZMb4Q2xKUo24b9/1jujMR4XMeH8FT4Xvv2te48rjaKDmleVU8hQJDeL5eUcCcJxxdAK/nN6eVCFXGVo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLeaVfM3AyOff92DVgyJ9R7Sf48TjcWYhnglFzNxth++TYdYU0p
	LFYVLGoR7MGfiXIUsc3KmfJMazuu50dGbyjlP0rRuDHaSVXUc/8SIiTR/Vy8
X-Gm-Gg: AYBFou1oQaUZEjjal9liQquo7mdu6L1p6YheCgQVafRC7sI0A6n8lzRFk39TTwghPKf
	AfEnvCl9vp1IAxv6w9LN0ZtPLaQ4TXyRyrnO/iqKzgBlyhAbApXy6j8JBHQYpiwfhcI8CgEtF7A
	SkESbNvMksp03HqMJS47Tp7pYYjYR0q0g6WYuTSxpY592ONmvksjTNMX06Irjr4UY4BvLZl6B2M
	XwnBUWhTGgRhNt2h9MzMGPnAPqV+gSAsyXS81Rfrtpmb4VtzP+k1ZEdsc7dGzWm67LemMCo4bU5
	/8Alv541W+QfSCIuvQS0TM37wrDWjSMwpBfcsObbmRPNM3V8294fRJc9CJsayCeJrcsDEkmM5IW
	tf2HIiPhP5lxQnTwen/f3fS1n8LC1SwG3ilFH1oGa8mp8o2W+la10ZyWIKcrec+zI2VLBZQDsKd
	nu6xKo0y44NlLbaEXoL70p19yd0B50RtMBN3ipMtcZvPykmNUPKL7Mqh6l3fwucnuEICQhe+hut
	MSksRhuBDlVOOwQOoOWBe/lm02khFCaQyFuWPuAXiVErWPcay2iB9DCh/AjFH4fy/VFgcUKPA==
X-Received: by 2002:a05:6000:40de:b0:48b:e50:714e with SMTP id ffacd0b85a97d-48e5d308159mr11719738f8f.36.1793272114213;
        Thu, 29 Oct 2026 04:08:34 -0700 (PDT)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecdfb8esm33716448f8f.54.2026.10.29.04.08.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 04:08:32 -0700 (PDT)
From: Tristan Madani <tristmd@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Kevin Tsai <ktsai@capellamicro.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	David Lechner <dlechner@baylibre.com>,
	Nuno Sa <nuno.sa@analog.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH v3 1/2] iio: light: cm32181: validate ACPI object type in cm32181_acpi_get_cpm()
Date: Thu, 29 Oct 2026 11:08:28 +0000
Message-ID: <20261029110829.1086835-2-tristmd@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261026142040.62383-1-tristmd@gmail.com>
References: <20261029110829.1086835-1-tristmd@gmail.com>
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

From: Tristan Madani <tristan@talencesecurity.com>

cm32181_acpi_get_cpm() accesses cpm->package.count and
cpm->package.elements without checking that the returned ACPI object
is of type ACPI_TYPE_PACKAGE.  If firmware returns a different type,
the package union members alias onto unrelated data.

Use acpi_evaluate_object_typed() to request an ACPI_TYPE_PACKAGE
directly, so the ACPI core validates the type before returning.
Also replace kfree() with ACPI_FREE() for the ACPI-allocated buffer.

Fixes: d34ca613b939 ("iio: light: cm32181: Add support for parsing CPM0 and CPM1 ACPI tables")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
 drivers/iio/light/cm32181.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/light/cm32181.c b/drivers/iio/light/cm32181.c
index 9df85b3999fa8..a16fc83bcbb08 100644
--- a/drivers/iio/light/cm32181.c
+++ b/drivers/iio/light/cm32181.c
@@ -115,7 +115,8 @@ static int cm32181_acpi_get_cpm(struct device *dev, char *obj_name,
 	if (!handle)
 		return -ENODEV;
 
-	status = acpi_evaluate_object(handle, obj_name, NULL, &buffer);
+	status = acpi_evaluate_object_typed(handle, obj_name, NULL,
+					    &buffer, ACPI_TYPE_PACKAGE);
 	if (ACPI_FAILURE(status)) {
 		dev_err(dev, "object %s not found\n", obj_name);
 		return -ENODEV;
@@ -132,7 +133,7 @@ static int cm32181_acpi_get_cpm(struct device *dev, char *obj_name,
 		values[i] = elem->integer.value;
 	}
 
-	kfree(buffer.pointer);
+	ACPI_FREE(buffer.pointer);
 
 	return count;
 }
-- 
2.47.3

