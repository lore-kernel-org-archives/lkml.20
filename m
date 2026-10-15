Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F963EC83E
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 03:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792036176; cv=none; b=cUkowuM7X11iiehZGlxrVRyGbezvaPxX2k/mfPeo8dbT/JPUMr3O7wd/LnmYxxUgUj8O0oTjLlcMOMtZgyalsdZaSLMIXUAEKdiW/cuExMSkBYciG4wlx5GiEwYyRUKu8HFdLTXvTAa5W+gB8O4XKTxqQvN/xlmRDcIG8Zg1Bkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792036176; c=relaxed/simple;
	bh=Uv9EmrRaAH/Mht0c5liX9EH4uwX0CGeBWpQZZzd/SHI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=D9jTtO3t4pGSZIvurUBsJ25M1mjlkctjkx0Qia86fi1TsbBfioXD2Azf1rq/fXK368c0FuVMqWexx97yubKEasj2DuVDXy+phInkChSr7APVgZW18ZoF3fnydWL73dZ7ESlYff2MszDaChV8t1N1R3DgEKR44J5TiIKHos+s+gY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rXwpDpD4; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rXwpDpD4"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-91b8306b9f8so55962796d6.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 20:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792036165; x=1792640965; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bunKBsFj9Fyqn3V/dhLLQQp1k0qDhFRte4iKdlCJT1k=;
        b=rXwpDpD4jdvmJxv75PaXNWHf9Et1+NV0v2hpyaUPvUpTn1eoeh8P/Z6GNScyZttVar
         VeiMuD0e8iKZo/FRc0iBcY5h0O4wqFUovWR1HxEPaDnGnR9y14zHQCVJAzMeL2pl15Ge
         mc+D+kTb9o22TkqJmEuTID5x5tsxhHurSi5JpD9LHjtwww/gRG9UqoDeFkUTr5MZhHSb
         DpRSgrW18ksIBwWJkjsaEfHLW0wNv/ZoLoz6uj7l7PwWPgCxKppXn2TY3GvrX0uc/4Ev
         OcPV6uZH+JvN45/h/T1ywdi+vLsRmpxZzhjkNwOtPm5tWpUz2xgr+YmNOldayTvGjqOt
         qi2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792036165; x=1792640965;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bunKBsFj9Fyqn3V/dhLLQQp1k0qDhFRte4iKdlCJT1k=;
        b=t0dTckmhcg/Jw1Dhv2B1+V92ylStrvDQACcYv+4THn0hcs2QxIbCINhDH2RTiEf0GQ
         OWRkvgR3P2/IB1tzISTrlFeGJyItneMkL/C9jWx/ovKL5szqAQkQXwaeiHnttQV9Kuze
         QfEsZbDBrJZ2GGBlgnmnhypXt3MY9+0nO+1YhsCRCXwYM0yJAcRTmobEjnyBIPbNfuno
         LPA1jgc75u3+739nnH2ccH0KWqPwZF52FMh7/2Kt94rVoLZawP9CAGI0Zw+NQj6Rd+L3
         1r37PY37Esq/fKFEisKI4Mw86ALhOUn6xWqG0YHaLt7SxFFbPa6hq+O98wdk+oZlqOag
         SAQg==
X-Forwarded-Encrypted: i=1; AKwUvBzxq3wypeOWSNPMOwrjt/lAMkRU87xW29U6BTR6iCR4IDGJ6nknsdkevj4gWznb3KdP7NcpTbgFNpiL3xE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJuYtOWVlCCrH2zehb23hCWVfaZNM2j5qmqdHXBkGAE88Mk0zja
	u05YE5q3NFZ5SKMZKL+3x/8yi23/BIU9YggV6y8HhhnIQ1BWFCS8l7c=
