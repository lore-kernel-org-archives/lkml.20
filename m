Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79EE252FE46
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 18:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791915097; cv=pass; b=Lu/W9nX7Z5CB9MubGl4QF82Mxnn1nzy2/BcIg8s/lAJW2EDJf+fsxQhXRCHzW6b1Ye0av26EMViMIoZPR24CzZmEnjIExR9mw2bSKFjXGDDINSA83AdnHw2MMQxd4k0fplaQbUF0nJySk+4Ujw39qdgCwDqTrR5BNWgycyyrSQM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791915097; c=relaxed/simple;
	bh=Nx/Ht7WbeWj9w+mc12q4UZvwSJdIOI1LylC3CvF+snE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gFuNoLuuSOkx8KSkHaXgF/lFfAQm5iydWZeCmNV0ctbibIoMbrEBJvI+VR1qEboGZc3wJVeAn2nJOhv/zVFL63TyMlZP36Bd/qYJjQBXsYID++G0ykEBDQ+KgecUrBYu9kF5ClvlS1giwtwH3N8sfryrGyawGgUfI3Il7XCTM3E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FWkVCbBK; arc=pass smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FWkVCbBK"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3aae898c0afso1863931fa.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 11:11:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791915092; cv=none;
        d=google.com; s=arc-20260327;
        b=oat+IK7uvjQvNozDShVOdlu3UfNlV2vMDgwnJrOBWUP9uNPXbMKKXVBscKVLl6nY8w
         Sye+IQt6ZxGvln/xLPKVhfb5dKcjh+XdX2y2WPOUA42hqZECsMExXK7OLNQqrgxbT1s2
         v1tXn1nJw+kiJ4+BTAg1vUhSGgs7el+sR8+3pRkfOfZHj95qVE08inJKww0dIKx2KDwK
         u5Sp+Qw1StdYGTTRPkknrhd7veB1/EgaayieTdLM3U+NlqbfxHXYnnU2lCBjC7c9Fsf6
         kim0YB4FXLMndVRHDO34A/vpHrWkB+uZnfPuAur1hmsNADp5ceojkYY3XEi1ZfG5aHQP
         PjIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Tc1zp/jsWqF51CNIfkZYVDsfG54HgePDR513djZlTcM=;
        fh=Mhk8oJ/kgntQVialMN5jxmQtxvNjGJQx7IhiB0f4+/8=;
        b=E1fXVbtsyvKLjLkVwHYaT8YugauMvW6bj1aeuKEuHsYY2Vsw5Bjh1DIDLzPCNKekVL
         gBfYtjGHNDOVWr0mBmNrW9nIaKwYVyoDjQ9noJWL2KYJBQKbbCba+X4oBGM5lBXLswC8
         O2SejL21E7mbkvYL17tJU0pTpYbNw7upOo1RYCw+L+3f9gH44+tfYr8W7U458Bw2pDBN
         bV22r+0bWrKtcgyEcdbMe/UC38Y4VsP/D74BdMxqoJgZfy3ssFaWWggF30uanJcqIyFx
         sx4XuRpKqQ40bFX4++jlpkwKDkz96wQxZHEWkP+Blp2rBFK3uvP+ek9LMURwJ+uRBv9d
         joGA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791915092; x=1792519892; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Tc1zp/jsWqF51CNIfkZYVDsfG54HgePDR513djZlTcM=;
        b=FWkVCbBK0jrN4ebBhcwZtp8DtYvZUna0hRejCVerpEUup2Jv545NTBW+Ipzdb3vXoM
         zUOHjJyWMiudlMCV03m3RENYNIS3lQv3OcpoBrAd7sji8h4OoycI3EGNIFzkylb1LvnQ
         SFCnwdKfYBqjphih88JDBP+h2uGOuEfQaxfHTM5v2/fe/yrHo3mIH0kHAp6o9i7FqyUw
         EMfsuKu8k+1b8Wor7PSl83Vsxgq1mdzZJheoh+paZN6el0dsGvYKa45jg3K9zIturQ4n
         wGdF68Jxfe4nlNiFElnBKn5CAJV91LF/KTZiC3keQLEMVm2AaCvQcZIN4DjLT8KMenMj
         bHGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791915092; x=1792519892;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tc1zp/jsWqF51CNIfkZYVDsfG54HgePDR513djZlTcM=;
        b=d2KkSNn6RZ3ebu6oIq1UITu4u1PfwSsTTaau56qbDfJIxGTic2vSsJ5jUNX09osCwh
         HESv54qQfu2SZiHG59BcdQ/TuropIOLvnjRvT2K9eDQu5JaG3mQZejAeArEHpBkM2hU4
         M4sAAOVEBzM9MpqMHqeSZNt8/QZAzTnpM7Uvck00KaWo+5bHdHmoGYoJI1uZ1+FayT9K
         7T8qfAbFvpSzxFssL6WysJALWpTNOZZ84SinmE0Q/b29pOW5UMgRoOwZGBqk8K+qGAME
         mZVCFoym3bJlKMjsDhTUqO9VIvb6Jj+5aNpSR9c2Q4U5XwCc6dkHKTEZ6govr5w4okEp
         cSwg==
