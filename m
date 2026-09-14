Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA2130498E
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 06:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789367567; cv=none; b=NFX7L089yMxXvY8ghdS1/0oot7fxXzMjGdrK0xAeqwxnkFjkJSeZWaajeQrtV8k1AyMtL5jt5PSlEGTwLGMzD7sgXE5Jr4n9aBOSyQX/8ufqAK7LA/0uPceASs8jsNA28h5Ze4kyoQX1K3/MLkYchPYN+ueJh+6nGo674ZbPrSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789367567; c=relaxed/simple;
	bh=cQ/RQYYKGuz8z6k06jG3/QsGEu3DTlXGa69+o+M7jAw=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=IM7AHtYxhTK7RPMQh1CvyZciVyp4I284oI2sJfyRziA0Ao887lNgcZrAbUGlG496+PI1UceHbjrsSdagk4o+fU1DTaKFcAeD+fgVmKfNOoA4JXdZhHuaiaY5xwu0REtX6bRHCO13MyNGoe8Oqe4a9BLUi6MdJBF3QQOToCqTs14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-804e6c7acb6so3021772a34.2
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 23:32:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789367565; x=1789972365;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=cQ/RQYYKGuz8z6k06jG3/QsGEu3DTlXGa69+o+M7jAw=;
        b=VZTgtFVk4SV/WEBzvS25VF1E76Ye3Kte1NTa2nSsUDDbLh6UU46M2Gmw4XBj0yT5K/
         RwdKbSLUoVdeW74XWS1f1fTzx7sknd42qh65I2Iykn0ecI7XBDp7kYMs71nL1CU5JQwt
         v2gc/HgNGwYkqr47Jct28nWC2Yw4TnXgtc/7j2jUtNqSqPTx/SZ3rnfEKaUzvMapOf3k
         VFWCR/a1Sj4O6uNe5gkyXeJAkY2WvTGIGT5DwwzncRKKbDW5Ot90BIZ0y9wrlo0CMY43
         ldI0PH56UmD14PHc8MKIkrSCkkKI8VFO2WyVzuPVYFaK9wEhMBElttg9fOLbIhpAkWpw
         9/Zg==
X-Gm-Message-State: AFuF++l1lhb38o1TyUEOwy3GgqkhJPagHI6/Z6gGbbM6TluxjRs6RFWr
	P3aZYcyup0bpk2FqOd3FV2B7Phjf2PkBGMEvY96g8STaXSyopzWwnda/dnDHiwINotpauy3yAa9
	GvfoRFpMZuU8oY/s0e6Ul/dwB1HUOOCn3BU5fecdNrjaI7mfwXZ0fFF14zts=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:4def:b0:6be:1570:73b6 with SMTP id
 006d021491bc7-6c541c4afcdmr820261eaf.20.1789367565034; Sun, 13 Sep 2026
 23:32:45 -0700 (PDT)
Date: Sun, 13 Sep 2026 23:32:45 -0700
In-Reply-To: <6a6d4178.13bfb6d0.1ecdd5.0256.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa7950d.a211d2ce.1a5198.028b.GAE@google.com>
Subject: Forwarded: [PATCH] UBSAN: array-index-out-of-bounds in uea_bind
From: syzbot <syzbot+92f5bf49bf4ac75223ca@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: [PATCH] UBSAN: array-index-out-of-bounds in uea_bind
Author: jchuang26@m.fudan.edu.cn

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 762137ff748fa0c920f82ce718163691cb02f907

