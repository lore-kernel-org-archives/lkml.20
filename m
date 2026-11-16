Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794848916;
	b=bf71u54+gTzHyFF4eBB2qL2oUhiKaAFgEumvbPBe//iYrMWp1K2Q+ScXshuIEjswAA8k
	 S0WILPJtmjJd/kiCeQBkzUjIAf/OhBoEARurZDVOkIAuhubfL8H73XSut2Le2HnwYlL0b
	 05+phlCm8Y8CyvEYekRAB0bUAAN0zxyEKq3kQ5/HB112nVAo+sVN6o9lLa+maQveOEvwy
	 62kkzXE9hFaHanl3iIXTHqkXVKJycepCA2gLUb5KQucZ75anDut5EI+DjXHfBlBxtLT1F
	 zZwpqYmp16zG6dM6ffZYi3Ujo1GbOXaikWUevV6Uewsdq+2+DcFbxUrjefDib8kSqGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794848916;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=TyCAJqbOKleGpgFRMJoCvGXwTdjbSq8dLcDtNLIxJcA=;
	b=yYvxSHio/OKwDIU/eGXaYiE6ZbLdZ+BHfIITEnwxycpCyQPausM6U3Tbf6DqGjwsuvtu
	 u3/fF1Z62t4Xw3LGSrPz5wQVvrFoAQtOEpPF0B8eHxkxjT6ER8Cq2JYH6nYmtUBdfiUqR
	 2Rw6xTdvTqcj10z0KSUcuz9dzgjnzb44QdVOx3+1XiUA0VUGf8jXjCrz5QxJVIlzya6e/
	 ju+G6Wml7hl27nYpuG99O17cE1K2Xk+hwVHgDdyXsbWNxG5N0MYbcLbn+9clio0k+r2d8
	 TmVp+sMRKDTqykmSG4UxuPSqqFLPKjLQa4sGRTX21QWozxaPWPwHBUGzYSTd7Onq5NQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Te7EjenT;
	arc=none smtp.remote-ip=209.85.215.171
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D1DE606A898
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 17:08:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D1DE606A898
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Te7EjenT
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-ccca948203aso1682541a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 09:08:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794848915; x=1795453715; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TyCAJqbOKleGpgFRMJoCvGXwTdjbSq8dLcDtNLIxJcA=;
        b=Te7EjenTdLjhLlJJK/DgwaeqvY3nzsOpzyFZoMLTyGvZKTrJmNbPSSbcde3cdrewaB
         rR5fsCC3cNWscCz6FuZTnYaKXKGvRsFd3/ydandusDQyy6gzyjgiIntRbPSXtfP66Gg5
         aYxZPu98Jc5uNTm0oyn1sG/L5N3ei0Yi7g2cmHKHNl7zgtd3ZRRukEttv3OnfrlUIxk0
         hM3kbnhSwLvJyjp4I8t7PNu7Ve/5Wee4HkdkcNjiaTu7gUjPMz1JmagV/fYFi7WpETXE
         pkyP8uaU/7dNQBVY3GLJKn8XcnOkJhPILKIL7Y27Q+L38MG+bWkrjwGu1dlTPPVOS5Bp
         Sysw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794848915; x=1795453715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TyCAJqbOKleGpgFRMJoCvGXwTdjbSq8dLcDtNLIxJcA=;
        b=a9IPpepR3u5zK/EYJYEhCdGXF3QAFp2BK2vDKKjsGevzeXwlobkyERpodhykT3faCC
         2X21aNii3q/T3uvnK1f0rjP4r0q/EfxoQFVafItk9hffRaaUDry4lbTEbh7k3pV1gpoy
         j8/ly2mhh+CXEbZ7M4WTCdYHA+eYnO/40a2t04o/l1ftpTOIRGHg5rGuUPgQa0Q4Uk8T
         gXmK61xhsyMh8TXtfX2jwKoqY0yMnnxvx70+J7JIRNHoaLOKIiJHvSjLihzQOkyuVVA/
         MeJlnVOsWQQre9LX2HIzthm9p2pzRlyDts0MBj/oGrsAZKZrubREdRkTbjKcLzEGm0Xy
         KhYg==
X-Forwarded-Encrypted: i=1; AL+hErGAnHqaPn+5oB4fx+CdnBG3TWOH/mLY7x8tIIB9PCJs9pHcZtxJubnqWfrc/4z90kEq+GZ0DqCjFXcZtu0=@vger.kernel.org
X-Gm-Message-State: APuU4Z88DRz0dBzEK571JqWNrp26h93xW/1anfe4kR7FzkANvG2tJYsV
	hOE7K//NcU3Hnv3+53e+tXMSClxBcJ6Z+DdpLQBxy4cC3EEvPGvfH4BV
