Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D08F42EB5A6
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 02:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788921607; cv=none; b=RIKtwu1Nr15Qg4ydcobkfn7uHq7Nb+S/vR7dZffIU3t8BD/jTgCvozFcNLkct+cM8bLYqKNIZWVlALhqPmXmBWLzLQcx4GsZt9sn1L75DLZ3IeFYIRPPqWYzxmYfWn08B8BJwcPnJ5uEg+Pmi4HkdZz96HBHDWKmD0E/CjE7lxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788921607; c=relaxed/simple;
	bh=j7qiG0RiWSw3qHOzwkZZ/83/8pIeDE9appUzYhVJUpA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=krkDF5nqZpwZ3NFC1JFtOuvWvS79bH38Gs1HKv8jEWS94iQqcdVHsQmIPJKMzlOvOJmbuRApz0cSkvawJuqhUnatme6cHSL/eOPo6teuGSecUdcF3ffCi8J2csxIcjv24Kqgq3WSfunKFFSIoC4u0JTaOtxjgGkAJGaiCnJI77k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gWUS9+PH; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gWUS9+PH"
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5c2ae02f69eso4707037e0c.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 19:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788921604; x=1789526404; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bXDwu3Mwz48ANXGf7thjD+yKStogxUEiYKQDYHWWBcY=;
        b=gWUS9+PHV23mt8x1XzwteGCN5nOw+tm/rqOx9jJCWYOdMzehFZFqJu2xE75vDz7Ank
         kjfCY3w4yDSHIQtb75ijBa/XZUR3N0qmRGdTCix1tnbvjVLMxV0KrpFLL2Qxq01YEA+R
         yJZIyRFV9WMDs683XE2KRvGis8eoQWMoiA+FalfzhaQzhTkUsT0dlNJ9q+2eRuSjcw/R
         WqpiCFUoiHNrOUPgZs2nBBCZaC20ne9+MF3L2ZuIe9wteUDnS9oSyOIrMVe3JQHK8Tlh
         hxt/C34gv6m5l/m19IVrRWQbeybFzk7zqzrP1kFBvdPCHl7qMCstyb3QRyLlZHo8rMH8
         5sDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788921604; x=1789526404;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bXDwu3Mwz48ANXGf7thjD+yKStogxUEiYKQDYHWWBcY=;
        b=c6kJx9/IK/eVuu5oh7dwAxMGaam8SGKLNcOrNBkMCc/CZ36PvtRak2O/U9U5MSvqxl
         r4uWbXD1EyD0szgWZ68DJq88+1Ry4TCBsKJQUWZYaqrpz+0j80rZb6VOp6AjtIII8v/2
         rLYADLSedGDwY+PtIOVYelui8BR84ni+Be5K8vd5lEoWlhcwoy360y1edW4WmfCPkYsu
         pN1V/QT+5Jcn0aogSmnvQOcK7am+PStXjIk0AyDVx7iBXtmWV2FYJpfWopchDldNzyfQ
         Mx8E7K5Djrkztj+PmUv0hvGxi9/nrh3slKpXI1vC5yXYu37R1gJI4k39hTgLpix8ZyU4
         D+wA==
X-Forwarded-Encrypted: i=1; AKwUvBwXeFxKX+wFzwf00uwNmjyXYcHsNfdi+6dbTVDZp3jRaBiE4+KoqSJFTVLwETc4pXxYnudMEI+5ElLIPf0=@vger.kernel.org
X-Gm-Message-State: AFuF++ntzUU81OOFbxwE7f2Y0iNTb690BPvFzhPqhn6tGMCawM/jDcwW
	P0J0wXXGpvm01CUNnv09TS1QrdrX7H/rLXjjrV7GqQyjzuS37Kz6zOjQ
X-Gm-Gg: AYBFou0Wqz0lT8WILT107SL2kohsHzLEqAcFhRy4h+7Cwgr9zVg9xsyZL2+N2DUmB/z
	LdjUXWb28leSG5dlh7p4z/HmD1n9chuf5e99LX9tS5DwEloh5YGzWvGsi+e9p+h/3eOixKrdOBQ
	FAKHrfOeQ03U6lQ6d7rj4AmdrozQoNw6CLmQLIKCj6rlnvg7dPCv+rY12TGUohi4noxhJPyAX5+
	xLOS83bjzBTD1IMNCNueUHf43yHa8yfjY3kkNqgYw9Wpr3/+KkeS8fQWgMJJHBKqSrEZwvHngat
	zUC39TCKQA2S27wxqji4UGqK/3fLhacuT2A52sBo536S9Ept0Y07yq9uNOi1XmVak7Cm+l8nG7C
	hVdoLarQ1pA0jdStdcAf5xQtjBV0KJ8FvT2d7Mx+0QwhaQwoU8ICTP4AtPFj0v9QmwAUUB4TLPR
	pfpL1quB8/YpkO1V8XSaY9IVMPl9QfMCqqoZnyHr+QWYC0VVIbEAkBeL5CEOMbTdh5YJsKF3i3n
	DrtM4OCHA1R0+hR
X-Received: by 2002:a05:6123:4e:b0:5c6:599d:8730 with SMTP id 71dfb90a1353d-5c7ed723952mr17242261e0c.3.1788921604597;
        Tue, 08 Sep 2026 19:40:04 -0700 (PDT)
Received: from lucas-inspiron153525.. ([181.81.132.12])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7ec24254fsm11123588e0c.10.2026.09.08.19.40.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 19:40:03 -0700 (PDT)
From: Lucas Jeffrey <luquijeffrey@gmail.com>
To: dwmw2@infradead.org
Cc: richard@nod.at,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Lucas Jeffrey <luquijeffrey@gmail.com>,
	syzbot+3a8099322b09d8d073d1@syzkaller.appspotmail.com
Subject: [PATCH] jffs: initialize inocache to NULL when initializing a jffs2_inode_info
Date: Tue,  8 Sep 2026 23:39:55 -0300
Message-ID: <20260909023955.1642244-1-luquijeffrey@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a jffs2_inode_info is allocated via new_inode(), due to memory reuse it
can retain stale values from its previous use.

If the new jffs2_inode_info object allocated retains an old reference to a
freed inocache, the function jffs2_new_inode may crash if either
jffs2_init_acl_pre or jffs2_do_new_inode returns an error value because
when calling iput() with the inode it will eventually attempt to free again
the inocache.

Reported-by: syzbot+3a8099322b09d8d073d1@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=3a8099322b09d8d073d1
Signed-off-by: Lucas Jeffrey <luquijeffrey@gmail.com>
---
 fs/jffs2/os-linux.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/jffs2/os-linux.h b/fs/jffs2/os-linux.h
index 86ab014a349c..40f17218a276 100644
--- a/fs/jffs2/os-linux.h
+++ b/fs/jffs2/os-linux.h
@@ -52,6 +52,7 @@ static inline void jffs2_init_inode_info(struct jffs2_inode_info *f)
 {
 	f->highest_version = 0;
 	f->fragtree = RB_ROOT;
+	f->inocache = NULL;
 	f->metadata = NULL;
 	f->dents = NULL;
 	f->target = NULL;
-- 
2.43.0

