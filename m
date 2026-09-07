Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC5C241379E
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 19:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788809599; cv=pass; b=fE5NtUB/ehfrw+8371QvkEnI4AUVWSKYuea9r5h73RiCqZc9lccPqqBtIvfr8QJbdvtwJ9s7r+wTIV+cTCEWFepu94wLrlqn2IAkCKcPOnbcMz4WjiJ4fwwD68htAwRAGO+HAvqxG7z8wreIZZDtO+KU24ODOohclvNyRVfCTjE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788809599; c=relaxed/simple;
	bh=LbkJYZrKBAOtEAIquwnyRiPsYzlue46mhX6agZEqU8A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BRiRLAUFsrqXaVS61oe4V0G9YvMaKDKLV/IICH8gf9pUuNme4Pp1grE+WyLXsDnrY04VhFNX96ijdbotwytFlEcPgdIjBLMb6NXGV9YHzRFqz+mBGxuaJLBqHQkiBikbwaQZ1Lr9i8vbmTTlK6UdqPzNN++zw/98dQEUOn15Ck8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iK0qYj5j; arc=pass smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iK0qYj5j"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-8523cc41f31so224624b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 12:33:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788809597; cv=none;
        d=google.com; s=arc-20260327;
        b=b7jhHlyV0xAIyMOHUse/6BJcO/RkwKYVEXdGhk+q/DgOCxvsjdLr2295UJ9ZnHOOBL
         DSDWgvj3CcHC2XVCIkqdQqRMqpXokHqFJVs3qKTvK4oIqJjqNhnBc1YczMiMTmh7bdx5
         K9MS6cmBTSQrkNfNtwlGvPHbkVBHCkLyepaMU3doyR6MbPVJNhv58rOKhMg/hFItHVfO
         4XW3eXkp4BMD96dFtsDBbWOAD7PCXMPqQTVrxuj/iRwluiI0DiPf3Htr0o45wr1qRuwj
         1o2LV6bE0RexR2j3m2phpnq5ZfyLLLUipbth2xAwlVs/PC+DHfzWjkxm0y5QLg1f6N9t
         eBdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LbkJYZrKBAOtEAIquwnyRiPsYzlue46mhX6agZEqU8A=;
        fh=tmMweruStAttHM+D9YkIQWsekM0hUGvRF7FxOSe7wWA=;
        b=RUs31J3OyJ2S6jNwEy9pQYRaIlH0/DpNvXF5FCtZ4jYffBEkshdMdzwqV2v5NRBEsA
         4drCgYd/Bbc1YaNyKu8xktxSmLcj32oPB+qLXbhSAB7C2VNKHhhpm1jX1x/09fn+kXVf
         hRQ48i6NCS3QckJFuYI+zAPp8O+xXono89Vx7wOl9DI8kSKeLpvNzT2mJX/VN3n2csy8
         dRK1ywzNYQQZioFHboMlSTXe4xpT0Wa7ViN2sBqw/pVlOfDUQXf+BypWcYLyLOcFKxDZ
         oLKhV+whlW3lMqf+skJ2/Q6e99nl5dfYWqBJQqsawtYuHF+QfhqoSIsc5Huh3Xp3He1C
         nFjg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788809597; x=1789414397; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LbkJYZrKBAOtEAIquwnyRiPsYzlue46mhX6agZEqU8A=;
        b=iK0qYj5js7h9LqZ16ntFi4pR+coNw+J1DIsxddLy2bybdXua8s7AhsQh5PKG4aPy8k
         cWfcsot8Jd3QOFo9QOMLhxclr26W+2bFQXUQb/5htv9RCQ75k/nTYOvsiDpAh9ZC1h0P
         17HYrGhBkPAcaFKfVJDBRota6XZwJTFU94U1d0QKrv1bCLj5OM6vuETU3sDAU1WcF6/P
         XwKGZTES39HLJn7EPOvbTJ556I3rp76dCWF5AVgyuUSKXaJklfe1ypw/YLdAV2Pt4o8p
         oIt3UyGz4+F70fE+3rhKKK66OxHCacES0jUQHDbVEe3CfUFb1qgvkTLFywu8+KyEsrhR
         Wz6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788809597; x=1789414397;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LbkJYZrKBAOtEAIquwnyRiPsYzlue46mhX6agZEqU8A=;
        b=KqlmyDR1/QtpacT+FpRtbzBO2jHvL1nYwd/iOZmxaznkV1VQH6R9dTHL6AKjaqsHOz
         +zgV5mFWeXEtkcHJDiu/gunJWKvJgLaIsphzVz90Y86prUVdjpFaEbKf/Jmyau7qRqnK
         2a0IMb3sRxR39djEpDQfkpkT5aYV9bDPtn8HZNcUjiUYPBsUkqbPOgM/oOoNgQP74dcH
         UUBFd9+GNL9WABy5riPY8NvDQNEyu6TkJv3DxyXI68zA9Gv1I/LDETgjIDqFDvYGyxCB
         59z7N+KcNxcrSXVz3SeJlCLrSNOEzF0P3zKRd5Y3WyVkcCGtITUTwY7Cfq5dCa2DOO/j
         Zzog==
