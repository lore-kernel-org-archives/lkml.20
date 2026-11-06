Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793971066;
	b=nVs1Q3lCKySJHehVapi3KKJgq0NPJIRCc2c+uKixy3v2I/ZHlpWse5HDANFbrJTXK8qt
	 Ru3JrZJT0NmOzGSWOj6ZDudG0xWRjZihcb0bFpDnT+tb32qULoMgGIXL/F9VBltuwDU/p
	 AmWos5f/5K6TjnbDs1JS5+rF6Q5EtrtoiuEyzzBl5SGZ1Xi5Bp977GdEMvQpv0TuAOGR1
	 7G+a5jC/D0bZkKRntM3gBIe56BxMaIhhR7ln7jZNiTfQqbwxC3SArPjXtynszeK1xnBd2
	 RBwJ88CLV5W4PR+fvS9JN4CA29dp7upQd5FGLBIO/UCZPoYq/cI4LXlITXO5ClQ4dUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793971066;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=qTHbu26SmZE0KzIOkVAH3K1IFltQRurB0XBnFky6Png=;
	b=RbvMcIMa+iKnW1PDPRh97jJbR5k9EUAqY2X+ECTGcs1awy8b/xnswNyDIkW9yTYEZOlL
	 /TIkDISYGWEeMat2/QcC722LUO5LrKo52Xjrw/OFr/qq6SlYNn6NflAZb5nSchsoXQl7U
	 ND+TY7pWYXqVfiQiP7XvTTW7a9zcY0DCIYOsDkXFudZx7FzrE7ABUsdcOyS8EkUYwiDJa
	 9yu3GRRkRU81iHcX+X+4YZi72OllOzaSuVrGwvpQX63V0f1vX2EuuNtT6ToTGmyRtQOKo
	 o1FiXfResUDMq2idGZ1VEa8HU6YfrpU2w3cw5F2W2hXr+TBRsN4X9HD3qima4wTF3Gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jA2+1bvm;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF0F606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 13:17:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FF0F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jA2+1bvm
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3b0bbdeae06so293047a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 05:17:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793971066; x=1794575866; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qTHbu26SmZE0KzIOkVAH3K1IFltQRurB0XBnFky6Png=;
        b=jA2+1bvmeH1iA6yQhRmvZWP2gCoIeTK1eJDFDe5n9MLxbJVJ3+EX1Q4sdDAgRzP99E
         uinZGKuy9BfIV1VNzjwdSouiUqkfrDBPh8OA6MzeaqNfNBFmiUO9yGudCMBvDY2aSam8
         yckYW9t8q/ThU8K/DuTYO5/Kx8d+rk1LWrVtMANd6be336d1gq0nH64q0vekrg8YBkxS
         uT2Rk7/DrHoPrQjyUJjQ5OOFDFGnRWEyT7Dyi8NsnQNcgCWRkkjoruPH/ewxFLbP683g
         DBk2X5GEnmloQiyUuuWSMI6RVCltEkgcmnkwjHEIaG7V/9oCVWfzUSIVKEgbySuMbBJ9
         5PPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793971066; x=1794575866;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qTHbu26SmZE0KzIOkVAH3K1IFltQRurB0XBnFky6Png=;
        b=Beip61qrWhFawOQPxuYQ46WdR3sPY5QhaeobYBKUT5C7JezCsfL0kHZNpvpR+Ewi9G
         EHC9NZwCDMkLuYmstwITMQH5WM7Lq1SLsZQJwoD16nbwroIL4L+/XybX0I53ujen5zMZ
         SfB0Sjcl3HBqMMHIjsfpcT35jofHgtOOO1iTrsSCHwjXAPKRAD+jbNH3R/EiexCK7/na
         /iHQdlHEdUsU5jV3Bur+Dkm60tjgEvZWrXC92xI14TC2iMGqCB+tB1rO0xnlmyC619vk
         s2mnNJ5BjhT1GIyi0RpJ/GSl3FRoVoF1qM/MHETicaLTGfvDQKrO0GMlye/F48Pa4Gjs
         NyDg==
X-Gm-Message-State: APuU4Z/RmPtR6awF4jP+wleP3H4ahM3/W82fYUv1/ehd7EvmEyDyTT7q
	SkU8v9i2W8yCs4UCmltdqj351PT/3SNz72RaI+2WL1/YgvZFCemkRxkm
