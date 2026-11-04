Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793786138;
	b=AOby1MVGIcLUXVGQrClPB64D2v8QY/zIKK1aU1O5+PnWD+cfdAypOiYpNc1rg1ybZffg
	 FH50CEqgLzgu3Vbw/P27g7u82p/WUPcMUUnV/xfr/J9UjAbj4NkRucQOrxxxfkZ3MAcWV
	 Zc30yS99e9/BcDykDkYh3lkw+Gg4q4UW3iu1xEbZbTKtWqVzFcFgkR86cZ17IF27SKKnQ
	 SAUCyCVrAERTcAc8g76ZAi7apOG9E0/1vCr93jspUSk7GyK7TXO1OIM3/YFgwZAFAoJWp
	 jye17G73514R/IWAmhst9wKW4VIOnK8yQHBcKO8hLiy39k4rzBdo2+iuqhGlXD9BqVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793786138;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=Ci8AQvKazANwLNbOXSd+IPKnNkJbp750aHA9N2kTOY4=;
	b=J76w5nxaSgSCT2dW3AnNWLDPzGjVGgUhx+G0cVLRNgE4o13/qsyYP0C/wPxGAl7SKugB
	 TRIq0oHiIfYPrtEXmrf7YsTaldY0uD3PXzq2dvksaSSD8hVI2S3Q9K0DT17d6Hs93XiNj
	 c71CXfVWFj81b6ZUiS+EY0nFHwIzVPQOQ/n1TaqvZyJqEl9NIrV6fo1wwN77caF1MTslt
	 4nCnZGt+0dSnYZIg0tWtq/skAT+aWRNZeXP4LY/XSBMOfwUgU9yTXTfvwek4f/25YwcVU
	 H+cM+qCWcmbTWf9pCNPhoSt1mbbXvwM8RXVVwCfI9Drl2eI5M4FWad5mxL4GbYBOgOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FZlHAuPr;
	arc=none smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5526606D80D
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 09:55:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5526606D80D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FZlHAuPr
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2e9995ce866so3951605ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 01:55:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793786137; x=1794390937; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ci8AQvKazANwLNbOXSd+IPKnNkJbp750aHA9N2kTOY4=;
        b=FZlHAuPrxkiE4R486YNGdSqJ0DOM/TEfF17AtksIy+33Ts7KOBBUFMGJIR278IcSdf
         huCCksALqoAbBtAuoLbTnvPewb/7Sv0Z6Q5geunIgkZKBbBMTdq2FlGrOWfVX751/Vv7
         u/b6Becz6cL23zNwg5FEblnVC9zLhTFy4D82s3hf5O4u/8pLMIVDRnMoqjYx3IBRK2YA
         sryoXhZVeaqZlxk2HJlrnTNN1PQz5wihHQG7kKvVRbcU2JbvKTcHH4rkwkJTf1G2+AWg
         0YEh3TXvwVuIfcClJPkFtP3vt7zet6JPQrzpD9uIvoQ74VHNm6kaFxWe4KA75MUQy/jX
         IdlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793786137; x=1794390937;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ci8AQvKazANwLNbOXSd+IPKnNkJbp750aHA9N2kTOY4=;
        b=pEjaDK3W1rv00XuLE3pemllek6KdpuC73IfRjioIXai7RNYWdeXm6+gN/cLi6Bjr6U
         z35cL0Of0DP6XnDhPp/wjT/5UPHNMnzo4fczmYon+c8k70/KBnJ7ip3RDHS+rZqs2J+f
         Ef7uh3O5kHwWb6fqisvN4GWeNX6vrsg/sP0WxgS/JvGL/0t27RAZW0/MkL76OT9DzdQn
         J2i0erPUKoDiL5aRJvpEkAxClUtykJ0lkuKsZHD/6qvx6J/AjEVAuqz/FiE90zoC0JYd
         RGx/CfUW3Iu2bSXKl0Dzcp92dTBx8uxwgC7pFIU6GsSyIksMQVLucNuIGfcipmHghw8f
         ABRQ==
X-Forwarded-Encrypted: i=1; AKwUvBx/2eofBU8OmGTYHL/bAuAGhS3Bu6Zou6uoq5nvRZ1mZmb7HVrMQNujNESF3EieVxM0m14UIED4Kck2+uw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9jV5JylB6u+RxqVPhFk8x2gHMKgZKYLZr3ZzFDO1tw0BasFTTJ
	zAjFatPkY1PWqozopi2fNFfvaOJL7RLIrVF9y8BdsQM//8uhg28Y+Gccqq1wBeew
