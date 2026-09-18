Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 589254F93DD
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 13:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789738813; cv=none; b=qySbTYK+rszqpiFqrW2RjqM8fkfkLhGIkBi8lwTlqUaraErtJUEG4SztsgTrkVNaXNCFpSIZAkCs/wazCJwt4eNKjFJdk4vrpsPbXMlgKDMz64hyMu/YlE2Ktw65c/UpmJeDEf8QW8w+fZLEKOhAyGQLsAp7i0UiEJM86x5C8Io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789738813; c=relaxed/simple;
	bh=MkCaoljCfwO0UHai9egYkzKnMmf51ff6r89Fagqvxxo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RLro2anuPxsZtUDzlbcY+c+tKEUR/RqI7ts/74sEEdmihFabh/DVmLZQbUw7yLcdtTvcYvWFmrP9XtOFJm/2jR1yypzKGl9ZzYhYEhtbbIG2T6nhH59/FwmQEgFCe543mc8zRlVtKKLEyCFAAOegHFraT+3dgFHPsyo/fAEGOrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JoVMkcRu; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JoVMkcRu"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d91a931f66so4773505ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 06:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789738812; x=1790343612; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mkji8nuCM5AKChpvLLQvTuvYia3k12Q8J0swVpD2+e4=;
        b=JoVMkcRurWjCXGDGbjQ93FchHt2HGpFrsGrUYpg4dX61asw9Ax3uGpBzwgdVhYM6wd
         xnhbaB93wkh0h14GexW0qFqei9I9c1xJwXOLaj1F/hcB8X0HaeSHwmBTgUqB6DC+HQ2t
         wa105KExZ3ChYDvdEk+BKefbKZt53wr8soGqjI7WJfb2XNoz9VifpnwlCLmCvDMy8ia6
         B9vkbJ6ptq9LkukoctWJAZ7C2/CbsAnzo+Xj744qRgJdCkXTWS9ow1GJz3fZrTys+lwn
         CS+zOoAfmPkA2Y6zLdicKwN6pVN5uMAqFseTW8ufI5rhGuwgC1VRjuA2Iv0XyS+iIofA
         TRbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789738812; x=1790343612;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mkji8nuCM5AKChpvLLQvTuvYia3k12Q8J0swVpD2+e4=;
        b=CDpYlb+FP2a5lCVwTUE/7/Ks5UJNW9JKTN4t5oOOrFAG05LTQVV1BkbGSW6SsOeL6O
         Cb6ZWoWkdJ0LnF5L5QWSXwn/YO9Uy0RmyPmAwGMqujkiPJcdhNAmJ7uqt7sZ/buFTKCU
         n9Ybb81gdzjJKBuRyV2eNmcvU3hOtYFDMPHI4bBBqu5fzHFwEXMSgEHuUtiH97qEam+k
         eRJShzQ8yIaIihMwozdg5q2Af4AqArIj0ci9Amuk6Rzufd2+MUSP8OWVpOGLMNmn6O52
         7TCfjyrKoI0J9yGVaUnxIoAJLhz6jwNFnGsosuFEjcQD4GvQqy7dX6habziYgd18XINR
         WNOw==
X-Forwarded-Encrypted: i=1; AKwUvBzkqonOwQ5IrXySmO6tGyE1+zdI/bbq7hoX0SrbYrsQ/j7EOjqYBmzhVbOh32phAnHHy0orTF4Z7LdiT7A=@vger.kernel.org
X-Gm-Message-State: AFuF++m3n8H+9Rt5eMMQwd8uOt093nT+d6VRjOg6g5Tu9IMUZkyTP6PU
	l22sL6Sfw7EBmQ4O4G2zaXYE9FO/PAyS57wWVmSSJsmIN9ZzdByOTBsd
