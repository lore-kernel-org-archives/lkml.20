Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794441263;
	b=jBC0a0pe7mDZXTzdfj6dKkm/uVGvsQeGU/Tapjp1CTOW9Gf17mkjbHJVZDH2OJao7tiE
	 8qDmtvHkPin/Kj/OhPQgQ+NgBwtRRiu8eiR9HmqgKwOlWllMpjkEo0gq/uixmSYrwr2GP
	 twI181ZpKJbo3n1q96nQ9Hzzvq4IeGKGGVw/7vCgViG0qD/fZHdwcmaBHvTpBzZ3bRHrq
	 qfIOcj0Z+3IvjCHJ6WIq37zsUuWlt6c4yhNRBceB3cLu3fMSXXY5M3AtTG+VOLzc9NLks
	 3xggNFmkFf0XSdvLkZIHTCv3lhe+1WO1miNvN7I1lyBd48qAXr//KpoAt+PiDqV3PtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794441263;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Cc:Content-Type;
	bh=6hvRL75Sd0pUBWS6I/jWhKcY4osoWlDblLbNOo9/Pwk=;
	b=wiGWUxdzZwDykSNyNFt+K6rEQ48R9hSP92KmcgprVBo/j9xA3QP4/UdblWoYNl17KXTL
	 lap0Zgd4kN/GgKuoYhwC2ySuQ30gYvhkFYcdaAmgaCLywb+JhK4gBuyCaIghhUgJzgMf0
	 UJ+mtDTjbKN+9tfq+FBVU4HWCNTEHamRruKWAULjmWfrGwmncyI/k6GvGO7OH3Vtyhd2H
	 D+3FjakCiUFLa+7e2f1KtL2QLZW0BJJNlC+bhI5Ei6GT9VLDTR4FMhwTCtlUlfezdyrdD
	 qbTMXSf3IycUVxwXQwn9vfS8AWUhozPEF2aevVTdC352UVXZ2vY5/ZsJiIPi89XCxDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.160.69
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C76C6606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 23:54:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C76C6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-4519ef1babeso2206388fac.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 15:54:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794441262; x=1795046062;
        h=content-type:cc:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6hvRL75Sd0pUBWS6I/jWhKcY4osoWlDblLbNOo9/Pwk=;
        b=Mx9ogsxMrLaH4NEzs2w+jsU8yXZdjpIG0jeHdelcWOVvKv72Byv74aCLZSYgvJDM+p
         +pppihHRcW3qBAPbYTNK8NZ9US8yBZPHizZM2ldUy1lb6kz33SFv5Ev4u/VnhDHKiff9
         tlROqNWfUmCky7uQwlrnCjSD+uDuBDXtHLLneRHTaA4WeR3ti2/MgIlwE1hQoQ8Wl4ES
         QBCi3TIgChebZQ8DQ4LxR3ojd/no97bXgpS8RXN7ex8bHEdMUq79RxvDyDvD2QC+3y8H
         G9rJruXUpWQG0Haf9lrudAy27B9QuNx6cYerpER5roSOM05tHiTHgQnnrFSkLARS3RuG
         0wOQ==
X-Forwarded-Encrypted: i=1; AL+hErG6SuNBLEU2inq5v6ZTtxRNO6YiA+LdcSUX+jcplVGp0CX7Kd/yEreDqCAj0KUyeyBk+2RJb9VusMqhGPA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8x0C45Lm9of+ScUc4Jgld9LqGZf7CTm2woSuiImZaILboSH5Vz
	XXUCiYtKyEdJHGCrFmwyl1/U1HPosNftuj5RtXs+z0NamFk3YsgeMklpneQIy3DnHCpMSt2kweh
	HNUM6f4T5/4bOtWGiMAwFDIvu9gvpUt3ocN+aPli/iV7GNHGFicWjJ7U/YIA=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1382:b0:567:f784:f939 with SMTP id
 5614622812f47-56b9791019amr3339444b6e.51.1794441261627; Wed, 11 Nov 2026
 15:54:21 -0800 (PST)
Date: Wed, 11 Nov 2026 15:54:21 -0800
In-Reply-To: <20261111235403.447-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6af5002d.4fb38a5b.96541.0001.GAE@google.com>
Subject: Re: [syzbot] [bluetooth?] WARNING in disable_delayed_work_sync
From: syzbot <syzbot+b1146b58a9d6d90e0eb4@syzkaller.appspotmail.com>
To: hdanton@sina.com
Cc: hdanton@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

>> Date: Tue, 10 Nov 2026 00:23:39 -0800	[thread overview]
>> Hello,
>> 
>> syzbot found the following issue on:
>> 
>> HEAD commit:    58c1eb84e977 arm64: sdei: Preserve the interrupted context..
>> git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
>> console output: https://syzkaller.appspot.com/x/log.txt?x=1070f24e580000
>> kernel config:  https://syzkaller.appspot.com/x/.config?x=a58b6b4d667e7a61
>> dashboard link: https://syzkaller.appspot.com/bug?extid=b1146b58a9d6d90e0eb4
>> compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
>> userspace arch: arm64
>> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12869155580000
>
> #syz test: upstream  master

Patch testing via #syz test is temporarily disabled.
See https://github.com/google/syzkaller/issues/8122 for details.

>
> --- x/net/bluetooth/hci_conn.c
> +++ y/net/bluetooth/hci_conn.c
> @@ -1151,6 +1151,7 @@ static struct hci_conn *__hci_conn_add(s
>  	}
>  
>  	hci_conn_init_sysfs(conn);
> +	hci_conn_get(conn);
>  	return conn;
>  }
>  
> @@ -1316,6 +1317,7 @@ void hci_conn_del(struct hci_conn *conn)
>  	 * rest of hci_conn_del.
>  	 */
>  	hci_conn_cleanup(conn);
> +	hci_conn_put(conn);
>  
>  	/* Dequeue callbacks using connection pointer as data */
>  	hci_cmd_sync_dequeue(hdev, NULL, conn, NULL);
> --
