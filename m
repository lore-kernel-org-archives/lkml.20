Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792482223;
	b=QnY6DJLvN2PoAdoB5osBkE+obDQExT6yrJC641ZVWIvd8RrClozNCcmkSBoLS9kBQV+Y
	 VtX4Wm44oqRlWPmMhix3Brs4AUCO0jZIEw7RFrNszWp0u/H6wGvK6Kfdyf4r/D4eHK4Tb
	 6YavKwPR9OYad5Wc3Pji2RDJ+5mmYOxs57A4Hw4LxgBAfvhnhTq4DWs52Pzi3kHYJMH64
	 MYPA4MrZYvvIUyckiENziFJmW/meJfx1CGvbJyJktmWo7JujeZwGa/pgTf/XcGuB5BPOx
	 DobF5RYhGNWlRdSOxXO/j9F67+HLk5KSfr53jgeLyBrpHlLfiFHA2+XjfV/aeBWchiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792482223;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=H0Mxkp/Z9hEBYI8cFciuqQ/cxfWXIEu4UPOvnkgO9aY=;
	b=MTRT3SPyJWrjdwwPdNNLHCp5z4HaVZKlDpfpqrJdzonHLAc8UIgbZV8ufmdItEjaREXA
	 agpbWyVvKMFNgiI5przgAo3YtKv8bCcPQ5ijmngS7oCuXczxMKaZAxdWH8gG3K81TqPJU
	 +N7x3DMBWY2N8G8WTebCIXRmkv7D5aZfMtCaCTxlx+5ErHsqJ6VgQMCl06gVVu1eQDm2Y
	 zQnMvbolWL3mKWxgSJm/b2Q1C8gY5FoT6MzD2IDGO3EcF3g/yI2GpXbWEcKQWODrYp/js
	 VooDv0WEAxPJ9aRbrc0eS9ZKhgpp7psh2M5xOwJaFSkFKcm2f/KcYmpgxV+D20Fz2SQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nexthop.ai;
	spf=pass smtp.mailfrom=nexthop.ai;
	dkim=pass header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b="MWJa/1m7";
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B49D606A321
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:43:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B49D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=MWJa/1m7
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-35c76e9614aso5524295eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 00:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1792482221; x=1793087021; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=H0Mxkp/Z9hEBYI8cFciuqQ/cxfWXIEu4UPOvnkgO9aY=;
        b=MWJa/1m7kE/e7gvrgp4iznZTYqY8uQYhST2jxiR+0eimdprpmx8+/uweiHvmlBGUzX
         3Io+AUmEZUlscIZTwXrn/xdoK/DbB9qA4nRobuxZDMt2Nfaj+P+9PicFfeo8U/qBpYLy
         gnlBt9pwEfFdjfteOG1OFsILMsz1sPhi2lv9xWlHqKHtcXcTlKSw2Xy/bU+3yph119HX
         4cQlSZrjd8CfjvN9iMZL7XQjEguzjtuWP1/5kfCj8KHEYI9HuaImC8QWYpSeTiByqW+G
         0YvLP/JvcJHSfkTgqoXpifXnl1dSI2/VgoJzg6zpivmUxF7OIggdZ3uki1YfWf9OB8R5
         UArA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792482221; x=1793087021;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=H0Mxkp/Z9hEBYI8cFciuqQ/cxfWXIEu4UPOvnkgO9aY=;
        b=ZbqIQDO+TKwqSjeycop8QGQNPp+69iD5EMTVW9Uk5pifL6FR7GqmAySf7e+StaOyN3
         M15yfLHkwT0LJnN4pIyYprzC5eK3WeZgYo5E8O9kHGa9Bka9qkBT7IYkh30ta7igny8v
         UEQygYPoRVJTeWQV4lqkO7fOl9fXVQgpQCob3XtKVrlN4xDKVJ6WkxD9S3PgFQlOO/F2
         t4T+E+PO7W6oD5IIZS2MMS1mH2G6tR59/kCswcNZo/0PWsfnMVD1NKaDX9pMkgFGVxRX
         hRxv/mIuGpQqiztN3eN+kAXKg6FoourdiVcFoUNwdQ/jGWHfasSeLzAsk3/UTqE4CGuR
         TFrg==
