Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794904347;
	b=lE7lQl9Zd17CaHEJTA73dlKpbu3lZibRZxzPcjo8qefBZGaoH9T+rbDsOyEpPizqjwh4
	 a4Q71uy7ig1oi/uUo5LbfagnMNAz6oIJX79SrFLAtJQBW0rWiBNrH3N/faeDh0vFw0oLV
	 5zB427Xhmrp4LYrs0Fcwxn/Q9znY+Ye3UZXTybk3H2GR1tqflDXfJN/pJwEGziw8j0yTK
	 PHbuEoVI2MUG3/2zBOwZ2CNXkOKcreZlyZtVBw9LEVd7SSepkdrGQnAtEA1yuK6fRiCv5
	 4hTao7ys8S0+1hofp+8AsXmsAGY9hmeqcRSzN4P4vUUy0LYw3QpB1AJ72xLgp12MNUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794904347;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=iGZ2JImQ8AaSp09QdDpLN1PoylGc+Kk+7WphF44IQ4E=;
	b=sF4WfKRcqAu0R4Uak69Gnc70RsPCwNEdluClM3kb9NZ3EKGIeeyYh9tsTu5Ux7mW4f7n
	 RlaMscKEq95WgJUtawLipiALTZw+0+xZ0IvVg3FH9xHINzy5+upUca9sDTQueen6s87yz
	 +0vvI7HzNf6+BVeNHlNbLFt8npSAHOl450wAeyFVgv2YkP51nnNj+KuZ3uO7sYHswH72z
	 yJYAidX40syvEkxVld18WwY733rlkiV8kqfXX0r93V6//fA3WMWZFoX1wOkRQtgJUbVW3
	 zOntWg9Mm2/eu2rhKL26aGJMzLlu+fbrgkxAASdshMnPCBbTZ5tXFfLnf/3ez0jdo9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=EFPX8Vuf;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD71A606A8A7
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:32:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD71A606A8A7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=EFPX8Vuf
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-490d59c3f0aso1762456f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 00:32:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794904343; x=1795509143; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=iGZ2JImQ8AaSp09QdDpLN1PoylGc+Kk+7WphF44IQ4E=;
        b=EFPX8Vuf7iz+NzEUQG+pPgjK/MbrESqv3n9ATmra3Zopp4tpstszPHFfE2sR6EI1XH
         /MuIqTxoWkMXSLrvcYnqUGQvNVGY6YndEf7Smwels/t/G0PiJAqa5YTB3/XSR2c5vF/4
         5S685rADCuM7kD+KTHsn5xD0Bbvj+kfNJN7h3Eeu6Tgpz77cxc6E5ixV5T0A3r/KAOuP
         +pclbSVYUTOzYQ2RRiRVVs4C5Z7y/NhXCRc6Of4Q0fL8jD/Em4FfidsaQN0h6TdkChBo
         DufH5bn8tmF4fp27j4WWCE7M7sjar8yCORXmuz1wFPQxfWworU2xHCWyEC/YN83R4E+t
         3i9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794904343; x=1795509143;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iGZ2JImQ8AaSp09QdDpLN1PoylGc+Kk+7WphF44IQ4E=;
        b=mh/JD+SWA/CQCYb4J6hL0JxPkSdMec2lTbSGg2gJ2sw+hXRBLS7a8TKXFuDLKrihXi
         R1wq4XB2vFqJmsVXtB1e2LJ38z6LOmbVl7cDSOZLErq8O30mzwS6PeBITbodAinn+J8W
         CyLP8Ev6BnHidFqFOy++3ay/rXdMsqck7xDS7cuOZSJEWBb/oqh2otddIP5rnOjgWdii
         GbROiohLb6qkyOPiwW5F1fo48rOXEe+5Aqba5+hFAsKnVwSFNobpFgUmAxPt80O8D4ja
         AhrbsKJgdc3oZrQz11XU8RoEfLY2qH1LBnxSP7ctNqR3aUEUcL9TvLeI3xJ2CiKxAzPU
         8mNw==
X-Forwarded-Encrypted: i=1; AL+hErEcLNER+yRDfjL0ugy4v8ApTXyQkI7aNqEb7oTWz6+YjT4iWTtMiKHnNkZto6nL4XuHkdbQX2k5E5cmRak=@vger.kernel.org
X-Gm-Message-State: APuU4Z9QupGh1wu+3CGzIuwJf9mdwstwU9anWwy8Ye0orWCvMjpdFEfY
	U8KwZgMUMkL4Zvfyjq4HU4hflmGz/ChP8BZRtSkC8lFo4dA+fkU7sSJZqEph+2nZX4Ea
