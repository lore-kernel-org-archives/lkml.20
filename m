Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 612F938E106
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 21:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788298990; cv=none; b=DoFq7k0N9v2jScvbRaeHHPYbHwWnk4DU9r9CLAj00lPbhXJU0NdBVmpfL7s/xxmaUTyCz6lrvtSwJ3M+t3OqYw4odZdLZWcBYrQJuMEvSENxRHbJJA1AditKb8Og8ak+kiDQtbSLug+PUYP7SAHwP43kUvaj//coUQDFBOP6xhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788298990; c=relaxed/simple;
	bh=WsfyOjAy0FkWiqJQx1DtNsaOL/vd8OJK2zTRhAM6XP8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mCunleKsXo8debjq6AVL4ucDgOjw+NBSpUO7OQJYg80xMt8IHKLSWHTCRIDiE0R51xYe6DeF95ZQ7TWg9DjUHauQdb1wfma9Y7v56lIvUMcPD7lDbehUgbcTKXelaNnIfxcEvwPVe/ktqt4MWioX8MpXdzJxYWGYRxOxzbSJeFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PX1NfIbU; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=SxRoT3AR; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PX1NfIbU";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="SxRoT3AR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788298988;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=lJnGHCa5zu77CfKI5DRPOBnEPo8n3SuSuIiqIBE+PyU=;
	b=PX1NfIbUhQPT8Dx6egZsRJOgl78h87Gjzkr1cJLdQbqYG02Fq2r+CPjZY4NFNnhmc6A+t8
	zHnVmSCEwsUq6qP2dSQ4Y718CudzBB1kmgXC/iaZVyh2R4yWjFSG2a6IuBQlmXJU7UC8HT
	/Eq9NJ2DZvrzyQcP7nH8JVbzG1/1o0Y=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-404-5YZZFwtLPcms46E2ccX6uQ-1; Tue, 01 Sept 2026 17:43:07 -0400
X-MC-Unique: 5YZZFwtLPcms46E2ccX6uQ-1
X-Mimecast-MFC-AGG-ID: 5YZZFwtLPcms46E2ccX6uQ_1788298987
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52f9f6b85cbso5474021cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 14:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788298987; x=1788903787; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lJnGHCa5zu77CfKI5DRPOBnEPo8n3SuSuIiqIBE+PyU=;
        b=SxRoT3ARmo2IhNR0hbPf6aj7kJ6vQ1iA3sLRTNcceUs9o4hojfCy4LO4qLaCe0EVgz
         V39ZV2cbFgDgV1MZ7BiBwUJZXUPliNJ9gmxLbkI5bQpSBLZjrzBzhdrDtJqDuIgsGqE8
         iIPM6RD9OAFRVt9O0LoaKImxzE3ZDNojOughvkibGQxbszOfH6ODatK5tHzZutQ1xA7e
         3jRHy5PixmXHYsDRY73d8DWQdwuwxtQevXD8xZqkDHi2QqaS5/37xheb/zMQt1NCfuoq
         gMNt7t8rQhUsThpeW9cwlrBtQVLynT7cUsrimZtta8o7WQ/XQt87lAaTiUCSJ+y/rNxi
         AOxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788298987; x=1788903787;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lJnGHCa5zu77CfKI5DRPOBnEPo8n3SuSuIiqIBE+PyU=;
        b=E8d6DWwHdPz7E3SDgPJS3KYqYr28tGZlQX+ubIK/aLNUzJbo8okthWrW/pCND4W5E7
         pGKBoZoeUw6Zh7dIAK37ZTyuYaNS01PpJwk3E6XMN/OOZEOIZYRIi7LPKrCltydV61ms
         AOh/nDX1j0hSVe/t/V7HViY/axGqPnDt6fOAIE4gtA9AWnwquPgTDDCYyabbL1FQiN1G
         9PVeTsWjJRamlgl30Fe2awU02i9jIYs10rt4hi2rs7xKhWM9gisVpa3Ydgy6+xc36wJT
         rPUNZbuyJs/s4kbxJocMkcn5skcZu7heyCpriTksyUOStHC21CiBUNUKYN4Nk+ykYf25
         RPQQ==
