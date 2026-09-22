Received: from mail-pj2-f41.google.com (mail-pj2-f41.google.com [74.125.227.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3FCB433BCE
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 08:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790065923; cv=none; b=sC89f1/OR/WsQe5wUFOWLYdR2ZS/QqQjWDgACxNpiMcxDrQmila0vugs46L31cxSiRziBLawLhentbluELzSw4gvCqBN9W8o6sbu3aqNAI2a/K3T5CMOpEL+Qg82LfymKQjUCWIRHlLnwiVdCySIPb1jSnqHNmHNIhTVMKQTuNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790065923; c=relaxed/simple;
	bh=+hb6WhVGSbxazqPNFCzPE7V0omcNMJ90KZH/aleX+Cg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YLjGYofeG4912tRI+KAoYHzMsSSQl1zoN146WHFNFtBBebc+xw5+SrbardhhdIlJ6w5ii7c1c8uak+w6L8+Ly+t43vh+krNQrMS4nxPYPMgq+HvGvOgCpVPgflsLNPQM5J3JKALPUw3ig9tJd1HMJw3HD3grniqHGfLlsKIFg0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=msA5QAbD; arc=none smtp.client-ip=74.125.227.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="msA5QAbD"
Received: by mail-pj2-f41.google.com with SMTP id d9443c01a7336-2d91a931f66so27292805ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 01:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790065917; x=1790670717; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=a7VfkeZl7fPR5dTy6nweVWt5o/UsHxB20RTbQxUVJM8=;
        b=msA5QAbDTQiTHal9jp2jcWdZDd+NqRdbjjMox47NYi2L8nwDgRc8o9RLGvJou+DQs4
         HtRl/wORNBY86OoAQoeJBsVwWkhQj5hMrlIG9SyCRYMc4QA7hs7KpJ08FRRNlNS6IRtD
         f4NRYZIQafVir12mBbzVgjZ3/2cnuaei5ix70SF9UHfOSWHL7ROK9Ht4LRPF9K0n9x6S
         Oy9O7cLev+0QHHvti4cUkOO2/FW/lbpnICDruCe1rm2zzcUfvVJUm9Rj+i5cLI56oovh
         ERx8NefDAlcGFb1DvHLozW+V5kwOccWkGGeh919+Y6vzgXn7qRs4YTIr4QqVmOF8trPi
         1BXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790065917; x=1790670717;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a7VfkeZl7fPR5dTy6nweVWt5o/UsHxB20RTbQxUVJM8=;
        b=yVdDX/45EpLoYtuUSyjbLgniqA2ooswZuX5gzCrfcDDqmGAb8nSOdlI574uQwD2Nd7
         QY27WyNfhF7scwL4kraKNNW1y+EfhbTNKXVVazT8fkKp4Ctw3jTX+fRrPgOttfip50AW
         PM31I223tjz143ojKhvIj2QoP6j5qn2qoP0uj6WnfcDVPvqn2oceis/IeBBJzy+7XzNi
         uI3+4+7SH+UjxsBy7iId5b0GBbJHHsTb2BZ5SgKzbKF6opAW8n8rcgwJR2wCjEStGakB
         EZoezeNnZiAJZ+PEmxuZaqD+9iG3xgOiYRiCfWJDJ4L9Pxp3x7VOdte/gPOb7UKGjVPk
         W3KA==
X-Forwarded-Encrypted: i=1; AKwUvBzmvdwOVpZ/wlhK4uYHAYhfOy9/9ApggwM8vftB+pOcK3jnw03fKBIOEkZ2P0VPWQj/qV1wY5KvprSlZI4=@vger.kernel.org
X-Gm-Message-State: AFuF++lajMZuERstMfo2QrmnpDUru9oH+HYG07QLC6t7cDAurbNGAmAL
	JbUyjEJl7o8folrlR4J9mTGBRcL+bvk3CibVlK71BkndS0QchdgpsSnl
X-Gm-Gg: AYBFou0SPJzqI8dsMeN4pefF2VbICWhvXvSPetE5LYwpupUuOoBBsKFsnXSJg/5btjO
	pj+V5pSBlBAfjDeo+r2ZTnmgsfLCqClpCX4nFXRMwzdXSMEaVYsL6K4dHeYljrWM63jkI88WY7+
	xWAYR1UqPGuDfg0/S3f1m/sGFyjqvLWxWjhwpvsC0xT3j7E0EUbDmfAt75dfaofZ3n2548W00eg
	E3hTiqPAEktuIGlv50uAzRfai40ln+HadgQqaAYS3ZELQdSZRqOxOeEF09X8i1w9qUPcql40nfR
	LIfIu7Id2P1quqLiH/WYNvPdKhKp6NHQiKnSTNb922z8hMI9sJSF1nKt1pM9mcbgNwMm/Pod/ZQ
	BusHlSNxH4qSTXWuABg1I5GDXJrb4HgcbSAWn+iYsPQkjaVeewRCd5R5nfuBMGfhdk++hf0LLdR
	0xMEsVs9XfIkqvZGFZ8c/cRmolOxzjwJeMN0OSMWSxEtXvVMSvhHYN6PbWVyYj04U48rSCIa+Ql
	795EiuLKQ5ldOMMNk2YNBY6rlL/kT0yO4qH9Bnm4xIAofLjg0AmwG8twiYTYZTC4equP9xR+wmI
	C6azzzxbiQ==
X-Received: by 2002:a17:902:ce85:b0:2dd:ad74:6d1d with SMTP id d9443c01a7336-2df60adefe3mr5279055ad.26.1790065916879;
        Tue, 22 Sep 2026 01:31:56 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (78.123.83.34.bc.googleusercontent.com. [34.83.123.78])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df5d0197d3sm5848175ad.13.2026.09.22.01.31.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 01:31:56 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	John Ogness <john.ogness@linutronix.de>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hui Peng <benquike@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v3 3/3] serial: core: reject baud_base values that overflow port->uartclk in uart_set_info()
Date: Tue, 22 Sep 2026 08:30:51 +0000
Message-ID: <20260922083152.4055969-4-benquike@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
In-Reply-To: <20260922083152.4055969-1-benquike@gmail.com>
References: <20260922083152.4055969-1-benquike@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In uart_set_info(), new_info->baud_base is multiplied by 16 and stored in
uport->uartclk (an unsigned int):

  uport->uartclk = new_info->baud_base * 16;

While uart_set_info() checks if (uartclk == 0) and
if (new_info->baud_base < 9600), when new_info->baud_base exceeds
UINT_MAX / 16 with low bits set (for example, 0x10000001), multiplying
by 16 wraps around in 32-bit unsigned arithmetic to a small non-zero value
(16), bypassing both uartclk == 0 and new_info->baud_base < 9600 and
setting uport->uartclk = 16 (baud_base = 1, well below the required
minimum of 9600 * 16).

Reject new_info->baud_base > UINT_MAX / 16 alongside the uartclk == 0
check in uart_set_info().

Tested in QEMU against Linux 7.3.0-rc3 by calling ioctl(fd, TIOCSSERIAL,
&ss) with ss.baud_base = 0x10000001 on /dev/ttyS1: on the unfixed kernel
TIOCSSERIAL succeeds (ret = 0) and wraps uport->uartclk to 16
(TIOCGSERIAL reports baud_base = 1), whereas with the fix applied
TIOCSSERIAL returns -EINVAL and preserves the existing uport->uartclk.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Fixes: 6eabce6608d6 ("serial: core: check uartclk for zero to avoid divide by zero")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
Changes in v3:
- Add missing #include <linux/limits.h> for UINT_MAX and move the
  new_info->baud_base > UINT_MAX / 16 check to the uartclk == 0 check, as
  suggested by Ilpo Järvinen.

Changes in v2:
- Split out into patch 3/3 of the series, add Cc: stable@vger.kernel.org,
  and document the QEMU test method, as requested by Greg Kroah-Hartman.

 drivers/tty/serial/serial_core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/serial_core.c b/drivers/tty/serial/serial_core.c
index 3845fb582f45..362dd6648ba4 100644
--- a/drivers/tty/serial/serial_core.c
+++ b/drivers/tty/serial/serial_core.c
@@ -16,6 +16,7 @@
 #include <linux/console.h>
 #include <linux/gpio/consumer.h>
 #include <linux/kernel.h>
+#include <linux/limits.h>
 #include <linux/of.h>
 #include <linux/pm_runtime.h>
 #include <linux/proc_fs.h>
@@ -933,7 +934,7 @@ static int uart_set_info(struct tty_struct *tty, struct tty_port *port,
 	if (!(uport->flags & UPF_FIXED_PORT)) {
 		unsigned int uartclk = new_info->baud_base * 16;
 		/* check needs to be done here before other settings made */
-		if (uartclk == 0)
+		if (uartclk == 0 || new_info->baud_base > UINT_MAX / 16)
 			return -EINVAL;
 	}
 	if (!capable(CAP_SYS_ADMIN)) {
-- 
2.49.0
