Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793025859;
	b=pNOvXunEnPx31XdkNBRD/PtVK71rKtYb6vnooWpvxpLeWIsNBGtfuq8mPQWz27edaRQB
	 ZHlqLsYuboHWTNXNBRLX3GIuNBtFP0U9lBYXM5l45kyFKMNIv0LkX4iFFEAeMOOlcyUIy
	 /Hs0kfQc3hm4FvN4xTAfpCf0ffBt7/uF6VzJJiYkF1Gv7XO2Tf/3Rs0v+e5HSQ9mBSvtE
	 WMZQAmj7DPylOgmzyG8Rmvf9/To15WxPS/2Y3ppBMn0YjJTB+ey1COTh558K+Nk2EV0YP
	 MmJWY3MjUnD3ljAVs9M11jefmeLOh+sSS4t576fRkHJE2JK5FV67jl+GzKO4GeyvA+w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793025859;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=PmLN4KMI9/ckNOzHWJ+qP7gBBd55w1zodrkYmeyXAOM=;
	b=t5/n1x72e4W8i8WFh7dFjnBj6iVdUzF2qxjDTmi2neyJO4Da/PjMuPTQ7Rz2OOIs92pI
	 +Tn3QgVgVj8Bgq6DK79VGKNwOWw+5+IcuUnzRzZqpsw7Z9VVpBuoaGZThJrsDAY2NZKuS
	 wE2Q2tZjZC2vLJeeUHaBnPYL1fm36eMVvHvB6n49Z0U8MXpKXM8GbI7KZyEEV2yD4Ilrg
	 VIlAEq0Azs9L4LzVkc2eDW7Aw6VsWr9DazCorDcY7PaivGoQoX2UrgbVM3gd2W8OwAWoI
	 rm1c3gLAlOw+OYBL4ongkQZ42yLK3OukqkEVFRM8tU6eIMFqKOsS3VlpDfMSSOz6cqw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="I/xgKncw";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.174
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9170606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 14:44:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9170606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=I/xgKncw
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-8565d77c277so23883927b3.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 07:44:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793025858; cv=none;
        d=google.com; s=arc-20260327;
        b=eVPr/OlafeOw2dgchnTLJMkAOOBQ80WHlLHajH83k6Elcn1B6iEaO1eNFT9Sp25Zqi
         GLIYVLUkQ9287168zOgRRh3UPgH5Adcze6uKMPjwcoHROlqXQBKrHfz+gkkURQmMy1/K
         RSdGddPN5eko9ipjDl1jU8ecpwhKJx2RmLwORaEUw1QNQC0rj16J309i1x0XR7NIUqQ5
         SclLYhubi2e5F9crUucjnW70BMf1oBeWQ1PfctOOjG6wBpG/40A0O3PKaPBby9zM2vOs
         S8/DNhuUJI6cJk+nRHqwqfq2Rj1G6q+9k8Fe4t4bN85Gxkoy0g4/D53qait9t8QdluWL
         669w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PmLN4KMI9/ckNOzHWJ+qP7gBBd55w1zodrkYmeyXAOM=;
        fh=HcrSqwt1F399EEMC1xAm53use1k5K5PC8L8x9bqT0P0=;
        b=BNYT7Qx7LEYMO2FMKvZNVdNgsC+qYfe2DE8T05ZBWGE2H9q2nmSnnbJJPj7ViDlZyB
         MOeblnw0A2YAUbTkDLW/PE+QYFsYy9NR0fHiu8eCi6xkV/GxJ6TrpfpJGSbo+PueeRQ7
         LZ49qx4C1Nt84+vb7fYCsZlYV5iZljBXew3um/v1fyVIuyyqqH1HI7cyFzeDfliubcbe
         OqJ9LXSBA0pU40BJXgCInebM2lLlEu4ChQPGrn++tB7XtmQ1oaQJp2VlGKczxbaXS3js
         Pp5XDcRKQNWslUm5HgJs15yj8D3Ad6cCMQuhSr0FHdcFEWApVZx8YmREpKQb3XUJvkh0
         /d8w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793025858; x=1793630658; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PmLN4KMI9/ckNOzHWJ+qP7gBBd55w1zodrkYmeyXAOM=;
        b=I/xgKncw7HV+TXyHup1s1Yw9AdSQRFiuKXpuTkCcgMvGeODn1vciZ1RY4PNDZxMlaC
         a7jzFx+vF2U7Dts0T/DNIM8Jp7UN5FIeqcSnZmY6MHYhAfUkcN+3sH8hRFIwZ943c6Ec
         jf7ZguBPUZkNeCJIwVhsn1f92FLYLMc22WomtJaXAelOoJG5i2L1zOmXc6Jh31qLmd37
         vwJDBZ1YaDxK+4JDu4Q/vY5P9vOOPzivy0pYCF8r6AOCDxSlBJ2EbRBqUR7FFFhO+Tbu
         q3ReC9DZPEkqD/k4c10F8Gj9867irKBeNjMPoRb2r/0RmJO4sQqEb1Fy4U8B2qix4ea8
         nxDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793025858; x=1793630658;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PmLN4KMI9/ckNOzHWJ+qP7gBBd55w1zodrkYmeyXAOM=;
        b=rjNcD3aKTzZ9EIbqikX4SyWpazE1XOb2YwdQyzbHKAWHlEl4vyHWT1jM+zldaV+ceg
         S5TuoVgCjLNh1UBBGfJDHS69FhzLvuuEWkg2hj5JcKS0wDl3uAdGFfJmKRmq9NCBeOi1
         R7ZrMjWJ2qOQ5cPGF+xUVjXKkrAkexm7t6CLGjAtbAv3/r5EfMV1Pdub0l9KkS3ySuUx
         fmreYmVgZPT7Kxavax9eswAmpeMZ1kgKylL4t/5jRPzcuspip3h/8t33paJ77qsmgZ/P
         SQDpt0FZqkrBprVcsm7QxL5xqYxgvEnE3wiECWlXo1Wyy51Q1QuMZ4mZ2ruCfvLCy3dX
         EFnQ==
