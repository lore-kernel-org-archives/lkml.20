Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AED824D6C21
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 17:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791221160; cv=none; b=NhM+Bl8JmBPD3nL6aKwJ39M2Bvb56y5SIbXNV32XP9mISaI/yY918EFZgtRF+VA3HPU8Tku8U3dLmyrTs2OXELZKvFxFMHDo85k1M2QgghjyAAnawdPfqfoSXuxSUX7smY4CqI4LjPAYNzEeLjLUlmxhv+ni+sURv9cwRYdBPqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791221160; c=relaxed/simple;
	bh=1TovBGqb+S+doAvi0jZy2UcBL66zBbQNb/CjU/As8cs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SzIGEMNKKI913AXosgZLrdpkRgi7j5bJ06DEZCY3KMUZtjxxnow2JSf5Q1BLvnOG+/vM6/E6W0A5oDlOkgX6sma8vN34tg+Qz6pfinUYhzxqeyrxj3s/d4qWO9G1I1HgYNXc76yLxfxF9VLCaFvNWmOoav8NcKCqxPseDRBO15I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZEXnOBIr; arc=none smtp.client-ip=74.125.224.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZEXnOBIr"
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-66c9995ca60so82104d50.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 10:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791221157; x=1791825957; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=B2r0pjGElK1T1XiGX8hF3bDF5aD44JQI3Axp9h+wJZA=;
        b=ZEXnOBIrX+z2zkjroVD18Leemtz2cHybKvxWxyASXz9ZCU7Wsb+piwNNY8sQFipH+F
         Fi9x5Qx6/Dd+EcqBUZbQWG/xqH31DmYwwAfP7zzXHbIthCGhonzP0Au9RcMkWzCbbmQ+
         +PwZHZjBC//3UkOPRHoym2U2QRM7IMNvsI733bUwqqrFCDIqFKELVKvR/c3RF5kYeJ/7
         ED81X9IP0UKq2MTTOe5GeGpdOv7nffGGUTbE+kqs4YdaDh278MaGU/Y5BBPswLgbKuzw
         6ct+qFn4qcPhniQ0UbNzYkWkj1c8A5UCTdzDzsezUYAPe9AJFwjGO6xYh/+I/r7Zo52T
         cVUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791221157; x=1791825957;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B2r0pjGElK1T1XiGX8hF3bDF5aD44JQI3Axp9h+wJZA=;
        b=rTiZuGYYtBvSTPJQRb2LypjiOeq0m3U/5omIOWxpBw+4huAHpCKdkXW5rh+GjhKQN6
         7VSZp/qsg0o/Zi65WUvROgSO/M35gT612zjjSvhe9ddcXXjTqgrDCImTdxIXZ4IHikag
         wZa5Sks4HbdxRYKUstXfJILy7C5q5NXwPjPoPqeyOQ+oVDtEf6XoDZ3FJOWgUL5abJJL
         tq8k3YN3SF/nJoayfgeIcUEaKFV8Kp+jfQS2hwbU2LC1NhA/CpkeGDWyf5eDKrlXs6yB
         wpyrb7bz2hesmZ1/p0/N568VCr9PO2dw3O3zcZULqW1ag+SWRtJ96HseYBYmShfxpKya
         +dvQ==
X-Forwarded-Encrypted: i=1; AKwUvBzVffeNAghV8ixZyiyg3WghuvtYp00t8u6h2BHHOeyqUz4FdlN752RD+PHAPP3xfJNYvCPjc0v2f5NzWgg=@vger.kernel.org
X-Gm-Message-State: AFuF++nOEIuhBSBo58uNgJeFEIn+ypyTf/Mr88tKo1/oLxptmsbAXici
	QDaiawktdoMnT9E7HOjMiZHlS84CfzCbKCVBpVkhe3Khk4dWMyuNfesk
