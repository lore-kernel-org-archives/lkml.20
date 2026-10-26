Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793024454;
	b=skoHdTlvQQTzAAm593TLLyiseeN8ZIfAWRQqoQv7/P/NcYvSWlYeX0HEiaHb2QfDW0jJ
	 Wqf/eZH66ZtIaJWWXSN2eGBEj8dn1T5OUCoXeSTEBH3WL0RoHrgRXIRI9OV65E3GxpBcm
	 iK0L3OFdLAf3Ong5CqlAZHtKY0uPcLNXzJpzQLVJLxFKZnMfG7Rdke4NopMID0Jp140iR
	 0ym3sL4v5ZEIxu4bq9bb48hkymUc2PzI4mGMzhBqJ0mDIAii7DEyX5ti12K3nIR+HTQpC
	 tMhMveo/5LLl/tghHzV+r1hfSaBETqgya4bOymahvNJlpNbrEiX8vGiClnwT6VYtOpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793024454;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=qtgx3aMD/495ZX6s7lgn7crrN/uSuC+ZVzynjH2rJKA=;
	b=aVoxBpXAzFfGG8WGh8eR7oGJPOJL/tqOtwpwxVMeQpahphMRBiEoIw8KVHcUp+kO/lE7
	 LdffyIPX8/0j3JfuzU3qfRO0ozuN00s3j9onJfRJuMClLlhjgYFWEiqj/u+wcT6Hidoqb
	 9fsHEFFuX8b8S/WcJhlnWSDg8KgLGwE3TL8V9Be9soGGhEafUZDwiB+2Akg/F6cMffNy7
	 b9SLRjBDaSbzT8iiB9JBZ750NfwVC6FHTP6AwJwSS1Zw1/9R/MYE33EU2HImnsHzHz1tj
	 njUTFZsYX7SFAlEOzEUztxNbs1ZBdLU/svDGgMv91c5av0SzJBHHUC5sxCSe3yvRkdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VibjgXv+;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA8B60A2616
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 14:20:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCA8B60A2616
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VibjgXv+
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48c4649b35bso3156977f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 07:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793024452; x=1793629252; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qtgx3aMD/495ZX6s7lgn7crrN/uSuC+ZVzynjH2rJKA=;
        b=VibjgXv+bcagRtSV3WmXK/WYP/g8lMLfHDmEGVKYDuOO/nSMvtUk/CrBhMiWpgZluv
         rvtIkQsRzKvGYEjHsiDv139LqoROgRtSoi/gy+ihu2aB5WB/GDAX6SvkwXnbj2UiAWOL
         uMkXie73jCSAOgPAOrCkkubc9VdDxB6iS2K5pzXM0JYIEaAB2fGrnm0lONCcj9G57EQG
         jvCiAvfeiyg2zAj6ZQvjO7e9DZ2xH0qVlSiX8jlJLTs+HjBLBe6GaDqauDYBhfBAsPmK
         srFpmb/GYbr1sbdxmEmwTlpa+l1+z1NBGg/tt70Olk49SdWQcpu1c/hynBdXfNOWMiLc
         Q+qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793024452; x=1793629252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qtgx3aMD/495ZX6s7lgn7crrN/uSuC+ZVzynjH2rJKA=;
        b=whzUSiHPof6+BYb+bsACFFa3jJet/4yy6OoqbZCkEgzan7tsq8N2oOZKk2PmEqBPJF
         fGOJhPT9/yUKBAk4EkV7h79mi9mMloW0PN1p3ZHyILqFTnonUcEwDwBDMD1ZaqMnrpMR
         2KLmgDAfHUmRT4AyDIz7UOkxdoTOgtg1IjIFsOTiU5PrlfF1G+eTITfzarHlwldeQvd8
         oK73am9AMVAB48xIoJkqD0SvBdvjvlGSaMu44/FDItPOJ25z2SQhoQDt4fAqIJws6t4t
         hq1hWtJueU3wJz4KEQp7l3A/AODfYYuajTkA0UYhIuVA56PxadbfBZ0YhxPSVlK21u9C
         QAhQ==
