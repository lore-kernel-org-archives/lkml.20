Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2851D418370
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 09:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790847595; cv=none; b=QDUljeoSRmTxzavjtrF6cxPE97z5EJvkLz5SPO9hSzgXTdphoz+9v5KZZNhgypH6YkdsptkZEnpKOqUvcSDyfzabR1KOjn9190R4wubzL7JaC2fAw+x1F+myviW1l/2hfW6h4pSXLxyn8/wteP1lRXQTWwwJKQvPelj9XmcpyfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790847595; c=relaxed/simple;
	bh=CN1pNMNVY60nrwF4PyBxbGYXkWavMsGhyTYXM6ybnys=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LRv9curys6fPj6Z/EbT36DUwjufs9VO5XFYYWh3rclWbCi3ywpZ4mPi4uxpnIxbtdZ+Umk6b9uXxIQXgcr5ra63LTSo0+ADPoIzuDPOW5m0K80JVdYcXqYif6tDQFUvNFfq3KqecRPqA9BVWAB6azv3OoyKeZ7/yyabODFD/5U0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=XPFFUm95; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="XPFFUm95"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e79a408deso39626695e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 02:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1790847592; x=1791452392; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Bx4xsfGddywXzJrU7naavgZks09qhhwcWH0Cs2SkprI=;
        b=XPFFUm95QnmBipUSfRINUpRpDshJucsa/NGbuqS7LcLC2P6cCleKMhQgasw5CzwRNR
         3HFfslrImP+fe47eS3E5JtddrBjWwOPQEYLaeuU+x+OhK5BqzIT8Bu5UKfj7RoKxqBmu
         y2NE5yIP229Gw81ecMwbncP3jL0ynafts1iyZvuuY/JJlqPYPlBMBWf85u15jkJ1NoBr
         9R+fGzRM7L+XrKue+p/MkbUrvKFHnamV0+C1b30Yn6KQ/cvS/qHqAfkBB9YXH07lVzF9
         d7xEvx2yh65z2KIHIeYTs06ZJyVIpdB1YKPadFrVwDbM5cOCds44pu3FfkSUgr9fpDUE
         JzJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790847592; x=1791452392;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bx4xsfGddywXzJrU7naavgZks09qhhwcWH0Cs2SkprI=;
        b=R+7AP+pFTEZIozmHdtGCe0lr4SguUWmHzI7F9Y0Tbb8RlUJB4yXvG58u5/uEb0/w9C
         k/h7HQA3J5cE4y8NrTcFDdBcNVNrLSh/MPE4uadFaAtGJY7n2+L66OV10BZiXgDlI6tH
         jOrjSPeHLplmuXib9TXcZEOocZji33iCBzdPx+SNJmOTNJWbTGtzAN641zNa6NVusB5F
         8ws8JrGpLmGkiM2NmuJPxac9Nb75+0N0iopQgvDEvFMfLX+glIlF8FGZQNTH6eH9uDqH
         njyTK9DbVlwqczrreeDsBkBOhMZoUGyp791foCO2bxdx910KVCzTqY8Sg5ACCoJTaweP
         9m0g==
X-Forwarded-Encrypted: i=1; AKwUvBwUI5PYN4r2bTpKphSnbUEG+aNUAa1Mqr66rgFuny6qt2DmrnWzjSJU04/4dZ6zd+j0x3LiJ+k7jhF/Vv8=@vger.kernel.org
X-Gm-Message-State: AFuF++mtR4axaPHgn2G9OeQcec6osfitzfDPi1QZFmiZFgZpi+JP3fHI
	jJNGHPJ2ucKYUXZLmjvnUPNDqX76/IXkayNAZRHaayKzqHBM4TosvKtWfNnz/gTukF8=
