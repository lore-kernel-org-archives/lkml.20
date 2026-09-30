Received: from mail-pz2-f38.google.com (mail-pz2-f38.google.com [74.125.228.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 514F93BBFAF
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 07:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790754541; cv=none; b=GDCEpqCcyRljCVEgPByvmDspEtyulkIv5f2txLwXG+/OnWGiIZR+o2tR6YCoxWHrE6byhloV1oCxQ9xpnyKcxRyct69hNAO0ctIcWu4xgx0o/TaKU8CNBah+03NKVy9pvanSv3F5Bo/ysPyT5quZR9CeD4j74S0vDztZ6OBJzqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790754541; c=relaxed/simple;
	bh=uGsfs2DK/8iKOR0jIBI43Dd61dqBAmynhEDo4Fw0n6g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Vtt15PqiWUroenLjUu/CTsh+I5DDFgA1R9If0uYH0s/eKJFJjrwChR6hnH1n9Wk0uflI5JjiBaCvR3wOWksuq1HDDg8fMEzR1aDBR+39Y16llOmEoBYGc630x5dcEi96949bZT8CXOSSqyN4PyTXftZsCMl7XyxGGSiB4VywSis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MCgUqWe2; arc=none smtp.client-ip=74.125.228.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MCgUqWe2"
Received: by mail-pz2-f38.google.com with SMTP id d2e1a72fcca58-88379342f7fso1934706b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 00:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790754535; x=1791359335; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CLNiYBnWBySrGmvyKG0sfUJh2e5Yl6VfGdIE3Jf5vdA=;
        b=MCgUqWe229jck/GKLd8NY5iqGSRf6cOkLmeW2bXJynXMjZwE2bL6maMLCnTsHKZ1lt
         8N9vTpPmE9VAUO3m2cWYCIyK50itSzTsiJoSy8u8YpsmTKQ5zUgVfgZdQgasVOXAAbMs
         bApMZ6gsBZcxH79DUzZutqF1ClUB2OuCO1wiKmdGOjFRImbnI1/OkMeV8OJ8ZUP+8kw6
         N5Qfx/c6EZJu6BxACdkz6GPrMm6HrouhOyALGDtkOqHIgtXDUwiUegxzJl/lfhZL1uVq
         0F1pqzV2EfCwAjlMW7+PPOv5AJ2NeDkcKVkYwREmQkJSeGxWVxnC8oi0RAr2BwNjKpdf
         6s0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790754535; x=1791359335;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CLNiYBnWBySrGmvyKG0sfUJh2e5Yl6VfGdIE3Jf5vdA=;
        b=WN94BsmLLJrAB/lL46sEh99IVBtXAIM6vhxFg0AMjGt7C3pOH8pYWpTXLQbDX0Mwce
         aDZkVpHwhK4ZWUz5/UITAcpv3cwCUAE8MkxlVFGmi7PQpUNm1K21jlsBjPSS33UQ2XzP
         k6J0fB1R5+wbCEVQQq/RULWHcALXolP+5ro0yX2bsY0/+8KgdYlDFl1FpRslC5gFNdW3
         jwsw+qVt5VF4x5ybDe1ynB+wfGbe1qQV84DmRcfStp7Z0IZ6/01xx76M+lRL8dX3YoIH
         5cpTfK8ecrixNz9LHH99SkGYCHO+wsWYnxIm1Vqv+xlbbgDgxxNM2ZidnmAbhn8gSl+j
         OiZQ==
X-Forwarded-Encrypted: i=1; AKwUvBwxzNuM6HOB4YZ33bxnqVg4zzDkVGHplDPiyjbNFRv/JnBn2nWD+DIEariz/MXcbtxjD7S6Ug1MKsn0C68=@vger.kernel.org
X-Gm-Message-State: AFuF++mfnYijkx3BCIF705qDfg87kN0Eh+Qbimj2lS6rvPwCFn03djEq
	16z9EvyLCp4yaaHlAbu+IG3LgYgCaeaGYTsBA7EfQbNVxzF3BG99B50/
X-Gm-Gg: AYBFou1OtHpphIJyN6GFkyMiXhtaayIDs+dP2ssQ1i6WnSyhNM6seonL70NKT+8SahT
	qaOa//BiXg9j1D+rLPcLv6/P2I0Dc0wTC1ovIHI+JLrIqyXWw+/8vIhNqb5rrIMCRUHPLGYdqy+
	mGEh6gdvj6jlktWUrZFr0daJHFjHWpEqrksMFTwh8L80YkngBgtqbe5Nof4YhxvoRiBDHA/8LHm
	vkypzvuZs4HN2MuZ/4cWnK/bgwDW3JIb5NHexImuZuUEqR6f2mWfB01rf2zodA1HQgKCsQik9LT
	qYfX5cc6OEeQddoFB7MSv3ZnYZkV9wEcJ/6cdJ5w+/gt9X+nA80N3dcO9UIXF0Fbb9y2IwAyuwS
	6ulPWkd6q7rg/q79wZUHct8QSue9FnbZRo6zSfl73YJGheh7OAKFiYxTb6m1APBjQAYtT1qr47m
	jFsCRj2ORQ7H1oKuciw1MaNsHPWfrGg1NHmWwGQ9okbCfaS62vA7MsPdtrR+yCu4G3Jdg4Obp5U
	sWhY4FraLJbR7B3+xCu3EdMCMFeCNMMMMG6sLwKgguvmpJo8nmje7jRdtXd3E2G+c9vbpJEbI3j
	kQX3Af+SlQ==
X-Received: by 2002:a05:6a00:4b07:b0:886:8600:97e7 with SMTP id d2e1a72fcca58-8874a4b0f01mr385952b3a.27.1790754535369;
        Wed, 30 Sep 2026 00:48:55 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (25.187.82.34.bc.googleusercontent.com. [34.82.187.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88725881fa6sm376732b3a.27.2026.09.30.00.48.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 00:48:54 -0700 (PDT)
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
Subject: [PATCH v6 3/3] serial: core: reject baud_base values that overflow port->uartclk in uart_set_info()
Date: Wed, 30 Sep 2026 07:48:50 +0000
Message-ID: <20260930074850.465003-4-benquike@gmail.com>
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

In uart_set_info(), new_info->baud_base is multiplied by 16 and stored in
uport->uartclk (an unsigned int):

  uport->uartclk = new_info->baud_base * 16;

While uart_set_info() checks if (uartclk == 0), when new_info->baud_base
exceeds UINT_MAX / 16 with low bits set (for example, 0x10000001),
multiplying by 16 wraps around in 32-bit unsigned arithmetic to a small
non-zero value (16), bypassing uartclk == 0 and setting uport->uartclk = 16.

Use check_mul_overflow(new_info->baud_base, 16, &uartclk) in
uart_set_info() to reject baud_base values that overflow 32-bit unsigned
arithmetic.

Tested in QEMU against Linux 7.3.0-rc3 by calling ioctl(fd, TIOCSSERIAL,
&ss) with ss.baud_base = 0x10000001 on /dev/ttyS1: on the unfixed kernel
TIOCSSERIAL succeeds (ret = 0) and wraps uport->uartclk to 16
(TIOCGSERIAL reports baud_base = 1), whereas with the fix applied
TIOCSSERIAL returns -EINVAL and preserves the existing uport->uartclk.

Fixes: 6eabce6608d6 ("serial: core: check uartclk for zero to avoid divide by zero")
Cc: stable@vger.kernel.org
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
Changes in v6:
- Use check_mul_overflow() as suggested by Jiri Slaby.

Changes in v5:
- Collect Reviewed-by from Ilpo Järvinen.

 drivers/tty/serial/serial_core.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/tty/serial/serial_core.c b/drivers/tty/serial/serial_core.c
index 95774b0f1484..75bb1eaa27e7 100644
--- a/drivers/tty/serial/serial_core.c
+++ b/drivers/tty/serial/serial_core.c
@@ -935,11 +935,6 @@ static int uart_set_info(struct tty_struct *tty, struct tty_port *port,
 		unsigned int uartclk;

 		/* check needs to be done here before other settings made */
-		if (new_info->baud_base > UINT_MAX / 16)
-			return -EINVAL;
-
-		uartclk = new_info->baud_base * 16;
-		if (uartclk == 0)
+		if (check_mul_overflow(new_info->baud_base, 16, &uartclk) || !uartclk)
 			return -EINVAL;
 	}

-- 
2.47.3
