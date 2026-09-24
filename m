Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB5AC40756E
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 06:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790229920; cv=none; b=j4zNYO7eEzebTmxZ8QvzC5TUnIxGpaER0D+eD2hm1tW7IIyrm50BgC8C6n4aFVEuEszWdRX2plEzbTl0QKsetG4tVMGFItFPBd320nSg2E6kGxjkdlvxoivZ4Tm1t9nrA/CJToHE//5jlmPpqoUJXxM8QkrKEVJBIIu2p1Jl0KY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790229920; c=relaxed/simple;
	bh=A7hEuCLZWRdGFblp///+ebIF29mgq6p9oSmiBLCXlLU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=WtilFU9XuRGkhEY2AyQIfbAls6za0hbVJXyJAZwMlk4SP0z3LFHCe721mNgOZxxXJOZ1KFyfa5ifPWZQG+HNYg5R4nGHnfJwuWoxbs+u8RjSIEkzUIMie6JGoTMU+5YvDPdDPrBw9pOosl8VthcsTdr0EYoSXAPjqsh512URXNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BehYpWU9; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BehYpWU9"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-868b2e5be4eso631405b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 23:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790229918; x=1790834718; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fdu061GCn59M+R7cqh6VYjsrqQSSKRxNFPR4yXO2TzY=;
        b=BehYpWU9Ma3OrerkG9UFWyC/attL2t1f6c+uCSJtvpKy/ULin3NHjpHzu0myTMloTx
         yDdOc6UVZ0amds3aW0zHSn/P7PWXgrvjx89XWQ5U97H8RgIjnLpPju15JYNlq2dep/A1
         S5NCc99KhO0rliZVJCklJfFYINq7TjeT+Mqs6BLXKBZWqSlHntUfT8YN+bcRnQn1Z/uU
         kaYCiSD4w8l60PCS0FYHgMPmy63TN/zoC/ppl9T+GT3qKaEfGGlOn1ydF481tXF7az9p
         ipl+vxVGG4AXmv7XlSXq7plMOk3eo4mgsvKGDbnVU4rf6srgsjfHCccb6j7spq7tbfaF
         hfCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790229918; x=1790834718;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fdu061GCn59M+R7cqh6VYjsrqQSSKRxNFPR4yXO2TzY=;
        b=FMn0E+QW9ct7Ki22j8aZA+kuVTtG9clT6eQfTRI5RZ3OU2dibLCT1mI3py57Qu1zdE
         EfXYwCN0Z2jjbUSneEynvaPfYXYyhzx+VAm0SqrJRDobDG7L56YNBCWatDW7i1LWcUmN
         jjAg5mO7NbYcww6mtejbGuQUoqMMXoabzaRbZI+ZNYbnHyTBZk32KCTYXMtYPE4B8kfd
         MRtFjFgZvK5h2CLroxSVBVLluvvO4UcVl0fbDc47CZZWF0GMD0qdXrRgXNqLSbqfYVmN
         nXRz+VPBpsZMwbGXfqThsEN+Qb6CoeWS6I29I+39uJKk/BrJR0/MZYNLOm9w5wuuN+YL
         IwpA==
X-Forwarded-Encrypted: i=1; AKwUvBzDCZOmOAeOduKMqRlBch/8zp4B9p40Gg8zo4EJ/nwTYYmDiWu1U8AfFEbPEqzzB5UtPQWPxQL6lqz4qbs=@vger.kernel.org
X-Gm-Message-State: AFuF++khEyR6UBQ7HXlSlGU9zgpqDP4HLIStbiI/TJO0VLgrm7lbYUCB
	nw1HqTzn/gXq3rqgm31MXAFsmARKTtczKFS/hO+v8aZKCsb9Y8HOGxEB
