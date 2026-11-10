Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794329284;
	b=xOyQf09nYOoqoP8vOUPRr/epnhUsqg0zMZTCbUyJ4qJ+0Gytt9fAq5ek9hQ8ZlK+l3A0
	 q3BcvTSFshusMH2JDvTj4zkFKsiQ+/MhVvjEEWlApuyDfcQ5DzFj2Om6GKu+uZ7T+3xXA
	 56VWSnxhWCLSQQ605X7LjgT0xrZg44vXdeO+LWQtki+fDujPwPprB86xGU87+A3D3YzNq
	 sZGv29MbGcPHsddbUQ9W0VtWXopgyxB4FM84UrLsDoof0TbSprRomL+Z0aQ3GysyMAmjN
	 I36089/mjVF21qy/O0wUzD8FvVG93nro/O8C3P82mNXTH0Ct9hRxpA5Dy8fBv3Vat7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794329284;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=4UCgQ7nO6Eimv1yLPkGHYS65lqVgFv6VK2LWqH/eDLA=;
	b=q0yQ8/+mlBjpAyFMmuLJmhgzqFk/9y8T9VjEClqe9dLj+PnGomXAf+a3fDiO6V1Dswqu
	 omv6vwahNGV6S2jJiW1rMvvChElr+N3luJipxzPucKIXEXkUYEj2mDSlb3Wn8M9BuYffL
	 fFw2T0YlyWNb6Z3U1F9DdbOYANO/nWAK8vaxmeCLTTR0NClnpjVr+QbHEsXcA6vcII7lz
	 YQMtvflDIdfnlyGd8JyFTQEcC2VNLmHpHMTf3cC6R8ykPoeRZLQYmujvylRvjRKdUARht
	 mvDUGB8WAYkZ8I7Ub57YH9/wtMagWISpCJwVi4H/EfFw2fmhjTo0jQh4OUUOiTxBqMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Oe36dsxv;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6256F606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:48:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6256F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Oe36dsxv
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so20504635e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 08:48:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794329283; x=1794934083; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4UCgQ7nO6Eimv1yLPkGHYS65lqVgFv6VK2LWqH/eDLA=;
        b=Oe36dsxvHU6nUMC65c5zTAma1LFsRc4ry+PagYMEFU79yYguo+yKnZr2QNCPJ/Vc7X
         Y8LLTY0N/qn64e8iiH+1hax8SSNHsU0l8/K+rR4n/65CL4W+SIrzwlHPlbZWJgaVd/P0
         S9QVwZOegS3OZkg0yzzWgzi6dTKI+b6cpwoxLBsbNkkRP17GxIOd2EiDFWThC/jcAhWA
         DEJddpxIsROugT05mx5WRduvh55xOEIL9scaIFXwY5BDeFYYjZ/xk8Kl+1uaHvAsQPi9
         306x2ZaT2MJXZJOq3nJH/mAVt+8LZEUWxBf22ZndHED+2iQjq2Sin9IjoQtRIX1PWYao
         L/MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794329283; x=1794934083;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4UCgQ7nO6Eimv1yLPkGHYS65lqVgFv6VK2LWqH/eDLA=;
        b=P5I+1mLzyWkPcHeH/L0wa94s9jKr1yhOnrB1oTYjYku9zCK2qpl63smq/X4fnCNhEG
         aLIhobFWIPeQIrLqq5nnmIX/uy3ME69ZVEyhrG1NWrhC238FPhsudM0pNLJ6Rcdi52Vw
         UxkHMX9AEGwRs0cSv1aU7MrYff1PeqfbRgUd/3ItA3cOZm4kc/8vy90LE/bCiReXT2IU
         JX9QOdL30kBQT7BLVdR+FnfmaBz+/0odVAZaxyp5FDTxO02I0thVFofgQVc682eOw+le
         lGfxBfzoSpGwV5nQgxzDX1tp6UVnKUEG6XjSeEsIRYw1pOMCgTDiHJXjb6FXUDIFSeSr
         rnAA==
