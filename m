Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794809164;
	b=OSsVx4uw9wW/WjnVF0X2mmYCmrfTOLV5r6NNFLXf30vzrP30HmXGvCsQU3vvjClEWTAZ
	 MYyyu987GSyBiI+ROC5GVoLXG+YqiL54XSVvAABGJDLLgTUrlPW7M/lWaDo2WdW0ZGUuV
	 vvGEEez8VuAPIAHGW4a/hWASGEUrDLj2E+xoqnqwvRiRXy0Tqxeb8WmptcAbavjskSek/
	 6objSvN843FtFn/dXWVnIyxHmxOWf5oC2Mn0KOfgKWdK4A/vVf2RgqL0utDc7dbe7/mhH
	 qQ1SrVnI36zc5Z7Bt6ykOtemMjBP3HOqncHkxnmXu6DSM8GqSb9wTyBZG1RBvNT80XA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794809164;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=TcVA95bONb+tMivknThQEKn9lgWrYbIgYGqfNotvw4E=;
	b=Yf3Fi/RJNTo2XY/KvsedXNDnEFCU0Ox0SyUsv78oIdG/HHHLE4GIdVnWXq5xdps9MzwK
	 3rTeRYrODBtV+79CvmYRaDPA4YIboI8CFY+lvLzPIhG7MzGNtinCDQHeeYbFSiNduxQKp
	 pw4pwVe92GtUXqner0xF5fVEaxvo9LwNqMdxtGt5sFs9Fg5tsvFHhZJUojWHyb0dZ8R7+
	 VtdJ/d0/yW1JvR0+EUBKzZKVrTZMKFXzfEVFtzgWOPzncvhIXubga4tEF9hMtwN0aelD6
	 Y8fwSuttwAujCEpq0WiOKjhn3DUJi69BBBLiLn5n6uJle+95gV2jv+ITlNtTec0DuZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I3HiFkEM;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8170606A88C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:05:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8170606A88C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I3HiFkEM
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1b3beeaf6f9so3419091c88.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 22:05:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794809156; x=1795413956; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TcVA95bONb+tMivknThQEKn9lgWrYbIgYGqfNotvw4E=;
        b=I3HiFkEM5j6YnxZsW4S4a08v2lAyOrxnSHXfJU9//cI9KtY3H77yp8a5qM19N1BrY1
         z0E8dwXOgrZ5ASPIl0URFd33dttT7FnrfP8Ge49GnXyO0MYHaQIqbeaPRLV/k41bQ5AC
         6JUaw9tOQasvBLdjjD5qCEU336BtKIokYzljghLLhDN/sDuqgiaQwBlbRerrsKrlAVx5
         j/oNM8Qj7EbNbik5H6VmQ9Zig+kD9KYC6vJujtjS6rTDIpsPEMbDCOIKzjlMFRFVWuEg
         hM7R4HxvTskSB1cVBFIyoxjCcsSS4dfAttEna2UfmglSbgy/P3rmRy2nQ/BBCBMyuIci
         kB4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794809156; x=1795413956;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TcVA95bONb+tMivknThQEKn9lgWrYbIgYGqfNotvw4E=;
        b=eJaLsuynniml0Td1MCWNBNK/HYDd6XToLSKtMmdofLRiEp9MXVUkSDrxSyJ6hSMZqL
         i9HuwlGIyuxQdVYDbRfUm4BXOrWANK/ARXMkcD2bScy/XxmwJFSvx3Us4tr2a3oiaW8V
         rffaKO5GTim6cZR9mnAleY9T56TJJeYtmSKtwtr98/7lLeVw3fNXeFwVxfWM6td60YUG
         bhFeDUyx1Qmw78HgLSTTSLtqwAddTO+zl/rUdMerxvYvNoAwceKaGOy1irITn6+5zlCL
         L8SaPU5VXeJjgCbR4/y3NeUxthFE2DF4ug+TnQUYOkIpwG/lUrG3sgdNNCCbA7lmvSUC
         kS6w==
X-Forwarded-Encrypted: i=1; AL+hErF6Qa+ZjQTEw8/2pGaEugEYgCoDUcMFHKph7pCQXK46eQW8Ou8tWpbYcCgjyZli36Qo4ShQzY6Rjx2Bu4Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z/F6TcwkpHqBLdxDkkueifzRY2tHikRY1Z9P1zqxhm6UKdazbS+
	kqzMUmFWfGyY05MKGIo5P9BLGjgQHEKvXPqzS3vXlUp8WhbOmVixRXTg
