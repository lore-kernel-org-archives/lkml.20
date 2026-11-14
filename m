Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794684883;
	b=3NWyNIKSGU99x2BcSRFLXLqwPBH1FSJyzCHCqEeqHfwrO8RxvKEJMq+NZ9dWNm9yOG36
	 mxM37bpbExC8gCA3kBw15bsub54gGhfSL0oG5CFlpK8uRN63hT7nIYdZ0Bk7FAHdXNC7O
	 u11Qzskm6xhhVALIXVPzXxxValJ1kdQW0yarNEfSWBqDOyU/CyxCekp263LpbkfsIRNAi
	 6kmwqvqsnALW9kTxLj2YgC2p3bzH3zgIBblxYEU4bEs2C6wwmuw2F+ycdx20bYI7mSrnA
	 u+4rhX78Q/+LYHUoR33olzNA+ruUXWHGnjnJkvpCh7qa7r+dH9sq2omVzHzWoE/tNkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794684883;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=5irTJeCQfqm7AWnnyXmuLFQGD8l/R9bAv0K62WDnA+o=;
	b=c2DajAdkRxbp7iPa+hmUTTnMrF4DENH42HIwh6B2xCZANwLxpK2V2sP07OH20FyjgPGd
	 C2bdvOONXbHu/46SFflSQdWSR9P0bmqvxbM7v5pw7hCiu+u7BCfXSrNsbK+TxlAroNjqH
	 hwgPBhCdQJyXDATryJyHuKmFYbtKSFzn0ZSD8wJKJf8+myXmx5S+ijCteYYvDKvo1gPvL
	 r8YgEbD6P9+7vknGyRkI1ju1LJG43xo7bM1iKqnUSTXmASEMVbFHz2wFMy7lI2UHOVuV/
	 M0sM8BUcH4yC8J+3vEVqIn5+8B1RqZNckhFJW64gesdF/Tu17y0EU3RiII8qcYG3dvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZSwJXxE8;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD018606A891
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 19:34:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD018606A891
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZSwJXxE8
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3b094e649d3so2147871a91.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 11:34:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794684882; x=1795289682; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5irTJeCQfqm7AWnnyXmuLFQGD8l/R9bAv0K62WDnA+o=;
        b=ZSwJXxE8C60iPMVXxd+x+sdue0oR3ePZsQuYbPlj0+90EAxgLPID9NVWeIBdHO6cpk
         j2k+ptGu/gXthz/j039nJSFXEL1yORjMEdLGMal6SMrYVTlkG6t7ASzF+hUD+xcONbV9
         VthC+0Bjwnd6HDBl7/UZPhd6pSwJMIbjQHxIvDKfP8qPH8jZWIyKVi5J7BVwyaFFaZFt
         0U2E5GEN/V9JK5JEka7Tzhv/H8DXzoxKu+bFybbiPVJDoM7AahveNIsoKafzPWD9tMjp
         zmA7WSbAzBcHhCf8liZkohbAmpPixwVKjV0IvnN5aYJ8VeuT9jijkULCe7r1dDtUZxC0
         FRoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794684882; x=1795289682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5irTJeCQfqm7AWnnyXmuLFQGD8l/R9bAv0K62WDnA+o=;
        b=Mo1E9NWxWEgkh/Yww4WVMBZyqVI4y1VGVS/l5FTDL48BzSKSvyO5G9AKVDwje1FCgE
         XDKcO/FV6UM8tZX9bntqUQKhMRuz56tnJPVJ+9ETgfeXXzPOyWE00HTfLUzU1Jwfyx/m
         IhD7wbS4fywpKfNGobQ6fmX+8QgvwEjXg4AVSj8YshnRSQICjkHsk/+dAlNXxZeJVguo
         ZiHVh+ogxKtljRdE2jjEXdNM7g2SanH/NtDn4bj1PufnZ23h1lu+NKHGzpT28xV65pHf
         sO8ZdghE1rXD5OSnhEid1V1oyX+6kyERetbggUREXRsB6C3GWr/54mnhRUypyFWFGTT/
         FPjA==
X-Forwarded-Encrypted: i=1; AL+hErFHxjDzTTgntLpPJIDzCf9KVZj/WH8ea5+9Unh4kmDIswJ/NN0U4AyawnBtz1CeRBXQL30KvTEbmrokpl8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+PHfVwfrHjdylkBbycJWyPpLMtxBg1WETdh6couaLHRnK4reVJ
	KMFOpzAPmIvA3ygLK2sz3TloY2HjZoAZN9uIYEmZTq8+okXYnYba3BBy
