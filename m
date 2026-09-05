Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AF0F35C687
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 21:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788643849; cv=none; b=oNoPqiaWkwjVqzkXIDpXTYbMnv98kTFpu+RqDHZp1rKPWYGDcQEWRley1gohQJtbrl6+CFg5A1jq32mz9zyUlu2d0H+pyVjBn9n67HR8BDuclHEztebr3TWsD3zJTssqiIBJbcxsKAAJ7DgKlPyOjRlKcTDpWvvrE9cdtz8NjUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788643849; c=relaxed/simple;
	bh=RulQUVvjeTmRLGMORFoDPT3Fne4v/IRjI+E5mDdtrX0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ZyscZbkigKnnxtBD/M1yBjXHfQO+eLGu+4fDDWzGPQUGsDM5pT/xlmfWMFLDzCLXBV15LpCVOJrUVE5KPxCoJbY3pja4300l4ltMcIELc/pEli0swhTnz4D73fBByp5+VaAbHZEP/DgCZgaMoTH6198onFWNh056eVKjr6H9NzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J0AtCoEQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J0AtCoEQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED1B31F00A3A;
	Sat,  5 Sep 2026 21:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788643847;
	bh=2FsQkijurDodlXzSgnVUIeMF+0Mv7R4D+E6ps34X7dg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=J0AtCoEQhw7cg+X8IGyiq0Qq5QxvKsW5O2L/9mobICDmRnrYp1RTsWKLhFRTYsWhH
	 8CBPzGDujIdxK5EA1ltlDpYpBBMjUElsfinyG9NEAe/cbYVipym3mDGL+e8IVh43jY
	 aV8oDVZpRQDkL7dTtR/r401rEvYCONLjtzN99c1ZsrvaTT7+b5E71XyPj1GrLC0cMr
	 r7asLl6/gt9jcdxKatLeDXajxofeVOV37EBNQblJADQ1tZ9EtT/Zl1fmxzv35KApVe
	 31SkyiHw/625dpL2iLH+vRN+2aA0Kdf+nfji2pg8iyvRLMQjELA5GuNTBbB56e4BVP
	 phOr/ZM4sZfyA==
From: Thomas Gleixner <tglx@kernel.org>
To: Anup Patel <anup@brainfault.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 Radu Rendec <radu@rendec.net>, Marc Zyngier <maz@kernel.org>, Paul
 Walmsley <pjw@kernel.org>
Subject: Re: Interrupt chip driver maintainence
In-Reply-To: <CAAhSdy1=Z-VjEhGsGOJ15QptCSZP_6zG1NF=B972KwzEJhFbFg@mail.gmail.com>
References: <871pb9841j.ffs@fw13>
 <CAAhSdy1=Z-VjEhGsGOJ15QptCSZP_6zG1NF=B972KwzEJhFbFg@mail.gmail.com>
Date: Sat, 05 Sep 2026 23:30:44 +0200
Message-ID: <87ecf74c8r.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 05 2026 at 16:37, Anup Patel wrote:
> On Fri, Sep 4, 2026 at 8:19=E2=80=AFPM Thomas Gleixner <tglx@kernel.org> =
wrote:
>> I'm still going to pick up obvious and simple bug fixes, but for
>> anything which requires deep knowledge on the underlying hardware, I'm
>> going to just mark them obsolete when they molded in my inbox unreviewed
>> by the people who understand it for six weeks.
>>
>
> I think this is a fair ask.
>
> Currently, I am focused on reviewing and testing anything which
> touches RISC-V AIA drivers. The SiFive PLIC driver on other hand
> seems to have no active reivewers from RISC-V space. Few years
> back I did try to actively review SiFive PLIC driver but these days
> I don't have bandwidth for that.

I don't blame you and I put you on the CC list because you are in the
RISCV space.

I don't know what's wrong with SiFive but they really need to get their
act together. Paul?

Thanks,

        tglx
