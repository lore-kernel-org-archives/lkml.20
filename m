Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794353838;
	b=Nhljyw6/8qhb+Fxl6BHuuLkdojUEYBRgEYhVSqCOsDJhAV93KMYmmXuJeM4tiZaiKcg4
	 3ctlgUnLoB1m70i+aUAr0aNEUcU2tIn9tH2rktyYFc6i/vSyliTiOPXjkvJSUXxI+eKAF
	 9UATJyZo6fa3B12a/iC/xSFtqcvqlrfHrjvFebGH2qoY9CdhZ35CiLnFjxLNLKwmEjQGq
	 cY1YF/j1nVZmD710yPiL1wJPoQaTkzzNEZBEmZ/o2qdFTO1bvYI9fnolM/t7lwoHicIPm
	 3ElJydpNJ7xjGqpT69fkTOHPDSOpgpBqIp6IOLzcvaZpDSApJ5Q/Vf7SgdhL7RUf7mQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794353838;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=nucm/aleCVbqWE1ilGDcefpNzHQgxL4IFzC4QCL3uuo=;
	b=vzOFVZT1DhAim5f9G4FmkJGZIOHY9sXub/MM1Sqz3s16mdb+W0Ho/ClDd0WL1meEYSnV
	 M9LgxeINJUNg6LamsAs/Pl4S/NtLwcAnVl/XID90IrGpvnR4MOv204/8UKgJomrByxCoy
	 aKUnaNMhRcQSgoliucBUTUiA4iLfpfTgMNZUgf0hQjGrVi5Y4ZIfyyqg/KPbGBL7BzZzk
	 BixIg71JfLNYpuv2fXAJwIKSBPgb7gaIODd0IHb2N/Rn/GyyPHql1NWi5Y50bFp9D/AUB
	 EnY02egedC94beyI/0O9L4Kjyrgb4elCeCY3OQuP5OmKIrLPFbHZqZibQQFs7/U+lNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U6zkm0r+;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49574606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 23:37:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49574606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U6zkm0r+
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-170135e43c7so337639c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 15:37:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794353837; x=1794958637; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nucm/aleCVbqWE1ilGDcefpNzHQgxL4IFzC4QCL3uuo=;
        b=U6zkm0r+Li0Gw+HszhANqyt3xoRZtlLyb5QfVwaorfokcRRa9+8SuufNx11mYAigdO
         UI0ONO0j7dw9r3ouGdCazB9drEGI+AOKGYB2T+u82KQk/BDGn6HbAYh0+b7yF2QGgOQw
         weK1SrNYANzm1DCaTZzA4Cov4dx3vRqGKH6t097njBU/WiyIN5oLKbPgwCgPcxmYxOZV
         I0BvswsPSbj7BbUPaE4qnUFRi3GwXFUGgWYr102xEFEiSEjyqV06LGcvrpn9N9fq7q7r
         qM2hIfcpgE2NW+VbDSKTCJwddFnHub4hDH04UOnjMM0oybYsAN9WWbBTMS4amhaucuph
         SIKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794353837; x=1794958637;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nucm/aleCVbqWE1ilGDcefpNzHQgxL4IFzC4QCL3uuo=;
        b=b5qoAFBkeuOre1SQpOyP2TPrzKnD5ifGdB/CxyM7784zL8AULYwDyMwmpepGefpp64
         I/FleVAsG46Zc61TW6lLzZVRrOpFYClyWYFVksEI9O0JzNKGeKUAc0w/KjfNSdpRUsqv
         YzjLvW33onoDog65PaHR0L6e3G4BSL7pBMkwvlsyYbcWiyC6DmnwbeKzS78ivgiV84Mr
         clPE0T5puN5Lzeor+8MUhuBAGPfylhbNA675QELYWlljK5/alLzcDxTIvEqnJDstbx+B
         6IePzr28CUfk5cKpcHvP4/ZuU4TrQvX0a2Vh/ulfVk+RVykyYzdFjqEQvduDfyDYRgtf
         xzwQ==
X-Forwarded-Encrypted: i=1; AL+hErHf8/sJYCKRW34BZ9Qns419zDz0jSKdGjIQIpKPJ/px7cIFej/B2iZKuliw6Oyyqzfe0KWKEEF+M1ny26U=@vger.kernel.org
X-Gm-Message-State: APuU4Z96jdyGGRpybMwzMowasjipLM2Zvtp0pgkT+RgnIumVoC0c9Xhm
	V0s+vIVA7Gxz5NcNGP2zGXrt59fs4Lrebfd+Gw181Mhjq+AjHjAqJmtX
