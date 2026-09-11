Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F2247208C
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 12:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789129642; cv=pass; b=r27rKeK/bui5rS2URM/gX7EPBr+XsxdRoANLWSZN0G55rKbQ5d3AoFmOc3+2cyc+CGIZ9kyTF/64t4x5gjQ/S9tGLkt6vZWz65NTchtZOrKzMvQqTAZ1LkfIFdL/Zug8lvJETeT+lwa8G+lEsYNfbVJgsZvIbVDgHVM8FzilNxw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789129642; c=relaxed/simple;
	bh=BS+pR4l3PtQdoJSIb5cpxp2Wyv3x3z1Ls6BQMhZ7m5k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QS3RrEYirUEaN16z3PnnGCPnkKGt05JzT5NrWhtv1KMQnf2SzZ0Ht5zVZeZLbCUySv5uf8+VnjSy5N+hFFKVqAN/XteXjyHOntcRrQYv8wEle8Yo6hlpLxvoBltC0KAQdMdl8+6VyCNIkCpr1KQHWK6wLaHDEzcgy20qxiuaoZQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ljE41NHA; arc=pass smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ljE41NHA"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c2940d16190so129519066b.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 05:27:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789129636; cv=none;
        d=google.com; s=arc-20260327;
        b=bV+OyX/C9TWEwXrWqw5f1NuqT2+kPZqg8Lk9sSJ5D/vj4IDOYz9yjtcCmWuxq4XrVM
         bDVXz07fxIJBotUBz34ljESonjUfYRD6lSE+DuDZKaZ6Lt8MKiPQbQNrrWVyXfGGzner
         kGS30OPui50g2y9eLegwlX3JFKH3YQ1do2PsNiIUrZxTk9sUv41PwD9htPT4LPcU/9aE
         QslFcjn4yLnpWG1PvsNscsw+TamXd1e/yBF/MMAAcJO3Vbb6gN+lnYFUhZb3qvXHubrn
         JSH6xgKjFcdKNxcfjNPadamAuenUOD5D6bnrMr+en6IbH4RIXtxrG8LlE0JRzv0U6dOR
         dmbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BS+pR4l3PtQdoJSIb5cpxp2Wyv3x3z1Ls6BQMhZ7m5k=;
        fh=vvOUZ+e5Gk9rWWNWmzh39QYa6cT4wA78xnAknNged5k=;
        b=dS1e2Pu5nQrYLoBkrAOtdZXyBctE4xPohPBkJQkqDDROG6FRVJnhKUu+HbOkdY9LbI
         To++QVx9ZDsSd3wfdeMCzzuATj5YX0R5aZLzdOgLpQOmk+AW0jOBCn1zZGLo2nv+4Pst
         /IKy5CHuLSts1Mhkn5oNR5X+38aL346a6WgtPjjjVvPPraRAV6E/h9xgelcJx/oIbLQH
         yIkxFRCLxe1zNbMqEOp0aBPa08Uq8VR3nffUAqIgjQaPHWHXT5ZjKlB9tXU0M8Kbv4vv
         8X3rBAUYeSDo2zeGooCdN1C+UcKe1erKp1PbuxORSaenQHxPHp7msWpcFaxapPECa/Bc
         MXwg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789129636; x=1789734436; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BS+pR4l3PtQdoJSIb5cpxp2Wyv3x3z1Ls6BQMhZ7m5k=;
        b=ljE41NHAmaCpxYu8kTcOHFfEVkdDqeyfa+HuRNuXv4MsFL0j3/fhM2xNLDsnNUEr5Y
         j3QOiL2JyW2EvgSX3KuqgvN++So4bxiA+TlN5vzXeuDZSLjbn+i2mmFly6VIO7IBd/MZ
         MbamnKVrw0IAl++QKFaVA12bKEMciPWMAP0zpiOvgn8AIx1IDhCTLfQCac1VEuBKZYnK
         dk9qZjBB5lll4YXYQfoQd2am64u+ol/DlpSjpjpqsKt9e/TDbXMoZzc5A4n4rg5WM4Lc
         qK41GK2s0nJk9AddbTbBOp7eYHBYH5Mb3PQ/ApIp05yHCA/WskPkomwXfjI8/XIFpT17
         lHJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789129636; x=1789734436;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BS+pR4l3PtQdoJSIb5cpxp2Wyv3x3z1Ls6BQMhZ7m5k=;
        b=Pu6q0KnvdL7HW2W+EXz5QYuNe9SAY036spjDT7r0Hg/fnR9u5+9jQREsTavCEcCsG8
         2KjZ2ihhPhErZhrgquLDcEuLd4gBCcTZSGI4fkIqh7HeljWKdel6OzjG61Ri3gWN8w1M
         Pp9z2IlXlDOcDAhl27xLpimtOwEGb42i4hbHBx4Hua3lAOx4A4/rQjmYk4DkR4vDtEn4
         CrdpRPjd+Z+5OcFXSnLB6etpGq/URV+USGO6lPKD/DwnneYHGudpODXST6/n2FSLRYcJ
         ksxYCdTgxyLttRZfC9jVRQyXe5YfJ3E98XcGGJubCVRy5jtOUB1RgzkbmF0c/INAcEal
         RDzA==
