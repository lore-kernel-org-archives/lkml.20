Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6DDF4252B1
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 15:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787756563; cv=pass; b=JTXK+9EItkV0p2UBZlIiIoL/SOGK7Y/1Mj2DM7HuMoq6IKAxYUZTPYqPvz0DapT5ISa0Jiq4THF0s1+/HiUEHWuVxYpgpiWGSjppeKIiAmP8/kegYNCfzjheB+itOnbKauLMa1TtfHWXVAn5CIqRcRNXf1Vw21iS10rFz2sFvRg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787756563; c=relaxed/simple;
	bh=/5GEC9MtQECsj84A2/9ukz67BZyUeqSD9PsiFzlZiTg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MRs+Gs7T3wkYdYRFsb+An+uXI9JtgpKcFo36r0Ju18jtq0WSPdiWdaBGQZM2HunB3Eb22KACjhhslcc6iprqvT9Amm69jB+Bnvq5qcmHcCqfBHUB5Dsqn8gD0krSNZ+wvhhWOB6s/fqSMbZR8VpbeCrMuciW2roJRuZkQq+2ZFQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m8Pupy+C; arc=pass smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m8Pupy+C"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-ca5b707b78aso90987a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 08:02:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787756562; cv=none;
        d=google.com; s=arc-20260327;
        b=LJxog20d1oGS6P/S5sklAYimDzsGk5LFvhAa6suR2cNxh9v4sUAcgDZZupWRn1BEST
         gBpEcL4hAStPK8nYifYb2KBfvX4HcFX4tdKTOEl44VU7dsy0Cup/4cqlajcUd50kzcms
         GNxibkdXLAppEf/dxwNy+C4IjfF7vf330sXvK5LsulSBwby4ENhUTnJu5KbDgxifEEq6
         EdFDSHTYOU/RT+MYdFTXiLrpejsotWGSCEv4blyJju2phSAL1hPYdXNpudfHZJU3Mu/I
         UgArlM+usrIdazNUdzxnjE7ENvq6D4eqN5UD70JcgSpYxbMl29aTnsXKLfmwRV9KKL0d
         olDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fKjFrILSlKMtCa7HCHUu+Qbu0uL60HZCrihH3ZGerxk=;
        fh=yPjN4Xiwudd0QQ317RcfGGlthKukRJNq2116XmivhLw=;
        b=OaAksKeHg5aCuU8i439hT917gsF9oVBzs7LA0dcQfQHzPZlcKrg9ry1GGJHZGXwzY+
         1/UjBm8H2bCqbHOrQpkQQ1H3cBiRBJhxEdjNmWIrIpantqIUdX1Q2vpF7MXkkgELME3L
         SWtme7OfGVeI5MjxFoig8vGXzBcsPchYNnfxWy8OCEAgfPoEUcrUyBAzWdovdEVORDH6
         ojp/+J9u+O4nnRW0m8BoMjwI0xBt8+idGwIQUSDnwMsOQNu/xzewDl0vZHSvbbo8Kffj
         OyGg87qGIcr4GvZsD8fLFWDm8gKaYjxaJkLs9AMB8ubpZ+hg/GkCDHWtFovCR3rb2/B+
         VZ1g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787756562; x=1788361362; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fKjFrILSlKMtCa7HCHUu+Qbu0uL60HZCrihH3ZGerxk=;
        b=m8Pupy+CuZdnIMUlQqvnvg3oS4cQb73XGz0bfGWvZT3QL1Gkq5gfSRajc6P19gDG83
         MH0nJCIRCt1tZWaeTygLEgmGNJ8mXKA8g8yv+0JrngS+qQx7VCh3R/IlSwORnjRpUQlP
         /Qu93BjfgW76s8GzLFYRwquyjDtWHP1vSUHvpE7W4w7Vsh3lU0IRn/tWpof58BOWT9qP
         OLycJJnweLFSU+l4eN5ud0RCcoVV5QQ7NQXr0Pbw4HFlKtMR0ZKNlEf6klXj6ACysBQx
         vhNXc6T2jM4CbB+px1TLwOBIEfQFBiXPT1RJ5y6qiifL4kWdhiYewLtmD07HlyCaqnKi
         t8sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787756562; x=1788361362;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fKjFrILSlKMtCa7HCHUu+Qbu0uL60HZCrihH3ZGerxk=;
        b=dPsndCC+mEazvPKcpyk7h77oplKqxcfudIhHBdkjchk45MVQC/2ziul+lfoxZ0WlgZ
         Nd8Kbv7OV+S1J/qDFjkAjUD8PKWhpwTqKtwIhTkbQRrX2kL24yZWcWAgvoKU+e+47EQf
         c19xiXruofpTgQme/2RvJT81ltuIjZ7Flx2rbYxmhm+dgE0pK3l4+hTZ2y55yg3rNiEz
         UxgC8VqgjNgoq7B7q7vyv6Se7UsEo479tpfNkDPY8XFBe54ymGam5ZnYaLi5Ikd2GSpA
         83Bd8pOBXBADRecsebMoD0DZv1nrfPbEPL1nKpiaaOhtNBoINyCf1UpC17wAnAOMznVJ
         0+jw==
