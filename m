Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793345073;
	b=ZaRL6rtCfpLbYRTFEXDu8jVQIILpCPms7S1+1NnTqE6s0CXFZFqooKeNch0ixN91q3/+
	 HdypJNJ18Hu7aZnkbN3uLJBkfJ6113fyhC/fYB+F4P6gHLqbx6oQd/9RCH8iXVU9ckW6J
	 2N+GRouhmcyymJcedVMDK7L5+NdYLV+Nah67ccfQj45Ruj8YVQjMpdTgw4vl9mQ4FNwgJ
	 3oTcB2/vwOnaIOYdgRtT6h7DsvKJGrZOXuC+vPQQ+yrQZ4Tg5A35YaePipZWtrulsOlBh
	 JTC+bfbr0+zE+ggZxwrGk0TXhegmtfCRp7IgaLw/kYNWkARnO6RVFnb6foUHbZuDkcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793345073;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Dye9QdCfM0buqLNAg1xJFfUVdrOuh21D7sWCj6RNeCQ=;
	b=jNkxJthKx6+96W950Fo7MLUtr8azsSZh6A7eilDAc0MiC9dEuxkt3HhIl0MmoDVayaDJ
	 ANX5XaqbBTj4hYdU6ZdiRZ0cY09tRb5Qh5gwpPN01C+BMOnOo9ixyrJs0K3UDHLY5aQRe
	 qrY+3r0UOT9M3nkjPpaPwNebuDpZw/SD01jG8oKhUsHVAsJVgphxiHVSq5B9mAPOB4/C5
	 simU++m4Uft0DGEnrhLwnOFw3CacnaExF2ko68csbL/GpxawIWt6JoeMf14ugAcD/E/66
	 1Nc4KlQYZ7wI+F2jcFjX4+d+K3uNJ17wusGrSvgUKqJsTdG7o1BUwhvuaEEv03hTtag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=shXzQXvI;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8F8F606A334
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 07:24:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8F8F606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=shXzQXvI
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-185fd3a4ca3so351593c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 00:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793345072; x=1793949872; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dye9QdCfM0buqLNAg1xJFfUVdrOuh21D7sWCj6RNeCQ=;
        b=shXzQXvIBm8gGEnZ0AkVTNtdg3Q59iPHohFAp1GkluBGadwAmhHYE6lViy4+OWE1XV
         BQkxpogrsTnFxlNgYpPMbDPeNrt/x7J0OO5MTfTXUdrzEOMHw50id737nF4CTUt6euLB
         qPhYz/rkeErURDpJVMXQtH9B4oLKzgs/oeqPO62G57k3Bdz0aQ3yP1kVIiss/AXDbSU1
         jHadz93ORva2TB01ja84qlGroFc34GNvzTKo8xPdHehnHKMIKacDbTgGtnxa2gGMallB
         OjQYaqABB3K8+djI4dyzWLXgEeKa5MiIVQXdFjL6vwhLFK0zagIZIixNJX4Qm+N4kHjR
         0rfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793345072; x=1793949872;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Dye9QdCfM0buqLNAg1xJFfUVdrOuh21D7sWCj6RNeCQ=;
        b=ZFx+4TOiYSNj5ks+Wf8LrQm6IzPrql27fctwB66UW2xi6VK+z7bCu1GAg2uaRsZ6gl
         PAdsQbb2RjfpaNE1obH/k/u7qS8LHXcMJm8OQLjxun0mn7lZmdSdliLJuT3zrHgbNVNZ
         nxGqZAfYoH3CULpLsSZe6h0j4uqhbKrtzZy9rFsso7rEjjnbGhGap47GU0/d7A/Lnq4S
         1CVikOYInLVYpjc7CFvcA2wI6XmaUaGOowU6gCh4WMpd5UJ+B0HXX7P8GDHr3WfLdxix
         9BwKvNFNDy+4+DjvJRRvRMzauFLH3KnDuQQg1UpZL0vUZxpctvTjNXP5hes1XRGzSbBa
         mCWw==
X-Forwarded-Encrypted: i=1; AKwUvBya6bTjf+xms3LURlhKoEROGejBGrIlz7SUDt45zWSxoIRePQXkU6GajpUUvf1JR27Dhn7zd0GfAvfkXXk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLegefuzix/ZugO9Ij6S4Yh9iyHpw1bRRN1zlyL+RIMXwJu5aG1
	CsdHhO0Aab3f43dPv/+JF5iWCfkcqkJMHv9A8oJUTw0ZRzoL97lhZnEv
