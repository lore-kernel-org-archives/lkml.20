Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E67D368D55
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 02:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790130341; cv=none; b=WPzJBJ/IYRCWtrZsMisNfvi7H++KL9M31rBiw3IjTKNxLi6Ix8sALg4FO1bFD8Sw7hC09J3qrGIF/qnsAoRBv40/EzVHMJ/z0osUKDH9PJlsgqn+LZPKsXGDweMzZqP6y/ceFRKGgJIRsGC/dLWeluZl+nCwZyLWT9NpKcpAePE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790130341; c=relaxed/simple;
	bh=4vHSLjUiiivi80NKIZM434XlQQ2bTlJx5rN8ftXtfls=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BoweesLOJEz9hURW6bVJZ+hw199e3poc1s4KAtiaPVcgY1fSTSwvNdKitxGR+qEFCAtevIRdqjGG0XLvjKTVs+Tv7gLoawkBnzhvf3RTSB1Vb3juRmKHX3AOkeXZYf8FVxbgYpRuv/jf4YPVqxwitc9Sw9iBy/yPFfaV6GVRETc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GXDSg3BE; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GXDSg3BE"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc4d04d740cso286347a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 19:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790130340; x=1790735140; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YgscQk7Ar8r9xNVFdDi2QgmLohb1qk8AI+LPa8A9QYM=;
        b=GXDSg3BEt1qV9dG1OtaQ6y3aBxRTXTvxleVCAcf0yq/woRjgMLlhbSrCCqJq5DzxWl
         PnGfn+dibDgXDU9wnQvvq0o/6XtmCCdJqdyWShaLJWGtvm9CdzaBH6SDRXMgrl6tfm1q
         5chMFfgkH2CH7Ntrf5rKian0KGg6hHQWJ0Q1g7VoUMSLF4je7HL5txkCZCyHyXqGihrQ
         iD6f2J12bTsiGojGJckQkyQsS0pUmTRzSitNcd4BU4HyxyrvH+BSa19gfwmsNRGUKJUJ
         oUsBr2WxLnW5p9Kr2X+USNAVt8w0Abc1i4I0FAI6+g/F1s00X7D76XS6vxU7mM4qlz6j
         XvZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790130340; x=1790735140;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YgscQk7Ar8r9xNVFdDi2QgmLohb1qk8AI+LPa8A9QYM=;
        b=GMldEkDWf9w+xPOQZV/0Hlcnisl731zG2wyldpgo5thuJZDZFH9oa8cyghTxf5ZgWf
         m2EG3o/5cF6+VDjw1Ms3jUSrT8NkVr2nw2+Yj3lttoMsZJ4xAEVNX9uOP6UUdziM8jnH
         ca6c9Efizp1SUcUF5WQAjIr9cveDrUEqtdAk9hLqYDTg8im7Qb5hrJ8uNTmbxUFKH9Vk
         7WD8a45GhoF24w0vCjr514xmdNEa5drC8Xh1V6dgMLkl0PVTQvPtIAy17S4u84vLcqlT
         BDt5TMJK2kOQ50s5KLAPFyQYiuW+d81tR/19si51FrI9WU57sXDO2GKMSeHzatjIGGdg
         FiVg==
X-Forwarded-Encrypted: i=1; AKwUvBy/daNl11RP+szJ28ngvWdTtHw4HDR1CJf+7JjCsYnxmsSPhVprh4OdBlLjs3v2q/XbGak6kCoSXOlI47w=@vger.kernel.org
X-Gm-Message-State: AFuF++m5z35skLtogq+xNM4KXo7Vy7XSTffu4z7MrHucYM96qZDJHFr7
	UH2falRaAe0U6sPW1PySXfySjnHhIClcUIm0MQ8QOy8lW0TP43unZ6rS
