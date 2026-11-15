Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794777020;
	b=GUWkGQn3tr5O9sqtVaSczApkLQ/eXOWQPzojHTiaMDAh18xzvn52D/vZJHfBOYWdPbQB
	 0w0bvSfUPp3oinYd0DKin6DR3AjjqkTwcr9PqJsj21p9jvXYN2wv56hZJnCYXu8wlNlnO
	 kSD5lRlHGKhppXXLHLWLJNES9tURH0OjcXQMxr2LI8ah0RFQ/amZ0/ZTUphDP/c7BXo5+
	 /WLiNhqkI7sEbW9MiDwOHvppTjh9XMzCxm+FltFw5zmsXtwOJNVrnRcQZpwTzoCeRnWb9
	 KFG4wY7qNH4urLcHjdxIDh05upTy97kadYN/LYn+01RKBPml7FG3UrgTFddoq53iKhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794777020;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/ARd3XR21b98dC+E0q+y0HBDJ/Q/aPk0xOOUSlTPKys=;
	b=LaaxQtuIi/l/MKpkWjaQkbNYE6/wQNl5t00PS+GQGL1cLoiLcXzvOUTbiCMksKGFM7MJ
	 ITYHguvIiry0qgmsipaJJ7YwGj5l+UFRWWL2rVBf2Oh1ByrooMQTTHZpW+n1maWhntkz4
	 beyiGVqadlTd1d7iVwQ576HGKslQB1ebT3iFHkfLFSMM+DIWJIIYmVyL5KfhojB7HDEPK
	 Le9lAsl1WmdGcQ9qbAKXryye22xoGf8ymNzBKxogPiQKgqMBWvxgPS/HSNRb1qGiy/cMT
	 LT6A4g+CXoaf5n3JvSbyVuiwDvO9fGO2fFPKAuFP1lsB/WvJOkrJMJMwUcffTLC6tfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zov0bB1B;
	arc=none smtp.remote-ip=209.85.210.170
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBA5E606A336
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 21:10:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BBA5E606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zov0bB1B
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8b3577deeb0so1284528b3a.3
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 13:10:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794777019; x=1795381819; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/ARd3XR21b98dC+E0q+y0HBDJ/Q/aPk0xOOUSlTPKys=;
        b=zov0bB1BeWYlvinho67CCGeV5prFtKbwWE5DLx9OjQ9i5m0s4tKX7fcbk9OnyZxscj
         iiIZn1Pe0QEadl9n0hXFATr+CIi22CgXmZ+ZvhSGE/YNbvnwoYW3b+jMhU13p3BSIjrq
         Iws/Wvp0ObtM3pHjNj/727/xUe2atB+gxKGMqJsexyGvTKRsfsQ8WfCAAmrbLe7lpXJj
         OuF1IhLuRSTcEf9foqQkIJ9H59SqT/4n8tm/GfxFgyj2JKwbvMnwCrhqWZcx1uhj9eRV
         CuCxJaL5IzARj3qrtmPtHCb8HoBRC4gsCO6tTCGHZ3alIWAb9uFhQ/SnTJ+dOYlmYvOe
         oS0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794777019; x=1795381819;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/ARd3XR21b98dC+E0q+y0HBDJ/Q/aPk0xOOUSlTPKys=;
        b=zI/zOoZ9O0Y4fv0bg4rxZaosejozCKK9UIz/7wnlSWAX8W0qz+YCvlwQy0skCC773+
         Wbj5VN9zpkHvmzrv2AlnWIIV0262Ovyp+DrVT8tfNYfNQPKmAxt3J/iD+rS+Vvl3tGeM
         HPjdgFN1cBMNbgtnQM19NFyRUnz8Ev335RqlMOzz6Pnw5+8dhEA3kad6AnVUSa+kjxKD
         1cqmrZYRV7vgXoOUH+/DfZNBrF1mH6AjyvT+Oroysfv6juwLr1W0IOteX9SG/rRgnYYe
         ZMBdgYuRcgvnk0fb88+xYQRHGpcqryeDSUW9EYpBvwP5OeH+503dZjuceS2+xzQfc4R7
         782w==
X-Forwarded-Encrypted: i=1; AL+hErHZ5rjs7rAmphDp09Vaf+YaeaMOaXfSb222Q/QkAXMVU8mv1ATkJvIC2GRA7ClvA3UDTZsfcIquVGAAmuQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/32epljNAmWWxwLxw/r+JFB+QNtHlsoosJDSJ0E6w3djIQWH3x
	qnaH620UdiRPQ8qKSS8qq6O/QCnKmqcJnJSuQWHwOgrbIMWHs4/5+GJJ
