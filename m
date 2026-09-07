Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 995DF37BE93
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 13:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788787336; cv=none; b=idjb6mdPNt79/WDppGhCNUomHDlFGAkO1UMBgTpQl4Et5/622S2z1Nz4+CwExaQGPRonzD5uFO25Ke4gR3w+In2dM/3nczepmlD2WnQ6Mc8fosqWoDlvd4kM1sjUuAEnZpw/cKAeWCptC2nxfMzjgcp2TQq53hblepUueLd/eQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788787336; c=relaxed/simple;
	bh=NU+eZSzEsrnjCal8oIlsrDjpb9U7xXSSdQQ4LiKYAH0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qUnnPZ5yLA2q/oykONbDGujhc1MtS/yKEsyQ5gFpvhPA7TDZCP/feHTp6Ie45SgEoD43+7oVm+1sfbUG8csol+IKsrb437uNASvAc4QoxohjL7L5pIwVBk/mhQMT/WNjqAuaprAVg0ExLzj6MNcVt+Apjnf25lU6n9Rcrg0EA/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AgcB92mg; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AgcB92mg"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49557167508so43129535e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 06:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788787328; x=1789392128; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ViElzflaszjSFY7ZUxClX7Wwc/oOQXR/RJoA4DtKYyY=;
        b=AgcB92mgA37QBT/VVE3DrDsyCQEwtDJmJfx3JGvZKtlAvrdgtC/n4/3B1DcMRcp6pr
         31XtfxJf5GdwxvYCz30v1p6wV+N4r49FS/SO4qudxE2RzTqF5KpPwyK+HFIQIThLYVat
         S/eU2zHTbuzFe9U4sS9/9mcYvI4/bsiRKalfRTOZsSQ7eNfggHwU8aAce9Itt9g8gT4C
         W82owuPSa+qt4C5K7qdC0uUXnw8KLOSRBXs9fOwar/vp1HLqZS/8P+I7d4/jGfIx9Y38
         D+MkazK/EegK5ri8NZEx8IvtmiIhJMAcPvjqWIUMJxgnwo+5CsMHBiW6C6VTarWOtzMs
         YF9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788787328; x=1789392128;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ViElzflaszjSFY7ZUxClX7Wwc/oOQXR/RJoA4DtKYyY=;
        b=Jc+ybtKjXvQHPU9EyqNkrLWKTh/Hm/0NYpolRYYtMJ2T3Ij1hicscy+O/vr132ZDuq
         MpuATsnQPRcGNv0oYxJSgKbXuXLq8O0A5CcdLYxJMQEDu+MzOw2fTG7lgpc6PwIoMh/E
         sKlR4xj5PZkNNw1dopiq4h6vLkTAGDfyYBTm5pnTCnBMxNHCpgit6lF4brm1EU61xnFz
         JrdSm3z6/mLgM87olgD6LKYOfX6CpLGDQs+N/GywEdI9yugFh9C+9/Di+6A5nQaBkD0A
         sCfWp/zD1r+lWq5OHNIB/Wi3GYO5cLArUZiLsCoPG/MvywtC8HLxWUGV49u7OF4gQsLz
         3iAA==
X-Forwarded-Encrypted: i=1; AKwUvBweilGhb8OwUF0io9wAdSP8d/MJBq4/4LCpIP5ya1ZSQGcAhHiZZ4UtLuU9hkRJuBwQSof6qCX0rtuzyRM=@vger.kernel.org
X-Gm-Message-State: AFuF++lC9bJ9UfGtr5tVgsXdn/EvJklo+x80oh7wwmrVpVLNxVikA0yT
	J0tCY4VzFZvrl56QXAXZBb3LpgRgnWdViDkyvzl5cTz62axSkSJ5mZUU