X-Forwarded-Encrypted: i=1; AL+hErHf5OjJYb1wzFe4d/nOwBRmbQvFGhydG0Bh4iDy9Z4E8s5QNuBwEUGmjoK45Ft/2ATyBHI/+Ju87IDXDSI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8uoKTn91bpcTLBkEX8qC4nGMjiQsDs/YTa2tU/aLQkYomgWQRr
	Npt+sQYBEdUibSIMD8ogrdDz59l5d2cS2j2hysitaLUcogxZj3/kpnfk
X-Gm-Gg: AYBFou07eEI5Iljo8UyNVOL2BnhkoICE4xyhV0tH+VEePo8Dw3n6/2jUDTQfoGnq3kF
	2IBY9oPcTTz28dipuF+6XuCnEU3cQ1emTjVd1uRSXt69liAK2toXDrD1PpOUu1fbUc4pdJmBZIw
	BIaMqBhVhy2iQmbrGJKTWXEk67ppkuEyyfhoukuz3R+QzyVI03VIehqMdhE0zcHKh7MsCQSwUAx
	RuLhOQ2ZFb5iPvzobjStmAs5a2xgLqp1B4prbrVFEKkoaIoC4Ik/1wlu5M2FzxnCN/6UUS8pa9J
	Fua6qxnsCncUvZ3e0cbY8jrulOYAfdk6mDeeT6ySKN6JF4XWz9efDhpJqF2HkKF2wShuYsKhXx/
	oB145XsOYyJzpoA61e97Dvc2xpo/ZmLR6d1sUNHbFdGjzQsCONtruhmRhy+BqvSnfEf8/CpqB/A
	Y4Z3JMilC8tHHn4sNAi28NLHSjKRTsZ2uCxZmdoLFE4fkh6e+ErApbWXX+h6v+3qF9EsYSuaW6H
	RQoSt56HUTjMWkMq1UjRkGM+fsyjHTdU9B+64358pjdQ/gAE0E09zEg5bw1Xeo3roBCjkPX1GMt
	mb2F/cPrDxN55K1/u2hSNl5oFPLldJuS1wbXriJpAqatAaAQ24rgFobocGYkaLTG1AXVoFyXHkU
	f9YDEujB83Baj8KY=
X-Received: by 2002:a05:600c:19c9:b0:4a7:c366:d791 with SMTP id 5b1f17b1804b1-4ba02308537mr55624685e9.1.1794329282372;
        Tue, 10 Nov 2026 08:48:02 -0800 (PST)