X-Gm-Gg: AYBFou0kH70bMaxpXss0JlDAOqybeCXm7RPA8AypXwVlu32wVYxwCcjbnPyKw/Vbs28
	xkm70LnT4RwpBQCx1Y8Kf2Stdp75oOIwdKZFlDTVsDyHJcLJAgSQnSdVJQV4qVRDPykTqh3XoFQ
	ARAxqkoy+8Z7+lVGnmqfdOMO4bFvK2fBvTENPPJR9d02jtEunMYRB6kPSxI6DZGy1UL1zw28swT
	3dowcSCP+OTrEltOwoVdh9BprUf+gX9JNAONq241N7BmeRzOOYTGiiM0YK/O5eajkuMS6KDa1Zf
	1KLI4MaLqwqXxW9HUW0vxbBiWwZF7qbP+Lv/Jqz6Wxnh8dnW+m5IkBkRxzSydyzHyvhT1PMEXMN
	vTHG5cXf+8eltF/MGI8VWHjKDJH+3Ept8qZPR6Sm4nLFrv8R6pL1s0Kl/GLRjSCPnSF78qwdubO
	SXtjeCe+VWO1IajCLMvgh9wunOe21lzuJYjN8APsxq11hrOeNRPAZpGM6SRcvLNiCieOlEz9uDH
	PrXd16Uo9FHyJDtSBJEQB56HRgGF+ZA/3pKs/cIq93kisKxWYIk/+mS/zjDN9Ak6//GX1hnL4EO
	iavTZhCVDiiav4Nth4LJjBtLdgSddkftqo/2UC7ZzoTWN3wRSi0gF5tssVPzkcECYTiK
X-Received: by 2002:a05:693c:8107:b0:36c:b7b4:407e with SMTP id 5a478bee46e88-37967cdd709mr10853578eec.22.1794809155780;
        Sun, 15 Nov 2026 22:05:55 -0800 (PST)
Received: from youngkk-vm.localdomain (67.216.200.102.16clouds.com. [67.216.200.102])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm41036110eec.19.2026.11.15.22.05.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:05:55 -0800 (PST)
From: Cheng Yongkang <teel4res@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alan Stern <stern@rowland.harvard.edu>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: usbfs: reject SETINTERFACE while suspend is allowed
Date: Sun, 15 Nov 2026 22:05:49 -0800
Message-Id: <20261116060549.370140-1-teel4res@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <36240a2c-0ecb-4b26-824d-84d782dc706e@rowland.harvard.edu>
References: <20261115163709.226641-1-teel4res@gmail.com> <36240a2c-0ecb-4b26-824d-84d782dc706e@rowland.harvard.edu>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After USBDEVFS_ALLOW_SUSPEND, a usbfs file no longer holds a runtime PM
reference and the device can be runtime suspended. When it is resumed
through reset-resume, finish_port_resume() sets USB_STATE_CONFIGURED
before usb_reset_and_verify_device() restores the altsettings. The
restore loop also runs when a driver bound to another interface calls
usb_reset_device() from its resume handler. The resume path does not
take the device lock, so a SETINTERFACE issued in that window passes
checkintf() and its usb_set_interface() runs concurrently with the
usb_set_interface() calls of the restore loop.

Fail SETINTERFACE with -EHOSTUNREACH while suspend is allowed. A
program has to call USBDEVFS_FORBID_SUSPEND or USBDEVFS_WAIT_FOR_RESUME
first, which resumes the device and keeps it from suspending until the
file allows suspend again.

Fixes: 7794f486ed0b ("usbfs: Add ioctls for runtime power management")
Suggested-by: Alan Stern <stern@rowland.harvard.edu>
Signed-off-by: Cheng Yongkang <teel4res@gmail.com>
---
I used -EHOSTUNREACH, the same error checkintf() returns for a device
that is not configured. Please tell me if another error is preferred.

 drivers/usb/core/devio.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/core/devio.c b/drivers/usb/core/devio.c
index 101cb9425480..6463ad2b1fc5 100644
--- a/drivers/usb/core/devio.c
+++ b/drivers/usb/core/devio.c
@@ -1533,6 +1533,8 @@ static int proc_setintf(struct usb_dev_state *ps, void __user *arg)
 
 	if (copy_from_user(&setintf, arg, sizeof(setintf)))
 		return -EFAULT;
+	if (ps->suspend_allowed)
+		return -EHOSTUNREACH;
 	ret = checkintf(ps, setintf.interface);
 	if (ret)
 		return ret;

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.34.1

