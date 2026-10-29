Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793257364;
	b=K4FCA4xb0YpEtyxItJRK/OPzQvh/e//dYWgIYjmzJzmW5vBp9O9JfPj/PDK2RO3ldPDO
	 l1LRA2rF+B+joJ/6sB+YISw3zIx818qO/cu0BDpBvLQ7UsJJzBIzEwx4WHCeLbr0b6UeA
	 NiyjOp7YVW3FysiC89mz2xZztvGUd++KY8xTxCRi6iVsWZQsc+lq/cR8z5WkYlGLQvywY
	 F7ikjX/YqSUPRRJX9cnBL26+MKc+wi8aHzZaWJPTsLP7C8S1yDUh0xq8WS0f7fvnRvhjM
	 P5wMTzq43LvAPnyqyAckotQT4YG+U0aguAj5lkg7cti/IJxHqhNnOJKYPuIMUV8bnXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793257364;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:In-Reply-To:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=TLvJ59wbWmWnfkUlqv/XorMqlp49080Ryu8tQgQ5GPg=;
	b=RIFCm5ViBb3/6z00JKGcuNQCkLj92juVFCyOiU2pCDkoM0fqkR8pRqnOE+WbYMw3DhFs
	 FRDDs/IDsDnphwZGtscKG8GXfXyQP169xihd0bp2Wyph+wciWYVJeLMWuUqCT624Vl0Ew
	 LfcsBHvi0o5AP369x6w5PORXBxyTZaJrJr1qpSqrL+SB1C5XcEGvohIHoFWkZdZCTsfuk
	 kukF+ShDkEQ3dT5unlD1Oo8q4kbQm0Y5DXwQRLqsdNmHpXHDM+EKajC0iBdcajqnYDBFi
	 Fx1GqCCKhOb9NuxjaASuafkbFQloPL/7phGu04NOBcGNkK/NXVmOLYzQgRmY5DfWyqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.210.69
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A67E606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:02:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A67E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-85c6a056128so341744a34.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 00:02:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793257362; x=1793862162;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TLvJ59wbWmWnfkUlqv/XorMqlp49080Ryu8tQgQ5GPg=;
        b=NjuU11e2kr5sy2/3RqTzdgSsZjJVE9IsrXrnGhWtZnJbSatxp1rZAIoYwVAl85UrLG
         jdYhV9PRcJp2HVO8IWyUqSIG8+lgBHeh6wMpjUTbEhYjO0i02M/xyeqHaCaF2UC/vLhj
         7Yz70B1VIMXelTu3F+vgWXmYborqtUOXTruoti4vR0PNoByAolBChw3Q0ldEkEHKlYLG
         i2JwqK+SvyQvukmNCco7pDCz+bplid8afg8b471Lc6TgfSx4cnVdo4XNkaKsMNDth3Cj
         JwLSip4u+SguJoMgFyAxkqEGGebzweV+ACASIRZA3p5J3kRTm8pPAcGDo+kOqw9Gwzle
         jq/A==
X-Gm-Message-State: AFq9FYLF0Oma6sPzirtdysfFNqcoOZA8eZ6URuiY7yJrflr7jALTIwkc
	2knDfgxh+auK1TDw5tw1eyBlYYn2ckSdS0XAif59C8jZWZ7AcnFEECl+oO1uePCGQdqcFwsmSjA
	7qIbmJpIWxQoQiJ3q//ekZwfqR82bVIjnH8tLZZsHAg+CFWGA4XdrQ0KONk0=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:c215:b0:55c:844:9904 with SMTP id
 5614622812f47-563821820d9mr3418322b6e.17.1793257362685; Thu, 29 Oct 2026
 00:02:42 -0700 (PDT)
Date: Thu, 29 Oct 2026 00:02:42 -0700
In-Reply-To: <6ae09458.f0fe5aea.79aa1.008e.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ae2ef92.84012103.26b497.0757.GAE@google.com>
Subject: Forwarded: Re: [syzbot] [mm?] [usb?] WARNING in corrupted (4)
From: syzbot <syzbot+9fe09db3795456e0b442@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: Re: [syzbot] [mm?] [usb?] WARNING in corrupted (4)
Author: rohithmatham@gmail.com

Please test the attached full v6 patch against the reported kernel.

#syz test:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
5b0764a53235d3c77e1ed674e836e1b3fe1a4b1f
