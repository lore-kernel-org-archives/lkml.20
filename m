Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 265A348EC9A
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 14:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790000710; cv=none; b=c5eGh/SAbtID46JekWXD6TuXtvdHk4Mr0wzxKZN4iUYx2ntOTFdfXGmD69D9bEK1aL7d6QQgN+IxD83QCq8ZT5oDA+ElulgRPiB+kR5GUx9RXBYBJdcVVe/G/VR9ZuTa+XDvpD0cSZVXVMJrDOcT01gUTUuaqujRD1L0kv/kHWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790000710; c=relaxed/simple;
	bh=s3SG6zYetHP+gsiYG6Z8nnzdp21ZZzns/HVc+qfBNpY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EeKzMTwd0JIIhTBVuQwInqWz0NojRUt/9KkqaUun4tOZr9MxtgtISpIcWBcS8U26zARVklBt/5CRa9i5ND/F+yu0OOfFtiU6/doLGbgrJ771+AEYPul09MujCgrh5uAHUm7h7mW60SSPwkzwXFvONHxn9sryXs9IfneizdfOrgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=WtQzhDEz; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="WtQzhDEz"
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id E4E073F4CA
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 14:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1790000697;
	bh=QLEno9IoSGABXfyc+gs3/INLUq4rl6TSX3NFv/q902U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=WtQzhDEzVu2FovJXbQhyfFKLINeEHspRF4mMFEcbmSJZtx9QvIRbmMivzn/0ljUI5
	 0M2SSPSUuir/N277ahAg+tKISvqkzsOiF6DsfWbHM7AOuIlsmj0w9J4m5xVGZvYvLr
	 WjDDYUrEb36ExjcDM2+g2idh6vX+j8wVS/9Wh6VDLq3o3pYNXrivGYJXWIEa/R4me9
	 wOC/JZZLw08UqvPvxmLhvSLpgXArxUreEzixDqafwXnClXe8dR4Yit9IlLcYZOzpnb
	 XiTKg50htxuKQPfr9hXNg7Ba5AyEYLwnSnSkSM3CWHv9MPsoKnQYDVcP1UZ5RXcKH4
	 BS0zEJuDu9fsYZL3ZGnmwuLpwuTTcAGjdiQsVYVjuh4uVFkAwdpgXQqfYExz4e06IS
	 oh8ziKHDk31sFAfA9esH8/Qwrn2/J9rb5Rc6QMqMpNBraBNnapO3Tc6QdbckC5RM1z
	 WnH1CQsxot6d6Ck9L/2ynGu1l9Ro+H6WCEejTaQ6JRy51W6P9fsPkoV+gQ8pYCe6fS
	 fKOWzr0bWBEMnxQfsn2oqG58aKCalPs/+uSl93eqk/aLOdez36gbTQhCEIwLlc7TJv
	 c6uMi2wqFA+CAT+/s1rTcL98Lfmr/HZ45LsgQwSUzGAH1m2P1Y809z0s2A4mCnvmw2
	 lb08vG9qvCoOMPDVDYI+SBT4=
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-49b0e6638e3so25719465e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 07:24:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790000697; x=1790605497;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QLEno9IoSGABXfyc+gs3/INLUq4rl6TSX3NFv/q902U=;
        b=hj4AUg5FnA8HisOc89O8B3mGce1zQw4rVHjRmSQxd6V6SOVwlwy+LAqCC7hO/hVbLO
         lvRCMyQ3JFjUxIVdR9JcT8QG5mw0K6ZtNf3cWAd7u1XyNZPEMiUYNFaBV9zKc3XcgvUe
         MgLT+o2vREPsl3N5MSKtopJoEaJDiMxy5zbyCNaTmt9QXxfNuVeEP/emR0VgGldNxF8T
         63GsEgzugGoznThuVoy5giS5jP+b9uESPVyIvdpzInhV0lhndf1R8fPuddaF1Mhv7DQd
         bOvIjDbJNkSwbVrOIdBwy1o6Th7JyTH0h53EWWdMKsR2NgxVn+Cged2CsMufDSRipIoj
         xp4g==
