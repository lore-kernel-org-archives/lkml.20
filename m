Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17A5B1429D
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 02:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788833464; cv=none; b=GbI6aitMFQT/y7/iKTDLzI7N8qmuHJyp+Y/eRE5ficak+htjht31qcKKtYJki1tlUD6pwZjyOoRRf8hcqKKGHe357JZ30PrrcnVTfaD3sRtzkdjTkscyv1MEAQts82DUxhxw3MApMofzU8xBVq8uF2OTktIrVX3uNI1F50wAR+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788833464; c=relaxed/simple;
	bh=RL0hxNk+y0NTsZRnf1PnN31NJ4E1FfU1If0a5HKGRsE=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=dJi6B5WEMbxI3ho+XqrUvvAhs8AOVrdliI0N4XRFz1eAXqXvO+PhJJt8K1f2lrtOpj4fYzb7wkhiZB/upBVtLHSZCh4sGlN4B2DTwUX1brkIJ2Hfv0H7dcCQyyho0K5w4b4tCiUdyEyGVtyVVNc9Ztux5OAPSmIOYdE5AcdMHJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7f4e52682f0so5918645a34.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 19:11:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788833462; x=1789438262;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=q1WAxDDzROSwhWAGOhWN4A+5Yrco7BHkgNl3aTmG7mY=;
        b=SKJvcKhfAjwF8czICSrSGtPQc8SVgaX7DrFXI0omWAOJrRF0+yWU4q9c9vjp3HZ1bS
         2hFUelZpIJJSZn1N6s3dxjS8WwUjjmjo4vbuQSZC+YcxIY3dWmsfhIaDwWb4DBEqnlGH
         UOxT6+ovKztVEGdSBDKeaKk1Ru5RNBwDwLE2Xwmcwf8KcD+TUhRmBI0GT9PSFT1shQiL
         Aa/TWpyg2VYLc6mvnX5nQPdURxypJ6kuIHAxdLxgbyeqyoJm/tdbAN0W5dPuPy9KQiN9
         FOHAn5WAaX3Ofj3pfG0SktBp4V8uBBgLeNMSMh0B8bvTDvZGlyib/CIENPOI2BAn1hZ9
         FpGA==
X-Forwarded-Encrypted: i=1; AKwUvByRNXfpeqeajPSde+6rEx6u4bygw7btrHLhUeT01zVZcJ77ShzkXzf+0ykn/dbJ8XFGFKHjeK55f3IJ1ZY=@vger.kernel.org
X-Gm-Message-State: AFuF++l+q5F20laTIKzVUzynAcZdhIseCSeNDwfXd04iVQ6TlDgiG7yc
	d1D66Ez/qIC+q5lx2lBAH0VGZV/HXNx5Fg0qKs7irrrFjdyeWN7/vCYzV9oMkoiG4xw2h4HyHIz
	A+ohOuxkTy6x4W5md35SVstaiRNsnfzvNmvSPnP/kWwiSFjueuikrRRS0m2w=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:162b:b0:6b7:46fc:1cf with SMTP id
 006d021491bc7-6b746fc2ed1mr13218870eaf.46.1788833461999; Mon, 07 Sep 2026
 19:11:01 -0700 (PDT)
Date: Mon, 07 Sep 2026 19:11:01 -0700
In-Reply-To: <CABm9WX4MT+2K-8d0-9ECJpkqVZiPyAi5-W43xJyZ5dM5ddavsQ@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a9f6eb5.6e6c5f9e.28f11f.0006.GAE@google.com>
Subject: Re: [syzbot] [usb?] WARNING in cx231xx_send_vendor_cmd/usb_submit_urb
From: syzbot <syzbot+ddccc0c0dbc0a38ffccb@syzkaller.appspotmail.com>
To: jcperdomo100@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+ddccc0c0dbc0a38ffccb@syzkaller.appspotmail.com
Tested-by: syzbot+ddccc0c0dbc0a38ffccb@syzkaller.appspotmail.com

Tested on:

commit:         df290809 Linux 7.3-rc2
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=1123f105580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=5e4e3a0e188a497e
dashboard link: https://syzkaller.appspot.com/bug?extid=ddccc0c0dbc0a38ffccb
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1003caf9580000

Note: testing is done by a robot and is best-effort only.
