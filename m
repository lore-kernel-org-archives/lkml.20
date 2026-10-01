Received: from mail-qv2-f41.google.com (mail-qv2-f41.google.com [74.125.230.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3026E4A64C8
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 17:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790877318; cv=none; b=DN/pwoXfqvHisYAkKXWxXK5bX26YW2lLlo3f/gKBTm/bWxmfzEwvkO7kLGvNbIau2+RqV2gC23qDfn3E3b10Y8MS1MyzmG8dAC8VPQ/Z2Z+tJAMf1le0XgOx5+TtrZYrNRW18m8a6Did8hjSsXyaTdQ3Ru9Nl/I6Vk+TXWiPcRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790877318; c=relaxed/simple;
	bh=j5qbuXrDX2plwlT/z3lSzoNInbPkdLmaRYkhQoo2lGM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SBiDbKH8+MIrxcNrAPTPYPKTlmmPCLEPFJIAv2rwStH+rCYRKE1dcS9IOqJxJALf1VM6ddK/n0uwYo5z6VVNUwcIKvowQwf78E1cCzlVtdShJ4QUQHcy1RhHf6xPCFXW7Z/NZsZCNz8BIZcB/WueStzVL+sCjW+1C1wOL+7tqyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qIPTZDM0; arc=none smtp.client-ip=74.125.230.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qIPTZDM0"
Received: by mail-qv2-f41.google.com with SMTP id 6a1803df08f44-9179c1f49d4so19614386d6.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 10:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790877308; x=1791482108; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lfjo9pAawGhp175tsWiMgt+u8R0WsNzuMBsHkL3MrJQ=;
        b=qIPTZDM0c/Gj6EXjjDOZV3mYA0aDWCjPwJar//JToJ1LZ5D11gltJ9OJJetbSryOu0
         AejFTNqt2ER9Pd3f2mQFUCAFqlTBqNoP5uqhx+gfkW1DXrY/ayQRZwuV4tpPa4mSp/Ij
         fElMqfqDoksjJ+unPLXT4o3XNxDpEcw8Hokq8MOTaV/FOexBlLPyayEyfcrpVSC2tgBl
         is+A0BmfBhGSQfcEU8RudiDd/OktcUniDscZJEiSV8yzEEXuRRfrWJJn+anMl3jkfsuI
         auNZmBFHn689J2FcTXmqHLIvNRb/KPRfqJiz13oyTcr7D6RcMk3QZz78ePjXzSn3W74r
         DcXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790877308; x=1791482108;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Lfjo9pAawGhp175tsWiMgt+u8R0WsNzuMBsHkL3MrJQ=;
        b=DYCyvDQVvt0QC1cY/WO6/wiOnqMO8+0x/uAP2dtOvKo2xapRYv8qD1YRGGG5wnbb/S
         nUj9eHKXa5W4OWZSYhatmNCyRaQ9iUKKtQfrqbXCiVixKllCBqqB9+vm2Z7AW5E2yWpk
         3ma20hwejujx8Og/3wk7ShyP3HkyAI3+TKVmPWN+9fNgK+Sj91ftS2diK9/LDlKVyqS3
         srrioEULxfWhknSQUEl1zjP4ZTsAfUB7PDQnxyhAnqsLzT62zbOgeZ9JUIUvUjxHRFyw
         qLcW5qmGRsLbXNuLc4mKZsBEc9wtDDetih1kAkWUGvY9XEsflF5FXjGe/z0EWiqllKrJ
         Y7mQ==
X-Forwarded-Encrypted: i=1; AKwUvBxSRdmoXVBdbw7xXiZqkL52zFQN7kDX1qUJrpLVAvnaMD+AqH9fSq0trHpiDi223xf62u3SMbC5Txwt6j4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ8hXty+0q0nj4lOjTb84hy78QJR+yhYTTWi6duMFPT4k4se90J
	3rSJFmckibtsT4AZILu5BdNqBHOhQxPM5JyQSShCKbVLnSuRaBbr5i8=
X-Gm-Gg: AYBFou2m0miV5Mz5mi0Tk1ENcsoJzyHho0NJ8zHWq0uknGlQlXgEcCpN18qKjFOYLZa
	gXN6sP/uC/A50uls3uOGy44EEhEGjGGW/aoTOocYD9VwNS/ZrEq2VhKbqKDh+I8a7gCUOFX+0DB
	5YTGne4nNWopp9dP8m17Ln3bBYH2/Os/ylvTc2mrKh8nuQrT19X6HBsieNFQ4KbqLCT5CPPlRzC
	ciqo+fjy2kAiR4+WsFn7Z1qhpWstoUZu0RuzLQNk0ozRA6EiVXlVngscyjGIKolaZvkfQRHrY+I
	MsyKHqTH5SJuk+uzze54HcMeVg/+6ODtl/FAiA8QX2bQuSNu9GojRTkFThALa+pqBdK8uPH6EGe
	do30Vuy2sBEPdZQhXlUpps6lm0MbWQYR3vHZH7aBpvxeyL1Dmrn7WOKrqXwdTNzPS4fGgfvtkLn
	ovBSTVdKiEx6LJUtNM2sXFe2FzpL+wGZSZUW54pp0TJrSbnCOcvD8HQLK3hZYZRZ7yaEPnrcq4o
	elD77A/LA9thyzL+wfHFnlXrDT8KOfI2u5FZobExA9XVy50Xr3pwlvWRrNcms8wSaA+UY5Ts5YC
	aWjFa73HZefJf6lfvFdhcQux4cBnxJEtsMSLugQ=
X-Received: by 2002:ad4:5fc7:0:b0:917:8aaf:bb9a with SMTP id 6a1803df08f44-917c0087891mr4797716d6.22.1790877308033;
        Thu, 01 Oct 2026 10:55:08 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-917a8a22f96sm32077796d6.32.2026.10.01.10.55.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 10:55:07 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: mhun512@gmail.com,
	Bryan O'Donoghue <bod@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sashiko <sashiko-bot@kernel.org>,
	stable@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH v4 1/2] media: venus: hfi: disable IRQ before freeing HFI device
Date: Thu,  1 Oct 2026 13:55:01 -0400
Message-ID: <20261001175502.4045853-2-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261001175502.4045853-1-mhun512@gmail.com>
References: <20260925191653.3144006-1-mhun512@gmail.com>
 <20261001175502.4045853-1-mhun512@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

venus_hfi_destroy() releases the interface queues and frees hdev before
calling disable_irq(). An IRQ handler that has already read core->priv
can continue to access hdev and its queues after they are freed. Clearing
core->priv does not revoke the handler's local pointer.

Commit 640803003cd9 ("media: venus: hfi: explicitly release IRQ during
teardown") added disable_irq(), but placed it after kfree(hdev), too late
to protect a handler already using hdev.

Disable the IRQ first so that both the hard IRQ and threaded handler have
completed before clearing core->priv or releasing hdev.

Fixes: d96d3f30c0f2 ("[media] media: venus: hfi: add Venus HFI files")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260612103333.5585D1F000E9@smtp.kernel.org/
Cc: stable@vger.kernel.org
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/media/platform/qcom/venus/hfi_venus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/media/platform/qcom/venus/hfi_venus.c
index bd82066bb6e7..e7e4e78a186a 100644
--- a/drivers/media/platform/qcom/venus/hfi_venus.c
+++ b/drivers/media/platform/qcom/venus/hfi_venus.c
@@ -1689,11 +1689,11 @@ void venus_hfi_destroy(struct venus_core *core)
 {
 	struct venus_hfi_device *hdev = to_hfi_priv(core);
 
+	disable_irq(core->irq);
 	core->priv = NULL;
 	venus_interface_queues_release(hdev);
 	mutex_destroy(&hdev->lock);
 	kfree(hdev);
-	disable_irq(core->irq);
 	core->ops = NULL;
 }
 
-- 
2.53.0

