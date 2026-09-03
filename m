Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D419D353EF7
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 05:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788414979; cv=none; b=B5cCZXzkFx7BVviuocvLR1q2Pqjd9NVI1YyuP18rNWOsEYjQfJKBmeLTrXu/KtWA8hu2tb/A/1dEL4Cm3IKN7G15CgCGPBB4P2x1Dpn7yPnZW/LwvQvLiWDAEwZouaJKy6DH/yt+4L+xRXAPI7iFYy+hZsm6ZyXNIhdLcakmJcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788414979; c=relaxed/simple;
	bh=UwYqybjQFVLrWySXb+HxbnkgiWVUk1mFKUP4yX3wx0k=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=Copp/D7JujB0b4QTpMV0dPXphjY4BHxW+BQzUmw6v2BLmAmAGBXxYXMFMeZlpTmk7tJgj76ietsOllJlofKYy25NVsHStp+xOUe33JeLeA4WTe4Fk0o2YiXcIL7LprYyB5eM4BTQzVZ+dy/Lfz2YN0b+Vi3JSw2izCTrYylLOLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4b28db3a47aso2209450b6e.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 22:56:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788414976; x=1789019776;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=UwYqybjQFVLrWySXb+HxbnkgiWVUk1mFKUP4yX3wx0k=;
        b=qIFtwq+lsn0cY3SeUconPbIf4luDWWgjCDBpmmD3y230mEf9odpDZyUExM7bPtsMQc
         VoSfD3cNZC0wo77A0uZCrnl/Gu5YDqKbysQ+V9L0WXxoAR9Jr0A/FcMTTKMkGWpEONkj
         Wfe4nPn2WZUWXQ4rU1BGNApZyZ6Ydvn45myaDX1uH3MeejkplwE8NouOhkx77yf59iFk
         +DcrzzHlBjQCEROqRD6giQecxRcgeOux5JbL3c31ihrsOszzjdU9xyvNO0/pcBl14SRv
         LT2tO/yc0ywWIGNUU5CV8lcp9fgQNwKZj56rZJpZRH0rbE/UtzA3dgG8GqBLdCd43pNN
         0gNA==
X-Gm-Message-State: AFuF++mJPXpQgaHzylWqnYAOjAOdldfOyyN6PX5ZQGCjTSF8sn13asfm
	BbyZpSGDiKHg65mBH15HQBnAvUd5HXZicaHrjpvEz34dof40pRO9OOtT2P7RepMRWJt32BBpIIL
	/l4W6Oi3rkW/xup7AIiq3xBLsybVDcpUCxmPWrFPq0iK9ipvQCON1nqFKKas=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:823:b0:6b1:705d:b29e with SMTP id
 006d021491bc7-6b481438264mr7210813eaf.26.1788414976717; Wed, 02 Sep 2026
 22:56:16 -0700 (PDT)
Date: Wed, 02 Sep 2026 22:56:16 -0700
In-Reply-To: <6a8fd9c8.50659fcc.60cd.000e.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a990c00.9266084e.bf0d7.007b.GAE@google.com>
Subject: Forwarded: #syz test https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
 940de590b839f71d6dc846160534bf202401b8b7
From: syzbot <syzbot+d632e93ffcd1452bc61e@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: #syz test https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 940de590b839f71d6dc846160534bf202401b8b7
Author: dmantipov@yandex.ru

#syz test https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 940de590b839f71d6dc846160534bf202401b8b7
