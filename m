Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB8647F772
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 12:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788524358; cv=none; b=cEM3nqM1ky2XsrHVXLy2XC88z5AzrE2h2/qH2kuovayjYRfKx7ntc6mEridQl3YAANvGAOgu0blwXnKfyKPO4u5lxBP6iSZbFtHqxXKDvkV1d/lvJkl7yXz3vs4ALCn9PtI0bC4ohqiAjNU1ZQH/qM01rxy7B+o0D56+bz44Ru8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788524358; c=relaxed/simple;
	bh=vvS3Rv4YntYOjqCfj3skTyPfQt5gyWvTfvOz4/CYaAg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OSx5tiBEPVAyVT61Tfo+xepfxOlOPo8Q6W4xH+9v+xoKrsCKruXHvfyb64+vDKq/RJgBIpmrdZxf09bZlTjN1KAquVHeut+vUOGv7EaRC2ichTmGcu/KxWz5/Qi7XcdgEw97qcE2k88r+wEn66pXKWgySkdNGI9KJxbxZDt82Mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mQhyO4Ve; arc=none smtp.client-ip=209.85.161.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mQhyO4Ve"
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-6b0496f4bbcso613445eaf.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 05:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788524355; x=1789129155; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gvBNjOwLcoWAJdkVEyBhPUyq+5YnsgxiEoVDt3HxEAE=;
        b=mQhyO4VeAmKeQnz4Dg+GZIVAKsxncr6ENUamcY/cxkuvrshaIjI5vx4RgjaxCZ4lzG
         CrAVXo8HEYbxddp1SjnFbOroFWJ3r1dX2+MK48jMxBNpHgg+2p7DnSBJ7mj2zm3t5dZl
         9rtuHaA/rFlsTQrrj9ExCSy8D1I0PlhBSNUEsE+yCsYLBFThLVVmq30yL3DcHcEFDyma
         PVFoUYk3PnwdQlMVH+dAPPXKC5tQT97Jgsc6Oa98T7/4kJ0p/enUtk3pasMOVjyU5AxK
         dvY7A/U9KQ95+VGmLugaX/RZQOgcr7op6Ch5ej8dGPG72RwZHO7tM4liR3gDRYlLEkPL
         HLWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788524355; x=1789129155;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gvBNjOwLcoWAJdkVEyBhPUyq+5YnsgxiEoVDt3HxEAE=;
        b=kXyH6zC6JbJloTmMMYX4zAiu30vjNxmq+n1fVZHeiBWog3TVy8RNqTcfHnLB6zKglz
         +aCXv8GTLtWlG2R8HEv1sRfvvxuIBvIWX6o6XasyOs6JRBLgXzy2Vy1Fp1iTtmbhj6Ke
         Hj5vFmg7mzHKtgBZpf3/XOL+PyOpnkp/x3isCKxt4UGJs2EuaiFeYnVHftdimQQEh4T+
         ERXQRRCW+QqwaO11s9lk6Yz4tBmGP4tdmxg49/wQcBI42J4sGiVV+htiJK50xKO2fPrL
         vHUtR0+RMDQYOTh9DMnlF9mxTMnoom4sN8NkB8m6eOAK61g5t23vt3PQYWBCx9BANPtJ
         CHgg==
X-Gm-Message-State: AFuF++klMBUIq4DlgPhII1LsNDHjMe+F4JfqcyK6CoXQsHc2DnVlmmKm
	8El4/2VTG0WWTV8WOjCphiYLox7IrIwIPoEXX9h65w1HcD1/Pvku+Ewd
X-Gm-Gg: AYBFou2umWzswIxC5ek4x5ewWgJ8UupOqJmUpBKwJZoBCKCHEiqVKaA4Ygw+m8yeIG2
	7/9N7xn7H0h3D303AI+f6Ttn5R5yFaCyrWZJTfBL/vaqsKBREEQQknK8KKo7OSq3dPeFc/HyFJZ
	EOK4lnvo+WFp5O2tLm55eSAKqmEdztqZEXDiTl321XUjgmLZ+USjsw5aYL0NhIIJHISKzp3PIlg
	B3bQcOgWvEME+WKnuC8BsMAfX2zP3hXBegBNuD4+VEUHH8Iyk2aQf8DOop4vwBU378ghuXhuuAv
	B9p3VJpkQtr0fv9HdqIMgjxA3INZl6/3l+MwwYeZmJZEjSw1kAHJngdXJ4sO5mHELsmh0mWbYWy
	obk1YFW1MXXQ0/hE7qtPdV0PYIYMtVIfwwa6oNH4nLCTSSwzXVyTSxv9WR3P1wE+eXi8m05SNbB
	sZ4vkHvMW/5bCKhYQTsrwMJHmwTlkDZ/bmcsYdVC8bvkfeGjO7ekftMM0KUVt4r47zA4uouoJHe
	8pUMcWmpbFWGSY=
X-Received: by 2002:a05:6820:4d09:b0:6b1:a667:f0f5 with SMTP id 006d021491bc7-6b6fcedc374mr3923445eaf.20.1788524355505;
        Fri, 04 Sep 2026 05:19:15 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339a62be87sm5795672eec.6.2026.09.04.05.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:19:15 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Jason Wessel <jason.wessel@windriver.com>,
	Daniel Thompson <danielt@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	kgdb-bugreport@lists.sourceforge.net,
	linux-serial@vger.kernel.org
Subject: [PATCH] tty: serial: fix typo "inteface" in comment
Date: Fri,  4 Sep 2026 17:49:08 +0530
Message-ID: <20260904121909.27377-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "inteface" to "interface", reported by scripts/checkpatch.pl using
the misspelling list in scripts/spelling.txt.  Only touches comments, no
code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/tty/serial/kgdboc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/kgdboc.c b/drivers/tty/serial/kgdboc.c
index 09648d643897..b4aa117f76d8 100644
--- a/drivers/tty/serial/kgdboc.c
+++ b/drivers/tty/serial/kgdboc.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
  * Based on the same principle as kgdboe using the NETPOLL api, this
- * driver uses a console polling api to implement a gdb serial inteface
+ * driver uses a console polling api to implement a gdb serial interface
  * which is multiplexed on a console port.
  *
  * Maintainer: Jason Wessel <jason.wessel@windriver.com>
-- 
2.48.1