X-Gm-Gg: AYBFou2eNHN/SoleQjmQoqlsGhr8T6e3OjQAg7iQFER6nWHQhDbnfS68CpJnhYHSKXl
	JDh5vit8uwwZaVS0idykodkU1KEaRYOpbTQpedPLzmjwJEhjdSiQGo/nByy0ForrPrYfZa5GsHd
	74tO1TpEsfEJn2fVFbbdFZB/0r8Jx/cfht5Lhs+RLURaZoKDKkl2zwPRPIuAcISkwcX3PUOSfy5
	baPzTP8JyjSDiA1S//B9JaP3y9tNuEhlvxBibVhwCTwz+S1BBYVX9T3Peojyr57Sjy5W5RqYZp6
	O+tVtGr0qXtJXF4nmX/DYUiJ6t9NFfwhZla76SzJthyoM+hEHzqwZWjuClHSXOMwZshK7XCfkTP
	jq3NmMgTZISoK/7oxWEBg6m6HUGkAXWTKZw45RdyRXzq7TGzB4yRz1OW2hpQrCbOt7Vz4I82QDv
	h9iUGccrBhhf2zaWLCS0e0lW3rgKomclo3XniYDJIGkxBPtK6/i9JG94FUNp7B7dgl9MUafI6HS
	1Fc9eHsMxTjLeWaMYhYM9ILbdg4FA6Gjyyhcy4RyWwWU51jgpdNG2zYsrxyLIh3
X-Received: by 2002:a05:6a21:730b:b0:3dd:a195:fa16 with SMTP id adf61e73a8af0-3ddf82fd6d6mr1278376637.59.1790130339718;
        Tue, 22 Sep 2026 19:25:39 -0700 (PDT)
Received: from k1832-XPC7A-R57-GD.tailc99621.ts.net ([2407:c800:5a41:af7:fd99:3ec2:4e58:1374])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc75f40839csm309403a12.30.2026.09.22.19.25.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 19:25:39 -0700 (PDT)
From: Keita Morisaki <kmta1236@gmail.com>
To: Austin Zheng <austin.zheng@amd.com>,
	Jun Lei <jun.lei@amd.com>,
	Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>
Cc: Rodrigo Siqueira <siqueira@igalia.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Keita Morisaki <kmta1236@gmail.com>
Subject: [PATCH] drm/amd/display: Fix swap in median3() for DSC rate control
Date: Wed, 23 Sep 2026 11:24:51 +0900
Message-ID: <20260923022451.3346675-1-kmta1236@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

median3() is meant to return the median of three values, but its last
compare-and-swap step swaps b and c instead of a and b. When c is
smaller than both a and b, it returns max(a, b) instead of min(a, b).
For example, median3(2, 3, 1) returns 3 instead of 2.

_do_calc_rc_params() always passes 0 as the first argument, and the
second argument is never below 12. So whenever the third argument is
negative, first_line_bpg_offset (and second_line_bpg_offset for 4:2:0)
is set to the second argument instead of 0.

Fix this by swapping a and b in the last step, as intended.

Note that this change does not affect valid DSC configurations. The
third argument is negative only when bits per pixel exceeds the
uncompressed rate of the colour format:

 - 3 * bpc for 4:4:4, 3 * bpc + 2 for RGB

 - 2 * bpc for 4:2:2

 - 1.5 * bpc for 4:2:0

Fixes: 97bda0322b8a ("drm/amd/display: Add DSC support for Navi (v2)")
Signed-off-by: Keita Morisaki <kmta1236@gmail.com>
---
 drivers/gpu/drm/amd/display/dc/dml/dsc/rc_calc_fpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/dsc/rc_calc_fpu.c b/drivers/gpu/drm/amd/display/dc/dml/dsc/rc_calc_fpu.c
index b8fc27a5361e..657173d8081c 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dsc/rc_calc_fpu.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dsc/rc_calc_fpu.c
@@ -46,7 +46,7 @@ static int median3(int a, int b, int c)
 	if (b > c)
 		swap(b, c);
 	if (a > b)
-		swap(b, c);
+		swap(a, b);
 
 	return b;
 }

base-commit: 93f51579e7df248780214094418f205253383cc5
-- 
2.43.0

