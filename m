Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792951082;
	b=NPQXlP30w6rJ9lsvfp0V+CW0KzIAU2GD6MqZbJs2578FH0NNd1pV1OlqL2gl6FA8m5mN
	 zW5AKr3MFJyIfNX/jfKsz3v7gvfdD4cLwkWw7YjoCrJ4fbJuXfm1jQ7gM+yYHkWXbytcK
	 GMkoBZVZij2kJW29jRxaxx8l7H9Q0zOP4XP35ly9rHE1LKvaC7lQ1fjP7rf3pLTZG9RUn
	 BiFfXrUAJ34c2lCA9kn4G/FdICxP2lDCuGChkUEd+cf/HG/fT9eOowQGkH8rbSgo68d0f
	 gltNAxcnTQKYGmOZkjB7njb6ogfRnSJdIRJoYk/0jmGZ2N8n/lXwtVY6jFaGg0aPDFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792951082;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Content-Type:Mime-Version:Subject:
	 In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:
	 To:X-Mailer;
	bh=h/7CMMXb0XP5aeeK6rQQs5bYKdlB/H7i9hQ25pXziZo=;
	b=Opv0SL61wvwNHisBMo2E0keEwidyO7XCuH6X7ZF6MBpkNyAYgdJtOvSoHZutIFnVx+jA
	 zBuKC8h39xuzDBuv5adQgaOmaBgb57QxwRyrrXhowFnViJhA0OzsOxYysUKLOxIVfcPKd
	 1X95WN9TN/rLJ/PIW677ouMvTJqDxYK2Ts+YwIABEkuCV3b2iEr8zi2py7DAD9JtO9/Xs
	 1W9bOMfza6Cq50Ujxa2zlz8v7zelnuTYouPohZsU/hSqBdJQSNr28+nOiTY3yQoix2Uu9
	 inCHxDa92S5FYxysXBmUluG42dfps4N+Vx/T3tfXGrd0vF2KcFxEO5lmBBBhP3Ri16Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=R1UmO7eV;
	arc=none smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30880606A31B
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 17:58:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30880606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=R1UmO7eV
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b1f4d8e09aso3399944a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 10:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792951080; x=1793555880; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:subject:mime-version:content-type:from:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=h/7CMMXb0XP5aeeK6rQQs5bYKdlB/H7i9hQ25pXziZo=;
        b=R1UmO7eVu7WDISFDPX8D+6yL3wZcIlWn4bBK/7lMVDqS8x+40CHubiJJDlUlNx0w08
         gu4yAMB+K1wh5q22ZN9DPpMEapMPgSUqbnoHqrZ1Dm0dUip0+vhOcsvKkmiMUnjzOzJi
         91upT30T5dkp0ar5oX6gpzYNjqeiBBlhDpS/ezSZLJzZH19Ebym5V9qle/wTW+mpZNxf
         MCZQELS9uH1levcBIUcbNqIdxU1TV+m+hQ/aOusv4T4sWJP4vtX+KDU61vhuQq9aY1gd
         2JFBlh8MnRDnRAazIG3m6uNBJUBENMvx+jKW5WGmKnxz+we+fVLZSj/EYEk+LXHbVo/R
         nG0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792951080; x=1793555880;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:subject:mime-version:content-type:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h/7CMMXb0XP5aeeK6rQQs5bYKdlB/H7i9hQ25pXziZo=;
        b=mtB7RH77tAZiShwh3Hr+04TZmylDAnLfp3SkDJwKw+rsyh8tLXSUDH1QHbEZbXRe2m
         pc3n2Rm9qi2VtMk9e8RZUdgeX4ZVERSFhCbpYTzrcXYxejGy420y2lvaeCJKM0whq2Nu
         X4FbI6/XVkxH4M8H/bUGMK0j/ibuCqH7r/t3jyNfwLVKuKOIuSSPZn5liNsxy0XeytiG
         6myu9M0EK82eaR0AQjXFZAbbnkj4ZQgVkhCzgGBkyZHJ5oNFEtM+11ueBPlaHri27Acf
         fWtwhPFYTAHA7mDrljZ1ho3RFO/+kgAHqq3QYpzKgr8tHA2PncmJ0lqORgvvSQBaOpOX
         TOoA==
X-Forwarded-Encrypted: i=1; AKwUvBxEw/X9fieXO+PoAjZvk/MaTXmx2wpZcSqbpgkg2Cuug0kOC0h9vs5MicdCFQDQgjGH8FjQKyTuy5ZMBvs=@vger.kernel.org
X-Gm-Message-State: AFq9FYJdO1ga/HBT/4Hhu4pwgMvBNffOaA6rDx4yDVLWh2hXbUjQLSAm
	AAkZ5Jv7g9lLtAIsK3GUPxFZ3seKegSTfuOyZQv/Gf7/f8zslZiJOz0i