X-Gm-Gg: AYBFou2Vi8QHMnYhCk5G1ynXshUooEyk6VZXzhX9zf686cOdaf9/1tXtWR+IDt/8wKC
	m7bppBm0634PIAxXu3Y+eybpPA+Lji4PCXsPvXx+0+WYQVogz1PUahPyGqvi0NM17OUPQrn5Fl6
	I4bF0s8Yi4P2nmSdisWeLxIIeHpq/DsA0eM8FY4JDa0FPEPxHw6Gv3ktS7wiJxzJXP0BOyGRxg2
	ceEToEYNFjt+qJPP6Lv2aNus3IJSCusS9Bazhp9cv+IxZVFXIproApxKOCl+3b897Gg0PeC45iD
	WReCzljFog1hPu1D+vF5/ZkhwZPgkBp/+i0rtsH3tRaDjaQ2q4Unc/BV07m+irHYSn1y0jKkFYJ
	YL9vFk6yvaEnVxFjBOsweKGVTU739RJp4c25ppKWXCuSuf54jAwXEhtaTtptCr5v3CixFMlBhOw
	tJviXY9Dc9bmWpWA5ck7OIEXJvxKnZESsX2e6NqT9DszlnPNBIfGKqPRXTiiDzx1FJaP8zVfQMl
	A+6n/raRuCphILvGz89TPx6nPYuap2HUFwXrkNPtpr90+U0tqiWDBzaham/D9g3aRrNF8we8uC6
	8ZjLkK4TysbvdVq2nvIl2R0E9JrQCwNs5YwywT3BvFN4IvPLAcBVVSSlNfNroc2WV/c=
X-Received: by 2002:a05:7022:2608:b0:18d:96e8:b913 with SMTP id a92af1059eb24-1b3c036707cmr794553c88.47.1794353837204;
        Tue, 10 Nov 2026 15:37:17 -0800 (PST)
Received: from localhost.localdomain (wood.seclab.cs.ucsb.edu. [128.111.49.37])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b11346sm11981419c88.7.2026.11.10.15.37.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 15:37:16 -0800 (PST)
From: Praneeth Balasubramanian <praneethb2002@gmail.com>
To: Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Praneeth Balasubramanian <praneeth@ucsb.edu>,
	stable@vger.kernel.org
Subject: [PATCH v2] media: hdpvr: Hold io_mutex when restarting streaming after a timeout
Date: Tue, 10 Nov 2026 15:37:08 -0800
Message-Id: <20261110233708.318348-1-praneethb2002@gmail.com>
X-Mailer: git-send-email 2.25.1
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

From: Praneeth Balasubramanian <praneeth@ucsb.edu>

hdpvr_start_streaming() expects dev->io_mutex to be held by the caller,
as its comment says. Every caller takes it except the restart in the
read timeout path of hdpvr_read(). Commit 6bc5a4a19275 ("media: hdpvr:
fix locking and a missing msleep") added the lock around the
hdpvr_stop_streaming() call there, but not around the restart.

The restart checks dev->status before its USB control transfers, which
can take seconds, and sets STATUS_STREAMING afterwards. In that time
another thread can start and then stop streaming with
VIDIOC_ENCODER_CMD. hdpvr_stop_streaming() sets STATUS_SHUTTING_DOWN,
drops io_mutex and waits in flush_work() for the worker to exit. The
restart then sets STATUS_STREAMING and schedules the worker again. The
worker does not exit, so flush_work() can wait forever.

Take io_mutex around the restart, like the other callers. A restart
that races with a stop then sees STATUS_SHUTTING_DOWN and returns
-EAGAIN.

The missing lock was found with an LLM-based tool that checks callers
against the locking rules stated in kernel comments.

Fixes: a503ff812430 ("[media] hdpvr: fix interrupted recording")
Cc: stable@vger.kernel.org
Signed-off-by: Praneeth Balasubramanian <praneeth@ucsb.edu>
---

Notes:
    Changes in v2:
    - Add Cc: stable, as the media CI requires.
    - Resent so that the author matches the Signed-off-by. Gmail rewrote
      the From: header of v1. No code change.
    
    This was found by an LLM-based static analysis (GPT-5.6) that checks
    kernel code against the rules stated in its comments, as part of research
    at UCSB SecLab. The patch and changelog were drafted with Claude Opus 5.5.
    I reviewed the patch and take responsibility for it.
    
    Testing: builds without new warnings with W=1 (x86_64). Not
    runtime-tested, since I do not have an HD-PVR. The hang is from reading
    the code, not from a reproduction.
    
    The patch applies to mainline 9ba46df34488 and to next-20261109.

 drivers/media/usb/hdpvr/hdpvr-video.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/usb/hdpvr/hdpvr-video.c b/drivers/media/usb/hdpvr/hdpvr-video.c
index 4290b2367fa3..b7afcebe80e6 100644
--- a/drivers/media/usb/hdpvr/hdpvr-video.c
+++ b/drivers/media/usb/hdpvr/hdpvr-video.c
@@ -475,7 +475,9 @@ static ssize_t hdpvr_read(struct file *file, char __user *buffer, size_t count,
 				 * streaming.
 				 */
 				msleep(4000);
+				mutex_lock(&dev->io_mutex);
 				err = hdpvr_start_streaming(dev);
+				mutex_unlock(&dev->io_mutex);
 				if (err) {
 					ret = err;
 					goto err;
-- 
2.25.1

