Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DA72255F2D
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 04:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788667445; cv=none; b=Zi2HfMSTyVCsw5YwAEEdbqxy0NzXFI21rDXAXIrFPd12GSGxk9lKEhe+A1WDO2Q/O3QvbwgwgeaxYPRrv2hflMGTSbAPU6SWsMBtN76qlzwjs80RW7ypKThiaT+0gBI9YPeo1e+F+MKSTZviD08/1Vo3E7JND6QahF4Uvw6xHy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788667445; c=relaxed/simple;
	bh=/BkRM+kd3UH6ADUy1SCmqHezpLUvPqidAL20WhD8qJY=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=sRhBDCY0sFrMI4dmeZHQ8rbB5JIhK4cbtVRSlxf2jlCcAgqFuzobsGk2Q8FtIOW2930mp0hB6WXwCyNZKrfLCYj+3g4iHH3EAjBadkKCArj0GI8fO3hfu46INLCZqvLcYiQlwYBDQj37sCetKGa689E974ix3aF3J9ZIacN4wVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7e7624e584dso3304548a34.2
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 21:04:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788667443; x=1789272243;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0JDADGVkVCAm4c1zBv1Yj2Z385AGCyEpyhQ3VS/GZzs=;
        b=JqZ2EBul+MSaIxiyvHNA1zBHAgFou6apAitb4+gMfqRB6P8YVq7JFz5w8N29etNTtP
         RRQ/Ou0AMSYUNVtD0jUGWOtKL/2HV7eG4tABn11p/rgFniFq/sON6OdRiKBnnoz1oMEI
         9Hjow51sp3CWydb8kUzu/kf/eChhBwa6XVSz16Yuwq6qeWu3CPaiZpUavqBhDSF3VoYt
         OoQvUjguTF2nFHkBFQCsmU0oxH8w15hiTZCvarzHSRtolhIZj6/4QqzLrBaoP61jXq8y
         sIU95x6FpL3bhIpev/OCR2oNE5GjnrhsR4PEE6jPxO/BHmf2nns63REgRqjG/z5unxRR
         +KqQ==
X-Forwarded-Encrypted: i=1; AKwUvBzB+JFdVCymVYgb0aEpkxs7RNaCgze+X59FXysmS3S2QTwHkjxAOi7JArY5k984irYTp4PEjP31koWsDdE=@vger.kernel.org
X-Gm-Message-State: AFuF++kLowjPi6noCJVj8dLGVBwO8/NYCBh9g7evnbEZm2sxg9HCLoNP
	TVrzh+lhut1oNzNSu0dDeKx8hdAOzOpVjc6Do2vx9wP3Y8W8oQQqe6ZAYAH09IdvTzMn1Soru9K
	MGZyv0FQurdp0c6qtmpsA4WhdtWhxV1pDU4yHcPnewsZKs3QykUos62K0UBY=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:1501:b0:6b1:5c8b:c0b9 with SMTP id
 006d021491bc7-6b6fabe21b9mr10217761eaf.3.1788667443199; Sat, 05 Sep 2026
 21:04:03 -0700 (PDT)
Date: Sat, 05 Sep 2026 21:04:03 -0700
In-Reply-To: <20260906033822.19429-1-kartikey406@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a9ce633.0a3344eb.391530.0017.GAE@google.com>
Subject: Re: [syzbot] [usb?] [nfc?] KASAN: use-after-free Read in pn533_acr122_is_rx_frame_valid
From: syzbot <syzbot+1853daab1a47603d4678@syzkaller.appspotmail.com>
To: kartikey406@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+1853daab1a47603d4678@syzkaller.appspotmail.com
Tested-by: syzbot+1853daab1a47603d4678@syzkaller.appspotmail.com

Tested on:

commit:         edc15184 usb: typec: hd3ss3220: Add support for supply..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
console output: https://syzkaller.appspot.com/x/log.txt?x=12e17cf9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=c451f9f64434b622
dashboard link: https://syzkaller.appspot.com/bug?extid=1853daab1a47603d4678
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=179e7cf9580000

Note: testing is done by a robot and is best-effort only.
