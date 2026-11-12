Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794500850;
	b=XUEMr06Ed9qhG1AKg+3ag9h24ZKY5BM5XXCcyA9B/TDetMkQ2nyrUZT3FzKw9qfQYYPx
	 zUWL5Gcv6A1YvBKjk2nqDJk8FtDS3PfgdUSxt1MuuxGI10r1EZoYv0GblC1SsQea/oScW
	 6fpccmLh5gtq25VyndAWuRrqPp/TUMJ5/s6nB7/+m4RThEqQRMc+UPUnZuQqLZ0He7unz
	 TZ/QimCOWIrmgPrZjDCfHZMppAHZnemBzS6u5RUaLxtE/ssa8aAYfao2YbUJKJGn1K3cU
	 Jd4/LnNKQrYQte6xUZmqJUgBaxOOeP8bD39Uaa8nFeKzWp8Z8wkP81weQCl+SaAdp9Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794500850;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=4rfQtqmAIAvmt99DAIISM3k+R3AqubbosQEc8qLWnGI=;
	b=V7l8pYhGF14hUjXY3PMofFeo6P2GpT75yK3V6mr/52sSb/R9O6TT3PAoZ3ebXeZasG53
	 FnkQ2RLSanIcrk2WL6qy+PTVTTehNRkK85xdO6Ei6D2JNBaNv2HE6ugyXd/NKNEW7pCRe
	 3L0ULIWfo8ZKI32qh4QaFT7cHJ2Xz8FRLmkOjelWBriGqaTFuWwIY3q+ocU5N10QiDLJx
	 o4gKJuiaM8orJDz0hwmscW/dUPW4IZxYrHfguN0vAqJAw9mn0xpCxtos21uUx9kriYb9G
	 f78m+ueXWsxMaHN2L+cJ6P69vVVk6iLWoc5iTeM3TVLG/lUF1cTYmsOq4EuvpKo6gfw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=YcmCDyza;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D8F8606A323
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:27:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D8F8606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=YcmCDyza
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4b76c15ae36so45275e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:27:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794500848; cv=none;
        d=google.com; s=arc-20260327;
        b=JZZJqRgjVJXjOgfyJrUCqw+Q7UZd+FxTPCpB+Eo+eBGwJqOXXmnGSTZv+7C23V2QIb
         9dg88Lu47sE6XZDXjZH7dpjzxHB6hJV+sS3+AdwwdY6No2HSvytnRxCXiTQ1u9Yk1u3p
         wKhGrXem7GeVR6JnffZv3tiS8ZpZRn0J5FP6zbPKgtQv/6LlkfdqxRRsiXM3iBc/FwW/
         h59xHSrqjOaN0dm3Xl1CM8HiGIVNn4qVZxaCHOhY3+EhaBTDp8HEzYxWieQC8NcbWm/D
         ybDiP9ly2i0p0ZNCeWMPuJoiie8XpeUhqYxg1fc31+aGuWvVse9G7K0e0g5IvP1ogGVa
         FNYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4rfQtqmAIAvmt99DAIISM3k+R3AqubbosQEc8qLWnGI=;
        fh=KXuiiu2yJbyDRBtM82VxRuM0Gsf0hTCHlKWIVihYs+w=;
        b=WGdt6TE1bCvZMBm/7v9lCOR21/yLjz3V7EhU+pJcoW75Kutmd/v9pb7ln7amGAnPC7
         SHVc91HJQhneVOo1SCVGdgtqFhwqQmzhbG8LJP2lKGFLOGBdnvfk0k9zcaoipBnfxIYY
         /mZmdvmICqzeWp/Hco8GgIzM1sXclub65uE+iVdyJcQGqBarSjrdXBN9Jn+h1GoQ7pZT
         pZWNaiiyq9OGs4Wlr47fs5Bt6D6ERE+e49CKcDCOMH8LOh4jLwAck7JVSpu6oaIwuukr
         4FN77ljEIA7LJi0hnEARGp7I6sCXApk6bQtfN/UMaoJx30nlrzCpxnKuuSkHA1PrEwaN
         dZEg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794500848; x=1795105648; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4rfQtqmAIAvmt99DAIISM3k+R3AqubbosQEc8qLWnGI=;
        b=YcmCDyzav8Nt9tsG6YB1qdzrsUj2K7xN0qRg6FjWZ85PVWjBDXTysbYRtMopeaGbHw
         3AD3NY7Klvu3c//cl4xWyT9uv9XZ/YXGR9E9IhVCPadmz4MO66ZCO1opX2iXapP6/oAW
         rtO+VtvjKI3UtJ9VnqFC+tm2nkYPOWL4ytG4YVF/EbhrczQOQcN6os3wrD4qT8Ih8wns
         9iFRpW+zxr43BA4tifJ2kpNVhhJvQbYNQfVQQLbcZpDT7Hl0lS70q9bjAg3WzVJsnTRQ
         f5B7HuJNmAZOpibG3xssCazggPBdHG8B4QJ6mGcJJJb8+oewtXsLgZxQ5gCpnjQ0hotN
         VoJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794500848; x=1795105648;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4rfQtqmAIAvmt99DAIISM3k+R3AqubbosQEc8qLWnGI=;
        b=FYt928LQNzvS1EOBjbBzxx6v1TuQ+QX5PIYjLzQcXXTRGGYzTEnsGdvnJKLgsmNUsz
         hQ/xJhuU8MhFMZk5zpWMPTB4RDZctH3VWLUhrzxOLpNL2vv+vK0jY0am/VzRsAS9hpUJ
         ZFPpPwzHORBR3tX0e6qpIpm6YhStDkzClH/Xx31URnwP+vcU4MsdqDuhuxSbWJM+B/aE
         E8OHhusayY/j8jnyCS+2Pp3ZJs4LuEdWBbou/hhfInj4UDm6y+UMqFmgll89FtHdpU9r
         eI3GZp8d11rnbUeztySoeVvO1d0ar8vPNivanoQEPzhsNmmFU/z1675SBgnTyPmKK/6d
         FRmw==
