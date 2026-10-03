Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 145A73AD503
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 11:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791025614; cv=none; b=NmtBlWYdacP5fmJdiU54bMDJn6Tikqn56Re4/VV/MkAVoN91s2RaNEJwtkgx1+mOuHLxK//otKt9efnNPAve76JalCQRgS4euasp9Jndgm1/en6lk8GJ2Ih1PZPyngNIB6gsK2zBtNLNNFOLBdRPPxXpq/uRpZBiWv9X54+zwf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791025614; c=relaxed/simple;
	bh=ESTstycR0LenaKPzzd7Dskp71flpwtKKA3pqEIkHP6c=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=NERqIutnBivF3BanpaWuIPsPqmO+UJ7xYF7UP356CsujYhhh7cxIF12ielXJS4NqWzm97kLEW0KfFGOQ7lX6rjUHoQPzcLIlvYjFhyxxirVBSFannZIxUrwm0yhtDit9S68oi5KIUvbT6+4Odp911psLbRkydppn49ShIQQ8OGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4b28dafb8e1so34048b6e.2
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 04:06:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791025612; x=1791630412;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FYk4vttSF+KFf16mLMub9M7cacxhHvZ57D35DNFHl7c=;
        b=mI6Mq5NLDySlyPLmSEmLlto8uYlZ3HABBqyhLe/wJu6FTgT18cstJ6P+EC52TWRmI/
         AMo8WEGCjhnX9ktrFhf42Srt8cWJpYQO5eWj66Kv8zqPxBU6aXtWCkcwrtQU8wjN4/AE
         yqPyNRaRLmlZNC5Uh2G0pDriBGVNnH7qSHT52sYHt/Ax+6puWnEYDyiKVvz5GGTfRhFV
         OT4brXp7LtkHj1omDAtFYaERGARy9QdJvU03FLqJcHbD5estriDJg8gb8FlGuIffMAJ5
         1DtOxXIsOWhwufoLcYmXu+FfVVPqre9ulNLq4ezL4d+rxWwvigH3V3RsBqvJA/I3okGY
         9omQ==
X-Gm-Message-State: AFuF++k41JOZSpIokca8Ntz6WogF/4vf9vl8kysDWjkWIJGT8Yt+eYn9
	FyZhHlh5YWJRQJ1ZrkQmjKOGnHLGl20cqipkmZBiwUn8jv8JKVVDGj/qAMojiE7m/f9OHAMUpDT
	0aH3iEwJAoyPTP3c1GYlkB10LxpHBDHC7AHfwqmcdarnehj2HIPLjCAxuvjU=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1387:b0:4d6:92b3:5c8c with SMTP id
 5614622812f47-4f52bbce3ecmr5599767b6e.66.1791025612013; Sat, 03 Oct 2026
 04:06:52 -0700 (PDT)
Date: Sat, 03 Oct 2026 04:06:51 -0700
In-Reply-To: <6abeecdc.7503fbd6.2d3f6.0010.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ac0e1cb.34119e79.2f92f3.0013.GAE@google.com>
Subject: Forwarded: [PATCH v1] Testing for a slub out of bounds
From: syzbot <syzbot+46bbbe175b7eea8036b8@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: [PATCH v1] Testing for a slub out of bounds
Author: nsvatoslav515@gmail.com

#syz test

Signed-off-by: Svyatoslav Nikolenko <nsvatoslav515@gmail.com>
---
 fs/ecryptfs/keystore.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/fs/ecryptfs/keystore.c b/fs/ecryptfs/keystore.c
index 51651314b7a6..bd3e025899f7 100644
--- a/fs/ecryptfs/keystore.c
+++ b/fs/ecryptfs/keystore.c
@@ -737,6 +737,12 @@ ecryptfs_write_tag_70_packet(char *dest, size_t *remaining_bytes,
 		       "password tokens\n", __func__);
 		goto out_free_unlock;
 	}
+	if (s->auth_tok->token.password.session_key_encryption_key_bytes >
+			sizeof(s->auth_tok->token.password.session_key_encryption_key)) {
+		printk(KERN_ERR "Error FNEK key size too large\n");
+		rc = -EINVAL;
+		goto out_free_unlock;
+	}
 
 	md5(s->auth_tok->token.password.session_key_encryption_key,
 	    s->auth_tok->token.password.session_key_encryption_key_bytes,
-- 
2.47.3

