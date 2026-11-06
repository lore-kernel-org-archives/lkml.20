Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793979855;
	b=Sjwc358RDmum1RVl3rcBwwPlaNPtU028QwJWngXA4CzcF8z1V211q6l1GSbSC9ZK5tVJ
	 5GiNxhzFlM4LSfZkBrYwhvocCzEwACRlIPX/fUYBWE9JmQ8zbk8KUxrm4SeRWAxBWSRTx
	 f34gkkGaNILqqdOMKMj/SMskkURFDySXEGOGN0VCyJRug5CLr28MuUwsP8cIXe7lXohbD
	 dXNOr8kb84ffAzp1IVtLjOmQdHWyfY4t8zAlkheG1AoPav3eR8ySz+PcUJK+RpDQnsNYT
	 /4HmDOS3f9KaHrWD7Bwb4T+cEBxcqAAzsCgm1OlB4baT+zzUl1/b4WszK9tRUV3E2lQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793979855;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=kdSQ6gbIkbrqZrODfVj2GaSXZ9iZOLx1/t0MWwXpq7k=;
	b=D/bWcqaYNz0lnTFRgk6NW9sq+XdhT8pWUjg9e2Tk9vUscGz+sWW7ClDDVm7gBKyYFKJr
	 3HoyzM+NfHGSQFQZYh3gNxklvanvruOyxlf5jMEk3p08kv6s9FHu3sadxpUXdHVW4jYc1
	 6G32Vi6+8fe6hCtjLVf3n4Thi9y/ibTFMIuyxptof3Pm/QeHDToQxWbUrg77WFFh0vGzS
	 tUCh981Trto8WHmfoi75FL2GeaLdNt/QH22+SP0FsfnMCD1ixB7XExn8Pk6DSw+5KW3so
	 9Hh/R/JYvqHCTR2xC1wyoOJuSBtrXUVq4xcptUDGMB5lnbWy+5F+IKwx8jTluMRHrEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=furiosa.ai;
	spf=none smtp.mailfrom=furiosa.ai;
	dkim=pass header.d=furiosa.ai header.i=@furiosa.ai header.a=rsa-sha256 header.s=google header.b=XktBeRgf;
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EC43606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 15:44:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0EC43606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=furiosa.ai header.i=@furiosa.ai header.a=rsa-sha256 header.s=google header.b=XktBeRgf
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3ae1da332bcso363344a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 07:44:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=furiosa.ai; s=google; t=1793979854; x=1794584654; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kdSQ6gbIkbrqZrODfVj2GaSXZ9iZOLx1/t0MWwXpq7k=;
        b=XktBeRgfpL+sq7AMBNpPbpVCYV4IpQlj8VOARywQ/MtvATQ36atQ/67mLccb1l6wxw
         jP+dCNwrB6Cgg3D56aajxahDtwEeq9oKwt2Xg3tDDWkmVnk4Mhs6THW/+zq67cNod0n7
         jxTgllLdYzzofQySFjT78CE3sAs3q5fFmRz44=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793979854; x=1794584654;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kdSQ6gbIkbrqZrODfVj2GaSXZ9iZOLx1/t0MWwXpq7k=;
        b=E6ZVtbuEHVUXHHbi5yhMhyrHM0svIMfvw0SGZQuUi4hbh4LoZqanBu8xwg9wkhzSxX
         zBzatiDtL0mtk3irmT+NYBvDjQU15Adty1De70ZCON0HNaseORGh935Yz1ePGF1qZbMH
         U3A3KnSWdnCvz8wTnQ2R7Y0bcMO251Hs0BjSJG9a2pWp46x0zEyOon6sHzcVEFYjJH0X
         fAvbU61QmybPhKwIGS1J8hrRorTMmJKX6AKC4F2kKuM88LOQHN1jI76+OQvzkNAmfELD
         lUXvCasHQBT8ICYkMYoGb3j1YM4lKnfdta3tui61TI5PnlpZWD/qn+5U1290fOV79hmv
         7Y2Q==
