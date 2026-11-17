Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794905286;
	b=GMt/qkLB6VtHMQd9aMtPUhVhP4J4LZ77OCCyfRA+6Vk8ZTVqOYYc9mLTSDmUV6E92ZZy
	 qpmQHMgwI28vfs9+bOH/7y6K3C/1tac1bk6USy5uvnl1HZSDg+OFUG53QjlSzRchZSSQx
	 eEAV5ygohuOeiLynB73PE7+6vgD/2HNe9ZbtQcxpJKzS9vdVdU8Xlc6EQ07P5l6oNfnqE
	 0PDCzOjRXGMqxBgYIwPvWv/5Fr0kWyb+I/i+DmOAVHg7vB2MzwoN1sRn8xYNJILVPrmA3
	 m9Hn0Z4R6B5jlOK0iER5Mg+J1WDLYQNSycYW5ni8A+JLeUd61zjTQYZs4w5jCJPSURw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794905286;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:In-Reply-To:References:User-Agent:Date:Message-ID:
	 MIME-Version:Content-Type:X-Last-TLS-Session-Version;
	bh=GMyeOCsyGmqM0NGa1D39iQ2yejMGrgEyQhAWsjlLHwA=;
	b=IRV+UL9ilRzRiIS2Ubt++eSJFmp6o3FLgMriXC+5wWSCCtdN4yhGysR37R4ymO36B0j1
	 J+7+Lb1kM1TAXD44WNKF2kw1zk4PhU+FMbQz8C31mNuFJyGS1oL/fxLefAla1lVcsVtq1
	 EUi6MSd+2g/PQRzbblfc0rUoLdsZQwJSFl4z3DU2ic1ImEEGKVU8lx5GjpRwo97/hvgAK
	 QZyXaoHAA9niNv12+PauweW3/LKF8cEPnJYKss7ivJJ8mZ08inv+QNTAeBaffOrfzMYqg
	 KLv1rfM1ykxLwYJni9LKWt2jR/3XU2/3exn/dqj6YMpzpkom7Cinsp4K1Umfy4wlwaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=lFcdQ8Pk;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08573606A89C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:48:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08573606A89C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=lFcdQ8Pk
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 33423C4EDB9;
	Tue, 17 Nov 2026 08:48:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D09645FC81;
	Tue, 17 Nov 2026 08:48:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8BF9611BC05B4;
	Tue, 17 Nov 2026 09:47:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794905280; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=GMyeOCsyGmqM0NGa1D39iQ2yejMGrgEyQhAWsjlLHwA=;
	b=lFcdQ8PkPSBaiStysmxpPVTBLxmywr0b6pErWiPibBHQekSfhmjSJJIwhTFyJiY8oF50PE
	GLICO9NWMTTTROMe1XuSuOyJ7eVqYoT1zV5V8oDEsiakvaqk6FVkwkAAVKCTVz3x4ziZuO
	o5x2K88fOqQ3uKhCum+CJRYQ3YM8h9BLeZmdj3fYgHaXYlWn434/PJkMvF0Jnv2lZcEE93
	4k5jE8Z71O7EwMNuGImTKeukmh+gBHE22CdXGe6j0QcEwkK8TSkDKNIi4NyrtgeVethg64
	af1h00oYDDPSDfVoOa17NI+39gsf2PIC88PK2v4RmVBGgoldnmuPY1/Vyz49FA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Michael Walle
 <mwalle@kernel.org>,  Takahiro Kuwano <takahiro.kuwano@infineon.com>,
  Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  Brian Norris <briannorris@chromium.org>
Subject: Re: [PATCH] mtd: spi-nor: Reschedule in spi_nor_wait_till_ready()
In-Reply-To: <534257c9-6f48-4a01-8589-330e4e4e41e1@acm.org> (Bart Van Assche's
	message of "Fri, 6 Nov 2026 13:11:08 -0800")
References: <1b755e40b80fded4b4b4c1f1c81f0d171012a1de.1793999093.git.bvanassche@acm.org>
	<534257c9-6f48-4a01-8589-330e4e4e41e1@acm.org>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Tue, 17 Nov 2026 09:47:56 +0100
Message-ID: <87pkw3oncz.fsf@bootlin.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain
X-Last-TLS-Session-Version: TLSv1.3

On 06/11/2026 at 13:11:08 -08, Bart Van Assche <bvanassche@acm.org> wrote:

> On 11/6/26 1:04 PM, Bart Van Assche wrote:
>> In spi_nor_wait_till_ready_with_timeout(), cond_resched() is only
>> called after spi_nor_ready() returns 0. If the flash is already ready on
>> the first status check, the function returns before reaching
>> cond_resched(). This happens e.g. under QEMU, where SPI NOR page
>> programs and sector erases complete synchronously during the MMIO write,
>> combined with a controller driver that polls without sleeping.
>> Consequently, multi-sector erases in spi_nor_erase() and multi-page
>> writes in spi_nor_write() may iterate over thousands of sectors or pages
>> without ever yielding the CPU on kernels built without
>> CONFIG_PREEMPTION, e.g. ARM32 kernels with CONFIG_PREEMPT_VOLUNTARY=y.
>> This triggers soft lockup and RCU stall reports.
>> Move cond_resched() to the start of the polling loop such that every
>> call reschedules if needed, even if the flash is ready on the first
>> check. Doing this in the shared wait helper instead of in the
>> spi_nor_erase() and spi_nor_write() loops covers all callers that wait
>> for a program or erase operation to complete.
>> Signed-off-by: Bart Van Assche <bvanassche@acm.org>
>> ---

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
