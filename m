Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794047159;
	b=l63N4/Ns95n+8yxXLKqPdjipms4Q2uSaQ73+ubkXZW0Q7sCYfBgrplQi/N8wgeUi/VbC
	 xSefGKdDbiTuGFAzmNhX91ONcVJcsCZDuCyejCZVKm8P1ni6JMucOP25djDrOkvqEPO3Q
	 sVBgXwYBDjC2Ubm8P3zdW/wSq4jR5hxCe15hBR4ySBb+DnY6M0uSdg/Hun/mBeDARxyGd
	 suL0r9RwFIXjsELZw5dTZh3egQxYXYoUfznMrYGx/tVVnX0IXM7TP+pxff0yRVwkQtdxh
	 rhkGl6Ls3LVIfiAOBhSSTQAqwytCpuz7TwWmyCyiPOOoLxEDtK1I8XS2eUC81EjLBaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794047159;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/H39EACLDPLlWZGOOszNpCzWihvn5UTbcxV45W+rw24=;
	b=lFvfcvKxX4sPcjll3j47bRSsXtbT4JfeeAPFIyqV8PF7kdgoflHDhv3ndrEXSbTOl94h
	 bdLybMlF2Ftf81QDGyiHQUiXVANo/bEHJv/cHKzKkMESzbzrj751MJzTbkse3HMv0sAmn
	 ufQAFNkLCQ7+oIWKPclEavajLigcN9PACKvecXYFvtO88R1sY4Mbz+SHSXGjfxkN/OVY0
	 kRp7uQmBSpZzzc70uBlAZTgVfRpkVCJqD+a7bsDKV9svtl/GCm1Y/LC7/7J4D8R7n18At
	 +4a1EpZ8z0P/dlDSFPmtkaStkXfCRwzawINYkButSpdNxG0YKgNFqwtFqprz65riCYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uBdh8iPP;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF60606A32D
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 10:25:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BEF60606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uBdh8iPP
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3ae691283ecso218999a91.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 02:25:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794047158; x=1794651958; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/H39EACLDPLlWZGOOszNpCzWihvn5UTbcxV45W+rw24=;
        b=uBdh8iPPxh7WomiEfzTY2osL0T+VlcuAAKoibyb5LRkVlhERGFHzSR2+04VBWRR3Lv
         ISdrSLOiy/SVIRDzf9L9csYQh4Xxj9l3qdogTSrrMZ8CJaKLYHMSiQhpVOzMgo3nvxky
         UW7CHI49A1zzcz8AUGGVlpcuPO/LbVCgUPMZbC2eXW99RtNRwabBp/wz4KGhyRz/EGwX
         2UmVnevy8paOcXpZ3stRsCsu6NQGYnJCeJgvoQqIi9FdEHFSrnH/PuU8Bi24rPVxb3c8
         gD6fdhk1W1/JzOgKxVj4GJ2YJGZ9lWkrQsDNALhzVKmZMe3Rwdm95o9QnRCUr3dT41RK
         Z/Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794047158; x=1794651958;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/H39EACLDPLlWZGOOszNpCzWihvn5UTbcxV45W+rw24=;
        b=hmaITgpVwXMI3SChk4FY3g3SgZ8+d1T7wKWjOJmtFwTGmkFELryItUR/JQSVnSyOwv
         NAUcK5mf+ub0siy0nWoOk3LflC/WSC0bu5LdEDRf4lJ02zKXIm7ATb72ioM/334eKkL+
         4JGknIsUnpz9ZFJ2vvl8tL1fmeA8nU4Gm1L3ZGuyOjsGctMDiOrOM/3yQlJJ4rm3Hen0
         rORK2mZnPI4LdLihqZJzSeD6jdRXvEjuAVVv4c16IhwYg4f0nJJfdsNOnMEWLWTtfDld
         ZyvUDIc//p9BxOXmx/CyD4zkqPBDLpD0C3lZ66xFnjeONvCqySDPXKjBaiH/js+P6+sr
         mB4Q==
X-Forwarded-Encrypted: i=1; AL+hErGPz8Mx/T1Gz1dYplnV6lywXN1gBTF/kcRO5C9J1Mjh9T3BfBmRhUfdWRj0KnzXhwfx8ZfVfnYtRHzBUpM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/IBd482g5UuazH8hqiV5knY7Q3hL2YoMkHKHpBd+56Qfqkfbgq
	zqFk477J6OQtEqDcouHz1yWrxNtyqXl8R7jnqYTeio2FO2EZ4X0N/KiU
