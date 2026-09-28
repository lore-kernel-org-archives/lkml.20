Received: from mail-oo2-f42.google.com (mail-oo2-f42.google.com [74.125.231.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D5C2FD1AA
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 18:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790621068; cv=none; b=J1qU9Gk78cqR5kmVOqOj8p/TDim3nchMYdJKl+Wt0wTdYl1T0pEIE3wbaosvU+f2iJXpqp3tIKnnDhnJ17gQ2P2wsGmC+bWc85RDtzIxsrqzML/mclsTr/OpoCbRA9vNZXWqGojbchd1ZVBZdBYTFfeKPKFuOhwx/jbNf94abSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790621068; c=relaxed/simple;
	bh=mKQj9sL5GzjoP859FR9c+/hLRYrlJtnFUUhUpb5S7SM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=F/EzEeW8SKAQk9GGZ53xoQHT+Tcd0mfr0Q0ZbJki1bUCL8i8ha7eBFYp7wIH9zQh8obNy/B+iDvOYhJBnjmOT8YhateEoT4BuS+EhetLhzgoil7Q+q81sdaYseXoFOybqDKHsUtB4MQuIodnSxP+5Z/JoMoFOcXchD0WMoRjwI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TNclKgzH; arc=none smtp.client-ip=74.125.231.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TNclKgzH"
Received: by mail-oo2-f42.google.com with SMTP id 006d021491bc7-6d817a94745so1094230eaf.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 11:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790621064; x=1791225864; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GjngKdONij+Xmo9yaF52FWFWceIK5m01Syn4FcsVzZ4=;
        b=TNclKgzHzP2XnNtVpJu1eQKRy3jMjt2U7NPuDj6e2RejQXs/SRQp3HMngOuv73dN+8
         b+ltFaQGTJ+TusCuW7/mDa4tj2JMNj/V87goMYndnlL0/Nz/5ejW0CHUVuHwm2OEiE54
         ezKVFuSqJVEdsVrLThTn/nToLz9xjrvIuT+R1548R1N+rnM3lw5lj/6Aur5x3aba79a8
         uyzPcl8VXkaxuIsJtnBU8+qFd0HgMl8fg5NGmgU7dmVANj/17D7Prv+siFJj+wNARUOA
         HaY7aDa5Bv5lG9PLAW1i/s2p+utuhkwy2hrX0tFJKcJnT7HLJ0dqWB26v7thUpxJbJSa
         yJ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790621064; x=1791225864;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GjngKdONij+Xmo9yaF52FWFWceIK5m01Syn4FcsVzZ4=;
        b=ccp5Hq4Q25pzEwdm/PsavIWOahzxODPfbgnCHnXPYBn+PcywNXoLMnrkAZEphJisP/
         zg8pLl3ypPIYSWxnySgEYIOQDIvtqnMF/v8fMF7y9vhP+Q41UDMDJQTT/Ej9wf8yay9A
         Wy2/HB2Au51aO8aPd5dmvza05SZv7lxnqQ9qHjM+EQ9+vPSOypNpgiLQpdCW47EX9jQQ
         nSfo5/HVIdeLLygvEicfjx4UkcePxvQZIwfiuHTA+qH9n3TLD+NDYE0EJQVELKMgN+UC
         Zqh7A4yukq096mASrGceyonk6oQB9t6tzdEDnmK150QM30uYihma+/l/U9Q2NZlXsBk8
         yckw==
X-Forwarded-Encrypted: i=1; AKwUvBz20vtYy0y7r9kG0sVxgvvTUSCj6nzFvGGQZ4maqIqjgTPMkfBU074UtJj5veRmNl6xh3AfvufxV/7wU8A=@vger.kernel.org
X-Gm-Message-State: AFuF++mRiOgTZLOnf0hC6Dvsdm1Uvm3a5T4FRpwguZ4d9EzoUg3AzpnD
	lxwgaYLNUyMTdWr1mXtmG6hWF/X0MuPIjJtzJkHQP+sLMUY1BBWi9RsL
X-Gm-Gg: AYBFou1voW8lBXe12tSgrYGbXpNKC6ett6SsaTjPVJuwzVGarp9spgv4cjgOG5P6lFG
	ypaQvGoTB/RcU53Bk3+SgBNYvRfCxJBANyujyB9yIf69i8fAq45uSLvTUd7ANvexpfaQQnnnOR4
	GqsCP+LVCBvIXBg72iZmmqckooR0Skyyo9cqxs2E62Bu34m/AQJ30nk3DtcJOAlz/EBJ8vpPjWo
	kj6gausVGsOA3DRPdr6c56O0V+80Am6E+QRAJnbU4CfIrhN6AR0PlLfVuTUgL2G5zzrxqbyIcN7
	r9T8MzskKam7rQ1jEisWSr+ABq2WEWAxR1RaEvAWSZfINtQ/4bfR47mjIoy2XIxwGes5KbYwYIY
	PiI7hA/MAau9sxoPfo/lJyXIJ7HKX2/4Qqd7Q4ADLXYuayEBL4ARnCyOCl9x5Wn5fht1W/4f3Pt
	qx0/+UFxzvNwvKzD3WWKwsc6tJQAYcDH2D7L02/tTARzpnadYOuBMwUlbvzaCJDlPbQhq0RWeAh
	8/sLf04nzo96yKkDJ+Whq8TnBqfeebmfqjXRocC
X-Received: by 2002:a05:6820:88b:b0:6cd:3fcc:96d2 with SMTP id 006d021491bc7-6d440b0c2dcmr13316774eaf.80.1790621064248;
        Mon, 28 Sep 2026 11:44:24 -0700 (PDT)
Received: from archlinux.lan ([136.34.156.120])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6d8822199dasm5889946eaf.4.2026.09.28.11.44.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 11:44:23 -0700 (PDT)
From: Danish Khateeb <danishkhateeb03@gmail.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: linux-pwm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danish Khateeb <danishkhateeb03@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] pwm: Allow 32-bit tasks to use the character device
Date: Mon, 28 Sep 2026 13:44:22 -0500
Message-ID: <20260928184422.380520-1-danishkhateeb03@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pwm_cdev_fileops has no .compat_ioctl, so every ioctl on /dev/pwmchipN
fails with -ENOTTY for 32-bit tasks on a 64-bit kernel, e.g. armhf
userspace on arm64.

struct pwmchip_waveform has the same layout for 32-bit and 64-bit tasks,
so compat_ptr_ioctl() is enough. PWM_IOCTL_REQUEST and PWM_IOCTL_FREE
take an integer rather than a pointer, which is fine too: compat_ptr()
only changed the value on s390, which dropped compat support in v6.19.

Fixes: 9c06f26ba5f5 ("pwm: Add support for pwmchip devices for faster and easier userspace access")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Danish Khateeb <danishkhateeb03@gmail.com>
---

Notes:
    Tested on x86_64 in QEMU (pwm/for-next 17dbb6938d3a plus this patch,
    KASAN and lockdep) with a PCA9685 instantiated on i2c-stub, which gets
    /dev/pwmchip0. A test program runs all six ioctls, including the error
    cases (hwpwm out of range or not requested, __pad != 0, use after FREE,
    SETEXACTWF returning -EDOM):
    
    - before: every ioctl from the -m32 build fails with -ENOTTY, while the
      64-bit build works
    - after: the -m32 output matches the 64-bit output line for line
    
    No splats. W=1 builds are clean for arm64 (COMPAT=y, LLVM=1) and for
    i386 (no COMPAT).

 drivers/pwm/core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pwm/core.c b/drivers/pwm/core.c
index 2a050ff4608b..4c6d716e5fde 100644
--- a/drivers/pwm/core.c
+++ b/drivers/pwm/core.c
@@ -2389,6 +2389,7 @@ static const struct file_operations pwm_cdev_fileops = {
 	.release = pwm_cdev_release,
 	.owner = THIS_MODULE,
 	.unlocked_ioctl = pwm_cdev_ioctl,
+	.compat_ioctl = compat_ptr_ioctl,
 };
 
 static dev_t pwm_devt;

base-commit: 17dbb6938d3ab444cd6be1c95506450595a8800d
-- 
2.55.0