X-Forwarded-Encrypted: i=1; AKwUvBw0M7R7PcTNT9pxZTXKRbsR++AudFp/sihSlCLJXP5Z/KLk8ij9aaCbalEUOvsTWLv06hlKcuGcJINA76g=@vger.kernel.org
X-Gm-Message-State: AFq9FYL2SvNJEKLD5FFEAi8AhvOuJusEFaUhywYeL8+1+orxGyexqfCK
	LmsZhpekS+tBBA1fxYt4WD7In4ARJAo29yXuaMDChsPiYo7c84N+8cTZftBoLoboIsaK6UH2izg
	71HQkSd59Nne6DcSDbdi7Xe+O2BPclBw=
X-Gm-Gg: AYBFou0pLM9ssBWNrnhtSLb7usGOkE0m6Cxss8SPSTTCw8wugWg7Oxl4zq4Y/gAoLjM
	Dcr970fX4u0ZmSIutaZanOBEHr18nXDUebGDhc0zl6Y3syRVDVZ6gGmoNE7fXJjVSOK2aFEHFba
	bF64vfM+c3Y7BR9k7ae57QM7FVjZcjB6Wf1Xk0BwAgaTOlqVXqCEEjPObXm6iy5ia2ZN6sQN+fO
	G5Q+D0RtBHsbjeykih7Qt7C5avU94Z9ub9M7MFC2UTsjeUr9jnMyq8UzC5oymahC+ckkIYJRLwl
	Pd+5Bbp4I/S9sETiBTGAqsqBSAeamumo3Jzrn0D/Grr046SMYG0qNrau
X-Received: by 2002:a05:651c:1542:b0:3a6:692d:b7ed with SMTP id
 38308e7fff4ca-3a9c539343dmr36125771fa.20.1791915092239; Tue, 13 Oct 2026
 11:11:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1781622998.git.geraldogabriel@gmail.com> <179189927768.12828.5970294502454132706.b4-ty@b4>
In-Reply-To: <179189927768.12828.5970294502454132706.b4-ty@b4>
From: Geraldo Nascimento <geraldogabriel@gmail.com>
Date: Tue, 13 Oct 2026 15:11:20 -0300
X-Gm-Features: AclHuK9xQdtHZz7WlG4Kf2RJqiboP4WJrJZBrkr8E7ZdVfvIdA54iitY7tUbJH4
Message-ID: <CAEsQvctXV4zga6Rn+6=Q1zmEmMjDV-83VTWP-b2gWy4Bfdz_1Q@mail.gmail.com>
Subject: Re: [PATCH v7 0/3] PCI: rockchip: 5.0 GT/s speed discouraged by Rockchip
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Shawn Lin <shawn.lin@rock-chips.com>, Dragan Simic <dsimic@manjaro.org>, 
	linux-rockchip@lists.infradead.org, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mani,

On Tue, Oct 13, 2026 at 10:48=E2=80=AFAM Manivannan Sadhasivam <mani@kernel=
.org> wrote:
>
>
> On Tue, 16 Jun 2026 12:24:48 -0300, Geraldo Nascimento wrote:
> > PCI: rockchip: 5.0 GT/s speed discouraged by Rockchip
> >
> > Dragan Simic already had warned me of potential issues with 5.0 GT/s
> > speed operation in Rockchip PCIe. However, in recent interactions
> > with Shawn Lin from Rockchip it came to my attention there's grave
> > danger in the unknown errata regarding 5.0 GT/s operational speed
> > of their PCIe core, including data loss.
> >
> > [...]
>
> Applied, thanks!

Thank you Mani, that was an important drop.

It's a little strange I guess to have patches that were Reported-by
and then Reviewed-by the same people. But in this case Dragan
and Shawn deserve all the credit, I'm just the person who dropped
some code.

Regards,
Geraldo Nascimento

>
> [1/3] PCI: rockchip-ep: do not attempt 5.0 GT/s retraining
>       commit: 39f89dde0a76b229df7eb356aaf6f444b4f8a636
> [2/3] PCI: rockchip-host: do not attempt 5.0 GT/s retraining
>       commit: 5988a53f5bf758b2d41cb6e0832c19b9692c76d2
> [3/3] PCI: rockchip: drive at 2.5 GT/s, error other speeds
>       commit: 62843031ca1f11d1b8e90e7f558c1b3c4cd77184
>
> Best regards,
> --
> =E0=AE=AE=E0=AE=A3=E0=AE=BF=E0=AE=B5=E0=AE=A3=E0=AF=8D=E0=AE=A3=E0=AE=A9=
=E0=AF=8D =E0=AE=9A=E0=AE=A4=E0=AE=BE=E0=AE=9A=E0=AE=BF=E0=AE=B5=E0=AE=AE=
=E0=AF=8D
>
>