X-Gm-Gg: AYBFou2I7z3Ozra0CJMs4Jsz9TErFBQFodjmZ2rlts0lrHQn3hYgEjlwrZFlJ5zabtm
	TO51ejtZ9YmKLoos4dM8DCHbdJxhXCJC5yt8fwWIHgdJnxCTbPXgWxG3NJtzydNCT/nGE/FLpXY
	zmkkK+8mBDORQawYYT6Y732PhtRCa8voqiPCsSLnxznfYU/IuvR0+HXCJ3ayKlxmhrKFSSN5w6x
	Dh6HumEsNvrwj7IoQ6ckDRQmdCFHYyCPexDH3lDleWI5w8vLSMpnYOBEJPf5dOGiWxOlL+1m89g
	Hberv6kCZ+FyHV2dYeOrl9d6ov5gtU5Hy1qecXOVyqyatEy5VNK+783vG68yZD+yktYlB79wtGC
	7x9lrcnKwwixK7kRARqk51NUfBIuDgvkhLGERyGdEiZns4F9lNxb0OnZHzajtBhN5lswILY9b2C
	ArPXfivdocuyoqcf1gp0k6SjY+GUr1OrGSACN+QLcU6WT1XjoVkGgAUpY7Xnt6fVxIwoxXP++5L
	5XxMgTkYjl9vfsONyYIh9WjCcNWAa5wNSBgKe7X0FuK8zhvRjXy7MaHLMn4ik3gJSN+ldfHjNhs
	M7dhLb51cNa4xY6l3dfV9Ny0kxqKObQeQViIkhVwgT6oyFLqdg==
X-Received: by 2002:a05:6a00:1a89:b0:8b1:e8cd:49cf with SMTP id d2e1a72fcca58-8beb619b3f3mr7131715b3a.22.1794777019150;
        Sun, 15 Nov 2026 13:10:19 -0800 (PST)
Received: from localhost.localdomain ([112.170.44.210])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed1a6e7f5sm2892615b3a.25.2026.11.15.13.10.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 13:10:17 -0800 (PST)
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
Subject: [PATCH 3/3] fanotify: zero-pad copied event names after an embedded NUL
Date: Mon, 16 Nov 2026 06:09:50 +0900
Message-ID: <20261115210952.2140036-4-graypanda.inzag@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261115210952.2140036-1-graypanda.inzag@gmail.com>
References: <20261115210952.2140036-1-graypanda.inzag@gmail.com>
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

fanotify_alloc_name_event() sizes the variable-length event buffer from
the qstr lengths and allocates it via kvmalloc() without zeroing.
fanotify_info_copy_name() and fanotify_info_copy_name2() record
name->len in info->name_len and info->name2_len, but copy the strings
with strscpy().

If a qstr contains an embedded NUL byte, strscpy() stops at the first
NUL and leaves the trailing bytes of the allocated name buffer
uninitialized. copy_fid_info_to_user() then copies name_len + 1 bytes
to userspace, leaking uninitialized kernel heap memory.

This mismatch dates back to
commit 929943b38daf ("fanotify: add support for FAN_REPORT_NAME") and
remained after commit 0fdbe845534f
("fanotify: replace deprecated strcpy in fanotify_info_copy_{name,name2}").

Switch both helpers to strscpy_pad() so any trailing bytes up to the
recorded length are zeroed.

Fixes: 929943b38daf ("fanotify: add support for FAN_REPORT_NAME")
Cc: stable@vger.kernel.org
Co-developed-by: Gwanhyun Lee <gwanhyunlee@gmail.com>
Signed-off-by: Gwanhyun Lee <gwanhyunlee@gmail.com>
Signed-off-by: Junyoung Jang <graypanda.inzag@gmail.com>
---
Note: default FUSE mounts report a zero fsid (-ENODEV on fanotify_mark()
with FAN_REPORT_DFID_NAME), so this patch was runtime-tested on tmpfs
with FAN_REPORT_DFID_NAME create and FAN_RENAME events.

 fs/notify/fanotify/fanotify.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/notify/fanotify/fanotify.h b/fs/notify/fanotify/fanotify.h
index c25cf5c1fc70..4a1f14aa4974 100644
--- a/fs/notify/fanotify/fanotify.h
+++ b/fs/notify/fanotify/fanotify.h
@@ -225,14 +225,14 @@ static inline void fanotify_info_copy_name(struct fanotify_info *info,
 		return;
 
 	info->name_len = name->len;
-	strscpy(fanotify_info_name(info), name->name, name->len + 1);
+	strscpy_pad(fanotify_info_name(info), name->name, name->len + 1);
 }
 
 static inline void fanotify_info_copy_name2(struct fanotify_info *info,
 					    const struct qstr *name)
 {
 	info->name2_len = name->len;
-	strscpy(fanotify_info_name2(info), name->name, name->len + 1);
+	strscpy_pad(fanotify_info_name2(info), name->name, name->len + 1);
 }
 
 /*
-- 
2.43.0
