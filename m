Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792464479;
	b=wArZfd1ZYiI46BbXMmBPxv5Fl2ngArDOvZR9GfSuZqBaHh3iTeED07x5KE1xmNsg+X/H
	 12XoXTbPX8wc9UyxHecHN7i5oo3iuvZNjCNlI8ifuVCNT27fBm5GRibEbbNSFCBbOQwYS
	 ke5pfZjMfyJzrY/DNpZNI5fskzce/WjGqpqGpiQTcCqfovGJMuEr+776tmV001KRW3Exu
	 bbFzCt32gcxs0v7VQBL4RRhhh3hfhUEEYOWRq0xMVs8cZAnUyj6p8ToQGuQcxneo54HRI
	 LiVf5YVpzj5LShygBDSe5rfVMhuznmXiK/jv/pPlRrrd0IZtS++EakTBoa1cTFlbrMA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792464479;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=262A8gCU3R+nsMKHC0ROKoLNJtacXiiDwGq2rzQbdsg=;
	b=wu+PD10heVyE9I5A9oU3ejcSYs2UZK2tdX3qqV/4yT/cwzcMHca4eABC8ov2ruPWcwcJ
	 nCK57/yi0E5C16ZdNYvCrz7O7QzDbXBb5IqjLnorQKDKkdD40Feq97pjEJLxqzwLMOnAG
	 Oe4KqBjSq8aGXoHh1ohV6/m1zk6NaCR1TqVwU6R/zQ3CYTXjhweiEhnf8tRYnbuq+2/tA
	 seHgrYzP5Kxt3dpAPr+3tl9veGlX2/LYBbgKqYvFtp+A9+fE+wTZEo09HTY8ky5IlQVwe
	 4TGoBPaOkhujIFJBNGBW326EjVZs17leyy2rLsXFAuCZFjuitneska4y6n6VESk/Lfg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nagashi.ma;
	spf=pass smtp.mailfrom=nagashi.ma;
	dkim=pass header.d=nagashi.ma header.i=@nagashi.ma header.a=rsa-sha256 header.s=ggle-ngsma header.b=fXAkdqJz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BFC3606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 02:47:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1BFC3606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nagashi.ma
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nagashi.ma
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nagashi.ma header.i=@nagashi.ma header.a=rsa-sha256 header.s=ggle-ngsma header.b=fXAkdqJz
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c247f6687dcso222909766b.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 19:47:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792464477; cv=none;
        d=google.com; s=arc-20260327;
        b=QA2AQwZoos76nTFnGwe8DqoncFB3rMgnCEwr9JYsFcUnhHLqMFWnpwfwwQLDXQBSii
         VCnQ0mzN0ml8mkpxZYkukRm94Bvfm3fJ4yHct1gSSG1XNv6JRX9a4bmfTgxXzZnMdBs1
         ZetONuG4Rh4uoPWaNnd0+fwgvK93LkXFR63HPK4sMJyYTfCQeCmugJjVprxPDONw7T57
         YRBFOAMkflzloqsNl7WJ7EXoLnrl1aoWkQFq+V9Vlmlc4+39++w3oOF8or/s88c9ddQJ
         Hx2Rd8z9qpqOg1s/IgMsXGLp+sSSr0u+1q+uDv7LrTuGbR1sMw8HRb+f/Uh67r4visYc
         vReQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=262A8gCU3R+nsMKHC0ROKoLNJtacXiiDwGq2rzQbdsg=;
        fh=BGV8K6nLMA/4tjVqXaK/meCMzoIDV+Z6fpF0mf9SIak=;
        b=aktMnpp1tMAs/AFVUymsPcsyGn/pqgCUr0+TyR/96s/oQXCA1HsnwqlzTBKG7ldN6W
         b9BG9gntoqTkmS1xE6vMoAmmWGJPMSTa5L0bCKEy12EoSIZdvYEDWUaBckDzBHlZa//r
         txeeXUKGdw3fZWwhRRWw7HzroMv9yfs+otbmAH+42sQMIY0HFkwzNXU1CeSE5YbdH0u/
         cXJzym4m+GQsD3Gu6zIMB4ciWJtpAvWgMt38uqJZvdQY61yfFLa0gc8Z9RYtGFcNUyNo
         M3CEOHN5TRyl9tkxAYkUPJf4W/vLNmPwRe0u6ldXQexaXUQAr/3eJw6koINFivQMFwc5
         0Aqg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nagashi.ma; s=ggle-ngsma; t=1792464477; x=1793069277; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=262A8gCU3R+nsMKHC0ROKoLNJtacXiiDwGq2rzQbdsg=;
        b=fXAkdqJzvQuUBW9qPB8S04MDheV0eWxfHGJ+RehyNkav0Tf+BRNBce84cb8uhSVQ/X
         TOTmJo2HhW5VDdrOWK2R3UWMIQXQLk2ByC7UuSnz2PbpohuA9uR6gHENB76x21stx93I
         fymFJMg9H74cdUSubolATOvMb1VJj2QfFVIP2Y7FuaWXiAxf+AQKprW/ZUoHRiO6FsAX
         3LIpNW0eyT7ArWNI4roEHqHZQjId1uS2MG0es/m+XAOr/1hlH+kxt2T172sWl0rc9TgR
         j1smMOt5mRFvTEorGWhwu3pYXfWqQEiUZhphygzSmSdLaIT5tscRBPC3ZYYufKMYK383
         HdQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792464477; x=1793069277;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=262A8gCU3R+nsMKHC0ROKoLNJtacXiiDwGq2rzQbdsg=;
        b=iC9jfJ2KUVZ0mkVU/mn/naqFgzwfes8MpEWdl32bA77g96UQncKRCl0KSOWZHFH+gZ
         QfF0WXK6JfHj6P7c+GHNvsw+y7G5+vR5SdIMgP1pKDFtedVPW18h58Wno7jEf1IfLQEG
         vINgkDFFpDGtCQp1Pk2y/8zVoQXdXduP8oWblGjDNMVoR52CmFW99J0q4spo4f2pfmvH
         BTE5zLCZajQQus5eDdrYUylWdro33nr+49HYD6dhNCHUbBlaRwerlP+qOBtH7QHvynXr
         T8+Vr8QROypjcOm4vMxQeHIMnURwABQyAqm7J3xp/jmn7xk0soti+11DjHxRMAOEPvVk
         NgAg==
