Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BF7A1E1A3D
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 22:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788042884; cv=pass; b=LJRwidyePEIyRMyolv2Q5M7OxMJEQT8feKeCPYlnOGE4bQ3dFdmddcdByBYD4Kw7BCMQaPDCHdUkLuWN4wNL0ayEeqT7TvtUorUjXM31EILpea2nvOIQQE9gG2vEf2f1neSzQhhGKVfZCIkgj+9qOsqykBSY8U+LnZJP7ZMRkj0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788042884; c=relaxed/simple;
	bh=jkqQNe36Rv1r/OCgRHgUvUwWDKxxX7AlHEq5MFWydfw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fzn/kbXLJENA/ngiwqZmeuL5rui17RixfTkC5et+bOEnOCTlep0qUVXF4fgRV5mSjEas7Ajp8de1+r3Fjzgk6yHMckIGHW+g48v9PQTy81knKcTbiBkqsE1NPrLJVNFjkG5fWxK+juzKQQfqr6uyZu+oK+GuuQOpw2CM9YqnyAc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=v68MT4nH; arc=pass smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="v68MT4nH"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c250c6a6a9aso364993266b.1
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 15:34:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788042880; cv=none;
        d=google.com; s=arc-20260327;
        b=V9pr6sMTJOzdfLJ+MTHpiL9LTEJT8+pUp1bjZ2Yue3MdbFaC+k6M99ORp54xqapp5J
         uhxRW+XVix+JkmBiX4/wdlcn7UHYyrqnNotxE33YtECL8z++OdTDZ3v9CVa5gFNtuNBY
         71xB0+C51+V5VJRq03Lnwy7wNjXVkbEOhHXVhmvXzs1p5MD8GKPpOKYqxAg8ZDam9WC/
         t5WM+EaN8Pq/Okk8gZCComUPSdxsl1ZGcANJJdcd1kZd3kayWK9aLmuh6J3NBOIx973I
         sR37mJW/ypLgopFVdJWsw6s29IQyGRjDYX8XXxg3A7iOZABJyj45h1b/pa1RtEhcC7UF
         //EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=lL4lAoAWFhHD1Sud3b5FYvoteQ4HxeD6khDR9Z8Agsg=;
        fh=cAV4aGZTHl38kWyfD7lRPlYLKLPwyN7sMqbiEudbQEk=;
        b=OsNH5DR+ynLMiqz+ruAKRTzyrlpisOfivjfZSKJrNOZy3/W+kbBNVoSqd0T/n9JSyG
         8aKajH5szN9WpUPI7Zu3yQ6MsnrWKy50Uo9ikvjWO7O4y3pVG4Wx8cLNQAr6HUX/PAxn
         RRMJCq6pHMJ4bj7GHoCA0XR22KlLsrI+DmMgAGC+j1sp4ed3KtgbQ7AiRgH0HITu4Can
         ZLgKubqGogN5p0uldvbTdASTuwD+Yo2ICCKri6C15jOVniTXcYpcpxe3l0fAX/G3Jpbo
         RsTMWR59O14p6OJ9lgTGleLiLNbwJW55PL6xURF3OHjYHlWei8WGBuGz/uM5HMZqZ1ME
         u7Hg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788042880; x=1788647680; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lL4lAoAWFhHD1Sud3b5FYvoteQ4HxeD6khDR9Z8Agsg=;
        b=v68MT4nHDzPosfUr4vstR6LeNnuj5M6fScWkY0gU/Mspj39mOdRGgamrV94R59hy+C
         vbSvnzRrRXGxnA6Nfeie+WO4c0XPZ7nvvy9w3dKEEaQOcScQaAFsusOGgNffBD/dmPdt
         Xu0PRIyEhAmHm+ip18s7nHZt2zoeOm8FP6eqZtjYH3FGpyU1Z0TiumPN5bjh4O6xjXg2
         fuYj49abh3+ukf1vocFUCMUG4lisoancKRI5mpvjHz0UaEHQSgsgVf2eauIYZIoZFoOr
         RK0ZA48IRMkwbM7d30gD0V5zg0S7kwb4zeqrR/+B2kg0W389+5Y18tcAVVAMcFKbsCF0
         O+ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788042880; x=1788647680;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lL4lAoAWFhHD1Sud3b5FYvoteQ4HxeD6khDR9Z8Agsg=;
        b=MuV+kwIaiz1sJ+cZxzpsHqLn5rgLqM04Ou/yvPXSfjGLzCT32ccy0X2mRpqNpFCU1V
         0Vw9yG8MDInSRR8xMFR0yJBu6116OwFyhtUYJ0rSDMYuq97fsS3j/bxc5PuJKiJwOtdb
         MluEonYK7HIz6ZPrTzrjESZGAI8SYDqCfUVGCDt68U31EHHAvhd07dB8qmAIX7JcTkKI
         EsGPmAJjxfZTVfALacHCcUoK0dZpz2UFY/HSbl9KvrHvfbu59igoQ2ewQj1HK6HgpA2Y
         /JF8X24WH7A9vSTDGUL54heIXI8QgRQyrcAfPkp12vyNmhU6VRlUgIbZNm3BrUJprXn8
         f/MQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp9nMkFqTcIMWeoDxVKmBFi2JmyTZ5ekDiIvV8IeiEzQzdQgCE3LQJuyjho/Bh4+6U77eeqcIh9pD/XVuU=@vger.kernel.org
