Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792809657;
	b=0bhRqiW6S+2Jp0jWGxbfVOyz8EFmfuxanEBtlX+G+5+++gT+HBO6PI9xwT9u/tt2ubfh
	 PBvn/n9gXWJC5ksxBQ2Xq9vuLK5igmvY1FcsOjFXzRWW+mdBY1ssRfRcUTzOhH/rpjxyz
	 qgoJukOnDl7btJk2PKUmqgMVJLGDMY/CHn1XrzBN6NptD+kjGhUvUpn7CzvBYWVXD25Np
	 7agoxSlGZo9+gKFS0jLVvLTGaEqEuSK/177cDyFfUWHup21auMR66Yi014aea3terYzdU
	 GSOia1KiCeQFsOxOTzWYWqHBsRONQxSs/oSqOQNfcEi2808z/QldJqEEgyX7cE1rXxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792809657;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=d4mvKHVg0u9lhgOXNdg3AlX0ucHCymbdGcE+4K43yLg=;
	b=STMPenJp5bTMeGbd3CgMKeH202zSdMRHyYjLWDcq10yuwLmlaT6ZOtNewXgUbj6Uf+PN
	 FDuA8qgRoQkLOmEDaZOZ3bv3HSB2Nt0iL6zM413+1g89/5VusNEcOrrnk9CJ8HjplEbMT
	 gcDubl9lE4MSpjxuYb0IU31DVehllKrZvZf5enRmlWzobEHWC2U2sZlL/+g8hAbkdZNAv
	 JvD2dnjKAfZLX7XSlNSlAnGNGAsbiMsvyhA07P+PBd24UTLN33rVjpHxdLnw0M85MZcx3
	 gAlregCdh2DrxMDyRRATTNXVnYqjBi3sCiyfPYpjxg0BAbTf5zCEUVDP5Hxg3TJs/fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ovwbUIQu;
	arc=none smtp.remote-ip=209.85.219.54
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57855606A331
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 02:40:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57855606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ovwbUIQu
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-917bab38b14so14833256d6.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 19:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792809655; x=1793414455; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d4mvKHVg0u9lhgOXNdg3AlX0ucHCymbdGcE+4K43yLg=;
        b=ovwbUIQulR/trzGPUe6AcLFuBGKSStkt+G9NV0x/7+h8nj3ReutjCibybUc6ZFjQHm
         lfBVGmkk5rWNBMNKWK5v0A5IOxiDq5ULKr6rKEBivFivT3xDaR2Ye/NBC6e0A5QJd7GX
         8zGnXlUgwunCf9VHNAT/nroUrPc1lGIm9inioB1hh+++u6OMboobvWKF0vfY8sJKDBn1
         ZgXiIex0X3gA6h40TSXVieXjR2yvvJITRE4YI3uHR9rfqlY0WDR7eSrGwXZd/T89JUSv
         1PpaI3mnE3HWO5RAarekm8tthS5t1YXfowWa2XuQDaOpoQLuaaO5oTpIK/O9sZwkullo
         13wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792809655; x=1793414455;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=d4mvKHVg0u9lhgOXNdg3AlX0ucHCymbdGcE+4K43yLg=;
        b=Jac4WvXR/C15MClzDLEpPuay33Ul8ms4+Y/+AAulz4DpkpHUu32WctGGd1JtGWhYb9
         NxYhIN43qD3o3bTdHJZxfSIS+58lO78Pfm5IGSqlswb5V+xcoq/0bzzWEZcrbAVaCLXn
         xYsAkUgk91QhF4xwfmYzAttLFz082tUXVi2w9wCU+h54Binc6hjOhqQbFAXiNRbQ7A/4
         KY4ZSHuUwLnsEt8gr35N405mTLXiq4AllVtjreu4/qAc4amyOHk7vqw6k2qbfNBqVsSd
         LbXR5Ej+aYnRn8dXVXfKhpdlYgzSh+CRSclJTQ2t8PtmCMOm3ZQq53EGi9tDvRR//vOT
         7Ing==
