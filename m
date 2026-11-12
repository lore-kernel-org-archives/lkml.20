Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794447081;
	b=KVDKAaotXztLw6moBFS3r0Iu2TfqnsEw4+Qbx/ZQkHqbP7RUe1HN6epF9oYHls5wF0pW
	 tl6hhAzCnqIN1HQ2VvFY7V/589ez09lBg3sOURU7Dy8aQGyaAAI+nOcKcsdSOAdHpXTIv
	 Aul/0DaN3QnT80CJTA9PjDzOeqbKjowJhJ8zyR/OBqsgCy1O1p0rOpTSwKHaS9Watpmb5
	 dZ9vRLhK4yC8Adwcmx/fNT+zz4G/FvESjwlimLoSYnPBkYk2HWv8F49xaRiV4poBLGaBB
	 ItQaoGcm4Cs1co8vbRepZvW0rUmWKDJ849djRJNMkY1WRZAx5AbR0FfKacVYWeT2t9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794447081;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=tbAelE0MgrzBlqY6meyYnUeXwzPQQ8o74J39xWeGzMI=;
	b=aNkbWp7Pe5NYUNywap2V0VQ9G26L9Y9NWSv2Mt18gHO0AqePNDGIJ2whqDEpoHmFWIkP
	 eFF0sBlsCMyWsG3AclKjJgs05h6G5l3+VcI7bcXvgMPMR4qXPSVKpFuhmqH+ZTXBUw991
	 Ch3QEJs7o7m408r/u8iUf/dwe6xk1R4+/wCdNoo+zF+T/I5RLhpgVjg31WL1VZ4/QQ6EZ
	 q2GjhtZyXeB4C2YX2wmaxw05My0bzJNjzDPfzT77N7yQ17+DYOQXdFCKDLBgNs4WLSqlk
	 0hSpgFP5I7ZTDSzTOmWHsm3S06zmjIw+Z50zDfL5IqFnwrhVlNgs5aKfVYUC/xCzbiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cAX1KQf1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E43A9606A8A9
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 01:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cAX1KQf1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DB671F00A06
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 01:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794447080;
	bh=tbAelE0MgrzBlqY6meyYnUeXwzPQQ8o74J39xWeGzMI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=cAX1KQf1Rzsl3baWjSeoL9KqFkTL1LmLNbp0E7qvwOM0SZG/F5dkudx/fNzxgDuMK
	 GK/I7Yw6HwlPiQQsj3ellpPk3FiAvNUAb+8kNfBwSkPOvSIjKy+Eicot9YEg0s3OPO
	 3c68Ud/AcuoSMRQcGVhTkxPtAYF2zG8Y855SXbuP6NE9e7yWaEK8/PxZniNNPDXHfl
	 HW5rJtHZoo3tPzKBs4DbPLKZbDYPi1BTOBK2pPoYbDVc0N7g/NJGX5L6VhpZ7W0WUK
	 TqwJBmB/5yyxNJJN/6g1OttGDgZ9sS/p46Mx1UFXCzfiPZW5xkagpHbky8bqUYNx71
	 YXOqfx3pBCcyw==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5c102ad8420so3093453e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:31:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHs1tfC7nfkn6HQoZIg1pldZPaZWMx2iM1FuxGaKPxy4dlcMjDGuSRVZ2j8Tbm9/NCbrHLHzsobuSnqBU8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ODU8DiVHbhTl+qP5/ifRmg2HDLYekDtXeyIs/R68sTDAF40Hj
	g20gIyaGp4dgtcAUqvuZKDgAhZL0LXS+XgkZQN2Oc+XdxNf41/wM+Zv3K4m3oZSvcCdxfPc21Jf
	wdyDPfx6WTMSqHAmHCm/Rt4Gdja0Fiw8=
X-Received: by 2002:a05:6512:4011:b0:5c0:a57:2cc5 with SMTP id
 2adb3069b0e04-5c15d5459a1mr1246023e87.3.1794447079338; Wed, 11 Nov 2026
 17:31:19 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111033150.847104-1-kj2864@nyu.edu>
In-Reply-To: <20261111033150.847104-1-kj2864@nyu.edu>
From: Xiubo Li <xiubli@kernel.org>
Date: Thu, 12 Nov 2026 02:31:08 +0100
X-Gmail-Original-Message-ID: <CAOuZWzyKFAfOFDu1p8O4M4qCS6WgvTXtoFq89wnZSx3OcCXz2w@mail.gmail.com>
X-Gm-Features: AclHuK-2jkI_1P4f-3m0WBpZsZ-pjI-2oWTd2FJHzyQYsGPvJZ5SBMTR5ALOLsI
Message-ID: <CAOuZWzyKFAfOFDu1p8O4M4qCS6WgvTXtoFq89wnZSx3OcCXz2w@mail.gmail.com>
Subject: Re: [PATCH] ceph: Use unsigned types for snapshot split counts
To: Kaho Jiang <kj2864@nyu.edu>
Cc: idryomov@gmail.com, amarkuze@redhat.com, slava@dubeyko.com, 
	ceph-devel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	co+408fcc361565713f@bugs.sh, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Kaho

Thanks for your patch.

The u32 change fixes the backwards move on 64-bit (I reproduced the
KASAN slab-out-of-bounds with injected split counts and it is gone with
this patch), but on 32-bit sizeof(u64) * num_split_inos is still a
32-bit size_t multiplication and wraps: 0xffffffe0 still moves p
backwards, and 0x20000000 leaves p in place while the split loop then
walks split_inos[] far past the front buffer.  Could you bound the
counts before advancing p instead, like b3bf89767e3c does for the snap
trace, e.g.

        ceph_decode_need(&p, e, size_mul(num_split_inos, sizeof(u64)), bad);

for both arrays, and ceph_decode_skip_n() in the non-split branch?
Also, please rebase onto the current testing branch.
