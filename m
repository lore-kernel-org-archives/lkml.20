Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 708C837A85A
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 23:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789168149; cv=none; b=B0blmA+ibQ+KesMC7/XM4+vbH4Lw6zXi2mWbAKCKc+7M1p+zmpnORNCQinTnaqigY+VM+fHr/FhOy1F8TCGeousuia0haQloqv9mIj9Swbsrg5VA1GxFHDJd3YFsE1lkAb5UsmGUZrIae5MR6BNXsMjuvv7P0DK3SOsq3iE0G5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789168149; c=relaxed/simple;
	bh=ueMoS38D94aOUCZabe7u/Monic6ziSOlP5pUtoCLHdU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=l/izBTbR0AOdA+I2YZFCXj0wP5V19vpNgmbGIiQEEa1/2bVhafgkcA55PcWgLQtuCi/JyTWvBe6y90aHJlrpO+T5dRhwKxQTCf24R0LuY00VhQBSdoBeQZo3NbkmMQW/u1BVQDk4VRgK1bQgYLedPDMhOkJaoZ7OYyuLeBQE1X4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=itIYlWeL; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=topzliSj; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="itIYlWeL";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="topzliSj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789168147;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pSoRsWAHS1TRlan9esp4cwyH1YHqpyF1I7ErADSAjOI=;
	b=itIYlWeLxvUytae/j5ZD+xAQNcJ9+hfyyPAg4POE304FWKgMvI1tHqhOTfwZA2kwIGYaov
	6W41BioTxDm2WRVCKCFs4Syd/CiX2DCj3Nd9uenCYERNgve/FQPq32aMT9ocMJd9pZrtsR
	F9JoxFnMNmbzuMqUCh1jo80UoSBgp0E=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-53-7DD0MYu7On6RcxIi9YirGw-1; Fri, 11 Sep 2026 19:09:06 -0400
X-MC-Unique: 7DD0MYu7On6RcxIi9YirGw-1
X-Mimecast-MFC-AGG-ID: 7DD0MYu7On6RcxIi9YirGw_1789168145
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-90e7f98bcb9so26653956d6.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 16:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789168145; x=1789772945; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pSoRsWAHS1TRlan9esp4cwyH1YHqpyF1I7ErADSAjOI=;
        b=topzliSjB8S+xObNda2yzYUMq3Py7cRRSA4v0FehJf5MuMwtXU+8ALKUu+Pw/zkzBR
         ozNtY7zFIqHxu7z12nCGonBUsUeVVVJqD9fqDgLrSjdOUk5w3/d/2nLOpAYHrLCsWKmm
         5CRYy4tO5AK3m3zyzABTXIimjOgLJkrpU+r+IkkmTYtSfoe6Akp16ZBTVQIoEb23zepS
         lthE5Ygz4/j0q9cfZpEGknlwacRpMVIlBM5plVV/wQpLN8Om6uggJPCGLJbrbnjiV8rn
         4zCVxxRkQ/vXbXc4jx5UgmQ4ahGG/NLyNFiQul3UnOHgAA8wkkdch+B5ypGHd3p37tsS
         xIlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789168145; x=1789772945;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pSoRsWAHS1TRlan9esp4cwyH1YHqpyF1I7ErADSAjOI=;
        b=S89rs/ZhJnZ5Dg2un1Gu/Lj3qKbqg7l46Bfvefp5qj8C6R0chcNAuKhnNIqb6gdHQX
         R9n59cbmCi++tCu7a/4XCdhmmnWixg+FpaWSZYqz8dfTAsrXQp2NP1XzxHGrJo3g/LU0
         a9FQDuP2AopP3tSlEjEaOnxTnp+s2hsrfpS7I8a8xByFSpMgulv78Jer9ixizl2C+ZM3
         P8rwurZbX+Ic6a1lRv+da9UvcDOCYsHz74lem9ya+zXQyOM8pPojSxhYU1sU5P4DrIYh
         9GNmT4qa9Plj/hStf+9prfjWJuUNCG5dY69NKdpOLK7rnsXjFmXL2eAlho+9S11Z7N39
         v+wA==
