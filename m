Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61DF149365A
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 10:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791455232; cv=none; b=IJlshoDJQMmgKuae4FSIsHeVTCl3KBxXwvvr0niUqnEma2WhwuTA58hqNjwztjEoB7FlLaesnHxMXYKc9JJxfUl3aX792ASofZ/TdePPrFZnXcbL/dQfoq4U+uY+AEjfCnyOSzOi9b8cF3h0j6UweRk/cadNfgeg6KYnPgNJl+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791455232; c=relaxed/simple;
	bh=QhCEJCWFqwrvmCjcqkWNZlTEDRjVdZZGuz074t6eMjc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oLjLtOtQNZutOLoPNN/TGGQzcx4/Xy5CQQxLFgMSvDEYM8S7VoE3bK4zX+KvceSQ17uBD9lRFEtiOaKAiPeKU/B3gV9GGg4FHsBw8EyMePJAgQpHWXiNlK0YXIEydDuam+GGm5MYnjKt6whE3kySiChoxVyvRPgZKtl/LKCJE0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr; spf=none smtp.mailfrom=isslab.korea.ac.kr; dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b=MA4kK9ep; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b="MA4kK9ep"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cc1c9879395so1368802a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 03:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1791455231; x=1792060031; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yYFMzSsUO1/6oY0m9yqtR64F8Xqv2JTUxrApkdvIlak=;
        b=MA4kK9epad0cFu/U1Z+pOHx3fmEF682z+ypLHtm4q9O9Tk3FRP7HvRqrpNRB40vA58
         Om7sOwwKmQ7GmJ9+sDhRiW6eAIxL7FkWKbdyEynBTu+IObZ3lhICwAINptkxWR8eBgRH
         +OJYU0fz4rIoBizjZydZVJ3VhPF9E11BfVUuf088ebSrDffaK16mt1RU/xrOUgAiCXs4
         CVZpGLQ/lUwhp5u0MBcQUguiU/ByyJHTH4QX7/BTs8492e7ZHCT+JekueNXrSTq23WTu
         QyWCvLGNOJ4imVTkgQYC4m5zOr1+nCmPyW1h37dDN/MnKZOyGQhJ8ISo3Xyqs99tOlu/
         JBNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791455231; x=1792060031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yYFMzSsUO1/6oY0m9yqtR64F8Xqv2JTUxrApkdvIlak=;
        b=sgTfHMVicq8uSviMgtMVGfjT0jUY0xxqZDgC2GTJksynz5WtMY/ie+7VJlwpziSAlR
         WVHLcRgMsTEOgktHTeqBK48X9KeK25LZjH2IlwJIEC7IBtqSsiSgxOrB13vi+j6GfuFy
         UQgObJtF61Of/19GUTN+aiP6qkBLa4dBRa5I2ci3g4ORXTUJQLQCb1vIQO3+x5m2E8zR
         Im1F77cuYxqmVKFQMXTEGDPzBvOlbVDuqumZ5C2cHzm3FyKFnUPUYarnriYxLtI9+lqC
         7ozm0s/q5mdhMvioyre4OIen2DJDerylTGREIhPYHuRsGBueyXnD05nkVR5rYQ3Io1KS
         4OCg==
X-Forwarded-Encrypted: i=1; AKwUvByokOR2awsZFBUaakcZzCTvua0o5FHCGSNokWsycJQvSNAlAzP7K7OExncIVTXixyzhYW/hbTMygd00dPM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKaC+du/gVeAa0Ji1qOaFAfr/uXUNsfjl3jBRNDxopTtMIdyLDx
	Iv/DQsN9z5e6I435fqN/2xVYjgj6lPlDOSlqhWcb2zdWmJX6iPva6XLbZN7wL6KvJXc=
X-Gm-Gg: AYBFou0yap5S66uvaYBTRBK8IkelZvv7aD0Zn1SG51lBxMCCK1lp/NFRgBj4bjNvrx0
	Mq+MPJtaeE969K34MMtYYaeX8Hw3FP/7QZ1ZHdUhFKjb2KBhb6Rmgfr4IVod6PqucmwxreHJ7MW
	tcM1+tk1cQn76ciu4oMwYEdz+FZPrtz1t76t6NaYDQAU12/ptEqk5/WbJkuWyes1fhPZH+WbQ9P
	jVPTxcTHzdbgMLRvNoZCtVgGYCB7nNo6Iwe3Of050sxet2QGqjayIKVxPjrgShgZrzPo2jEG2mj
	h9RV6ARk973dOCDAik0QUWT8X+49rXNJxQt/1yeYpuxik33Rm57Q07lRRuJUlIhFJOHepwAoIws
	JAMkb9aUFawXd4yK+GlhwmW2+zw08pvhAPbrH7t7oadp6nioMIW6jV+51O6MfVAnXYTQ+Y8XrlY
	nLMWr5FbHC/gy8B4g1qXNpasDHobvPZObz5utU6dAFZYSp1pzMOwykKa1Vff7pAVv48hxW2LAmv
	PHGMA==
X-Received: by 2002:a17:902:f707:b0:2e2:ed2b:87f8 with SMTP id d9443c01a7336-2e600509214mr44172725ad.41.1791455230764;
        Thu, 08 Oct 2026 03:27:10 -0700 (PDT)
Received: from yhlee-960QFG.. ([125.131.91.97])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e6046fdbcasm22578185ad.13.2026.10.08.03.27.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 03:27:10 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: jpb@kernel.org,
	joro@8bytes.org,
	will@kernel.org
Cc: robin.murphy@arm.com,
	eric.auger@redhat.com,
	mst@redhat.com,
	virtualization@lists.linux.dev,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	sashiko-bot@kernel.org,
	Yehyeong Lee <yhlee@isslab.korea.ac.kr>
Subject: Re: [PATCH] iommu/virtio: bound the probe-property walk to the probe buffer
Date: Thu,  8 Oct 2026 19:26:53 +0900
Message-ID: <20261008102653.1084996-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <sashiko-outbox-163970@kernel.org>
References: <sashiko-outbox-163970@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thanks for the review.  Both points are the same concern: an unaligned property
making mem->start and mem->end unaligned.

This is pre-existing.  viommu_add_resv_mem() already performed the le64_to_cpu()
reads of mem->start and mem->end before this patch; the patch only adds the
bounds check in the walk and moves the existing length check ahead of those
reads, so it neither introduces nor widens the unaligned access.

And it does not fault on the architectures that build this driver.  VIRTIO_IOMMU
depends on (ARM64 || X86) (drivers/iommu/Kconfig), and both select
HAVE_EFFICIENT_UNALIGNED_ACCESS and read unaligned normal memory without
trapping.  I tested this on x86-64: with the RESV_MEM property forced to an odd
offset so mem->start and mem->end are misaligned, the values are read back
correctly with no alignment fault, both with and without this patch (I have not
run the same on arm64).  The 8-byte property alignment is a device-side
requirement; the driver does not need to rely on it, since an unaligned property
is still read correctly here.

If you would prefer the parser to be alignment-safe regardless, for instance for
a UBSAN_ALIGNMENT build, I can convert the device-provided reads to
get_unaligned_le64() as a follow-up.

Thanks,
Yehyeong
