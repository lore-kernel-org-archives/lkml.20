Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 712C4348445
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 09:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790760699; cv=pass; b=K3mo/1blsy64hn7hv67JA1BM6IpKeEtLZlClM37NH9Jx2iNdup1L2Z1ilH4SiAKPrpl2TSIFmthbRJZAL2LyQHj4JtfaPQuIrzC6ksJ0eENIkeu57XWVegTSPUEpMTQGDWAcDUIhsBAE0nANghoo9MIJAER4CsEmFokTvG6wvzQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790760699; c=relaxed/simple;
	bh=sSCgviBed8zHf2g3xfsl2lv3eFzl+hoXf/vZ34TkSWM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RzJU0A+FsceY5HLMnBohsk2P/YluizZ1D4h2uSowl+Ozokk/w2IC0PJhPhGhSdXa7XEs8Qu6x8KVscUEZhejhZI3pwR1hCV8M2geh4G69ZYfn+tGBwS2toSxv5lsuRfTTeRGpISoIj2iNXmFx5nMQYm9DBhr9iHTBdLXLj5m52A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org; spf=pass smtp.mailfrom=quora.org; dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b=b2d8MHbI; arc=pass smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quora.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b="b2d8MHbI"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-868cfc5c244so1657201b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 02:31:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790760697; cv=none;
        d=google.com; s=arc-20260327;
        b=kJnDX/EqN1WMhyTpxTpVBHOBPaIcACOZNOj8rYUy9I6OYXt/arrY9W5IveP/HUTm2g
         sqm/LLzZVq5rvoqD9CFZc/c6OAe+Xe1VRkHsP/+j95os7EQhIpy9bReZtDGQ/t3tiPHF
         0K847FWL2BNs67FLuOje+hTNLfeC2RotuYcOQXt4fFaYdaRsuVQelm4Mb1Hck2STAbRC
         JBfKoxaanceEs246sQEToCSH0pH6+S50wZVL/XinwgrKsn35N+RCrxOxXkbj7UTi/PD6
         evPl+G1bffU//EUncY64TT4aqaosqy/qwa7YQWg3uVfJM5xJRViT+lttmlwuXOhLNgEk
         Dnkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=gmqdU3mh7HkwuHdawcYTNlsooyWkbGnJjJwr+HnDbhM=;
        fh=6GBklMb6VFGuw8Ol0BUap7jvoOCt3+lr78M8VJa/pn0=;
        b=P+FuTyKVDIFHXNlmUfSjYjgjnxJWCYUjS40nFbqax7yI6wV3uifJ1q2/TP5x1JWqRS
         sfwfN8ZtYze5BR6a4BlQfQjRrO5a/GVgMe+HxWR5Qzr20LbVslsqYwzF9OdH2FNSjy28
         l2ll9kT+PTm92GG3GvypwXzt8nOmUKlynvtcxhfdvjdVBQZi1i8k/B8L2TdeqVdzbsc9
         kLZLlhOdtcgWVKscVJepksDFfzlIEdIcv6YE+v8+sYoZU0xuATr0wJ5euxXobCP4pz2O
         uoXgUZMm0Zdlaux8jbseAWD0LZLnanfBzQ7yVrzT9ms4BLvjgnSqFMnSb3UAsnRYVfGt
         GAug==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quora.org; s=google; t=1790760697; x=1791365497; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gmqdU3mh7HkwuHdawcYTNlsooyWkbGnJjJwr+HnDbhM=;
        b=b2d8MHbI/K2msxANIAUSGWXRSD3g+5IUfmA27J8SV/04s9iV0+KsuZX5Li5UiXboef
         Wdff3WdMdsHQUQDCTaVv5ggfVJK8iCIjpiXJ+OYjGYWv11Psi2r9KQeBS7qIhvGCu6nx
         jb64DZXN9rdOnehgUbQngI5VT46cKm1HcrgCY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790760697; x=1791365497;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gmqdU3mh7HkwuHdawcYTNlsooyWkbGnJjJwr+HnDbhM=;
        b=r2MDdfN+vS7Je68q75UulpaeOn9LiJTeLR4WrDEJjNC2icp4GLWdbn6E6yAvBZabLK
         XSlsfMnxiOO7WopTErgVwQFPaaXUB8H5/szuNS+tk3G8Tc8Z96mwWRh+idKgNEPVnhmH
         YAa+SvCqUqC7SxWPx+uXg4iOE/HjvxzdY2MwoByLoROE/RyjrSNhF8qB+H+V7msjrNnn
         jB/gG4shaN7nIZNey8i4u3LMI5chqB5PH056lhK1ERUu5ctCppu1tL8GrkbVg5SuNgrW
         352vKNvhu3eggxvwixvaT7cQPVkcRiECf9sgqpJldYDeXN0LHVPUqMckh8aenJ+GA7pu
         okHg==
