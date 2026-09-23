Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7047285058
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 10:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790160443; cv=none; b=Gw/MOhHQ37dL4euNC8FLsyJu5tD86e4CLv77QYDb7ob81c4W223dohvI0SbXEydTNGyDtPBfr6bonSRmfeTVoCAia9kD+Vvr8Dgf35Mo7NExxYuulanQa6E/26IktTa51vd5558d6FHq2EVovExistJul9stHweew4rlunW6eIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790160443; c=relaxed/simple;
	bh=zeakoSZlx6hWUS+cFTLSTGi4bfl1m+9vs0GHEnovNrU=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=RVd6ry3287uvQ/wE3ywIL2IzTutEfVPiCpKdCuv0we1pK7d4LB2+cj/onjH1K/JF9K5E2qiU/JLX4/UZSkFoC1vQAYy8/8/dCSK4wbOF2WPp5zwy0qcQmsNd2X/qW6Z1hfCFSI76WiFe0hQ2ZB0NGs1LYZKFDL5a3i1wTj0M5Gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6c18e7d53b9so3135361eaf.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 03:47:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790160426; x=1790765226;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xJ9NgkAlr5Rti2q1VXdPdA0BKcsGbMDZA4BoGXZAQcU=;
        b=MT1jRPy982ne8xbiYcRUmypXVRQy8hClG3yeEUdTtt1rgMtJPHl8E7wvLUlZXeJW+y
         WVJAhswhXQyP69dBLeJkmqtN89L6bY5cytkQMa+5zZz7XBC/HMAhmUn14803rOjeOdkw
         mXgu8BBwdIzsluDC8sCm0VK3pxWr5hThnc0vsVM3/mgB4uIQFblR47Qfz5wis/gLH6UC
         nj8hoKtAKiBmdBBhMNUJNLnW6PZPsD3dTh/DQeextWpKAp+GNErTOpnNlU1VUWeuMr4G
         u66HOw3R+q6nNr405UAGl1YWw28dWriZfndsLCIMGpswAT4VFX5EBN6gzmVjP1hIsB62
         yDZA==
X-Forwarded-Encrypted: i=1; AKwUvBw9urT8/02u9ueFKhrlnee/m87uPYEQQzrDrfF76S+Kt+HIupS0E6r3Lrec1BzXz5yY83RGk8iN6fx2tfs=@vger.kernel.org
X-Gm-Message-State: AFuF++lvHGkn0Uh1kLKU+fibu5LSNzRT39C3RQzoI1bRZJKpoklfK602
	64HlsObNjGavaoTf3nqFWXdRy8VT5Mi1/PDbG5wapc+VrjCCooT7j9pNZ+26+en/mNqWvziNEsw
	iPRZjTm0yufvXsVk6qLldEHONt4S8iZHyVUSLTXvHrAqwI7arx9MiIr9i1Xo=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:1907:b0:6b9:1d72:e29d with SMTP id
 006d021491bc7-6d15a4577c3mr3975488eaf.21.1790160426376; Wed, 23 Sep 2026
 03:47:06 -0700 (PDT)
Date: Wed, 23 Sep 2026 03:47:06 -0700
In-Reply-To: <20260923102649.39389-1-eadavis@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ab3ae2a.71f81b7d.15fa6d.004e.GAE@google.com>
Subject: Re: [syzbot] [kernel?] KASAN: global-out-of-bounds Read in bus_uevent_store
From: syzbot <syzbot+9a321aea9d851b299486@syzkaller.appspotmail.com>
To: eadavis@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+9a321aea9d851b299486@syzkaller.appspotmail.com
Tested-by: syzbot+9a321aea9d851b299486@syzkaller.appspotmail.com

Tested on:

commit:         50d05c7c Merge tag 'landlock-7.3-rc3' of git://git.ker..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=13695405580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8c5c3949d762a91f
dashboard link: https://syzkaller.appspot.com/bug?extid=9a321aea9d851b299486
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=11ab8d25580000

Note: testing is done by a robot and is best-effort only.
