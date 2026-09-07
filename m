Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98CF42D24B7;
	Mon,  7 Sep 2026 13:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.34.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788787958; cv=none; b=gB1t7rgk3GTtqrVjTVwd+PJOYINZZx81VrTuQW1+47r6F/OJUnp/Jv9uDh063OyJWixl9Ilwf8nJJ1qDYaAQTDGlzAngNtxYbjQh6wtPNQExuLFAhdd4MWuus0GCyDaSLiQvojBljaRMtUfHBzk0ue/0VjWRCUlykpt6Dt92vVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788787958; c=relaxed/simple;
	bh=3i6Li0CU7l1Rgh4uuZwdFPUNMOb7xsjWR2nwI5ss26o=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=ScLXZKpvaLOPazy7QTmuurRgKVAs6PI8YqxeelAUoSLvM4sui0LjJvPDdmO8oY53CWZtk43Lpe1VQH2zaOjRwA0VglKWlnIrEPg6jOwjUnxwi5PXB8VZiaCwHDwdI7hsNV4SCQ2fD4iAM3Ywsg223RKkv50K4rUu3S3DfOdfprI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=ATOFK7Fm; arc=none smtp.client-ip=54.206.34.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="ATOFK7Fm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1788787922;
	bh=ZEmTXG6leUP5+XNZaiVeMKV7GEDu10lUOnGjhlOkZ80=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=ATOFK7Fmp3+8oquUQnZNWWDy00kGt6G6B9KKAojNCtgMgjvilBGkiqqQtdX/VM7bS
	 Qny5tGPuwWHTIBLMPPGOQ2/5QqDd/JQlIqMNfEgmKkvL5zfs4s16LRNRcAB5GFetsx
	 BWuuEbo4aMiBkOIozdAZ+6oMDMmki2oEnlgSoHGg=
X-QQ-mid: zesmtpgz6t1788787916t2f3c7b81
X-QQ-Originating-IP: DhRg0CY9j8rF7xBTdDpxxmzAqLri0Yhao2WsHTrpQ5o=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 07 Sep 2026 21:31:54 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6993455425184562689
EX-QQ-RecipientCnt: 15
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=0df6a61c8d280515c2d06d561c7b93a1a3918a190afb8b3df4ba229d5f70;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Mon, 07 Sep 2026 21:31:51 +0800
Message-Id: <DL94E69AG90Y.5UYVE3ZUKVM6@linux.spacemit.com>
Subject: Re: [PATCH] riscv: dts: spacemit: k3: Drop guest properties from
 M-level IMSIC
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Junhui Liu" <junhui.liu@pigmoral.tech>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Yixun Lan" <dlan@kernel.org>, "Paul
 Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert
 Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, "Guodong
 Xu" <guodong@riscstar.com>
