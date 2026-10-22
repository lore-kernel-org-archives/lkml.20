Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792683473;
	b=vylxgYmY5VaMArocsBAJz3Go5g4m860GYNxbxBAJTqXDqh/v/PAinV8tUR8kWDgikozb
	 Ia7Z0DoD/cJk7YC67ldbNwCmeXsLLVTaRbdiFu0b655vGix5PaCdJgMbRi1as4vvm8l6h
	 EDriQf80fG5iPlEnOGa3N7/ZVdy/lFoy5GHcUJsupxlyt9jv9JoKSLrPXZV0Fg3q/MeQY
	 iEnbIjP1Dn7qTr8p+9raGU50MOLi5uG6YVicUkWslUYj2JEWQEXeDl8HfvLE5H59fxMVq
	 J2FiSfOJbvSceo6g4zOVPOMUKUJky5mA8u4hExYvntOvRWn/upGgU6GbRu2a39Q5KYg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792683473;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=xw8Hc90SJ6hLK8A+mne32ZiLGjKs+f67UZdHxuK/A2M=;
	b=GtWQKbDcVExCuHYIg3VRFlnVRDpixTA/zlROHZrCWeeBDpsjePLbwydoeOxHSb9TD/H/
	 Kg7PpfRu8DcrWeycWi1WNJsGsQ/VtP8g+Ef+ROOxCA5FGonQlIV8g2sHsxEK7npuEq1ou
	 xenHn49hKSR1IyOp8SqwYTh3V8AvOWePEq3IFUp9UTA+EfotEKgCXNBTwv/p8MvNV8YCu
	 /xJY+KjHmcPCi9VGg6kacRKUW8gwl2miMVteqVvcYB1UCLB+3rJGtMiDtbuA2kfiZmlhF
	 aFm4bS9eps8DsNpapMYEY6B5Vdomsxqg+fj+aTHMKTR7d8D+KdGEyPZVH3yslgZlStw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LDvLQWT1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.42
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4AD6606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 15:37:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4AD6606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LDvLQWT1
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-475920b9ca2so805214fac.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:37:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792683471; cv=none;
        d=google.com; s=arc-20260327;
        b=IRYvpiMA7YSXHWONBvG1AQfjCw8bmNGr3FWz1PGQ+vA3llh1lkmnfSPTkQ7AE4YcDD
         wPolv7nwq8UBIxkjOs5VG96OWp9jMhfEj74D6ZSFLAwg6h5pV6GWRhc++Q+2jjmtS4EY
         b3VpoxqikdCE0Fpy/ZroAwuBB0h4Ui5Nw3CqcgU5OOZjdS+7KDHvrIkSgIErXBcNd3oj
         XOEXACVx6laer4gNzjkMqRklGZgANgYDg0weaM4mMhF9Nk4vC8NnAxPdhPcnx1xoccLF
         wvt4XcIs7llS086a04ge0POT5zoaXaND5tBPGyrh5QpK23YAvZxjq+aCPFXf5QiL/iC7
         Rdsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=xw8Hc90SJ6hLK8A+mne32ZiLGjKs+f67UZdHxuK/A2M=;
        fh=GALLMrPjtDjmg6R1CCEeAi+g1Cx85+B9rF2Sp4qlhqM=;
        b=IBYvBjGFU7E4gUUJ9/0nL+1sXqwRbLn+ch2z2yzHVf8Fbtd6IRRC2hxWu34iJQsyHM
         8Iz94B2MTF8CNMpoISkcU3jorJel9sB0WWMNl8bnQmjw5eXahwqospgt7v0oyCVgEHfq
         nx9HFScE9UZucywlXb5nThp76VPndsac3pRuaO7Qcb/YFQ5Fz3xjofR+v6E1iTqJ7JQ9
         XkKIVpRDjb0rXJC1MibOWDfeU3gkT6HPhwlJLLE7r8ZQch2BR8AfYpRg/UItqIBcEJU6
         i/VhblwcDGCYBzeo/vJ4bFiSpUwvwobVifjgaA54gcv7Asjk0ymTo2u12DC6F5hBmlkJ
         AhFQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792683471; x=1793288271; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xw8Hc90SJ6hLK8A+mne32ZiLGjKs+f67UZdHxuK/A2M=;
        b=LDvLQWT1W8nRQAksy7GfC2U1GVoba1MGOak09AkZe/MXGqt1yXN26MbqHVRgE/RUf1
         lJ9+jomcHN9APM8f8vjz/B84AdmUwPSTVHOxuEiLxCvvC4aNCbcRtQETfCwrP6v/+xYT
         m5hx6YmbfHXgwX5tdS8AkYPudo0yOqGu2PgFBmsxoqRg0CRDotZUr1OVhI4qeM/bhM8L
         hygYAogFLdXZGBl8yf/nHLYCNVbF6OFtuzSJceMlQYZG/fqsVceqBi250/63dgZlcoZi
         RP7Pvgo4eKQHzuWF9fWcp5R/ql3CSzi2txWoLXQR6HqZIhVwAXH0mP8D7plg8qr8w75y
         koug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792683471; x=1793288271;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xw8Hc90SJ6hLK8A+mne32ZiLGjKs+f67UZdHxuK/A2M=;
        b=RIcAvuEedwVkkuOlaTMYezI8mao6HQqCiJZEyEYzvKiK4dvddwJAoayeIdSqoPOj9b
         PPCvL9oA6s/IJUmy/yH8kLU05B4iicOXpVS68at3JkWFTE1cd4O3Lg7e9aX/a/6FJoUq
         VUtEvNp7x3k8G6pJCwC96lzVYkMPjegBIS6rT3Fn2CdJO3R4Hd7T/nU985CDRkEeQhJe
         Z2V5gBB37c0pebCMKtWNoEBtjfnKkVV4r0YgM7Oo77aa2a4nYKkUTQDk08zUGr0+VD+m
         bT3m5TP8Tt8bW+/RYu7IUMEAPHW1EIdpeojYUTTos8wEup3/1JZkoalTXNUTaf4iD0wN
         cX2w==