X-Forwarded-Encrypted: i=1; AKwUvBxolBUMp8X4TVDXoeGJWXkiwL8HU/qLAZ7SzciQfMIc87dJMxiZlNzgR780D+RVYjp1ZwqvpC9Gi4wuQsk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLX3MBIsxGeP++xsSsPDr4186KtUIeaweCBXKV/zuCo25eoDeb4
	nHXYLw0KMxAWC6Q+Txnoz0IHEIrcEaZQG9t5fqZ+swJcGK9sJElvpuI=
X-Gm-Gg: AYBFou2AHiqNWSwNRsIQu97YuiJCQeboVZirIki80RCHiWXIhVZLbPI4BvHJJIZv5hU
	IGs6NaiYeaPHV2DRq/ODKjjVIrPBs/lXua6JLqH3dSsVwhxw5SZWXZU0pEAQ7uXmiYNYUfaYPGr
	S47pYij0kGuZpPlnuxPZYIiCx5QuIpw4i/RUBCuUF2RzVU/WZtlw2bnSQ8QIxVdHRrCeUDq6J6Q
	JoV+ve0XpuJSC6FikglDSSl1paTq68nIY4L4afal2AQWJefRQTw3stnp+DeRjjI3TaB8Z3ezC+c
	gJba1TLK6lTTl8MSrZh/35bXQHJ6BmIr6R3R+uaPDEy6/zi/V7KCsSKLToe3KlIC/WGX7X9LtIM
	sEmbRADmyFFWNt0fx027sR46OQE24yiB5MyCercHZHTtC++UaqtPwEYraIYLIryH0WnCLgfNgVF
	yO1aHX8U3Z9K5a7qXK7HhBzOpUkjvrh6iTd0qUfk+nw9d6V7F1twXTNTwUNWQbMao3DI+y+wx2O
	G5HmJ63o2kKxqTZTe9a+oZ6AwPpms8qkqj+U2LxbOoLvg==
X-Received: by 2002:a05:6000:41d0:b0:48d:ff71:dd97 with SMTP id ffacd0b85a97d-48e3eb2bdbcmr13969716f8f.7.1793024445723;
        Mon, 26 Oct 2026 07:20:45 -0700 (PDT)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb8d5sm17484186f8f.28.2026.10.26.07.20.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 07:20:43 -0700 (PDT)
From: Tristan Madani <tristmd@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Lars-Peter Clausen <lars@metafoo.de>,
	Kevin Tsai <ktsai@capellamicro.com>,
	Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>,
	David Lechner <dlechner@baylibre.com>,
	Nuno Sa <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH v2 1/2] iio: light: cm32181: validate ACPI object type in cm32181_acpi_get_cpm()
Date: Mon, 26 Oct 2026 14:20:38 +0000
Message-ID: <20261026142040.62383-2-tristmd@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261026142040.62383-1-tristmd@gmail.com>
References: <20261026142040.62383-1-tristmd@gmail.com>
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
index b32a94028f091e..8d00486af608c9 100644
--- a/drivers/iio/light/cm32181.c
+++ b/drivers/iio/light/cm32181.c
@@ -114,7 +114,8 @@ static int cm32181_acpi_get_cpm(struct device *dev, char *obj_name,
 	if (!handle)
 		return -ENODEV;
 
-	status = acpi_evaluate_object(handle, obj_name, NULL, &buffer);
+	status = acpi_evaluate_object_typed(handle, obj_name, NULL, &buffer,
+						ACPI_TYPE_PACKAGE);
 	if (ACPI_FAILURE(status)) {
 		dev_err(dev, "object %s not found\n", obj_name);
 		return -ENODEV;
@@ -131,7 +132,7 @@ static int cm32181_acpi_get_cpm(struct device *dev, char *obj_name,
 		values[i] = elem->integer.value;
 	}
 
-	kfree(buffer.pointer);
+	ACPI_FREE(buffer.pointer);
 
 	return count;
 }
-- 
2.47.3

