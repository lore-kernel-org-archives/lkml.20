Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793092645;
	b=j13BXDlTK6NIHLeMEsC6Goq/BgECLyjDhWix4uPIyd0whCwqqXFnzsvs8QAxuMCkvnH2
	 pEQAcagUIXZ5ZSca/IswnVvcTJfY/RXb9ENdPqv09v/ugPcG8QOg8QQ1sTRbu0NiW1tzb
	 UNuvgxgmoWdLrOOugR3Qmh/vCVAzv9OLkbbMediZMUDk1DHpDnNERdC/qMStSWUZgmH5U
	 F+4i0cB8G/YqowECcaQd5eCBH2DfrxDRwsv+HSBN30Y6iWabL5iPTBSOfwzfcQHF0/v94
	 EOPftXd601QraNgcZSzfuGvdLgukOh1tjklJ0Uszfyf7XzPp7au2YuN3wJi459+rNFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793092645;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=BYO1LCrBdO/1rW137ihu+qMYvRXrwxqu19YXsxXN9n4=;
	b=Bt0HSs7MPDdw3L5IY2CkYdKMury5cAJncWOEaXGrNK+mub38RnqTjUAqEyKI2yKW44Aj
	 Bv/VMxlozAdNghOWVjR1J1lKdRKqd4gEkCm4gKRNrRPY0U7xVlbFA7PqjN7/Zyxxb4OK7
	 p/Cmd33aAmYKK95BbaWh7da75GK/gsbdsIVROZRA0dCWymIaE3q9/lwpgO69sE0FdWhyk
	 1urc0KZJFvwSNS7QVn+T5nUnsmxt6TGoxyDszNNVei9tG0lJARlbXMyqs7lFd3OBst4VV
	 r2agzrCklMT3Rh9K0Wle9Y/UrT13dEO5e19/ciyxpmKDLS4jOzlG7uPcvKDrwiAiEzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="TX2igjr/";
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1401B606A324
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 09:17:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1401B606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=TX2igjr/
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48bbb06e746so2030330f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 02:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793092643; x=1793697443; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BYO1LCrBdO/1rW137ihu+qMYvRXrwxqu19YXsxXN9n4=;
        b=TX2igjr/YVsXHN0PtuGPNtIK79wbtn/aLoghyoZfcsAq1DpkviCzXZh9vl44F6n9QG
         HVyQwnBvo722JIsC22xvkknUbhnJBvDnoZ9sUwEdAzniBhMI9Mni19p1LfWYKcEFRUjl
         uwO31avYxJ7a2iGdEMZ24uqi49hmAD286DJxm+wmBzWqb//g5hfXD2URKUMFe/KCtp8/
         /lJ1M4nFIeAe20DyO118jzOlPsL2oYaJLVZ+7mWrLaUeW305JnHoB1aUbRECn/Kml6RY
         OZ2l2/jTIGIsZ+1Oxhvxfz+ZrQ3P1FIvTiUZ/nuPp8pfjj1E4+aYUp7rAiJ0kMoPAb9E
         iu9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793092643; x=1793697443;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=BYO1LCrBdO/1rW137ihu+qMYvRXrwxqu19YXsxXN9n4=;
        b=V2/OwbPfxoajBj5n/nnqRwdzz4KKkK2SE9xfyAVrkad3ExzLgKXMZrUY5Wq+wG9c5/
         +WgQVtCasjfJk/APg10ouxH9YYmyqoQWFLmBPcsdrNVni0L3QuoyITo4xjb+nBSsTpK8
         G++SXOLPduHgnIViCVC4KjomWVSfnCtaWL8JrBDaRYGwcP7DGXZ2/AfJKemZNphwSBLe
         Z6mbKvUec9N4c6IpgqgSa/3gOzsmO+qq32pQbxx9/Umv+7tfdHRd0q5A65yxZl2vyWpY
         ZzyK7k7C1mJsdw6Zu9nLWLlS2sS2KMqiMK0+sdVzI0APOE69N4D55TgRCE7PsoEgYRqq
         HkgQ==