X-Gm-Message-State: AFq9FYLOXUL7y7rIsMQJyYCFRzvconrPWDc28mvvwDpowinBtUe0eJVE
	baoGe/9RAy4e93Drjfnr3gm1NCQUroD8kUjX+LvbfW2yVHxYHG1J2eso4utW/FM+qG4R5mKny5I
	8AmSNOB7mG+6SgwSmh/pBmsu92wjIEtZ6Y3Xt
X-Gm-Gg: AYBFou3GcNt9epfAzDBZb9QEzR9gWvFLs0PR3cGrdzSN91ROpmN4NpsGSS2b0Rjuy8v
	epVIA+XbASGffIjMVFaHS84PpVT3xIdK4YJRFMcVE74A71Xd43j3rr6ygTvcLzGAQYTVznQqTqV
	UXBhh+2ZjhhgSAl1kfSPsdtmLKyCbGJ0EqiOvIyOvpbF3fJKgtHdx0Bted7W6tLnzHenwdrRt/f
	6t2T9IaVg8NjtAa3H1gqj2t3sB+JfulMpIxOua8srTEyBdbF/jc3PBSXZUs49hCihg4Myi12qLP
	AH3pyll50knj8DCUIJkmd+6OaThf8Ao+SVwYHPx0xxbDI9rWzoPRq2Ixx/zqU7XVTAA5j+/BxgX
	Mj95vWJd+IMdkc/MBdga6rmE/xFfaAYrIrkmG
X-Received: by 2002:a05:6870:1705:b0:455:e6ea:bd8f with SMTP id
 586e51a60fabf-4a7dc221558mr3586262fac.16.1792683471524; Thu, 22 Oct 2026
 08:37:51 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Thu, 22 Oct 2026 10:37:40 -0500
X-Gm-Features: AclHuK_KO6DMzOAI40roeC_Oa2STIKdlEGirC5hdAD1SmKSOl6vW05usBpoKQCs
Message-ID: <CABb+yY2rFwmcxXvJSp9=QX5fwNSzhBvb-mz7Yu=4ddW6q_kpCQ@mail.gmail.com>
Subject: [GIT PULL] Mailbox changes for v7.4
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Linus,

