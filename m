Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793695444;
	b=SjwSTDdYw3/3/2E9rLlx+iUEirQSBJl1dzzcUJCmOGFrm906vyJ/4hkJJTqYLDGjFf0b
	 oZtApPtVePig80N9BfErEzElwTxoowR7FHUTZ1iqFWuQuu9jf8K/cfHVsZJH+bwourHhx
	 7cavE4CA0jjARKzyjmp3FjZ8/x0LC8QI5Vj+qw/kAx7tJ99qt1fS60DTHvU5l/65nRqt1
	 7Q7vhjCD8WFiCgApNiLU5FTNXogTTU2ubf21MnRsgn0J1/a7fIfnMz3NDJ290vPEbrYGL
	 mrOEfvZ+exV87Msy0RqhUSTk49ZUFkMzLpIzZVAQ2eZiqLWbBERyzOC5ltLsq81xJwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793695444;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=qKY6HPHC5qrYrTa66v2t7bNaES7eOt5+LBkRq20PIeI=;
	b=ftV2GbzuS0rl6oFMS8SSISdEpyfYsSRDeEzC86Qy9hibLr/L5Nrix51HMBK5Qtadjqne
	 bZIARMDd4n3RTIdQhmu145xOxoBNcDurwKHXloCXMiBwjomZqFRfSBePgjkXKT+pYxIV6
	 oYfbdSn3HJXuLUuB3AuYv3Quf2XbLOGzsegagGV/Gk0FecyUEDASAfRiL86No87Ar1gBB
	 5LOtR9Uh5l8EwpaK2xfBc7yc4jPfA5M3ta/Nssa1h8xMLcS0GVoO7i/ijgjN02D9Fspvl
	 f5A1Uh/0pc+R0coJJbwiWvdMgDkeUmrzZKon11Uyx/h/vzBOfVNzfg7alinXNVHeR9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.199
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB3D8606C697
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 08:44:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB3D8606C697
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4ab8b4887d4so3536793b6e.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 00:44:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793695443; x=1794300243;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qKY6HPHC5qrYrTa66v2t7bNaES7eOt5+LBkRq20PIeI=;
        b=unOYxLF/m0nf4/9nhoUXi0BRNKT84IBLYQNBnyX76/LhD+e5l9nzoRWNuZIZp9qN9F
         or5f+jPD9Jzwv4VhonEDzDDsnJ9LTGrCqCQiWaWL7p6b5WibgGNg6UG1PywyRNeNayLN
         srhTShEaBtLM2HnFMnjSQ+2cQpg0Kw4bilqIRKxt9ulWoRiUph3Sxvq8oGYYZPKUidZ1
         fBL/Y24/9S6ylrD7ToFLbREknhAMDbOu4qDnTG0ejU1n9vX924JODeocuSCTlM2gz3MD
         nG8RvuQX4uBD1zUrAedJyEprTIWuphTwNWDCsLCW0+0bueTWV6IN1jetftQiV/Qfmg6F
         humg==
X-Forwarded-Encrypted: i=1; AKwUvBx3rFt/fCrSmHvpbYhlq1jmqe/2depTQZ0OcQ2k7slVA4W4/khWfkJ1ilbbbNdwX47Rj2kGZsM1zHeRlAw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/T/b2yXoyxDwOmqFBK/XDTYQhYWFMtRnonA0CVy0gNkd494OvO
	YRulvgCMFBwWi2iUDyMug3qlvlgrCvXh73O2PB//no3KRg9gqVF+oE0hZ2EeGIXYGRevFlAflRj
	Vo47W7OLS8kWfvy/ImbwfglbRxQTcgZK6IvX9al0NgnTPLb7+MtymZLuHFCA=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1b2a:b0:4b9:e5fa:8a17 with SMTP id
 5614622812f47-5640dd9c199mr8261680b6e.28.1793695442824; Tue, 03 Nov 2026
 00:44:02 -0800 (PST)
Date: Tue, 03 Nov 2026 00:44:02 -0800
In-Reply-To: <20261103082349.3009885-1-fei.yu@intel.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ae99ed2.0c24fc0a.13a0ab.0036.GAE@google.com>
Subject: Re: [syzbot] [dri?] WARNING in drm_mm_takedown
From: syzbot <syzbot+d93b9064fe5f74af3aa3@syzkaller.appspotmail.com>
To: fei.yu@intel.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+d93b9064fe5f74af3aa3@syzkaller.appspotmail.com
Tested-by: syzbot+d93b9064fe5f74af3aa3@syzkaller.appspotmail.com

Tested on:

commit:         6628e7d4 Linux 7.4-rc1
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=12954f95580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=dc5d2f8cec3bf9ef
dashboard link: https://syzkaller.appspot.com/bug?extid=d93b9064fe5f74af3aa3
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1067284e580000

Note: testing is done by a robot and is best-effort only.
