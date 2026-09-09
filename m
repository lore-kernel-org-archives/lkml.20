Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71DAB33D4F3
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 04:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788928706; cv=pass; b=Uzs1/yp/EAvFxNYxs8cSuXpxWmdexQWI1q8ZjI1XJMS1Bh7yAPqYvBw9yY77+r6Psh8e+RlLeF9lFLW4PeG81JC/ixB5EyWR97C12/IyZffNK3Kb6wZRXvtqOiOLXI8UFvZ3bKfzUpV1tG44aiaUNfb+77PLGm5QYdoWbzTNz70=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788928706; c=relaxed/simple;
	bh=/+3eKYYz03dUBjHcHqHQIQKyut0iHUO9Sr1nrn4fiWA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qORGfZch3ZRYLdGuHVPa93py/KSaBqbgmxMNX9hoKLdupbKHc+slfMMxZmEU7CF0ZyGyUsRHsgijzCneAPKzquQpjloty6YEeV2M+XvMGb708rcJ7zsrLyV/mCEf2eZW7svG64A2d5EUgGXgt9/ehBKPffoqmpkyC0MaKkIeUH0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com; spf=pass smtp.mailfrom=etsalapatis.com; dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b=G+slYNMJ; arc=pass smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b="G+slYNMJ"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-87ffa98d4a9so2469597b3.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 21:38:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788928703; cv=none;
        d=google.com; s=arc-20260327;
        b=UmakmEBjDsfoaCwNvLUH4b1L/MKSLx0DcA/i/Lx4EeGvr+93l9NaVPF6eCxlsP6X6X
         QgXlLut/zf/wRBaEkfW2bXPF49GNsy0acqUDjaMw7Y4eNba5o2AbkCqaZsrcupe1h3m0
         rJStNEk08AmUfzP3/kH6NujX9xgoJ9L+lrW+IRDj+bAyFx/8Hoi2zBdJYX/RDJnrKzSd
         ukWaEy9TjgltQcO5WlLeCN6BYJMLgaH24q5PXODrc34SgNPxI5lPUQKEimqRJvnyeGPL
         /zY2AxKUW1Iwfry/FcbinlBPpLs9RQETuyw4JgaA0dl/NDOzPsbCwUkoc3W3F+TVioWO
         Fawg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Teu6cC+d3LHtdtN3ePnM4eTc17lML+xatDJgJtdz0Ns=;
        fh=D+0OhiNyUOgDkyp6v6XZm98ewgWzx3pQDc+jqfFG8nM=;
        b=IoH1eG8ej97Y9anqFZqz/aIv37cihKutyD4kiZ12nRM8pUmeNGn+bFpaXC6S8ZmdIj
         T3qfvmgqZzNKvmNjsV7gtpJJtNX0zbq2VjYMyXaemWc5+PsPt2gGiayTXhEBHhMMoq28
         MQFvhfA4KboDf05xpf+3iCqA38rmDhwe4mO6h6+XAQhcHK+7S34saB/uUG+ebVOUhnQq
         ePjdR419NvlkTfTuzIYqZCh/1y6rJVb6sxxOAGR4mDMKUXLBcYIG4gXIoUrbkyxAcOsv
         3EbSV/au2T6M1LfD9BoWhnlxihhOZ8qiehN5VznSJrWl/GDzxTZu/rjAqkh4DN0gFSU5
         GFcw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=etsalapatis-com.20251104.gappssmtp.com; s=20251104; t=1788928703; x=1789533503; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Teu6cC+d3LHtdtN3ePnM4eTc17lML+xatDJgJtdz0Ns=;
        b=G+slYNMJ4NeYNov1rDcn3MJkqULMh4eAK7gcukOQB6HThKx6bB05QZKrqxMyyNZDg6
         qQ7nlvJQp27dtcDujIxhQMxrNeKZLOKfUDGMeyKDpOoKLk+ad9bSIcI6ezlT7yHqihsk
         h0Z9SjcyRDJfbVk7Jgx28PATGsWAs51SmRg95r0crWFucxkJW8J1+uEaU+5sr50mvVGO
         BJnLvXTi9B1YqaxczK7sUZF1nJGRAh8x7jTDRAi4DLB9+sOju+Vx8XMcD7aVlcEZE98h
         u+qKtDkafzy077tmVLUxRqtWLbgCF/FbzhwTCAH6OaWKd9dYs3x7OqEmuwpwC+Df3YPo
         UjGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788928703; x=1789533503;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Teu6cC+d3LHtdtN3ePnM4eTc17lML+xatDJgJtdz0Ns=;
        b=PG0RQDeBIeDMYsfhfDK95voTAsm9URcHtCos01I+1bE+4Qhx8afD3Cifq0yZcUY3dG
         y/aGLvyr3Hy7aHOGG99ZSEYxqAZ1BjxoDKMV+wUKFNrU4pstaMXO+DGQ/Z5kHlcJBKDk
         Xfv4TtVfpIoPYFrEitlr4WSheobUMshZQxJrOt2QWlMj2uQBpSloyuw+1K/AZgkZiTKw
         TqkU8bMlGqqlXurl5Fm8E7wipa2giYUakJ8RYsLQPNTUJQzlG0EZ5R+idEdys3W4AA8R
         w5X+zB5csSSedL72UkqoRptb+9Da+lL3kltROGmNggfHiQ06oUi/UdStUv2doAA3wtKI
         FN5g==
