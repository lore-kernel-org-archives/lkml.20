Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C28923EFFC4
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 13:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787922184; cv=none; b=V2PeJ5KD0qrgUkERR6o5IMpUxNziVl9vJvEtdGtJRlYY9rXjGNCMQsZ9SihkRTnrgr1Go6gBEMpNkM3BY9Luiz/Mz8IUzgH3+k1Ww/nnGYTKPJVDgwadDc8eJFSPdNaUseReQmJq2ZjfI6jMfZa56iVFgq5HY0ISr38G8ZXBY40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787922184; c=relaxed/simple;
	bh=S4rboNO+q6j2VJ4KINfATehzyfJMgoKoNZ2n1Pmg+YY=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=B5AVghdq3+/in91R9NKJT9WV+V6YVrC9tH/bHwnfE96hNAKyeMTq1djdE/Q1kPBkAGdqryB4/Zylo9VDU62sjbfS8N8+Z9MAYx60PdTKMA3G/0mXz0bkK9hhmxhq+PRxvyMM5YB9Ik5UH9sPXIjNVe+PptUOqxWG77jSmJp7EnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4b2fb8f0df0so1669250b6e.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 06:03:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787922181; x=1788526981;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DUwTClSJIxNiO4Y6nStQjQJsV6dp/Zx6F2ILQGd9KGg=;
        b=eEzsZccW2R0Dfk6Zo7H/3dKQ8NyUp5bmRiaFVR9a+YscNUnQsraUSZ2vd1kHabQvbJ
         AWCrIlO4gL4SN/rIuxDEAPXL3GChACFmvJjcyOvnBsAvnm0U6+bsM4DvrZHR6lEkNdLV
         IZmLLalkxsdlV3YUey3+vcd9gq7zdDG8M8+3/uF8dSMvZMgtm/XCeP1l8EaopUXvk+jY
         225P/78y8TVoGrfTFMV5OIV3/aNZUrPwpsEgPdF7ziNmSL+5OEOAzhG291BkPYXJQ26z
         Ev/1rUG10CnAksmeJb08nXMjK+OgEGX+ANkNF2P8vKNdczLHi8ntagb4LgxGyNp922n/
         +hYg==
X-Forwarded-Encrypted: i=1; AHgh+RqQ1QVylXj/Vy3pF/dGjaZRsV7BUt3/dPMyKzo8ME40WgFuAC71wnXyDGwFKAJGX65u+QG3vWyL5FSOjWU=@vger.kernel.org
X-Gm-Message-State: AFuF++mfKbRWyNg4AIQP1dr1oZLt+52OsC2XIlAuYXBP3Nvbay6d3koA
	b5eYeeQl+huMbEQ7ZjaBVztScR1Nku2awd9AHXRrZcKu3gukV9xFpQp/OK34zuI81q+bFBIelZn
	Q45BXmtDUOCavoOZswbPxJG3M8mxIZm9fM3SkIxfySI3zLddaglWQ4wwlqto=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1488:b0:4b3:7d74:b33e with SMTP id
 5614622812f47-4b3984506e8mr6840496b6e.17.1787922181759; Fri, 28 Aug 2026
 06:03:01 -0700 (PDT)
Date: Fri, 28 Aug 2026 06:03:01 -0700
In-Reply-To: <20260828125430.11470-1-jeffinphilip14@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a918705.1d9ded08.62e62.00ec.GAE@google.com>
Subject: Re: [syzbot] [input?] KASAN: slab-use-after-free Read in atkbd_set_repeat_rate
From: syzbot <syzbot+1e2ef9bcb29af666b2e6@syzkaller.appspotmail.com>
To: dmitry.torokhov@gmail.com, jeffinphilip14@gmail.com, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

drivers/input/keyboard/atkbd.c:709:27: error: incompatible type for argument 1 of 'class_mutex_constructor'
drivers/input/keyboard/atkbd.c:709:9: error: aggregate value used where an integer was expected


Tested on:

commit:         818bebeb drm/xe: Don't hand out the flat CCS storage a..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
kernel config:  https://syzkaller.appspot.com/x/.config?x=ccca94d2c01b9e78
dashboard link: https://syzkaller.appspot.com/bug?extid=1e2ef9bcb29af666b2e6
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=107bdd49580000

