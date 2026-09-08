Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4073F3C0635
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 21:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788901924; cv=none; b=O292WAG3rEoxhVe0x6362G5VFDlXhrKbcE7GIr9259zPow9X0PXHcT+qSqy7d0jerJYkCzKV93IWzM9rFaMVXxjx+n4kjBM8WBk4F5SVDK9KbwcJsBBkSqJQx2RUj/TGDZR4NzyqlOgqHyByvrP7BTc1+UqJigRid37mcFdv0Qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788901924; c=relaxed/simple;
	bh=OF5XzBSPbMqRVfxT/ggVsRxou0nRxw9oDBY1CVb1k9w=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=E5YpzlbzDDRqkhz1XZ8Dnp89h7JH4hugVa4misJj1qupNp5ps+PboKMSXZorL+O2yN5RwpkifR9pHQ3L4L2bdxJjOH6P1tLn7XS4lhHg7+UBzW844FP3kuNot1aJA+FfyyoS8aAm1ABPglD7Y+4pkPDuwv323u7ccubYVZ+DDIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4b3319233c2so5850607b6e.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 14:12:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788901922; x=1789506722;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6buZcBCCoS6TCIa67AxYvLw03jTGS//tHrzwliwsbMo=;
        b=WiBtBQL7Cu7IpHqSk2oDppiKVIry5QUW0+aLcHRnI6ySYn5N0UIpO94cSn3PXfY0Kj
         e9lfEM/ra8+WL1jeugfidx5TLAAJL1yMsLEyaxsWFCsjog4F5cA3rMGZggboisuNP8pp
         uOl5z+jiC6opxhiHGCP4stgHbm4Kyn2AeAD4ynPuAw8LO/3VDy4jIPnDrd9g5IaduRGg
         tmxHpMloRd0YjaxcNIWDvffXsptwf1temLbqMHGuJrtW5vRuFvcx3aETOiHPfR3w4gVE
         NV+tCOLBI1XUrjw2kvNX7y8DQ62UkMLOG8RCtPgD/hmmpr265vHpJI8yoBvDdBXUf/EB
         Pr3A==
X-Forwarded-Encrypted: i=1; AKwUvBwS7mFAgTDdsHPVWLXfZYILBJFAbjACB407RgQeYF4KfFb9fDJ33I99TPpGxITi0D6J4LCUdxjPh1S2Ezo=@vger.kernel.org
X-Gm-Message-State: AFuF++m7piEG/YOujej7CbsZH5o8HPi9+Jqabqxh5yuLtkkuX3kDRUXg
	OyqNmsW2bsJkqZb1u5OnkeNfobSivcJhw0aclrMCUGK2ij0suqlvx7QLbeAqNAglJg42jDg1uSj
	p8SIMSYojP2rswcHHrVzk2FcMMdGvgdw1S0aG6jBrKOtrUJdldk2yVZfoUP4=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:1890:b0:6b1:b31f:132e with SMTP id
 006d021491bc7-6b6fabd2e99mr18904458eaf.6.1788901922155; Tue, 08 Sep 2026
 14:12:02 -0700 (PDT)
Date: Tue, 08 Sep 2026 14:12:02 -0700
In-Reply-To: <bcf76760-6059-4950-b689-92679db660fe@yandex.ru>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa07a22.6e6c5f9e.28f11f.0019.GAE@google.com>
Subject: Re: [syzbot] [media?] KASAN: slab-use-after-free Read in
 __vb2_queue_cancel (2)
From: syzbot <syzbot+dd0f06181ab66b93dc00@syzkaller.appspotmail.com>
To: dmantipov@yandex.ru, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+dd0f06181ab66b93dc00@syzkaller.appspotmail.com
Tested-by: syzbot+dd0f06181ab66b93dc00@syzkaller.appspotmail.com

Tested on:

commit:         5acbae5f Merge tag 'powerpc-7.3-2' of git://git.kernel..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=17fb9af9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=19560cab9a915237
dashboard link: https://syzkaller.appspot.com/bug?extid=dd0f06181ab66b93dc00
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=11ed7125580000

Note: testing is done by a robot and is best-effort only.
