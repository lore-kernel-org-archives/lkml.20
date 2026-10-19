Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 412663D331D
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 11:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792409741; cv=pass; b=oH8VuGfvtrLaJBEdWOqE1IMffjgq1t8xhlhGJj2pGj1/Hcs64VeyobFHHiEowlOed/fFhqmJZG5blJjyjkj3biu/2QOyqe1qQSWflLU9NtfRHj/m8v6XqbQML3bxuHKYermheLfYuyZ52U8sq5+6w2WdQ1aYc4dr2lkiz91ERpk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792409741; c=relaxed/simple;
	bh=y392TKxI9NxK+HxZju6721gEDX3uifjte7V1FDxyHUE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ObBygXtNK6x9RKoaohZxWjML6l8FHFjnjK260P2B93KXFmcEQeitG/VnrHHPdJ5+df4Eudk8b3dygFuTAPTHkQvnn7mbJezjAANK+rC2SnfF3oew2KyuPyZTcmu+Bxjz0auznalsKhPkngvM84QYs5HT6ZSTO5y5J1+YI1ch7qA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bjnXzv+T; arc=pass smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bjnXzv+T"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5bb7c6980f1so1592249e87.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 04:35:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792409738; cv=none;
        d=google.com; s=arc-20260327;
        b=HQcssBoujIZshk6G8mjWOKqGEB4oMqtwZao2CI6XobMsr04U3I1JRZBHEt9wYtPU4h
         djATkQrRKaOG1TdJOqXjUT1LARICaBSf3FErRz4skEDZqsAXisZYfOsVLmh48szSFLKo
         aKz8dYmTv+0iDWUba5V0/GqLBC8A2aw7wY0ocPSx66AL91w020Dq3TD+jkBec8KqKdhd
         vQCvpYTb5E3LU8+iy3YX1UuiIJh4KRjmyG+h7GGk0mIoDcJosqcwx6JATZVfqY/S30KB
         rLLpD10hR29SNRJiJ+DVKoE5GIZudXjEPcO+aY2pa3R2prOI1AYjVSJDKurOBmxcE02F
         AxEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=koS0XoT+3CWL8eMG9x4Bhcq/7nCXU3LWxtlSg2MxqiU=;
        fh=PI2N2wAUQutc0mRopaseJ+k3R09UWiYEtgWXK5uF/Dw=;
        b=UsIfIl4OSkSKHRgCsd74R2eeeEEp1dBKr7czzqVNS74JN3skBiVUIxGlybqugJxRS1
         h+Q9YePjC+r82pZKINJNYJZT6lDVS3WP5N6p0rUccyKw2abPVJpQLzXoonzZvNJcYQ6V
         dq7lp4Zi230TJBcO4AuBHHASXd1HhjzZZVEzOL9yln4yc8pYXR6ERHyCiJpYFrXGNTdd
         ZfVllz0XETc2dVBveLB9+Sq/E1Sz3S17CabV5RnEV+6wEbPt1NUjBY2XUJTtCGoQ9vqc
         IEb28Q3JMHJMB87CggD1PfSR+D0XeBEoI5iZUaos3pPLUaxvLydKV4Hu+wM4I4dVpNyA
         lM6Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792409738; x=1793014538; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=koS0XoT+3CWL8eMG9x4Bhcq/7nCXU3LWxtlSg2MxqiU=;
        b=bjnXzv+TBUQuypXXr0s8Nh4syaUK6AQxcOxTbgcpzk7eY4BtTmAcds4PU7QzhjgPqT
         Oq5R+pnwdzNJZVd7xKhnflqX0RQkJXppWnZtyvfxYY91IEz3iYhH9BM8/Dxn+RhKEJnT
         E1f4AO4RVLsdQJotpERt8Md6niem22wiuEtBwnmVmvRFMmkDtTzELzSjB4TjOJ4KMeB+
         88yViLIXuTh+6wvB+ba97qNcppNg8zaojFswZ2cXu+gSZdpXBDYe51JjzdzOrQgSfpkQ
         gTt6mrC23J5SYBP8QEol9BHPA6JBaQWK4fxODLsfR5b8r6omutWNtP6Vdq+tPLWCZ3RC
         7Hmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792409738; x=1793014538;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=koS0XoT+3CWL8eMG9x4Bhcq/7nCXU3LWxtlSg2MxqiU=;
        b=cFfZo5EfQ2T5ZekV5ln9QTDYZEhoaebli23QJBqaCuEq8fy2eI+OmOtjfUjHG3evVH
         viTrVmmESbjQEsPen3VA/Vnrip9bcZSCVY4yPqNjqmxOGCySoCy0I7/SekDXZnZumAsR
         vLlO42w/qQQSlwX0LuzZOM9IpX6fVWFh1QBwDi8AbbHTLuZWiEuMaKZhyeJPxsmkvktl
         YSBJSjC/2FTXJFJBZDrwdso0grLgj7VSxS2ZY10FeOWqtB9mtdvlRKEfxCVM4d6geyMm
         6zTJsMVAXeJff3SHORESEPmb5d5Rcm9TBg+xV1wHggrwH+wQjzASRjHQ/CCyeUobCVOV
         KXKw==
