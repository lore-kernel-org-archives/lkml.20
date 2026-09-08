Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CF1558B6C0
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 18:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788892570; cv=none; b=RKJ1tLmfvQ2ySwtOt+VYDgprFV2p8RyuSPLEAOA730wPmr1clqJOxtkSNu0pHfBz7MuXz93Mm/pYZDyEMntx4pJhGOxWK1KjB8xiO0OU3SM1/hMKp5x0cTNA6oW+8khqsHLvxle0ZvqwIN/BcbKEVGXpuJZCrwXxK+1/Kb0LZFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788892570; c=relaxed/simple;
	bh=h6xRy4SiDFp1Lvmivn/JcvgYBXZ7oH9ZYa60noIHWo0=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=TOahJLacT8OI0hkIaTL7IPFNQk+1fm5Ujf9iM9Yxl/+YXnDTW265lNc9GMnWBhVubcnQP+lq7JozC95ulAlumtfQkdOSZFgAt6Ho+TMqJXjaf2Hbna65OUdu2oYhvHhW9F5mJSp9OojIh/7qdF7cs1wnFAuCpPKZxKkeGyVIaQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-6b12abf0e49so7143594eaf.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 11:36:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788892562; x=1789497362;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6DrMayO3OR3fP4G6nWakPQMlb4siccVjXs4hihxRM50=;
        b=gyEXov2H3xUEZyKoTvGC2gwPyCKsKm65y+Et7fkKiKFDZ6Os4sCms8Rr049Og2Opyh
         kZ8iZFMG7t437nbel3jG2qd2QTYK8ueOdvTJks/sitVzxs18d336zLLE6rJuKeAT2LEp
         iFB8z6WISkf+qIs4tK7uoizTxvO4tffx8T3W3UqlZjctX6oYgck1vETCA4Naw9wQwjyJ
         zZ1ck5zqhKMJdM7EdWsga4pjkW33GUX5ifNmTWZv8lXxYoZ3dk4QLFwZVT3gHiuGxYwt
         nAAFeJTUwQvsX4rMtEs5yO6sL2KBuX0WCbHz8vDdy/RNu/wdH8coEsN25dKaN2ePVRSv
         azHw==
X-Gm-Message-State: AFuF++ksaMmK36UIuOPOtHthy2g9QHOFYqHa7Q+Q3KWrWKW4tUO6w1kF
	4jZOQ8SgTPEH7U1Tf4cvSBPbZrsjebqgy3ccuL1hXMClGgsZ/LKkszhJK+4G2OoHlNA+ByW7jLK
	zCGLtVr6FHs5c3jrg/RxDS0PGPKOCx+2DXuVGamlcmxW3nObA+6cea9M9iwg=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:f02e:b0:6b1:4d1b:3004 with SMTP id
 006d021491bc7-6b6fdfb6928mr26756624eaf.20.1788892561862; Tue, 08 Sep 2026
 11:36:01 -0700 (PDT)
Date: Tue, 08 Sep 2026 11:36:01 -0700
In-Reply-To: <aqBMt67E3ptJ99OP@user>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa05591.6e6c5f9e.28f11f.0018.GAE@google.com>
Subject: Re: [syzbot] [fs?] BUG: unable to handle kernel NULL pointer
 dereference in getname_kernel
From: syzbot <syzbot+6c46a179b56c651c4c96@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, pavankumaryalagada@gmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+6c46a179b56c651c4c96@syzkaller.appspotmail.com
Tested-by: syzbot+6c46a179b56c651c4c96@syzkaller.appspotmail.com

Tested on:

commit:         73ae59e9 Merge tag 'erofs-for-7.3-rc1-2' of git://git...
git tree:       https://kernel.googlesource.com/pub/scm/linux/kernel/git/torvalds/linux
console output: https://syzkaller.appspot.com/x/log.txt?x=16932a15580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=c35e49327a11721f
dashboard link: https://syzkaller.appspot.com/bug?extid=6c46a179b56c651c4c96
compiler:       aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
userspace arch: arm64
patch:          https://syzkaller.appspot.com/x/patch.diff?x=136106f9580000

Note: testing is done by a robot and is best-effort only.
