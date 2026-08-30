Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D54281A6835
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 00:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788048353; cv=pass; b=Mwqx2PGeMV7xXq2Im029DuU6tE+O1f0TamkpwHR9PsWJFBQaEcS0yDy90thUHUIHM0rga2Jiu9q4ZeIM7BrrPtT2xvTCrr0OQvJoi3z8DUZwWTsmr/y4SgDZrKMtg/qw0rOR9R4eGaicGog7IRW8tKWVzPa7kHHPv+XxSO33+8Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788048353; c=relaxed/simple;
	bh=OdTWre4/E0GzO36yssBeAmGKtS1r+8euXeCxROlaL4g=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ci3EAw9sboHfotLqMJVA5O9lznMbuEj19cwIWJpE7k763ZwSSQUjEOhC+4NCW2G6Ji7d4L85Tk7rfEkpna4BlhSzohpF4K79GVtwb0d9YSmcm3e+j5LeP2IwC1IK7k9rCQlZSunaW2Q3BXr1qwjQiaczKqGeuZPuD1JjJdiarOk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FntZFPkg; arc=pass smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FntZFPkg"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-92e57a753f9so230704285a.2
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 17:05:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788048349; cv=none;
        d=google.com; s=arc-20260327;
        b=ehSaJCCMPINJuQd/yiB4FYiMvVXAfe/Pe2sUi8SUn7xUc2WKgHKkbXaSQBLVDA4Pbd
         xqDE9NWe/ZnedtTwS/+ItnboS4AbYBS4KNrsvP5Z2sNPDaMhzexQ+0bmkgNZPrPyM8BR
         6YwVGNWYMxu7BU+pGeWHYcaYojBX+VcodO3dLKKQ940vgPsBDYMeJY/O3zCwMJpLrATv
         Af+HbH/9ZV/xymyLldQZrP1aJTYo9X0Wy0cYMxA6tLySudG1qWhTLRBcNFNFrSc110rb
         g8IrmL7PNEuxrN5kPz+PZmOBTcqaY1csZBMOUVgMnYniU1C8LQJ9Gb2BqIUhEhWAsqie
         uOXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=OVPtev+UPa7dvRpZFUPuPS+p0V4Z4HKOiUpL+88GmnU=;
        fh=5PGwoBjUpeSDmbz5jP97vFpC2YBSXW6gdqJ238z8cWw=;
        b=ExSeV+ZObdg2xzgmjmWK8MB6ZhbpYRW3A8rlYUbZin2Bl4l60w4jAq1/gv3z0UPc+2
         /hpOhcncuXJPnUOUlR/gT8a1WIDlajyfSV7vEDN1UsfXriJRli0+Yj3wNYe3CmeSdWbZ
         QNveb68O+q9zkb3ZW0WruawPCG5Z3KphXii1VhaAC5MzOvQTvER+NiWNPqll6vqGleio
         hPUaBbPIGjMHckAULlDPU8H2Zo6ZA356bN2kubpKdWEWpKewhMSAPxhXtLOu3T4abHDh
         L6Cq3kk0ofjxh3dINqx3wTJGFW4/URHtJ8B7qiQafvS2l4+LRmpipqmL0UVVv2Ig6+jX
         9LvA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788048349; x=1788653149; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OVPtev+UPa7dvRpZFUPuPS+p0V4Z4HKOiUpL+88GmnU=;
        b=FntZFPkgEkRUwbbHbmEKsdoQVaEcHbWlapP9tERIlbZ2roeyhjIMPb9q6TBF+nxQ0t
         SqmTsOczcuYsdNz0X1uu3BgJwgw9eiSUIwjS4gD7ledhNglZMn6tg9ccqIp1gjLMMOfH
         jlRe6SaGmpIOLDE6TCzPrN8SCI6VopvIGb5Yr2RmSWvojdqUcH1KxTYe5OQ9yUePrwLI
         WaggqDDoxHnXSA+Y5/bEe8mjJqLAY2I7YnAgxlTEshX0ViVAZBFFD1eGFDb4NsfnItuI
         +MuWPKZnQ1a+ApuSYZDisRiu1wFqLFpEr6PQcNfL9PAZjgpR6bg7aTumg92KkeqjTKFj
         5vOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788048349; x=1788653149;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OVPtev+UPa7dvRpZFUPuPS+p0V4Z4HKOiUpL+88GmnU=;
        b=oDHia+wiTcXL1y6ZwlrMiw8MhiFIT6+vIbcRZLOHj3chu6XCpLE0/7WpcAKSQg4BIj
         jNPE4uZhVrn8F2cOSw5lrvQimoUz41+u3xIGoov7yjtGqzj4hgCPUt5AOj4Z4ckwYrv7
         uKm589TVk6EB6+L6H/Zmku1/Z5qXCcL3/mjYOJ5v6xiiAaTxyw0w/I7qMtAnlVZJp7VU
         kmzvl+M2hdWDI2KToWp3365mGWvNpWlogz0IvturrbgT0Z+uQ99aJBqp8cyFDdGm+ct+
         NNV1zZ3fxHhsUqmTnfz+SunkDJz6uk/uEzh6OzOkyycL/bmVWn+RGua+G7rC9geNikaX
         Hbwg==
