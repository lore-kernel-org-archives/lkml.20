Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793129223;
	b=d9DaWxqT2TmCGa4X7F8XMablVmBCBrL3uCeJlEXQX6r256ucIcJZWjJxy/vuma4mJLdt
	 av9TrCzWwuZhI58EjHn6Gr+pAmvd2R3Eh/1+Ag06klkQiyt5jd+5a52lYcHYWNa8E6U5+
	 O0e84POFiFOBLfcqR4yperaNSqm2Q5nWzBhWHkI3IXOlSfW7JBEJJ01zBNh0EPr7mL9f4
	 gdC/3jIy5ew3qThSF0bl/0CQZsNgTaJAm1nim+imexBX/bl6K/fMwnNOXJMGo6/6UQKfe
	 Iy92QZD1u9e3Sqa9gW4E6znOaR/P+IZB9YvtdxkBB/D6r5m1GOPwDb4XqhVhkZvodtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793129223;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=dAeKk4TrxbH1VVtnTSYzhQoSXRliJkduz6UO58AYncQ=;
	b=NfZkczxoYY+bmUq460Is3QQ+rkJbAn/57dmLdFlHO6wMKXayZjrlzBEJ4cJ+9LzUrwWY
	 Q+K9LICb8Jr/y1fdW8JkIzvJQ4AwCZ2wzwuek0EwbW+9k2XUGYI5ch5mWC/8PsBb85vFi
	 ZlzJ4mcm6tM/JkHVkM8ZwyNa0KE6IToiiA34LtLob5apCb/sQfVsfED1EZm6wJbbFh76Z
	 j2Dms/KjX+5Q6JlmyXx+mrLMzFsrMWEUF62wAdFYF5awC+BKNEn8ANm9IXXp4twnxKl15
	 6Ph0lFyN4AI6+S5aYLQrT2yhtJYCierXwiNmAwcg5+4eOGG9p/boKD29LjmeQdlTSnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.198
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28512606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 19:27:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28512606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4e778acdbc6so356374b6e.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:27:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793129222; x=1793734022;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dAeKk4TrxbH1VVtnTSYzhQoSXRliJkduz6UO58AYncQ=;
        b=FQx8ifiugI+0vphgMUneqiRPNTcBfn5A1Xd5rw1B72zuZ+W7y1lZIUWULUd8J7/8u+
         9rJ3WWlzikeYI7ATA/zWGGONx+YAIb8TbpcTrSFOs6ooM9CMKgoktPGmjwlucD/9wJyD
         dTk6yC/q+BgUxGjXFSHv0v8lXn3rcz3PhlghxIstGPUuplOvgv4pIQcCMAlzoACMR6dz
         nPuCOjyqqbF9onGQLKe0iQ0C8SKEPh7b1z8T0IbHtAQvhdItZXL/3QJGjRFU1mZdIp+h
         iC1AIdvh/ntnOWi6DVKrvYqTjegAtwvaNxLJHehAnLWBFJSCe1fP/6uWoVkY7CmI8/ju
         qiWg==
X-Forwarded-Encrypted: i=1; AKwUvByqma/rPMseVv24Ya3vRf8va9ct4BAyZ8FJfqFvnACmFT30tOs2aqU6LyT1q1RyHodxf1IFTiV2gH+xdm0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJhkbsvJqXFRIDKcJm/0g/8z6MWjo5fPWQxgWlT+Ir0EyzEV9PR
	yeCRXkyTGDij3/U5carkqWGtMNjZyaPpiHnAUOQdd1pRdGO3G+s+5KZttpulj3FNRiavB3SGmPJ
	dJnU3UCkw7dFdKET1wT4aLODlpXeNDz3xAZP5ELv7ydH3Kerub+1DXLfdYyw=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6809:15c:20b0:55c:928:69d7 with SMTP id
 5614622812f47-55c09286aafmr4664755b6e.67.1793129222111; Tue, 27 Oct 2026
 12:27:02 -0700 (PDT)
Date: Tue, 27 Oct 2026 12:27:02 -0700
In-Reply-To: <CAGsrLdYA5DgGeuLpzEFot895T_N=gC1D6P65CVc8umDYb9Dy7Q@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ae0fb06.47d0a7c9.33355c.007d.GAE@google.com>
Subject: Re: [syzbot] [acpica?] KASAN: use-after-free Read in acpi_ns_get_attached_object
From: syzbot <syzbot+5725792ce6a9938d1b24@syzkaller.appspotmail.com>
To: jeff@incrediblybased.co, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+5725792ce6a9938d1b24@syzkaller.appspotmail.com
Tested-by: syzbot+5725792ce6a9938d1b24@syzkaller.appspotmail.com

Tested on:

commit:         62c45752 Merge tag 'vfs-7.4-rc1.keyring' of git://git...
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1521d53e580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=c4b7dc4693928b1
dashboard link: https://syzkaller.appspot.com/bug?extid=5725792ce6a9938d1b24
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=12bed53e580000

Note: testing is done by a robot and is best-effort only.
