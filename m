Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794923537;
	b=1Z4PrQIpL9wZb0Gu45qv8QYh7IJhkBech55v2ljqj77Xk8WI6m5jB3I8DGs8h86Tl/B8
	 MGUXZ2Yabi1OIJvpLESXq41xJ/0ns/SI2zngH4nwhTVAFHcXJMYqmNlaR4SBxXwIEbTXg
	 LVL9FeDrmA8nK2YDXWYyIq3oCKQI6H9PEB3vqDHQh3ijB5MSS2Uyde+O8jHm/IEMsFpyK
	 jSUvLHCj0w3FGPCYKRvtcTYnWDBZMH5dURe22ee/Z2DyKhBQaOgIPHKW6WMiSJnOprG+B
	 IptWR2UsgGhzULXutlOolvXFWt3ctxoLL45CKU1/hcznfFYU2oLP4i7vCDg9rjzM98g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794923537;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=qEwXXgzCb9umMJN15TTOelMx6FvsKuxkJvNzraJF4vw=;
	b=otg/ZOcIatgnTALhHpx7rHO13bH01uGHwLLHMlebVxT6jgJAeHMpQ1KYOpNMrBwxe4tI
	 ohAv2vIOOAiq49PebHjSKmDqycler3Ifug/vB0PYbwJdoz2sFCWfYguWTqvNQF4DwKWyp
	 CXPMvTX+nK5x+rQml1PIkW6tTKZFqhY0qSmPIfopwbrxJM3+Is4tMk0vUUidu5NA+M2nt
	 s53BhDbqzjOGy3i3S4o0SgXUvTZf30mK/9UfzAA6IADGnVTJGjKcPhBQjP134ogW8eN4a
	 GL0PYqX14qiLaixLdnWuHe0mwDQBhTYZJg7zn4CQUAxLo+mwSJq7olmAFNc6D7MdZFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F7Urt3aV;
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20D31606A33B
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 13:52:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20D31606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F7Urt3aV
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2eddafe648aso28469195ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 05:52:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794923536; x=1795528336; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qEwXXgzCb9umMJN15TTOelMx6FvsKuxkJvNzraJF4vw=;
        b=F7Urt3aVliZhyCp3tG/lsK08lCuZYAIvCyon27UzKBJ4vX2TDyEbDkrjD6R2bbeqwf
         4mVnMlK23NJQmANKWMGu9UDqvHN6ZfPKk7Zb1zoR88x8rGA7grG9meGGkdnEkWLvfG5/
         cb4TzFxZBroymBY0paTX6tNotqPiSSuNKJKqHVqAB0EF2Are/IBYCSUZPwTTvRHyfZl6
         2+QnfBN4Lwg5jAs+I8oq+qaXqMOZd8Sw7M3o6bXKKdt6LiKaloeIscGRxHVNtriipsQq
         mqLJ5b8/XyCqieOo4nGQnSPtbvtGd84W73cqTqwgs+DfoOx5Y63myZJj5j7YsGMBaF2o
         pfyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794923536; x=1795528336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qEwXXgzCb9umMJN15TTOelMx6FvsKuxkJvNzraJF4vw=;
        b=mLVr4cokD4cy+wRh0TIK0e+wpYy7hwJgVD+NqVH2q6hFqmFcLvI86xI2YrjoKa4fRd
         NTyX42dHjCpFTsC+Pjywoy4GpxxCfTMCqqO5nUTZyZjlWTFWMb7T7MQUxtBN1yhV/ffo
         sTnHKEU7ZS0c+UD0mL9afaoU40mU2WHMpcmXazjqOTq/LiD5Wli9y7iKpPjRP5lE44cy
         QANiIEEiEDA26AmMiQ6PPXyCXoTzvYfj8rjTymiLa/G+zklqw444pmYt+8+k0w+ZYhqf
         abFUUCMd8ywg5dJRaYNIdOs89m6npB+HIY5A6wVawb/nRzvBKYw6OdRpVUkowo8oa/W8
         z5iA==
X-Forwarded-Encrypted: i=1; AL+hErH8PW3Db8iaPwhHN9bvOQyIT7hecoujyoP3zBw782exe9CSTQM2XtU0xVsm1CywT/6MYlwhXDejveXZoLA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/RhcUx8aPi2Zy5+rQqSjVJGyV9JEPBGamE4xxYCJb3JkmpJJXO
	YjXtONiP065x7SFZT5hOXJbRqW4yWA8xIo5oTe4C1LuHOLlJt+Qj+QIU
