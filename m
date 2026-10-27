Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793112991;
	b=BeHwHu4Z/LBBpSZQm0dL2pgRh+zSQ+nPN2+iw7c2o85CybW3K15r427xAabuDLsy7dzh
	 RZywdlMZF/Pg2ycuGxmGxGJr0GHOgdqyLy5gvjXpnuIOOtvnj949L9WREvm6i7IEjGVuN
	 U+EYhGM+BaP7/GI1xHIIXOrT7Gu+UZKxjdOrPeuxL3R7fgIu4zKK8KA23CksmDit6FHRG
	 qD1ZQh2KghvO2H078LB0qfDW3gDVubLo7NPzOmokRqJUbKfx6yioF5gHPn2MoGvBNk0sO
	 6WN6FlgJv1sJzslMDT/XbFmFnTrKgFSN5Wybj/545YQ5lTrjKAweSCOsaq/aEftVNBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793112991;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=b5Xv067oos1jGzjyu5wVHc8D051G+eVLX06OP2CtX4E=;
	b=T0xNz6w01RgCqaGNSTjiA6CCZxnYG0uh3ylHTPfL2NgXevfsfaWOvvJo9M4riHTDWqYv
	 wHDAUMrMwTPoAXiEoTv0YJbM+Bf3//FB3ZL9kXLnUfAyhbxmqSj+PvbGg6TVvO9eRwwQM
	 cVuilIIJqD1xxJ2/aDvUrPTMYIITwyaiiOYw2HKkSY9UE+yzBv/G+X96TZWHQEP3Fy8sb
	 ghDdIm+3RiZkmB3OwEtrRCq+M8A+k1Sh0r/rF57wW9TR/4hx9afS7nxJaUtT9K06TnvJS
	 r1FdB9+2sGaKwwdhBDDTsUeUrYnTBYhsVs6y3HZArq5LZSqxrfEBezg/30XuXkE4byw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="KYe/fonX";
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18C90606A323
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 14:56:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18C90606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=KYe/fonX
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so28164275e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 07:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793112983; x=1793717783; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b5Xv067oos1jGzjyu5wVHc8D051G+eVLX06OP2CtX4E=;
        b=KYe/fonX85Jpt6Zf6jdMXMCBtnMjn7J8E8NgBu2hEYgPbKt5IjVWHNbkaUsZDUk2d3
         Oqa4kqPJ4ZFIVs1JhOfOSxsE33MmEmEtXTKEKKfadWKRW9QLDU1maSiDVXBGn0M2kV8c
         OUMTPZnp3l6ZZCCI8dfloObyu9JfdTAVdyWGnW6vfBDxkrco7du+EKVDdnmRTnkxPQvc
         53HRBYKq+8H228Hwt9MdMOPDvp2NrGWGDRyi8/ecnBbteUQCeX9p49yxR1OjL3qEviEc
         e4tLBERBf0B4JSo8bhO2bWtddVDy9YDK+JBeTLWQqR26LrmcaOwJott4duzscTFaFtTB
         AZ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793112983; x=1793717783;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b5Xv067oos1jGzjyu5wVHc8D051G+eVLX06OP2CtX4E=;
        b=xUjIRjT+MUGUeYYPozAScv4UAl1MwhUn/xTQ0t+rgW/YHcZ/zvwY9FQJlQdOwCLkfo
         vGOuiP4wtWvnP0X2n3YF+xwnoZcVbKouOyi4juCr0pWHVWhkNMsGfPsijwoH/o6Cxwr0
         5vBfswl7V9fHaGrXJyyfmxQZk+m+5bLgrbj6VztAdF7FNR7JscnN076bQceb4lM3hI42
         7nSfrG8+VR/hVLVB+vy0hZ1Mny871v0zuxb4qGiEpoM4ZvXhfY5Hi9QN1U3/jaDBWJe3
         HCaVpVmVDzH63LyzGTPdo1Gyi1TfAV0KTTi8NSuseWo5ZWKFFuHCagwViv3MlRZoNm2G
         qOoA==
