Received: from www3579.sakura.ne.jp (www3579.sakura.ne.jp [49.212.243.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E908326924
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 04:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=49.212.243.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789448221; cv=none; b=bfsC6jUrD0xq3cv+OgB1TfWYKXbszkYnSuOEMVhGnGet8mwmOLxYgwuykKaJqfGaMvbW8YGaHciYT+N0e3AXphPwL92dS53pJtlY9PiijFrzLjjG8tCEFIj0o61TaJQMawDaqs3ceOZ+6EFxuxHkCmL9T5uUz+hzbxyFCSzvkX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789448221; c=relaxed/simple;
	bh=jCdLAM8Patr7KPJlUQJtJw/alzS9hGmr5XYRkeRaz9w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=da/bR5ovIWlmT2ZDRGuDYQnum+6je5C93Tu3XqmQ1u/9eAUtf470mlyELfxLJlAmYcJtsYO2jeZHoXA1eDcxo/IGcGlc4j4TaziWodyjDJmCjEC1j26lV2nr+HPUZYfcBEs8o00MD+a3pFErUIV9G6ipgWsNZDWz9KtM9Pb2hdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rsg.ci.i.u-tokyo.ac.jp; spf=pass smtp.mailfrom=rsg.ci.i.u-tokyo.ac.jp; dkim=pass (2048-bit key) header.d=rsg.ci.i.u-tokyo.ac.jp header.i=@rsg.ci.i.u-tokyo.ac.jp header.b=bbV+n3Fg; arc=none smtp.client-ip=49.212.243.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rsg.ci.i.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rsg.ci.i.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rsg.ci.i.u-tokyo.ac.jp header.i=@rsg.ci.i.u-tokyo.ac.jp header.b="bbV+n3Fg"
Received: from [133.11.54.183] (h183.csg.ci.i.u-tokyo.ac.jp [133.11.54.183])
	(authenticated bits=0)
	by www3579.sakura.ne.jp (8.16.1/8.16.1) with ESMTPSA id 68F4tf8N095474
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 15 Sep 2026 13:55:42 +0900 (JST)
	(envelope-from odaki@rsg.ci.i.u-tokyo.ac.jp)
DKIM-Signature: a=rsa-sha256; bh=sIWcju6Z6Ih/kna2KRliC4lGd1u0e30g5WfGBm/K2FE=;
        c=relaxed/relaxed; d=rsg.ci.i.u-tokyo.ac.jp;
        h=From:Message-ID:To:Subject:Date;
        s=rs20250326; t=1789448142; v=1;
        b=bbV+n3Fgmnz4Ylh+RZX+ZolGKn6NSlop3GUfZtvJZA5NPLpaD9/1+geAI7UvSFEm
         vtm6zg1OLoY93fXJyphdTnua7rDC5DPcd95FtYVxEUHtoll7oYJPdXCtRlQQaFHd
         zoLMqq70CjlB+PGhvWdWhxKsoZHmGG+swoeSetYWXyg5JgTFAklArWU0JQOsIE73
         WHHq5gXieaIRo5s2eqJW37QgIQ1RTxQwEHS++rLQWoKeVnkukaLcEI/hFXMxihWZ
         erZbGyx9LrCxCj64L5dOELHF8WRdVi+hMg/qNtdZiS43lEGy/JXqETAOLo4yxneC
         wbbx2SCzlm9rh9bIO4dLkg==
Message-ID: <81212a6d-7244-4426-a385-5a76429d34aa@rsg.ci.i.u-tokyo.ac.jp>
Date: Tue, 15 Sep 2026 13:55:41 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] bitfield: get rid of __MAKE_OP machinery
To: Yury Norov <ynorov@nvidia.com>, linux-kernel@vger.kernel.org,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Jakub Kicinski <kuba@kernel.org>
Cc: Al Viro <viro@zeniv.linux.org.uk>,
        David Laight <david.laight.linux@gmail.com>,
        Ben Horgan
 <ben.horgan@arm.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
        Fuad Tabba <fuad.tabba@linux.dev>,
        Arnaldo Carvalho de Melo
 <acme@redhat.com>,
        Yury Norov <yury.norov@gmail.com>
References: <20260914204929.240310-1-ynorov@nvidia.com>
Content-Language: en-US
From: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
In-Reply-To: <20260914204929.240310-1-ynorov@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2026/09/15 5:49, Yury Norov wrote:
> The __MAKE_OP machinery hides the fixed-width bitfield helper definitions
> from source searches and makes the end result highly obscured and largely
> uncontrolled.
> 
> This follows earlier discussions about making these helpers easier to
> find: [1], [2].
> 
> Move the explicit helpers and their shared checks into
> linux/bitfield-fix-width.h in both the kernel and tools headers, and
> include it from bitfield.h to preserve existing users.
> 
> The repeated overflow check is factored into __assert_field(), preserving
> the original condition and compile-time diagnostics.
> 
> With GCC 15.2.0 and x86-64 defconfig plus the bitfield KUnit tests, the
> before/after kernel builds are binary identical.
> 
> The __MAKE_OP generates the following 40 functions (including the direct
> ____MAKE_OP(u8,u8,,) invocation):
> 
>    u8_encode_bits()
>    u8_replace_bits()
>    u8p_replace_bits()
>    u8_get_bits()
>    le16_encode_bits()
>    le16_replace_bits() [dead code]
>    le16p_replace_bits()
>    le16_get_bits()
>    be16_encode_bits()
>    be16_replace_bits() [dead code]
>    be16p_replace_bits() [dead code]
>    be16_get_bits()
>    u16_encode_bits()
>    u16_replace_bits()
>    u16p_replace_bits()
>    u16_get_bits()
>    le32_encode_bits()
>    le32_replace_bits() [dead code]
>    le32p_replace_bits()
>    le32_get_bits()
>    be32_encode_bits()
>    be32_replace_bits() [dead code]
>    be32p_replace_bits()
>    be32_get_bits()
>    u32_encode_bits()
>    u32_replace_bits()
>    u32p_replace_bits()
>    u32_get_bits()
>    le64_encode_bits()
>    le64_replace_bits() [dead code]
>    le64p_replace_bits() [dead code]
>    le64_get_bits()
>    be64_encode_bits()
>    be64_replace_bits() [dead code]
>    be64p_replace_bits() [dead code]
>    be64_get_bits()
>    u64_encode_bits()
>    u64_replace_bits()
>    u64p_replace_bits()
>    u64_get_bits()
> 
> Functions marked with [dead code] have no in-tree callers and are
> removed by this change.
> 
> Link: https://lore.kernel.org/all/20250214073402.0129e259@kernel.org/ [1]
> Link: https://lore.kernel.org/all/aeub59FBHbCy-KKP@yury/ [2]
> Assisted-by: OpenAI Codex
> Signed-off-by: Yury Norov <ynorov@nvidia.com>

I'm for this change. At first glance the repetition looked awkward, but 
I do see practical benefit of this patch.

Reviewed-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>

Regards,
Akihiko Odaki

> ---
>   MAINTAINERS                              |   2 +
>   include/linux/bitfield-fix-width.h       | 235 ++++++++++++++++++++++++++++++
>   include/linux/bitfield.h                 |  49 +------
>   tools/include/linux/bitfield-fix-width.h | 236 +++++++++++++++++++++++++++++++
>   tools/include/linux/bitfield.h           |  49 +------
>   5 files changed, 475 insertions(+), 96 deletions(-)
>   create mode 100644 include/linux/bitfield-fix-width.h
>   create mode 100644 tools/include/linux/bitfield-fix-width.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index be05b0c3684757fa2da3aa1f02265f6e9bfebcb2..03973f947121491a44a5dfd946b3c0649e7a77e2 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -4638,6 +4638,7 @@ BITMAP API
>   M:	Yury Norov <yury.norov@gmail.com>
>   R:	Rasmus Villemoes <linux@rasmusvillemoes.dk>
>   S:	Maintained
> +F:	include/linux/bitfield-fix-width.h
>   F:	include/linux/bitfield.h
>   F:	include/linux/bitmap-str.h
>   F:	include/linux/bitmap.h
> @@ -4658,6 +4659,7 @@ F:	lib/find_bit_benchmark.c
>   F:	lib/region_alloc_benchmark.c
>   F:	lib/test_bitmap.c
>   F:	lib/tests/cpumask_kunit.c
> +F:	tools/include/linux/bitfield-fix-width.h
>   F:	tools/include/linux/bitfield.h
>   F:	tools/include/linux/bitmap.h
>   F:	tools/include/linux/bits.h
> diff --git a/include/linux/bitfield-fix-width.h b/include/linux/bitfield-fix-width.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..fba86bb76999f1d9a96045dbdddb72f4806a305e
> --- /dev/null
> +++ b/include/linux/bitfield-fix-width.h
> @@ -0,0 +1,235 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifndef _LINUX_BITFIELD_FIX_WIDTH_H
> +#define _LINUX_BITFIELD_FIX_WIDTH_H
> +
> +#include <linux/compiler.h>
> +#include <linux/types.h>
> +#include <asm/byteorder.h>
> +
> +extern void __compiletime_error("value doesn't fit into mask")
> +__field_overflow(void);
> +
> +extern void __compiletime_error("bad bitfield mask")
> +__bad_mask(void);
> +
> +static __always_inline
> +u64 field_multiplier(u64 field)
> +{
> +	if ((field | (field - 1)) & ((field | (field - 1)) + 1))
> +		__bad_mask();
> +	return field & -field;
> +}
> +
> +static __always_inline
> +u64 field_mask(u64 field)
> +{
> +	return field / field_multiplier(field);
> +}
> +
> +#define field_max(field)	((typeof(field))field_mask(field))
> +
> +#define __assert_field(v, field)						\
> +	do {								\
> +		if (__builtin_constant_p(v) &&				\
> +		    ((v) & ~field_mask(field)))				\
> +			__field_overflow();				\
> +	} while (0)
> +
> +static __always_inline __must_check
> +__u8 u8_encode_bits(u8 v, u8 field)
> +{
> +	__assert_field(v, field);
> +	return (v & field_mask(field)) * field_multiplier(field);
> +}
> +
> +static __always_inline __must_check
> +__u8 u8_replace_bits(__u8 old, u8 val, u8 field)
> +{
> +	return (old & ~field) | u8_encode_bits(val, field);
> +}
> +
> +static __always_inline
> +void u8p_replace_bits(__u8 *p, u8 val, u8 field)
> +{
> +	*p = (*p & ~field) | u8_encode_bits(val, field);
> +}
> +
> +static __always_inline __must_check
> +u8 u8_get_bits(__u8 v, u8 field)
> +{
> +	return (v & field) / field_multiplier(field);
> +}
> +
> +static __always_inline __must_check
> +__le16 le16_encode_bits(u16 v, u16 field)
> +{
> +	__assert_field(v, field);
> +	return cpu_to_le16((v & field_mask(field)) * field_multiplier(field));
> +}
> +
> +static __always_inline
> +void le16p_replace_bits(__le16 *p, u16 val, u16 field)
> +{
> +	*p = (*p & ~cpu_to_le16(field)) | le16_encode_bits(val, field);
> +}
> +
> +static __always_inline __must_check
> +u16 le16_get_bits(__le16 v, u16 field)
> +{
> +	return (le16_to_cpu(v) & field) / field_multiplier(field);
> +}
> +
> +static __always_inline __must_check
> +__be16 be16_encode_bits(u16 v, u16 field)
> +{
> +	__assert_field(v, field);
> +	return cpu_to_be16((v & field_mask(field)) * field_multiplier(field));
> +}
> +
> +static __always_inline __must_check
> +u16 be16_get_bits(__be16 v, u16 field)
> +{
> +	return (be16_to_cpu(v) & field) / field_multiplier(field);
> +}
> +
> +static __always_inline __must_check
> +__u16 u16_encode_bits(u16 v, u16 field)
> +{
> +	__assert_field(v, field);
> +	return (v & field_mask(field)) * field_multiplier(field);
> +}
> +
> +static __always_inline __must_check
> +__u16 u16_replace_bits(__u16 old, u16 val, u16 field)
> +{
> +	return (old & ~field) | u16_encode_bits(val, field);
> +}
> +
> +static __always_inline
> +void u16p_replace_bits(__u16 *p, u16 val, u16 field)
> +{
> +	*p = (*p & ~field) | u16_encode_bits(val, field);
> +}
> +
> +static __always_inline __must_check
> +u16 u16_get_bits(__u16 v, u16 field)
> +{
> +	return (v & field) / field_multiplier(field);
> +}
> +
> +static __always_inline __must_check
> +__le32 le32_encode_bits(u32 v, u32 field)
> +{
> +	__assert_field(v, field);
> +	return cpu_to_le32((v & field_mask(field)) * field_multiplier(field));
> +}
> +
> +static __always_inline
> +void le32p_replace_bits(__le32 *p, u32 val, u32 field)
> +{
> +	*p = (*p & ~cpu_to_le32(field)) | le32_encode_bits(val, field);
> +}
> +
> +static __always_inline __must_check
> +u32 le32_get_bits(__le32 v, u32 field)
> +{
> +	return (le32_to_cpu(v) & field) / field_multiplier(field);
> +}
> +
> +static __always_inline __must_check
> +__be32 be32_encode_bits(u32 v, u32 field)
> +{
> +	__assert_field(v, field);
> +	return cpu_to_be32((v & field_mask(field)) * field_multiplier(field));
> +}
> +
> +static __always_inline
> +void be32p_replace_bits(__be32 *p, u32 val, u32 field)
> +{
> +	*p = (*p & ~cpu_to_be32(field)) | be32_encode_bits(val, field);
> +}
> +
> +static __always_inline __must_check
> +u32 be32_get_bits(__be32 v, u32 field)
> +{
> +	return (be32_to_cpu(v) & field) / field_multiplier(field);
> +}
> +
> +static __always_inline __must_check
> +__u32 u32_encode_bits(u32 v, u32 field)
> +{
> +	__assert_field(v, field);
> +	return (v & field_mask(field)) * field_multiplier(field);
> +}
> +
> +static __always_inline __must_check
> +__u32 u32_replace_bits(__u32 old, u32 val, u32 field)
> +{
> +	return (old & ~field) | u32_encode_bits(val, field);
> +}
> +
> +static __always_inline
> +void u32p_replace_bits(__u32 *p, u32 val, u32 field)
> +{
> +	*p = (*p & ~field) | u32_encode_bits(val, field);
> +}
> +
> +static __always_inline __must_check
> +u32 u32_get_bits(__u32 v, u32 field)
> +{
> +	return (v & field) / field_multiplier(field);
> +}
> +
> +static __always_inline __must_check
> +__le64 le64_encode_bits(u64 v, u64 field)
> +{
> +	__assert_field(v, field);
> +	return cpu_to_le64((v & field_mask(field)) * field_multiplier(field));
> +}
> +
> +static __always_inline __must_check
> +u64 le64_get_bits(__le64 v, u64 field)
> +{
> +	return (le64_to_cpu(v) & field) / field_multiplier(field);
> +}
> +
> +static __always_inline __must_check
> +__be64 be64_encode_bits(u64 v, u64 field)
> +{
> +	__assert_field(v, field);
> +	return cpu_to_be64((v & field_mask(field)) * field_multiplier(field));
> +}
> +
> +static __always_inline __must_check
> +u64 be64_get_bits(__be64 v, u64 field)
> +{
> +	return (be64_to_cpu(v) & field) / field_multiplier(field);
> +}
> +
> +static __always_inline __must_check
> +__u64 u64_encode_bits(u64 v, u64 field)
> +{
> +	__assert_field(v, field);
> +	return (v & field_mask(field)) * field_multiplier(field);
> +}
> +
> +static __always_inline __must_check
> +__u64 u64_replace_bits(__u64 old, u64 val, u64 field)
> +{
> +	return (old & ~field) | u64_encode_bits(val, field);
> +}
> +
> +static __always_inline
> +void u64p_replace_bits(__u64 *p, u64 val, u64 field)
> +{
> +	*p = (*p & ~field) | u64_encode_bits(val, field);
> +}
> +
> +static __always_inline __must_check
> +u64 u64_get_bits(__u64 v, u64 field)
> +{
> +	return (v & field) / field_multiplier(field);
> +}
> +
> +#endif /* _LINUX_BITFIELD_FIX_WIDTH_H */
> diff --git a/include/linux/bitfield.h b/include/linux/bitfield.h
> index 14f86e455a678b04a4588e80789ab74902324c9c..e3f7315c1d539bff0491f570b607881032ce1ddb 100644
> --- a/include/linux/bitfield.h
> +++ b/include/linux/bitfield.h
> @@ -10,7 +10,7 @@
>   #include <linux/build_bug.h>
>   #include <linux/compiler.h>
>   #include <linux/typecheck.h>
> -#include <asm/byteorder.h>
> +#include <linux/bitfield-fix-width.h>
>   
>   /*
>    * Bitfield access macros
> @@ -211,53 +211,6 @@
>   		*(_reg_p) |= (((typeof(_mask))(_val) << __bf_shf(_mask)) & (_mask));	\
>   	})
>   
> -extern void __compiletime_error("value doesn't fit into mask")
> -__field_overflow(void);
> -extern void __compiletime_error("bad bitfield mask")
> -__bad_mask(void);
> -static __always_inline u64 field_multiplier(u64 field)
> -{
> -	if ((field | (field - 1)) & ((field | (field - 1)) + 1))
> -		__bad_mask();
> -	return field & -field;
> -}
> -static __always_inline u64 field_mask(u64 field)
> -{
> -	return field / field_multiplier(field);
> -}
> -#define field_max(field)	((typeof(field))field_mask(field))
> -#define ____MAKE_OP(type,base,to,from)					\
> -static __always_inline __##type __must_check type##_encode_bits(base v, base field)	\
> -{									\
> -	if (__builtin_constant_p(v) && (v & ~field_mask(field)))	\
> -		__field_overflow();					\
> -	return to((v & field_mask(field)) * field_multiplier(field));	\
> -}									\
> -static __always_inline __##type __must_check type##_replace_bits(__##type old,	\
> -							base val, base field)	\
> -{									\
> -	return (old & ~to(field)) | type##_encode_bits(val, field);	\
> -}									\
> -static __always_inline void type##p_replace_bits(__##type *p,		\
> -					base val, base field)		\
> -{									\
> -	*p = (*p & ~to(field)) | type##_encode_bits(val, field);	\
> -}									\
> -static __always_inline base __must_check type##_get_bits(__##type v, base field)	\
> -{									\
> -	return (from(v) & field)/field_multiplier(field);		\
> -}
> -#define __MAKE_OP(size)							\
> -	____MAKE_OP(le##size,u##size,cpu_to_le##size,le##size##_to_cpu)	\
> -	____MAKE_OP(be##size,u##size,cpu_to_be##size,be##size##_to_cpu)	\
> -	____MAKE_OP(u##size,u##size,,)
> -____MAKE_OP(u8,u8,,)
> -__MAKE_OP(16)
> -__MAKE_OP(32)
> -__MAKE_OP(64)
> -#undef __MAKE_OP
> -#undef ____MAKE_OP
> -
>   #define __field_prep(mask, val)						\
>   	({								\
>   		auto __mask = (mask);					\
> diff --git a/tools/include/linux/bitfield-fix-width.h b/tools/include/linux/bitfield-fix-width.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..8c2a0fa224e9976d3587bb76c947b7cf8df4b8bb
> --- /dev/null
> +++ b/tools/include/linux/bitfield-fix-width.h
> @@ -0,0 +1,236 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifndef _LINUX_BITFIELD_FIX_WIDTH_H
> +#define _LINUX_BITFIELD_FIX_WIDTH_H
> +
> +#include <linux/compiler.h>
> +#include <linux/kernel.h>
> +#include <linux/types.h>
> +#include <asm/byteorder.h>
> +
> +extern void __compiletime_error("value doesn't fit into mask")
> +__field_overflow(void);
> +
> +extern void __compiletime_error("bad bitfield mask")
> +__bad_mask(void);
> +
> +static __always_inline
> +u64 field_multiplier(u64 field)
> +{
> +	if ((field | (field - 1)) & ((field | (field - 1)) + 1))
> +		__bad_mask();
> +	return field & -field;
> +}
> +
> +static __always_inline
> +u64 field_mask(u64 field)
> +{
> +	return field / field_multiplier(field);
> +}
> +
> +#define field_max(field)	((typeof(field))field_mask(field))
> +
> +#define __assert_field(v, field)						\
> +	do {								\
> +		if (__builtin_constant_p(v) &&				\
> +		    ((v) & ~field_mask(field)))				\
> +			__field_overflow();				\
> +	} while (0)
> +
> +static __always_inline
> +__u8 u8_encode_bits(u8 v, u8 field)
> +{
> +	__assert_field(v, field);
> +	return (v & field_mask(field)) * field_multiplier(field);
> +}
> +
> +static __always_inline
> +__u8 u8_replace_bits(__u8 old, u8 val, u8 field)
> +{
> +	return (old & ~field) | u8_encode_bits(val, field);
> +}
> +
> +static __always_inline
> +void u8p_replace_bits(__u8 *p, u8 val, u8 field)
> +{
> +	*p = (*p & ~field) | u8_encode_bits(val, field);
> +}
> +
> +static __always_inline
> +u8 u8_get_bits(__u8 v, u8 field)
> +{
> +	return (v & field) / field_multiplier(field);
> +}
> +
> +static __always_inline
> +__le16 le16_encode_bits(u16 v, u16 field)
> +{
> +	__assert_field(v, field);
> +	return cpu_to_le16((v & field_mask(field)) * field_multiplier(field));
> +}
> +
> +static __always_inline
> +void le16p_replace_bits(__le16 *p, u16 val, u16 field)
> +{
> +	*p = (*p & ~cpu_to_le16(field)) | le16_encode_bits(val, field);
> +}
> +
> +static __always_inline
> +u16 le16_get_bits(__le16 v, u16 field)
> +{
> +	return (le16_to_cpu(v) & field) / field_multiplier(field);
> +}
> +
> +static __always_inline
> +__be16 be16_encode_bits(u16 v, u16 field)
> +{
> +	__assert_field(v, field);
> +	return cpu_to_be16((v & field_mask(field)) * field_multiplier(field));
> +}
> +
> +static __always_inline
> +u16 be16_get_bits(__be16 v, u16 field)
> +{
> +	return (be16_to_cpu(v) & field) / field_multiplier(field);
> +}
> +
> +static __always_inline
> +__u16 u16_encode_bits(u16 v, u16 field)
> +{
> +	__assert_field(v, field);
> +	return (v & field_mask(field)) * field_multiplier(field);
> +}
> +
> +static __always_inline
> +__u16 u16_replace_bits(__u16 old, u16 val, u16 field)
> +{
> +	return (old & ~field) | u16_encode_bits(val, field);
> +}
> +
> +static __always_inline
> +void u16p_replace_bits(__u16 *p, u16 val, u16 field)
> +{
> +	*p = (*p & ~field) | u16_encode_bits(val, field);
> +}
> +
> +static __always_inline
> +u16 u16_get_bits(__u16 v, u16 field)
> +{
> +	return (v & field) / field_multiplier(field);
> +}
> +
> +static __always_inline
> +__le32 le32_encode_bits(u32 v, u32 field)
> +{
> +	__assert_field(v, field);
> +	return cpu_to_le32((v & field_mask(field)) * field_multiplier(field));
> +}
> +
> +static __always_inline
> +void le32p_replace_bits(__le32 *p, u32 val, u32 field)
> +{
> +	*p = (*p & ~cpu_to_le32(field)) | le32_encode_bits(val, field);
> +}
> +
> +static __always_inline
> +u32 le32_get_bits(__le32 v, u32 field)
> +{
> +	return (le32_to_cpu(v) & field) / field_multiplier(field);
> +}
> +
> +static __always_inline
> +__be32 be32_encode_bits(u32 v, u32 field)
> +{
> +	__assert_field(v, field);
> +	return cpu_to_be32((v & field_mask(field)) * field_multiplier(field));
> +}
> +
> +static __always_inline
> +void be32p_replace_bits(__be32 *p, u32 val, u32 field)
> +{
> +	*p = (*p & ~cpu_to_be32(field)) | be32_encode_bits(val, field);
> +}
> +
> +static __always_inline
> +u32 be32_get_bits(__be32 v, u32 field)
> +{
> +	return (be32_to_cpu(v) & field) / field_multiplier(field);
> +}
> +
> +static __always_inline
> +__u32 u32_encode_bits(u32 v, u32 field)
> +{
> +	__assert_field(v, field);
> +	return (v & field_mask(field)) * field_multiplier(field);
> +}
> +
> +static __always_inline
> +__u32 u32_replace_bits(__u32 old, u32 val, u32 field)
> +{
> +	return (old & ~field) | u32_encode_bits(val, field);
> +}
> +
> +static __always_inline
> +void u32p_replace_bits(__u32 *p, u32 val, u32 field)
> +{
> +	*p = (*p & ~field) | u32_encode_bits(val, field);
> +}
> +
> +static __always_inline
> +u32 u32_get_bits(__u32 v, u32 field)
> +{
> +	return (v & field) / field_multiplier(field);
> +}
> +
> +static __always_inline
> +__le64 le64_encode_bits(u64 v, u64 field)
> +{
> +	__assert_field(v, field);
> +	return cpu_to_le64((v & field_mask(field)) * field_multiplier(field));
> +}
> +
> +static __always_inline
> +u64 le64_get_bits(__le64 v, u64 field)
> +{
> +	return (le64_to_cpu(v) & field) / field_multiplier(field);
> +}
> +
> +static __always_inline
> +__be64 be64_encode_bits(u64 v, u64 field)
> +{
> +	__assert_field(v, field);
> +	return cpu_to_be64((v & field_mask(field)) * field_multiplier(field));
> +}
> +
> +static __always_inline
> +u64 be64_get_bits(__be64 v, u64 field)
> +{
> +	return (be64_to_cpu(v) & field) / field_multiplier(field);
> +}
> +
> +static __always_inline
> +__u64 u64_encode_bits(u64 v, u64 field)
> +{
> +	__assert_field(v, field);
> +	return (v & field_mask(field)) * field_multiplier(field);
> +}
> +
> +static __always_inline
> +__u64 u64_replace_bits(__u64 old, u64 val, u64 field)
> +{
> +	return (old & ~field) | u64_encode_bits(val, field);
> +}
> +
> +static __always_inline
> +void u64p_replace_bits(__u64 *p, u64 val, u64 field)
> +{
> +	*p = (*p & ~field) | u64_encode_bits(val, field);
> +}
> +
> +static __always_inline
> +u64 u64_get_bits(__u64 v, u64 field)
> +{
> +	return (v & field) / field_multiplier(field);
> +}
> +
> +#endif /* _LINUX_BITFIELD_FIX_WIDTH_H */
> diff --git a/tools/include/linux/bitfield.h b/tools/include/linux/bitfield.h
> index ddf81f24956ba069b2c1a7b096a6c9bf92fc9182..4508cefabec92d4e05a09ecf93b98bf4e304d305 100644
> --- a/tools/include/linux/bitfield.h
> +++ b/tools/include/linux/bitfield.h
> @@ -9,7 +9,7 @@
>   
>   #include <linux/build_bug.h>
>   #include <linux/kernel.h>
> -#include <asm/byteorder.h>
> +#include <linux/bitfield-fix-width.h>
>   
>   /*
>    * Bitfield access macros
> @@ -127,51 +127,4 @@
>   		(typeof(_mask))(((_reg) & (_mask)) >> __bf_shf(_mask));	\
>   	})
>   
> -extern void __compiletime_error("value doesn't fit into mask")
> -__field_overflow(void);
> -extern void __compiletime_error("bad bitfield mask")
> -__bad_mask(void);
> -static __always_inline u64 field_multiplier(u64 field)
> -{
> -	if ((field | (field - 1)) & ((field | (field - 1)) + 1))
> -		__bad_mask();
> -	return field & -field;
> -}
> -static __always_inline u64 field_mask(u64 field)
> -{
> -	return field / field_multiplier(field);
> -}
> -#define field_max(field)	((typeof(field))field_mask(field))
> -#define ____MAKE_OP(type,base,to,from)					\
> -static __always_inline __##type type##_encode_bits(base v, base field)	\
> -{									\
> -	if (__builtin_constant_p(v) && (v & ~field_mask(field)))	\
> -		__field_overflow();					\
> -	return to((v & field_mask(field)) * field_multiplier(field));	\
> -}									\
> -static __always_inline __##type type##_replace_bits(__##type old,	\
> -					base val, base field)		\
> -{									\
> -	return (old & ~to(field)) | type##_encode_bits(val, field);	\
> -}									\
> -static __always_inline void type##p_replace_bits(__##type *p,		\
> -					base val, base field)		\
> -{									\
> -	*p = (*p & ~to(field)) | type##_encode_bits(val, field);	\
> -}									\
> -static __always_inline base type##_get_bits(__##type v, base field)	\
> -{									\
> -	return (from(v) & field)/field_multiplier(field);		\
> -}
> -#define __MAKE_OP(size)							\
> -	____MAKE_OP(le##size,u##size,cpu_to_le##size,le##size##_to_cpu)	\
> -	____MAKE_OP(be##size,u##size,cpu_to_be##size,be##size##_to_cpu)	\
> -	____MAKE_OP(u##size,u##size,,)
> -____MAKE_OP(u8,u8,,)
> -__MAKE_OP(16)
> -__MAKE_OP(32)
> -__MAKE_OP(64)
> -#undef __MAKE_OP
> -#undef ____MAKE_OP
> -
>   #endif

