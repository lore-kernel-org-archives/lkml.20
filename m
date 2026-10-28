Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793186345;
	b=YwVvetPmwCpqaRiAHJC7bGCHhGYtEukeAz28DIZwPtO2cLsMphX45MgwyJz9Ax0fhs+t
	 4rE8GNIFm/IFNEpmc2ZktOC76qbODsoBZ1rMXuc08OU7PiVu4nsdpaasQY+6M2dRiaDqs
	 ziSND2Eng/rlF/0wx4nOkrYhhH6K8FL/OHsXWKmntCT5FLFF3JD9f/PfslMQLndgjtMAJ
	 BpzG4I9ZE4T9looMTsx3D3cVpsNf6/mNY5Q/c20UUw6vOaGF4BGTq3GtITTXYDZY9AfTU
	 +kVqcU5WGROfeiOPTKYDToHzHICU0kRTAVAAPaFiwx7Sstr1zq3bYqaqMAfev1YdMkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793186345;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=NZpAsNc3aC2Ydf5DrbJRymJ/w3CBvaG5ANPMqZgnkm4=;
	b=glt3aRtAF8HzHIHdfWfem/GoouCe15kkOv8VI8Wf+aJhv2oYn6TkCOx9BoPpDKcE3DQE
	 +jOGMAoWnNOiH/UMWdwikKQQe1rjisdaRIP9j1YlX5hJIDLqywkgYqYOJITya/xjQI3Hc
	 MucOsz7lBk+7weOEx+0CT0w+k+Ogu/Jl7tw+0DcNNeR2VpjaXEMGg3C07Q3a+rzEo6Dwo
	 VGSmO2cF66k2u+wFHuGEX0b3f+YJ3i7w+u6GmiREhb3h8JANQSBOc7miWbbETdocaPYgF
	 gO/TzjDb3c3clfaaZmZ2jNVso8VkddBtBbr3Zm1ch065XmZ3VhMsf1RDyWarzyEAorQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F1bYFQAo;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4382A606A324
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 11:19:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4382A606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F1bYFQAo
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso6163095e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 04:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793186344; x=1793791144; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NZpAsNc3aC2Ydf5DrbJRymJ/w3CBvaG5ANPMqZgnkm4=;
        b=F1bYFQAoUcJwRfQdmKkSXusKU7Fx/9t66rBSaVjqFBK+ZOshaDMvuOIXybN164s2tf
         gAHLOpEaaRdTii21+MSIt8LR0dx0GQ3//g0Bp7FK1BBRkxQBH+SUNAd/iAUgkwvXcoR3
         caXh8yR/6oGAXCQzGp06afsQZa9IfX3taOWF6RJkZNf4rb5R76fAegSxmZm9itHW3q2v
         ol8x4IWV3BRFGwh/pO9RpXTm2V3cFL5mDTzJLVU8cJDTjXLcUKZ43EBgRHMrHv7AfTVm
         AweRNC9Kgj5hihxMa1nHgQqz1GDc9kQU2IfheHo0pvh60SQoFECMvioFlzOT1tV8wrem
         3K2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793186344; x=1793791144;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NZpAsNc3aC2Ydf5DrbJRymJ/w3CBvaG5ANPMqZgnkm4=;
        b=YnAlEXBjMY+Sr+Tkuv1xt7+W1Fic7suDh5NDsc7DYWf/9AO94+Vmm6I115EiTaX4yE
         wDbp3UCniy82XqJh1dAAQnQIc0A0n7pGEDfuO3Nf2fFZbN8CmHSvdmDKPcIZiOpDeyL6
         IetqfnUut08MvsphYOpqbYLMq7QWN9YOFWfKILn3XjxyCBwTKdhOBb/J9S9Bjk09nvgu
         sRRL1wcQMaE4fAtTkJ0+3WjYWDRb5Oi2EjnmZPz4LaTc9z9TJVjIi/fQ1XdwDjYGGdVz
         vC4SRl7Nkzl6+YqPlDdJ/7QCIDeo4Ehq54B61G1DdlCGrhHY4SMc3Nm4XMvA1n4/J3v5
         gc9g==
