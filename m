Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D43B3FADF1
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 09:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791365662; cv=none; b=NO1yqxo088FclVqniZ7bAh6EEVAWXmOUT3Hx0bxt1EDMsgfBPIVbql8jSHYWPps4H/3mDeQ/3BZG8x+3hi4XrZG2LOAwx7/bXd+g5ZjaMCwVl7ABzYU9HaqiCAdqMRR7X00Q78ldetU7eTI6PL925irEQjGX9f5J1vzx5TTHBRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791365662; c=relaxed/simple;
	bh=DEQoUozW/Cs8HCbMPzg7ZPhOKB0dfvcgpHAGzkIkN5g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rHNkFZnF8CfhWHca9f8ukNNfc/r0s1OMCJzljfxjbRlCHpdb2ai28GKnPEJb1uvgROCQWOxywyhFE6mNFszRvDugfTYyaA/cnWZdbWSKe6vAeAwI5VfmjvhOorIh3dK/fHFMGNoCnvc0ODnkDvAJtU2vHBKhyrlEcBayRwq4mzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T5hCY+Q1; arc=none smtp.client-ip=209.85.217.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T5hCY+Q1"
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-7c1ecff2b1fso452769137.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 02:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791365649; x=1791970449; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DEQoUozW/Cs8HCbMPzg7ZPhOKB0dfvcgpHAGzkIkN5g=;
        b=T5hCY+Q1YMRifQtJNpwfpRHJrL96eu66NyO8k/fOU6xriMjkUVzewqsf+D9cDW+g2S
         y+Z1vlokkYNXulEAg5ZorFJ5Bsd3AKNI6pOR5grOajPc9/p7m1haNxusFKr5/SGG6qIW
         DuE7xac9VE4JG34//XrBq9thtiGBXDRKtWR6lPJNK+zgcaTFW5RmJdS6FC8pfXhyqvxc
         RoGCL7KD+kO+5VWDsidVJqE1tb7RzrrPhGuIVOmyd8CQhpui/9kakH6dgM+7hs826n0O
         fOhLVQ2hjPaPkjdJ3gupw+0hwXzH97/RcnF29X9h4OSOGcCzonsyE4kbsbJpqAQU87OX
         ymDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791365649; x=1791970449;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DEQoUozW/Cs8HCbMPzg7ZPhOKB0dfvcgpHAGzkIkN5g=;
        b=t3nsTvmHvbXRnK5OoMItjB5NvToCKa9xnkeIeq95gVLGm1FP1Hsk0xdOndZVoEv85q
         Gy5EdUDw3HX/ZMiG9jopT7+Yq4R0xcrOMKDdfoDWNVRn3S9knFN6ga/EvKgMIJfeKnHu
         Bm/datk3zRF3OTp3v1kOf3zrvMS6eK9gkxQa8rsiD5iYjGwrkazYcO9eSwd5NgRX699t
         nuTE5BgZRkkb44BFD8FGggQsjmToQe6lpbYwdYu3c7J+yogxQECdY2lCjidY+bzloBu9
         Ti6Bvlhy/wdA6EAuAqmTBDOsn+CEhViDTy81+KLUNVPUgO5/bs38fVbD/O25I/xymWNr
         S0+A==
X-Forwarded-Encrypted: i=1; AKwUvBw5KVwyjjuktHaU9agL6ymkOeSuyhc4sB7cW2EfU8r+ZliouLcxw2evJgrMoqNEU1Pba+LuMEkcgvAGTPQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYI5Ha5GjhowyAY/OAohjMOaMhafx9vi7xabtkG+q/N/4VSufYWa
	5knGrgeNU7R0hBcKCSEUT3EmIoVLpqfVSnL1tqBp425gJPmynGEtoSs1
