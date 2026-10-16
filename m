Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8710F33939C
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 02:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792119250; cv=none; b=iE6+Q9Zi0eKNS2eKDCqO4bffIC4lB/ltHe8aSAj7X/iHDNtuQs4qOJsKrLbks4gkcPrpy6Vfv3+5uMfzH2EG9YDw54ynRjcu4NZfP5oHpf925qJRux3u3BgcUxHNIfhQ+E30VEkdkJF/8DPvpq6V9ikS0jNzhYrXxsQG72zaZ3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792119250; c=relaxed/simple;
	bh=Ht/sdt0Xg3nIv22FnH9XXQfkg9UkhWoR7tnim7fk8CU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=K6baTNSt7h4ASC/r+huxdHk5wVR2w3evLBu6tezW/D+YdVGemASApwv5N5Y0W2WlVyysPQaaBZEP+PGe2e5ony2PBaZrK7bbzdDEF1IeEr5sRAUz/1DoIa2b17HqpzpF914jimLDgQIZLDJ3TyvcPfqA6f7YFElGXA31Th/hsv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XqX/ySFp; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XqX/ySFp"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-487049569b6so4090087f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 19:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792119248; x=1792724048; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XMUiVCJk6662ECKbtVsXltYgL8clVA2PMrxyPMJzO04=;
        b=XqX/ySFpTzRSBTt1mV4sD6PLe1aalmffvIhZyzQ853fZjU6SYGYvA7Ef/JTpP0ljwx
         7Q2odnqBhpNffRuyVyr2Sl9QQDTjpJKhL9187KYQs/I8t2aYyRqDBo88f/Q4aN33Kpqg
         J8fnfNoG/P6bs+7qHBBEjrLmR4B79YhVb+FUXZqe7yCDhonM4o39teFEreE6gRGn7QBu
         MSnoGWvaN0kq/NjKgVZZAaj/kdfCqTeeAN/zksfM/kl07C3UIBXcNfM27VUnPtOK/yR1
         aJ2PhB7kNGcPJjiwbvMYMoCH3gUALs085/JSH8CwYMhXFqmUSE8kDN3xe/dQBqGPgcTE
         xrkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792119248; x=1792724048;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XMUiVCJk6662ECKbtVsXltYgL8clVA2PMrxyPMJzO04=;
        b=gtoEgA+7Q0jO3eJ14tOyc61xbXokcZtgjAuFSjnUvXGnh/clVR5NaXfS8gchqYVcOs
         +q2HxBzI7zPr3yLGA19LZxv/uHsL28ldzrllJ84/GskNo2H/hnA4AYt3HB8UHzdvNfxn
         tp0EtedLPrE72ABSsyBsaTYs7vzA784fB49XbwHY2KufJZBJidVEhlfhxEwlpntpB6SF
         0VvSbYenpyDkm9J/Y1Ey0iHxCCZjkbJyRM+FFHrva//SGcDTAMP6SYpHkTjT8x++6N97
         JL6XA+tAaWTW1roJzzGnkSVvWb1MnLDhqZyo5lWJhycg5yVU8ELdfn/N8KmX/A+Fz8MS
         mqbg==
X-Forwarded-Encrypted: i=1; AKwUvBygh3m97FV33BHyUMC8keoLiVNhnhhrkyhILDA0Wleq0Esv7+8hrBwPNgj/+QT6CPTcxPfPdd1Kq1L3+EA=@vger.kernel.org
X-Gm-Message-State: AFq9FYL9oTg48H7hDG2j3G4rJUs+NUJfl8Nj6KOeHjEcdVcLyc7k1sL/
	AtuGtJu6g07VcVEuyfSGuVVV/pa+QGud0JTPopnHAQUW3o3GfoxdK6Xq
X-Gm-Gg: AYBFou356PfFaW0aUN3ZL3kUa+N9q/phL5f/vggf86sjnDojL/VvOTpeiypdTTHJIQP
	Fh0oSUHR05vMtOpugxIcLDTFlaZidbo/3UN9ujQpTx/dddLr5Q7YtueqHE4ZE3pyXjJjAuuQc8U
	6c5ia4uImtZKIDB3nBGpe4lR2OBQZkJJ2MPU1m+7yxoKTwex3FcWyd62gcl/EauLM8BtejKZ4p0
	J7xMja+6RHw70hCfWDYU00eh5cZjPo+akvc1eqaZrNUoXCuJw9+INCdcuUb2m4bOU0ibZdSWso0
	rdYMwhNjaCzKPx1vYhleU0vRygZj5wrEEZW/lhXITSiSxB7NOF8RnCU5D3R4/J5vA+H/b2sp8We
	xkBhzmAkF6mz1iwn+fjgxasZvfxfPXUoauy24Ak5ltFa9LY1jU6LrA6QaANIV/krs1FA3MC5gI6
	2L1xRz/m6MWAhEuHlCszFspMxrjIXTsFad8/QzVjcVwqhvsVExRlU1reA6WbjwtXwcdEfV4JeTv
	qT8eWWnGzY0FDYrkj/U+hoAsfGQ0VMagJBR0ViK5fQPQ6rBqRwh59bilG9T6mM=
X-Received: by 2002:a05:6000:299c:10b0:48a:fb3e:d93c with SMTP id ffacd0b85a97d-48dba784b80mr29887033f8f.5.1792119247573;
        Thu, 15 Oct 2026 19:54:07 -0700 (PDT)
Received: from fedora ([202.47.63.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd50aafbsm1954775f8f.52.2026.10.15.19.54.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 19:54:06 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: Jorge Lopez <jorge.lopez2@hp.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Muhammad Bilal <meatuni001@gmail.com>
Subject: [PATCH v6] platform/x86: hp-bioscfg: fix heap OOB in hp_enforce_single_line_input()
Date: Fri, 16 Oct 2026 07:53:52 +0500
Message-ID: <20261016025352.230535-1-meatuni001@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The input is copied with kstrdup(), which stops at the first NUL, but
the full write size is passed to hp_enforce_single_line_input(). With
an embedded NUL the helper reads, and can write one byte, past the
copy. Return -EINVAL if the input contains a NUL.
 
Tested on HP EliteBook 840 G2 (Fedora 44, Linux 7.2.8): writing "A\0"
followed by 4093 bytes of "B" to current_password 100 times returns
-EINVAL every time, without reading into the heap.
 
Fixes: a34fc329b189 ("platform/x86: hp-bioscfg: bioscfg")
Cc: stable@vger.kernel.org
Suggested-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
---
Changes in v6:
 - Return -EINVAL on embedded NUL instead of limiting the scan (Ilpo)
 
v5: https://lore.kernel.org/all/20261007134711.473857-1-meatuni001@gmail.com/
 
 drivers/platform/x86/hp/hp-bioscfg/bioscfg.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
index 876fc35d035b..e306bd8b1e72 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
@@ -162,6 +162,10 @@ int hp_enforce_single_line_input(char *buf, size_t count)
 {
 	char *p;
 
+	/* buf is a string, so a NUL before count is invalid input */
+	if (strnlen(buf, count) < count)
+		return -EINVAL;
+
 	p = memchr(buf, '\n', count);
 
 	if (p == buf + count - 1)

base-commit: 8667bd30fd033295b3038ce374c551d1059538ba
-- 
2.56.0

