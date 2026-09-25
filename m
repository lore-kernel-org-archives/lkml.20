Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F192D7BF
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 00:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790294951; cv=pass; b=kEtDOoqMLWrAIHv6aNitBco0I+HRPuxoirx1raaMJ6KAVWa2CF2yCFlpAaiUhym8aHtaoSeAh7UCf8OrJX1YYHmQyDIWhiyu1EkdKFJ7NN1Rs2uN2SsDAI9E9ryPbIqiEyrKEUnq1FUpMfV6VmEKDlwLzLUepl58wyZnQEgwVBw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790294951; c=relaxed/simple;
	bh=CECXwz9NVJRqM1zgzja4MxTHWcCU82DN3pcsUZd/76I=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=HCQ1bB/oT7f22o0RImDhjGccnPumwh6+zxuPE/r5rzcEigvQUtzBstMnX8kci7TUfpZbgNxQsEuo8uR6wYQR9YNM3nGxeYu4kAfMYLTb1tF47PLaropdVMYrA0Wku6wgscivg/Mh4JUGGJFeRpCwMPcmuwzAqtqd8Tzhcza9YTw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iYP5aIVy; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iYP5aIVy"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254fa65080so37106266b.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 17:09:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790294948; cv=none;
        d=google.com; s=arc-20260327;
        b=e8uEmDcURiFp3R/TqH1is6NbhkJJyb2qvLNkFBuIbfMYaXx6Lf5tBxBjMdlEmA7OOp
         ATkRiMdVBBCcKg/D05ZqZV/VTsMQkx2G+MH48kpCjdahtwprfsBlgE82GDP3dcM/yahl
         4DYMcgw7OTZNbPGcPkSmGGvi6BrCYcQ4JtSZrpeVl3PZSsYDr6Jl5irfGE5lJwjhMaeg
         IheTSDbNQRNh9o4X3Y1so8Bf5Ikgdkx/5n45jfSiSCtN/Cc/edN7T65I2jxHiGyjW9Gv
         bdB0tG/7tRSHmfPuxt3mukdJSLXOYccNTRvtw+biuOKx/rAvw036sk5pm1HEqkQPj6ns
         oxxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=JvVb1ppKBUi1pgXwEpUrjpuTGibjVjV3ESWoiV2gIGo=;
        fh=GZMaVWaUNBSJJ4YiyPAZv2boySa8cyCkqpeRK0+wNZg=;
        b=bTa622o4H42nR967ez6nm3HPYNaEitGzk8gVLH4SSj2RTA/mF7AT/eWfML8XV/mgTW
         cfny9ykApQtYVbgywkfk2TWdmZ3HhfByjjObVgZtzcl30E7blFU4wJ1qOeC4GSX+fwty
         fuEOsLKQACyzcKrWWt+TV47Ufyn0BamTQpYohthTXBKJJlbclmIN97F4zNAL38QjOV87
         57tDbnBNoN1SWcCcJZGqEpJ/r6fRPc88RjABq98GWXtzQ+GttV12HapfnH0LVH12jjD+
         gBZXlV4WlrawAQtR/fyg6GM8L1LD5K/aMwEPjC/hNzNeKnkngUaHo32VYxDcs5XxXLWt
         B66g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790294948; x=1790899748; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JvVb1ppKBUi1pgXwEpUrjpuTGibjVjV3ESWoiV2gIGo=;
        b=iYP5aIVyIeeS1wxy0RrhItS7i7zqc16eXkOgnFkJjoUNC/uyPZ+Yz1nI5FISpHqyET
         DZ7gGonG9YtPmxlKQVGoSykkEKghqLCJPEHZKCv3ZCaDsg/ceH+LGcY8mmiu1Q3YZxep
         MVCbh9Y1umWemrFjuN9suStgzII0kccsWFi9MZjuP+i4WlFlDeSwQhZfkGSoVtaTf9bs
         4WLlS13TQXIIseuxOHINovaI/4h1aZzpMCzhMtmFB1Aumna8Y/YHeUvRYzu5iqD3RJUS
         74bdH2QMbdZPuDJ9AmHfTcuqnw1rUlKOV9AqATiWV1W6hLbHpZGU23SMkz/v7bY0aHaD
         puWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790294948; x=1790899748;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JvVb1ppKBUi1pgXwEpUrjpuTGibjVjV3ESWoiV2gIGo=;
        b=aaND749zrxWHDtGft+tEq49u7Axjezo+zUaY5ZyU0rn/BRX4gkovfV2m7QxyCrqBrs
         0LjL2Y2TnhLmusSAyOgk01hX9+X5/OHaEvfIZPpNNOOJpNxKnNl/ZMYCeQmLqAclxagD
         /8AL0tI6FoRTFDMtaagXSQ2Z60WRFqgLnQFKf+41SJQFoDYpRk5OT8te9MHMe5Dr94F+
         puU4/Zd+VCHBLYC76nkyiGlmweZ1rSov5BNuvSkWPhSUVOnUZa82wGpL4/zmzM1/EG/7
         rkHJMlL+wvujaQeA1gBNV53ehZ2h4xMgl8B7i0UvIit8+i7ATd0H9BsPx8NNiJTj0NSZ
         uQoQ==
