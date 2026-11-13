Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794589208;
	b=42E32XvjR7Dr9c9bBuEatf+5XHMqSBOXSRiROfjXFCuZ4v1jAjMw4zaCO2m2ozwliDKj
	 UswMr5FF/yMUKTfJrN8s6CdnS0sT+E7tBTZuiXRo0XU9RU4GpZIOUGXkyinM/UoQ9Bt4C
	 e65N9WUuVOCC0CVcpQN/RT90W9D+8G3VSG3uAJZXa8SosL5dh5g3FvWgN8/JcwyN6b/De
	 3c4OZhPc7rWB7Zv8dVpuJB56Cw3BRpt7/HN3KRHy/XdrEeDqSIcy67/6L8sVTtAY7sVqy
	 rBqgo0v6EpEpc4OWIbEaMUJYeX14YCsHHGtgyqyGRgS+ECgC0rpUfDe/QRYokITQyAA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794589208;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=scUARIYa6JlZqbM9o9X8UDZhtH4UB7ysOYNW/jveLZY=;
	b=j8doenplBl6Sj6u2i3zEAYi0Iw9kJUH1dUDMNtxWEyXeqE0WMBoaiVtn4uzu9BJ3pqX8
	 r2jPCzoBLK8gB3AQV7+j44AtUXclCm58UBHwKsYLiUDRlE3sQcceZGndyaC2wOKH/t3I1
	 roXDunc2jscB5yn1K7XjVbNlU2eejdkBLCUoxwtwc5+m/slh0WpTKT3YdocgUxNYzijAn
	 uNnyYAHCm0VpB7XeE7gsc2xpu6ID5n1UmriO5hxqTddMSu1LOIDCyL9oovb0Kx/x5RzU+
	 p6szvBLeDldAfDgDb+Ge6j6ci5C2YoMrjNhB5hTstUHe1BrtbiAOrYvj/0pvfr32Mog==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ZBf70J36;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7681E606AA34
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 17:00:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7681E606AA34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ZBf70J36
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4b76c15ae36so88965e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:00:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794589207; cv=none;
        d=google.com; s=arc-20260327;
        b=mBMsmHOU76v7vd5kfeCjOxGbR33JiQr4bndwrqdUsped0B+Xood8pFigRtczR/bUI0
         IKYr0z8aBzDlQGzP0+EJU/5WHWItc13KiOQvfRsht2WkHZZ1R3gsa+ctwY2KQvVnz56Q
         zkNOAoLN8MYBN9f3odiWVLYH0uyoXPjD373ik3RNZcKdr8ZozVcjzJXPiahXpBsL4lqy
         bTCVYhOYTT1WVkaxxt/wl9saE2/HXVsx8ZSPNe9YkbCKSb7AyLKi6tOBAK3Arb/sdTCk
         zYh60E4NpDfR3iTV0IXBb97T/MffOjMcStr/+vaLFHKg7pGKzu8AkvKVM7ZwRtEAa1C4
         BZHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=scUARIYa6JlZqbM9o9X8UDZhtH4UB7ysOYNW/jveLZY=;
        fh=YYmIlVqszlKqTX1MJPtVpw0imPlcIZIHtJ7VQ70NQO8=;
        b=pxo4rkrDb7bJxm8nm/wjg6GpUHa+oS69seHtiLDcNsZV3xS/b/j8Z9ucVOmy9y0Ea/
         jDXYVhR3R+AGdCPUp61IzRFBX8STX03pUq0Hl4urDjRYsXsHwjCbq8LO19A4qtc6e5WO
         RCw21po6fmGbOyJL86dpIbx9jFA/XS8s4sz2Zmi1pZ2h50WBk348dks4sifm23fuT/JU
         Ll7OKCVeJyXMqv3pBZny1jV5OK3RIx8h4NJRE/sCj8BIYDtdesBUw83xnjn0Bs9Ky74P
         jP8ILXM+gX+/wc0FCCgFY3ut0gL4bIEUG1QWzGrGjFZ1WWGW/6BY/OYf6irgWwGOm2Qf
         OozA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794589207; x=1795194007; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=scUARIYa6JlZqbM9o9X8UDZhtH4UB7ysOYNW/jveLZY=;
        b=ZBf70J36PbEu4eQ+SNTy5zuGy74PhNTaJdDpje3jNp4bPngtmrGES7egt+vv9prBpg
         4L+4nnjiSSDwLYLRb7VYtr1pG7rqHFuj68TMPdxGvi+d07fbBK72knjwosg+tvLZVmV/
         7yap3Bwfb0oJ9CEU3qPJ9EtDfvRM1Yp3YX8PCWJE5guWzcu5Prz7Ua7WjmgG4Mk/toBa
         OyMSpBPdjlTPUD5hAB+9e4VyPGoJmII+Wms0dgUdh9QMy7xYARZvhjYiSvZCgVPHfDAO
         PnPRn6RoneZ6phOLPC7VAO4v53np23+EF8R1aqe2QwPx+QontsvLjdFsMHt6PuDpRC6G
         2xow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794589207; x=1795194007;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=scUARIYa6JlZqbM9o9X8UDZhtH4UB7ysOYNW/jveLZY=;
        b=qOOd3JjrWpVaPWOLKaJliSfmA2xeWvtiyUahTjV9aYPPn3/SxbtbSMZh0W596Z7GBl
         F5gOsuN1DmYgM0OQMLwwt98qmg1urvPq/beJzr0vIgFNmn91fydaXqF3xh263EZ1Hj7w
         GZswIUlxFN1OY3pckQZ3dXeHF9UNbytg2+C+6XM1g53PzeovNdAIS67OLoII5Q7LzFnF
         gESBMNuE12reCXW1rfgKwOzv99h6MooliJoRr8WYehgLjZKDfOD3t/OU+dXWFRvb72AU
         uZ5XQBiP45j8Y/BWDhXYu2BdpDPk1o1SUE0FaZN9g6fLAe2I9MNjn97TjBr4we97Tqps
         KwOw==
