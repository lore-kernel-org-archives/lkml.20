Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794840771;
	b=arJy4a66wt/6NKuWfYM3Q3jNn+/FHWgUZ3VDgiRjEHMn7AGLfuNPL+Uvgzvr66AjzJye
	 X1aQxX9NcY/st3+FdIZ0cMLgChSHrmhxdKwj2YaveNDeIUzGfR+N2lDs0Uz6yKWM7X3LZ
	 Wl0lclwm+DT25aCEmf8MmAoN/o147WF91eYdnBDzTtTn+haSrQ0C8l712WGHECsU/BB/y
	 seOvis3BVqt9UCA1LHecAGMSEcBmLlaQGkFgwgiOcoWFSxVn74GIUPfozUQYW35N61tme
	 0sEgt58dgqk6mO4fSxT9bmhJIC2NdoMRuU4m4NkNWP3hK7xEeoYVUHogmuo3MeD4n/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794840771;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=You1mkFXga/vHh9B3JqFjojHJL5bf7S7RuEKx8WEhTk=;
	b=4Yb1n9zTNJ7rQ0OIbAVELE2QKcRSHFmEUeIA97ZN2xaE+0rpg/Ejlho2+lPHMemi4Zt4
	 DfIBSMgNHH9gwYaaVo7LZGvkZEq2CaSVZeG71acRgxJNmSKtxE6UTdFrEG6bPUa2O91Ea
	 Fak4YSNJzYuj62y6QwnVn7LaH4O37KWEaVUlV9W2NoxR2nCnjIgsqYYHHFZ1011xh8xMc
	 nQ0E7KmCYfsscPYrUiBr6tw6w6J8sqNkA3vAiWfV0ld4DU5l0fcqf3V836jUVV2/61rYf
	 amBPwkU/mFxeR7vttyWXePupnNbsTYT7ZBau6odh16XJJmqLNM/1e5iKxnA4nATWKcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tRAVzwhy;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C6CE606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 14:52:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C6CE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tRAVzwhy
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1a8cc11ac42so3321707c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:52:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794840770; x=1795445570; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=You1mkFXga/vHh9B3JqFjojHJL5bf7S7RuEKx8WEhTk=;
        b=tRAVzwhyktdqOvWHpQdxG5sbdIMyaBiNIGxVgNZFrga7aNRFMoNXwde9T2fxsiB/mw
         Z4fwtUpZixvFTeBoA6N18nQ9t9T0OBAbUPklo1N97D9JWaSkSNIfUH7t/9MigK8cG+oq
         a+UYpYW0C567CI0dCPwzU3J0p15EqCETaTNxw16bMMcnzXjOQqNdY0EYTssU04UGLeBI
         y/tm18FdC0bvXJTXbT69cEc7Na7NO4bH4PcYsxF8hkiyTuF2LfACQS51xAFZqtA+yxI7
         v1ReBP8u5oDreaiLPSUh2bEjSWOy2piRrBMBXBC/PJupTcZ+skhvoIQsCUN930VFyXPH
         3I6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794840770; x=1795445570;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=You1mkFXga/vHh9B3JqFjojHJL5bf7S7RuEKx8WEhTk=;
        b=iu53VHuHS40tU+qH+QcL846QA7BIIiEBTpv4b1icrcMbmgDEm2O3M0d1AONoQ66v1E
         HNE1ZCpPAuE7SyI47cRW76o51xymPEbLk26E9wrZK6dZWCghE8Tpk5lnc+Tnyd+zJOzF
         dYD844pIavrmwo1/9kNqcpW0EIOo3Duq1gwbiMiKmYJFNN+apJWh+3wErlJPASwNZOf8
         Lzv455wD1ecYvztjs6aeOYprO0sMmr58Xlqe5t7Q7gICfvj0Kw4L16LN10nJK5J6tsiH
         Z4815tvyUuOS5Hr+HiyvvTIt8/uOWl+yIJobJdI9VfY1WlcEjzC1/HmbJ/aB2YABVwrC
         pnyQ==
X-Forwarded-Encrypted: i=1; AL+hErHn4ARUCodr+lGapxn5AzEqZ/HfJk0W35py+JYgG5ZsvW5yxuPYy5NaGlRFQCUQCYBsyRLokPj3CXSdQww=@vger.kernel.org
X-Gm-Message-State: APuU4Z9PjmwUqgvCMv93rjWnYM6zavMdMrUMk04gkJc3ywQHPHX/p/GV
	BDLksfWuHUbYuAQOS9rFGqLxlQLTxsQx4e6ZcOIOUwVoaZz7VZgQra2N
