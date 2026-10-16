Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9373459ACB
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792141049; cv=none; b=sJsTYr1UvoV9TE2DK9ALmUrIt5s/NOgkNkCnR0vxgoeUF+LZ3Up493ZUqTmiSKdG8vhzUE6iqtJFl7Imn9d6lRyYHYHdGIf+4NGf4Qo55PMQVvlyHojhgUrbVGh5RT4K981DLEIQTrN/Dbvxbkrx6daqSwyawIwd6dtxJJbBeLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792141049; c=relaxed/simple;
	bh=voVWteIAMcvsWoD6mSPSofIc9qX+e1A01al1D32H/J0=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=S8wAu1dnuIZQwrWJmIJCrbuG7VpanFsGaxM87BN1s+AgeCwr0bApjbCYyKPNAKcnbN98vjjzvn50AftQBHIqZqu5IKkrYCLByi+cbDMB1XUF3hZOB+jrgjieVnYIVw/7JhtHB2kAQKcpE7B3RF8T8b5tzqo+KVgOJAlyxminlCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bzUbN9Wa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bzUbN9Wa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65CE41F000CA
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792141047;
	bh=3Rbs8zVcRHXRrELHto1MGOKdswB/81BGLddudHF8cN4=;
	h=From:Date:Subject:To:Cc;
	b=bzUbN9WaULpsj5q2WiIFX0YbeSEtxF76GBymNckoMfC38CODR3KOg5Aag8a6UYL7j
	 5Oo+TopBEQFe86wuqp3/vSSWv7p/URmxkh/5aebAF+dlZBAs80ADKx9LG9oAXRLgNo
	 8qRqrN7S15oqovOSZEB4QmU4pIYa/wVAQ/GprfYZPUFWRyV//vB4TFfpcJLQ1bgmfb
	 R9UOpJtmTn2bUoUx9E+K6ZaO2VWEpeQG8OfYChLmL8NQkMJZsb32b0hbzEBRvHhzLQ
	 745RymeD52E0hPBbLEZRUYduzb7rvnJfRoSxIP0q7cGhPSVbsBDYhkO8P2A7rYbE8z
	 jlaqLUgK7zQVg==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5be42ae8eadso835985e87.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 01:57:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxheBABWq/0FeAq4LQVjFAUsjY20HVin8CxPcUtH6tAGT3fkWE9ynI8lINrYIhUweGU22es6bDu34PRNjI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJexle+q1osB1KRQ1LiNM+I3FuWyWzbjYludUgcARXl9cE1Z+lR
	PV+sUuOkZoixwiOdvCP1U0wy1bi+qlbXLSYA5r6+lFVSCVnNzs1guofGEOjdr1RbKDRTJSXyc5u
	UtY0GItWZlJOzn00c9FoB6luqyN6aLlk=
X-Received: by 2002:a05:6512:3b83:b0:5be:428e:2be7 with SMTP id
 2adb3069b0e04-5be428e2c87mr1589216e87.11.1792141046106; Fri, 16 Oct 2026
 01:57:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 16 Oct 2026 10:57:13 +0200
X-Gmail-Original-Message-ID: <CAD++jL=ZDuXfj8GCCapkF3vxo55pzuEcU_98GkbALDpCcRdGSQ@mail.gmail.com>
X-Gm-Features: AclHuK-Lp0xhea3l8g1Ub5v6bM83ymjT8wfav2HZ4-MRr0Df3GxU50r4xPVAH6U
Message-ID: <CAD++jL=ZDuXfj8GCCapkF3vxo55pzuEcU_98GkbALDpCcRdGSQ@mail.gmail.com>
Subject: [GIT PULL] pin control fixes for v7.3
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux pin control <linux-gpio@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Linus,

some late fixes for the v7.3 kernel.

This should have been sent earlier but I have too much to do.

The AMD fix is really important for users of AMD equipment I think,
the Qualcomm fixes are many because they have a large team and
support many differentiated SoCs.

Please pull it in!

Yours,
Linus Walleij


The following changes since commit 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e:

  Linux 7.3-rc5 (2026-09-27 13:55:01 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v7.3-3

for you to fetch changes up to c5895eadf287116434b7b01d67b92e8146f7ff61:

  pinctrl: sunxi: dt: do not accumulate npins across probe attempts
(2026-10-12 11:30:12 +0200)

----------------------------------------------------------------
Pin control fixes for v7.3:

- AMD: Clear S4 wake bits when firmware has _AEI, this is
  important for some AMD systems.

- Do not accumulate sunxi npins across probe() attempts with
  deferred probe. (desc->npins just went ++ and ++...)

- Qualcomm patch galore: split QUP functions on the Nord pin
  controller, fix an OF module alias on IPQ5210 so the module
  modprobes, fix two groups on the IPQ5018, make direction
  changes exclusive on the SPMI-GPIO, and fix the interrupt
  target width on four different SoCs.

----------------------------------------------------------------
Adriel Santos (1):
      pinctrl: qcom: ipq5018: replace gcc_plltest with pwm2 on gpio12

Bartosz Golaszewski (1):
      Merge tag 'v7.3-rc5' of
git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux into
pinctrl-qcom/for-current

George Moussalem (1):
      pinctrl: qcom: ipq5018: update PWM groups and corresponding pin functions

Gilberto Conde (1):
      pinctrl: qcom: ipq5018: add missing pwm3 function on gpio13

Konrad Dybcio (3):
      pinctrl: qcom: hawi: Fix intr_target_width
      pinctrl: qcom: maili: Fix intr_target_width
      pinctrl: qcom: qcs8300: Fix intr_target_width

Linus Walleij (1):
      Merge tag 'pinctrl-qcom-fixes-for-v7.3-rc7' of
git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux into fixes

Mario Limonciello (1):
      pinctrl: amd: Clear S4 wake bits when firmware has _AEI

Pablo Mazzini (1):
      pinctrl: sunxi: dt: do not accumulate npins across probe attempts

Shawn Guo (2):
      pinctrl: qcom: nord: Split QUP1 SE2/SE3 into lane-pair functions
      pinctrl: qcom: spmi-gpio: make direction changes exclusive

Zhangfei Gao (1):
      pinctrl: qcom: nord: fix GPIO interrupt target width

hpp.iscas (1):
      pinctrl: qcom: ipq5210: Publish the OF module alias

 drivers/pinctrl/pinctrl-amd.c            |  9 ++++++++
 drivers/pinctrl/qcom/pinctrl-hawi.c      |  1 +
 drivers/pinctrl/qcom/pinctrl-ipq5018.c   | 20 ++++++++---------
 drivers/pinctrl/qcom/pinctrl-maili.c     |  1 +
 drivers/pinctrl/qcom/pinctrl-nord.c      |  1 +
 drivers/pinctrl/qcom/pinctrl-qcs8300.c   |  1 +
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 37 +++++++++++++++++++++++++-------
 drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c |  1 +
 8 files changed, 53 insertions(+), 18 deletions(-)
