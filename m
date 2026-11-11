Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794413924;
	b=RPH8h4MHsPSaP+Zq3HL24Wt+AN+hopWdODF+87bICS6L2eylVJOGPI3SHnvM45L4Bh8d
	 ofo09cG1r427eanY4A5mpbOwp1/rGD6KYWH7oQP8n11kpQJOPcFMMbxbfACHFqAGjAE2r
	 9Uq8nKDPytI98AI48ZYaUuw6P8k6KgNpYBWhwNrJayVEpzLrROlrXXJohaFp/qAa0nnWm
	 Jy7PgXih1NNfuON8opZG8yDcGKZD6Z8EbZp/sWwGHjFV+fo7WTx9heRTBHtmN6iSulYws
	 pOvUMw44+M2ZQLnVZj1JZMNf7NzFJvStjvlvwPKD/JPO0AsYEfZHevvA7vgFbH6FUMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794413924;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xB2s5ICjL3oZNT6AvTpBrsJtB4knw0Blt3rv8CPT2C4=;
	b=bbzD27KziDLobBsp0Gp3QWFf2XauV4PvUjAZHBGdKtpgnOfNVqNMEJ8Nh5RuY+sT2KvF
	 CxDnGEnDThQbxqkTobJqlFIU4cTxnvDbrw4q3OVpGKFztdrdZrJKu/vdAc9uvp14L59VF
	 6Pgzhec5LvPLDYyzx8P4kZ88yuMzJ6i6Lf/8WwW6t2ET7bGjWsDfc/8mPtekMUwHfJUc0
	 COs3RpaxLJ92UeNX+DjuSPkau+py6v5gxdd708EOqUmKOFx2Os3V16J2oRXytOn/setAy
	 zbPZ2YylcwG/pY2qBsC4BUuVLhP5UenSItFXulgj+1EFUXLFmbsXAmKO48YOzhV3CMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ionos.com;
	spf=pass smtp.mailfrom=ionos.com;
	dkim=pass header.d=ionos.com header.i=@ionos.com header.a=rsa-sha256 header.s=google header.b=TGAaFXZq;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A55A960A3825
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 16:18:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A55A960A3825
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.a=rsa-sha256 header.s=google header.b=TGAaFXZq
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso33563705e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:18:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1794413922; x=1795018722; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xB2s5ICjL3oZNT6AvTpBrsJtB4knw0Blt3rv8CPT2C4=;
        b=TGAaFXZqf2Brxuyh2Exohfr7P8fxYKFal37wdrA7UNjI79I0ZnjXdGiL4EJesRtQsG
         D76COQSg5iYYvHX9juvxJ/zB+k/o22jwdL8GzfsubnXIeFFE5hNhq8II71G5Y1CUZYoy
         9fLwoG+YTOnvITgSGe3iZ8iG14qxTwiQMvech6s3ROnxuMCwFR4/Ld/N3uXvTdm8vfri
         czNlMo8XOQGS+MKEsSBlIPtItvNBy74On4GuUOU/awT2qLro+LUpyCGGL2b4wpuOk85r
         2IKdHPSA/uSTx+/F8TwFPeDMsQln3bOiVp77+J1180cNhMl8sMou+OWPwjStpw7HbyLY
         usZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794413922; x=1795018722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xB2s5ICjL3oZNT6AvTpBrsJtB4knw0Blt3rv8CPT2C4=;
        b=rnp/cbrqPk2nu6rlBM3os8YcPwxcagwTKhKmXUCxhouzJEd01ui58sCduRSyDZxH5z
         qfju/SEIYxEMKSV+yR+Vw1zuKIxAiglFVUlhGLdgv/aQQY0N3mWFtjaboXlvaK/ooTqV
         f0MbxCQ3r1uzacFvt96FEQ2+zZAPcdgnQBo7f02WqpklcPJRQ7o4rWD6e8g02uyM/DG5
         voN/3IzlgGeUOVvS8zjG2rgx1xVxBzkyyo5itiPglgNqb++plQtSBLlWIIMCvS9zNZsQ
         XrE3XtFjeRGKirWIjhaqqsWowz5EtGxCaVfR8YkGzM+Hc2GzlmZnHWOG1qbSmBF9lqtb
         a7CQ==
X-Forwarded-Encrypted: i=1; AL+hErGzF+CqUp7xyY0fcBli6I/dOFhwCJ296pmpOKJfOC+X5LtzxwCR8lTI7/4db9Y4M/sfvoV1ZMXSzMH2Xcw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+tTspipU6qLEwzRNVhtE09kGM9r5sGhwurNp31TMHYDaQ9cOo4
	jKPqwMSYlhG20mjZxygUcZYeQ2ze4/9GdAxR0xIjIYFWDz2HSa11Hn6SarUHmvAa32U=
