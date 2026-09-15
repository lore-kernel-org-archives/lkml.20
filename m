Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1D062F8EBC
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 00:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789433696; cv=none; b=XzdgvqS0psDFTH4VCrhqneVqF+rydNmLCkCgkmoD1ntTleXXgnXO/Gtx1fgEpNAsRNZ7aNSPCew9NwFlMekzpZV1fFVKmaZxTcw6YZQMbWHEy65cABDhSIz+cc0qXTzLsUtoZUzDe0Pp2FXPjg9WrqRr2hEH8eqtthF8UT+ekVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789433696; c=relaxed/simple;
	bh=jtsnuA5ycq+UgmN6OOcXxBfjzv8pUq5mMUCzSwpDgSk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VYgzlEne/0dYajFS8R87GUf0lEfbFlteanB0Ntv7EPtVfV24FRpRHvg0qX1rgSR0Sp4nMPBYEE1/kvTmeqKW+scNcZapAf4b3JV7C2+n/jtgCRvBlVfcisOsSHHCERgzKkFv2yZ7/RzGlSXDRrjQ1UfU8Jb/DZjwdRcCjdoSXSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=swiF4wzJ; arc=none smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="swiF4wzJ"
Received: by mail-qk2-f12.google.com with SMTP id af79cd13be357-939695b5741so316506985a.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 17:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789433693; x=1790038493; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wPbpaLTfdjYqHBQHnPbcqcrKPKopAanNoJX+x2503BM=;
        b=swiF4wzJBxx6UGfZG0rpviFm9wPmwjrjWSMG9zDmsvGRpz38aL/Hs7YUMziiYkjFk6
         jvSMwyIBNAgIBe4mCQgK7Gzcmm6RtS/ZU8ehoOGiv4p0nBlR/cH7JGz5sJsHbcsbApHQ
         RIabwAJERaT1cK+qSRVogsATexOXfibcyQUFr02jrEP67u/p3N1/sl+i3rnx8MZLT5V9
         VFJfy2G5oBv3g6zYdD8rfI2kUdl4tm2h3k0KxMdY3iUvXab7iMH/AzxUFQz/7La0PhMM
         AaftwdqzsmTLchTj0qDYXa7ickQ48SWEmphN7jkqJCsX9/WTVPHutQqC1Rj5Y0jl1Pc5
         a9cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789433693; x=1790038493;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wPbpaLTfdjYqHBQHnPbcqcrKPKopAanNoJX+x2503BM=;
        b=T8ASMzT3GVCi5+mrVW75MD/Kqrg+U7ZLAQoNHxUiHyZJvS/PDRunVkeLqJ8SasqhqC
         V+0OlcF1r8mwg+/uV8t1YnDqYTKo15Aj0vNwRVDDhSUmJhJ5H4QM8vhskH3YMiwo59QN
         Y761SfwCLBYJUCmh8zJmhLQIU4BmDr5RWn5EpG2drlEF+NDr1Vb7qeGwGeYyQC+Jb2Fn
         6oQJlK+VxABW5Wz9uThriU6IefoqFKU+iOh94gV9qCZOFoNxAcd/rB8l1B1wtcFv1hm1
         BeXd35skUVf4kxJrAOvznxr7lL4Df5hBhp97RMxpJs/deiDMadUu4Zq6t70L4w+du0MJ
         JUVg==
X-Forwarded-Encrypted: i=1; AKwUvBwaYlYSPQZ7BxLI3Aoz0wOCPjeioQa9dduPTXS9qLlcWAI9/RxjTMVReDoweaIj7hGYuqINlb4yA3XBvgU=@vger.kernel.org
X-Gm-Message-State: AFuF++lU5uuwOEpQAE68t0XUUWxmSTtAlO8nNgrcfPaonvq2q6Df7Jfe
	Iv9qdhX8yyOow1tSD1ydRADrkjHp9fLSToZshzkk7zAEuOZnIePmahQnJRKlORg=
X-Gm-Gg: AYBFou1HIppMiyJZXG62N1GUgAjgzkWnHzUvcC9xzQDy07CIbtgLECZgkkg1xAAEyDt
	s4jS2SaddutlycNOm1TzYdyJbtHJizsnMcFKgA9oMoXl4WA/iFw7fr64OvjCfr5K/nAOt3Ug7O3
	mA3n13fS8FPfQIIuyG5tR8P6twur7YXK7sp34CDwCKmI72/AqJiP2ukFkwDYle/9c01qhQh/413
	WbzV6PctKnp3rJxEuVTHHZzKQa+/d7sUwaLcRpZCQ4Ys57jM+lejLvzwlJ0K4AD3YqSZ9yuri6F
	CqWAt2t+l1a54DwMm3X3/yCqB55gqHKfSyv0Q+0mQ8YGd3fOFthQbZQuWV+wJJ0ITHLxXXxtV0I
	NhKXZ8xeLe6RotcSifOh/bd29exElfT2BmjQJLcoj6vZdQUkzrOBqyioJWtnQm3jiW18MQ4FXiB
	eIl3ltFf1M+NQEfPnOgdviWkiMGQhQI5S4KS1mqsDFmp3pS6AhrBRCyjUMP7gbdDJlMoIwXolkB
	KjdwBKZKhJ5Us6y2oJH7fITEh7zmqKk3RhAJ+F9KUMhh3+urmIn9x1RRsDYEABIEoLkDykQbihN
	jtBfCR9tQ8McNJIyMIovN4bIg+JSgV0bgzjXgUzpzxUHfHuwhMrrCLvELz7td4GLP5NUQ92f7Vo
	=
X-Received: by 2002:a05:620a:43a2:b0:939:6c31:2318 with SMTP id af79cd13be357-93a29a13b19mr830053485a.34.1789433693467;
        Mon, 14 Sep 2026 17:54:53 -0700 (PDT)
Received: from 6e-wmo5420-02.ad.psu.edu.net (6e-wmo5420-02.ad.psu.edu. [104.39.213.233])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f4b3dcesm108370476d6.31.2026.09.14.17.54.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 14 Sep 2026 17:54:52 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Antonino Daplas <adaplas@gmail.com>,
	Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] fbdev: nvidia: Release write-combining handle on probe failure
Date: Mon, 14 Sep 2026 20:54:47 -0400
Message-ID: <20260915005447.51995-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Failures in nvidia_set_fbinfo() or register_framebuffer() leave the handle
from arch_phys_wc_add() allocated. Release it in the shared error path,
as nvidiafb_remove() already does on normal removal.

The missing cleanup was already present in the initial Git import,
when the driver used mtrr_add() directly.

This issue was identified during our ongoing static-analysis research
while reviewing kernel code.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/video/fbdev/nvidia/nvidia.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/video/fbdev/nvidia/nvidia.c b/drivers/video/fbdev/nvidia/nvidia.c
--- a/drivers/video/fbdev/nvidia/nvidia.c
+++ b/drivers/video/fbdev/nvidia/nvidia.c
@@ -1424,6 +1424,7 @@ static int nvidiafb_probe(struct pci_dev *pd, const struct pci_device_id *ent)
 	return 0;
 
 err_out_iounmap_fb:
+	arch_phys_wc_del(par->wc_cookie);
 	fb_destroy_modelist(&info->modelist);
 err_out_free_base1:
 	fb_destroy_modedb(info->monspecs.modedb);
-- 
2.51.0
