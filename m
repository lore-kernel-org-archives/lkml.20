Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793803623;
	b=x/gE9c9zOPN+qSpys+EQko1oAPxAwcV6Ya7yTbbzO2IhYdDDsZo+wjDComo8MXIn37pW
	 CZXbSpZ4hwVeohP73Nb1Crvu6oSzk3p+ylrPlC5ajkfrnq9kpP0e39byoKvz6YqSnjFu5
	 MDNd2OT7kMmXjR9XaYP9FLTW5KUrvj5OZOFfvx1S28r0hj7+LUz/hPoGPgZYiYzYxXHoS
	 FXrzufWC25RvMar1eTxYlp5pqVUdf4OzOcyP6baU4WVVAU11MSz+HE8rb8sKQ1wetvutY
	 Wdn2FT+UkhtskMPulXXmx4l/m06mUEPQJR5k/g6V8/sl3+CaHLJZ7VDa7xbtSjwUIqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793803623;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=oSweKEi2GjjThXK7yMESo0icBLtp82eX6THuw8xP6Ck=;
	b=oloFY2frzoOgdY+5QnVrvBzRS7NOOtzPliiCNlkD0fwTchSOnbwOe4PSKPz4wQ2hBrl/
	 ZIKdj6+BTwqYEHaEbkb6WR1Xf3mjw+0JZOTFGe7ZF4a1g0NnV07Dzv4F6xXn1JOx3KpNd
	 Mb3nLh/UBRWTRjq0z+24MkqyvHBKCfmRwEOGdaOgN3UEbM8bGTp5iDY2vYvQmSaVgdwFK
	 DwUuh9bCHTQgz2jl0YTtqRONUJkq1lis29Sjyme2GKrPkc0zwfBBoGRKSCFeemmGVvOGn
	 23wH+YcsIw5XTg/rUOOwY7lNLxLy38sejENaosTAfJOLcnerkfXCHPMvDFcfzG101qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.200
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60E88606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 14:47:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60E88606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4f4612a1a5cso2059534b6e.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 06:47:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793803622; x=1794408422;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=oSweKEi2GjjThXK7yMESo0icBLtp82eX6THuw8xP6Ck=;
        b=lOVtCPAO9C3DSUcc7tAjNhb8TqXi440ehN7XfLJFXrigc7CEJzu4+xgd+KOLCTy/u9
         XH8dkfPqY+r17dDC/XxRv5Vuirk4taF3v4pqmcLZH/wOFsGir5IxDz3VRSEVJNoUvoGY
         c4x8ClAC3KI3ZSGS/gNsepEAlHgt4IdU27L1doniRsE3bmEoo8O3V9bB/NFjEjGHTBuH
         suxxG5Sg4WTObyJnKKDgeUPaE8lCtC4M6tOS/LXGOI9ChTO7LJPWNYZGmivYdg/MlBn+
         v3xqfaq9EiYYQOUkKcbB9/VBqbjr1SPxdThf9H8WrBwZScBrbszN9rcow3+D3686OMKG
         Ovgw==
X-Forwarded-Encrypted: i=1; AKwUvBzohhZQdyPQ4iqat1e0cpR/JC8G3ZxWpNhwpRn3+cDSGo8bW0rtFYWp19EMFr+sYJn6YxMVVOWy+UZjgMk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+F/ZTn9EJxI5CK0oz2XfFD5dT6J7tqeEBKdWvhHdt1pWXOHmcv
	AnWSyzxRoeAQJ65bVJ18jvqtd6fbUIYeD9lp3RrMHv8KlC1Vs74FCYZSWnC9FKlmsAlBKgvtUjk
	PRePmnUVhbxARVA5HGGngeX7sjTJh1qiexma+zuCQyrcp5xAJqCsKlHcKPAg=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:2389:b0:4d6:9133:cfe7 with SMTP id
 5614622812f47-563efbf3b9bmr9287142b6e.44.1793803622356; Wed, 04 Nov 2026
 06:47:02 -0800 (PST)
Date: Wed, 04 Nov 2026 06:47:02 -0800
In-Reply-To: <20261104143730.395599-1-gowtham398gs@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aeb4566.3389765f.1918dd.0001.GAE@google.com>
Subject: Re: [syzbot] [sctp?] kernel BUG in __pskb_pull_tail (2)
From: syzbot <syzbot+f15a6eff7a53f6eb7dc3@syzkaller.appspotmail.com>
To: gowtham398gs@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

net/core/skbuff.c:2904:61: error: expected ')' before '{' token
net/core/skbuff.c:3016:1: error: expected expression before '}' token
net/core/skbuff.c:3016:1: error: control reaches end of non-void function [-Werror=return-type]


Tested on:

commit:         05441d69 Merge tag 'cocci-7.4-rc1' of git://git.kernel..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=1cf189394a856f11
dashboard link: https://syzkaller.appspot.com/bug?extid=f15a6eff7a53f6eb7dc3
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1648b8a1580000