X-Forwarded-Encrypted: i=1; AL+hErECiSrkcw5DYSFv/lHlqbiUYd8Iy9KePgDU31JSsdDbmwV6nJb1beUT8MPCyMbRZDXL/FL/rTfwZsfAqYE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/5L+aqnhgr/J1fK3zNtdLRXDxYP5mRJAqRv4DiblTewJ8r6Ht6
	0HyvSHCJNg61+0sCHI6DZF3MFUtdeRp3zlvY5yA86M7LrxtBbijvpbRX2a4mT9I2ivIv3OVv8dR
	nBMixEJ4t1o0apPyCpGvnyl2LDof8RPvC/F5LRi3h
X-Gm-Gg: AYBFou2TuzyeR3cCkm+iGhiCfjBqyldXDV06dCUClITTiW/9Ih8ETnrfkF9SKQ0XlR+
	khVWkO2G8yrUmy6CemTyWKNURZTz8hm5bQJMdPcKvDu3kP3zCjELf3WJ76LPAyZSQC1ljAYnUhd
	kYbkyV4Pz5RRIq1FDQO4ziexfvcU8MG6Ng8/PUkJ5QTpP2+yV89qi8E5qj27412HU86nxhRGpYW
	1ns/FoXQT4wcHUP88Xel5chv1BflffbWI45ynAn6mS2lURBpGCM1mi+WLsQXjIVFn7IvLe6MnRg
	0cOVJO+aNTA4Txeh/4jfsDXp8CqO5qlV0PD5gTZK+ozBS4TN6jn+3zaw/zH9VNiI/9VpljM2t9E
	eWpeMgBuI0LV4LxeUpnnihr+TAge3qFKBkAJ2IEXrztEouuROSQZZmhcXC5c6Ke6QuWooFDn0C+
	DoLjTdCgkvmspd8JZak5rF57l9
X-Received: by 2002:a05:600c:870c:b0:4a2:ba3:236e with SMTP id
 5b1f17b1804b1-4bb56e56238mr936435e9.14.1794589206285; Fri, 13 Nov 2026
 09:00:06 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113024447.922683-1-k.chen@smail.nju.edu.cn>
 <20261113035640.948458-1-k.chen@smail.nju.edu.cn> <20261113035640.948458-2-k.chen@smail.nju.edu.cn>
In-Reply-To: <20261113035640.948458-2-k.chen@smail.nju.edu.cn>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Fri, 13 Nov 2026 08:59:53 -0800
X-Gm-Features: AclHuK9SEKgiz7MAOQEc_T8XPTeLCyBuqWo3mPZz76potYWEjTPup_06Sl92Rh4
Message-ID: <CABdmKX1AskqjkCcL8Xu7zqgoBCeXjoeRuQggFNxq7ktSo+ij3g@mail.gmail.com>
Subject: Re: [PATCH bpf v3 2/2] selftests/bpf: Test that a drained dmabuf
 iterator keeps returning NULL
To: Kang Chen <k.chen@smail.nju.edu.cn>
Cc: Yonghong Song <yonghong.song@linux.dev>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Sumit Semwal <sumit.semwal@linaro.org>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Philipp Stanner <phasta@kernel.org>, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 7:57=E2=80=AFPM Kang Chen <k.chen@smail.nju.edu.cn>=
 wrote:
