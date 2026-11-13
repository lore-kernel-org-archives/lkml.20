Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794564335;
	b=0fCzQjvk+CDzOlxXCbSkqdG1wt6++7hTuienf348A7Pe2cX6DJ1B1KYPCwt9zSIU5FuW
	 X3d/8JOUdEDTu0k15kUT/yOOyXZ/0CNI9M681t5F2L1yCtJtvNvWspZ3dKBwHDWlJDDfp
	 iA66iRev14PnIYaHIoptH9TASt5bHfOdvzckFgN2WVx9Asw/Lv3gYdMWEgWsH8S3JQ0qe
	 s5HQ+cPhMfZSvISEfh4hvFgigjZ5JhCKQeFEZ78epw1QWXQtJJTDwDz5CzAxHVrMA9WPM
	 WfMXoDrSwFG66IY/4lU1oDrBCFgJ184uWg94QJ6bVBRhrlJcnDtci7JUFtOr6cO5GzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794564335;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=fNM18G1T3F0ezY9f7dMoEwC6d3kOVWk14Z1vuqkOGWM=;
	b=doQmdv6MT6wVCnuAECABwtjxygXKcYkoWOo47DuRwLfbnnWw1ZNu9GNru6grbkS5NspE
	 KC7P3mm2JacLJZs/hVzQK2BNhlwE4+hzhtxbT2z56ouwH2t+cz4Df05+S5RH6NACNEvC8
	 xuw9FlPAwh14sIoszOQ3nqZQhhDmbrliUdFNnyeD0glcBIK5dj7+iPp4Hrp4mvL/qIZdK
	 xBKhh9TC+qYgahMaPEBcSg/Q9fwOqmAz7ArUvcqrOITM3niwBwwkV0ftGeQ8h0TKjUwTC
	 SNSjylS1u0gb4/Nuwq5Lh3LKao5plz7S1uRz0hDPtQbyZQcZLha7r1HVhPJG4SBdifQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=nN3frtS1;
	arc=none smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39754606A88F
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:05:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39754606A88F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=nN3frtS1
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b65d69f5c2so1381232a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 02:05:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794564334; x=1795169134; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=fNM18G1T3F0ezY9f7dMoEwC6d3kOVWk14Z1vuqkOGWM=;
        b=nN3frtS1dXU5gnwmqfzT8+bhaiQQmGH+o8SykyblXrC3qld0kuEs+6HEGC2rkpdv/S
         sQV16XdsqqZb3GM8OFjrvrple+atxGtcqxLFVKkGZ0Zd80qUKx/EPhy8mDGrZkmovYLQ
         gPE45P700sVxzONMsyf76aaH6Xk5KYIuezCkWASzF5DvGkP1gh+ZRYmtrnwRu9+hQOqa
         BqpjziGjGsV2LfHal3A39L3aaFb8qdjtC8kgwx4O/4F9AvhElCVGweiPQgw5f+yTyeo/
         j+w9LUu3B6WOr6fOKhMnpx/PfseHq+Dks7TfznRnFDL7kPCQ+qTR2Sh8LdlE9KHj9gsV
         IzpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794564334; x=1795169134;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fNM18G1T3F0ezY9f7dMoEwC6d3kOVWk14Z1vuqkOGWM=;
        b=y/FH81UIQiltF1mavd6+f9mWIAv6QJ0GSkKz1nl3DOp2dciEsePxPIEvz2/pPcwdOD
         rFwRqZ08ytDaIyuUDNoUDnl0TZ3K0OGJI6EQ4dzJMDcYGXnZa7ZLQoJ56tt+jnezmbR/
         jzY3TGHFsedUo4Izp0CbtDNeKppFO+iAVrD1bKMSI+oEmOESV4nqG4NVe/RT3MG7RNe1
         LeenlSZufVCkkDGPMRP/N5S9bidAHwm7scMim8jeuIlxsEXhGLh+JNtD76yRg20E+SRE
         iqv8C8C2qZDy7YE+NG6tvFA+S7KVQCZsN/XDJMXQkwDtVAORPrep3l4fDmY8TrRgMxDz
         I5XA==
