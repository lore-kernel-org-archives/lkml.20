Received: from mail-wr2-f10.google.com (mail-wr2-f10.google.com [74.125.225.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14AC2299920
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 01:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792373494; cv=none; b=k8avOlziCmRE0q66k5JVLNLxo/pyqJ1vxB1197XGNWUoHixaXqrOqpFyu6cX+gRg3TwTTx2B7X5ghVozLzUEwxBnUha+63Nis+Vp4/SPnkbos//hm/ojvJyxcXLu4cxgeWLpD3FFH2Ar659l5hnnLsnYmRtdqqxlaM+E3WVnuX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792373494; c=relaxed/simple;
	bh=TGDF0NfqUind8bd9n5FNh1wHcjuEHBpsxqOITA2l+Xk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=MiIQD6kc4TgwvnqLXOmRvf/zHgoe1mWgfgRw1L/flA68KY2BX0kXK+7DBFOw0G/QUKoYYLQ3XU+ewXjH02Phsr4UWXzn3FqQmiSiWxa1Z/mT0GX/PuuGW1tNV22jY3bvRkxo4XpV4kWYk8d7EpPPonn6h6RYi3L+Qz9I5z2P458=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e5ZunzOQ; arc=none smtp.client-ip=74.125.225.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e5ZunzOQ"
Received: by mail-wr2-f10.google.com with SMTP id ffacd0b85a97d-48dea979eb9so653028f8f.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 18:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792373491; x=1792978291; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WISQLz2AQxQcT0S2L37UPdDuk3j2AQ3msq6Prumccac=;
        b=e5ZunzOQcCPj3Yoc7V3+SkVc77PpDED3XFmobT27ATTTXP8c21KQZN2uGkmktDpQs0
         Mzm9Wfy/l2V35qlD9FCNWdi8wvezHdad7qFccXN3dmQP+K0iP6SYqGV9VXkOCGJlld7F
         +Tje+eInhlk4k6azO9VwT8+owTB1ofkil2gHbvhTfeYJecx3Fl7d108SGTR7DGvZIeeH
         kF1jf9ggGxaf3KQX42xDYoDbOC8GvLu1HhlSGcyF9cQR1j0pxKBxwt/eLkA/ovKBR8Zt
         UihbQ+dxm/zz+2qObY5a5smx4RkIHYslSMYwNkUfVDHST677j+sWnj3mAhHHp+rMYyh0
         13Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792373491; x=1792978291;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WISQLz2AQxQcT0S2L37UPdDuk3j2AQ3msq6Prumccac=;
        b=1w1i09ycuHIqCMtYuJIlasPy5m/2mRcIw+lnaIf3QI0bvkquVcfHfbbbfU7DqvDI7Y
         RhOOJep52wlXgEUP5fy1RWCaJzfEgcpVKW+ip2MIJPvg9zOwHlmnY3PuJOz3u5KBRBNc
         KCv9n0frjggsbMi59b5sypB/RJMqdJp/u7ROihaH8K6m7MeuR25mTcX/K1i2StCIh8Pu
         5aDm7f/Urtka1ogB9ZVarPVCDXs5iRYZoQO4DbVk5pBmCxE3Hn4U6oLNmssBfLrgwsfm
         kJYh8FZdysJTUmqyAQmGkDpcLM++NA3/dPuytRHUxa4j+VEvexK8kneJ5AN8lJbtRMU7
         cuoQ==
X-Forwarded-Encrypted: i=1; AKwUvBxPg068eB9ScuSjyBQ5+gRcV/DQXjpOcwbZv25Mw3NchxmJWf827K12BT60IXyTjpBMCZyLzCnZA1+6PZQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ+DXkcX1hbUrSekF2C4X35mvTSBrj8wFQ/oRDLEeSVkg2Zws/l
	wyD5sFdNOkSv+TQpOmG2AXpm6JG3X0j/5p//fdVghU00mwHzRcF4x0kS
X-Gm-Gg: AYBFou2XKNz0nxlA23zluEEhHv/WvgeMbQpI8FeU6PQ6yT6Y4xmDyHv4D7z62f04ETx
	6NR5EQYPsZbI1pK0aF0uyW90QhE91E7TqRat+zXJS6u22IwpJTOlYI2dyfHeOgiqFsB2mmJw93d
	6AhsYMK2KK0zw/7KLp5sDfXcjLf7jpvQLNJH98Wmd5OiTuGcRUeCa4Lf30eCWRcK17JcoRAFPiC
	XBwBfCJIDSKZLNm6OKHlll1aPLkEgSLk99aQaoVUXo9AL7yG99MFGujZj+AqR9YdErAS2R+e2x0
	BmQSTGCHBh1AijQ1GkrQAlPJqUncFi8Ju1fA2V/GNSJxIsuSq2GQIX9LBI9RSf7PU7hIbzZcdVd
	OREicoI9z7hvh0f7hPK0NJUZmefqLg2vfo+zO2zCNjCyxyTEKmhPfPHqT3o9t1IJbLomQdyk5it
	HVWy7HFFTy9NQaVTuoH5TuRBIiG35CgWT+PVO5e+b0G44WkLyDsYcr2XnkzXYXT5slSDteyoyO2
	7KTNulK0MNR6mIskM7Wb9vJHCD/gCtxOVcy3qTpTx9z+DyyY2AqcN0VY+bj3tYrRUBRvwIYqY0A
	zBev+6EOJXTJwWVP3Du5idJlsJYs55UVC8Ffrw==
X-Received: by 2002:a05:600c:5492:b0:4a1:d992:9476 with SMTP id 5b1f17b1804b1-4a1d992951cmr116649365e9.23.1792373491132;
        Sun, 18 Oct 2026 18:31:31 -0700 (PDT)
Received: from localhost (nat-icclus-192-26-29-3.epfl.ch. [192.26.29.3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1cf983b88sm232364725e9.7.2026.10.18.18.31.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Oct 2026 18:31:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 Oct 2026 03:31:30 +0200
Message-Id: <DM8FDI32CJ1Y.2JOM7KJERMF7M@gmail.com>
Cc: <bpf@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH bpf-next] selftests/bpf: Fix wq test by changing 50us
 sleep to polling over 1s
From: "Kumar Kartikeya Dwivedi" <memxor@gmail.com>
To: <thamrinjonathan@gmail.com>, "Alexei Starovoitov" <ast@kernel.org>,
 "Daniel Borkmann" <daniel@iogearbox.net>, "Andrii Nakryiko"
 <andrii@kernel.org>, "Eduard Zingerman" <eddyz87@gmail.com>, "Martin KaFai
 Lau" <martin.lau@linux.dev>, "Song Liu" <song@kernel.org>, "Yonghong Song"
 <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>, "Emil
 Tsalapatis" <emil@etsalapatis.com>, "Ihor Solodrai"
 <ihor.solodrai@linux.dev>, "Shuah Khan" <shuah@kernel.org>
X-Mailer: aerc 0.21.0
References: <20261005-wq-poll-fix-v1-1-99ce4bac59f4@gmail.com>
In-Reply-To: <20261005-wq-poll-fix-v1-1-99ce4bac59f4@gmail.com>

On Mon Oct 5, 2026 at 11:37 AM CEST, Jonathan Bastari Thamrin via B4 Relay =
wrote:
> From: Jonathan Bastari Thamrin <thamrinjonathan@gmail.com>
>
> wq test fails with ok_sleepable reading 0 instead of 2 as workqueue
> callback hasn't executed before check.
>
> This happens as callback runs later on a kworker and 50us isn't always
> enough.
>
> Change from 50us sleep to polling over 1s.
>
> Before (usleep(50)): 3 fails out of 5000 runs
> Diagnosing issue (usleep(0)): 23 out of 100 runs
> After (Polling): 0 out of 5000 runs
> Tested using vmtest on x86_64, test pinned to one CPU with `yes` load
>
> Link: https://github.com/kernel-patches/vmtest/issues/455
>
> Signed-off-by: Jonathan Bastari Thamrin <thamrinjonathan@gmail.com>
> ---
>  tools/testing/selftests/bpf/prog_tests/wq.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/tools/testing/selftests/bpf/prog_tests/wq.c b/tools/testing/=
selftests/bpf/prog_tests/wq.c
> index 84831eecc..b55d8547f 100644
> --- a/tools/testing/selftests/bpf/prog_tests/wq.c
> +++ b/tools/testing/selftests/bpf/prog_tests/wq.c
> @@ -7,7 +7,7 @@
>  void serial_test_wq(void)
>  {
>  	struct wq *wq_skel =3D NULL;
> -	int err, prog_fd;
> +	int err, prog_fd, tries;
>
>  	LIBBPF_OPTS(bpf_test_run_opts, topts);
>
> @@ -28,7 +28,13 @@ void serial_test_wq(void)
>  	ASSERT_OK(err, "test_run");
>  	ASSERT_EQ(topts.retval, 0, "test_run");
>
> -	usleep(50); /* 10 usecs should be enough, but give it extra */
> +	/* loop check over 1 sec to make sure it doesn't fail early when busy *=
/
> +	for (tries =3D 1000; tries >=3D 0; tries--) {
> +		if (wq_skel->bss->ok_sleepable =3D=3D (1 << 1))
> +			break;
> +
> +		usleep(1000);
> +	}
>

Please figure out the actual condition this loop is trying to wait for and
establish it directly, there are several examples in the selftests.

pw-bot: cr
