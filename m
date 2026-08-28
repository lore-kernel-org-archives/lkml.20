Received: from mail-pf1-f228.google.com (mail-pf1-f228.google.com [209.85.210.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A69E38DC54
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 17:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787939892; cv=none; b=Se6ObTM9JAmGzohGNYJtVPSBfEBLomqJfLOQsFt5RTie8667PZ+4vb55qo176rq9lxH5eLVvd7sdnQNmy0TcvQ8XLUwcFVzFtfK49Km9+1UvUCLVanGT1GVmhezup8e6C72iGcpiSh0wpMP5vWNHNxujBzo0Ud81BzOblnic0uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787939892; c=relaxed/simple;
	bh=5PkATv96a5OCOrWRq/A2ruYkuOv3h7T9J5eTDGopBgY=;
	h=From:To:Cc:Subject:Date:Message-ID; b=lX2N0wOQe4xHLBnufzyFdwvU2DQfWzvKzj+YsIMprxvB3LJ5WCriWRRY8W7u9jXWBEed0LyuecImIoYVWbhHNJFA6PtIE8uDXBhd1msjLz1DzWEvHuJVti7/rOpuFyGkvoqFXPeH6k1wtgLv4fy/q6rkkbH8CyBzVbgPVwSlbHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arista.com; spf=pass smtp.mailfrom=arista.com; dkim=pass (2048-bit key) header.d=arista.com header.i=@arista.com header.b=eG3uKZyG; arc=none smtp.client-ip=209.85.210.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arista.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arista.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arista.com header.i=@arista.com header.b="eG3uKZyG"
Received: by mail-pf1-f228.google.com with SMTP id d2e1a72fcca58-84f216add2eso137569b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 10:58:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787939889; x=1788544689;
        h=content-transfer-encoding:message-id:date:subject:cc:to:from
         :dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l0MYRmzZFgruXC9r5HawEJJIBHGX1MwpvzJV/6xzk4w=;
        b=CaihV5pI5rcT35QXldRbD/ed/6LjO5O9Njg5oCXG9GHiqokOjVdKwJ1CO4ZDFzW4tE
         Txm3HLBwXUWR0jl87xw9g/B0s4Smx5FH3em4HDddhihtBs0jw65CWKAWit5CM39yyqFC
         rW66lYg63FPgvS+jG6zWS312Gv2Z0jnyVD9LY1j1O/B1UHwuehY/V6l5vTXpwQWfokI6
         9pYukDW8Q0KV6Ra9KFdpey/uGO7/Nhu41WPRI+RX+5tpqQhZrtoIVLkiqaLhqg/rbFc6
         Usc2AEpcAUzC/+Fyrc8mttTYIiq8uY1DuNmQv8DKwjF3vJ5SRMmLJ0uW5DjtAnoQxZGF
         GvhQ==
X-Forwarded-Encrypted: i=1; AHgh+RraMCtGyo9drHWeU8ZrYH8641L8kExYlCWed+LohQh/26H+aIXvPx+cXr7FZtokOtBkGAJd0iuRB7MyvkI=@vger.kernel.org
X-Gm-Message-State: AFuF++lyxNVOIEVBxsyRYi6qLej+8fCiGNWz06pSxkTgzKajyYRgsdJt
	YDbMu7Y38KGFZH3zpWncduSYgDlK8CyI3Alomy598P3lRhIbe9ivatNbpdRVYJmu4zp5Clz4/fE
	1lym0NyRdqhjtllODthwmwd/3aVKznlF/NA==
X-Gm-Gg: AR+sD11g1LwRQrdSL3E9kDfiid05Hy2vsRWFTkpO0eLgDIzQ9Xsbl3O1x9mfSDF1wm1
	Z3Tfbhre8nkut5McD3jGNGthYma0GR5znfvO+PMxqkEcvuNfxkPvjWds+O4tedlKB9uzAAiMIFY
	dU2Za0ps+kuyrrgioovwJfEMbn7H4LI4PCqytkXME6BfEF2xIp77M0KumhA4oKFbSN47VvGuMgo
	vj+7uWjRMMWe8VFKivpMjn23dhC+CCVBZ7bGgCHFAr6EOoCNHndWjbRUPXeTHqLwv1PkrWKN2a2
	Qvg0bl25yZ82wsz6H7LVgz4BISDMdqpvNHAWKgTurLNy4LNhCdzGQTSoctPqESnDFg6eLakgEs9
	62KkfbN5SlJa4q7FvzUgM59p4WB4GJ+xRg4jJQEjwv+06472oDlnSYmQAvpch
X-Received: by 2002:a05:6a00:2e24:b0:851:8baf:5b26 with SMTP id d2e1a72fcca58-8562a7dc401mr13785540b3a.14.1787939887387;
        Fri, 28 Aug 2026 10:58:07 -0700 (PDT)
Received: from smtp.aristanetworks.com (ec2-54-84-120-176.compute-1.amazonaws.com. [54.84.120.176])
        by smtp-relay.gmail.com with ESMTPS id d2e1a72fcca58-8569f3a0fddsm819717b3a.2.2026.08.28.10.58.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 10:58:07 -0700 (PDT)
X-Relaying-Domain: arista.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arista.com;
	s=Arista-A; t=1787939886;
	bh=l0MYRmzZFgruXC9r5HawEJJIBHGX1MwpvzJV/6xzk4w=;
	h=From:To:Cc:Subject:Date:From;
	b=eG3uKZyGSmNj9bVPNEHDYUwq/K0u4ADVlFzeN4WPO1k9I/lLghRacGWe1L/Etr8pz
	 nBkn2qno+nx4WvXkQCR5mbEV4beP9Af9PXvhm6AnIELIZCMnWnrFbtO/kRkzmaBE06
	 Afv1SnDjTRR010IvekfwbEOjZTKCOi937V/sVYK4lZ1OVNsmDsy22nWM2Y7uUizLcX
	 VaTpNxzBwxUqNwySjrnmCKsEHIBDuWUJj1P01AKmHw7QCtB2AcfGEN94y3iM8ct64J
	 RYOKOvLKvnJejeZL124FpDpwysBXP5D4u0xIn3FSfE/wjv0YF542g/xbRQhC6A/m+v
	 y6zrgzwzaVc5Q==
Received: from vm-whiteberg-ubuntu.aristanetworks.com (dhcp-244-90-77.sjc.aristanetworks.com [10.244.90.77])
	by smtp.aristanetworks.com (Postfix) with ESMTPS id 5A5A9C0CE5;
	Fri, 28 Aug 2026 17:58:05 +0000 (UTC)
X-SMTP-Authentication: Allow-List-permitted
X-SMTP-Authentication: Allow-List-permitted
From: Tate Whiteberg <whiteberg@arista.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Tate Whiteberg <whiteberg@arista.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: [PATCH v2 0/2] serial: 8250_mid: fix race condition between output flush and termios update
Date: Fri, 28 Aug 2026 17:57:26 +0000
Message-ID: <20260828175733.1650267-1-whiteberg@arista.com>
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Fix a race condition in which setting termios while still transmitting
can corrupt transmission.

Changes in v2:
  Split original patch into two: a prerequisite to to expose
  wait_for_xmitr() and a successor to fix the bug. 

Tate Whiteberg (2):
  serial: 8250: export and rename wait_for_xmitr()
  serial: 8250_mid: wait for LSR tx empty before setting termios

 drivers/tty/serial/8250/8250.h      |  1 +
 drivers/tty/serial/8250/8250_mid.c  |  7 +++++++
 drivers/tty/serial/8250/8250_port.c | 13 +++++++------
 3 files changed, 15 insertions(+), 6 deletions(-)

-- 
2.43.0

