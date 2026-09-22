Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 529DD37F32A
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 08:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790065918; cv=none; b=ME8PUu6J7qZyzFLKZE/ATeyJXQM24bQcQaJiNExQFuxu59pC0LG6hfPv/cy5jRgSx3z8WxO4CscNU/H9OU8Uys1jPL60iq90ThAc+UK8cP6Tbb0C9caWoFHBS7wUCB58Qigf/no3nCqUf1MbFbKy3u0RC+VGb8X9N1usUql0Vko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790065918; c=relaxed/simple;
	bh=A7hEuCLZWRdGFblp///+ebIF29mgq6p9oSmiBLCXlLU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=eIJQwaEt+zsiYTdzBhRvM9CW7S2+Scv7Qs9ZCuyiiBG8WROVJHAbM5ySBZJEbRqUwde8ydvhlb2z1Qu8muZhsw/AzFkJedzqxfP3OR5sSt+8/8Bd6Ghmm78CPlqR475HOQaCaV2augGKnuB3bBlpwc+EPDfNrhSExM2/ERaaM0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LEKGXJEI; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LEKGXJEI"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747eb79f7so26502085ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 01:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790065915; x=1790670715; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fdu061GCn59M+R7cqh6VYjsrqQSSKRxNFPR4yXO2TzY=;
        b=LEKGXJEIzHeof7MqC3BR8w23MyReLogdSnB/KofytWBFWR0k9lXOtsI6gxFVo4vUkr
         J+gFmE1CDJtXiWx4qdL+N6dhRlZJKkpyxKz9VhCAH4MMZeKMBp28LiOTiA2b4kDcT1oT
         uRKVR/hiClQrtw6Yo7erb68yJtP8KkalSy8wdoA/WowCLbz0QFzouWa3YSGMRrFn9FJg
         U2khp9aL8NrEnDZK3oQZzN19XcuAGFBLdMQ8GSS8ketmgIiINoCL9mCcws08mkPLiiia
         k4TGcD4O19KZMH+9z/TjhHFC61Rr4IfN7EUIQOfH94DkZknww8wcb/l08BpcBcMORBs/
         Iw9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790065915; x=1790670715;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fdu061GCn59M+R7cqh6VYjsrqQSSKRxNFPR4yXO2TzY=;
        b=DSjEYH9R6HBCrrncw/v80NV2sPf212sq7Ubznin2cy8SjRaQvOwcJVh6s6w1STV4zM
         v3KHO3HLd7WGB4SuCYIikPQ1GWxxprFFhQRFpTmeToAiS2VtuTTzwn4JnVtqnK5f/o/C
         OD4gdrXfNMYi0Ur5UmRibzBRItX+w6bjbv17xCH1FqO6QAFgv6twAPzI0Tt6ECxExhaB
         Fg1lwvOS04eJ8h+sKRT4EZa15yqeO/8AR8HenK05TSbT+FglHpK5H6r+3fMfIVJuOYYp
         w6c4mL8nJCBdS3i15K8gWBQZmJmFTC9rpZkuobMQkTM5TAnnQs0Is+LywLl+nyogMbsl
         qrcg==
X-Forwarded-Encrypted: i=1; AKwUvBwauD3CFuROxq1kFD+AvBazjEzwKqh59l6Fx6gmQPSFUwaoA1gFjc5fGs2cQAeZplgLicyqkStW2XndL3I=@vger.kernel.org
X-Gm-Message-State: AFuF++n0jK2TnDgYWTFhdB/sRxGRne8nKamfpK2Rzu2msiDsHBom59gH
	F6M6cR3hx9umLsPklxZqUewoOOMGzYdUu2wAv641ac3kRwSVd2r8cyKN
X-Gm-Gg: AYBFou03XUvAlvS+xQv75lvYuvlAAmUoCE/hBn/BOFwaYvyGdWB/3QDwRXtbTVgboT6
	OL4D+nipSzj4BVYVL6UWKzLh4gPITutJ5OP4+xyTNSTN3bSbbl9CvlW21EwaPh6sUDnCGSwYwPF
	OPrfEoLmGOEnUFnL1epv1ilqC5d2a/tt8x13cX34HlnCnqMamwDMbPqaufJ6UdpJe7ZofiBEFdr
	st50S5FdXZoWJfa1tXlHXmLXpGWm7dadW4rfDIyJXa9zmKOYX1PpJfCdt9rEgmCi9INCrBrKLoX
	JQtXmvo7ouaFzmREBb3cruQE8Y6yNrMuSJT0H3CJaiZ0QhKd1PePYW3bJIEGUr+kHQVQstcALxP
	E31LkwH35dGlThEmc0QN4MJXDysoVtrtkSV3v99VdI29o/Dd+NqM5tyvlENJIPbYu7vor+R2/9w
	PEll/Irsac1aqlzp4UxlvJGpeU1P0lXum6SWWAc9Vqz6IG5o6smg5k9jxdFk/q6Wf9XyKtVUhrK
	T/+Gx7b1oKP+A2zXHVTtPy1eQDcmXbxPZOPU7WQ2rtTWbIot5qqWi0ULh2QP77vC7OtjJIllvE+
	/52PtAFzDA==
X-Received: by 2002:a17:902:cccd:b0:2dd:c0ff:e724 with SMTP id d9443c01a7336-2df60b674b8mr5358005ad.54.1790065914611;
        Tue, 22 Sep 2026 01:31:54 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (78.123.83.34.bc.googleusercontent.com. [34.83.123.78])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df5d0197d3sm5848175ad.13.2026.09.22.01.31.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 01:31:54 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	John Ogness <john.ogness@linutronix.de>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hui Peng <benquike@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/3] serial: fix IRQ chain race, baud fallback, and uartclk overflow
Date: Tue, 22 Sep 2026 08:30:48 +0000
Message-ID: <20260922083152.4055969-1-benquike@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
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
