Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792533937;
	b=jt8d3m3lyvv+bSpa6lOa+5dLaEKGoaEmwZPC4NynKXBbU97QoHoFyJZtAVYJktKb34+y
	 eCzbcMlFCMuS7esjTd+xfkttBHttXklc2picSHBQvA2SxLtS5Vf9N73knWnF2vHRpm5Gr
	 Rc6npE1r5AobwM24HmjDrEEq/W02zgQcemTbQeLTzzbaNS+6+LRn6/DMRyJmSEboGMc4M
	 wwITMUCM3wJPHqxXqNYQugAvFZtJXNWICQasoYdLaKZtXZeGA3k0sZcvYG82/wBCedXhm
	 H+MUQrTFFOLRhupCAjIunh8cMna07n3oc6kR1GC6mvYsk+EtRMMRyoj2sVXnmVMXJLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792533937;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=l5c110i0kAISlo8u0iuKObA7D9yNQ5DqzFPntecO//E=;
	b=QLHaJm1ag/w2fLYnqChQ884TqziBBkumsd5Ml13nFc9p1Xjxu7MpCxujSxjhCKpYKe0j
	 7bmxSPCm5xCUrtTD1bOJ6/KvBOabctIIWQEL0lzztl3PjULc9zSVCG1Xq8b8Sq6ox1f2p
	 gziEQCC0eAC//LwCo61b7q1evrzDHeymYMB33O6nx6H2iWCM8bb4QsEPqmurp3BZL2Sgl
	 HGJN0Jusq0gVzVVjfWgh8j2etXg7TKXKrD/TcltlPfogTzveN7Lhguz2nqbMVvylchIQt
	 U6qLxQLa2rdm7D2QMFWpCKjcD3s2Adt3UXpL8LeyQcNg8F4OKVeKiJTuZ1reb9VMbsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nexthop.ai;
	spf=pass smtp.mailfrom=nexthop.ai;
	dkim=pass header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=P+hfWPaj;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 813FB606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 22:05:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 813FB606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=P+hfWPaj
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-36681e85e87so51851eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 15:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1792533936; x=1793138736; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=l5c110i0kAISlo8u0iuKObA7D9yNQ5DqzFPntecO//E=;
        b=P+hfWPaj0ZPxfve8iCN8u9BUJLrC8WLn6r4NUIbKt8Gx5HF2A5CwU5Gur33AAqzDw/
         9CZFYtoBrBsFRmerRBGkGhqyyFkMFkZy6A9A1mbCzf5SmJyoUlqg8hmeux7tOhTjbIE1
         5UZ6LPQpMxtbCjlW9fg2F5unmOt6ornkZLav9dqi6pBtnr9FsC70ur6tZu+eA/sy5BVk
         BO7xukX3rHv5oYnjCx2mqaFTvPcbVWBTnbl8iD4uUUQ+0Ka/ghVnkyYazuHkdOv4exFg
         R3BAcq7GS4vGMfnCQEiOuAdz/7aZwG5jpiWVhCvGjpNwgVeqoLRNyQZrKHcckn9ityMi
         MgjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792533936; x=1793138736;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=l5c110i0kAISlo8u0iuKObA7D9yNQ5DqzFPntecO//E=;
        b=rk5oDFW+2md49bukGAu4h4UvYTRsTrce7dJBcCLDoSxqA2BwX2j1hw0tYY8UcvgfZJ
         T5+QCMO7zisb9KS8jGn71BFF0rYFUTRTM+IW20YeB92Cp+PndVEWGtFaTcwhJS6vREiO
         VOx4XZ9VU5rS2+6Jbx5TMZFmV0Pg0v5viTDIymQ3G5o53mLYiaPkJImvk8z1UkUCCcll
         lIXhB8a5F4/Tt0bJz1Jk0MAR9t04L88xdjAObEZHfDKSd0me98xqXlQQQAvTqVPC1IS0
         ssViE+kk+dsTtJKg2U+ESvpUrlE0HAPEbqpnlJbXhxxAZhp4GasjdshLysOqqaG2L7L/
         /rsg==
X-Forwarded-Encrypted: i=1; AKwUvBzEaL6olSbGzRoDy/o9atUVCcC9EDeHh8qsQVpcDvDaBz4exh3RSMQKxj18UKGHgV6BmM10K4VSX5lxUfA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKFR8VfUETJ9A6YYMLYA5tlNcpnhp6OPBfGY2ycfepsZK79HnMK
	BPw+Ss8/d1/Dg9MWbBZ/ip7MaTT/4eXkLxlQ+kAGkop4jSAsEDr7TqxDnYO+Y10nQao=
X-Gm-Gg: AYBFou0Dz0n4GxTlFN9h9OL2wicAsW0qoE5qcxgVue4aoPvcuNmszTbWPR79uGz/TE+
	+hg5D87wPQjGQ/TvaoBBAwIDVxMZ8GbcYmOkbzEzGiw7kodccMp7efKXbSwF4fYnXYvs5bkMeji
	9lEW9QAGImhU6J7TnuPCMVRybT2LPcEjyXySEBkoOyb2cgOlYsqfiNg7O1NFQrueJGd23UbtJDM
	BzSCif3hMRB/cnj/SnnX5qqzr/xzzZKspJXKe8myQIr5ykiU2frsiEhNtKgUV/+1QLvFhyKreNF
	qv3ovQvnVoKZy3DZlAS+FE9Q19mmRN3CJxgi+VtOK4beX7MP1Z2G1j2iJjpDqe3x9MAbntx+LkO
	ROe4GmMem9IfqRd5i/aV1tPCcMvh14TYrXXRHmAXp8hlpW2mpsKiYDqpqmOF3hG3OiUHIkIssFu
	t+wTIxUI9ouoJm5uXAZHadUOfUYj0l+gYxN/7t9DlAJ7XXv3ZN0hd1dykJVWneEfL0yUhIgS5ha
	g==