X-Gm-Gg: AZFdTZd0I+TErnnzK3PYHnupYsHNiJpdgRasuuw/b8suzSVwQ5u8SMdqyDh0OfyMgvx
	2Xu2rltjHcssCXJlKeTW0n0XbfirtjktaDfsERGoxSJiOCfHEb+8rFp4tdHSzxU8XMLes0DRi9Z
	zbv1aaXEv9AAYQV/MkENxCPGLL9iJN+PvMSw3AB64ea7uanIOUFGCtwbTy+4jLNBZ8EXGcs2uol
	N5xgQQoIGUeaNnZ8/W3XgdLgqjwLcV1w69tmna6btGEnBrT2uVKLax1TktvLQFWl0ojhTSpTwjh
	6ZApVfHCUS/5FA4+I6m2nZw+g9ogD7GPWSFPoTJ6sPsHzVLdm1ktfv1cyofQqkiKYPXRpLnNMRR
	gnckX6l7wo93mjC7/R+2qCoPZWpVbTMcd/ajFYU53DQf82B//ocVY6wz/PC1V05fNLZYxneRgGA
	fxo3gt4CQScBMgqfU7Y+vyxUDQ+gpu5jAcq/udwEnY+KPS2f4utn78LO3irwkxVeyik9/t8XT4t
	uMLbebqa4YTIBSUoITsacPAhpYymtYkve3a91zqDf3meRatMF2iFF9v9pftc8Czt/Zvsm4gXv79
	C9U1u6KPvFWyM/8PYZPdWGNEfDUzDCXAoT7hEqj7NO8RK3aCg7PqkDrA6lMV/GsM76inNCFvJuj
	cDZODvNANBUHfAJgJTxwUuUMAIfQ5QD8qgJgwpCk4CfYg85kMpUvq9dB/
X-Received: by 2002:a05:6000:3108:b0:48d:f9dd:e3de with SMTP id ffacd0b85a97d-49c7353c415mr27089117f8f.45.1794904343236;
        Tue, 17 Nov 2026 00:32:23 -0800 (PST)
Received: from ?IPv6:2003:cf:572c:2800:de4c:6789:33ce:97c2? (p200300cf572c2800de4c678933ce97c2.dip0.t-ipconnect.de. [2003:cf:572c:2800:de4c:6789:33ce:97c2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c608d10b2sm43646659f8f.44.2026.11.17.00.32.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:32:22 -0800 (PST)
Message-ID: <fd39200976086130cc82d59699a988fc3e0689cf.camel@amutable.com>
Subject: Re: [PATCH RFC v3 27/44] openpromfs: use fc_init_pseudo()
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
 linux-kselftest@vger.kernel.org
Date: Tue, 17 Nov 2026 09:32:20 +0100
In-Reply-To: <20261116-work-loop-pseudo-v3-27-8cbbea1cf34f@kernel.org>
References: <20261116-work-loop-pseudo-v3-0-8cbbea1cf34f@kernel.org>
	 <20261116-work-loop-pseudo-v3-27-8cbbea1cf34f@kernel.org>
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
> Initialize openpromfs as a pseudo filesystem. This raises SB_I_PSEUDO
> and
> also SB_I_NOEXEC and SB_I_NODEV. openpromfs never holds executables
> or
> device nodes.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> ---
> =C2=A0fs/openpromfs/inode.c | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/fs/openpromfs/inode.c b/fs/openpromfs/inode.c
> index fb8d84bdedfb2..6cd02d456bac9 100644
> --- a/fs/openpromfs/inode.c
> +++ b/fs/openpromfs/inode.c
> @@ -10,6 +10,7 @@
> =C2=A0#include <linux/string.h>
> =C2=A0#include <linux/fs.h>
> =C2=A0#include <linux/fs_context.h>
> +#include <linux/pseudo_fs.h>
> =C2=A0#include <linux/init.h>
> =C2=A0#include <linux/slab.h>
> =C2=A0#include <linux/seq_file.h>
> @@ -419,6 +420,7 @@ static const struct fs_context_operations
> openpromfs_context_ops =3D {
> =C2=A0
> =C2=A0static int openpromfs_init_fs_context(struct fs_context *fc)
> =C2=A0{
> +	fc_init_pseudo(fc);
> =C2=A0	fc->ops =3D &openpromfs_context_ops;
> =C2=A0	return 0;
> =C2=A0}
