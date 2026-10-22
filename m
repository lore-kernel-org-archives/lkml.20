Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792684854;
	b=yW6lR0Y4EmyXPB8eyAJRgYBY0rsOqo8m4Tn/OKh5uXGiBQoCXvk9xWWusE6DPM9pRg3u
	 UjL7HZLgNIk8w6QSUsGMbDP7ExjMrrI2ZJygbTB/XXHvhwSIObQNkaF2SWPfVa+L3EOJr
	 VLCThgFKZkfP13pf0//yWF4fDFU0wiZ61A3Hb2bxj+OpqeJnr1GcSK3GRBZFJzYH00Htn
	 UdRVTWlMRESPMexbZUAStufiHct3C8e4QM48J4Hin0KwqyZYs9zm0eN3T7bYzSFtPlEVm
	 q/Y8qxdCYAGv7BwCL2KhnFlO2W2dzcFnLGo7tn+T1EWXdEVB4Vo3uGhFrLx0eCEAB+Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792684854;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Mk3GH3Ng2PrOezdHtaigQomG0NHLOTtcMUPVoA3YW2Q=;
	b=LVCc9NrJyxDKLl73mksFk5lrM/aUhMjcv9t7Yx+KNrocJdcb0NIaVoUwXkPxIvEcBJt1
	 BnMxQBBHDbDVmmoOz0qxl1t5AJlF7b8pB5CA77fhuHDQc4frBBFSMrF79pY5/3SNZ7nbY
	 G3MM/A/vih20IYGLqVFVXe1ag8JKelyQgcYSlByWey1oUbhPW0L85RV3ohO/gNjZCt6ef
	 XFpxpf3U+xMc4+V0jhy3GAp8qongK3t+1WbjVJkq7PZdIPwTlIH0l+RrOkgVSSgtrL3k7
	 1ffWxOr4G0Cgg3nXstRou4gM8ArgblKfdus9qGcIxZ6+gEjZOkRXEqj96xN6z5GFu7g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=wcPHXCUC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.177
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA8C8606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 16:00:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA8C8606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=wcPHXCUC
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-5337c7b9937so394291cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:00:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792684852; cv=none;
        d=google.com; s=arc-20260327;
        b=pV6fWGUbkRalNU3GG9c7KQz/F5lc0QXny32rQ7dJeMUBh/mPUQf5KlMijLxFqGdFkQ
         QFdh/+AkH/lmLnejnLVNx2rDEPwhzeKUewVhyyKFEIHxrw9BjCX52qBxQwbv8Njaxlog
         4XqjBua4aPHC/wwK+6b3iB9s2dyl8A18gSEVy0UykBOl94Kt4Ta81XLM8miHMWXNoe04
         T1PfPlTcgOMOtFks3rQrsJzblVzmMjGrQ5gmsekNsMumqrjJZLC8gsOXu8VDvH/+I8tM
         pUmRR0xhfi+eBuEzkLzCbSDUWgpOMpTDcYC5/QpU1rbG88UkMsV3rbs8y+7gzkSas231
         PBtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Mk3GH3Ng2PrOezdHtaigQomG0NHLOTtcMUPVoA3YW2Q=;
        fh=Usn6AJi7ZIWOL/kKnGSXqwAqSnmBL0oG4ZpcHt/TVRg=;
        b=eoKnGEf6QTwD/YKSEXpcjHcwqvHRAILIk18nqo+TzfS01Q6dye6fbzbmTFBd0wCuwh
         +Kc2m3t4c2Ap1oQzaZvI3y9gd9OfjaIm5aT/xYJLeN5hfo2UJW+EiQUUiO4jkORSdxf7
         axP2SzgF0inB5I4mCx/sY/7gmrgHuge+QlGdbcKHACtK5ywD8Q5pO2I/UCK0gpn72dgL
         OSL4gIFlmKzJX8Kagc7ek3cxaJVssyxrCC6U+RQ0YXskAscKgumlcFvJa4ZbDhBJfgi+
         DaH4L/WY8a62Y+qZa1a9WyewzhqJ3vMKGuScFqNgrzOk22+eD18BVNfk05WPWxnFjiu8
         1pOg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792684852; x=1793289652; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Mk3GH3Ng2PrOezdHtaigQomG0NHLOTtcMUPVoA3YW2Q=;
        b=wcPHXCUCvSkXxZZ7WS6Rpw7hKROhm1IgP90r2hOA8IKeEPB107jlnEdXttjG9t0Z+Z
         17Uk2+OLg4RxdvYtIfWj0cawSZaM/3NM16eOobG4ZFqeEvNu8gR32SC+sd+7liDxD6/R
         qQaAgKATAd3TiLggDKUxH53zuBp/mT1Ui+z+3Xjhw/iQtOViLjZaWSuxGT6NrHDpDD5Q
         mpzD9vVSM5FotapjaaoV9zjxRDVlnVUwRopzTV5zKFZSY/UjnqHFGVMUSebxT9v4Axkd
         hKtf85ZjpC9moHzzCZAnQAsZdSwz9RgovSzxkWbuIbcD0CdEzvW52oSufOUAKJyyrF/9
         cB9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792684852; x=1793289652;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mk3GH3Ng2PrOezdHtaigQomG0NHLOTtcMUPVoA3YW2Q=;
        b=xebih1TgznHtylRip0bZtsOTS1Iu2XbQ0ZdJdaH3fE1lIaCPp65eEKCDXmav8j9Z8W
         rjbBQOyiubXEx4TTvrPKMJpH7wVx7Pl5BkhpCwGXy2M1GKCUFO+y5vLclSg0z7Ula3DY
         SKjw6thOMSchY2urEIBORJbZCWZBkdBIXU9NUezhEK2w97eaKGLJxqrjPoKNr+VE7+bH
         aCgXbFQGW+3tsJeGfNtWRaDi+PBL9l/nXOoyFiBMlTZubHNdSTr7/2YKTiYFJQEtD3C/
         p6mknEMnKVuzP0U/r61lKuPRHK+plmNtwLbuFOvSobhrtCH3WqPnHT4h8J1g6dvfzinP
         UJ7A==
