Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793852558;
	b=qypYkP4Q0Q8wZhmgDzSZYxVVD4wZCH7lAkcEvO3d6fSOP/PfnpD9QZjcDT2T6YMG0bOR
	 fDHy3CFSKTczTQyoM6bc5N9awHfuaDHL6IKcb5U7Zayc7uKXCXYK3syYb72m9cw0G/gQ4
	 +LZ6qLzr94aUEoRwjwBIxezmA52k9v9TUB5EaHtFesFgx42thD+LDKDjYzCVqEhQeZQ+F
	 WNT5b3yS520jZBeVuzB6pP0PQqOT062AzD7gZEtvKAYuZFFmX/GCOr6PukeicIcJAECeh
	 gH3iz8lkQhWnLzs66/PWtmdT+JJ4ty2b7/KmfEPdG7zuXS333M+R0Y/sU//z7FF6uOQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793852558;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=rU/4KhKmMNOMVfPO4Ct4SOXNAKasoIJ7Z9nUaXuCxpE=;
	b=22Zjv7/UNnORrBTTr7zpRCKo1AqbVut4/to5tbILbwDqlBrl2wqoIDXfQdvneoy3SGnp
	 LtN0i7Avs4rvFdiEjGCy+O41YrsC7cpyQYSA9iHA4Fgks9c6zHQPBRPN/Lj+Jmf2HUkfw
	 PSvD4aSE8RT7RcGxCOP+1Vi5+18ujE26dembYk6Z9CdCT3dZRdKCjxPn7KJ+x1p9HVq9d
	 PdZN3UW+EQPCpLtXHT9Wju0EETGSf9A9IMiX7lWUcg1aWroiNw0XItESjMg/pdpKT7hTZ
	 4mMIpbeQM1wA5E9kddQxGeJ4jKsOdKAxJRQxsMzdc3IJatWgys7e1IT9y0eqRP23kuQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=h9p4QW59;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.179
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F78C606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 04:22:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F78C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=h9p4QW59
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-533202fe429so166761cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 20:22:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793852557; cv=none;
        d=google.com; s=arc-20260327;
        b=PaMGwbgO6emyVOvoxsyGeL1VmkA0HVtDsyFFeq9YXHMJ/xkUf0JPrOerD4tBGRIAcE
         /BGZOk8cD9Kyk1DPjI8UNavNAJ0EdXbUhkGoXWSVulldYkokNEKdEkkx2ecOwd1HBGvi
         ljmYgIioqH51sden2QjjG5oWcdUboDQKSdyHIbdl0jjoh1Ka36qDDO2ldlTnyTB0jXk6
         d9dGap9gvx84OlRsgRltGgtwTFMAd3J9JkR+8UPCtkkrZB6OZQsx1anfQP1+Ov3Ga9fE
         oujtzPcHg1GLRAzYTKZEhA/PXskM54yF/J9NxhhoTRrbbWn6skXwaogFl5L4hipkFPKp
         nwXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rU/4KhKmMNOMVfPO4Ct4SOXNAKasoIJ7Z9nUaXuCxpE=;
        fh=mE+YJ/I7hSC2KaoRPQci3IXAaoiFbPLtGEeAe+GFtAw=;
        b=cFNISG/c/oEtmF2bNeruT0dHnhHOeV3+5P9W70LfdkigNPqXuvc5gJyG0E3duzT6Yk
         7JifBB9VdruddYtNjriqjESRCSq4jx8EjdCpAAZmoVglxwtGlVbCb7AtOeVJwdss9ZK9
         bR5HA2zP7DN5yvKFF5DRabCMo0TVTNYc4Xa9UPe7xihGDxuXXNzHlA7/3k879JooLQ3R
         cb4ivYji9dXevd3EN2kAwxnzPZMpHaBc4QL4dupTbJnZK/CyAu8g29+J0ZzahtI8g2aq
         ZQ4Ld5pS2ZnMz7+4naldsZCQDVet3C50Ljs2TRJh6HNKZEwBLxlEeGiA/zs/vUGUYZys
         GXEg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793852557; x=1794457357; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rU/4KhKmMNOMVfPO4Ct4SOXNAKasoIJ7Z9nUaXuCxpE=;
        b=h9p4QW59kcNpNEWeWTZIPjYs++e6daaEyjCpJT6LCvBeW43x9D0etR1eAsEfV01csn
         PNllthAghliX1dy0d6/VkDm4pBGb2FNCS8VDpwNEx6TUiGKvYiDviCd7tw0xQrDxOXVo
         Jc+Kv/owAn1exLRGnpqRWiXtmOFgSDE9SWjUzHnWOXlIGxEomglp5CmrJXQ+i9EuB3MR
         MUi96B9pXIqylnHbXK4319xES9t4pQhw+v4Bmn2tBBLBMoWyEyktIxUrKqlEs59b8z5t
         N+fYrgQr0RG4m8n0l7w2tigG8rgUsX7vEOrrz1LuNFR8+dFH7i51xO+3fhtcZOzNGgD8
         dd/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793852557; x=1794457357;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rU/4KhKmMNOMVfPO4Ct4SOXNAKasoIJ7Z9nUaXuCxpE=;
        b=GUuBCbz/9+m6jNIo4Hr1u7C8hqWf/f5ojlrcx7cmGNr6tqUtVbAmkVcfajuv5M4voX
         AvVwUhz3WK2qb5L+xsxUc0BH+PsRH8Wvv0LP7dIfSHHJZdyi/rhkYN3N8n9b/muFZm0b
         hMRjhrGuEulBT7omUjnbpBBsO3Mub1EVD+oIHCeQoktBRRIaAuzs4kM3gk+ubRtJpoZq
         j2J1deVeIMLUi/JZk/RTrEiI9chIpa8mcObSBZA7y7lv/oLpthrxEWbknIQ30q/eh3sy
         L5VTjwR/nFzQrHNczXBCAwhJsumYUXYSxT2y1HvIFM6ryW3F9oQo4nLH2CPpN2GSm60W
         3ZHg==
