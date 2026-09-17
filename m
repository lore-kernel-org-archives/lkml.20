Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3C1390CB8
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 02:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789613297; cv=none; b=bCrbT2M9y8L8Iaf5h203h3ZDnvkFhzvUrMyGOCEi9u/R821ovvFLRTf+EovTEZOgH85nkPY25Algh18XKQhR7YNsXP/5vu9XUd1ViFteDNLSf7yKMnhQTYBGWVQOHBA+d8OEnSh4gKpd8I5oinG3CWbJzXaJN7gwwf9xjaFhl50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789613297; c=relaxed/simple;
	bh=ETm9f82XA4KM83RzXe9GKLCHbjkw7eM8w2ALr78SYTI=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=SrqrkTXxgZ9P3U7l6Y+1ONNjsqLqVfDQS37ZHtOB1if53uTk9UiIXu1HIs8NXvIcF+V81yuarRVdonX3kxqvpl1bZ0I+OduLiWqs5wXj+uq91C0cpasP2noliBsUzXo5Me4Xnuf0NRk0KMESqViC2BwzvIPiYzqQ69YjKZH8eaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6c879132577so303821eaf.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 19:48:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789613282; x=1790218082;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=a4eBGDyXWDHivu2ZaLEBDjiciPPXMe5wJ+bD7gvbVg4=;
        b=qCp2zXPERnsI3nSgMZTjpy5/mjCueY9fAKchCoB25lzI32vOvrrbXlckeX0Ab2HYAO
         IzGpgZ9kfuDavPSGMuTB8MD538C2KXoh6e6vwuBsp8oOht3Wrsjy+RCVZboZHVQQHccL
         RUWI0tu77Qh+N1bGbNWKFPaObP2dfmbS3yp6q3ZlVi6nf0gIFBMTE6GEZ0x5KFLkrlIG
         ISmZxY9LdNI9Ko3r7HHFyc32HVK09p5sTmHOgOTNxSuxVmgGWOLixSExvJQhtKbSGjfO
         xmxx7+Lc2nQfAz+jb9lr3EOfQETfduyjzy14g9bKZtaDNIGiQ/TZVJXmh//Xr07yhBl2
         QZ+g==
X-Gm-Message-State: AFuF++nsgWWA1C4qzuaAV/k3Kw8Eo5sHQtrLtHiwOwveDibj1hAxe+Bl
	k7PVYFK8V+IPsHQ/zBbrZr6ch/7XjU7RiSYRqd4/+67nJ0tvvbS8Ig+YvaT9btcxE7ml/srU8Ij
	EgT4SilmxWKSQcyaFfiDzTCu4HAxNMMz2hejLBlvG5Due9XLhxvPC0WDHpIo=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:f02c:b0:6b1:42ab:d040 with SMTP id
 006d021491bc7-6c7d22dcbdemr4856537eaf.28.1789613282009; Wed, 16 Sep 2026
 19:48:02 -0700 (PDT)
Date: Wed, 16 Sep 2026 19:48:01 -0700
In-Reply-To: <CAFJkwZxO+=cYaCFSAEejhBgJeiJczxuua1y0+Dcs1Fj5Sg_vaw@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aab54e1.b398a7c9.1f86be.000c.GAE@google.com>
Subject: Re: [syzbot] [ecryptfs?] KASAN: slab-out-of-bounds Read in ecryptfs_verify_auth_tok_from_key
From: syzbot <syzbot+b9529ebe6a9394ddf825@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, neganhat@gmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

failed to apply patch:
error: corrupt patch at line 4



Tested on:

commit:         238650ef Merge tag 'powerpc-7.3-4' of git://git.kernel..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=e909ffe6b35dddb7
dashboard link: https://syzkaller.appspot.com/bug?extid=b9529ebe6a9394ddf825
compiler:       
patch:          https://syzkaller.appspot.com/x/patch.diff?x=103258c9580000

