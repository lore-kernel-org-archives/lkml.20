Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793969174;
	b=nJKs0LmPKSOjsUrGiOEppzKblLKg9WUmF7kZZ+SZ68lA7RPMfz10EPquLD++TPWC1a1Z
	 zmyGPNZauRedHWtOkm5Fz3l/ffQsowwZlFjC9Q7BfSC+kgWXcsM5qC2oWNxVkz3jMktD+
	 aloas7sbYUprBZ0aZV3FeCBSA9d2oxvA9ws1QLATAGMz8pFwOzWFXy4FZf+Ynj+yiSyKq
	 J6JXxNfVDoLoMRPhznwcpo438fkH/yxRb4Srb70Lk787AcPFsy7CelY64UT2zFZ3Iawq4
	 C7pm9AqVN3XW/okg7wYI3YuZj/Wtwn/4yY9zqZY26DX9SWxVW91jO48zaDBarcb3NoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793969174;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=to5ZYe36a7Xl7ja/Fvmb8moZkHvXAEhFxAyr4iAV0io=;
	b=Fenp2BcuFzYPNik5QDCRJN6yzmH3ePwPlpq0Rj5L+9O+1J8Y5wuKO80KBCSh/3AzPUmR
	 Ghmhkpu2IzjDga4TZkYfGDh1EJpz5t145fVJ+n5DqVQVLTykn7gUfwLhnUgXKBtaU518l
	 GEG8anqC4YQfI10IfkhPU/IfPMgPSKnTEg+UsZ0qjzjvQ/8MTWEBaPVjSGo532BxCgHra
	 7CSe5Xe25S68dJbVLOTMVTzQajK5rCFDlsNMPPn45f3lrK926GMtp66RbRkbNVjXG55MF
	 GZUaWv/NlrAUMGucmn9cBli1SVhMYRtj/AkTyeCMlWA5OeSrBRx+/TnvGJQHkB0EqRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OtI1fWwO;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38EB2606D822
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 12:46:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38EB2606D822
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OtI1fWwO
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-3700ed8dbe3so480951eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 04:46:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793969173; x=1794573973; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=to5ZYe36a7Xl7ja/Fvmb8moZkHvXAEhFxAyr4iAV0io=;
        b=OtI1fWwOBO1UK/xBVF361zKX5pNVC4vlOBT8ozO8B7jwOHG6ejWk0PFQSiaUO6goh1
         lqLolKuP/ZuEkvIasGgWRMlSwGUPYOU2TU7EAJBPDqdrcmOlq6Gv/y/kjwPBFsoMk+8g
         HLztc8XnbL13xQXeFLXuyOuZZ5+5QTP0FgLCdYiULs/twiNDdBYStOmozF7hKRfh+PhI
         pChKKxj9DXmURGSQHP92wwb7befLbFwo6kZn7sfpYZ7RGTmsMd9807/pXqyYsbZskAzG
         GpLDAKkvHnHuHMAStFBet+Rz5WhPr2n+9S1T1PRdarZ/DSu3iqlO8geZpC5DtSEVHydB
         xitg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793969173; x=1794573973;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=to5ZYe36a7Xl7ja/Fvmb8moZkHvXAEhFxAyr4iAV0io=;
        b=1OGJMeIiq6fXyBIJzHfcD7bvHFpfK+mvoDMaOHyjTXKwinoKpYrPzQ3EGQalzpmxQl
         z5TcS6N0mRQakGLlTsCUtBsOUHamxHtMt4TYHRLGTGqRRvzCBMfNAbNvEUGJG1r+zO71
         rhxQNFGT8lY+gIW2PuFskfPEx1XacaQiz4FA5zQPd+r0X1oKFeEIV/zr9BmhEFY0Y+1M
         hMpocZSRwo946INw1bWZb07sm+LOZcEOu22tgTTJdY9bqP0rs3/XXVCiG+rU8IFC9DXG
         d0Ke+OpGfjE9KO2u9oh8umrA0DgIjwQ7IbrFFnP8LD+bqygcY1Z4aHZZCxm4EXizjpIq
         yxWg==
X-Forwarded-Encrypted: i=1; AL+hErFpAPxrXIx0sxlkKqwoSHHdgkUszMNmOk1ImpeJMc66IH/epyxOzSEiHcp410X9Jum7SR4C06nzU8wgnyw=@vger.kernel.org
X-Gm-Message-State: APuU4Z92JrrxJ8kUcj7iGXwhajrjsYU4Fksck02wbnhryFNKJ1sTp6Qa
	mDjIA9NiU3PFP6rbxLU4LTA6ggQp5Kg2x6FHdzgEaCPnShoZGc3Ke8pe
