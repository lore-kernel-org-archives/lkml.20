Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 028DB559CB2
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 21:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791926166; cv=none; b=aa3r5KJYkiBFJt4qEjCLrA//CvdpdVJrwBX3sPtUMCfl7t3vFAILQ5XtuZXY8dSoHaRok7y1VVETMRgHlR4xJC56anEZW62zN9xKYdTnuJeved/m9soRuWkJqMWKpHUoOIFHNwUm+raN9WdzWd35IErT8wAUNXqA9hQLX7kY8yU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791926166; c=relaxed/simple;
	bh=pGvPZxYQqsPDT0NieGlqMGA1j1B4VhkvXqUEbOfXDks=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PSBbQMHnhGqpAXHRWHmqi8AxdfTiW9Y2ldcar9m8V/gyvwN6GjOS+n03d+slyrRvAM0TwN47zZDf7c2LhTgeFw+Zlyctd5+qE/7p++nvbehnF3dDFgGToG6OAuHLYu+SYu5CPKDRwkg7ZnybpmGYzH4HbiAN5eBas38AY4l7DEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cF10bUFi; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cF10bUFi"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c2dc8cb0decso37590866b.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 14:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791926161; x=1792530961; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ED82b6L34mz4qhKpVZQtr88/BQW1IKL21JdDQLu4khk=;
        b=cF10bUFiaVe771UsZs1SORXtr4hX1FNuXS6swpXNZrRu/5lPl6ra0DCZLHhhq7xAnu
         tAT9kmzS3Gker2q1gqAvniaszhNuW3moxFwsrU4mq4F/rpPQX4uUXlEVEu3p5J1APeFF
         AdXUOFqZnT3Dr7B/WCCruxSKdndhr13qmZYqvekx5rEp+u5SgTNIdZUqqFaMuuAJX+0h
         sFH3q9uTGng5xMX8fiTZfzuLJKShrb2z73+1ZcKG3OxZGq88rSrr0UEe/T7gtCkEb2n5
         +W1vnGJC/3PK1bl4Z0lFpBAmQsCOos5PPuFMwZ4gD3FcO0ppyj7B/meknA5uh7v6yf5c
         ZrKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791926161; x=1792530961;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ED82b6L34mz4qhKpVZQtr88/BQW1IKL21JdDQLu4khk=;
        b=hkVH4N97666Ezg0QktuLGfdgGoL24svNTrZzIywGFE/2kDv6+hlxhJqnhJDupgUNmK
         GeYWbMOg/vXoQKwH+hcUkPutVr73W/RBbHuz/b95fXnhEeeZF6VPLLItlAlM+VwhhfX3
         Bcbu2h9J51DqsIF7kYXuKlFh4ZjAFCea//wpLdxTcydEBNMch4LuRy6NTV0R0TaeVTaA
         LVdNJhDOwOyzQr5zch4ZVYwDh1h8u4gNyiQIBLualheDBeAPhbFzVcVhMvl7AtJWb2ib
         I0WBO276KJ6BRx5dPtiGBwSSkKLEF5d3MbHloqQUX1yaIpyc1xR3COWm9eX460iQctkm
         U/fQ==
X-Forwarded-Encrypted: i=1; AKwUvBxWPNx1h9hUmf42VhNwxhNDlZAXqTIHPrev5VKA7YhuJ7d66oJC1GJkOFy6qmI2MCgboIgwZsXCAuodBRk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJBqjlMoyeHv8cTN4YrPJmNjendHLdVVLJxlG0Mt9jc4gTOl196
	y6Y+TEmMLeN6AgcG2RTxnwBBTifZsimmHWCjeMnBdiR72LTrvVxhqsAV
X-Gm-Gg: AYBFou0AVv/MUjygEBw2yYUABp8/REF18JBgmZTfnEplZVnSBcfuU/tGzD3MY5jMn5C
	R5GrnDNVIC+wPhXNfSb8CzQlxF/rCNcTFd8m8JWowK+aMUOWJbYsfr6TgYeGZfes5DCrG/b9FKL
	hEIX37EOJ3qLjqGvlq5xl8Sk5NuwUn3OjnwgeF6i+Ukt81yhtgqKGMHHkEiUVjqeHYQrJUm8lQe
	rzZcNUXBi70MB+YgaFAaXobomLvhPbL/EiMBmvOm2rWeXizj7EVb+99PPGnXdeMpWFVfcARTxfn
	iflLga0f5ez5RdmjtXmt9EFkLhI72qF/ghcWqtMvVK62YX7rGWi5PhqyK1elJdOKH/1ijlURPj0
	/M/H57HKdI+oyUECr+6uSbXa3qKqEwUTRBfh0VgikIAhJfQPFS5VuRvvl4Al2+pF11ogAA+taAO
	99U+TQpclw63ZdaTQLCUMaXsQHuSOPmI8QJ2TwOTlBHOf8Nm3EJae9USgJM5P0OmHeDkPRn3IUx
	2JaNdKWcQWGUG1I+vUydUe6S4AIeqM3UAcSG4KH
X-Received: by 2002:a17:907:60cd:b0:c2d:c8be:4e71 with SMTP id a640c23a62f3a-c31aa02468cmr1265532566b.19.1791926160856;
        Tue, 13 Oct 2026 14:16:00 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c355555f483sm256776766b.23.2026.10.13.14.16.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 14:16:00 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com
Subject: [PATCH v7 2/5] alpha: describe the Tsunami system machine check frame
Date: Tue, 13 Oct 2026 23:15:35 +0200
Message-ID: <20261013211551.991723-3-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261013211551.991723-1-linmag7@gmail.com>
References: <20261013211551.991723-1-linmag7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define the five system-specific quadwords in the SRM logout frame,
as documented in the AlphaServer ES40 Service Guide, Table D-19.

Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
Reviewed-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/include/asm/core_tsunami.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/alpha/include/asm/core_tsunami.h b/arch/alpha/include/asm/core_tsunami.h
index 3391e95754f2..fe3fd4570fac 100644
--- a/arch/alpha/include/asm/core_tsunami.h
+++ b/arch/alpha/include/asm/core_tsunami.h
@@ -283,6 +283,11 @@ union TPchipPERRMASK {
  * Data structure for handling TSUNAMI machine checks:
  */
 struct el_TSUNAMI_sysdata_mcheck {
+	u64 sesf;
+	u64 dir;
+	u64 misc;
+	u64 p0_perror;
+	u64 p1_perror;
 };
 
 
-- 
2.43.0

