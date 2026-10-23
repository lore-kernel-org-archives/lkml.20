Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792748484;
	b=kSQEcGx+p+n4CFMxR+nWRL/HvyNiB3ioJ0dzeUOGHyn0eeJaST/H+MuLq17tJiExL7T5
	 m5SwuB3B8k12lGNkqPC/7RQd7XNHUXRQeIkT9LUGUiLF10DxVz5oHkEcSBpWbZIXzO/hp
	 yQvVxhmP+rJmk+sXbKjNzHjyJIT+su2/i0UjT0BN12DHl2aEAsT2KcAiayIEiJAdyRnrj
	 t9V3bZ1cMVrR9s+deM2OnGKgQzz1WlHIfutLVEebEACQq6OgxlarJTWxFZjLMb1eD2T35
	 My6TDCap0hOpiI5a6fdgLAWAnYMpPDyTaUzzS4kq+iPA11B15bRYMwkNbgbpNagRayw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792748484;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Okgw5IuIeyoGQZ+JzmeJO9+dqCKtCII160B3B426Y1k=;
	b=OFeSqskl8SpmEbTBFYuVODHcYLCvZ14XmTCREbz40WAqvIAODyyT6EJkYjBI6yebGZFJ
	 FGx/Xe6pICnqS6RdnqMCGH/ilu2G4tyw03Z2gvBoKj8xNOD/bsvJ1D8j0YOf7BjT7gvt+
	 I0pUii4D0gpfqb8Q607P8HjRAqmsV+LIIw5Wrxsskhes5E2apUor7fcIwsepj/SFr3moB
	 aAfCCp2ehWjYy0Fxw5hWY9nrzqHoRmu4+GKRv/bmuK7/Ldzw8CWnDwUbFuxkgjyDFlEMT
	 DXKpQCZnU/U69gnNurMpRFpl4ADW89ZDQ/ncb9ld0AFnI33Y/jE4/a7g7cVTxmt+JHA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sartura.hr;
	spf=pass smtp.mailfrom=sartura.hr;
	dkim=pass header.d=sartura.hr header.i=@sartura.hr header.a=rsa-sha256 header.s=sartura header.b=NbnFC6ic;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CE58606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 09:41:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CE58606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sartura.hr header.i=@sartura.hr header.a=rsa-sha256 header.s=sartura header.b=NbnFC6ic
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3acc96a256dso418807a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 02:41:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792748484; cv=none;
        d=google.com; s=arc-20260327;
        b=KHSAKtcAOzZ8sn3FsBicZLI60fQToPPWJKX80btptmK7sKl4sJ4HZIiOfbz1DbmG9V
         rpCxbX07RRWdJSPmul2DGD+IllbYWnKQUHj7rmW9kucI7YK8uxMi1rc3PwKeKkffdrT1
         xLjWlI3Cm76jnMCpVykY9ziqnUc2VQXbJtSNQKtrfIk+QRjTtb3NQCLbS2WUyXNJedFH
         sshyNxxUEjJBkfCQ6OhujX1x8BtJX5t3Bt+tHZ1bfklPkX5+X3WDMAFOV7Fm+MQfrdea
         3EybYKKDrTOKpLeREmFNhW53colWnLVaaudayChEroVOU/aV5QgMFk7161/00QaBZlKf
         OhZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Okgw5IuIeyoGQZ+JzmeJO9+dqCKtCII160B3B426Y1k=;
        fh=YwGouN2oP6axNXpIL5Q47ZiS7hCMooYO2Vo0dhOPU9M=;
        b=VBHsxSxoEcXn2gYViM8RbMwWt3C1DLmV03etgF5r8CkBDlTdSu1Ejy63h8NewhXWc7
         OE5h9H0KQS12p2j1Q+uhRIrU/qJlpfnIhelxDs5o1P/oE2EVoXtEJJ+N7aOp2+N7/har
         WYAQGOyXBEHCUYt4dAlbcY75dYhGczW2GTBDth112qOtC+IWrwtmZev0O+oWPyKuoiUd
         QVPxaiByA/bRsEChY61R1SMuwV74WkfzBh2FOi9PnCnA+usILyYgjYLLVb7ablmd+BGD
         2e0sQmo+dv3o5Qg/gqiIBgCfa+sJnNhzT2vmcEJXOlGPvdyD/aWk5x3JGZFtEXcvDebb
         OacQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1792748484; x=1793353284; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Okgw5IuIeyoGQZ+JzmeJO9+dqCKtCII160B3B426Y1k=;
        b=NbnFC6ic7YCzTwBcbpR7q/m6kM1BIsWqz6AVmGqI2UzTJ+lilYdayfl9Dyqyd8Jlj0
         LqKSdThWJ9k/Pfw78uVKyxE95Uu5wC3zbvaeyEzFc7D8m0MkQQZtVA/zy57hGDoqcUsd
         AuNJkeR+JiGxFYp+RWwkId8zDBR8pg16lKQEls9eA2U+PPWJLA0gTKAsCx/cP/bcYOqO
         pcltwsbn4oP5ffSMY4fEXa7KBDsVINYTbgAEqEfuUJLUO5gNu7xKSMgVi5RkiawqerjX
         yNSaca1p+va8vnMpfklHN7Hy3wTFru44ogGI5wpGLFj1j2e/tXOKbflXa1anevxV7Dkj
         FoXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792748484; x=1793353284;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Okgw5IuIeyoGQZ+JzmeJO9+dqCKtCII160B3B426Y1k=;
        b=1wMVAKwS7DgowCsOwmZRVltruZhi6gxI0/f7yYbtxj+1IDkkfXxkWLKY3LMYGYGHXh
         DqwVxZMDqmu5PMzq/VXGmHQNqzZlfNR8H5MDLWvdK4+3IitVPNAtCDcnZpsjB4dgZ0J4
         M/TFVKb1Plph0gnXNtcgpBjfoiNIv0+j199b7ILqLCwG9/7z7S5eDskCu2tdyDRqOgNo
         WLLxtspVMM+hGgbE8DUpRWFSY/J1ZjKn36Mg7BmGV1BpkMmya6BCVhw5XJPsNj5afPJX
         KvjnBSmJuENuRSwY0lU8LqeJtq0irbylN/kDWCSKdYWxTtkpCR/t5UFfIFnWLQ1hgIc/
         wmCg==
