Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792697656;
	b=fXUDv23amI7pq8hj4r+RkHoPzBVIlsoANYz8lwl5G7cE5/r2hranxL6tkmpgw2ROn0Nu
	 kRGDmuNlOlUAgywgdCs2fDMiDrewCjW+33DefRQrUnlHhwysPhLZpW7dAsbgsrzoKhYpE
	 Ca8VEQDJnS6TGQeIJprejlyOfyYa1EuNZ7qOMUyp0Vr6+GYG/1fHtVIdjdJECpUC6Tqv2
	 d0juoN56cYU6PQ0QRGEPU/N8gjuefSfEX06uGN8uP1Hu4pWqy37cNlLBGnmmmia1/epjG
	 CYFZwvoVYX3d3tNcXtCRRdkn6Epvnh2VYY8xh1bEkvxL4mkvq5iY4HFNSL42ixBe00Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792697656;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=aaS++5sXoJG/YlcvTtCnJ+zCT8E7XnqY59bgumC6lOc=;
	b=0GuujobMurRLovVsSpA6TFEpKRbCXLzUimgXZDIesnNncDNsNcqBiWTe33Dgq2ELFtmK
	 ZGLLgqoxzcZAYwDIvGQqF6EeM5mCI15ih7yrvrFtZM1ZsxgQAgIIWWt3bn3VynOrJ69Yw
	 u92tGxRhFotV1TkcsJ2lnvkNFNm9i82mvwVTe4gh03XOm1fJ5QxZ439TE2BPcsEm9yRou
	 UkmK8E/0MObGHiMHjut9WDS28PivmoN3QFkyfC4mvCKWhEl+AUBb6WYSEHAz/qYGvEukK
	 DmGl2kHhwFCMWLG8IqjyEIGzcum5qljME56JQ7yfYT7xS73o0VgJj0uBw+yfvMNSMCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BZIcdmkD;
	arc=none smtp.remote-ip=209.85.215.177
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F38606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 19:34:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84F38606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BZIcdmkD
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cc758830601so110653a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 12:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792697656; x=1793302456; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aaS++5sXoJG/YlcvTtCnJ+zCT8E7XnqY59bgumC6lOc=;
        b=BZIcdmkDFuWRXioVUvmtwa6iiAYhCNfp1kXqWNprplg1WdG5YDSVs+jiiE5Vy2LLTE
         ASo19oeZeyoLH18FFDtZ63lcmgpOJ94hQPH7M7qRW1nHe8Vc8+mEMeyQvdBBNHt1bDZc
         kKdMZjgsv1flFP8zMx26EU2gESmRZ4L+IB2yS6DNunWjN8OscJrVibA46RVXDWyosO+I
         lCY3xBDhFrJZNOZ3bF/HBtaemtudgmimQ6ZtFTQ2zDzU53nwhm6Q3gz7HGPzNAnmuXcO
         tKrEiNr+efP5VcXFbPl6Fzp8rRaOkcU29OMS+/R5oDssmWapKsqlww4g82wEnwT0Hop8
         vdNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792697656; x=1793302456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aaS++5sXoJG/YlcvTtCnJ+zCT8E7XnqY59bgumC6lOc=;
        b=LY+5hmhgC5QXqfCPFLqttHy87I6yU8/GpsfbR3M+fHY8Y787C0dUT+LSZa1CWEMJhf
         HLDQDtc/xcFIrNkTyFwAgobfUaX8mu79eHCUKyYUY3ZXHPjji9HZxPaKXTDHeTwf+Rb6
         M67X/6Inrwt+BBYq1A/nhRfzxUNpHmJHnfm5YO5pmqbdUvmKWbcIKgd8fqIPeVvqXZ2y
         bvucDXdUuLqrLDuTmQkazZB0Pa7JMmBkc2bBGk3iPX6E5NWs2lYSCwi9KYZaaTzOMPM9
         9O5SV8P/L38yy5twngkGHmYKuf4L+KS7h0lQOQ7k/HxvcIDQ16gKkeMiQNntmM0TwZp7
         fyUw==