X-Gm-Gg: AYBFou1dW5D/+hBIxAY+WuRsvilIsM0JUiCuqHn4fIGSdyzG7orqPgDnEzRVffPNhn/
	HB78djxk8D5iCYVnXb/s58JlriTFi6AOvsg8D9fxuSBYoOl9gZScw4MPH3X+mjuA2staOsBHX9y
	tEjr89Cm9U2npRJ6m9nv6P6Y58cPmF9ByEXkq/toz9fCxQvGHBt9152o9g8HJIcf6nVmJUfakxZ
	O7fAlGKBuy5jpnErmfL5+Eg85BbPmNg5ZCbOZPDic/yTA7Ug1/rQwz23xcFLw8fQjZrj6/t1Jzi
	oqUQJi0BYr+9y+7m+KYP2eEfQF47a0XbEo1urtYl4Sc7EUP6+DZtTpjJIwrVmSHErzlUjRX+cKh
	j7oMif4Y5KmQbNQ2Zp7tKZ6Mwb5eDTBm2efmCdQxwoHpcOteMmXu8QYh//y8Iiudc4BqY7ths8g
	uLWY6NZZYxHjC/0VGizkF8/QVYUSoz37ogVT+0gV8SjpbG8lm2dcyJLB5iIvS9Nb5nDX9q0WvsA
	6GrhH5u6cl0aO1CoNBm6gPjkV/c0+Z5v7VsAqP8j6wS6naase3Im3PsK1kSkJqpWTtZO0oPgsOU
	mcpmdmlWY8VlQpOa7IF9XpwR2PK5b4WrKuCgeRyZZPMfCT5VKb2Zd01zjk7A6zulVZjgdo9KQHI
	Hzp8pNmZwCSn+VDXOUFQ1ithKrclOUvTAiWeU2+JsKRuyva2Y8r2pT/7kp+c0n5Dj/Mod0TKhk5
	5eOVMh6NqXIwBo8Gl28hQOBXmT0SkHrxnuHrTP1whc6A==
X-Received: by 2002:a17:90b:2882:b0:3b0:9a2e:b491 with SMTP id 98e67ed59e1d1-3b1b0dacca3mr5922566a91.66.1794684882159;
        Sat, 14 Nov 2026 11:34:42 -0800 (PST)
Received: from sid-dev-env.cgrhrlrrq2nuffriizdlnb1x4b.xx.internal.cloudapp.net ([4.155.54.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b24938bdsm5093969a91.1.2026.11.14.11.34.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 11:34:41 -0800 (PST)
From: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
To: Peter Huewe <peterhuewe@gmx.de>,
	Jarkko Sakkinen <jarkko@kernel.org>
Cc: Jason Gunthorpe <jgg@ziepe.ca>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Stuart Yoder <stuart.yoder@arm.com>,
	apais@microsoft.com,
	rlmenge@gmail.com,
	hargar@linux.microsoft.com,
	linux-integrity@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Siddharth Chintamaneni <sidchintamaneni@gmail.com>
Subject: [PATCH v2 3/4] tpm: tpm_tis: Use cached tpm2_acpi_start_method
Date: Sat, 14 Nov 2026 19:34:33 +0000
Message-ID: <20261114193434.117714-4-sidchintamaneni@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261114193434.117714-1-sidchintamaneni@gmail.com>
References: <20261114193434.117714-1-sidchintamaneni@gmail.com>
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

Use the cached tpm2_acpi_start_method value in check_acpi_tpm2() instead
of mapping and unmapping the ACPI TPM2 table again during probe.

Signed-off-by: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
---
 drivers/char/tpm/tpm_tis.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/char/tpm/tpm_tis.c b/drivers/char/tpm/tpm_tis.c
index 6f8344894ea5..a6fb6f889e7d 100644
--- a/drivers/char/tpm/tpm_tis.c
+++ b/drivers/char/tpm/tpm_tis.c
@@ -138,28 +138,24 @@ MODULE_DEVICE_TABLE(acpi, tpm_acpi_tbl);
 static int check_acpi_tpm2(struct device *dev)
 {
 	const struct acpi_device_id *aid = acpi_match_device(tpm_acpi_tbl, dev);
-	struct acpi_table_tpm2 *tbl;
-	acpi_status st;
-	int ret = 0;
 
 	if (!aid || aid->driver_data != DEVICE_IS_TPM2)
 		return 0;
 
-	/* If the ACPI TPM2 signature is matched then a global ACPI_SIG_TPM2
-	 * table is mandatory
+	/*
+	 * If the ACPI TPM2 signature is matched then a global ACPI_SIG_TPM2
+	 * table is mandatory.
 	 */
-	st = acpi_get_table(ACPI_SIG_TPM2, 1, (struct acpi_table_header **)&tbl);
-	if (ACPI_FAILURE(st) || tbl->header.length < sizeof(*tbl)) {
+	if (tpm2_acpi_start_method == ACPI_TPM2_NOT_ALLOWED) {
 		dev_err(dev, FW_BUG "failed to get TPM2 ACPI table\n");
 		return -EINVAL;
 	}
 
 	/* The tpm2_crb driver handles this device */
-	if (tbl->start_method != ACPI_TPM2_MEMORY_MAPPED)
-		ret = -ENODEV;
+	if (tpm2_acpi_start_method != ACPI_TPM2_MEMORY_MAPPED)
+		return -ENODEV;
 
-	acpi_put_table((struct acpi_table_header *)tbl);
-	return ret;
+	return 0;
 }
 #else
 static int check_acpi_tpm2(struct device *dev)
-- 
2.45.4