X-Forwarded-Encrypted: i=1; AHgh+RqgtBDJUL4DfL8ufq/bBb03Mn27hvQ53zxIdPz/8sHmzotutSrc4U+yqgKS02Kp2pCV4XxGgDWf9dTqxVM=@vger.kernel.org
X-Gm-Message-State: AFuF++mMblg+VyZFW+jw5ixEjhG95aJ4Nk515z2ciiZIL7ehGiUrK/dl
	LYxVZoRgFrszHokh6mxU5zt585MEp79Jove2RgJoeeAJW3W2VJ17IpDEsfWFcVktNu+VwQcGpBR
	qJOrQ9gEnLtiQ1MEakJa96D/uCe90oU4dz9cUBZkJ
X-Gm-Gg: AR+sD12LPe8LRXh1eoMQCUvM1IbOjmxp3Xf5EgDUKKQaomiVr4HXWdR6rBDBi5lf38z
	bNu0Gcy3UUp+66q0WIw9xVhug4BKFbma/pzXPRz07zb7WwzU7JwyGXLvCZRcGSCyaANmOGr8Ed6
	rZhZmBauMF2cM/NxEI93MP4pB3lCmPbxMo+QIssRAe51fpQ/ST+3LJj3hT4A6lHPaClxA8zf3MB
	8u4gYELEJBPquwWjcRvzf1ozR4SUQtDqxkVn3r5BgXOAQQounG3/H1l5McGn3DG3RVNOVg8g9TW
	W7bDZNbNbJolrlHePPflN2snh7Cjv59E1OaSkI+cJTRaL7eAt70VyhfsWrPZb+YX4XK1NBI2RFN
	+mFaQRlWTtp1oWA==
X-Received: by 2002:a05:620a:2b8f:b0:930:f35d:41ba with SMTP id
 af79cd13be357-939139565fbmr2030756285a.36.1788048348431; Sat, 29 Aug 2026
 17:05:48 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 29 Aug 2026 17:05:47 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 29 Aug 2026 17:05:47 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <CAEvNRgHAwAJee6_ra9-zioDh_BqHM9Lbu+TGXxWHbG7za=g5Aw@mail.gmail.com>
References: <20260823-memory-failure-mf-delayed-fix-v5-0-d97a5703e45a@google.com>
 <20260823-memory-failure-mf-delayed-fix-v5-5-d97a5703e45a@google.com>
 <8a99f753-0713-4194-8eb5-90da0724e647@kernel.org> <ao8pCI3AaUssIO8S@google.com>
 <CAEvNRgHAwAJee6_ra9-zioDh_BqHM9Lbu+TGXxWHbG7za=g5Aw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sat, 29 Aug 2026 17:05:47 -0700
X-Gm-Features: AcwNN1UOqbFFjDrkvuROHBeY-FoM3Gy-1FuQx69V_3hC_6MdAax2NDuhHQBC0j4
Message-ID: <CAEvNRgECQqS8xXu61btmESZj_eWWjuEt-Yq0vRFrxCObvfnJVQ@mail.gmail.com>
Subject: Re: [PATCH v5 5/5] mm: selftests: Add shmem into memory failure test
To: Lisa Wang <wyihan@google.com>, "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Miaohe Lin <linmiaohe@huawei.com>, Naoya Horiguchi <nao.horiguchi@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Hugh Dickins <hughd@google.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Andi Kleen <andi@firstfloor.org>, 
	Hidehiro Kawai <hidehiro.kawai.ez@hitachi.com>, Rik van Riel <riel@redhat.com>, 
	Yu Zhang <yu.c.zhang@linux.intel.com>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, rientjes@google.com, seanjc@google.com, 
	vannapurve@google.com, michael.roth@amd.com, jiaqiyan@google.com, 
	tabba@google.com, dave.hansen@linux.intel.com, 
	Isaku Yamahata <isaku.yamahata@intel.com>, Xiaoyao Li <xiaoyao.li@intel.com>
