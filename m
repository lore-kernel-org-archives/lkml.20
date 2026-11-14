Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794684884;
	b=4yznQy5R5mFq5ZKglQIFJLtgyso9CYP1Br8rbu1i3RqZ0kPpPnomxtZr8zkt2kboSj1x
	 RafRw5fDKtHiErE2XH0SY+5VezETMh0zrc7QO2YWQms2Rnr/+oM2aA1BH9PWXNeVXG8Og
	 uYwh6P7/cM4+cKTrcJ1QSiHX5l0dwLlUDVzD8MMcCwEwt/oqnmlwhqAKujflg4iK8wCAH
	 xPUJPe5rzy2wBIaYwPK2WDnUMetuJR2a6W9xSw62pT356haRzvs6EuUgk+kueGWL10LfN
	 m5yPPwT476qfIfmJXNjLY1HH351XO0PhXsH+k564/Fw3LpeMxBou58nAa11TIwZjA7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794684884;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=GqHSBBvuKVnGq+xQNg0Da7XlBn10HLSlZo3Xm5Uwi08=;
	b=4Vjvy2zStnTwK8AYOpjlCgQNd1PXwvte9Cx3IiPOgZo7gB6qo29c886gWnyMPOBczyG2
	 x7SwsJ6tmZGCgqmpI1VmP5OabZZXQsXHUFGIGGBTNVfqcQ1/oGaP1Vbn3/yQp/Cn4ez0C
	 TYZRlpYD5i69OSjuBsnVg54PcfF3BaiIxfRDBS1UgNsR/brhXmO0UMOppL8s1NQZFit80
	 kO94dg7KoefgzY6wztNQgjhuBsfmfLj0CVOOIMMjtIjOQSSwggyMkrK7k9sEuW3DJjpVO
	 /MLddMlXKnACs3u1n9h27NFbwwjrasN5b3nlihXS4BcS/jaHTTMRm4qCIPQD5fCIwjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HIqjILTQ;
	arc=none smtp.remote-ip=209.85.215.181
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F80606A8A5
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 19:34:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7F80606A8A5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HIqjILTQ
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cd60c5da24cso2004093a12.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 11:34:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794684883; x=1795289683; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GqHSBBvuKVnGq+xQNg0Da7XlBn10HLSlZo3Xm5Uwi08=;
        b=HIqjILTQQcJ4V4N5eYR7zuvO14EW2ejb6vE6C99S3QdaUOvuw/fDCBJijMOpVF1ltD
         Vk8QRg1/8JQHAHmU3D/PF4vWHxqAzuWLfbzbqPw0jSs1qttON/vIeJ6EXbK5qmbe/MJX
         qz3PqT0Kbcym0mbLJQ8djT71gyWpJvDXrk50Piky6iJRYtkcM9aqQYe1d9FiyXKSGXcy
         pQuMUSwYT0rTs5PazEYCR+K79D7Cai/ljVSSaQr7oZPKr+uBnCXF6ptoazJWGzv2nn++
         VXOiv8bytIZDYv7GWT2n7e2VYq7knCcdaPi58z2rOUamEM6aAeaD+/OTEH9dwsGTCcYt
         iYDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794684883; x=1795289683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GqHSBBvuKVnGq+xQNg0Da7XlBn10HLSlZo3Xm5Uwi08=;
        b=JLxZl7/Nx0u+CvFssperzJlTmRr85SN/hne9kZlqlryrfDpEefANQryX1iykKJdCEr
         xvtuiJOSKKsZoQVynxrHm6aSLUj5ej6b8zc4EkXaJ8QNEtuSj7/xq6czuSCua/uINQoT
         D6RxJ4gZ2r66cEBKrI0/jWuACAOz/MyFN1Guts0HRBuGhFfNlJbO2lPFdPdAjKKiKpUf
         Brt7C6YEbfg4BCJiGRlfzkuAhHTD2mZpnMEU/9wGegrX+aUpTAOxXw/WK6B+XT8J0fa+
         eHxPDlGEDUudwy530kkkxNl9SgC3V9ktMw9/NfuXa+ljQ7/YwaNLb/JIY1uAPUUV+cc8
         QGZA==
X-Forwarded-Encrypted: i=1; AL+hErF8J5sr6TyQkta8xGAT4eRbe7FOJzV5Pg1KIKUbD7JEczew3TlxQUvm5TsV9ssQloJ/NQaU3tW/ZyUhP8Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z+RAZjzRLw3FXlLrl6pRg79FhaXCH6L0MYI6B8AgFV2xUEvrN0Z
	Aqev6OKDgPZMjz5pBZYg5I4OA3EARzMixugBU7d/xlGt9EVkaukXkBGA
