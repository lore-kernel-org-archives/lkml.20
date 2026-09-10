Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1775738E10C
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 22:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789077688; cv=none; b=djVARdGl1qbj7vGC3st0PKkUhGKr0KZHd2xzYKEJC1AaqSNb7M2bSLGrhM3uDXCJNglhI5Aw5hGS8uKxdVvNdy0sBILKT/eRZFxpDdCmVUP1GNXevLB8tZNzZRSQWRPSIILD9bt8tefWZ8dtzzUoGdc1G5C9B9bImS0M2f/5cIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789077688; c=relaxed/simple;
	bh=zrz0/ucW3PLwAuhZwtHcOR4kEpmta/vNkqlrXBuJJh0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SlNs0k/K9Yw3TlYZMJgmHA5/CSdH8RN0R7YqC6seIXkksGTwDt94ISedBaDZZxuivACMbUHKC6q9uo7Zg3oOtAmpAoJRafVtnRl0PDtkmy10iMjKozssbdYlgQ2jOONfdFCvYCc2kQW0xFVSTkWntyCGkB49EVNNhxBh8orViOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W8dw0GkN; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W8dw0GkN"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccafb74fso214842a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 15:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789077686; x=1789682486; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=W79TF8hp+v+CXkvDz/YZI2YgtWq3JSgPrSm3GoIwkgc=;
        b=W8dw0GkNhiuBnE+m0IAhwq1wZfXXwPBFDPUlHfOJTgq2hByF1rnV8zrr0WHFhqcamF
         1ECrf2rS2hVugOFQgUKtW8GYIOnNV8WN16tcwIM2NBYtklvdPcRaZy0uazCS9WdI20b3
         rCuz5cn3QMrKW+OeaY3G9Hy0lqJyBA0U5c8DTNvd3NqOwnKPterZxTdblI2ZGgqPkXis
         z5rdl2bReRNzr2OxQq0u4j5Amdr/Pez2H2jmKoS6i5mKEZa++mNk6gF8vEOhwwR3eO1W
         aBIporai/56GhO9QaMThkaQLahQXizTpUmx5hu/t2D8khkOXrtjdzAn9avMIeZ9Bf63S
         bCnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789077686; x=1789682486;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W79TF8hp+v+CXkvDz/YZI2YgtWq3JSgPrSm3GoIwkgc=;
        b=lQLYZaK7kE2sU+ezzTTfSxYdDSxN3S2HSWOdDu2ODtpOaKPGT1cznPNfCmi2Z1PZwN
         Jqepx3/f5cIA3drKYJPTMxxaW/zRKs1dppcfH88geoGFN/32krldOb8NDWf6AI5KQGnP
         mhEonWGRw9FIQbXMtIWkb4hLhrQvRUlc80o/t1J5d2CnvLT5J3N6f8gCDil5olSHWa4K
         bo8IorfmiKsEQFvyhkn3PexhlUwdVXuvRlygvZfq5g+OdM1EX00TUntKkYIRnzzz0cnF
         avE5SkhbOEgDRTKN7JRhu7Yiq2GLj4Z2uAqZaL3Qt8OyNNkBuCHcBDfm2JQpLJT4DUa7
         63uA==
X-Forwarded-Encrypted: i=1; AKwUvBzUKL71xQzFU3E2PXlTg2ViGWClMFU89DRFWawtET7ASGFOIg5Xd4reTB4MsCz/KI77iXExWnIwUht74ds=@vger.kernel.org
X-Gm-Message-State: AFuF++lCGN2azvhrFXhf8/1mGSTQ+dzqdyfwlmLCHKl6+XGiSmpMriTN
	DR7TQASWirnjzskw+Rr2e1vd1wXszbYJ66opIpHsUbKg7IIPufXmgmfk
