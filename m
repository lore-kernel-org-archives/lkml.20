Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794537680;
	b=j7qUQGFYLCFGxkRQnu2aJV0lQea7e7F8X507P8HzXXzt6TRTULerTZ9rIsx1PVTb+m5+
	 CKt7Ewli6LfbpBQSh3ZixVeCJ03v2xWtfNSdnUzDTvObYlisf19uKUdys7gZ/emZx83dm
	 zYX8NZi+6TvUzjW/HPpeELyGUfRBXFpnwZ4zuCpFy7Otl7IYx0J920nuB4OR60o9ua8yr
	 D2tR7rGI+B2irC065vXOYCfBNn6W7bDG+9BQv/kX7CTV09+tM5gYk1uJFYx1Z2JxjRtCR
	 wNxXtaxCRxP6U7ed+chtLgfE9QtGL8Rp8kxJNwteli2Yl7EtgB4EL3ESKs+ycGSv7Lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794537680;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4tT5hFpzZAr8Rid5tP1O0Sqf7A6ODSsu5SatFU1cn9o=;
	b=2TwiKf739ydpxUTKgv7gMPVNpLLeCn47/3PGBX57FcWDPJ/9KcP4cLi3/BSnACvDy80K
	 CeUxgLn+UPOA5Jwp7ruBD8LrpBOYsud8pWwkrjJCudgAEe9Qz5ogUO1yjYCQm0FSdPwyR
	 LLTRLZI5cE4z5Wxd7yRJmY/dy1ZtjAQeJhrGVDDsj/2gS35qYMDA/v13NdCep5bBPzYNl
	 Eivr7aFR3rYwqHtiyDSMTPf/WN5QITEmN2zgOvWAlkkVaJznYRoABmxZ46iyT6+7L4H19
	 GNYK5QtBPDuR7HRBHFmS2d3SCtI6bOCUf9PPEydUvqV1eQ4ibHm8etuk2dXIdmyA50g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EeUaleQE;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F800606A338
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 02:41:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F800606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EeUaleQE
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-33c10faf6easo68444eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 18:41:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794537679; x=1795142479; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4tT5hFpzZAr8Rid5tP1O0Sqf7A6ODSsu5SatFU1cn9o=;
        b=EeUaleQEga7fpxbRgo28RXvo5vCKpzkxGoUsRH2DYUHMnsNYm7LaPG8m/oax6Di4ds
         RaArJAMT6xGYP6qran537lNL7jTjpXuEZOXRnBMzu+f9LBGVX12PSQZ0y2cG9hSpbUKX
         kpJT/FGZYt8tTahCaIBmLGqqKDznPoHVAB9Hi7MHW449A5sCsfYhp8Aaf9MO9RUgFQ8C
         uJiXC0EZDteyQ7W+PkKpr3HHguEfY+rTvIio5Gcf+lSGS35rqYoh8Ns5hS9MXJW543z4
         1I3F0rx7MmsayYhN1XicEC3dWJR+rzPwVcJ86VwVVlTZXCz0vXnTsgYY4V7BjBYvRdLL
         L7rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794537679; x=1795142479;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4tT5hFpzZAr8Rid5tP1O0Sqf7A6ODSsu5SatFU1cn9o=;
        b=SkyFn44/AY7gfUImRzNvNwCisMgvcurssoFKdHncU5wWKDygluNmfKBImBV+l9Djs+
         e0L4TZgfQhLnkVlRLfwpOu6N92zcFcAX67YRWMPOSy+aN+Z+1Xi4DPCeuYzIxWvViU+u
         ybK9q5A3Pf41eEjZzPoRF6wzELsjowiwAq/IEqIG6ZuFmkGhKx3wM/RxaGSn8Bnnbs35
         ux8hZKzgceitQMz9otj4kCPakmnGOHg/FPBwRkB+NiDosWV8tXF+4b89NkgWgNP1o6db
         Xtai6g6EpXXFyOiTHp3uQMnA7Ehf6V7osBqZCHfxRDKV1njwG1w5j2QCuRUbih0UygXA
         gSxA==
X-Forwarded-Encrypted: i=1; AL+hErEDH/DCsTS6n/eoOY6bqe/+II8ZpnrmqcKt0QWzhU+uh95xJ4pgN3SsOvuRvB9zUg0R4YjTvFzgzObsJvE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/7hiKs0kYL4fag566vIZv4sq/GvY4c8kRkCwwT4J1GbFsFmeUa
	itJt2AwTYYP31gQoyZNqiqzwbXHUULxb7fOm5cdKnXGzwyMlHYkfTahK
