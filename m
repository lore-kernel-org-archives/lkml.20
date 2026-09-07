Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76717424D46
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 08:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788768304; cv=none; b=KYRCPsC2slw9vb51yPWz8RLM1fd3cNZOlqj4qjnLGavu/21XloREwMA8T3vZe1ZtqgxUbVwdBtykDYzisfGWox2CnY6tnx0/3VSUf5YjIJZf4fiaI96WwWJ961QNLfLVQXm6oUcULq/dlzGyaj2nmHONcEAh+1tqma7Qk0qymT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788768304; c=relaxed/simple;
	bh=mQqVxaRU0Mk+a5y8C5Y0tkfuj09s4eKT5quIU+Vqtww=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=Z8ky9B7lbDv/Zfbry7ah1cj7AfolUj9f7+x4MEinEgHD40LECrPCXnBhTzXhDX0rIlqovDjQZDzR/itAOy5LCIjcqmm7EBAXnPwCjdmDzlspwldUPgQeKXmhyj9qcuWgRXyHl5Q6/kQrjKETaVklcJviZWHb8e2JUzsXH+eGVQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-6b0e7370be1so4318974eaf.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 01:05:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788768302; x=1789373102;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qF+FuN5yVCgVbYMbmgfyZ/6fBRni4ZKLu6CaHCwCG6E=;
        b=VQ4gSfBvZAVOfQhQxo4veRpjsmN+fkQioBFG3dU79LroZr5jVA1oQAK3Iyolno9ktk
         +4sR5qmM9nBZW3nEMgMw9hUtbVcQp3fwaqdLEUuQS/tMIKEvsm0C/A7Q5TSJv6svZyG4
         iEKpAjtcL6Jp7HxaEWa5tFjYcSd7EfkMToH598gEOG7SUetudzDKUVmBm+T5DdZ0tMtJ
         jMsOAjfQrycJoddHRMqcgSnW/oN5PZbrZ8ClJZq0AUViutRo8HqnikD3QOrNUAxC9Nur
         HTkopOgrEvDqk9NKSv1cEufdkQDsuopQZa7kMVJzXJqTcW9L0MgHDRbBTRGKB8h/DRnt
         SlHw==
X-Gm-Message-State: AFuF++k9lpGFcQ3KXfwxh7DQtBG9lhKflw+SehiZgUtA25pliAgPSF9U
	cutlNaue45hvZmK5zrmMVR+MIBMRnUg4ff4+TczztcVQUTrCOqN3TJtL8IEKeluDs+9NBU8n50c
	FsSzjCHdDfhta1CDgU9HYbUzGHG6TAdUMfokMaJHd1aqwn5rzw+/u5I0n/CE=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a4a:e914:0:b0:6b5:ec2f:3565 with SMTP id
 006d021491bc7-6b5ec2f36bfmr10658445eaf.22.1788768302142; Mon, 07 Sep 2026
 01:05:02 -0700 (PDT)
Date: Mon, 07 Sep 2026 01:05:02 -0700
In-Reply-To: <OSZPR01MB9313A6EAB14EA1A8E9C61EEBB2B22@OSZPR01MB9313.jpnprd01.prod.outlook.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a9e702e.87c06881.102b7.000c.GAE@google.com>
Subject: Re: [syzbot] WARNING in usb_composite_setup_continue
From: syzbot <syzbot+a83a5a1ba9ff57935171@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com, 
	tkdkei@outlook.jp
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+a83a5a1ba9ff57935171@syzkaller.appspotmail.com
Tested-by: syzbot+a83a5a1ba9ff57935171@syzkaller.appspotmail.com

Tested on:

commit:         edc15184 usb: typec: hd3ss3220: Add support for supply..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
console output: https://syzkaller.appspot.com/x/log.txt?x=13d63125580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ec55b50193b453ea
dashboard link: https://syzkaller.appspot.com/bug?extid=a83a5a1ba9ff57935171
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=13a64a15580000

Note: testing is done by a robot and is best-effort only.
