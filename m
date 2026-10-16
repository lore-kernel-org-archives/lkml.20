Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87F7A35CB6B
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 11:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792148815; cv=none; b=LaWpFFkSwQ4Dx6IvIGRj3hHlacdi80s0Ja7iB0VfjrwVyILlMFOiT2iUGUkfcS2EdyDIwvHD7HpmelDCH4n047qFkvH/UNHMlipBhCnRGs7WYnB+i0/O2JjCG+p1vvtCUSrCMPW5LtEaO7fRRyciKAq/zvkT53Rg5Ls8h0GPQ3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792148815; c=relaxed/simple;
	bh=yi97y9iMsoBCBxaYlJ1ULX/5lb+Nve0EV39rznyVzm0=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=hcHwylrNHXL8MZAi6bsCttiKqEJts5bw5LiZUUFx0aTXDrjLa9gLY5LASf4xRGhJYfigmiB5UFGdFax4ge896iLT3szn9DCC6r2gsxkEz6A1dzyEgDArIOOZ3CpgsusH/UIdVisAPAW2yf+9kLyjHkhR56AhUmSo2butk8aBvZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4a45b3f0bdfso3646739b6e.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 04:06:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792148813; x=1792753613;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yi97y9iMsoBCBxaYlJ1ULX/5lb+Nve0EV39rznyVzm0=;
        b=OqFoa3Af6jvvAuOoa/YTE8Pz/maGGmU+L13OmqMnJDDxN1O2bIv5YUgEN5lfjWypMU
         qIkfzcKHVtvx5SBnRZDfOkHuWxJBOKRP73/0+MoiCRqWuHyUZOPyyLA3stnXjDk5zaqE
         T7+oFI69+NgscplupTwBTe15qPa8xXkp+7rnKgoGi2SjzjWb+/5I1/byteyav9dSD8ST
         RopZZTZ1RYMnIXTJk+X8+lsgxnOeYnbTpushXZ+gRFPytn/K8X1rKBAS5NG7AE3h17IS
         nfmbohFLjW1LcLF2eyk+9ZhLedY0HybNCTL0t3VvFlYMFXHlYwGG6J4NJVpeBDE7eFLW
         ePYw==
X-Gm-Message-State: AFq9FYJx4ROfIXlXWwkcEmCfzyWsz+Y7W8vB3BgizDYx5XRxK3YSPeIP
	mxZgvXC0dic3SdaLopmSTDNxohXEwzt/gbtIWCe0BKhG/gxATshRljCZirOn56IAAPhdzY7XzMp
	DMZMDha7ZmSg7tp6knWG0kBFDEfD5OaBHBn5HIGzNe0ASfXbA4OfJOSeoAjM=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6809:c1:10b0:50c:8007:8ef2 with SMTP id
 5614622812f47-50c800790b7mr13187525b6e.68.1792148813522; Fri, 16 Oct 2026
 04:06:53 -0700 (PDT)
Date: Fri, 16 Oct 2026 04:06:53 -0700
In-Reply-To: <6a987197.9266084e.bf0d7.000d.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ad2054d.7514cce4.1ece07.014f.GAE@google.com>
Subject: Forwarded: #syz test https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git
 for-7.4/roccat
From: syzbot <syzbot+c492a9e154f81127551f@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: #syz test https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git for-7.4/roccat
Author: dmantipov@yandex.ru

#syz test https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git for-7.4/roccat