X-Forwarded-Encrypted: i=1; AKwUvByEYCnaY49/u5Br0Fs7KOKC2ds/6v5f6BpLBB6F3mBVNjirXSZg9WjPF6UHg7PfQWc1uhvcdRjXfh/PDFw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIVn4uedRDYnM7fIH0Lrg/h8HyOkGnn2h3nGu9lvX6fII3qKH60
	+H7NM74A8v7mr4Gi+sVtxGyEYwj9vTg8IzdFZrTt1Ygnl91JRF/x27gzzZz0oC6Bdds=
X-Gm-Gg: AYBFou1JdSvW4ojtbUkPxOZDtCOCgQci83bYsVS8U95jy4X/udVLGPalJnxE1zNAeYe
	/p6QM3CFEYQEszeHK3wPG4OAVphQQYyHKWlTIh4MvwjTgpNKpAEgQtxNZP/v4q55RgYJNTBWUKx
	xNVfdDAUC5UfRM4664c2IPbGnczlvaNHxemF1LURiNYc4Gir3Pvua8RTMDsf6yoG7E6J5f6XKmk
	9WyHplrbB0ga5GGHe+75H5B3Pdxs4qsjulRvpzBeFGNa72rQ43cT+DLxOs5oZBBDalMMV7CirqA
	GHA70E6E8kgDTY/1Ikfj5Iv1kezGskvl/6J8TgFPp4Srsa/781PtDzP6Wlxtk8LuCjCycprv6vm
	L0rVRut5e4TtdXlj6q7Xn2nJePjk9zuFcNrVofsqWSwXRkfTs4t0ei3A8cnDZTuJQYBkOxoer8b
	YadzAvznsazJOuBswcBTnf12Ye7itMm3ch96mJunqgQxNcBz7MRT5FTmf336C8L/HFjLztmWZRE
	w==
X-Received: by 2002:a05:7301:380a:b0:35a:ca1e:4d82 with SMTP id 5a478bee46e88-361a1c50083mr19048371eec.20.1792482221223;
        Tue, 20 Oct 2026 00:43:41 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36083283478sm37010238eec.29.2026.10.20.00.43.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 00:43:40 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Subject: [PATCH v2 0/4] hwmon: (pmbus) Support relative VOUT mode, add TDK
 FS1412 and FS1525
Date: Tue, 20 Oct 2026 00:43:36 -0700
Message-Id: <20261020-hwmon-pmbus-fs1412-v2-0-3396c3a08251@nexthop.ai>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32Nyw6CMBBFf4XM2jGdWkVZ+R+GBY/BjgktaQExh
 H8XcO/yJOeeO0PkIBwhS2YIPEoU71bQhwQqW7gno9Qrg1b6Qkpd0b5b77BryyFiE8mQxqY25mR
 SSiu6wTrsAjcy7dFH/uM4lC+u+q20GVZi78Nnfx1p8/4ejIQKVcEpn5kNG7o7nnrru2MhkC/L8
 gXHuXAHxwAAAA==
X-Change-ID: 20261008-hwmon-pmbus-fs1412-fd4434717c19
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: Lars Petter Mostad <lars.petter.mostad@appear.net>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792482219; l=3863;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=XRV6tS8ALVtbS+kE3ADvNK+hhaVSyIBJQOm3gJhoeeQ=;
 b=HY18iFL0akcRFTuAVB2tTv/Eeg5+3LvZtvXp8nN/fAKYGVvp7yavENTtfwHJKtBUScZ0VMiMf
 zYB+s0rNp4HCwuhZeBl/Y0KoV6o4ca8PntGPXLmlaaGax1sydkWuXXc
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

The TDK FS1412 and FS1525 are 12A and 25A uPOL regulators with PMBus
telemetry. Their VOUT_MODE is read-only with bit 7 set, the PMBus 1.3
relative mode: the VOUT margin, warning and fault limits and
POWER_GOOD_ON are stored as fractions of VOUT_COMMAND. The PMBus core
takes bits [7:5] as the mode and rejects both parts.

