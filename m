Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B99A1468C14
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 07:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788248705; cv=none; b=SGG9L1mUSLbdbETD98ewdQiHR7KXo3OCAmcAx1ZqINTogy1kEfh9aROkxxaVSzj9F3sIkyRl0AbYUn+EI6a1S9T2c9b2rPem4mumVt8OmSDT1N1cHGoV10etNxHJs6BFg2voSDl0yAPJV81VvPncme1qA2aw3SGLHUayMPLzz2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788248705; c=relaxed/simple;
	bh=Kwzx/G2MVPM4TcAUQygKNWjW0BVdT70ygmW+MUFZRWo=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=k5eDHRKr6tPtYANVBOtP4HCna3Ti5mi9yG+LG8DDDQUDFrCYfZlZ6M8I29KEXBKnKUfq1lUvsk2mF+xqqkSMb4r4BUosLH/0RDW+7xUUeO0bznI0euLc4QU9d1hhTMiNgP6qbW2I1OqaDrbyAT3t7E1Bn/CSmUSnGR9GJhMPlrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-49d4cb3ca23so6952633b6e.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 00:45:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788248702; x=1788853502;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=cO+IF/roQ735VVx8QXTPGBRUMv96ABeB97I7jAxa+8I=;
        b=TbMIHKwq3UHggdzsdp4dPVjmcu3vzUMRQAeuTbnV6u2fcYxAuqfDZxPhaM2HJfUxlP
         QKzb6aA8SHPCvheunSIvQB/jvaQbrGwddtrOkBJICYcjGKscmq20+/tXrOONrO7L/V6e
         n/JtTihWmw/ZbidMTOKszJ+1PM0Qq1OEDERLqDLXrmC1vcnG1GdNvMaAo6t5tcPCf4/v
         6EEJeXtZMpD2cJvLdWsakuJVWuqRb0/bl3s3/8ib+6IiK3DxSdkn+R9n3TvoA7h3M8yQ
         cdSmfGi8i2/0HUonCtyivJiMl7mIXoS5iCf7cYdzcsxirqaUbWX3lC4oumnYqb2/v97x
         Jwmg==
X-Forwarded-Encrypted: i=1; AHgh+Rq7JwvM7xBqfb+y+FHsTlPxq9kLn2iPGEKrCQlh1Ob8af3ekw9xm7JOA5Qbd3cXzfmiCaJYVYDTGNPAjI8=@vger.kernel.org
X-Gm-Message-State: AFuF++knEPaT3rC2WKWiadwcmnFlce3UnWqVZ67mkdzNRlWJKEOsluS5
	z13iQ61xSbJ6B+3Rei7OtD3IGaDd1VSlhvy/ZYScggpKVC+JJEomnGPAqkh09xvSOQjcWNVJ7aR
	fNq/1+uETGTTF6SjwceBhp0LaUm+u/0t5XQ+ClIviSX7T5sUFmH+7m7d+yTk=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1a11:b0:4b2:8d9e:de11 with SMTP id
 5614622812f47-4b5b837c725mr6942194b6e.19.1788248702670; Tue, 01 Sep 2026
 00:45:02 -0700 (PDT)
Date: Tue, 01 Sep 2026 00:45:02 -0700
In-Reply-To: <20260901014117.416981-1-junjie.cao@intel.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a96827e.04428c52.29b18.0003.GAE@google.com>
Subject: Re: [syzbot] [kernfs?] INFO: rcu detected stall in kernfs_fop_open (7)
From: syzbot <syzbot+19d01f6082ec61dd45b2@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org, davem@davemloft.net, edumazet@google.com, 
	gregkh@linuxfoundation.org, horms@kernel.org, jhs@mojatatu.com, 
	jiri@resnulli.us, junjie.cao@intel.com, kuba@kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, pabeni@redhat.com, 
	syzkaller-bugs@googlegroups.com, tj@kernel.org, vinicius.gomes@intel.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+19d01f6082ec61dd45b2@syzkaller.appspotmail.com
Tested-by: syzbot+19d01f6082ec61dd45b2@syzkaller.appspotmail.com

Tested on:

commit:         abdf623d Merge tag 'wq-for-7.3-rc1-fixes' of git://git..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=12f51379580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d7588e5a39260ad2
dashboard link: https://syzkaller.appspot.com/bug?extid=19d01f6082ec61dd45b2
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=14a46d9e580000

Note: testing is done by a robot and is best-effort only.