X-Forwarded-Encrypted: i=1; AKwUvBxC9aYsVQeJ0lRH7m//0aWUSbkgFSC9pbtLh0Q11qspBFMUexUr5f2bZIwUqwMCo0VTJN2yLaNITSlf4vo=@vger.kernel.org
X-Gm-Message-State: AFq9FYI4sgoCJtLvYAMIpOsmzATYwgNBHo/j6s5mI/rBSEs0RJLNBUb4
	5Yw26UCQd2YSksZLTURUJJzmEZWpcDcM+kPyc2PQdvHxqN74irmgmYt9DmknE9vIZlIaR7xSlr5
	99pirEFGSmsAiz9N4EbJZackK1HmvxGFbDbUm2/Jj
X-Gm-Gg: AYBFou1zFmZmecuxgMX5f1HVpvNN7oameiMpRBx3sVVhWM0hC//MV07c4vMJ+lVdwen
	lbVzQFQriujmW8lkDjbG055yf9pXYkBVfxW4aJe0mAGy8ypw7KwL/iH6DN5kaZLvvf1KR6293nA
	zfF4FBpGsRfNEc6mvHPslfLsVNKbrBFEQz/cspHNzXrprmy9zIBDJubSFghyheSXZ+TssZpARFu
	uHFsLFLTG4kgK6TVf8Z30nRxcI53NfFweur96jhqb3tFWs6NhlQm7sLoWvQjHilQTkVLZ8Kvt1n
	vc0db6t8aws4ghEnOuR6p1txkRPU5BMGx8X7xLHLMoLAOtnE+92tzQ44WqKaQJmLt2eSreXLJI9
	pGQqOd7YA6YJmyFfwTL9F/kKi2ImH4BXiziqFOHzJqZysgkbDWKa/vz2Ud/87ZA2MI5g=
X-Received: by 2002:a05:622a:1801:b0:536:35e0:4f97 with SMTP id
 d75a77b69052e-536b0631604mr19791391cf.11.1792684849952; Thu, 22 Oct 2026
 09:00:49 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260929025345.88829-1-irogers@google.com> <20261012234724.721224-1-irogers@google.com>
 <as_1Jr1h4qFF_2Jj@google.com> <atYLkAOAGkg1dyIX@x2>
In-Reply-To: <atYLkAOAGkg1dyIX@x2>
From: Ian Rogers <irogers@google.com>
Date: Thu, 22 Oct 2026 09:00:37 -0700
X-Gm-Features: AclHuK-uJH4YZWfjtxaoJ1MMQZSmKk9LsolQziPKPCYRQKJgJS7vz0QuFThVjWc
Message-ID: <CAP-5=fUMGe3x3OnJ4nf+KrXHdZRoxfRjVyUr1AgZuZQb11gZKw@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] perf test: Per-test timeouts, JUnit XML
 compliance, and snippet improvements
To: Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>
Cc: 9erthalion6@gmail.com, adrian.hunter@intel.com, james.clark@linaro.org, 
	jolsa@kernel.org, leo.yan@arm.com, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 5:22=E2=80=AFAM Arnaldo Carvalho de Melo
<acme@kernel.org> wrote:
>
> On Wed, Oct 14, 2026 at 02:33:26PM -0700, Namhyung Kim wrote:
> > On Mon, Oct 12, 2026 at 04:47:21PM -0700, Ian Rogers wrote:
> > > Ian Rogers (3):
> > >   perf test: Add per-test timeout support
> > >   perf test: Improve JUnit XML schema compliance and completeness
>
> Both are failing to apply to perf-tools-next, I'm pushing what I have
> (with 3/3) to tmp.perf-tools-next now.
>
> > >   perf test: Avoid stack trace noise in verbose=3D1 failure snippets
>
> Applied.
>
> > Acked-by: Namhyung Kim <namhyung@kernel.org>

Thanks Namhyung and Arnaldo! I'll rebase and send a v5 series.

Ian
