Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792900996;
	b=C7Md8brTX+twBhL+jm86JBhYHS4XhJlAFBBQEg94ypVdhMkKIEQiybuFRAjHOVRPfRbu
	 OMtsnJXR9iKSfzSZBxOJ1xKmEukHlu6zXNIb5dyO0n37sWhQtV+xvTbiUQa8/P0S4yQE8
	 rXPNa97B0pdmtRNgbtgBtceNmi6oh53fziXZUk/M//vsbuLWFXGQvpjCt+tQkdnmjDKI8
	 zS76ocwfygtWsDPgheCz89mRJiJFxetv6yU2ZGTdXAGFCTR5yzouxaABTG4p/S1NO+bFd
	 iLzapMKfyFDfAU5kCmusqVFnfNRRGhRZ8DqC9haaL8ar67XRzPSEbp7Rk1x0ETv0yjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792900996;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=8otCCaRP0Tpt6gI7v9Cl/9PTuNgaCX14b6WSefLzu7E=;
	b=Tk764U/v6RDAQJFmOZYwlX5jF7I2L6KLXkCw01W37QZTb1Ovv+YuAa4fFF1o/8SotVno
	 IHks7yRzHPe7HMmvtvc9WOUJbkd57RxHEgfgjoVBqtUDAon4x7AKh/kbKqAEhdx9L58tn
	 ZdTK2zlAGsspLEpTCBPUQlllPLzc/2l4+xBPDecB5CAsOd0WRPrH0v1wDodiTsm2Cx2ZX
	 AeH2L5GMzRJUXxofmPUC++Dmk2N2o5FIlp1MUYZYgFvuWQNgyNt71rYSeCkjatyWYmjse
	 zrX/jhsmsARsUA+gZ6L9/FTD01VOnw0Rkm8bYO7m7HxxCRDGhA9gvu14VrY7PXu4HvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EenkfJyi;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E951606A31B
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 04:03:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E951606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EenkfJyi
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-14fd9dafb0dso1649442c88.0
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 21:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792900995; x=1793505795; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8otCCaRP0Tpt6gI7v9Cl/9PTuNgaCX14b6WSefLzu7E=;
        b=EenkfJyiA3/VYe8HyQgDdOUHVOSNvWURr4ZBMWVcbQxClz1YEQgD9UiU5XUYDA2tKT
         45lTtDdSuNDI98h9aBuzgrXcZfNiYFkrTMvq6ajLGJkUTxy9+I51Ll5FW4DrQwC28XCE
         wyzFDNqjxnZCenhfS1ADboNBN8F5gflbHP74HY7jZh9+ZXf0F9ggpDi3w5pui0VfJkQ+
         N1knlotoTJJ+8g6mlRaum/eiz6z49DYGn3LXkDn4YnqM1LM/FXYHo3GAZrDguQqt54JI
         fIJK1YaJCW8PtVvjGMWufuV0/pQDdxNBBbwq0ob7lmEpomX8xUyweUqymMPr7WsvljTg
         74kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792900995; x=1793505795;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8otCCaRP0Tpt6gI7v9Cl/9PTuNgaCX14b6WSefLzu7E=;
        b=1k2urFdzV+Nb7s+xSX1d3zUNXBlV67Sd6eWfENmhOOU5AqssMw+XwFiFAEuFtiujC+
         YhqakEQmIzgfAHkHCg+OaFG14pFGY9jy3YX4wnIc1aCpfxas36dLzSRCcoUL6MoM6ZZ+
         U/5P4xnIuVrP6Cwnvs4czISSKc6W2B7LjUiYC3Srdcbm3FyWzncbSjKoyguprLjmRssR
         5n6Ju+y0U1/Y1nFzwaYwXrqOeXegPD/l5jNq9meLtKySX4oT1mj1r2za1yhecdBQcOXr
         LiNt36h/jTQ6TsXuZZIEvTx5RlLMfmkYS6+n2KIsskmVkNhGCw5MKJOz158km/m7SFYz
         ikJw==
X-Forwarded-Encrypted: i=1; AKwUvBxYek0Jos2ciWNG35lPFJVrY+La/91I2zE7nY/NXePTBcB36JAEcSD8lMutKkrN5XpkQMnoBYV0BwHKtXU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIKzxq0IwReHG99TfBX770caJNiNHdkyOUSergRXuQbKZKJm3Zq
	Zwh1JldpS12KLRCyzaKgrWwtpaqc2bQ6RvcrdyaJG7z2BQNj6bRu+CQ=
