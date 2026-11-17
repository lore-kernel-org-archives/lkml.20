Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794904110;
	b=q8Ir2o3IJktGGo81DG5JGHu6BOdwiBArXHbupdBkYwIvMGn4oDh6biwDSwISKqHr5CIo
	 12czgeaelUJt43sMfnhZtRQlCTu5CqeuhdAO8dwHsO5us3FTyusElQqzTSeYPT6iYwjGn
	 cOHgNx3ZXvA/pF4tt/S/bVWQiFEHiqojBWRmGUQjk84ZQ8mnmtP1QmhU2hRJMozx75Jro
	 PefiJx73ApxVvb1kJf7evMxyEUycwgH7Z1M8pZwmeSOOKDcxSNf8/G0Nl2NoNXE2Ij6jZ
	 Uy0Dl6OlX4TLamS6gfJNsqPVxRJ+1lB4gupJIGXaYgFFaU6B/9MJPHSukJKzTPXwSZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794904110;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=80nJ9mfJsz3UGKSZAnLQ0A7kD85nyx4H/r5vYSV/3QM=;
	b=FZPv2UIenDlE520zWZhDow9rXOf8j0UbmvluEYlt+Bm5lfCBfRCwuskNxE2A6LbXMugP
	 DuwmqjPhT5IE9t1mYaUnJhOP/RBOqzrrgKRC70Zj6ckmDO3UTlimDI3WpV3NqXctJ3IS7
	 ogP3CdG9PO1UrPp3rhGN6IH9l9myhwSpQoWcouPmMXfBbwk8QDj96OiS5BFaH4zJLY0KO
	 jmClEY/NW/U3tTuiaAAQAuLmWMGD/+DKVNwDI6sJjNobExGqX/HEqRzo481rSz1AN83qf
	 lwnfDVI1iKTtTWqjUxP/YNzkIQ+3h+zMyAjkeVRwkXp9OGGDpYG3UHMi2HvW8vDId5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="lDHE/E60";
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAE1F60A260C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:28:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EAE1F60A260C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=lDHE/E60
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso36239985e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 00:28:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794904108; x=1795508908; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=80nJ9mfJsz3UGKSZAnLQ0A7kD85nyx4H/r5vYSV/3QM=;
        b=lDHE/E60fAF7y/GcfWe7zssqpibfABjaDWc4DbPAbANFwY7mipSCQzk/tGna/Yk9Yp
         5M31Ja6Q4S90Eg4jWdoE2GH6TurYV9Y9Yxd6SoBGFySZlSGgcD3Nf8Ac20Morq/IEeLi
         HZNDCkpilOoqmPVEk/N5paMQG+RjNO9OhPzIDtVn6k+5pNMY8rSlnV+zGCrptyxwBw8i
         uHdMwH/Pby0zhrQLCKl2b6izfUmExSZrUoQCnWP4NFP78u9vhGGyVwUcvE3no1VAV9ln
         DDlxdlg3j7mlBLcF1wQFzdXfstbmRKgVspXMjOajtHMeg5NsSNAba7k+RMZ1HFntU+s+
         8A0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794904108; x=1795508908;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=80nJ9mfJsz3UGKSZAnLQ0A7kD85nyx4H/r5vYSV/3QM=;
        b=A1PJEtXCebKMVvisIR7ZU8qOEdnCkr4gJq/VOFe3tWTLEqh0pFdJtkIE+dlFcHt6o8
         c37JGcrf0JNnvJw6Kks/Fzz3s4xoCs9rECXdRyFBJWDUM1Flt4gG/A4Ssx9XWljwIOhY
         68xvFy9OaRBxIgw0DdrM4UBLwp2Zd7ThLKpzXwYAjPuLLLJ5b6E0fKa5/mhihZ0UFeJ5
         QW/xMQYMvOHP2jT4R5kJvltUB6wRlBUQNbRu8puXj82mj255CAbHvY/0Iy0poplHOYgd
         ChEFeGC6jnzE38RagqmsWFtBhMgdrTKtrDWEqSdYLxL3QoD6mYkpf4WJUi0wBGLRmbkK
         kReg==
X-Forwarded-Encrypted: i=1; AL+hErGpxOnZBBLdWkYMjizmQHn+xrtn1rV0ny1jd0BuidCoK/FyPSe7lx6FriBxamHp5x842DAMNyvl69OJ8KA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Qtie5UWZxUfhg9srXpKg9vhUvkv00ViluhF4U/YP7dBSnrMs3
	DzUSh+h/eSD0Sx9qcZ5PuIwIgZLPE0Nt/ExAEbuZUI/Bc3EbADdkPJqPSARe008yVOwj
