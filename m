Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792976539;
	b=VAglzlhzs6sP00NCnjDHKen8qeW7L6mrq+iSVo4vyHMVAflnuaiLCYDDCGQeQ4Qo/NFN
	 xJf6C3f4bE+njabyfQ0ZvwQHgQ65Yyvnqt77jrEcUy/GdZyIqLK6iyb8LaJ7bsI2wsOKj
	 2nUwtQYNn4Fegomg+/nxOkPEneDnzIqSer9dfCcWsMF+9se5VnnKMc8X/Z9IKlHDYDM9m
	 fx8SbqC+YiIVcqvQeBVD87G7n0XsatFO6E1KjY+q0jSOzn5CkUNF+a0f4mqV+BktBjYzR
	 L2NG4OlcPke49N7HErdKrZSqhsP1xhcVS6CHNQL8DCJ0LTI4k+lzmz/u8Hbvpp5DJHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792976539;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=VjjpT/WS6GzMNNn96hvzrrjqoEJgWtlxD5KPXsnUWGQ=;
	b=iI/rQnrdz7fSCn3Gh4X/bzSzQjquu9t7H0njXTIH63T9lQVPfYw49lgFDCX678TQR6Vu
	 udeBvIomYfCfdxvyp8R8SrDzq6+srBNzzbxVpIxTEVpLdzNtN477Dr0lD3ZWHzZt6+jwn
	 9cuwYqfG4nfqkeiU9DA1PTW4aShQZ8S6mAyKTp90boYnz3KtBFB9bm25o4WE4rk5l1Wre
	 Dei45Y6eV/ffwGLjT0fwxru0S/QBBSpUNjeLjTk2xPxZrk2+I+7es3+BQzK3I5t4FzvlT
	 LXlXflP1HPBuKhBHeg26fga55DiLwjMwrjLR/N6sx6jCEXszCZo/INobqgSDJXfVM4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=syKs5b2q;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3C0F606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 01:02:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3C0F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=syKs5b2q
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a5087a5348so6626325e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 18:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792976537; x=1793581337; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VjjpT/WS6GzMNNn96hvzrrjqoEJgWtlxD5KPXsnUWGQ=;
        b=syKs5b2q4e1IzBryiRFLwcyDll86H3tx7Dktu/J6IpyrTDrxTtiPItnGkSA5E108f/
         VGkV6VFQwkLG1pyvv+xHxjs4hpNivcKL1UOFK89Zno9yBNHFmZa69WZeEOZu9sZX/gIl
         S9adAuTKaqwKT+FSxfHNw1ttbx+tAhp99grNniEa9vzRVmEsZEziTjdCrQVn9GaCxHc7
         x30UQVKAwhGXeAyP/vZyr577/YYIlzctXSntmBeQg1CJe2yj/doYXVvEtf4lMVVQi2zA
         s7kfyI/N8vxtghNzDxvHLMeQHMfwST+nkh0UDLe8suv+OpgcXYOA4D8fVXpfeH8Xhksx
         sBLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792976537; x=1793581337;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VjjpT/WS6GzMNNn96hvzrrjqoEJgWtlxD5KPXsnUWGQ=;
        b=aV0+1ztauKI6odfS7chJjAP9EoTkkFHtO4fpk3b9FFPPHutCmghA72gahWlnk64HHM
         5yPX6SXgI9G8qLeKBUXHXAgAkbadAsmMjWKTeC9BEuXuRF9iMC6cgoqnvjzpJQ80veTm
         W1P3lMQD/EOzvO2Mkgc085LMS4Zm1oyJPc98bSYmsDHU924jNr3UUWQBhXQbAQj39Pck
         rxuGB+fTFfjJzbVSzUNUzCp0otGVVN7pbYX9usakmeGyEtWZDDsGXIByZm8l9Pd6yfph
         yafMs12Ksc+Y7W7Hh191hxd5LLEXU30Ck+02rIWPAEwrLE2iC/nHVwoSA1YwtL25akbM
         Yjog==
X-Forwarded-Encrypted: i=1; AKwUvBzFfpoz337FvIPsaAbxGRg0pvWksUKZpGtA5tmJJdMxhuj/MauxSveRPs54elt/HV9hZbKXUO/pVnKpYWA=@vger.kernel.org
X-Gm-Message-State: AFq9FYI4DN53eQckArmKxsacqV57Am2dIcY2SyN40ysjz85lpjLJQ8E9
	hFzuGxtImy2XLz2rtaDJE3Pq6hfBVAJwmqNTBtbYNCl7frcnH6Q6MRm1
