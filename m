Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C6741CB2E
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 06:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790663286; cv=none; b=GbSYqWGBCVj9/oeq7rxFgxUf8GTlCQ/d7H4i5v++1ULbH+kUcRSPlmG0QlfsbWtliGy0FIUDdEzJjll1mP9KzYrJGpcslnZoipEmT85c+9GvOTvI6kZXr0EPnlf2N5YkcPh2w7hJS9QaRZ/gTU9e74GBcFCJ5oonbvpc2RAiYDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790663286; c=relaxed/simple;
	bh=7BA0LWzWA49kANCTpoinbie4U4DCOcHwQXwLG29ObZ8=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=PkW1IqFizC9b07kRZvsVUNMpBb2LadG9u97bDdgOkkEX8Kwe9etqbL2uPjUk1YLCJEMgdHFFQ+3vfktjbIxuJepdu8RpXeK9llHQXKrFAySRvylM0IXnJwWeoScnMnBSCokYcWvNRTOvhARWlYg1/zTje6ekOM+Vb+4N9BJKqBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.160.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-47d75bcf3ebso4489618fac.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 23:28:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790663283; x=1791268083;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KZR502NHm4PABve7tQywFNQn5RRszAwct0FhEMiBEiA=;
        b=lhWAolkPLBU10LIpQmsr73xc/bl6/xauLSfZGbhNy9d0jFPjJkg8EmoBUhkZnBg+5A
         iN5RivhP03vtXTNJucvFY0ob1EMPklYySHNIN7GSi2Fapr2co6AaBaht+v0l0eFcT6An
         0t8FoZH8K1DGFwb4RL05HPhzsiaY0CWUBHeWBOsKarRwaF+hZd1pm9ZqoLr8tluRNMt6
         FQeHN5gAmdHGmysKqLNiMHVh/p5Wjey/CGWr9Gj3aYYYa0tFelta7GpF5oVatahH5ERN
         E3vj1pjutytIQ2DpEY4YbKkfLMLGT/e7Z08o3MiPQYvrSpP92A4LTdoMpGAzME8G1TCg
         axEA==
X-Forwarded-Encrypted: i=1; AKwUvBxbeoPy41VXk4mARgirLUmZlKuuF2KTlwFHujhtQSDbT4dn0sW7BmWKyWUMvJHgR2+NehvoODvF70GOsB0=@vger.kernel.org
X-Gm-Message-State: AFuF++laMmepcSetRsJRVgbfe5yd+KI+Ln/emgD76pyVU0HbnF6KqJze
	5PRb4ppL4OQPhWxsHLaOipDDj/VpoZTz3zyA2whUmHz/kkLuUEvfTUcFop6B56zSiM8SPVCMWcc
	nxIgps1303AewPAdX1SFri1sTfYivp7QBy2eKMCQfWt1SDMtJNM1sjHcFSmI=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:23c7:b0:4cb:f21c:a79a with SMTP id
 5614622812f47-4d72ac46340mr15871903b6e.34.1790663283726; Mon, 28 Sep 2026
 23:28:03 -0700 (PDT)
Date: Mon, 28 Sep 2026 23:28:03 -0700
In-Reply-To: <2a7987a6-7d67-444d-b310-61b390510eb0@yandex.ru>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6abb5a73.80e1c6cc.1e8e5f.0076.GAE@google.com>
Subject: Re: [syzbot] [input?] [usb?] KASAN: slab-use-after-free Read in roccat_open
From: syzbot <syzbot+d632e93ffcd1452bc61e@syzkaller.appspotmail.com>
To: dmantipov@yandex.ru, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+d632e93ffcd1452bc61e@syzkaller.appspotmail.com
Tested-by: syzbot+d632e93ffcd1452bc61e@syzkaller.appspotmail.com

Tested on:

commit:         72d3fcf8 Linux 7.3-rc5
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=110fd605580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=7d012d9c67977ee4
dashboard link: https://syzkaller.appspot.com/bug?extid=d632e93ffcd1452bc61e
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=15ff9325580000

Note: testing is done by a robot and is best-effort only.