X-Gm-Gg: AYBFou0I9LBX+rl6HXd5tHwtc5GnmgcNdFIMTD2XxHTMf1YMQ0eoWxjiIZTJqjP5Jsi
	MM5ZruJ8I13o+rPxeT7Twx3mZqHtAkeTbO35+nNhHsMzVsiFM+gZ3SczCIS/oQ58dkuPq7BJ3gc
	XX0RyP/knaY2a/KVLWHeY/db6ftUv06vksbiNO9doxJo9H/dppprawUndC0nSL/tvgl7IulcVEv
	7qo5rM0swgJjuylCsQpxImPmuAvdYj2ggE0VZPuwbV5891BILaQeusEoAS5ZZbT+yobWGyopRXp
	H+vgfKoXWcEfCohPWw4q/PSmNYl4IWpNG5I/Rn2p10tW12Xdwrqi18iQNrEh5RxcOkZDiHUDlLK
	2yRXeuMHQSgV1ji9XAw6LIa0arRe/8Av6XlRxtrtdipqFTJLdIOiK/HWcOW4IciQwu78QtgfEzn
	wRYXeUFbM0v6pNoaycMWoet1a5oS3ie6knTPxpQiNNu/rOMDUSq93B0gUHvXprccXAVI8nBU6mH
	EfSdqp9TXtRGBqmEij+l6x78BOqtL+Dw87zd1WA3MPNo6+v9iheLyIDeHR7KbIMZN/Kj6Aasn9p
	7b5e6r2ftccCuQ8=
X-Received: by 2002:a05:7022:297:20b0:196:82a:b80f with SMTP id a92af1059eb24-199374f3409mr4222106c88.45.1792900994550;
        Sat, 24 Oct 2026 21:03:14 -0700 (PDT)
Received: from at-Standard-PC-Q35-ICH9-2009 ([106.221.76.40])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a32ff780sm11635283c88.22.2026.10.24.21.03.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 21:03:14 -0700 (PDT)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: 
Cc: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org (maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)),
	"H. Peter Anvin" <hpa@zytor.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>,
	Rodrigo Siqueira <siqueira@igalia.com>,
	Kenneth Feng <kenneth.feng@amd.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andre Eikmeyer <dev@deq.rocks>,
	linux-pci@vger.kernel.org (open list:PCI SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list:X86 ARCHITECTURE (32-BIT AND 64-BIT)),
	amd-gfx@lists.freedesktop.org (open list:RADEON and AMDGPU DRM DRIVERS),
	dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
	platform-driver-x86@vger.kernel.org (open list:X86 PLATFORM DRIVERS)
Subject: [PATCH 08/13] platform/apple-gmux: Add documentation about iMacs
Date: Sat, 24 Oct 2026 23:59:44 -0400
Message-ID: <20261025040046.1602-9-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261025040046.1602-1-atharvatiwarilinuxdev@gmail.com>
References: <20261025040046.1602-1-atharvatiwarilinuxdev@gmail.com>
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

Add documentation about iMacs

Signed-off-by: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
---
 drivers/platform/x86/apple-gmux.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/platform/x86/apple-gmux.c b/drivers/platform/x86/apple-gmux.c
index dda281f2f..9f0e9ecbf 100644
--- a/drivers/platform/x86/apple-gmux.c
+++ b/drivers/platform/x86/apple-gmux.c
@@ -453,6 +453,11 @@ static const struct backlight_ops gmux_bl_ops = {
  * switch the panel and the external DP connector and allocates a framebuffer
  * for the selected GPU.
  *
+ * There is iGPU present on iMac's aswell, and we can enable it using apple-set-os.
+ * But there arent any display lines going from the iGPU to the display. iGPU is only
+ * used for offloading then, it makes sense as iMac's display are massive (4K or 5K).
+ * A integrated GPU won't be able to handle that.
+ *
  * .. _US 8,687,007 B2: https://pimg-fpiw.uspto.gov/fdd/07/870/086/0.pdf
  * .. _NXP CBTL06141:   https://www.nxp.com/documents/data_sheet/CBTL06141.pdf
  * .. _NXP CBTL06142:   https://www.nxp.com/documents/data_sheet/CBTL06141.pdf
-- 
2.55.0

