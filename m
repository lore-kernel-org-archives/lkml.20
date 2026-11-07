Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794034563;
	b=dDmG2bG/HknZddX7pmlWG+y9fOR+kZF8imqJKnb+GEh7TRC4OgvzapSOgEpsUyfBJx7H
	 J7by5V37b0PeJjHSh+t/mVMb2OUvogl5s5kD49G1Y/oCpQ2/HZPlEel3vLTMmSX8CiHpp
	 FMfSulvs/EU2PcUt6QHWL3AxJK/v0X8gZQN/ofqMszDXMonci8dOA7/1iIamEDemXVeBN
	 63u5YxMU4Vck92uC1GNLGQkA5Ypb5qR4VUdb8Kx15KDQXnCnDt3eNOajtjrVj3/5mLtcy
	 oYwPtb2jzAtw+YeTQePRJ0uugYGDGfnYGd/JjejZbqmRJGNkj61l1Om+VI0Gs/JxfBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794034563;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=phssbHngQnmB12RlPBsObvqrdVHaq53PBVYghXvPY1U=;
	b=m/47JikiaGg7hohYlZxkLOXvclY3XBhDPqtXovF8t5rFypluznA4lghQtaynF+HpnuS8
	 mzMStav+nbFzf0AegGWHUp1r5K/ilwl7SHirg6IMSeahuXgzVyyDQ04CLhxs16qXZJKty
	 vmxV+kUIV/Lhf+SmhquzWavS4SbTnqEQp+LXsMPRLW1WTA1ykdDSinHBDehg07ioDJiW2
	 Iv0DJEi3KgEBQGlr3sEltqxSbgkZIBpE8Uwq1XQoW00n5HmjdcL7wnfswOb54YJl1YG0I
	 qTjrYAAHZ6W/HVXFkowFFwpFoB6Bv/hnPjjkFSN2bejhH5PSYHq0P+yZgmjre0evr0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.198
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63D5F606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 06:56:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63D5F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4c55ba309c2so1733944b6e.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 22:56:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794034561; x=1794639361;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=phssbHngQnmB12RlPBsObvqrdVHaq53PBVYghXvPY1U=;
        b=lwB7dPS4DhO5isSl7NywbtVH/vFQW+HJRA0RIlvKuWshv285cGQ+hyFdIMpjGs0Juk
         6ANLVYuXq//Zp+N5O2331C2q6YBtWsviLMLSh92uSom7DkEtmXaiI43YFaYpYr2Ca9F2
         +T2fAdlJ6fn8OTaE7vXjvrxDRQGS7wul8iaiKbxuzdQ69Zi2ZU/aHKV48xWRxNhHd1Hy
         r15IrCmvLSKpKvsjVXfNbBvgwDTJ02j1GB5ZUUTK7qj7DQPPNbB3/Oi1EpzVimre6d9w
         9UlJdd1a9lxYTSqZMmfQjheUsM4Cv0e+XQFhAU02QQRV1RCNe2BwrZ1XdvnZN0ZJhx01
         DQZA==
X-Forwarded-Encrypted: i=1; AKwUvBwiMo3LBNG3rtHxhhMnCj3127504n5uiTALVh16QlO1TSHLaQBWrxw3yxI2+iGjNFrg9g7901pzllxzqUQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Zdr468QoGJi3uc8dmZQkrByL3+7u9YGIfmHE/o2Jo+PzkM8Uv
	yCFSnNa/dTz3u6FqrYdgk63FRsdvuR1jcj2vCCYHOR3Di8OD3lmz5+Xfh5bKyBcRfIo2t5jfext
	diC7KfTmKk+WFPnab42Yzvqv1hQ5+RCTRc/1pukii2E/YJCAQGbHZxEQenCI=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1812:b0:4d6:92b3:5c8d with SMTP id
 5614622812f47-567e18782a3mr4307052b6e.67.1794034561414; Fri, 06 Nov 2026
 22:56:01 -0800 (PST)
Date: Fri, 06 Nov 2026 22:56:01 -0800
In-Reply-To: <20261107140000.1-1-diasyzhangqing@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aeecb81.01e61036.17c8d.0000.GAE@google.com>
Subject: Re: [syzbot] [iommu?] memory leak in iommu_fwspec_init
From: syzbot <syzbot+fe84fc6a684e0beb86e2@syzkaller.appspotmail.com>
To: diasyzhangqing@gmail.com, iommu@lists.linux.dev, jgg@ziepe.ca, 
	joro@8bytes.org, kevin.tian@intel.com, krystianmkaniewski@gmail.com, 
	linux-kernel@vger.kernel.org, robin.murphy@arm.com, 
	syzkaller-bugs@googlegroups.com, tz2294@columbia.edu, will@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+fe84fc6a684e0beb86e2@syzkaller.appspotmail.com
Tested-by: syzbot+fe84fc6a684e0beb86e2@syzkaller.appspotmail.com

Tested on:

commit:         d4872371 Merge tag 'arm64-fixes' of git://git.kernel.o..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=14fa24d9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=4361b1bb937ae1c4
dashboard link: https://syzkaller.appspot.com/bug?extid=fe84fc6a684e0beb86e2
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=14e0d8d9580000

Note: testing is done by a robot and is best-effort only.