X-Gm-Gg: AYBFou0/C6OEiZUVlkHP5DwL9zeWw0ifQuW2u+v0F5EDNjMic4mw1bXYs+Yfnt7gLu6
	L2URj6304W85uUDC8P3VJ5WOS2nTkUQjBRKZBXeoA8NVYdR+6S6Qjx4ETmAu0XrAaWIcOHg1TZD
	d8fldc/zLwjDzRx4ck64vlaiM4Lv5QVrHhZqNVA4hmiCcWiA4Ys90XcbpLDso3m4FzhDUxDQrBU
	NmOMiGcgekE0dxIgZ4rkO6sUlI4kyRO2JlvMjqObb+JLLwneT+zVRhODeQd74brwFHTL77IAJBV
	ChthiuHLItF6UvL6PayUCmRkAXI+Fu3UcmefJdDZZ/YACak99ixxU7bYMGbLsnYwaPzcfM9Wjgm
	Ky8BYDjvRjI/+mq2DeXVxf3RU2p18tuh6eQ954+fOcChXmfnzla+h1wszwMRpmnwWQ9s470cjE3
	Lzth2VfrRMgMP91eyOztQ10UwRIlQqmMklY3hIlins9+s5/+MdVNoZBTgEweOciOBdG37LOTQde
	uhgFe4YrEY87lbKBRUuW5uwf98FrNcx2//eg6M4+vrahs2m7B+tyrzWasOkQUx31vRXyXa7M2xq
	X18YM1wTAVPmf+aCIcoCDsBeSCZpbgDn3cWNEpUoTf91UvGCKNbIIpH37+VCzg6jeQlPQfd8ggX
	Y7w==
X-Received: by 2002:a17:90b:3cc6:b0:3a8:786a:cfed with SMTP id 98e67ed59e1d1-3b10659feaemr1154902a91.37.1794047158052;
        Sat, 07 Nov 2026 02:25:58 -0800 (PST)
Received: from Terra.tail0ac356.ts.net ([198.176.50.208])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1152fa888sm207764a91.9.2026.11.07.02.25.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 02:25:57 -0800 (PST)
From: Weiming Shi <bestswngs@gmail.com>
To: John Johansen <john.johansen@canonical.com>,
	Paul Moore <paul@paul-moore.com>,
	James Morris <jmorris@namei.org>,
	"Serge E . Hallyn" <serge@hallyn.com>
Cc: linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xiang Mei <xmei5@asu.edu>,
	Weiming Shi <bestswngs@gmail.com>,
	stable@vger.kernel.org,
	co+c85e76ce40a43b9b@bugs.sh
Subject: [PATCH] apparmor: safely acquire the cached label in aa_file_perm()
Date: Sat,  7 Nov 2026 02:25:35 -0800
Message-ID: <20261107102534.816756-2-bestswngs@gmail.com>
X-Mailer: git-send-email 2.56.0
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

aa_file_perm() passes an unreferenced RCU snapshot of fctx->label to
aa_get_newest_label(). Its non-stale branch uses a plain kref_get(). Policy
replacement can drop the proxy reference after the stale test while
update_file_ctx() drops the cached reference, so pread64() can increment
the label's refcount from zero.

Acquire the RCU-published label with kref_get_unless_zero before testing it
for staleness, keeping the label alive while resolving its replacement.

refcount_t: addition on 0; use-after-free.
WARNING: lib/refcount.c:25 at refcount_warn_saturate+0x111/0x130, CPU#1: AAVICTIM/5091
RIP: refcount_warn_saturate (lib/refcount.c:25)
Call Trace:
 aa_file_perm (security/apparmor/file.c:657)
 common_file_perm (security/apparmor/lsm.c:529)
 security_file_permission (security/security.c:2392)
 rw_verify_area (fs/read_write.c:476)
 vfs_read (fs/read_write.c:566)
 __x64_sys_pread64 (fs/read_write.c:770)
 do_syscall_64 (arch/x86/entry/syscall_64.c:94)
 entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:130)

Fixes: bce4e7e9c45e ("apparmor: reduce rcu_read_lock scope for aa_file_perm mediation")
Cc: stable@vger.kernel.org
Reported-by: <co+c85e76ce40a43b9b@bugs.sh>
Signed-off-by: Weiming Shi <bestswngs@gmail.com>
---
 security/apparmor/file.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/security/apparmor/file.c b/security/apparmor/file.c
index 694e157149e85e..59c27b9c5a8d15 100644
--- a/security/apparmor/file.c
+++ b/security/apparmor/file.c
@@ -621,7 +621,7 @@ int aa_file_perm(const char *op, const struct cred *subj_cred,
 		 u32 request, bool in_atomic)
 {
 	struct aa_file_ctx *fctx;
-	struct aa_label *flabel;
+	struct aa_label *flabel, *tmp;
 	u32 denied;
 	int error = 0;
 
@@ -654,7 +654,12 @@ int aa_file_perm(const char *op, const struct cred *subj_cred,
 	}
 
 	/* slow path - revalidate access */
-	flabel  = aa_get_newest_label(flabel);
+	flabel = aa_get_label_rcu(&fctx->label);
+	if (label_is_stale(flabel)) {
+		tmp = flabel;
+		flabel = aa_get_newest_label(tmp);
+		aa_put_label(tmp);
+	}
 	rcu_read_unlock();
 
 	if (path_mediated_fs(file->f_path.dentry))
-- 
2.56.0