X-Gm-Gg: AYBFou0hqvYZh3WACPSyHuSbQbY60nxWUPraeD0QgybGWtGV/xOq/9UfUW/6OrVHIrg
	+8BSmEp3SGgnUIhE01NWkpsJpy66h8dlwL/yE+LpB8u0LV9VFOlW+X+UA6eSCAwlNII/vD0avdS
	C8dkINdvwSshCgAm5rzsNubaSBcQpULbNmEloC7eFnaB6TyHScpzdXdMtkQOXWtri2vAHDhrc9x
	T/qJ0XDgMLmlN4LIpsh2mgqmsjEUWwZRciR92EIE/989yvN1Ap1cq0ZDjRxxBWfmcE7XcqDIY+X
	Vt4pH7GYV4t/toNbB2H3DOU5YQKWX0Kbh2HqUIvqGJZ44OFWnmtQmzlSVk9LuhPfpMMaQW2PV3K
	Ohs+79TKCp29dQqyFXg5mh7qoaK4y4TJ1UJ+KfUFHdeJ7Cuf//KsuUfeCgajR0gg1onz9l6JZSi
	Snquh9LRicxtJa6VvzgGDq5DpwT6uYXwDYRodEN+5eLMfCQxZ1NS9HizJEvJiYvH0TeZhcuCTH2
	/7XToD93DRyJra/g2ELRkCQzw6+tENfVTSokIqMRf87UX5uYUEkPn0WsQj1rsQkPbirU/HLMPq7
	4dLxcDLblg==
X-Received: by 2002:a05:6a20:d49b:b0:3d3:af85:eb98 with SMTP id adf61e73a8af0-3de0e790e6emr1523337637.26.1790229913520;
        Wed, 23 Sep 2026 23:05:13 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (67.51.127.34.bc.googleusercontent.com. [34.127.51.67])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc75f2228a2sm2056710a12.4.2026.09.23.23.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 23:05:13 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	john.ogness@linutronix.de,
	ilpo.jarvinen@linux.intel.com
Cc: andriy.shevchenko@linux.intel.com,
	linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hui Peng <benquike@gmail.com>
Subject: [PATCH v4 0/3] serial: fix IRQ chain race, baud fallback, and uartclk overflow
Date: Thu, 24 Sep 2026 06:04:43 +0000
Message-ID: <20260924060511.2364717-1-benquike@gmail.com>
X-Mailer: git-send-email 2.56.0.rc1.310.g51773c2048-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series fixes three bugs in the 8250 and serial core drivers:

1. Hold hash_mutex across IRQ chain lookup, linking, and error-path
   unlinking in serial_link_irq_chain() to prevent a use-after-free race
   with concurrent serial_unlink_irq_chain().
2. Allow a third loop iteration (try < 3) in uart_get_baud_rate() so that
   when both the requested and old baud rates are out of range and try == 1
   clips the rate into termios, the clipped baud rate is evaluated and
   returned on try == 2 instead of returning 0 and causing a divide-by-zero
   in uart_get_divisor().
3. Reject baud_base > UINT_MAX / 16 in uart_set_info() alongside the
   uartclk == 0 check so that multiplying baud_base by 16 cannot wrap
   around in 32-bit unsigned arithmetic to a small non-zero uartclk.

Changes in v3:
- Patch 2/3: Collect Reviewed-by from Ilpo Järvinen.
- Patch 3/3: Add missing #include <linux/limits.h> for UINT_MAX and move
  the new_info->baud_base > UINT_MAX / 16 check to the uartclk == 0 check,
  as suggested by Ilpo Järvinen.

Changes in v2:
- Split the 8250_core.c and serial_core.c fixes into a 3-patch series,
  add Cc: stable@vger.kernel.org, and document how each patch was tested in
  QEMU, as requested by Greg Kroah-Hartman and John Ogness.

Hui Peng (3):
  serial: 8250: hold hash_mutex across IRQ chain linking in
    serial_link_irq_chain()
  serial: core: allow third iteration in uart_get_baud_rate() fallback
  serial: core: reject baud_base values that overflow port->uartclk in
    uart_set_info()

 drivers/tty/serial/8250/8250_core.c | 4 ++--
 drivers/tty/serial/serial_core.c    | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

-- 
2.49.0