X-Forwarded-Encrypted: i=1; AKwUvBztrtPzkzRcjLJ7uYdpKOeZmrY0MD4WapB3aTiK+dVWtAlnavhWzZ8VyiAdrlJPmJKb2nsTOc+1jc6AnUs=@vger.kernel.org
X-Gm-Message-State: AFq9FYJEm1wkofgDYjFP3/aXHZUWOA6sSQEFG1iNtHV/Qv5Bz0UvN61B
	y37hBEJXHh0+1GRNH4t7OwI5niOBCQUugCfhIjkwgnPeJcg9c9/UNTMP7LdJDDfEMUgbjdv1YLk
	QEsLs4qk0uPtTLRWzcdrzdyG8GC/NREX+0lqtDZ0eNQ==
X-Gm-Gg: AYBFou3u5dKz4dzUaW//CrQ8vXdYQY7EVnd+YW5SEB0YKum0U2oTewKHiXjjLCd2S6S
	PZtsNcvWFG/S78DcnJs1SlQZ35Y+yOgbdgi8ewopUJaP/9LWTJQG0NFpmSAjJ6zg/GSgRdlFq3s
	TzIpGJGwCnO0GII8HB4fLuWQSzuz0cYf/LtaBc9bWLb/iv2OxUYhqFsRgDgqgHbXlfDUFHLrBkC
	/cPpLeSxYxeXDvPlczr/FQ428vGWfrsbYZtf2M/P6Cw/g+mFTgyB2uFVh6TemhfazHQN11mqNrm
	mJSUaH3MSzbyoOZk1vrPJ1cuLxQH/586imwktjgGivWvL267CgeHynl2/4/lKBveMog5FYJFfNq
	ay3D6e8LCnVCKjuM20o1vEGozDTm1CVkKA8jOM0p6MZqQVWmWyuCJHETjTtO6fbbYVaNEqWTP5O
	HHH+daIrXL9auLPz+y
X-Received: by 2002:a17:90b:3805:b0:3a8:59d3:530f with SMTP id
 98e67ed59e1d1-3adce0df541mr1412012a91.57.1792748483778; Fri, 23 Oct 2026
 02:41:23 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020065430.1251541-1-julius@bairaktaris.de>
 <30c21159-3008-463c-9cd2-a07f26668a25@sartura.hr> <9699033c-a9e1-4b11-a55f-b1aa216c700f@oss.qualcomm.com>
In-Reply-To: <9699033c-a9e1-4b11-a55f-b1aa216c700f@oss.qualcomm.com>
From: Robert Marko <robert.marko@sartura.hr>
Date: Fri, 23 Oct 2026 11:41:12 +0200
X-Gm-Features: AclHuK_z7zkTrXcOEBJ5YdNRtSSjaBF7iP_4-bXy54P0B5j7vSDrFZjtf2Rlh6M
Message-ID: <CA+HBbNELhPAAZoUuXm3SrvgxiU0eMaiu5LB3wfup04_HuZ+yxg@mail.gmail.com>
Subject: Re: [PATCH] clk: qcom: gcc-ipq6018: add fallback names for the bias
 PLL parents
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Julius Bairaktaris <julius@bairaktaris.de>, Bjorn Andersson <andersson@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Vladyslav Andreichykov <vladdrako007@gmail.com>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2026 at 10:06=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 10/20/26 1:39 PM, Robert Marko wrote:
> >
> > On 20/10/2026 08:54, Julius Bairaktaris wrote:
> >> From: Vladyslav Andreichykov <vladdrako007@gmail.com>
> >>
> >> bias_pll_cc_clk and bias_pll_nss_noc_clk are outputs of the CMN PLL,
> >> which takes its AHB and SYS clocks from GCC, so the device tree does n=
ot
> >> pass them back to GCC. With only .fw_name these parents never resolve,
> >> nss_ppe_clk_src stays an orphan, and setting it to 300 MHz fails with
> >> -EINVAL. The NSS clocks below it, such as gcc_nss_edma_clk, read 0 Hz.
> >>
> >> Add .name fallbacks so they resolve to the clocks the CMN PLL register=
s,
> >> as gcc-ipq8074 already does.
> >>
> >> Tested-by: Vladyslav Andreichykov <vladdrako007@gmail.com>
> >> Assisted-by: Claude:claude-opus-5-5
> >> Signed-off-by: Vladyslav Andreichykov <vladdrako007@gmail.com>
> >> Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
> >> ---
> >
> > Hi,
> >
> > This issue does not exist upstream, as CMN PLL is not yet wired due to =
missing
> > networking, even then the solution is not to add global name matching.
> >
> > The required clock inputs should just be passed to GCC directly which I=
 have
> > just pushed to OpenWrt.
>
> Just read your reply after writing mine, I'm looking forward to seeing
> that patch!

Hi Konrad,
You mean the wiring for CMN PLL or?

Regards,
Robert

>
> Konrad



--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura d.d.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr
