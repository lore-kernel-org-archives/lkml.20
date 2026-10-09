Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AB3E4E4C5F
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 16:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791562299; cv=pass; b=sMvIAreR46pAa0MGGmbLlra3xechAHW9xxrUSnd/djUXPi3leU/nTWoey36TVFSunJb9APc85MPdpBhzWpNk1Gf4nCXxHnDcir30s7sSCmObMfjbD1EKoC36iV+DQsYuf8gZ/so4DtwdHjNwlYibNaWI4XNipLv/T52qj/oHcLw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791562299; c=relaxed/simple;
	bh=wruMCtXy7SaidqAshqYiUfIEclThOLN0o3WVP1sMiRA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gyU2KRIJ1qrvRmlRBpXfL6ILyr8X/ZQLdUHHGQw/d19cs4zgl/glCrqpYneWOTsVqn/YQ7oyxDl9AOo8khhy67uIU3wOHBjQQYeSI93A/d66J0CxmJc0SH3dZVzp1RWz/mMKDmFalj+2Ou8S1iel/MJ2uf5cSD8E9t0i4emybNc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VbAIioPv; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VbAIioPv"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6ab0140ecb2so14627a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 09:11:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791562296; cv=none;
        d=google.com; s=arc-20260327;
        b=WbzVylbcRPgSP2vi7fr2Wy1s9D1nvuU/9q0QQkxoLPRRolGFPN+58dbeuGz0zAvNJ/
         Hl7bbk2yEvYYIzSbcbywwT5FFpyqFp1DC7D1jiltrQMb9fefXl7BpJC7sXi9nkwLEdUt
         mh8aVygUQ6L8Gfl0Yu6hVDTm1eMOMGgYp4sttrSA2vx1FGB9IPW+SQ/iXAl54BA7fpVz
         HeOpQLDd7WuzfbnoPXEX6g35zoNOUI31Xq9D9Q/5nfOwRK7Wq7N131G0nMYRtTIkLpuA
         MN9Sc2JLZOWCRjaoY6xCaQEriO5ETzdIbEll+ozZrABIv49wJu+wMgOp2LGFqPXZTZj4
         N15w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FMY8+4K3G/+VX3FzbqjT/yR5SuMJ7etOIbd7i1CeENM=;
        fh=0+RqJAcHkzWn6lIjelRWBM3//4pqIOT5REZGg66NA7c=;
        b=PUm8YDv8g7Zeg0k4StbyZ8iMUYr4WabjUJqW2fo5PglLrnuQkfkObzA+X5x8nL2Ibw
         1WmhXGmn662UOcA7wOmvt4Q4WG2a0vJB7xq5EyAeaIRRXIIFrSnJUUMmHHclH0FgpahE
         Wb1g6DjtqwdBh8AGPKyNYCX+rivlsZo6mXIRmoX6paVguqL3t1sDJUswASB37ARpGHf5
         wSCUy9LrN/1zzPKgfySlGcjNEX3rt8f2hhdH5SLCM+5rp4bZM65lXJkzPNnqAER1FlMo
         KYGOTXIHxij4aGzlfoGMgB7HGvZAnOCekSxC+B7B/C3qXB+/9xmW/Aj0FfgnmiNLGJMs
         169g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791562296; x=1792167096; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FMY8+4K3G/+VX3FzbqjT/yR5SuMJ7etOIbd7i1CeENM=;
        b=VbAIioPv5ZrQGr2UOclc2HATlUsoTuE/N7m6AKiGDp3g7O7YsQ6hHfnOE8YR1XQCpb
         2IzR/dN3t0QE/8paeKo4ph5JmVzXv9u8JoIFRwq37ewzgIL/R3jI7QxpjOA1BgDJE79S
         C8GKR9P7K088GxbjT6jaIMXWfnoTjtbDkbj2YeRxQhmvuydZF529udmbmMJY2v3xo5bJ
         UKEvMtA2SIecJn0WiZmcQJWtKl2x/vu/T7CV0CU2SRv7dRvzl37KMFgwgH9mnb1JZD2Q
         MfrXwHqYbcGKdTFt4B24/3mRCaDnf7QxWS1D8u9TCMWmGLO4ODyp9yo9j46/Sm6LmUsG
         yefg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791562296; x=1792167096;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FMY8+4K3G/+VX3FzbqjT/yR5SuMJ7etOIbd7i1CeENM=;
        b=RFmDX8iOuxpMryLzJziiGEuS+eKxPcnqwku969jjpXCPVEIDrqphNnKwvY/8s5lwsv
         tFE8NFFPnRdKISLVejrgzte21XbDmZTBsqOohZZDeerUQQQiRB7LC9DrSqYt19XxAQ73
         +SLLTE1BpjeYRnPhieMfCrpdSSMK3NUbEcVdJSt2/Pb9q/9EdAdHzbHAPWbTKDbVblfV
         2b7MAxQSn6w0OV/InfEhAbQL+osLMAYGxTQ5ocARSJdoCKfhade5YPO2VgBnLN59Xea3
         vS4mfD/9vRvV9H2W1+S6VdiPime78fBpa6X1VWmubDqf3w8BbelcTbzKVCTYmzcLTDtw
         dP3A==
