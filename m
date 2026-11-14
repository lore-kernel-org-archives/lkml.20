Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794617931;
	b=xrNuKSEy5Kczvr7pP+cOCtAS5SReHnBRNVxamsyAt3IpmoOIh9ybW6Uc7qPAmCCOYGjQ
	 jLc9AELCsibE8ZsovJDRe17zW4TGgwbalI2nbOIQMrbNH1Asye8EComQQaGmzUhugvhoD
	 KvMjjMdzhLZkiqql9XROCVUOe60huoJAVsWOHTnf7A6sTySiA3sOHEI8KsyMKvlE9eqC5
	 nmsTpXLzHWinZLTtUu+sTbNjuRcUY8ASgqp78r6QNWPtT2tsKw06FCUZpPcofnRRmXsNd
	 s5qBeITe89BsZ44s/2hGYOdsw5WRs3uiPbKxplqeKwKQtA3F6d1/fPXLRqUTx73QRtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794617931;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:X-Mailer:
	 References:In-Reply-To;
	bh=crOpJ2cqOy+GjGG0L4IaOXRwYaty5nWl+NmdzCXk0qo=;
	b=40Q0HiDI/9T7CdM4vlcwaMhuNXKrKckeyQgY9vRivMvuq4qxV5BVFr9qOP3ofw20t8G9
	 UwelLbZ4DcRngsAqVDi3NGnRhTJ+6eVPsCXurdH1jRFN5+mrNlNKOhsXq3r5D4NXzS+s5
	 INbZFKZGJhI8y6bicv5ZAeFhXs+ksQ0YiSGRk0tP61wCQMtEB7feE0XVsWP9qMQo9tZoY
	 gZWaIShNl7MepXstba+e7J6aq1urv9vphiPRcHYgWriOl03wQJDmn7ZEq38CHoNIvPYpE
	 qsiQU/SQK5h8ZRCLNzNqEAK6cGBvdmDdgiVS4mXZ7Odb3YVjxmDLDYIgLXJYwKYmZhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="M/qg9xkW";
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B485B606A330
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 00:58:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B485B606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M/qg9xkW
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-491971ac844so1678026f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 16:58:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794617929; x=1795222729; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=crOpJ2cqOy+GjGG0L4IaOXRwYaty5nWl+NmdzCXk0qo=;
        b=M/qg9xkWolKuD5YqNDfw+VHAlP0rrU7QaaJLRpncd01ZY/EOuRZU3xnWy4NAyAAt9Z
         dMT2k4F8LmSOvGEXcfs8WHpPdX2WOFnWoFPkUpxjp+JdYsGYKH45yzDNo/W+hcnG23Ud
         LQPcA0dt2kPo5oIAme/wADlCZg5FilYxwXcmBOsko0qMUY1wjtBmPOXXDG/SSMX8pWuF
         o+SigH5SSxJhFMuzrhdnIZBXxT/+9FBC1hcwHgV0fBr5VjCZu5vau2jLRC+DKnaTNAgS
         y0StImCtWyH1Z0Ic5SFtnqcSE4bk1STutneW9FQhSQG0IHS8X/V0jhnPWZ55FWT6qtwe
         /PsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794617929; x=1795222729;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=crOpJ2cqOy+GjGG0L4IaOXRwYaty5nWl+NmdzCXk0qo=;
        b=2y2P283tOe1zEXe781v/WXve8NRzIOaQlsoOx0Pc2vBbuhU12csm09KTYqpExsUj2F
         OKZ0FoKJTu0rAi4HfXsHs8qOKt+DtbUf1ebalTRqUxbSAsOosSINYpY0lo5L82KfxQd6
         0JpBt9wDcY86JHi+Y5udSkavozznZ0d0PpCc9v4V3DUo0Lwj7QRVm64JiXqN8HhHeO3x
         FcQObQsAeUFFg8698P3i9XZn+5rPDC+yTdXEiaGgjFCwaANellR7feAdTJ4pn2FG5BAe
         rukqr6dlqNJMTn1n/MYgf3ZWFxAvmvcbzRgV/sQaHeCWXvMNggefEEQZR6cMb1L+CphD
         6ZgA==
