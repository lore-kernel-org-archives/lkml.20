Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794904512;
	b=qohLEWieVYgm274ozzx6VkaxnIrnLnoxkMNT0l2SkCc7DVs/pD1n8vAg86M2OvQZpTpE
	 eKtGSAYsVKDKQMR6K7ywTI1+NwXN3aCLy9psW7LDIoFOjzVRdnJJvNs67vt1cASJaAjIR
	 bJ6B0DcfTUsuSggvQNiajNbpAuyKDsvHxN04rqw7G05+x2KKjKfClET8G1XBO3sQ4B+RO
	 zZPgmjsMWH+A/MjqIkRL89oNjJJHROD00eKOujr282RoK0133cy7d6wlSjpUJ0NizzzET
	 gwKBkjM/ZtD8Tb3EgC7jr6SMOXHpohAT6hHSjoBujplqRkYdSLI7pPkP2CpJE0pTG4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794904512;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=+cVfVc99Mj9JzDjRqkRlx7bbwk4z1TaP6S9xba6j1G0=;
	b=WtLv40600YY+c3tLKzOm7ZpN5Smdi1/k+/LGe0kR4ljsbpLcMQqCqfGKUO6tnKOyfaWv
	 AjEtD10E82GFo/uThPK96bOwxEvLtUUmVZMn4zVA9XEQgVh+6IK0H4jOSYN61PBOUFOhN
	 VYABDPtzMZascI6z7LRMLKt2QppE2uVBKITnHLrMLdCuOInuZVQzF+HiXmTC/+n9dC8dQ
	 EQB9dypT1g2BoW0mHcNDUZoALPnlvPCpinAjk3QhVG8BiuAvCDsw+IGj9x58P9E0KkZJs
	 IAFOVFts4W4kEYzNSsMBx1lTOhRPKd62yFkA0ENnSAdfIR2lpB6FDeEfU9gkvGxib0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=asHWLUHh;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92464606A8A0
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:35:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92464606A8A0
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=asHWLUHh
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so2440153f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 00:35:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794904510; x=1795509310; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=+cVfVc99Mj9JzDjRqkRlx7bbwk4z1TaP6S9xba6j1G0=;
        b=asHWLUHh9Osx9c7ISjHVvBK+jrwM+bEKiKQ5ZLUG8jHeL8cbDrdmay7aq+azwtlrvN
         q7YkHw224WJQO7TnM1AyMygFYXrlY29jKpq3C9XROr0oTqsA+UK4p+WS5GMy+xx9DTRb
         nuDA+OEO8+ykjkDq/RDjAwEfWgenycj+snq2KkG6mulygb6NKchr6plM71+t8W0/+aGL
         LigMC+giRqQ92TsunABClmE52NWQSdRqhQeez7lH76lemvGh63Ic8nud3Qte/9KpQmbQ
         YrdviXjfG5hlS64KIE7Iq0kMRVYmtZMNK2hkMRb6Cz1tihRk5N+J71aJKPK+K5E0SOED
         KbHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794904510; x=1795509310;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+cVfVc99Mj9JzDjRqkRlx7bbwk4z1TaP6S9xba6j1G0=;
        b=03EKGO9Q26Auorqh66Q0jA0juHv1UkY8Sl9yVBiIY642H/5u9Wn3/W06DuNG3f0w+m
         40uJCRsMmfq8/ov9FP/hopfMt44ZnI2Kpr4uz4nLqvBh5KZx7u3xkJmD/DuwUELzWZiS
         rIZlkEm6dIYFpHNBkcnbxMXho7OCkjMc/4AoSDtxRc6czneCn+VS0HKSfn1+Jy4Yu9iA
         KyKYhGWuv9INBgc6GRI5x/MDmWL5pLGMHKhZKzdnoPgp+v0UDfAREuV5vCmiAWpMY+tk
         uQ16xymtPIFo1kDnJV04N/wbawRBsfG+HPkEEaiEijvdbtxBm46Bf1pRiLj+ejnfZ54V
         zv0A==
X-Forwarded-Encrypted: i=1; AL+hErHsBulD1p6NIqQZAcF9mxryojHkzxpT2mWPItSd8vdJCu7zcP4pQfd753WYAcdKlo4z7k2vNwXSe37FUzU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8at9npssmuh1Ro9het0/L+b1sjS9RnOgCeKdIJOPPDokQFCvxr
	mYvrp4PQv2RGxN6FPUGXlx6O1pjvkJerecOxfFgs8P5fNlCkKXSXq0odh0iCSdDa7luF