X-Gm-Message-State: AFuF++l4ZnFgxFf9Ta/CRUoHIoufsgTIh++xjRFMmTwZaI2QPd2HWA/2
	wY+wZv+qzKxLbIsd2MK8hpliLARl7DbHVCmKxPHNSTpHmgGjNmwtm3lwGHXv71/J38Z0LSskWJt
	7WrVWEDXUiXbBWI73WCayT/c/KsIzUDzu5Jow1bCpVJz/5iTOj7Is91E0FII=
X-Gm-Gg: AR+sD11nSWe+HQ1QNvbnWNpwqdn7SmgUPJdbvJnxwO06FrrUqek2JIvebcdYDK+l5vX
	MLXG88PBtSAQKPMUWhxcYtnsnkQBaq/iK37xaush+rsO9QvXYra1DZaHwxkM5kMGKiN2CVUkadN
	YbDG23vlbD/U+0HvCFZdDctieTFoKFBJvLgZ03NXPF6Zkgma3DA9RMvXF2tQMShlGPeS7Ra+a9Y
	DZm69FsFel/7mOMmHjfwjrzQvUprYfjhqWSMcGg52+WfFCkDBK+M4Vt5Voq+ZM2+A50B9Khr1Hq
	BGMsyxNA6W3RA5cnAAqpFg3LuXFDgmyYssLX9CtMXaLxgiyhf8w8yJ1dscjJeBdRa7uiQ2aOp1+
	3e04SeTm2ZE1IAr2Njs/zlxz3y6jfqGY=
X-Received: by 2002:a17:907:c8c8:b0:c25:30ec:bec3 with SMTP id
 a640c23a62f3a-c2556c338efmr1146565666b.8.1788042879612; Sat, 29 Aug 2026
 15:34:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828153349.8061-1-odion@efficios.com> <20260828153349.8061-2-odion@efficios.com>
In-Reply-To: <20260828153349.8061-2-odion@efficios.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Sun, 30 Aug 2026 00:34:26 +0200
X-Gm-Features: AcwNN1UfCIzCT-UIgzUlFLNOlE6QHkZTCon0eQZGGTY3v_KwHRimc9Vj4MgZ7KU
Message-ID: <CACT4Y+axE=-F-nTfqXoyGTTOO3iCD=SAB-Pgu8pD+cBdh5Gqdw@mail.gmail.com>
Subject: Re: [RFC PATCH 1/5] rseq: uapi: add rseq operation definitions
To: odion@efficios.com
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Peter Zijlstra <peterz@infradead.org>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	David Matlack <dmatlack@google.com>, Marco Elver <elver@google.com>, 
	Sean Christopherson <seanjc@google.com>, Wei Liu <wei.liu@kernel.org>, 
	Florian Weimer <fweimer@redhat.com>, Mathias Stearn <mathias@mongodb.com>, 
	Chris Kennelly <ckennelly@google.com>, Blake Oler <blake.oler@mongodb.com>, 
	Rich Felker <dalias@libc.org>, Matthew Wilcox <willy@infradead.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Carlos O'Donell" <codonell@redhat.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 28 Aug 2026 at 17:33, <odion@efficios.com> wrote:
