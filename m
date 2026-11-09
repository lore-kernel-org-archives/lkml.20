Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794254539;
	b=AkaXdeb0N3nR5lef7NPiMhHUvoFZZFT1ZA9xQ4znID8z4MNo85soOWtkzBZoO83kMDzj
	 vvAd4wS9Him/v4pB1zdkB/BQLDPAa1Eke9q7J9fjRb6vxTMZ0Loy458CxwasLbYUumN9D
	 A+z8g6bv0NGtGeqV5G2DU6yXF0bf8u6zsI8TFuLlhqi03sz2n6jv2CECYzjQKDl28RLjH
	 h8QazJogaSGButpEO7MHZGS2KXbL71r6WnJeHtPqSioPtX/xVn7fSP0DFKfBOSC5kiV3I
	 MD9v5Mq8f11OPdRyW6Uy65Ej3tVJojM3fwspLBweZD8YVnhuvWdPZYRJMikhw2uqERw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794254539;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:CC:Subject:User-Agent:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=N6du0A0pfE7SOqnYy6d2IHFtRfcrlpzDplqzOqawfFs=;
	b=Lj+qdJgx5rlEL9+DQLeEEqUDizPjZHrHnvRN0isbmnuB/iotsuTrmhld1E63bAdHvcoI
	 Qd4gvJUOs/JtiT/FdV0SGAtJVCRqCj6fvWkvB2bEnrm71bIu2yON6L6d7SCdTh70jsDmZ
	 2QRBrTQrwSGIU88/XBgF/8zYDNJrjKhJ5J2nalgGv3XKQjRLnS2QOZ58f3AASn19Or2H9
	 nc0S0LBHEx//5Gv20qTXaxcYoWRDhMIH7TtFjXR4BMjTHwSj+/YfjXT7nYj1nriijwfr0
	 ur7axfZ/6qyRsOZF0L3icJIC8zt9Z8sawD/ELyknwd5Q1sfXF57TZrCchgPI0DnAEzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JVpiQ8lx;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E90E606A326
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 20:02:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E90E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JVpiQ8lx
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-36fc0a3fe93so2517842eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 12:02:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794254538; x=1794859338; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=N6du0A0pfE7SOqnYy6d2IHFtRfcrlpzDplqzOqawfFs=;
        b=JVpiQ8lx/oHOpOlYGdEpYpakrJ7qCgz4EtJUk8uROsg7VRGaflDJirTO2SFmvVECo5
         Pi1cBB3UChzmbYA5s++IFyosJvBduUCQsdNKkU9Q80ygD/vFgDJI3kY9OSzmrTjXI9YU
         6zGBAHOMcpKE0DvHFPwA/NP5BXHc0/K9LJK8yrTX8MlxzZrU20dufSg/cetSyv8i3gvU
         32n9bq79IQ7Y6pzaf0HmKquiHhseHvWR7Q58QF5PJaiv/L1eijzzA8D6OUKCxbM8gzim
         vuWVqR1BtYsdvlKinPc5KQEaBani2WxTA7vdn07ugk/anMOmCsShciiyPs8CXCqizYv8
         20bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794254538; x=1794859338;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N6du0A0pfE7SOqnYy6d2IHFtRfcrlpzDplqzOqawfFs=;
        b=ilmgc7pOwqlsL593rUgChxHdk9SNJs15zxf7YiRf2L1D3DMMDV4PIN5J+Bq0xpR1s1
         0hI5jjy4XSKdYtQWO23g6Jc3llNNSifAeZ1uuaomanboAI3mGT9X5VoKLaLMYU4Gz+LN
         7Rg1jGidml6nk/Dlj/E90pPUGkCxVl9lgLL53rL7YNZyWkoChVW8Uh2v5Rh3J820B2h0
         BLvIqYpDZ47OZ8KajWCQutrEDQ7gOABQWK9+jeq2scDMrkDkH84iCIzNxezn8Vk4fdIB
         ZE1dXLIQyELIeKKkH5hxmbzuEF1GfETKxEph1Q6sRxsABbLrgJF0mpwIYhYELxi/alUt
         hBNA==
X-Forwarded-Encrypted: i=1; AL+hErE9jjeEagkVK01o5kPYaF15cjT09EFCzIy7ooT64k/yH5fmd5kYg+0DiZAlPCjI9ZkRIoNFhNMYyp+uBjo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/m5WmTcDMJ6foJ5m39HF+bdbYMs4LGqS6D3DnAT6lzh7Iizpep
	/whRn7y05SUrW2CGQwLcJt91Ng6zcxiwBTT2CIJLAt97iJ3psz1F7nO6
X-Gm-Gg: AYBFou2QSDbbNZOQJWp512zvWJzPmAKfl2EvhbsyILksBTe4E5p/9rmjDuZSHieOS+/
	F1jiLUSiiajsfQiKERFP+IojDTCAolcTFElx1q+6Q6+x+7W9UU8fCIzOE1aswkqsq/eWjbWhbR+
	MSSslYFJ+fiG1fx9XaLXDPVS8pKfMOvqFVrSUsyOxa21blh1E/eBhKHi4T6Xn6lKu/+Ub4IrsHs
	D8t9s5Aqz5PqchLhmpLd9h71EhfEXpotH7kWI07hoSiHnu66uzmjicQlQZFGE9gtJbcOI+aoFws
	SVcLzQwvez+GAWtWxumkyz7nCO+uNXjuxLfiowZfxxKfVCmWtXOCnYhbpTphFSHcJQUM/yw0mdv
	HmkwUb6R5ZCX9yzbi80l2vxcYX8/vPkHsE5Mf1EXk+P2Jx0mm03NcpuQ1GUaHi2UBcv1dAe4698
	a8/7q619BByWtUPXJWjUuTln+7+UYuHAPI8qy5svSaCX9GpvUQmXGf7CrFQNUVPE7DEfVN/Wnu8
	Oo3i9BOVBGIxbAdCFxwFnOh34Z76XuyZgynw1XfkQCLYCIfcelf25zQj+jrFbBEXhskBVHEBXHK
	LlxUbSSOt1oK2f7ss5mWvYU02bS18j6HpoUF9t0rK/ESDA==
