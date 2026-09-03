Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEEBB3FC5C9
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 07:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788419046; cv=none; b=dmKSQ3zkBjf+UZIOVMsgbYQew2rerMAe/aAuStIqPqstzCtIrGV0ywC4pEOp0p2QwOoedRir8tphijDGYcBeBYU8HwKMEvz65bC2b7gxs1BSk/x16DYB6I9dLYMX3POcauFprE8sUmSppe/8LQpD5K+yNT33C4rJKbsOb4cEz+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788419046; c=relaxed/simple;
	bh=BRE1/rnZ8b7H2gWywpLpQBA2M1FJzaNFurI+FCIR/mo=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=vFlQLyH0wJrvBgswodviBstAUOQXMpc22zrDY7+HpIaNzZc50+u+m7Z+n2Sy3fNynFSrlFN+ugrEywNSlfJ4H84mdtRTnwRFnoCHKFekVXDkrHd/FmHt2B7djq+NcDJKI8tEmLN1HYHNNcdjQ1oJa8u2OZs1rHLQUmw0hzAGaW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.160.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-4574f1cac98so3454851fac.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 00:04:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788419043; x=1789023843;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8mvY8ViBmIg8a+jKAMb8MZpaRXkydnbEBlmHVCZdLoc=;
        b=Ohr79ki6leBDrLs1yaB+tIGRsuOZ31mTfLjbOx7VtPcTamZjPvQNtwd6r8z8QlzjJY
         R5sv3qlwfhmZ/gKBkRuj2GqcdJ9F1gjEtbT+Pzv2Xc5B4dX9UjXrcJAlgDIyZICAaIiS
         g1ISXHIRt6yXA5UtBqh/tYahK1+tLKgtsl1kFMQT2x0fObWyYX5WN/3dVEijUs++6R6X
         MOfJwajz4LNBddLeTpkhJWIJh9yuYHqGYVCYHy7P1akvVpNbxw3w66UBDVzdYvuNWAke
         vK1TfHoohGrZehnxETDSscedi/XqL7wuj9aeKjaeLI0K3z4W7H+KWfA+QwPn02i6pxzn
         fLzg==
X-Forwarded-Encrypted: i=1; AKwUvBxQLjL4TgHmJap2MJeDpTVuQS6Zcn5CqHKT7GRbhTPo57JG0SqL1SHeuh7bmEebvL6dVKJmm6ms67MkkG0=@vger.kernel.org
X-Gm-Message-State: AFuF++lETtqUSdtjkzSRsb2x7TMSVh49/ZjDYGoXI4Yb9ZDF+LU0pZWM
	RjN3IYhuLKAaPflUBtFx5NteuDtzvPuifd6RElGPW8ajbn/5lp8J3FPCZhpWm2L++2J7AX+jR0V
	v8K0ruhwbRmFIXpehbPxkvrDnkfDnXmAfDum4cf5W7FfNpzVn9UdwzDlaz7c=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:81c5:b0:6b4:6459:9237 with SMTP id
 006d021491bc7-6b47f714e28mr8349539eaf.9.1788419043363; Thu, 03 Sep 2026
 00:04:03 -0700 (PDT)
Date: Thu, 03 Sep 2026 00:04:03 -0700
In-Reply-To: <CAEe5be5Qvbwf7wQPsv-HSpekx2N7rc-uvHqu_+7uHtb5xSVOOw@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a991be3.9266084e.bf0d7.00c0.GAE@google.com>
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
patch:          https://syzkaller.appspot.com/x/patch.diff?x=14d470f9580000

