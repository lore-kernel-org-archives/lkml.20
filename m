Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794822185;
	b=pY2QefF/E/Nya2Hy0EMW1hw7PYI8a7MGlm/zKdxTOcZNW0sfMgLFUy7/pbu0qXmRVaEO
	 ryokHODGpUDgft5dpeSF8MBnSbZ9OwF8CBBi5wPsbztMj2/FGr6CNGGakj440x2ckVUsc
	 5YVXZRiGiQzjZ9SylRJtTerAgxtywHeGlUcz+X8QY7YBf6WuvZvPBDqt5ENH3KVfm9Ypi
	 XR9fVE2j7KALTvD39rlWcOEcnaX1aXcMt1m2QZBPf6AvIOwG35dvIu6aJkmEqMjayRnEo
	 ogAkBiDf+o1Vf5Bd9O5HqbwLA1PVDpvubmxpp+CpS4OFWLacCkoxl49kW0r53IVukQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794822185;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=5LYozNRqhjODpZRRGreiBPLyhGDd9kX9S97BkRXIX68=;
	b=tzTqNYO6b1yTX5IfFK+yTn1pRbt76Jasz5SlBxaNvbwEquCCHpg+XCw8cLAOEM6Ln4aX
	 LibLLrY7wkvd1WMNbpD7cXOpEZ7wGiT4X6ukqRAZudMjMJK1RLF4+LG39Rv+57P3m6q4W
	 uAu7NorCO0yZesNPO/UOI2FhOaHo/ejFUWzyelX5AlvywlEq5YY+guNzGqj417iCvO8ej
	 L1Wp8DncEoGeM/4oiuiFbdl5JjTqMoztA4k/2P9VOQzSpLzxzZdbsAE6Jv1cbAAXnxiZB
	 7Ao6vTLs9VadxEpcZgBvOUImmalNjLg6t+oLrKbwlwzB1SM3DOabuKnv6FkCBHcswQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w4deCNnX;
	arc=none smtp.remote-ip=209.85.210.175
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCF27606A33E
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 09:43:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCF27606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w4deCNnX
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8b2f59de176so3692226b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 01:43:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794822184; x=1795426984; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5LYozNRqhjODpZRRGreiBPLyhGDd9kX9S97BkRXIX68=;
        b=w4deCNnX1hIm1OQeUt4UdulhHxPEw1XaKDAmmTps8TFQkpjPcUFT+VVgNLKEa2K89D
         c7LsLhVE+XcxoyTrHQ03ZscsVJMD86/9LzdJrmmgmoqgsec+ek/VxWxxUNsIkhNt6e0v
         bwjma+cRQbq3CvGE5l+zx7mPBFwjKPZQ8kSStTkzWRDmpgfxZTQzqMmws0I2x3yi4yTU
         0Z/j5i+boY3/d8ujxlrST4jNxyILMWlmsoxJU5GxSDHfXRJ7wfsHNXnWq1F8B1hVlq2t
         WKWXLP2hCv7mSXWbHkLG5QYjwUZ1+XSWweWMxnYZo8sms6EQnKcZNdBl8PPBqT1DDwmj
         +ODA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794822184; x=1795426984;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5LYozNRqhjODpZRRGreiBPLyhGDd9kX9S97BkRXIX68=;
        b=aJLGxlJrjMXHoFGGzeF/6Ua1nwTZuN/2yKY4m+T6O75I8bg+LlVIK/9VZAb6OLg3V8
         6B9v0WQxXq/g1nOVmzIB4bJxwkKHSXA9WNvYUwruE6THKug+Ee+gdqDy9+QtZ3y4M/JW
         9Q8T1pRLM/g9z0yzKMGtSRB5aLEyDrken/sAL8EfihFLM5MN2veXMMW5zaG0+1h4+w3y
         xpFVgjjPixPmmbMcOb7mZOcquD8X9bWKi36K4HEJ1YcEx5+5+3fN6t/GM6r93D0/iyQJ
         tZx9zOjZm2PVwqc6CGskGzHfBDASBWuGWTcuZTxgKsOxwoZBRuMbDp+T+n7NlZsDHTUQ
         Wsdg==
X-Forwarded-Encrypted: i=1; AL+hErFoY/Xq6sCMe2rXdfqclaKPcUGjgCrfdGhSNhrhGR84XX8ZEresnGCNYrBwsFU+W2N7B2+l6923d1My5tg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+nR+j04OSJPN+alnFouXTkypNjO0Kry/C7t7G6U+RNtUpk0PXY
	MXPRWB1LV7Ru1cnsVwEu4+gHgpuyelnxo1hfdPqN4dQQ2RYaXh+KxAEhvjGxcA==
