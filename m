Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792578364;
	b=4LFqbysIJns/ra0h2AojEAHogwQrZB/vOdDKc9yGyce6Xm4jCbHwq9gMPbBiVsAX7K2g
	 3CPhnsH6w093a09YxWtasUHPQbtsqli5UH9yzjlLTWQH1dsXEEJaWXF9FVlblLc4B8J4K
	 G04p7B6wEaazc5Q1/yCWBLVPzyyq6WlgdfdaxrpEHyzAOP6iEUpBdOafrAy7e82pypj5Z
	 y+xNlp02LZnFyPvcXBo7w1N9izPvRa2Km2Jy1f1KEytSqOl7KrNz7FLrMGAfKlO1J8fFB
	 YiUfOWhQIyIyRr1ABRRQ+Mspjcb+hrB3cCx7JVeCvAHG1CXQA9Cj7KO+ytK4sp6/gEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792578364;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:In-Reply-To:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=i6cQS+M0jOTKPFz1yu+p/73srARbGZr2aqKvTYyKx6g=;
	b=XBQjsg1Pxw+iAGtcZJs39J/Ar8PmACYp53x6NvaMS9Yq7X4RsoBNVMNGPmv1o3lW4odm
	 uYmWqX/YNj4gXBDur/1hb93zW9Bu2PFQolXnQR26WwyjYyQ0IA2l3KJONfC7mNiKY3utR
	 Qg3ihIRSVm1zzhoZDF96ELeGA4mD+hWpBFV+OPjMpxZbPwwtko6501WXlu+zSNzoopwk/
	 7ODtWyHqbnobXCi4KE577mveNw9/kZHrUyHfj5nx8IcJ3E68YKu5W6XW0tRzMMwHSG71U
	 PmgXbrFs7KJZC9E8kCvgjgNjfgOdHJOoOJHeYIwSOBtKZy5Lr+hdbgQvgyN9aoJCfXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.210.69
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BB54606A322
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:26:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BB54606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-846863cd436so582675a34.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 03:26:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792578363; x=1793183163;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=i6cQS+M0jOTKPFz1yu+p/73srARbGZr2aqKvTYyKx6g=;
        b=J11wQY479u8DOPIvubl64eI138T9+anRZwIrEYNzaYMPitfd6GrfjKXD+3AobekWoZ
         YUETIX55WD/ZMHqZ1IWrNUAlemBMHAVvnwuc8kbZMJhlQqwk6L7GMAKziM8G/Da1jEQk
         GAyu2pnGg2SQa9SmbdYSZsnhSPlZIC+ydYLez9Ul+tHE9VDYWBUVpw/Khtu0As/l9RYZ
         2Fzv2JDGJoHM0a2B7slH9ub+JamayzlmfcVq/f4q8GzOzkOdA3n5gJyuX6ZlrUI4tc70
         AoWl+dnRxpbemjiXRMDMtd+6xJCwTt6az096yzAadItHs6ZMHX67Kinzcs7uFxRDq8el
         r97A==
X-Gm-Message-State: AFq9FYL8Ew/p0pvYluelqrPa0N9gzsEBA5fnI2bhesHmy9U0ZYID7KO6
	kzREsZydxKwkAS6oOQZgvcKMpKxR42w1GB/jt0nESUh/YvaUJLcpZBlawo71JJLHGkDJWpmBgLf
	BVib41201sQOBxVkJqQ1Qsr87e/l4DOdvjbAyFrTRz67T//d5/zUVmdJ7hPM=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1917:b0:4d6:2545:b12a with SMTP id
 5614622812f47-5535fbb3d0amr894132b6e.26.1792578363118; Wed, 21 Oct 2026
 03:26:03 -0700 (PDT)
Date: Wed, 21 Oct 2026 03:26:03 -0700
In-Reply-To: <874ieftph3.fsf@toke.dk>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ad8933b.e74039fe.1cb511.0002.GAE@google.com>
Subject: Re: [syzbot] [wireless?] KASAN: slab-use-after-free Read in tasklet_action_common
From: syzbot <syzbot+e91dc13b1b37759b3d9f@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com, 
	toke@toke.dk
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+e91dc13b1b37759b3d9f@syzkaller.appspotmail.com
Tested-by: syzbot+e91dc13b1b37759b3d9f@syzkaller.appspotmail.com

Tested on:

commit:         a804c574 Merge tag 'lsm-pr-20261016' of git://git.kern..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1165b231580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=5a37d7227c6a6352
dashboard link: https://syzkaller.appspot.com/bug?extid=e91dc13b1b37759b3d9f
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=152caa95580000

Note: testing is done by a robot and is best-effort only.