X-Forwarded-Encrypted: i=1; AL+hErE4y+Li6HigETz3qrvQVRZkxIS7yHEGZF1ij65SDh/WZIlLLagsDvi5fFRsKhPb/ue+C91AYPg6jFRWik4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9npkIQqMiXY0VJLU++n0KPlo3Eu87hMiedqGfi1KytU+jOq1j4
	Qx4P5yB370dSssqNK3r/N2B8+1uXU+T5Izg0EJzY0E92//b2AyW/YWE6YYGqgj93Jsgbh3QWT0S
	v3qkPO7YNjVnQtg7FVR9LcsPgmKkNMqN3qfkkrMuA
X-Gm-Gg: AYBFou0xaRwvawoA+dHMWhOfOvG9DilVBPpFH7p6hLtZayEF/iaE4+nSG9IDU0ZMx3T
	WP41yWeFjY9x5op/1Xh5LFFEPxtTJpvq7BuXj9wVn03qg7/ccI0d37iQw2zcQ0zvkfvfTsmMhjw
	bNHe7DWvP4p0T7KNIozA3mz84brfEDUNWZBhbWtaj1mOEEGenDh1pe7DSDOfLHyk5M9+MK591Sh
	X6hbuCC/7YZ2CIjmsNQrqM+6snk0HKs/ZoyYJ6LxMQxRQhQ5ItDaMQ2wIpIDSE046XtOeJyFAd/
	FOhwOLo0/u0r08z/S4XR6VBkKeWt6YW6eoW6G1+kEh8DraTKw5PS+EjodGC/X8WVthQzUzGdL5i
	/fpzxl+Wvq/8bF5Dr8XbA4yOMq84+y+n3pxYMKaRytQBvENOGSSVtMS3JRjEhB0oWkK3xkvBx0v
	4bKiJiinzg6qeZsijLCHr7
X-Received: by 2002:a05:600c:3484:b0:4a1:d7fa:ae36 with SMTP id
 5b1f17b1804b1-4bb4f596156mr1132755e9.4.1794500847262; Thu, 12 Nov 2026
 08:27:27 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110125106.2935677-1-k.chen@smail.nju.edu.cn>
 <20261111195942.1283060-1-tjmercier@google.com> <70c7192e-b9e7-4b06-9d78-38e9de85f486@amd.com>
In-Reply-To: <70c7192e-b9e7-4b06-9d78-38e9de85f486@amd.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Thu, 12 Nov 2026 08:27:15 -0800
X-Gm-Features: AclHuK-uQbQFbW5RNXEONirv5hUwyDZLZazYVkX411MRAANXcv3dooeKp4V1qsc
Message-ID: <CABdmKX3rqcf-U7W7E+d79dM9H3VnwUjAH3Hv92MczMSmQauC3w@mail.gmail.com>
Subject: Re: [PATCH bpf] selftests/bpf: Test that a drained dmabuf iterator
 keeps returning NULL
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: k.chen@smail.nju.edu.cn, ast@kernel.org, daniel@iogearbox.net, 
	andrii@kernel.org, eddyz87@gmail.com, memxor@gmail.com, shuah@kernel.org, 
	martin.lau@linux.dev, song@kernel.org, yonghong.song@linux.dev, 
	jolsa@kernel.org, emil@etsalapatis.com, ihor.solodrai@linux.dev, 
	sumit.semwal@linaro.org, phasta@kernel.org, tj@kernel.org, 
	bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 1:35=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> On 11/11/26 20:59, T.J. Mercier wrote:
