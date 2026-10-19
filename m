Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 536904A5C29
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 09:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792400487; cv=none; b=o90mvw3dFDL2wo9cPd+kpQ+lmNLs18W2yAPKLdVevvLsYlrByNUWhX6L4AeySzEmY63QFprtc6uBrvamSntm/0ZejXNIg4cX1w8aTYKOQbR75wvCLd69bi8dSchXqMlnQqjPH8kAdv+7ZMUGPpxUC3wEABf8oPBqWOAwMNcS4Zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792400487; c=relaxed/simple;
	bh=ISGLybjkKHk4ZABVfkFT1ydPZlLsqwmBvVyFe1NRoTY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nV5Nn30t5f2H5GtJ4SLYips23rMu/i7MGYkk0g5JFybK2zVF+W+K0r0rJGTn/RCRGm3VlPXYhmf22dxRj4hmqyPIZ0plKFB2RRZ7/G4nac7B3/7VAnvnbkyDS+mKw4X2ITCrns8RszFqvM3Q2ZtbCb+wdCafrXA5PDh2qc9bQCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f2YiBJr8; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f2YiBJr8"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a0e1b0681bso12941565e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 02:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792400484; x=1793005284; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rCjG1qUBFd8Lkeu0pATJzv+SvPg5QuT3Ybijv+USoe4=;
        b=f2YiBJr8YWgHCQ7dX3QK/a0ghLQO3tpp9SdQQWc22u0ytMEowXtccfe2dd5VECyMgg
         vFMJ28IZhKycKJlA3WkIJaHi2Qg2Bo05HrnKn7S5KYAcQRq5rE3Qqa8IAIXlGF1JCc4q
         82ZqSJ3Iir4o2u5vYFws5JgX9/U+pdyD9H2Uvp7KPRxia+TYPPL1cz2Rz1KgXuEf6mJF
         FH3NeK87d20ZLWJM509G2/ER2ApgzzT9S3mWfC2bBScqqX715tOXE2ltXQ8oeUxHNyno
         iOAKFQaLOZty1OSsVIxXJg9Hs+65FNVyU/2rTZdgmWLwPIRDo4Z9TAw3g7Ma1QlbDBNc
         aUVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792400484; x=1793005284;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rCjG1qUBFd8Lkeu0pATJzv+SvPg5QuT3Ybijv+USoe4=;
        b=FFUBCyla+Xvs2DpsruVcNrtQ9qsaj6EZZH8d/w1LwvyDXQ94HXaz4KD6u3wx0C4Xv0
         K+VDqFcdWFv6QJzLv9kOTUW6gbALhwrUYOQBbW0edeS+A5NP2gr4H/U114mErnI1Aj1x
         xw03n+24foasdLVEuLh5y4zCskAcKzeAJKh3rUz+kcfetnKJFJIqlkqK2Dpgh+hqAap1
         SjOUvV6dikMluvg6Cq5kM6d/mSxoRQzcNUEcJnEZ4Mfd+fvGPYfQN8bydhBKaJe2j62N
         Bjen2O7ftX/bFPjCaVAuWfNqlMO1uPEG8GekBdczyJ6uAdpd9C1gyP6Qai958FlZPDLm
         nTlg==
X-Forwarded-Encrypted: i=1; AKwUvBwDafUYGTNvLVWjnRRgqz6pOg8gHcAQqw2rU3a488j6QRS2CCzXo4vee7wRk03wFPKPoFlEbRAbi+NrlGk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJcBSL+KSck9Iwwpjk+rLoaoMpOtEn5DUF1YPnNRE9+lX+zrs50
	ifeJNvYug3YYoQ8P9uLL8N5859OC6284g457Kmmn+1qBAz5iAWS1xPXL
