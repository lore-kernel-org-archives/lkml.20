Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792799679;
	b=UUOgRc/NVs0y6TDut/lYma4oTXQRNqvkWMbp+eWm5iMaTSHjV0bX8Ju1TNF4fL2GT57k
	 bkY7l7imqCoKqoTsEdvHNtR4vpkuxTghu4dXnBWsqCayMoHW6aFLfv/Rc9ScN02HsAIyy
	 gNitLvRXCi/gWzCW5AQSemZhSJi9+BaIdj/qjq2FctAUwBMHCuYmswALm/vx/v2KiU94u
	 gG2MCFcg6zIo7JxHKhFdBjE5D6/z+www7Y5e5YCI3fGauN2H/7MNbkFobtc2kZjQK+RUK
	 SzwDhB2oofjwXoXt7gAdFyNggVPEmPeOQE/wOB2espBaL0MMCSQdszNhrzBz/aG+bzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792799679;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=WyWU9QEly82UAo6bEoWPREDKCLnVhT5ADM2LPpXyEAo=;
	b=UWwKGmXzEoKJJUARFOt30gahKdIPot/G61VJ6NhHjiTUd6LhmBW/7DSNbnNCulkA9ga4
	 /PIzm1qUQFj7MwSnRSQFZnWFkLuRAjaRhoWIv9VeRczme9x/7wCUOnKvxfY/5i/MM8+EI
	 GOw8rmu0zNzAEQtGa2Uhn3xVa9NCU7Em2ftFTJ9P1/DdmSglTEvEyhIwVpW1FqS88zm7q
	 HB9w8DNzwCR0N6KBW0KoM2UO7S7y/dCCA/z8yor5c7iF4Ye4Uw0ZUmQ55BumYa0oM0POE
	 P8qDuxg+lAM0uBKRb/zrdCeTbbyWtM/ag+uYzCEhWK2amoiM00YUK7X0IcvSd6pz3RA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="eipMIJF/";
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 941BC606A320
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 23:54:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 941BC606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=eipMIJF/
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-33fb4680717so1622322eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 16:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792799678; x=1793404478; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WyWU9QEly82UAo6bEoWPREDKCLnVhT5ADM2LPpXyEAo=;
        b=eipMIJF/+KiVQoBZN+1mDNs4jpn5iVKTQzVaOmEwNVdkZv//EFYFN84Vr/Rp+XGnqO
         VAlB9tdAUPkCE2Z2mD67sGfMsr0V0D5DI6PwjFTZ4LZJ68ZOQ4ThjufDPggiftsXLg90
         Lb55duCnTzex3vdlmqcdestl/quKPw25iGd0g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792799678; x=1793404478;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WyWU9QEly82UAo6bEoWPREDKCLnVhT5ADM2LPpXyEAo=;
        b=Ib+qnIxALVp3xiAMY5VhLjLFDgpTLvNfJ7eOr82ut4mR/m1KyL4el1vFuHCDty+1rl
         bMpJJ611WIz1m1Rv9syCmaVuyFl3bup2cG2YQqg4dSbWIY/YTFu2yky2+XHciCL7bS6y
         u+tGQW+Btr1huYiLlIMBjHa7rC71sE5zu2/gOqf4eTsOvPpfzut1zg1OEz2MJXDdpu+X
         2/Ce8IcvZm1X6TcM+kbu+gbaefP5vlNXQu010tjed408HGlkArei6MTOBwYzLyvgf5qm
         crl7K4qlrB6VGYxxcjUbv2+nb3r9msitBzc5OmBxWMwLpZe5aBInCD6SSafdF6AsXem7
         E4Ww==
X-Forwarded-Encrypted: i=1; AKwUvByYjC9/mUE/k+9M/T68Glg5hFohbXezGBqumparUKMcLlZ4SEtDTBdLiT2O8bsdvDry/gW4nSzXidJlyfE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKu88KXy7VqQXggKFRa6MGVhASnQuNbNYseGdioCUP2ncgT3Rw7
	BAdeWq8cAPWpJV/97K4AeERxJjy111b5EABpIn9kYTes/Y93YULB1qLi600LOc2h0g==
X-Gm-Gg: AYBFou06F6e7MnYxM0av97SqiiSKfW4xWptVbPdclKj9ifGDoAwyp8MTITdBZjX/du0
	0ZNj8wjw48nwxBtUuytno+zLCeNNBw4vP3MjtCNblYyjnXeprZVOlMH3THLOT8Q5oivA4jzrvLa
	ZykmkYuPjDHP5SLjJzSsSwrYuIhvE86bgnEwTsp3PdRFCRZhQwho4ip7hWHxfYN6mDvaN0cloBX
	CC0VokAkJzGO36BM+zjySCwaIXaaIPoiDZBfmVXGZjXes9y8xaBV+79Z7s//9ueMyay0ghdO8qX
	K0LUInCOVWjCRojx0PKlMJmAW/sXfVRiRlMqrgqVJHjhDq49Z+rDQOs6xI5M7LGqRmez+4h4s/v
	BiCi48eJ9FCA8/2+zuEC4oigyHCO5KbK2hGygzMMUWDFM2d41DSr8waiOBAg/ZLgejQ+dge97oa
	w0cU3aliXqq21N4J47ssIBobol5BYWrII3djDKDiMqcE08v/uqf6kxAmGhLsaFgtKJNelvse26w
	akQKXAM3wlcaZQkCI19lIUojaUGmoNCyOz2ONEr0Ss6Rh4c+Qa7N/tZDpAl+HnQsG2/1Xa7Bodp
	1btb1z/EDudIal6e5ulLbF6KIBScDwXSrkF2ZS0I