Cc: <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260729-k3-mimsic-fix-v1-1-368c0aec04b9@pigmoral.tech>
In-Reply-To: <20260729-k3-mimsic-fix-v1-1-368c0aec04b9@pigmoral.tech>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MQYXLRAkMyae3pVoiCdb0fzUjtNonytBusSUVbGa3KtvMbgahI9KN3Cb
	/wzfNSJJHgKZ6sjTZcS7C6gzmBOXBgP/UqYOA2/O9+lANzlylMU14Om8aN670g/ffxXzxRO
	yQ68XdGZJfbuBLdSBucq00IX5pUCVURfrCK7C+EJTlrNix0GtmgCsIVX3hZzjREi8fULxtv
	H0JD1azVO4sFIXnAq3j8CBICTKjLSsO/1Ys1gNxCVdo5O3KSPcVj6lSvqi0UQZ/GWLjuiR8
	eUKjhAzU5hFUf/PevgCVMxjpJf6irjpA/2jk1KPulQnu/cC7TEfY8/d2ij/D40B5szm0OPJ
	Oigzh1xnTWO7wNr2Q2rlAOpJDbVlg1xFdjsuE41nxT9hGl6mYeF7quRnbHmPFBG/PK5dXxh
	p++ww0tMDBkrowlsrO5WPyzQtwcQds3asYrDXomlrMPjGdvYQiEVoUvmJhYRAACMB02CgN2
	8vgAuZEFbd8DkwW2eSOZbCQU7ocJGVpvnH9ZGOYRNDYVVZGutMzu80uOdSqDvi6vQlFqCYY
	/BLZaafrl/h/rV0/jmMvvBqMiiOX0LdCvkBfveo+Tz0jQJObJ0ZdnixNuOOgH/dZFiGDQ84
	/mf8broAcBEZoAGpaNSgnTD2iH7lVXbmlL8i96hXbSnqh2TOrkHZQLZ9cgFHpq70WIMaDj4
	e8DmjfgVgSz6yUdZhsEzrPF2aseHkoeq/lc7HeCpUwuMDnSeBFTIacy1aJaH5NPN4uPCfn7
	GGy3Uwkt3hMVMSYaSQtRImIXMaVljBlU1Y26e0YzDUW8FsiGtx70NVKffw4JdJMoXQA67VP
	QjlMAG33Ees2OvRD2bhXvApWW8PdzajTirqINrGmcj2aYy5NhLEx/Z+0aTJ97tHNZBLZe/3
	XwPfww3Pix4B2HnGMznLB63Bkr4f61Iq/KHCTO+jZ/beBZSox4qZNUzBiQi9WcOyVR8Zwde
	LYskDz0lPz7rW4iC0jYD7WkmUqMb8oQFIZlIvpo742a0Zo0ExnfURP9IAt2jVbMcEWtwez2
	CosBKe/LdNaBvlhVQ2GenlW1BPJJTzQmzX9/D7McDN6BxkmCke3VrRKnUZgMARNnfHCwPhn
	O2X6HBgD/7zf6eATG5M2UdnnY4aIxPgICA0KFlnIRRvy2eRemJNNwijjYb7rulHE3Hh70yN
	fSuf7U+7DI36c+wpC3lXPcGRyMT3r9jhT7G8
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0

--0df6a61c8d280515c2d06d561c7b93a1a3918a190afb8b3df4ba229d5f70
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Wed Jul 29, 2026 at 12:40 AM +08, Junhui Liu wrote:
> The mimsic node describes the machine-level IMSIC, whose MMIO region is
> 0x10000 (64 KiB) for all 8 harts. However, the node also specifies
> riscv,guest-index-bits =3D <6>, and per the AIA specification the
> per-hart stride is 2^(guest-index-bits + 12) bytes when guest interrupt
> files exist, i.e. 2^(6 + 12) =3D 256 KiB per hart and 2 MiB for all 8
> harts. The described region cannot hold even a single hart's files, so
> the node contradicts itself. OpenSBI enforces exactly this constraint in
> imsic_data_check() and rejects the node with -EINVAL, preventing the
> M-level IMSIC from initializing:
>
>   fdt_driver_init_by_offset: interrupt-controller@f1000000 (riscv,imsics)=
 init failed: -3
>   init_coldboot: irqchip init failed (error -3)
>
> Moreover, guest interrupt files exist to act as the supervisor-level
> interrupt files of virtual harts; there is no machine-level counterpart.
> riscv,num-guest-ids is equally meaningless for the machine-level IMSIC.
>
> Drop both "riscv,guest-index-bits" and "riscv,num-guest-ids" properties
> from the mimsic node so the node matches the actual hardware layout.
>
> Fixes: 56f37e391a62 ("riscv: dts: spacemit: add initial support for K3 So=
C")
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>


--=20
Troy Mitchell


--0df6a61c8d280515c2d06d561c7b93a1a3918a190afb8b3df4ba229d5f70
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIMEABYKACsWIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCap68xw0caUB0cm95LXku
b3JnAAoJEJgJ74D5MzQvldUBAJ6M7+KX40iCUzFCv5w47J6P/N3znLSudDzUSWro
+szzAQCKafnfOzZlrLTMIbBAaDUGndm9JQ6yL6H0DXT5m2mFDg==
=Saha
-----END PGP SIGNATURE-----

--0df6a61c8d280515c2d06d561c7b93a1a3918a190afb8b3df4ba229d5f70--