The following changes since commit a90ee4305c4a5df72c11b31dacfdc76e00fcf78a=
:

  Linux 7.3-rc6 (2026-10-04 13:45:25 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/jassibrar/mailbox.git
tags/mailbox-v7.4

for you to fetch changes up to 01a40ad5a9687ea5a837857d4b21ddd764be7aa3:

  mailbox: Use named initializers for acpi_device_id (2026-10-21 18:46:54 -=
0500)

----------------------------------------------------------------
mailbox: updates for v7.4

 - altera: shut down RX polling timer on channel teardown
 - arm-mhu: timeout if receiver never comes up in mhuv2, keep combined IRQ
    enabled during suspend in mhuv3, and drop redundant unregister on probe
    failure in doorbell
 - axiado: fix RX frame draining and error handling, and fix debugfs name
    truncation warning
 - bcm74110: cap rx_svc_init_list growth to prevent PMC-induced OOM
 - hisilicon: convert Hi3660 and Hi6220 bindings to DT schema
 - mtk-cmdq: fix runtime PM leak in cmdq_mbox_flush()
 - pcc: free channel before unmapping shared memory and serialize channel
    updates with teardown
 - qcom: guard against NULL con_priv race in IPCC send_data, use dev_name()
    for IRQ names, drop stray disable_irq_wake(), read 64-bit register with
    readq() in CPUCP, drop redundant unregister on probe failure, and add
    SDM670 and IPQ9650 APCS bindings
 - rockchip: prefix register defines, simplify device variant handling, and
    convert to use dev_err_probe()
 - ti-msgmgr: add TDA54 main secure-proxy support and DT bindings, read exa=
ct
    trailing bytes for non-word-aligned messages, and do not report RX poll
    timeout as a send failure
 - misc: use designated initializers for acpi_device_id across drivers

----------------------------------------------------------------
Anup Vishwakarma (5):
      mailbox: qcom-ipcc: Remove redundant
mbox_controller_unregister() on probe failure
      mailbox: arm_mhu_db: Remove redundant
mbox_controller_unregister() on probe failure
      mailbox: qcom-ipcc: Guard against NULL con_priv in send_data()
      mailbox: qcom-ipcc: Use dev_name() as IRQ name instead of a static co=
unter
      mailbox: qcom-ipcc: remove stray disable_irq_wake() call

Beleswar Padhi (4):
      dt-bindings: mailbox: ti,secure-proxy: Add TDA54 variant compatible
      mailbox: ti-msgmgr: Add ti,tda54-main-secure-proxy support
      mailbox: ti-msgmgr: Do not report rx poll timeout as a send failure
      mailbox: ti-msgmgr: Read exact number of trailing message bytes

Breno Leitao (1):
      mailbox: pcc: Free the channel before unmapping the shared memory

Christian Loehle (1):
      mailbox: pcc: Serialize channel updates with shared memory teardown

Finley Xiao (1):
      mailbox: arm_mhuv3: Keep the combined IRQ enabled during system suspe=
nd

Florian Fainelli (1):
      mailbox: bcm74110: Cap rx_svc_init_list growth to prevent PMC-induced=
 OOM

Linkai Gong (1):
      mailbox: arm_mhuv2: time out if the receiver never comes up

Pawel Zalewski (1):
      mailbox: Use named initializers for acpi_device_id

Richard Acayan (1):
      dt-bindings: mailbox: qcom: Add SDM670 APCS compatible

Rob Herring (Arm) (2):
      dt-bindings: mailbox: Convert hisilicon,hi3660-mbox to DT schema
      dt-bindings: mailbox: Convert hisilicon,hi6220-mbox to DT schema

Runyu Xiao (1):
      mailbox: altera: shut down RX polling timer on channel teardown

Sivansh Gupta (1):
      mailbox: qcom-cpucp: read mbox hardware register using readq()

Swark Yang (2):
      mailbox: axiado: fix RX frame draining and error handling
      mailbox: axiado: fix debugfs name truncation warning

Uwe Kleine-K=C3=B6nig (3):
      mailbox: rockchip: Add a prefix for register defines
      mailbox: rockchip: Simplify device variant handling
      mailbox: rockchip: Convert to use dev_err_probe()

Varadarajan Narayanan (1):
      dt-bindings: mailbox: qcom: Add IPQ9650 APCS compatible

Wentao Liang (1):
      mailbox: mtk-cmdq: Fix runtime PM leak in cmdq_mbox_flush()

 .../bindings/mailbox/hisilicon,hi3660-mailbox.txt  |  51 ---------
 .../bindings/mailbox/hisilicon,hi3660-mbox.yaml    |  57 ++++++++++
 .../bindings/mailbox/hisilicon,hi6220-mailbox.txt  |  74 -------------
 .../bindings/mailbox/hisilicon,hi6220-mbox.yaml    |  63 +++++++++++
 .../bindings/mailbox/qcom,apcs-kpss-global.yaml    |   2 +
 .../bindings/mailbox/ti,secure-proxy.yaml          |   4 +-
 drivers/mailbox/arm_mhu_db.c                       |   4 +-
 drivers/mailbox/arm_mhuv2.c                        |   9 +-
 drivers/mailbox/arm_mhuv3.c                        |   6 +-
 drivers/mailbox/axiado-mailbox.c                   | 116 ++++++++++++++++-=
----
 drivers/mailbox/bcm74110-mailbox.c                 |  13 +++
 drivers/mailbox/mailbox-altera.c                   |   2 +-
 drivers/mailbox/mailbox-xgene-slimpro.c            |   4 +-
 drivers/mailbox/mtk-cmdq-mailbox.c                 |   7 +-
 drivers/mailbox/pcc.c                              |  11 +-
 drivers/mailbox/qcom-cpucp-mbox.c                  |   2 +-
 drivers/mailbox/qcom-ipcc.c                        |  20 ++--
 drivers/mailbox/riscv-sbi-mpxy-mbox.c              |   4 +-
 drivers/mailbox/rockchip-mailbox.c                 |  60 +++++------
 drivers/mailbox/ti-msgmgr.c                        |  65 +++++++++---
 20 files changed, 347 insertions(+), 227 deletions(-)
 delete mode 100644
Documentation/devicetree/bindings/mailbox/hisilicon,hi3660-mailbox.txt
 create mode 100644
Documentation/devicetree/bindings/mailbox/hisilicon,hi3660-mbox.yaml
 delete mode 100644
Documentation/devicetree/bindings/mailbox/hisilicon,hi6220-mailbox.txt
 create mode 100644
Documentation/devicetree/bindings/mailbox/hisilicon,hi6220-mbox.yaml