X-Gm-Gg: AYBFou2y5pOBWwVgZAiiOyfQIb2NUpiB296gN3KggqCzeXMvrrgDkDHKUeZrXss6Lng
	orxeaoEaVkwOFEBSMIFN29+hUgZ2kI2gJPoCYAEcXElbOA4MnA84bDDRpOxCAO/QuDDNbyq+2Nr
	sZWGWQiDEa7fGzmn04OmzxcdimeHxfUPSe8mL1Wgxupybz3MpRDMM2xBXjtaaIICDMnuFU4q7PR
	d3qiMZW9hOCUMi1UhpHNKxmzObhg6l6T8vAgAcYKKT3Byng9hIkbrvfjyJCjpZi7GxG6issa/tO
	1y5LOMQYdPfgMIoZ+zYCf2PZqsZPCE42AkDJIrycwdSmzl0eIYCJaCaQyY2uvYckZKwMboU4MFq
	Mi9qKKhC9gN8wKaW1fj6s90RGbSJOMarWUmQY4nBZxE3qBG4dv6LCAriEkC/pDtc7st1rYlisx/
	8GWn9kKVao7kEe3PblTZhZ9FO+vCh02r9RQkAL4fab4QZuYniRTlI+InfWi3DRhpSD5IwJWwTEe
	5hxfiFH49o=
X-Received: by 2002:a05:600c:4f50:b0:49f:e701:51c8 with SMTP id 5b1f17b1804b1-4a01afe1e3fmr87327905e9.9.1790847592358;
        Thu, 01 Oct 2026 02:39:52 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f6ef459sm39147655e9.1.2026.10.01.02.39.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 02:39:51 -0700 (PDT)
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Marcos Paulo de Souza <mpdesouza@suse.com>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Fushuai Wang <wangfushuai@baidu.com>,
	Kees Cook <kees@kernel.org>,
	Stepan Ionichev <sozdayvek@gmail.com>,
	linux-serial@vger.kernel.org,
	Manuel Lauss <manuel.lauss@gmail.com>,
	linux-kernel@vger.kernel.org,
	Petr Mladek <pmladek@suse.com>
Subject: [PATCH v3 0/1] braille: nbcon: Fix Braille console for NBCON API
Date: Thu,  1 Oct 2026 11:39:45 +0200
Message-ID: <20261001093946.112999-1-pmladek@suse.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

this is v3 patch which tries to fix Braille console driver to work
with serial console drivers ported to NBCON API.

I played with the locking. And I came up with another look.
I tried to simulate the legacy locking using the NBCON API.

IMPORTANT: I believe that it should work even in PREEMPT_RT
  because it worked with the legacy serial console drivers
  there. I think that it works because:

    + con->device_lock() is using normal spin_lock, aka rt_spin_lock().
      It should be safe in the VT context even in IRQ context.

    + The VT code can be called from the legacy loop when the related
      ttyX is registered as a console. But the legacy loop is offloaded
      to a dedicated kthread in PREEMT_RT. So, it will never be called
      in a truly atomic context there, except for panic().


Changes against v2:

  + Use con->device_lock() for non-panic case. Try even an unsafe
    acquire in panic(). This simulates the legacy locking using
    NBCON API.

  + Return when the nbcon context can't be acquired in panic().
    The NBCON API is not ready to ignore the lock. Well, it
    should never happen in practice because the unsafe acquire...

  + Avoid the newline prepend logic in all serial consoles
    ported to NBCON API which have it. Add two APIs for
    checking whether either "con" or "wctxt" is in Braille
    mode.

  + Update commit message and comments in the code.


Changes against v1:

  + Merged into one patch. It is hard to explain nbcon_braille*()
    API without the user.

  + Reworked the locking, see the commit message for more details.

  + Fixed the check of CON_NBCON_ATOMIC_UNSAFE [Sashiko]

IMPORTANT: The solution is not safe in PREEMPT_RT. But it is better
	then nothing. We could either solve it in v3. Or we could
	fix it later.

[v1] https://lore.kernel.org/r/20260922072558.98854-1-pmladek@suse.com
[v2] https://lore.kernel.org/r/20260925141729.173943-2-pmladek@suse.com

Petr Mladek (1):
  braille: nbcon: Allow to use a serial console with NBCON API as
    Braille console

 .../accessibility/braille/braille_console.c   | 64 ++++++++++++++-
 drivers/tty/serial/8250/8250_port.c           |  5 +-
 drivers/tty/serial/amba-pl011.c               |  2 +-
 drivers/tty/serial/imx.c                      |  2 +-
 drivers/tty/serial/sifive.c                   |  2 +-
 include/linux/console.h                       | 15 ++++
 kernel/printk/nbcon.c                         | 78 +++++++++++++++++++
 7 files changed, 162 insertions(+), 6 deletions(-)

-- 
2.55.0

