Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 462BF364926
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 06:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788936788; cv=none; b=ZuDdkzf8WykcVAAJ0/iMigUUKwfhUe1WOMDNuaLJUdpYI6tiY4cHSdhKR3G9HkPgpnT7ySQJ/SUnIfAxy/SEAfi9cymJD6TVg68jOGUwhnDXe8uGvRJ8fTMTuhrAAHRlxYffWbJDocPI7GWGtRzC/HQNOgzhmrOnaILRoxpzqLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788936788; c=relaxed/simple;
	bh=q5qTIgNIWreuOtsNeEtXgMzrPkas/zv79hnuxiI9R5I=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=cX0t13jwfWZgckC9AYGtETK8nd8p9R5wuXOo951tRX3zda53wXxZsoq2a0p3c/ZOpkQYntvLPK6hqFsGKfnNuqQEL2R0kfqRM03x3TfbtrjI1uV0Gc7MMZwcwhBTIyiCfsHrFtxb3fxnzU+z5RxZjw2TvYPhKB5ROHopZMZnODo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7eb6a8c61deso4796217a34.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 23:53:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788936785; x=1789541585;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zr0kB5YhInO7HTrJvw+diTV99j/JZWoZidJz6UTlE2s=;
        b=GQ2zQRnvZFS9+QUNTOsbNn3Dk7nLeRE/EC9uATMOoNsecBn0jiY83ma3HSPvtPYrBH
         zDkMf3aqfyhQfsPA3DvkE/TdmX2i/CaH1KTqyDpJ4yY/OoKjy9NMakjvBc8iM5zyuUxj
         yWuxYRQ3H7saTjlXh0rfdAOdBjUsDu1jKrHm46UUwujC2Q+jK4l03Ue/pgIoZit6By4c
         4xdQjerSpiz2Zh8KopDTu1vInXVz49ce16EBlO3T2vI+y99UV+6FoxIR+UAc9J66ukX+
         fgPn0u+d+B54HYhoeFU4QsSoAVPi96ZvGojXO4ZtaDhJdSZ538025DEAgojrjlEm4jhE
         TkeA==
X-Gm-Message-State: AFuF++lGV0VH8fEn4Tpud2HcEDAF2lScIY2+zI/HqHgip7gWlpRbcOz2
	OPxfPNaZT5fR+Ed2f2kHjO22Tw086rlrxni3ZNfLPI0cVlF/2LMITvs29eI5k4F8o5OZu65TkqE
	oZvmhifD03al2KBoNBj1JL0O3hszXOMUA2IPgfDOZWCFThf2ftFAcSW/eqeE=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a4a:e914:0:b0:6b3:5c73:2188 with SMTP id
 006d021491bc7-6b6faee2713mr19198311eaf.5.1788936785130; Tue, 08 Sep 2026
 23:53:05 -0700 (PDT)
Date: Tue, 08 Sep 2026 23:53:05 -0700
In-Reply-To: <20260909063239.6950-1-syedtayyabfarooq08@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa10251.f81106d8.285f0a.000c.GAE@google.com>
Subject: Re: [syzbot] [usb?] KASAN: slab-use-after-free Read in vhci_shutdown_connection
From: syzbot <syzbot+31117fde582fe6a0cd62@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syedtayyabfarooq08@gmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+31117fde582fe6a0cd62@syzkaller.appspotmail.com
Tested-by: syzbot+31117fde582fe6a0cd62@syzkaller.appspotmail.com

Tested on:

commit:         893e1178 Merge tag 'x86_urgent_for_7.3-rc3' of git://g..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=13474601580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ec55b50193b453ea
dashboard link: https://syzkaller.appspot.com/bug?extid=31117fde582fe6a0cd62
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=167b4601580000

Note: testing is done by a robot and is best-effort only.
