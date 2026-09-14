Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 272C33CBE91
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 06:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789367150; cv=none; b=e2akfPAnPHmK8glZdS8LuFHw+fK2Iu3T6kUk98MpPOGbNbM1YvvEWliLARID3LM2gFwpr8UJYVm2JLn2Pfj2F++gBUU3THhBX3dGJNrsLvswV2M2p+bEq313gUqJ5gF7P3Plca33igi6CmZyqjtzzPqOoP4Ss53H3c5irCzqHOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789367150; c=relaxed/simple;
	bh=kN1lSbjIXGtYVjRZzv36Jl4TYb0u8lqSGAmgGGbbACY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=q0aqlfiXepe/8dMGSZk90Nr5ZaaVyfIylK7BdsEYbZBzlOz2SG1Hd7VBxeoDCLD/P95xOIqndQSC9VzOgu1pfhZs4n5DBl+2SEz9rn5s5dP/Mb0QhJAlQPM6vLfoXetE6TKwuhuKfhBNik9J8C9DTG8vvcvl3OSKUYbESL83hBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H1aBeT21; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H1aBeT21"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccff31419so13143355e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 23:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789367147; x=1789971947; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aBXNv1lSxXwyWRvGKG9Ghkw5h9O4t3gDjRjhLQZsYa8=;
        b=H1aBeT21GF81MnnN43mD8KFKA5EMlu7vk+vNlZjKor2XUDxtaziAISr0ucvE08xxh9
         aZcXwkpxI0zDIpa2vIhjAk2YfvmvqkKxe2qIw1pBCfuFFNqoNyD5GjExt1njq9JrfwjX
         hj9qast6UoDmIBpPW1fskB9c/PLHNY5w+wADFcTAp2fFqHEaW4OCVYHMrq/MRYgzKtT0
         7Vkr9UXYqbSRd4eHNJ/1u5bAZGClVWJYivwsRNDziodVi57cPMZy1doEHJLsg7XtWviD
         L6YHZZ3IW3nJVAgeEZYpkgjoKzWKXaeEw7z704fUJGMXR0vK0UW4/oAuiTHt3VUkRwBQ
         BC7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789367147; x=1789971947;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aBXNv1lSxXwyWRvGKG9Ghkw5h9O4t3gDjRjhLQZsYa8=;
        b=rzPrif5xtXo135q7Ehq+7SL/6d3vWwujCCAK0dzRGITwvWlV2joRUrAzSrxE/mORMk
         Ry5My9D9quADf5C3n1Ss6YHNkKrtIZEdLhwuMMxGkPIbi6pGvdz9Cxx+dNyWTXcvJvJy
         +qxv8MHgJD36zKPUCGaYhBNPjCjqVuMt67SY/CQFjTJU2t9o4GmUYwL5qqroMOhXRPiZ
         weuNaiFUx4wDP9o1iteJX4JDuOv1MtsGrhH5uUkAP+oaM2hW78XlYNFwDVwy8EZLnCgY
         Lre34/y5M/EW+8zKZQ1fi3TDampdIvpwFnPPgDahcZtMLHeHBEw1d7Fi8upIuHYHlr8B
         svOw==
X-Forwarded-Encrypted: i=1; AKwUvByWOclhWFLucPLToGy/Vhnf+NS1Uam+dzHPPGpZANU7nYJZ2g5Vu9W+hh7P0MFd5mgkXedJJ2p25eNOI9A=@vger.kernel.org
X-Gm-Message-State: AFuF++lX7JPRVu3D3lTaAljXAJF1HzARPqKuL0IRqQP5bLNTDMOt2jQi
	7N7jpVqTyExgs7LcgVizdu5BFMZrkPt700Z34auq1tT+VaPOWgZwpR5R
