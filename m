Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793513505;
	b=gge/Gtt4kHYkqEgDdLwZd8stCsFrJkUN5ZAacVYiH6ihCYuHI9292GW36zjEfyRjIhjx
	 IyXaI7IT9o1DhpndFmq9RlcYbGOLuqVLLCv45E9lfIcJD5OggOk3M1o6tRDn/VBbiK27+
	 Zh3LW3GhHFqPBr53eFbmYUEejXpM0I0kdV3r4Rk/RoEAHMrc1GHLUbXvynT1k9O70saaK
	 e2W3241U+fzWtzvMT1amOtaxcN3+GED02JtlPdDBnfjRX7Vl4YIS5mO4MjBYcYskt41UQ
	 30pGrBP1QUzo8g4kpKrPhnwWW1KyaDoy4j+vJZEalOI+KzPCItDYaDgsM9I+3Msg2wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793513505;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:In-Reply-To:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=mYvfifkh2cRh4ADWZM91A6IieNu1Ui2i8vEHoXTtKBg=;
	b=P4ZyD3rNcKJ4QT4+7PTeu4IeFSV7ySURywIX2y9z5rUsij2OcTe3X4xWwyfstaMuLyB1
	 JgwKKL95hetTS6mQFJ7M/BsQR0Xh7r/rUADcuLuIQDy1RCiFTByEaQdwTSUnNml+BmtnE
	 Ky76Fj0Om2iXfSlnOHTJUchBkWUa6AxUYYvV/ASqb0Dd1H2XgAK5izlJAhPdBwny+tbLY
	 PVFt6rcCSKMI8pg3h+SsfLjdzrWEvTz4kg5OgUAiSjBD2vaTRJBryMMWLDNZbBD6upvPz
	 tqibWs8JGR629biKZyPQyN+SlZOwqxhBAPD1InyECriEV6ddMGgBmACFaYv1yVmgCCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.197
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C3A2606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 06:11:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C3A2606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4e778acdbc6so3389958b6e.3
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 23:11:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793513503; x=1794118303;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mYvfifkh2cRh4ADWZM91A6IieNu1Ui2i8vEHoXTtKBg=;
        b=Rwm514kyg9hrrWaj2m25iysUdnQrsscVtxQBczfhukak+U8aaOR7osAK3Fd349TY/J
         KfUX0gVFvKJ3Xtj35raufFgfB01l4bREBZ35UsN1m00dNt1UkaEbLJk+46yTcPvmb1Oj
         c8AGw8n1nSSCe13Pzg6RgnhI8jMT7LxWVyjr6KXrgeDckzHEGOHd68mDMOsTgYWsqKVH
         cbWm8giU2FCvFyF5Q6zTQldcRmci9QTz+8YM0ZwO+bCSHN0oywdEl+w5TTJnUtoLIFFA
         fsVSLZcwKaA6WQ4Xg1jJcdMrEm4Cn0Foi5IrrDgJgE7M63lTZm1asWVcHxABKt2yJtUI
         Fx3Q==
X-Gm-Message-State: AFq9FYJR2E6BSDpNQMWGIHfAX3EozR3rTC7pSYABcGYqGvqPsrWMbUSp
	dhPcG0+evKrH+V/OHf0E6pM2awWAIx3kfyZgIfOCpOAucQ6vqq+611fEFGriRWxZaShsIZEDNNG
	YJwPHBt4Iv+cG6ltqmO2aBE9GmVOc+y2c7o+CcMF9wBzdJFLX8SoNpX4Bck0=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:3502:b0:4c3:9892:96fe with SMTP id
 5614622812f47-5640dbd6783mr5011788b6e.3.1793513503590; Sat, 31 Oct 2026
 23:11:43 -0700 (PDT)
Date: Sat, 31 Oct 2026 23:11:43 -0700
In-Reply-To: <6a830720.dbb3a75c.20434b.005b.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ae6d81f.64e51036.15cf6a.0006.GAE@google.com>
Subject: Forwarded: Re: [syzbot] [serial?] KASAN: slab-use-after-free Read in check_tty_count
From: syzbot <syzbot+39a2135de1558208d3b3@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: Re: [syzbot] [serial?] KASAN: slab-use-after-free Read in check_tty_count
Author: varun.singh10011@gmail.com

#syz test