X-Gm-Gg: AYBFou0tnNV8c5l7JaE4FSnpZsFKY1FQ8T9S/ZxWZT+oVBIMFs4tVA5f0WPwcVP/O/G
	7Aa3NK8TyrLqTA9ValytFFlZ5dxDCHsi/Fkz0flQMx85bRxbapF/dtvlXbTIq8f7oxV9TEXmL65
	jOAbej66pLMubRqIb+aXyYKTP29OWS4l/AgJmC5niP8W1X1TUlu2+pKEQk6aJXDnWYslOrWPas8
	atRqcf/zk9K1A2AqmceKiuEGdBRB1Y4O1832cBZXFx/0te+/Zeb0l2bx52bpQSRWgCplUYOy2qY
	5b9ozbEI5r+Yp1RhbA7lcLFO/EkW1AKvb8DreAabt4xnWJH0oTORUAFKRNtC4ii1qvFmoC2DHLA
	aJ565iX/MGnIGVAPd03Z56aNi+Lx3qq/3Z0WhQHDCVkZXbQQz4gBDjv+/wivS7bPO+/O2s2wzWt
	J/bKiuvfnBj9fS++05djCZ9UKBPn0foeQWdw7FNkdc02jQlklfTGxiPg+DNtFfNeel40xP60W5S
	6avKKP2FkPToSDl+l2LvsUEqukuwZFlc1HoIMohAVqNn84JgPsTo8spIq7ToKaMVcC0MPwZebkF
	ua98GU2P13FvmW52TkFtJG2lrWQkPvRk9TXGyPjuYi1UWSgiFL0Ufje94YGsj6s6ovQUhaNej+s
	0mKeJdgs+8X+4eu437A==
X-Received: by 2002:a05:600c:3f12:b0:49c:c8de:96a9 with SMTP id 5b1f17b1804b1-49cf7fdd2dfmr448928055e9.2.1788787327897;
        Mon, 07 Sep 2026 06:22:07 -0700 (PDT)
Received: from Ubuntu.ts.net (87-205-15-91.static.ip.netia.com.pl. [87.205.15.91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48588394fa1sm27458397f8f.8.2026.09.07.06.22.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 06:22:07 -0700 (PDT)
From: Krystian Kaniewski <krystianmkaniewski@gmail.com>
To: Mark Fasheh <mark@fasheh.com>,
	Joel Becker <jlbec@evilplan.org>,
	Joseph Qi <joseph.qi@linux.alibaba.com>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: kernel test robot <lkp@intel.com>,
	oe-kbuild-all@lists.linux.dev,
	ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [PATCH] ocfs2: remove unnecessary ret variable in ocfs2_calc_xattr_init()
Date: Mon,  7 Sep 2026 15:22:00 +0200
Message-ID: <20260907132202.48834-1-krystianmkaniewski@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <202609040247.8B3lmoqX-lkp@intel.com>
References: <202609040247.8B3lmoqX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit bd7c05fb4a47 ("ocfs2: fix circular locking dependency in
ocfs2_init_acl()") removed the only code that could change ret in
ocfs2_calc_xattr_init(). The variable is now always zero, so remove it
and return zero directly.

This fixes the reported Coccinelle warning without changing behavior.

Fixes: bd7c05fb4a47 ("ocfs2: fix circular locking dependency in ocfs2_init_acl()")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202609040247.8B3lmoqX-lkp@intel.com/
Signed-off-by: Krystian Kaniewski <krystianmkaniewski@gmail.com>
---
 fs/ocfs2/xattr.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/fs/ocfs2/xattr.c b/fs/ocfs2/xattr.c
index 35bcbb0ff607..ab3b645983c9 100644
--- a/fs/ocfs2/xattr.c
+++ b/fs/ocfs2/xattr.c
@@ -640,7 +640,6 @@ int ocfs2_calc_xattr_init(struct inode *dir, umode_t mode,
 			  int *want_clusters, int *xattr_credits,
 			  int *want_meta, struct ocfs2_acl_state *acl_state)
 {
-	int ret = 0;
 	struct ocfs2_super *osb = OCFS2_SB(dir->i_sb);
 	int s_size = 0, a_size = 0, acl_len = 0, new_clusters;
 
@@ -662,7 +661,7 @@ int ocfs2_calc_xattr_init(struct inode *dir, umode_t mode,
 	}
 
 	if (!(s_size + a_size))
-		return ret;
+		return 0;
 
 	/*
 	 * The max space of security xattr taken inline is
@@ -729,7 +728,7 @@ int ocfs2_calc_xattr_init(struct inode *dir, umode_t mode,
 		}
 	}
 
-	return ret;
+	return 0;
 }
 
 static int ocfs2_xattr_extend_allocation(struct inode *inode,

base-commit: bc35965f6940a9bf834d54187b6088b8eb09206d
-- 
2.53.0