X-Gm-Gg: AYBFou3VQUyWh0J2dMLqaQKygdZ3uVgvOUiyVXgcO8QDM3zsXDRe3nlPmH4Ko3fIIkB
	a81ulLxUDdcBwTKl+8mxBQYnlnaQMCeTT8jaiNt0vigBuwdxd7xysNg9MGkSDGS/akMLH5op/U1
	rmwrY07sXCQ/5Wm6v2L511M4qEKkgSGHJikX9O+hvoVVKyF0JM2sWY4pMt+0gwQqR1Q5tps2bqx
	W8f3m/s5L4ZDL5ozCqPqdB9vbKotf5Qr3a82qdlcNKMovtMOMbWrF0yfC+tHITdnwQCYvFKWKdt
	daicFKgtzM1LzB9HovK8Buu9UlMDfwL8xPeq5H7Wy4CINJCuTRARgGZ7ymrAnbM7/1q729jOfR+
	+EaFZKf2MhC1Zxb+BVYJIBQTrDaKikz/QzahVbxhqsSL/n9RUW9iX6Ae7C6FslWBqhQvBdqokw6
	qu9tSOW62b3rxDvcSfRP7oQYuuDs0WvyV3qeNc2QXgj2DsPOVmq4dRYhG2Ux7SKVshpdq2Tydei
	ds1bScC02zN/9OOFMNf2g0561Np0MHbuDfW5gIHZCEv+VpkCKW/ivFHJ3HQMTkHdckDue0l1653
	a1qybBUzrHqybo91h8GePRLyBvMTuZtUJMV4lmNX+i8XTAWRfxpIeAaF/wOlcXiLWaN2w/jMSxQ
	YDEvUJesBn/sDT4k8dll4OfBYnSbheNP6es77cFpN/dNn7OrsZ/lSC+NSOjmbGMswxu2xpPOypC
	Oo4Vw6RaVLhQ==
X-Received: by 2002:a05:693c:881c:10b0:36d:5fbc:8c8d with SMTP id 5a478bee46e88-379655d503emr1470847eec.2.1794537679252;
        Thu, 12 Nov 2026 18:41:19 -0800 (PST)
Received: from esteban.tail1178e6.ts.net ([240b:c020:623:52c6::44d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379565d07b3sm2334704eec.22.2026.11.12.18.41.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 18:41:18 -0800 (PST)
From: Antoine Pichot <antoine.pichot@gmail.com>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	hansg@kernel.org,
	andriy.shevchenko@linux.intel.com,
	dan.scally@ideasonboard.com,
	djrscally@gmail.com,
	dmanresa@gmail.com,
	dave.stevenson@raspberrypi.com,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v3 1/9] media: i2c: ov7251: Use in-range PLL1 dividers for the 319.2 MHz link
Date: Fri, 13 Nov 2026 11:40:51 +0900
Message-ID: <20261113024059.1087031-2-antoine.pichot@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261113024059.1087031-1-antoine.pichot@gmail.com>
References: <20261113024059.1087031-1-antoine.pichot@gmail.com>
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

The 19.2 MHz PLL1 table for the 319.2 MHz link frequency puts a
pre-divider of 1 before the multiplier of 133 and a divider of 4 after
it, so the PLL1 multiplier output (the VCO) runs at 19.2 x 133 =
2553.6 MHz before being divided down to 638.4 MHz. The OV7750/OV7251
datasheet (rev 2.12, table 2-11) limits it to 300 to 800 MHz.

Use pre-divider 4 (register 0x30B4 = 0x04) and divider 1 (0x30B1 =
0x01). The multiplier output is then 4.8 x 133 = 638.4 MHz, inside the
range, and the MIPI clock stays 638.4 Mbps, so the link frequency does
not change. The Windows driver programs these values for the Surface
Book 2's Windows Hello mode.

On ACPI systems this table has been unreachable since it was added,
because ov7251_check_hwcfg() selects the wrong index. The next patch
fixes the index, so the two must go in together. With the index fix
alone, D. Manresa's Surface Pro 7+ (IPU6) had CSI-2 errors in 7 of 10
150-frame runs, 3 of them stalls; with this change 0 of 13. A Surface
Book 2 (IPU3) streams clean with either table. Dave Stevenson measured
on a 24 MHz Raspberry Pi board that the out-of-range tables miss their
nominal frequency and proposed the same values [1]. The 24 MHz tables
have problems of their own and are left to a separate change.

Fixes: ed9566ce1946 ("media: i2c: Add support for new frequencies to ov7251")
Cc: stable@vger.kernel.org
Reported-by: D. Manresa <dmanresa@gmail.com>
Closes: https://lore.kernel.org/linux-media/6ae0e944.b6db0abd.16b13d.d261@mx.google.com/
Link: https://lore.kernel.org/linux-media/CAPY8ntBFJJPg3y46gC=bNq_55QifC7mKmeq8+pAEDVN42fGUXw@mail.gmail.com/ [1]
Signed-off-by: Antoine Pichot <antoine.pichot@gmail.com>
---
 drivers/media/i2c/ov7251.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov7251.c b/drivers/media/i2c/ov7251.c
index fce6344b5120..f429de5f1f7c 100644
--- a/drivers/media/i2c/ov7251.c
+++ b/drivers/media/i2c/ov7251.c
@@ -174,9 +174,9 @@ static const struct ov7251_pll1_cfg ov7251_pll1_cfg_19_2_mhz_240_mhz = {
 };
 
 static const struct ov7251_pll1_cfg ov7251_pll1_cfg_19_2_mhz_319_2_mhz = {
-	.pre_div = 0x01,
+	.pre_div = 0x04,
 	.mult = 0x85,
-	.div = 0x04,
+	.div = 0x01,
 	.pix_div = 0x0a,
 	.mipi_div = 0x05,
 };
-- 
2.56.0

