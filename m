Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 231E447279C
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 15:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789400765; cv=none; b=fquQ/u/6QnJAq0I/4DRIdosIj0JnSAK/cPDZeVUPU0iI4e+hfyCHymAgrCM7uKxvMFuDKtTY+kwspISxtQros328NzTogsbQaIK35iZS+RwOlBbb6ok0FeCE03NVWnev/MDDtwcQecMWR/tkfHHE51LZUl4UZwGjtiomt9Vhmkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789400765; c=relaxed/simple;
	bh=2fBmMwH2Ih/hZFqNPhgnXzEqop2XyTKVfWdlfW6ehys=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=Qr1v4pczfU+Z+Oq7AdoWCn3bf8a8Z7QKtE1rZLBzO6eu4hSBEQUkSpCZykkKUJizLZmHe9m+n6r048hMPI6I/6t01Gek4NKykiw4eIYdww1HH5bIqmnrx4iCszMq+TX+YQ3v7oWvDT/AV8pQ3sFGBUK5/oW6cZCbY2yTUmuISh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6be260da3fdso3805698eaf.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 08:46:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789400763; x=1790005563;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4cDw45+0zaQYdhq4ainOY0iQXXHCxIFKqVl7CfSJk5o=;
        b=Yu34fLDhqfTqAWwB/FlhychGXkdLNXDl/Gi8QnlKfvXJ7HZNxSynHqwKHq69/LGq0Q
         ngUcidh4adiV3ma4nSL3kfTIREYNG13kpOAK96sk3rKwHS1Z63+33xBWj81Zn19rQ5Ho
         50xlpVCyhMiTa8MMysBKjhmZrYoJL2iy2EYjZdm+ED6R/8KVHYfTbvrOmST1SGC2EGhp
         uGsEN/SVClGIdmmETaHuIjqIqdOA6/kwADlTC0NJF4LslKtNmJultptMo3D2Wwqe5efU
         93mMcv5wHf9hOXyanDaSoTD4hLzh8pbwKzPUijYpCxkHGsuWmRKMn8UB7P3MfFNCR089
         fwEA==
X-Forwarded-Encrypted: i=1; AKwUvBxBpTbje+X5nfWtal8Rsl2HK2AF/0ZeCsT1sBe31oUzSrIalMG626+1QN8mG3iezc2HVrQGOUkl9tmsWUM=@vger.kernel.org
X-Gm-Message-State: AFuF++kUkYBPJb977UfLxP9j1D+nkNney1EaGP4BAaQ23vxkmrgy8yuH
	BwcT5ZuvIhCedm2BD5+i03KrPykBs1+Sefwj2RLarN1n4o3H+eFulendWVpTuGRATKqLMRwJ4Sa
	yitEu4P4r5WrjAA9DXsWgc9T+luKeaAAJmza5kxN8RyCf6bd2oPbmzyj6jyc=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:610:b0:6b3:b9d1:f629 with SMTP id
 006d021491bc7-6c5429335d7mr2612267eaf.31.1789400762879; Mon, 14 Sep 2026
 08:46:02 -0700 (PDT)
Date: Mon, 14 Sep 2026 08:46:02 -0700
In-Reply-To: <6aa7e616.0d1f51e9.2e6de3.473fSMTPIN_ADDED_BROKEN@gmr-mx.google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa816ba.4c28b7d0.c1bba.001e.GAE@google.com>
Subject: Re: [syzbot] [jfs?] UBSAN: array-index-out-of-bounds in dbFindLeaf (2)
From: syzbot <syzbot+1afe7ef2d0062e19eeb3@syzkaller.appspotmail.com>
To: jchuang26@m.fudan.edu.cn, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+1afe7ef2d0062e19eeb3@syzkaller.appspotmail.com
Tested-by: syzbot+1afe7ef2d0062e19eeb3@syzkaller.appspotmail.com

Tested on:

commit:         f0b9d8eb Merge tag 'nfsd-6.19-3' of git://git.kernel.o..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=160a8df9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8e9663b61025701e
dashboard link: https://syzkaller.appspot.com/bug?extid=1afe7ef2d0062e19eeb3
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=16f29c8e580000

Note: testing is done by a robot and is best-effort only.