X-Received: by 2002:a05:7301:488c:b0:36a:3453:a356 with SMTP id 5a478bee46e88-3751fc3a379mr436289eec.36.1794254538058;
        Mon, 09 Nov 2026 12:02:18 -0800 (PST)
Received: from ehlo.thunderbird.net ([2804:2bf0:60e7:ae00:175b:6568:be30:fd38])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfe07dsm556671eec.20.2026.11.09.12.02.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 12:02:17 -0800 (PST)
Date: Mon, 09 Nov 2026 17:02:11 -0300
From: Arnaldo Melo <arnaldo.melo@gmail.com>
To: linux-perf-users@vger.kernel.org, Ian Rogers <irogers@google.com>,
 Samuel Wu <wusamuel@google.com>
CC: Lalit Maganti <lalitmaganti@gmail.com>, acme@kernel.org, namhyung@kernel.org,
 james.clark@linaro.org, adrian.hunter@intel.com,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] perf python: Accept events larger than union perf_event
User-Agent: Thunderbird for Android
In-Reply-To: <CAP-5=fX6aqHuaV5c+Kfk5iY7SWgXKu+kWX+ReQ4agqkHg89tUA@mail.gmail.com>
References: <20261018074528.974953-1-lalitmaganti@gmail.com> <CAG2KctqPvou3A_EGiov9yZJrCWMmoEX-k4-Or-RGj_Cxdtc7Fg@mail.gmail.com> <CAP-5=fX6aqHuaV5c+Kfk5iY7SWgXKu+kWX+ReQ4agqkHg89tUA@mail.gmail.com>
Message-ID: <BCA0C66E-7AF5-4368-AAE3-FB96B09712A6@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



On November 9, 2026 3:27:56 PM GMT-03:00, Ian Rogers <irogers@google=2Ecom=
> wrote:
>On Mon, Nov 9, 2026 at 9:58=E2=80=AFAM Samuel Wu <wusamuel@google=2Ecom> =
wrote:
>>
>> On Sun, Oct 18, 2026 at 12:45=E2=80=AFAM Lalit Maganti <lalitmaganti@gm=
ail=2Ecom> wrote:
>> >
>> > Samples recorded with --call-graph dwarf carry a copy of the user sta=
ck
>> > and are larger than union perf_event, so session=2Eprocess_events()
>> > fails on the first one:
>> >
>> >   $ perf record --call-graph dwarf -- =2E/workload
>> >   $ python3 tools/perf/python/stackcollapse=2Epy
>> >   =2E=2E=2E
>> >   TypeError: Unexpected event size: 4168 < 8424
>> >
>> > This makes all the standalone scripts unusable on such recordings=2E
>> >
>> > pyrf_event__new() rejects events larger than union perf_event, which
>> > guarded the copy into the union that pyrf_event used to embed=2E Sinc=
e
>> > commit 2c672ffdad4b ("perf python: Lazily copy events and samples fro=
m
>> > process_events") the event is borrowed, or copied to a buffer of
>> > header=2Esize bytes when a callback keeps it, so nothing depends on t=
he
>> > event fitting in the union any more=2E Remove the check=2E
>> >
>> > With this, stackcollapse=2Epy and flamegraph=2Epy process a DWARF rec=
ording
>> > of a two-thread workload, with the same per-symbol sample counts as
>> > perf script, also when the callback keeps the events after returning=
=2E
>> >
>> > Assisted-by: LLM
>> > Signed-off-by: Lalit Maganti <lalitmaganti@gmail=2Ecom>
>
>Probably worth having:
>
>Fixes: 2c672ffdad4b ("perf python: Lazily copy events and samples from
>process_events")
>
>Reviewed-by: Ian Rogers <irogers@google=2Ecom>


I'll pick it for v7=2E4,

Thanks,

- Arnaldo=20
>
>Thanks,
>Ian
>
>> > ---
>> >  tools/perf/util/python=2Ec | 5 -----
>> >  1 file changed, 5 deletions(-)
>> >
>> > diff --git a/tools/perf/util/python=2Ec b/tools/perf/util/python=2Ec
>> > index 60dbe2dad5eb=2E=2E8b4b2f3d0926 100644
>> > --- a/tools/perf/util/python=2Ec
>> > +++ b/tools/perf/util/python=2Ec
>> > @@ -1792,11 +1792,6 @@ static PyObject *pyrf_event__new(const union p=
erf_event *event, struct evsel *ev
>> >                                     event->header=2Esize, event->head=
er=2Etype);
>> >         }
>> >
>> > -       if (event->header=2Esize > sizeof(union perf_event)) {
>> > -               return PyErr_Format(PyExc_TypeError, "Unexpected even=
t size: %zu < %u",
>> > -                                   sizeof(union perf_event), event->=
header=2Esize);
>> > -       }
>> > -
>> >         pevent =3D PyObject_New(struct pyrf_event, pyrf_event__type[e=
vent->header=2Etype]);
>> >         if (pevent =3D=3D NULL)
>> >                 return PyErr_NoMemory();
>> >
>> > base-commit: 1c90f0a3c8a1c4e38f9edd97af9e20848805a7fb
>> > --
>> > 2=2E56=2E0
>> >
>>
>> Reviewed-by: Samuel Wu <wusamuel@google=2Ecom>
>

- Arnaldo 