X-Forwarded-Encrypted: i=1; AKwUvBzn/tpSB3u+liKOb/VO0DlDNOeEpBrFz8eYv2Yak0Tng3X0uBQtv2AgLjS/SC7VKjz6JGEHUyegzMD2mG0=@vger.kernel.org
X-Gm-Message-State: AFuF++lTrP2MsBoTua7JoeGlDNwOLwqG55Nt3bHUCot7dTHM/SzYg5Fr
	Cb8Hdza2V4ng6/h0y5ddMMKVIz7IURp5kAHMM2Beag2aeZVjTBZDJkd7fs+kERaMnHWZFkOHp1i
	LUbvbvEBSHw1DCwc6z+j1W2oghcKtTeRnoz+nuQgfnA==
X-Gm-Gg: AYBFou1JnWY37l25QKqZ4KH+6fWgPnZpUGVWnmSKMjqwEFbPPB2GLAJ8BdDrJnQOBvQ
	llm8uNeSvcuoSVJuHZymRMCzi9I+7qJjr/sP5tMbFC/fHx75hBEIAeyrkVTnCRS0uIjJfaDfQul
	W5Ns792MGvAi3ep+O7pXDzM1Mw8q8+rz8Orwyu99UdADy2wE1+SycbqbAuHfGyfIFxiBtbtzMqu
	lj1rC8k1n2JpkPi7K2oK3Ge09F9IwEwL9tAX3/3Oi5IQSgtaAFcZ32j1bzRx3n9XUBd5QyGN0EV
	/cC1wKYgreLQcX9z0jedPkmnGASO5B1G/mGLov5KJRmaG0cCmuydmAVoDtbmSNzC/QdoXVewhHz
	ALcim2D/BrwA4/+916J9hVnI=
X-Received: by 2002:a17:907:c247:b0:c29:3bc7:c13 with SMTP id
 a640c23a62f3a-c29665fffd2mr162373666b.4.1789129636213; Fri, 11 Sep 2026
 05:27:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAKfTPtD1NZ=AOdW7z5KyVHqaoEPso-7yqsicj=9t4zM20qJ_eQ@mail.gmail.com>
 <20260910155635.2101399-1-jackzxcui1989@163.com>
In-Reply-To: <20260910155635.2101399-1-jackzxcui1989@163.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Fri, 11 Sep 2026 14:27:04 +0200
X-Gm-Features: AcwNN1X99uzd9pdYK0rW8BQ1eUElxpBcapF42vWO2OQ6rD0nPNTGjYLQJGEuUc4
Message-ID: <CAKfTPtCQUndM7NfMYpz8S6vXhwbwrOYALr9dNb+971XgZ9GqnA@mail.gmail.com>
Subject: Re: [RFC PATCH RESEND 05/10] sched/fair: Introduce
 select_task_rq_fair_thin() to select rq when LB_PROMOTE