X-Forwarded-Encrypted: i=1; AKwUvBwrAlsfQU/d5zdEow+EcyBvuYORvzC+u2CBetuukuLSwijNQ4l9GqiXa0uQGPojKREj46o6IfU0O4PMGMA=@vger.kernel.org
X-Gm-Message-State: AFuF++lZOyinXUNQLnjtfSSpMGIz+C9/7itHdS89O1lC/Yxfry5PZmaY
	h2HWWqMPznqPwze/eFoHpBpOkU07SnyLUUb+myEwUZdM84Hm1Uie8/N0oBpQ8BNNEpyP2U2q/r7
	UqSBVKbqSdAugOx7Gd2XVh1EKoH3aO6FZEtzGSRu/UQ==
X-Gm-Gg: AYBFou2B5X+jbtaaJwB5o3lR9ys97BfXsTcfXR0M0dcszfXjKtZ+C8cg79eUQp3VksS
	tSZZ5Tr0GduXlSKaTZ3eCfQgBqzVBmM8CDW1wnXSozAMTUu/1gYbU14ZrRzZweb2k/nTa+Wa50B
	cS+S4coa4lEYB1HXyUKk0oeXdK5bgR3xQ4YdTHX7YWLdh0VvqY1dn9bYgZrbRgsO43xjXGikAFH
	ERS5fst/3F0sEA+sZDz0RPIsGKKI/BD5TAUGYACos0Xf3SMeFffgMjnmEOLRhxrRvcpK7awILk8
	0un9sncAoFsekqdT+Ui9f0hpTtFa5u+IiKu7i05KwPz3gjZQNq3G+jRoNkvQ5Olj79uohNvGh1s
	Y0B1zTHspWDIFQhooWWcdocvGjvgKHSjh2y+rg32ehqws8IQ46eURwjgb8c2nvMLBKv0IkNP+aw
	/MXKXveMPK4RZy7depgZQcaaPp5II6xXB1QG/ke6KOCNNMhdOeXj3p2hLUXJtj6jwPEETkbsQYp
	kuG7ySyinvrLZTfV/aWjgQT5D4aApABuYw=
X-Received: by 2002:a05:6a00:1d93:b0:86a:c062:8af2 with SMTP id
 d2e1a72fcca58-887475beb20mr572280b3a.3.1790760696692; Wed, 30 Sep 2026
 02:31:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929041444.9837-1-daniel@quora.org> <1ca16602-fb66-4706-8e86-3b35372324b9@oss.qualcomm.com>
In-Reply-To: <1ca16602-fb66-4706-8e86-3b35372324b9@oss.qualcomm.com>
From: Daniel J Blueman <daniel@quora.org>
Date: Wed, 30 Sep 2026 17:31:25 +0800
X-Gm-Features: AclHuK8EAJhwPODS-uwXrHzCTd7v9hqYYiYnc0-_fOmkD3ZLxi8pO4B443j8vUk
Message-ID: <CAMVG2svsfP+6cpRq=kBCZFva_r8jXSm+-pp+qC9D372S10z12g@mail.gmail.com>
Subject: Re: [PATCH] i2c: qcom-geni: restore tSCL with 32MHz I2C fast-mode
To: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
Cc: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Manikanta Mylavarapu <quic_mmanikan@quicinc.com>, Bjorn Andersson <andersson@kernel.org>, 
	linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 30 Sept 2026 at 15:19, Mukesh Savaliya
<mukesh.savaliya@oss.qualcomm.com> wrote:
>
> Thanks Daniel !
>
> On 9/29/2026 9:44 AM, Daniel J Blueman wrote:
> > Commit cb97bf3d4f91 ("i2c: qcom-geni: Fix hardcoded clock index in
> > SE_GENI_CLK_SEL") allowed GENI to use 32MHz clock. This changed I2C
> > timing, making the Yoga Slim 7x keyboard (ITE 048D:8987) unusable
> > on all boots, and touchpad unusable on some boots, resulting in:
> >
> >    i2c_hid_of 1-003a: unexpected HID descriptor bcdVersion (0x0000)
> >    i2c_hid_of 1-002c: failed to fetch HID descriptor: -110
> >
> > With this change, t_high_cnt 3 and clk_div 4 gave a tSCL of 375ns
> > versus the previous default of 521ns, however the I2C spec has a
> > minimum tSCL of 600ns.
> >
> > Restore tSCL to the spec with t_high_cnt 5 giving a 625ns tSCL,
> > verified on Lenovo Yoga Slim 7x X1E-80100.
> >
>
> There might be a final count which i should get and update back.
> Since this fix is working though not suggested per hardware guidance,
> should we consider as temporary fix and move ahead to prevent failing
> usecase ?

If you can get the final values into a patch for the next -rc instead
of my fix here, that would be the minimal path for everyone. You or
the hardware team can cross-check against the I2C standard as I did
[1, p44].

I would revert the original patch if there is hardware that uses the
I2C 1MHz fast-mode, since the current timings aren't to spec, but also
weren't before.

Thanks,
  Dan

-- [1] https://www.nxp.com/docs/en/user-guide/UM10204.pdf
-- 
Daniel J Blueman