X-Forwarded-Encrypted: i=1; AL+hErHuPwjwVUwsibd1WbDd6yo6twtig9yXAL9k1kuaucgDebbYSnNcf2ogrRjDuUGCcgG54WTa0nBpkE8fkbM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+4CFnkTmlUlOPcg3jp/IRmsRgV/nPV/9bkVJJ9MUs5NT4Ics7h
	lfyWfYe5Hn5O20e+ObHFj0+WXPk6qEerCfl7LlDaM6KO38E0+bsGf+Etn+cCNSObWt3KrStfmMs
	mUyJnYubdzYw=
X-Gm-Gg: AYBFou1B6R9y2Z6zWBq8Bv9y82X+4r9+GbTmnufH7Ac7ooeZx0sqvKdrViWGyfO79BO
	pXT7WW0IGNe6wEcgS2/Yt8g3Wb08//Y3joCEgPn7XGBaSFLRzWOeJgXykTmR9cLCQqY2fVznAtY
	mJzjPNSmp/PX8Yo6dEJAeSMR0Re74t929RgsNHcW5B4PEG5pVbGiAXWkcfN9OnSOq1U8S3xdRhf
	pScjjJK1u9vosUkiRxqfhZm4neERgs1GfKF5zjtef/0FcqEO3+q/3wZFYnfqAzLvLOHBEwMSwk+
	GZmxIsTeIgg2siCKUvR1CXi4N2M0MEU9idkigrLXytf1AJd6FIk4E/vT0BGIZ2YRJz2NwynEcT3
	Bte6Gv6IdKnJy/eMqKJa3hgYbAYw0ygcRtGetf0TZUl2s/EzJl+nbjMCoQUdFbAMhzHVL+Z+Alv
	03Wl3WgbIBd3jEzA1sf4Ae1axnv4BM8XlEy3LA5B6R+z6jJI2NeQwrT9W0PN4njYHxym0SieZy3
	r3jo1IsMLYuenFLrDqB3QbCpvSPpOKT9M3JJeFTZQ9WeeeEI+W+4rJTwxf4ugf4kIhSqx07AQPv
	FzgxxsMzXFGOBoJvD6/eUvplmgkKuol8+i5j1u0wjWSXrYwmSFLJQBdSeDDGGaM=
X-Received: by 2002:a17:907:608f:b0:c43:eae5:ee80 with SMTP id a640c23a62f3a-c5096398b03mr148720566b.17.1794564321873;
        Fri, 13 Nov 2026 02:05:21 -0800 (PST)
Received: from [10.0.0.233] (tmo-086-54.customers.d1-online.com. [80.187.86.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b7b2c9sm75811766b.73.2026.11.13.02.05.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 02:05:21 -0800 (PST)
Message-ID: <08fa1be263cf4a3db6b3e5ec2847107fba7acfba.camel@amutable.com>
Subject: Re: [PATCH RFC 13/41] devpts: use fc_init_pseudo()
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
Date: Fri, 13 Nov 2026 11:05:19 +0100
In-Reply-To: <20261110-work-loop-pseudo-v1-13-4c998976c6c7@kernel.org>
References: <20261110-work-loop-pseudo-v1-0-4c998976c6c7@kernel.org>
	 <20261110-work-loop-pseudo-v1-13-4c998976c6c7@kernel.org>
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
> Initialize devpts as a pseudo filesystem. This raises SB_I_PSEUDO and
> SB_I_NOEXEC. devpts never holds executables. devpts_fill_super()
> keeps
> clearing SB_I_NODEV for the pty device nodes.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> ---
> =C2=A0fs/devpts/inode.c | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/fs/devpts/inode.c b/fs/devpts/inode.c
> index bd1e8eb26edb..47ef12241d92 100644
> --- a/fs/devpts/inode.c
> +++ b/fs/devpts/inode.c
> @@ -13,6 +13,7 @@
> =C2=A0#include <linux/init.h>
> =C2=A0#include <linux/fs.h>
> =C2=A0#include <linux/fs_context.h>
> +#include <linux/pseudo_fs.h>
> =C2=A0#include <linux/fs_parser.h>
> =C2=A0#include <linux/sched.h>
> =C2=A0#include <linux/namei.h>
> @@ -438,6 +439,7 @@ static int devpts_init_fs_context(struct
> fs_context *fc)
> =C2=A0		fsi->mount_opts.reserve =3D true;
> =C2=A0
> =C2=A0	fc->s_fs_info =3D fsi;
> +	fc_init_pseudo(fc);
> =C2=A0	fc->ops =3D &devpts_context_ops;
> =C2=A0	return 0;
> =C2=A0}
