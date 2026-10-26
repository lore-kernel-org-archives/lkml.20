Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792998303;
	b=lz56Mqy9DTBGj0hY+M/lPehj3Azax5+RjvnlRMAHBYrod4OHJWJxzyLfRUi6laoDwBN6
	 T4bGQEVQIfa0XH0d9Cs8ZqDE4vfYh/wKN2CDmufWWr396V90sKdKpLessfY8ArpF2SgPQ
	 2okv9lHbNcl5zsXW4mIzvPhNLz0rhjFHeqe/9/7Z1TnR6628JGG2ZBX+0bvpxu2sn56oK
	 IcI5ZZt4U4Tggi8yyARAJoM6GGRBXB769wa9brEYw4PFoSa47N5ER5qo5XKorJYuVQpTP
	 FXw+XGZWKDAjBbZgKG1jUSfXOwV6qMfeJaY9AVALTEhY5TRSL4h+T8g71QgEPGGm6Fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792998303;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=V/3eey45d+JaCwVerzhDOyT37kNJkT85h4ieQcxO5u8=;
	b=aGaXEkNloqQ4HvPHr+VTfmAaEI7w8sckmbkwNCShOQ7HXfQ0Z2X1DW3lr+hiuzLMIE4x
	 zFokth2ahoT+HgVgzhkZyWhXqDt+3dJRNV0Db6verU9Zls/rPoWFjiz7dFOF05SLmA5/m
	 YnG14uh7+gJPDdK4VTpYviBOxhfP13WgDMPs1IQb8XIZqhtz4Ar1zgApAttdfx8gs8UEn
	 M9PoKXrDFVkcqB9d3L89428zGKOn8pIzohVxh2qAHC6kPnxcbV4QQediepy6PKMA6RfjG
	 YpDjoTNKe8bJX2ECWbegeiIoQ0ovMbu+nBznZx4mRmfefk9ganfZFAfchTAbDdUSS1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.197
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 866F2606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 07:05:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 866F2606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4b597558c4cso4343509b6e.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 00:05:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792998302; x=1793603102;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=V/3eey45d+JaCwVerzhDOyT37kNJkT85h4ieQcxO5u8=;
        b=sMeALIOlU7H1XgbuGysozG8rnNGV4HwAnXLFwho0QywIYmNYZkdCOX/NfTKS+eLwnC
         mhq3WdQH4mhKwzgQkwyLDc4kaj4P9G7U6Oc37D5/iN3r0SgS/anbDKlAqtdzqjGUEnPt
         FaZvYhMC9L1X/l1cgnSEAFZqsUZ7Ut4aq785iEN1LA2Y8aqAz7NZw5G4bBovs8yPm+hg
         NzbL3MCIFYfx94VyqrIqZbamrbhGhXv6kzX7K5jrYgPDrwcoW28fCqvh/YJB5iO/d/ES
         YXjfk8rR36xkqClQNdMZIb2GXqTBN+1mghhcrPnYYw2ujRisNUA+lrDVDEY9YlugthqU
         yxeA==
X-Forwarded-Encrypted: i=1; AKwUvBw/rzCRt3NwoRwTJFkRvacCBzXJZIJ/U9NDwmRFVF/8N2DJRhhfVzrUeH3pAPcqWf8s/5do/MawFycufk0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKSE08fU/lmIdA7Is3WLBFKb7SwN46Xs/O/sNCVNVHlzRZORJ20
	E6HBPTlzcGis3j5xJeQh4XHSSREG96/nPbW1DwKiE2sWjza2V49JMb2nQ1iHJTx2rNTZtGnI/3r
	X0qGmIhlccKcTewUtwNcbnT95iZUtZncpRm2dkp4GXlqqhXuW5ikXY8N1f9M=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1204:b0:4f6:4b04:4b3c with SMTP id
 5614622812f47-55c002ead02mr3641998b6e.40.1792998302517; Mon, 26 Oct 2026
 00:05:02 -0700 (PDT)
Date: Mon, 26 Oct 2026 00:05:02 -0700
In-Reply-To: <20261026015942.167369-1-eadavis@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6adefb9e.8652420f.2f2d6f.04b9.GAE@google.com>
Subject: Re: [syzbot] [dm?] KASAN: null-ptr-deref Read in dm_kcopyd_client_destroy
From: syzbot <syzbot+a2626a25eb2595e3ec3c@syzkaller.appspotmail.com>
To: eadavis@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+a2626a25eb2595e3ec3c@syzkaller.appspotmail.com
Tested-by: syzbot+a2626a25eb2595e3ec3c@syzkaller.appspotmail.com

Tested on:

commit:         4169c9c9 powerpc/irq: Fix build with CONFIG_PROC_FS=n
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=108a238e580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=e397d1e24d3cb03
dashboard link: https://syzkaller.appspot.com/bug?extid=a2626a25eb2595e3ec3c
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=10aa6195580000

Note: testing is done by a robot and is best-effort only.
