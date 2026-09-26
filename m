Received: from mail-dl2-f12.google.com (mail-dl2-f12.google.com [74.125.229.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD3E538DC7C
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 04:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790396967; cv=none; b=HOH0lNUc8l0KMNjfgOwdF+NVm3nuvYoni8IFjxtOuCHpcFj84eyf7gmfDU1WONo1QJPb1jaCS3Lbe5tTbYnKzl2jT/mJxPa1oiJnrt7rZckg/0WlDXdaRXV6pX8HWg9jeVPtwUDoUdwi7LwYqWKpG2a3uBSbWgwMyZH9wClpeUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790396967; c=relaxed/simple;
	bh=spKpAUXngFxsVM0qnH6/+pLbaXvLBd2IZu/RdN6M8RE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kkc8YmMbTPDEv1CvKvl375gx0Q7zOMcSwQ9CByUhX1wmkaTZZ+e/RY35naZT0CUP8bDlPsZMGu6hgamQn+1jYy212oTmL5CxrlxMG+143MSeopSSOE3/FGb7aMt8WgcsxuXEa1DT/LB4mp653TV45KyYm4v12URh11Ac1/X9NHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B4UpQoGz; arc=none smtp.client-ip=74.125.229.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B4UpQoGz"
Received: by mail-dl2-f12.google.com with SMTP id a92af1059eb24-142dd025d07so1270348c88.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 21:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790396965; x=1791001765; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qtXgsIphoJ+iugY86vkQAYkei5C/jpRmVM/XsX0DpDc=;
        b=B4UpQoGzbK1E4wLI/kyjnsuYrSkj10ygS7CI5jLvdLMn27izrk9VDzDB3RcZfzSA2R
         BFQCjFfGdT7QK8bqzTUjLFjJ/W8UhoXdiB1N5UxwcLZNT5q7GKoKuXJ8ZUmjVhJep5or
         BlBnbBC2ncgfSHkFEDGYJe3wXCWpbmCY1cChI/PBQ/Vhn6IelfzBVtuXf6dBrjMxpWuY
         0bzaNABuKMjxL94YcPDEhuarRA/jXt9SyxqhVqfN8DzLj6EnZ/GI/9JlYN4td9g4g+iP
         EmljU6tZLHeHJ86SasdY+q8061hJCdS/GOPHIuX/C1e8bLvx4CehVbHvLxD1Gvh1MNJ+
         Xpnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790396965; x=1791001765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qtXgsIphoJ+iugY86vkQAYkei5C/jpRmVM/XsX0DpDc=;
        b=PPTIlEbYY/eXZac99kE8Do9dceADAC36DW4vLbDuEyJ37B4/XLoqSodqSGGDoZzHSO
         qN9VRyPkM0cUjfZI/w0bL64LDyn7NiRzWQ8+JdTqcRmAo0WksrXDj4yk79XjQ7ap7sbv
         8X0Cff7cHXL5Py1hp3rHvTg5LG9rGB+AjhLpvuBaTcBTgwupFLfoWT7HISXKnlDSVu/V
         t5CrunoQ/BSvuXkfpDVtZzDI8iM6YOIY3yvQOjURyms8EpZef9avjW1TamHKkXVSwpeO
         bZK2eYQSGzKkArs7YjL14qg2aCY211x4qcrKKL2/g1GJ3DbWgIYBUEYJ0dWE1EAnE/vp
         grxg==
X-Forwarded-Encrypted: i=1; AKwUvBw13xjLOUfOAnyh8K615Nh5/jY/7MSTnZeyjT/tQFL7aKwxaus1bXeo8QxQFzYIWoqLLJDF3jtyXv/QeT8=@vger.kernel.org
X-Gm-Message-State: AFuF++l2G2HqqMwDdbrrfHs+Zcv/5Znp0SWPhNbiLQJse0fIKrlm1sON
	5ufCMjBmtxieIdX/dfsBZQaQONVmUQRHafZDOpem4LPYgUStGq8FIaPfptCI/9HQtMVShHTZ
X-Gm-Gg: AYBFou3gARqc/z6OC3gPlHynWN3kyE6BRbdh3FaTMLlYT6j1a9ShLA4OUwxb0pfdLfD
	lv2Hdk+8SQw/P5hP9OrYX1HFv4dUBLZ+TECfz5ErXGg3b4ya/q3kaXmd5MpnWYpHO9Vjr2vOzql
	IW7yRXh0mn6W3U6V6kQJGjE/ZD50DvAE/wW6K9f36q5GEhN3kdnaBfuVM2xwpUBeDDcDJ/nOJia
	L9zYbqaJoKpKBUUFaeKUO/3JfKTKXBlLeoAGDIWBLazlb4vkb/JcbmqqlbSFXHdbzWOIF5IzxJn
	J79u4mWzGqXhir1RgNcaeSHYKo9CM+qJALEhQoCPY7cqGVO16psemH4RYDoUHCCnASBNBACK5vv
	6ZQaB9t/BPjJnkBsMq/s4aGJiQ8S37v5ucejkBHcjIADSPXTGj2C1swkT/Gk5ISZvDBjSIn2xTI
	NHT3j++VdUTwOd5iLG1blI517p9Gn9hUJRmvg2Hpe9vFk5USQM7tt+G/5h9WfIYwqJlFuxieJHk
	iNegBslnbTta5FSFbgvfkHO3KIuSg8Pm5TYVO7BIDXUhVJbe7g0TWQO7fa0T1TSeIVTc06/VwUh
	L/YdUO70ozT8S/DzE38xUT3DeUaLvY29exPrnhSf9hzEkQGfCXJdjk+VkL8=
X-Received: by 2002:a05:701b:458d:b0:13d:19da:9370 with SMTP id a92af1059eb24-146ce67ee18mr1788031c88.17.1790396964671;
        Fri, 25 Sep 2026 21:29:24 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3421dbb2971sm6342963eec.10.2026.09.25.21.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 21:29:24 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Jan Kara <jack@suse.cz>
Cc: Christian Brauner <brauner@kernel.org>,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/4] isofs: report the Joliet name length in statfs
Date: Sat, 26 Sep 2026 12:29:14 +0800
Message-ID: <20260926042916.3277409-3-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260926042916.3277409-1-matthias.goergens@gmail.com>
References: <20260926042916.3277409-1-matthias.goergens@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

isofs_statfs() reports NAME_MAX as the longest name, but a Joliet name
can now be up to JOLIET_NAME_MAX bytes long.  glibc answers
pathconf(_PC_NAME_MAX) from f_namelen, so a program sizing a buffer from
it should get room for every name readdir returns.  vfat has reported
255 times NLS_MAX_CHARSET_SIZE, 1530, since commit f68e542f3478 ("fat:
Fix statfs->f_namelen"), which followed a report of readdir_r()
overflowing a buffer sized that way, and exfat reports the same.
Windows reports a maximum component length of 110 for CDFS.

Report JOLIET_NAME_MAX on Joliet mounts.  Rock Ridge and plain ISO 9660
mounts keep NAME_MAX.

Signed-off-by: Matthias Goergens <matthias.goergens@gmail.com>
---
 fs/isofs/inode.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/isofs/inode.c b/fs/isofs/inode.c
index b766b5c9c593..23c51eaf8356 100644
--- a/fs/isofs/inode.c
+++ b/fs/isofs/inode.c
@@ -1012,7 +1012,8 @@ static int isofs_statfs (struct dentry *dentry, struct kstatfs *buf)
 	buf->f_files = ISOFS_SB(sb)->s_ninodes;
 	buf->f_ffree = 0;
 	buf->f_fsid = u64_to_fsid(id);
-	buf->f_namelen = NAME_MAX;
+	buf->f_namelen = ISOFS_SB(sb)->s_joliet_level ?
+			 JOLIET_NAME_MAX : NAME_MAX;
 	return 0;
 }
 
-- 
2.55.0