X-Forwarded-Encrypted: i=1; AHgh+RoEG8UYoFKypkYValqgHTx0K60E09g3xDdTLBXn4LKI96c0RBWgPy0zMp0a44dta8TeB850pUQ8RK1yw0I=@vger.kernel.org
X-Gm-Message-State: AFuF++nkbbYrgo5xJHMns/HfrG+cAQ3iYt8PiGSablVh1kVThPFwzCFM
	wXNXbB/w++6aaLCLXsOHrYoOSz78i8VRSDzb0X0ViLALrHUq+Ui7ouGufONzf2aO+U3e1FOoU7O
	VNPwOcrwV+ezFkCl7Ny1EAz1V2KXnaaVi7hr4PD1Q2VuZ+rOkmRzTUpZ1NLE7hlAkwEhverDvww
	==
X-Gm-Gg: AR+sD10MycJZHSs1Tpaxl+N8KwMZ12/P3bByR/t/9db8EjERux9L7/7PDyZp+PCTPGo
	t0KhmTce0ksi68QAwHxND5MjpkOx8HAMSDjrX19KpR9PMy5kwbyDg0gSm6XgOZx6Q1xlEBDCmm8
	TfCyYauRAFazp9cUFf5ul9dhSOD6wy4SrCxFoqAAVYy9HZGuy/8rK+vPcqWzgBOcmhtoojksWkq
	32Fshg61OTij/mD5aRyhmA/6tc0FK/eIBabuZSmxNgsyGvRGET1pF3/pWS7cerrdCadm+DcA64H
	FEZapqlVyhEDQICTve7gRTM0TwE0XjMBwAeil/D4RKvcz1AD6Tw88n2d/iHiVlZbgcdY6Z3x9t2
	G/8eGlktNaiv5e1O/806rqSU/n9rK/Cze2rKH0yhgRox4Svd6ygCbcJ3IDdfipD16+Ow65uS7no
	ii/pMCAgkN/1u+cP+pXovpeg==
X-Received: by 2002:ac8:598f:0:b0:51c:805:1be3 with SMTP id d75a77b69052e-52fb96ffa65mr422017001cf.31.1788298986743;
        Tue, 01 Sep 2026 14:43:06 -0700 (PDT)
X-Received: by 2002:ac8:598f:0:b0:51c:805:1be3 with SMTP id d75a77b69052e-52fb96ffa65mr422016541cf.31.1788298986314;
        Tue, 01 Sep 2026 14:43:06 -0700 (PDT)
Received: from chaithco-thinkpadp16vgen1.redhat.corp (184-96-189-144.hlrn.qwest.net. [184.96.189.144])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53032ff5866sm5889811cf.3.2026.09.01.14.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 14:43:05 -0700 (PDT)
From: Charles Haithcock <chaithco@redhat.com>
To: wim@linux-watchdog.org,
	linux@roeck-us.net,
	linux-watchdog@vger.kernel.org
Cc: Charles Haithcock <chaithco@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] watchdog: Differentiate scenarios when watchdog is closed
Date: Tue,  1 Sep 2026 15:42:49 -0600
Message-ID: <20260901214251.760184-1-chaithco@redhat.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Presently, when a watchdog device is closed, we print "watchdog did not
stop" in a few different scenarios;

1. When nowayout is set
2. When the watchdog is able to close, has received the magic character
   to stop, but fails to close in device-specific code paths
3. When userspace deliberately closes it without stopping it

For 1, we explicitly print we can not close because of nowayout. Nothing
differentiates the other two however.

This change adds a print to indicate the watchdog was closed while still
running.

Suggested-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Charles Haithcock <chaithco@redhat.com>
---

v1. Introduce change and modify logic to differentiate
v2. Simplify but still differentiate

 drivers/watchdog/watchdog_dev.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/watchdog/watchdog_dev.c b/drivers/watchdog/watchdog_dev.c
index d7895009a2..937bdd4c92 100644
--- a/drivers/watchdog/watchdog_dev.c
+++ b/drivers/watchdog/watchdog_dev.c
@@ -305,6 +305,10 @@ static int watchdog_stop(struct watchdog_device *wdd)
 	if (wdd->ops->stop) {
 		clear_bit(WDOG_HW_RUNNING, &wdd->status);
 		err = wdd->ops->stop(wdd);
+		if (err < 0) {
+			pr_err("watchdog%d: Failed to stop watchdog: %pe\n", wdd->id,
+				ERR_PTR(err));
+		}
 		trace_watchdog_stop(wdd, err);
 	} else {
 		set_bit(WDOG_HW_RUNNING, &wdd->status);
-- 
2.55.0

