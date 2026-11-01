Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793499295;
	b=MkznStGkRq+Bgqk9cRU6N/AjlXKOkDpfFMKAz6va+Cy+2ywexmnTpKh1HB4G04RzoqiB
	 0wcqNsCZLf8s4wIp/eY4GqVBTnyaptaEOZXG6xHRE5Q+WtS+LkTKEMNseiSjRyfR7mvUL
	 UTM5Py2s8aFUvs0f5iIQQ5W41hySBYNxRUUrzvNEg93+O8xRepaRUt1pzpn1As2VKa+cd
	 Byf/LlAvxfW+k/J+rnAoR97PPrqXICfW47RDdWK8dVGAJXlJU2w/bN9c6wBZEzAAS1ZWg
	 Fjt42ii9B70hAjEugr2Ifs7RUe3I9zeFh0NV0OxqsqndCkIpt0zEadZ/n0PfS9DfKFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793499295;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=LRZGThiFHzP97lut56bvREDESV1Qmk2kVp+avLfzOBM=;
	b=ctb+oxCQm1yadlu00lR4iL2TmFRzobrc7Asud6yIgFLKDWnooL+cUWtk2HtG1FBahHbJ
	 Stwq6KCa06jHs/+A3/UNJtKTo+2ebZCFbR7U7UsaW4s7muuDMcuTcQHxy4vXiKTbM8JrZ
	 kfMS8Y1VYcfXwg+vvowQRKtTTFrmpD+tj0IjLMfs3x8gL+NVwaOpwhGSr/2GJ0C++HFqa
	 qPpjJ8nrivG8Uq2a9u4B50Ssv+RcQNPVdIpUfQiTnfQSw7Y11lLl0KKY9JkZRbOP/vf9G
	 7USyZH8icvSMozEPF3JaHCc4M8U1I/bsmV+42OEU91TN0dxd9SLHmHWpdKH2Dgptl5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f3uhWFhG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 551D7606A327
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 02:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f3uhWFhG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4CD41F00A02
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 02:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793499293;
	bh=LRZGThiFHzP97lut56bvREDESV1Qmk2kVp+avLfzOBM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=f3uhWFhGMaR4KVYXrT0ejlBCi2I1MoYeBHWHs1tyi22EM5v4iVDBeW+aaTVRaYAyN
	 s+Oi+kj0PFYsucC70PRkUB3Yj0oD1x0OjuoPvGGVrcLlzHY7KfxuewDlmhe4DBGbYq
	 GWhm/8WS0Az0MKJnif2hyR86D28nM7qo/oebGNzgg/98t6Ymn3RWmFO5ivj7/96Yw3
	 4jUkcNpHJLs9D800NqlPL0cqj1Eucdfw+Dk6FkiO7tP1u3Ek9b9M/tWyofM1xAkKO4
	 gqDE4JV3K4fW1S4EZUyLL+ZxeapyGXsKnr7eMZMTxSEjP3xR+jgu6QYESlno+GioH/
	 DAISOZrGiT2oA==
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c4cac7a7d3cso210344866b.3
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 19:14:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz1sIFaHzFr1DvQ+2oVodeDRzHkK52vmM7cfnJhpmLjt3MF+mzAncwBOooB8US/yCwZce0B4QOTqcOdplY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKPjndwvg40ail6SccmbDAWmFoZ3n5s2NJ9K4RvcSbtWTk1FIe5
	q9j2FCyu5BAEpJDig3TqV46Btf5F20sva5BEUUkCaWT6pj9d39t7pIEVJQDpcXnK3ni0e+349gq
	4TQpc+NGLPKjsemNwEG9I0rn183X/v1k=
X-Received: by 2002:a17:907:3e20:b0:c26:1649:47a5 with SMTP id
 a640c23a62f3a-c4ca7a9b0d6mr546901766b.27.1793499292617; Sat, 31 Oct 2026
 19:14:52 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261031222823.223-1-dennylin0707@gmail.com>
In-Reply-To: <20261031222823.223-1-dennylin0707@gmail.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Sun, 1 Nov 2026 11:14:40 +0900
X-Gmail-Original-Message-ID: <CAKYAXd_NYXmW5q3mu8XEqa89qanUBdPMkPND7y4Fmu1Uk4OhxQ@mail.gmail.com>
X-Gm-Features: AclHuK8EOzubb2Y8T0Qz305hPjjSLNWdRK5WoX_toeVCEh0R7XaINWPYpnkgoYk
Message-ID: <CAKYAXd_NYXmW5q3mu8XEqa89qanUBdPMkPND7y4Fmu1Uk4OhxQ@mail.gmail.com>
Subject: Re: [PATCH] exfat: preserve the 64-bit FITRIM minimum length
To: Hungyu Lin <dennylin0707@gmail.com>
Cc: Sungjong Seo <sj1557.seo@samsung.com>, Yuezhang Mo <yuezhang.mo@sony.com>, exfat@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 1, 2026 at 7:28=E2=80=AFAM Hungyu Lin <dennylin0707@gmail.com> =
wrote:
>
> The FITRIM minimum length is a 64-bit value, but exfat_ioctl_fitrim()
> uses max_t(unsigned int, ...) to compare it with the discard granularity.
> This truncates the requested minimum on both 32-bit and 64-bit kernels.
>
> For example, fstrim --minimum 4GiB can trim smaller free extents because
> the minimum wraps to zero before being raised to the device granularity.
>
> Use a u64 comparison to preserve the userspace value. exfat_trim_fs()
> already stores the minimum cluster count in a u64.
>
> Fixes: 654762df2ec7 ("exfat: add support ioctl and FITRIM function")
> Cc: stable@vger.kernel.org
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
Applied it to #dev.
Thanks!