> > The BPF iterator docs in bpf_iterators.rst specify that the next
> > function of an open-coded iterator should keep returning NULL after it
> > has been returned once.
> >
> > Add a subtest that checks this for the dmabuf iterator. It drains an
> > iterator, calls bpf_iter_dmabuf_next() once more and checks that the
> > result is NULL. The dma-bufs the test creates keep the list from being
> > empty, so an iterator that starts over would return one of them.
> >
> > The existing open_coded subtest uses bpf_for_each(), which stops at the
> > first NULL and never calls next() on a drained iterator.
> >
> > Signed-off-by: T.J. Mercier <tjmercier@google.com>
>
> Acked-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>
> Let me know if you already have drm-misc commit rights.
>
> Regards,
> Christian.

Thanks! Still waiting but no rush.

> > ---
> > This depends on Kang Chen's fix and fails without it:
> > https://lore.kernel.org/bpf/20261110125106.2935677-1-k.chen@smail.nju.e=
du.cn/
> > Kang, feel free to carry it as 2/2 in your v2.
> >
> >  .../selftests/bpf/prog_tests/dmabuf_iter.c    | 19 +++++++++++++++++++
> >  .../testing/selftests/bpf/progs/dmabuf_iter.c | 19 +++++++++++++++++++
> >  2 files changed, 38 insertions(+)
> >
> > diff --git a/tools/testing/selftests/bpf/prog_tests/dmabuf_iter.c b/too=
ls/testing/selftests/bpf/prog_tests/dmabuf_iter.c
> > index 1a5dc1adae73..c1f81b5dccdc 100644
> > --- a/tools/testing/selftests/bpf/prog_tests/dmabuf_iter.c
> > +++ b/tools/testing/selftests/bpf/prog_tests/dmabuf_iter.c
> > @@ -265,6 +265,23 @@ static void subtest_dmabuf_iter_check_open_coded(s=
truct dmabuf_iter *skel, int m
> >       } while (bpf_map_get_next_key(map_fd, key, key));
> >  }
> >
> > +static void subtest_dmabuf_iter_check_next_after_drain(struct dmabuf_i=
ter *skel)
> > +{
> > +     LIBBPF_OPTS(bpf_test_run_opts, topts);
> > +     int err, fd;
> > +
> > +     fd =3D bpf_program__fd(skel->progs.iter_dmabuf_next_after_drain);
> > +
> > +     err =3D bpf_prog_test_run_opts(fd, &topts);
> > +     if (!ASSERT_OK(err, "test_run_opts err"))
> > +             return;
> > +     if (!ASSERT_OK(topts.retval, "test_run_opts retval"))
> > +             return;
> > +
> > +     /* The test buffers exist, so a restarted iteration would find on=
e */
> > +     ASSERT_EQ(skel->data->next_after_drain, 0, "next_after_drain");
> > +}
> > +
> >  void test_dmabuf_iter(void)
> >  {
> >       struct dmabuf_iter *skel =3D NULL;
> > @@ -315,6 +332,8 @@ void test_dmabuf_iter(void)
> >       }
> >       if (test__start_subtest("open_coded"))
> >               subtest_dmabuf_iter_check_open_coded(skel, map_fd);
> > +     if (test__start_subtest("next_after_drain"))
> > +             subtest_dmabuf_iter_check_next_after_drain(skel);
> >
> >  destroy:
> >       destroy_test_buffers();
> > diff --git a/tools/testing/selftests/bpf/progs/dmabuf_iter.c b/tools/te=
sting/selftests/bpf/progs/dmabuf_iter.c
> > index 9cbb7442646e..d5421b75c39c 100644
> > --- a/tools/testing/selftests/bpf/progs/dmabuf_iter.c
> > +++ b/tools/testing/selftests/bpf/progs/dmabuf_iter.c
> > @@ -99,3 +99,22 @@ int iter_dmabuf_for_each(const void *ctx)
> >
> >       return 0;
> >  }
> > +
> > +/* Result of a bpf_iter_dmabuf_next() call after the iterator was drai=
ned */
> > +__u64 next_after_drain =3D -1;
> > +
> > +SEC("syscall")
> > +int iter_dmabuf_next_after_drain(const void *ctx)
> > +{
> > +     struct bpf_iter_dmabuf it;
> > +
> > +     bpf_iter_dmabuf_new(&it);
> > +     while (bpf_iter_dmabuf_next(&it))
> > +             ;
> > +
> > +     /* Store the raw value; the verifier would remove a branch on it =
*/
> > +     next_after_drain =3D (__u64)bpf_iter_dmabuf_next(&it);
> > +     bpf_iter_dmabuf_destroy(&it);
> > +
> > +     return 0;
> > +}
>