X-Gm-Gg: AYBFou186XcMl07j0N0KlSb3fvzz5ruX2lTs52n+FTEuVVxqWeHwgUIBimfEkQss1dn
	6yu9EL881d9tkjA77pVttcFUlPjfGVV0D95g+tN1g+gevnwL2d3uhpJFMMtvGuZzNOVk0/q84IA
	Ecf2g37/UWjRNibU8dHpKLQ+qdtTdlzPlxxjJlRMZrEMWTtLs45LtGs1kUW5JjQ62GQc30igLr8
	svPwf3sgYtWtHVBoxloa9SPEnLct0c1jS+8x+tGO8TcZwmTdOJINpDOFXqPy2ikGcndXakGczyA
	E++t70MfsIARe7izPqGxHcOgC4gzW3Q9DQpc5dg8cig89vkT0YgaH7ocLDVYCdDnD6F/ktUnMoi
	wKnPozarBrPBE7F6j2MxE3hdFJWPFrAeQIxibKhF6/bzCe6PkampDLA2ZoJ2qojOAtlSXI1PzDL
	ftfXdkYumca6uJuYZduieZE2EDOM0CLErO4WYotiyaLGlk6Z/pf4N6n5L8OSFgfWbhY+fXyNZYv
	DPVr6hKYsFiNPJ3B1ihYlqacZy0ts2wV3pYKkHL5c1k5D/81r5ryM8N6kAzdop1GpThSN3BBr6q
	X2b7N0fbfb3u5fRG32Mb2kKtK4dBNGu0B/EgqXs=
X-Received: by 2002:a05:6214:5184:b0:917:8d8f:9d6c with SMTP id 6a1803df08f44-91b554c317bmr317474676d6.9.1792036165229;
        Wed, 14 Oct 2026 20:49:25 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b97b3864dsm70540626d6.14.2026.10.14.20.49.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 20:49:23 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>,
	Vasileios Almpanis <vasilisalmpanis@gmail.com>
Subject: [PATCH 4/4] usb: gadget: pch_udc: free the EP0 data descriptor to its owning pool
Date: Wed, 14 Oct 2026 23:49:16 -0400
Message-ID: <20261015034916.2773248-5-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261015034916.2773248-1-mhun512@gmail.com>
References: <20261015034916.2773248-1-mhun512@gmail.com>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The EP0 OUT data descriptor is allocated from data_requests, but
cleanup destroys that pool before passing the descriptor to
stp_requests. Return it to data_requests before destroying the
owning pool. Keep the setup descriptor on stp_requests.

This issue was identified as part of our ongoing research while
reviewing kernel code.

Fixes: f646cf94520e ("USB device driver of Topcliff PCH")
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
Compile-tested only.

 drivers/usb/gadget/udc/pch_udc.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/gadget/udc/pch_udc.c b/drivers/usb/gadget/udc/pch_udc.c
index 38b9159e2461..b07da0fdcdfc 100644
--- a/drivers/usb/gadget/udc/pch_udc.c
+++ b/drivers/usb/gadget/udc/pch_udc.c
@@ -2984,20 +2984,21 @@ static void pch_udc_cleanup(struct pch_udc_dev *dev)
 	}
 
 	/* dma pool cleanup */
-	dma_pool_destroy(dev->data_requests);
+	if (dev->data_requests) {
+		if (dev->ep[UDC_EP0OUT_IDX].td_data)
+			dma_pool_free(dev->data_requests,
+				      dev->ep[UDC_EP0OUT_IDX].td_data,
+				      dev->ep[UDC_EP0OUT_IDX].td_data_phys);
+		dma_pool_destroy(dev->data_requests);
+	}
 
 	if (dev->stp_requests) {
-		/* cleanup DMA desc's for ep0in */
+		/* Free the EP0 OUT setup descriptor. */
 		if (dev->ep[UDC_EP0OUT_IDX].td_stp) {
 			dma_pool_free(dev->stp_requests,
 				dev->ep[UDC_EP0OUT_IDX].td_stp,
 				dev->ep[UDC_EP0OUT_IDX].td_stp_phys);
 		}
-		if (dev->ep[UDC_EP0OUT_IDX].td_data) {
-			dma_pool_free(dev->stp_requests,
-				dev->ep[UDC_EP0OUT_IDX].td_data,
-				dev->ep[UDC_EP0OUT_IDX].td_data_phys);
-		}
 		dma_pool_destroy(dev->stp_requests);
 	}
 
