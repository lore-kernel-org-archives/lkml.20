Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCB1135B65D
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 16:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790181998; cv=pass; b=K7T0suirYwECu4I1zEmHcicHYNqlw0iPLCOE8x/8v/zhJsvejWt1mOGvcseJ4dhiEHRJhOK7Fp7eWNDNuCxc5JtwJUYV8JQm6HYczUj9QqqNjsMqNGoVCUaf4mYOmGiuZIfPO8zVn2BsPKHW34DKcxHcxJDXkCXO4aea1M38C7c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790181998; c=relaxed/simple;
	bh=5ttgwH8UHuDsbpe+g+LIC07zUw8mgYUjByGb6XeD0sc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=egp9DcJYBGEdkYHNai0Nmy2mdk4lTihB99Bg9J/HXRNfEXHiKcig85zCUDlNajQetuUM4zSTupB87B4AZ+VpQ0RFgumSi1RR/SRSCfLKsBAvtjv1rIhqEqUSQbC4Z4AmfU/AiWvoEkUiiF010SGb4N6xcaTD4dRwGn5xpvhwSzk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jG1Oxmrg; arc=pass smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jG1Oxmrg"
Received: by mail-pj2-f42.google.com with SMTP id 98e67ed59e1d1-396ccc09d65so866533a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 09:46:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790181992; cv=none;
        d=google.com; s=arc-20260327;
        b=JMP+asduJtPkfMa64LSLjllEG8cNRuANFPBPH9J+iP1TVbFTxAJ4UdXs61SHIsz6/e
         kztSoKI0DQecoDjKc5KjxrGjvz+wWOUA610AvujETWTiNb7XvM47SalaQ3oec2z7u3ma
         aRksozuCYhWN1punzc8S1PhdmZEpQhLrYvev9DV3k7XuTVvzQo9HMM4qRMqEiNhkgcMQ
         bHGIXaTX/7Pxlc9qgl10l5J6G5g/WC5ULYGml+Sm42AW7KaCWPwgVqzcJljOQDaZLzTN
         f0c98yLm+LW5w0wJYezGP/rZRhBlS0cT7EwSmfTMokF6r9kWPnjmS6HnUIuycTbsRc+e
         breQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5ttgwH8UHuDsbpe+g+LIC07zUw8mgYUjByGb6XeD0sc=;
        fh=OXbsSe48qvkTQjgevPwFtCiS1NaglDlAv0bCiK9yqI0=;
        b=AR/ULoNMQqwZBRYqNhEncOQNXWzAoXGv8rETRDy2k6nFdH4TBD/nx13nLs/pq4YOe/
         OSbUTAT3ky/C5bqSXoRHD2tGfY7Q+AeHCI0DjxG6QnrTsebX0GHIVS7+J+nSS6lkk2fL
         Nn/IvJsx/2ZlhIOhC6kM/Zun1VRaW13SHBC2OP4BET0LWQtKdOuHgNr6N//b1Fm7+Cn8
         v1fmP15iMEa0EMcvd4KSRixhKyTosW88roAXJKoQGpD8R0T+nLDs7QyAPYUZf598yh2/
         d2RjjMUIN45wbfWgzc5KN8e0GYodRH5B/+OFaqO2ydZZHo/eKlhu3hiFW91x9lkj5VGV
         T8cQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790181992; x=1790786792; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5ttgwH8UHuDsbpe+g+LIC07zUw8mgYUjByGb6XeD0sc=;
        b=jG1Oxmrg8SoCun82jI7IJOzdWpUCh8nsLGresy3WjZzOmnNw9TFzaYm2lScTqqhEfi
         ycyDlLE1qFfJScNNEZWysX0vuY0XS4VU9d0ikXOM3OvzHA8NAmXz2E8oANLSsXgceiWP
         z6aO4M0J/Bo1wjrE7va8Z5/TnpRv5OH06LVMym6bbXtsIzuHV/+ywjENODEIrl80YUAE
         riOe4Y9fL2jUwC3bXBcyzzYl3Id+nWIW/zW5FoQk5mrhc6CrtVYVBV3p8/bBvj5NeiLO
         /H8krlh/Bfr+wVNeSf/mC16FraPg0fR+0EjbjZ7idzZPu3Iet3WnajfkCxYVDf1ZA2aB
         Ch3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790181992; x=1790786792;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5ttgwH8UHuDsbpe+g+LIC07zUw8mgYUjByGb6XeD0sc=;
        b=a35QLOePSJlWIiZ0WjzkMJGeWU8TtnSTCGIcAIVVA4W1QUwb5rnMLybvzuWZhDGzC8
         wJ2kpE19q6pFFCbLKm69r2c8wVOu9hcogNMbHqJyw2+bydByVQpdJR5XJzk8hzsX7XRK
         1VCCckSgRaX5reVXN70qvuqxKSqWpmlziwvtbnrTq5cQi8nzX/2kyP4eD1GHqhmwfyY7
         +ogmNlrBlSDUhNWgUVK26fFgfYEiROQc0XYHLxXJL+JeWpyIhQbvldSmpvJG6pQMhiEA
         aVZWqtqe6oGRUt2BQdWFLW0XfFRQN20UdXLa5O78ilgcgQxDYZXn0g3SAhMT0iwLBKG3
         W15A==