X-Forwarded-Encrypted: i=1; AL+hErH5eIkegXS7v18TVgUaAJefMPOFPry1mLSgIkrODohPevtK40ZU7GysTbpFz7j+Q3maRb/mvFUcMBzO12w=@vger.kernel.org
X-Gm-Message-State: APuU4Z/QOtrWPnyWAdaCoB1g+mPwH5MzoWMQPnwNryNeYhHy97/ZLmaX
	87PdSYY35nrEomVL/Bpztl8t8cyNrINKtbGfPhV/hvCUsIiavz7D0H2S
X-Gm-Gg: AYBFou2Z/O7DYJJe+LvAXf7TaDc2Dr+U1xKIYhMaKgbrNZ+4Z+dLQbaqWXoVVsV9jep
	pJ5ElCeBGyjK/nhrx7EBc5S2C3NG4OnBLzov7zyD1h9ozHXCgmm+LUEdGl9tOqHJMdYO0h6desr
	jA3qQGoILh2Jrc0y+rEXH1fK9PZZSv+gL/3u0yTDYw5CpfXJaxab4yYzykna1twT7UMj0aYyOoy
	0TyHTQSMniOrZyEBpqG/wK7vvc6HGccUKAtvOa4V0BIU8oQ5tBaTSQsqUoxfNgTRSdE+gMcrfib
	djHu8OOvy0Uarp2G3+yskdadejgDGgLVXQtPbN+7kgfU6JaXNNz+Ep60ozuY819mCX/8DHc6S/4
	aZqovy0/3NqWa5Zug8G1yzPtYzw4W8zgxLrYsTYUOR4TOjlgtwsP0LMED1FX4nVxDf+6bF234vh
	/dHFEMzhuYKI4FZd8Tx6jOZPIdduUX0AejbmdVliNvYXcKIyWOD/HXypUCQatbS5TRQYzB/ruQf
	g5bCx+ydx8zNJmh8A/sFASFa989hWQ0t8XsWkx4/C8DY2MLPNwLAe9AptfCRja9FBfTFS1hbOpd
	bXbMNpqHj/gq4A0UDn7JVysb3SI=
X-Received: by 2002:adf:e18f:0:b0:491:895b:4c02 with SMTP id ffacd0b85a97d-49c713ae4d2mr8542490f8f.23.1794617928804;
        Fri, 13 Nov 2026 16:58:48 -0800 (PST)