X-Forwarded-Encrypted: i=1; AKwUvBzdVWdNEtR6EFuo/yqnQQtudCVcFiqcW3eT9I61a6iPBVWmr6XmOYECPsRf9Ng7VHt1MYmXfJVzCsCUQRA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIYt78di9yW8oV2hRziOMD0xtRVyB25M5uoFogVMUTyLeWPn42l
	Y1UNJzwjlmSuyqXlpMM/px8PGlBVe3hNZIVPxhI/oAZ5+OHYXNOozIGqkyGgsndfRqw=
X-Gm-Gg: AYBFou1bP9xIWPJ781egWZKtRMx3QxzeS41jju4qzQASvtBGHB39ZknZdp2NuTuxYXX
	1PQrHvRUD0TiDPAveSp9R5QzTzcqDEQqry9pVfbpR8w5rK1q8YmbJ9udxYiZlxeTrY/qGv1tCsj
	sH+1SeywU0Bdp4JGZVfoXolLNlt65rghcTcf8CpNqGcACds14c61WkoTljz1kYOi63JgRqTDWjk
	+AuoyVeGtv78xpRvkselUXgLnYkxnCCePzVQ4BWJrUxsOpj8fgQTzZKnI0tNf0GixO/gVzrE0Fq
	CdBVboLtEYteVQAtk7D1tJdAqi7Or9dCGfK9pQfTI73q8qPPspsrI3Xn6XYZzO/gJICSNVdJI10
	88/oBHuNWDXDMU3st3LtmMeg4z1H+ZkbpCuUc1xix82VacOJkTjD96R2CxLPEh/F3YJ9zfEbkao
	tgrwOED9Sh1K1a1Xnk5FACUBoL5yYrzQ8n8Eoy76UVHRIkuoqT7S8O+DFSAAiBXhgx5d1EL4mmB
	3eH9RzevTTgP1nkMwrLYSdwH1mn9cm5WCAj6I3v+46bFfir/l3X1EwyW8S/
X-Received: by 2002:a05:600c:c049:b0:4a7:6bc7:f778 with SMTP id 5b1f17b1804b1-4a76bc7f796mr62469795e9.30.1793112983482;
        Tue, 27 Oct 2026 07:56:23 -0700 (PDT)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a30e22csm273188835e9.2.2026.10.27.07.56.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 07:56:23 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 27 Oct 2026 14:55:55 +0000
Subject: [PATCH 9/9] coresight: etm3x: Prohibit modifying seq_curr_state
 while session is enabled
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
Message-Id: <20261027-james-cs-sashiko-easy-fixes-1-v1-9-db43c4668644@linaro.org>
References: <20261027-james-cs-sashiko-easy-fixes-1-v1-0-db43c4668644@linaro.org>
In-Reply-To: <20261027-james-cs-sashiko-easy-fixes-1-v1-0-db43c4668644@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@arm.com>, 
 Yeoreum Yun <yeoreum.yun@arm.com>
Cc: coresight@lists.linaro.org, linux-kernel@vger.kernel.org, 
 James Clark <james.clark@linaro.org>, Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.2

When a sysfs session is disabled, seq_curr_state is read back from the
hardware into sysfs_config, overwriting any value written while the
session was enabled. Return -EBUSY in that case.

Do the mode check and the write under drvdata->spinlock. etm_enable_sysfs()
takes the mode before copying sysfs_config to curr_config under the same
lock, so either the new value is included in the copy, or the store sees
that the session is enabled. etm_disable_sysfs() does the read back before
releasing the mode, so a store can't succeed until it's done.

Fixes: a939fc5a71ad ("coresight-etm: add CoreSight ETM/PTM driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-d70beb3d-d997-429d-9828-d396e1bbfbb5
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-etm3x-sysfs.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c b/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
index d185fb8270e1..08c10fd146d5 100644
--- a/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
@@ -1014,6 +1014,11 @@ static ssize_t seq_curr_state_store(struct device *dev,
 	if (val > ETM_SEQ_STATE_MAX_VAL)
 		return -EINVAL;
 
+	guard(spinlock)(&drvdata->spinlock);
+	if (IS_ERR_OR_NULL(drvdata->csdev) ||
+	    coresight_get_mode(drvdata->csdev) == CS_MODE_SYSFS)
+		return -EBUSY;
+
 	sysfs_config->seq_curr_state = val;
 
 	return size;

-- 
2.43.0