X-Gm-Gg: AYBFou2YGHxoa2joQlIl0n07W0UPGb7RwT36cvog7vyKhAIzxTJBbCe2pvLF0YDJ9Yd
	vB9RcILUjRgNYiYhHKJRPVz0njhBe3qMwPD/xjdiNRzbOY5ZbXiT7cQSv4qXr22kPHL0pXtMFP5
	zH301oDohGpXQ+ECRrJNMASh9Gb1VknDl87nEMklWE0e6rHqoBDZRgoMSaU86FmSUOl/A67Yxa8
	KzzdJr1AcmwrRTwdO2jP2G/QBZzMAiHdhSEQmvNmssJUHPNCNEf2/XU+8R2MbiB2AHew0/ULz8J
	c6v5l9puuUIeTG+tMm7HCZEW7grCmwQpfoQeXZaWmKotVUPCzH4jUHNNMDEh8JA7SMBxv3ZU4I2
	Asy+43h2pr9OEGKJL7sWWgHh8Qyj2DwxZd6Pok0qhGfNiYDm8oWd3Wbq/rlG3qkp/xN4CgOGI0O
	rkyBlQrljUxVPkJEAJ8JImjod2tKSY3eHqAjXruUG3WCMaXVs3Yys2xSeGUO/tRwFmo5ENe9nOY
	KHj
X-Received: by 2002:a05:600c:4684:b0:49c:cee0:e7c1 with SMTP id 5b1f17b1804b1-4a1d76001e9mr141175875e9.16.1792400484365;
        Mon, 19 Oct 2026 02:01:24 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1cca30aa4sm118260635e9.2.2026.10.19.02.00.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 02:01:06 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Neill Kapron <nkapron@google.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Wayne Chang <waynec@nvidia.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	Felipe Balbi <balbi@ti.com>,
	Felipe Balbi <balbi@kernel.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: [PATCH v2 0/2] usb: gadget: u_serial: flush_buffer, and keep the port for its tty
Date: Mon, 19 Oct 2026 10:58:53 +0200
Message-ID: <20261019085855.3259716-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

On a gadget whose host side does not read the port, the last close of
/dev/ttyGS* waits GS_CLOSE_TIMEOUT (15 s) for the write buffer to drain,
and tcflush(TCOFLUSH) cannot avoid that because u_serial has no
flush_buffer operation. v1 added it.

Sashiko pointed out that the hangup gserial_disconnect() schedules can
then call flush_buffer after gserial_free_line() has freed the port.
That window is older than the new callback: the tty core already reads
the freed port there, KASAN reports it in check_tty_count() with a
delay added to gs_close(). Patch 1 makes the port live as long as its
tty, with a tty_port reference taken in install and dropped in cleanup
as cdc-acm does, and carries Fixes and Cc stable. Patch 2 is v1.

Changes in v2:
- new patch 1, the port lifetime fix
- patch 2 unchanged

v1: https://lore.kernel.org/linux-usb/20261015162732.3170938-1-mehmet.fide@gmail.com/

Tested on a Verdin AM62 with KASAN and lockdep, 6.12.113 plus both
patches: with a 3 s delay in gs_close() the hangup after
gserial_free_line() no longer reports a use-after-free and the port is
freed after the tty; four function teardowns, two with the port open,
free four ports without leaks or warnings; close after tcflush returns
at once with the host not reading and the data written after the flush
arrives; 47850 flushes against a concurrent writer; NCM torn down
under iperf traffic. The same two patches run in our i.MX8MP and VF50
product images on CI rigs, gadget replug included. On usb-next both
patches build with W=1 and sparse without new warnings, each on its own.

Mehmet Fide (2):
  usb: gadget: u_serial: keep the port until its tty is released
  usb: gadget: u_serial: implement flush_buffer

 drivers/usb/gadget/function/u_serial.c | 59 +++++++++++++++++++++++++-
 1 file changed, 57 insertions(+), 2 deletions(-)


base-commit: 04ac7b445880b0878c83e6e89d961455cbea0427
-- 
2.55.0