To: Xin Zhao <jackzxcui1989@163.com>
Cc: bsegall@google.com, dietmar.eggemann@arm.com, juri.lelli@redhat.com, 
	kprateek.nayak@amd.com, linux-kernel@vger.kernel.org, mgorman@suse.de, 
	mingo@redhat.com, peterz@infradead.org, rostedt@goodmis.org, 
	vschneid@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 10 Sept 2026 at 17:57, Xin Zhao <jackzxcui1989@163.com> wrote:
>
> On Thu, 10 Sep 2026 17:31:43 +0200 Vincent Guittot <vincent.guittot@linar=
o.org> wrote:
>
> > > Adding such a function to the mainline code is indeed not a good idea=
. What I
> > > actually want is to prioritize selecting idle CPUs within the LLC fir=
st, and
> > > then select idle CPUs outside the LLC. However, once the fast path ta=
ken, if
> > > I=E2=80=99m not mistaken, it only selects CPUs within the LLC, which =
is not very
> > > friendly for machines on embedded platforms, as it becomes difficult =
to bind
> > > tasks without crossing LLC boundaries when the number of CPUs is smal=
l.
> >
> > Ok, I didn't notice that you were looking at all CPUs, not only the
> > last LLC. Do you have more details about your cpu topology to share
> > with us?
> >
> > we have sched_balance_find_dst_cpu() which looks wider but needs
> > SD_BALANCE_WAKE to be set in your sched domain topology
>
> Our system has a two-level scheduling hierarchy with 18 CPUs and 4 cluste=
rs:
> 0-1, 2-5, 6-9, 10-13, and 14-17. Each cluster is LLC (Last Level Cache), =
and
> there are no finer levels of hierarchy.
>
> I did overlook the detail regarding the SD_BALANCE_WAKE flag; our project=
 did
> not change the default state of the SD_BALANCE_WAKE flag, which is set to=
 0
> Moreover, as far as I know, most embedded Linux projects have real-time
> requirements and generally do not modify this SD_BALANCE_WAKE flag

But if you have real-time requirements, why don't you use the
real-time scheduler ?

>
> Given this situation, is it necessary to create a new branch for such a "=
_thin"
> select_task_rq_fair() variant when enabling LB_PROMOTE?

At now, I don't see a need for a new branch nor a LB_PROMOTE. You
failed to describe your problem and came up with thos
platform-specific solution instead of fixing current code. Putting it
behind LB_PROMOTE, doesn't make it better.


>
>
> > > BTW,
> > > Regarding nr_idle_scan, I have derived some data and the analysis is =
as follows:
> > >
> > > If nr_idle_scan is 2, then: y must be at least 512, tmp must be <=3D5=
12, and tmp
> > > must be <=3D 512 * 10000 * 1024. This leads to tmp <=3D sqrt(512 * 10=
000 * 1024 / 117 / 117),
> > > which is the square of 382,999.488, resulting in approximately 618.86=
95 after
> > > taking the square root.
> > >
> > > Multiplying this by 4 gives us 2476, so if the estimated utilization =
of CFS
> > > tasks exceeds 60.54%,nr_idle_scan` must be less than 3 and becomes 2,=
 which
> > > may result in missing idle CPUs within the LLC.
> >
> > nr_idle_scan has been design with large llc in mind where scanning
> > hundreds of CPU is significant but when you have only few cores, we
> > could be more relax in the number of cpu to scan
>
> I can understand that the logic related to nr_idle_scan is very necessary=
 when
> there are a large number of CPUs. I realize that many x86 machines, even =
personal
> PCs, have a considerable number of CPUs in their LLC.
>
>
> --
> Xin Zhao
>
