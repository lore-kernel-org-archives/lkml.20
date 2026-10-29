Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793258404;
	b=fVz9NX2s/Zxw1REkqaayg2LlFU5rbmS5yDrSav9Ch6tNk32JwbU04wHId98w8hkITYF0
	 Aendb4IqfGMZy4FpOZyp/2IpdBBcTi/+eTwZsM1Xj0dtcSzfDpmSOefQHO/WCSZicYP01
	 h5SjIUDA8Mo7iK+ezvPnPhMuMEpWwYUwa4or4vwiBPgyI1iS/eLFnqU3raChHAvEqVTIy
	 3bwvfCylWe2R2b7sF4xOXNMLMHVwDTXdDsbi7UkOdAQZLDpj8HDFsJFHi/U30OgfdOkqT
	 LgkFtxVNhnR9gYOfdn2XWOwPylPYuxp+GvDnx1mhx5BLvCSquiIIeBnbu3UgF+rj9iA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793258404;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=MwREr6vGtFP2h+VTM03559yRDMjFSU0W397i3s8w5v4=;
	b=Zjr1FLuZPsm35dxwzKmUKoghHfeELPMXhXA9kfs8ZblrE3zvKxGAKmeCqCRIg1OYR4Wg
	 9adH/vFWJJl7LOTxQ7uTJ3jyEWW1avluAwr3n+3WVBBkkLxFmj51+L2jxzZxPXbcYI2JB
	 /fNANfKPO0UOD/18KSMW/+fis8QiJCfPM52XiKpoBamdL9YzuMYBhi8gPtS767Km/BevD
	 D5M19Pw0DrOWPQzUbAeoh9o+51VsgPQVE1e24x9sXS6OwcKj9UrqO1cREEEYNWL00Im2g
	 I96SfK15mcfHRXCIUkQtExTuawgdEcVImXhjAQcNrMvrFiQ18gPyFOXa31ygExfwcuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.198
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C762C606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:20:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C762C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4a7de733fa9so2554042b6e.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 00:20:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793258403; x=1793863203;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MwREr6vGtFP2h+VTM03559yRDMjFSU0W397i3s8w5v4=;
        b=hJpz07cKrjKz6pcrLGHeu0TRyfacBoIV3De0dqrcYK9knTQ4mS5cza1SXbw1dBoY4x
         /I59tsIidA+Vg9aZIcIwE5VRaRdGsxoSypEgtTXQZciPF+wtqEC+b3E+tYgwvYA2bsqo
         eXvrd2/YYoFj9EoS0Jkw0lN40iKruGpRd0vYZA5An4euRcAAv/4Cv0NQueCYlXa6uFHP
         EJSE1hIOUugGRBl+TJDby/5Y7lgpAx2kYRZB8qr9TP4SVDOceYfg4NHRu/xzZXi6+j4f
         LoKdq2tm5ONDP3ob2Ox9VKhf0ORdYC0HhVaA49mboIfd2SVXCVWgpOPAq53GLzvSEwpk
         MAMg==
X-Forwarded-Encrypted: i=1; AKwUvBx9jG3hiMfILMQDOrtcHX0VyRzEG6tI+NPGBn5aLaIgigS4OvLo6yE6o3ffIpapyOjIAlb7BQocxD1ryrE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLKL55nkjpy6d20aJPgqldzPCgQDDrMEvWNR7QNWhIRLQ7nixMO
	pv0bCwgkdI5mg3kmm2YANGV1qKcfYGUFPZf8zL3WAAFM10PKyn3T9eae6W2Xe1/qlMpIPmNwh8M
	23fpJVRIUOpY94/1t37UzEZnfTpPur3ANanRUvdyagQxbm+p8weLyXhuJyB8=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:14c5:b0:4f9:a153:8730 with SMTP id
 5614622812f47-5637bb6a620mr3356148b6e.0.1793258402873; Thu, 29 Oct 2026
 00:20:02 -0700 (PDT)
Date: Thu, 29 Oct 2026 00:20:02 -0700
In-Reply-To: <20261029065739.320434-1-eadavis@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ae2f3a2.f90c38ad.2dc092.0081.GAE@google.com>
Subject: Re: [syzbot] [block?] possible deadlock in blkdev_write_iter
From: syzbot <syzbot+39e465d3f7a1555b0f96@syzkaller.appspotmail.com>
To: eadavis@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+39e465d3f7a1555b0f96@syzkaller.appspotmail.com
Tested-by: syzbot+39e465d3f7a1555b0f96@syzkaller.appspotmail.com

Tested on:

commit:         330517c6 Merge tag 'char-misc-7.4-rc1' of git://git.ke..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=1573fa81580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b03c85f3988bfcd5
dashboard link: https://syzkaller.appspot.com/bug?extid=39e465d3f7a1555b0f96
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=10ef43e0580000

Note: testing is done by a robot and is best-effort only.