X-Gm-Gg: AYBFou3dqupyL4aNUmuH2g1C1Wg6jGv8F/xXQrTsl/rMEBOeFsO0LJTt5OuqMMZ/X7n
	kQhXIOThmJjnCuY4KHvl+lJ/kkT31NmMDpzRFepSKyKVlHh3270NH412mF9xhGkzFmAfqSgMHzv
	YWt1mdF99rTKhrRGMTG4Bb0vmYv7XYTLIKUwnQeCONUXs9Ma/ackkScWCycj2PV2Puf88SLW7hW
	tTl9Og2niTt7GAb6ZWBkJVUfufVlkozmPx5iY4mREm094XmDwyYZhwtHuCCdBptCFqloSC8Yk4U
	t8e5SrnsOvIIi9YHQ/rycmKx+OL9UFQgn2ZwF+Fefq8QDoykYx4l7iKHeKZl6/hgklYaZ13hTJM
	Nby++CqFEO76DC1YZASy1l2vxk8q+A5KEbdgKkyHHsBZ/DcdFh4IMqszPRolPldACjD9urDF/3M
	1cWG7nZPG044bCgSCHMejin8Xf0bdxHFguUFsthf8a9L2D6pSnSoCw59lQ3Af5ncUvht7OZHnIh
	jGa/UZFVYwtKo2XXBRIj5M8dsPzdweCc0NMDjm6ZHw5EbI21vvYI2Gx1hG/6Mad/A57NN+v4TyJ
	fEfzsjF4d6X5DnHm5FHvSxNninSsia6PXsblYXgYU9Bq/OUadcHj0avbZRTUBLClkMHaK6rWTO1
	rffVsfBcCTRCPmJiuq+6CenVFJrdMtWE2pB+ZGjz8G69u2w4odtpVFipZPw==
X-Received: by 2002:a05:600c:3148:b0:4a0:1efa:c74a with SMTP id 5b1f17b1804b1-4a35ac96da9mr81454535e9.20.1792976537008;
        Sun, 25 Oct 2026 18:02:17 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a9cc-4401-09c3-9199-30c4-c6a3.310.pool.telefonica.de. [2a02:3100:a9cc:4401:9c3:9199:30c4:c6a3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd354asm12325195f8f.43.2026.10.25.18.02.15
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 25 Oct 2026 18:02:16 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>,
	John Stultz <jstultz@google.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Miroslav Lichvar <mlichvar@redhat.com>,
	Jiri Wiesner <jwiesner@suse.de>,
	Daniel J Blueman <daniel@quora.org>,
	regressions@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] clocksource: Prevent immediate watchdog rerun after a delay
Date: Mon, 26 Oct 2026 02:02:00 +0100
Message-Id: <20261026010200.96371-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <874ie9zc3g.ffs@fw13>
References: <20261010065509.72916-1-kmehltretter@gmail.com> <87a4oeerwm.ffs@fw13> <atmhdRzqx5t8PYrc@gmail.com> <874ie9zc3g.ffs@fw13>
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

The watchdog rewrite made the clocksource check handle long intervals
between two measurements, but missed that the timer expiry needs to be
rebased after such a delay.

When a watchdog invocation is delayed by more than one interval, adding
WATCHDOG_INTERVAL to the previous expiry leaves the timer expiry in the
past. That causes an immediate second invocation. The resulting short
measurement interval can mark a clocksource unstable.

Cure this by rearming the timer based on jiffies, which places the next
expiry one full watchdog interval into the future.

Fixes: 763aacf86f1b ("clocksource: Rewrite watchdog code completely")
Closes: https://lore.kernel.org/r/20261010065509.72916-1-kmehltretter@gmail.com/
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
The baseline and patched builds used identical configs and initramfs
images. Tested on v7.3-rc5 (72d3fcf802c4) with four QEMU 8.2.2 TCG
vCPUs. PTRACE_ATTACH stopped only the vCPU 0 TCG thread for 800 ms,
six times 12 seconds apart per boot.

                              baseline   patched
TSC marked unstable           2/3 boots  0/3 boots
boots with gaps below 250 ms  3/3        0/3
minimum watchdog gap          0.231 ms   505.484 ms

All 18 injected stalls completed for each kernel.

 kernel/time/clocksource.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/time/clocksource.c b/kernel/time/clocksource.c
index f1253f5795c6e..58c0ca11cdc5a 100644
--- a/kernel/time/clocksource.c
+++ b/kernel/time/clocksource.c
@@ -673,7 +673,7 @@ static void clocksource_watchdog(struct timer_list *unused)
 
 	/* Could have been rearmed by a stop/start cycle */
 	if (!timer_pending(&watchdog_timer)) {
-		watchdog_timer.expires += WATCHDOG_INTERVAL;
+		watchdog_timer.expires = jiffies + WATCHDOG_INTERVAL;
 		add_timer_local(&watchdog_timer);
 	}
 }

base-commit: 5b0764a53235d3c77e1ed674e836e1b3fe1a4b1f
-- 
2.39.5 (Apple Git-154)

