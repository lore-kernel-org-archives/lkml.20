Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793536281;
	b=AlxSevU07Q+LHVMQZrIIpEjJuEatoggoKisl6c5n+zKfshGQUUZJ2z1/lK6pCTXklC8b
	 oPXpAZFdiiG2zgf8dVdsE370+3acnx9wIuiwt+YeKztaAQ3/4zIV11pZ3WHRRdTxxbdGv
	 l91vSAY9wkBLsjZ3cfEYh9B/GNhqX7nX2rU1xkT4hb9BnYono6CSybkGjTfUxhe93+eRM
	 YwrwW74egdoEGs55u2RLnnnGlunxkR+VSILA9SfBp1a8xn2M4wjizRv0Qp46u7VsbDOfV
	 uERhpJpfFnmMf2P9cOgNdJyliYUGHQVp4rfKY+as0MUSCrsMvRcDy5PHJafA0XzWK1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793536281;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Cc:Content-Type;
	bh=mpG7rekE9P1Lsc2DlbgAaKzCw23xHmyFFTEJHmMozf4=;
	b=2FDmF+NPRllHQcA3+QD5wuwPx/hQm2LGZP3RF0i/63uFBgvPC4z8JJhflgmheXIVms7u
	 SefQUhEuizvHzfCnl8gNwl+lwl5w/3HoPiWdRIdVI75rXmp4VNKwT1TbVvT3ppAnUfDus
	 I8EBjiN8pXe2Jz6lruF5tzuTgxbTR4IImtMmQOu7+1mG57/BDhanX7RF3xJtdp15ECMSj
	 bKKv9qQP92AOBVlP2asROyFGioRGxBt9zWBAx6KjOwJMsscDAi3fZzcqHWSmmuR+zCTeV
	 2Vo9MTS25CmOxR8pUedQWOIYQKj+MSCfM1qx0gkImdrKqxFq1+MwZeWAWUtuh8D37lw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.197
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0763606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 12:31:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0763606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4f8281066c4so2996363b6e.2
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 04:31:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793536280; x=1794141080;
        h=content-type:cc:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mpG7rekE9P1Lsc2DlbgAaKzCw23xHmyFFTEJHmMozf4=;
        b=Ko0ZrvqagSRkg+fMsKN2cqdKA5bs3xrVJUQPGj4DtBrndiFE5OSyuh9hAFRwoYkolg
         pK5+uOg75UjG/zfKim9a0BoqKwBVum8E4lnx4SS4FimYqwb3jSHhnOoVrELB4MNPBLC3
         4XWm7GBnmdy0ZINxvVmGX/ZLadKKfe6aD0tewD2aDxf3/bZi7C2xxY4u0UHiA2/KcrXx
         08whFNgWnzVtET1UFkqRtYploXM0L+X3LjJAoy4EJKYFD48+5URw1J4x9KR+kB5FPVW3
         Ael6EsYHU+gBtATfcqAdGjwOPETnpLKgIvhRPMt7sPQ5LrAvvsk/G3ijosUNnN8t4KMA
         5F2w==
X-Forwarded-Encrypted: i=1; AKwUvBx8Gl+nNuXTaZ1YoqRAqU1/rbZfJZSf0kQv0T5y3t7izbfCqiil6Eb7NgY5K0hr6tkY/b71QZXWK0BkjJk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKEzumZkNfZjwtNNRDSnLoflBGgRMvVLrRjqx7Cwz7G+GDE+3r6
	vwOrqrbfaoqPrhqps/5QxekJf9OYR3tL5mrsChPj95dwP2jEhAlwyBHxAtTjI3UAUMBOObMyUjw
	MTPijcwdZPvjd0SOZkolx6T+cXmaqaq+XQAx84+aEX/Wg6UUPtCsjLMVxrM8=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:bd1:b0:4ca:8d6f:4258 with SMTP id
 5614622812f47-5640de8c633mr4713639b6e.37.1793536279887; Sun, 01 Nov 2026
 04:31:19 -0800 (PST)
Date: Sun, 01 Nov 2026 04:31:19 -0800
In-Reply-To: <CAGUpAYkgbVV3Y1XJdQyv_GY7T0pSvaC909ct0fWs3sSXFWs9CQ@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ae73117.c8ffc79a.e3697.0022.GAE@google.com>
Subject: Re: kernel BUG in sysfs_break_active_protection
From: syzbot <syzbot+dcad997ed2b5bd95cc5e@syzkaller.appspotmail.com>
To: sajal2005gupta@gmail.com
Cc: sajal2005gupta@gmail.com, syzkaller-bugs@googlegroups.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> #syz test: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=7649ba73f9e7e1e04d0b46213e39c79ae09dd55c

I've failed to parse your command.
Did you perhaps forget to provide the branch name, or added an extra ':'?
Please use one of the two supported formats:
1. #syz test
2. #syz test: repo branch-or-commit-hash
Note the lack of ':' in option 1.

