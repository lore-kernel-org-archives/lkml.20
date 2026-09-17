Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10EBC381E84
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 03:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789617231; cv=none; b=LR3l9Ms37OVodiK99xgqx4IJZTk070Sxa7F5kHOdQFuE9Uo0Y/1algbuDeGF16cy77HpJ9jAyZWOWWEsPYSd3Ve1R5vOBLl515K1qYh3FIcIKphLeb5MS5pRV6LMXG16bKRi848lcrWeHUrQxYI6Sb4aDVr5vwYXIZ4Ag2Y8q4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789617231; c=relaxed/simple;
	bh=DGX6jE3mYLDDSUZ4X3+1GkIDB/peG79oUWGq/k2Ay8Y=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=OWMKB69dKrakq0kwVec31vUG+iFY++i0SYqOBgPPB/UVvZMlWUmBFPBkwtzkBiJWVTGEA6N1ocbQW6nsmezvD5P/Fzl3ylBy2/mHS+Plkxbwd0HpXAUptGiPUw64AHMrqJHIUqTltEOLr8eVCvQ8PLraUlc2UMXuXVCe9cfxteI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7f4f0a1f4f2so629729a34.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 20:53:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789617229; x=1790222029;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DGX6jE3mYLDDSUZ4X3+1GkIDB/peG79oUWGq/k2Ay8Y=;
        b=dSuydhFy78qqclT288aHwhHuXvWSoVgYtCAfCaWNrQtAXvM6mMQTNZBs3uqt0wNCs2
         Glox2/GR2ojB66uoFCFNQQdVoPTb22turzeUFkNh3BYKlCBqmSqdzhdE46gMvHTBMtSU
         NAge8wKl5LXO6hFCsLRQFhcUDV6kT6DDWe/pMesEfvTboC/qKURYYai1xkhxs7Bj8mnt
         8JdVbUUlkhO4Q9zTfjiuDgSkguCMTG7EFgrExE3eGjp6b74jbV3T73K8PiUo/jZgSaD7
         lOn2Xydo9HVDXUy36j+SuXnIbFj89ET9JHfwhJ4XGfYyJ44WP2QuTL/UAqSJMat7zO1+
         XVSQ==
X-Gm-Message-State: AFuF++m1YGebmduMQJ/wKf3CezhmCkOSA0sToZE+/C1t+vNl8C0Wj2YO
	p3ivFxywwx44mZPiM1Gez+iU5ecksjdlYgrgtgrfNiAFtWyUNg3LTPX4Pul7NUx8xN3DQ4r7uuO
	eqv65/qbY35IYgqR3PXpeRvIvxW2p2AvP6JB8LQs1Ca9f5j60a0q5+NSbYSk=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:2918:b0:6c3:b78c:8e21 with SMTP id
 006d021491bc7-6c7d16c6e63mr5088691eaf.21.1789617228858; Wed, 16 Sep 2026
 20:53:48 -0700 (PDT)
Date: Wed, 16 Sep 2026 20:53:48 -0700
In-Reply-To: <6aaabb70.86093f18.33004f.0003.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aab644c.87c06881.1db2b3.000d.GAE@google.com>
Subject: Forwarded: Re: KASAN: slab-out-of-bounds Read in ecryptfs_verify_auth_tok_from_key
From: syzbot <syzbot+b9529ebe6a9394ddf825@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: Re: KASAN: slab-out-of-bounds Read in ecryptfs_verify_auth_tok_from_key
Author: neganhat@gmail.com

#syz test: upstream f6e7b42bf05b
