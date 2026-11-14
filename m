Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794616014;
	b=F2tAIfZWE9AL0iuF9MH8adhTWQog8ai2RwLM/6STbVWPG/wjq3B0lj8lGXwKLdYH28lo
	 GWFGXvAlC7ZF/IgMOy5NgxCfLirOSfRblBZGfvgoc0MTTuzvGLw1iCbiBHCs2fWbrjb5i
	 XNurXhWfqLgMq4jWkP9d/JwCzlbkS4R/F+tDbs3EMkdh+kM9miB56y6S4mHk3ecsKPAJR
	 RK9icc1fPNbXMwIStZxvrb3VrDG5HINRBs5n94j32tspxlNEqK9Bh3gewitX0yjCaFf4K
	 +vYvRSDPHR3tlGAcYWMh+eQW6xFt2PIDnFvoWhwPfSRwoHH0nNSdBEabY3cYnpcG47g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794616014;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=qELRNAVaIgFR6qPOh/no43Bw75GkkUFI653vrqTrH8M=;
	b=xWG608UQbSlZm0DlC7vcFn4MQs93QWAYEjsjkauVS8I4bkHOS5GG9yt6Hfy87Omy1hD5
	 GTjkl/LZeGRSxT4nymiu+BSIbxX+D2Qf8kyUyqY8Pv1qEXCTmnFPQDs3VUblKHSBFJGyl
	 8dT//4jr8DPF22HeWR2zEHQFAlkcDgDIpKo3TAHEqzAxkwHfIUR1TG7OU7LRwyVnfQ4HG
	 TGbYux7I4+MF0xlN5f+IuDHfrx/nh+FXbIq3Mhsj6w3K+Al6ChTCA/zAgRjGh1n+D3fdS
	 L0wTMwJt2e7KppVA0cThR6/HQ4SilI9UA1xoSRz8K95MZmkZkiXQPZtyNrp9J63e/qw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dMuC75hw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F016606A327
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 00:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dMuC75hw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CECE21F000C8
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 00:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794616013;
	bh=qELRNAVaIgFR6qPOh/no43Bw75GkkUFI653vrqTrH8M=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=dMuC75hwnViRMw2m8IO4Z/sEUVo66DAMUsmfpBbHiu9dGq89PizZbUJa4Ln/1RfE7
	 i/zSjpv2LuVosTj25/Qc5oNigCkVWwG20Rs9+N9lD017IJ5RkAvY5mJsgNSxaOe3iJ
	 8L3tQ0aFPcTLpW2FtOqFBUqb/oakTJsF40MyZ9NN81Vq97JR7ePAJ0Ca9a+xVPHZy+
	 AqQY9CC3n2sEX5/Y5qU9jweIPRi/E6XKvBJROIOEDVtxlcNtE2ilnUwx3QBOlpcOUi
	 dHSPXGgawWYdg2LkQjMtnMJZXPOo1SNlVzcS+eANxJwlkn8SosbVMpJ5uQytH8OITg
	 z89Fmi2VREvaw==
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c4d473cfff6so252349866b.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 16:26:53 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGzNOs9InuQ1uFIrMDLYghqjQZ5KG2svsalf+4fa5JaSkYCR6uGovq99ZwdY6QLIJcXanFbS1HYHvOsNAY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9clptN+Sd5kxmetfDRTAk3rvx6tTlxAWhr7n9aDxSZx5u98Akk
	f8+ZbmWRKbt+lLm0lh9+ZsnqE+n5CcQsi7aBiuvDWaUi4KhOAQP9hyzugk3+eKZqBC9+vL4unyH
	rnKdK364o7NhfbiGfUuERIMYLfE2G0iM=
X-Received: by 2002:a17:907:6d02:b0:c46:9ca9:f524 with SMTP id
 a640c23a62f3a-c50963b6917mr375016666b.32.1794616012385; Fri, 13 Nov 2026
 16:26:52 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113221610.392113-1-koray.fra@gmail.com>
