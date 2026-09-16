Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39CC74C1505
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 14:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789568580; cv=none; b=m0jTxOBfT41DX1kYJmh1Oez9g1DPFfg+voM3W+qRIrWTekmrGC/kBUoudDVrtgEPwSwZrSexwUN6xmSWbYS2+M6b1SR4NV7VPpoXoHcbCIAlIUiQRi2y0x6kous729rgaylC+w57YUFZY5lTVatG30kM1RP86c4JDbV1Yps9fBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789568580; c=relaxed/simple;
	bh=43UrhAuDyRCxIW7zNvxEWB9htMmCXLzuxgZNm08DRto=;
	h=From:To:Cc:Subject:Date:Message-Id; b=lrHiNM3IIJrQXbS/hDY3BeZj54l6jchUgd4nag0eYI7kIRraOBvE1UGxIfGqH8js3FnNf7dQysLoEzTERFOxCgkCo5utCoGsyUOXpbxp5vJiRxLMug7eBy1dLga5vqhdtQqD569wznBDnKuHdotz9v7xVm6bppvI5EgGSm0Urmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q1Z2m11H; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q1Z2m11H"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-868cfc5c244so631128b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 07:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789568578; x=1790173378; darn=vger.kernel.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BWvWZC1A4EEg5WDZjdEechEjI5LuFB/6BDLI2Ygdh/I=;
        b=q1Z2m11HO9QkjOyRQtTtu5Cww1Sdy5WzCcfztdw20BU+iuVYXYwBSgEtZ1cVdXjRgY
         WCtE9YvVI0sfqGsoa2nNRbvBeksGjbbTi2NnZEIXbhpMQ1j8A/S3zziQ/EdJv/h6bp9E
         c70PrvJ6kxqZYuKCejNQaD6UxQ04ifiCJEJKlbMKTNevkwKNJr82rn5BwC/xQLqElvOc
         8DsEkDfL3ZvChth+7MjRUpf7oMtoyvusIpTdCN+MnljNaipzQFiB2qijJX51Inx6rJMn
         lPisIT9/I1Dr6DCfm9sBkvh6qPH/lIjBz8NUR2+4ULwNvjMobiZHiwcm8mY13HGWxXYD
         +k9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789568578; x=1790173378;
        h=message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BWvWZC1A4EEg5WDZjdEechEjI5LuFB/6BDLI2Ygdh/I=;
        b=1fYllZRHpPTYRPWujq46rmQnOKazjIaLkf6Ij312lxxBpX+KBeCUMmVXLGRXmVzpvD
         fC7gW1wn1Z2zAySTkj/IV1BE9heQd+joT/6sj9yV76CBHmRdqdJfzVCdZqFrOxJ2AHeQ
         SsElllReXfWgojZBkKQxj7OX5fzmPYGH5sMdQHF018n58k+HKXfp/Q2az7y/LCl8m1bv
         TMSMjsMYZMbny8NnH7CG0REe2uIuoxqMma8Tjm1QSU+S7tRI7qGYfEuU4qYcutCzDIVB
         QYsH9WtvOk9cQkaGI79Z6VIiShollDZwvCxSgLTEqSp4ih2WIZidY6Jv2oMUTUXfeqwJ
         aVAQ==
X-Forwarded-Encrypted: i=1; AKwUvBzqTC4cVibVpArAtCzQ8caIliMUkCwn58XcnxfxOPCnSGr/dvGSzWLZQ9QZiXk2knFaKwjge/URKCGJROA=@vger.kernel.org
X-Gm-Message-State: AFuF++mJo86VLsb7vuQ+q7Uz/8U5yKbSZu6EyZTLPzRnvRPP/Yu+G9/D
	bMyM0dIqlXnls5duCAimTBJ2wnuRXdDpLM3DUvPwWES3gnsOq6/3xP3C
