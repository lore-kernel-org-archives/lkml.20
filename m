Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 682F6375F81
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 21:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789076988; cv=none; b=dKylzFbSKhSurBBZI3Wh54oHAN5w7xNFr6CWVnN56tDi4nmgB1yJaWQLn4V7/n+1qNS3zXuI0p7qNZngMSFeGHQe/Av0pwty+9luv/VnNornnvaCUuPE2arU0lxB3qiUeIs8TfSd7qRsMF2Sxe622lOn1ZW6gk3IcULsk/RDmb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789076988; c=relaxed/simple;
	bh=VcCpfU+gr5mgq5UoFOwg28wtM6kRA+JD9Sc904H5qVA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=M8F4ZqH2hk8YJ8rBzy2N0piq2MtnQvqw8CMyTJ8iCuOe9brwJKBfnZ6k/5E5M2vqJa1fxh+gDAgGMnkscCqSyBPo2Gn7hlSDLGmF7QOrgE4DlaTGYKsfyJYJkaL4CloaDRaVqnff9zbxgOEFfDckL14UOV5LoZ/cbHd+/A1CvLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZgcgVPXq; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZgcgVPXq"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-398c1101c1bso245925a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 14:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789076985; x=1789681785; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=cTbSlvf8fbaSW1pTt9kouKoPX2DRhtNPjD5pkOj6vjg=;
        b=ZgcgVPXqx32BW21bfu2C+ylVamslb0ft/n4XG7az3SIHeTdsBn+J5+bsACRi5hQVd3
         pnvb8qUHfYX+nvi6Wlyop/pWmemXsPp9L9e97Il6FxGasYqaCh9dtsaDetQKHDyPh3J1
         hORBJUN8FqxfqZngZQd8vw8uXHbhLrL8+EVYT8i3C/gjomYxYF3gKZqfJYHjXjbBJ/PH
         5Iz2H/xr3fo3HzPOU0mXyWYTe4sqSzlnPzfa5dP1WejuGZTZWj2F468eVVe8KUGiFVZU
         ZyUn8Ia+F08hUQpEhjDlYaM5GIGAj40r38bSnRTS3m4nxG97E8tjESb9V2zkr+cQd8KS
         IZcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789076985; x=1789681785;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cTbSlvf8fbaSW1pTt9kouKoPX2DRhtNPjD5pkOj6vjg=;
        b=HekvhtkCXUqNBCvGs/rmbl5rVWe4RA5qDEqEj6Izs3HzPQBeQ0Qi57gizjtAEbrsR4
         M+U1Z0JmmCz/XFF2b6Vat4gst07HdaLS/4CLu3cPIaWNpD3DcsnQYCKluQMTcN31FFx2
         WY1PcBOQ79jXmw5p/6/0Dt/UdweZ7N3UIR5YmxwyPQr9xwyI/pGoDeNrdZe1LvCdsRGj
         pJXYc9h88lHotnK2wzb1dsqMlQx7Tm1FEM4CEC43Vhcvo2sla8B2Afa6ERlVapUOeG8q
         CDyzHAFbX469PiYd+O08CAVhttKt/hUBh+EqnX0kOp4cjLMxygUm4w8sY/o6UKLJdgAh
         lIaA==
X-Forwarded-Encrypted: i=1; AKwUvBzOvgKczvxUc6mj1jUPv/g5e1Z+mbZbgppsgfwhBtRBUBAU73TlET6TEUWgQH+8uVXLNdOKDlQkNPmoa/c=@vger.kernel.org
X-Gm-Message-State: AFuF++k/OogtQNZwRvFXTWqSretNOF019D6nN5nw9Jmi3HIs+Zp6FTTA
	ruo50JkVL6j8q08u+jnh0ICt4X0mqrza29G1chTMrhufG81jEazyXvEU
