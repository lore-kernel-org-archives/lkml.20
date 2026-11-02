Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793585518;
	b=ZSUFQ8I4YBOEQxQs+PT0SaY43fMmsEx1AgcQYiC+oNrb8UAUZEydLcv9vK88hk9rKP7C
	 MRIFff8xHDi3uoRsknJU/A2QUXSAyVx9NErQJF+rRVhlg4yQQ4dtBpByne0VPSA2VESEx
	 zLVqWiEhDNh947ij5fL1nAvhMgUYwdjt543iZTrLdUcgxIpWYGxcZscsVxqDbiACObCCd
	 9gUWS+Q5wejYQaKsKiJ4v5XimIvXatXo00kCP996KRtjNLKK10eAUFmMuZ4Npss+bcGJU
	 1Mo5npmiJWpnCndSz7Qem1b75N0/PAJ0kT53MA4vnhW2k0BNnWOyjAtgLYKDxWaaUKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793585518;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:Cc:
	 Subject:To:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=8VELrUAvWIl1oNglpEzNvSK1b25VeVp7s80WKqjSVYQ=;
	b=tgGW7EPKp0z43AsILgy16w9xpbrKvixyIN+usZj/Vp/HxzuO3cf7+Cx+838AlilXYJDx
	 CDn8FHfJ2UbRuNk7TpJo/UsZ7p16R7WrolNDXgAo4z1M85TxXU11UZ88SVngftnnrP0db
	 jQIiH4b8dTSmhxuvY2Qndg+Anw2ICEz1CVUp0/cONhrf2OQy6qB8V+/d7qNdtAxOR+hTD
	 TEgm5SgAp0al/PPPWiHZ+Vw2K7TmkXg+i49rVmQz1izWLHW89STwJPny8EBfFrV//Wgu5
	 gH+EFgJEHHU8zeCnNCaVm6GK6kdE0g3vwmD0wZGQOX4+ooem3R9jbFkykiVvWAQ8y5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P5+xw8Oi;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E69606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 02:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P5+xw8Oi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 380A61F000C1;
	Mon,  2 Nov 2026 02:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793585517;
	bh=8VELrUAvWIl1oNglpEzNvSK1b25VeVp7s80WKqjSVYQ=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=P5+xw8Oi0b2hy3QKZ+KnhcQ1aB2DO5t5Up4KSmQS6j2AvqzEbd3WczI9yth4HIxaF
	 oh8cztQX0YAYWBaAVLtanRY5m9Mkf3kfHckMdLkmIoz5JNWYeme5cZgkaCoUm+rq7d
	 m98Wz11ZMhM/JynYoMM/ogplkImnphBYWEEC/qxaNZeYsrjVSg/aEsTPAoGk+cIr6/
	 B8Tcay4ASmQTU9qdBwfr2kGC5/IOWnJdRvpefOlmCVu2/DDZIKpRwVi7f9uWZhTpKl
	 HgICkYTO7H2Pqmm0oW+xaBdbtC/AkPAs4cInsLOvMHep9bqJJkynM5C9nsHmX+RR36
	 /wdIZmWvteM3w==
Message-ID: <0696ac2d-58a2-42d4-9b5e-6a353f772f71@kernel.org>
Date: Mon, 2 Nov 2026 10:11:53 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] f2fs: preserve 64-bit FITRIM minimum lengths
To: Hungyu Lin <dennylin0707@gmail.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20261031233935.9600-1-dennylin0707@gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20261031233935.9600-1-dennylin0707@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/1/26 07:39, Hungyu Lin wrote:
> The FITRIM minimum length is a 64-bit byte count. f2fs_ioc_fitrim()
> narrows it to unsigned int while applying the device granularity, so a
> minimum of 4 GiB becomes the device granularity. fstrim can consequently
> discard free extents smaller than the requested minimum.
> 
> Use u64 when applying the device granularity. The checkpoint's
> trim_minlen already retains the 64-bit block count; also widen the
> discard policy field and its initializer argument so larger minimums
> are not truncated when passed to the issue and wait paths.
> 

Cc: stable@vger.kernel.org

> Fixes: 4b2fecc84655 ("f2fs: introduce FITRIM in f2fs_ioctl")
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,
