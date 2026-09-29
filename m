Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEEF74FE2C3
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 16:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790698356; cv=none; b=XRk2D+U0B6K/Gw1sVqKcJEUkFp/LmzOi+Zn6I071jpQmlOIvM54IEpsC44uruhYHGTr2v9z8ht6sPs//2mYKTmHB4Ry5JbUtU0dwssGHU/xKDTMBIXx8QID71VnRDaf9RymGM0NTbOB5BmhPILxLzV4/Wt3pw4J+X5zX7rAyVsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790698356; c=relaxed/simple;
	bh=0LOLrF1o0H9W9E6lsAQJ0sYu2ieVD2z9H4HDPExvv78=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V0zqvHSEHhwcnfOrNMo6oNfC20SuL/jchA4fcOK5fin9brJKB/2ZYjzwckSN1sLRi8SJpCzN64plrhFRixXHQ2/IuZZ+AntxFJ4iMcDoI0A3GyNEFk4Le5LLUIagL/+uC0YNYOGC45V8aazDOhydSNE16F4PjDYbbieZaW9dPGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FfcvS/Ll; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FfcvS/Ll"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc4cacd3409so2571379a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 09:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790698354; x=1791303154; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SRgYI8NB5ZWXSObwPxIXtQXSAtJDMAfETTCC86XuwMA=;
        b=FfcvS/LlOZGRP8i1Uz3J8NQeK27rRNokW10EtT3NyS9/zoJq6VgJAgy7f+9Buf89S7
         oTOgiJmLu9aI5OY857h2ji3eZncrCBsURBC/RQrKdwgTfYGr/KR1ke6yZ/ixdMv+EPEw
         +wwPoOLd2gM/kqKAA+vLzQYBCnkCok8sU68Jub0eCyHY8g9Q92AnTwv48Ij7fpe3HTj1
         ipyUM8X+LRG3to48HeqdfUDg0oITIO6cFxRTUjbxJZkQC36vdyXaXFBkqriPnzyeqqor
         9SvPFRv5BNCHrpQfcjQe4600e8HakF8i+WeoYO+eRgvcZoJyVVfCoq201IJTfE3aKbZI
         ZiCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790698354; x=1791303154;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SRgYI8NB5ZWXSObwPxIXtQXSAtJDMAfETTCC86XuwMA=;
        b=1Q8UvK/ql4HCjMQM8cOuDvf0gqdP5oRp/1DyYf+BIIyUTr6rjsYDFeRBa8Zsc0iTgQ
         gBfH1feai888y7CRv0w3sv21ZhmQlzn4wvb2+EWu7+yj7f0kyvxUZQqsw1cEJF6v8ess
         Aw1iLpi7KFiGGgT8xolGlyCxuRIqAMIJ08kFIr2ACHSxAV2mzGOQ5+qvR6HcEQN1MQwh
         rYLn5e0NZNxkCTafoFaa7HllD4Mb7qEhRu2rVsDoqAyDojJMwR9VPTSJvyn9cUJNjFPX
         yJ3FY8NoTqkiwx/XQJS1q2mPQJfvhMWCpAGbh9PnuQZSZLjK2ylj/EIA30+6zYv895W9
         vzvg==
X-Forwarded-Encrypted: i=1; AKwUvBwxkd2vEfm9NCYeoByNGhQroa66Qkm8kCgbLnS+AqDN13RENQCih3uHHIYf49vpiDATURIo3puP8GG2BCM=@vger.kernel.org
X-Gm-Message-State: AFq9FYL4gFi8Wds8QWFXTI7pzdaI3zeLud01XJN0Wp51/QK7Hem5fDyg
	8KOem0szIrzO2NHPxL7SDzfFQkI+5HOzXkO17R8dblDkfIBFNMr0syBe
