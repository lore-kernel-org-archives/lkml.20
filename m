Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11D712701D9
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 02:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787796725; cv=none; b=Jd9bqkCAFWQADv9IvtA2k8dq1p+jygUYJddjEZO51HVA6vFKYgBVlefpPoT3hdpXknO7pvHvveKy8QJgKcSrN93Y/1YG59bsp7gGyOYH0HfYj9B7xMI63msrx5ZH7GnOppcptMPHZ3ghKeG3Enjcr7TMuZbv38vB6vtZF5EJuMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787796725; c=relaxed/simple;
	bh=6XFLlRwnfy4QaqJaVKIIRjtHlyCVNVdW0UD+WKwk2r8=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=D0lxvqI9BBhaXUSbMEgvM5/BjZhbAE+oLBhaCAriyIn2S3NDq5kMNo8WY6CGDnnPonRjLpEgGxduHDVEeguUJVnL98Ia1HXcF8k8/R8p/b0gaycvWXHmDekvIw/BB97obYMWm7h4B449V/W50vqat+hjfCamoEKqMJZ/jq67Ws0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4b19ce23e5cso217696b6e.1
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 19:12:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787796723; x=1788401523;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lLLLTixlifQgkFEgUMcS3ETtALUr1Ua0vaEcgqyKMyg=;
        b=grUtP/6nRxXKrADfUKWo3tCSUYxFM+R+a+wbLM6KMo16Y7zMjXJ1ZrIu3qXiI3FO2z
         tWw+rd1gqQg/+IlFRcEcB/xNtruJ0FWPdKI5Dkd5XpeT71dSM0ST04hUkPjaUE/zA6L1
         WcKMKmcIm6FmJRc7ItrxCk04HCDSOm67ba5JkNpySqA7cKskuKNqKj+D/iKmGbljEUcm
         e4Tpb5rS0KkUXewJM+EEJc64RHaGdWeHSmBk1Q82E3yrhQMtFfUEhHVQyKEc3aRZFDN6
         dAfQOzafdszPwhe+m/Eg9vqhTgQhah4pK/CQhevabs8BVrP67oh90Npj+ulrmWHl3PUV
         PE6Q==
X-Forwarded-Encrypted: i=1; AHgh+RoKqjcuJd0GUhmu6xRtbgKnqI15SU7zytc+Wd/andFbgremWz3FDoGBJKIfQsQ2+Mp31Siw4IOK9MRMo9Q=@vger.kernel.org
X-Gm-Message-State: AFuF++lCIKIL4DxhSGtMvZLbwPHkVzfScCFU1jMo89Bdv18ssxLgFgeA
	T3YQfB+acu5581v3iIIExvmdZ0MklgZHcO3OnahCBJPobnflMqkY6e2OkkjvMluWKlIvzFA1YCE
	lqUhAEN6tK+EgsBwooA9f+6BG0xaE5skuBAWzTLigCdpBWU/MIv7V4hZpiV0=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:5185:b0:4b2:67f1:11d7 with SMTP id
 5614622812f47-4b366b70521mr11931989b6e.17.1787796722964; Wed, 26 Aug 2026
 19:12:02 -0700 (PDT)
Date: Wed, 26 Aug 2026 19:12:02 -0700
In-Reply-To: <20260827002543.1744-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a8f9cf2.1d9ded08.62e62.00c4.GAE@google.com>
Subject: Re: [syzbot] [usb?] KASAN: slab-use-after-free Read in stub_rx_loop
From: syzbot <syzbot+06fa667a0931a3430026@syzkaller.appspotmail.com>
To: hdanton@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+06fa667a0931a3430026@syzkaller.appspotmail.com
Tested-by: syzbot+06fa667a0931a3430026@syzkaller.appspotmail.com

Tested on:

commit:         818bebeb drm/xe: Don't hand out the flat CCS storage a..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=167fe979580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ccca94d2c01b9e78
dashboard link: https://syzkaller.appspot.com/bug?extid=06fa667a0931a3430026
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1080b99e580000

Note: testing is done by a robot and is best-effort only.
