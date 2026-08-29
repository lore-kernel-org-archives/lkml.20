Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E213BED59
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 15:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788018976; cv=none; b=T/t/NHH/+RwSu7GZq7wMkgj+4c/6RVFKvQPhw5Ee7MCyJqBVPd3lfLSPnrcaSdRteUCh38Er+/srdSCA2BWBP5d7JmiQOuA+lY4Pcneou1iDmv3WGUXosfIJcByWoH4juem/TCDCnneX42VqmFv/kvaDCgnp0MK85GmJ4W+mlyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788018976; c=relaxed/simple;
	bh=IFKHfgVFc1rWdGFd6rVv2M1jw45BBFJD2+4hD2V0JLY=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=q1Hq42ZeZVNvjIZb1HsHukbo+w4cwmAG4Y60yFwjsM/c8jyVfNpZohwb7NLgC9GDmcJWmN6/bueHNuqIk1r4I7QFagyYF2LFviP89cL5wp405053fjctcJe1mlcH+st4YpXQxPkqrWUggrOE2T7WUeFXU3SAVRbhwG/2wB6def0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4b37620eb73so4659554b6e.1
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 08:56:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788018962; x=1788623762;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WXXv4xpnt1/RIHcZ+q2gQWeRw9AsLgQNjGhPdDBrae8=;
        b=gSZBhBdQVSh/KRI/BFUYegjq+6s5s2JhyLkvFuKhroH3fSfnADsYtqduSIv6eO7MIs
         muSGqCPIPd36TpSu2hjSXXbsSDdn87/reRNYKbyQwvj+NTfMzrwzzzM5OMvXlhRUIb/W
         wk2FstEZ44NTJBUw46EVSxH6XK8rNZ3v9ESsKFZSaY65zaFtK7xqtz913Is72UeAVPd5
         jv50vZhhglf6U35e9cvgqQr0p/10ZA4ENWMdlbLpxPrse3/z2I0jCS/b+JTQIP1kPQL6
         BqXg8VMSrmB9jhyPUp+Q68JUjXi+oUcduQ6dazWrawOSuLwZpsXiNsisRMCexKqZq5rz
         3Lmg==
X-Forwarded-Encrypted: i=1; AHgh+RrjrwfRbGGK2rYzzR1wAf3tp47g5nOQzRkWh3sewdcwLBpdoENxI73dZOtMt9ta7feIvvMdvCnASxTXlB0=@vger.kernel.org
X-Gm-Message-State: AFuF++lXI5wwVlU+6eZK5SZov7LMYmul4PLO7ntWnNvUihnitWod61F6
	9S5d+o7CG3N+RjngQmF0lx8s2mbIx4XYXTaDFvTPLPGyNiaqreiAAHI2ycMBHQ68Rc92KX220bU
	jcWfQBu0ZLNexrhhhZVLUb5PB0Z+W81c8GQ3tHKQbYxec2NKlwiUN62O4z10=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:6783:b0:496:11f1:f2ad with SMTP id
 5614622812f47-4b3980587b6mr16630161b6e.6.1788018962740; Sat, 29 Aug 2026
 08:56:02 -0700 (PDT)
Date: Sat, 29 Aug 2026 08:56:02 -0700
In-Reply-To: <6a78d191.b50370da.49fe0.0041.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a930112.1d9ded08.62e62.010c.GAE@google.com>
Subject: Re: [syzbot] [media?] [dri?] WARNING in udmabuf_create
From: syzbot <syzbot+bfeed181d1ce9ec87a8f@syzkaller.appspotmail.com>
To: christian.koenig@amd.com, dri-devel@lists.freedesktop.org, 
	kraxel@redhat.com, linaro-mm-sig-bounces@lists.linaro.org, 
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, robert.mader@collabora.com, 
	sumit.semwal@linaro.org, syzkaller-bugs@googlegroups.com, 
	vivek.kasireddy@intel.com
Content-Type: text/plain; charset="UTF-8"

syzbot has bisected this issue to:

commit 44e9eb5a762142a4aa46c0b5da7c39bfeb78910e
Author: Robert Mader <robert.mader@collabora.com>
Date:   Wed Jul 22 11:01:45 2026 +0000

    dma-buf/udmabuf: Disable the size limit by default

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=17d14379580000
start commit:   0a0d1d55dad5 Merge tag 'scftorture.2026.08.18a' of git://g..
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=14314379580000
console output: https://syzkaller.appspot.com/x/log.txt?x=10314379580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=335632b21d0ce540
dashboard link: https://syzkaller.appspot.com/bug?extid=bfeed181d1ce9ec87a8f
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16c2719e580000

Reported-by: syzbot+bfeed181d1ce9ec87a8f@syzkaller.appspotmail.com
Fixes: 44e9eb5a7621 ("dma-buf/udmabuf: Disable the size limit by default")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
