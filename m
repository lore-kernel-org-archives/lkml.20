Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793114205;
	b=Sth5aAReVegirZ7Fdnh7UvScWuQj4HNPNzJOjWugpNGtSj8e6tDhyHF5fga+7ZM7sr5+
	 QcaZOwi00b/Ke7fOD1Tt7xMcjWXFvKAePzpNAtNfREAtFiIJzfG72ysWYHXEa9QW7k7E7
	 Mav6MXbFf5iEsIZHBJlyJZYK8R+mfyTy6t6JrlWEGavV0Cr8gAYdYxvQRnmpeHSFtenYM
	 Q43n/3KTs91bAEIpkZxpGtgakHkDk6oPm/1dywntE31wtDHooLQcXkb2SzCmuwC8D86A1
	 ZUGy6zCRF9O1V9hPCPfFGuP9nN/CA0OAUK6WnOk/Ng6UQAVBh6DMXZrII76UI5kdraA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793114205;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=IFHTFkFZHATvDyA9vMl3gA5TnmzEIZlmMLjprD1MJL8=;
	b=t1PiBIb+lyGzIDP3M17fPUjPFNriFqQF7Nunf/S5mWQC4amzAu5SA8vmziwvJw2RgSgK
	 9vfCOThtJtSAseAuhVYGqfLadb3p5bcqAf9GbseJLlqLTNmsrF+goavlbIPLdzH3Mfok4
	 9t0HqwiffJcCml98K0lbvBogBSRxX+dLd6hKVNkIYjnNkUpmdOOjJ3A5ZXtDpOmh1ieFE
	 knsOVVMOXGMPwo0kTTGq22bBpYOkqmKDUuuh/73UFf9T1xAlmyLh8ULBT9OfPRVsXFLDv
	 KOTFd89bcW8TftkYNW1rElTX/hkuVWh+RmOs/hHVA/czFaFADSNPEeOOwWDpoQ1u4Rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EMwJSw+M;
	arc=none smtp.remote-ip=74.125.231.131
Received: from mail-oo2-f3.google.com (mail-oo2-f3.google.com [74.125.231.131])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42136606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:16:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42136606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EMwJSw+M
Received: by mail-oo2-f3.google.com with SMTP id 46e09a7af769-8459f7bc7c0so2215653a34.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 08:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793114204; x=1793719004; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IFHTFkFZHATvDyA9vMl3gA5TnmzEIZlmMLjprD1MJL8=;
        b=EMwJSw+M91PgzAQaQPtBgZc95p/uQGS/T6PC3FZEOMTygnc1uk0gICdyas7ooMBwTQ
         fcIBKDuIB8fG3rqCWQVtuBedLeb3c0bcPs2vEMH4jxIKvS6Wb106lFSoj6Ujv9soiH2S
         4KGUMy1GNReA0DdFg5zRiViC77yBwkL9/YY7hS48bT+jU2A2WTC8bbblKYRiyaW05Qq7
         jYcAVYo8qkCDYd9WnDWK+p6WVOPz0o54JpvUpqJUgal3cFP+0b7TbGlQExyi883vtJws
         obRvHzujWHoWuAFf3jqpkjUjsgrEz9nmBGqNiPvav58KydrmsngXxi6/3nSte7+5B9zF
         LiFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793114204; x=1793719004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IFHTFkFZHATvDyA9vMl3gA5TnmzEIZlmMLjprD1MJL8=;
        b=HjyAKw66LSfEWl6rCbubvLbn6JosVEJOx8APAmDMxWXtign3EOMWwDVvQYF3K7zC/w
         C89/VlQRp7ozVpY09Jf/K+fKdJH8dnq0cVm/19c/jNEOP/nwwil7CmwLWcYPNcdNBs8R
         IHbONzON3/PvVXFZzvArcFVtmkSZNNmIBu/ZxMxc4xv3oO99sU2JxOoJm78PkvlNg24n
         wxhKUvERojQXVOYULbN6JPjSA2HW5y+OFjwJOKmwVqTRkEndMX9XpHAIgqDOHbPnkD8v
         C9xYhFySZXvyWpvk2gSm7cM4UKlcD6ie11f+g9rSSHUzTYlRZVNGOIPJnRUxfmxxG1U6
         kEHA==
X-Forwarded-Encrypted: i=1; AKwUvBydHwSZCxJkOzhYJf1bRs5OBplRmeEYh4Pmrc9EaolndsQsWIrPlxW4/CQncSDjjpcnS2nRYjLDEifLOW4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJEOrx2H7L2Iz5KmSAlm8qu/p5EypDY45z/+oo0hgvH46wlJXc0
	dR3plgj1WQa9fwzyb7cWePY8Xyl6TE0f/NQRrvJ+PuQI7Tg5eixutRQqL/GO4UFJ/Qk=