X-Gm-Gg: AYBFou3FTlZvBe2ToQ096iwEUBg7NkGukoyw7V9VXzyErnd6+e9PIWfQu1qRDIgmpoj
	K1LhnHQvUmt5ZBIP0Wuu+chj47GrN+0bXX0KN7tyW+XQv3UF0Sk13y4avszP2v14qJSSFryDZ+Q
	9s2eQNLrYBtLoMoW/Yb9X2C0E3KJ3CKPGquEoo10ms2uhE3ekwYUFeWv7F6bPnkiDMAKzEdx/pH
	KJRpLCIwmHFGDKqaDeCWJCihWKHu6nAINXCMTIiqOL9dbNjhSYusvGm/qK0iNycmIEyqfWRX6tW
	tE3ynao1V9zTKHCorf7gJZkgggKTR4VN/dWNo7k0O+cG+LSYeRCvksTFWk/wm6xBGTMbg7Vl5sP
	XdoE3tjev2N6rVqJZ4pqave0el66YxScW/cgo/pUPYyNhQ+ewdtfMSyl+mX3qHNLDNgiHKrmQFz
	OH13h1wDb2rn/QjR+ah1Jbxq0PAHLgYl8tFwT4+oLQVw9cucF7nNhbhU30t8LkX/+ZWa23Jp3fd
	euUh2RONkGrJJm654RCgP4nE3LYnLo9RrQXKIWDotlB6vFngWcI8Bp6Rw==
X-Received: by 2002:a17:90b:5790:b0:396:4c63:7193 with SMTP id 98e67ed59e1d1-39d9bda7ba2mr1320522a91.11.1789076985602;
        Thu, 10 Sep 2026 14:49:45 -0700 (PDT)
Received: from ?IPv6:2a03:83e0:115c:1:a3ce:533a:7492:3ff3? ([2620:10d:c090:500::4:d279])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d9d8cd962sm102522a91.2.2026.09.10.14.49.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 14:49:45 -0700 (PDT)
Message-ID: <87c1060d5233c9b7a73fcaf1b6d96bc1a700c49e.camel@gmail.com>
Subject: Re: [PATCH bpf 1/2] bpf: Fix divide-by-zero in btf_struct_walk()
From: Eduard Zingerman <eddyz87@gmail.com>
To: Jiayuan Chen <jiayuan.chen@linux.dev>, bpf@vger.kernel.org
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>,  Andrii Nakryiko <andrii@kernel.org>, Kumar
 Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau	
 <martin.lau@linux.dev>, Song Liu <song@kernel.org>, Yonghong Song	
 <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, Emil Tsalapatis	
 <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, Shuah Khan
	 <shuah@kernel.org>, Amery Hung <ameryhung@gmail.com>, Tejun Heo
 <tj@kernel.org>,  Matt Bobrowski <mattbobrowski@google.com>,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Date: Thu, 10 Sep 2026 14:49:42 -0700
In-Reply-To: <20260910122316.186384-1-jiayuan.chen@linux.dev>
References: <20260910122316.186384-1-jiayuan.chen@linux.dev>
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
> When an access goes past the struct and the last member is a flexible
> array, btf_struct_walk() folds the offset back into a single element with
> (off - moff) % t->size, but never checks that the element type has a size=
.
>=20
> BTF takes an empty struct, so this in program BTF
>=20
> 	/* event could be empty */
> 	struct event {
>  #ifdef HAVE_TIMESTAMP
> 		__u64 ts;
>  #endif
> 	};
>=20
> 	struct batch {
> 		int nr;
> 		struct event events[];
> 	};
>=20
> divides by zero at prog load time. Getting there needs a PTR_TO_BTF_ID th=
at
> is not MEM_ALLOC, e.g. a plain read of a local kptr stashed in a map from=
 a
> sleepable program.
>=20
> Oops: divide error: 0000 [#1] SMP KASAN PTI
> RIP: 0010:btf_struct_walk+0x53f/0x1570
> Call Trace:
>  <TASK>
>  btf_struct_access+0x42a/0xcd0
>  check_ptr_to_btf_access+0x4dc/0x1160
>  check_mem_access+0x3a45/0x8740
>  check_load_mem+0x36a/0xd10
>  do_check_common+0x3ef0/0xb210
>  bpf_check+0x6d3b/0x8580
>  bpf_prog_load+0xf7c/0x2720
>  __sys_bpf+0xa83/0x3690
>  __x64_sys_bpf+0xc7/0x150
>  x64_sys_call+0x1f3f/0x27e0
>  do_syscall_64+0xe5/0x610
>  entry_SYSCALL_64_after_hwframe+0x76/0x7e
>  </TASK>
>=20
> Reject a zero-sized element type. The fixed array path in the same functi=
on
> already bails out on the same thing:
>=20
> 	btf_struct_walk()
> 	...
> 		/* skip empty array */
> 		if (moff =3D=3D mtrue_end)
> 			continue;
>=20
> 		msize /=3D total_nelems;
>=20
> Fixes: 9c5f8a1008a1 ("bpf: Support variable length array in tracing progr=
ams")
> Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>
> ---

Acked-by: Eduard Zingerman <eddyz87@gmail.com>