X-Forwarded-Encrypted: i=1; AKwUvByrDdVj8hC1dx1l1HIYasbW1QSeUurTGNAp81sJN+oZWnAlUG4Du3Fm9ce8GYPq+F1ZhzPFiySrqeguceo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIXLa8U+tI7ZUBUeatMh/Zyv5XhrVppWX9ezcGBZGok27s+iDu1
	7d4lNvV5dEVf960/lfrPK4eDB+uLmyMlpT2jTb9uTWUXrlk/IMWdX00T2gY9k4RNf3WGsFZHYq6
	A03FoLoxYBOVGFFEaRgzCA8Y+kBKIhLoAZCQ/5uDsb0r1INf5JKf656IA
X-Gm-Gg: AYBFou2pYH/s+IWqrfW7T7bqqk2BHn9ivWL2JA/Md3sww5JJbbqvxjeKs0R3rhcVZ0E
	rbFfZJAZA4r6xUbx32AlP84D4sX0jmjJGmVA1IEJlxOsx4PIGm4ExHcvW3g4nmZBu7U8yJGfkN2
	IFS6g9H1Rm0/GC7f6UBgwaMrL2iN325Nj2BsZ+y7a0uWe9Pp9a6fGbbXkH/Z8Lo74/+vLGjCWoB
	HWfO8ht4Zhhp/KlC7Y3T4LQgWOAz8jkpbVdz8v36fsPrqESTmadDF2hMxhot6Pt/c8rneOLLpZp
	OFzgCFrqjqZhHExv0Mqf7lL/8Y1hUyBQVlW8EgElb6CuFnNXj5EbL0+03TS8I9CUyY6Q2RCwIIv
	O4zp8RMcvmxCqcPcgJbATEIamXxGJJOmOjZyc8hD1JaebACvQ8mg8yRAgHv9+RNq0iMMzRmorXX
	fnPjyC4Vs=
