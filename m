Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9FE52D7817
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 15:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792165750; cv=none; b=PtGT3/YRnszfzSWloaeiUhYXqiTQV0UDEO/Xg0og+ZxrpdmERC57XMvQt3El+WUoPlO9Rky3OT5ND0d7mTeG86snr+9zgvY2XoqrJ92WlFXLmwP8SXH6qUkfmxCaHkXN5rQHjHsQjpFE0OMS02OFOwUatWePyWw9AqTZfJTpdaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792165750; c=relaxed/simple;
	bh=Mg0oCODIBACyyTpAxf8sGl7IMM7k1v/BkIjkqVQOlSk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tMtuBeVJgp6keX/b+1NUDxtCl7YTwF/f11s9vvvECjzHttTEwQ1FIcpyidgd4/5fAaQvue0LymRsXjzFIA37ySoqgN4eXdi1phooW3Yw11PTZc1SaR4z9vgFAJbFnczkw3o+I0ej+rUYQBY90qXj4ayNMhNK3vrvI+eFlymhSdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pg19tLgl; arc=none smtp.client-ip=209.85.161.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pg19tLgl"
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-6dcf573c429so53875eaf.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792165747; x=1792770547; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2DGvHsg3p95DZsVwADiFfgXPnEb5RStlDyPXgePKJCs=;
        b=pg19tLglWmJo87uQ3qpHUz2sv55nmwfIrf0PBDuHSHD/qMYPMB7G1xJBYRrDkeFWO3
         zTas81owjMA7t0QXVvCORYXt4rxj39YqoH7KIGoXIztOYHeeMiw5mAVCaVQPdb77C460
         0EPTqRbrtJ4PkJIiF0yvQ7DnvsuZeWsGkhcTCT5eHOwcDIcoAi6h63tLlYPXnZ8sG01L
         9hXOURw2Kxga4WbtANwcozZ6DYoQ5y2q2h8oPV57yHLvqHpCPGCGS7HazWimqwAF5FA6
         PJmEVltxE38iH0gZP3TuTALsrvpWBwFR9+SX8pHN3CMAeJVV4svdlDronexK3i172FWb
         hP2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792165747; x=1792770547;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2DGvHsg3p95DZsVwADiFfgXPnEb5RStlDyPXgePKJCs=;
        b=wAfVfl/5gPzNGaOzGakmjLosV44knp5+TQarrWTW1/S3PL1Ozb7M5ZHdV3SYcMYgff
         hGk96YyxG6YP7d5Zw9fcBCDKbRbCKgL1buZgNebVfX/baZlp9WULtNJyEgWUGqHxYTTn
         0qSUzsmW8PwnxvZYY/c2UIW11aLtYccghqLGAwuwNxAz5/hJ42Du+Ez4v9jQR41TQosq
         dACxTr41DmsNm1lwrTiKmIhBjLGox0TKvkmCZUiD8luaptc0w8k876GPHC0SNWMg4Fjk
         9diLvrj0iAIa3GU6EcLQgBAtIpUGFIYNqAyAIho6L8C3j6CxYKJCi61xsltcBiRlwyaR
         TNEQ==
X-Forwarded-Encrypted: i=1; AKwUvBzP/UxikNJ1jcjB1UJqryaYPHhKAC8LOdOy73XYLPweikJYJmjqRh1QXvjkmL5ioFezOihWcnxsXUZs4c0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJYzlVXzag4B/bflq4OgCEeZT9ZZP3z1rmKEIEhnJFNQ9bYiQjD
	ey8tKo7sD2NFwVSGqmVEa5GqdGxEcS3yvnz91hsypsqBVE4Za4h4Pj9IIvdkAF6Xd8Y=
