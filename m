Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794822184;
	b=Z8vJC8QFYhmizKpLBA8wiWI/icfgsxQLcYF9wLiWFEaPhkVH2U4uB9Tsh5mwhNG0qmTz
	 1XhSmxasbR1HsNaVeAd2wBilyKXoFH2Kk0cJliClqOFOyVKlPYtDBylHkoBk3ZaXimmGF
	 UTC4EXSh2XGPr3MAYpFHXaQC06cMvxFPk/oaKh9P0uvGjhRsnGtg7hqA1v0S3/WNOQfvY
	 wxwAkZNod0wdfrVHqelfsTThi6ZV0bJBOK7OKaXCN00K1rxIaGQGIOZQSgCy/JbdUb42Y
	 TgSq9MEI72dXH3mAjsLm1zgMR7Ff+VtSjAnrEATHYkwYuDXGgfw8zCDUbK84U4Ofn3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794822184;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=lUNaTCcdfWDc+F04yNeLpG4cAB0pfDKkmS9IxUIqTLw=;
	b=QqHdAVghiHrLfsShZXZfEymL8c51zaU/wRQYMlORwmEHlETK2WeDOMjAtRVcK4LPJL0T
	 VL4YliDuStwmbkki3FpSmAP/t6YHrYQrszUT5olV79gzXaH3MWsL5mk8F4Cf+iSZjDVOp
	 OVBqICU+M1M5GG3Caqq3Pm15jpZ+vcNUP/7y8SAxOa79HasoJvaBj1zWIOyYzOKNlex2f
	 qgQCn3yv1c0sJJu4clIU00iWMw3W1qvSn3cmQxghfBmrAy7kLk7qX6ZmCOKAurUlYFZEk
	 4mRmsO9sq6ws445P9CeBmxEy9Hiki75gwRGiakWZdIE3SvSxxdp495Dl8+dwvV8A4xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JqLJLimj;
	arc=none smtp.remote-ip=209.85.210.182
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D686D606A33B
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 09:43:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D686D606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JqLJLimj
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8a60f90a924so1200913b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 01:43:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794822183; x=1795426983; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lUNaTCcdfWDc+F04yNeLpG4cAB0pfDKkmS9IxUIqTLw=;
        b=JqLJLimjvyHi29j5wmDVtOgLsfTX8B50VG724BaoWIBHurLiLCwRZROcUraGJ2fct2
         duH2V8uTD0vffGG8PevPY+I4/gVYmGqwIezroUliSk9JfKz1HQ2oUCnLUjA+SU/CO/RK
         14GbJqAlDn5+V0weu1ZZghK1jsKcPKV39S+kXBQG4x2rXC0xTU1ezj+rc5sEl/Q9+ytc
         rU302DuVZLmpXvUf2ww0gSbwf9xckvW1rEDP0GKxszyMB1gH320LkoEHrVRFOyhJP0ve
         tLK8Ana36yK0p+d1xQVSOQ2e00xoRC3LYs6U76Py03yGt0FpOTGnUXKU3Xe//PrY5R3J
         34Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794822183; x=1795426983;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lUNaTCcdfWDc+F04yNeLpG4cAB0pfDKkmS9IxUIqTLw=;
        b=HmVKyBP1iXAeJSqMpes1Nwvi/+jenP4noKKTvgXIuNZxP7vuaIT9JB85yD9dUp0cT6
         FOFXyiiBEYulcyNIzC/q66TML1CrZEPWeJy0i+CojnEdBNGy17WPLWL7cmBrrWYYUuJ1
         oEjyNlZrF7+Z9hzysNJ2fdJk8cf4damPcE8sq42hp7pgqi3jl0dlFyzKCkkEoGeqhC0/
         vfljOfPkF84i3E81jSxRHh4TNHbBJRMCQNhrtyeJibN1SI44HbkjuQoRPq4CFQrxzlML
         x2wE1tHXE0KoNhkCYzgw60rlp8BChZudQSmL2OQURwVDVXuQ0U0Vd0dJKU5Z6YfCWFdW
         wJog==
X-Forwarded-Encrypted: i=1; AL+hErHah47a480sB34B1gWSUhDj1EgZUteI5OWcofGzURkvsi2sPZXwovhHPb5P/CeCGiN9OkWWB5ww4KQBJnI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+MQNIZJ3ztj9Sc/dm5ty7rCpUtqaEX1/faTpMPJo+nJvpeiNDm
	yjP3Q5/IKLMJ3mOWCQDcVQGr9WF8g5jUG971Z7dHdWFn/hACdAisj3tc
