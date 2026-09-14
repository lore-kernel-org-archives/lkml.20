Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B59AC393DE6
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 06:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789365627; cv=none; b=FqVOZeq7so+RK/v5CfgAeB8sN4kPWwa/pr0O1Ai3+wdh3Gcw7idJrTq6ciPD8wyIT84gdhYirDqVqnZ69VMSv8d1tEQFt8ABiy/GLCJq/0PkPFYBUX6rmJmgVIDdGm0S1lVxROlccE+ywWtn2qjHqJK979Bn7M7Vjp1sXneDJ8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789365627; c=relaxed/simple;
	bh=jUQ+iQ05XqeVsD/34xR1QltqxZ8HcIpmOp82C60Fgf0=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=SvpMpMbBZJWsyYML62ni5fL+SzOLbK9zMJGNA2hEHCGDQjvTOy6kz0GirFeSdZmbiuiRG5X3uyGD6sgUWmvADF47bscDm2f8uK4spe5FeTD83hLG4TPFlgE6VQ/oCAloErW+UlUu2+sKfoOR3LZisT8y/fTk46ZILb2zgluTKh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4b2f2b8d88fso3651604b6e.2
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 23:00:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789365623; x=1789970423;
        h=content-type:cc:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jUQ+iQ05XqeVsD/34xR1QltqxZ8HcIpmOp82C60Fgf0=;
        b=pXG+c3q1a9D9H2MqQDCMkOO3He5FM7QoEeOBE3dgdwmrPr0s3HNDhd3gOEB8DZw8gs
         qRhY135xp5BO0J6OmzxKcHvLukD5RqAwnb7DjkUpgkKNvujKjJ7X5QJbNnNM4VfVmVM/
         TxdJ1wblhhQ/tlreZzsllk5Icvab2DSIybxchQg3OLNSydB0o0S20i5OwzTRMVDnSSd9
         Vo68LSURCt/AyjBtES55M0X5kIfXOavTOhxBB7+vRHKieTHSsKR/4vbWXWGGjDL/eomA
         /g/wJzvXxBnhXT7VwICLRsZyjli38U8VgRaJ/Rn1D4Hk6w3DEJ/PXPEKfL6F+mJotFdi
         HNjw==
X-Forwarded-Encrypted: i=1; AKwUvBzmgTeKUyiczrhllpFyC/1iX2BnG/rPcaGY/L2APRYPbKWIWpo3CuSNGCSwwUULd9DSTD64ajDRXjoCqK0=@vger.kernel.org
X-Gm-Message-State: AFuF++mM/h8auSoTSozwP2NvQ+Rte1OhHYHIk6lLCFDKqjvQ7sVTzrCb
	nuW9hgfQDRkHdS2vkBpn2fnGGE+RKNJvgjJvlp7mIOzbMs+1deWVTrD+ouNHfIdf1HCys956Ck5
	e7oRRzxH81ALXthzhcKHHomhBgG32acW3uFuCdEnHy3ZXhlqVwbml+FKyjyg=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a4a:e914:0:b0:6b3:50e5:c625 with SMTP id
 006d021491bc7-6c542a3089amr960828eaf.32.1789365623046; Sun, 13 Sep 2026
 23:00:23 -0700 (PDT)
Date: Sun, 13 Sep 2026 23:00:23 -0700
In-Reply-To: <6aa78d76.21eceb42.d5a43.ceccSMTPIN_ADDED_BROKEN@gmr-mx.google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa78d77.4c28b7d0.c1bba.0012.GAE@google.com>
Subject: Re: [PATCH] configfs: unhash dentry before dropping the item
From: syzbot <syzbot+2d9c96466c978346b55f@syzkaller.appspotmail.com>
To: jchuang26@m.fudan.edu.cn
Cc: jchuang26@m.fudan.edu.cn, syzkaller-bugs@googlegroups.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> #syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 90f3c123247e9564f2ecf861946ec41ceaf5e198

This bug is already marked as fixed. No point in testing.

>
