Received: from mail-oi2-f13.google.com (mail-oi2-f13.google.com [74.125.231.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B84CF4FB9A9
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 21:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790370967; cv=none; b=MAU6WSHhO5/hbCyIQ0wyoCaV2+R/cmGeprWPEK6SwHwl6rm6J/cjtv0CVvZuRDkrnf4wkKLuDpNmJxgm7I2QZm+XaMq6B3jdF5tusx8MGKGtvuXl8YU5Yxe66VMmHVc1hwclrjVAozNGEG2q5cUUHMK8CI8XKF9K2DqLdK7CcaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790370967; c=relaxed/simple;
	bh=y1PFaRBlTn/ZCYwF7xOFcCPi53rXVK3rGbNoLiZI0A0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oGidjusSXNk19u/WqrvzsqxqbJ/tZ7Sz+TtgS0G23NoArB/WFQERCO8JsPiMt4+QNFXZjHtVSZOUoJez6nDBYKeqqaYM2Tnz6k0yfmAP4NJg/RJI2XK+dJwMic+ELGKIzQMzLAQfNrU3NktxhomSZZ0rNf9NRA1WoUxeLVkepPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aBzXGLKn; arc=none smtp.client-ip=74.125.231.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aBzXGLKn"
Received: by mail-oi2-f13.google.com with SMTP id 5614622812f47-4b37a3ed714so876209b6e.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 14:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790370964; x=1790975764; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J+r3w/xqNCPChfm05nwGvpKJ2QthikR2lv0/GbZ7Ook=;
        b=aBzXGLKn76hfIPhFOkP03k3iecovKLEBx1zYF1+HJvX0aWmUTZ7ftFdSOB4o4h6mhp
         2hm6PVutDy/xD/6EYBUaeUJyr9fUI/3kE+o6BOSeT8Dr5yPrJVLxvwC7gFH6lHHrMVL3
         L3avvMMjOC9PHTWAxboyZg5O4/QCp3dKYceRAm75qaaRp89CIrWxmOI9yZlk65GRjZqA
         OrMh/etZpFmuqSTqIarUY5Ur9y3/KNLAAYuvS/pAwscyqEvy1o3E04Cfn13MDfOl9M39
         E+Oy5fKvvhf0CzuWNB2XstITwNCZmwvjQq/10PFpwwProaccLL7lqDszcgH2kwQZgwo/
         JJtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790370964; x=1790975764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=J+r3w/xqNCPChfm05nwGvpKJ2QthikR2lv0/GbZ7Ook=;
        b=vPWE3L/jtbZyoZ0StF68T6r7iGHI0eeWBn+V+GzV0YYw30qdmCNtVSVa91y7ogFgj3
         acLUjEYhLQECLXd/gr5K1g1rUImam0R62CibMgQWmW+eCVIWvXuUDfBKB2hhSuIK0xaF
         LuFUj5fzoFLh6MvtM/wOXuhU+DKoy39rTtVsVWwPqarSZHXp9DyCYn3YEOCyexpEJ/kp
         wtKX5uF1D/Pryi0YntuQD4aiOW3m6wtBm5r2U9oaWU3GZqA+K3HTtPlEVrUotjdAkMUy
         iH2nuCkU9vmieBEzDBnt2DxZwvTUEWXis3sjLOcbqf9bhO0dihjd5cPDv5QlYkCyDoT6
         HWMw==
X-Forwarded-Encrypted: i=1; AKwUvBxR3P3Fa/WfbEA99gFqfviuAAinjczOhHLwfEo5vKlohjPus/kdNIS3ZJHpSbliiyVNJ+e2HmzTDOnLV1w=@vger.kernel.org
X-Gm-Message-State: AFuF++kja7FVQtQEZbj4qooIcVhDaPxyPmwYC0FhwXmCvyNeTPAfFUuI
	CVE2+9jhSfQwevYHqnHD+Af+cckEvEbefG07rtWjGaOi2T+DZzqttMfH
X-Gm-Gg: AYBFou39i8p9P/vYXZSrKu4UXcu6uHY430gDYTLxRy2NUGaQiwPzVijKKLfKAo+eFU0
	Y+IXcBIM8S8TsjEp77mGevfje9UqIzl37CAL3iPipwAWl9dkvtMqrzWb7ANWVJcP8NBUVHjuIBe
	JbkZVCdRNSWsYBexFVVPJ0dnQm9N5/AGoeF6T8vnAoV4dBDGXVu5o4YIu/kf4u8BzowTQjUwC0D
	LNJ90pkB+7pQ50YSUQ7fYgKknsnfrrMk9o237YMkfBcv4ZQYwAMUaW8ZrNlCmbnwEh5m1kX6wC5
	Clbrn3c2SIb5jvVrYZ3R4+H+BJWPWre0lpByspYAZExmlRyvUXGP0GNmhQIFFdqmdBk/Eq/sf5F
	fqrHtFr6MxJGGk7t4LGBXnN89gsQX2VKB+eTi9riKe8tmZZCPy/9YmnLNvG4Jyh4866JrCRJahw
	/aYrAv6HQJMluCRAq2u7oZvb/1yqMrW1k/fWaq2vvu59HWERAV8xH5nUoaavnwjqxe1Uct0PaYw
	r0oXrgK/cfu7veO3pzh/nyrqfqnmqYUmBvFJsut0lDDo1z5ovY=
X-Received: by 2002:a05:6808:4f07:b0:4b3:7b31:8df7 with SMTP id 5614622812f47-4d72c042ed5mr7304247b6e.14.1790370964520;
        Fri, 25 Sep 2026 14:16:04 -0700 (PDT)
Received: from archlinux.lan ([136.34.156.120])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4dbf3d72057sm3066734b6e.6.2026.09.25.14.16.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 14:16:04 -0700 (PDT)
From: Danish Khateeb <danishkhateeb03@gmail.com>
To: Willy Tarreau <w@1wt.eu>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Shuah Khan <shuah@kernel.org>,
	Sven Schnelle <svens@linux.ibm.com>,
	Benjamin Berg <benjamin.berg@intel.com>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danish Khateeb <danishkhateeb03@gmail.com>
Subject: [PATCH v2 1/3] tools/nolibc: fix readdir_r() with 64-bit directory offsets
Date: Fri, 25 Sep 2026 16:15:58 -0500
Message-ID: <20260925211600.119116-2-danishkhateeb03@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260925211600.119116-1-danishkhateeb03@gmail.com>
References: <20260925211600.119116-1-danishkhateeb03@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

readdir_r() stores the result of _sys_lseek() in an int. Directory
offsets are opaque cookies which can use all 64 bits: ext4, for
instance, gives 64-bit processes 63-bit hashes, and
0x7fffffffffffffff as the offset after the last entry. Truncated to an
int, such an offset is negative about half the time, and readdir_r()
takes it for an error.

Since commit 4ada5679f18d ("tools/nolibc/dirent: avoid errno in
readdir_r"), readdir_r() fails at the first entry whose offset has
bit 31 set, which on ext4 is usually one of the first few, and returns
the truncated offset as the error number. Before that, only -1 counted
as an error, which the last entry always hits: readdir_r() then
returned errno, usually 0, without filling in the entry, so the caller
got the previous entry a second time and never saw the last one.

32-bit processes get 31-bit hashes from ext4 and are not affected.

Keep the offset in an off_t.

Fixes: 665fa8dea90d ("tools/nolibc: add support for directory access")
Assisted-by: LLM
Signed-off-by: Danish Khateeb <danishkhateeb03@gmail.com>
---

Notes:
    v2: No changes except dropping Cc: stable.
    
    v1: https://lore.kernel.org/all/20260924015222.31693-2-danishkhateeb03@gmail.com/

 tools/include/nolibc/dirent.h | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/tools/include/nolibc/dirent.h b/tools/include/nolibc/dirent.h
index 2dbf4052b85a..19857369de2a 100644
--- a/tools/include/nolibc/dirent.h
+++ b/tools/include/nolibc/dirent.h
@@ -81,6 +81,7 @@ int readdir_r(DIR *dirp, struct dirent *entry, struct dirent **result)
 	struct linux_dirent64 *ldir = (void *)buf;
 	intptr_t i = (intptr_t)dirp;
 	int fd, ret;
+	off_t off;
 
 	if (i >= 0)
 		return EBADF;
@@ -100,9 +101,9 @@ int readdir_r(DIR *dirp, struct dirent *entry, struct dirent **result)
 	 * readdir() can only return one entry at a time.
 	 * Make sure the non-returned ones are not skipped.
 	 */
-	ret = _sys_lseek(fd, ldir->d_off, SEEK_SET);
-	if (ret < 0)
-		return -ret;
+	off = _sys_lseek(fd, ldir->d_off, SEEK_SET);
+	if (off < 0)
+		return -off;
 
 	entry->d_ino = ldir->d_ino;
 	/* the destination should always be big enough */
-- 
2.55.0

