Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793431335;
	b=3GJ8tansq3CQWlcxI5bMlA80vDZOAuZk6lNhT2sRT57BZ/M05Th1pHMLxn08GwfRbXqN
	 Eup5vWy9oHnKyonxfB5qyOzwprxXukVds5SmEGvfvAkIGEeeohQFotSynXPzHdSF7I1oA
	 xiIB3dItqd8XG3UcTKxuGD2d7IgInIX3Ai0Vlczw/q8FltxosBu5nB5vtSguqgCcyQHHs
	 lcZHFYMAYaTPHEOoe04IXZNg4SKlHUBrm1l78P3DLZL4aqYBZyGRSc2vcRneKgHIp5suk
	 3o6BVcr5VoL6DR0+C7UA52KhaCtFGrI1Zf3tnbccOGyTkNC5K3fgG1BD4pug0fst1DQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793431335;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=5xJ2Aaj5OkzQ8Zqzm1v69zHKFwlKxaSVQ+QJZIXxxzU=;
	b=2UzhUvP1deZhOOIzftQ6q5z/M7HE8+DEZl3Fqj6g+i4WUCVjvfJcO+yAqRQDbZaCiElV
	 O07/yPqY72MnNOyasc6EwWjahSXlN+N75MmNHrIPcCZIDvi/LsxLqvljBJn9tKU0bOg42
	 DrxWfBsWS+IrLCJ/rLOzqbdAhkhE8Aj2msHYIiaamnAt71dW1+j9OJ61LQbqzD5lEo2Mw
	 SyR6zlWWf3ZpKarJa87615rpw3Pawm1nVF9LmBYPzZ1GUZn/m4hs4RWhqDDfiHp0iDC57
	 uuAzmS5gC+aA4gODE8BRyCeRg0dzjLrT57arcZnqeRIG1V8fFzR4M8OkhFWaZrD4+PA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sUDBAl3R;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1BF5606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 07:22:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1BF5606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sUDBAl3R
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so15660955e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 00:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793431333; x=1794036133; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5xJ2Aaj5OkzQ8Zqzm1v69zHKFwlKxaSVQ+QJZIXxxzU=;
        b=sUDBAl3RdCdqV4LujOE/vJNIErc6UaAwV8HQ1kXCA3PtrlRLW5eChfdFxSrMwwq1S9
         rqvMFG1WYDr7CAhRUfBpNHjZj1m+8d4ElM2OUuPtgg3gWfEdoJYdGdTg56kBap36SFmM
         m74k/iSF4SYzgOh/H1tEv9Z8yU/sJDljL0f+sBHBK4H848apG2I9zhcLWOzFwVIxm/6l
         RKp+IQoBmNo8ugmk6gjiBI8t5sIpWJ/N9YhVsuhcpCHvEkwe2HlLva6ojx8GTNKT4phF
         vOuc9CWql0bethLcCHh6xVqnqagqw6l3Pt5xjPyplpoahFwylo6Xmlxq5bTCbllVjbRS
         WrPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793431333; x=1794036133;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5xJ2Aaj5OkzQ8Zqzm1v69zHKFwlKxaSVQ+QJZIXxxzU=;
        b=ncY+oiNDkVnZQYi+gFuUxfiQ5UsBU1kmDjhSb7+Ie/SVSPNRnobE+7Qw1Ak8d8UY19
         98jeS8/mXZA0o5U54ZoSyC8UhJXbBS2UVR/IzsNLKWWvQwQsGq/kPFFnUUkM2FLhZ1FH
         mGOfnBcq65r2zdFNm40q2lZ50XchLLcqxVjNgVNxDCizUKQ225+HzBdBI4z84SoZtiSh
         E4KGEC2kA2qALUREqUmnaNLWUL5B2jL8eKaOOW59W+iX1eip1AiR9i9AYmk6xNtYmRuP
         DyfzIBq7upJen+UYvXppCBuk7XYqhP5xNyth5wWHtj4HC9kRKpgoVk3/ukpMHEauiB34
         O2/A==
X-Forwarded-Encrypted: i=1; AKwUvBzccLI/HY4FENHueiamT7voZ8Bo+vnFlC0BaJeS5UMXnyc7FDTjPcVBpEgyHFkwfB8JZ4X5l1JFEPB4VYY=@vger.kernel.org
X-Gm-Message-State: AFq9FYI554pQw0CZD2fv+qT2JtRhaaTAVKdx6/+LmCrWDvI6ZruZZF9G
	vH62J7MlgyV4qGL5iUpUn20tBiJOUCdo4v9gayWqgjyv7cK1WK1XQgdQ