X-Gm-Gg: AYBFou1YzQsJfvPQDTpiZ23GZUIp3KtrOu0RM4uHfO/mcXmHfqZU9Wp+ktZ3Oj5ijeq
	lYZ+pRcv5fyN8lPe1x4x8wmBixn1h1d3gKeIwiYwYg2iG7evE1a6srVjCaclQphVRAEu8N8CGbr
	egvqKU5owzwFpWRoIbbkZyse5bFW4MEnkVit/4LtSFCnG9+E0+qa/obRKzN3kPB1w3X7iF8HIes
	34MKUad81sy4LPhv+oMxnRwIaJQk5Q2rkbFtq+ejQLR3Ony7UB5bSJocFZoPQQOLeOGR+bvdFUp
	f0aX7M9XA0ajRyikL8YgCMN9Im6KcKlBm3jmw2aVwWXzmj5/N8Vjybq9kjHRZ+TPRYrslWWzih1
	avaNmruz5p5e2pL8UKMlMQIwlMo/nVj4td4734WECVxXON3+P1U54tJkw9JVFuT7cZF/vHlBP5a
	EVOaYakcx3MKreEOmnTXkUjjvKfq+nFdxnjWX/13I5ifxf5Fd46AQuiOVpCVtoJb7JBpRR0aEIJ
	NzizUXcp1m8EUqjlFPFK4aKTbAN48fESWWfRBi3InD7wWw0PlQ/n4rXOYeorrT5GYcQw5nJIvOM
	Ww5NW57oQG2Yb2rwU42HdplJbnWrh88Ri0jUcV15csuqJviZbCEUiqXNHb0=
X-Received: by 2002:a17:906:7953:b0:c24:6985:d7a1 with SMTP id a640c23a62f3a-c46bdaf8b32mr614431266b.7.1792951080433;
        Sun, 25 Oct 2026 10:58:00 -0700 (PDT)
Received: from smtpclient.apple (wlan-199066.nbw.tue.nl. [131.155.199.66])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd66fa1asm226620166b.62.2026.10.25.10.57.59
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 25 Oct 2026 10:58:00 -0700 (PDT)
From: mixalhs <mike.michalo@gmail.com>
X-Google-Original-From: mixalhs <Mike.michalo@gmail.com>
Content-Type: text/plain;
	charset=us-ascii
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.700.51.1.1\))
Subject: Re: [syzbot] [cifs?] KASAN: slab-use-after-free Read in
 cifs_crypto_secmech_release
In-Reply-To: <e071a5df45f7ccf80a9d899749e09e11@manguebit.org>
Date: Sun, 25 Oct 2026 18:57:49 +0100
Cc: bharathsm@microsoft.com,
 linkinjeon@kernel.org,
 linux-cifs@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 ronniesahlberg@gmail.com,
 samba-technical@lists.samba.org,
 sprasad@microsoft.com,
 syzbot+c2ec61adfbcb24e5ec20@syzkaller.appspotmail.com,
 syzkaller-bugs@googlegroups.com,
 tom@talpey.com
Content-Transfer-Encoding: 7bit
Message-Id: <18D91F35-4165-4679-A3A7-0B8F9A9E0F5E@gmail.com>
References: <8bb0534e33a5f5d152d2b1768d1fd7c6@manguebit.org>
 <20261024184605.44432-1-mike.michalo@gmail.com>
 <e071a5df45f7ccf80a9d899749e09e11@manguebit.org>
To: Paulo Alcantara <pc@manguebit.org>
X-Mailer: Apple Mail (2.3864.700.51.1.1)

Hi Paulo,

> On 25 Oct 2026, at 18:29, Paulo Alcantara <pc@manguebit.org> wrote:
> 
> Could you please try your reproducer against
> 
>        git://git.manguebit.org/linux.git cifs-next


Done, on cifs-next 9bc48fb48a3, which has Eduard's 77f5fbc2d0af ("smb:
client: hold server info until cifsd exits"). UML x86_64 with KASAN and
PREEMPT, with the same debug msleep(10000) after tcpStatus = CifsExiting
in cifs_put_tcp_session():

 - cifs-next: no KASAN report (the C reproducer once, the Python one
   for 5 rounds).

 - cifs-next with 77f5fbc2d0af reverted: the same slab-use-after-free
   in cifs_crypto_secmech_release() as syzbot, freed by
   clean_demultiplex_info(). So the reproducer still hits the race on
   this tree.

To see both orders of the final put, I added a temporary pr_info() in
cifs_tcp_server_put():

 - with the delay (5 rounds), cifsd drops its reference first in
   clean_demultiplex_info() and cifs_put_tcp_session() frees the server;

 - without the delay (50 rounds), cifs_put_tcp_session() drops its
   reference first and clean_demultiplex_info() frees the server.

No KASAN reports in either case.

Tested-by: Michail Andreas Michalopoulos <mike.michalo@gmail.com>

Thanks,
Michalis