>
> From: Olivier Dion <odion@efficios.com>
>
> Introduce userspace ABI for rseq operations: a per-thread list of
> operations the kernel applies on return to user space.
>
> The main motivation for this work is to encourage TCMalloc to migrate to
> RSEQ v2 [0] and use the glibc RSEQ region.
>
> Indeed, TCMalloc relies on the behavior of RSEQ v1, that reset the
> cpu_id bits in the RSEQ shared region, to invalidate a per-cpu pointer
> cached in a TLS. This hack requires TCMalloc users to use a glibc
> tunable to disable RSEQ registration for threads so that TCMalloc can
> register its own region, overlapping the TLS cache.
>
> Overall, this puts the users in a situation of choosing between a fast
> sched_getcpu() and TCMalloc, plus some downsides such as requiring a
> initial-exec model for the cache TLS in a shared-library and not being
> compatible with the glibc
>
> RSEQ operations aim at solving this by offering operations that are
> executed by the kernel, on behalf of a task after it is scheduled,
> before returning to userspace. Operations are per-task and registered
> throught prctl. They are opt-in and only introduce overhead on tasks
> that register them.
>
> Add enum rseq_op_type and the rseq_op_node / rseq_op_reset /
> rseq_op_reset_with_stride structures, the RSEQ_CS_FLAG_RSEQ_OP_*
> availability/enabled flags, the RSEQ_OP_LIST_LIMIT walk bound, and the
> PR_RSEQ_OP prctl with its REGISTER/UNREGISTER sub-commands.
>
> The operation list is a circular doubly-linked list anchored by a
> kernel-owned sentinel embedded in struct rseq.
>
> [0] Documentation/userspace-api/rseq.rst (Optimized RSEQ v2)

Hi Olivier,

This is very cool, thanks for working on this.