X-Received: by 2002:a05:693c:829b:20b0:35c:4800:4da with SMTP id 5a478bee46e88-3674f71013bmr798597eec.41.1792533935562;
        Tue, 20 Oct 2026 15:05:35 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3674198f1d8sm1917021eec.24.2026.10.20.15.05.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 15:05:35 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Subject: [PATCH v3 0/4] hwmon: (pmbus) Support relative VOUT mode, add TDK
 FS1412 and FS1525
Date: Tue, 20 Oct 2026 15:05:28 -0700
Message-Id: <20261020-hwmon-pmbus-fs1412-v3-0-51df629e13d7@nexthop.ai>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32Nyw6CMBQFf4V0bU1fvFz5H8ZFKRdbEwppoWII/
 26LG02My0nOmVmRB2fAo1O2IgfBeDPYCPyQIaWlvQE2bWTECCsoIRXWj36weOyb2ePOU0EZ7lo
 huChpqWiN4nF00Jlll16ub/Zzcwc1JVNaaOOnwT33aqBp9zcQKCaYSCghBxAg6NnCMulhPEqDU
 iGwDwcjPx0sOjivC8UlqVj+7di27QXnDTnzCwEAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792533934; l=5458;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=Cgjr4yL6yoxtDFniz9+AjdbJjyXyIutBZSiFTyIWcYk=;
 b=xGl9KxFh//d+o4NO62M4Y4oDaLxQZUCGhPiRJwVguTHEFX3erMYQLxOQl/6+KcN2vE+iH4tZF
 uE3g7uXMvf8AlMBVOEchrh0/T610N3bc32oAyIOPM+AmLqe77N+M1eb
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

The PMBus core change was also run against the board's other PMBus
devices (ISL68225, ADM1266, XDPE1A2G5B), which bind as before and whose
regulators still register.

The driver registers no regulator, so the relative-mode regulator path
was tested in a VM instead, with i2c-stub emulating an FS1412 and a
test-only regulator: set_voltage clamps to MFR_VOUT_MIN/MAX when the
chip has them and is unbounded otherwise, list_voltage agrees, a
voltage that encodes to 0 is rejected with -EINVAL and leaves
VOUT_COMMAND and the limits intact, the limits follow a new
VOUT_COMMAND, a non-relative chip still clamps to its margins, a
VOUT_MODE of 0xff is not treated as relative, and a VOUT_COMMAND of 0
fails probe.

The FS1525 over-voltage fault is an analog comparison at the feedback
pin, so with an external divider it would read in feedback-pin volts,
below in2_input. The part cannot report the divider, so the driver does
not expose it as in2_crit on the FS1525, as discussed in the v1 thread.

---
Changes in v3:
- PMBus core: reject a regulator voltage whose VOUT_COMMAND decodes to
  0 or less, which would later be divided by (Sashiko)
- PMBus core: decode the regulator margins with the register they were
  read from, and in relative mode bound the output voltage only by
  MFR_VOUT_MIN/MAX, since VOUT_MARGIN_LOW/HIGH move with VOUT_COMMAND
  (Sashiko)
- FS1525: hide VOUT_OV_FAULT_LIMIT, so there is no in2_crit (Guenter)
- Link to v2: https://patch.msgid.link/20261020-hwmon-pmbus-fs1412-v2-0-3396c3a08251@nexthop.ai

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

To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
To: Abdurrahman Hussain <abdurrahman@nexthop.ai>
To: Jonathan Corbet <corbet@lwn.net>
To: Shuah Khan <skhan@linuxfoundation.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-hwmon@vger.kernel.org
Cc: linux-doc@vger.kernel.org

---
Abdurrahman Hussain (3):
      dt-bindings: vendor-prefixes: Add TDK Corporation
      dt-bindings: trivial-devices: Add TDK FS1412 and FS1525
      hwmon: (pmbus/fs1412) Add TDK FS1412 and FS1525 driver

Lars Petter Mostad (1):
      hwmon: (pmbus_core) Support relative encoding of vout related commands

 .../devicetree/bindings/trivial-devices.yaml       |   4 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 Documentation/hwmon/fs1412.rst                     | 124 +++++++++++++++
 Documentation/hwmon/index.rst                      |   1 +
 MAINTAINERS                                        |   7 +
 drivers/hwmon/pmbus/Kconfig                        |   9 ++
 drivers/hwmon/pmbus/Makefile                       |   1 +
 drivers/hwmon/pmbus/fs1412.c                       | 171 +++++++++++++++++++++
 drivers/hwmon/pmbus/pmbus.c                        |   2 +-
 drivers/hwmon/pmbus/pmbus_core.c                   | 121 ++++++++++++++-
 10 files changed, 433 insertions(+), 9 deletions(-)
---
base-commit: a90ee4305c4a5df72c11b31dacfdc76e00fcf78a
change-id: 20261008-hwmon-pmbus-fs1412-fd4434717c19

Best regards,
--  
Abdurrahman Hussain <abdurrahman@nexthop.ai>

