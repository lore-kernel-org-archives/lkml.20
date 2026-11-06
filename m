Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793971864;
	b=vcKp3xe5CKzp3+7gM+p2cEdYEo43L1t29qj9rE1dd+z31qQsh1+Veps+R/vtAKQP8Twv
	 /A9nOPGI9Q7/XA636++C4XF6DfMoaUutnmbLigNOmuNdc0VyXYsTbNSIGmVikk8shFs5+
	 YTQSEjI1wYbPZQ62AvthpF8TwodzG4coLNTt5wGeIRvhKS5J58SvEdZaEeMMmbd1YQ3Wt
	 q2QFmdOc0r0N0IxJatAm5Cjh/nWWclf3KZsBS4kjWVTv53Rmzwegmc8dJb7VHX2IHSaIx
	 GCTLx9EJLxl98kcJC/wKXwi4SjYhB+jNANABQQL437RIaPnWvnDKuIQP1vqVtJMx6Yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793971864;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=KsEtLjgYfHMgMWTCV9j/iE09UpigS3xHL/2sEbWoVtg=;
	b=5SAB+krfu60PufjMxO8YaL5yaHRhgHNamgycgAQmm0oo3olzzDObSAzWUzJG2YfV4wNL
	 ECcS2krsPckQaBy6TOh+7gnFVOr3FiTNtTxPRh7p/VeeX5EQNp6fnAZI5piSzrNWHq9ym
	 qAh88gA+XebqO9Vs6DYeAO4PwsIe6TDWUoSvu8NBd2wwedHsIvSKyzNKIBVXndm2lRvUe
	 Nj+JfJrvmw977ZtJZufJeYk6tr1At8tOvteXDfaqcrkNk2aFj28LBlZN0/w3uGUzlOfmx
	 8C4gCDo7F0HY0BCx86SwBu55wAslJIQZl9dLnjxsql0EMTH5ftU6QHODW4EIoVU8gGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E8AwD77Q;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EDC4606A329
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 13:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E8AwD77Q
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C39E1F008A1
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 13:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793971864;
	bh=KsEtLjgYfHMgMWTCV9j/iE09UpigS3xHL/2sEbWoVtg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=E8AwD77QNW1LVtfxAPc3MJzq50s/Zis9Wz94E8jJyMgAITfGeZzscXxrg62dfO2Sv
	 7qSK6G3Sc1jJYb/N+VFWeVxaXHZpoUyeIwdN2Gos5qmAqDNn+5Mtj7r6Ct5f9IdByL
	 FaMyHh0OmqA/oLxRQ6gNFpu6+i+Vo4Hq+66oZ3NUYFsxEZ0gF96jT0nTUlKIUnSDt/
	 0JWU9OGEMzibsfZLBnD70X6AzKpZtgQhqn9tqNpbem7E5ik0OsP0sHvv+BLud9jk5X
	 VdlCVo4n5R0FL30E6FphIQ4cLOlAkmNUfFhoRmrluqWtJibnyEBz4S76T4kJdhbf2y
	 vhLCRZ/wiNn7A==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5ba3fba0080so480213e87.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 05:31:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBz7wqdJ/NqfqjgUecFZb1mT5Zk5c2DkinO65CpAAgREOW/ozRJbQsCnUuEAEYxHJWeuEt6kHjMOE90KnvE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+/g1MJQ3xtjMqBsMFDUu5aBS4VPqYYHDopDM/loJ4/2FgOODGr
	dP/KJ9pQw6l34HwDkI7l2RKi0xK7rThbwBg+lH5JTlZOV41vbGnELFdjDGuIDYX3ww1owfqRaU5
	CVjGMcG+YyVxr0s+JKl3bAf/7kZLWs2w=
X-Received: by 2002:a05:6512:6603:b0:5c0:8dc:f2de with SMTP id
 2adb3069b0e04-5c008dcf56dmr236139e87.23.1793971862818; Fri, 06 Nov 2026
 05:31:02 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105215223.1263415-1-christian.loehle@arm.com>
In-Reply-To: <20261105215223.1263415-1-christian.loehle@arm.com>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Fri, 6 Nov 2026 14:30:49 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0g2R3DwuUCH2Ai8W+RgY2XBbbn2XULLmypx7-k70KxeUw@mail.gmail.com>
X-Gm-Features: AclHuK_yidvwwHstWNok0ryrQll26jqE7wFulYzd_5mzbyfaI6z7kXdudgvr6hQ
Message-ID: <CAJZ5v0g2R3DwuUCH2Ai8W+RgY2XBbbn2XULLmypx7-k70KxeUw@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] cpufreq: Fix global boost state updates
To: Christian Loehle <christian.loehle@arm.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, viresh.kumar@linaro.org, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, sumitg@nvidia.com, zhanjie9@hisilicon.com, 
	superm1@kernel.org, zhangpengjie2@huawei.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 10:52=E2=80=AFPM Christian Loehle
<christian.loehle@arm.com> wrote:
>
> Preserve the global boost state on failure and serialize concurrent
> global boost writes.
>
> Changes in v3:
> - Explain the concurrent-writer race in patch 2 (Zhongqiu Han, Rafael).
> - Add Reviewed-by tags from Zhongqiu Han and Sumit Gupta.
> - No code changes.
>
> Changes in v2:
> - Split rollback and serialization into separate patches, with the
>   corresponding Fixes tags (Zhongqiu Han)
> - Carry Pengjie Zhang's Reviewed-by onto both patches since code
>   is unchanged.
>
> v2: https://lore.kernel.org/r/20261105090311.1026648-1-christian.loehle@a=
rm.com
> v1: https://lore.kernel.org/r/20261104161657.546370-1-christian.loehle@ar=
m.com
>
> Christian Loehle (2):
>   cpufreq: Preserve global boost state on failed updates
>   cpufreq: Serialize global boost updates

Both patches applied as 7.4-rc material, thanks!