X-Gm-Gg: AZFdTZdLVInHC1OijnlMIaFGm3twGbbQIlIWXQjW+1lv6g3Zcf9Dhb8xQqvmP9BH4tl
	jXLMBopUf0SbbF6BdVXY5f+LR/WKfFqOFrhkFmBPOpVaZGpGvoH2wyZ/unKM+2c9mrkjJY3s+9d
	Zk7GbBRZ35LV34lVR+JgnzJgtMCgSTkE6LaU3YRAT1pi78XOp8tGZWqddEuSYBsjsjPgKlSbgS7
	uSDLr4icA01OzJZFNCGhCu0CyQ2vJNpIgl653LwhiYoM/gmHtACZ0DIcrSMq0ZJ1PWd2OIJe6yP
	f7J/XM2QINdwt9VRj0J1JJVhRNzdpsj/cRSFbtDUeST3mo7tAQlHVRaR7bxuSSKVVk/zrzchKN3
	r9b6MEQzbJu41Wb2+bPpIU8NuuvyxUm3QaF8O1l3904mumCrBQq5uU5p8aA9tlwMZogtEhGTIJy
	K4LO1zdDSt0sShDJPmslAZoG3TXh/ouLkHDxDUW9vLTsovj+aGQiYblHpD2Vf/MrtnvktYVIN7X
	ISpmza1TeBVcl+jCDKGAIqmlZN5An8o7w3TGkjMCnpYMgdc7LYs1hNlBxPKkk3e6UaSq49F5eOc
	+vb2kk9V4wUWgV7fssTPjt/oDzslEu9eVR1FWJSufGMDqdOIHy8MgDNzd1kfoZiLxXEme2FQ13m
	nO3i1NqJiXGQNo5cJ4VkfNo6craA4l6HVGWzjACaBsZ9kMu1hYjuVSb67
X-Received: by 2002:adf:e193:0:b0:48c:7306:18e9 with SMTP id ffacd0b85a97d-49c728c6e6amr26569239f8f.43.1794904509932;
        Tue, 17 Nov 2026 00:35:09 -0800 (PST)
Received: from ?IPv6:2003:cf:572c:2800:de4c:6789:33ce:97c2? (p200300cf572c2800de4c678933ce97c2.dip0.t-ipconnect.de. [2003:cf:572c:2800:de4c:6789:33ce:97c2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c603f4e2esm26338505f8f.36.2026.11.17.00.35.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:35:09 -0800 (PST)
Message-ID: <b0ec2cd8f9b7a6a2e4a54c6df2fa897bce068cbd.camel@amutable.com>
Subject: Re: [PATCH RFC v3 28/44] ocfs2: use fc_init_pseudo() for dlmfs
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
Date: Tue, 17 Nov 2026 09:35:07 +0100
In-Reply-To: <20261116-work-loop-pseudo-v3-28-8cbbea1cf34f@kernel.org>
References: <20261116-work-loop-pseudo-v3-0-8cbbea1cf34f@kernel.org>
	 <20261116-work-loop-pseudo-v3-28-8cbbea1cf34f@kernel.org>
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

On Mon, 2026-11-16 at 12:05 +0100, Christian Brauner wrote:
> Initialize dlmfs as a pseudo filesystem. This raises SB_I_PSEUDO and
> also SB_I_NOEXEC and SB_I_NODEV. dlmfs never holds executables or
> device nodes.
>=20
> Reviewed-by: Jan Kara <jack@suse.cz>
> Reviewed-by: Chris Down <chris@chrisdown.name>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
> ---
> =C2=A0fs/ocfs2/dlmfs/dlmfs.c | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/fs/ocfs2/dlmfs/dlmfs.c b/fs/ocfs2/dlmfs/dlmfs.c
> index d3bfcada3e3bf..1789ec96dc130 100644
> --- a/fs/ocfs2/dlmfs/dlmfs.c
> +++ b/fs/ocfs2/dlmfs/dlmfs.c
> @@ -21,6 +21,7 @@
> =C2=A0#include <linux/module.h>
> =C2=A0#include <linux/fs.h>
> =C2=A0#include <linux/fs_context.h>
> +#include <linux/pseudo_fs.h>
> =C2=A0#include <linux/pagemap.h>
> =C2=A0#include <linux/types.h>
> =C2=A0#include <linux/slab.h>
> @@ -563,6 +564,7 @@ static const struct fs_context_operations
> dlmfs_context_ops =3D {
> =C2=A0
> =C2=A0static int dlmfs_init_fs_context(struct fs_context *fc)
> =C2=A0{
> +	fc_init_pseudo(fc);
> =C2=A0	fc->ops =3D &dlmfs_context_ops;
> =C2=A0
> =C2=A0	return 0;
