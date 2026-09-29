Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EDC24FECCC
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 10:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790676383; cv=none; b=CSTzZQx4Kgq8LNpFrmRRyQdJjlXHS4CO1Hdudwojx2wTwTkLl+2Etldmdhx7zXpjxgXV66b2Fv7fOeliRiEL3dkWvRVB12l964VWhnYdAv8zxErEt3cC2rlR//W837j1iq37V+uEGvXSX6vNxIxXmllFGun5rOagleTB8+H/tjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790676383; c=relaxed/simple;
	bh=92VE8r9mzYOK8AC7tCzlvbIDtHDlmpg8zlN0tg/3Zcs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=omV68UJqzUqXFsmB2cTgvmE51otHaRMWDop0T8omtm82ltaZMFvQy2+9pEAFSwNi8/g9zzR1dCmocb/BYpiwEKSPF7wbz0+w7cQn/3aPt5oVr9FhZcV9mvznuojtDlC/j8JmIlR4Qgd9HSTYcsq9Vx/FZKtuwmQq6CTrLEQ2JYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=tCmaeZVc; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="tCmaeZVc"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-488885c3844so436487f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 03:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1790676369; x=1791281169; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eYE9Edgd99flwjX5TMY3XUDStNFD9sn4w1TpgBQJ6eA=;
        b=tCmaeZVcwD1h4SN5M1Br72TaRuAmYEW4hEWLCPrHRMeF5IQ+pFgP1Fp+luyWIsRoUa
         sm93UFzFNsNCxvaK/rOFbHeSpB8DG/GHYP2P+MizdkIImLgM2re3cPR9e8Hs/CTxa1WP
         qGNxNP/kDhAXUs+rd10VA5tCsi9/kvAb79EQo9Jyhz5YNkGPKGhYgXUDSNT3bAcIoXja
         Ej7l+WiittEMl+ZPLnHrQJvttXngWppVU1vC/ahPVVzX7LE8d1+rZICW57HFpC/ss9Jw
         gXYLFQnFX2rBKDTABWnTQC9uTs6zhWvQeW6FoujjErrU44uLwonaQRjd5y9s3rFFz0u6
         1sMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790676369; x=1791281169;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eYE9Edgd99flwjX5TMY3XUDStNFD9sn4w1TpgBQJ6eA=;
        b=IG51JEidrbvdkdjtyzSUXB30PTZShd75jQK2IaPBVRdlKsf8WQOm04pzTxj8e0CXlR
         LjEfr9a51HRqUe8hMEUzAsZPfSTE7IzXLSTdEloRpn0h1niWKXTBNeQNfshYV7ZlQWbA
         iGT6y2q4z717X+K0pTYBMsBQyLYNN+PUDOZznmUWajcIKMW5DdrfGpnZDxpcVwopNdMK
         4USF+8X9e+FWK6NQp9FD0y9QX08JHpYotWB47ztDny7TdwZzi353l6BJDDB0Equg9u8y
         yEAtMKUFM0xrttWQeDUCkxwJEjTtxIhyGq8h3+Sbg9WSDpd08o4lqfJ165KzKSt0CBMW
         M8Zw==
X-Gm-Message-State: AFq9FYJYIuJmfsR3LnAcDHNIOdkPUqEf5YO+63pE/EwuJoCMfGmqBb6k
	kTmPL867qngkvb9/CLYj4O0J8mjfTlCmLvoWCeQyoiGmawwpAzh3r/6Sucrf7JuIGZg=
