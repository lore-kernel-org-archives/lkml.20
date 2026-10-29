Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793297708;
	b=XfV+5b3mKBIN/zFIh2/VNyfx25ecQiU29FyQ/tWC6DTZ3Hhr0dBRIpyuNz0tnz08H/8t
	 h7A+8oDAaj1cbmv3XYJT0+waRLvkP4Io8UPuxpHYSHrB6+WpzoMNRYVgIKg3rDIkl62Kj
	 dIAnggP+IDtnFk3bik89Xsmz4nNC4HcF7SLJ2lxbmAvxUcL6YYCb8FesVCJegh0pxU7EH
	 Omlk7Ow9umHK9LYnQ54nc/fnN2Woae3bg1mpFEtPcpklXlO0MGlWv2tDOubbRYj/r5xU7
	 3uJ8vkoUZJAgfMtHcneR0XG8W0VOZy47sJM90UiuHi3Z9NIcB8DfbASqmlgaOeVFBlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793297708;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=RaddaRsTsarRag1hGD+2GPB+uMWVou+INfVwtcNeKZQ=;
	b=QSc3NOut81tk+siYadfTy2OKd04aqzgJxlF5ETMvbqQQVRI9Uc4ArkPifNP8RuN9cMWz
	 Fp2w0PWMIjjLOQDLzbEybu5v2oMhEZG7hhOvkyaX1XgbuZVmVYuzkJOEZ5k9/AGFT3efh
	 gDwmiftS/SnX0TEOUGtHdK7w5/1/4VNgBDj+pvNYM6F9CAKjO+PUbBxkCr9NM3QSIhFom
	 qGm2J7eP1zCP7NvOLmJlu65M4BZfi5Ce9P32KEI+DUwnCFgLxW+RcwfEJ9sn/aYmcZHRf
	 mbejBb+WQ6uMiuyQJqiHSaaJFuOQXSaA7BfzTTLZIjf+/+6wW881rLqd+EClhJYAwMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.199
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55EE6606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 18:15:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55EE6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-5587351d419so1972971b6e.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 11:15:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793297707; x=1793902507;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RaddaRsTsarRag1hGD+2GPB+uMWVou+INfVwtcNeKZQ=;
        b=gKuHpHXj9czPk9SnG8bYdphgGfK/7HRlYAbcO6jXqCJQUIHjWAYVZQe6RQAUqB1rge
         LoiyMRjEoTrOayrJYggVYIVLGQ62MhdGyN1QVWKI9L6Uu4zhtBsE5smGbyM9KCP2qsPt
         dpO5jw1Qdg3RXLEpJk/zTu6vxf2tQUG4z7j3Mgxz8YuKOULSRSTNd+7t32WzY8S0vyxx
         tRhMxWHUBk5v/V/c0u6sZStNTmoqe/tAuoDGSlXsLsHJqZjTGp0uy6OAslrtuyySqcAR
         ovTb3EnZA0tabSO8u3N1peG2B9OPQeQW2VIKRzMOK2dTU6Br0MxTyxKcNkOBlxtS60uP
         9mMw==
X-Forwarded-Encrypted: i=1; AKwUvByMx9Jat3bKfh23teQGRljNW6S/lPhOOMsB6ZtrPH6BwWbcvA3FVoqi85wQ9XeXjsbEnDGcvtvJglVInfA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKJXmeeooSk2mx+eHM6v155nWop+Lhv6fgiF3h5xNo+sIjV74RR
	bvuLYiRBglV/S1nsTP7LfF45LeIf6GkKlwmNvRkm7B2cgMLELwhojp63UlvmBIoL2zAjM9AN/BB
	vevikG2QTgpnPCoWGgPZDNOOm7LLV3NI0gjh/Hgo9WPC/9rOeqx/oY1JG6o8=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:c2fc:b0:4d6:9293:9bc3 with SMTP id
 5614622812f47-563841935f6mr5110976b6e.61.1793297707388; Thu, 29 Oct 2026
 11:15:07 -0700 (PDT)
Date: Thu, 29 Oct 2026 11:15:07 -0700
In-Reply-To: <CAA=drArvDe3zyLe3RadOYFa_WXC259Tw9OUE6YH022VVDFnfjg@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ae38d2b.b7bd089a.283bc.0000.GAE@google.com>
Subject: Re: [syzbot] [mm?] WARNING in setup_conf
From: syzbot <syzbot+75f49ec552cc74d9d69b@syzkaller.appspotmail.com>
To: gowtham398gs@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

drivers/md/raid1.c:3076:52: error: 'MAX_RAID_DISKS' undeclared (first use in this function)


Tested on:

commit:         c339f401 Merge tag 'platform-drivers-x86-v7.4-1' of gi..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=129d675874dbf896
dashboard link: https://syzkaller.appspot.com/bug?extid=75f49ec552cc74d9d69b
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=107abee1580000

