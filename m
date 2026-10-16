Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F1C83CF68E
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 11:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792150144; cv=none; b=Y/exhte3D6ZOT1BFjhTOSTiPME48iJn3HQFScbG2F9MYlrYr/31v6CfMCSWGg+7h4c/wWZwYB6BL5NZvnxQfh4Lmgw1/KxZJYJA2xMvR6DratTwI2A0xUobFq0U5dSQWOVhXNeeHwmJ7X0CiGo5Fw6SkbNrP+dmjIm35bnMDUmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792150144; c=relaxed/simple;
	bh=INk8St2b6EIjrLp7Ws5f6WlhDVHD4oeCagUwkpEowFY=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=Cygw07NBOcWbiUWOxYaTX6aIvzau7+cpOBHlWAY6KIh006sQyP8S74BToYMTAbde6yB1+xIzXrlxN83FkqPaTrRXZGXyKOIe7sfALrC3O1quSf2wMUzZDFktPpKe0bikSDpWU6QaMRBR6kGFG4SwHltd0OK6d7+ITy1O9sgUddU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4b28dbf4197so3499960b6e.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 04:29:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792150142; x=1792754942;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/0jVS+CPRA8cqMcaCfHlktMUogYTGxgM3PWJF8LyPhM=;
        b=ciCezL6JknEmXD/BWgljBOxhzycErJFngCWbOrxovhhiCfqzFbNk9cj5/4T9yQLoIg
         2tjTEEZBVtmTKBXLlRWBDW4TF1JivVXWBwv5CQoKVZcI8oO9gL5tfqXhAYR0jRRDWb3b
         8Sc38RsMMwXV1w9nWKpAbs5U7IsHUJNcVQmOtf0CODmG3YNA6PM2Exbn9OhMj06chJeh
         eKZJKePMJpvU7WGU+vJwH3OyUIQqJxdDwY6seE7PPn/m3dGwB1A6AN42eo++9/EqggWI
         PotMUktfdNS3ufsQJKC5xsPE2tcJggdfboCfTLjLo9J0zPFalVjABDWb3tAxgR8IfNiQ
         wKXA==
X-Forwarded-Encrypted: i=1; AKwUvBza/XcGlpwn3tRAaF0RQUgtP+eLqTmmfP0MqNSU+y2wUm0rWFHNN9JCiEeSHd1TYUYXiw6/3Vd+xGqovlE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKiXnjYCZkPMlga9y4PWkwacspckdYMrwD/3s4nt4J9FOWOCFFL
	sJB54JWs+rqb0TmtihwHLEwKGQb6YdZC6RW0grYsFo7bKEs4jkSPx0M1BwckrsIaha9kPk7oPfl
	9/VU3HEf3QZ8sOOpbFNsK/86e4cQu7HALHwvUvWagpJiXq6IT5gqx0dWI5Q0=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:13ce:b0:4d6:9293:9b56 with SMTP id
 5614622812f47-50c5b4736a0mr17365474b6e.62.1792150142442; Fri, 16 Oct 2026
 04:29:02 -0700 (PDT)
Date: Fri, 16 Oct 2026 04:29:02 -0700
In-Reply-To: <8a82e241-55bc-46c2-a3e3-f34871ca1e66@yandex.ru>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ad20a7e.7952420f.283480.023b.GAE@google.com>
Subject: Re: [syzbot] [input?] [usb?] KASAN: slab-use-after-free Read in roccat_disconnect
From: syzbot <syzbot+c492a9e154f81127551f@syzkaller.appspotmail.com>
To: dmantipov@yandex.ru, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+c492a9e154f81127551f@syzkaller.appspotmail.com
Tested-by: syzbot+c492a9e154f81127551f@syzkaller.appspotmail.com

Tested on:

commit:         b0a42af4 HID: roccat: fix device access in roccat_rele..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git for-7.4/roccat
console output: https://syzkaller.appspot.com/x/log.txt?x=13120031580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=bb0b3468a2190916
dashboard link: https://syzkaller.appspot.com/bug?extid=c492a9e154f81127551f
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=103a1621580000

Note: testing is done by a robot and is best-effort only.
