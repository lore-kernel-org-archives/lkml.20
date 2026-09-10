Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4EA647A0A9
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 12:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789044424; cv=none; b=KY7Bo9VF0Mk4q+OnIUxs2PZgbJD9zU3LfNOOsAd6D6evLSes+SD8HNdAKZYNPufIlfP30nRb1K39duPFXp8XXL9ZhCkc0DREeKJpZoqZi+ckU35Oq3Cn89DlOT8iZ5ePxmTAJ/oDQWx6GWJzAO/QmNRbmouabQQpjSwnSAqNnMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789044424; c=relaxed/simple;
	bh=WyE4XxbUHoFdw1OxygdispL70xRv7g11Wuug5CTzwTA=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=uVU+1vh4Meyvn+K9aiyXPW83X0mPSk8LADCSM0lVAIbjGZzdmhwijF+jkBHaaWgpmRuN7AdeLdy0GcyaOu28o21ISgv7K2OVwHQzeFv1NceBuebkl8FHDlDg7In+jhMaBd6AYKiXyMo6h2Sd9HmsvFq5kGkFIOdUSHUIpfzhblg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-8009280834fso2907466a34.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 05:47:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789044422; x=1789649222;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BprXAy/A6KRmKwDxfPhnhSbUeFynsIs29V1eSWU/ayk=;
        b=B/rvEBAwDlnK49UTIyfXcLjP59rlbDQgxhXArGQtS8HWtr3NI07XxWYApDSV3YLEzD
         srxQu1yjpXQPWALtWn6OJhMElFsF7KkZShU2HgACDY6J9VL0ojg/dnOc2jWQULDkSRgw
         eg7qdCtLQ+O3/1sj5v2DBvryFFRTxPvcN5dryrTZoJH1fuBKGxKAwhvWH6tfMabgIxy4
         nt/g0zvv0LEsBSksHFfeo1QZLL9VwWHNSU5+dfm+viA2euPr1C2sxGSL92UXqtEjhNCG
         NqRjwLFDLrDoBdteV2MecKWZAZTaZTdzZ0vdqbwl8/nxckQql1kjQ5hp07LLigat2+c4
         K4xA==
X-Forwarded-Encrypted: i=1; AKwUvBwQl5UB9Q2mQku/uiYfuu3ZQnMz2y/Ym7ylVO+Ueq9bU2HP3Kwcc+/hP7CHHDOgApChoGPw5xXUq06L7/E=@vger.kernel.org
X-Gm-Message-State: AFuF++kyR+hrKws31+cv5pXFP2lTJsuBsWTXRF0AbhbWse5oy5kacYuk
	Ov3WBZX7D45wiCzjl5BdgN0gN1TpT9/gkWgS/uaebhRzIAzfaOkg0D6sRyj5qiMRoTG8jhHFvPn
	5NWqzXuxKxFWug4DP6AKpaurwOSFuCYYwoT1XVquAJqQwux78T1pAcGVwbNI=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:2d05:b0:6b1:b33a:db69 with SMTP id
 006d021491bc7-6bdcaa376ecmr12903025eaf.15.1789044421948; Thu, 10 Sep 2026
 05:47:01 -0700 (PDT)
Date: Thu, 10 Sep 2026 05:47:01 -0700
In-Reply-To: <SI2PR03MB564251F6E74EDBC70B1BA6C5C0BF2@SI2PR03MB5642.apcprd03.prod.outlook.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa2a6c5.f81106d8.2ab401.000d.GAE@google.com>
Subject: Re: [syzbot] [fs?] KASAN: slab-use-after-free Write in config_item_get
From: syzbot <syzbot+6b16e3d085833cbf3e25@syzkaller.appspotmail.com>
To: alsowereme@outlook.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+6b16e3d085833cbf3e25@syzkaller.appspotmail.com
Tested-by: syzbot+6b16e3d085833cbf3e25@syzkaller.appspotmail.com

Tested on:

commit:         a7c1290e configfs: pin the symlink target's dirent ins..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=12556071580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=6d794b10c2a1184e
dashboard link: https://syzkaller.appspot.com/bug?extid=6b16e3d085833cbf3e25
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=10698925580000

Note: testing is done by a robot and is best-effort only.
