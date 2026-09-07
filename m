Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F8B03BED30
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 23:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788823401; cv=pass; b=Berd8xy6wAD3FfEvhe+DjI6Pc0RnzUsU3lOKHaxWuH+n3MiamMl/LmFAV43nX5xJuRiQ9YRggvlx277JBY88+wgzAjo/zcnY+XN2KHRsMEDmm8TBCPzOEaKOj0ekRiFXwojKAD16X3tWtmRDUXQLGZOtxPAenXJ4alIOs1+QLzs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788823401; c=relaxed/simple;
	bh=jfAp60OBp4doOiN+x+Yf0On7RHIw5hZfHkDWrPwTz6U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X9EHj2ltCwKxx4J3wN/PaG69sQxO7aRTJXhSu4E7XlUw2bHwPmCUxxFn2QRHmz5uXUaBCpvOAuVRWlpaPufVnZsfJPYHuLrXKsQNufwDYrlMaABD5AI3fj0a2Myiaf7LBsCGtEERz8Fh/+PJt7UmY+oYRS4ScO4rCwrxmgdRa10=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HpzOhlsq; arc=pass smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HpzOhlsq"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2d6e954afbdso25210135ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 16:23:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788823400; cv=none;
        d=google.com; s=arc-20260327;
        b=iHqzsm0Z1WzOv2D0mTE3kDG3FFYgc0ksiQ6mr9MYOEjfX7MaNneItoGNE7QUVb8cmq
         4J3LHdw9izagy3wGXoKijon93RR+GNg7KCnT5tIjjVaj1u9nQ3GDXlQvwPcOKnNViXZf
         6z7DkVWdKGwGwjzolBr4r+A5A/PA9Nq1kRH0K0QNWSkCdy2hxrPdFkrS5164Rov2Ifr5
         7RmsosAMlI3Jnz1EcxCkJ9stX30ZIoirSGety4KOEFLvqmZl5k41+MqE4cKw4zUoVu44
         b+cyWxENfPCWczy/YKjzgcVGxsG5AjGKdhah64JImMp9hKMcxvDLdaWfB2c1WJwhKkP8
         E3yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0IgSRwxcuB6vnZUxcMMegnldun7vRf9Aq4Po2V8pKwA=;
        fh=6bBQChxgkKatcaiFzzf456RKzaqFUspDBiZDYpBMzO0=;
        b=d80ibmqPTL9BN9GvIbMy7sTgbqPZwixjYen3tNttzJcmC38CA+TXSNJilVuVshm2m7
         kzkCkA10PS4cm9LYMjLTpg0wbsPn5qsU7NU6YwXkMTl3FDAyUwDsizsnjU2QOjzMFiUj
         WcROp+mi4zZY4iJ0r++sGefyLPE3LVczmKzbyGYltgbAaEB8KhLzL/i0dfRJgt/kW78e
         5DHhVq4PtXTx4PQG2Nn4eoudPqXiCnm9XAVny6tj3dPH3W3OwZ6nsO7JKjZdxMsGjaB6
         6/en/9oeG/qYoUh519a0CZlcSEVx8a4Ukug9v9ahrImbrRqb8Ene7L3lpdf4uCRspiDC
         N/jg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788823400; x=1789428200; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0IgSRwxcuB6vnZUxcMMegnldun7vRf9Aq4Po2V8pKwA=;
        b=HpzOhlsqs1wTA1S2qEtpNxFT1eY274fqC9BMPpUDx7bLrVEmt9ohAcHvk8GzPshCwF
         0FZ4a2Fu5wZ9jdxdoX6XCAMO/ZGDKwHAWmd9hQCF6knaaR5gPMgHzZzD5jeMFGWHsDeZ
         wxZo1TolvpdeZZXz+SSaHfWdqhzrXkW8JxDgeF6oy45jtfELHkLKYenRq46VlNd5sw4l
         Tk7P9wFAQYfexwEhMQXAhFSAuWpMDlrcEid9kRzOkYHbD5ALyZj0d6ICGSHLXdM401qL
         /i9diuZHsYJu8lnsAbDbDgcA3xUc4k6Vxv5o90HrsCwQlBhQ0761KsOO+fYpPPUuAJnd
         GS7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788823400; x=1789428200;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0IgSRwxcuB6vnZUxcMMegnldun7vRf9Aq4Po2V8pKwA=;
        b=SLFAjBIfkq+5mSjjMjWjfy64aF6ViC4jOMR6W7jsbGRlBf4pEyhhgxiEIaPWfi6WbR
         YbwO0En2sJndZoInsXL0inWW0XmknfvI8xWTNXp9J25Kbp1q4DqLkNrdGAiLxXo5UoTW
         IWA6VTdGMUGA+VBbSFDxdG0NHKjkSRJ1ONiGMo4JHotQuHWvGittzCbhtK0XhEDc2cv4
         BI9MlcP8MxbuDwdjwfTN9mg0W1OqRHtqv2OWhPWcYqHqEKvBAkacTsGDKxhFlj+kZgkI
         g/uDUrM+aZJsyX466lwjryRKSb6nsz+gYTv1GWQqdCuC3a+fhf0yx4kcb6d8J4QGOytq
         wiTg==