X-Gm-Gg: AYBFou1NzhJevTRLfwGrN89GmjkHIzEWRcERrZK+GgUzRNKGFIfOtbcbFle+tIRCb36
	nJlPfACqZvUwRQOYcj0pNDbHgp6YBfWvWWooGdO8ZojRodCV9hwegFCN4N48EPqRkaBmipcKGfk
	9LX2f8bLxhsajnXeScjf3aZBEZCVmfKfmkR+vS54ebOPPaU+RGMBKa6/vk6uNnoM8Y1FCfcjv2N
	86zf8Ei4n+fRJuQ5ef9uD8CcSmbxR64o1sDbqix8WrKWW53TcdukqdDwVvYmV4buCxkdrFFekks
	jqZqDQMUifopbwVVZdmMEnbP9XM4XCLXKk6+IYi9ep3zPgBt8p6h2U9pU9nl9hHxYVN1YzBSasr
	9baKJ7vEGzj4DBnQ55hpcTEm9FtTyRoYvWVKBGwFDdch3xkG31DUAZF3d6XLMzSsxBAj2963Vs0
	YC38JowT1Z6yxbWP2gxvC+TJ6iIEQ3Ff8hrYlAhjych58uIXF2LKfVZebIzvu38AEBsp+5wiggW
	wOz6qGyMHBt4nZuC30CPRVRDGnTaZ0BSaBiV4pD//MvB1FcT5DgeQ5iV/FLymX4gVCXZ/gzJH5z
	lhkVHRQWCWu5b51hnNpkzP7U4XUUxF4hxt7rBStSqTGc4KwNWw==
X-Received: by 2002:a17:902:cec9:b0:2e8:5202:aa8c with SMTP id d9443c01a7336-2eb364f0a21mr145807865ad.48.1793786137198;
        Wed, 04 Nov 2026 01:55:37 -0800 (PST)
Received: from localhost.localdomain ([152.136.45.109])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed08fe1e6asm5591535ad.22.2026.11.04.01.55.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 01:55:36 -0800 (PST)
From: Qing Zhang <diasyzhangqing@gmail.com>
X-Google-Original-From: Qing Zhang <diasyzhang@tencent.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
Cc: gfs2@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	syzbot+bad65435361712796381@syzkaller.appspotmail.com,
	diasyzhangqing@gmail.com,
	Qing Zhang <diasyzhang@tencent.com>
Subject: [PATCH] gfs2: Fix refcount of quota data restored at mount
Date: Wed,  4 Nov 2026 17:55:30 +0800
Message-ID: <20261104095530.4178727-1-diasyzhang@tencent.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <683e2b6d.a00a0220.d8eae.005b.GAE@google.com>
References: <683e2b6d.a00a0220.d8eae.005b.GAE@google.com>
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

gfs2_quota_init() resets the lockref count to 0 despite setting
QDF_CHANGE, which owns a reference released by do_qc().  Quota syncing
can therefore consume a concurrent user's reference, leaving the
count at 0 and triggering the assertion in __qd_hold().

Keep the initial reference from qd_alloc().  During cleanup, clear
the in-memory change and slot state and drop the QDF_CHANGE reference
for objects with no other references.  Leave the on-disk quota change
records untouched for recovery on the next mount.

Fixes: bb73ae8ff394 ("gfs2: Fix initial quota data refcount")
Reported-by: syzbot+bad65435361712796381@syzkaller.appspotmail.com
Closes: https://syzbot.appspot.com/bug?extid=bad65435361712796381
Signed-off-by: Qing Zhang <diasyzhang@tencent.com>
---
If QDF_CHANGE remains set at teardown, a concurrent sysfs quota_refresh
can make cleanup skip a restored object during remount-ro or unmount.
The last external put then leaves the QDF_CHANGE reference behind,
whereas before this patch it could dispose of the object with the
journal shut down.  Feedback on handling this reference safely would
be appreciated.

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master

 fs/gfs2/quota.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/fs/gfs2/quota.c b/fs/gfs2/quota.c
index b2984fb7b35c..29eb7adc4284 100644
--- a/fs/gfs2/quota.c
+++ b/fs/gfs2/quota.c
@@ -1470,7 +1470,6 @@ int gfs2_quota_init(struct gfs2_sbd *sdp)
 			if (qd == NULL)
 				goto fail_brelse;
 
-			qd->qd_lockref.count = 0;
 			set_bit(QDF_CHANGE, &qd->qd_flags);
 			qd->qd_change = qc_change;
 			qd->qd_slot = slot;
@@ -1542,6 +1541,12 @@ void gfs2_quota_cleanup(struct gfs2_sbd *sdp)
 	spin_lock(&qd_lock);
 	list_for_each_entry(qd, &sdp->sd_quota_list, qd_list) {
 		spin_lock(&qd->qd_lockref.lock);
+		if (qd->qd_lockref.count == 1 &&
+		    test_and_clear_bit(QDF_CHANGE, &qd->qd_flags)) {
+			qd->qd_change = 0;
+			qd->qd_slot_ref = 0;
+			qd->qd_lockref.count = 0;
+		}
 		if (qd->qd_lockref.count != 0) {
 			spin_unlock(&qd->qd_lockref.lock);
 			continue;
-- 
2.43.7