X-Gm-Gg: AYBFou0ZzIkitZ20U8O/6uouv1anHgZqYIGyWsTsaXW7rgyRisvotgIWTtzWe27ESHc
	W6s+uZqxk/VDWRDobo7vuiu758OJ6nh4oQSlr4QaS5YSDU4muHkjZjhr5a+eCslBOQZZUh3rFP8
	psFKFqaRMWzbGNgOrosQGAT4rlLy+I6CJk5OAPUDW8+yfUZZCeweECB5DoT4Md3ajSFd4sdfyXJ
	rjHZa6BxeYSDIECHxkq4yyzrP2E5hD9H6a1vJHdcf17XGo1yIxh9SgZX7CK3slkNhfVvMiKBv+b
	WTDTMD0hsU/RbKg53PfHdZiYMuM2J2kN9JJ2rZ4CXXTou/jRqFKnoIotIB70nKndH4X2+YhS/sy
	QrcRfC1wqfkCcIaKIZgA7vt7n/SzmsoDetIevLRFlysz8QP+UoXlG1cHqug/NLMP0XwyDkZAAZW
	k8OBZKkUNCn7DDc3mBehs5OTzyFFxnzNQk4BwpYTzfKM1dlGFFxTtZtMUuOb+aS8MjMxWeVpipG
	lkleeOxjDwmw7c/69MZckPE7LYm6Si+HrfqRWityi0UGkXJ9Dqn7bCW3/Dt9zXn5ydUlStlhbU9
	id6hTkONlzLFuACqBP7uUnc+FsWqfOi1oO/DXs/aP0Vodg==
X-Received: by 2002:a05:7022:628a:b0:14d:c7ae:85dd with SMTP id a92af1059eb24-1ac5bbb917cmr2714313c88.7.1793345071565;
        Fri, 30 Oct 2026 00:24:31 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac18458e07sm4462883c88.8.2026.10.30.00.24.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 00:24:31 -0700 (PDT)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Cc: lihongbo22@huawei.com,
	sandeen@redhat.com,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	zhanxusheng@xiaomi.com,
	syzbot+6c000dea1a93b4f5905c@syzkaller.appspotmail.com,
	stable@vger.kernel.org
Subject: [PATCH 2/2] f2fs: free the quota file name that remount drops
Date: Fri, 30 Oct 2026 15:24:23 +0800
Message-ID: <20261030072423.197883-2-zhanxusheng1024@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261030072423.197883-1-zhanxusheng1024@gmail.com>
References: <20261030072423.197883-1-zhanxusheng1024@gmail.com>
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

From: Zhan Xusheng <zhanxusheng@xiaomi.com>

Remounting with an empty journalled quota option such as "usrjquota="
clears the name, but f2fs_apply_quota_options() overwrites the old
string without freeing it, so every such remount leaks it.

Free it after a grace period, as f2fs_show_options() may still be
reading it.

Fixes: d18535132523 ("f2fs: separate the options parsing and options checking")
Reported-by: syzbot+6c000dea1a93b4f5905c@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=6c000dea1a93b4f5905c
Cc: stable@vger.kernel.org
Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
---
Tested in QEMU with KASAN and kmemleak, remounting with "usrjquota="
and "usrjquota=f2fs" in a loop while reading /proc/mounts: nothing is
reported.  A plain kfree() here trips KASAN in f2fs_show_options().

 fs/f2fs/super.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 510df7998c18..d86ab25fbcc5 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1646,7 +1646,7 @@ static void f2fs_apply_quota_options(struct fs_context *fc,
 	struct f2fs_fs_context *ctx = fc->fs_private;
 	struct f2fs_sb_info *sbi = F2FS_SB(sb);
 	bool quota_feature = f2fs_sb_has_quota_ino(sbi);
-	char *qname;
+	char *qname, *old;
 	int i;
 
 	if (quota_feature)
@@ -1662,7 +1662,10 @@ static void f2fs_apply_quota_options(struct fs_context *fc,
 					GFP_KERNEL | __GFP_NOFAIL);
 			set_opt(sbi, QUOTA);
 		}
-		F2FS_OPTION(sbi).s_qf_names[i] = qname;
+		old = F2FS_OPTION(sbi).s_qf_names[i];
+		/* Pairs with READ_ONCE() in f2fs_show_quota_options() */
+		smp_store_release(&F2FS_OPTION(sbi).s_qf_names[i], qname);
+		kfree_rcu_mightsleep(old);
 	}
 
 	if (ctx->spec_mask & F2FS_SPEC_jqfmt)
-- 
2.43.0