X-Forwarded-Encrypted: i=1; AKwUvByCgDV97a50h6h7M6f2gInmYiufIwuUgnFpH/PiwXrMadM6CB0KKKWuYkoFHr0CzVTIzFre0MiP1sWzguU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJwxxhSN0u/m97oMKhGN12YEbhoL+iLNgD9Vb3FoqpipVKL94C3
	R4AOKRBnvTR9lsD7H9YBOvrTSxqc+XBen/MPF8aYodtJWBr1Cj7xXsdj
X-Gm-Gg: AYBFou31ZE+/6qNgOezc1cnW+2ck0OtKruE00aDWUBOSk3sek+8OtUyQxUBQgUZXIA5
	7eqjkGhIjXLVtGcepiBLm4w7MLunU4EMaPCTO7ftIonG/lbHev75Zuc05YOUzJ+2fQ7DXlg3J6N
	GKEnT8ifjdBIz8Od5uR+FD/TO4eJnM6eiD7xlxNUDjQW4Lk5IKmbd9/PXNTg1Iijdaf/fZ1oKy2
	WsrGP9nhm4J2lWqRHCTs/k8skjNv6XUaswkJgec7Z5B2AYiDEFVn1MGgXueMVFT8lAgImKQCkNY
	nlH6ILmq424XrLpxvMXYjZQbN2Ej+z66V2iJQs3ey12EZcGpTV9YnmnPEU1fc2VTiePT3rnvo+X
	PZOm/1JHeVJVn8BNljDoOawDjPKacTgApYrQx7NZ3N4hoUIhdTdwxqnlHQV3G5OnPL+vrLDlR9H
	6PbOMsVMyqktFG4Q9lR2ih1s8bLM1OBc7PouconHxLvZRLaxbOxnli1OVCfXPckE5SPaHhMp/Kg
	n0jcNh7Z+WDlICsmOnHl/4ZFdj/MjhnizkF6P8g7OMmz4vWM9DKV4BqQax+Qx+6jvaYUBYpxYND
	EjPsqSo/GdXuBGXPVL6CJ1Wjszqzrive
X-Received: by 2002:a17:90a:ec87:b0:3ac:bc3d:6fe5 with SMTP id 98e67ed59e1d1-3ad86e5bc7fmr5232861a91.7.1792697655972;
        Thu, 22 Oct 2026 12:34:15 -0700 (PDT)
Received: from casta ([42.116.198.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adcb1d8566sm230828a91.13.2026.10.22.12.34.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 12:34:15 -0700 (PDT)
From: Nguyen Duy Nhat Anh <neganhat@gmail.com>
To: mchehab@kernel.org
Cc: llinux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nguyen Duy Nhat Anh <neganhat@gmail.com>,
	syzbot+809dfc586f33fc44b6ac@syzkaller.appspotmail.com
Subject: [PATCH 1/3] media: em28xx: check dev->disconnected in em28xx_v4l2_open()
Date: Fri, 23 Oct 2026 02:33:56 +0700
Message-ID: <20261022193356.12927-1-neganhat@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261022193159.12713-1-neganhat@gmail.com>
References: <20261022193159.12713-1-neganhat@gmail.com>
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

em28xx_v4l2_open() attempts hardware register initialization via dev->intf.
If a USB disconnect occurs concurrently, dev->intf is freed while open() is
executing, causing a KASAN slab-use-after-free read in em28xx_write_regs_req().

Fix this by checking dev->disconnected under dev->lock in em28xx_v4l2_open()
and returning -ENODEV before attempting hardware I/O.

Reported-by: syzbot+809dfc586f33fc44b6ac@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=809dfc586f33fc44b6ac
Signed-off-by: Nguyen Duy Nhat Anh <neganhat@gmail.com>
---
 drivers/media/usb/em28xx/em28xx-video.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/em28xx/em28xx-video.c b/drivers/media/usb/em28xx/em28xx-video.c
index 84424284d486..d653341ffd16 100644
--- a/drivers/media/usb/em28xx/em28xx-video.c
+++ b/drivers/media/usb/em28xx/em28xx-video.c
@@ -2367,7 +2367,7 @@ static int em28xx_v4l2_open(struct file *filp)
 		return -ERESTARTSYS;
 
 	v4l2 = dev->v4l2;
-	if (!v4l2) {
+	if (!v4l2 || dev->disconnected) {
 		mutex_unlock(&dev->lock);
 		return -ENODEV;
 	}
-- 
2.55.0

