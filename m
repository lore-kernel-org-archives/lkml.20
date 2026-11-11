Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.230.115
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794378254;
	b=bBGgN6SCa4w0fQYrwUjiEgMwjBVBbOA8Oy6+6wSc1WjAM4+vuLjI5vjLXWnqdIxLj9zB
	 89SHww3aiefBEzOEI+bXL6pXOPME3syuEQKBHHe+iBIuxSN6NlT/L11d4dRO/HL3Sr/an
	 7MTKCjyYqk5wwE5bEJPtc7TCjdtlwfYMRPlnhlmGapTv2BDd23pGdqdm2UZQzwuoxuorZ
	 8qlRnbs8aM90fWb2PGyPah1B/Kwd7H1LR3zYteUS27Y0NrZMs/J0K3XA2AdY5RwtPV7iA
	 7FliJNlTexXTSw07bpt4rT+DMLAM0HnoEwm+MNvs+cZ+FcZCXcEucwTBxk1mpB4cYRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794378254;
	h=DMARC-Filter:DKIM-Signature:Date:In-Reply-To:Content-Type:To:Cc:
	 User-Agent:From:Subject:Message-Id:Content-Transfer-Encoding:
	 Mime-Version:X-Original-From:References:X-Lms-Return-Path;
	bh=mKF0n9OrBcr3ch6GDHkzJ5g03plplWf6k4SwddYKcSU=;
	b=vBi5CrdKe5Ux+gUNXF/1gOe6d2joVdvmJQlFEsa2FaM706nv2nOQK512qnQnRV/Vk2G1
	 I4TazHySi0dDzFLUKL+WhCHpXoPScujXhFrhoR0MUBDX032eNQpEdgJhP/hDKq9Y28Kwy
	 EqGfbivHkApYT5v4SqgWEI4gEYqKNczTFfUkkAN6gHrr1oGiFPDFbXutJjW2a7ASEOFZ0
	 6+RrXSx9zaS1/GyyZY42vUNtigLzFw/8sdreKFU82oWJIGMM8dboirh9ALWsiQ2kvDOsm
	 ow6FXmJ+jQ+9lghn/zmF8oHPr+Qt+dU650U94nhrWiTDO+dawp8XMKJjqzmnZG5W5Ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=By8+tB5d;
	arc=none smtp.remote-ip=209.127.230.115
Received: from va-1-115.ptr.blmpb.com (va-1-115.ptr.blmpb.com [209.127.230.115])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4337606A320
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 06:24:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4337606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=By8+tB5d
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1794378247; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=mKF0n9OrBcr3ch6GDHkzJ5g03plplWf6k4SwddYKcSU=;
 b=By8+tB5dfg7dIivPXMOTiXu2b+6B33ETipYe+IsXzdo3rawVnO6nxE0K+o2FseHUkiapru
 uD28vsjn7JzJa8q2nbHM6GIyQdCsiHoWU2GN3SpP8oZuQOZG9MdVY1BEfTuAMQFyDqZRN/
 nNGs+stI5IHF1mXQFYCMSdl1FsW769nvRiSAaVYZ8s04fkkRp0I+9PwdcZHtIgtIazJ/XQ
 JkLEvGGpQ/ozMmIPnEcxExKqCD4x3uLodZqWgDlPoCuoaafbd9g4wfT7ZXuvR4LpiymPF4
 s+3pP0qXAe2gZaEINho9UwKaSuuIOI5giXJjX/2LFfsaoQPpXkFLsI8OYxOgEA==
Date: Wed, 11 Nov 2026 14:23:49 +0800
In-Reply-To: <CAP-5=fUf=MD72=wuSxem+j6S11J2SvOaxOEb+H+ifLV=Y2p03A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
To: "Ian Rogers" <irogers@google.com>
Cc: <linux-perf-users@vger.kernel.org>, <linux-kernel@vger.kernel.org>, 
	<linux-riscv@vger.kernel.org>, <peterz@infradead.org>, 
	<mingo@redhat.com>, <acme@kernel.org>, <namhyung@kernel.org>
User-Agent: Mozilla Thunderbird
From: "Rui Qi" <qirui.001@bytedance.com>
Subject: Re: [PATCH] perf parse-events: default data breakpoints to any size on RISC-V
Message-Id: <89c6a757-8824-4559-b2c0-2cd41c3e45f1@bytedance.com>
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Original-From: Rui Qi <qirui.001@bytedance.com>
References: <20261109120320.75053-2-qirui.001@bytedance.com> <CAP-5=fUf=MD72=wuSxem+j6S11J2SvOaxOEb+H+ifLV=Y2p03A@mail.gmail.com>
X-Lms-Return-Path: <lba+26af40a05+dbd47b+vger.kernel.org+qirui.001@bytedance.com>