X-Gm-Gg: AYBFou3do8lKoGdUFz4cUBmE81zemokecSfTW28bNPYOqJu6sn4c5b9oCQ11TqJbHDN
	2JuPFwUeN1yAlGhg5k9u4ySIpSxeupz27y89UR2e+yuDuUcUzoPrb2kV1wkhrZ9ajTZIDjDuQyt
	EiYptjaSrun+DAl9B9UBfjX2Uo/ePtmnosUsHQbXYw9H6pZudoKP/AiqWoqVTSy3bQjByBrmK/e
	kuERI1PXPTShBxHa78N3qh3l4qJvhv780WJ52pNkOaiFsJ4HKmyMoPju1qrPMcGP0mb7JLQGLhr
	rjnU1woAR9EYaMPR/6lDqRUxuNj81No/8Cey9d8FsI+9g1HSABGpOOQ6dQUJsUJ82kYWvmE8nHn
	q0TZq/lz+Og3b3ADiyKiSxryK7MvfKRoWzR0xaqKBVYvAxKc0r128YERhu96FLRU7n4wnTwpxAR
	qlWM1RphYo3IZzcpazaK9V+y019CiBirgTybGIsUXbkxOiqOs5fLCeRJDfubTQvbv8iIIY3QRTt
	Wb5sq03n6+ew01k3COSTKb7j0AjFZvqdADonlVAJQtKzir/8ORg+OTs5aKwqCcayAPnsGbI2cLn
	PioIBi8glvxfJWhoCV7B+tw22ddBJg1ubXx6LxzG5CtGrxyXexyd+fN8sItrNPTcN1e5yVT1aVH
	/PC51C4atSjFCoxFQpT6k/qhIW474eHPl43C6v9FBQxWZ4KsjlZpleXmG
X-Received: by 2002:a05:600c:6286:b0:4a1:7e77:c382 with SMTP id 5b1f17b1804b1-4bb55a5d634mr255399085e9.5.1794904108278;
        Tue, 17 Nov 2026 00:28:28 -0800 (PST)
Received: from ?IPv6:2003:cf:572c:2800:de4c:6789:33ce:97c2? (p200300cf572c2800de4c678933ce97c2.dip0.t-ipconnect.de. [2003:cf:572c:2800:de4c:6789:33ce:97c2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb78422d2dsm75197335e9.10.2026.11.17.00.28.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:28:27 -0800 (PST)
Message-ID: <afc070a816e3ae5eb3c9e2d62d4f25c59ee61df2.camel@amutable.com>
Subject: Re: [PATCH RFC v3 26/44] xenfs: use fc_init_pseudo()
From: Alexander Mikhalitsyn <alex@amutable.com>
To: Christian Brauner <brauner@kernel.org>, linux-fsdevel@vger.kernel.org
Cc: Jann Horn <jannh@google.com>, Chris Mason <mason@kernel.org>, Josef
 Bacik	 <josef@toxicpanda.com>, Christoph Hellwig <hch@lst.de>, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-nvme@lists.infradead.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 Jan Kara <jack@suse.cz>, linux-scsi@vger.kernel.org,
 target-devel@vger.kernel.org, 	driver-core@lists.linux.dev,
 linux-mm@kvack.org, bpf@vger.kernel.org, 
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org, 
	apparmor@lists.ubuntu.com, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, 	fuse-devel@lists.linux.dev,
 linux-efi@vger.kernel.org, 	xen-devel@lists.xenproject.org,
 ocfs2-devel@lists.linux.dev, 	linux-s390@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, 	linux-usb@vger.kernel.org, Amir Goldstein
 <amir73il@gmail.com>, 	linux-erofs@lists.ozlabs.org,
 linux-kselftest@vger.kernel.org, Chris Down	 <chris@chrisdown.name>
Date: Tue, 17 Nov 2026 09:28:26 +0100
In-Reply-To: <20261116-work-loop-pseudo-v3-26-8cbbea1cf34f@kernel.org>
References: <20261116-work-loop-pseudo-v3-0-8cbbea1cf34f@kernel.org>
	 <20261116-work-loop-pseudo-v3-26-8cbbea1cf34f@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Mon, 2026-11-16 at 12:04 +0100, Christian Brauner wrote:
> Initialize xenfs as a pseudo filesystem. This raises SB_I_PSEUDO and
> also SB_I_NOEXEC and SB_I_NODEV. xenfs never holds executables or
> device nodes.
>=20
> SB_I_NOEXEC also refuses PROT_EXEC mappings. xenfs maps the xenstore
> page and guest memory through privcmd, both data.
>=20
> Reviewed-by: Chris Down <chris@chrisdown.name>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
> ---
> =C2=A0drivers/xen/xenfs/super.c | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/xen/xenfs/super.c b/drivers/xen/xenfs/super.c
> index 37ea7c5c03469..aba7d038ed735 100644
> --- a/drivers/xen/xenfs/super.c
> +++ b/drivers/xen/xenfs/super.c
> @@ -15,6 +15,7 @@
> =C2=A0#include <linux/module.h>
> =C2=A0#include <linux/fs.h>
> =C2=A0#include <linux/fs_context.h>
> +#include <linux/pseudo_fs.h>
> =C2=A0#include <linux/magic.h>
> =C2=A0
> =C2=A0#include <xen/xen.h>
> @@ -80,6 +81,7 @@ static const struct fs_context_operations
> xenfs_context_ops =3D {
> =C2=A0
> =C2=A0static int xenfs_init_fs_context(struct fs_context *fc)
> =C2=A0{
> +	fc_init_pseudo(fc);
> =C2=A0	fc->ops =3D &xenfs_context_ops;
> =C2=A0	return 0;
> =C2=A0}