X-Gm-Gg: AYBFou0vB45bmYYHfXkySKUiX3RzoCfLbMXKYJc5SXnKbKHwCmgZYlSATtJr0Bv3nSJ
	xofHzOw3n6OSf/Ma9/e994xNrsZURssoZiym+QiywoDu3EZHOQO5NPDtGNpEOVAB7xYrvWheVEk
	g+5Xy6Bs30rrM9HBXVdaAQIG15KQDYHVG2FQuyXzsc3QAdfWdBpZi0Ieg0DgF+lxr8Yc9PaJHjy
	JGqyeW9ydjLb0Fsn/Dukma2UStvK9QgzCe6SotuaSEYs9qgh8UIwa5ceogYdwyvBfRI0yRCXTSZ
	DUlmUafLooICYfNYBSicJv+6cwfpH9XQsuoBCEq7ZbPBaWQYEWeX6RMAv6B7o0WcDV0wnAcsGb5
	KEzAqvy/K0xkHOEVSwlK7nACYmRlQDNxslQ32HFfZE3Ts8JyCfGZVcO7gKtN3/m8j6aQZ+yiC90
	hRdxLT2dfQ6qo1q1Z0/DFhGIhL2P/1G8qWCDF5U0iOm+5POH/H7aWwYKd0K4mHWpKAhpGxXnwsH
	dAbWHXs4mz89nvFC13Dc1ZoTNVsoV6og2lfgvaqZzTzOnwFOo1XLiax34RSoYHwLkDjIb4X/8z1
	TS8eHYHugyMxaWqTAfi/CqeY29P7LX4h37qD
X-Received: by 2002:a05:600c:310d:b0:49c:fff9:f684 with SMTP id 5b1f17b1804b1-49e7a68c953mr10965725e9.21.1789367147223;
        Sun, 13 Sep 2026 23:25:47 -0700 (PDT)
Received: from localhost.localdomain (dynamic-077-007-122-014.77.7.pool.telefonica.de. [77.7.122.14])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e60946249sm316140715e9.0.2026.09.13.23.25.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 13 Sep 2026 23:25:46 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Eddie James <eajames@linux.ibm.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Ninad Palsule <ninad@linux.ibm.com>,
	Joel Stanley <joel@jms.id.au>,
	linux-fsi@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] fsi: i2cr-scom: Return -EFAULT on usercopy failures
Date: Mon, 14 Sep 2026 08:24:26 +0200
Message-Id: <20260914062426.14140-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

copy_to_user() and copy_from_user() return the number of bytes that were
not copied. i2cr_scom_read() and i2cr_scom_write() return that value
directly, so a usercopy fault is reported as a successful short I/O.

Return -EFAULT when either copy fails.

A temporary KUnit test called i2cr_scom_write() with an invalid user
pointer. The unmodified kernel returned 8. With this change it returned
-EFAULT. Both versions were booted under QEMU.

Fixes: c0b34bed0bbf ("fsi: Add I2C Responder SCOM driver")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 drivers/fsi/i2cr-scom.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/fsi/i2cr-scom.c b/drivers/fsi/i2cr-scom.c
index 83b3c03..7edd3e5 100644
--- a/drivers/fsi/i2cr-scom.c
+++ b/drivers/fsi/i2cr-scom.c
@@ -46,7 +46,7 @@ static ssize_t i2cr_scom_read(struct file *filep, char __user *buf, size_t len,
 
 	ret = copy_to_user(buf, &data, len);
 	if (ret)
-		return ret;
+		return -EFAULT;
 
 	return len;
 }
@@ -63,7 +63,7 @@ static ssize_t i2cr_scom_write(struct file *filep, const char __user *buf, size_
 
 	ret = copy_from_user(&data, buf, len);
 	if (ret)
-		return ret;
+		return -EFAULT;
 
 	ret = fsi_master_i2cr_write(scom->i2cr, (u32)*offset, data);
 	if (ret)

base-commit: 22098763a10d9c1340827fcf6edab66f153b27f0
-- 
2.53.0

