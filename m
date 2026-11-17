Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794904007;
	b=WkrNNkW2+MWTd0Q43JvmTIAFQzF8bsdzM2QHqu95CyVn/agSK0EQFpBSXFaQV4IvqAq5
	 sEk04F6c+7dBt0uMGRS8xQmrLrhZMVfViOHP9cd2UMwBx0kSGoIxrmCGW8f9eieGzH+2E
	 b+wZBfi8458qj3gxGoGWp21V5LsOLllETpsV60n9519Jr+r0apZuueK9xkojBXyHsBKwA
	 7G4pnBD04vp66eaY7y4we9nSY72KIrSZa56oA40ki/SF+mHMpMDV5hSGYA1Q878yA0ekH
	 XDuxM1cmAKc009IbBX6TaYYRKVwhpI9rgBWq3vHnATicRKQzAMTNo6f+8evvOnQNW0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794904007;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=zuUcsMvbqw5dxN0Fzu67367bPJAUtTqv88LLlRQCTVU=;
	b=0QVysUoMBoqvOu87kFmrJ6kmyYb7R6Nyyg1bXNLlbY1RMHYEzenwMD5NiZWhHxouG0sm
	 vw9aHfgCb4HikYisaE/eurGnbZaPZzawwM1EhsdY26TZieYBStCMBCCz76y8IZFlWyTRg
	 3p0L18vQlfQaS/sBg8bRlw1GrXqVHHprxVUzUYXYdGUrgfiOpSBf2Pe+0H256s3BkaCdU
	 tU5BKxI2rjPObf6/bSFw30rTcO6CVFgPL/1cCRTzhPtG3fNuIK4Gkb17hv/0BOjLW1pEs
	 wASO0Njlp4rPufdiuwLL2e9bj518c3g4cL78lP7x+Q53HEwoxoimmyk0JSBe+QXMkMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Bh3COd7Z;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41AB1606A338
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:26:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41AB1606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Bh3COd7Z
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-490d59c3f0aso1759278f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 00:26:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794904004; x=1795508804; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=zuUcsMvbqw5dxN0Fzu67367bPJAUtTqv88LLlRQCTVU=;
        b=Bh3COd7ZzI6TmZdb32Fg462zWvuh7WQNnrUpXucHXcpV5t+t8gMfKKxOWwhkcHBcNt
         zIJKpUT9Ten8K9xmb0ZHj3p/ljeyNVefWtOpjWCo7Igmb/P1wzmYs63YOxLg7f+WXmDC
         wf3ao9cg3f1DrvZE/oBKoQiWFPBKSPnWk+jCT2CGoQgxeoDuJREjXd8oRMM0GizRyDLq
         q7c8W4Fdq61I08pJrjWNPm+S1jXNjmZ2MpEutx4SYZ/JoE6iRzvUZ/uRuGO7TyWDBzw1
         OlncqX8aSwrA8zDhY0Cn+N6eWM3qFfFk2ULf9A0Yk8lhKFDJjJXQbcxKbI+h6RZ2p0E1
         0Fcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794904004; x=1795508804;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zuUcsMvbqw5dxN0Fzu67367bPJAUtTqv88LLlRQCTVU=;
        b=zZXbi52mowofoY0fGMhwxfpDSDcJCcfCquaJw08m1Qrfm2PNcMrOtOGmshh1ETYHGw
         KXOnnIDtum6afV6M3zdaJexrnJgV7Wz45WXrUbUv29XSv9rzyFtsZ0MJPDeID4aF0QRZ
         pEIbTPYFvh8HHfcdxY4FYIOCviDwqkbFVVlOq1qMEhqVclXrqmfrhR9I9gKxO0zMirwf
         C623plW73+HUbCNGLB5IpHzYqIQ5dPL2YZgzlDGfbgkBBh3vXyi/HnVa1ib1DasvshOw
         Bc4KBI0bCbcJPAVEC3WRJZglhd9MFdpL6n+Y0mweB+orKiWgQXC1Wjg8xtWypInPrUt5
         QdUw==
X-Forwarded-Encrypted: i=1; AL+hErHt4trsnTkrjdGFzPEYbxP7IwUViSV0bOPheGH8c5NvKMNPtxeCdbPM8fy1xu160ClnCQJAvoQT1jNRGX8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9CkvuftlLUrlKGwguBBQC90Y5LWGVbtiWa88d/G7/YYu3HIFTP
	LQ+wGM9w26KPWCrCWoSygwbC3/WGVNsIwQOOF5qSN4IGy+l4J8awsLO9w5dj2NtxWiTX