Content-Type: text/plain; charset="UTF-8"

Ackerley Tng <ackerleytng@google.com> writes:

> Lisa Wang <wyihan@google.com> writes:
>
>> On Mon, Aug 24, 2026 at 03:00:47PM +0200, David Hildenbrand (Arm) wrote:
>>> > +++ b/tools/testing/selftests/mm/memory-failure.c
>>> > @@ -20,6 +20,10 @@
>>> >
>>> >  #include "vm_util.h"
>>> >
>>> > +#ifndef fallthrough
>>> > +# define fallthrough __attribute__((__fallthrough__))
>>> > +#endif
>>>
>>> This doesn't belong into this test.
>>>
>>> rseq/rseq.c selftest already uses it.
>>>
>>> I think tools/testing/include/ already provides it.
>>>
>>> Maybe
>>>
>>> 	#include <linux/compiler.h>
>>>
>>> does the trick?
>>
>> Hi David,
>> Thank you for replying.
>> Would it be better to change it to /* FALLTHROUGH */
>> like the rest of the mm selftests?
>>
>> If we prefer to include <linux/compiler.h>, we can
>> certainly do that, but we would also need to update
>> the Makefile and fix a redefinition in pkey-helpers.h.
>>
>> --- a/tools/testing/selftests/mm/Makefile
>> +++ b/tools/testing/selftests/mm/Makefile
>> @@ -37,7 +37,7 @@ endif
>>  # LDLIBS.
>>  MAKEFLAGS += --no-builtin-rules
>>
>> -CFLAGS = -Wall -O2 -I $(top_srcdir) $(EXTRA_CFLAGS) $(KHDR_INCLUDES) $(TOOLS_INCLUDES)
>> +CFLAGS = -Wall -O2 -I $(top_srcdir) $(EXTRA_CFLAGS) $(KHDR_INCLUDES) $(TOOLS_INCLUDES) -I$(top_srcdir)/tools/include
>>  CFLAGS += -Wunreachable-code
>>  LDLIBS = -lrt -lpthread -lm
>>
>> --- a/tools/testing/selftests/mm/pkey-helpers.h
>> +++ b/tools/testing/selftests/mm/pkey-helpers.h
>> @@ -22,7 +22,7 @@
>>  typedef __u8   u8;
>>  typedef __u16  u16;
>>  typedef __u32  u32;
>> -typedef __u64  u64;
>> +// typedef __u64       u64;
>
> Removing this u64 typedef seems to be unrelated, the layers of includes
> probably has some weirdness that needs to be ironed out.
>
> If the weirdness is not too complex to iron out to be in time for 7.4, I
> think we can iron that out, if not perhaps using /* FALLTHROUGH */ is
> fine, to be aligned with the other mm selftests.
>

Lisa did some more investigation, and we discussed too. Here's my
understanding:

TOOLS_INCLUDES in the Makefile points to tools/include/uapi, which provides
underscored types like __u64 to avoid polluting userspace symbol names. That
makes sense since tools/include/uapi is generally copied from usr/include/
that is generated at build time, and usr/include/ is used by userspace
programs in general.

selftests are a special case of userspace programs, and since we want selftests
to look similar to the kernel, we want to use u64 instead of __u64. While
the kernel uses include/linux/types.h, the tools subsystem provides its own
userspace compatibility header at tools/include/linux/types.h defining u64.

Hence:

1. tools/include/uapi/linux/types.h provides __u64.
2. tools/include/linux/types.h provides u64.

Adding -I$(top_srcdir)/tools/include switches from 1 to 2, causing
definition conflicts in the mm selftests and more warnings.


Since adding the tools/include path to use
tools/include/linux/compiler.h breaks existing definitions, my vote is
to use the comment-style fallthrough like the other mm selftests and
clean up in a separate patch series.

>>
>>
>> Lisa
