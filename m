Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793587017;
	b=P6Un4Udc5+cCB74qHuWGuWynRKkB+95us7wlECSClR8r6ZDMld9xptF/B3d3DKLhYWj9
	 gA+bzoplTs6+hcJ289OHZy984VbeDqZNKYR7bnuszFsm6hlFz+frRGsOEhu7m8yeqjhi+
	 kKWSYrviEs1+mC/dGS5igVmPoXdOgJJTFzpdd3Uqnnyv0u6JrcxH+38a1Y/ls1RxoO7LK
	 6RrCiWZGMDp22fPoxwh8q/HebVPWdC7sUXr6OI4kPJ5avbImxUviN1dEoKdsBLute0hTf
	 MX8njid41JERPAsWkDtFGagKd0wcHy2dBfHMEkflh2GTBuItSfPRhyqWMM8GbLFRKqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793587017;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=qe3yX42ERgMuY66a5xyz0Wt6sGlKrpiqgPCE7n4UY4U=;
	b=4c8u3D8Eb8sPNv8aeRK5CRmMxeMDn1MNGXiK1j5YALSbpeJM/f/iVKUm1HSQPuZ/dbsi
	 QROSItgBgL5Lnpmx8QzGDbdEcen55jOJzq2D0rG2PT7i9H5vkI3WuanrfuyD1rmnS45S/
	 V3gsyYR4H8X1Vuwjgq0Xr8oO58kQP6/+jIEmSCD6Dtdv58bLWfzcOYknda7UkzIfJdBLO
	 Ttpgj5JA4ck3rNNX2YE1/KDCVl72bWNhV63AQZxFFPLDS56wzJ6QM7RLjar4iNhS9Xv1Y
	 zLXovmtzIgfZJpBVXSjPAm7BQO99kphgRW8BkcSKg16BcEudxVucTzazCfkRFvwjYTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n42sqdy5;
	arc=none smtp.remote-ip=209.85.210.176
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E1D9606A330
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 02:36:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E1D9606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n42sqdy5
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8a0880a46e7so1143260b3a.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 18:36:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793587017; x=1794191817; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qe3yX42ERgMuY66a5xyz0Wt6sGlKrpiqgPCE7n4UY4U=;
        b=n42sqdy5eMQVeWPpn7Lfz0ahp8g/I3FH4BtP5jKpMiI9/EP7uecT495p0eMLWxd4Eq
         UIXLOMeL1UlswHvAIVlGq2Mh01d/DF7MeUfAJbJAeQnnJDECJtpR9IRepBKrDkzOsUsj
         XxX3srNOEDn1f+UQ3QAZYIidZuvK+Sg/dA6DGa7no7zcPIzS2gD/oGFVR7gUSuPIQH0X
         YpBeWOYoBHcHABX00pRiUFF9u6poHkUW2XNpRTuyUm8hMZgzs/e0f2QF3iLZhQsYuUh/
         jLfkXIUAmHcToND7VI+SROXbt1sAm/At+uYa4IiaLAQYZlWx5g31XyOLc1NbBrinuNBJ
         RH3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793587017; x=1794191817;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qe3yX42ERgMuY66a5xyz0Wt6sGlKrpiqgPCE7n4UY4U=;
        b=oKF5jAkFVqd8BP8mY88R3sTyoe4UXMcQq4UdR+GEMa4XJqZtn9NBSp/f69o5Q3dmW+
         26qFUDCyqAJlhRvmEzN+ltf3VPzquQwyyGIRx/aHVnGO+MbHZp5SkUYqerB9dm0g8Voy
         xu9OU+zplmd2KAo9a0NkfYUe4PZs2awRDX8jcUCefXEvXUF/13mIO+E/ze5BnJmgM0oP
         DEaaNCeh3TkQIDxKAPBoQcQo66iB5hY0mEWPd4ANCivXzxVlJN+rbPJ3UXTk/dAdFmCs
         VVLxEYCw6IfwSAQ+dioHSYTGhtsBrBjKvpSkikgJ8nQ6wMw6g/a5z6ddrFUUxM4lmIqB
         WUOQ==
X-Forwarded-Encrypted: i=1; AKwUvBzw7yOwXe2XmDPaQxuXQlvADezRghWx4vkn5gVd4iozdlqSetAr8JaElGngFA5bdnMmVGYq3dGpsBFElec=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Tw1KdpZlAprnnn8/5d4WKViAT5weK1dW+32Clv93CjoR7lsf8
	tqPg5eVYF2pLX/B0UZHEXQgf2+taQGxz+IjH3aKMXzDsMNOmHU01PBxK
X-Gm-Gg: AYBFou0yk8iOEch4jhuiwZZz6mvwrZmn/fpvcV/wMfoXdPMers0+gA7ylyG8+CsSr1K
	6lJakR7AZl0JRM/quns3+vNOUrI53b+WcLj5c7BPvR0632T0AG8NMXtsFtpJdQCSlQCEHkYZ8Y3
	WvfteyvfDcmhw+Ojx+UFOWU0BR7QBG0vyjXGIEWGdggwVnyWTgsl3JCcU8uX4mA3twxN+IqenJf
	oiUd2ZLJmgGDjjTDlIhQ/Z+r3ULmGOcR/KLG5nPYCjRIRkERxNhxkPJqI23s97NMVRurL7rPnB5
	UHnwgCaxXTJ6l2M+kMYkJzdzXMrs4YNOffwbDi+eaYJZwLCZknYUTPuDEvcfOjMeckeAjubnGon
	i2ew5EtN/trFeiennyIswKIHUzcgMPAu0ADc53O8L22bfRQRQgZKO1MhKQMhz09TFQZak1Nh8oa
	weQTxqVGYNkykfJ31TwxyM+DAhht2/eJLDoCSSH63JdkN4WNF5b6DBT7dJT0TeXsSes0NtCT6ht
	3+loxNWUPoE/+s5aO9jNDNTM5pKumedicoFTzo0vQO2rPr52LsNIEAYst07b7INCVWpCPT3S/CR
	O2ZbC+0n4lYV8R3x2oO/3qT3HaPQoHUZcxOr3YJ2w7iXQg==
X-Received: by 2002:a05:6a00:2e1c:b0:8a0:2d72:17c3 with SMTP id d2e1a72fcca58-8a9be681283mr5322129b3a.15.1793587016620;
        Sun, 01 Nov 2026 18:36:56 -0800 (PST)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8addc705868sm167812b3a.35.2026.11.01.18.36.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 18:36:56 -0800 (PST)
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
Subject: [PATCH v2 2/2] f2fs: free the quota file name that remount drops
Date: Mon,  2 Nov 2026 10:36:47 +0800
Message-ID: <20261102023647.1084979-2-zhanxusheng1024@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261102023647.1084979-1-zhanxusheng1024@gmail.com>
References: <20261102023647.1084979-1-zhanxusheng1024@gmail.com>
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

Fixes: ff11d8701b77 ("f2fs: fix to allow removing qf_name")
Reported-by: syzbot+6c000dea1a93b4f5905c@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=6c000dea1a93b4f5905c
Cc: stable@vger.kernel.org
Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
Reviewed-by: Chao Yu <chao@kernel.org>
---
v2: Corrected the Fixes tag (Chao), added Chao's Reviewed-by.

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

