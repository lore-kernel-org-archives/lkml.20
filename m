Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793060225;
	b=YJ32/1nV9KVpK4ryJA/guTgz91fUjFopuDIj0xWkgzTzS/Ban33Y+17fXjXen2FbY94I
	 yPTES0OcugWkX6DaphjHvwAcAPh7hqOknrBR9V5E6XWahPspwlGgSPHv+WJtN6aHBG1CR
	 iZA+zsvx1Npk3tLf7lB4TnOUa7cIh/AjJ8r7J0tZ6XwB5a91Qhyv4FcvgHiZVl148ayex
	 sTrKR95iYJq/UR6uI0BLLRqfWSHbLQApmddqtGZ4CuUE7V+YxaM/41INIGqGLsJBiKNsb
	 au7B4oy9t708heShLpqJOVCSWOhmEROcOD0mqZhLmQL9Ke5uDSobmbW0YvERGqr9MfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793060225;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=6x9+N/COr+6pNBpUPwwvKfGBRH2EOtY9PmyW7dZS2UA=;
	b=ZhwXu6ThyVwCuJOcwHSPkHqsyAc/w/jBk1vmRAJ3aAUhhQ6Yavd6l544x1P7CSjHKSL9
	 lfHuCMHkSfvFQ/RvaiJ++6fHYQ+W/Ee0Q1u/4XbrkR52IHmB9TKRW39PcPBD4b0xfCapY
	 ZBOaykpBfiEwwp4oOa9ZYoPEQItdQvwcpG57R3IXwhVFPtj7kG5JlUCO0sP3MhPwbR5CX
	 qko5fKch9XfAI2/S95cxypmhjCmtkBaCEBn5fFh7vM9azqdReUFtSoDsP93dBQ7PKWJ2E
	 V7ELWRvn5xhhn4gYI88CCDzuQVUb9Na+ANgHLunLRzW3ZAvkkvDY+ME2SUIP2mbUBCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.197
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C5F1606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 00:17:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C5F1606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4b37620eb73so6278608b6e.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 17:17:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793060224; x=1793665024;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6x9+N/COr+6pNBpUPwwvKfGBRH2EOtY9PmyW7dZS2UA=;
        b=lrd0qDVT6jd8afahUVCEQCq44vIjyjKJenCIlGNvM4HjBYA8p9eLALZ8/q7CRavtZH
         nVI9ofU7iMwp4CsKvvNAYtaSYc5YsQtbJ3mnB0MPq+GWtBSsoLy5chY21p8Ip5bzH0kX
         5+1y5IHbo4u3SqT+kL4G5o9kaFkH4JlnsGXwY4+QsOXQTIQimwqFhc9QN7wETKlHqUTY
         J/UZCXCLJIND1qfvCpdUGqOFO/mot6tqDcWQRbuY2RF87LXdOplJX9kotHBJp1x3ikY4
         KjkjVP/Lbmkc/3zsPedXfLPpmAeOhI6kVcAQcXNzZxoGEvaMl5xsDO8TUIG8AaNqIQmH
         o7HQ==
X-Forwarded-Encrypted: i=1; AKwUvBzLIxMkrdnhQDX/UOyxb5hq8GibFu/il3zsEdoBnFzPoqTtUqygIvhs3tJOtOPo06iVYWh02TWj4YIKvTI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIFAInZzjiEnaAPEn2MrIvTPZopCsoKq2QAxyCGx2onUgmj4JN6
	58hkkl/q9yFlK8buYWbxRcrskQLbSgVux1PKuigCMuVwlyiqGMhfmahtRecgcKYbqP6eF7Tdrsw
	9RFakMbAST+/nmCgNxL6RGRwmS8908Udho2UPQAspn+rMvTCcT+7a4yEf0aE=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:10ce:b0:4e6:db9c:9a7c with SMTP id
 5614622812f47-55c002ec88bmr4875116b6e.63.1793060224091; Mon, 26 Oct 2026
 17:17:04 -0700 (PDT)
Date: Mon, 26 Oct 2026 17:17:04 -0700
In-Reply-To: <6ad78978.b5bd089a.6b57.008d.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6adfed80.6200f071.51519.0efd.GAE@google.com>
Subject: Re: [syzbot] [block?] possible deadlock in blkdev_buffered_write
From: syzbot <syzbot+bd975ef54294bec73f0e@syzkaller.appspotmail.com>
To: axboe@kernel.dk, bvanassche@acm.org, hch@lst.de, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	mzx199711@gmail.com, sunjunchao@bytedance.com, 
	syzkaller-bugs@googlegroups.com, tz2294@columbia.edu
Content-Type: text/plain; charset="UTF-8"

syzbot has bisected this issue to:

commit 1b1be9ea4e34ccede1e7cf9ff2b6317328a5b6ad
Author: Julian Sun <sunjunchao@bytedance.com>
Date:   Thu Oct 15 09:11:05 2026 +0000

    block: take the inode lock for buffered write fallback

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=165121e1580000
start commit:   21a7f44fd076 Merge tag 'devicetree-for-7.4' of git://git.k..
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=155121e1580000
console output: https://syzkaller.appspot.com/x/log.txt?x=115121e1580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=cb217ea80b9f9fe
dashboard link: https://syzkaller.appspot.com/bug?extid=bd975ef54294bec73f0e
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1634b469580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=108dd695580000

Reported-by: syzbot+bd975ef54294bec73f0e@syzkaller.appspotmail.com
Fixes: 1b1be9ea4e34 ("block: take the inode lock for buffered write fallback")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
