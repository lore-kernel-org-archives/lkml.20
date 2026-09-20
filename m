Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F65632AABD
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 14:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789915747; cv=none; b=HvxTg2BogWzD9zntPeHAQbwrgshaKKKxy03s2Lusa0bAj/vnyPi6jZWpI3iI1UGB7bVcAH/a5Rgr/LSR+72NlXwTmW3k/M8XXu/WbzWTDHiSurepsIZlWhEcVhu2ZY+asICyZWIhPZKoJyT7KZGJSxWVg6jKyWZZyimPA1bB2hQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789915747; c=relaxed/simple;
	bh=EUiRrRIO16BfG6lbYrsKgQuGLWI79uoI2MtdoVQgqmU=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=SCNKCd8yDauSWpWtX6XKs5GJ+crsSUkk6cB4IgfEfA0qVL0x6Msxf77+wd2bB3c4RtRTpa/m+LusC+8tiHhdOlUx9K7C8m0VMwHcRZZW9U/vk1oa6P4i0zb4B0J3TKA0Wk38G6wAi5hCb6EuNVkeZ1IsQt1ZzC4j3eLqvOvhS10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-6c27804563dso3805301eaf.2
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 07:49:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789915744; x=1790520544;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EUiRrRIO16BfG6lbYrsKgQuGLWI79uoI2MtdoVQgqmU=;
        b=KHXm5T65/xlypExk4aq2rVAbpgmLklCNPOg87be82dtHVJcZH+EEEAnuHfky7zxHhB
         hSYrMQKLM4dZypqmpc9XrHBzfJLpZdANujYiQ+x06Our1FhLTNEgnXHtAcekqFX/byhv
         n7NXvTEjiuD6Yjwq0Rjfw7WJ8oXrqJWHqrcOYELEDCEmae9BbYab98HLpFNyvoQZCdwp
         7Rny3fas+WJ0MAlNDwnogOcrOouKWgen/KBPXY4l8hLU7UYEgev+p0MLxKkyxuVRGauD
         D1Zh1I0T4VKCJuBPnsfusLbMnDCstaw5apk9GkA6k24F00wmuqlVj61DxnzE9Vn1ep9E
         bI8g==
X-Gm-Message-State: AFuF++mVx+8MCfsMwqK0GP2GiMwq8r7gU3Siv8IVWUAO05qqcnu2VKH2
	gRSQSts4tL/HTRmJnOBiyqqSZ/UFCh9Rd3yQJxB39UJHiNfIu98L0+0O9dforIabg+eWydV8GYJ
	M8w5zeCS35wM87tMDX0iySq7tJA0jk5vclmVYLw0sYXDGn6MRGUtRddAYZf4=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:709a:20b0:6cd:3fcc:96db with SMTP id
 006d021491bc7-6cd3fdbde47mr3030303eaf.89.1789915744431; Sun, 20 Sep 2026
 07:49:04 -0700 (PDT)
Date: Sun, 20 Sep 2026 07:49:04 -0700
In-Reply-To: <6a73bd06.5aeeccc9.207e63.0006.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aaff260.3179f8cd.1e36b2.0013.GAE@google.com>
Subject: Forwarded: Re: [syzbot] [usb?] BUG: sleeping function called from
 invalid context in cancel_delayed_work_sync
From: syzbot <syzbot+1ee4f3b9228e35f14677@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: Re: [syzbot] [usb?] BUG: sleeping function called from invalid context in cancel_delayed_work_sync
Author: penguin-kernel@i-love.sakura.ne.jp

#syz fix: mmc: vub300: Remove the driver for the obsolete HW