>
> The BPF iterator docs in bpf_iterators.rst specify that the next
> function of an open-coded iterator should keep returning NULL after it
> has been returned once.
>
> Add a subtest that checks this for the dmabuf iterator.  It drains an
> iterator, calls bpf_iter_dmabuf_next() once more and checks that the
> result is NULL.  The dma-bufs the test creates keep the list from being
> empty, so an iterator that starts over would return one of them.
>
> The existing open_coded subtest uses bpf_for_each(), which stops at the
> first NULL and never calls next() on a drained iterator.
>
> The selftest was originally posted by T.J. Mercier in the v1 thread:
>
> Link: https://lore.kernel.org/bpf/CABdmKX09vLG4U-7FwF-vm_iTy1AjGUPXka08Kh=
WE+qJ0J=3DXGMA@mail.gmail.com/
>
> Co-developed-by: T.J. Mercier <tjmercier@google.com>
> Signed-off-by: T.J. Mercier <tjmercier@google.com>
> Signed-off-by: Kang Chen <k.chen@smail.nju.edu.cn>

This should be:
From: T.J. Mercier <tjmercier@google.com>

<unmodified original commit message>

Signed-off-by: T.J. Mercier <tjmercier@google.com>
Acked-by: Christian K=C3=B6nig <christian.koenig@amd.com>
Signed-off-by: Kang Chen <k.chen@smail.nju.edu.cn>


For example see:
https://lore.kernel.org/all/20261104-v2_20230123_tjmercier_google_com-v4-1-=
1819a017000b@redhat.com/
and: https://docs.kernel.org/process/submitting-patches.html#from-line


> ---
> v3:
> - Add T.J. Mercier's Co-developed-by and matching Signed-off-by.
> - No code change.
>
>  .../selftests/bpf/prog_tests/dmabuf_iter.c    | 19 +++++++++++++++++++
>  .../testing/selftests/bpf/progs/dmabuf_iter.c | 19 +++++++++++++++++++
>  2 files changed, 38 insertions(+)
>
> diff --git a/tools/testing/selftests/bpf/prog_tests/dmabuf_iter.c b/tools=
/testing/selftests/bpf/prog_tests/dmabuf_iter.c
> index 1a5dc1adae73..c1f81b5dccdc 100644
> --- a/tools/testing/selftests/bpf/prog_tests/dmabuf_iter.c
> +++ b/tools/testing/selftests/bpf/prog_tests/dmabuf_iter.c
> @@ -265,6 +265,23 @@ static void subtest_dmabuf_iter_check_open_coded(str=
uct dmabuf_iter *skel, int m
>         } while (bpf_map_get_next_key(map_fd, key, key));
>  }
>
> +static void subtest_dmabuf_iter_check_next_after_drain(struct dmabuf_ite=
r *skel)
> +{
> +       LIBBPF_OPTS(bpf_test_run_opts, topts);
> +       int err, fd;
> +
> +       fd =3D bpf_program__fd(skel->progs.iter_dmabuf_next_after_drain);
> +
> +       err =3D bpf_prog_test_run_opts(fd, &topts);
> +       if (!ASSERT_OK(err, "test_run_opts err"))
> +               return;
> +       if (!ASSERT_OK(topts.retval, "test_run_opts retval"))
> +               return;
> +
> +       /* The test buffers exist, so a restarted iteration would find on=
e */
> +       ASSERT_EQ(skel->data->next_after_drain, 0, "next_after_drain");
> +}
> +
>  void test_dmabuf_iter(void)
>  {
>         struct dmabuf_iter *skel =3D NULL;
> @@ -315,6 +332,8 @@ void test_dmabuf_iter(void)
>         }
>         if (test__start_subtest("open_coded"))
>                 subtest_dmabuf_iter_check_open_coded(skel, map_fd);
> +       if (test__start_subtest("next_after_drain"))
> +               subtest_dmabuf_iter_check_next_after_drain(skel);
>
>  destroy:
>         destroy_test_buffers();
> diff --git a/tools/testing/selftests/bpf/progs/dmabuf_iter.c b/tools/test=
ing/selftests/bpf/progs/dmabuf_iter.c
> index 9cbb7442646e..d5421b75c39c 100644
> --- a/tools/testing/selftests/bpf/progs/dmabuf_iter.c
> +++ b/tools/testing/selftests/bpf/progs/dmabuf_iter.c
> @@ -99,3 +99,22 @@ int iter_dmabuf_for_each(const void *ctx)
>
>         return 0;
>  }
> +
> +/* Result of a bpf_iter_dmabuf_next() call after the iterator was draine=
d */
> +__u64 next_after_drain =3D -1;
> +
> +SEC("syscall")
> +int iter_dmabuf_next_after_drain(const void *ctx)
> +{
> +       struct bpf_iter_dmabuf it;
> +
> +       bpf_iter_dmabuf_new(&it);
> +       while (bpf_iter_dmabuf_next(&it))
> +               ;
> +
> +       /* Store the raw value; the verifier would remove a branch on it =
*/
> +       next_after_drain =3D (__u64)bpf_iter_dmabuf_next(&it);
> +       bpf_iter_dmabuf_destroy(&it);
> +
> +       return 0;
> +}
> --
> 2.34.1
>
