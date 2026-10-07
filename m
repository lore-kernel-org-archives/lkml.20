Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 942DF4B95B8
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 13:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791380906; cv=none; b=lDGOJNdWc1uXlpAg4GJGG36ktbqAbfBYtouhtkwy8rMdRCXKNH5J42otn1peaaeWnoqdnWaXLY6MbtEtzD/E6WzAp2b/yZf3LMqm80ILqTyqKSa836X0JmYkYDUJZsjtlKJL/BeAuxtcsIxfJURGhyOe5jcGs1+BY40GYeWSLVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791380906; c=relaxed/simple;
	bh=MDiBfIjRAD/9liNRNIW9RrRIxbtM+EmI8HGLCuM5yLo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a0yFKzKkIiFm5gGm+KdqXovOVb1rrq43T5g+CuF5IAt3fzau/AZwTTXBzxGYIXdeI7o48U+/uKVbxVN6wKfZv+3zk8MA5ikgir7RM8fHWTKqObPhRXjNU+5GjaSNPI02j58V88/zaDu24e7uTI0NNPDb4mHsoInkfa5dGSd/4CE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GtQ73ozE; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GtQ73ozE"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-34ca2d54925so6365695eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 06:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791380895; x=1791985695; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZuCUOmx4tSjkz7kbuZkfJEsfg10SOd8hDd0kjVq88FI=;
        b=GtQ73ozEdwNN2qLErJB2zygpZIWls27dGyLIzlSZ8LL3+Fslahh8RzZhogtNqdQSzR
         FDpXfoOvlh7BMpwlyAHRYglsyvvZvqhRKUCEcG/gubgjJXZhEtm8EwrybGzlYqVCyNQ2
         kzNwWKCADAsL5dVnOwyyUbm4UbCTNwbg5DFmSq4YpLMSMyxwSeihYQd9aT0Iw3+bwWiQ
         0+yhklaPvXe8gp7sgJtMiL8CQB7dbCX9OnvV4fMj+9OadKTh/5rANogRglOA/wv4OUlP
         Qnjt+N0zc8yOfJNxUUJhd26SS63VAM1UDQjyEVmy7433Vl8s5+3ttn03RxW6IXcyGJS7
         vNMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791380895; x=1791985695;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZuCUOmx4tSjkz7kbuZkfJEsfg10SOd8hDd0kjVq88FI=;
        b=mKFtpixx5g+2bV0pJynX3jFZ+APWljDTtCdbaYhpzbq0ADAXXTQMkbHas0vjWxNTPh
         H3/X0Hp20DkOzV8qToPWnKrUzdD+AFMV2Oe/hRN9P2rbNf5sAO2YoeijR+eHxblY2lLc
         xPqJQ53KMI70EOUZZSOkR0OtDfw8MPXGhO+jePutjmHbFlQmg2MIFHea+SMbr9N9q4he
         CJPaljqIVA6xnj5jehEpsrf2kHLsTjBaLN0EUZH5EFQ9Oa7CJStG/aJReFmf94ZaG8KK
         sxKtZ2liR0B5MbM2HKUrRwbs0d6IAOfzpn3JDnicuNfD0aKGwkqxBX68jlJeJT7Zd2Xz
         jF2w==
X-Forwarded-Encrypted: i=1; AKwUvBwnLRbknffX9c0cW4sSKnNHBj09sFCNdDVDWWe2VH+V2BZrGJ3RL/XH2EqgCm+opzRvlJLvZdk1Te+OBlM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLc5bXmNNCjHUrJZ5ysy6NNlRsZvcS+022yRvKuFQvZ+4wEk3ki
	5dGX+26pVd+KjMYlcTJK1x7rZ7ZKqU3ciYZCXG3nZM3RiaWR2zdWea6F
X-Gm-Gg: AYBFou1yvq0eh9D/UhGRS+P2J0xtnUdQMrpbzFpALtrJyhbqsGv2Amcch2u5aKXmEx/
	vOZClAc6ND4eOcxPfa809K4waebFYT2Da4pjFLDdwonnXtbohTZyXbdVzHq/XPJC7+aJtNynG2g
	azRc+jkIn03h0ziLZygwMjPKWK/0X8CN1mfCNIg20286c7NAInb7E4949khW6NAWwltHtW0j2gC
	g+8ReycoaxKa3GDOboTwn71306etXd6S5PZlx7UruXG2sY6jGFkwyYkIt0wAXlk9T59IyXUSAfI
	grCx1J37dJ2BCMwOR4Zo9CRTEzJAIodLd7rXy+0ZSUgDpiQZkq9dONIWpp9k0PuA7pOimCUUzjg
	KSZ0RocMv75IMkIEAp/OyLiqcte7BPOdBa2Irl/1UsKpP4AtxdlbMLqdXYKhZr++lRPUGn21IOf
	rPmV9KE8W5fHGGEH3VEO4ouRmi19W6igX6utlgbGaDJVVwdMa5/fx1JCzIeBG0FuzL6mcERrj3v
	dNAb6e6G1/uNkB/90TE9B3IDYO65JKmhL6s
X-Received: by 2002:a05:7301:618e:10b0:33e:c164:b5d7 with SMTP id 5a478bee46e88-3515da27012mr2459342eec.3.1791380895299;
        Wed, 07 Oct 2026 06:48:15 -0700 (PDT)
Received: from fedora ([2a02:6ea0:c803:3091::12])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3515aeb5c2esm7304472eec.10.2026.10.07.06.48.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 06:48:14 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: Jorge Lopez <jorge.lopez2@hp.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Muhammad Bilal <meatuni001@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v5 9/9] platform/x86: hp-bioscfg: fix oops on short integer attribute buffer
Date: Wed,  7 Oct 2026 18:47:11 +0500
Message-ID: <20261007134711.473857-10-meatuni001@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261007134711.473857-1-meatuni001@gmail.com>
References: <20261007134711.473857-1-meatuni001@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hp_populate_integer_elements_from_buffer() ignores the return value of
hp_get_string_from_buffer(). When fewer than 2 bytes are left in the
buffer, dst_size is 0, kcalloc() returns ZERO_SIZE_PTR and
hp_get_string_from_buffer() fails without writing to it, so
kstrtoint() faults on address 0x10.

Return the error instead.

Compile tested only.

Fixes: 6f2c06d5a467 ("platform/x86: hp-bioscfg: int-attributes")
Cc: stable@vger.kernel.org
Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
---
Changes in v4:
 drivers/platform/x86/hp/hp-bioscfg/int-attributes.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/hp/hp-bioscfg/int-attributes.c b/drivers/platform/x86/hp/hp-bioscfg/int-attributes.c
index 5373af71549a..41287e08c7bb 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/int-attributes.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/int-attributes.c
@@ -329,7 +329,12 @@ static int hp_populate_integer_elements_from_buffer(u8 *buffer_ptr, u32 *buffer_
 	// VALUE:
 	integer_data->current_value = 0;
 
-	hp_get_string_from_buffer(&buffer_ptr, buffer_size, dst, dst_size);
+	ret = hp_get_string_from_buffer(&buffer_ptr, buffer_size, dst, dst_size);
+	if (ret < 0) {
+		kfree(dst);
+		return ret;
+	}
+
 	ret = kstrtoint(dst, 10, &integer_data->current_value);
 	if (ret)
 		pr_warn("Unable to convert string to integer: %s\n", dst);
-- 
2.55.0

