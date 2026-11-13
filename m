Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794564363;
	b=BwHlf0AJ+qMJnxT1GVFg7X5wKU0vYwN6tW0UzsM3bmrFAdX9XskEaHkYnu/oqN4GEHn2
	 F2TCVAb45FVLQnl5YVMUGukehLemMbz0WXToizSAoxFd4hctwcWu+8CT+MhDo0wh2WLbr
	 YTCQRrEWC1L9fSSp7NDminazOwdtn0cJVM1FIEAVWOsMloqBzgg0xuWnjgKe62mpPYYvR
	 hLO8rgI3laWiei49z7s78rqO/YmGqjm7+KCpnNsgw+50SyGkuGJe67dYPFwUnI6dbvjOR
	 QQLk4Txq/fpoERVCGwXSZTWH7m3ymNuRBOF3qDRLTrVPker43tGh5kT3/m+iX56oLoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794564363;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=TjkCmA8zoLhZK8u7U4HhR7QcElVzore/o+jClE5BdRs=;
	b=RLwFTtyK/oPZqZT1P82jgWIcCenmJD0Rkzj7eIO5XYxIrVSzJQlidXSjWwAjAl5SvNsC
	 qX5XLlBrXr46mThWA3fFyF4puSScJOqWRlxuP/nPrev38mPt9RSXrH68FqPRid4XLnWEa
	 8Tqf8kLzJyb6VMGie772JHKFWYqRPPA7GtHtFx90BA4z3dUTfUY7gDGKOL63VZMhRfNLI
	 9CGdxR1DpKozF+3Bl99rMO0HayNZKEjmdEsQxnTIYncIn3bIvVd/sJV3incaOrMWkHNWL
	 o2E79xr46/Bu2lniOHziN3jjBHBhrX2UgrkXQjB5RGTUJRwn+pROr+Xe1OvDI1aO5UQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=cjEYfKb2;
	arc=none smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 056A260A263F
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:06:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 056A260A263F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=cjEYfKb2
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b7bffb5b8fso1240062a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 02:06:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794564361; x=1795169161; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=TjkCmA8zoLhZK8u7U4HhR7QcElVzore/o+jClE5BdRs=;
        b=cjEYfKb2ti/xguKoQF5XePY0eNOezud7K33Duf47S0g3JkHBuObkd06WZKSsE2j4TE
         DEwnxkXlTao4933EWT51qAqcKFQZzBDYUWq7IdS+RrJUrXD2u7QTXDm9Wr29l+nlsY2h
         ba2aoEFnt/fnBZ4TqG8AlHBTx7MlaAOM8MSBIpLqFecTqJgM42mukp171NeFhmx0Zx4N
         EfXY8c4e2NVT5eQpV/Fv1f87MHIzBgzN889RZpIYFKMs83t0n9Q8bpafRw7OfeQ9pMp+
         KOGhNvmnj7I3xZktgYLxquasfZAW0tMnNpo/9hpnK424qA58Vs+J+ftPxNsRzOLYAEav
         G1VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794564361; x=1795169161;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TjkCmA8zoLhZK8u7U4HhR7QcElVzore/o+jClE5BdRs=;
        b=EKhunuTkNzfpQJxsK1QwbGFVV+LcC9k4u4raBEcsAluIflrOSnL8/BI6w/ulVr88wB
         nSd9sTrXr6IhA35H18wqF+qO+gMHtf6pPa3gel8qxNGbCrRF+pKesm4awdEJSvrL7JYg
         8+TxlvdXtROTBW8dIIAZ7eMrXIdjuDgYbENAVi5JwXwHyl6ZsB7Nrr6veV7dd+7kACI3
         OViJtwhZHTXINKoGPbI/AE2hXEh6kI9n2bJQW0b0R6ADj9uIuVNMuGRlbqyVrnZn+GLl
         54Tb31ZiGqdE4XeNwZdwrevwu4uWsMnPJi6bXs2m7KEX1l594wD/cpeak2rlEgkOof6P
         8vNg==
X-Forwarded-Encrypted: i=1; AL+hErHFle+fTnlK4sv5WEpCZJDeES0uPi9sv3/aMYjjAQWCqVnGmSXk97VDg056aXL6W5SiPh/JOIKaZoTf96w=@vger.kernel.org
X-Gm-Message-State: APuU4Z8piUod5Ar44G/6i8cV6SE3OPHdOeKU7dK1A1/iMLS4jfBq6E0S
	XspDV1b9KLYfz2OdmkaWSIm7M9JBz564JCsowT0I4n/NmpdU4PUhMml74zCxc6wKYs3Y
