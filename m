Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 708886FC5
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 01:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791768695; cv=pass; b=ALIDwwcBNTBITSS/1L1vH1I+czr/Qk3rxKSbcWIU1ug7Mj46kWE2259/0PBCQ6GB/x757VbUMgk+nFxKw71bdHIXY0mSGkvDiOrE/tJN6syQMFMN850DokNt5iEIAdCm+wTh+SjlC2BuwQCVeHt4d7AoVWQqYGhra1RioUOli9Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791768695; c=relaxed/simple;
	bh=0Tmomcd8MhaZy7Hldtrvy8J+0kEMP0m4Hbmqvr64CHM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jyuliH7+Kid466JVmk7+qmDeX12Tes8YJd/rbksdT1osuXc3+r9MeKa1qrhoVIfANkn/kp2kALoUb+rlSdkJbCFvuKAE02RB5pslONgMhS1msgSqVUiRD+u8EUEkOZ0FhYoIVqMRRnX9k5GnEBNa8jA30WnoiNDtRAGYDrksxMA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VMf27RsY; arc=pass smtp.client-ip=209.85.160.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VMf27RsY"
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-49e13495e5cso2471428fac.0
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 18:31:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791768693; cv=none;
        d=google.com; s=arc-20260327;
        b=IdkAwygmPAQZzzAZ39IquorTshBYx4dm5L5CWkdraHvPn6oqbE4GzrBZa0aeOm6e/F
         ANcqUuIffDrBb/xKy7ztjs8y3sMm78wunXD8R8KzhfEg0sK/3xiqAuGU1imNMlzIH9vS
         Q59k9ytgckGOpVtJ3viX5512NkjLRijJWxCb+hflmrHC2+u7rn76si/i58VJQNHuteFa
         9bLs1vC2LdvUVq880K7H4rPiwWj8KJiqx7BuNAdNigADsRIaZzwKLmW/bRB18yppPtj9
         +Lx8pwn8Cvl3idZk6/GPnAm0lRJJ7PMNFSEpZAf6uxHBmaZ+LSpMagIECi8P0E/tZTfR
         OyzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=D69tJqwlSEswdhTD5958trOD3brbFNRONjBlwGMF72c=;
        fh=eF0FL0+Ff6EfDXoES7j5liA279XfqB/Gb9UFMCBt+TA=;
        b=I1zI4VMD9ppiE5D/JJ8+MpKhgXpom4lgLnBG617dn/e3bTgRtIpCQ0iVrsZ87Aqy11
         emLzw133DI2x5tY+I3LGxY6bVFDbYlUJCjNsUT9UTbhmKMwihH+55TN8uKvrjMV9AMzj
         /A1UOcN5VKnvwhbZVZWlRwW+B1234NeQudc6nFdb4BKZGpRI78pv+W7OIxaqUjA6rWG/
         piKzDEHCN4JHqexpIR/q9IENTDytqSYOPCcGwDqyDauIll1I1ly0uF9V7ayuALO8R0+A
         p0vBw5ubcR+KfmZXS/BSr+7/RFT9V/faPzz/o6j1MNSyDyeeGonFebQVckTQLgE+m+Xu
         YL5A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791768693; x=1792373493; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=D69tJqwlSEswdhTD5958trOD3brbFNRONjBlwGMF72c=;
        b=VMf27RsYi0oLvZheOLSZ97aWAXOgjYzF5JePCYeuyWBa4Z5aDw/zDRl9WKWwUjtZyf
         /2FYUgKgscP6uTXoyAvRU9gHGsv0VmPkjM0jvKxoXw/+ses5JmMrSXPm7xHCdGBjaV3a
         OVJb4HaYFbms4MV2axx7GZjQbkgdFIJTitq9j3h4BZ8LtZqyQqQ6fgnRrK+Rdcqrc5qf
         3rNHSV4lHOUqN+Xy4QwNj4QXtd9PXBfEKO/O0ncJelYsqKWhiGxG4fXDzCXBG/lctob9
         +o8xyXP9V6ohW+KNZ1ItJ4L3HvGr+c8L4R8U55fALSHHg7CSXi7fXrEhSkG3eakEM77o
         n3MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791768693; x=1792373493;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D69tJqwlSEswdhTD5958trOD3brbFNRONjBlwGMF72c=;
        b=RBOd4dViLMU8PaKtq2oNgYYd7eGNS5FCMIy86CesymwT6K8rL+P0idaKkFRcgMb7+w
         rsj4054nvQ1Dxibv8fjXh8N05TpjPLjXgFcDcqcPlyi00BgEWgeg7XxraVJPRCYKGO/F
         SJLHoXqDskxlCV4WhUP/NRYwjTUSKp0aGwr7etJ5oxlJPTrUK0qJ2dQkSbgRW6Ar7+qG
         Mc6ftd7Cf73zcm99q3BP6ArC9lkNNR0IfbKjcgFTg9x//YF/AsjAgw2vhhVWCYPpuJ1d
         paDWZ2r8OUY9NN5mSl5NaAqKtnHPkeebTMC7S1px6x9h9ulHXwCI3SJwvtJtc+vMupt2
         BVZg==