On 11/10/26 5:58 AM, Ian Rogers wrote:
> On Mon, Nov 9, 2026 at 4:06=E2=80=AFAM Rui Qi <qirui.001@bytedance.com> w=
rote:
>>
>> When the length of a data breakpoint is not specified on the command
>> line, perf defaults it to HW_BREAKPOINT_LEN_4:
>>
>>   $ perf record -e mem:0x30020:w ./prog
>>
>> That assumes the length describes a byte range that is compared
>> against the address of the access, which is how the x86 debug
>> registers and most other architectures work.
>>
>> RISC-V debug triggers behave differently.  An Sdtrig mcontrol6
>> trigger encodes the width of the memory access it should match, and
>> it only fires for accesses of exactly that width.  Watching an 8-byte
>> variable with the implicit 4-byte length therefore never triggers:
>> the perf event is created and enabled, but no event is ever
>> delivered:
>>
>>   $ perf stat -e mem:0x30020:w ./prog          # 8-byte stores
>>   0       mem:0x30020:w
>>   $ perf stat -e mem:0x30020/8:w ./prog
>>   10      mem:0x30020:w
>>
>> The failure is silent and easily mistaken for a broken hardware
>> breakpoint implementation.  Tracing hw_breakpoint_exceptions_notify()
>> while the event is active confirms the trigger never fires.
>>
>> Zero is a valid length for RISC-V data breakpoints: the kernel
>> encodes it as size 0, which means "match any size".  That is what a
>> user leaving out the length asks for, so use it as the default on
>> RISC-V and keep the existing 4-byte default elsewhere.
>>
>> Tested on a riscv64 kernel with hardware breakpoint support.  With the
>> default length, watching an 8-byte and a 4-byte variable both count
>> 10 stores, while explicit lengths keep their exact-width behaviour:
>> /8 only matches the 8-byte access and /4 only the 4-byte one.
>>
>> Signed-off-by: Rui Qi <qirui.001@bytedance.com>
>=20
> The change makes sense to me, and I may have been the last person to
> tweak how this parsing runs. Could you address at least the test
> failure issue with something like:
>=20
> - TEST_ASSERT_EVSEL("wrong bp_len", HW_BREAKPOINT_LEN_4 =3D=3D
> evsel->core.attr.bp_len, evsel);
> + TEST_ASSERT_EVSEL("wrong bp_len", default_data_breakpoint_len() =3D=3D
> evsel->core.attr.bp_len, evsel);
>=20
> and then I'll add my tag.
>=20
> Thanks,
> Ian

Hi Ian,

Thanks =E2=80=94 v2 posted as "[PATCH v2] perf parse-events: default data
breakpoints to any size on RISC-V".  It exports
default_data_breakpoint_len()
and switches the data-breakpoint assertions to it; the rw checker now takes
the expected length, so the explicit /4 cases still assert
HW_BREAKPOINT_LEN_4.

I ran 'perf test -v 5' on riscv64 with the patched tree: the bp_len
assertions pass.  The only failure left is the pre-existing "wrong config2"
in 5.3, which reproduces without my change as well.

Rui

>=20
>> ---
>>  tools/perf/util/parse-events.c | 23 ++++++++++++++++++++++-
>>  1 file changed, 22 insertions(+), 1 deletion(-)
>>
>> diff --git a/tools/perf/util/parse-events.c b/tools/perf/util/parse-even=
ts.c
>> index f3ba70d4f76b..b72e4b0da8a1 100644
>> --- a/tools/perf/util/parse-events.c
>> +++ b/tools/perf/util/parse-events.c
>> @@ -598,6 +598,27 @@ size_t default_breakpoint_len(void)
>>  #endif
>>  }
>>
>> +/*
>> + * Default length for data breakpoints when the user did not specify on=
e.
>> + *
>> + * Most architectures treat the length as a byte range that is compared
>> + * against the address of the access, so 4 bytes is a reasonable defaul=
t
>> + * that matches most accesses.  RISC-V debug triggers (Sdtrig mcontrol6=
)
>> + * encode the width of the access in the trigger instead, and a trigger
>> + * only fires when the access has exactly that width.  This holds for
>> + * both RV32 and RV64.  With a fixed default, an access of a different
>> + * width silently never matches, so pass 0 on RISC-V, which the kernel
>> + * translates to "match any size".
>> + */
>> +static size_t default_data_breakpoint_len(void)
>> +{
>> +#if defined(__riscv)
>> +       return 0;
>> +#else
>> +       return HW_BREAKPOINT_LEN_4;
>> +#endif
>> +}
>> +
>>  static int
>>  parse_breakpoint_type(const char *type, struct perf_event_attr *attr)
>>  {
>> @@ -658,7 +679,7 @@ int parse_events_add_breakpoint(struct parse_events_=
state *parse_state,
>>                 if (attr.bp_type =3D=3D HW_BREAKPOINT_X)
>>                         len =3D default_breakpoint_len();
>>                 else
>> -                       len =3D HW_BREAKPOINT_LEN_4;
>> +                       len =3D default_data_breakpoint_len();
>>         }
>>
>>         attr.bp_len =3D len;
>> --
>> 2.52.0
>>
