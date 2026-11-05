Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793886945;
	b=ytoQqDt221QCNZ1Mn8PoqlWKgYeForisACwTGtferEaCGIKvwwu/f5if4QWkVOdhfOwx
	 BZ7ZOOJd54aOFmO5emaJyZPLLnt86p7x77lpZUwzNba8XRe5KBlQ6dQYzMSEqNtV26pD8
	 kTy3J9VcfFHiuUvlwaApa1uHyjIDvCM5CCyGa5uenPV40DJ8N35032NR4yWWHYe9xl323
	 xBK4l02h9/NbKzPi6of2E+faAEeeCAWZLfYGvgwuu9O1lyjHbk00nCvmRMpFWv6zOqeAY
	 TbYfMCStzdaq69AheF9TjjciJqZ1etGrZ+C2EIzcCylmvUswYB5s5TBggfm05hrEzoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793886945;
	h=Received:DKIM-Signature:Mime-Version:Content-Transfer-Encoding:
	 Content-Type:Date:Message-Id:Subject:Cc:To:From:References:
	 In-Reply-To;
	bh=FRvCb0qdn0UFgCq8z99GAbGRLgJXO4j4sZWydl6Xwds=;
	b=et/IS7fh6Nz9eQUvjljX0xUedY7AVDW0L4QdHu6o4/25GhqBxWMqGtyZMYL/viBRWstI
	 OICCpO9bi4amx3EbkzN12auqCzdjoEs4mWYPzAgQxNgr5OrEvfIzaiYhmWlAU4Vwa851o
	 n3ph3+xzWPx3KFhgyVUT5FucDcUbPvqvQUfnWW2lUxAhGFk08EcuQkCKUEZxb35Ov0MJj
	 wgyRFuMFLkLc7TpdjJhaQZFOMF1R9BdE8gE1WPgWSdIwfjE0Sr8HNQeiPsoClNpbyyECi
	 SiXLREUFLRjO0gslF75DRdtdCIULj5Uj91YARic6RoCuu/EYJPSyuvXtr5xosvgNs/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L8B5TUmk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 788DA606A326;
	Thu,  5 Nov 2026 13:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L8B5TUmk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9775A1F000C1;
	Thu,  5 Nov 2026 13:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793886945;
	bh=FRvCb0qdn0UFgCq8z99GAbGRLgJXO4j4sZWydl6Xwds=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=L8B5TUmkCR4s1r1wiNQSpXG2koNdEAW6KB+TqzDVo/Zb1Ew5F67tq4MoHL60J/a4d
	 P1mzGlTZk78Ohq//u2YU359ZiciYbDIFCxJ8APqY6j4X1+ELfJvYEA0XAKiUZh9XIN
	 KsOzC8VOUJuG92TnnENuZUUXAUS6zBXXtAzNxiZ6PzikDx0LxqXdWTatL7KdP+ob+z
	 jwXhyQFGPr+lQSLfTzjTWdVPP+GPL1OuroIsxZuLLqAMK7zVbEB90pbErGwU1KU4UB
	 /pfJvG7/H02SEG2FNqh5TF89cc9MyEvmGIay4WpWqDKsIgWkPckHt8aYC07f7x0D6N
	 0DIcGyuEInHpw==
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Nov 2026 14:55:41 +0100
Message-Id: <DMNBUJVZHT7N.232EWW7QZINWD@kernel.org>
Subject: Re: [PATCH v2] dma-buf/sw_sync: Optimize the retrieval of fence
 reference counts
Cc: "Edward Adam Davis" <eadavis@sina.com>, <sashiko-bot@kernel.org>,
 <media-ci@linuxtv.org>, <sashiko-reviews@lists.linux.dev>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-media@vger.kernel.org>, <syzkaller-bugs@googlegroups.com>,
 <sumit.semwal@linaro.org>, <phasta@kernel.org>,
 <robin.clark@oss.qualcomm.com>, "dri-devel"
 <dri-devel-bounces@lists.freedesktop.org>
To: =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <sashiko-outbox-198550@kernel.org>
 <20261105052707.55911-1-eadavis@sina.com>
 <ad203438-ddbe-4445-bb3e-9632e738c1a5@amd.com>
In-Reply-To: <ad203438-ddbe-4445-bb3e-9632e738c1a5@amd.com>

On Thu Nov 5, 2026 at 11:03 AM CET, Christian K=C3=B6nig wrote:
> On 11/5/26 06:27, Edward Adam Davis wrote:
>> Fixes: e531fdb5cd5e ("dma-buf/sw_sync: Avoid recursive lock during fence=
 signal")
>
> Please completely drop that. This is not something which has any justific=
ation to be backported.

Fixes: identifies the commit that introduced a bug for better reference,
independently of whether the fix should be backported.

If something shouldn't be selected by autosel one can add

	Cc: <stable+noautosel@kernel.org> # reason to exclude from stable

In this case I assume you said that because SW_SYNC is test infrastructure?=
 If
so, AFAIK the stable team explicitly does backport test infrastructure as p=
eople
also run selftests on stable kernels.

Thanks,
Danilo