X-Gm-Gg: AYBFou2uMtVz+Rnz+3p38x+H6n+cP6m2idZBZADHtFPoUar9DeUoIxMqDf9tlWz5bPT
	7WAIO2mOi9CISfXU4X1hZPzLhoJ/TjD/U5t3R9QFDj0uKHTDlPXB5hQkmlI0UeceoKiNsqGiegO
	e4qyOhq80JLRInH8vsITKJsmg5L+8Do21AkahjBIEUvjtZZynHdv4XJ2hfCFf1xrkwa6NnN1vHt
	Ta9ndjcWpeAw0hEgeLMBCc4qL4wsgudWidgkCxcqeSE37kFsSCMZ5ZH2JIAYKJvfJOrkMiqFtwK
	6hjiVhroBm718HeNMGZ+rfFxIJ6c/5XbIDoj6MMqyLWNb7M4Etb30we6snRmiMHtVFSeUaF6jgM
	DDHzldinVw+wIRoVGt4tHILpQfPQEfCU8UiYcfMK4v2H7veyH25g7HyOI29v9y8EKnA2XAsSIMn
	DJAlpZSeVbb/eIjfXZf1ww0h6/Vldg4k6hmJfqpPOWHbSn0zekVj8LAxcDYawe0L6FOQxU/pZV4
	B30GInsIJaOfcFN3VkhFp3wTlHfgeh1Z7fkJPJqM2m5CBfv9ZTcOgi8GFSzHGAPVq8xOMYb2bBC
	k2QezyU=
X-Received: by 2002:a05:6102:2909:b0:7bd:732e:c615 with SMTP id ada2fe7eead31-7ca38e16ffamr456522137.26.1791365649209;
        Wed, 07 Oct 2026 02:34:09 -0700 (PDT)
Received: from MaquinaLab.. ([179.179.237.181])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7ca218138c6sm1319958137.12.2026.10.07.02.34.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:34:08 -0700 (PDT)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>,
	linux-serial@vger.kernel.org
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
Subject: Re: [PATCH 3/3] serial: 8250_dw: Add Allwinner A733 UART
Date: Wed,  7 Oct 2026 06:33:23 -0300
Message-ID: <20261007093323.22104-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261006193046.540252-1-vinicius.eduardo.pedrosa@gmail.com>
References: <20261005172538.398522-1-vinicius.eduardo.pedrosa@gmail.com> <20261005172538.398522-4-vinicius.eduardo.pedrosa@gmail.com> <603b4f40-2a60-4bc5-8b98-ada7a52fead9@arm.com> <20261006193046.540252-1-vinicius.eduardo.pedrosa@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Andre,

Correction to my last mail: the v2 change I proposed there is wrong.

Gating only when clk_round_rate() differs from the current rate is
e5d6bd25f93d ("serial: 8250_dw: Do not reclock if already at correct
rate"). 7dfae6cbadc1 reverted it because it broke the dw UARTs on Bay
Trail and Cherry Trail. Mine compares against clk_get_rate() instead of
p->uartclk. Peter suggested that variant in the revert thread, and Hans
pointed out it's the same check, since uartclk comes from clk_get_rate()
at probe.

From my reading of clk.c, the flag you mentioned seems to explain the
regression. The LPSS "-update" gate is registered with
CLK_SET_RATE_PARENT | CLK_SET_RATE_GATE in drivers/acpi/x86/lpss.c.
Preparing it rate-protects the gate and its divider parent, and while
they're protected clk_round_rate() returns the current rate. So the
check always says there's nothing to do. The divider never gets
reprogrammed. Hans's debug log in
<20240317214123.34482-1-hdegoede@redhat.com> has a request for 1843200
rounded to 153600, the rate already set. I can't test LPSS.

So on LPSS the CCF does ask for the gate, and the disable/enable in
dw8250_set_termios() is how the driver gets clk_set_rate() past it.

For v2 I'm inclined to keep SKIP_SET_RATE for the A733, like JH7100
(b0ad20a3b64b) and SG2044 (cad4dda82c7e). The A733 bus-uart gates carry
no rate flags, so the rate calls there are no-ops. Calling
clk_set_rate() with the clock running and gating only on -EBUSY might
work for everyone, but it needs BYT/CHT testing I can't do.

This is separate from DLF. v2 still uses your 2^n - 1 check for that,
with no A733 quirk.

Thanks,
Vinicius
