Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 167903C76BE
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 05:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787895980; cv=pass; b=O3NF2FNMh/ScFlE3UYcGzEM7LBzxxKdV4GQ4i12aFidTjCSZsEenHSQwWTrvFPR2D59meFTINnyVCqVTVDA1IelaqB1TaBV6WYto7WB/gvFLH41soGp1F9fP8xHYQ2UEJ0fhXumVz0oTGiaZvbcxg6eDEV8Ny9x9Y/T3GAJVpQ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787895980; c=relaxed/simple;
	bh=3mzePdxBZU/3WYB/4lvrTeALz11TsrQx6TVNX0NuogU=;
	h=From:MIME-Version:Date:Message-ID:Subject:To:Cc:Content-Type; b=GZURxZdvgyjlOvm5uFAGGmzOW6YVchlj7CafLx8j1+bsEGYYk86XKpop3WZmC2wsRUUeZ+u/4sIaN/p2Byz5AjAuvXXd0OFuVE3huEuIpfMox0yegWGtpd71/aYfooFthf3uiFS1aw4jFK/CtFeQHK6iGFIFOwLgvn8N1iZUg+c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu; spf=pass smtp.mailfrom=berkeley.edu; dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b=ZVk3NXk7; arc=pass smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b="ZVk3NXk7"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2d71e253c90so6012065ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 22:46:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787895978; cv=none;
        d=google.com; s=arc-20260327;
        b=b+3hwr6GqqHqGhFdF7DpxBisY74XRu4MsBx+25gk818XX0b8ls4hOqbHWn7+RXjI5k
         GdDxAT0z4dxpsbUV9+c98hXFh5yaAeWmDHjia4ke+kGEmkdzkMHW10B2Kc073INLAdpz
         I8gOWy3nBKDRlqy/jlqCYGFaHd5GFcRIGYsAkrKC6pp7koLHToAJkUrmKcd3uiteiCt5
         zraa1vvBbtubRa21LOBCone2oyEKtGUBNwdvayP+WDtL/cMHmwcUi5a1X57W0ABnrtk1
         vHqExeMzNurnfxY23rkb3cMM8SItdGln4tT08vXHRAryf+7JAyIzGqaTpVKalDwoCGA6
         2W1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=0GUepPC6eQwQ4aTuikrhpmMNCO3bQ+7a/vXwuKLRNKU=;
        fh=O1uXlw86RWc2enjHMkZMcSG0Ur7Vc9IzLhFNPGbHtTE=;
        b=VAPrsEyTtpCLn6vSnyLDUlgaJC5oGu+03jv+GygPsRWFeyABY186aHmfVo2SJ/k1aB
         vToxGC0OgjAOu5HWZ3hctoj25TogM9814CNHe/L3wROKf4oDnDa/CVaRMA8eVhoqFeqO
         7MXNaDdLEb35vbngCCuXOleMokMcXkRuDQ4tja0wdC4voJ31kweUR3iu75f1UfaiB4Uc
         Rrd/hp1PSNJA7TiukM6i1hmrb2ZXbXJPTtl7CzWv+wj/FUumfFl7d3E5nRZ7e3z7lKjX
         /MjLeis9tqTO/h4jyvEfvwpvW63X1Y7rGf2W9D3x+no2KI/JDgVyaD+A8/MpY9zuFfvP
         wYSw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=berkeley.edu; s=google; t=1787895978; x=1788500778; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0GUepPC6eQwQ4aTuikrhpmMNCO3bQ+7a/vXwuKLRNKU=;
        b=ZVk3NXk7GQ6ecYx9QcxJBPyd4MO00O0pY7OP2vYI1geEUvXF8gSq11xx7quvCOGsuy
         AvDNuyAjyS4XvVai6iquWFkI45tLTDNbILKXlQPsWVWrC+T9c9AfXWp3yumLO6c0k3AL
         RTl9TtZYRlkUUSH9ntAEP80gjx3li7wpvsnHoCvM5pqqHy2Ye5UBX/CDbOIMT7yC7N2m
         uRerS5bgwEfbF3ccZb95tzfWYB7eVadL/hb2gXtRQVH2t7lypbQ1zUCzWI1Qv0qf4WC2
         Fj1Q3n3fwlbbsR1i6R2mzvQpu1dUf7LfaarsAlJJBmfNFJIKJSt55Ij8SOzTn74QSEzX
         VW/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787895978; x=1788500778;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0GUepPC6eQwQ4aTuikrhpmMNCO3bQ+7a/vXwuKLRNKU=;
        b=rIBxvnAf2tFoLHModOhfJxyw4bKqDUF+BfhIHFSKEYMMWTJ+hXp2dCmq+FX1nfB6G9
         6ZRMUfqaEpvof8paFC6Km2wvNDxdOSiEhKOfGNT7ozgzhlWhfR1VFnUvSIpNI4MVQmvg
         BRAkBjLVLLIAsU6vZGviMLuuFy8EU3OrnVomU4Q8DwaA/jwNxUAYjQ9LPR6zljHldk8n
         g8AYTx5g2otN7e4SpISxgh/P/Uk5OGz1UihQSK5y65A3NmLHiK/0Ue/3E0fMRiS6r5kT
         UuT2/Oe57kvX+aMbjCOh82s1GdJ25MlejJu0HZjriCxKJXmH9fcj1mT/lib3x+SXB4V8
         JvDA==
