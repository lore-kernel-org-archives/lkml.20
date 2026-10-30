Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793390833;
	b=QwJdpe3jYxusAE/e6zxTCU1G7d5YlQY0B0BCG7jelcLcjWu1JWwJ79bMd9tXrIJ8K721
	 0iGSQxQkw+/Gm43Yj8ft5dGBCs7Hr+EWWn9We8BrGgmnbNtpD1elxLEhfZh0MRsEYVVyN
	 PcqKsI4DXJ6sO7YV91nhKzNprXmzxuikBEmi81q15S5Lu9MDEJUhXvtliejt8leRjoXod
	 tQVT6y7Zm+VHLaTlKXvTjJU0OeoAK1cuss0IhdzdyAPe3QNnqnv13004BgplJud07r7+i
	 MfIO4oA4ySuJjepV96+E1XX/TLEzqKfQgrXBAwaGxI3Tupg6pC5K/HLaaGFelJOLKKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793390833;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=d+pX9N1kFcamoWGS6O2wutMA7nvNx4/Lu88LU4koO24=;
	b=0jajzaa1bjU94yIUjdfUXuSC2W6ALo5XzxpiyBT4OJvksOLDEC/2dd9/sZm3HNxn3sVO
	 drYbSgdxqCcKBsAXw3QkBSU6AzbsIWGB/clbMo3q5T0ZFQVsreBdendQWk6ZlJqYrTNOE
	 xzulwLD11PeZeTQeZ+xInvqxkoMS6cbqMsYKr5ZfmhHnidFOVAz7WvRNKWpTYNaee1hBh
	 TbUBkr8sq19pX6252VAIPuYcN0s3VCP3wX2WLb4EYzBRqwUDROvqmR/4tDoVItOpA9W6k
	 Tgbx8pjUjvb+zl/tRdIoCzQ+b5tdr/x+RbKqGBt0FMi161MMpCk7KDtp3AKA5dzO83w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZSDAba6j;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Yh8fRN+b;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A00E3606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 20:07:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A00E3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZSDAba6j;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Yh8fRN+b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793390831;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d+pX9N1kFcamoWGS6O2wutMA7nvNx4/Lu88LU4koO24=;
	b=ZSDAba6jGgs7PYXgZ78McONu7UNIrzPzeCeAtQxC8iQGo7NILQjrA4Dht+eV5lX8s72wd2
	47VPh7R5sgl5MofLHC+/B3OretdjfZ+SVxku4pptf/Rr/3dSCN4E0KDFGICinSPClo2lj7
	45vxc6ztD32YgPWqMmqY3rryHeP9C+4=
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com
 [74.125.82.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-148-5NnOvYbwMpC9NoA1-T0ydQ-1; Fri, 30 Oct 2026 16:07:09 -0400
X-MC-Unique: 5NnOvYbwMpC9NoA1-T0ydQ-1
X-Mimecast-MFC-AGG-ID: 5NnOvYbwMpC9NoA1-T0ydQ_1793390828
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3662e7a9299so4058561eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 13:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793390828; x=1793995628; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d+pX9N1kFcamoWGS6O2wutMA7nvNx4/Lu88LU4koO24=;
        b=Yh8fRN+bcSSi3jnFjAzjdvj888KIf6WI3gZqrdSJrdwJHGETbcD1r4JvP7uF6td9Op
         TSlZAkkDEX43XE+FSj4HRJoKklbZkHslF5+7vDnqvAlzM76arX406Zr1NCHISsQFOn7n
         +EAQnzl3B0MfZouA514AJNBLAteHqeOiskvHlXCNIFpS+gJRvr85MqMNd4dUZ5iwU18Q
         54qpKhRBh86amUVXtOZ39TzqnhxKMgi0kncoSAIq0jiwT3N+Q8aA8lW6TAksddwn10Jb
         P8yAiJ+iiJblTl4+rpMG/q4oZbrd8WnfCYTJ/I2DlTuUXDov3VmLmEgbOMiO6itvJoGj
         GhyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793390828; x=1793995628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=d+pX9N1kFcamoWGS6O2wutMA7nvNx4/Lu88LU4koO24=;
        b=wi2ze6/RZ2J6umt+mNWFKGWAIc8iR1UYBZsrNT42gr2B+7MlGqhEA0RQt7Oh/AO8PS
         SKNU4vyESdVIzEdEPou/DxxGryTK/YYULz1N4LjEWlQBmPxsz8Xm3a/jpd7LIeNyQTjI
         XdLC8hpF4wOukQ8lQuGKoAla8uxp0PJf9a9pMyxTLuhuY3mgqlnbYAT3MZVNBGwqQ4ro
         2Fpq5ZiBI47sVGQi61vHej+aYOk7ZJ5jyDfeaxeL+XuXqNgWdqTkUA1LCWpVfCa/NGus
         ahZvGl58vCgNuo4BZopMe0b9zqNUej52RPyaoTaGLcyNHMi8/AXZMX5blB/XObGFh0rt
         Zprw==
X-Gm-Message-State: AFq9FYJ3QnWZn3xqi3DlSCMozo2PCga2AOlAtgRSHfD/8Miz6BcuygN8
	VyEJpCwYtqSvCq10syscy8dfmi8+PLYwzFzncCD+ko6KrYhf7G3jOQG+UhV2FuR/65eXZxXEI5I
	h1oiSPAzv3t4RAeEifFVDP99c1O40gSIo5IAtnJ+ihpQDvDJRzX5vUsdwU5XhhbDpMY2mQCvYHx
	bhUErkV68aivTEzsGrSrZq/rA8ZHTT6ED/QJ4tPAc4DSkt004H
X-Gm-Gg: AYBFou2ExfwLkrkzU3F0JBbru0YW/uzpqXlg6Bx1Zoh+TRb8mFbuHmtqskqDzmQt7Xx
	JOeo2tb+WL5Fm1HJj5roWyQiqQjPjUz1tX2WYeHRMeTSYRMN5se0UtX4iF2a++MzDC6obgxvRHi
	Ha6HNhizxIP4pEt3P9u+OhvGBLjipFIVyehUCPjYTy0hZEVF4n2GbXhX1Vj0bUbU5ItM9TscH89
	3ysiMSEcdDcbegJ2K/qaD/uVXCjk5i5nh1DbghOO3AZvsn/orAjfFCDDmmv0ypLIGws7gREGlmk
	ysZr6YA8Wz6lBHOUmO40gZa87cHxfHTVN7C7cICz0FiXA78b0cffheaEL6KtPved7PETE9aHkte
	xTUYfjdrCnPl5e2tbTBRENc6CLQazELKMsVWOuprbB0daWEPkCfmadCf0y54iljxJBNH/elj6EO
	mqwDUOXsJ2jNVYFw==
X-Received: by 2002:a05:7300:c8c3:b0:36a:1b62:da with SMTP id 5a478bee46e88-36a42340be0mr4770738eec.12.1793390827577;
        Fri, 30 Oct 2026 13:07:07 -0700 (PDT)
X-Received: by 2002:a05:7300:c8c3:b0:36a:1b62:da with SMTP id 5a478bee46e88-36a42340be0mr4770688eec.12.1793390826746;
        Fri, 30 Oct 2026 13:07:06 -0700 (PDT)
Received: from fedora.armenon-thinkpadp16vgen1.bengluru.csb ([49.47.195.13])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42aa8999sm10581834eec.29.2026.10.30.13.07.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 13:07:06 -0700 (PDT)
From: Arun Menon <armenon@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Peter Huewe <peterhuewe@gmx.de>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	linux-integrity@vger.kernel.org,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Arun Menon <armenon@redhat.com>
Subject: [PATCH v6 3/7] tpm_crb: Add start_cmd parameter to tpm_crb_start wrapper
Date: Sat, 31 Oct 2026 01:36:45 +0530
Message-ID: <20261030200649.357508-4-armenon@redhat.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261030200649.357508-1-armenon@redhat.com>
References: <20261030200649.357508-1-armenon@redhat.com>
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

From: Arun Menon <armenon@redhat.com>

The current implementation of tpm_crb_start() is limited to triggering
the CRB_START_INVOKE bit. To support command and response chunking, the
driver must be able to send other control bits, like
CRB_START_NEXT_CHUNK, using the same platform-specific paths.

This commit adds the start_cmd parameter to tpm_crb_start() so the
caller can specify which command to send.

Signed-off-by: Arun Menon <armenon@redhat.com>
Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
Link: https://lore.kernel.org/r/20261029181541.99505-4-armenon@redhat.com
Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
---
 drivers/char/tpm/tpm_crb.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/char/tpm/tpm_crb.c b/drivers/char/tpm/tpm_crb.c
index 148ef5c487ce..30ca8192d3a8 100644
--- a/drivers/char/tpm/tpm_crb.c
+++ b/drivers/char/tpm/tpm_crb.c
@@ -446,7 +446,7 @@ static int tpm_crb_smc_start(struct device *dev, unsigned long func_id)
 }
 #endif
 
