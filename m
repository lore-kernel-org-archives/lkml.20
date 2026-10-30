Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793396464;
	b=yAplJwxq2CusQz6GrDx+EEfjm+aFGXFfkmGGP0tw2QQCp2VvbTZK/Chj+fskzGJ7aWrj
	 ApCGPYmoxqHANRSECqhF+w6TRHVh/uD9pV2Lh/DC1tc8mpXPgVC/1rasEZ28r/zCOqNsN
	 JoUF3WLwbfLrlUJLCdCCN8/PWbouS7NCKm8zuckwnrDT8uZVrHWah6ElnYU/yRQAN1C6P
	 8o5bCt9pwxMLcNii6+IDV3ZelStiSnXVAtjdwskjcnIM8NSN5nJdC/RT5IX3kytgqLsi8
	 MhE5ATRO1xLy3UPZuA4UU8nz+aMzKjr5hMaSjw4WS7/dwU7HExWai97hy2Mrz9t1PsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793396464;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=u+kQTwmmQkuSa9uIdNOEJJryCQJjJhjE9NL8bvJf1pI=;
	b=znf9awccioyvyyqeujqbDfk8FPrNYzaQnOVaFFkt9dD5RVHqW2dJKGfs5198p3D7KJvX
	 u9UBrRJ+HzIP+arrsqG447C00C42PbyiDzuJ8qoLQSwKaIFI92ZD4oPibxZrhbDNgOqNA
	 wXYMHt6lTM3UotfS16SvutJCDRVHw3HkoonXSvfqyVgrzLlSyIYwaA0BUEo5ZNSXGmcu4
	 9whuuI4qTsE11xdX7v130WtIrxXRekV3DDlNg29n9HKzqaUrJuNX3cnFzYtqDXe31hUfC
	 KyisZXXS/QO5agoXJUsZfhaCB22FZyk8HvyJIcQ2iBguu0YxfJmEgIQrWpSWiTd2iLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.198
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3137606A31F
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:41:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3137606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4b37620eb73so1994528b6e.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:41:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793396463; x=1794001263;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=u+kQTwmmQkuSa9uIdNOEJJryCQJjJhjE9NL8bvJf1pI=;
        b=P8S7X7Rpdbn1YB32U/xvmmGOTmgimn8hzv308aAO06TozBtpXu1q3DfLtGufjqL5Dx
         D7HPVUh4jAoLcb1eV2qvOUV34MYJR9BuTNea+Yltftmnuo6f5NMswJg/Cr2+4vGGcBGz
         cLluSoSYOyRIhwpu+i5otg+I5WxfVnPpQwI/DPFg76TmRRpX18HOQPkIa8ossv/zE/5A
         HRJAanyqxzR80P16N+isKdAgHnXEu/3zGiCr+en5kZin9IFcWUHPgsqy4kik+f798nGj
         5vrDvce8Wh69Mq7NurcOe1ulSyymfK1C0JCdWwvTCdrb1BP4i0XNBmG9hB0I/pzHSgcr
         SfIg==
X-Forwarded-Encrypted: i=1; AKwUvBw92DWDrUJhhBU+wnbXyGa4ZcLQyF5XjR4h3mQWdNMqTjL7EI3RlTQoKo289z1omo4XdFgTC/FhvTbHIWI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLBRoYdB2XxqUVC5vMqbl/+0OwKb+mNITn0lYgKhOCMt3AP1xuk
	NEvTpEP7BrPzosJIWPhiyUjKrxcHuc60h1qV/nj8hBI7ecS4SAZzINXVApKOol6kCz2B9sY/2zS
	bw3/CQeNwLqIGLa6iUeHAJqMH+NqHkhCcm/d9hb3+ES466wGQlWJsG0sb+is=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:11cb:b0:53e:42e4:47c with SMTP id
 5614622812f47-5640ddafe6fmr2769876b6e.34.1793396463061; Fri, 30 Oct 2026
 14:41:03 -0700 (PDT)
Date: Fri, 30 Oct 2026 14:41:03 -0700
In-Reply-To: <3e3zm77hj5j5gpppgtq4fkppndx3dl4oslst4rlt7vuztucyxi@p4gwnjufokx6>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ae50eef.78e51036.124520.0000.GAE@google.com>
Subject: Re: [syzbot] [usb?] [media?] general protection fault in dvb_usbv2_generic_write
From: syzbot <syzbot+f9f5333782a854509322@syzkaller.appspotmail.com>
To: immersa.bartosz.chronowski@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+f9f5333782a854509322@syzkaller.appspotmail.com
Tested-by: syzbot+f9f5333782a854509322@syzkaller.appspotmail.com

Tested on:

commit:         c03c1a14 Linux 7.3
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=121580be580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=bc22e3bf9a6ffd73
dashboard link: https://syzkaller.appspot.com/bug?extid=f9f5333782a854509322
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=122785a5580000

Note: testing is done by a robot and is best-effort only.