In-Reply-To: <20261113221610.392113-1-koray.fra@gmail.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Sat, 14 Nov 2026 09:26:40 +0900
X-Gmail-Original-Message-ID: <CAKYAXd-X_u1CapKjpLPJF+ecUo5LN15Zj9T8bLguhyYWY7YrWQ@mail.gmail.com>
X-Gm-Features: AclHuK9SY2N95JqQXsUxzHPNoOBpk9fQTVDaT5aU9XnoxTNc6u6Ls8u8uyAxWOA
Message-ID: <CAKYAXd-X_u1CapKjpLPJF+ecUo5LN15Zj9T8bLguhyYWY7YrWQ@mail.gmail.com>
Subject: Re: [PATCH] ksmbd: decode and honor DOS attribute validity flags
To: koraynilay <koray.fra@gmail.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, Tom Talpey <tom@talpey.com>, 
	ChenXiaoSong <chenxiaosong@chenxiaosong.com>, Hyunchul Lee <hyc.lee@gmail.com>, 
	linux-cifs@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 14, 2026 at 7:16=E2=80=AFAM koraynilay <koray.fra@gmail.com> wr=
ote:
>
> Currently, when setting file attributes via FSCTL_SET_SPARSE,
> FSCTL_SET_COMPRESSION or FileBasicInformation, ksmbd hardcodes
> flags =3D 0x51 (XATTR_DOSINFO_ATTRIB | XATTR_DOSINFO_CREATE_TIME |
> XATTR_DOSINFO_ITIME). This injects unrequested creation time and itime
> into user.DOSATTRIB on disk, even though the client only requested an
> attribute modification.
>
> Furthermore, ndr_decode_dos_attr() discards the validity flags on read
> by reading them into NULL. When reading a file with an attribute-only
> xattr (flags =3D 0x01, where create_time on disk is 0), ksmbd treats the =
0
> as a valid timestamp and reports NTTIME(0) instead of falling back to
> the underlying filesystem's btime. Modifying any attribute via
> set_file_basic_info() then clobbers the xattr back to 0x51.
>
> Fix this by:
> 1. decoding da->flags in ndr_decode_dos_attr() and only updating
>    create_time and itime if their validity flags are set (in
>    smb2_update_xattrs() and ksmbd_vfs_fill_dentry_attrs());
> 2. reading existing attributes and only setting XATTR_DOSINFO_ATTRIB in
>    fsctl_set_sparse(), __ksmbd_vfs_set_compression(), and
>    set_file_basic_info() so unrequested timestamps are not injected.
>
> Reproducer, with /tmp as the local filesystem folder exported as [test]
> in ksmbd.conf and /mnt as the smb folder mounted with mount -t cifs:
>
>   mount -t cifs //127.0.0.1/test /mnt -o username=3Duser,password=3Dpass
>
> test with sparse (for compression, use chattr +c instead of fallocate):
>
>   echo data > /tmp/sparse.txt
>   chmod 777 /tmp/sparse.txt
>
>   stat -c 'Local btime (%n): %w' /tmp/sparse.txt
>   getfattr -n user.DOSATTRIB -e hex /tmp/sparse.txt
>
>   # punching hole via CIFS triggers FSCTL_SET_SPARSE
>   fallocate -p -o 0 -l 4 /mnt/sparse.txt
>   getfattr -n user.DOSATTRIB -e hex /tmp/sparse.txt
>
>   stat -c 'CIFS btime (%n):  %w' /mnt/sparse.txt
>   smbclient //127.0.0.1/test -U user%pass -c 'allinfo sparse.txt'
>
>   # evict cache so btime is read fresh again
>   umount /mnt
>   mount -t cifs //127.0.0.1/test /mnt -o username=3Duser,password=3Dpass
>   stat -c 'CIFS btime (%n):  %w' /mnt/sparse.txt
>
> which prints:
>
>   Local btime (/tmp/sparse.txt): 2026-11-13 21:13:27.167926440 +0000
>   /tmp/sparse.txt: user.DOSATTRIB: No such attribute
>
>   # file: tmp/sparse.txt
>   user.DOSATTRIB=3D0x0000040004000000510000002002000000000000000000002095=
42d3b373dd01
>      0x51 =3D 0x1 | 0x10 | 0x40 -----^^         |      unrequested --^^^^=
^^^^^^^^^^^^
>    (ATTRIB | CREATE_TIME | ITIME)             |   creation time =3D btime
>                                      SPARSE --^
>   CIFS btime (/mnt/sparse.txt):  2026-11-13 21:13:27.167926400 +0000
>   [...]
>   create_time:    Fri Nov 13 21:13:27 2026 UTC
>   [...]
>   CIFS btime (/mnt/sparse.txt):  2026-11-13 21:13:27.167926400 +0000
>
> test with setmode:
>
>   echo data > /tmp/attrib.txt
>   chmod 777 /tmp/attrib.txt
>
>   stat -c 'Local btime (%n): %w' /tmp/attrib.txt
>   getfattr -n user.DOSATTRIB -e hex /tmp/attrib.txt
>
>   # modify attribute via CIFS
>   smbclient //127.0.0.1/test -U user%pass -c 'setmode attrib.txt +r'
>   getfattr -n user.DOSATTRIB -e hex /tmp/attrib.txt
>
>   stat -c 'CIFS btime (%n):  %w' /mnt/attrib.txt
>   smbclient //127.0.0.1/test -U user%pass -c 'allinfo attrib.txt'
>
>   # evict cache so btime is read fresh again
>   umount /mnt
>   mount -t cifs //127.0.0.1/test /mnt -o username=3Duser,password=3Dpass
>   stat -c 'CIFS btime (%n):  %w' /mnt/attrib.txt
>
> which prints:
>
>   Local btime (/tmp/attrib.txt): 2026-11-13 21:13:27.195647069 +0000
>   /tmp/attrib.txt: user.DOSATTRIB: No such attribute
>
>   # file: tmp/attrib.txt
>   user.DOSATTRIB=3D0x000004000400000051000000210000000000000000000000f6cf=
46d3b373dd01
>      0x51 =3D 0x1 | 0x10 | 0x40 -----^^       |        unrequested --^^^^=
^^^^^^^^^^^^
>    (ATTRIB | CREATE_TIME | ITIME)           |     creation time =3D btime
>                                  READONLY --^
>   CIFS btime (/mnt/attrib.txt):  2026-11-13 21:13:27.195647000 +0000
>   [...]
>   create_time:    Fri Nov 13 21:13:27 2026 UTC
>   [...]
>   CIFS btime (/mnt/attrib.txt):  2026-11-13 21:13:27.195647000 +0000
>
> After this patch, the outputs should be:
>
> sparse:
>
>   Local btime (/tmp/sparse.txt): 2026-11-13 21:20:25.856425751 +0000
>   /tmp/sparse.txt: user.DOSATTRIB: No such attribute
>   # file: tmp/sparse.txt
>   user.DOSATTRIB=3D0x0000040004000000010000002002000000000000000000000000=
000000000000
>           0x01 =3D 0x1 (ATTRIB) -----^^         | no creation time --^^^^=
^^^^^^^^^^^^
>                                      SPARSE --^
>   CIFS btime (/mnt/sparse.txt):  2026-11-13 21:20:25.856425700 +0000
>   create_time:    Fri Nov 13 21:20:26 2026 UTC
>   CIFS btime (/mnt/sparse.txt):  2026-11-13 21:20:25.856425700 +0000
>
> setmode:
>
>   Local btime (/tmp/attrib.txt): 2026-11-13 21:20:25.976415893 +0000
>   /tmp/attrib.txt: user.DOSATTRIB: No such attribute
>   # file: tmp/attrib.txt
>   user.DOSATTRIB=3D0x0000040004000000010000002100000000000000000000000000=
000000000000
>           0x01 =3D 0x1 (ATTRIB) -----^^       |   no creation time --^^^^=
^^^^^^^^^^^^
>                                  READONLY --^
>   CIFS btime (/mnt/attrib.txt):  2026-11-13 21:20:25.976415800 +0000
>   create_time:    Fri Nov 13 21:20:26 2026 UTC
>   CIFS btime (/mnt/attrib.txt):  2026-11-13 21:20:25.976415800 +0000
>
> Fixes: e2f34481b24d ("cifsd: add server-side procedures for SMB3") # ndr =
decode/basic info
> Fixes: f44158485826 ("cifsd: add file operations") # ksmbd_vfs_fill_dentr=
y_attrs
> Fixes: 159e727f763d ("ksmbd: persist FSCTL_SET_SPARSE state") # sparse
> Fixes: 0fb327626ad9 ("ksmbd: support file compression attributes") # comp=
ression
> Cc: stable@vger.kernel.org
> Assisted-by: Gemini:3.8-flash-high antigravity-cli-1.5.3
> Signed-off-by: koraynilay <koray.fra@gmail.com>
Can you check Sashiko's review comments ?

https://sashiko.dev/#/patchset/20261113221610.392113-1-koray.fra%40gmail.co=
m

Thanks.