X-Gm-Gg: AYBFou155XRuYdsEowih2J1ccpZak1GOn5GiKf/UZK3SSxMck5ruiM/QjkCThXSs5HF
	zD1hZFKB0BZY905txIh7NN6M2xo8iKPivZcDG9XIPv617GSXBoQS8s9j9YQW5eXwStQS/GuDWyC
	eU13qCAqk6k+6arQySSHg+MRt2j+i/czrUnUlhxlz3AblbRMC3wNQHS1tg4DeZTwk2vz1OSfhLb
	9Uv0HiAzPqD8eF+EoeL57M77J8Y+NUntL/WwU8jlbo+PJH8wFVzjuGVVClTINxYvYG6+B2PzmBg
	KzdCIlYM9/EtjweKYHHXYWx3GJH/7ns5oxFxnA+jmrmTbpFhlKUiQt01PVzI33mf9wqfKiwbspT
	bMnRnlMZ3FoIDnxP8p+fddmlS7gQo2OCSVFWk3RsqaNyHEjSxR7kaV2Lxs7B2/AX8+HtoCR5MIV
	PmueBR5yjKcDGEIcA2TQcEpfoQH9rUrreT6daOpx2mYI7KoCskEKNiBQ+bssFLrH5aohwQmw2lV
	5cicDYmiT/rdRnku/lQfqLw553CctQMXNAoQzuD/ZYmXITC+UMkKHgdzdKuGtIewjNhzrAR5w7m
	OASwHuCPvhez1xRWVrr56M7CBuVI/JH9SWeWnDWY5qSdiYPv
X-Received: by 2002:a17:90b:5403:b0:3ac:9463:83e6 with SMTP id 98e67ed59e1d1-3b0db6d710fmr2233907a91.10.1793971065545;
        Fri, 06 Nov 2026 05:17:45 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0e2a8d6fbsm1025636a91.1.2026.11.06.05.17.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 05:17:44 -0800 (PST)
From: hyunjungg <hj351016@gmail.com>
To: MyungJoo Ham <myungjoo.ham@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>
Cc: linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-samsung-soc@vger.kernel.org,
	Hans de Goede <hansg@kernel.org>,
	Hyunjung Ko <hj351016@gmail.com>
Subject: [PATCH 0/5] extcon: fix work-vs-devres teardown use-after-free in MUIC/connector drivers
Date: Fri,  6 Nov 2026 22:17:25 +0900
Message-ID: <20261106131730.2633139-1-hj351016@gmail.com>
X-Mailer: git-send-email 2.43.0
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

From: Hyunjung Ko <hj351016@gmail.com>

Five extcon drivers register a detect/IRQ work for device-managed
cancellation (devm_work_autocancel() / devm_delayed_work_autocancel())
in their probe function *before* they acquire the resources that the
work handler dereferences -- most importantly the extcon device from
devm_extcon_dev_allocate() / devm_extcon_dev_register(), and for
intel-int3496 also several GPIO descriptors.

devres unwinds in reverse registration order, so on unbind the extcon
device (and the GPIOs) are released first and the work is cancelled
last:

	/* free_irq() */
	devm_extcon_dev_unregister() / extcon freed
	...
	cancel_[delayed_]work_sync(&work);	/* too late */

The work is armed from the IRQ handler (schedule_work() in the MUIC
drivers; queue_delayed_work()/mod_delayed_work() in palmas/int3496), so
an instance can still be pending or running at unbind. When it runs in
the window after the extcon device has been freed but before the work is
cancelled, the handler dereferences freed memory via
extcon_set_state_sync() -> use-after-free. The MUIC drivers' early
"if (!info->edev) return;" guard does not help: info is itself devm
memory freed last, so info->edev is a dangling, non-NULL pointer in that
window rather than NULL.

Each patch fixes one driver by moving the devm work-cancel registration
to *after* the extcon device (and, for int3496, the GPIOs) are acquired
and registered, and still *before* the IRQ that arms the work. Teardown
then runs in the correct order: free IRQ -> drain/cancel work -> free
extcon device. The relocated devm_[delayed_]work_autocancel() still
performs the INIT before the work's first queuing site (the IRQ handler,
requested afterwards), so no queue-before-INIT window is introduced. No
functional change otherwise.

Found by static analysis / code review. None of the five is reproduced
on hardware: each needs its MUIC/PMIC/USB-ID-mux chip and is not
QEMU-reproducible. Treat accordingly.

Hyunjung Ko (5):
  extcon: intel-int3496: drain ID work before its GPIOs and extcon device are freed
  extcon: palmas: drain ID-detect work before the extcon device is freed
  extcon: max8997: drain MUIC IRQ work before extcon device is freed
  extcon: max14577: drain MUIC IRQ work before extcon device is freed
  extcon: max77693: drain MUIC IRQ work before extcon device is freed

 drivers/extcon/extcon-intel-int3496.c |  7 ++++---
 drivers/extcon/extcon-palmas.c        | 12 ++++++------
 drivers/extcon/extcon-max8997.c       | 26 +++++++++++++-------------
 drivers/extcon/extcon-max14577.c      | 28 ++++++++++++++--------------
 drivers/extcon/extcon-max77693.c      | 28 ++++++++++++++--------------
 5 files changed, 51 insertions(+), 50 deletions(-)

--
2.43.0

