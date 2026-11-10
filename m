Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794311576;
	b=uLelckjUYJa//ydPhF19GpRD3MX3dmaqlRlcveogB0Y4RJstuoFrLMR5Pt+/1uCVDUxV
	 cdx8/FxHYccdifgzkwy3vw2qOXzb5mpNtJK7KPBbGdMZ6+M5Gdl2u/qVftXa+6/kJNzFq
	 05cvO1GPFLKR1+Ky/yzf6/a9rh4vPLdNmWJVmF4sgESgutbAqborHISQ0Sht65UMFe5oB
	 xMtS0F4pfim6cOIDenE4sa7ya46faksIKzGvzkq0VPVmLNrpISJPdmYGhoYpxEGdEsVsz
	 03UIfuInobJH6XSqeauH4XIbnzF0XZ2ydKbrzsrw1c29KxnKT3xWbxyixxLbuOxZ+yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794311576;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:In-Reply-To:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=MqD7s1aCuXI6FZ4esSYsm7/ZQZSzrZDblW6g0swkePU=;
	b=cVQq1+KHTfXbjn4yXXqIgbHXliUKH4pOr1FHHO+4gnspd2EpytMfxt4F0cm3dLTjQcRK
	 3n+bLvWYyR3/TwgIjMEd5bvO1ZrHArne2m/zMJsJkFB+I+0QKIHP82TAihm1xalGpdxzm
	 crAvam1AYOv/K0KXLO3H2zyaoLQTxLzILUAAOVd0Yp+hNWLmeNoOZg09piW9CaQ04cVII
	 g6x1RT/xOP+03T40GlQc2EpWqSwTOyiv35Cex8p85/eny7OyQ7jpDnafihNky8OSQgoxp
	 gJB4MHrs2JQCa2Tr2IJyFPx/bASL+qRH9E8VBZsyfXhhpWZaPmHPVPYbBQ2UAB70Ccw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.200
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0405A606A333
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 11:52:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0405A606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4ea2c058e67so2203282b6e.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 03:52:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794311575; x=1794916375;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MqD7s1aCuXI6FZ4esSYsm7/ZQZSzrZDblW6g0swkePU=;
        b=E5vxo13anmvbVXJqQYt/tFJEn4Y0/kvdO1QsGDgCI7Ual2K6PtUwHBzRa8d0iwMuse
         qB28k7Kt9Qd2H39aDuY0BWj4FkFUAxVlFXIzLn2lsZhSISXy6+KgIP4D2zP5Ks9irZgd
         drNHwlrKOYDmGGV8ju4JT7Zm875oaiKkeqkaKHukfUjjR42vZ0ncCUKdSiUFKm/c1qzP
         zt3I79iEXsVkKE07B1bsjB7KfBVkLdUWAoNvvPTxlsfFKA4ZC9+1IiLE3KevJKb9p//H
         QNWP5WreEA7WoT3IQwDDxgxYMOU2JNT8WtgGVSDnJn7xyzQqzEOWumxgCD8GxfQYdXkk
         o1YA==
X-Gm-Message-State: APuU4Z8pXg2xUG7v6yW4x3IzZtPCpg/Q4n17smY16xXBZvMTqiafeC69
	4owVYmImutH7Egg55hvdsTNkj4JeRGbyeoAAybCadYMEBgUdeSc4snUIHnGWDYgaUbeh+ccrA93
	nfKlcARRT6JGMgoIrkbmJ+dHeZG5pV/QTC/20ml1nBKzi601fJAji2Ntm4BM=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:50ac:b0:4f6:5279:5c75 with SMTP id
 5614622812f47-5683cd1fb82mr1904715b6e.28.1794311575011; Tue, 10 Nov 2026
 03:52:55 -0800 (PST)
Date: Tue, 10 Nov 2026 03:52:54 -0800
In-Reply-To: <6a8c5208.dbb3a75c.7844.0005.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6af30596.c2a1e073.10a5a1.116e.GAE@google.com>
Subject: Forwarded: Re: [syzbot] [usb?] [input?] INFO: task hung in usb_set_configuration
From: syzbot <syzbot+c22bb42560ec86726aba@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: Re: [syzbot] [usb?] [input?] INFO: task hung in usb_set_configuration
Author: gbughunter8@gmail.com

#syz test:
https://storage.googleapis.com/vrp-syzbot-rce-842629920185-1108/bare-repo-docker-hostmount-1110-e7a52de
e7a52de5070170f0f0096310790e0ec7a46ba0fb
