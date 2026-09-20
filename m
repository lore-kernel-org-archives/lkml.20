Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBB593D3D07
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 12:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789908862; cv=none; b=quGkZ+FdMi8MPZVIKPxEeH4R0sJ2DJNcKUe0zUOi7MXWWBsYphAj9H2kKA2s3IFlnccl0b9q3aWryE9hT5daqJC7CJTlRCscGgi2QpeZ5lHor0o/oTrzp9KljRoxlloHEGEBDXejddz/QRwqkPLZG+D5pTzwnBWDuiCJ/IgJCkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789908862; c=relaxed/simple;
	bh=ZS2+IvBBT15ZJvDAnXaWqW4MEGSQ/lzz7KbGhZDMVuU=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=krbxM4yT/IcsbCBEE130xXD/VQAvnoYOB0Nehj2OlRsGkjha5B0A4BSdwkFOosJ4R2Hpo4h01w5r/aB0G4bPr96NQiTw07IcVs9mp5iRWD+izhCKlAMLguxuPk6i0B3BzkvRFeiMkPJWyIthhNcTaSlKbQlq+czNzj6Kx20b0gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7e99ff505c2so3518538a34.1
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 05:54:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789908845; x=1790513645;
        h=content-transfer-encoding:content-type:to:from:subject:message-id
         :in-reply-to:date:mime-version:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XpWYgal4ydz2PJkTN57WgxprdPt/80QvaAQrT/n8idI=;
        b=WEdhWAYLnXifVm4627vKBbsfBfHWtvpMdG6WoSQrddJAeAvYEbmPMA7v+L2P9Zp0Z/
         oUpaD+1xtAKlacIJ84mUSpC8mRBdk39l6xoj7vOzhYPbfsfhkSLutKvpRuhbvjdThi21
         bfNs0q6BNSABi1xgi/uCqA1fR+r1JOkdbt51KJpG56okVQVrgG/POC3wfU8HJveZzztY
         WqJY52YUiP9p9ZUix5KJl1Oe4k6e3MS/WIMcAWsSHoYT/FnKS3i9DSRnG36ApqgwNZLG
         Y2j1onNRqJR8IGuzDRl2JZtJEE0XCeUPR2dncM4Ulv1GY5hbg0VNgj5ptfw14NsmW0wU
         xv/Q==
X-Forwarded-Encrypted: i=1; AKwUvBzsvhmt0VpULi6Cvo7XzHAFX2+MZjfjXbZ6ajW2TvVfKageFrqz7LPX0Hen5Joz96xbti1ijxwZSdfMrCo=@vger.kernel.org
X-Gm-Message-State: AFuF++mLtJ2kSzbJxMXrvW18R8IMjJVb8gsHhIWa+FHNVAnRNXkaTYbO
	so/HDXpx3OJgFgypdVOINDCPiZrCHMgcZU3rkodmLCFJp/SGVAq/pTxzG4uG3FutlfL5D28gJcx
	TvWsEFYYCRhhBf/fVxSp3zKJM3yj9K+dCQ6Ri7Nh3Q28PR9Vegr+tlQS6ORU=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:4b8f:b0:6c9:80d9:5e7 with SMTP id
 006d021491bc7-6ca9bf53e03mr5767662eaf.40.1789908845287; Sun, 20 Sep 2026
 05:54:05 -0700 (PDT)
Date: Sun, 20 Sep 2026 05:54:05 -0700
In-Reply-To: <20260920125248.93589-1-adarshdas950@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aafd76d.e548f532.1ca396.000a.GAE@google.com>
Subject: Re: [syzbot] [ntfs3?] WARNING in ntfs_evict_inode
From: syzbot <syzbot+3db654d91b471c4d7a7d@syzkaller.appspotmail.com>
To: adarshdas950@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

failed to checkout kernel repo git://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git on commit 518e5b794c06: failed to run ["git" "-c" "cor=
e.hooksPath=3D/dev/null" "fetch" "--force" "--tags" "f569e972c8e9057ee9c286=
220c83a480ebf30cc5"]: exit status 128


Tested on:

commit:         [unknown=20
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linu=
x.git 518e5b794c06
kernel config:  https://syzkaller.appspot.com/x/.config?x=3Db454dc6b1b7acd3=
0
dashboard link: https://syzkaller.appspot.com/bug?extid=3D3db654d91b471c4d7=
a7d
compiler:      =20
patch:          https://syzkaller.appspot.com/x/patch.diff?x=3D14fbdff95800=
00