X-Gm-Gg: AYBFou3YdZc0o+DPjH4B/vkLB1RwOIrdo9DIY4Tuhj87UlOK8+NV2IYmotybO35POmo
	UfNdw7YYcatmw0piHIA/NBJZJUYKx0mfgxSSVFOtlcQBACirQ49MfVo1+IvdfFKVYskGjGF83WK
	CMPAfoN/baYb/OG4dq6Xbl9OBq9CPF2Fo3D94DxnXo5JiFIMOCMkpP+nwCqe1abY26MkeftZNRS
	Tewrm4AtR8Lekiyv+liXTE2ySIJYlEYdTIgQ20G+Kc7wzrv26qXRXEdb1RWAJ7y7ucweymGlSkF
	l9aAVxA5hSe8fTopltCmbOjKVeo0n18AhHWDI82HKoPT/5clwp8kd5h4G+AI77t1pIkfIQfgn5Y
	KVstdbFGUZMpzs3ySg/wPu3DmltG8dDkd2Yu4sfRp/cu6LnS52DeCOtZ3Ngex9jydLbNuatdzI8
	Q6U0I88cnQdGg0LnYh1ooXuGL4Him28G66GjRC+MTgxzJ/ddlVz6pA6SayreYkcCGsY6iuPafDp
	YNSKznm46zNjTeUSXofQAWa7lR5HQTNvpqce347P/tzKKnMOZicI4HxdGLemI7YKFIXQ6RYKH4V
	1HjlXkoVyWUOrG2cfny2cup/inxfE5mHvramwG+TnH0vbmmVtlFOoEPLeIXurjY=
X-Received: by 2002:a17:906:ef07:b0:c4d:5820:325a with SMTP id a640c23a62f3a-c50963dc627mr169588066b.39.1794564361325;
        Fri, 13 Nov 2026 02:06:01 -0800 (PST)
Received: from [10.0.0.233] (tmo-086-54.customers.d1-online.com. [80.187.86.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b8651bsm73693366b.78.2026.11.13.02.05.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 02:06:01 -0800 (PST)
Message-ID: <e8b71a2778d7d7797d433e7bac1a37ee64aaa30c.camel@amutable.com>
Subject: Re: [PATCH RFC 15/41] tracefs: use fc_init_pseudo()
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
Date: Fri, 13 Nov 2026 11:05:59 +0100
In-Reply-To: <20261110-work-loop-pseudo-v1-15-4c998976c6c7@kernel.org>
References: <20261110-work-loop-pseudo-v1-0-4c998976c6c7@kernel.org>
	 <20261110-work-loop-pseudo-v1-15-4c998976c6c7@kernel.org>
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

On Tue, 2026-11-10 at 10:14 +0100, Christian Brauner wrote:
> Initialize tracefs as a pseudo filesystem. This raises SB_I_PSEUDO
> and
> also SB_I_NOEXEC and SB_I_NODEV. tracefs never holds executables or
> device nodes.
>=20
> SB_I_NOEXEC also refuses PROT_EXEC mappings. The only tracefs files
> that can be mapped are the ring buffers and __rb_map_vma() refuses
> VM_EXEC already.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> ---
> =C2=A0fs/tracefs/inode.c | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/fs/tracefs/inode.c b/fs/tracefs/inode.c
> index 5020365ca704..e04febd868eb 100644
> --- a/fs/tracefs/inode.c
> +++ b/fs/tracefs/inode.c
> @@ -12,6 +12,7 @@
> =C2=A0#include <linux/module.h>
> =C2=A0#include <linux/fs.h>
> =C2=A0#include <linux/fs_context.h>
> +#include <linux/pseudo_fs.h>
> =C2=A0#include <linux/fs_parser.h>
> =C2=A0#include <linux/kobject.h>
> =C2=A0#include <linux/namei.h>
> @@ -510,6 +511,7 @@ static int tracefs_init_fs_context(struct
> fs_context *fc)
> =C2=A0	fsi->mode =3D TRACEFS_DEFAULT_MODE;
> =C2=A0
> =C2=A0	fc->s_fs_info =3D fsi;
> +	fc_init_pseudo(fc);
> =C2=A0	fc->ops =3D &tracefs_context_ops;
> =C2=A0	return 0;
> =C2=A0}