X-Forwarded-Encrypted: i=1; AKwUvBy8GTB/evBbXbvtMKKiRsHsessbenIdg/lx7zTgx3AkTt20LHHylJ9Q4LCA618HGBuDrk/5n7wsyjR29LM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJwa1A781iM3uqaNMZjzMT1c4wvCV66hOJFZBwuI8uHHZz5ez0z
	K6SQWSJVFxCQeIPnkWBy2HJ93OEBiKOk4p7kJqkCtmLwS7R8m4s8OjAurIEfSSRCRNMyCRLY1LS
	Ij7qkPWRXOJsOwgodhOYjhdKPQRxyNtM=
X-Gm-Gg: AYBFou1L/mEg3F6SoE6UnAbSnySuOBM5RvlvSl+ElRnybgyBz4Pe/ha8umx+w0Mpo51
	SmgT9TfzyXTvLO8oxLwsnquEJsYdFxCjK5M9Y4cwX6QkjPYddLqbXSS/P2OiK5ojxJ6eiKoWvk5
	cY2OOupOySjeAWE7+COXv+IkEaadT8HMkLEIItZ9W1v149A/e3OZqKvlEtegIi6Y32v8SqQ1fDD
	y15vlLNs34EsyW65xElg4wH9WrH2lmr/MUTFr9NWB0qrQ1CQCmWAdjb2nHqiXhXunx3zawrWulz
	FMXuKOPxDmyN5evtH8vsGVFU/3fMzgVjzWO+96M5THvRezW0j5n7BTc=
X-Received: by 2002:a05:6870:b3c9:b0:470:e96b:43e2 with SMTP id
 586e51a60fabf-4a2a8a006damr5468714fac.14.1791768693370; Sun, 11 Oct 2026
 18:31:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1787667315.git.ukleinek@kernel.org>
In-Reply-To: <cover.1787667315.git.ukleinek@kernel.org>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sun, 11 Oct 2026 20:31:22 -0500
X-Gm-Features: AclHuK9zZWuXjCE2LSWgrYCxLXd-j7PFIMqmTq5GuyJPV1RCzAMsJ-tdOzTsoNU
Message-ID: <CABb+yY2Sz4cH-uG4RYsk3DveG6m9OSV_4PQWj-8R1zwUC6PeOA@mail.gmail.com>
Subject: Re: [PATCH v1 0/3] mailbox: rockchip: Some cleanups
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 25, 2026 at 9:19=E2=80=AFAM Uwe Kleine-K=C3=B6nig <ukleinek@ker=
nel.org> wrote:
>
> Hello,
>
> while trying to understand how mailbox drivers work, I used the rockchip
> driver as a reference for a working driver. I didn't succeed yet (so
> it's unclear to me how the .send_data() callback can assume that data
> points to a struct rockchip_mbox_msg).
>
> This patch set is the result of picking up the patch opportunities I
> noticed while looking through the driver.
>
> Best regards
> Uwe
>
> Uwe Kleine-K=C3=B6nig (3):
>   mailbox: rockchip: Add a prefix for register defines
>   mailbox: rockchip: Simplify device variant handling
>   mailbox: rockchip: Convert to use dev_err_probe()
>
>  drivers/mailbox/rockchip-mailbox.c | 60 ++++++++++++++----------------
>  1 file changed, 27 insertions(+), 33 deletions(-)
>
>
> base-commit: a8406e6c0b793ce0788019683837c40855b55995
> --
> 2.55.0.11.g153666a7d9bb
>
Applied to mailbox/for-next

Thanks
Jassi
