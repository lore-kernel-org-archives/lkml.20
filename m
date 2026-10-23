Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792752002;
	b=0VJKJtgML5OwZuqouPP2V2AXp5egwXqiHX1vH2T2xHvNHV861C/TvT62fsoWE7POIRa/
	 LR1vWP8293MY+5JIFrfqfXWaIuj4goKI202mKDEPHN0Dhk8XqPWL4EdOFMa+FI3waOzVd
	 nB3b6ca7XU3C3LHAlhTLnQ75Dmce846XgfPza5yVGBiBIEEg6lxkA5XLSoQmx54N/T+hi
	 PjLAycbnQMityUsYwtXMwDY0pJn2jL0Oze90NI561jDbdEv0FRh6X7KeB4WQBza4DdULa
	 uJyhKTSLyIOVeHNzK77laEINOq0ovTmIclAnmNHZ6m75m+qzTsFQpS5gfLC+UbvfLFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792752002;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=0zDX4I/rzq0NwFF/RM7fThuRZfIPuAAwOOGiXNusSno=;
	b=Pn3wGfAe7jCkwr4DYh+qIW60Gp1LaidiNt1IMFmRXYtHu1auOwsyoA0eA7CJGTiqlWHG
	 Bc3/8K6Ov+T8lUyPQlCsuPU83WFul51p/ks2IOmKYy0GFATt56Z3VxcUOllR00QsqzKRy
	 R+qjRlZxFbGKsyVWs92LdHUgwEBajT+LSkf1bYh2QHKM3ATtkh5ecPakoXNOZO1jEupmE
	 RMJWdaN/cH2p7jEWCcwCetdEL2NuNRcXcibBPzyNrtJYqcL81OWISFG7XT3QcC2ZbBaO5
	 k2GfGDMSsIUSnPap1mzBJsd94UTkIVAdqUfc3Y2Pt/B5iK9D8w88704z+Y5S8NijYcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=oSQvwN93;
	arc=none smtp.remote-ip=209.85.217.49
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB38606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:40:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCB38606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=oSQvwN93
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-77bf892b496so247485137.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 03:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792752001; x=1793356801; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0zDX4I/rzq0NwFF/RM7fThuRZfIPuAAwOOGiXNusSno=;
        b=oSQvwN93VXaQXN3y9HOxlaTumP3Wi8m5wUTJFAa+IkWGEhwy8DcRYPDPu13lE+SD8f
         YXU6PCaY0O6/AyuGmTsat1l853jbWOSQNwnq5MGdpDp+5MfCI1UtkY+svNWRIaPvhMpC
         +j85oEOR68YJ5ccdbWCDm9e085yCy0Sn++hxvGA0sUKF18rqWNHtBOI21eRnVQkbUyc4
         PynjtlhOJxOiVgLh3vBRgEPo6f8TT4sLfoeIOCP6i2npwBQpnqvuye7mg5Z3xqLZDP/X
         GedyXDQJpl2ECF5GKw9w5bg++qIwZvR6G9CLhAgp/nr3A4NZf3pJvR3hk8kaBYnDYhVG
         75sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792752001; x=1793356801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0zDX4I/rzq0NwFF/RM7fThuRZfIPuAAwOOGiXNusSno=;
        b=wEo/O2lWqfO3InvojP64BW735+QPPMAEi985nMdQVea9xlwp4z8OHvScpxHzPI6M43
         FwvoytCqm7ioWCGpUSRLwL2N0dU7XhI5AkJgp2f4b9tsTNvfrM28nFvUYHgiXnGmpyBz
         bS8kS70ErdyF6/CTU6F1onKFAUGcCg1G+Q71XjCmYyMiBgcy8SLlXs2FCgEhJOA0MXwT
         XonH5+UWeGZcGp/wVe+feagk4At6stxspmKCK1wMC/eeeZb1EhIKrhFV8roXhuADZ9sr
         o2+ThmzpFIg9HzLDzUJsrT0nzXZlbk039pDuyJ8sZy6SvCuPwK3SNrgfu/lTaGoVWDy2
         L76Q==