X-Gm-Gg: AZFdTZeT0yI8pj4yAPZ4pubNV2YfMFPoIrC8qBRgXqmmMaEVQOBltWYsjmA7Wqxbt00
	eOuV0UIwsa12vZx8wlvZ2/R+VHj0mvliOMpNi0J4WQ99U1YcG/A2q/0hR3v3OqdrlH2f/1YB7z3
	laDu31NGX7Crv++qIb9x8sc6gxq9sZuCvbO+jNuBIYlDiAofcTfHFoIvLhcvfV35p8v/cAecnxM
	uICo9YC5RY288RHZKvNduVtveNS/ChDYuXIthB8LDCOMF7/3zlsAWfnL8xIJWW9i1MlraJJ1qAV
	KC3F5YZeyGuB0QXv7WDXDZccJsE4jQXaZNj+o9ZcSKToSjM+ByODkB95ZipTNgJsoqRYCuUaIG4
	mjJBFwfhkXOLZd0F+9H72Vxiz65bYXjVrN1Qe9LuNSPr1AvoV0IPJOYsSx0tzgUJ3RWl2R42wBc
	KTx1c6GFhaP03juOPC1tHZPnZ70ihZxu1anwrC9ep62lIai1N6+y9VAeamNORhNwXVBTmlJ4eU0
	jzM/mQS2n5Mxm//+9m0LFwCT5PeGj+E7UL/U1JAoqD3wgj9X9A8wSQtNhsLW7QvNQYum8UfNh7Y
	WF04DLmLtgJ6vBaMi4ciBJNmn1d2qNdlvVTg8qpGdfAub5lH8Z9+pHVpr0S/C7kadzmXJhjcqg=
	=
X-Received: by 2002:a17:90b:4a88:b0:3aa:6b5d:9fe4 with SMTP id 98e67ed59e1d1-3b1b09f37b1mr9809235a91.12.1794848915345;
        Mon, 16 Nov 2026 09:08:35 -0800 (PST)
Received: from X.tail7c3ebe.ts.net ([103.190.41.115])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3abbad610sm150901a91.2.2026.11.16.09.08.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:08:34 -0800 (PST)
From: Avishek Chaulagain <chaulagainavishek14@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Dan Carpenter <error27@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Avishek Chaulagain <chaulagainavishek14@gmail.com>
Subject: [PATCH v2 1/3] media: atomisp: Remove unused any_virq_signal()
Date: Mon, 16 Nov 2026 17:08:11 +0000
Message-ID: <ab38fba11a3d7c38f50c5bd4751494b4f6281d6e.1794845230.git.chaulagainavishek14@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1794845230.git.chaulagainavishek14@gmail.com>
References: <cover.1794845230.git.chaulagainavishek14@gmail.com>
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

any_virq_signal() has no callers anywhere in the tree. Remove the
unused function and its declaration.

Signed-off-by: Avishek Chaulagain <chaulagainavishek14@gmail.com>
---
 .../media/atomisp/pci/hive_isp_css_common/host/irq.c      | 8 --------
 .../atomisp/pci/hive_isp_css_include/host/irq_public.h    | 6 ------
 2 files changed, 14 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/irq.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/irq.c
index 61dea3863..f1b01f5f9 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/irq.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/irq.c
@@ -215,14 +215,6 @@ void irq_raise(
 	return;
 }
 
-bool any_virq_signal(void)
-{
-	unsigned int irq_status = irq_reg_load(IRQ0_ID,
-					       _HRT_IRQ_CONTROLLER_STATUS_REG_IDX);
-
-	return (irq_status != 0);
-}
-
 void cnd_virq_enable_channel(
     const enum virq_id				irq_ID,
     const bool					en)
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/irq_public.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/irq_public.h
index 901e10f87..b487b7f31 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/irq_public.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/irq_public.h
@@ -103,12 +103,6 @@ void irq_raise(
     const irq_ID_t				ID,
     const irq_sw_channel_id_t	irq_id);
 
-/*! Test if any IRQ channel of the virtual super IRQ has raised a signal
-
- \return any(VIRQ.channel[irq_ID] != 0)
- */
-bool any_virq_signal(void);
-
 /*! Enable an IRQ channel of the virtual super IRQ
 
  \param	irq[in]				IRQ (channel) identifier
-- 
2.43.0