X-Gm-Gg: AYBFou1yAxUfp4mpBOUj9xQmv8jdxy9lNdVDP2KChPetm7FIPj82l+JznRlFzozgXis
	fPHiyazxfRH/lJ3A4uYy2OKN6ZFJWWMHM/zsczWFUN0JQS667SADc6q1S6F9Kpc99GfZQO8gD85
	6A1V241NAf/fHMf+PwnvlTE9i80sByhCQ6EjFkPPmT0mFW+Yf5SisIe9RLbzI9k8h/V/1Dka0Do
	wYHxBZZmBdAfmSX69aFpW7f1t9hx4feBlX6qJX1fWReN4uSJyZs76RCxIkOS0ofdBSCumscV69y
	ZWe0ws0AQTrfgkeGUv6GCM2wsBvpGAs682nfzhgIhUIQCGm3Hzl8smHrurS+bmONi5U9vrHEPig
	Bgk2/mhpYwddYL5NeGAC3w3ev/uGmfjvjVw2V5MgPFlVQZaAmjN48zQm0+SoYLLrkrkM1vduEOE
	eOpEEksmntiXnL4NkHJhGw9l/w21DAnmRW3kVm8ue49Z27FgGsQvoM7E21MbalgOivCe7ryFYST
	ZdxtxJ69Cj9dobUtVJymYh683CxD62CVStsED/o0GtrVfZ5zjsBarOqnjnC4GKyK8VbmKTEIFel
	fczsLcCfjAYE3Sbm11O6mI5RPeLNPa/dJZF79vok8yBpMBC4QGSJjTGeyE1eAgJpvsYMCHCHNwV
	AcmfqkyzUCDcV8TxLDTZ5sotpVxSe3+gyaXdKOVeSVeTUJKWSPFWUx0K/pVTUBXgs6kldl180gw
	uxDAqQJ6ld/JrOGxm5mxLL2ifRY5Z7t9UwZr9r6sgB
X-Received: by 2002:a17:90b:58f0:b0:3b1:4eb6:b3a with SMTP id 98e67ed59e1d1-3b1b081887amr6439067a91.8.1794684883214;
        Sat, 14 Nov 2026 11:34:43 -0800 (PST)
Received: from sid-dev-env.cgrhrlrrq2nuffriizdlnb1x4b.xx.internal.cloudapp.net ([4.155.54.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b24938bdsm5093969a91.1.2026.11.14.11.34.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 11:34:42 -0800 (PST)
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
Subject: [PATCH v2 4/4] tpm: tpm_crb: Use cached tpm2_acpi_start_method
Date: Sat, 14 Nov 2026 19:34:34 +0000
Message-ID: <20261114193434.117714-5-sidchintamaneni@gmail.com>
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

Check the cached tpm2_acpi_start_method value at the start of
crb_acpi_probe() before mapping the ACPI TPM2 table for CRB-specific
parameters. This avoids mapping the table when it is absent or when the
device uses ACPI_TPM2_MEMORY_MAPPED and belongs to tpm_tis.

Signed-off-by: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
---
 drivers/char/tpm/tpm_crb.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/char/tpm/tpm_crb.c b/drivers/char/tpm/tpm_crb.c
index 4749a9183726..c1c2b72459a2 100644
--- a/drivers/char/tpm/tpm_crb.c
+++ b/drivers/char/tpm/tpm_crb.c
@@ -945,18 +945,23 @@ static int crb_acpi_probe(struct platform_device *pdev)
 	if (!device)
 		return -ENODEV;
 
-	status = acpi_get_table(ACPI_SIG_TPM2, 1,
-				(struct acpi_table_header **) &buf);
-	if (ACPI_FAILURE(status) || buf->header.length < sizeof(*buf)) {
+	sm = tpm2_acpi_start_method;
+	if (sm == ACPI_TPM2_NOT_ALLOWED) {
 		dev_err(dev, FW_BUG "failed to get TPM2 ACPI table\n");
 		return -EINVAL;
 	}
 
 	/* Should the FIFO driver handle this? */
-	sm = buf->start_method;
-	if (sm == ACPI_TPM2_MEMORY_MAPPED) {
-		rc = -ENODEV;
-		goto out;
+	if (sm == ACPI_TPM2_MEMORY_MAPPED)
+		return -ENODEV;
+
+	status = acpi_get_table(ACPI_SIG_TPM2, 1,
+				(struct acpi_table_header **)&buf);
+	if (ACPI_FAILURE(status) || buf->header.length < sizeof(*buf)) {
+		dev_err(dev, FW_BUG "failed to get TPM2 ACPI table\n");
+		if (ACPI_SUCCESS(status))
+			acpi_put_table((struct acpi_table_header *)buf);
+		return -EINVAL;
 	}
 
 	priv = devm_kzalloc_obj(dev, struct crb_priv);
-- 
2.45.4

