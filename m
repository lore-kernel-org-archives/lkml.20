Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794380524;
	b=MErLRkzSFsv+I/jYBcMtjqeEieKjeQBeguKzl/tKqgir6eIgQN+cZaR/MC7BPnYbuGZj
	 SHiHPqEAz5FrGRHu9lDcCuuqsyoJUS4QZlbVG2JAzuzbv18xabWHJ+7nDGKA0u7QH6qGe
	 FpxYVtBuF9eYIQWI5+OSUQkHib3bnn8rzdYBBFNr+BVddRkLiCuAAkTxnr88bsUVQx1JO
	 mcb4AWD5f8fNrxAAYU6w3iT6dK5BiX9io7sdsDpANIZWG5fXHPCwVBegz3dvqTOJgbkIT
	 +eYWUiBuYYJuAs6MvE/ylboW8sgp/2USH8CR68MBzq4jw8uyrTuhtPQlLWQFBvDEnkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794380524;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=zj5W+mWMoleltIi+J43CDQ9xYqfZUJIVme278zEG12g=;
	b=syQPeTVEvx8hS92oTHX36m1fd0w8TSKneTpmJ3hAI79hbSYfJU925mP42VSr0wbXsc68
	 jiIt/nnoi2RZBlsx2y1QCpUL00RO+q1y0iDosrwx+rmugksYM4QBRvA6gWLhYQorG2RH2
	 kS59rVSAkZT7G3THmPnD03EpM+Xr8m9V4j+mTF76St/ZrkLbJhzPw0TJTQes1FOJt47AW
	 ourM1UFw0ThupWDX6taAYvERJVwKdBFw1Jm5gR9YgOq+tPI1f+D62+sOlZ711RX8gWHjZ
	 5TabgPQzbg/3t1kCz/jN8xVcLOR7Wm9Uzb7oejD6UiombM/+NqYRtcp3ppj7X6Soh8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.199
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BC0A606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 07:02:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1BC0A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4b37620eb73so4108929b6e.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 23:02:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794380523; x=1794985323;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zj5W+mWMoleltIi+J43CDQ9xYqfZUJIVme278zEG12g=;
        b=xLKk8D7di6Hd9AD96SkL/Ss29Uqa4dZc7ycaoXxrtoLUXCYkqPkkpY6j7C5yP5MIOW
         J2oLkHh6t8y6VBQExdNFTnL2IIQyscAxqN2hxMhmLTVlbwLx0r+g3xPeC2zaCfLMMG8H
         kW0OrPZlKIyRHRvC+gpDOKocYLfUcDfkQhQpjqQI57/1WknrnntlPQ0XrI0ClncEDFMd
         mkNXijTAnS0bEaWvWMnCl9hodB8vpV3X13jGnvxEBPHUy/F8K89Zi7S+8ruyuqh+Gn2g
         VD0huwg60rGwwkT4WViqLLhLdltjLJEAnDW8xbe3X7UYJw2wcUmC6wPcoKPVABF6awRL
         e2Ew==
X-Forwarded-Encrypted: i=1; AL+hErEF2z/YzCi8JKi6E54Hk9ETeOos+pA8wvTMuUH9vQP6rvyMEdsJAFElNshPaevBDyI35/aTacphVmy99QY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/pQtRqEfOzhymi3D0G70lRed6ZpuFeRAnmHwY06/9/UxzLL59g
	GbieLmowiuIHmxuL8lzeAljx/xL2mZSj0ajlHs1hOXUBvw+NvqGqTBj73Zths4+TN4qGwUui7bG
	4kRodjNbc9CeGFl/a2hCSaGZrpr2F02/EbcMiiiIbmiafPZyMKQPdpfS1+ic=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:6404:b0:53c:7298:3598 with SMTP id
 5614622812f47-56b9750c385mr1312681b6e.31.1794380523077; Tue, 10 Nov 2026
 23:02:03 -0800 (PST)
Date: Tue, 10 Nov 2026 23:02:03 -0800
In-Reply-To: <20261111070037.422-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6af412eb.926a6ce0.263fd.019c.GAE@google.com>
Subject: Re: [syzbot] [bluetooth?] WARNING in disable_delayed_work_sync
From: syzbot <syzbot+b1146b58a9d6d90e0eb4@syzkaller.appspotmail.com>
To: hdanton@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

failed to checkout kernel repo git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git/for-kernelci: failed to run ["git" "-c" "core.hooksPath=/dev/null" "fetch" "--force" "433dfd5a8a5d80bbf0669b14e9ed908911a52dd6" "for-kernelci"]: exit status 128


Tested on:

commit:         [unknown 
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
kernel config:  https://syzkaller.appspot.com/x/.config?x=a58b6b4d667e7a61
dashboard link: https://syzkaller.appspot.com/bug?extid=b1146b58a9d6d90e0eb4
compiler:       
userspace arch: arm64
patch:          https://syzkaller.appspot.com/x/patch.diff?x=11decebe580000