X-Forwarded-Encrypted: i=1; AKwUvBwSGqP+ftBZsuMo/JCkwxp0/BaoMIXS1qR8nzWBZ/4GhRFZ3EfA9fF8QQUn79tP447N80+fMferPQjisAo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJd2J2LkE013S0miB6HlJU3HYWBebLFrBNEiRukHcunNNwH7dm+
	6egyXBL2edGsRAd9EhP3jawCeSK7AtAYtws25y++Z2KvFOjCkZKXi0g=
X-Gm-Gg: AYBFou1xBTgo8jQZnErzUyOJuYeW3kyjqobAgWxY5zQjdqx9HlOLa9W3aqa1ZF/9nTO
	FznoTDAc3xUopT5vzhWvlfsUO4/DKFO0xdm7KyZdp1uC5rlZHDta/tg6/3k61VgZoZih5vuU4fi
	k6F4xxHW4zEIDHYOpmGzQ9wyybI1s0tTKa8F/z/LqxwLSWU4tulH0f4CXes3+qlm3TxlS3RGdme
	A3Yyb1Pf+/4Tkn90yOSd9KNOHfMj8gH0KrAkNj4hXKaZ6hNvriMSRiT404NPzpP+uK/ag/SW/S6
	y6KfxcYpGKgzdF2CJDJEgfrWhxNgzwMaNgUticDIljZUPgc5KGr/Z+eP4ueORXAgYt2A/dfPzK8
	oz1CJ3tuVt9kCHCLPuu8IO+5HiT8dKf1G/zSowvs8a1KpofiEDZQIjg3aET9CUeNgRLjjgNal/b
	FzJ05a2Oo2UraNWQyBMGDTkxndkQfiybSNisVYNeLdzw9pew96q3HlYUt1lkyH67yYc6rTCPUEX
	rhEeqcm4Xxp2wqzTugIjxlEaOnjYrDK/tMlTVZQ/Ue3PY9FlLUxfEDU8HK97aAqLrPFyrfePkQ2
	tCLpFLvqBpxXTxGUmDo+GMxG3YIE9ATpembT6NFL73QakxTsWwBzNd5ELgjgevaJuiKhBy0AkGQ
	vMRQ5k29YDA==
X-Received: by 2002:a05:6214:ca9:b0:91c:1a4e:425 with SMTP id 6a1803df08f44-91c48e75052mr14414866d6.56.1792809655265;
        Fri, 23 Oct 2026 19:40:55 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c48feca9bsm7203526d6.39.2026.10.23.19.40.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 19:40:54 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sashiko <sashiko-bot@kernel.org>,
	stable@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH v5 1/2] media: venus: hfi: disable IRQ before freeing HFI device
Date: Fri, 23 Oct 2026 22:40:50 -0400
Message-ID: <20261023223635.3c895c4752c4-2-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261023223635.3c895c4752c4-1-mhun512@gmail.com>
References: <20261023223635.3c895c4752c4-1-mhun512@gmail.com>
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

venus_hfi_destroy() frees hdev and its interface queues before disabling
the IRQ. A handler that already loaded core->priv can therefore access
freed state even after core->priv is cleared.

Move disable_irq() before clearing core->priv and releasing HFI state so
both the hard and threaded handlers have completed before teardown.

Fixes: d96d3f30c0f2 ("[media] media: venus: hfi: add Venus HFI files")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260612103333.5585D1F000E9@smtp.kernel.org/
Cc: stable@vger.kernel.org
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/venus/hfi_venus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/media/platform/qcom/venus/hfi_venus.c
index bd82066bb6e77f68ac3fe1440a8b5429ad62a192..e7e4e78a186adaa7fd80deeb094ed53d54f27ba6 100644
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