X-Gm-Gg: AYBFou0h022ec7JYbXF1L5v1aJmXbuh4nTKR0LmSyvX2gxGQzT7tEINCax7g5AtLgGL
	5ImuKaLIPQcu6xOQEyjMw9zolWe2zV1Glk1B4F+a7DgURFdjIy6iMyqTvgYbjxVYpsJ/B1oaaA6
	JBsiuzGQGvUqdZ8mb+LqIik5VmG+ucBLfdT5+Vg4feQ1UbIp4fBrj6rlJ/74GLu3/YOAkpxaWw+
	ExQ+BI60//nDRnFp2AjD0hzKhMoMuHPe7eu88wz+flbp7yPKNIDINLN4nABD/0GFchEqj7JXUA9
	kg/dOd1FL7vOnfPu8Cw/3y7qb/WsV1ya06Ul78ho6rVnhaPpCBzED5NwSq6gwEjqFNzzuEDQEyY
	4tHJDuLM+pQCCo393Xc3jQK/yW2hSUoBW7xZYdzojkKRYemksEF5xwLMq4Hyc1alF5+zrtRsI2R
	Lb71RV3JO0vvGYpIG7TUCx2rpuNg6pXRVinXrIBSfMbCudk7xxM5YJSrwLonoCDxf2ILjuHw==
X-Received: by 2002:a05:6a00:408a:b0:84e:2382:f4f0 with SMTP id d2e1a72fcca58-872363f656dmr6488422b3a.4.1789568578140;
        Wed, 16 Sep 2026 07:22:58 -0700 (PDT)
Received: from [127.0.1.1] ([240e:b8f:977f:f400:ec2a:b15e:fef8:70a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87201d179aesm1390884b3a.50.2026.09.16.07.22.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 07:22:57 -0700 (PDT)
From: Liang Haowen <nbg2974@gmail.com>
To: linux-leds@vger.kernel.org
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
 Martin K. Petersen <mkp@kernel.org>, linux-scsi@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 Denis Benato <denis.benato@linux.dev>, Armin Wolf <W_Armin@gmx.de>,
 Hans de Goede <hansg@kernel.org>,
 Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH RFC v6 0/1] leds: asus-aura-scsi: Add ASUS Aura RGB LED driver
 for ROG NVMe enclosures
Date: Wed, 16 Sep 2026 14:22:49 -0000
Message-Id: <202609162200.RFCv6-0.lhw@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Hello,

v6, as its own thread, addressing the fifth sashiko round (one naming
Low taken as a fix, the other two Low are the same false positives).

Changes since v5:

- LED names use the empty color section from the naming scheme now:
  asus-arion-0-0-0-0::led-0 through led-3, instead of the single
  separator v5 used. The color section is empty because these are
  multicolor LEDs whose palette is enumerated via multi_intensity,
  and the four identical zones take the function name with a "-N"
  ordinal, matching the examples in Documentation/leds/leds-class.rst
  ("phy3::wlan", ":kbd_backlight"). The sdev's H:C:T:L is still
  flattened to dashes to keep the name unambiguous.

The two remaining Low items are the same false positives as in all
previous rounds:

- kzalloc_obj() exists in include/linux/slab.h since v7.0 (Kees
  Cook's overflow-refactor series); this driver builds against 7.2.

- blk_rq_map_kern() takes four arguments on current kernels
  (rq, buf, len, gfp); drivers/scsi/scsi_lib.c calls it exactly this
  way from scsi_execute_cmd(). The five-argument form with the
  request_queue first parameter is from older trees.

v6 was re-verified on hardware: the four LEDs appear under the new
names, per-LED colours, sequential and concurrent updates, and
unplug under load are clean.

Everything else is unchanged: the hardware description, the
scsi_device_handler that does not claim the sdev, the multicolor LED
interface, the protocol handling and the known caveats (manual attach
until a notifier lands; SAVE on every update writes the enclosure
flash, wear uncharacterized; NULL-parent LED registration to avoid
the sdev reference cycle).

The open question from v3 through v5 stands: the driver is
deliberately not wired into Kconfig/Makefile/MAINTAINERS yet, because
the agreed direction with the SCSI side is a split into a SCSI
transport helper and a shared ASUS Aura LED interface, and the wiring
would follow that shape. Is deferring the wiring to that split
acceptable for an RFC, or would you rather have the driver buildable
in-tree from this series already?

One more question on the naming: "led" is not a LED_FUNCTION_*
value. The four zones are identical decorative RGB segments with no
distinct function each, so I did not find a fitting predefined
function. The closest in-tree pattern is LED_FUNCTION_PLAYER1..5,
separate defines for identical things that only differ in number.
Would you prefer a new LED_FUNCTION_* entry for this, or is a plain
ordinal function fine for an RFC?

Comments on the interface shape and on folding this into the shared
Aura work with Denis remain very welcome.

Signed-off-by: Liang Haowen <nbg2974@gmail.com>
