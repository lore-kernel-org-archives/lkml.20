Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C1C02D5C83
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 07:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788419286; cv=none; b=p4CUIVR75gjxzx8pLE0QcF0zRMJL94z8Qui3GEzakki24PI2xW5CabWyhWna87sxbVz1KHTTAHLoeBSPw4MdY5FgU9nqfKbZ4u3TQKiUAZSaci2+FG0St6T4fIpx/nU9ovlgpNS33+Pm8FFn8jWLjJFGdyW6htKOoqBkxCExK7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788419286; c=relaxed/simple;
	bh=HbGD4GcSM3VJdglurZbGZIS1RvdMuf3r082kc5Y2r90=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=HCzt+ETbWzJ5I0N39piZwH8fFzPa2TkFL0KzrZt1WkroookP7oCTZNMtJWkJnuRczevkhLKAZaaJ7AA8U6BFBgbto1qVtwSmT7vhNVnogfDqqCTs2XjNDvVXh44S0NdelKyPJx1L6UF8yw2EU7/ILqkdCbO/s9TTJ8S3dXoku/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7f4e98783d1so969654a34.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 00:08:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788419284; x=1789024084;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Kb/DAHgQ141rikFmtsuiLvQYPCihuZqhHL8eFFO6slI=;
        b=GTb2Xj87nF01MCDFWdQTFySEgC2VhydKpIVzcFJuhkXjCyDjJkwh3iApIb7x5f5whe
         6FR2/tHERKWiDp4TENz+VIYzHzeEx31QAPkrJRauzEP8pgQX9+v5umQpiDuAnGsYbXt9
         s139l+jRvR4Z5F5UvtPG6qrGeb4Z8DYzneiInmyFX3paMoHn7K1G5sUQ+7YwegV7zbWi
         IaX19l2/rdjBTUCLXkjPffPki7wuBZhSDhbXjyVq6Jc4W3azqOPwMWjvkDSQmHFFslU0
         PAMP7pRPUG8zWdf5qjn52dnOuGbkI9lDPdQAbJ1Ddnh3G0mlmB9qWiowNdqzufTPX4Ly
         jcyA==
X-Forwarded-Encrypted: i=1; AKwUvByGFSr0j7P1JIReDGVwGVC6kI+5OVL3u2/JtpEiew3lBZ7m+fYRFlbOcQp+FUnXxFWkKe0iCDQ3LJes52w=@vger.kernel.org
X-Gm-Message-State: AFuF++k4TRUn2z9JzFc6s5k8cr/opR7SoZtZl0cyeC77gVcBXSVGwUxQ
	0bATY/fvFq2bDqKcSCkzLEk2dAUGsaFbzbUihn+ilhU3ECjC958Ulb4T26dpV3BDIwNH6qhqZZu
	Q3gsIxU0zRgfN9Rg3l0ObMEX9h+WLsiPz57+v2duTZ9iqOQ1Zgds7+0U0EAU=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a4a:e909:0:b0:6b3:fe48:e95b with SMTP id
 006d021491bc7-6b48193f161mr8321926eaf.27.1788419284025; Thu, 03 Sep 2026
 00:08:04 -0700 (PDT)
Date: Thu, 03 Sep 2026 00:08:03 -0700
In-Reply-To: <20260903070605.102552-1-khiemtranzo532001@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a991cd3.2e567484.299ffc.0007.GAE@google.com>
Subject: Re: [syzbot] [usb?] general protection fault in bus_remove_device
From: syzbot <syzbot+87188222c77c0dbbdb4d@syzkaller.appspotmail.com>
To: khiemtranzo532001@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

failed to apply patch:
error: corrupt patch at line 77



Tested on:

commit:         940de590 Merge tag 'hardening-v7.3-rc2' of git://git.k..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=1d67342c314f228d
dashboard link: https://syzkaller.appspot.com/bug?extid=87188222c77c0dbbdb4d
compiler:       
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1325c125580000

