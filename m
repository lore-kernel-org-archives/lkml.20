Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793331485;
	b=0yciwgLkklhefz1i3j2cAey6zL/gZUgNXvNKRxkfN9stDbjEnCRT1hOfJwBtlW7NJt/7
	 0IzmBvakKzb8MY9sX6DYSdoy6it7gjkuRMzsdthBtckNC22xHJsma6gS0NcDpkTBD0unn
	 x0afWnDQKC/uZKb554gYPLLYTZAIG/k42cWGpaTNbTZUlQdjBDQkPD6Nl3DycElqRr2oI
	 WRNjaiTkSZEJ+ZTmnDv3s25Qx2wqyh83wxlYN0oN3s0loF/X+sjLwxKNnV8pDIFlbrU0E
	 Epdl2HfvU2YNFACCcsQ9YYD7lAwZ7xwU46kTv+oABo/hZmRpd1HCPN78zXMcUb0bArQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793331485;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=F9FVwiq3RZ2XMJDDjMlkJpeTKbxZbvVF3lcB6CeZo64=;
	b=HCHL4hz8330MEjmzcAzlTZ92CzOKyI9TSFzSL6+uyi0phNeTCwfiDd/Cmmf7G9MnEuWE
	 9MKFaxwoN916IfFFLr2eeSJ0AlQntGYE7lJTfZuUBysqHMIMd/vcW1F5TsJU7MQkLXzUs
	 eTcLGIBnGb6LOfj3r2x707BgOl4+Wop/eQ9zX5SAp+puIo0KTwcZC4kmsJqriaOGVSRLf
	 sPVZlSP9XnLH05wRipxAS3HcQSocjEdFBw7tpUArva+eK+xk5bS8eCU2cIVQEX5nqpl2t
	 tcgxJGMxHV/rZuLiFxTgbIoy3JboLDBTd2jxJV5U46Qd+/CeAdiM97UK4EfnSrR58MQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.199
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1D29606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 03:38:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1D29606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4c55ba309c2so389605b6e.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 20:38:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793331484; x=1793936284;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=F9FVwiq3RZ2XMJDDjMlkJpeTKbxZbvVF3lcB6CeZo64=;
        b=quKLaiIXZLapWpc50dhaI15spfcXUG9cpC3PhEIi0BBvh382Q1y1GFTHm6D98Eg+6P
         l64baB7ZxG7juh+hX9RfayPMUDHEgteH3j9ws49byFZhG7qPrjFA/CsHCRREnzOJvC/w
         OPmJ6ymkPWYqXyYv0Ku1WOEMwuISSJbWKlDZVKkOT5QgFAicH/NLKFsLDX/askNC7jTG
         g8Hyk+GuRGvFLlzCrqxJyF8kxR5lLo2bTjKxjO36PuEUqMZIT5YJ58aiBfmqVFts3Y2a
         IzgcnxPEcsef+19HlS9BcYoOl0w09wZn7Tmo2edXaoL1kQIidXO/4Ts2GjevMohJ6tUH
         9MqA==
X-Forwarded-Encrypted: i=1; AKwUvBzd+NpbRifVC6oU5ZogZV5eB37XK8FwwiIfK08Zcwa+GzcgevNJlX7lc64FPPNDs87k6cuX0RpSDKA4mmA=@vger.kernel.org
X-Gm-Message-State: AFq9FYI2cBZErLbdE07YSdt8AObqyxO4AfD4fU9W4Ks7THArYw4JE9k0
	BW502CCvWE37yOTPmUYqxSpimKTbOCA5T9V+67596owAwF9EfSS1U0CoqY5aL0lrWxFxviEaxGD
	HwP29n0A4ubn/0JC6m51TRJREeLKqM5nUHq7jPwj9HDnaVCwkh/X5GFvoAUc=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1811:b0:54f:ee4e:51ed with SMTP id
 5614622812f47-5640dcb8774mr904840b6e.19.1793331483954; Thu, 29 Oct 2026
 20:38:03 -0700 (PDT)
Date: Thu, 29 Oct 2026 20:38:03 -0700
In-Reply-To: <20261030031741.29260-1-gowtham398gs@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ae4111b.f57e0135.1770dd.0077.GAE@google.com>
Subject: Re: [syzbot] [mm?] WARNING in setup_conf
From: syzbot <syzbot+75f49ec552cc74d9d69b@syzkaller.appspotmail.com>
To: gowtham398gs@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+75f49ec552cc74d9d69b@syzkaller.appspotmail.com
Tested-by: syzbot+75f49ec552cc74d9d69b@syzkaller.appspotmail.com

Tested on:

commit:         d89e1d18 Merge tag 'fscrypt-for-linus' of git://git.ke..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=174851a5580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=bf3aec6dcf0a7ca2
dashboard link: https://syzkaller.appspot.com/bug?extid=75f49ec552cc74d9d69b
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1617e22d580000

Note: testing is done by a robot and is best-effort only.
