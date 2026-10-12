Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CFB240B38C
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 10:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791802564; cv=none; b=ZbAMby0PtANMTSWkVqaDkuPvmydELJzY2Mg2sLg9OkS2mpHFGWYg4fOY92PzNoMIJimdK0Iya6JNWr8ebMf+hoW9Bfot8wHhkI6yewn2DUy3CypzuyO02pkWKnOKcVy/UXnjUz33hlw9jo/9j8mZCmNz8sFAeNSBSTVlrAvpnhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791802564; c=relaxed/simple;
	bh=ITP3BZBbXmp6xICXZJAq4HH9uJ4SKpVNTlUZkVg+pcA=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=MIrJRZHXGWQqUJ6TUSEN7h9APISAXDhM5/s9mYQgaaieEUFnHA0jmzMC00iGOcQtYHoH1HfIIFd0fLs7Im8jFqY71gQZpfc/qJi8CdT1E6uOd6kT8vOAok+T54PhqhEJKlmJ3jJEDT9Zm/094Ye3D+LYf9zD8dzUGlzC9MXz0Ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4c467e19391so3355049b6e.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 03:56:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791802562; x=1792407362;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=b0sdqoxWLHLcPtz4poIwe6mipikiLu9pSL/+Nyto960=;
        b=KoFBEJxHqttDxLHyTsxZ3NQ7aChc62U34lx067lKWKVcf5W7PQddvoRFF9+4gqfFFN
         zIsKr0pXEOUGZTjIYhQO/E94tpmHLo8EPJVx5Q2QkAeHuFNDsEwLHbhjMM4RxAO7XBDF
         0+xHMwP1TwNm9RFKWb6TkmebBUIErcxJu8paM9mnH04DZbvV4FPhDT+5dtM3GCLT4vm+
         kLCS8Z8tiNZ8U23JQrvjf2GEPycWEMXZjow3sjrozFIX9WJ6KolKBYNrm3zp6eugieVg
         KK5tkgiLb31gSewHMhplfyX8UMtAOK6O6Zrcbm+wWVvO1RVd0Cwc2/PQbTfGcR01mOSL
         TZ/Q==
X-Gm-Message-State: AFq9FYLXQwdZ2uAh+nYdYCnJD1asGZVjfEkJA+qXpKzVuuSmdJFK/kIj
	V0CAr2D2YaSV8D+T8qi+D6sjrPcwaWh+X0CyC8LF51+tRTx6pF5FWuc29We7AxLMP5SJYcPs4D1
	5V/8S+tojdC1z+qC8mleowVLj/zTtjZbhp8IT/mKv8D7nGw+TlHOLFjgQHko=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:6808:b0:4c1:3047:9d23 with SMTP id
 5614622812f47-50c51bb5643mr8734494b6e.23.1791802562049; Mon, 12 Oct 2026
 03:56:02 -0700 (PDT)
Date: Mon, 12 Oct 2026 03:56:02 -0700
In-Reply-To: <CAEfrx+CYiyH-YDO3sN4+z19dRJ7vxEwM6b2Q-+5Z=_Dxeic5uw@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6accbcc2.0e5b5d80.2c029c.0570.GAE@google.com>
Subject: Re: [syzbot] [kernel?] WARNING in __set_cpus_allowed_ptr_locked
From: syzbot <syzbot+6835d5c11145e4f77057@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, spannme41@gmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

failed to apply patch:
error: corrupt patch at line 5



Tested on:

commit:         24a19b95 Linux 7.3-rc7
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=b454dc6b1b7acd30
dashboard link: https://syzkaller.appspot.com/bug?extid=6835d5c11145e4f77057
compiler:       
patch:          https://syzkaller.appspot.com/x/patch.diff?x=12c22999580000

