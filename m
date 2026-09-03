Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E95CB3F164C
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 06:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788417547; cv=none; b=ib39qzHU5pDVv5t9FXq/KQEeC4ayhNXZFuv31FeHqhaT+V48SRu/qxEK9QtExN8S/22kaIzMrKSdWVv8VZnfTOKR4XKOEBG9nK8lDamx7Y2khLrZlwQEUbrFtirOnCGEx6m194A7pBw7xpnJwE+bKGBeGOkiDg+EUSQgE7fU2TU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788417547; c=relaxed/simple;
	bh=2BxCYE50URJ+FIlpX5GsIGusNfHLMTizryhoXsf6OuI=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=cOANpWFZ6K/nhfiamWbonYAFTde9ZItsIa7IHuTSGW7F2ZPtbehWXw6maWk6NDK5SbTnLzRWac46NaTPXwNtrJ6bjlP1pMwg4IrL4cL/yFYtFixBZUH/FxqK4p+NnCteMUJxMWEr99+Jd6uEI3S3+xzJy2RGCFhFB+pRec0lOV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4ab260600easo892972b6e.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 23:39:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788417542; x=1789022342;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8FYnd6Sq5IJpjSGenM4hDPw04zrcFi0BIGKfctg4JIM=;
        b=bzFwvlN+NsazQFW9mQaNI2oL6/sG0TfgxzMtzC3DPWJjzVUg74aOGnqOzW7kVFQ/um
         3yY8DTv8D2KvKLmpJh7hopih6ssPpwPhdeBbJXgDmISAnvjl1BQFViOa6numGD2yaR+v
         ImNgu6IYZlD63bbITHp/6wseFczmckCHZjYFzATwoXD/Bw9lW9Q5q6zC6VadbuVnbg40
         OPpRsb/6MHD5qrpRK5LcJjMkdBdgjHaP7Pnalnr7XQWUwQuAfqVsT02H/YciQO5zNxAe
         NxFMR0XTK0oitt0Min67lbR2leY88XhjBdJZ2gbEp1IEIpofDmVGuGF4g9FQJaCkl8sZ
         pFJg==
X-Forwarded-Encrypted: i=1; AKwUvBw//4XP9buNep4FYyRrSFLaPPVVYaq27IAOUJ9S3cCSEx3zaT/ZnqxJ+H8uapJR8PmDNim2jsGmaI+rS2k=@vger.kernel.org
X-Gm-Message-State: AFuF++lhbOJN4FFBzyYXuOPn3ZYg+HJJQ0CHBxIl1l170ziS6AY6DCjP
	qdTg52xizaysQduO0lEudvvziP5UT/HKzTJw3nALCrdl+1EXNgKQUSSKgttlK3Hi/FAH7kyEdM8
	os4zkOX8L/mTXkbVproKLJuy2YSxH4fM7GsiJHekCK5Tn37mXRkW/QbG/EUE=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:8108:b0:6b5:ec2f:356d with SMTP id
 006d021491bc7-6b5ec2f373bmr670096eaf.30.1788417542318; Wed, 02 Sep 2026
 23:39:02 -0700 (PDT)
Date: Wed, 02 Sep 2026 23:39:02 -0700
In-Reply-To: <CAEe5be63fHrmNTWcy05URGv_vSkeETdny3h29m=uEGtTLc0uYw@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a991606.9266084e.bf0d7.00a5.GAE@google.com>
Subject: Re: [syzbot] [usb?] general protection fault in bus_remove_device
From: syzbot <syzbot+87188222c77c0dbbdb4d@syzkaller.appspotmail.com>
To: khiemtranzo532001@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

failed to apply patch:
error: corrupt patch at line 6



Tested on:

commit:         940de590 Merge tag 'hardening-v7.3-rc2' of git://git.k..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=1d67342c314f228d
dashboard link: https://syzkaller.appspot.com/bug?extid=87188222c77c0dbbdb4d
compiler:       
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1199c125580000

