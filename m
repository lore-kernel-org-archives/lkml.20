Received: from mta1.migadu.com (out-226.mta1.migadu.com [95.215.58.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BFCC2773D
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 01:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790903642; cv=none; b=mwiAomtqjKNjghBZ6AilF3oqInCmWUTBse7k0aMqNPZvjt02vuYwnLAL2bwzm4BVvnYUkSzB49u+ntNh9GU72/e2D56bsgoTY5vjV79DCbkj11Zltl8BqG6IhUBELKgCYRJXV/a7w9uzPN+fWVJKB+3NGzE+2G8wDrruQLIGZgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790903642; c=relaxed/simple;
	bh=NWX2xZSeNthE4d+FVcGdGWkc32k8tGi3zDx/87hg2j4=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UgRW3V34rJei5SjOcwnIucjGK92Xo6YIv+JooX/RdtkZEkGJ4HnsX23jNxpn7C+taajXGb6EQDHbQqau0I00IG+fWvUUr81vAD4mcZYnjlUVjDmeVHfDVpwkCtwXXoSjSc9vcCUuVwXdz4usax92uBbBdr01434YPNlpK9xiH1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=p+a8rVr8; arc=none smtp.client-ip=95.215.58.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="p+a8rVr8"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=NWX2xZSeNthE4d+FVcGdGWkc32k8tGi3zDx/87hg2j4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790903636; v=1; x=1791508436;
 b=p+a8rVr81NcJJcfxxPvcAE5oHHNJXWPDJiJJHG6aDo0cgZ3g/hqhJvST6DeXPDrKKNfK73Nd
 mizzwlztS/s+4+YQw80HMi3LAIX6g88tdJkPAf0aLYTbL2NmTFyZ0WQ/eW5Vkf6EHzbnWjk7w4S
 InxLzehMTgIIP+r16eOg/d3U=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 06414f6154828934;
	Fri, 02 Oct 2026 01:13:56 +0000
X-Mizu-Trace-ID: 06414f6154828934
X-Migadu-Flow: FLOW_OUT
Message-ID: <5382c8744bac2a1d17fd96f76aa6a5245cf8a94e.camel@linux.dev>
Subject: Re: [PATCH bpf 1/1] bpf, riscv: Fix stack arguments of struct_ops
 trampolines
From: KaFai Wan <kafai.wan@linux.dev>
To: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>,  Andrii Nakryiko <andrii@kernel.org>, Eduard
 Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>,
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, Emil
 Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>,
 =?ISO-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,  Pu Lehui
 <pulehui@huawei.com>, Puranjay Mohan <puranjay@kernel.org>, Paul Walmsley
 <pjw@kernel.org>,  Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 bpf@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org
Date: Fri, 02 Oct 2026 09:13:45 +0800
In-Reply-To: <20261001154038.2265210-1-kafai.wan@linux.dev>
References: <20261001154038.2265210-1-kafai.wan@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2026-10-01 at 23:40 +0800, KaFai Wan wrote:

I ran the tests yesterday and didn=E2=80=99t notice that Pu Lehui had alrea=
dy sent the same patch. Please
ignore this. Sorry for the noise.

> When a struct_ops trampoline takes more than 8 arguments (up to 12), the
> 9th and beyond are passed on the stack. store_args() copies them into the
> trampoline frame using a hard-coded FP + 16 base:
>=20
> 	emit_ld(RV_REG_T1, 16 + (i - RV_MAX_REG_ARGS) * 8, RV_REG_FP, ctx);
>=20
> That offset only holds for fentry trampolines, where the traced function'=
s
> T0/FP are saved at FP - 8/FP - 16 and its stack arguments start at FP + 1=
6.
> A struct_ops trampoline is called directly, so its stack arguments start =
at
> FP + 0 and store_args() reads the wrong words. BPF programs then see garb=
age
> for arg9 and beyond, which fails the selftest:
>=20
> =C2=A0 struct_ops_multi_args/test_trampoline_stack_args:FAIL
>=20
> Pass the stack argument base offset to store_args(): 0 for struct_ops
> trampolines, 16 otherwise.
>=20
> Fixes: 6801b0aef79d ("riscv, bpf: Add 12-argument support for RV64 bpf tr=
ampoline")
> Signed-off-by: KaFai Wan <kafai.wan@linux.dev>
> ---
> =C2=A0arch/riscv/net/bpf_jit_comp64.c | 8 ++++----
> =C2=A01 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/arch/riscv/net/bpf_jit_comp64.c b/arch/riscv/net/bpf_jit_com=
p64.c
> index 01fe66774f02..4ae6674f58ed 100644
> --- a/arch/riscv/net/bpf_jit_comp64.c
> +++ b/arch/riscv/net/bpf_jit_comp64.c
> @@ -875,7 +875,7 @@ int bpf_arch_text_poke(void *ip, enum bpf_text_poke_t=
ype old_t,
> =C2=A0	return ret;
> =C2=A0}
> =C2=A0
> -static void store_args(int nr_arg_slots, int args_off, struct rv_jit_con=
text *ctx)
> +static void store_args(int nr_arg_slots, int args_off, int stack_base, s=
truct rv_jit_context
> *ctx)
> =C2=A0{
> =C2=A0	int i;
> =C2=A0
> @@ -883,8 +883,7 @@ static void store_args(int nr_arg_slots, int args_off=
, struct rv_jit_context
> *ct
> =C2=A0		if (i < RV_MAX_REG_ARGS) {
> =C2=A0			emit_sd(RV_REG_FP, -args_off, RV_REG_A0 + i, ctx);
> =C2=A0		} else {
> -			/* skip slots for T0 and FP of traced function */
> -			emit_ld(RV_REG_T1, 16 + (i - RV_MAX_REG_ARGS) * 8, RV_REG_FP, ctx);
> +			emit_ld(RV_REG_T1, stack_base + (i - RV_MAX_REG_ARGS) * 8, RV_REG_FP,
> ctx);
> =C2=A0			emit_sd(RV_REG_FP, -args_off, RV_REG_T1, ctx);
> =C2=A0		}
> =C2=A0		args_off -=3D 8;
> @@ -1179,7 +1178,8 @@ static int __arch_prepare_bpf_trampoline(struct bpf=
_tramp_image *im,
> =C2=A0	func_meta =3D nr_arg_slots;
> =C2=A0	emit_store_stack_imm64(RV_REG_T1, -func_meta_off, func_meta, ctx);
> =C2=A0
> -	store_args(nr_arg_slots, args_off, ctx);
> +	/* skip slots for T0 and FP of traced function */
> +	store_args(nr_arg_slots, args_off, is_struct_ops ? 0 : 16, ctx);
> =C2=A0
> =C2=A0	if (bpf_fsession_cnt(tnodes)) {
> =C2=A0		/* clear all session cookies' value */

--=20
Thanks,
KaFai
