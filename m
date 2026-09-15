Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14E7833ADB0
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789437337; cv=none; b=nTYrvm2SZ72pE/GWiG59o8xOz9Zqux6ImkAuhgVcjt2a//58CrlrxOwUQdQfoFiQBNEJzD7gGj1ZuA05wt8lXlqbp2Eyru/56DOKN6k8Yzu3z1U2TzXjSbzimPA/f5u3yPxqkC8Y0Xi6e6GGYOG1aI7EXSmNLCAFO5XduhxXiDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789437337; c=relaxed/simple;
	bh=Xrq7jp89mGnekKQK3ThxX3L//Vp8Bi65jjsv4DPKdMg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Mon5VPmUUV14NSMpu7fYEylOULj0mqWqPrnAe6x5qUZB+Izr2O8JQyk1BzlAdpfpoTolZeWhUItt5pMZdO4ocBDT1j07t8IK/aFclRRglF01v0VnDr9rogevdut//bczReN9odWc/aM4Mn4BLiV2BHo+x0BGx3mTLX2rPNIria4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LyclTsES; arc=none smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LyclTsES"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-90cdfcbe20aso33769166d6.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 18:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789437335; x=1790042135; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+t2pOcypXggyoA3oDjVoOfkJNIX87WTFu1zXhjCgQ3c=;
        b=LyclTsES6m6Ir+dcgNm7EtaZw/ZhGSQsnflzrD0ogYh0SprlgK3aTBT3CKxjU7W5YD
         Ux7p+rE7AwKomEeoedD0+GRJIRoLm6D2vqPuoEfVtaSDj9Dio9l0L4AVYceT9rheiIxC
         1+MeTNqnL6JbVkLpY4trCf2Rlfv4xtqs2U0uCKHy+HtMNQe1cc+yhhZfu2CRip6kPug6
         s3unVN+BaAsFfAYdMEy4MavaDTfl0dlTCGasvlsq4DRIc7g/eVHMyT0YtAAGoZDtFiKe
         s8GamhjL7kelusn47mCPhb60WVGaHbQIOnA/KA7jJvu2RR8mrxbMozhvQF/MIh3gcrsB
         aSKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789437335; x=1790042135;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+t2pOcypXggyoA3oDjVoOfkJNIX87WTFu1zXhjCgQ3c=;
        b=E01kXIOqallu+tGMILMIRmRJrOADK+SiU9mS1ouFxodHLc6BcLsn4QM+mqeS45QIJB
         1YJhOSFMc6LEN1BtftAKhT6k+bC6d9zVwjgxsMVQAJlrocEGSBJ3piKIkbDp5rkU6lSX
         kq4K0ihYjopyWf9bxYcZG+gCWohUnR/OzSCx9uNSyx1fNA1ObLd3Ej7FcXBsYvI87nql
         G/ErnI0UbOZoxghLYy4GPZyN8pyLVCgKbss97QpmWWokUQmj++XPEAw8nMRzl5dLKs2j
         C4EhJd2rlHBBCmksyYdCMxqXwA6Wiqv2csn6YDkyaFHtFr1NCK22pJNueN43EKXn3n2a
         TS2A==
X-Forwarded-Encrypted: i=1; AKwUvBzpaneHm/XMfb4yJURQPU2AvIwTQtAPwYldfr3HlhyvPaOGT30oODTtQE7k3WNwmYPcP1WyaVpAL90fmng=@vger.kernel.org
X-Gm-Message-State: AFuF++mkp5eZF8rj3Uxaewj5+ETx0PjEQiQbhd22IAkguPO+iEKRMByN
	e45dn8JcyFMLB6dYuQHB6BcsclnYoftW9fCZpvwLyy4IoKQCkkRyM9Y=
X-Gm-Gg: AYBFou0LHCdGsihe1R22QmZlwg5SZE/vLHw+9gbjCjkfEH8nLppaDM/0UJcvZcDzA7l
	O6caYjciX0U9nQ+CpgZE+Kn2wWUjaXZkgiU7WRu8G4ehv2Kova2wearfruG7KsI+AwlbMArW2Kr
	1QhZg1c5+fljEOjzEoPBK/07rxS6OTYv/Q5WLOPAepzLk/t3vk317sXa3vmoyWfdgHFINhQeYUj
	0B+Cvl7WU872QNPw5tZuQAKSvrw0dGzJ5gYckuLirdUEDAizwHZUDgn3HVeLQSLZviR4iC909dG
	bYTNdDWUpXfktroj5zP3i011uKqlQyGrvYC0xTRuyF95gI7ZUyOMfwCclf0BlYqCrNANVMCyO0G
	PabOAQbMv8B42AmBhgW1ICTSBlx4az4vamUfFfK5f07DZ32//JhINjPDPDcTmeMzQ9wbGhGPDB1
	uBXWin7tSYorV5V0gYUboBMBQ65zdzbyLI3HX+VjGLgFUDSqPORFMlU9lz2mN2En2kCZQ7mKu0e
	ANxr93jHIDnC7wFFXZRg2FBR+2m22h6mzTMR3gjU3kBp5MGQ6ENixgDek+KYGrIqom1fN8o4vFC
	uxUjT7d7YkT9NTAsWTF/OcGJ0SRmrMcQSqW22g7uZG2sBWwOOLzzlzb0EducjKs0EWEArQ==
X-Received: by 2002:a05:6214:3c9e:b0:90e:98e7:4481 with SMTP id 6a1803df08f44-9122e67604cmr95381566d6.29.1789437335040;
        Mon, 14 Sep 2026 18:55:35 -0700 (PDT)
Received: from 6e-wmo5420-02.ad.psu.edu.net (6e-wmo5420-02.ad.psu.edu. [104.39.213.233])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f5ebc79sm109264546d6.48.2026.09.14.18.55.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 14 Sep 2026 18:55:33 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Borislav Petkov <bp@alien8.de>,
	Tony Luck <tony.luck@intel.com>
Cc: linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 2/3] EDAC/i3000: Balance PCI device enablement
Date: Mon, 14 Sep 2026 21:55:18 -0400
Message-ID: <20260915015519.83833-3-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260915015519.83833-1-mhun512@gmail.com>
References: <20260915015519.83833-1-mhun512@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

i3000_init_one() leaves the PCI enable reference held when probing fails
and when the controller is removed. Disable the device on probe failure
and after removing the EDAC controller. Keep explicit cleanup because
module initialization can call i3000_init_one() outside PCI driver binding.

This issue was identified during our ongoing static-analysis research
while reviewing kernel code.

Fixes: 535c6a53035d ("drivers/edac: new inte 30x0 MC driver")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/edac/i3000_edac.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/edac/i3000_edac.c b/drivers/edac/i3000_edac.c
--- a/drivers/edac/i3000_edac.c
+++ b/drivers/edac/i3000_edac.c
@@ -461,6 +461,8 @@ static int i3000_init_one(struct pci_dev *pdev, const struct pci_device_id *ent)
 		return -EIO;
 
 	rc = i3000_probe1(pdev, ent->driver_data);
+	if (rc)
+		pci_disable_device(pdev);
 	if (!mci_pdev)
 		mci_pdev = pci_dev_get(pdev);
 
@@ -480,7 +482,9 @@ static void i3000_remove_one(struct pci_dev *pdev)
 	if (!mci)
 		return;
 
 	edac_mc_free(mci);
+
+	pci_disable_device(pdev);
 }
 
 static const struct pci_device_id i3000_pci_tbl[] = {