X-Forwarded-Encrypted: i=1; AKwUvBxPDyfn/ON3V92XFpiok0/amI//WqaT2kMiFZd2D+r/3uykedulPGRlKclR5gR/kLLZ1MhxYTfmblTHdDo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIiHny9+InBuQh2bk2vO017L0z8MVWCM8cxazkYAB7mak7iDOdL
	Zk+czKF9UUQGArYF71/zf9rDi6tFnDo/sfEGAE4lE9Elnm4Rd/Rk8Sg2IYKBu/u+lySicMORkNZ
	zdbJ2qjenDHfcR5OGJaEQs2LtvdsrfFxIYk3Y8Tqq
X-Gm-Gg: AYBFou3w1Fvv+GqmkSlrBRqg/1E1H69Yb0ts0Phpg9kfHIeBWLGW4wSk8nmcox4qoKe
	vYa8+2vjNFSs3DzqfJQ5hpmVEXrhjEnhN/1b9f6sL4IMlZgpJb4hftvluPs4NHPssMuUGUDP8V8
	FIrBQti0Si3nssQdJEuCx43wyoDN66WRipXjKBj1ETh59bUja4AZmWYaAO4w9wK6K+Z5sN82mz2
	t/UvjK5Vu8Zg/UJFXd2tj/ZrLDy8X4ejjJAzfV0/xVJoYzag0QWwVyQO076fJ/XoRHPVey267yk
	Y3BLTedS3ODnDAOcqqnoEvqfCxHl+wFqUITZ4xTXGdgAM8reaapaMhY=
X-Received: by 2002:a05:6402:404e:20b0:6a9:f353:ef65 with SMTP id
 4fb4d7f45d1cf-6b177f1c488mr52368a12.5.1791562295275; Fri, 09 Oct 2026
 09:11:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261006-b4-skbuff-bug-on-v1-0-1b4434c5357c@toxicpanda.com> <20261006-b4-skbuff-bug-on-v1-8-1b4434c5357c@toxicpanda.com>
In-Reply-To: <20261006-b4-skbuff-bug-on-v1-8-1b4434c5357c@toxicpanda.com>
From: Mina Almasry <almasrymina@google.com>
Date: Fri, 9 Oct 2026 09:11:23 -0700
X-Gm-Features: AclHuK9fcYwhDbADMIDURGeGAhGxa_d-APkp5QvjpXYNwtTkKCU00ou2GsgfiEU
Message-ID: <CAHS8izPxwo35ExaJvK5FgGG3TGFS5uGybk5O=ZoY_1=z15Z-ug@mail.gmail.com>
Subject: Re: [PATCH net-next 8/9] net: skbuff: don't BUG() on a missing
 head_frag in skb_zerocopy()
To: Josef Bacik <josef@toxicpanda.com>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Kaiyuan Zhang <kaiyuanz@google.com>, Willem de Bruijn <willemb@google.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 6, 2026 at 10:10=E2=80=AFAM Josef Bacik <josef@toxicpanda.com> =
wrote:
>
> skb_zerocopy() BUG()s if @from has no head_frag and the caller passed
> hlen =3D=3D 0, meaning the caller didn't ask for the head to be copied an=
d
> the head can't be referenced as a page either.  The check runs before
> anything is touched, and skb_zerocopy() already documents -EFAULT for
> bad skb geometry.  Warn once and return that.
>
> Assisted-by: LLM
> Signed-off-by: Josef Bacik <josef@toxicpanda.com>

Reviewed-by: Mina Almasry <almasrymina@google.com>

--=20
Thanks,
Mina