X-Forwarded-Encrypted: i=1; AKwUvBxVIL/JNJybv74dcQd7tSMGpzEML+DnDyOY1uv6hrT+B7I2pmcFiD64fqyppTi7U6Me+RQwVoBemZZv8G8=@vger.kernel.org
X-Gm-Message-State: AFuF++lbFxjnGPwkmIzmBlIkgEMN5Et8pnRcs+c7syxUu10g9Ol07W8M
	NKQIv3oviHv3sBD7cNI7nA+xDSIAD9Aw0fLfpWlJ930RQ2lxXjuXTrF6gLC5verQvm+vX0aMEyC
	QymelfUi6c0PD65uzw6Kqg/+bSKcy7No=
X-Gm-Gg: AYBFou3gKkVCe816u8lBxnW7/fL146JHkNNcWyReo66vy/cH8gA3Pb2ipaCGl+7jVPn
	CWp85smSM4nYvEZaDCdghvzdzkei+nQwjCefyaAQ9Lb1fXWEZ340ZJmI14PbxRZ2LU9IIaqN6ia
	Q4IVudd+CAu1Uo1SZoxsMIcJucULECvXZasJcIT1QPgjFqRFN2pQi+Yd9FbCHwpGdeDhV9pGs2S
	6yrzGhCEKWEXUl11aOBIOps5ev4a85A/zd4Ly0nbPQXDr3fjDahzanBjoAY+sJKlAJpjSqQr/4Y
	z3ukr336OHoGFlMRkl/dZE1k77T7hll6TTNfejqvc7BhD2izDxpJ3+/3TjXKUpU0jJu+NDqnDyM
	x5bmSZaAMh7t51E9SpIxeANLjz+8OGGCQOqsYizHqwGwPkQcHWfUecqN80oaB7A==
X-Received: by 2002:a17:90b:1e04:b0:396:463e:2eeb with SMTP id
 98e67ed59e1d1-39b264b24e2mr23088437a91.0.1788809597288; Mon, 07 Sep 2026
 12:33:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904-b4-arm64-callops-kcfi-v1-0-ce6687739b0c@linux.dev>
 <20260904-b4-arm64-callops-kcfi-v1-8-ce6687739b0c@linux.dev>
 <CANiq72=xOrSXBBdmrKYfX1=qgF37LRAMzMJd4GJkXaYHMVe9yQ@mail.gmail.com> <ap3Z-YDtzmdtMiMk@linux.dev>
In-Reply-To: <ap3Z-YDtzmdtMiMk@linux.dev>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 7 Sep 2026 21:33:03 +0200
X-Gm-Features: AcwNN1UJ5AD1nmjaRgagxZvj3fkfuD3Z7c-j0Zc231NENpcPq2HjO9j40kxIvNk
Message-ID: <CANiq72mVXNmqh-RdOunFLBKRwMgYHFBqJOP7NbXrd8WHPb3sAw@mail.gmail.com>
Subject: Re: [PATCH RFC 8/8] arm64: ftrace: Allow CALL_OPS on kCFI kernels
 built with Rust
To: "Jose Fernandez (Anthropic)" <jose.fernandez@linux.dev>
Cc: Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Puranjay Mohan <puranjay@kernel.org>, 
	Xu Kuohai <xukuohai@huaweicloud.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Sami Tolvanen <samitolvanen@google.com>, Kees Cook <kees@kernel.org>, 
	Leon Hwang <leon.hwang@linux.dev>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, live-patching@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org, 
	linux-efi@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Ben Cressey <ben@cressey.dev>, "Florent Revest (Anthropic)" <florent.revest@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 6, 2026 at 11:24=E2=80=AFPM Jose Fernandez (Anthropic)
<jose.fernandez@linux.dev> wrote:
>
> # Do not pass -fpatchable-function-entry to bindgen: its libclang may not
> # support the section argument (Clang >=3D 21), and parsing does not need=
 it.

Thanks! Hmm... Not sure if "parsing" is the right word, i.e. a flag
change could still make `bindgen` parse and generate code fine but not
match the ABI of the C compiler.

i.e. I guess I would have expected something like "...: its libclang
may not support the section argument (Clang >=3D 21) and the removal of
the flag does not change the ABI" or similar.

Cheers,
Miguel
