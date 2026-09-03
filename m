Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 668F63803F1
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 07:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788418870; cv=none; b=PA5YeIdfgSQqQ4hXxSBED3uzlo/cyOMvmvynKkgv/bIdt36FgTQkt/TM0ymCPKyUAsJkcdGtdVqZnFiVCqFu3UVvt2TFiuCA5hCrABz5I97vXfHF5gnB1LWNb9n0xIoT1RVT26oNCStgeI4AOViOqWD97iDAZsRjeinwe/GZQTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788418870; c=relaxed/simple;
	bh=H3j+aa3b4VSeroird65KyWfqNS3LX+l4/bZnRmMqUaA=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=JznMU7HVY7Y4IEUUhgLWe5ofiD6MnRSfrp41KXOgPmLGLhpJmiUjnp1yFh1aId9cVFXgpbZqUaZsT4IYwDyAxyGRczfZiUA0P3OBP9X0bKe+sN7C4TUaArGxMuJjnm5Oyl73MjWkqjr4XfRQ48mkj/wdnEXwGg7MJQCwI/XbQf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4b37733badcso2670522b6e.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 00:01:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788418864; x=1789023664;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KM9hpns+6dVqH1JEmnHwwgkp02V9J8JMlo4+iX+Xt7s=;
        b=LQX0qo5I5tJk0ncspcxYnctaevnsixAcW4OqZxIaglDjZ1Vk0UsvWoB7grHrFhwpHX
         bAKaDT5NKk1IpasUCJFPk5wq63jinBP4wyoB3IDj0k7pTLO6QxZu0T9sY8u0+b1d8SKR
         SF/3I75A/e8iYYoF9veceBjkJ8+N2J3x8EY30y1gVnNs7PWB4uRv9C9DwAe8jMDZ7h8S
         RAssBWKy5hNbAeNg8J/bpZOe6cuY+0z9budkeZPdTblKqc+IKxUQ4IX1p0Aa/RAgn/Qb
         PfXv4nwa/jGE3DliMwPnJdzqiURcHDxpwHIq6K9FGIiW6UXSZ3thI2F+8I+ss7UGkN0F
         StJA==
X-Forwarded-Encrypted: i=1; AKwUvByBJV4/Y9R/AwL98PNHJAUcN5/hS1JKybgpNgrs/iq0WwuKZyIx1q4APPQ2+cyv70SpYT+a6oYIWM3Un1k=@vger.kernel.org
X-Gm-Message-State: AFuF++nXTDLME/3sA5NB2L4O0GEK4WTT8gjhSsySYE5jusDTSdqpNGe6
	uIa0jRvhIrXd8b4blRKGC/FaPYXXQozkwPBuG0tYC1v0n0lXQ2zQmkSO60/Uo4IhR5TE9nix1O+
	sL2+rZ+LxUZzyW9i9DDW4Bap9GHyj9PtMZAFPX4m4A21j7IQDgNZSe08TdDE=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a4a:e90a:0:b0:6b1:a5c7:58ff with SMTP id
 006d021491bc7-6b47efddd71mr8852323eaf.26.1788418864029; Thu, 03 Sep 2026
 00:01:04 -0700 (PDT)
Date: Thu, 03 Sep 2026 00:01:04 -0700
In-Reply-To: <CAEe5be5eVOiD2fQwwqumNhpUORUABt07oFPzD9sh01sQ14iPDg@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a991b30.9266084e.bf0d7.00bf.GAE@google.com>
Subject: Re: [syzbot] [usb?] general protection fault in bus_remove_device
From: syzbot <syzbot+87188222c77c0dbbdb4d@syzkaller.appspotmail.com>
To: khiemtranzo532001@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

failed to apply patch:
error: corrupt patch at line 30



Tested on:

commit:         940de590 Merge tag 'hardening-v7.3-rc2' of git://git.k..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=1d67342c314f228d
dashboard link: https://syzkaller.appspot.com/bug?extid=87188222c77c0dbbdb4d
compiler:       
patch:          https://syzkaller.appspot.com/x/patch.diff?x=10707c15580000