X-Forwarded-Encrypted: i=1; AKwUvBzuWpuiGTbhOiYT5P5l1Yc/WFpX1SMCHW2wLAGTnIP2Bq5b6Rs1SvdAFfqby9bIyxQpJ5QOu6zIbi2FKsU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+0ht6JV+YVWzY//8hk4VBn1eSlXWBtUveLoLfadTDvnNs0BoAw
	VRBuVwOqZP4S1npHZ7X9eCZbUH00XnImC9xePzObWukfwKJKTL0v0YZsn8sMTEb4TnpfJW2glAO
	loyssVolaN4Wgpc0DXriJtUX/0ujmwBl+zNOsTaiZ
X-Gm-Gg: AYBFou0ICkZM3ws2a6vj0BuUNk/OpfUwi1ZXtKn/pUgzvhEKfy+N1NYoILkAn1CrBdg
	Av5Uvma9OVr1VnCq+eHEeNdF+aDGyOiOc7VL3hMU1gp+GO63VPuTXuD3LnZY4GeRdczP7W0oSQM
	eeUX4DauRXNIWZOpyb1cSXE3qjNZ4ipMDJKB8KczHbbkBhYi1ZKyXOAxevnqt8eNBJcnkO5plfq
	8RKGP+wTvF4J3zE8Cao1fVqYzIBgSgFLi009vLmQgHGVIW8NtT7WnvM1sqYc+A3osJNIMPuTjs2
	qP8BSfiaeUprcQpwXgnQonnXeWK7P+U2k0fTD4+qSY0wQ15XhLUPHR6LPGbBwVJfu2lw5wv2XkN
	p0ShD5XhDkK6MmEpKZC/a/hcZ2ejKy5v9x5MzZQ==
X-Received: by 2002:a05:622a:90a:b0:536:97c0:dcd0 with SMTP id
 d75a77b69052e-54cb0bbd967mr11728581cf.4.1793852556274; Wed, 04 Nov 2026
 20:22:36 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <202611050912.2cdf1ff5-lkp@intel.com>
In-Reply-To: <202611050912.2cdf1ff5-lkp@intel.com>
From: Ian Rogers <irogers@google.com>
Date: Wed, 4 Nov 2026 20:22:24 -0800
X-Gm-Features: AclHuK-N2V612YytHJhEuD7FLzc60lFV8mbdHb9a1ldBGi0Aa4UQbVv_1U8wafw
Message-ID: <CAP-5=fUk4Q3PxNiqwHtyM6XTt9LGZaTe9p7o9k2gL7f2LBRBHw@mail.gmail.com>
Subject: Re: [linus:master] [perf vendor events intel] 31efbec216: perf-stat-tests.UNC_IIO_NUM_TGT_MATCHED_REQ_OF_CPU.fail
To: kernel test robot <yi1.lai@intel.com>, "Taylor, Perry" <perry.taylor@intel.com>, 
	Thomas Falcon <thomas.falcon@intel.com>, Dapeng Mi <dapeng1.mi@linux.intel.com>, 
	Edward <edward.baker@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org, 
	Arnaldo Carvalho de Melo <acme@redhat.com>, linux-perf-users@vger.kernel.org, 
	Stephane Eranian <eranian@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 4, 2026 at 5:47=E2=80=AFPM kernel test robot <yi1.lai@intel.com=