X-Gm-Gg: AYBFou2lgWqz7wzutZSn2K41jsUV7RcrSDxjhF5fiIWIANRK8HRcHK71+O7Zd/vXhGX
	pVDqSo5snOTNx2pdCjRXOw4UDF8gWTL6jU1EbPvJj1XUe2E7M09JCLXDj58JAPYdWMdDUiYU6//
	L2qj+MKHoYOxr6TEMfJZk495Ud3ZEnJO6YyNZnDS/DASbl1SrmArKI9dAxPPRWqnWn25y+wcQtM
	+yr1MnHu1VcYHbMeYvmhl3IEh0n2v+gi3tdlkPEagPQ9W0YA5yOcvKtm0zCI47m2NP1wiygpiJZ
	0H0S0SSqpdEGyF3oGalWUJbWY/fity+pPjC5cvLJOOpIv9Hj23dK0gOTDqmWIbO5kBIsciFFOOE
	40J/wvZAz8Z9r8Rga4Z9tYqr0o1fbPhDuz2dfnwh1ASpnsqrRmf9H97HyaY8vuIsq/MSE66SKeO
	BGqSm0hkai15abb7zptptp8J+KS3nN/TMbcFZh1l4oqSfJ5/3T3IDTq4zZ/m2RVsrvzu9IRzOB/
	VQBd+NfEBH1s2YeL98JjTaNvngFi/7qi5CFY33WHf3LjSgTU6sCLNe7jA==
X-Received: by 2002:a17:90b:560e:b0:398:a2ed:7b5c with SMTP id 98e67ed59e1d1-39d9c3a1fc2mr1365490a91.24.1789077681667;
        Thu, 10 Sep 2026 15:01:21 -0700 (PDT)
Received: from ?IPv6:2a03:83e0:115c:1:a3ce:533a:7492:3ff3? ([2620:10d:c090:500::4:d279])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b97994sm2152282c88.12.2026.09.10.15.01.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 15:01:21 -0700 (PDT)
Message-ID: <9b3ca4f410cf1f2af0464df282fe017ae801bbd4.camel@gmail.com>
Subject: Re: [PATCH bpf 2/2] selftests/bpf: Test BTF walk into a flexible
 array of zero-sized elements
From: Eduard Zingerman <eddyz87@gmail.com>
To: Jiayuan Chen <jiayuan.chen@linux.dev>, bpf@vger.kernel.org
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>,  Andrii Nakryiko <andrii@kernel.org>, Kumar
 Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau	
 <martin.lau@linux.dev>, Song Liu <song@kernel.org>, Yonghong Song	
 <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, Emil Tsalapatis	
 <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, Shuah Khan
	 <shuah@kernel.org>, Yazhou Tang <tangyazhou518@outlook.com>, Amery Hung	
 <ameryhung@gmail.com>, Matt Bobrowski <mattbobrowski@google.com>, Tejun Heo
	 <tj@kernel.org>, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
Date: Thu, 10 Sep 2026 15:01:18 -0700
In-Reply-To: <20260910122316.186384-2-jiayuan.chen@linux.dev>
References: <20260910122316.186384-1-jiayuan.chen@linux.dev>
	 <20260910122316.186384-2-jiayuan.chen@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2026-09-10 at 20:22 +0800, Jiayuan Chen wrote:
> The program stashes a bpf_obj_new() object whose type ends with a flexibl=
e
> array of empty structs, then reads it back as an untrusted kptr. Without
> the previous patch this divides by zero in btf_struct_walk() instead of
> being rejected.
>=20
>   # ./test_progs -t verifier_btf_flex_array
>   ...
>   #602     verifier_btf_flex_array:OK
>   Summary: 1/1 PASSED, 0 SKIPPED, 0/0 FAILED
>=20
> Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>
> ---

Please simplify test case as follows:

SEC("syscall")
__failure __msg("access beyond struct test_flex_batch at off 4 size 1")
int stash_and_peek(void *ctx)
{
        struct map_value *v;
        int key =3D 0;

        v =3D bpf_map_lookup_elem(&batches, &key);
        if (!v || !v->batch)
                return 0;

        return *(char *)&v->batch->events[0];
}

Also, aren't there already test cases for flex arrays somewhere?
Probably no need to add a new file.

...