v1 worked around this in the driver. As Guenter asked, v2 instead
carries Lars Petter Mostad's 2024 patch adding relative mode to the
PMBus core, rebased and fixed up, and the driver only adds what is
specific to these parts.

Patch 1 adds the TDK vendor prefix, patch 2 documents both parts as
trivial devices, patch 3 is the PMBus core change and patch 4 adds the
driver.

Tested on 7.2.10 on a board with four FS1412 and one FS1525:

- VOUT_MODE reads 0x98 (FS1412) and 0x96 (FS1525). Writing it is
  NACKed with STATUS_CML invalid data, and it keeps its value.
- Neither part implements PAGE; reading it sets STATUS_CML INVALID_CMD.
- The output voltage limits read as the raw fraction times VOUT_COMMAND,
  and writing them through hwmon stores the expected raw values.
- With VOUT_OV_WARN_LIMIT at 1.5 the FS1525 sets VOUT_OV_WARNING
  against its 1.094V READ_VOUT with a 0.600V VOUT_COMMAND, so it
  compares READ_VOUT against the same limit the core reports.

The regulator path of the core change is built but not exercised; the
driver registers no regulator.

Open question, also asked in the v1 thread: the FS1525 over-voltage
fault is an analog comparison at the feedback pin, so with an external
divider in2_crit is in feedback-pin volts while in2_input is the rail.
v2 keeps in2_crit and documents this; it can be hidden or scaled
instead, depending on the answer.

---
Changes in v2:
- Add relative VOUT mode to the PMBus core (Lars Petter Mostad's patch,
  rebased) instead of handling it in the driver (Guenter)
- PMBus core patch, on top of Lars' version: check VOUT_MODE for 0xff
  before testing the relative bit, use signed division and clamp the
  written value before scaling, reject a VOUT_COMMAND of 0 at probe,
  update the cached VOUT_COMMAND only after a successful write
- Driver: drop the VOUT_MODE and limit conversion code, keep the MFR_ID
  check and hiding OT_WARN_LIMIT on the FS1412
- Add the FS1525 (driver, trivial-devices, documentation); the parts
  are told apart by IC_DEVICE_ID
- trivial-devices: dropped Krzysztof's Reviewed-by, since the patch now
  also adds tdk,fs1525
- Picked up Krzysztof's Acked-by on the vendor prefix
- Link to v1: https://patch.msgid.link/20261008-hwmon-pmbus-fs1412-v1-0-0ae7e5ee4e41@nexthop.ai

---
Abdurrahman Hussain (3):
      dt-bindings: vendor-prefixes: Add TDK Corporation
      dt-bindings: trivial-devices: Add TDK FS1412 and FS1525
      hwmon: (pmbus/fs1412) Add TDK FS1412 and FS1525 driver

Lars Petter Mostad (1):
      hwmon: (pmbus_core) Support relative encoding of vout related commands

 .../devicetree/bindings/trivial-devices.yaml       |   4 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 Documentation/hwmon/fs1412.rst                     | 124 ++++++++++++++++++
 Documentation/hwmon/index.rst                      |   1 +
 MAINTAINERS                                        |   7 +
 drivers/hwmon/pmbus/Kconfig                        |   9 ++
 drivers/hwmon/pmbus/Makefile                       |   1 +
 drivers/hwmon/pmbus/fs1412.c                       | 144 +++++++++++++++++++++
 drivers/hwmon/pmbus/pmbus.c                        |   2 +-
 drivers/hwmon/pmbus/pmbus_core.c                   | 103 +++++++++++++--
 10 files changed, 383 insertions(+), 14 deletions(-)
---
base-commit: a90ee4305c4a5df72c11b31dacfdc76e00fcf78a
change-id: 20261008-hwmon-pmbus-fs1412-fd4434717c19

Best regards,
--  
Abdurrahman Hussain <abdurrahman@nexthop.ai>