X-Gm-Gg: AYBFou2tmYEYFqEjl14x13idT+dAAQ2ds1jjOLBlKdsP7th7AcFNIIU+TP5q5COSh0P
	1Cn71+y/ibOnVFXKNOUJeUrlHaOX0zPMNGEwVqPnPCLs94jirg+4NW/b+BwxxpBSEJDyaqv0DE4
	clc56YdMZ5cW6J9S0u4+Yie3sTrr15v8TMfkQokz2HNse6b30UxegZsYKMGaW60KmnqjDbQxPTn
	XX6kGyG5c6zBlxVM40DQW1cEfLoeBGFB5D9bCfUgN8NU75rssDiVQNsAOn1F9jFKW1qn5Fi1icx
	J3NpjQeW19d1DSWo/gaQYTs+0UjTGK4qcBfJHDnf+CjGgwGGrP1p0wjJfaSHT2ZcyKmW01cf3Hf
	NmJery9ikROGj6abzpG+6nqNE2matcZcUX8/s5ioPTfv2RDEZ3Y/MYb6nYpwqkl6qhZg0r4k2z5
	MOUl+1lDii3qvkqL8rgpuXmmJMObwdrxXNEPzt+wwQWi6wzSWZQrdHYbzBcj7UHXwIqroJ7WpK/
	cGriKQlDMcnqQNPpAxagYjIvS8fibcDeYyy6VMgyK1UtmZ7pWVy5uEuWZTsOe1TPyeL+ccT+G93
	c7tFPkdHNMCuImMhmuPWeC8hchsbhNAx6AoH3MwpkoNlEW4GXe0PSv4pZwaZ5fILFya3NxCVv+a
	SeQzfstx9AKw+0k28qw==
X-Received: by 2002:a05:6a00:4518:b0:8b4:b88a:c2d6 with SMTP id d2e1a72fcca58-8beb6d604a3mr8639338b3a.39.1794822184188;
        Mon, 16 Nov 2026 01:43:04 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:f133:af41:7614:f46c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed12a90fdsm3424231b3a.15.2026.11.16.01.43.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 01:43:03 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Mon, 16 Nov 2026 01:42:54 -0800
Subject: [PATCH 2/4] sysfs: check group visibility upfront in
 sysfs_group_change_owner()
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
Message-Id: <20261116-sysfs-group-invisible-v1-2-94cd173a7d9a@gmail.com>
References: <20261116-sysfs-group-invisible-v1-0-94cd173a7d9a@gmail.com>
In-Reply-To: <20261116-sysfs-group-invisible-v1-0-94cd173a7d9a@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Johan Hovold <johan@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
 Fernando Fernandez Mancera <fmancera@suse.de>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev-6b8b8

For hidden named attribute groups, looking up the group subdirectory in
sysfs_group_change_owner() fails with -ENOENT before attribute
visibility is ever checked inside sysfs_group_attrs_change_owner(). In
addition, checking SYSFS_GROUP_INVISIBLE inside
sysfs_group_attrs_change_owner() still updates ownership on the
kobject's own directory node for hidden unnamed groups, and breaking out
of the regular attributes loop still falls through to binary attributes.

Check group visibility upfront in sysfs_group_change_owner() using
__first_visible() and return 0 immediately when SYSFS_GROUP_INVISIBLE is
returned. Remove the now-redundant SYSFS_GROUP_INVISIBLE checks from
sysfs_group_attrs_change_owner(), which has no other callers.

Fixes: c7fbb8218b4a ("sysfs: check visibility before changing group attribute ownership")
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 fs/sysfs/group.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/fs/sysfs/group.c b/fs/sysfs/group.c
index cc03229f8a94..290e70034329 100644
--- a/fs/sysfs/group.c
+++ b/fs/sysfs/group.c
@@ -520,8 +520,6 @@ static int sysfs_group_attrs_change_owner(struct kobject *kobj,
 					mode = grp->is_visible(kobj, *attr, i);
 				else
 					mode = grp->is_visible_const(kobj, *attr, i);
-				if (mode == SYSFS_GROUP_INVISIBLE)
-					break;
 				if (!mode)
 					continue;
 			}
@@ -542,8 +540,6 @@ static int sysfs_group_attrs_change_owner(struct kobject *kobj,
 		for (i = 0, bin_attr = grp->bin_attrs; *bin_attr; i++, bin_attr++) {
 			if (grp->is_bin_visible) {
 				mode = grp->is_bin_visible(kobj, *bin_attr, i);
-				if (mode == SYSFS_GROUP_INVISIBLE)
-					break;
 				if (!mode)
 					continue;
 			}
@@ -585,6 +581,9 @@ int sysfs_group_change_owner(struct kobject *kobj,
 	if (!kobj->state_in_sysfs)
 		return -EINVAL;
 
+	if (__first_visible(grp, kobj) == SYSFS_GROUP_INVISIBLE)
+		return 0;
+
 	if (grp->name) {
 		grp_kn = kernfs_find_and_get(kobj->sd, grp->name);
 	} else {

-- 
2.56.0.679.gc527c65306-goog