X-Gm-Gg: AYBFou0T0GJbK+Us+hkqSb41ucyfYLuABbIirYQ3rSfIYY/yu+7AewBjHwVvsPL7m0P
	INQp1RQCK4is011n5XBNvwKcokMKQNhnrtjzgCxXz81T/CoPVH+rroMsSWY1if/KGxTYQzSHa2y
	/WLbHhctjWwf4Lt63ajgy3W3Z+aos4LbCgagdKEUXqjd32UhSxrMnrofaA0uh1Wy//kOnsixrtC
	30zJomiCvVS1pqc5AAoL/x088qhmUsl94BJI+QWtmtJ2iX83X9c1HiesGmWoefhsy7Y4pjEjGWO
	gnQY3Gts3nYpJfWUHVtiw9uLtHY52H6DVxEPjl9oCcANotCXf+9ZquTK6DppOQQYI2BVRyNzWI0
	AdN2aR/fVF8IQmitcpfQLPCYBb7GJ5pe8mUQ7p13pfgleo3XH6wXV+efY/O/MUW6RK9c/+JoR6c
	oe0NbqIIMXjaO6GusTXD5Ut+j0J4qJTftiHO5mZgu+yVkHrI4Gl1FeRpwinNIfU9A/1ngTDeQWB
	E/ZlqX7CsuFWE3HIHV9m4Q5V7HpdjGWY1DfUPdlp4fw9oC8wSg=
X-Received: by 2002:a4a:e904:0:b0:6cd:3ffc:acf7 with SMTP id 006d021491bc7-6ef1049f172mr15635413eaf.71.1792165747551;
        Fri, 16 Oct 2026 08:49:07 -0700 (PDT)
Received: from casta ([2401:d800:20b:1196:6a2:5930:14e3:f74b])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-842a55ce9c6sm2084083a34.15.2026.10.16.08.49.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 08:49:06 -0700 (PDT)
From: Nguyen Duy Nhat Anh <neganhat@gmail.com>
To: justin.tee@broadcom.com
Cc: nareshgottumukkala83@gmail.com,
	paul.ely@broadcom.com,
	hch@lst.de,
	sagi@grimberg.me,
	kch@nvidia.com,
	linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Nguyen Duy Nhat Anh <neganhat@gmail.com>,
	syzbot+be62d4b375542ecebd17@syzkaller.appspotmail.com
Subject: [PATCH] nvmet-fc: skip port entry rebinding if already bound to a target port
Date: Fri, 16 Oct 2026 22:48:06 +0700
Message-ID: <20261016154807.9544-1-neganhat@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In nvmet_fc_portentry_rebind_tgt(), nvmet_fc_tgtlock serializes access to
nvmet_fc_portentry_list, but does not prevent multiple concurrent or
duplicate target port registrations from attempting to rebind to an
already-assigned port entry.

When pe->tgtport is non-NULL, WARN_ON() is triggered and pe->tgtport is
overwritten, leading to kernel warnings and leaking the reference count
acquired by nvmet_fc_tgtport_get().

Fix this by checking if pe->tgtport is already set before acquiring a
reference count and rebinding. If it is bound, skip the entry to prevent
clobbering existing bindings.

Reported-by: syzbot+be62d4b375542ecebd17@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=be62d4b375542ecebd17
Signed-off-by: Nguyen Duy Nhat Anh <neganhat@gmail.com>
---
 drivers/nvme/target/fc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/nvme/target/fc.c b/drivers/nvme/target/fc.c
index 1b557775e033..9b7fd8f5bd47 100644
--- a/drivers/nvme/target/fc.c
+++ b/drivers/nvme/target/fc.c
@@ -1324,7 +1324,9 @@ nvmet_fc_portentry_rebind_tgt(struct nvmet_fc_tgtport *tgtport)
 			if (!nvmet_fc_tgtport_get(tgtport))
 				continue;
 
-			WARN_ON(pe->tgtport);
+			if (pe->tgtport)
+				continue;
+
 			tgtport->pe = pe;
 			pe->tgtport = tgtport;
 			break;
-- 
2.55.0