X-Gm-Gg: AYBFou1N+yvx4s1jqRhSoWpIqFB7kzu+5ppuMz6T6C/JxzMc1AQZpJXDXurDSrDSTiE
	K1LxS9tCtJ5i5IjU9AiKWbp3oMI2ECuQqFirKQQT+2a7ITNO+EpfVT7YXFtzmd/YiFUgNomqkl2
	x7Fl03UofGQAUjXh2Rw8/hqKZ+yhRG7orfsSnoNcEqo4NlnMLulMLh5w2MMmqU9ImXZeKwlX/z1
	VdC9scjrHnclNlekfq49cGJRBJCCUTIUBT2ObrS/Vfdnvvxoy2Aky5WBOnXMxGfxKgbVgRHLaCo
	CaZMivCs+fPcZ/sQoB85fdTe/KBPr7G3TsWy0K/heqKtQojUyIlDIi4ZE2TcCldjSyfyEn9fgU2
	K4z15DifDDpLhypQ3pL4TRRtEznx0/6FRcr4JYGvuCIjOLKp0Qyth6Zr9ybTjUpRevuMdH5TXAM
	E4gdllPfYi96R6fUPBW78zdylWEAtxbXc0WhNX7Z+FZqQtm5qgVx7cQXXt/nWiyjj1Eh0v3kycy
	JuNnxnNR0IdEXQVXR8HRCYsWEl6Pls4ojWVSYOm1lekPWBqHMm99sf04amIZBMI1Bxd+SldHOYz
	zHXdAIG6ErNThVv5cb5SZP3gQuvgd9UFXbZDj4m+zzYezwZPc+X/TRAfxKDAEPqfrL3Nc4zKpek
	6//nySBIc7q87IeENgA==
X-Received: by 2002:a05:6a00:4b52:b0:88d:20ff:15db with SMTP id d2e1a72fcca58-8beb7a26493mr9160303b3a.54.1794822182843;
        Mon, 16 Nov 2026 01:43:02 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:f133:af41:7614:f46c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed12a90fdsm3424231b3a.15.2026.11.16.01.43.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 01:43:02 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Mon, 16 Nov 2026 01:42:53 -0800
Subject: [PATCH 1/4] sysfs: check for SYSFS_GROUP_INVISIBLE using equality
 comparison
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-sysfs-group-invisible-v1-1-94cd173a7d9a@gmail.com>
References: <20261116-sysfs-group-invisible-v1-0-94cd173a7d9a@gmail.com>
In-Reply-To: <20261116-sysfs-group-invisible-v1-0-94cd173a7d9a@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Johan Hovold <johan@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
 Fernando Fernandez Mancera <fmancera@suse.de>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev-6b8b8

Unlike SYSFS_PREALLOC, which is a permission modifier bit OR'd with a
file mode, SYSFS_GROUP_INVISIBLE is a standalone sentinel return value
indicating that the entire attribute group should be hidden.

Replace bitwise checks and flag masking of SYSFS_GROUP_INVISIBLE with
direct equality comparisons so that any invalid combination of
SYSFS_GROUP_INVISIBLE with permission bits is not silently accepted and
instead triggers the invalid-permissions warning.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 fs/sysfs/group.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/fs/sysfs/group.c b/fs/sysfs/group.c
index 4e1e4f18a166..cc03229f8a94 100644
--- a/fs/sysfs/group.c
+++ b/fs/sysfs/group.c
@@ -69,8 +69,7 @@ static int create_files(struct kernfs_node *parent, struct kobject *kobj,
 					mode = grp->is_visible(kobj, *attr, i);
 				else
 					mode = grp->is_visible_const(kobj, *attr, i);
-				mode &= ~SYSFS_GROUP_INVISIBLE;
-				if (!mode)
+				if (!mode || mode == SYSFS_GROUP_INVISIBLE)
 					continue;
 			}
 
@@ -100,8 +99,7 @@ static int create_files(struct kernfs_node *parent, struct kobject *kobj,
 						(*bin_attr)->attr.name);
 			if (grp->is_bin_visible) {
 				mode = grp->is_bin_visible(kobj, *bin_attr, i);
-				mode &= ~SYSFS_GROUP_INVISIBLE;
-				if (!mode)
+				if (!mode || mode == SYSFS_GROUP_INVISIBLE)
 					continue;
 			}
 			if (grp->bin_size)
@@ -151,7 +149,7 @@ static int internal_create_group(struct kobject *kobj, int update,
 	if (grp->name) {
 		umode_t mode = __first_visible(grp, kobj);
 
-		if (mode & SYSFS_GROUP_INVISIBLE)
+		if (mode == SYSFS_GROUP_INVISIBLE)
 			mode = 0;
 		else
 			mode = S_IRWXU | S_IRUGO | S_IXUGO;
@@ -522,7 +520,7 @@ static int sysfs_group_attrs_change_owner(struct kobject *kobj,
 					mode = grp->is_visible(kobj, *attr, i);
 				else
 					mode = grp->is_visible_const(kobj, *attr, i);
-				if (mode & SYSFS_GROUP_INVISIBLE)
+				if (mode == SYSFS_GROUP_INVISIBLE)
 					break;
 				if (!mode)
 					continue;
@@ -544,7 +542,7 @@ static int sysfs_group_attrs_change_owner(struct kobject *kobj,
 		for (i = 0, bin_attr = grp->bin_attrs; *bin_attr; i++, bin_attr++) {
 			if (grp->is_bin_visible) {
 				mode = grp->is_bin_visible(kobj, *bin_attr, i);
-				if (mode & SYSFS_GROUP_INVISIBLE)
+				if (mode == SYSFS_GROUP_INVISIBLE)
 					break;
 				if (!mode)
 					continue;

-- 
2.56.0.679.gc527c65306-goog

