Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794314883;
	b=hR0BgBd+ZJEXNrTSgVi2Bu21OrkbRpaUotC6iXyF3gsvGVbilVzu91Ly0O3Oifr9DD+N
	 EYKrZ8lTid62ao1MZsBHxS+N7zFacoyRgEGTqA/+sSU8o1lx0UcQzB6he3ZRNtR3ssX0e
	 Y+WTzTAnXj0hzoPza+CpPiCgzaET+0LU/CJdBRQFMsiIZ14mpWRe4zEetp8i81LIDUR+a
	 7pfgBpWJsCKyHfPNizHMo1FIv3OUwv/dhgadENHaTYPXq7LAKJriATIadvDE8Ks/LITej
	 rql/T4TjLRiALKYF05TskDJZJ0QuQrAK0zBs/emd0NF1hui0KekVV6Lx7XgqlNIeuqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794314883;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=iQjDizqk03JMCYz23VgCzT16kr5WjCBDZQb1hyFRoOo=;
	b=Nb4Ta31BtCIbz5zS/cvq0/myVxiTgB+T4FUuGHLptHAUqKE92vXAG3aFBRNgd9R9uBp5
	 ToiAbD6UZKv/i+OfyfrH5ocRUMFEp6T/WO1gNydFA8GMRxpXGtGGaYCqQsUjVAdrN7Lb5
	 XAU/BwLPN22wl3xVKfTZE+XcwkdnD4U8MQWhxRbb8Yk17pB82PGz3lhFGdh8RE6EJ/KXG
	 KYjQVn2/178SkDFs639PAvObIXoWWw0LKe5b2sMq/1OsXjNtOFEHI9COI7a992aSdU4sd
	 +/Qoiu+WMPQ633f0f1gXYaw+i0mrfmNyVoGV9E3zw/RtYQoI3RlbsOJGsidI09Ot+FA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.197
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8983B606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 12:48:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8983B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4c7f887ac6bso2583575b6e.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:48:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794314882; x=1794919682;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=iQjDizqk03JMCYz23VgCzT16kr5WjCBDZQb1hyFRoOo=;
        b=T6keOfIpyxtMx49AriqfMXSSyBAIUKtt6DpYbSvT5HWAJ6H0LZjkpassSU+GD+YMKx
         J0pEVmyD08bBzb5lz6XBPX40Fj3lGcDzktZduOaBMlRrLtTr9nOS12UIfopYg01U6KRn
         iWzQ3rfx+6kCkTNJAZG1QTX9sJHaK1ER5j7z8ZW+jRRSzToBxcyLNdsYNFRtimsBL1Xe
         +vdnbzXh8S+O3mudEDo/jtb+uqWyF70likn0r/z8WSMLDxDPIY8I6PzR5hB1iJx17E8R
         EqL55jVJdmvmdl3FtmqaweioQFuGVlAAW5vFENz/YZkNiABmhZXsrpeQGsBeV96Z0wHs
         YDEQ==
X-Forwarded-Encrypted: i=1; AL+hErERsELuglsN/0njQ0nj0dhsjb63EV9Ati7qeWeQb1/0LfpQCEmWJ9dY4m1FgtoE7VepWHFExvdPoYgOM+k=@vger.kernel.org
X-Gm-Message-State: APuU4Z9xpkow1XRLP8AVKaX3SmUHyE7CdubxRL8Yhd87niQVR1F03+Y1
	iXEqzV2ILYUCjSlaSDGCdw3ORqVLRL4wkO3TcDwcmh5NCIKZAiXkVPBTgVjczMFA6cH5jn3gJwK
	bP6ou81E43g1EKm21ikIfJ0R0eAd+zkrQ0ejZHxI2fj2anQbMcF/DX/Wx16o=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:f0b:b0:4e8:18ee:eb4d with SMTP id
 5614622812f47-5683ccd9f0emr2101379b6e.20.1794314882578; Tue, 10 Nov 2026
 04:48:02 -0800 (PST)
Date: Tue, 10 Nov 2026 04:48:02 -0800
In-Reply-To: <CACbwGuR1J6s-n_ThMFmtq0X=bjhLBQR=NbP-JMmE1fd5VqKhQQ@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6af31282.6ea51c61.3838e6.0009.GAE@google.com>
Subject: Re: [syzbot] [driver-core?] INFO: task hung in usb_set_configuration
From: syzbot <syzbot+c22bb42560ec86726aba@syzkaller.appspotmail.com>
To: gbughunter8@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

owned.c:1: error: VRP_SYZBOT_HOST_GOOGLE_CHAIN_7F41EDE2


Tested on:

commit:         2424fa6f add bounded syzbot host Google identity matrix
git tree:       https://storage.googleapis.com/vrp-syzbot-rce-842629920185-1108/bare-repo-host-google-chain-1110-2424fa6
kernel config:  https://syzkaller.appspot.com/x/.config?x=8bdeea7ee6735f91
dashboard link: https://syzkaller.appspot.com/bug?extid=c22bb42560ec86726aba
compiler:       

Note: no patches were applied.