X-Gm-Gg: AYBFou1GX2TsZlwwB8TxGKhhoBLQGrWRj14N5Mll/YIxmk+EDQFtJpJmyMJjw7xR800
	dhA4aKUJceMqLaiFkUG/nlrYkJaqjwdt1nZltXBhdgSZJMsXngMkiRlqQAGrPr5j2ipZno9x0R1
	wDjHXhoM9K9QSaco3t5GktD6aoUiIiJTsI5zOvsgwEZLCFOeXo8vZ5QHp7ZOf1k9QOc6rwQHK8U
	JoMPBQUyiKS5gtEnyaSm55RweNhPn6F4Kua1ypHk5P8xhGxpUYuK6CLH5ApDcco1oZ+V8suf1qy
	pVlpw1jfSNzf3LStx/WviPKf6LxhxUaLZ4+ZnMUluVp+3m8JcGmPOHj6FfGnfhLEHbrylXjAWia
	ZXkqM3/RHIfK7edt47lo8+jlJNlJLftny9VgqvDPjcn2Uc1+jstKSjnzp9UW509nTcvZ/yQFOq5
	hcOhEOCiU8lpBD44KWe1YPU/cJfX/NKN5HWGp03GRpYkGMHJ+inQgq4DDNjAU0BiQabrhRWYvE3
	g3AqjrFm4gI7fYScaEzfIFY+NS/jM4gVBpjyuheC/iNxB2KxNbNyqjcFupDf+QLyq3dLUmsC0Wo
	MCInWQ==
X-Received: by 2002:a05:690e:4142:b0:677:d05a:4800 with SMTP id 956f58d0204a3-677f386139fmr150914d50.25.1791221157435;
        Mon, 05 Oct 2026 10:25:57 -0700 (PDT)
Received: from MaquinaLab.. ([179.179.237.181])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-677c1b1b585sm3449969d50.5.2026.10.05.10.25.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 10:25:57 -0700 (PDT)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: linux-serial@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andriy.shevchenko@linux.intel.com,
	ilpo.jarvinen@linux.intel.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	Enzo Adriano <enzo.adriano.code@gmail.com>
Subject: [PATCH 0/3] serial: 8250_dw: Allwinner A733 UART support
Date: Mon,  5 Oct 2026 14:25:35 -0300
Message-ID: <20261005172538.398522-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I'm bringing up mainline on the Radxa Cubie A7Z (Allwinner A733). The
console worked until the first termios change from userspace, then
stopped taking interrupts.

Patch 1 fixes that in the generic driver: with a DLF register present,
dw8250_setup_port() replaces the BUSY-safe divisor hook, and the LCR
retry path then restores IER into DLH. It's tagged for stable.

Patches 2-3 add an A733 compatible with two quirks: no clk_set_rate()
around termios (the baud clock is a fixed bus gate), and no DLF probe
(offset 0xc0 is an RS485 control register).

Tested on a Cubie A7Z, with local DT and clock changes that aren't part
of this series. The console worked in both directions and a termios
stress loop ran without stalls or corrupted bytes. The no-DLF check in
patch 3 was reworked after that run (an if block in place of a goto),
and this exact revision hasn't been booted yet.

The A733 DTSI isn't in linux-next yet. Enzo Adriano's posted version
uses plain "snps,dw-apb-uart" for uart0, so it would need the new
compatible once this lands.

Based on tty-next.

Vinicius Pedrosa (3):
  serial: 8250_dw: Keep the BUSY-safe divisor hook when DLF is present
  dt-bindings: serial: snps-dw-apb-uart: Add Allwinner A733
  serial: 8250_dw: Add Allwinner A733 UART

 .../bindings/serial/snps-dw-apb-uart.yaml     |  1 +
 drivers/tty/serial/8250/8250_dw.c             | 25 ++++++++++++++++++-
 drivers/tty/serial/8250/8250_dwlib.c          | 22 ++++++++--------
 drivers/tty/serial/8250/8250_dwlib.h          |  1 +
 4 files changed, 38 insertions(+), 11 deletions(-)


base-commit: 36844ea19656fb41278799ef3d5cd52120d89149
-- 
2.43.0