X-Gm-Gg: AYBFou1MwIPC7GlWK2L0v9a1DeT9X/3if/xDfmTp999oXNrM6M0ZrhJRjT6FqGbG7ib
	bkHJ6B76QVr8ddekqsf6EmQqAysNFibXl7wRXEtOuCYVCBEqVbH4Jttrht/SXzVFSVBu9cM8KmL
	cEEZuqI2M5GrVIRMXfGoLsJAuFZr0h30JH4+JsLlu75WEmARnn+s9G8/SLjVbEmpd1PDkG1Qp8l
	31UT8rO8X9LXgHXf2CJnJQejDbN5PwCk+yEXdRQFFjWt4LX/Db22448z0LOO5RkQShphwyUNxyf
	0zlIV7LUg5bCMHrM0fyLa+2MBZ43I6kthRF5bDwyHD/t9yc1YN/u45V4nbSoZKX57QvLpcVs7Qw
	rQ5alQVwwlykuL8P0VbEf7lGhWzoBwpt+YF3CHwiS/JTm4ldq5JVh7RNMx9h8RbdF+9eF2GANE1
	OIlGj76RO4ViyCeVoUH08it9Bx0H5ISLTCOrLbyJv//xS2mIYTZIieRoYNgRoa8ak4EacKZQ9yM
	sDtc4388/IV6U+nDnlqQ4S5UiqaFUR4mCQRCHz8/RTw/x7W/eFzfgwFEN48EwxZgU5UEPzqth5r
	64T2ucF6Uqt4hqAmJKa9JYR//N6+OwaddC+KCQZC4w==
X-Received: by 2002:a05:6830:2b10:b0:821:c75e:5309 with SMTP id 46e09a7af769-850fdb42781mr8911434a34.7.1793114204118;
        Tue, 27 Oct 2026 08:16:44 -0700 (PDT)
Received: from localhost.localdomain ([14.116.239.40])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-850f8458d7fsm10768970a34.2.2026.10.27.08.16.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 08:16:43 -0700 (PDT)
From: Henry Martin <bsdhenrymartin@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Henry Martin <bsdhenrymartin@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] fs/ntfs3: fix NULL deref in ni_std5() on stream inodes
Date: Tue, 27 Oct 2026 23:16:15 +0800
Message-ID: <20261027151615.971171-2-bsdhenrymartin@gmail.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20261027151615.971171-1-bsdhenrymartin@gmail.com>
References: <20261027151615.971171-1-bsdhenrymartin@gmail.com>
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

ni_std5() looks up the standard information attribute in the inode's
own MFT record:

    attr = mi_find_attr(ni, &ni->mi, NULL, ATTR_STD, NULL, 0, NULL);

without redirecting to the base inode.  For an ADS stream inode,
ni->mi.mrec is never initialized (ntfs_init_ads_node() in
fs/ntfs3/inode.c leaves mi.mrec NULL), so mi_find_attr() ->
mi_enum_attr() dereferences rec == NULL:

    BUG: unable to handle kernel NULL pointer dereference
    RIP: mi_enum_attr+0x18/0x180

The SYSTEM_NTFS_SECURITY xattr path calls ni_std5() without a guard
for stream inodes (fs/ntfs3/xattr.c): ntfs_set_acl()/ntfs_xattr_set()
reach it via ntfs_insert_security -> ni_lock(ni) -> ni_std5(ni) on the
stream inode, and the stream inode inherits the base's i_mode/uid/gid,
so the may_write_xattr() ownership check passes for the file owner.
The default stream-name parsing (colons) is enabled, so an
unprivileged local user can open("file:stream"), set the security
descriptor xattr on it and panic the kernel.

Redirect stream inodes to their base record in ni_std5().

This issue was discovered by Tencent CodeBuddy Security.

Fixes: be71b5cba2e6 ("fs/ntfs3: Add attrib operations")
Cc: stable@vger.kernel.org
Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
---
 fs/ntfs3/frecord.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/fs/ntfs3/frecord.c b/fs/ntfs3/frecord.c
index bead01a953f3f..dce6400195aee 100644
--- a/fs/ntfs3/frecord.c
+++ b/fs/ntfs3/frecord.c
@@ -89,6 +89,13 @@ struct ATTR_STD_INFO5 *ni_std5(struct ntfs_inode *ni)
 {
 	const struct ATTRIB *attr;
 
+	/* Stream inodes have no MFT record of their own (mi.mrec is
+	 * NULL); the standard information attribute lives in the base
+	 * record.
+	 */
+	if (ni->base && ni->base != ni)
+		ni = ni->base;
+
 	attr = mi_find_attr(ni, &ni->mi, NULL, ATTR_STD, NULL, 0, NULL);
 
 	return attr ? resident_data_ex(attr, sizeof(struct ATTR_STD_INFO5)) :
-- 
2.43.7