X-Forwarded-Encrypted: i=1; AKwUvBw2xln+p1Da/hVPfOPUri1FPF/ctNEjOaATIwpZcQZP7+P4BjAjhAiC7xbHnaaqSCWeJu3DSTi7zNC2sNA=@vger.kernel.org
X-Gm-Message-State: AFuF++ndYWzo/e+ZpyBQAsr3CEaFZfl4c4RP3FchSeitqzFkp1WVViQm
	bo3IDqoRUiqmLnRwou5QoqR0qIRPFvro7HTg7CLAHCia9yDNUJR2HssHWCmjSeBxiDO85pmqJW8
	ZLxZKvlX/k+6tJ4GrENPFPnFr3HzuHlz7rIvt5R8X4xeTHS3P1tdaMPRCMs65IaZnh63W/9s0eg
	==
X-Gm-Gg: AYBFou3M9hw0Psb6LWE1YUbuXlZsgXFQxhvJ/kyfWpDUtSqRTmTqmU4H/doIxrtEcR1
	PC1bOn16JO0iTQS7cj9pOGCh6Z+qbnRXCGX3a6iUoSq6gp60J0aIPNLyAS59jLICVPPT/nteKWM
	C04Jkyx7RENgzhgtTF5ngf/oHS7IYmtE+X1+SPTLfzx/zqex4xn9hZW2mNqVGlQw/CVW65PH+Cc
	KZA/Z9nU4NlCBACHpVq503y7YHmBBSR9ncnQ4wSyuzJH4FzpP5s/n8MvM+MaA1z+U9xLNJp87+N
	U6cATS6FM2E+MV2demc3Vef8DKngVPml/q9YtwMU66tOw7gXJH8PVqcrFYo/kEpGMFakbwfQIr1
	O5yYsrP6dIHCLRu8hpf1IPvw0B/q+GwRb6dcuoBng
X-Received: by 2002:a05:6214:43c4:b0:910:63b6:fc60 with SMTP id 6a1803df08f44-91212088ac4mr110557186d6.11.1789168145541;
        Fri, 11 Sep 2026 16:09:05 -0700 (PDT)
X-Received: by 2002:a05:6214:43c4:b0:910:63b6:fc60 with SMTP id 6a1803df08f44-91212088ac4mr110556676d6.11.1789168145136;
        Fri, 11 Sep 2026 16:09:05 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f45cb06sm31876726d6.11.2026.09.11.16.09.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 16:09:04 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: Tero Kristo <kristo@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
 Andreas Kemnade <andreas@kemnade.info>
Cc: linux-omap@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260909-v7-3rc-omap-fixes-v2-1-83e95e162330@kemnade.info>
References: <20260909-v7-3rc-omap-fixes-v2-1-83e95e162330@kemnade.info>
Subject: Re: [PATCH v2] clk: ti: composite: resolve parent clocks by name
 again
Message-Id: <178916811940.770750.2823922556711724746.b4-ty@b4>
Date: Fri, 11 Sep 2026 19:08:39 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=330; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=2GpGJ8FvOxDKSMB/oauE5IClSIRZ2XkprqOxmymbc8w=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLKWdPFM36FxeLma7OzTDyoPbpcz5n2Qn9gSPOvQ3BeX3
 tRenjPhUEcpC4MYF4OsmCLLklyjgojUVbb37miywMxhZQIZwsDFKQAT4djNyHDbP7LXdybLi3fF
 FuGKjvU22w4ftFMuvrHaIPDD4o2XhVgZ/hkL6r23/nv8+dvNMxN10qc/2hd83OPg9snp896xhPz
 K0OEEAA==
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087


On Wed, 09 Sep 2026 14:16:36 +0200, Andreas Kemnade wrote:
> clk: ti: composite: resolve parent clocks by name again

Applied to clk-fixes, thanks!

[1/1] clk: ti: composite: resolve parent clocks by name again
      commit: 59e0cc31cc5c43586c6eaada62c2c863bfbcbfb5

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

