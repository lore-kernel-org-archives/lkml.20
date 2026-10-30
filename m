Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793329865;
	b=AMi7XwiVdk6GYEFmZ8O3GM9O65u+SUeIgNQiL0pJ4Z6hm1JCzJjlunXi+QQVZHb1Wwrs
	 zZZKaqfkzqdCOqgGDJ9I0UmG4NO98M/9Wlmzc0azaL9AM4DjQtL2O46IZFThRMdZXKxM6
	 Wvl357THdil0Of8i48FFaHj4Y+xhxtywQlNfvhtfwVHwbzBzzoQVhzE7we+imOw1J53No
	 4P7/RttI0cry7j5xGhCZSHgqsrCmN3ITz3YzGhDK5IqUp1B4f0xoC3iH3ZeYMc8ub1wE8
	 UMe8QG6TKEQ4ZbBCCHr0jECMTPxDdqysz/8xu50dPrfXfEpbnIAbd5h2iHS3OMzdfDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793329865;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=G840PXgvnIdcIBjqH+b1jZurt11hSGHU4r3lMuNt54s=;
	b=w2QRPA1n0ut7uC+jP4Oa2AN/Cm2YyOz2iiO8LOsQNx0LYdbXVnX2b3ITG9V35NNGe+b5
	 MN1Nj5z8AGpGJcZro0wjTzzC1ngiw+02Xgp0oiy4dTfF6JAxkMK5x0zc3mu0YrXdE2SjQ
	 MWlWHudeOO/C/c0+3uK2HhP1QaVXqCxH0N4W6VLmxjUbpk8TzEqRgDniE/H1oBLMC3VYS
	 FSi1V/XJRTdhs3emyOL/Vstt0kWZRK9sUxWzS6lM7vZdwJe5Ik1RczaDo3X70Da5OLt01
	 3dB1AsMnG1o73D/u0QE13fxLiUXh4SR/WA/FYQPiEVv82xRNREdPqJiM0z+1O9zRNoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.198
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33839606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 03:11:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33839606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4ab8b4887d4so252852b6e.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 20:11:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793329864; x=1793934664;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=G840PXgvnIdcIBjqH+b1jZurt11hSGHU4r3lMuNt54s=;
        b=MEo8ywEk5PDmD6Oey49mFcQ+/bi0m4qD3TlHkEssfueEu1OGuesWkOd/NVh0TgczYO
         c1Gd1H/YqG1R+dweGaK2mLncjJILo2M3GH/SZgr35dbpEXIKJOFK+unkGfUD82mnmKkc
         cWNLzQMKy6VnGOtawQJH3SiYjC97JHwXdX3CcqDnnDxeusO77jV7/WezB1jwgKcWd7hv
         hg1dXXNhjXEyrkiK9y4s12uDSHzRAsDBy2gm69TOiL/BiTvVP/7YrlvKcM3cQ0vOsW6z
         qQUiH0QwbeHeB+0I59D0mjG46BQ8T/wBI4dkAaTOyvGZtJQFR7mJJim8bVjwqtSJiZQS
         TDbQ==
X-Forwarded-Encrypted: i=1; AKwUvBxmyL7fhZ2aEskwqvWO/9Z/PDPOFeyF/Ljh6cN0Pp3oQWEiBjYOJk92m1jL0ZqxMkSD1zP+qECBwR3Cf7Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYJN8zZpksvvUPILlu7algyqzvDbczvvm8hhpqaw1kdbO8Xj2pFt
	blF8X61AQ5Uk1PhyHiaiBGQxKBWpMJra2UcioNXVw7iTpqsTUkP9uiiWSauFGVWehV0h2j71tCc
	eYDXUdbyBz0dExuVu1TjoYhI044YoRjhlN4mnlAYXEn0LnXsnOCU7Vxu+His=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:c232:b0:4cb:ae51:5971 with SMTP id
 5614622812f47-5640ddade81mr899077b6e.32.1793329863872; Thu, 29 Oct 2026
 20:11:03 -0700 (PDT)
Date: Thu, 29 Oct 2026 20:11:03 -0700
In-Reply-To: <CAA=drApZkJkvn0Zn0MvBHJNesHrg95+SF2YK1wY6EHuJq-EXgw@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ae40ac7.0c1d3ab6.e3d48.006e.GAE@google.com>
Subject: Re: [syzbot] [mm?] WARNING in setup_conf
From: syzbot <syzbot+75f49ec552cc74d9d69b@syzkaller.appspotmail.com>
To: gowtham398gs@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

failed to apply patch:
error: corrupt patch at line 6



Tested on:

commit:         d89e1d18 Merge tag 'fscrypt-for-linus' of git://git.ke..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=129d675874dbf896
dashboard link: https://syzkaller.appspot.com/bug?extid=75f49ec552cc74d9d69b
compiler:       
patch:          https://syzkaller.appspot.com/x/patch.diff?x=14c940b1580000