X-Forwarded-Encrypted: i=1; AKwUvBxVi6LFF3A1tXP6g9JISS479uWyaPAcsjddYN/kFEl5WFp3hv6Yl8gsuJSoz9H3xUyv3SXYVmJd0vovRJ4=@vger.kernel.org
X-Gm-Message-State: AFuF++mwmM+6F8qMb3mioFlRmiRGrAXYqDNsap8VBWdu88J595G+F+Vk
	CAKEQ/xO/MT/SZzOu6k8zorGGTOYTAVSZN4q+Q6c3MQc8rv4rcoohgDAHhgIHWq6uqg4mbBZgcK
	Io0+jB9ELop7XxU4T26F0g5IIhUxXQhC8hI/bfxOAQyV4bljjhHNXHy46nez+/DCG+jL+vHHm5M
	frgh2Eeg==
X-Gm-Gg: AYBFou2jOnwqUmbcBjq3SpTZK+SPzvbJS53GI8UKs+6myTUCdItDq1dMLkUSODxDUUM
	dyVfNLKxbWnz4EZiakxOv6oy4hDRzZwRvpUdKo+GoRDtIHFgaInOkmln887Pw2G/ufpbjb4FV14
	hMxXYeTtOZZBdyF8GZLubWOOGZRstD+OgdClJoQm+mL6PoLtanSbWjM8kxI57xzyVVcX/WDvJ/3
	BdFEZJ3Wiiwdqgixr3Px8DHYJg6e3X6a7M/6/tUu8prLuDR4KS7vviwB4SWNMTMFQ5LaMQtNhWB
	ZzlgSz40WNgqQBLyVhYTHX7JCC40YTTSUdOqOXe5VJFyI2YRlNPl/XJLFsZy1IOafwTUGTqkkbC
	s/DVBvlGhszTLgSq2yycjH77aPg7qMNlrlD8IcU+fDzLi5ntwhWA6cDfcCmSt0JiE1xMPJrkJXu
	iCseguQ2v8TLCQ17e0jJM7r80=
X-Received: by 2002:a05:600c:4f09:b0:49e:8418:3858 with SMTP id 5b1f17b1804b1-49fc56b84c3mr149186375e9.9.1790000697376;
        Mon, 21 Sep 2026 07:24:57 -0700 (PDT)
X-Received: by 2002:a05:600c:4f09:b0:49e:8418:3858 with SMTP id 5b1f17b1804b1-49fc56b84c3mr149185895e9.9.1790000696811;
        Mon, 21 Sep 2026 07:24:56 -0700 (PDT)
