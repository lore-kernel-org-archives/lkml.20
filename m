Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793205307;
	b=2QGqRffDDjH2SHOpdCOaKMaH7/td6t+PWex82zrk7e+cWjOm5MyJCWm7SS9nzWex+eAL
	 NMyYoYctXhWF17Js+4mOyKw5D5JDupH+/i2v+wu0BaJi+SfQZ+VIgN+u804poz4VtO40U
	 VU3c+0zo87MPMunz9s+z9WulNuaxULWAdGMreJyHdmr9qBaAoKlzQNDUTvO521sA26r1z
	 bhLZMiINufpxvqVVBQuqEKIAYQLnF4d1WHfmOhGuf9DqrNMm+xOCS5ub5i7v4jfqI1/Iv
	 atc01ig/rbs4BMbdl/ImNKK6kkSH768xWRgkgYSYs9aSK/eaO84H7M+ZJKYCmHZ8K6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793205307;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type:Content-Transfer-Encoding;
	bh=L8wN+dh4PbtqpKvNAPkQ5CP+oWFvwpblW+gahjClLIg=;
	b=p5LZjxoXCIM/QcAp+8vi2WyPkE6dothgGcnMLdR2pfwttsH8sTX86+ns4Ds6EaYaEJhU
	 wRd2L2QRhnIqzOB6hzCQFsRqnhudiwIE34V0hjejudCOz+f0U6j1uGsRDf3Zt7UyPAKu2
	 5OuU2OIQJRIuN1+5f1+naG3tA+W7kBpUOW9sgHSjQtCSuhpEMta3/G+2V1Yen7eK52QnD
	 O9UjL72SaQX2iWpDmdqOokpjEM2FeEjaI63D50xBlrLVitX6TbnLK66iTnzG9FXv8tbhk
	 kzZBCuqS+rVKcOWMMcYVUxvBfiV9H/2F3zrZcUvvoRtxOs1iMnlCgCqN7XAVDfhNHVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.198
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC1DB606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 16:35:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC1DB606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4f2040e10d8so1030433b6e.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:35:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793205305; x=1793810105;
        h=content-transfer-encoding:content-type:to:from:subject:message-id
         :in-reply-to:date:mime-version:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=L8wN+dh4PbtqpKvNAPkQ5CP+oWFvwpblW+gahjClLIg=;
        b=a0mUQ2LNGFQ2Kn8UyqbU8U9XyY36YwNdnx2xBfuuK78p6T5J6CG6oX969mrWCOFvLx
         BeBcfo2bG0xQrrAM4RrojAtUIsoKDdAkSNNImXXm2PBqM2xG7Y7TenMtYFfP1hi2RewJ
         5jkF2CqB4qUgUMtWCchULjj8f2KQwSERMiEyXsvQ3NQStLvhmy/2MLo0CuWzUgKy3uu1
         Yjd7UNOjpnwDtBD3wJqCzxkTAu7AdSrRXpF5QXGiFRK3nnXMd3uQjxHI7jBej+6D9lMX
         tM4Jf0RcceulEeTCi8HkbqiuGWODa7+BKWqsL1KKdIc0hWleM7GXt8sWJ5Vl1DoWZ1Mw
         bxgw==
X-Forwarded-Encrypted: i=1; AKwUvBzYkevt9VKcqg4SM7SpmjxTB8uRq5jRK6rUBagHBW3w3S3GAA6rNFyqkKmGe58DFyEv8mtGsKtvZQQn6Es=@vger.kernel.org
X-Gm-Message-State: AFq9FYLZ0D7CnZis84khcLl7heUC3NaU3GPYQkFKgQsZoRT1x2KJiscj
	qNLQxecEVsQSIp0MIaYgnUNk3+rtrdp3hvNq/CPogw17qiDVPItiLlMNzpOcPerB2fCu9bz4d1G
	pOA3BkmwG+E0oJgaRS7/HARu5iAHNK4L7vz3NmX7psiNZxWkprSW43NCSwyw=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:bce:b0:4f7:d324:bc5b with SMTP id
 5614622812f47-56384c8890dmr1694121b6e.57.1793205305703; Wed, 28 Oct 2026
 09:35:05 -0700 (PDT)
Date: Wed, 28 Oct 2026 09:35:05 -0700
In-Reply-To: <179320439734.4039954.14130288373446416947@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ae22439.8d333cca.51da.0002.GAE@google.com>
Subject: Re: [syzbot] [tipc?] BUG: soft lockup in do_sock_setsockopt
From: syzbot <syzbot+10a41dc44eef71aa9450@syzkaller.appspotmail.com>
To: immersa.bartosz.chronowski@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

failed to checkout kernel repo https://git.kernel.org/pub/scm/linux/kernel/=
git/netdev/net.git on commit 6430fb7f1cc4e329e386521b7b208df443de92f2: fail=
ed to run ["git" "-c" "core.hooksPath=3D/dev/null" "fetch" "--force" "--tag=
s" "a5a65480fd08f84422d56537d217faf190618d6e" "6430fb7f1cc4e329e386521b7b20=
8df443de92f2"]: exit status 128


Tested on:

commit:         [unknown=20
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net.=
git 6430fb7f1cc4e329e386521b7b208df443de92f2
kernel config:  https://syzkaller.appspot.com/x/.config?x=3D555131780f7c727=
2
dashboard link: https://syzkaller.appspot.com/bug?extid=3D10a41dc44eef71aa9=
450
compiler:      =20
patch:          https://syzkaller.appspot.com/x/patch.diff?x=3D10e0382d5800=
00

