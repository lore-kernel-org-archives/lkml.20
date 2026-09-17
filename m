Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECA9A3D9DBF
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 05:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789622704; cv=none; b=ozkmQRgdzpIgOfPFUxups/UiGUXgjOXudAF7mQojQiaU4+DvuSFkgBDSfmxBWTfC5Jw/arTKO7jY8Ar5d9P61kVdkNGe5hrWDKxR15lyr8ZQQuwo+rBN70gRyh4Q2hPdqAfpxb/p+Ni5FziqSrr0netdHVFkK+PtlKyoEthAl3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789622704; c=relaxed/simple;
	bh=tB9v0cZ7VRToSv48dWkhZxAI7X2rpGA71Uzg7yhGFyo=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=X4gpIx7iRoOV65bG8sCyAd2gWSs7n9WKHRNJZaqnk7nHHqZVbyzWMMmNsmeHiLZBmH/ASZnCxY5Q52aizP1neOr4XV8KK9Xp4H70zGikqZCeRnE5dOHK8S5BhpfLUh2c65SClk5tTxQUCTpz8MbtkUBD6ZuX2WwKJXscb3LtI3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6c153bab4c3so548630eaf.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 22:25:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789622702; x=1790227502;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=I9ii0KRW21yp6jDEHGz2DuoLXGMaA9wC1s4b2m6Pv9A=;
        b=zNTBbSLwqrLJjXTA5WFenplhe0FBBNiXtfRxlOlSXJ4ktvZVYpGt5AdcE/JX54C85v
         zhd0I1Uzam3kw4pHACuWAcUZWQiHjctbpVdKoCGg/ecVBIxWd1uoubTnvdlfp3wHhDYT
         aDseRB7U7Hlla4xL+03/7NXmjhWK0ryQROOdzbdsraieeFP7NvqakYvEd1xwp4VklqFQ
         eIiWDrcsrWVgD8VdOChUAnv1WU2JzucOKoOJ6WUCVh4Rjj5loZEb+ol7A909rG4VLog5
         pZzZDwmZi/i0yy9DPg8HHJIuZ5/aYkeOLHOPrXP81voyFdjNfkYNpDb4DvR7jzv91sHT
         Cj2g==
X-Forwarded-Encrypted: i=1; AKwUvBzrJm+PtwddYZI50WbLAhmtN1nG9t4qemp6inIW0jLnKhm+NWcQpJFciDQbCN9HihE+xCL+4p/S5T7oRRY=@vger.kernel.org
X-Gm-Message-State: AFuF++nc76ANvPt7zn4WstnEmdcONOec33IPgmGuqsMLhyN2s9yaynq+
	22VHvrdYJI4hhO454X6UIqf6fcS1Do++hJJrojNzJVuzrACfqaSlaGmwKvPVhP4W75d5sGesjsQ
	amtWlj209rC3U1mnKtYFQUuZPRqXHpiUcQ6TCfZpNtAhMbffBaNpU6fzLMiY=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:180c:b0:6be:4eb3:e1be with SMTP id
 006d021491bc7-6c7d36fa748mr5352030eaf.39.1789622701835; Wed, 16 Sep 2026
 22:25:01 -0700 (PDT)
Date: Wed, 16 Sep 2026 22:25:01 -0700
In-Reply-To: <6aab40f5.e8c85427.7a89e.f95fSMTPIN_ADDED_BROKEN@gmr-mx.google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aab79ad.87c06881.1db2b3.000e.GAE@google.com>
Subject: Re: [syzbot] [net?] BUG: using smp_processor_id() in preemptible code
 in sk_skb_reason_drop
From: syzbot <syzbot+dc57fd6722deb17e92af@syzkaller.appspotmail.com>
To: jchuang26@m.fudan.edu.cn, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+dc57fd6722deb17e92af@syzkaller.appspotmail.com
Tested-by: syzbot+dc57fd6722deb17e92af@syzkaller.appspotmail.com

Tested on:

commit:         238650ef Merge tag 'powerpc-7.3-4' of git://git.kernel..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1715b925580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b454dc6b1b7acd30
dashboard link: https://syzkaller.appspot.com/bug?extid=dc57fd6722deb17e92af
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1474ebf9580000

Note: testing is done by a robot and is best-effort only.
