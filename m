Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793857445;
	b=dX++nuCIUGUfHkL5sfsgDUyplvZXeTrU6uAktdodS05CQXm8TEKLEMHBmX7g6XxgoRuH
	 2LxPsgCT9DAH9EfNZ5ikDcEIjn9pv/BxqeZfkJxVXnDcYkgrdjnu6oDtjpONDfdBGPJby
	 mPZSprwqHh2kLqfuMdqkKW4scBaC2k840JtPJwg3O5vj+iMCD0gJQPnECPca5rvyoGFIj
	 e5sBT5Z2TLtXPeSexE9Funm+hi6+U00HV1haU4khypusIqpffh9FnpFoNgFUyxJ9EICRN
	 Kpi9810jkJFyqx6A4sVnqcLqxcdLa2v2Lgr3EALi0tceM/haN46CY40J57fY8lMm4zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793857445;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=Ly0o2yvAJl0IsLAF+/wHkF0nVo3U/9omSFjEB7jyHsw=;
	b=3Iq8/Vibw69QZJthRQYMHLWsw/RoKyKhGRy5K/hdYFXime/jK6nh7Xu4IqfNTZ+iTyy1
	 zsqMsE3XmmhLb2Hvx33EPkpZFwPa0p1zzjiwqc2bmQ5ZvpR95xKzDalbsYEz+xi2GSJxg
	 a9LfNQ2OUgNSiR8GgYebiHAvoomQzz9UVPPxmLWcGafDuFztiih3vcA+AX1QDkEXWcKed
	 hw3NCdKI0qTNtGqrd6osWKVQ0HEezhftxeQiRNNV8PvtltthLLr1jGQkN2Lo/w1/OuaHq
	 BaVmJ3tfa0HK9yShTszS+shlHh6EaUEqfo/ToSRw8eCJwbfqntyZh+tXBFR8qi0unnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.210.69
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74A4F606A328
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 05:44:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74A4F606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-8468290b866so2175242a34.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 21:44:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793857443; x=1794462243;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Ly0o2yvAJl0IsLAF+/wHkF0nVo3U/9omSFjEB7jyHsw=;
        b=pkeNMMuJp57p3KUKoFgNR6CNo3L2Mt7/ZQhq693p+2/Zhp9QCcgFK/9pEcqzmBs3JR
         D6AOKdEuuTs4JYniqyiekV3J4Ft+UybtHdZRf2NkwhWamGCHpW2fNsBxbBaFD7346gcC
         YGlYkZJ7FJx7aQbP5aYBR98h8kWGT5JgETHQhtwsKJdp+sPfNW177o2J8vUMqgg8kFN9
         7MQV/YyJCA270kaE8lulAsi9Kd+3D+q3yPZdS7FGoBgHerzn8N+0jH1XdhHDBgpH89D8
         0BOtVywoE8Wa2zd1pYtojap3BUvzLaoaycZNP/avqMTJesBy12SfAe2rNpzxvDZLn/Hs
         F0vA==
X-Forwarded-Encrypted: i=1; AKwUvBwFPtXnTNrJzKHfNqKmovaQsWJkBdVbtzJjityKXZXCVIwK/D26B3eyuE1mhl0EfM+2JB40JrNqefqXMPI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+p7zUTFdIF13/Nyv4LjaqyqCIkbfw4JWraqRSowWmRgcbCAVES
	htKPRRWrkO5tV4OM5kKZVUTITnx5u3eB3c7cYypena/YaPzjW7Op0g/7Ws905o8PT92NeEwjwB/
	yDqAJSltvJVrgGUOxIR+ud2MOc03Iq70+xyV7nqWX3WgmI4yRnWvWYYRfRoQ=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6820:351a:10b0:6f5:b6a8:446b with SMTP id
 006d021491bc7-714f1f82ebemr7873410eaf.10.1793857443434; Wed, 04 Nov 2026
 21:44:03 -0800 (PST)
Date: Wed, 04 Nov 2026 21:44:03 -0800
In-Reply-To: <20261105033431.42266-1-eadavis@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aec17a3.f31022ea.233d2f.0002.GAE@google.com>
Subject: Re: [syzbot] [media?] [dri?] kernel BUG in sync_timeline_signal
From: syzbot <syzbot+cba1a1f459230395a076@syzkaller.appspotmail.com>
To: eadavis@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+cba1a1f459230395a076@syzkaller.appspotmail.com
Tested-by: syzbot+cba1a1f459230395a076@syzkaller.appspotmail.com

Tested on:

commit:         6628e7d4 Linux 7.4-rc1
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=15563cbe580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=1d2c97eac7d33533
dashboard link: https://syzkaller.appspot.com/bug?extid=cba1a1f459230395a076
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1246e455580000

Note: testing is done by a robot and is best-effort only.
