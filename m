Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794341332;
	b=q7o9S8rXQBwtX5aXN97xUkhgREtxXcUUxgZL3pw30Kaq/oMwxDefiV0mzBxfDyXBIa8I
	 T921M0qDbeGjDHV2SL45YqnR8fs6roOSaLMPGcDaCKclKJIX3ry8oXo03a83xOQLozg9Z
	 C+ZJpsd5XnMu4+RecdGduGkmzjHLxt1N8YXo6AYdRG9UOnGSPYpgvJPDUyOmDnhbQoQhX
	 a5H88cxAJLUsTNsX/sfrdV/19FY0juq3AQ22dVTZnFilRcy8S8W+qYHqTp6QEvPME4+/o
	 fDNVk3rX3o1E58VN0KgDdvSMf5h5QsJucQZrZycYnWQ5gj+WuvTFKm7fRJ9LwYQNKrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794341332;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:In-Reply-To:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=ZP2Fe3koDl4uSxWttKnHnfjoafxgV3VZpx0Gt7lWXvI=;
	b=AqYbGIxw+nkYzS9rtNtvY5OjX7mDNw1dmQYadC4D++iaTWX5ywPQwJ6rvIwR0oE6F9Jp
	 V9QoiFSkmMRWsOdmjcWixHEgqfSi2gnXe647dUbzJlQZWFm8sCVxHfTfpsSSn9X8gY8u7
	 HHZijb4MVMfSP11jBAOD63P3DxVr5RnRoYeralI65yt7O6ZTXh0k9eu76OlmQI+wNFs6X
	 XODLkb1nSTefmJEwytnoJUxds+czFM8qW9S9cCJQdECrppT4xnHLrDKiyKZJBY0T3HpN6
	 NwtgAXoN8+2hSrB8nkYUex0HdJ83GUq2T8H/gB3l6piLBMvI74Cga4bHK2DS+wE/9Og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.200
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD26C606A323
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 20:08:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD26C606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4a7de733fa9so2799880b6e.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 12:08:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794341331; x=1794946131;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZP2Fe3koDl4uSxWttKnHnfjoafxgV3VZpx0Gt7lWXvI=;
        b=pyf/InsqnygYFlKOryCx7MJXk0XN4FNwQsc3IZkWOtyhNKh+uUJ4p0UuhLKgCZlJ6n
         mw5O7/yTDdjc2yA9afVZrBLiCZ+nQ+eNSNNvwGONNDGIijDDMiJU0mPV1OySeZdwdEWr
         OErg7j2nQaTbl9xiBxuF+pXRKPCaw1b2vucKxdMhMED4QrdeEt6dy7pWcOuVQkyT3agr
         +helQe9YozgvRJ79EqhTHNby0T8fxzprCko4hukcHXm9bBOrNmV1tA5gN4J0SjL67BdI
         qNyIXq4/UCnIJYeuA+umEi7HNEqMEUhDqejTWXako7TGs1A0LkfGWXjy17eyHdcKlUSw
         i1NQ==
X-Gm-Message-State: APuU4Z8Iq1rnEfhEvQC+mrP2lwpQF5a5VcC65AhAVHVm9k2b0fJJbDY1
	zoF5mg+mHOB4qPZKhi8xmqxUp1YLVDVSpm/FtxUrRc9JR4vdjhfpl4G1gngCV6MP178tDa4OjsF
	4wO7y69Q1EtKhiF8JAo731FJeH9zymnCsXUbC1q3xtNQw5df0NyUHZOZb93k=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1b8b:b0:4f3:68d6:f131 with SMTP id
 5614622812f47-56b93243300mr63908b6e.2.1794341330770; Tue, 10 Nov 2026
 12:08:50 -0800 (PST)
Date: Tue, 10 Nov 2026 12:08:50 -0800
In-Reply-To: <6a8c5208.dbb3a75c.7844.0005.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6af379d2.6ea51c61.3838e6.0015.GAE@google.com>
Subject: Forwarded: Re: [syzbot] [usb?] [input?] INFO: task hung in usb_set_configuration
From: syzbot <syzbot+c22bb42560ec86726aba@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: Re: [syzbot] [usb?] [input?] INFO: task hung in usb_set_configuration
Author: vrpcloudbughunter@gmail.com

#syz test:
https://storage.googleapis.com/vrp-syzbot-rce-842629920185-1108/bare-repo-setns-hostproof-1110-02e4cad
02e4cad6bb36e58f65d297bc3f66b190dee5b443