X-Forwarded-Encrypted: i=1; AHgh+RpOkDCRMP6QWC+wUkhtkPGSI01MmyEunttdw2e5+GxLcsSeQuXO9ZTX8+og3YGJElaX4VMnFRpqHEo0dCw=@vger.kernel.org
X-Gm-Message-State: AFuF++ndmkJa58og9aTfWK9Xozu1vqsP4SM9MlwJNrUDtej/UFy0H1Fw
	L83TfsduE8VHlQpiVMAOVRDV6OlXCWesO3xfrAADjzkYuRbHZ144urXQh+4Qk66Z/LihIE6F/mV
	b7CqIUN3znpFS1HI6HykKRNyn4+XyAZ8=
X-Gm-Gg: AR+sD10Psjd4jL048RZN0eyEoNfsNo4ilCEZbKY0Xz8qpOmwQbeUc476FmsyDjmiHZp
	ra9Ir9zSQRWGDhv4ermKH5DfEU95QBOelVMWmrFcJzuBFCDSg+58UOIy0MAvk++dxK5OytKsXEy
	38wdueKg3rWXAYQWROgQpJ1eeguhgeLeswCL2dWxm8hsIfzdFiBzPKDxqROnLDwwZMXMv6FEPAJ
	II2pMBL7WP2WMJ7L0UmKLZjZzlzt1TaZU4RJYlXYV1VwiNcurPm5Ynrk4YOTpGrJgBjNd2FNLld
	4d38k6/iVVL97uuBqpvJQkeh4KLWmDVdABg+qA2Ni85cUZmPBaluGbCCrvvYkc+AP7LOKhei1D4
	hVDO8rLRB8wef9rzY12ILTGm3bovZ2iLQKxza+LK7N1SNdA/lZb41q18oLR8mAg6ZyBKrSMnt
X-Received: by 2002:a17:902:f691:b0:2cc:f4d4:29a0 with SMTP id
 d9443c01a7336-2d71e4cabcamr9458015ad.3.1787756561747; Wed, 26 Aug 2026
 08:02:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826145832.42387-1-elouandacostapeixoto@gmail.com>
In-Reply-To: <20260826145832.42387-1-elouandacostapeixoto@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 26 Aug 2026 17:02:29 +0200
X-Gm-Features: AcwNN1VA-WD92RaG1JazLgbFi5wl6plkGePCcziqBYAfDtSGbu5lTLJre33ux2s
Message-ID: <CANiq72=NtS=YHkCbB3ui1vVkHoVpHh2S12XAC=0vqHcurJFX+Q@mail.gmail.com>
Subject: Re: [PATCH] rust: zerocopy-derive: Remove the BoolExt trait
To: Elouan Da Costa Peixoto <elouandacostapeixoto@gmail.com>
Cc: ojeda@kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	aliceryhl@google.com, tmgross@umich.edu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2026 at 4:58=E2=80=AFPM Elouan Da Costa Peixoto
<elouandacostapeixoto@gmail.com> wrote:
>
> FIXME comment was saying that this needed to
> be removed once the MSRV >=3D 1.62.
> The current MSRV is 1.85.0 obtained by using:
> `scripts/min-tool-version.sh rustc` command.
>
> Signed-off-by: Elouan Da Costa Peixoto <elouandacostapeixoto@gmail.com>

Thanks for the patch!

This code comes from upstream, i.e. it is intended to be vendored
as-is, so if this were to be taken, then it should be submitted
upstream instead.

Having said that, their MSRV is different than ours:

  https://github.com/google/zerocopy/blob/main/zerocopy/POLICIES.md#msrv

Cheers,
Miguel