X-Forwarded-Encrypted: i=1; AKwUvByZ8KpIqu7qKCpxFHjYLppmoFZdo2d8/03bmlKXGlugT1SZ2ekOoL1boItVaXVMLAot5svJ2tdCh+qoKc0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJxBQwqqSgOJx7e4ORLINTeWfdLgC++lXnwBCYeBeLJMN5Q28t8
	6mu3AeOF2OgfcniiAoPuDsr2m4BLR+v6NPwEMUXZamRPhTiL79z3VPBj2RRNTWwv3Zs=
X-Gm-Gg: AYBFou0QLmF6X4RZmcUnjhJUAQeX/DI8p3/psP01hMrvLqENd671SDV0j/kN5IxP1/q
	mh7WZImUDzzcVCOhOELY2AzRbpETu/NPLP3V4v2KfKyKpHit2KrCWO6z3QKDvzmmCxxVjwldrj5
	7gKd83HIOscfbm4YvydyF6Dnytn27gCbADx41lqeceocjTB5RXPh5xzGG9dhG9KNtilHIzXIlnT
	hXu2vLjJwBCY360TZGYNomFN//P3DeMOXwXZOWLS6+6A5TmUXaOL/XoLkSWYlu/EbkMBjLiDMcH
	Uwvkp3v5bnQRcGYfp8gDPlb8i145/4PtHpRMnxQBv4S8sN2fIimqmdcwfllsEQIqUR18zC/ikq0
	2FsKiP6s+NbzHAiL1gwzCxRqAO7wjQF3MWbSHBjM3L0y/VTSy0PNIMrRI/oG8LqoZD7ixwhE5Db
	K+co3H68HWublS+DIkJSy16jJ/rwbhh/OyvNXpoV/L3QE5nNTxdiyVp4FAxURPhuAQzk9nFO8Ce
	r1aaRVWkKxgnqIgxrwPl0WgmNCdwop7hdpFur3EHgMS5hEUm8Va0MBSNjw=
X-Received: by 2002:a05:6000:2901:b0:48c:6d9d:9f90 with SMTP id ffacd0b85a97d-48e56f6f2cdmr2719219f8f.26.1793092643113;
        Tue, 27 Oct 2026 02:17:23 -0700 (PDT)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ece5e4asm21131779f8f.59.2026.10.27.02.17.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 02:17:22 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 27 Oct 2026 09:17:06 +0000
Subject: [PATCH] coresight: etm3x: Remove redundant NULL check on perf
 event attr
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
Message-Id: <20261027-james-cs-redundant-null-check-v1-1-ed9486be26e4@linaro.org>
X-B4-Tracking: v=1; b=H4sIABFs4GoC/yXMOw7CMAwA0KtUnrGUBMTvKojBcQx1KQHFDUKqe
 ncCjG95M5gUFYNjN0ORl5o+coNfdcA95augpmYILmy9Czsc6C6GbFgk1ZwoT5jrOCL3wjeMfrM
 /kIvk1gzteBa56Pv3n85/W42D8PRNYVk+wdkFzYEAAAA=
X-Change-ID: 20261027-james-cs-redundant-null-check-b1489a0ba03c
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@arm.com>
Cc: coresight@lists.linaro.org, linux-kernel@vger.kernel.org, 
 Sashiko <sashiko-bot@kernel.org>, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.15.2

attr is derived from &event->attr, so it can never be NULL even if
event were NULL, making the check dead code. The only caller,
etm_enable_perf(), always passes a valid event anyway, so remove the
check.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-c4ca0d3c-1e98-4965-aa46-da226c756b83
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-etm3x-core.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm3x-core.c b/drivers/hwtracing/coresight/coresight-etm3x-core.c
index b670a324bb41..755141691f69 100644
--- a/drivers/hwtracing/coresight/coresight-etm3x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm3x-core.c
@@ -313,9 +313,6 @@ static int etm_parse_event_config(struct etm_drvdata *drvdata,
 	struct perf_event_attr *attr = &event->attr;
 	u8 ts_level;
 
-	if (!attr)
-		return -EINVAL;
-
 	/* Clear configuration from previous run */
 	memset(curr_config, 0, sizeof(struct etm_config));
 

---
base-commit: 343cfcbb3ecfdb80aa576a428cfa3b65ad783842
change-id: 20261027-james-cs-redundant-null-check-b1489a0ba03c

Best regards,
--  
James Clark <james.clark@linaro.org>