X-Forwarded-Encrypted: i=1; AHgh+RoVO9hUzLxTjx+lcLhsWxi0e9MB4lAvUnY5ZUouMUTxDRjQfcBIY8GeYcpgG8pAekx7IGxNpJzVKRsz1/A=@vger.kernel.org
X-Gm-Message-State: AFuF++lH0/Ji5W48pFM0lX9rGu++X8Sa2+Peu6UNZ8ToBCuz4Q7r8sGn
	oWc3ZYve6J730d7zsh8dNZfEPlrfyfVTR5Q090KhRIekZMbCOS/S2UNd4R3CRAb+xqrA2XMhBMy
	B31jxAL99/nTp4PRL+1DoiA5cJmNy4W74dEOr1dDf
X-Gm-Gg: AR+sD10L3osAvPxNbfUrle+XF+419UCCL8FKaaDWnmwJldvYR3RFOiAkKUmbX6dhArq
	d7BqPosWq4DYmcKojCLzCG2qPE0lYJooPUV1yJCth5SKNZrqclWrH2vBXqPsq7iP7KXeSQ/iNkj
	iE1H211IDeQK2OM5Ad/43z4inlVBGYZYz+qSjhAxgi0k2z5E4uRC2MQkvB6UqCKYvYLNOLVQ78W
	Vp9VnOaakuMbJmqUaxD2dIi87qGYv4Ks/F5hQzQRpqhSCSLe65MjvJT+yb9yiKebVBkByW+kbwO
	U8F+8chUCScc8TKTXg8zKe3anOFaQc+Aq4+tRnMiY+bgHmLtfvwlIu/V717OqaNKwhcKN+Mj2IU
	aX/7XRBURyYFIDxYG4M4TgeAIcDoRR2rJ
X-Received: by 2002:a17:903:15cf:b0:2d7:1aeb:739 with SMTP id
 d9443c01a7336-2d74e1295c2mr86465035ad.13.1787895977223; Thu, 27 Aug 2026
 22:46:17 -0700 (PDT)
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Aug 2026 22:46:16 -0700
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Aug 2026 22:46:16 -0700
From: Farhad Alemi <farhad.alemi@berkeley.edu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 27 Aug 2026 22:46:16 -0700
X-Gm-Features: AcwNN1X4mXiwbv-zD7khlznKWnAht63BaDjhnKiIcjF9IZjcchKCLalWAp7F7Lo
Message-ID: <CA+0ovCj14CqeH2qH-fxDdvdK3Tp=rgZM7opqOp0PkYS52RmOmQ@mail.gmail.com>
Subject: [BUG] KASAN: use-after-free Read in gfs2_rgrp_go_instantiate
To: Andreas Gruenbacher <agruenba@redhat.com>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>
Cc: falemi@asu.edu, gfs2@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

As part of the kernel research at ASU's SEFCOM
lab, we hit the crash below. Crash reports can be found here:

  https://github.com/farhad-alemi/public_bug_reports/tree/main/177-kasan-use-after-free-read-in-gfs2-rgrp-go-instantiate/

  BUG: KASAN: use-after-free in gfs2_bit_search fs/gfs2/rgrp.c:188 [inline]
  BUG: KASAN: use-after-free in gfs2_bitfit fs/gfs2/rgrp.c:249 [inline]
  BUG: KASAN: use-after-free in count_unlinked fs/gfs2/rgrp.c:1159 [inline]
  BUG: KASAN: use-after-free in gfs2_rgrp_go_instantiate+0xb0d/0x1340
fs/gfs2/rgrp.c:1238
  Read of size 8 at addr ffff888011445000 by task syz-executor/17182
  Call Trace:
   gfs2_rgrp_go_instantiate+0xb0d/0x1340 fs/gfs2/rgrp.c:1238
   gfs2_instantiate+0x151/0x210 fs/gfs2/glock.c:442
   gfs2_glock_holder_ready fs/gfs2/glock.c:1250 [inline]
   gfs2_glock_wait+0x1b2/0x280 fs/gfs2/glock.c:1270
   gfs2_glock_nq_init fs/gfs2/glock.h:253 [inline]
   gfs2_inplace_reserve+0xc43/0x3420 fs/gfs2/rgrp.c:2093
   do_sync+0x64b/0xca0 fs/gfs2/quota.c:948

Our reproducer.c is available upon request.

Happy to test a patch if that would help.

Regards,
