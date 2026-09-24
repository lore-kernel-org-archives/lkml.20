Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAF0740DB47
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 06:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790232935; cv=none; b=KyEGQ/Jq90sWbYtpHERv15G0nWKHxf2QpLH2gXJWmS9JtKmHirRORURPbV2lY/tLINFwBABdNq8Ajddr7o1FRVNnntciYtxz6DyuXZBJIfEeSmpgfVzlZZE89LM9cctlJf6gvydMnutq6weOZbupHx0THKLyDRzWC+6xSJxGnSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790232935; c=relaxed/simple;
	bh=S1ifroC1rn1KTqaVlaVfiVWIPiuDCmVpTK19OnYuAgU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=al2W7HmctaYMwUjSLvBz7cm4DIk1xCMyjhiG1T43g7KbJkpiwNXQ7y7TloJkhxCLqwrOt+SPK54sS052/YLFcnuxaisyOC3NJMNKQ66gCgAYm1DrdOdxLD4ZfCSAA/uLQ7hEpt/rosHsMgdPYdEgMWhPfCksiu9RI1bJuVUTbNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aWUC+DTC; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aWUC+DTC"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1ceb47d53so384158a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 23:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790232913; x=1790837713; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PIMJm+VCyEzSCDqSRZoYpvVJ5wMLjOdy3cRjV6Xlh64=;
        b=aWUC+DTCBNMvly2U1S3s0LXaor/YZTPC7zwq++FYl9N1YfvDd+edg2AbbFHA7cVccc
         w5Hq4nzO7pgDM/nEpkeoua0JBIhhJ4yXgDVOaE4I6nOF04Dqo78SxNa2eH1ovnKbKlsm
         JDOa+1YADyv+XlFUriHhX6rBqSwwCH0mtkgnkQ4NMY70R3oPVmWa3ivqXV/1zyBam3p0
         y6g6ZGb0pzTj/Xk23so8fl7rLmP1q+41veRhde9MenqxtwXTejJI/M1d1J+st3QCGLCv
         R1pCK+C6uiH/iEuv+wLF67U6zszukchwnKHaQsghlKFS/woNrzClZyoeASRqkbiwigXy
         GDvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790232913; x=1790837713;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PIMJm+VCyEzSCDqSRZoYpvVJ5wMLjOdy3cRjV6Xlh64=;
        b=vju2Tr7rA40UHR+kFA4n8WztL8mq5TTi3tQ9InXfafoozwE3fbdlKWc2+TUdlIZUC1
         3VUwH/KvbqfZF5Uct92Ma1u/2LNgIPw5OeaUhtRm7yWKMmGMJZahWPgkdKZQWmX8u3Qa
         6ZTABaF0NjnOFQLy91cLq4M4oZrB7Mu2cpaS5A2QzzfUfDXUhyA/3sThA0W6bWVwbrhx
         FeqdQLmjufMQUSgrdD8ye50Lb4+mAeXQOfB94LD6tx8ZZ7CfVEz50k7bSsQvA4M7z/V6
         mhjK6PzpMijlHjcIrVoLyB+R5P1mN++zRhyh54viYHrK4Ld8PBHIGNTFNA5c+Ic7pHvi
         vwIA==
X-Forwarded-Encrypted: i=1; AKwUvBxgUxiLJ+1zvzPSYy2Olfxur9FeaqpbgVtagpYPrnmYh0IGGmU3aAgRBPJnBR3tqfoFtKcZlaJgbIffOWg=@vger.kernel.org
X-Gm-Message-State: AFuF++leQqIMi9W3xDjqNrBG241MfhZmijqMHw0LS3K2ETElB1Lo9E3D
	wf0/UDZDvn6Jzw49gaL1qoqMxpFCHLx4CUk2SG9gVwrJ+4bSO5lX9cbp
X-Gm-Gg: AYBFou0Kavct7mgojNtSlc8AHP0dAEMW/DhF9d2Z3YS95KxdOh/1wkPOybCGCWHjUds
	D1aXqjf4v/heNKkS9PWDdZD3HF9y5GKLrdrsHmJTtcNc9Z33rkTu0msWgs2AQz/oHbpeafA13EK
	+Ipvb8wQ1+DO3cGmD4d22DSiBt9FOVxhrxtmH0ccnz8+0rjOpqc9KeSj2lhvK1FnX0o+n7VJISX
	CGv90phobqHngItrIOrPhVgPJKIR2RIEtEMesL7v/84zxkw6RjdhMOSEnYycfy5Ul0r1fX/iCOA
	zJum8FdO0JvIvUQAKBkDdzM2U5BA7NfmrpX+ERAu4HJ67WqgKgqwEZO6A5Hv2KjRgpizpHfCiyu
	vjh3vQVQhi1VIlabCQEd24FYUJFhl+j47zVTFIRV+TIaI5MBPWSyKhd/aGi1/JzW8C1W8mO5ruT
	eymKlkVYkaBs9kKmwP1yyODr5W2Qx23O6LVZ0LmSGLi6F9cz+ldBOgAwYqT0azS0+oI/EvFUz38
	47K2T0PN5oPQn2J3+l0pSwSWVcO+00RWjCckl+DnBe3tU8SI7VWi2xcCnMycFfTIINQUYujrpfH
	hJzDFi+USQ==
X-Received: by 2002:a17:90b:564d:b0:39e:6c66:cbdd with SMTP id 98e67ed59e1d1-3a098acb900mr899575a91.21.1790232912472;
        Wed, 23 Sep 2026 23:55:12 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (67.51.127.34.bc.googleusercontent.com. [34.127.51.67])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a096a61d9bsm3218143a91.0.2026.09.23.23.55.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 23:55:12 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: gregkh@linuxfoundation.org
Cc: jirislaby@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hui Peng <benquike@gmail.com>
Subject: [PATCH v4 3/3] serial: core: reject baud_base values that overflow port->uartclk in uart_set_info()
Date: Thu, 24 Sep 2026 06:54:42 +0000
Message-ID: <20260924065510.2587569-1-benquike@gmail.com>
X-Mailer: git-send-email 2.56.0.rc1.310.g51773c2048-goog
In-Reply-To: <2026092417-seducing-stank-af6d@gregkh>
References: <20260924060511.2364717-1-benquike@gmail.com> <2026092417-seducing-stank-af6d@gregkh>
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

Reject new_info->baud_base > UINT_MAX / 16 before multiplying by 16 in
uart_set_info().

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
Changes in v4:
- Check new_info->baud_base > UINT_MAX / 16 before multiplying by 16,
  as suggested by Ilpo Järvinen.

Changes in v3:
- Add missing #include <linux/limits.h> for UINT_MAX and move the
  new_info->baud_base > UINT_MAX / 16 check to the uartclk == 0 check, as
  suggested by Ilpo Järvinen.

 drivers/tty/serial/serial_core.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/serial_core.c b/drivers/tty/serial/serial_core.c
index 95774b0f1484..75bb1eaa27e7 100644
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
@@ -931,8 +932,13 @@ static int uart_set_info(struct tty_struct *tty, struct tty_port *port,
 	old_custom_divisor = uport->custom_divisor;
 
 	if (!(uport->flags & UPF_FIXED_PORT)) {
-		unsigned int uartclk = new_info->baud_base * 16;
+		unsigned int uartclk;
+
 		/* check needs to be done here before other settings made */
+		if (new_info->baud_base > UINT_MAX / 16)
+			return -EINVAL;
+
+		uartclk = new_info->baud_base * 16;
 		if (uartclk == 0)
 			return -EINVAL;
 	}
-- 
2.55.0.1082.g2b9226bbc0-goog
