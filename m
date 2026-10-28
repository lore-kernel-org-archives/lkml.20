Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793167688;
	b=07eUrJCQESzpvNTSpMMJ1674IBJsaDMAe3QCIzYxELg6WXz74OuYKujyON1jTnbxONkT
	 lukSzDTuirPN9g90dxNc+sxh/n4wXPHlJij5SYwtTOMMKcP6e5QbPp0pyOG0W20/Wrhqn
	 gbnOg5gDiPpJ2rA79wC6JAy08b8jovJ5sGMDL4Ane5oPbtFpqck9S+kxmuAUPMKmCNLXz
	 S9DlcpcWsiQRAh9Ne8TFpbo1a9QUelyptmFmvQnJ1ND65Cz28UKsdwFTriVl/Dtwb3FiF
	 osjJDR3f0edlZBel4xr+Pt+6VxwkMyHtULWsUJOI6x0/p+AqndDzzcipbB5wwZXL4qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793167688;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=50rR1o2uRfiDytA7jWa26ytIk1PS+FI97x5Q7QKXoVc=;
	b=O8aeRmu4SS/KP+N4Y/RrQPueHV8Q/SwEcpLmw6LgqQcbWHuRIZxnrwBiggKsl6X9KSKb
	 1YO87p6WNjxJ+xiSAAoCstmPyRV2Gc9qWIgbjDCZ2YNBMt4ir13N//sBNfN/zNUeb3JEQ
	 NZaybz78o0JyzCW8ZRQ9/YZ8X72GMpyI1GMp6mofzhbAwoMOhvBmA2qIhIL0tat9oga8d
	 19LepAOWnTTh04mPVOVYZkpjMM4Hd0ZidnVv7U69L0FNWFEiE88zg6pHw5+ogA67o7vp5
	 5h3bmnhcuplvasN1WSQsytUvCqr7++RWJE7DcmgrqCUDNcaFju8GKHm7fs1ebg46m+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.199
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32EEC606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 06:08:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32EEC606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4ab260600easo2515181b6e.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 23:08:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793167687; x=1793772487;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=50rR1o2uRfiDytA7jWa26ytIk1PS+FI97x5Q7QKXoVc=;
        b=t7CkOJ40Dy30HPJDE51qhn980v7QN+moKRmF3d0wltNR72vA3KM4kXEB7nNpDQ0RBO
         h94W6d/ofXeM7V0l8lWRaOKnEB7ejmoJy4YXC1TybnyqvPqrjFND2AJs9NxyYiqHQKWD
         jofKKqOINkcQjR9vqyeGaFW6RiGiiDOqGxGgEo4ml+SJSDRznlfOc66BW9aQX0W2QZxM
         EPa9s7c7YDFNatb2Znc0IgkiGtySJZl/9Ll7f2N10oV8XRI7RMh4WE0x7X8KU5lmtKrn
         MyMUZpp8lARCDIeu/6Xr5divB1uBfclppXrNmWOCt+VlgRlMf3dF/JvDywYhiAaAwYZd
         i9zg==
X-Forwarded-Encrypted: i=1; AKwUvBzQ60mVKQ1iBicPCrs3joQbPPcZ+ehVCW46kyipW38sRY2ZbWRaOssTH5AS3FAlgFgAp6h8bmsDtbFGqlw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIDFgYHXsTFuSbFwTsWDCMobxJtGt9M+cJxrpEbkPEFDpFuU/Ac
	2oOaU+stmVvLuf3wgGH6M8kE7++Kvh+63iye1aR+M8TpQL2B/JmDcthVxKZAGVUbd0HMAqTALeb
	RlsJ9sEt3iw9T7JF+c4SKCkJAugP2j3miRzEMZs0n88+nE1tniEqvl3PH/gU=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1807:b0:55b:f88d:6e84 with SMTP id
 5614622812f47-55f8058152amr2478840b6e.37.1793167687265; Tue, 27 Oct 2026
 23:08:07 -0700 (PDT)
Date: Tue, 27 Oct 2026 23:08:07 -0700
In-Reply-To: <20261028032756.265251-1-eadavis@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ae19147.985912ea.1e5798.0126.GAE@google.com>
Subject: Re: [syzbot] kernel BUG in remove_inode_hugepages (2)
From: syzbot <syzbot+2fcec0eca7f4cade53b2@syzkaller.appspotmail.com>
To: eadavis@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+2fcec0eca7f4cade53b2@syzkaller.appspotmail.com
Tested-by: syzbot+2fcec0eca7f4cade53b2@syzkaller.appspotmail.com

Tested on:

commit:         9ba46df3 Merge tag 'bitmap-for-v7.4-rc1' of https://gi..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=1618a08d580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=968c4ca981edd5f
dashboard link: https://syzkaller.appspot.com/bug?extid=2fcec0eca7f4cade53b2
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=14323ee1580000

Note: testing is done by a robot and is best-effort only.
