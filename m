Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D19C49DBB6
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 15:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791301221; cv=none; b=U8SXHyGi2uAMhTt9i8dRnwY31VRFbtKE3WpPPiohMIeYgr78IV0aVZDgklI6z7Ucuph2ZOVk9XBfKksjflJP9fZTlecaZDipQHgOgtvZMw4D5dMQRcvz6h6C/LETAZStQC6KbgUbXFeUlU6zVGsxAmW44qjpS7ojpQhaFgEmjrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791301221; c=relaxed/simple;
	bh=REHjVogXIa6GL1Vv2G0GiJeIjII4qa/ZkiuDbr4SalE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D8p0owb4SCYPL2fCZSGrdElDuFGFuWK78rFQ2DtL3UZ5yrhX9RXeZnIIosgiLNCbBew0iLLvT8ClIidveBm1Z88cga2oOogoa6TDYRfx4fvdduFktJHDGU+qMtOxrUom3DARLbkjNkdr7zatIRjDzwn5ikUbX+pq4pOCjogeWQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sIpgrC6N; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sIpgrC6N"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48b9d8055dfso2531575f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 08:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791301214; x=1791906014; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=m1zrwm7WEKGaGG+VaSydSHUeojXXWf2d+Tt9lDJlBnw=;
        b=sIpgrC6N/AHXodolYCeuBOSaYuVjg7/lsNrbiLq1K58Lu0cpcJNgDs6xdOLdJLrNiO
         IDNE6OI5M3aZ5EZQf788GYDWH7ixuRbaGtTwaapXdXHfQQaNpFGsWxiJMZfqv2edOx4s
         OUNvROQyN40Dj4k8brWPIQztbho6tUrG3GvXkmtQb+UHXevKPV10q1/GRUyVY8enfW+S
         785o6xRUFpMJ2sTRiN79uXKwcSQ707tBhwhPcYT/gVr7Z3pbClXTYTBzbgoG4ctSRYZU
         8ZvVGs5xuGrEVc8mRh4JhTQjZO9l+E4VxGCqbqL3o2zyzdXRRgKFzdUZTrO0/tDAPpWi
         MGPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791301214; x=1791906014;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m1zrwm7WEKGaGG+VaSydSHUeojXXWf2d+Tt9lDJlBnw=;
        b=q2TqaeEu3X1/CMajDGPuFrMjhse6qqwcQ6rohb1VruvVEq8vypOcVV7Dlmg89N0Mul
         vs7ZbzaKvPfr4jQ/nTkj8tkOVBwT5XTVjnEGnXNlmMmlRLvLRwGlnZGJHY9svatYD2Yl
         zqbgRr924Cli+ni9yEVWN9gvNHP5RJfUEWVwRSVIijbgUXIyk40I1174RzPrbBfdobvY
         wY2yFgxZheUb8EHpiAjfA0IJclUHXaAy4+nq1v+ucNeHUEopHdXYy8ALlnEu12p9W6qM
         kQFXXFLDcywbvsB0lfxishhsiPZBlIXaa9hVkciCWZKyw5rM5oeef2hkp7htM4bIm3oA
         46ng==
X-Forwarded-Encrypted: i=1; AKwUvByB9xn1ErGR4TmPKMoUZmoiuHj9AfArDp0/HfMZcyp28huhPwjHfqSGIBotiIFYrUZIM5v2KWhuW/WeEX0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKwCMCoSuSSJl7H4OnPDXImO2lZ3QxvfSKE2fcHMzJyyX4PPmkb
	Ymdana088MUGPyXGRAdL2UOHYQmMa6gIEYXYifD6p7hUJScupIClHPV2
X-Gm-Gg: AYBFou2uMYCfgBehDfAFLguXfzYwYFkgZYjbViWv2ZxPNfa4v3fZWvlEAWtsl1FdY/x
	7y6JraCeePjrne8TKchDWtqNyQVDyp/QTOXoeXky6fmBgVir/Rbw3Zmx0RXd3pDxEiC+88yxDj6
	PIM0U1qA+0SNI4B20pubuSA3iVPKhQUR/9KonQR59VxmAQnW2ZnqnzcN0rFItH5NL2125V+RIPD
	CyKd+1Wrot33FxufOdKRgGSAVtVD7tVbsohrRLW4XeZ0rBWkehRYe2lPDbU0GohnTlqAir3Qc6F
	OVqzrUFh53cJjjzjOpt+6y5htkO3kCuJUAGBmvb8MT/mC2YVt7rUKES58VFZIS1FzALc2p93rJw
	5QXyqWXb4KVlCJG/Z2TsWxfCSEyg7WRecUwEmFMt7+PuVVsMjBRy4oQSDyJxCkAGxTphHNpyiTg
	m1lJyPwrmJraDq0BYBC4eQTb7PvpReD3/hZF2mJD7CNquWvCI5PJm/Cd/Zzh8gDNfT/xT7wgHSG
	AThiZMLxz5z1yZrF6U=
X-Received: by 2002:a05:6000:4b1b:b0:488:8ab9:f73e with SMTP id ffacd0b85a97d-48c47ff6561mr18053798f8f.24.1791301214146;
        Tue, 06 Oct 2026 08:40:14 -0700 (PDT)
Received: from fedora.domain.name ([217.218.153.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d1fec3sm293660f8f.37.2026.10.06.08.40.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 08:40:13 -0700 (PDT)
From: Muhammad Mahdi Amirpour <ampr.mhd@gmail.com>
To: Christian Brauner <brauner@kernel.org>
Cc: "Darrick J . Wong" <djwong@kernel.org>,
	linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Muhammad Mahdi Amirpour <ampr.mhd@gmail.com>
Subject: [PATCH] fs/iomap: document ret parameter of iomap_iter_continue
Date: Tue,  6 Oct 2026 19:10:05 +0330
Message-ID: <20261006154005.232338-1-ampr.mhd@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the ret parameter of iomap_iter_continue to avoid a
kernel-doc warning.

Signed-off-by: Muhammad Mahdi Amirpour <ampr.mhd@gmail.com>
---
 fs/iomap/iter.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/iomap/iter.c b/fs/iomap/iter.c
index c445a38b6..fd8791c49 100644
--- a/fs/iomap/iter.c
+++ b/fs/iomap/iter.c
@@ -51,6 +51,7 @@ static inline void iomap_iter_done(struct iomap_iter *iter)
  * @iter: iteration structure
  * @iomap: the mapping that was just processed
  * @srcmap: the source mapping that was just processed
+ * @ret: return value from the previous mapping's ->end() callback
  *
  * Helper normally called via iomap_iter_next(). Called after the previous
  * mapping has been finished to determine whether there is more of the file
-- 
2.55.0