X-Forwarded-Encrypted: i=1; AL+hErHQYjLQnXu2B9AclLE9RErtX1j4NXQ6sV8V5jnZ2blRL6g1778FNRgVZLbO0yVWF4SoQmmm1xuI5FDjYpM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8/A17FZKU1bNTMtAkv2iWAC1m2RJadeIJYbQODWN4Hp/eJfhnq
	V7JgjdPNgadDAemuaB34V27TZ7Eu/nhwPcWpBjLjHqsHhxL8gi/8VGJanaJxTFAgOwk=
X-Gm-Gg: AYBFou2vrY1RMOIQja/yfmtl5gdsKAGCjOr7G6PgXOZMkCjUtszZWqntspZ84QAdKL8
	EqvbXC17W7/t7ND3D1czFVOP+wZt4DEB3Ts6ZfFpKchEJlxQaiPwHp1vcjlvScDG4N+NYgudjhg
	CAoKyVn6QSM7UC4164rOj3pWjnOOaftjSXcDwWvU3DyhD5T6//COIm9G1ksbRsYnopFDDUAU13B
	935RZOHiDelq4B9A5vtCSAqePG4ohzbAzN4c6WGmHKC/f0Bf4y3cuoHib0Mgu4cFx0Jz21iugK8
	YWsdLa/QjdMMg4SUd9RRaFx4rm98WQVzmoGE0Zo13L5ndcU3Z6ejhjdiv1F8K/YH0x1hyS3xR+S
	m+9bTnPKp5EyF4tZ/PzeLVttEkpkvlyvrWnfTzy4NX3Eup4nJC9w0rc2Df4oeCKvKf21nhMRNDO
	bcPbIlQ27fhHL0SQj76o5Q1Sx1tJRXT1LgBeFg5/N5fiWM/J7N45A+tJwpuOkduFBNkbZgxaaVC
	Ef4tTibpfdyPlBVTV5NbAzMagSv0CZQjAGDdfOY6c8Rwcy5XJA3NA4FeFLGgNAWnLf8AWeWG1ZC
	mERev9UAE8CewAe8nTMMBahT9AZfAenO/9OF5qxv+zWZAKuwUI69vwK42O0mpaWGFlnDngjgXCi
	fyzVSMPWdOYA=
X-Received: by 2002:a17:90b:57ce:b0:3a4:fe48:d410 with SMTP id 98e67ed59e1d1-3b0db6e584fmr2823135a91.30.1793979854271;
        Fri, 06 Nov 2026 07:44:14 -0800 (PST)
Received: from rock-5b-plus ([61.83.209.48])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b326add7sm8301270a91.8.2026.11.06.07.44.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 07:44:13 -0800 (PST)
Date: Sat, 7 Nov 2026 00:44:08 +0900
From: Sidong Yang <sidong.yang@furiosa.ai>
To: Tvrtko Ursulin <tursulin@ursulin.net>
Cc: =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, 
	Tomeu Vizoso <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>, 
	Gyeyoung Baek <gye976@gmail.com>, Philipp Stanner <phasta@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] accel/rocket: Report NPU usage through fdinfo
Message-ID: <au31m2jC9SmQ6iZh@rock-5b-plus>
References: <20261103155338.1949294-1-sidong.yang@furiosa.ai>
 <a9f016ce-f086-412d-9ca6-6608a41840e5@ursulin.net>
 <33ccceef-3498-426a-ae7c-a8bafbb88992@igalia.com>
 <2ca12f1b-89f6-4069-aedf-4e5d645e8deb@ursulin.net>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2ca12f1b-89f6-4069-aedf-4e5d645e8deb@ursulin.net>

On Thu, Nov 05, 2026 at 11:04:29AM +0000, Tvrtko Ursulin wrote:
> It would just be adding u64 drm_sched_entity_get_runtime(entity).
> Nothing else would need to be exported and the implementation simply
> locks entity->stats and returns the runtime. As long as the caller knows
> they haven't destroyed the entity it is safe since entity holds a
> reference to the stats object.

Thanks for the suggestion. If Philipp and Danilo are fine with it, may I
add drm_sched_entity_get_runtime() and switch rocket to it in v5?

Thanks,
Sidong