> wrote:
>
>
>
> Hello,
>
> kernel test robot noticed "perf-stat-tests.UNC_IIO_NUM_TGT_MATCHED_REQ_OF=
_CPU.fail" on:
>
> commit: 31efbec2161d2d31b020b086958e41f35f070a38 ("perf vendor events int=
el: Update sapphirerapids events from 1.39 to 1.40") https://git.kernel.org=
/cgit/linux/kernel/git/torvalds/linux.git master
>
> [test failed on linux-next/master 7649ba73f9e7e1e04d0b46213e39c79ae09dd55=
c]
>
> in testcase: perf-stat-tests
> with following parameters:
>
>
> config: x86_64-rhel-9.4-bpf
> compiler: gcc-14
> test machine: 224 threads 2 sockets Intel(R) Xeon(R) Platinum 8480CTDX (S=
apphire Rapids) with 256G memory
>
> (please refer to attached dmesg/kmsg for entire log/backtrace)
>
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <yi1.lai@intel.com>
> | Closes: https://lore.kernel.org/oe-lkp/202611050912.2cdf1ff5-lkp@intel.=
com
>
>
> EventName: UNC_IIO_NUM_TGT_MATCHED_REQ_OF_CPU
> 2026-10-05 17:15:24 perf stat -e UNC_IIO_NUM_TGT_MATCHED_REQ_OF_CPU -a sl=
eep 0.1
> event syntax error: 'UNC_IIO_NUM_TGT_MATCHED_REQ_OF_CPU'
>                      \___ Bad event name
>
> Unable to find event on a PMU of 'UNC_IIO_NUM_TGT_MATCHED_REQ_OF_CPU'

Ok, this is an ugly issue. When we fixed the issue so that umasks of 0
weren't dropped, we added new umasks:
https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/comm=
it?id=3D31efbec2161d2d31b020b086958e41f35f070a38
```
...
@@ -1923,6 +1974,7 @@
         "PerPkg": "1",
         "PortMask": "0x0000",
         "PublicDescription": "UNC_IIO_NUM_TGT_MATCHED_REQ_OF_CPU",
+        "UMask": "0x7000000",
...
```
The umask calculation is odd:
https://github.com/intel/perfmon/blob/main/scripts/create_perf_json.py#L361
```
        # Combine the umask with the umask_ext. We don't know the
        # width of the umask as we concatenate the strings, removing
        # "0x"
        if umask_ext:
            self.umask =3D umask_ext + self.umask[2:] if self.umask else
umask_ext + "00"
```
For Sapphire Rapids the UMaskExt is:
https://github.com/intel/perfmon/blob/main/SPR/events/sapphirerapids_uncore=
_experimental.json#L17422
```
...
    {
      "Unit": "IIO",
      "EventCode": "0x8f",
      "UMask": "0x00",
      "PortMask": "0x0000",
      "FCMask": "0x00",
      "UMaskExt": "0x00070000",
      "EventName": "UNC_IIO_NUM_TGT_MATCHED_REQ_OF_CPU",
      "BriefDescription": "ITC address map 1",
      "PublicDescription": "UNC_IIO_NUM_TGT_MATCHED_REQ_OF_CPU",
      "Counter": "0,1,2,3",
      "ELLC": "0",
      "Filter": "na",
      "ExtSel": "0",
      "Deprecated": "0",
      "FILTER_VALUE": "0",
      "CounterType": "PGMABLE"
    },
...
```
So that's hex 7 followed by 4 zeros. In the generated perf json it is
hex 7 followed by 6 zeros as we concatenated the UMask's 00 to the
front.

> event syntax error: '..O_NUM_TGT_MATCHED_REQ_OF_CPU'
>                                   \___ value too big for format (umask), =
maximum is 255

This error indicates that the UMask for the IIO PMU only expects
values from 0 to 255.

So something is wrong in how we interpret the UMask and UMaskExt for
Sapphire Rapids' IIO. Could someone from Intel take a look? Is the
problem in the original perfmon event json, is there a different way
to encode the UMaskExt for the IIO on SPR or is the IIO PMU on SPR
constraining the umask too much?

Thanks,
Ian


> event syntax error: '..O_NUM_TGT_MATCHED_REQ_OF_CPU'
>                                   \___ value too big for format (umask), =
maximum is 255
>
> event syntax error: '..O_NUM_TGT_MATCHED_REQ_OF_CPU'
>                                   \___ value too big for format (umask), =
maximum is 255
>
> event syntax error: '..O_NUM_TGT_MATCHED_REQ_OF_CPU'
>                                   \___ value too big for format (umask), =
maximum is 255
>
> event syntax error: '..O_NUM_TGT_MATCHED_REQ_OF_CPU'
>                                   \___ value too big for format (umask), =
maximum is 255
>
> event syntax error: '..O_NUM_TGT_MATCHED_REQ_OF_CPU'
>                                   \___ value too big for format (umask), =
maximum is 255
>
> event syntax error: '..O_NUM_TGT_MATCHED_REQ_OF_CPU'
>                                   \___ value too big for format (umask), =
maximum is 255
>
> event syntax error: '..O_NUM_TGT_MATCHED_REQ_OF_CPU'
>                                   \___ value too big for format (umask), =
maximum is 255
>
> event syntax error: '..O_NUM_TGT_MATCHED_REQ_OF_CPU'
>                                   \___ value too big for format (umask), =
maximum is 255
>
> event syntax error: '..O_NUM_TGT_MATCHED_REQ_OF_CPU'
>                                   \___ value too big for format (umask), =
maximum is 255
> Run 'perf list' for a list of valid events
>
>  Usage: perf stat [<options>] [<command>]
>
>     -e, --event <event>   event selector. use 'perf list' to list availab=
le events
>
>
> The kernel config and materials to reproduce are available at:
> https://download.01.org/0day-ci/archive/20261105/202611050912.2cdf1ff5-lk=
p@intel.com
>
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>
>