X-Gm-Gg: AZFdTZe6AjJy4Y7DckzDSz/kmNsKR743KM5Ur7I/jc5OsYWphhPOn04maXd6ajzoVAJ
	RrIhza7BntR0hlTrkN1v2bzR1eyT1t3POU6iET+bZU3dmcMRXnpBCeFrldTjjnb/V4m/jUYZV4s
	HQQSEYal6M4FNm/OaDqjgOh/IS+LXeLl0AH1CyUok+uwlKGWVPCe9Maw2G5jaFdInWMGZ3WexPJ
	ZT+rzZHMFaDHc8CK7E8uCvpAY1K089e7JFYtQs01UOj1hu561et5fMtkbEX+Tv/EsebXgVK3WQV
	RWH2V8kcw+idK/XFhyM9GHdY7zEMbyjZeEyCseD4uswZLf0EHMdZSqDZ1J+IpPt8SDLfnk6//Dt
	CoupFC9jwWBhzYuXGcqSuMiXSz1N5EynIB/9H9GBe/4FS2RhM5Ka5YI1nB22mWqV78EVMGGriLt
	bVLpYG0NaWPLbsKSjZ3TBflzkTd4uI6pw8B3nDfDp2lEclKl96TqmSWcyy9FTz9yW7h65GL/fLU
	DcZEmtFxNFLJf8HtkU+rISwzGIgbmaqVurcV2/njWhyc5QXvnZxnU4AWctQOtW7SPnlBak4rJlN
	BQE0ly2T9Jag9hGb6wIZNOFRtPyomQYAfVIDrisFQxrZMazzGe085fqC/jwiEE2iYuD5cJRi98K
	wjV72n9Q3QxKVUVrMw4rPDAn4GmDIbwGMxtHQF2Y5kH2vEfDZZ/8opRO4
X-Received: by 2002:a05:6000:2009:b0:4a5:2e5b:51c2 with SMTP id ffacd0b85a97d-4a52e6a947bmr243585f8f.29.1794904004601;
        Tue, 17 Nov 2026 00:26:44 -0800 (PST)
Received: from ?IPv6:2003:cf:572c:2800:de4c:6789:33ce:97c2? (p200300cf572c2800de4c678933ce97c2.dip0.t-ipconnect.de. [2003:cf:572c:2800:de4c:6789:33ce:97c2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a4de4cb1c3sm977858f8f.8.2026.11.17.00.26.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:26:44 -0800 (PST)
Message-ID: <c43d70badf41f62f8e149ac024bab3df979fa756.camel@amutable.com>
Subject: Re: [PATCH RFC v3 11/44] failfs: use fc_init_pseudo()
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
Date: Tue, 17 Nov 2026 09:26:42 +0100
In-Reply-To: <20261116-work-loop-pseudo-v3-11-8cbbea1cf34f@kernel.org>
References: <20261116-work-loop-pseudo-v3-0-8cbbea1cf34f@kernel.org>
	 <20261116-work-loop-pseudo-v3-11-8cbbea1cf34f@kernel.org>
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
> Initialize failfs as a pseudo filesystem instead of raising
> SB_I_NOEXEC and SB_I_NODEV by hand. This adds SB_I_PSEUDO.
>=20
> Reviewed-by: Jan Kara <jack@suse.cz>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Chris Down <chris@chrisdown.name>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
> ---
> =C2=A0fs/failfs.c | 3 ++-
> =C2=A01 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/fs/failfs.c b/fs/failfs.c
> index 437cdc981c2de..f03334f361c0e 100644
> --- a/fs/failfs.c
> +++ b/fs/failfs.c
> @@ -3,6 +3,7 @@
> =C2=A0#include <linux/fs.h>
> =C2=A0#include <linux/fs/super_types.h>
> =C2=A0#include <linux/fs_context.h>
> +#include <linux/pseudo_fs.h>
> =C2=A0#include <linux/fs_struct.h>
> =C2=A0#include <linux/magic.h>
> =C2=A0#include <linux/mount.h>
> @@ -132,7 +133,7 @@ static int failfs_init_fs_context(struct
> fs_context *fc)
> =C2=A0	fc->ops		=3D &failfs_context_ops;
> =C2=A0	fc->global	=3D true;
> =C2=A0	fc->sb_flags	|=3D SB_NOUSER;
> -	fc->s_iflags	|=3D SB_I_NOEXEC | SB_I_NODEV;
> +	fc_init_pseudo(fc);
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0
