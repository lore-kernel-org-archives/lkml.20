Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793953124;
	b=ZyDziVY5g3HWLdaKDNnEgv1MpIfZbfTh8gqmzbMORYdgtqG+whGFiMqjaRcYdirqybYi
	 QH6lLbujSI7/hyQcogneaEhRZIha03of1d+ArFpUQJQ9sHfheDKpDEBmsiXU3VAURf40/
	 BVQ4dJWFP8TVcmGzlTm5EKngD/0YugsteW5AwTPqPfhZ98ptvumxvWobvDGPd1FSRJZ0v
	 1ni/+bAqbfCWpzHp4eF0lFOgFRRV8OBKn4Xtmk34uYSzqV2VAV7NweG1CJBecQ6P7OVbL
	 HLNRAHdSetchgAJp25fbTVok+yOrebXnQYn6bPfY9D7p6I23XJVNKW9yL+4bd8efOEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793953124;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:In-Reply-To:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=SJBSSNmw/PBpZ/bsU+/TWQTAZfGGAkmtz10xDZB/z3w=;
	b=tI36yukMMvM4SAgtl+3FQu3bNbpjdN5E49PyivUEZcbGvpOGS1+aykn31ys/u/UoQEUg
	 WSCSqU+hqeCk3btf8zpHSs+JtnyKlbG3q4fkgLXv98s90OVWbt/gYmYB5p+mi/HMyFkj5
	 A9k6sBN5um0jlY0sPqyjF70pChkbUejugpNuDOUKfY0EDLtH0cs6R4WyVC61dj5jGkat+
	 NROGn5cVFBRqOLSS41yuWAJOho/Q2gW+Fks9EHQObujHZNHTAisPdQG2I+cr7rT3tnHaD
	 SoqJh/nQeTE9hEPaNvMyZRtBFrd459gPk7sNvv+P2cdbrDWpgMDo4iWux99pFJSpZqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.199
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61E73606A328
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 08:18:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61E73606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4dab94dc3e7so659649b6e.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 00:18:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793953123; x=1794557923;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SJBSSNmw/PBpZ/bsU+/TWQTAZfGGAkmtz10xDZB/z3w=;
        b=hQ7db+Vbs89NlekyzYsVh7fkOvX0UyN7WyCr0wMGxw1vXmODyPe5iEk6knKz2tY7eA
         svQ7c17Jus7bsdBGNVj29Ll6d1czo70p98lM4cum7FbddTdVpBpQBlVfrCXYV3IDAhab
         zx6XibxBf99wVl4EEaTsUuPRcZzsFNO+gUDHlzITJ4zbj/Knkp+ibsE/Trj8bbYHsiC1
         ObCiLXyvTGKuvEcm7zLPi2E0h0qA0dfKFuhHgDqRZ/QRRX1G9rzbqFvHuTCVT5+5Kr1y
         CGC61tb0nCVf5wXqWUMR9dmexg1vWt6F5ByRuLn+dYvZWLd684TAEEDHN9S/oMWBnL7I
         n8/Q==
X-Gm-Message-State: APuU4Z/Hz2AwU2QEfoeq4hSIqUND3rAdrudVZfo1xfENHUPm3zYPUqcC
	qzRpGuAtvvpqEpmlsst0majYzqWTI1QgdKIZVby5c2O0EtDTrrxonFyFZ8lGzkQS8JOA4bEfPfF
	7j8rD7CUOB3iKHu0/ms3FqOcjzEWal52AutHRJ2WqqiOwlpEuxlGlspoQ3Nw=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:10d3:b0:539:df4e:2d25 with SMTP id
 5614622812f47-567e105f24cmr1356425b6e.28.1793953123225; Fri, 06 Nov 2026
 00:18:43 -0800 (PST)
Date: Fri, 06 Nov 2026 00:18:43 -0800
In-Reply-To: <6aecf26b.382bd2ce.33e041.0002.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aed8d63.02d3f859.2829d1.000e.GAE@google.com>
Subject: Forwarded: Re: [syzbot] [netfilter?] WARNING in xt_dnat_target_v2
From: syzbot <syzbot+2e819f6641708bb6ab9d@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: Re: [syzbot] [netfilter?] WARNING in xt_dnat_target_v2
Author: xujiahao@cmss.chinamobile.com

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master

Testing the attached patch for this crash.