X-Forwarded-Encrypted: i=1; AKwUvBw4W0i8cJ8aSL4D+aYWRT6JyLb8gW0WbIX0rIIVZ2+C9rZ3PsxtvPMesaPeAtKniKroxx/UIsKIXDftiv4=@vger.kernel.org
X-Gm-Message-State: AFuF++lEQt80dmiLt6iVVzJroyJUdhCO4hZ9l84izapsiOvxwA00MFXt
	+QlSTujrv1HLNZN7lMA3vgvk1zIQ+cthWxxgxhT61IsYsSU5NSUrFf0ZVk5xkcb1L0SShORKT8d
	IUbbre4V5RWVwkuC/2mLnFfn6n/Oj/3FleWt2WgJm
X-Gm-Gg: AYBFou3lIOsvweF+G0L0lrnJLyDdGyQYzFdtnekg1MeFcOJvZExhCfxb6xaZIjE4lXd
	VxWmVwvH15Uo0BZIXMtt3AFMWfauk10R33orKR9OhvKLe/aujCVvG2hDAi/YitiXi98w/XdFYW2
	mxjhnxdZHkA2uyC//Bthe1UxoI/gKcnV6eFwar2Rfjv9XUnhuovilsTpRQUVZI1ri4AKyULErvV
	L0kz70lUr2k1EM0sB4E6ryIH2S8OSN4bmKqXhG3Y9PkSbiQ4jH/OTvfejiMKFwlIbPH4PvlssH/
	XrBMXVuMC2JJkaX8A/kPieQmu5XrLciOdYDXZ1um50DU0CwhRIZM5zPk6qvLec0dpGfRHzH5usn
	xYTuVNBucTWlDv1tzl9M5h8nBI/RCKuYYEIwrLJOYdAiELdJAnsOX7AHg
X-Received: by 2002:a17:90a:d2c7:b0:398:9bd1:3216 with SMTP id
 98e67ed59e1d1-39b262e4e02mr36924728a91.23.1788823399150; Mon, 07 Sep 2026
 16:23:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260906074135.185212-1-jiayuan.chen@linux.dev> <20260906074135.185212-2-jiayuan.chen@linux.dev>
In-Reply-To: <20260906074135.185212-2-jiayuan.chen@linux.dev>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Mon, 7 Sep 2026 16:23:06 -0700
X-Gm-Features: AcwNN1Xz9UhdXiFIx-Dg3fA6cQJzjy8WgHXHsftsUBO_tigszkI2pXJJ9JByUSk
Message-ID: <CAAVpQUCzacvL7n0DejvtYQB2ZnHiUM_sg4-d==iviyvVKv=_xg@mail.gmail.com>
Subject: Re: [PATCH bpf v2 1/3] bpf: Fix out-of-bounds read of sk_protocol in bpf_sock_destroy()
To: Jiayuan Chen <jiayuan.chen@linux.dev>
Cc: bpf@vger.kernel.org, Xiang Mei <xmei5@asu.edu>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	John Fastabend <john.fastabend@gmail.com>, Stanislav Fomichev <sdf@fomichev.me>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Neal Cardwell <ncardwell@google.com>, Shuah Khan <shuah@kernel.org>, 
	Aditi Ghag <aditi.ghag@isovalent.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 6, 2026 at 12:42=E2=80=AFAM Jiayuan Chen <jiayuan.chen@linux.de=
v> wrote:
>
> sk_protocol lives in struct sock, not in struct sock_common. A timewait
> or request sock handed to bpf_sock_destroy() by the tcp iterator is
> neither, so reading sk->sk_protocol runs past the object:
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> BUG: KASAN: slab-out-of-bounds in bpf_sock_destroy+0xc7/0xe0
> Read of size 2 at addr ffff8881047d11b4 by task test_progs/428
>
> Tainted: [W]=3DWARN
> Call Trace:
>  <TASK>
>  dump_stack_lvl+0x91/0xf0
>  print_report+0xd1/0x630
>  kasan_report+0xf3/0x130
>  __asan_report_load2_noabort+0x14/0x30
>  bpf_sock_destroy+0xc7/0xe0
>  bpf_prog_c3dd61f9d9cd9f37_iter_tcp6_timewait+0x9f/0xb7
>  bpf_iter_run_prog+0x538/0xde0
>  bpf_iter_tcp_seq_show+0x26b/0x4b0
>  bpf_seq_read+0x424/0x1210
>  vfs_read+0x197/0xe40
>  ksys_read+0x119/0x240
>  __x64_sys_read+0x72/0xc0
>  x64_sys_call+0x647/0x27e0
>  do_syscall_64+0xe5/0x610
>  entry_SYSCALL_64_after_hwframe+0x76/0x7e
>
> Only check sk_protocol on full socks. tcp_abort() already knows how to
> deal with TIME_WAIT and NEW_SYN_RECV socks. Also fix the comment, it
> never matched the code.
>
> Fixes: 4ddbcb886268 ("bpf: Add bpf_sock_destroy kfunc")
> Reported-by: Xiang Mei (Microsoft) <xmei5@asu.edu>
> Closes: https://lore.kernel.org/bpf/20260702224519.800135-1-xmei5@asu.edu=
/
> Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