X-Forwarded-Encrypted: i=1; AKwUvBwL1pJuvBYQG0YDzWCbGra+jtGoM2QIsynQA6eHtKRv3zSKlBk7YE6nK6yNe/M7jy/wlGT3fHCFJUCAufg=@vger.kernel.org
X-Gm-Message-State: AFuF++nfFsc/7j1f89mXeled4XrjxcNU5uwensu+HwusBvzvlZfllnDO
	D6cKA5aQnDUXCiVJFWZ23FgFhCh4E0v+yVrXzIbss1U/fuC6j962MWmsPYpUR3uSqGxdLDU/PSg
	reFGrXu9PZUcKzwzLKZ7p+DVjyfV/dlQ=
X-Gm-Gg: AYBFou3guwWpSyc+MM2piStpdikDMP965UAjVbUIzOMRlRaoTV+v5B9O8T7OoSRvm8K
	qhXXSZcho0iplHmkb+8KEEk7P/fYbocXoKDbiTdkdy6JyVfmF8r7j8a5NxEvI6dAEIBeDrxmgqg
	NMewFBd22VTXhgFoIH55aS2zxIRpKgv3WJkMDkFj7I+7d5tJay/lLqDvxoXNhjSPGVRXE09wrX9
	6S7YVIe1DlyeORORl+Keqtr66lscO/cXVn7J8Qne4FwcGiFYDUsb4JMFTw9M6caa+38T+i55oFr
	+kXVjeQnETDbtaVRagyOQfjq0AWX0iyYwt0wv+r6PfFAhW90rmVDBXJ0C80nskZsy10NXCoPSl3
	8fZs7fLQfhx/JTaYL8zSfc0knLU0oo1fag8XY
X-Received: by 2002:a17:90b:2742:b0:39e:4c7e:f03f with SMTP id
 98e67ed59e1d1-3a07e5808demr2908153a91.28.1790181992225; Wed, 23 Sep 2026
 09:46:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260810164622.1829843-1-puranjay@kernel.org> <CANk7y0ixo5a3Vfzj_HVhVHRNce2Rsit4pP27GCtXd4jHHzmiKg@mail.gmail.com>
 <CAEf4BzapC=7YM2QLMyKKfyOWGgBTfEJmPPN8e9Jf5xT9SutBTQ@mail.gmail.com> <dfa8362e-0dad-4f23-9d2e-dde03cb5facc@linaro.org>
In-Reply-To: <dfa8362e-0dad-4f23-9d2e-dde03cb5facc@linaro.org>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Wed, 23 Sep 2026 09:46:20 -0700
X-Gm-Features: AcwNN1UoxvmW1a-b3T0PDtkRMDhPQq20k4NzNgV-SyDiYVuDhWZJEV9Emssz7sE
Message-ID: <CAEf4BzZ=ahQNtA-1KdZFRONXMOEkV9Nb1OUY==JRQCarkbMM0Q@mail.gmail.com>
Subject: Re: [PATCH v6 0/3] arm64: Add BRBE support for bpf_get_branch_snapshot()
To: James Clark <james.clark@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>, 
	Puranjay Mohan <puranjay12@gmail.com>, bpf@vger.kernel.org, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, John Fastabend <john.fastabend@gmail.com>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Leo Yan <leo.yan@arm.com>, Rob Herring <robh@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Shuah Khan <shuah@kernel.org>, 
	Breno Leitao <leitao@debian.org>, Ravi Bangoria <ravi.bangoria@amd.com>, 
	Stephane Eranian <eranian@google.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Usama Arif <usama.arif@linux.dev>, 
	linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026 at 2:15=E2=80=AFAM James Clark <james.clark@linaro.org=
> wrote:
>
>
>
> On 22/09/2026 21:40, Andrii Nakryiko wrote:
> > On Tue, Sep 1, 2026 at 6:45=E2=80=AFAM Puranjay Mohan <puranjay12@gmail=
.com> wrote:
> >>
> >> Hi James,
> >>
> >> Can you review this version of the patchset? It is implementing what
> >> we discussed in the thread on the last version.
> >>
> >
> > James, do you mind reviewing the patches again, seems like Puranjay
> > went with the implementation you suggested, would be nice to review
> > and ack, if it looks good to you.
> >
> > Mark, Will, you guys seems to be designated as maintainers for
> > drivers/perf/arm_brbe.c, can you please take a look and give your
> > feedback as well? This is important and useful feature for newer arm64
> > CPUs, it would be great to get access to this functionality that we
> > had on x86-64 side for a long while now. Please help get this upstream
> > or, if it's not in the right shape, guide Puranjay towards a better
> > implementation. Thank you!
> >
>
> LGTM, and the Sashiko review is good too. It does conflict with the
> FEAT_NMI patches on the list, and you'd have to disable NMIs but as it
> stands right now it's ok.
>
> Reviewed-by: James Clark <james.clark@linaro.org>
>

Thank you, James! Mark, Will, do you have any suggestions on correct
sequencing of things and how we should proceed? Thanks!
>
>
