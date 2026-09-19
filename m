Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC9EF3DB994
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 09:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789808824; cv=none; b=cuRQXSAq7r/WYyWbJ9Pa0mYxoc2leIbQUdsCAkL7IS7ykqJ+sFWaW4zm87yiD4a9t+qVYrjp6nGbfr5HQX5is2BR4FruPI5JdTrZ/+GxuvxzFgg6D2lzDpmrU/RPoiy2fnSzEKLvKxo/d7tOICVKHN/aPXvus3WnwUj1JqkhRdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789808824; c=relaxed/simple;
	bh=nPkKPzM0dz0Mo+MVSDVf/sJzkjHbvyKHBTrQJIlCn7c=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=MmVPBq3oVbhb+bzB6zKzkxh09eV5EcflcetrF5PXlAWDCaVzJBXqaz6fhck5BmcGpUYRQsX7J41t11A16SxrZLQR27fMV1YKLGiklwOu8D5ntynvkOM4Sue00mCEKuJbZ4JN0TytW8LHV/AKxUANMb5Zkrw7FrbvTuXzZ3lah5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.160.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-46a4168b520so1785460fac.2
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 02:07:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789808821; x=1790413621;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=x9yRw9D2gXRvIc/0u4uYuzMHzcogsHQUYAKktJ4OjqM=;
        b=EQXP2iwHOrxX9ERYadQPcoE+S6ChmxBt32R3IVjXk88/ZZRL+Cs6+PthGLDZjEe7/5
         2jDeTjKzj9ZyXdXNGQjt14NhRFqDKvc07IeEEIIcbmRW6Bu0Hmmd9vfNuwlUrCMK9Iq+
         cz1DQJB3XSejUFNAVojrdHOnXC9Fnuq7mbrquPUcx1gBZ7GmxOtX7SDcIvJn2/LFK7wO
         rLd1RYGeMhaAaRi5Io+Khsj77AvLUEBkNx66np/wCe/hTPH+pOTr4wgRg7lqVDerEgvE
         iVmi4JqnGqvgXXdmCiaOE5HtFolm7WTIDu3zvt9fD74vhgvEGe1N1lXfhFPmgnh8C7lZ
         GYvg==
X-Forwarded-Encrypted: i=1; AKwUvByPI5ugdMfvtgdzcr2C7GhIb+rFDFfy7s2HI15GIc2G9CPr/rY89RXSH1O6ETUHzrEP6Q7aE/aPn80I7N8=@vger.kernel.org
X-Gm-Message-State: AFuF++kQoiRwys8r3G8bDvV7yU57aY7nTKfz4EGR+AmxMZ7HI/KCIKWd
	nokt61oRPW1vm0nbdFS3CFVYxOO9vW6r8/djk5ZQHAW2AGTl63kbvtZ/jNl918OBvR/s7t972GU
	sR+IAzP9tMspVobNI8MsAJJxNMvyKVscC9E9Kv7CmCnIg9HwJu6ppyU6jAeM=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:80c8:b0:6be:7782:5a51 with SMTP id
 006d021491bc7-6ca9a026f21mr4393980eaf.10.1789808821682; Sat, 19 Sep 2026
 02:07:01 -0700 (PDT)
Date: Sat, 19 Sep 2026 02:07:01 -0700
In-Reply-To: <CAE2Bdm3FqBPAMxqKoz_h1cw+OXpm=LJHdJjsME_Jy966tqhq_A@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aae50b5.e548f532.1ca396.0003.GAE@google.com>
Subject: Re: [syzbot] [fs?] possible deadlock in ovl_create_object (2)
From: syzbot <syzbot+7cab6a19619f1b8efc00@syzkaller.appspotmail.com>
To: dakr@kernel.org, driver-core@lists.linux.dev, gregkh@linuxfoundation.org, 
	iam@thechris.in, joern@barelysecure.org, joern@lazybastard.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com, rafael@kernel.org, 
	richard@nod.at, syzkaller-bugs@googlegroups.com, vigneshr@ti.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+7cab6a19619f1b8efc00@syzkaller.appspotmail.com
Tested-by: syzbot+7cab6a19619f1b8efc00@syzkaller.appspotmail.com

Tested on:

commit:         40288c92 Merge tag 'drm-fixes-2026-09-19' of https://g..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=169d2ff9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=84649d3ff8d550cb
dashboard link: https://syzkaller.appspot.com/bug?extid=7cab6a19619f1b8efc00
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=11b52ff9580000

Note: testing is done by a robot and is best-effort only.
