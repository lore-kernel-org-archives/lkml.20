Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7017830C152
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 00:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791507371; cv=none; b=XRVF+lcKPZ9YObZsVuf00aMSnmbAnUNE2D47aAAI3HOQoKcOchOIZdL1u75mLdWjxEv7ZkAUlSOpVxZ+Wql4qxF1aRq3BF15cQBlHBwcUoBee5r4zwU9kNmF3W1CyptgV8je+GgwV/qnws9JNjvf+/EWykYRh+Gpne7eYg8Ebu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791507371; c=relaxed/simple;
	bh=TCmpqhsXFZvHB2hYI7sHMF1aP5fPfOZ0+46+VuzusmM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=MR+PUlzTzwCf8/jMy5ubfqaNvos2JIofLp5E6VRvWXoBkdpFkXEw+iBB/9cDEANqHPca0+6ouw7nFZUswg/2AQEx9DYWM/WWL6CSOmMsCBgzIHWuCH2EUYafEW2QpFGh1JBl8eD7KRatiGqFlpelcI5NaulRWTFLKvph7bsK32g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=hdYwHpPr; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="hdYwHpPr"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-353804b591eso122628eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 17:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1791507366; x=1792112166; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HtES7fePFnMezxtZEKW2N4T9F4gvLmApUzPD0F+adIk=;
        b=hdYwHpPrRODKcbXfgxO0VfjbViLi/+rEroIl5DNoHuDWcXkwmEwB2Jhy8Gk8Gw/TfU
         Vr5bNJT+FPAmTIDnNWlNU8ps/jvBWlt7Y5/SEp9S0FwpUtv3LhP3OKbPNpWhGyKQHzJE
         bVmNsaQ5z7HvnpYRjOBDwlxgMRAa+ibQt20vSV0rwi9gFya59F9eXL1MZBt2fwvzR/EL
         5qgMYbhQrJqdy/rgWNZYxQkTwoSW6xMQUSpFZBRq0srw8z/a2s+BcwbOx3AhaxTBG+03
         DojB/7vekxsMb7Vh41kmT1dXF+myHMF30P08UASCVkDy6TM5BHYI6IzFzfLpXlRqYyY+
         ihAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791507366; x=1792112166;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HtES7fePFnMezxtZEKW2N4T9F4gvLmApUzPD0F+adIk=;
        b=ayBXqcW36LUjDtV3/y8rNhFHan0TBe2jhCtZwobpzmsFaDzbROp/aNa2LSInFDYQZb
         gnUgqXINQg0VZuyZekQPs0buab76tDiBvJH8tv7sbWWzfw/5vFEAvQj/46aZqN1m6pZQ
         j6li/O2XGF78dQRkozKatvmr+fmUrtPvQ/nyB0m06NbLL4K8sBVl4aLB/c411elFvll9
         kIi7ZH8zeo7DAMCd2vHq9l1YIUr3e9RRqrGtFpqxKOeg8+b2/TuivobrslaZeN0RuFlT
         8KjD6o81oAwaoIQA84oCPUENZNjOpUALzsEa32HvEYtUTnow4zSJQvqv/Kdrj9UqYcDd
         +SPw==
X-Forwarded-Encrypted: i=1; AKwUvBx5JY9rhS280ZnbquOBA0uhQTVr9k6VbLzUtpy6iFewKwbJ3pp7L/HCCSHymk33nx/pON9N5IA4BkNI6Bk=@vger.kernel.org
X-Gm-Message-State: AFq9FYI9JGVxJHhjU83FD74HuEX5IKTyAZYJrfUIanhqu1PS9aL9CD+1
	WVQ2lx5chF7EieMk/v5B5WQuDDR3oQTbmKg/1RTb44wROi35duEXetCpHsomwG5g/hE=