X-Forwarded-Encrypted: i=1; AKwUvBwV4q6Ytn4zoKJGNRC1dnfdU3KU5d7vEqtDOkm8OHPtg52NIA2+h7a3GJaamgK7NYZnG3rIRfjj1CITOA8=@vger.kernel.org
X-Gm-Message-State: AFq9FYL07fiRpVHFAZ/DZ4A/89umTlKp+YjXTAnEgQwuArnhJ60/smr6
	vIyjXt4WoCJyjPY7du0E4XJHgxarSOt/jK9rEV76670RBhxaOKHEWL/6AkjJiSfqeuOYV8wfykz
	jFFmYZSuF3ROle7Xpia68p0YP75a+qyE=
X-Gm-Gg: AYBFou3EtnigDrNBao9NCooY8gM0lYI+sJaRf4sSxCmTbuJt5KUQZttxzhhgwVeTpdl
	/Z6BBgSrX6w6f6+CCw2uh7C+7An0bqzrwARy1oGu0deb4L5GfaUk8CXARok663suQlgnsLyrhBi
	TVe7RTIL5U6sQGH2tB3jxZf1BJsSuQTziKv5RXRuw5ZLvefwgmk54mx8iFFMfIPEr9Fp6NjxvUT
	4RUIeNq00U54aOgPCLIhlU54JQayFnaJKMCmgnfTL3H96FnJtIQ3w7Z7/hvLonYm5EHMRpJiapT
	kLISgZ1uzNlT/c7/+mivSQVasdUov5Muy5+ZuqhYRhIxw+tK9ef34NqwY4nY00aMbgvI2LZ4Wd9
	kNjjYRKiHfOZSTtr9ye8pRnVYztSXRA07buDxjUw=
X-Received: by 2002:a05:690c:e3ce:b0:8a8:8945:c423 with SMTP id
 00721157ae682-8b166c5d5ebmr46729927b3.56.1793025857715; Mon, 26 Oct 2026
 07:44:17 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <pm-mptcp-objects-candidate-0066-v3-73df72b7a543d4cada0e@gmail.com>
 <CAL4WiiqEHwZRhSRXqFOtF3OYsX_v3519Ey8AEknbaZKFNogeJA@mail.gmail.com>
In-Reply-To: <CAL4WiiqEHwZRhSRXqFOtF3OYsX_v3519Ey8AEknbaZKFNogeJA@mail.gmail.com>
From: Cen Zhang <zzzccc427@gmail.com>
Date: Mon, 26 Oct 2026 22:44:06 +0800
X-Gm-Features: AclHuK963cbP9FFGoa6Gs50d3hUXJxO6-lmlfnE174He_utWipWjNu9DcJLD_EM
Message-ID: <CAFRLqsU2QHD2Ta2aL_qSVr9nVFrn6mXV_nZ987+oqHUbCa7ZSw@mail.gmail.com>
Subject: Re: [PATCH net] mptcp: protect listener backlog reads in diagnostics
To: Eric Dumazet <edumazet@kernel.org>
Cc: matttbe@kernel.org, martineau@kernel.org, davem@davemloft.net, 
	kuba@kernel.org, pabeni@redhat.com, geliang@kernel.org, horms@kernel.org, 
	netdev@vger.kernel.org, mptcp@lists.linux.dev, linux-kernel@vger.kernel.org, 
	baijiaju1990@gmail.com, jjzuming@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Eric,

Eric Dumazet <edumazet@kernel.org> =E4=BA=8E2026=E5=B9=B410=E6=9C=8826=E6=
=97=A5=E5=91=A8=E4=B8=80 20:38=E5=86=99=E9=81=93=EF=BC=9A
>
> Adding these stack traces without symbols is not really nice.
>
> Time to use scripts/decode_stacktrace.sh

Sorry about that, v2 carries the report decoded with
scripts/decode_stacktrace.sh and trimmed to the relevant frames.

> msk->first is a TCP socket: TCP listeners have SOCK_RCU_FREE, and
> tcp_prot / tcpv6_prot use SLAB_TYPESAFE_BY_RCU. Reading two integers
> under rcu_read_lock() is safe, and stale values are fine for diag.

Thanks for the suggestions.

Best regards,
Cen Zhang