X-Gm-Gg: AYBFou0v2PoSm4C+feY3EjdcmfpgxmaySGJGd3BPip8aSucrP5unPrYPGc4Zuuebh15
	/GuP3jdZgn2E55/mwYAdin5E15xWoiN2c9ykrQ4KNVYqRfJtejTWTcwegB6diS/v48J0RzHinGn
	jVaKs1aHuE4h3P1P4UeVDyu9XVcKwBXPy10AvcBWjAHM6iqwxktSeqme/rjM9ERuSd0MzZLxehY
	RtQ1ic9X6lxnrVFfQUzQP89ICOssGd0Fg4tCFdlNmoOvTWY2AffLzcQnVMjel47yaiyDVaHhaL5
	0cQdaPwjBgr+eIcNcMLCTn8fp3IHpUBzCzsP3wLjresclOL76NARf6ITACaQOW+nrGXXTIyAiXq
	c0+vZZzkKujq3ArvfVAWex2hABWOrG7X7IX+ZmbW2IiA3pJFtvoNEo1HHXS9NNmhObSgDl6GEfQ
	F2EaTMdNh5vC8EaZbS/qzZVe0xGPtnPXaksvT5YkjQyF8BwVTbIfcALQG1WBqURA2XMFpWbA+bB
	aJhG9NOOh6jnrMFhmBLfInDs+lIUkTrabyUq0n6rl3L3Hvq2jL3N31PCdesUQGcIYG26+LZxfR0
	9yKyW6vpUiu/60EZ4S6mnJDrMWAeGM4cKAzwpXd1gnCIsAU=
X-Received: by 2002:a05:7022:7f14:b0:1b5:1c22:6fea with SMTP id a92af1059eb24-1b53275f63dmr2698971c88.0.1794840770041;
        Mon, 16 Nov 2026 06:52:50 -0800 (PST)
Received: from [0.0.0.1] ([1.54.0.190])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563df84fsm69003540eec.20.2026.11.16.06.52.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 06:52:48 -0800 (PST)
From: nhansp <nhan.094.vn@gmail.com>
Subject: [PATCH 0/2] Add support for Samsung Galaxy Note8 (SM-N950N)
Date: Mon, 16 Nov 2026 21:50:32 +0700
Message-Id: <20261116-upstream-greatlte-dts-v1-0-768d49fb7d85@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIADgY+2oC/yXMMQ6DMAyF4asgz7VUZwikV0EdAjHgqgUUm6oS4
 u6k7fKkb3j/DspZWOFW7ZD5LSrLXECXCvopziOjpGJwV+eJyOO2qmWOLxzL2tMYkykOLtTBJfJ
 NiFC+a+ZBPr9ue/9bt+7BvX1jcBwnMK+8tXkAAAA=
X-Change-ID: 20261116-upstream-greatlte-dts-f29792d1689a
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
 nhansp <nhan.094.vn@gmail.com>
X-Mailer: b4 0.16.0

Hi,

This series adds initial support for the Samsung Galaxy Note8
(SM-N950N), codenamed greatlte. It uses the same Exynos 8895 SoC as the
Galaxy S8 (dreamlte), which is already supported.

The device tree enables:
 * simple-framebuffer
 * 6GB RAM
 * pstore/ramoops
 * gpio-keys

This is enough to boot to a shell in an initramfs. More support will
follow.

The keys, framebuffer and ramoops region match dreamlte, but the board
gets its own file instead of a dtsi shared with it. I only have this
device, so I can't fully check how the bootloader lays out memory on
the other 8895 phones.

Like dreamlte, it boots through uniLoader [1], which sets the DECON
trigger control so that the framebuffer keeps refreshing.

dt_binding_check, dtbs_check W=1 and dt-check-style in strict and
stricter mode report nothing. On the device I booted next/dt64 with the
arm64 defconfig, plus ramoops, simpledrm and fbcon built in. All eight
CPUs come up and the kernel sees all 6GB. The console runs on the
framebuffer and all four keys report events. A panic triggered through
sysrq was still in pstore after the reboot.

The test image was flashed to the RECOVERY partition and booted from
there, with this kernel command line:

  console=tty0 fbcon=font:TER16x32 clk_ignore_unused pd_ignore_unused panic=15 rdinit=/init

[1] https://github.com/ivoszbg/uniLoader

---
nhansp (2):
      dt-bindings: arm: samsung: Document greatlte board binding
      arm64: dts: exynos: Add initial support for Samsung Galaxy Note8

 .../bindings/arm/samsung/samsung-boards.yaml       |   1 +
 arch/arm64/boot/dts/exynos/Makefile                |   1 +
 arch/arm64/boot/dts/exynos/exynos8895-greatlte.dts | 124 +++++++++++++++++++++
 3 files changed, 126 insertions(+)
---
base-commit: 65ffdae53a6d522519fbd66d3cabbb4622e3e5bc
change-id: 20261116-upstream-greatlte-dts-f29792d1689a

Best regards,
--  
nhansp <nhan.094.vn@gmail.com>