X-Forwarded-Encrypted: i=1; AKwUvBxtJqolnYjvdyICaB4Cv2C7376sMi3UP44oO5fBSnYXS3+FeOAYTCnE/EiwvlHnegXbza/D+AC3anb3Kew=@vger.kernel.org
X-Gm-Message-State: AFuF++l7uXPex0wzsQcx7Hbzp7ETT6awwmwVhXIErADpz+azMa1+7tF1
	x52O63NLg2ifu+zwirR3cnxnKdStOMpFB89AhO4vVQ3DH3HnHOXQas7XahcS/K96lywOj9eNbHk
	sNmOhJHy0bRdlqFu7G958OduvuYAZBoKTjJ3iyUygsw==
X-Gm-Gg: AYBFou2mGG/qMXwILVZ2x5kaZZnrVoUtlXJeXnptQM0A3NfVG10o08VdMLvyM6g7198
	ALScgBHDkSKllVrNnzV5No0s6fXIszoUnJh89oWsGdEQNCYWUmbk7b24LW6iDM9ohzEG86yg8TP
	bVLOTEZGTneuZUnjTzhE0aL4anVLel8i65uFPAmAUhcTuPbuxfpYgzm4pCoXh5btVGzNQHOCV5G
	DXBytczLNWtIiaUlKRbGj7wbjwaE/Nnr5+NY/mRuTZ5hO7g9a9auKvPAWNFFNEqEfKSDwwHoIXV
	oEoKuQz8Qt3U02xONCD4H/3qs/JR5bx3F9DlEr3ZKhojrAWx3DFA1rA=
X-Received: by 2002:a05:690c:e3e9:b0:870:820e:da66 with SMTP id
 00721157ae682-87127d2ca36mr124113977b3.23.1788928703258; Tue, 08 Sep 2026
 21:38:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903150351.12725-1-colin.i.king@gmail.com>
In-Reply-To: <20260903150351.12725-1-colin.i.king@gmail.com>
From: Emil Tsalapatis <emil@etsalapatis.com>
Date: Wed, 9 Sep 2026 00:38:11 -0400
X-Gm-Features: AcwNN1WAFyR_AVCv1IXGTjGY0PGid8q5kgFayEO3Y82fm5jIlHk6g71DHjJvDXg
Message-ID: <CABFh=a7YTi2U2-cx4b5zejWv6MXE-VG-u7K410pPbtJiw6qbWQ@mail.gmail.com>
Subject: Re: [PATCH][next] selftests/bpf: test_xsk: Fix spelling mistake
 "conigure" -> "configure"
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Shuah Khan <shuah@kernel.org>, Maciej Fijalkowski <maciej.fijalkowski@intel.com>, 
	Bastien Curutchet <bastien.curutchet@bootlin.com>, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kernel-janitors@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 3, 2026 at 11:05=E2=80=AFAM Colin Ian King <colin.i.king@gmail.=
com> wrote:
>
> There is a spelling mistake in an assert message. Fix it.
>
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Reviewed-by: Emil Tsalapatis <emil@etsalapatis.com>
> ---
>  tools/testing/selftests/bpf/prog_tests/xsk.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/testing/selftests/bpf/prog_tests/xsk.c b/tools/testing=
/selftests/bpf/prog_tests/xsk.c
> index 6e2f63ee2a6c..772f3dd7ce64 100644
> --- a/tools/testing/selftests/bpf/prog_tests/xsk.c
> +++ b/tools/testing/selftests/bpf/prog_tests/xsk.c
> @@ -75,7 +75,7 @@ static void test_xsk(const struct test_spec *test_to_ru=
n, enum test_mode mode)
>         if (!ASSERT_OK_PTR(ifobj_rx, "create ifobj_rx"))
>                 goto delete_tx;
>
> -       if (!ASSERT_OK(configure_ifobj(ifobj_tx, ifobj_rx), "conigure ifo=
bj"))
> +       if (!ASSERT_OK(configure_ifobj(ifobj_tx, ifobj_rx), "configure if=
obj"))
>                 goto delete_rx;
>
>         ret =3D get_hw_ring_size(ifobj_tx->ifname, &ifobj_tx->ring);
> --
> 2.55.0
>