X-Gm-Gg: AYBFou35gh4c8voEO1bsO0IlVcsTjdaJLlTc6BQBj9584A/t8PaEsStUIRSArJDmsXi
	v0qZrENNRbkZOLg/zjMVmC0UCCTFC/6X/vlivUkkC/4ix3TyhX5hXfol+jUFM54O//RjhfB4fGF
	zqte/xRyC/9pOMjLM3pDruHeaswZC0pki8F/Kmn/+rEf/DVBKuyF9g6X7zKJV92O61DQRRhn4rY
	38dHcXeT4e7SGGFz6JrNfkdJrtg1181l+7lTIS/hXOJM2zRh4ioAZG8TTVTVZOsiPRMqDu3hTLn
	2bBizJCZZTRDRlE4XNigwPCxlYKJ4jGYdlySDMvGv1bvTg5piR5wb4QKgKFmdjNxkzXbwYB/blk
	Hb1ot7o21iQDut74NXNa9w4t+YbV6jun9BaJMGhFK42XTWvWxMqjaMYkD13Xx15CNNMGfQEOuGR
	BltYaUcTcYxP/SLcbcQz7ObtikFVaMJO7mv4SxeX0OlPkz1YLYz+PQaIisMvgD0Ub5/HfySg==
X-Received: by 2002:a17:902:e741:b0:2e2:dc0c:1615 with SMTP id d9443c01a7336-2e2dc0c1643mr65525ad.31.1790698353862;
        Tue, 29 Sep 2026 09:12:33 -0700 (PDT)
Received: from thangnn-ASUS.. ([2a09:bac1:7a80:50::246:e4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e2d8cf1457sm4227315ad.15.2026.09.29.09.12.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 09:12:33 -0700 (PDT)
From: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Cc: Ulf Hansson <ulfh@kernel.org>,
	Maxim Levitsky <maximlevitsky@gmail.com>,
	Alex Dubov <oakad@yahoo.com>,
	Raj Ojha <rajojha047@gmail.com>,
	linux-mmc@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+3ee5da0319ca17ef1f4e@syzkaller.appspotmail.com
Subject: Re: [PATCH] memstick: core: reclaim the request before freeing a timed-out card
Date: Tue, 29 Sep 2026 23:12:28 +0700
Message-ID: <20260929161228.128616-1-ngocthang2710.1999@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAPx+jO9iva6YnKba8aEuOHURiZKjh2+wvhfC97bZ22UjGsXgNw@mail.gmail.com>
References: <20260919100408.113979-1-ngocthang2710.1999@gmail.com> <CAPx+jO-JBBLNCUrnB0UaMSPu7ajwsrEQMPJ1SfH2PccCR5VnCA@mail.gmail.com> <CAPx+jO9iva6YnKba8aEuOHURiZKjh2+wvhfC97bZ22UjGsXgNw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, Sep 29, 2026 at 12:57 PM Ulf Hansson wrote:
> Reviewing another patch [1] for the same issue, indicates the memstick
> host drivers are already managing the timeout themselves. So, even if
> your approach seems reasonable, I decided to go with the other
> solution for now.

Fine with me. Raj's patch fixes the UAF in my reproducer as well.

One concern: it is effectively a revert of b65e630a55a4 ("memstick: Add
timeout to prevent indefinite waiting"), which was the backstop for the
rtsx_usb_ms remove race that 99d7ab8db9d8 ("memstick: Fix deadlock by
moving removing flag earlier") only narrowed.

memstick_check() can still pass the host->removing check just before
rtsx_usb_ms_drv_remove() sets eject/removing. Its next request then
reaches rtsx_usb_ms_request(), which drops it because eject is set, so
nobody completes mrq_complete. With an unbounded wait, memstick_check()
never returns and memstick_remove_host() blocks in flush_workqueue()
forever. (cancel_work_sync() in drv_remove cancelling a queued
handle_req before it picks up the request looks like another way to
get there.)

I reproduced it in QEMU with dummy_hcd + raw-gadget emulating an
RTS5129, widening the window with a debug msleep() right after the
host->removing check and unplugging the device during it:

  INFO: task kworker/u10:3:65 blocked for more than 20 seconds.
  Workqueue: kmemstick memstick_check
   __wait_for_common
   memstick_check

  INFO: task kworker/1:1:33 blocked for more than 20 seconds.
  Workqueue: usb_hub_wq hub_event
   __flush_workqueue
   memstick_remove_host
   rtsx_usb_ms_drv_remove
   platform_remove
   ...
   rtsx_usb_disconnect
   usb_disconnect
   hub_event

The same test on mainline (500 ms timeout) recovers fine.

Since memstick hosts are expected to always complete a request, I think
the right follow-up is in rtsx_usb_ms: complete requests with an error
after eject instead of dropping them. I can send that as a separate
rtsx_usb_ms patch on top of Raj's, if that works for you.

Thanks,
Thang