-static int tpm_crb_start(struct tpm_chip *chip)
+static int tpm_crb_start(struct tpm_chip *chip, u32 start_cmd)
 {
 	struct crb_priv *priv = dev_get_drvdata(&chip->dev);
 	int rc = 0;
@@ -459,16 +459,16 @@ static int tpm_crb_start(struct tpm_chip *chip)
 	if (priv->sm == ACPI_TPM2_COMMAND_BUFFER ||
 	    priv->sm == ACPI_TPM2_MEMORY_MAPPED ||
 	    !strcmp(priv->hid, "MSFT0101"))
-		iowrite32(CRB_START_INVOKE, &priv->regs_t->ctrl_start);
+		iowrite32(start_cmd, &priv->regs_t->ctrl_start);
 	if (priv->sm == ACPI_TPM2_START_METHOD ||
 	    priv->sm == ACPI_TPM2_COMMAND_BUFFER_WITH_START_METHOD)
 		rc = crb_do_acpi_start(chip);
 	if (priv->sm == ACPI_TPM2_COMMAND_BUFFER_WITH_ARM_SMC) {
-		iowrite32(CRB_START_INVOKE, &priv->regs_t->ctrl_start);
+		iowrite32(start_cmd, &priv->regs_t->ctrl_start);
 		rc = tpm_crb_smc_start(&chip->dev, priv->smc_func_id);
 	}
 	if (priv->sm == ACPI_TPM2_CRB_WITH_ARM_FFA) {
-		iowrite32(CRB_START_INVOKE, &priv->regs_t->ctrl_start);
+		iowrite32(start_cmd, &priv->regs_t->ctrl_start);
 		rc = tpm_crb_ffa_start(CRB_FFA_START_TYPE_COMMAND, chip->locality);
 	}
 	return rc;
@@ -499,7 +499,7 @@ static int crb_send(struct tpm_chip *chip, u8 *buf, size_t bufsiz, size_t len)
 	/* Make sure that cmd is populated before issuing start. */
 	wmb();
 
-	rc = tpm_crb_start(chip);
+	rc = tpm_crb_start(chip, CRB_START_INVOKE);
 	if (rc)
 		return rc;
 
-- 
2.56.0