X-Gm-Gg: AYBFou3sP0BWd1rSi3mVLPPGubP8/CYsEdGqurwE0VtgsB6ZYZeVDnpLlfv8N0/o+VC
	98mo1FCfT3HtzGm8Z08lxA54wVgKtUrqf54Z9Su9eIE3ZDfxHi1ZYeBn27QlmrXhgJ+RM0H2cLy
	l1TMAX+fnE4i4kLTZh+c/ohWfXea23bsSsFUS6hMWXBCEL2m8kRV7Jbl46Hp0CZ3m5ApE9qV3l+
	bHR2O/D2ktznXt+qCXwkqlWdmL8MFYfF+Vq8sFYzxYjmOZrWcIZxyddIspDla6oVtvnvsQQ/y7r
	o/ZOHnp1KVaLfB1ZNfQPCWw2ty0Q2mtKS16qsHaEtE4a5DpU2JuBK7bwoXAfdo7sR4WuF7KUv+S
	4ZvkL/9SA8rZOdJpF7QKHTak7NNadz1gM8WUsYnOChG/hAp7EB0lrH93tBNPh+4Jwn8w/v4crBc
	zpy0NjBnzUij58TvVeU3grqVo/gW2gajEwqkS2Av/IXiLIaCZd6nACEkZyaNZRQ6YNvs11IQj2w
	eGY2neYA2NgIeK8o2EZwSi47MwYX1HqFWC83aT/WbJuqGFzaFzxCSwdfv0=
X-Received: by 2002:a17:903:2f06:b0:2dd:8e7d:90f7 with SMTP id d9443c01a7336-2ddb1adb4a8mr62664555ad.9.1789738811267;
        Fri, 18 Sep 2026 06:40:11 -0700 (PDT)
Received: from codespaces-2362ac.ktkhmpmw22vebpok31ngjx2qsb.ix.internal.cloudapp.net ([23.97.62.118])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddb7524dc0sm8031585ad.14.2026.09.18.06.40.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 06:40:10 -0700 (PDT)
From: Seongjae Jeong <jsjlee1020@gmail.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Cc: daehojeong@google.com,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Seongjae Jeong <jsjlee1020@gmail.com>,
	syzbot+ae5b8eb92ed40411ce16@syzkaller.appspotmail.com
Subject: [PATCH] f2fs: reject device aliasing without a multi-device configuration
Date: Fri, 18 Sep 2026 13:39:22 +0000
Message-ID: <20260918133922.8163-1-jsjlee1020@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A malformed F2FS image can enable F2FS_FEATURE_DEVICE_ALIAS without
providing a multi-device configuration. For a regular single-device
filesystem, f2fs_scan_devices() returns without allocating sbi->devs.

In this state, f2fs_dev_is_alloc_blocked() passes the device alias
feature check and dereferences FDEV(0), resulting in a NULL pointer
dereference during segment allocation.

Device aliasing requires at least one secondary device. Reject
superblocks that enable device aliasing without entries for both the
main and secondary devices in sanity_check_raw_super().

Fixes: eae3faf210bd ("f2fs: support dynamic reserve/release for device aliasing")
Reported-by: syzbot+ae5b8eb92ed40411ce16@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=ae5b8eb92ed40411ce16
Signed-off-by: Seongjae Jeong <jsjlee1020@gmail.com>
---
 fs/f2fs/super.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 6a2f09c61dcd..f980f67cd199 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -4153,6 +4153,12 @@ static int sanity_check_raw_super(struct f2fs_sb_info *sbi,
 		return -EFSCORRUPTED;
 	}
 
+	if (__F2FS_HAS_FEATURE(raw_super, F2FS_FEATURE_DEVICE_ALIAS) &&
+	    (!RDEV(0).path[0] || !RDEV(1).path[0])) {
+		f2fs_info(sbi, "Device aliasing requires a multi-device configuration");
+		return -EFSCORRUPTED;
+	}
+
 	if (RDEV(0).path[0]) {
 		block_t dev_seg_count = le32_to_cpu(RDEV(0).total_segments);
 		int i = 1;
-- 
2.53.0

