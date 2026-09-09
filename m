Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B6603BBFD8
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 22:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788994324; cv=none; b=Jjw+7NtrYyqSu7X13AjFAFIpW+fgxni4R7LbOqA3kky8l4KnlKvK2WAnDrAPVZYReTDdl66CQ9OisznvV/GvPGFbh4IsAAdp9hfotpwweEzQUmTf+VjmXU0m1OZbtmtld/cupb9Msk4RkR5+NwVxa1g3OKOLob1GwVKQNC0H7Sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788994324; c=relaxed/simple;
	bh=+zx0Es27kLaPv59lhsle3IxCZWQ7rYW77UlTXnD4G34=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=vF4lZwX/wnAieDdeB+7CAtoutlZSOEX65frdI1GGvYpIDwH4fG9TMfSDCTS6C8jmbWHyuHHaYgfCH3N1HaaIdoqRaxaUndgSIgphO/cF6vTvMD6hkrdJhk1QbN+KGiGF460/5Omo39aoRqcWsgnqnmB/5UF6HKJxZTF0AL9O3DI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=MZlDiNzx; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="MZlDiNzx"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-910316a2fc9so80160406d6.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 15:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1788994309; x=1789599109; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1pvaMPa6UbQ5WwIuJKDQQUXZykQOh5nAfFmGb0Yzfs8=;
        b=MZlDiNzxvb0c2UOvhdsXcAfiYdyPi7CZlYHZ0CgMwqY0V99V3Ck1KRjReQdXPT4MzV
         nAdl7x3vaHNMTMAkpr6kO2YJ4DX+kpIofzAIheZ16AQ2LqmBUgqWJ/DMtdaUB3bySDpa
         3IR33pIFDN+z53Xp8z5CIhzmy8OumatPRa1JhohRKv2RXtDf8TbAVHg2B9VgCTZqJAme
         +MW0K33r6rfUIzU9vs+9nXgh85UsBCWeiBvM3qQ4Zw2ry6I9vh4NrU9yHBFCkTwG36IA
         g1HTfDJbI4xtZeSordQ9Mq1N1UPaA+GTw+jofbBMHTY9K0kq4akhYMsghy/egfCJxZAt
         tSEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788994309; x=1789599109;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1pvaMPa6UbQ5WwIuJKDQQUXZykQOh5nAfFmGb0Yzfs8=;
        b=IBOVrckWFtMF0KmLSsBZ+sOqxbTkpiRXSM15GBQAyoBVMCQHuoGtJE4U6me9uZbRoT
         rK6oC0Nl4s/7BvmIWkzZxQuJVwpuz8ZGzS3as2RP8PUTAwC237HS2JtN/Vf4zsIik/nl
         mk2oEO5iRE56wV/RZ5yBAF/lwKwNKOLkNyNbWAZdrksObiIoDmPM01fJ2fhhTkz9drEM
         EZ/3O7vrH6WLXKVgFspW8AtyfHoAY5zv586t2X9+ssvOlioEg8rOHWhhjJqQwKnl5/GY
         44M/B5BHpO9Xi4rLyD5NcwahStuGjYSakofeybPOGbDltYCpvzxjsOF9UfOgv+T4+3I4
         m6cA==
X-Gm-Message-State: AFuF++kbJFDCwohfbjlMFOE5U8swUVt5d8kr4ykpHqkNcSsTRg+DZOvi
	Xe8DbrKSJ17rK+k09+P8Azlsk762+APiQfvFZhhtha1xMmtTqg1RPWz/B5H2Lyj60qr/3yK1WK0
	u1rty
X-Gm-Gg: AYBFou3XJ3pkRfsoe2SsXNAGaEULE8ErSrqHIRJJlKA6sTwKgk/FjF2sRQBHypEzrvn
	yqnhFvqPC5rgDcfxb9cSHoh4SaebGKinSM4v9a+E3jfekhyRvaLF4Db9VEjRcQQiuzhVAE1W/Ia
	VUF46Mz42pcrW1r9d2drIhTlt1oIHczszvOe0qHWraEfdIrqpRwp+uBXvndqrH9YpZ38YqvTfEK
	tkFOFItJhcbVK+WtZ9Jtn6AzdFqutycCbmWhcTCFvIck0WjcOOQSggFnj0QIq5+pqi81KARmaGW
	nu/A3XYQBhkAkAoR1g4ERsZzVT2yxCNNUMEi0k5dAB/WyiLEgVoUd2SadcuhGauWUwwrgrAjBId
	JqGQhPzdcnSkkrxdyDPUpdOHPoSrqmsbX30LBvGBA6XQn/LDCfJe0ct9UXhC/Jvntob2P4aZfjN
	Na1Z6YhEOSqDDzcVWrzRZ8wv8aS+bmfqTSj/Rrj8SZ5pRPWrl1WYRcfvTMJHhlpC0OByESZHK1e
	EOlHJdc/YXCkZfhZIgoWmv6Gb/1BfC1ZxKDs/Dwp4rIpwT6Wkgj3GJ5gOay
X-Received: by 2002:a05:6214:448e:b0:910:44e8:e643 with SMTP id 6a1803df08f44-91044e8ef30mr441664476d6.15.1788994308771;
        Wed, 09 Sep 2026 15:51:48 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9106412e038sm59976696d6.20.2026.09.09.15.51.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 15:51:47 -0700 (PDT)
From: Gregory Price <gourry@gourry.net>
To: linux-rtc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	alexandre.belloni@bootlin.com,
	rui.zhang@intel.com
Subject: [PATCH 0/2] rtc: cmos: Fix ACPI RTC alarm handling
Date: Wed,  9 Sep 2026 18:51:30 -0400
Message-ID: <20260909225132.1392883-1-gourry@gourry.net>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

RTC update interrupt emulation can stop delivering events when rtc-cmos
uses the ACPI RTC fixed event. On an affected system, a test that waits
for five one-second update events completed only 40 of 50 runs. The ACPI
ff_rt_clk counter stopped at 218, exactly matching the number of events
delivered to userspace, with the event status set but delivery disabled.

The ACPI SCI handler disables the fixed event after dispatching the RTC
interrupt. Because dispatch queues work that rearms the next alarm, the
handler can disable an event that the worker has already enabled. Move
the clear and disable operations before dispatch so that rearming always
wins the race.

During diagnosis, an explicit rtc_cmos.use_acpi_alarm=0 argument was also
found to be ineffective. The automatic platform selection runs after
parameter parsing and overwrites the explicit false value. Record whether
the parameter was supplied and skip automatic selection in that case.

On the affected system, ACPI mode completed 150 of 150 runs after the
ordering fix and delivered all 750 requested events. With
rtc_cmos.use_acpi_alarm=0, sysfs reported N, HPET emulation was active,
and 100 of 100 runs passed without using the ACPI RTC event.

The in-tree RTC selftest also passed all 8 tests under VNG with
rtc_cmos.use_acpi_alarm=0. VNG does not deliver ACPI RTC fixed events, so
the ACPI ordering fix was tested on hardware.

Gregory Price (2):
  rtc: cmos: Disable ACPI RTC event before handling it
  rtc: cmos: Honor explicit use_acpi_alarm parameter value

 drivers/rtc/rtc-cmos.c | 32 ++++++++++++++++++++++++++++----
 1 file changed, 28 insertions(+), 4 deletions(-)

-- 
2.53.0-Meta

