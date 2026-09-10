Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F003B71BE
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 04:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789015531; cv=none; b=SaksRJYQrO/N5zk0VL++BTP7gSm3PB08uR/Oy40tKDkM3IdYRPuopJaArdYdCpaVY+2kxK7KCsi6mDrerIw8Y7ir1PyDeFzGDD3G5ZaRSFwtYRmTgfti3TfAwI2AZUJVTschVqzbqUt02iiITUPaRWaJomkrz+aXUR5RI6pJ0Dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789015531; c=relaxed/simple;
	bh=GguvofblmlkGFhRXYjlruXMPkjm38VI8GEfkm6dGqZU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fNg+qbrbSU9YzG7sEze3iwKgK5tnRUruGB0kAsJP7pdDcRLxWGhvzioYzag8adNl3VBahWRPWDGyCfxyHL/3PLDLn327wztQBbDZSmZl+1+RaU9AeW+9nNVkziR2IGZka7zuM541imBdUD/31co/HNch2AKi2uU80oOdknLZk94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nBrk3plc; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nBrk3plc"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2ceab75934dso64282335ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 21:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789015529; x=1789620329; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ky5nCya7YcZhP45fNV0+AfxkIQRsXMatVpL+WCCtou4=;
        b=nBrk3plcodQHk+9ueyEXGye1aF/s1J9ln3SXgjjOObmk20aT4rG5rmMBrplFE/0zFE
         KLg5rjXlGotLnAZmYvBN69o1/6j8yZ3RKQnJaXyR3HDqFvciJRRZxHAKKLBPhkm6Yc7S
         clDj2A89zSYGgrNeEDaW9w3YwsQu8W4wYeDTXTOgWSp4kb84VwbkR2ft8yd9nQGqNq3S
         jO6tcAawxCzyKWVwO3ax3SPrgEjFz+vfsjG1KO3tWtlsizz9Q6GuetpqcldDD/VZJquI
         wETcjams7Gr+mcIsXqnbZLi/+WNFqpqC0c92NMqDF5hLQ/oOxxcpHW3SBbshurq3YU6p
         zFFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789015529; x=1789620329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ky5nCya7YcZhP45fNV0+AfxkIQRsXMatVpL+WCCtou4=;
        b=bGeHUXfJYbXJdxn3vhQHdtudK8iI5cvmJhKjFlwAm1SxU2B/9uKtswxItVFANI9zLW
         mzJzhJcdJjkrlbILI+h9VSUuR+C+8yuT9z5Vd+JzIog/U7kTwrzcPZ5hAXy4eHs2FRdg
         eWVcxXAtX8n+h9a2UpSoxRoL6XSOQjwzatBBYDap5n7gRTP7M8wH4LrNoFb9lth4Bb9F
         KpErdJcgpJc2GgVPTIi7Tv6QSFuU1sDnPwNgorwrTKPDDFWjXnCrzXIXA3W9euaM7Alg
         /sD8K+mahSjF7Bz3fNizs3Ig/rK8rUMLtbSH1//XkUP3GoiLJ7+9Ect1Ba3zhqJQzTve
         ZwRg==
X-Forwarded-Encrypted: i=1; AKwUvBw3Kri6Bqcytwx2Z957SyzqcA+aU/QZmTNqBfRzPrrl2VzHEQcCAzBhQDpvi+8QfXjcVvPhbXOKZyH0gsU=@vger.kernel.org
X-Gm-Message-State: AFuF++me0pBEHApKWNHvkktycFnAk362pqIMKhhGTiydixaaixqSWbeg
	6FR7T0r8lWEhWRN4bBEUkCKwPS6bziQaZ2EjEOGcMS6iHmuNQ/pCbP//
X-Gm-Gg: AYBFou1yHA4DQrgwnhGDy6BBeZgc3Y1gZP7X0HovgPFLt6+ar1fMEMUAtUhqAOLY2QV
	MpOLY9hRbslyOB+RjKuLkiSV/IQ2Kdn9spL+JQyRpvzEoJjoGLTWiojZkr2Ct7tTqRYWKGZUSEH
	eGI0lPrNLZzEVKbwkAKOx38yjJcQdCfdQ7qAGCbEVkWyfZEdvmwBJ+PtUOTx6xTwaKMwV9Tcvee
	0H7kqZcx5QQbEDII3jKUkUk9Se5Spf4C39ckxuUnY/z4EYkmgtKCZ8n7b1oRjJrhIfeyXG2j/6D
	wcT8rggZJRnI0T6So9OPJqj3fCLjMwSDwl3OPDpSyhvGHpwsoiodKbzq3DBELLjiXyNOTIawkbf
	SB+VO45GU35kOGtzueZSs3rcdNgYQhYxEfPegDkfxNFGXmpnwRyHXQB49+zHDCHRY0iVEvgt3by
	lTLdTSuJdoZ3ms9367WwXcg3I8KW6k81AEdDFRhsQVFEr/uYrj1k/eKNyhldxY+xom/J/+Jkrzr
	DmBx5MQvr1JYP/ss48qmVXm0A==
X-Received: by 2002:a17:90b:1d52:b0:38f:de97:b06 with SMTP id 98e67ed59e1d1-39b260d338bmr58913576a91.5.1789015528936;
        Wed, 09 Sep 2026 21:45:28 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432435648esm58731485c88.5.2026.09.09.21.45.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 21:45:28 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: corentin.chary@gmail.com,
	luke@ljones.dev,
	denis.benato@linux.dev,
	W_Armin@gmx.de,
	eric.piel@tremplin-utc.net,
	kenneth.t.chan@gmail.com,
	jlee@suse.com,
	srinivas.pandruvada@linux.intel.com,
	mpearson-lenovo@squebb.ca,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 8/8] platform/x86: uniwill-laptop: Fix typo in the kbd LED brightness comment
Date: Thu, 10 Sep 2026 10:14:43 +0530
Message-ID: <5899c28bcbdc04c0c07ae3f1bf8501e928e7d4dd.1789015364.git.hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1789015364.git.hemanth.selam@gmail.com>
References: <cover.1789015364.git.hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "device-specfic" to "device-specific" in the comment on
restoring the default RGB value.  Comment only, no functional change.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Reviewed-by: Denis Benato <denis.benato@linux.dev>
---
 drivers/platform/x86/uniwill/uniwill-acpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platform/x86/uniwill/uniwill-acpi.c
index 7a2eeaec4c96..eeead0159828 100644
--- a/drivers/platform/x86/uniwill/uniwill-acpi.c
+++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
@@ -1705,7 +1705,7 @@ static int uniwill_kbd_led_mc_brightness_set(struct led_classdev *led_cdev,
 
 	/*
 	 * The EC interprets a RGB value of 0x000000 as a command to restore
-	 * the device-specfic default RGB value. Work around this by writing
+	 * the device-specific default RGB value. Work around this by writing
 	 * a RGB value of 0x010101 (faint white) instead.
 	 */
 	if (data->kbd_led_mc_subled_info[0].intensity == 0 &&
-- 
2.48.1

