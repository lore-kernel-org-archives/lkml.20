Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 308BC253951
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 14:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790519333; cv=none; b=Tm9WhnrGWok9ngIqMyxlbWWGbhTFKtPhctSSru7yM8MMappcXQ3tAPFPLV8Xo4LoVa6w+M24zrcglH5TPuQJfcOIFxrFqCgFeLixy8V+axMLoayGFUw3RLZbFwvJ3SvX7vK/E2UfHTUTUtH9LgIH/iimYeYxtNr9DX72fB2CrAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790519333; c=relaxed/simple;
	bh=s/FuFyjO+EzGfxQUYOBTR8TNUQtpUSnZ4NKn5wAORUc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=FTfrNas0AYj3gLPBSASXhgK9t6ZtTCHnm1wG60wJBUR/7ZpaqztiUGqXzJxRZMGgaY5duIToMVTBhyATXOYmlT9gHbvy/NzpklE5vfO8fP81sScFublT30WOfziQJ7WFcRYTUWKXo/A9iyRJq46GgU1JwL9Z3i6fj0es389v5z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UIkUCFez; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UIkUCFez"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49fe8bf173aso11547225e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 07:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790519330; x=1791124130; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i2/yZb7IeEEdrOmMuM/wlsM68A9x3sDEUKZr2wAwesY=;
        b=UIkUCFez35/ueazMpQ/Xb2LmbacQoupFKaHZvkmm23DL73aln3ckttC04onon9o/2j
         QE3iSfDV6cYJcIzYJJfMMFbxCTYE1ZOqqWIwDkjYt70eCLMbFxHi7fx7cwkqTktJPYCG
         BHBwz4yYtiTK6/8NS5JzN6ZXoAOG1yYH2yfU029OeMTykjQ3A212nIDBckh3q4WGocaN
         ooO7X+UB7RWQqNyabi6sm5QfW4tkb1/F/b3yjhO+dOvOtAPXm5js0x57siRN7c6TusL5
         A0W67st7IAwtuTYL4FnsPT0Dd8V6m2QjuJ7mQ/BoqudpOoZ+RZrFHIpWWDPX8g9qlxzG
         EBcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790519330; x=1791124130;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=i2/yZb7IeEEdrOmMuM/wlsM68A9x3sDEUKZr2wAwesY=;
        b=f/+f6uPivCBwvNj0MnR9bvW4rZ6oXHhyIsi2QVz87ze+2+vQqL0IYTNxVG4wqs4I2x
         0HN6oYO4OU2EtUd5oGAwMq9azz1gqfQSR1gVzmZ4sDsvttNlZ0l6PgfLWLjAZI2Xndo6
         KdVvynmKEfALv/9sxzF6rn85MUh/WY2T0Ni4d9Jx1Og3R+x0q28hgHqBC2E0CL1bomwm
         KOggKijhPLoVbSWcH17bVrt0sa+UioxOzRPuxozOg1JiovYX+kaABPXUcDKb2EFb/Gfa
         SKVvYDvuww0YDRFTRvObQwcaRc5INOjbjA0zK3u9vssOcbqE+fSeaUpZNGpTUhyzEo3P
         48xQ==
X-Forwarded-Encrypted: i=1; AKwUvBxNSHwm4q0rCZnwJlYu6LdVsOxmbS9vxak67W6bTb3MNgZLKdWPVer/uDvtP3ijVoqKluAdLfsx5GZ6hyQ=@vger.kernel.org
X-Gm-Message-State: AFuF++loL+UTPlJOySbVQnMMK1M4vSeuUQGb/CryA5BX7INp8zPGea/k
	bB1rqCpV/LU5V9D2XwDIBKo6PuOBgTpoAxf+9l7bPI1JMCkspk9rdOA=
X-Gm-Gg: AYBFou086XBFShhl+psAT6oA37EuIo6CdWyLn37iMuNQ6+RGfWDVTlBQicjvHHX7ZJU
	rlg5vlDHDjxMRbjZqLtG7Oy1ntVHJ7hOJYzvzRL4lpmt6mu6lQqxXHGaiuaIk7GIRa6xb1xlF1v
	C2UktVt865Q8nWN78Bf2eR6+adKLs5B3R+Bb1Aw4ycOwybghFC403rTiWP5yKxvhZGvf8JE6Fkm
	53Wb8ltJv23bRYKycA9lZlqGfb+DNG+yVFv1vLXDwKeAuRmLEjx/PNKgdsEhDhxxHdZQqMIP6O5
	8yT5YfmVJ3RqPBIsRZEe0WP3lzkZPr7PXdg0yx7O0oKONNlO5AAvML23TH7VrtqcQNfcZs9BMwE
	PqAyIRAyvoXFrzzkhSW0NceHqK8dBTSADcS+zAJfpri4nPktvX6QVpZYFLt9fqRoi9aOZJjcRxV
	47XKl4Ln6zMu6KiMeXcFcb3lu7rgns5j5p1mjsjfr40rZJAHUW2XLuZhAJ5Fh2FUtg/Oj30aX2v
	0ChTKnLXJN3ldOQCDcKKWXanKjIiLnYIpJUOKRi9FgefwaDk2k=
X-Received: by 2002:a05:600d:8643:10b0:49f:bb8a:b4ce with SMTP id 5b1f17b1804b1-49fe67bc26fmr136581125e9.28.1790519330022;
        Sun, 27 Sep 2026 07:28:50 -0700 (PDT)
Received: from localhost.localdomain ([31.223.26.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a34a76fsm21796928f8f.7.2026.09.27.07.28.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 07:28:49 -0700 (PDT)
From: "=?UTF-8?q?Habil=20Eren=20T=C3=BCrker?=" <habilerenturker@gmail.com>
X-Google-Original-From: =?UTF-8?q?Habil=20Eren=20T=C3=BCrker?= <habilerenturker@hotmail.com>
To: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>
Cc: Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Pekka Paalanen <ppaalanen@gmail.com>,
	linux-kernel@vger.kernel.org,
	nouveau@lists.freedesktop.org,
	=?UTF-8?q?Habil=20Eren=20T=C3=BCrker?= <habilerenturker@hotmail.com>
Subject: [PATCH 0/2] x86: Remove misleading ERR_PTR() casts
Date: Sun, 27 Sep 2026 17:25:39 +0300
Message-ID: <20260927142816.15099-1-habilerenturker@hotmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Two places use `ERR_PTR()` as a plain cast to convert a long containing
an address into a pointer. This is misleading because ERR_PTR() is
reserved for error pointers, and it produces false positives from
Smatch:

        arch/x86/kernel/hw_breakpoint.c:521 hw_breakpoint_handler() 
        error: 'dr6_p' dereferencing possible ERR_PTR()

        arch/x86/mm/kmmio.c:596 kmmio_die_notifier() 
        error: 'dr6_p' dereferencing possible ERR_PTR()

Both are pure readability fixes with no functional change.

Habil Eren Türker (2):
  x86/hw_breakpoint: Remove misleading ERR_PTR() cast
  x86/mm/kmmio: Remove misleading ERR_PTR() cast

 arch/x86/kernel/hw_breakpoint.c | 2 +-
 arch/x86/mm/kmmio.c             | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.47.3