X-Gm-Gg: AYBFou0hhau0WQNCEZyR1IKSW0zHerEHUt0aWb7Q6h3o3HIJW8XVeyqYGe+wpHcgkC6
	/Y+2Na8IzoPVHebR1GXCSXD0WEf/+dpaWHlb4FZURiiBjphAQeNuSWk9cZRvuGlCDepDfdTxQL4
	Zy/GP1AKUUK9gpa45Q3tkM0GJJKyJ00NEnNccClZ7dMYbu4Zcp5Bfkms4CdcQx/wr6MEKA0uuGM
	Ld4kGGcUuiavjaw4irfX3J9q+taZ1Mbja74uF5JdA0y2H+a8ZAVuTNEWlSlLM126DEaf+lGgVSe
	a4JsIk3fWOuqXpNUkMizERh9Gc9tyvH6j/NvX9GJn8S7y9d+pRzB8lvE8Zq960W/ab1yH7GnKl+
	nsuxDFm1DUzCjZSsJMHtpNzOX7tTt8rBhDO6/CHogtspXzqpJil0tzTMk9A/7Y32ZtGK9wB5+K1
	+jH//KdtAc45Tk+8cQXKDRvDRkR/uO63EF1leD8CD90ZsT0PmrDsR5xvDuAD2WjNQHLEj8rPIoD
	k6Wcu6w0LyaqjxSd+bmd2QfKjGHXys4F2JKKTqfZukjvVLXBFw6iOx6Mzs4G4eHEO3rOfzD64p+
	cuVpMrYuy/nNPFx7VQh4568ZXd0A6GPBoUWBSUBKVyb8Dvho96pq+IRVeKOZU1zBYXSFVPEFXWU
	fje/q/dA8Me5Fap/BeX9YV+lh4Bm0DFUkYW1ZhwPUHZl3TwDEZWE=
X-Received: by 2002:a05:600c:354a:b0:4a6:42cc:bf66 with SMTP id 5b1f17b1804b1-4ba0935dacbmr52726595e9.11.1794413922136;
        Wed, 11 Nov 2026 08:18:42 -0800 (PST)
Received: from raven.intern.cm-ag (p200300dc6f4cbe00023064fffe740809.dip0.t-ipconnect.de. [2003:dc:6f4c:be00:230:64ff:fe74:809])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4983600bd6esm12209506f8f.28.2026.11.11.08.18.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 08:18:41 -0800 (PST)
From: Max Kellermann <max.kellermann@ionos.com>
To: xiubli@redhat.com,
	idryomov@gmail.com,
	amarkuze@redhat.com,
	ceph-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Max Kellermann <max.kellermann@ionos.com>,
	stable@vger.kernel.org
Subject: [PATCH 7/9] ceph: fix osdmap use-after-free in ceph_sync_setxattr()
Date: Wed, 11 Nov 2026 17:18:28 +0100
Message-ID: <20261111161830.1336485-8-max.kellermann@ionos.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261111161830.1336485-1-max.kellermann@ionos.com>
References: <20261111161830.1336485-1-max.kellermann@ionos.com>
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

ceph_sync_setxattr() reads osdc->osdmap->epoch without holding
osdc->lock, but ceph_osdc_handle_map() replaces the osdmap and frees
the old one under that lock (held for writing).  A setxattr() racing
with an osdmap update can therefore read the epoch from freed memory
and send a garbage epoch to the MDS, which uses it to decide whether
it needs a newer osdmap to validate the layout.

Read the epoch while holding osdc->lock for reading.

Fixes: 968cd14edc3a ("ceph: set osdmap epoch for setxattr")
Cc: stable@vger.kernel.org
Signed-off-by: Max Kellermann <max.kellermann@ionos.com>
---
 fs/ceph/xattr.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/ceph/xattr.c b/fs/ceph/xattr.c
index 8f97b6448d7a..64ccf70aa3dd 100644
--- a/fs/ceph/xattr.c
+++ b/fs/ceph/xattr.c
@@ -1179,8 +1179,11 @@ static int ceph_sync_setxattr(struct inode *inode, const char *name,
 
 	if (op == CEPH_MDS_OP_SETXATTR) {
 		req->r_args.setxattr.flags = cpu_to_le32(flags);
+		/* ceph_osdc_handle_map() replaces and frees the osdmap */
+		down_read(&osdc->lock);
 		req->r_args.setxattr.osdmap_epoch =
 			cpu_to_le32(osdc->osdmap->epoch);
+		up_read(&osdc->lock);
 		req->r_pagelist = pagelist;
 		pagelist = NULL;
 	}
-- 
2.53.0