X-Gm-Gg: AZFdTZd438eYeV73ttjGp7AhkYs1EvdAsDuZVxxV/GkfhzEAYsZeGQCla6xa0qCIiij
	OMLPDI8gzhl3nWEXDn6yH6KrJm9j8/X1b7NAXyQSWLYtrSqd1qZAOmPgJK93cFqzwBFp3CQGclx
	kKXLLOUjA3TpmDYXBV5rfNCrrIL9I0+6NlX8r3V+wCakniK/YvG7AnjzTyta/uJ6SJ53NrKE8nH
	BrqaOsAsnoS0BfxeivJaoC4VSZN8To83o4m96M63vmISOsMmBCgGhbmrDsxeZZrV00EYHNdCVni
	SS0nU+JqKzYSpoYr3ZuOY47dWrO3JugvedK8U2jMJMI3avU6AeqRn5lb7iZivSpdFNE5lcnQlHA
	L+1rKkVPTJxldhPbX1c9+r+SlyH1W85Sg3i0vakiCd/ApWgLPkb9HUOEpKOc2gxq49JTvzgVrwi
	oKdQ/nXviJkcVBTS3uSqTrwD30gdnhsznqx1j69zcso14/zofK8F2mlFV2GjFTeC0VR9TohhstO
	a6kP92irbm1yhq7MuSzvTNdWH89ZIDSZ/j926OuMOc+9e34SiSMU8RkVbbtuq5Ndc1+reI+V/XU
	BiGiK+FXgFPdLb74jEGRY8GcRIwZGaA2zV7fQgFGNVKwCKGbrA==
X-Received: by 2002:a17:903:1846:b0:2d9:599e:df95 with SMTP id d9443c01a7336-2ee0d6600acmr138465855ad.3.1794923536549;
        Tue, 17 Nov 2026 05:52:16 -0800 (PST)
Received: from localhost.localdomain ([112.170.44.210])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2efd7a586c1sm15937035ad.43.2026.11.17.05.52.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 05:52:16 -0800 (PST)
From: Junyoung Jang <graypanda.inzag@gmail.com>
To: Miklos Szeredi <miklos@szeredi.hu>,
	Jan Kara <jack@suse.cz>
Cc: Junyoung Jang <graypanda.inzag@gmail.com>,
	Amir Goldstein <amir73il@gmail.com>,
	Matt Bobrowski <matt@bobrowski.net>,
	Gwanhyun Lee <gwanhyunlee@gmail.com>,
	fuse-devel@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2 3/3] fanotify: copy full qstr length for copied event names
Date: Tue, 17 Nov 2026 22:51:37 +0900
Message-ID: <20261117135146.3174252-4-graypanda.inzag@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261117135146.3174252-1-graypanda.inzag@gmail.com>
References: <20261117135146.3174252-1-graypanda.inzag@gmail.com>
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

fanotify_alloc_name_event() reserves name->len + 1 bytes for each
copied name in a kvmalloc() event.  fanotify_info_copy_name() and
fanotify_info_copy_name2() use strscpy(), which stops at an embedded NUL
and leaves the remaining name bytes uninitialized.  With the original
length stored in info->name_len or info->name2_len,
copy_fid_info_to_user() copies name_len + 1 bytes to userspace, leaking
uninitialized kernel heap memory.

Use memcpy() for the full qstr length and write the terminator
separately, consistent with __d_alloc() and d_path().

Fixes: 929943b38daf ("fanotify: add support for FAN_REPORT_NAME")
Cc: stable@vger.kernel.org
Co-developed-by: Gwanhyun Lee <gwanhyunlee@gmail.com>
Signed-off-by: Gwanhyun Lee <gwanhyunlee@gmail.com>
Signed-off-by: Junyoung Jang <graypanda.inzag@gmail.com>
---
Changes in v2:
- Use memcpy() for both copied names, as suggested by Amir Goldstein.
- Write each terminator explicitly without reading past the source qstr.

FUSE fanotify mark setup on a zero-fsid mount returned -ENODEV; the
normal-name FAN_REPORT_DFID_NAME and FAN_RENAME paths were tested on tmpfs.

 fs/notify/fanotify/fanotify.h | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/fs/notify/fanotify/fanotify.h b/fs/notify/fanotify/fanotify.h
index c25cf5c1fc70..2d6b5c2c6f25 100644
--- a/fs/notify/fanotify/fanotify.h
+++ b/fs/notify/fanotify/fanotify.h
@@ -221,18 +221,26 @@ static inline void fanotify_info_set_file_fh(struct fanotify_info *info,
 static inline void fanotify_info_copy_name(struct fanotify_info *info,
 					   const struct qstr *name)
 {
+	char *dst;
+
 	if (WARN_ON_ONCE(info->name2_len > 0))
 		return;
 
 	info->name_len = name->len;
-	strscpy(fanotify_info_name(info), name->name, name->len + 1);
+	dst = fanotify_info_name(info);
+	memcpy(dst, name->name, name->len);
+	dst[name->len] = '\0';
 }
 
 static inline void fanotify_info_copy_name2(struct fanotify_info *info,
 					    const struct qstr *name)
 {
+	char *dst;
+
 	info->name2_len = name->len;
-	strscpy(fanotify_info_name2(info), name->name, name->len + 1);
+	dst = fanotify_info_name2(info);
+	memcpy(dst, name->name, name->len);
+	dst[name->len] = '\0';
 }
 
 /*