X-Gm-Gg: AYBFou3kut1gcOmYM//QxgucXgLur2RYMi60hTUEOCGyKakS7beeha15ew8q1rMhghC
	LCVizRqXbwH5oh1q0Cyrq6r50QR/rtCFOpN0gQdoGrYtjMUDk85hf/2hWFL6e/+8+xPBxoWTi3b
	7kLXNcU6PYcZm70lgWr2L9AawzXf9kvnAdkoOd6LRHH3mbczYEkquRxjpvcM+prmGHQlIzGNYqG
	9+T0RrlvgTbl9dCA4kBr+Jc1Gh5ewyIZW/r1620feUeENZFQ5qkckyuQ1FtZJW7JKp0RcrnySzS
	2uOc1Au3ZmouhdZw+30A3OemLyDcQhG8OACoDbLT5MG2MKcmEefE36IsMhCz2pADzjmCcOH286s
	6RN/BgXu16y0FvHkvYkohmtjrO2RxQGV3InUuYICTOgpiLgJOgAN9jgD6bTWFfgarJxg9uhTjeS
	9jfbuMQpJGwe7SvwR2IIumf6uaj20JUmwb0P8tZO4do6BPXAocgtQ5Jm1zRGxKQ126qYOSyCmwp
	Fb+AZg6wIvNBCuh
X-Received: by 2002:a5d:588d:0:b0:488:80ef:7fd4 with SMTP id ffacd0b85a97d-48af1b36244mr3851230f8f.7.1790676368816;
        Tue, 29 Sep 2026 03:06:08 -0700 (PDT)
Received: from alchark-surface.localdomain ([5.194.93.183])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48af502f79dsm2954995f8f.6.2026.09.29.03.06.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 03:06:08 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Tue, 29 Sep 2026 14:05:49 +0400
Subject: [PATCH 4/4] PCI/pwrctrl: generic: Fix leaking array from
 of_regulator_bulk_get_all()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-regulator-get-all-v1-4-e887c66a47f1@flipper.net>
References: <20260929-regulator-get-all-v1-0-e887c66a47f1@flipper.net>
In-Reply-To: <20260929-regulator-get-all-v1-0-e887c66a47f1@flipper.net>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Corentin Labbe <clabbe@baylibre.com>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Cc: linux-kernel@vger.kernel.org, 
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
 linux-pci@vger.kernel.org, linux-pm@vger.kernel.org, 
 Alexey Charkov <alchark@flipper.net>, stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=943; i=alchark@flipper.net;
 h=from:subject:message-id; bh=92VE8r9mzYOK8AC7tCzlvbIDtHDlmpg8zlN0tg/3Zcs=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWTt7m15s8EzK/JN78xJbtPerfnDtOuVWBHHzrrMAwa/9
 y66bdS0pGMiC4MYF4OlmCLL3G9LbKca8c3a5eHxFWYOKxPIEGmRBgYgYGHgy03MKzXSMdIz1TbU
 MzTSMdYxYuDiFICpfhvK8N9NU5T9zdJA/U0CAuc6PuwMPCvy3y0kJCg083aWzbRMpg+MDM2xKRm
 v2RbL/j/53Xr5u69rZfcnZjxZvzw9q34df2rwBm4A
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

of_regulator_bulk_get_all() allocates the consumers array and hands it to
the caller, who is expected to free it at an appropriate time.
PCI pwrctrl never did, leading to a memory leak.

Add an explicit kfree() for the consumers array.

Cc: stable@vger.kernel.org
Fixes: 75996c92f4de ("PCI/pwrctrl: Add pwrctrl driver for PCI slots")
Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 drivers/pci/pwrctrl/generic.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/pwrctrl/generic.c b/drivers/pci/pwrctrl/generic.c
index d56171e0ee24..4b6cbbb52248 100644
--- a/drivers/pci/pwrctrl/generic.c
+++ b/drivers/pci/pwrctrl/generic.c
@@ -63,6 +63,7 @@ static void devm_slot_pwrctrl_release(void *data)
 	struct slot_pwrctrl *slot = data;
 
 	regulator_bulk_free(slot->num_supplies, slot->supplies);
+	kfree(slot->supplies);
 }
 
 static int slot_pwrctrl_probe(struct platform_device *pdev)

-- 
2.55.0