X-Received: by 2002:a05:7301:1694:b0:366:eda6:8dae with SMTP id 5a478bee46e88-369e84b9a3amr1401168eec.18.1792799677639;
        Fri, 23 Oct 2026 16:54:37 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:f8c2:b3aa:f878:2faa])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8daf444sm1460608eec.18.2026.10.23.16.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 16:54:36 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Joonwon Kang <joonwonkang@google.com>,
	Subhash Jadavani <sjadavani@google.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Lucas Wei <lucaswei@google.com>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Brian Norris <briannorris@chromium.org>,
	Douglas Anderson <dianders@chromium.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH v2 0/4] mailbox: Improve the mbox core then introduce the goog-mba driver
Date: Fri, 23 Oct 2026 16:52:17 -0700
Message-ID: <20261023235408.3063350-1-dianders@chromium.org>
X-Mailer: git-send-email 2.56.0.257.gf7497c7d27-goog
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


The goal of this series is to land support for the goog-mba (MailBox
Array) IP block that's present in Pixel 10 phones.

As can be seen in the device-tree bindings for the goog-mba IP block,
the mailbox IP block in Pixel 10 phones is fairly sophisticated.
Notably:
* It has hardware features that support queuing, meaning that more
  than one mailbox message can be pending at a time.
* The "channels" in a given mailbox array aren't homogeneous. Each
  "channel" in the mailbox array can have a different amount of memory
  for messages. Really, the "channels" in a mailbox are considered to
  be full single-channel mailboxes and a grouping of mailboxes is
  considered a "mailbox array" (hence the IP block being named "mba")

In order to cleanly support `goog-mba`, improvements are made to the
mailbox core to allow `#mbox-cells = <0>` without a custom xlate and
to allow mailbox drivers that have more than one sub-node (`fwnode`).
For TX queue mode, as suggested in v1 review, `goog-mba` exposes each
hardware queue slot as a virtual mailbox channel rather than adding
queueing support to the mailbox core.

This is a fairly big rewrite from the downstream MBA driver shipping
on Pixel 10 phones, which jumped through some awkward hoops because of
the way it got queuing to work. It has been tested on a Pixel 10 Pro
XL (Mustang) together with work-in-progress Laguna CPM, pinctrl, PCIe,
and RTC drivers.

Link to previous versions:
v1: https://lore.kernel.org/r/20260714222338.2965707-1-dianders@chromium.org/

Changes in v2:
- Rename binding file to google,lga-mailbox-array.yaml.
- Drop generic "google,mailbox-array" fallback compatible.
- Add "google,tx-payload-words" property for queue-mode TX message size.
- Remove unused labels in DT example.
- Drop "dt-bindings: mailbox: Don't require #mbox-cells to be 1"
  (handled by deleting old mailbox.txt and updating dt-schema).
- Drop "mailbox: Simplify circular queue math with mod arithmetic" and
  "mailbox: Add support for mailbox controllers that can queue".
- Expose a mailbox channel per TX queue slot instead of adding
  `has_queue` to the mailbox core.
- For queue mode, read `google,tx-payload-words` from DT instead of
  detecting TX payload size on the first transfer.
- Match "google,lga-mailbox-array" instead of "google,mailbox-array".
- Move MAINTAINERS entries under GOOGLE TENSOR SoC SUPPORT.
- Use guard(spinlock_irqsave) and scoped_guard(spinlock).

Douglas Anderson (4):
  mailbox: Allow #mbox-cells = <0> without specifying a custom xlate
  mailbox: Find a matching mailbox by fwnode rather than device
  dt-bindings: mailbox: goog-mba: Add goog-mba mailbox bindings
  mailbox: goog-mba: Introduce the goog-mba mailbox driver

 .../mailbox/google,lga-mailbox-array.yaml     | 226 +++++++
 MAINTAINERS                                   |   3 +
 drivers/mailbox/Kconfig                       |   8 +
 drivers/mailbox/Makefile                      |   2 +
 drivers/mailbox/goog-mba-priv.h               | 130 ++++
 drivers/mailbox/goog-mba-trace.h              | 183 ++++++
 drivers/mailbox/goog-mba.c                    | 621 ++++++++++++++++++
 drivers/mailbox/mailbox.c                     |  16 +-
 include/linux/mailbox/goog-mba-message.h      |  38 ++
 include/linux/mailbox_controller.h            |   4 +
 10 files changed, 1229 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mailbox/google,lga-mailbox-array.yaml
 create mode 100644 drivers/mailbox/goog-mba-priv.h
 create mode 100644 drivers/mailbox/goog-mba-trace.h
 create mode 100644 drivers/mailbox/goog-mba.c
 create mode 100644 include/linux/mailbox/goog-mba-message.h

-- 
2.56.0.257.gf7497c7d27-goog

