Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 637281D514E
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789114535; cv=none; b=YWY4vPmV3KUMuujs9LMvx7olVO/J0PLwFIVr7/1+s0orEaTGizMJhHIkCfk0pp+NKOtIDo12aogm+bk+COcZLgg64imNO6DFQCHYNImsXQwMgFuKo5p6h7zblS9O4v65ptGzg9DwgSiHJ889Ch9JBzkTd+3u1ceBgazFPHDnmJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789114535; c=relaxed/simple;
	bh=gHOTWdhyTd8+1DXazFzlmPXae7qDIPv8XPTl6/IA798=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=lPSr62w21yueYQGxL4EyiIrhV4Cl00Ew1XoDkXtu6mlScgAFTiioapUJHNeI4FbEh9BEjXpK4qMAuafHX2zehbuldyMQM3cEK3rWss8h61sRQIGYKkmNxz/sUxBnZROJc/mPQAJKLNLxAQUUbVRgV6sxul275nm/lvN2rGsGbIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7f1da5e5b06so874040a34.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 01:15:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789114532; x=1789719332;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GYMzg+hWyxbz+5gQYmf/eJTiYQA+ngEsNstElzBwbL4=;
        b=KQLHY4jUWbcIK2BG/0zmQZad/Yq8C+roHHK8djehr7R6FQDiktg6AScvx2XhSuvwtc
         LsuJHfNC51w5FliTgKxGV2mJ+LCF2CKYawtcZTDaW4IOArUxffwl6G5F5FafzVOykUD/
         Zy9ojrsJpwSXb8J50wJK4J1eqQVZMVAEXZWSzYkaFudUgu1OnwYypPvLpl7fVToKBh8b
         0Oma+Mtqavy4Onzc4jCH94JcaW2l5N7M3lWdNhHXvcESwyKgSlgAZKQdAmeYFShSPwEy
         CUviej/dDjyxlN12vqb5XGMVse9ya0bngT0Xw4m0YkZdHx0BKdc0RXeIdaY+x0Y/+87B
         0ZIg==
X-Gm-Message-State: AFuF++kAu3pJqnfShhE1aDB9xn4Ss7yUVZBCOhk81AKCkF1Bz651Egeh
	QbqazJYnEumoF9KyUw+Z8L09IID3HFTHeWKW+7HbGzE0KqZ8iYh3uK5OV5Ekw3gnUh4VvScJqfJ
	HL98PHMNch99gkLJm7hzsigXYGClzUP56VKf65dYoQcGwcOuIxPb6rKG2CvE=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:a283:10b0:6b7:46fc:1d6 with SMTP id
 006d021491bc7-6c0bd77b724mr1585673eaf.53.1789114532353; Fri, 11 Sep 2026
 01:15:32 -0700 (PDT)
Date: Fri, 11 Sep 2026 01:15:32 -0700
In-Reply-To: <6a6a9894.7eebbf3c.214d51.000c.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa3b8a4.f81106d8.2ab401.001c.GAE@google.com>
Subject: Forwarded: [PATCH] configfs: unhash dentry before dropping the item
From: syzbot <syzbot+6b16e3d085833cbf3e25@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: [PATCH] configfs: unhash dentry before dropping the item
Author: jchuang26@m.fudan.edu.cn

#syz test: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git a7c1290eef60711c10289c056ad32ed1f2b47b12

Reported-by: syzbot+6b16e3d085833cbf3e25@syzkaller.appspotmail.com

diff --git a/fs/configfs/dir.c b/fs/configfs/dir.c
index 3c88f13f1..b0812432f 100644
--- a/fs/configfs/dir.c
+++ b/fs/configfs/dir.c
@@ -1552,12 +1552,14 @@ static int configfs_rmdir(struct inode *dir, struct dentry *dentry)
 
 	if (sd->s_type & CONFIGFS_USET_DIR) {
 		configfs_detach_group(dentry);
+		d_drop(dentry);
 
 		mutex_lock(&subsys->su_mutex);
 		client_disconnect_notify(parent_item, item);
 		unlink_group(to_config_group(item));
 	} else {
 		configfs_detach_item(dentry);
+		d_drop(dentry);
 
 		mutex_lock(&subsys->su_mutex);
 		client_disconnect_notify(parent_item, item);