X-Gm-Gg: AYBFou1c4iwzygY+m9lEQEq1zO7T6C08+QjHhzrpnOD6dUvNPLVUREyclXWIQVkgdOC
	+/Ie6S50aEVi/FvK9F4zfhkTtUCtg+bkqFiYPRnTKhb16j4FJq7k7QeJC3MsGHaadOJgIzUqU+Z
	oWFpnNPWzZ60aubyXf5A7e8sgWX8Ub3AQ/d1gcAbqEnduxDLaVRqIwOCp+7iGJADxisS/NhDHr1
	NWNDI2C4lUD5emoASesd5JJY+BH+mFmYVxF/KkydMUbit4qvnO7IN9aXNSEdgnTMH1+yIRZ2zcO
	MWA3cHANJFkAnSnJKtMZTXQzOzItTUwNjBomllUfDKKYInXsulCcXM77XupDfAbGIzN5lHgqry9
	G7Knu4yJXNUj7ZJV4jbeP4uM0tW5d+YSUYXGI52vBLjUxvtti6O1z3hJu9v2bhLoBIBXFMYpfMG
	zKcB+WHbYj/kqe4xL3qVINpa4XU6D4mD6DFl1HBUCo67Gzy9/PVkGj3yphMCA0dpdiBa8Qye7tG
	g==
X-Received: by 2002:a05:7300:cc14:b0:353:7b68:4f6e with SMTP id 5a478bee46e88-3537e03ce89mr881856eec.12.1791507366213;
        Thu, 08 Oct 2026 17:56:06 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cacb61asm1760205eec.21.2026.10.08.17.56.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 17:56:05 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Subject: [PATCH 0/3] hwmon: (pmbus/fs1412) Add TDK FS1412 support
Date: Thu, 08 Oct 2026 17:56:01 -0700
Message-Id: <20261008-hwmon-pmbus-fs1412-v1-0-0ae7e5ee4e41@nexthop.ai>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQ6CMBBA4auQWTtJpzagXsWwkDKVMaGQDn8J4
 e5WWX6L93ZQTsIKj2KHxIuoDDGDLgX47hXfjNJmgzW2JGNu2K39EHHsm1kxKDmyGFrnrq6iytM
 dcjgmDrL9p8/6tM7Nh/30O8FxfAHOM4/MdgAAAA==
X-Change-ID: 20261008-hwmon-pmbus-fs1412-fd4434717c19
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>, 
 Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791507365; l=1864;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=TCmpqhsXFZvHB2hYI7sHMF1aP5fPfOZ0+46+VuzusmM=;
 b=R/58905oO3dCLNvhwPY8tQHf7EUw/OU/AJTnHSg4u/p8RsbmL1yQPDlcoO0ise8CjHl24rRQ+
 P/K/uALm+oFBlRy0MvoJKKelkaLq953P76jBDofuzCk7Qw8Aqny7jft
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

The TDK FS1412 is a 12A uPOL regulator with PMBus telemetry. Its
VOUT_MODE has bit 7 set, which makes the VOUT limits relative to
VOUT_COMMAND, and the PMBus core rejects that mode, so the generic pmbus
driver cannot bind it. This series adds a small client driver that
clears the bit and converts the limits to absolute voltages.

Patch 1 adds the TDK vendor prefix, patch 2 documents the FS1412 as a
trivial device, and patch 3 adds the driver.

The driver only advertises what the datasheet's command table lists.
READ_IOUT and OT_WARN_LIMIT answer on the bus but are not in the table,
and the part reports OT_WARNING at room temperature, so the driver leaves
both alone.

Tested on a 6.12 kernel with an FS1412 behind an AXI IIC controller: the
driver binds, input voltage, output voltage and temperature match the raw
registers, the VOUT limits convert both ways, and a written limit reads
back as described.

---
Abdurrahman Hussain (3):
      dt-bindings: vendor-prefixes: Add TDK Corporation
      dt-bindings: trivial-devices: Add TDK FS1412
      hwmon: (pmbus/fs1412) Add TDK FS1412 driver

 .../devicetree/bindings/trivial-devices.yaml       |   2 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 Documentation/hwmon/fs1412.rst                     |  87 ++++++++++
 Documentation/hwmon/index.rst                      |   1 +
 MAINTAINERS                                        |   7 +
 drivers/hwmon/pmbus/Kconfig                        |   9 ++
 drivers/hwmon/pmbus/Makefile                       |   1 +
 drivers/hwmon/pmbus/fs1412.c                       | 179 +++++++++++++++++++++
 8 files changed, 288 insertions(+)
---
base-commit: a90ee4305c4a5df72c11b31dacfdc76e00fcf78a
change-id: 20261008-hwmon-pmbus-fs1412-fd4434717c19

Best regards,
--  
Abdurrahman Hussain <abdurrahman@nexthop.ai>

