Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794907924;
	b=BrmWuTwz51u5KUKgn7rzlVydTb2TNp5YFR9mlEZEgx87fADkz4yWJIm+tjgVYMIrR5ZQ
	 c0MeYaZkPfDnTf5eJfRW2434hhcM5cL1Afx8wi2C2JnyWdPd+JD53pGVmgQ/bak/7IU1E
	 d51n1DORdIdzmvx3UzCU+Y1lJcgaAcrLrp3lMuwqKbmkgNxOQ5ibMue+Fkk+W1A46XDVj
	 545AubM/gtm1aHiXLzsddJcfvNSyK1SRU6kXYRRMZb1nrIIDtJonPbSnTuOa6NnUtxyC1
	 PjYR5bJUhRaccDzyTonVVY+rLZAh464xywG1N77/fJtoq6vPh+uKBjX5UNsD6cKe0UQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794907924;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Cc:Content-Type;
	bh=4un0kp8sNSsI4XZVc+UiacVDGNAtWdGxvZc3BbYfmJw=;
	b=au3CUdb7/wSAxa4hKkRlGtsYEwpGPAioV5qfNfQNTeQl11pQqYgJorinDPNirQcitTmv
	 4fGPDDBphSd40RA0V5CIP355QM3Nl57W2RlZuJ3VXLs6l8wNj0kATI4ZFy9tY/bLeULly
	 UmK1hNrzvBMZSLhGxp3vRMO6GzOBe5CwFC5g7sIyzswD055ttgug3BWyM6zu8wnGN1END
	 UA7xCOH03G6jcX9HRzuEyfK7WA0QKvK46Ng2L30godoyFJ/rYwKwVDGyKcOljJx0KLBod
	 4BIWOIz6F9GHMa1El8WYqo6CvR4RoelqkyvagtqCmXOThNb84s02OJDfmdg955lVQmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.200
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B9D606A329
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:32:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3B9D606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4c7f887ac6bso5886511b6e.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 01:32:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794907922; x=1795512722;
        h=content-type:cc:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4un0kp8sNSsI4XZVc+UiacVDGNAtWdGxvZc3BbYfmJw=;
        b=FehYkEO304dsS98cKgMspiplWSpiuauLViajosbCUqsyPzK+WaEHTZkTiPQBliFUxm
         OG6iYjbnDWSSu36zlI3h2TaCisTMWqI8tX3VKZPtukAx1tgiBT7O2yKXlo89nwCdSrjg
         2hH8sVBuYm9ckFDS8j+uRnve1f096Q//K3MqAVru1WMYUVCkyFR+6wdRPZvjNIPsIpol
         H2jFM7YMBCIwsNVBY/2/NB+Zjn/MBD3fEu8iV15CQk9jBd4LmQcBTNwRVgSKBWMzJH20
         KVZYUFHyHrENz7rRsDgvVfNV8NKJx1/f8igR7bwX017ozRvaKh4CAir5ZY7/96FDArnN
         2F3w==
X-Forwarded-Encrypted: i=1; AL+hErGgtCTl7htoOnDO8w0SDrtHvfg2JeJAb6dCbhqj7ztefsvqgu5QoqMl7xqxdcjyu6eMU6VcWnCZNB9Za/4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8WTHuHwASWZKyRdBzeYQvsFKU7nPOFOYwP89Yd8KdS6aZlLRrO
	JJuOGyWo0r5P+/NMRLsRg/8mKxT4AVwPnnwJKclQyYnniAZxjvkF5NJ3ewOMmX5E3YrNMph25x0
	IKCeI2BG58jxKoQSpLVuaXrHYKWv+pKoG7YAM3oy8w3dbqR+So/84ecF25b8=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:152b:b0:4d6:9113:25ad with SMTP id
 5614622812f47-56e6531ea51mr10159095b6e.48.1794907922715; Tue, 17 Nov 2026
 01:32:02 -0800 (PST)
Date: Tue, 17 Nov 2026 01:32:02 -0800
In-Reply-To: <c1831270-955b-4a66-bc64-a406e555a9b2@yandex.ru>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6afc1f12.c689c5d3.5389b.0051.GAE@google.com>
Subject: Re: #syz test https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
 666539eecdf4db623f5e3c3e55cf9f2dfad24aa4
From: syzbot <syzbot+ffac2da5e6f8ad2671b2@syzkaller.appspotmail.com>
To: dmantipov@yandex.ru
Cc: dmantipov@yandex.ru, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

> #syz test https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 666539eecdf4db623f5e3c3e55cf9f2dfad24aa4

Command #1:
Patch testing via #syz test is temporarily disabled.
See https://github.com/google/syzkaller/issues/8122 for details.

Command #2:
Patch testing via #syz test is temporarily disabled.
See https://github.com/google/syzkaller/issues/8122 for details.

