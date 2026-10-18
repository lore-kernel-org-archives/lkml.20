Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A36C92C027F
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 04:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792297984; cv=none; b=lC8RANQeESnLi5Lp2OSbR+t3+HDPpCpDyOlfJSqfl3JJPeIBEP+Lmz69iYfcQ1WdxzuLgqGRbHIImNEw8iHIpNQ+dNLIieYXMmAcnXIuJb0CAyEkCMRvQRNtHk96MyuPquN1YtQYagJb9ntwzTSIfo/rhZKXcNwz9Zx4yoLhJso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792297984; c=relaxed/simple;
	bh=DTsztXCRLXFiqzWZNQE6MucPEvn7oAznYiFmNCQEWzg=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=g0J+l/EmO9TqdNkJCi/fN33eiibe8J8S35atZBWcl0GvvU8S2kWvW9F7mIWZwl8PLuHgrRCs1r/MdQ45CWaSb8W4XZEOypuxZxPubsHpbGZZNgoiwVCv1LwuHtRtwa6wMhF2XdhDhmLlOYRX08RD8y32BCKjPC3HD8qCWDU7h2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4f4612a1a5cso3190421b6e.0
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 21:33:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792297982; x=1792902782;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=09OsNjVNYZIeGql7sfQvkNIgXkVvgIhSMIekeT5Tf8E=;
        b=xydrrKIplXf1dciSi96szQiS036a6Qhl1Syscvl+gP5sAMWGUqNXDpNHnjSXbsWWJf
         9UOm4jzUia5xrt0KO02Lw6vbAXCGy1/c/zL/pWjpshkR5BQM+2agAX6c+h5Cz+Hc+AIb
         YkKCyve2IBMe0fiUwfbhKCPn7OpBExm2VAM4Fv4S8Ve6U3oSRYQd3goLH89QtYBfkS0X
         xWK4EKYx3y3bdcyBA6JWo/Rstx/HxfZNya1PxEOmCQOJkKBmFNZ2zUXzrEERNFgXgc6C
         HEfOrt2sEBXbB1/SIsXC4p8kE9ssWZBuPL8TusN7QFZZdIx4ObLyZ+ZDsy87+biWJVHt
         aDpw==
X-Forwarded-Encrypted: i=1; AKwUvByH72kGvXgYk8IZf811mhKoBcoRLAodL7TyMEurzwHlOl77xE3v6HgXv83P1tGGeL9Mahu5JRut9eohsGY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIi3GX1EIr6eiwX7sm9ENe60ifW2hz2G7clrYVKe7E9ply2Z1S/
	qZ2xbibYOaAMQ/ZlOUKrDsBQmBVmLeiqkNhrInBJH1GWmv50/qdwi5HB3uF+zn/RKElIS4of4V7
	RmZ3wQkbehsThHN20YkavJlMSobstSF0S3Nu99iQTiuMt7Q+1gJFGyLIxbNc=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:690c:b0:4ec:1bf1:fa82 with SMTP id
 5614622812f47-53702bea09fmr4950831b6e.46.1792297982596; Sat, 17 Oct 2026
 21:33:02 -0700 (PDT)
Date: Sat, 17 Oct 2026 21:33:02 -0700
In-Reply-To: <20261018035409.695-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ad44bfe.7f4e89eb.3d59aa.00ad.GAE@google.com>
Subject: Re: [syzbot] [nvme?] BUG: corrupted list in nvmet_fc_remove_port
From: syzbot <syzbot+c98b21427617af7f547a@syzkaller.appspotmail.com>
To: hdanton@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+c98b21427617af7f547a@syzkaller.appspotmail.com
Tested-by: syzbot+c98b21427617af7f547a@syzkaller.appspotmail.com

Tested on:

commit:         58161ead Merge tag 'drm-fixes-2026-10-17' of https://g..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=13a8dda9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b38d39c45202f4fa
dashboard link: https://syzkaller.appspot.com/bug?extid=c98b21427617af7f547a
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1286b4e1580000

Note: testing is done by a robot and is best-effort only.
