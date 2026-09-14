Received: from mail-oo2-f42.google.com (mail-oo2-f42.google.com [74.125.231.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D632385D68
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 18:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789410342; cv=pass; b=AxbQlrJ3ugMtU7qPZfJXk3Jo/V3+V1xbWG9n6mlEDdus7jqEcbJY2R5AtgPR8xf2GAU7dI8NAD4A+Aep4UGeB0WP5T/bkiKR+uwHaLBKDHpfLyCt9fprlFUGQuSOPyfwz/uTVhNbrx77RBTJX8NQpi5OWCJ+WMnZsc2cVQC7EW4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789410342; c=relaxed/simple;
	bh=M05cKKzyMe6gEci7W/N5xN6B2lG87e4rRXDr2YH4Gn0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=syS0HJ2V4Gq8xTt7dO9hrXs3hFJ5UJh01eJQh62OC6WXkaQq+1nhMNRaQtFcT3glVcasmMg+E0CRWl098iK8CJwVdsOsc+yiZUJjanepUhPsBCSIG+Dm608VtZLeU0fO9Zr/pm9GbtiRpA1EiiT3Lf+YoLuxqnKyilNfQf+nhx8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lhRwOt5L; arc=pass smtp.client-ip=74.125.231.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lhRwOt5L"
Received: by mail-oo2-f42.google.com with SMTP id 46e09a7af769-7f4f0c89e35so1582859a34.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 11:25:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789410340; cv=none;
        d=google.com; s=arc-20260327;
        b=XuJvEXgjDBeSmbDWklZtP/EiLGWpd/8+ne1x1ngTm6wcS2fX8T1HNLewlGNMcnxHO4
         ajGaHaw13ph7URmC4F8dtcyG1GypUzkLNi8rOEplK5Bx7MJVS3oy0Q1BeCdS2P2leg1/
         6ciZkG/A1SezGZRvjfJMcUbssCWyMx7Q5Fuc4ov+UiiRZb0sxQnPezYCch72r4zrIz8p
         p35dPaPgUOCiBGisZv68c0hHMC4BCXA8sM6uJxKD5ziZVzFQxZAXvKQu4ueR/fq4nYWO
         /ROLnNKZFgXXnaB8hxM4RPt//fx/D0ZufjS0QkQ4aKh0CIZ3l85rXLwPY1R0M4MSyJV+
         q3gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=U651fx6dEYbgcs9HadXqwVgaBN2uUjOTpkPkaj2tUlo=;
        fh=xaf5q9eqbbhLyunJyjw58E/aeOqM+KmCPQNu0r6PxZU=;
        b=VYP7rKB6HYgE5IiRW09CJOuSuzl/+6hb1xvCsu+pLc/tRtqW+YKHLVuvz6dyQP1hT2
         vHDMk+jKtSgUrPQpfnTUnggekCfGlbzZqzV0wMGQF/1RpbXl6gN8LXmeEUOVZS6c9USB
         PlIJZTP9R9klIkYxx89II4bBsQ2HsIEow6YcDFKbvMckkQzxoG1fxl2qAm4SJAbQ00al
         9gZam0HxA3AZwG4BFod46KM5zig/bzjbivFff4zxZfyV0eBhSrPnndwBT/cjvsVajUYo
         T9KrUJYaAnLlOrX5x4n9gp0DXr7ugaMFNwChnjAIQwvDAvSYk0iBuPbG2Yz6gSduM+9Z
         sndw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789410340; x=1790015140; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U651fx6dEYbgcs9HadXqwVgaBN2uUjOTpkPkaj2tUlo=;
        b=lhRwOt5LcPQwCa23RxJjpcmFP5PNada84hRS1iRL67lMg7oGzS9VrD8XU+P5YhNfpN
         kVKGwa6dNvlSj4PxxZfhzG9IunzlkJ31g1C8og2Jxiw1o/dsKzZKe8tLqxIURssaZi0b
         uWl9mu6gAInzTgOJ80IUgCqsuY1TVBeBJMVTKmWnmfVPgPLYg8pFqU77nWy1jvwRPvs6
         EfN+bh/wZlT5W3C30hOHBIB1M/8whF5vf2V24xsVSgQgjkC3xPC1Nve1d+qn7J/C1eiO
         LIDt9qg8AUeHD7ojQ34+3TJK1W8gn/wHDafrq8RY3bjqpnro1DHFJ/nm6ENioRA1DaZk
         t9yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789410340; x=1790015140;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U651fx6dEYbgcs9HadXqwVgaBN2uUjOTpkPkaj2tUlo=;
        b=HW1WibBLDMzbDhVllJi+FVKNhNIEgL9G8cFMBOLXKx7VqPDNjSE7SRsRfOP2pvY6/T
         xpnkxx88NHNGjZbPabDOYejk8J5neNT//lNi3Fk81DHkVrfu2jgT3DxfL0mPobztSuF/
         dsOuloVkr8qxKn87/3DphUC+OjRPtEV6fHrqwOjc8U3EhfR9FsD/4tM2/2zGbkX7308u
         8OZ21CV7s8nyVdIa2u443jxQ6xu/BQ52rQx61At/sLfrQ6N8mkubQFIbuYzknn154vdF
         8nXT/ff2XXr8k2g6aGKkKaTHpRPfH+YB+GNLcxu7D06FCKiy56QPPmwCCtSAYC4ADir6
         12GA==
X-Forwarded-Encrypted: i=1; AKwUvBymzmVtUegl8qkthLtCTYcr8jkbEh0lvLAHyD7r6XjN6zzqOENmzJZ+3c0G8c9/fiUH9jfxrcURSSDY6qc=@vger.kernel.org
X-Gm-Message-State: AFuF++n6S3eERRRnXNeZKx4EZV5ZiLZTU1kDhfyDxWg/Jtrhvvzg5W/O
	DHdV/OL06ncT7Zw82Cpn0gX9aVPpSkzhTv1K3tdsnNKN6l8BI75bzlcmibck579/bYPLwcqeiL5
	ZSgyOwM3KFZ2pWjbEwKJ8iK4giEerLPw=
X-Gm-Gg: AYBFou3TBh3IDVnL0YEE6S9tPAkEtCVDv4NqEPvI4eoo4ZwFcx8DZdlbVQmAQbOQNjb
	ZLz3QmGHRWp31gtw1pyVtjU4+g1ERxep294oyQnT5Sp3gzaTrC0PQ+6rXB+H6zzVQheE2vHkp8v
	zke3VQejA3FzcFYu7Ihj9xOnZJ8McNpsRO/xPRqw2fZI0OVpfFT7yNlAkM2Hsyn+31p58+Tv/61
	xLHsweBVjMwViLTtxyYVYSePNj1eEb43svsUF+nRiBQd0M6IMcHZvqdRXCW0zrsfsBLMt3FOMka
	XLikDNQ5ijo/mttyR/kKYm2sw++fNrPUVmzUFGzqCBMtTM8OaYsej/5kHA==
X-Received: by 2002:a05:6820:2213:b0:6b7:46fa:16aa with SMTP id
 006d021491bc7-6c54292a26fmr2212816eaf.63.1789410340130; Mon, 14 Sep 2026
 11:25:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914-libbpf-log-buf-fix-v1-1-f592caffcc71@gmail.com> <05221557-59b5-4d93-ac55-d9e372d0862b@gmail.com>
In-Reply-To: <05221557-59b5-4d93-ac55-d9e372d0862b@gmail.com>
From: =?UTF-8?B?THXDrXMgVmllaXJh?= <luisflavieira@gmail.com>
Date: Mon, 14 Sep 2026 15:25:27 -0300
X-Gm-Features: AcwNN1WpiCNo8BkMZsFY2qQC5nwNASs0EdBNHmV87IALQDdz9LKh29qKxXvtpoQ
Message-ID: <CAFTBxmixD6bHH0Rn+Tr432tbgfzbKcrMd98s7_NTTF-Mibqh2Q@mail.gmail.com>
Subject: Re: [PATCH bpf] libbpf: Fix program log buffer size validation
To: Mykyta Yatsenko <mykyta.yatsenko5@gmail.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Shuah Khan <shuah@kernel.org>, bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2026 at 10:22=E2=80=AFAM Mykyta Yatsenko
<mykyta.yatsenko5@gmail.com> wrote:
> The change looks correct, few questions:
>  * Do we really need a unit test for this? We are not testing those error
> conditions now.

Agreed. I'll drop the selftest in v2.

>  * While here should we rewrite the first check as (!!log_buf !=3D !!log_=
size), to
> cover the case when log_size =3D=3D 0 but log_buf is nonnull (we check it=
 later in
> bpf_prog_load()) (AI)

Makes sense. I'll update the setter to validate the buffer/size pair
consistently with bpf_prog_load().

>  * Fixes tag is probably not needed, because this is libbpf, target bpf-n=
ext.

Agreed. I'll retarget v2 to bpf-next and drop the Fixes tag.

Thanks for the review.
