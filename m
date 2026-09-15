Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2C3B1A0B0E
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789434152; cv=none; b=D/9s2sP+pxCw4FaLgkYcbV8ANInkLUTowsiPMSZ+C9vzc2ZHK4dC0sdsNMHtYNYUYD+EkE+xvq5RhvADRg/2GnFmANysJ9tYAJHrVHmB/mrTKLGa22faHkIK0MGN28JhluSWG6pixqEiJ4AXL/5eHeLCR1AT7/D/KHvG+7bI3SU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789434152; c=relaxed/simple;
	bh=3AjDIB7EWMAVyxipcTRH5OCK7onXDuyQbUsnnxBTwFs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C4Mg0bgTqpDPRmvobeEdGj4Wh0AjIJCIEe5ZFJRLkF8+EzAcPHN+QVrOiJ/LFrPHjGle3jnz+yPK8rUnoTD9+9xLKOLVJTiTQkQi7dAHcq9wjo3XCIqTjBLI6mSCutGS1fPz64ujHQuJY8PqLf9BbGH6KA5nXXgx4jf1BIYqXZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FdkH8As1; arc=none smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FdkH8As1"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-90cdfc6db0bso35216656d6.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 18:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789434150; x=1790038950; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VPCy7DFPSTAzIsYv8xVVBEwv2TCCDPqTTW4KAZaR2co=;
        b=FdkH8As1b5Cp5neTY4ZJtVfRYAsIhf40UdVseCJS2LA1crSRqEcrY5B/+jKAXDIwj8
         SJJRYahn0DFpTUKfOOfXH3dqwLd/h8atQiBiGh73yObTeaRPp9idNFIMEzCW36eoQH0C
         tXFpLy3Xh3N7GyV94qSAz3DxbSDLyrlUvioaHlPhuAlDZan8DdxaDPgYre/sQ/uPkJ3m
         AYqD3LyaPUmbGZBlHZy048Ies41AiODsPSgtaMVsxi1y6Q5QdHC2gQK8XD9IvMRN+uyL
         YcBfi6Gqk+I2BRz/Pwb6Vi5nYMETLVvT81/dW1pKMc2yLYCrJapZN68Kl7+ibbR5KMTV
         RvQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789434150; x=1790038950;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VPCy7DFPSTAzIsYv8xVVBEwv2TCCDPqTTW4KAZaR2co=;
        b=Y18Rs6Gtj59BlF5giHeH9XHKYPsqLT4bJAPkfzs8j66saJLduxjv5U901C03r9EIB9
         WQmGWFKd5M7GQs7c2gqN1tn6MpIxjfQSu/FnZQJZ2jNOL7Qr298t84F2S+DwB/vJg+pc
         BZZJMLOMgyL6EjWy9MCGUHUvjOueEjbaga4BQMGurYAgNDfXww3/lYVMV82cIGYDhaMF
         Wx8uDWwn4CKdbtf/5ttOXX1DPxyivuBjNP5KUyB7E6XGXo26JWvanAGWGBO3VVmposbU
         Ax9YSAcoSNxLtjAKlZZi7Ndc1z+KuJLt/GfGSiPwsGEGNmNKTZl5BogE81dg/kRp4r3T
         36yg==
X-Forwarded-Encrypted: i=1; AKwUvBztjx6VWSFLhFwJAcWda8wq+bu2WzxuBFMT2fKL+RWfLU4aClGzS3YgNng6I/Hc0JJmglGKzCf/qsSFx7E=@vger.kernel.org
X-Gm-Message-State: AFuF++kIuFR5nJVw/PQv1z0MWVEnMQ50EV3KT4LnCvZzrw9hSS9yhihL
	Jxqe5iKqq0emRmEATpU5k/xBSUq5KPwssuG9FSnE9g7fTZnWgVhyN5A=
X-Gm-Gg: AYBFou36JPe1Gp0LHNsbiXl0k4kAnHYjlsC9vpWj4hx8qSPfAKihremMvMy/kxArLEh
	bMGXdnhLa0w+gOg8zvvHDuu1J6iRw9Hc0/frKze9DiE/+igQs+Yf3KTotbTelw3plJMJhAFI9vV
	vgqUI0+AimDZbmIb+7ZZlhFAu3mnfe6ZJBj1iFsT7MWPbSOtiy3dFyb3yBnqBDvGHs+rlVSpdtm
	A+KwriRWJSsSB61YQdSgE059ZEoeMYMftpY2SXd6mtwPkAdnD/g82y5oWlPluV+U/eIYKbD5La/
	yjXAaa2/1+r1d6PnoJzgWXqvxwmJfmP5upEpgQCS0yIGq3S8C+HQRUGgOBDsgX1O0Sl52rnWVDF
	T9CSAN+NGVklNVm0DzACMJTwQW87Vix6rjQwwi2LuP7QFfQhTTtqp4/GdEpPq87qh/snzNXMLeJ
	BEU4AqwZMGozKqXm0iUM7TB9O/QXyjPPjJdazEvK9dWjBpYkJ7sNKYrRcwPFh3vka0doHl7WlpL
	jek51cdh5Gn3Rt240aeUulipDlJcbEFv6xGeSYkexRQIADr8Rxu/PvZ+4U8SauqGw8kPAKahf4s
	VBmZFxosTo8fcRcBmZLL8NXguJGeB/t0YWyPrpF3umslIrO/6NJzmnPtw3TtHGNJpPsr7A==
X-Received: by 2002:ad4:5ae7:0:b0:90e:95d0:927a with SMTP id 6a1803df08f44-9122e4d4aecmr105329926d6.6.1789434149663;
        Mon, 14 Sep 2026 18:02:29 -0700 (PDT)
Received: from 6e-wmo5420-02.ad.psu.edu.net (6e-wmo5420-02.ad.psu.edu. [104.39.213.233])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f4d51ffsm110574986d6.45.2026.09.14.18.02.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 14 Sep 2026 18:02:29 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Hannes Reinecke <hare@suse.com>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	"Martin K. Petersen" <mkp@kernel.org>
Cc: linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 2/2] scsi: aic79xx: Disable PCI on configuration failure
Date: Mon, 14 Sep 2026 21:02:09 -0400
Message-ID: <20260915010209.53250-2-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260915010209.53250-1-mhun512@gmail.com>
References: <20260915010209.53250-1-mhun512@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ahd_linux_pci_dev_probe() enables the PCI device before calling
ahd_pci_config(). If configuration fails, ahd_free() releases the
controller resources but leaves the PCI enable reference outstanding.
The remove callback is not called for a failed probe.

Disable the PCI device after ahd_free() on this error path. The
imbalance already exists in the initial Git import.

This issue was identified during our ongoing static-analysis research
while reviewing kernel code.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/scsi/aic7xxx/aic79xx_osm_pci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/scsi/aic7xxx/aic79xx_osm_pci.c b/drivers/scsi/aic7xxx/aic79xx_osm_pci.c
index 5fba316..37f4395 100644
--- a/drivers/scsi/aic7xxx/aic79xx_osm_pci.c
+++ b/drivers/scsi/aic7xxx/aic79xx_osm_pci.c
@@ -189,6 +189,7 @@ ahd_linux_pci_dev_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	error = ahd_pci_config(ahd, entry);
 	if (error != 0) {
 		ahd_free(ahd);
+		pci_disable_device(pdev);
 		return (-error);
 	}
 
