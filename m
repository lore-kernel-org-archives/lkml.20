Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794177743;
	b=v4dImMHwD64M9hP08kvxx9cdGVTADm4fQPtPLjotDDAIlhSpwMrxXYXxB+k0TP/zX1JM
	 +9N1Z2u+FEO1J1uWT2LREogyUFjx0W2VDu0zf2hlYQXQ9N3QSNjlrs4eeUG4y2eAJseb6
	 SVNonXfeFDZcbNl+qXw2ifLKQtlBr8q2KVtBKD8iTLKmbIA9D5JZdxn5Ilb/vpg+XTB6W
	 nSEwqVRr7IUxyI2uwxHUchVMEXCtG+O0tze/jDZSKAOLZ7AtaWnMu/NRE4/Hbu8/7cKFr
	 lUYH8haA4tnNbyHBbxP/qJRcem/EG4xcj/XbYsb9vm3+1xu5k+wERqzIBhgGE9dD26g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794177743;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=e1VqrTz+ewActBpDHlYQe8JX54F3teV+c5WCvWWuiYY=;
	b=d7MYVZeIsZc9LXsHYML3G9OVfUu5TgVuP10dnM8nbFn9lDTMytcHcrYXYi6KtFZc7NeX
	 E4ma1MOTSLw23BteUfu/zRGm++vYdPdSCw+kY8x2gPTtBiE97H1QriL3h4zu8IODxkZK8
	 /9ZR4hMtoJLbzXnP7V8fT4A2fl0aKME/EMBTmNNAg998ILnB/+ZNl6WU9V1LgAV/aI+D4
	 hZ1yRXe/b84qO6+faSdH7qJk5bVPeyq7rXLTFzJB2phJS/6Lw81/S/mORtInExv5nbg6d
	 w4gRfwnx/ozJEv0BXWlFyOLOnhnOmMNFGo8mKxj40SE80eC7QqE6bsBaL+/iwsX9zGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VIQVU5h2;
	arc=none smtp.remote-ip=209.85.160.45
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75AB1606A335
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 22:42:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75AB1606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VIQVU5h2
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-4ad881b6517so199981fac.2
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 14:42:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794177742; x=1794782542; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e1VqrTz+ewActBpDHlYQe8JX54F3teV+c5WCvWWuiYY=;
        b=VIQVU5h26tv3OKc7TWsATktTWmtgYJAbpgl/p8DcQdl8UEZ6AvTVJSni42N9dJo/lT
         DjZHWlI8NzZgqykUXGdy69BPtqWcHHwqwL+hsadvwI5FU7gchQY4iLM50zNnDXFI+Hgp
         jjfpWblv6FnJFfv9wnIg7Of+7QSbBjcrzUg2RCgGSKH3dJABG0tbM+EdVOYQXfqIrzrg
         Tm7ozyMPMvY1YsCKfbf6ZyJIxaXGoZw+eMKhqIwVOqC2Sj0rKY9yN8O7DKyUb7aZrpmU
         koGwC58ejA8Qm+zHrxT4sDSzMiFWybsT2ImwEsF3pDa5p19ENyJtQNnUOCr25GvUMmF7
         bGOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794177742; x=1794782542;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e1VqrTz+ewActBpDHlYQe8JX54F3teV+c5WCvWWuiYY=;
        b=hgksw+TuzyCOIC8/HrUxU6tubSbPtdkuZlUe4wbOiTbjfDOEMA7TDSjB/Mb6k477VA
         fUdAJ8CwiKuLUyYl/DYwpDUNyDmDDipR0RqtB4PPzZJPuHzsEZd4TErAr4fQ0nzRBoOf
         0bqaD83kKv9YS5zwD6epEObqYofL4UAIxt+/P3wHbyKVm/FJyED6fGlWMzaUuDhwE7fR
         FoNl9QeshCCJ9uYhlK9uvoMK5NaNxJ4rQJDOE+0KSc83iJtqiFO7xfRbq6/4NXS12i5V
         dhNY5o1cGZjAYtbkh80R2UOMjqbewhTGVvibQT3hprYfwhTKzJoCjNE+1Cuw/0YcgdhW
         fCHg==
X-Forwarded-Encrypted: i=1; AL+hErE9tZNbhUP3A70COQbOc76mToCxqkmMLdkVzLaoWl3N6kYAUGBUwgF0coXwqiuQfCan0v8aMOuKZbgy0/8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9DQvjjyRGOpRcWTfuYNuSUV+Ma3ix27ppLgTTa4+/+qVbpEWrE
	Mw1wBA2k3/9UZEoKlUx5ouUFpjTVF4ZzfKunvdCGQvKulfY7G7Agg83N
