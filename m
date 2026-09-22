Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7324F3FB7E5
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 06:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790060228; cv=none; b=l43NGNYyukgTLhALzubSKxIp3thEUmxXPjCFAYk3TMgF3Qa5qGgpxT1kEiHcA+JU4xD83csPvz/Y4hTdPyzIpv/tcVxZwfU7wXWB41O3k9WjK6H+5YikpEsQcYwAGpOTwexk4tgPfoxpbrgAnccObqQCp/Ulh8Zu+Lsv4ELK4rA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790060228; c=relaxed/simple;
	bh=+IoaEDXnfPSUrh2gxBIEr1kH9Oyr6hWNf51/Xd+wFWs=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=BHo1hT/2FB5ebU6Xn17j4VyyAMw/1vIn2jAwLkT46gG+46+x+Tft5q9sxLd63StceJU2On1Qg4PR28RzVst3siaae9LngBdf34F8B+8TBsO1c7kQ8L2ZIGEoNuexmL/VXjF8vLkxyDMWFj57Z7yqVea2r0Rsc1m0v4oQtPkTkTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-805da97443aso5628925a34.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 23:57:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790060222; x=1790665022;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bLYPkbKmrWc2RdkLV1ci/YjwOlLfoUFhydxEr/gxdG8=;
        b=ZAR+DJF1OsfrkdZqamfCf0ag9mYXNZ2XTUdSdOT6MIHyzBZxlSC+QvkaYB2/O9Qxut
         Q/YO6UCGPoi0UXmbtOGtji3xjoq96jlUuPJYhcqCoqkXIMeenEHYDB5fC72JtZ8S9mBL
         RlZgc7JWYuftMU+x/7CFaBkPNGf/m4cXCHXh25c8gSvauORlKSeDVqx27Bb1Gxzo7FW2
         vvfJB3tcCpe0JieLXm/bn2eige9WZALxXqexKFmzNGwPOIFUgGMajxJLJ+DqijuRahOW
         JTjOzcUJc1VbGI1hzTbIzT2j2iDS2zHM6p6nauE0FW19HVEaabOF97A66PJ05k+LlLaX
         mmAg==
X-Forwarded-Encrypted: i=1; AKwUvBxfOGDus7uo4BsMV1jS1i2ag2RSlFpFRe5j6oEiN/2AU77j9p/ofTX9vN1iKGRtrnLgN8vRD4ynw1qoRic=@vger.kernel.org
X-Gm-Message-State: AFuF++n2tAVoc2a68risx+L98BcCzB1Cgm6Z1FxR3DLUpHkEqby0fVDS
	TkvY+1yxZvEFXjnAPFXWUWMD+txcV8xeocn4lHHZ4uW6SBrRroI0EH38bjqND2s3BA0RIxeYBp4
	2Qg2zgO6Gcwn3x89MkL0xLMonfNJ9cygzM21UX6UMvF+I5IPMwx+Av0r8Z3Y=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:4df8:b0:6a0:f44b:1265 with SMTP id
 006d021491bc7-6d18d613260mr1310565eaf.4.1790060221852; Mon, 21 Sep 2026
 23:57:01 -0700 (PDT)
Date: Mon, 21 Sep 2026 23:57:01 -0700
In-Reply-To: <b91ecde2db1cf37b070e3a7ef960d43bedce8873.1790058978.git.xiaopei01@kylinos.cn>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ab226bd.3179f8cd.1e36b2.0027.GAE@google.com>
Subject: Re: [syzbot] [comedi?] UBSAN: shift-out-of-bounds in dt2811_attach
From: syzbot <syzbot+a4cedab706d0a8a3f988@syzkaller.appspotmail.com>
To: abbotti@mev.co.uk, hsweeten@visionengravers.com, 
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com, 
	xiaopei01@kylinos.cn
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+a4cedab706d0a8a3f988@syzkaller.appspotmail.com
Tested-by: syzbot+a4cedab706d0a8a3f988@syzkaller.appspotmail.com

Tested on:

commit:         f0100363 Merge tag 'xfs-fixes-7.3-rc5' of gitolite.ker..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=13e6f45e580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=7d012d9c67977ee4
dashboard link: https://syzkaller.appspot.com/bug?extid=a4cedab706d0a8a3f988
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=16dfea71580000

Note: testing is done by a robot and is best-effort only.