X-Received: by 2002:a17:907:fd8b:b0:c40:dead:7466 with SMTP id
 a640c23a62f3a-c419e538580mr642966966b.20.1792464477048; Mon, 19 Oct 2026
 19:47:57 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261016-ath10k-series-v1-send-v1-0-c847697b3558@nagashi.ma>
 <20261016-ath10k-series-v1-send-v1-1-c847697b3558@nagashi.ma> <a523eda4-5708-4427-a044-a61c0386e5a9@gmx.de>
In-Reply-To: <a523eda4-5708-4427-a044-a61c0386e5a9@gmx.de>
From: "Nagashima, Shunsuke" <shunsuke@nagashi.ma>
Date: Tue, 20 Oct 2026 11:47:31 +0900
X-Gm-Features: AclHuK8Iv6DX-6YiVsBJ9gddXv3oItLrT6nCv_vwkm2KhJ4WNt8Fui0S2e66i0g
Message-ID: <CACB3TCJVoFbMEpbtvuO5c-udCoZgDvMBeH0RXUXp90hab3Dh2g@mail.gmail.com>
Subject: Re: [PATCH ath-next 1/3] wifi: ath10k: set the PMF peer flag on WCN3990
To: Aleksei Kharlamov <aleksei.kharlamov@gmx.de>
Cc: Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org, 
	ath10k@lists.infradead.org, linux-kernel@vger.kernel.org, 
	David Heidelberg <david@ixit.cz>, Fabricio Akio <fabricioakio@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Aleksei,

On 10/20/26 1:04 AM, Aleksei Kharlamov wrote:
> I independently found the same issue while investigating connectivity
> issues on fairphone 4 (WCN3988, qcom,wcn3990-wifi, slightly patched
> kernel v7.2.0-sm6350, firmware WLAN.HL.3.3.1-01704-QCAHLSWMTPLZ-1).

Thank you for the report. It is good to hear that the same flag helps
on WCN3988 and on a different firmware branch. I have only tested on
WCN3990 with HL.2.0 firmware.

If you have time, could you try this patch itself (instead of your own
version) on the Fairphone 4 and reply with a Tested-by if it works?
WCN3988 uses the same WCN3990 entry in ath10k_hw_params_list, so the
patch should apply to your device as it is. Station mode only is fine.

I worked through this together with Claude (AI). English is hard for
me, so the English was written with AI help. My results come from my
own device tests on my comma four.

Thanks,
Shunsuke

2026=E5=B9=B410=E6=9C=8820=E6=97=A5(=E7=81=AB) 8:04 Aleksei Kharlamov <alek=
sei.kharlamov@gmx.de>:

>
> Hello,
>
> On 10/16/26 02:17, Shunsuke Nagashima via B4 Relay wrote:
>  > ath10k sets the PMF flag in the peer assoc command only when the
>  > firmware file advertises ATH10K_FW_FEATURE_MFP_SUPPORT. That check cam=
e
>  > with commit 90eceb3b5fb0 ("ath10k: set peer MFP flag in peer assoc
>  > command"), because at that time "only firmwares 10.1.561 and above hav=
e
>  > support for MFP". The WCN3990 firmware-5.bin files in linux-firmware d=
o
>  > not set that feature bit, so the flag is never sent on WCN3990, althou=
gh
>  > mac80211 negotiates PMF with the AP. ath11k and ath12k set the flag fo=
r
>  > every MFP station.
>
> I independently found the same issue while investigating connectivity
> issues on fairphone 4 (WCN3988, qcom,wcn3990-wifi, slightly patched
> kernel v7.2.0-sm6350, firmware WLAN.HL.3.3.1-01704-QCAHLSWMTPLZ-1).
>
> Setting PMF peer flag (my patch is crude and very similar to yours)
> significantly improves the connection performance (please keep in mind
> that fp4 seems to currently have multiple other issues, such as missing
> a correct "board" file). I only tested station mode.
>
> Thanks,
> Aleksei
>