X-Gm-Gg: AYBFou17s6Fh5eg8xyAsb03803W1Jx3K72dBgB0z0iQTAbA0N8RbFmLL4YJueVFXdbo
	J7NFqycyPa+RXFRWBzpNUxWHcXRlf2u7xEGFRH3uGVBPyKB2/w4jhH6eavKneZN8nFFaesQ7f4K
	0JOGznak71u5U11L4SPvlnx9HAi0Wrv4mJkVSw06beYbQjB5L33/YuvMlNdBAMaevrdCW6J5Et0
	AHeyzRmRRgrd/5rn+9S4UjnWGpAjQjyaW77vr/T1TDOkZJLdAOkcjGqw1ro7UOiCblqU7QHBEgp
	05LN9zD+xXy0A+Ky4gaKlStBZ8WvsaLc+ihyZeDKaNkyrMRvub8Epb8NpoOXuTs8k97pO/xr0oh
	+NRiLn0SIf7EWMZmPI7Lg5zqBGPV8GFNm85WIE7ymTqRqzPIQ/KRgvHFV36CUt/h+zbFo9g+anS
	0Am1ZXV6uEGcs1WH4k+AZYIRqR1OF7x4G5Of+Lbfi5w197wWDRwoipcuQEclXJraGfqLE8iAqb2
	2HsyVe9TpgWENZAGNhTbhKORz/5Sah51ixSvcaQ5H++4RS6XbqUKx/iDwjEJDsntqTW6JfqcarH
	qnH3OYxVrKuppmaFeXpFlOSVC0D+mkXmcCImKNuJj8Vj26Gp3um+CcIdWYJP68txRQ==
X-Received: by 2002:a05:7301:424a:b0:36c:9afe:fcd8 with SMTP id 5a478bee46e88-36f772f9061mr3192845eec.30.1793969172763;
        Fri, 06 Nov 2026 04:46:12 -0800 (PST)
Received: from anon-laptop ([103.187.196.159])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa651eccdsm6802331eec.1.2026.11.06.04.46.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 04:46:12 -0800 (PST)
From: Wahid Khan <wahidzk0091@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: ntfs@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wahid Khan <wahidzk0091@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 3/3] ntfs: do not convert a named $DATA stream when making room in a record
Date: Fri,  6 Nov 2026 18:15:53 +0530
Message-ID: <20261106124553.2617026-4-wahidzk0091@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261106124553.2617026-1-wahidzk0091@gmail.com>
References: <20261106124553.2617026-1-wahidzk0091@gmail.com>
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

When an attribute has to grow and the mft record is full,
ntfs_resident_attr_resize() walks the other resident attributes and
converts them to non-resident ones. For $DATA it always opens the
unnamed data inode of the base inode, even if the attribute found is a
named stream:

  tvi = ntfs_iget(sb, base_ni->mft_no);
  ntfs_attr_make_non_resident(NTFS_I(tvi), value_len);

value_len is the length of the stream, so it does not match the
attribute that ntfs_attr_make_non_resident() looks up for the unnamed
inode, and the WARN_ON() on entry fires:

  WARNING: fs/ntfs/attrib.c:2115 at ntfs_attr_make_non_resident
   ntfs_resident_attr_resize
   ntfs_attr_expand_locked
   ntfs_expand_for_write
   ntfs_file_write_iter
   vfs_write

With debug output the values were attr_size 13 (unnamed $DATA) and
data_size 550 (named stream) for the same mft record.

It does not need a damaged volume. A file with an alternate data stream
whose record has no room left is enough. The fuzzer found it through a
single changed byte in a file name of an image from mkntfs, which made
a write grow a resident attribute in such a record.

Opening the stream by name instead would convert it with only the mft
record lock held. Its folio would be locked under that lock, while the
read path takes the folio lock first and the mft record lock inside
ntfs_read_iomap_begin_resident(). Streams are not converted from this
loop, which only tries to make room, so skip them.

Fixes: 495e90fa3348 ("ntfs: update attrib operations")
Cc: stable@vger.kernel.org # v7.1+
Signed-off-by: Wahid Khan <wahidzk0091@gmail.com>
---
 fs/ntfs/attrib.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/fs/ntfs/attrib.c b/fs/ntfs/attrib.c
index ce7c1b524..800e53df5 100644
--- a/fs/ntfs/attrib.c
+++ b/fs/ntfs/attrib.c
@@ -4932,6 +4932,12 @@ static int ntfs_resident_attr_resize(struct ntfs_inode *attr_ni, const s64 newsi
 			continue;
 		if (a->type == AT_DATA && !value_len)
 			continue;
+		/*
+		 * Named streams have inodes of their own and are not converted
+		 * from here.
+		 */
+		if (a->type == AT_DATA && a->name_length)
+			continue;
 
 		if (a->type == AT_DATA)
 			tvi = ntfs_iget(sb, base_ni->mft_no);
-- 
2.53.0