X-Forwarded-Encrypted: i=1; AKwUvByvH81FzcZpqQIZAmGuAM/WS1y37BAMYu4q8n7IioI4T3MNS566Dja63xtqz3mCsomF9etYWvGDPnUKkeQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLu4VLhxgVXgFTAUPuhYOc8GjUrxKZDN0WLprowBUtrWVxlju/V
	Dg6ej6O4BvEDsqhiMs3kL1Giy8pf6yuYYakqY1HYcXvoTQyRQ6ofz/Wu
X-Gm-Gg: AYBFou2y+8R+BuR7tUZjRVcUTuu4ZmJ03VSP66s3mCicOUK+9BP92REgYZWDFBhqL5g
	mmsp/ynyikU3B/FU+SDSUDtW5IVS2fvfRhNOsR/Q256UMnoSHVG7nxJzubqPUS+lhW3OBFc9foJ
	yFeUuWj/IrOVcynUA30l2+vdtUoetAcTV+kc6AnhEupvGr54ij/udGw3sIRe/ZCu85670vBHL4F
	0nL9gspyEILrSSrJOqoFWE0CToWmscqZ7aRUnBwZognzT6aUlHtNtr2FmpISW36ZUYlHR2Cztgp
	6Nhf6S4mJpl3dIo4IuAWLtlyi39O2SB3gPGU2GdelJu8LtCdqnCX4OoUbzHMKyZTEa+128g3OUM
	hkcmIuGLrRzAr5llZ8v+Q67Mexjh4u7tVkDjJkv4bAGHR11d3dn+/6YTBQnBQJEsj4fHWWdd9t0
	kdyhS92BrFVMPLlqI5CVpt22Ple0plurTl27yjpJgjVRLMN3T2jTjS573mQCdKIDC5uQ6UBYhHc
	laF4vs2tkJdkAE6GoB1sh0OIluluGJfNWLiRygft/kMAMbOPEdfYnbqJ2HUTl0r/mPqSNFWNs16
	2ocgQVr5+jMdrZR/5/9d
X-Received: by 2002:a05:6102:2912:b0:7b3:78ea:88fc with SMTP id ada2fe7eead31-7ccc349c3e9mr700369137.35.1792752000633;
        Fri, 23 Oct 2026 03:40:00 -0700 (PDT)
Received: from Biostar-A520MT ([187.94.15.233])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7ccc20fed4fsm2546405137.7.2026.10.23.03.39.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 03:40:00 -0700 (PDT)
From: Breno Rodrigues Alves <breno3011alves@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <error27@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Breno Rodrigues Alves <breno3011alves@gmail.com>
Subject: [PATCH v2] staging: axis-fifo: remove unused r_mem local variable
Date: Fri, 23 Oct 2026 07:39:43 -0300
Message-ID: <20261023103943.20995-1-breno3011alves@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <2026102337-headroom-shun-9d45@gregkh>
References: <2026102337-headroom-shun-9d45@gregkh>
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

Remove 'struct resource *r_mem' from axis_fifo_probe().  It is filled
in by devm_platform_get_and_ioremap_resource() but never read; pass
NULL instead.

This is v2 of a three-change series.  The debugfs_create_dir() check
was dropped because debugfs has handled ERR_PTR parents gracefully
since 2019 (thanks Greg and Dan for the correction).  The
-EINVAL -> -ENOBUFS change was dropped as well, after Dan Carpenter
noted that -EINVAL is the common errno for this path and that he
would leave the choice to the author.

Signed-off-by: Breno Rodrigues Alves <breno3011alves@gmail.com>
---
 drivers/staging/axis-fifo/axis-fifo.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index 3d358f919..464368e04 100644
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ b/drivers/staging/axis-fifo/axis-fifo.c
@@ -428,7 +428,6 @@ static int axis_fifo_parse_dt(struct axis_fifo *fifo)
 
 static int axis_fifo_probe(struct platform_device *pdev)
 {
-	struct resource *r_mem;
 	struct device *dev = &pdev->dev;
 	struct axis_fifo *fifo = NULL;
 	int rc = 0; /* error return value */
@@ -447,7 +446,7 @@ static int axis_fifo_probe(struct platform_device *pdev)
 	mutex_init(&fifo->read_lock);
 	mutex_init(&fifo->write_lock);
 
-	fifo->base_addr = devm_platform_get_and_ioremap_resource(pdev, 0, &r_mem);
+	fifo->base_addr = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
 	if (IS_ERR(fifo->base_addr))
 		return PTR_ERR(fifo->base_addr);
 
-- 
2.56.0

