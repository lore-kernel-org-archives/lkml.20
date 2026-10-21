Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792584125;
	b=PMhNOFijLnYH5pDCV2eSjnLtG2Evxtd5wXtObYynQfYBXxgrJuMfbppH/9nQAqPZd1zz
	 WJVMukitKXlgS53a/mDji3DJoafsNwBHyZsMGUenP4ywvL04bHwyHJVLuDFQH6SfRWN8y
	 7+NHyrVPM1EoogIaZkrD8dA1YYeBQoMOTf+Ekmer0du1QRlitofmDpxGeCxOO99S4ZZnQ
	 RucLKeObIOpyh4tjYYWFBIeZu4+/kpeg/fRxSfmG2NOHfmO8CksnJO9/Ptwrj8Msa2u5p
	 4S6XoIROYeMnNk0JxKonA6AsMldnHKkj1bqJqYP4WG8/NL0enIxFiSI9POZ43zURZXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792584125;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:In-Reply-To:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=W1ga9dSqSCIvVDilXp4fc5dGnbugKM5WamFw/5iafy4=;
	b=otCWwRxc/H1rRxxbMHRjkX1UeLJHEjTY7NIxcCxxKoItO63ch3Rl+rsKuhKB3zOD6UGS
	 hesRmv33LqCXtqjD6XXj4kwbPNAr0zVgqU/OkHU3Ns3EkyxeuFlgDl4XF53QTdXtLtdj/
	 cSGt6F0fZyEENTpwaA+4qDTV1VOAvCRj+c71sPr/JzFZiyXWTwsl1601junK2u3lEO1Tq
	 jK9RfJsIJo8E8bhb4+ygTTtvt4U/N3uKFAkL9iNg64TyNwENW5ZB66iR0Ckm9xZs0X2UK
	 ZU8aBUy7+Xu8/tJBsoRN01qtZLkvagVV+A6N+PYQswIBK0ysfbjUTSHSvRJ0KBAvJAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.199
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A66E1606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 12:02:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A66E1606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4c467e19391so974116b6e.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 05:02:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792584123; x=1793188923;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=W1ga9dSqSCIvVDilXp4fc5dGnbugKM5WamFw/5iafy4=;
        b=AoFm/+fQPd6Hl/qSbQZ2Y2rgxZfBoh3nlrR6pHdAergPePf/slLwFx/u2CfcdOIVyh
         diTC+x8aRXDDpl8WWbMdQd1Rb9+8c3TpyC7sHoSrn6+S8tsgyrihXTZaDuZ9HEsWWnyZ
         n0HgWXbW4DJC8H8oe9D+sM4sEm+aJnXqL36ydhqfYsoVwfWGjMQ9KVLnhvcRr+OC9ojC
         h0huJ2NxO8Qp1rqavzmfeVkfOFNbHeH+tHx8472sIr3hpPCKfNZe54An012naJO8u7Fi
         qvfvZQZRKlJp8qJHnJKynG6S2VRVB0dmEoZ24+5q8s/XKH1PHjbWUNjL/zRlbY5UZ5iC
         AnoQ==
X-Gm-Message-State: AFq9FYJR8WASMkCYTNj68Z15zTvY/UeTp7fITK3oF8Y/Mm1mQtkoLsKZ
	S68sLt0TRlNjYaR43/414OxB8X/9VMUyRI7lB5qSowctYwuE/7Oaf1g5OGCC/X9pIRzwr/0RVJX
	yAVF8nBRth/spImCdkKEgRgBYKCUlbLxM1WLST4T5IDsoES8IFycEe3YxGpE=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:ec2:b0:4cb:26a3:a0db with SMTP id
 5614622812f47-5535d9b1e2emr911688b6e.39.1792584123653; Wed, 21 Oct 2026
 05:02:03 -0700 (PDT)
Date: Wed, 21 Oct 2026 05:02:03 -0700
In-Reply-To: <6abfe679.b50370da.302ea9.000d.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ad8a9bb.bbfe3b82.1ac288.0003.GAE@google.com>
Subject: Forwarded: Re: [syzbot] [wireless?] KASAN: slab-use-after-free Read
 in tasklet_action_common
From: syzbot <syzbot+e91dc13b1b37759b3d9f@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: Re: [syzbot] [wireless?] KASAN: slab-use-after-free Read in tasklet_action_common
Author: toke@toke.dk

#syz test