Received: from ?IPV6:2a02:908:1242:30e0:aec3:c221:8373:654c? ([2a02:908:1242:30e0:aec3:c221:8373:654c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc585920fsm622434405e9.4.2026.09.21.07.24.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 07:24:56 -0700 (PDT)
Message-ID: <9d058591-466e-4c06-a820-b8ecc7d319a6@canonical.com>
Date: Mon, 21 Sep 2026 16:24:53 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 01/11] riscv: Add B to hwcap and hwprobe
To: Guodong Xu <guodong.xu@oss.qualcomm.com>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
 Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org,
 spacemit@lists.linux.dev, sophgo@lists.linux.dev,
 linux-kselftest@vger.kernel.org, Andy Chiu <tchiu@tenstorrent.com>,
 Florian Weimer <fweimer@redhat.com>,
 Peter Bergner <bergner@oss.tenstorrent.com>,
 Zihong Yao <zihong.plct@isrc.iscas.ac.cn>, Mark Harris <mark.hsj@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Andrew Jones <andrew.jones@oss.qualcomm.com>,
 Conor Dooley <conor.dooley@microchip.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
 Chen Wang <chen.wang@linux.dev>, Inochi Amaoto <inochiama@gmail.com>,
 Randy Dunlap <rdunlap@infradead.org>
References: <20260920-rva23u64-hwprobe-v2-v8-0-5f14bc5c23d3@oss.qualcomm.com>
 <20260920-rva23u64-hwprobe-v2-v8-1-5f14bc5c23d3@oss.qualcomm.com>
Content-Language: en-US
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <20260920-rva23u64-hwprobe-v2-v8-1-5f14bc5c23d3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/20/26 09:18, Guodong Xu wrote:
> From: Andrew Jones <andrew.jones@oss.qualcomm.com>
> 
> Add B to hwcap and ensure when B is present that Zba, Zbb, and Zbs
> are all set. Also expose B via hwprobe (RISCV_HWPROBE_EXT_B in
> RISCV_HWPROBE_KEY_IMA_EXT_1) so that userspace can probe B directly,
> mirroring the F/D/C/V pattern where each is reported via both hwcap
> and hwprobe.
> 
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
> [Add B to hwprobe]
> Signed-off-by: Guodong Xu <guodong.xu@oss.qualcomm.com>
> ---
> v8: No change.
> v7: No change.
> v6: Rebase onto riscv/for-next: define RISCV_HWPROBE_EXT_B in the
>      _BITULL() style of commit 8da45c93dfa9.
> v5: Collected Reviewed-by from Conor Dooley.
> v4: No change.
> v3:
> - Indent the added hwprobe.rst entry to match the normalized style.
> - Rebased onto v7.1-rc6: index isa2hwcap[] via RISCV_ISA_EXT_B to match the
>    macro-ization in commit 41337097f2823.
> v2:
> - Rebased to v7.1-rc2
> - Add B to hwprobe (RISCV_HWPROBE_EXT_B at IMA_EXT_1 bit 6) and
>    document it in hwprobe.rst, so userspace can probe B directly.
> ---
>   Documentation/arch/riscv/hwprobe.rst  | 4 ++++
>   arch/riscv/include/asm/hwcap.h        | 1 +
>   arch/riscv/include/uapi/asm/hwcap.h   | 1 +
>   arch/riscv/include/uapi/asm/hwprobe.h | 1 +
>   arch/riscv/kernel/cpufeature.c        | 8 ++++++++
>   arch/riscv/kernel/sys_hwprobe.c       | 1 +
>   6 files changed, 16 insertions(+)
> 
> diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
> index bb1e0cbab36f0..69a3fc0a29b71 100644
> --- a/Documentation/arch/riscv/hwprobe.rst
> +++ b/Documentation/arch/riscv/hwprobe.rst
> @@ -423,3 +423,7 @@ * :c:macro:`RISCV_HWPROBE_KEY_IMA_EXT_1`: A bitmask containing additional
>     * :c:macro:`RISCV_HWPROBE_EXT_ZA64RS`: The Za64rs extension is supported,
>       as defined in the RISC-V Profiles specification starting from commit
>       b1d80660 ("Updated to ratified state.")
> +
> +  * :c:macro:`RISCV_HWPROBE_EXT_B`: The B extension is supported, as defined
> +    in version 1.0 of the Bit-Manipulation ISA extensions, and implies the
> +    presence of the Zba, Zbb, and Zbs sub-extensions.
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
> index f8db798b2654b..6a693210b2519 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -11,6 +11,7 @@
>   #include <uapi/asm/hwcap.h>
>   
>   #define RISCV_ISA_EXT_A		('a' - 'a')
> +#define RISCV_ISA_EXT_B		('b' - 'a')
>   #define RISCV_ISA_EXT_C		('c' - 'a')
>   #define RISCV_ISA_EXT_D		('d' - 'a')
>   #define RISCV_ISA_EXT_F		('f' - 'a')
> diff --git a/arch/riscv/include/uapi/asm/hwcap.h b/arch/riscv/include/uapi/asm/hwcap.h
> index c52bb7bbbabe9..96b7cf854e090 100644
> --- a/arch/riscv/include/uapi/asm/hwcap.h
> +++ b/arch/riscv/include/uapi/asm/hwcap.h
> @@ -21,6 +21,7 @@
>   #define COMPAT_HWCAP_ISA_F	(1 << ('F' - 'A'))
>   #define COMPAT_HWCAP_ISA_D	(1 << ('D' - 'A'))
>   #define COMPAT_HWCAP_ISA_C	(1 << ('C' - 'A'))
> +#define COMPAT_HWCAP_ISA_B	(1 << ('B' - 'A'))
>   #define COMPAT_HWCAP_ISA_V	(1 << ('V' - 'A'))
>   
>   #endif /* _UAPI_ASM_RISCV_HWCAP_H */
> diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
> index e6a394fbe7fce..9323feb7c3c81 100644
> --- a/arch/riscv/include/uapi/asm/hwprobe.h
> +++ b/arch/riscv/include/uapi/asm/hwprobe.h
> @@ -122,6 +122,7 @@ struct riscv_hwprobe {
>   #define		RISCV_HWPROBE_EXT_ZICCIF	_BITULL(3)
>   #define		RISCV_HWPROBE_EXT_ZICCRSE	_BITULL(4)
>   #define		RISCV_HWPROBE_EXT_ZA64RS	_BITULL(5)
> +#define		RISCV_HWPROBE_EXT_B		_BITULL(6)
>   
>   /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
>   
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index 61d21f7148305..beb766420b5bc 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -484,6 +484,12 @@ static const unsigned int riscv_c_exts[] = {
>   	RISCV_ISA_EXT_ZCD,
>   };
>   
> +static const unsigned int riscv_b_exts[] = {
> +	RISCV_ISA_EXT_ZBA,
> +	RISCV_ISA_EXT_ZBB,
> +	RISCV_ISA_EXT_ZBS,
> +};
> +
>   /*
>    * The canonical order of ISA extension names in the ISA string is defined in
>    * Chapter 27 of the RISC-V Instruction Set Manual Volume I Unprivileged ISA
> @@ -532,6 +538,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
>   	__RISCV_ISA_EXT_DATA_VALIDATE(d, RISCV_ISA_EXT_D, riscv_ext_d_validate),
>   	__RISCV_ISA_EXT_DATA(q, RISCV_ISA_EXT_Q),
>   	__RISCV_ISA_EXT_SUPERSET(c, RISCV_ISA_EXT_C, riscv_c_exts),
> +	__RISCV_ISA_EXT_SUPERSET(b, RISCV_ISA_EXT_B, riscv_b_exts),

Hello Guodong,

The RISC-V Unpriviledged ISA specification has this description of 
extension B:

"The B standard extension comprises instructions provided by the Zba, 
Zbb, and Zbs extensions."

__RISCV_ISA_EXT_SUPERSET would imply that something else but 
riscv_b_exts is in B. But such an extra seems not to exist.

So shouldn't __RISCV_ISA_EXT_BUNDLE be used here? Some code further 
change may be needed to set extension B if riscv_b_exts is fulfilled.

Best regads

Heinrich

>   	__RISCV_ISA_EXT_SUPERSET_VALIDATE(v, RISCV_ISA_EXT_V, riscv_v_exts,
>   					  riscv_ext_vector_float_validate),
>   	__RISCV_ISA_EXT_DATA(h, RISCV_ISA_EXT_H),
> @@ -1161,6 +1168,7 @@ void __init riscv_fill_hwcap(void)
>   	isa2hwcap[RISCV_ISA_EXT_F] = COMPAT_HWCAP_ISA_F;
>   	isa2hwcap[RISCV_ISA_EXT_D] = COMPAT_HWCAP_ISA_D;
>   	isa2hwcap[RISCV_ISA_EXT_C] = COMPAT_HWCAP_ISA_C;
> +	isa2hwcap[RISCV_ISA_EXT_B] = COMPAT_HWCAP_ISA_B;
>   	isa2hwcap[RISCV_ISA_EXT_V] = COMPAT_HWCAP_ISA_V;
>   
>   	if (!acpi_disabled) {
> diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
> index 7818e1d32622d..c03c6e08dd4d0 100644
> --- a/arch/riscv/kernel/sys_hwprobe.c
> +++ b/arch/riscv/kernel/sys_hwprobe.c
> @@ -207,6 +207,7 @@ static void hwprobe_isa_ext1(struct riscv_hwprobe *pair,
>   		EXT_KEY(isainfo->isa, ZICCIF, pair->value, missing);
>   		EXT_KEY(isainfo->isa, ZICCRSE, pair->value, missing);
>   		EXT_KEY(isainfo->isa, ZA64RS, pair->value, missing);
> +		EXT_KEY(isainfo->isa, B, pair->value, missing);
>   	}
>   
>   	/* Now turn off reporting features if any CPU is missing it. */
> 