Received: from zeus.unificl3slsbnxe8mz.com (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0233e5d7sm58289665e9.1.2026.11.10.08.48.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 08:48:00 -0800 (PST)
From: Sander Speetjens <sander.speetjens@gmail.com>
Subject: [PATCH v3 0/5] firmware: raspberrypi: Style cleanups and fix child
 device lifetime
Date: Tue, 10 Nov 2026 17:47:46 +0100
Message-Id: <20261110-fix-raspberrypi-firmware-v3-0-e001feb542dd@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/43NsQ6CMBCA4VdpbuZMW9I2MvkexqGUAy8RIVeDE
 MK7G5gcWf/h+1fIJEwZKrWC0MSZhzdUqiwUpGd8d4TcQKXAauuN0QFbnlFiHmsSWUbGlqX/RiG
 s6Zq8to0PzkGhYBRqeT7o+6NQ8OT8GWQ5TpPZ6wl0Mqgx6FB6m4LRqbl1feTXJQ097Ohkz0IWN
 bq6Ja9ddCm5f2jbth+b+czmCQEAAA==
X-Change-ID: 20261107-fix-raspberrypi-firmware-be9c602d6755
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Eric Anholt <eric@anholt.net>, Stefan Wahren <wahrenst@gmx.net>, 
 Stephen Boyd <sboyd@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 sander.speetjens@gmail.com, Manuel Ebner <manuelebnerli@mailbox.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1883;
 i=sander.speetjens@gmail.com; h=from:subject:message-id;
 bh=1sX+VjlacyXvU1AJ92+S1CM+u/53cA8H5C56y3oas8s=;
 b=owEBbQKS/ZANAwAKAXjNeEUMBchnAcsmYgBq80q/J0bxEEftjI5WOvseJ8n8Q0hB4Z6sfzVaN
 PAU821BhPmJAjMEAAEKAB0WIQRWUkqLABoRw+7JUQF4zXhFDAXIZwUCavNKvwAKCRB4zXhFDAXI
 Z6P0D/4uSDa4m0EZZHbNneYA1Ef4CNP51jJKIzjQnUJFajfKPKEt5mM8+PiPXHET/ZvgTidg+1a
 AhW+1KfPUtM2Rwgqq9iVFisWFTScAbLaG6lp0+7DOprxzqqR9KVFea+YB3BNJN1Bn/AnlTleaPK
 wgEKahgWSp0o1G4DP4EtJ5H64nKbiJ1C96rrDZRJxd29MPcOzhfvebEjwvE0iu06ChKQxzBPjCh
 Y5GsPcTTWWuYghBd8QIZOQLkpr0yOj6uNsAhjUnRV3Az9r1DwSeuPe/W6MSIvnWhGQafJrrXHb1
 jsDU/HyJ1wbu78hHMcORuHZiMXRPp35eFdJRsc61EqxMCZ9+FzGbVSfDshUelVndbJCTQLG1PsZ
 IUlwBeXV6Y4nuseczwUmpRyXfrxRs+7SeA89GIvNm5mEFO1P9Who3SZtMvHvDFQoB1US+SB9eov
 a+0vxtsLKZSaq7wI7GeHczW7qZfPVcloGpdlhY28sGw8UhRQMhkysogP2ERnpMN1R3NBYBial94
 i8phuG4yqdroSaoTr8K5KzrWBZB7Wppbe6/1Plaw3WZ0zvMDrUgReay4EVAskwmckiQU9Gyqzgh
 AA+Ug6HQSfpIs/DCc5eIbzgR42DvY01uMmFXhkm1JoMUjfguJXyL4k27EKEw3llevaJYLtj+jmp
 P1ZaqmP18/3J+Bg==
X-Developer-Key: i=sander.speetjens@gmail.com; a=openpgp;
 fpr=56524A8B001A11C3EEC9510178CD78450C05C867

This series does minor style cleanups in the Raspberry Pi firmware
driver and fixes the lifetime handling of the hwmon, clock and rtc child
devices.

The first five patches address checkpatch warnings (missing blank lines
after declarations, incorrect indentation, unnecessary braces, and
undocumented memory barriers).

The final patch moves the hwmon, clock and rtc platform device pointers from
globals into struct rpi_firmware. This pairs their lifetime with the
parent device and prevents leaks or incorrect unregistration if the
driver is probed more than once. It also checks the return value of
platform_device_register_data() so that an error pointer is never
stored. Registration failures are not propagated because the child
devices are optional.

---
Changes in v3:
- Update cover letter
- Remove braces fix
- Update commit message 6
- Link to v2: https://lore.kernel.org/r/20261107-fix-raspberrypi-firmware-v2-0-5bfe605a5cc5@gmail.com

Changes in v2:
- Move platform device pointers to rpi firmware struct
- Link to v1: https://lore.kernel.org/r/20261107-fix-raspberrypi-firmware-v1-0-707362c710cd@gmail.com

---
Sander Speetjens (5):
      firmware: raspberrypi: Add blank line after declaration in response_callback
      firmware: raspberrypi: Fix indentation of return statement
      firmware: raspberrypi: Add blank line after declaration in probe error path
      firmware: raspberrypi: Document memory barriers in property list path
      firmware: raspberrypi: Store child devices in struct rpi_firmware

 drivers/firmware/raspberrypi.c | 56 +++++++++++++++++++++++++++---------------
 1 file changed, 36 insertions(+), 20 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261107-fix-raspberrypi-firmware-be9c602d6755

Best regards,
-- 
Sander Speetjens <sander.speetjens@gmail.com>

