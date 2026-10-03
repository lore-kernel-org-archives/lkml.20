Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C8323AB9D
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 15:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791042425; cv=none; b=i7YXcTjCiRvscYoiu5WLxBqq/mZ2DF1cIZZ0JL4vv0dG/p4Z9NH50dCAHJdJxUFESkWBGf2sjeiPFTeTwu2hRAbel91anJvW9LyAKPJCp9JM/np362lnCrNT0rzO1KHJGn81OyUvyNunJUkt/lKELLsbn0eUfrtqZv2FFYD80Qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791042425; c=relaxed/simple;
	bh=fOugTV6ggGFHdCHBblr8I9v+WYAIlral701ZjUFOKH4=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=mzV2OaU1kLLJ0Dkoxz5hioGRs5vHE1G+K6uiTTCUmBdgmR2kmeDWAosXO4UwMzm5ritHGKi4ZiMI5Z07EL57ibYW5Pqz0O8Z/c3za3WOr0zJbaqkQUxJ26pzZpyyQYsK7Gbe0p8psis17BaSVM1nq3nGkEX9Fvn5Pq2mBL/cd4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4f4612a1a5cso1112175b6e.0
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 08:47:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791042422; x=1791647222;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=UUgn3DWK3ATCrmARDLOkJm74W3V1LCiu/j0f+DkGnjA=;
        b=1LOsCz9Pl4gTPeb/RSLu00LpFZ8a93q8AJVTaAfV5+Jh+IEhwekDnKdptQdW99oAx8
         foEWDrf4BcL34Ba76LTzsGCbjsIPJtjYcgqnhyTnNuZvHTk3LZUi/GxqrLiziO8uDs9o
         O0+XEHInPNuoB2jSYDeiKFmldJN2cS3krAvkqD923/4Dp+/qGF8Ru8FXjlITsr0SIdCm
         USQAoPIvKhagUQNiQ+RXfc70wmyzcUPtdcEpKRevdAD/IToKLh1yhPCz27VAaagbpNVT
         ij/m0HlrwL1AAYcOXLCWwlYjR5ufP5WEU4TpaCWOKZjN4fcMeSvAh41VnLJOt1Uw5Mv1
         IGrQ==
X-Gm-Message-State: AFuF++mR+fo8wEocbffoD4L1vGo6aZpS4oPYkQNhqq92jkcvb0iyfEvZ
	kPedQLGhwfsDAkwmUsXbG5PopMuGwV9ScVk3yK3P/npeU0JmqU1QLQf2dGy1+PEkSL/BzIwwhuk
	OfT3cy46P3PgGF1KHmp8JYvRfosITiXDP3HM9q2tsEY1mTegHTvgw1lwT+Eo=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:4449:b0:4c9:7c85:5f54 with SMTP id
 5614622812f47-4f30949deadmr8227319b6e.23.1791042422669; Sat, 03 Oct 2026
 08:47:02 -0700 (PDT)
Date: Sat, 03 Oct 2026 08:47:02 -0700
In-Reply-To: <20261003131345.4325-1-nsvatoslav515@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ac12376.9ad129c8.3858c0.001a.GAE@google.com>
Subject: Re: [syzbot] [ecryptfs?] KASAN: slab-out-of-bounds Read in md5_blocks
From: syzbot <syzbot+46bbbe175b7eea8036b8@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, nsvatoslav515@gmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+46bbbe175b7eea8036b8@syzkaller.appspotmail.com
Tested-by: syzbot+46bbbe175b7eea8036b8@syzkaller.appspotmail.com

Tested on:

commit:         f0406245 Add linux-next specific files for 20261002
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=175e87f5580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=dfd189b706ddeebe
dashboard link: https://syzkaller.appspot.com/bug?extid=46bbbe175b7eea8036b8
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=130c87f5580000

Note: testing is done by a robot and is best-effort only.