X-Forwarded-Encrypted: i=1; AKwUvBwiA6UmzuBwpKBHBCf9E7f/ErWJ0kA2XFQmAJJgGVHF6gD3G4O/qAPssIp3T0pdqGhnOD3IRo8p/cmRKew=@vger.kernel.org
X-Gm-Message-State: AFuF++kLWtDdIgOGW0fee3WhfmF5HrVYB6iyC8vl3RRARAeg6N4hPe/u
	Edw7pwV+dEsSrFdDVD2fmdT0FVdP3bDd0AsO4Ub/j6kD5b9FWyDQ9qC1A0MFSE8waYg9cn6WvTD
	4bPHWULFfxwvr5OElpZP9pVUMzHmTzw==
X-Gm-Gg: AYBFou2rSMuaYVbe7NwY+yS8rFtdRzEhFIBQNuqsXYlYAnZEXfqebD9sQ1pHLywHNVW
	6kz/iSdI6wlu2UW9UMj0rqf/PJ0TzHnYrPJLAMafRpthGMSQ3nh+/b+Jokqe3zva9rP1SbnsBI0
	7hJ12cW6VHR6OgTDeP8iaV6vEFMDZF04ZU6zhDGMvsqRG4IcEMJAwDFCACdQNrbEt4ZnF2xAqf5
	Ev+kK+Cve/DRnWGo5zW3YyCmjDmVnET4Rt2/PAOP5zt24/o8ShDgXo6filpsajHlKlL4yZQ2/vC
	2cV/5DQAm1kgPUoqD0RNhisAuGYqOu2D+W52lU+WEAXKHr12R9XS/tH9An09uHN4/1FsUbVmIpi
	KoOinbaY3PVGD/7BTdYf7lFvI1nHTLPDi8Ahjg35HBtgAkPwAcgXqNL+r0PsGNZ1v
X-Received: by 2002:a17:907:97c3:b0:c25:9102:ed with SMTP id
 a640c23a62f3a-c2ac2311b07mr339426566b.5.1790294947745; Thu, 24 Sep 2026
 17:09:07 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 25 Sep 2026 00:09:06 +0000
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 25 Sep 2026 00:09:06 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: mhun512@gmail.com
Date: Fri, 25 Sep 2026 00:09:06 +0000
X-Gm-Features: AclHuK_ad8LwT8kuVDl63QDbO1AN6EHbYByYWzU8WNbNKdgNeemyDEcExbIrb2Q
Message-ID: <CAGEsz8GkK7ZZoweuoR0DwA=CaDzJtQnmTWasEW=wPRv-yBeKew@mail.gmail.com>
Subject: [PATCH 0/2] media: venus: fix HFI teardown races
To: vikash.garodia@oss.qualcomm.com, dikshita.agarwal@oss.qualcomm.com
Cc: bod@kernel.org, mchehab@kernel.org, linux-media@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	mhun512@gmail.com
Content-Type: text/plain; charset="UTF-8"

As part of our ongoing static-analysis research, we reviewed the Venus
teardown path and confirmed the race reported by Sashiko.

This series fixes two HFI lifetime races during teardown. The first patch
waits for the hard and threaded IRQ handlers before releasing HFI state.
The second disables and drains recovery work so it cannot be requeued
while HFI state is being torn down.

The later Sashiko report also identifies a separate resource leak when IRQ
registration fails during probe. That issue is outside this series.

Myeonghun Pak (2):
  media: venus: hfi: disable IRQ before freeing HFI device
  media: venus: disable recovery work before HFI teardown

 drivers/media/platform/qcom/venus/core.c      | 2 +-
 drivers/media/platform/qcom/venus/hfi_venus.c | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

-- 
2.53.0