X-Gm-Gg: AYBFou04XT+EDa/SV0coRWL93Uo9x6f3bBdfXo7SMJDaQIRokFqGC0tmy9qVfSg5cgQ
	bBU8CMYHhfjtjcjFhWSlofLfdtZWe70QQ/VxQ/xhB8wIqHBhezgi7uggTWedfl3dw3xwQQuy9H8
	Y/bYp0aV44V/q+h0gNttsFAi1IWipIqr67dkfhkdFyqhuecgo7zcftaTpyIfANGWp63aZbs7Ouc
	yPoADRW2OzJTJIOh3Nfl+j8ypvBoeJ8oPOOJ1QrU7I0mdkSZOqZ5Xy1x3nreAdBC1pSpP2HF05m
	S7vtmFlGNl5pLBLe7xsu/Oi5JcXUBht4WY6ysZqLUxcX+GBBUenBUPC2DElS2L6bD//uqeQy9yd
	qNTFW/qo7hFVwcYEsb54By0ICE2AvCUYXx9ESiSYM80ApCGCQa7M6zb09rwu1Kk+xIhDD1aoc7F
	35B4OkUCmlf9hwYXjU071ejRklBWxVzT+P1R7nhztRBUdAFQEemHn8JLviMo5SDbzbEsBIQdOgh
	Q5iE+06t0djB7lqSS3zIn6nzw0LtiTK+D3Oony+EHAw+Bbd6WKhympqFhp133vNkA5Z437LzTRc
	iV+gu0QufJq/VVNQxqpR6f8g4D8n9R5VJlBLlvr9w3pB
X-Received: by 2002:a05:600d:a:b0:4ac:aae6:6401 with SMTP id 5b1f17b1804b1-4acaae665d8mr56656675e9.12.1793431333162;
        Sat, 31 Oct 2026 00:22:13 -0700 (PDT)
Received: from localhost.localdomain ([2a06:c701:4773:6f00:c8d4:ec29:293e:f39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b723b4sm7709687f8f.17.2026.10.31.00.22.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 00:22:12 -0700 (PDT)
From: Avi Weiss <thnkslprpt@gmail.com>
To: Christian Brauner <brauner@kernel.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>,
	Jan Kara <jack@suse.cz>,
	linux-fsdevel@vger.kernel.org,
	linux-api@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Avi Weiss <thnkslprpt@gmail.com>
Subject: [PATCH] fs: clamp FIONREAD result to int range
Date: Sat, 31 Oct 2026 09:22:09 +0200
Message-ID: <20261031072208.3096100-2-thnkslprpt@gmail.com>
X-Mailer: git-send-email 2.43.0
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

FIONREAD returns the difference between the file size and the current
position in an int. When the difference is outside the int range, the
result wraps, so a file with 4 GiB remaining can be reported as empty.

Clamp the result to the signed int range before returning it to userspace.
Preserve negative counts for file positions past EOF.

Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---
 fs/ioctl.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/fs/ioctl.c b/fs/ioctl.c
index 1c152c2b1b67d..ecc2a4cfe6100 100644
--- a/fs/ioctl.c
+++ b/fs/ioctl.c
@@ -7,6 +7,7 @@
 
 #include <linux/syscalls.h>
 #include <linux/mm.h>
+#include <linux/minmax.h>
 #include <linux/capability.h>
 #include <linux/compat.h>
 #include <linux/file.h>
@@ -550,8 +551,8 @@ static int do_vfs_ioctl(struct file *filp, unsigned int fd,
 		if (!S_ISREG(inode->i_mode) || IS_ANON_FILE(inode))
 			return vfs_ioctl(filp, cmd, arg);
 
-		return put_user(i_size_read(inode) - filp->f_pos,
-				(int __user *)argp);
+		return put_user(clamp_t(loff_t, i_size_read(inode) - filp->f_pos,
+					INT_MIN, INT_MAX), (int __user *)argp);
 
 	case FS_IOC_GETFLAGS:
 		return ioctl_getflags(filp, argp);

base-commit: 36aad21d50d1af3f6954bb0c988257a908202477
-- 
2.43.0