> Link: https://lore.kernel.org/lkml/20260428221058.149538293@kernel.org
> Signed-off-by: Olivier Dion <odion@efficios.com>
> ---
>  include/uapi/linux/prctl.h |  12 +++++
>  include/uapi/linux/rseq.h  | 104 ++++++++++++++++++++++++++++++++++---
>  2 files changed, 108 insertions(+), 8 deletions(-)
>
> diff --git a/include/uapi/linux/prctl.h b/include/uapi/linux/prctl.h
> index b6ec6f693719..4cb6356a271a 100644
> --- a/include/uapi/linux/prctl.h
> +++ b/include/uapi/linux/prctl.h
> @@ -396,6 +396,18 @@ struct prctl_mm_map {
>   */
>  # define PR_RSEQ_SLICE_EXT_ENABLE              0x01
>
> +/*
> + * RSEQ operation registration.
> + *
> + * arg3 is the user address of a struct rseq_op_node embedded in one of the
> + * rseq operation structures (see uapi/linux/rseq.h). Registering the first
> + * operation enables rseq operation processing for the thread; unregistering
> + * the last one disables it.
> + */
> +#define PR_RSEQ_OP                             82
> +# define PR_RSEQ_OP_REGISTER                   1
> +# define PR_RSEQ_OP_UNREGISTER                 2
> +
>  /*
>   * Get or set the control flow integrity (CFI) configuration for the
>   * current thread.
> diff --git a/include/uapi/linux/rseq.h b/include/uapi/linux/rseq.h
> index ca6fe1f9d05e..b664d1991c48 100644
> --- a/include/uapi/linux/rseq.h
> +++ b/include/uapi/linux/rseq.h
> @@ -13,6 +13,11 @@
>  #include <linux/types.h>
>  #include <asm/byteorder.h>
>
> +/*
> + * Maximum number of nodes walked in the rseq operation list.
> + */
> +#define RSEQ_OP_LIST_LIMIT     2048

Does this belong to the user header? Kernel and userspace are not
necessary built with the same headers, and we don't necessary want to
set this const in stone. I think it may be more flexible to make this
impl detail and just return ENOSPC.

>  enum rseq_cpu_id_state {
>         RSEQ_CPU_ID_UNINITIALIZED               = -1,
>         RSEQ_CPU_ID_REGISTRATION_FAILED         = -2,
> @@ -33,6 +38,8 @@ enum rseq_cs_flags_bit {
>         /* User read only feature flags */
>         RSEQ_CS_FLAG_SLICE_EXT_AVAILABLE_BIT    = 4,
>         RSEQ_CS_FLAG_SLICE_EXT_ENABLED_BIT      = 5,
> +       RSEQ_CS_FLAG_RSEQ_OP_AVAILABLE_BIT      = 6,
> +       RSEQ_CS_FLAG_RSEQ_OP_ENABLED_BIT        = 7,
>  };
>
>  enum rseq_cs_flags {
> @@ -47,6 +54,10 @@ enum rseq_cs_flags {
>                 (1U << RSEQ_CS_FLAG_SLICE_EXT_AVAILABLE_BIT),
>         RSEQ_CS_FLAG_SLICE_EXT_ENABLED          =
>                 (1U << RSEQ_CS_FLAG_SLICE_EXT_ENABLED_BIT),
> +       RSEQ_CS_FLAG_RSEQ_OP_AVAILABLE          =
> +               (1U << RSEQ_CS_FLAG_RSEQ_OP_AVAILABLE_BIT),
> +       RSEQ_CS_FLAG_RSEQ_OP_ENABLED            =
> +               (1U << RSEQ_CS_FLAG_RSEQ_OP_ENABLED_BIT),
>  };
>
>  /*
> @@ -86,6 +97,77 @@ struct rseq_slice_ctrl {
>         };
>  };
>
> +/*
> + * enum rseq_op_type - Type of an rseq operation
> + * @RSEQ_OP_RESET:                     Plain reset. Uses struct rseq_op_reset.
> + * @RSEQ_OP_RESET_WITH_STRIDE_CPUID:   Reset indexed by the current CPU ID.
> + *                                     Uses struct rseq_op_reset_with_stride.
> + * @RSEQ_OP_RESET_WITH_STRIDE_MMCID:   Reset indexed by the current MM CID.
> + *                                     Uses struct rseq_op_reset_with_stride.

Do you have use-cases for these STRIDE ops?
I can think of some, but they would require executing ops when a task
is descheduled, rather than when it's scheduled in.

> + */
> +enum rseq_op_type {
> +       RSEQ_OP_RESET,
> +       RSEQ_OP_RESET_WITH_STRIDE_CPUID,
> +       RSEQ_OP_RESET_WITH_STRIDE_MMCID,
> +       RSEQ_OP_NR,
> +};
> +
> +/*
> + * struct rseq_op_node - Common header linking an rseq operation into the list
> + * @next:      Address of the next node. Owned by the kernel.
> + * @prev:      Address of the previous node. Owned by the kernel.
> + * @type:      Operation type. See enum rseq_op_type.
> + * @reserved:  Must be zero on registration.
> + *
> + * User space allocates the node, sets @type and zeroes @next, @prev and
> + * @reserved before passing it to prctl(PR_RSEQ_OP, PR_RSEQ_OP_REGISTER, node).
> + * The kernel owns @next and @prev for the lifetime of the registration and
> + * links the node into a circular doubly-linked list anchored by an internal
> + * sentinel in struct rseq. User space must not touch @next or @prev while the
> + * node is registered.

Have you considered keeping copies of these structs in the kernel?
That (1) is more consistent with most of the other kernel APIs, (2)
will make executing ops faster since we don't need to copy_from_user
all the time, (3) will make code much simpler since we won't need to
re-verify all data, (4) will make the code more secure since
user-space won't be able to mess with these structs, (5) will simplify
the contract and documentation.
There are robust lists that keep lists in user-space, but these are
supposed to be concurrently modified by userspace. But these rseq ops
are generally not expected to be added/removed often (and the current
contract does not allow that anyway).

> + */
> +struct rseq_op_node {
> +       __u64 next;
> +       __u64 prev;
> +       struct {
> +               __u8  type; /* enum rseq_op_type */
> +               __u8  reserved[7];
> +       };
> +};
> +
> +/*
> + * struct rseq_op_reset - Reset one word to a value on return to user space
> + * @node:      Operation list node.
> + * @src:       Address of the source word, or 0 to reset @dst to zero.

Is "or 0 to reset" part implemented in the series?

It would be useful to see an op that contains a const that is written,
rather than an address. Address invovles additional indirection +
copy_from_user.

And the contract for concurrent changes of the value pointed by src
from user-space are not documented (atomicity?), w/o that having the
address is not very useful.


> + * @dst:       Address of the destination word.
> + * @len:       Word length in bytes. Must be 4 or 8 (8 is 64-bit only).
> + */
> +struct rseq_op_reset {
> +       struct rseq_op_node     node;
> +       __u64                   src;
> +       __u64                   dst;
> +       __u32                   len;
> +};
> +
> +/*
> + * struct rseq_op_reset_with_stride - Reset one word in a strided array
> + * @node:      Operation list node.
> + * @src:       Address of the source word, or 0 to reset the slot to zero.
> + * @dst:       Base address of the strided destination array.
> + * @dst_stride:        Stride in bytes between consecutive array slots.
> + * @len:       Word length in bytes. Must be 4 or 8 (8 is 64-bit only).
> + *
> + * The destination slot is @dst + @dst_stride * index, where index is the
> + * current CPU ID or MM CID depending on the operation type.
> + */
> +struct rseq_op_reset_with_stride {
> +       struct rseq_op_node     node;
> +       __u64                   src;
> +       __u64                   dst;
> +       __u64                   dst_stride;
> +       __u32                   len;
> +};
> +
>  /*
>   * The original size and alignment of the allocation for struct rseq is
>   * 32 bytes.
> @@ -191,15 +273,21 @@ struct rseq {
>         struct rseq_slice_ctrl slice_ctrl;
>
>         /*
> -        * Before rseq became extensible, its original size was 32 bytes even
> -        * though the active rseq area was only 20 bytes.
> -        * Exposing a 32 bytes feature size would make life needlessly painful
> -        * for userspace. Therefore, add a reserved byte after byte 32
> -        * to bump the rseq feature size from 32 to 33.
> -        * The next field to be added to the rseq area will be larger
> -        * than one byte, and will replace this reserved byte.
> +        * Sentinel of the circular doubly-linked list of rseq operations
> +        * registered via prctl(PR_RSEQ_OP, ...). Fully owned and maintained by
> +        * the kernel: it is initialized to point to itself on registration and
> +        * user space must never read or write it directly.
> +        *
> +        * The kernel only use next and prev from rseq_op_list.  The rest of the
> +        * bytes are reserved for later usage and should be zeroed.
>          */

Do we really need the union and the op_used/reserved? Isn't it easier
to say that everything needs to be 0'ed? What would userspace do with
op_used? It's not possible to skip initialization of these fields when
using both memset, struct initialization syntax, and relying on 0 init
of global data.

> -       __u8 __reserved;
> +       union {
> +               struct rseq_op_node rseq_op_list;
> +               struct {
> +                       __u64   op_used[2];
> +                       __u64   reserved;
> +               };
> +       };
>
>         /*
>          * Flexible array member at end of structure, after last feature field.
> --
> 2.54.0
>