X-Gm-Gg: AYBFou35GOH0aQj1SJCotANwaPodIp+tn9/mAYYO0/ircwXOa6Z2hZY49ijG+Jefsn4
	9BXrCORCRSVtmJ0dCt/PmSSm9axl1rCD/RjJox7qEL+kMTq+KHeJArOaGMnZY+P5hWUtL7i40jX
	sNhhb9U/1l0FqA2Uf6Si+5Mtfoxk6QtZV+tde6YxSRcWh/SHnAEPEzLIyZIyEhRGYlmBfPmhTCm
	83ssdmNI6l/cYpCctoimrjnBImRMGHPtZrm3SZPjqlQyXiHIqafOdjONk2eNn14nVqTS6Hh3lJR
	gapCBV1VmmOFj1TA3uLg68OceiR/7ytM3MJErhoE9nMlTi/vzJfu6/IFqQX+waiIcIRG9TEkfD5
	VxQYOnU6tV7ax/gEWNmq5g3dk9E/26kgu2b7Q2pvEdSwUB+TCA4MfF/atIfrS+OWlnKGydA/j3l
	8o6fSPge6kx3U2KK+QH1nvxKJSrlXQpVBYbrZWeukWuipwIqjJjzzHsG2sPLHnxc/+2yOt14wev
	Onqr+R98je0gQvommqNL0ru0O6Kthf0Ya1Yvc+ofYKFd31I4r85vJrl4JuCZsWhQv1x9+rYjx3M
	s3TFLqHO5b8NKRxiFgHH5lC/V0CmdMJ1b+r9dbX09YvbRr6z9VyjknS6+4YF7CtHulbiIcA1R02
	Il6NS1RmaaIVlOhjesaHxXYN5QbygOTYsXnqGxZpqJ6q/E1gtYCZWVl60FxEmZixQfMJeProxCC
	ayeQf156fd3ryxFv2P7/jlA8QoQHCq5Ad4F1DlmntsnUowI5ghyRaV4qhm2K9hLWdfcA+aYkJVV
	Q==
X-Received: by 2002:a05:6808:1514:b0:4c1:5614:acab with SMTP id 5614622812f47-568143a9715mr1370591b6e.37.1794177742300;
        Sun, 08 Nov 2026 14:42:22 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56813e54e39sm2859944b6e.15.2026.11.08.14.42.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 14:42:21 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 08 Nov 2026 15:42:08 -0700
Subject: [PATCH v2 1/4] mtd: rawnand: qcom: parse boot partitions before
 registering MTD
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
Message-Id: <20261108-submit-qcom-nand-child-probe-errors-v1-v2-1-4a8704cbf7b4@gmail.com>
References: <20261108-submit-qcom-nand-child-probe-errors-v1-v2-0-4a8704cbf7b4@gmail.com>
In-Reply-To: <20261108-submit-qcom-nand-child-probe-errors-v1-v2-0-4a8704cbf7b4@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Christian Marangi <ansuelsmth@gmail.com>, 
 Sricharan R <quic_srichara@quicinc.com>, 
 Md Sadre Alam <quic_mdalam@quicinc.com>, 
 Boris Brezillon <bbrezillon@kernel.org>
Cc: linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15.2

A boot-partition parsing error currently calls nand_cleanup() after the
MTD device has already been registered, leaving a published device backed
by freed chip resources. Registration can also invoke consumers before
the boot-partition layout is available.

Parse that layout after nand_scan() supplies the geometry but before
publishing the device. All failures then reach cleanup without leaving a
registered MTD behind.

Fixes: 862bdedd7f4b ("mtd: nand: raw: qcom_nandc: add support for unprotected spare data pages")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index 2d98f79b492d..f240d1effa04 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -2052,16 +2052,16 @@ static int qcom_nand_host_init_and_register(struct qcom_nand_controller *nandc,
 	if (ret)
 		return ret;
 
-	ret = mtd_device_parse_register(mtd, probes, NULL, NULL, 0);
-	if (ret)
-		goto err;
-
 	if (nandc->props->use_codeword_fixup) {
 		ret = qcom_nand_host_parse_boot_partitions(nandc, host, dn);
 		if (ret)
 			goto err;
 	}
 
+	ret = mtd_device_parse_register(mtd, probes, NULL, NULL, 0);
+	if (ret)
+		goto err;
+
 	return 0;
 
 err:

-- 
2.53.0

