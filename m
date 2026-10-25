Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792927146;
	b=Qlix/Nq76CvomS3Ilz1UwP44qYMFJk8u5o214UHS+46Z3yjgN6qaoFRqbyhFxloT4BU5
	 zX6B+bfddDZ4NIC/2MAmiLUWmzrnBqq/6gyCfErUCXKMDRMC89imzv71rh5jzvzyBZQjb
	 zhNbpPfKT4jnWU/mdYekH91EPClKCUepZeHh+jabUJrHL3SO3H1upuQtLFcJJjJchYNql
	 Sso2F2eyR2BHnc1SYhQd2ceJgqKMZ/R655L0GJ7w+RO5CDVQ2Q+d3uDA1zNbVLm9z8k0X
	 Xu9AtzpxOQ1N4ST+3ddWOG6TDWmE682o2JgsX18QSkq9YDt4IqN7/cVI35i4RmArQDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792927146;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=qM85s5BH/3tXvmg6XbrPeMUBY8xg0mHK/g1cjsGsLpY=;
	b=x/II8Poxzz994th01mYXgrb72HEQByPksdMSibHSjEI8tmCUSJcrE38e/xOuOYjhAxzp
	 FViO7Tbjx5GwE6rInwJNFzK8dZGFNS98ZMFeuTCGB6xfygHnlq/7KYfZOJxpp/hpf/B1+
	 6qqrpozuKITSLlk1wGrEFEqOYEpzKnaT3A/4Bs7eFJ5HA19Fz2/XPs1pVsJrR4O9R1UIC
	 rSUOr3Dw372rChfQDjj7ZraNkYI4mLKuQAadyvDVirA/vbixPNyi2MqVex1FbVAn5w+Do
	 v4Zaj8tquCuMUvGVVxiBGBgsuETVljUsABGpxptncKv7Hmq0VnyMKBwIssInyZ4XlWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.200
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CFF1606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 11:19:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CFF1606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4c55ba309c2so3636253b6e.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 04:19:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792927145; x=1793531945;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qM85s5BH/3tXvmg6XbrPeMUBY8xg0mHK/g1cjsGsLpY=;
        b=KYSfQ47O5Xz+I/2niTOPqI12UD5YhDPoviRbDLhqVMGiNcNLSjwoONRG/JT+vCBDlk
         vHr8KOyvpzWMiKLsMsnOwkBtJO4AM1juTB389Ig/BXKBi0P5yf4ky509hVTU8kt5UZFI
         AyoWwhfsnaCf/3hxC2lcZg/phKv0oBTyL+3qF8KCF5ijROzmkNQBu8iBLlJ9UJq/6BKZ
         39h0CJx0p0te5yP8WqCkbYbTsEBmlFeRkgVKQLCcHBDJA6RiJm2FW7R6lAr67Ce7p8jO
         YCzl42NfV5CiyAoiK7KW/AcYXyz/cL97aAbYnlGYdCza45ipqirVsGEtHMPOTdzpqVCP
         aJuA==
X-Forwarded-Encrypted: i=1; AKwUvBxc/2T4P6+50LrxhAx5w0SKnyIRVeAIEXl83nkvJRCyhyC6GUHLyXzexqTGwh/7OxJbrAB2HsNGMxqteMc=@vger.kernel.org
X-Gm-Message-State: AFq9FYL4htsQKxeYZLsvo2flHwLu0sVMW1CUfLYL/YBrlI9c9l77qUH7
	wtI/tFu3e77KIDVwPppxaSorgHzMvNh+Vg1Jcbh3MzYLmHyAI1aJhVFINTpBGX4oPmvrn9MBPmN
	gk9/hYNSlURMb8wbnHfPNJo5Clg02VCMXMMCvMJJZ9C3BuBDrp5tZhw2K1dA=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:3196:b0:4f7:27ba:9db4 with SMTP id
 5614622812f47-55c003ec06amr2306890b6e.60.1792927144946; Sun, 25 Oct 2026
 04:19:04 -0700 (PDT)
Date: Sun, 25 Oct 2026 04:19:04 -0700
In-Reply-To: <20261025105310.1134-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6adde5a8.412b1182.196980.00a8.GAE@google.com>
Subject: Re: [syzbot] [dm?] KASAN: slab-use-after-free Read in snapshot_ctr
From: syzbot <syzbot+8e6fc64255334ccf3ab3@syzkaller.appspotmail.com>
To: hdanton@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+8e6fc64255334ccf3ab3@syzkaller.appspotmail.com
Tested-by: syzbot+8e6fc64255334ccf3ab3@syzkaller.appspotmail.com

Tested on:

commit:         f47d2236 Merge tag 'vfs-7.4-rc1.sync_close' of git://g..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=15bc1459580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=97e47414c855a3d8
dashboard link: https://syzkaller.appspot.com/bug?extid=8e6fc64255334ccf3ab3
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1230d695580000

Note: testing is done by a robot and is best-effort only.
