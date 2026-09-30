Received: from mail-pz2-f37.google.com (mail-pz2-f37.google.com [74.125.228.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 578A344F56E
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 07:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790754539; cv=none; b=Bmr1Huy8BR4pMnpjqqCnO2HSAE4g8MZRc/ngHpOPsR/7q/NvChZCMilPDHyK6dumjzWHrtfLaTu4o8RlwnTecuwmRd63OLqJ+oGAUZfO4w2zQZVeBZ0w0j+brXYgADLWXSie2jogseiKqbz7V549yVrMHyKKRhHxFFGkbJ/QM2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790754539; c=relaxed/simple;
	bh=3w5BbDKPepU8mBMOX3dhCfOjjm8w0wlAQiggXHD5Vmo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rbH/74kNDuHHy6IL+VaVZ/laac2mZugRgROnm+5DI/SwGDmMmOjTLpFYKkC7j635rfKVAuzBRmzhaxwEZ00H2xOoJFRT4mIL+8Ou0yUo3e6v62z6gfM8ycUGagBc6k1pHpQTfSNpwYdEKwuFDeezTSaRVYFh1SdKMF/bvYiakEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=omxj08JE; arc=none smtp.client-ip=74.125.228.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="omxj08JE"
Received: by mail-pz2-f37.google.com with SMTP id 41be03b00d2f7-cc7d27b7410so458799a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 00:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790754534; x=1791359334; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pV8LsaTP1EHfiM4Wd101Evv/UuZGOjLB8O3Pkph9NAU=;
        b=omxj08JEnqExWRadrfKRD3QoJ6F4Dpq0DD8hmeZYqC44KVa8pndlpPRzn8331Lq1JJ
         rukBevIlOA7GCch7qNd5kErB/UEw3EPLyJhoAekxeP/2+dusPVW0yBwaQK/RWSQgqkTc
         77MU9OKaMPQcgCyB73OFCG2xfxSExkGqMhZoIJdbLhdcd9jyUY/TS4dvSvTR70OYrkuM
         Wh1LGgwFvYhOM1invYUhiJCMoxU/PBCiORZ4c+Qga/yzJP07pcKjNJYl4qiKHOHubWX5
         TunmJEIkKtPWAwCVJHDko0YXvLbEHNmB2bQQq1SgpkzQIoEcVgXC1z3U9IfauaLER4eb
         o5UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790754534; x=1791359334;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pV8LsaTP1EHfiM4Wd101Evv/UuZGOjLB8O3Pkph9NAU=;
        b=eTRLhotWR5Eqa/rT4SuIpO5VNf3K2ZgOItNZec6cIhuBkecUUB/wnq7saVD0qAdefW
         7VvQNmvwgI90pMHApxmdhjHIWjUcQRW0y2LKYZnN4WDL3kNbte9QCSh0MnZ7bt6CtCSC
         JCYcIhebys8f0sGOV9l4wushLjVQO3Ny+Lpf9TM+TdladZYkuUFMaEBVIVbkcYz+WQ4L
         HsRezSTWt8c2O7FiLKF9Q2fwaCXQdqIBiVMuTF0fspxj5g5cy3ti+Gr0UO7Se0MY3mam
         jne3NY07VUEYvRst4TUdfLk+mKQUaKA+I2bothCqKELi8aodwaXBib9vxVskohCdH/NB
         H5nQ==
X-Forwarded-Encrypted: i=1; AKwUvBwKwPvZz4L1jb3SqybwvtYSobOdUI9G0ywTAN+WEFGZrQ+yxtkIcq8Vlph4EhzfSPEFJoNGskS2kUKPDYc=@vger.kernel.org
X-Gm-Message-State: AFuF++kVOJKlE7i4P/J2HR9zgm8Nj9tuXkmbGMzIfK7ZpcQYFXFSciux
	j0kyYNhsLrYJs3gDikMGm5JCn+QplWBY6eMlp6TZfrQnwoCScwh/CFkd
X-Gm-Gg: AYBFou2CAGNXfBMC8Aoay5d98eyiNspUbjykNlwfPiZ7s1KOMcD0A1zfoWMZImEWM0p
	hDL7ktdjx2KSxjJNrS4UmcGUh4mw4MEi8c0EyPvp5TjISpz8y7rl9JxBSGaxKx/A0NwwG0PV3xV
	43xpeUt3JSXvXfTm2NaUtfjENYpmTSpi6g1DCE4qD65Myx0qHX+AePB4B6+ChlbuGhMwjFJV7aB
	bsiaOzWKUb/qsQqjwI+CTUkfxHoa/QROxTiO+SaiC8QMJmFoU+CFkU4NRMg2t/HlcvDsbgAhFcZ
	qwWi3PdFmx1QjJ1sJkGxU8cnLrDdXQ0vIYjieDd/I5kuNGtWYpbkSMWxMdVzPFfTZP1sG8e3ApW
	BcSLt4DPjOkqXt0YhWsr/zrjE3mPZuDzyf0r2jv4uI0dackS/tjpHCDln0iPUp91HZtSfB5aPBZ
	sJ/+fJ4ErVfSPHOHL8dAJXLoqLrTgBwYGuCfgClEPGNPqaUNjw6shb6IeVh8rXCbXXUqWj2BLxg
	EgdCdX9RuZVj9K9jmvQ/iPKRInTkS7zAdptld00xJ+J325hiHJ0/Q0TJ4qZLrgkoyAdLxJ6KLcI
	UyCqQzr7fA==
X-Received: by 2002:a05:6a21:7001:b0:3de:557e:5ea6 with SMTP id adf61e73a8af0-3de9e8093acmr677760637.27.1790754533970;
        Wed, 30 Sep 2026 00:48:53 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (25.187.82.34.bc.googleusercontent.com. [34.82.187.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88725881fa6sm376732b3a.27.2026.09.30.00.48.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 00:48:53 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	John Ogness <john.ogness@linutronix.de>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hui Peng <benquike@gmail.com>
Subject: [PATCH v6 1/3] serial: 8250: fix deadlock in serial8250_register_ports()
Date: Wed, 30 Sep 2026 07:48:48 +0000
Message-ID: <20260930074850.465003-2-benquike@gmail.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
In-Reply-To: <20260930074850.465003-1-benquike@gmail.com>
References: <20260930074850.465003-1-benquike@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In serial8250_register_ports(), mutex_lock(&hash_mutex) is acquired while
holding spinlock_t serial_port_lock during IRQ chain registration:

  spin_lock_irqsave(&serial_port_lock, flags);
  mutex_lock(&hash_mutex);

Acquiring a sleeping mutex while holding a spinlock causes a
sleeping-while-atomic bug and potential deadlock.

Replace mutex_lock(&hash_mutex) with spin_lock_irqsave() in
serial8250_register_ports().

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
 drivers/tty/serial/8250/8250_core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_core.c b/drivers/tty/serial/8250/8250_core.c
index 9e4f5a2a2eaa..f64a1b0a2eaa 100644
--- a/drivers/tty/serial/8250/8250_core.c
+++ b/drivers/tty/serial/8250/8250_core.c
@@ -102,9 +102,9 @@ static void serial8250_register_ports(struct uart_driver *drv,
 	struct uart_8250_port *up;

 	for (i = 0; i < nr; i++) {
-		up = &serial8250_ports[i];
+		up = &serial8250_ports[i];
 		up->port.dev = dev;
 	}
 }