X-Forwarded-Encrypted: i=1; AKwUvByMukqahJmA+Wcq27KcoVBfKXDrM+YPyyx4fOvv/KKsXT/b/+KwD98Uo64/0Zx3ziYEQ/jBZqGKOzqGZ8E=@vger.kernel.org
X-Gm-Message-State: AFq9FYIYl2FO2xhcJypnMXGgpFyJJJjKMGR0E+ZiniqheZewSSSt+fwn
	TCKMy7HAK1k1bGI+dEBxtf1Wo+yi5BzZDZbnbI/G5KWpbFL2XeHKgvYY
X-Gm-Gg: AYBFou20dGiGYpPs7zgHHI1qHBvHMKJU6Awau6p3UmwLtjsHfl87m7kds9YDPwzYaNS
	jF/j9Of/nSILEnB/m7so5hd/4Wxe2RqF+ndygtnczM/IrjzTyu/7EhJN61HrNIeL9i/i4WVrWeT
	p2lnxiwkIudHhTEtIHIeyQarjOtKtmaRgKouFQl4kaxqVKa4HUexNIH7qz61I2lxi0Wll4CQC7T
	MtBdGkEjFLyazI4Nb7tFRM/X2YxRnHagaNJOnsZo47nEYGdBYounqC6xKFhxtqJ/Twbm3H87zaR
	ceNbXf4shWout5rBHv4a/lBaRjS7cnzCAb58T57wc3yHUlNq98lFFo6yyK4zqHcbb/wbB3ox6BX
	iFewtRSBLBYheKX6xM14SHk9h/oklNFje+HF9FD8Hqz3ZKsdDf/T1L3GvJ2lony/Bpb/cIdagWu
	b9tbRPHYEYHogbdZJ0uDOQcrNtKnT12BXdIdIrVQvZ3DfhHRpx8HsjDkEixhvJniVH+VEEWssZF
	jp+XVO70HT7qtlWks/L619EM02EhCHmPx9cbteoE53enO2G1sIxkKPYkOAiKnJGVF+M13wk09Uk
	zuDdcOmbkoCSGfSADOEj44epbJj7YbJtuAfO6to=
X-Received: by 2002:a05:600c:354a:b0:4a2:47:b79c with SMTP id 5b1f17b1804b1-4a9678c3ca2mr40478565e9.32.1793186343622;
        Wed, 28 Oct 2026 04:19:03 -0700 (PDT)
Received: from fedora ([2a02:587:85d1:a500:5135:1deb:a9ab:fb3f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a978d57b39sm64197635e9.10.2026.10.28.04.19.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 04:19:03 -0700 (PDT)
From: George Karagounis <taterraster@gmail.com>
X-Google-Original-From: George Karagounis <mail@taterr.org>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: =?UTF-8?q?Filipe=20La=C3=ADns?= <lains@riseup.net>,
	Bastien Nocera <hadess@hadess.net>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mail@taterr.org
Subject: [PATCH 1/3] HID: haptic: Replace create_singlethread_workqueue with alloc_ordered_workqueue
Date: Wed, 28 Oct 2026 13:18:51 +0200
Message-ID: <20261028111853.22429-2-mail@taterr.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261028111853.22429-1-mail@taterr.org>
References: <20261028111853.22429-1-mail@taterr.org>
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

create_singlethread_workqueue() is deprecated. Replace it with

alloc_ordered_workqueue() for the haptic workqueue. WQ_MEM_RECLAIM

is added to ensure hardware events can be processed under memory

pressure.

Signed-off-by: George Karagounis <mail@taterr.org>
---
 drivers/hid/hid-haptic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-haptic.c b/drivers/hid/hid-haptic.c
index 8760eeb08b2c..2f4fcb56aba1 100644
--- a/drivers/hid/hid-haptic.c
+++ b/drivers/hid/hid-haptic.c
@@ -460,7 +460,7 @@ int hid_haptic_init(struct hid_device *hdev,
 	name = kmalloc(strlen(prefix) + strlen(hdev->name) + 2, GFP_KERNEL);
 	if (name) {
 		sprintf(name, "%s %s", prefix, hdev->name);
-		haptic->wq = create_singlethread_workqueue(name);
+		haptic->wq = alloc_ordered_workqueue(name, WQ_MEM_RECLAIM);
 		kfree(name);
 	}
 	if (!haptic->wq) {
-- 
2.56.0