X-Forwarded-Encrypted: i=1; AKwUvByuZdM4fFdZRu+eEe4R62Jdcj6DAOr+ipn8or/YZ6mmDDkqknpm1RRcemtpiZcq3bIl4BidIbpuifeKQfM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIXSl8PJg6ncwU/d/UWrn6aFsBHyQmB/kRi5j75xE9/0bKAGgnU
	E+ps7gAdTRZxhFH/YDu8hPhr9mvxDpoQdHopSRNHYFgP5kQ2atvwASYbXXhFELDVNCZAQinuO4+
	nOAO0fwY9hlV6BKJ96CW2FtjlyHmcaCe9Ta1udjk=
X-Gm-Gg: AYBFou2cInFK8A/CNrzYZfIkGHDZP8h6tOmNb/PhdHaFySID4QpXEDpLm/JrrPDfNUn
	DXoezdcYUrvHBG15UcQLfBWY9VEgoBn+PAj9StBYNoPeDHRQXyfuRj1NvCxnDmazd1TFkmS6tzW
	fh/joSxRL28vwhhzMpmgD8P7kHAKXCwl0ykmj6mzPHBTVyC3nO4+jA7UOjRCsuMZ7avF3UhlQ4k
	f2u0Lg4r40hQugCsKGL0USGbj2iaXKFgXVkXKoOnYJu5UvD2WioqSdgDPAae/xs6wyjeGLqqqqQ
	pnPT94kHSXMRXrA7LRJ8JnRigLC6L1QzhEH6t1hz4M6OQVu66K2CS0nuAuDkrKhkNq6H3Uc/9Qb
	oM/5Mo/nCAGA=
X-Received: by 2002:a05:6512:10c9:b0:5b8:f3b2:429b with SMTP id
 2adb3069b0e04-5be50a96f8amr2627956e87.52.1792409738088; Mon, 19 Oct 2026
 04:35:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012011707.3378-4-sigefriedhyy@gmail.com> <179185709988.434549.15422498299449004512@kernel.org>
 <CA+7S2v+LHUWXQMD-cYPEzT5-f3Qhw_vz+LEssQH_A_oqDKtnnA@mail.gmail.com> <8dcd9564-e9a3-4b00-93b8-3cb023d68047@redhat.com>
In-Reply-To: <8dcd9564-e9a3-4b00-93b8-3cb023d68047@redhat.com>
From: Yuyang Huang <sigefriedhyy@gmail.com>
Date: Mon, 19 Oct 2026 20:35:27 +0900
X-Gm-Features: AclHuK9hdAIJx_qrpjOoKdOt12iq2yhV7pVdW2_mKKi8adHB_hqpyRSgWNesDcc
Message-ID: <CA+7S2v+rWYvz9xKPEeM6=3HPz3o7TbX2uRfRKk95f9Y60HnEiA@mail.gmail.com>
Subject: Re: [PATCH net-next v11 3/6] net: add a generation counter for
 dev->mc changes
To: Paolo Abeni <pabeni@redhat.com>
Cc: netdev-bot+sashiko@kernel.org, ajay.kathat@microchip.com, 
	aleksandr.loktionov@intel.com, andrew+netdev@lunn.ch, 
	claudiu.beznea@tuxon.dev, davem@davemloft.net, dsahern@kernel.org, 
	donald.hunter@gmail.com, edumazet@google.com, idosch@nvidia.com, 
	jacob.e.keller@intel.com, kuba@kernel.org, johannes@sipsolutions.net, 
	kees@kernel.org, kory.maincent@bootlin.com, kuniyu@google.com, 
	nicolas.dichtel@6wind.com, nickgarlis@gmail.com, sd@queasysnail.net, 
	shuah@kernel.org, horms@kernel.org, sdf.kernel@gmail.com, 
	vadim.fedorenko@linux.dev, willemb@google.com, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-wireless@vger.kernel.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 8:19=E2=80=AFPM Paolo Abeni <pabeni@redhat.com> wro=
te:
>
> I agree this is not a blocker, but I think it would be nice if you could
> follow-up on this one.
>
> The solution proposed by the LLM LGTM.
>
> Same here.
>
> Also, still speaking of possible follow-up,  I think it would be nice if
> you could change the addr list lifecycle to RCU (no idea of how much
> complex would be that).
>

Thanks for the review. Since we're already at v12 I'd rather not respin
just for these, but I agree both are worth fixing, so I'll handle them as
follow ups.

The first one is a simple fix, so if v13 ends up being needed
for other reasons I'll fold it in there, otherwise I'll send it as a
separate patch.

The RCU conversion needs more thought and will probably
cause quite a bit of churn, so I'll try it if there's a v13, and if it
gets too messy. I'll post it separately later.

Thanks,
Yuyang