Received: from localhost ([2001:b07:5d26:7a6a:365a:60ff:fe0d:cfc6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c607d12c4sm7604135f8f.41.2026.11.13.16.58.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 16:58:46 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=1074bd5dedbe45ba3972039c5e99707aeb3248ade54706ce7dc6c0e646f7;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Sat, 14 Nov 2026 01:58:45 +0100
Message-Id: <DMUIYLA1N1WI.58082D8BPB0T@gmail.com>
To: "Namjae Jeon" <linkinjeon@kernel.org>, "koraynilay"
 <koray.fra@gmail.com>
Cc: "Sergey Senozhatsky" <senozhatsky@chromium.org>, "Tom Talpey"
 <tom@talpey.com>, "ChenXiaoSong" <chenxiaosong@chenxiaosong.com>, "Hyunchul
 Lee" <hyc.lee@gmail.com>, <linux-cifs@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ksmbd: decode and honor DOS attribute validity flags
From: "koraynilay" <koray.fra@gmail.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261113221610.392113-1-koray.fra@gmail.com>
 <CAKYAXd-X_u1CapKjpLPJF+ecUo5LN15Zj9T8bLguhyYWY7YrWQ@mail.gmail.com>
In-Reply-To: <CAKYAXd-X_u1CapKjpLPJF+ecUo5LN15Zj9T8bLguhyYWY7YrWQ@mail.gmail.com>

--1074bd5dedbe45ba3972039c5e99707aeb3248ade54706ce7dc6c0e646f7
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Sat Nov 14, 2026 at 1:26 AM CET, Namjae Jeon wrote:
> On Sat, Nov 14, 2026 at 7:16=E2=80=AFAM koraynilay <koray.fra@gmail.com> =
wrote:
>>
>> Currently, when setting file attributes via FSCTL_SET_SPARSE,
>> FSCTL_SET_COMPRESSION or FileBasicInformation, ksmbd hardcodes
>> flags =3D 0x51 (XATTR_DOSINFO_ATTRIB | XATTR_DOSINFO_CREATE_TIME |
>> XATTR_DOSINFO_ITIME). This injects unrequested creation time and itime
>> into user.DOSATTRIB on disk, even though the client only requested an
>> attribute modification.
>>
>> Furthermore, ndr_decode_dos_attr() discards the validity flags on read
>> by reading them into NULL. When reading a file with an attribute-only
>> xattr (flags =3D 0x01, where create_time on disk is 0), ksmbd treats the=
 0
>> as a valid timestamp and reports NTTIME(0) instead of falling back to
>> the underlying filesystem's btime. Modifying any attribute via
>> set_file_basic_info() then clobbers the xattr back to 0x51.
>>
>> Fix this by:
>> 1. decoding da->flags in ndr_decode_dos_attr() and only updating
>>    create_time and itime if their validity flags are set (in
>>    smb2_update_xattrs() and ksmbd_vfs_fill_dentry_attrs());
>> 2. reading existing attributes and only setting XATTR_DOSINFO_ATTRIB in
>>    fsctl_set_sparse(), __ksmbd_vfs_set_compression(), and
>>    set_file_basic_info() so unrequested timestamps are not injected.
>>
>> Reproducer, with /tmp as the local filesystem folder exported as [test]
>> in ksmbd.conf and /mnt as the smb folder mounted with mount -t cifs:
>>
>>   mount -t cifs //127.0.0.1/test /mnt -o username=3Duser,password=3Dpass
>>
>> test with sparse (for compression, use chattr +c instead of fallocate):
>>
>>   echo data > /tmp/sparse.txt
>>   chmod 777 /tmp/sparse.txt
>>
>>   stat -c 'Local btime (%n): %w' /tmp/sparse.txt
>>   getfattr -n user.DOSATTRIB -e hex /tmp/sparse.txt
>>
>>   # punching hole via CIFS triggers FSCTL_SET_SPARSE
>>   fallocate -p -o 0 -l 4 /mnt/sparse.txt
>>   getfattr -n user.DOSATTRIB -e hex /tmp/sparse.txt
>>
>>   stat -c 'CIFS btime (%n):  %w' /mnt/sparse.txt
>>   smbclient //127.0.0.1/test -U user%pass -c 'allinfo sparse.txt'
>>
>>   # evict cache so btime is read fresh again
>>   umount /mnt
>>   mount -t cifs //127.0.0.1/test /mnt -o username=3Duser,password=3Dpass
>>   stat -c 'CIFS btime (%n):  %w' /mnt/sparse.txt
>>
>> which prints:
>>
>>   Local btime (/tmp/sparse.txt): 2026-11-13 21:13:27.167926440 +0000
>>   /tmp/sparse.txt: user.DOSATTRIB: No such attribute
>>
>>   # file: tmp/sparse.txt
>>   user.DOSATTRIB=3D0x000004000400000051000000200200000000000000000000209=
542d3b373dd01
>>      0x51 =3D 0x1 | 0x10 | 0x40 -----^^         |      unrequested --^^^=
^^^^^^^^^^^^^
>>    (ATTRIB | CREATE_TIME | ITIME)             |   creation time =3D btim=
e
>>                                      SPARSE --^
>>   CIFS btime (/mnt/sparse.txt):  2026-11-13 21:13:27.167926400 +0000
>>   [...]
>>   create_time:    Fri Nov 13 21:13:27 2026 UTC
>>   [...]
>>   CIFS btime (/mnt/sparse.txt):  2026-11-13 21:13:27.167926400 +0000
>>
>> test with setmode:
>>
>>   echo data > /tmp/attrib.txt
>>   chmod 777 /tmp/attrib.txt
>>
>>   stat -c 'Local btime (%n): %w' /tmp/attrib.txt
>>   getfattr -n user.DOSATTRIB -e hex /tmp/attrib.txt
>>
>>   # modify attribute via CIFS
>>   smbclient //127.0.0.1/test -U user%pass -c 'setmode attrib.txt +r'
>>   getfattr -n user.DOSATTRIB -e hex /tmp/attrib.txt
>>
>>   stat -c 'CIFS btime (%n):  %w' /mnt/attrib.txt
>>   smbclient //127.0.0.1/test -U user%pass -c 'allinfo attrib.txt'
>>
>>   # evict cache so btime is read fresh again
>>   umount /mnt
>>   mount -t cifs //127.0.0.1/test /mnt -o username=3Duser,password=3Dpass
>>   stat -c 'CIFS btime (%n):  %w' /mnt/attrib.txt
>>
>> which prints:
>>
>>   Local btime (/tmp/attrib.txt): 2026-11-13 21:13:27.195647069 +0000
>>   /tmp/attrib.txt: user.DOSATTRIB: No such attribute
>>
>>   # file: tmp/attrib.txt
>>   user.DOSATTRIB=3D0x000004000400000051000000210000000000000000000000f6c=
f46d3b373dd01
>>      0x51 =3D 0x1 | 0x10 | 0x40 -----^^       |        unrequested --^^^=
^^^^^^^^^^^^^
>>    (ATTRIB | CREATE_TIME | ITIME)           |     creation time =3D btim=
e
>>                                  READONLY --^
>>   CIFS btime (/mnt/attrib.txt):  2026-11-13 21:13:27.195647000 +0000
>>   [...]
>>   create_time:    Fri Nov 13 21:13:27 2026 UTC
>>   [...]
>>   CIFS btime (/mnt/attrib.txt):  2026-11-13 21:13:27.195647000 +0000
>>
>> After this patch, the outputs should be:
>>
>> sparse:
>>
>>   Local btime (/tmp/sparse.txt): 2026-11-13 21:20:25.856425751 +0000
>>   /tmp/sparse.txt: user.DOSATTRIB: No such attribute
>>   # file: tmp/sparse.txt
>>   user.DOSATTRIB=3D0x000004000400000001000000200200000000000000000000000=
0000000000000
>>           0x01 =3D 0x1 (ATTRIB) -----^^         | no creation time --^^^=
^^^^^^^^^^^^^
>>                                      SPARSE --^
>>   CIFS btime (/mnt/sparse.txt):  2026-11-13 21:20:25.856425700 +0000
>>   create_time:    Fri Nov 13 21:20:26 2026 UTC
>>   CIFS btime (/mnt/sparse.txt):  2026-11-13 21:20:25.856425700 +0000
>>
>> setmode:
>>
>>   Local btime (/tmp/attrib.txt): 2026-11-13 21:20:25.976415893 +0000
>>   /tmp/attrib.txt: user.DOSATTRIB: No such attribute
>>   # file: tmp/attrib.txt
>>   user.DOSATTRIB=3D0x000004000400000001000000210000000000000000000000000=
0000000000000
>>           0x01 =3D 0x1 (ATTRIB) -----^^       |   no creation time --^^^=
^^^^^^^^^^^^^
>>                                  READONLY --^
>>   CIFS btime (/mnt/attrib.txt):  2026-11-13 21:20:25.976415800 +0000
>>   create_time:    Fri Nov 13 21:20:26 2026 UTC
>>   CIFS btime (/mnt/attrib.txt):  2026-11-13 21:20:25.976415800 +0000
>>
>> Fixes: e2f34481b24d ("cifsd: add server-side procedures for SMB3") # ndr=
 decode/basic info
>> Fixes: f44158485826 ("cifsd: add file operations") # ksmbd_vfs_fill_dent=
ry_attrs
>> Fixes: 159e727f763d ("ksmbd: persist FSCTL_SET_SPARSE state") # sparse
>> Fixes: 0fb327626ad9 ("ksmbd: support file compression attributes") # com=
pression
>> Cc: stable@vger.kernel.org
>> Assisted-by: Gemini:3.8-flash-high antigravity-cli-1.5.3
>> Signed-off-by: koraynilay <koray.fra@gmail.com>
> Can you check Sashiko's review comments ?
>
> https://sashiko.dev/#/patchset/20261113221610.392113-1-koray.fra%40gmail.=
com

Yes thanks, I am able to reproduce what sashiko said, I'll send a v2.

Best,
koraynilay

>
> Thanks.



--1074bd5dedbe45ba3972039c5e99707aeb3248ade54706ce7dc6c0e646f7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSgVimKafU5DQMcjcDmj22qf5IGXAUCaveyRQAKCRDmj22qf5IG
XLkAAQCk4kn1twGLgYRkTmV9wGbuAfIgxtpE0meq6TbIXtuOkAEAn/vMht7ADRhO
5f7Ep0WUqPBfRfstcbovrcOEm2I4KAU=
=oaAq
-----END PGP SIGNATURE-----

--1074bd5dedbe45ba3972039c5e99707aeb3248ade54706ce7dc6c0e646f7--
