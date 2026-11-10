Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794349242;
	b=bVl63s1Ko0/VtwQhWOLe/ZfAxPZB9VFJeTwSmSu7QpJ314W3DvsUHWiKlcOfRWOMrnN2
	 qza55BdyMW9dkAvNX/lT+RUd5r2K+G778t/q3PlTQ9cxiwsNmCB90teVZylyW1j89KWUr
	 5nF6/ImumB8UtELPpqAuxm1yUv0GP96i3kF8IFeua1XikOvzbyJgUJlPPuMvgdwWmgChL
	 V06Z7iBfc1G/ymEpqMGTGpt9B0dlUzvU7GCdf7CELKUoGCeEJH8i8ajdmxaAR500YjXkX
	 nAE0f5w/HZ21HoVUKMaPe4FDAJK4ei/sE2zoZpmImwCmSgCAbp73tbxScNbiUkY4W5A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794349242;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=m99sVTP2KDQCUkIDg8pOb2kGKHgwxWRF675z9CkWM7I=;
	b=UOEskxB1fBeL7roJKc7kizEgb8RIibpGn/VARytBWntfxZu7IZvylT3vYHEYKVSL/bUQ
	 7k068mYsM5ciY9xiAxNOg9T/51Bk4l+MLhq60Dautt7RRTquqwc1G+eAf/P0w1/n6lPIc
	 bB4PyCz074mKnxIuSza9QTbLhs6g38cVnLkqcgmKuaufR1zuBTRqAGqRVOVOHM45R4Q1f
	 SQpMvZTMHxM8nTL/Sf7UOjasEdiDROCWgAFIOYpoiSBbBaIbuaqOgCIcMYdTmUvG7+MRF
	 cKe/4LfHuF/mW7bt6uD+MhQ1M0jgVR+I4pIcX9BD4/BM4ic8vihakVytCPLKZRkQY0w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G2Mt2K3C;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0C70606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 22:20:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0C70606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G2Mt2K3C
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b2237b596cso5587138a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 14:20:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794349240; cv=none;
        d=google.com; s=arc-20260327;
        b=mniTsrEEuitSQzegbgIfu+WgIqWq2RErTiVCYGzoYwON5AqaEOwV6fM+jv48ItaWZq
         an751iC+PoyTVz+b3OsCUgu4Z3Lh+Kii3u2Vt282o+ai7L+VgD6fv42og5hRzEXlJ035
         12YDfxt0F0pOhElJjUwE58ozimLOUjsjW1J4vfupbf9gyIjtX2yFctNwrQ4gy9CaDI84
         chlU8UFXTBZ8PmFtDI/UIH/Rmb45sxXlubi+aSmgkiRxqwH3QnvazGN67TI3c2N+kmia
         Hld01Ps7dlM8frjj/XhnuOLXnvSB78MmGXumEB9RFgisAHoO2IchO6z45WzQtABswqk4
         o8HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=m99sVTP2KDQCUkIDg8pOb2kGKHgwxWRF675z9CkWM7I=;
        fh=2jNQ6Xj1Y2bKdYI3GYOlX+idonBJjVbFY6+r/Nvmrtw=;
        b=JPD2axqfBMx2KcAA8ljQu9zRwDrT2sfn33pQRITV9JzAvpcyWOIkFQIMe1ddmoe68T
         76nHPfY8A69KUn2hLTbHvJgVkw1uy5Q5sCzmEFWfs3n12E8ysLSL8W/Nnp+5UXFObxyk
         mFzpYyzcYrE+TZZMByMFcihxYnafTIGvvbqLRmKikF+doy6Mv4SOH5orXy3qgwziHctB
         CY5BLGMWku7WTp5TfTGwW5M5gK7X1ecZSrLFaq4UBuw37iwEKfnCbrxA5TVo3cKND9Zt
         uofmuOB/bXoqBn3WYkvapaaeMDYQU/0CdGIiaf33+YnXr0KNWQ7gUm0VKNnUa3Hk5qhF
         t86g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794349240; x=1794954040; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=m99sVTP2KDQCUkIDg8pOb2kGKHgwxWRF675z9CkWM7I=;
        b=G2Mt2K3CSbaVaqQu13SHmHisdoZFA7E5mel67+t9WONJFCsyuaK1XhpTPYmI7ODmGP
         3j2zJtKt/5ADN5XdT9PgEpSmw0+u1vo6rohQ3/FUwvL0T1id5OBUeS14Y+HRU4lSQ2Vo
         74FQXaN63BFJnA5G+ZoKM4OMI+eWTquKAYT/aHwCbiaFahK7qF5ZaeAtsG7r74XTEDDK
         sZlIJpr6FcCh9jJyexCIk0txBd2ZdQDhQak2yLBOVzTt7dI8wokRSL1TB4THniUfIrK8
         wyixaeC8hRKE4DzA048cNF79kyhbnYQvrY6bwUqTlzJkJF7xbWFSiQ/f+lS0UtN5EGdo
         deZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794349240; x=1794954040;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m99sVTP2KDQCUkIDg8pOb2kGKHgwxWRF675z9CkWM7I=;
        b=HVInLEOAuzqWcFv3qG2rSA53vzklFnfHNFtEWMLBnsneEcLaZy26stfnFRq65uszgS
         pW81Ar19tQlYcNYETpIz9kZ2A3Wh1ooVnNcAXSt8sc4mzp7vh70xFtXGMdNpp0LYEVMG
         PJV48fV74TgdeHD6oMlHibdrhpVnN1alP+DtcKB+uoL5fazaleQNlk5+5CvxjDwqOUia
         t0x2KzMY4PeRFdzJPVbki5oNf8b/NxCdBSJmPWv/p3ZKW6lmmTvWqcg9gfFOl8bwkkTE
         SBi9zynznVmY1onApLpDxdk8t0jH8RvIXmmFodOABexShvNB021/L8GcgLoh+vkseRxt
         k/tQ==
X-Forwarded-Encrypted: i=1; AL+hErEaRg+/JktLfSS7tZzqGnS4KUCsv6s+lTDzk9Ppi2LLKncubPHaGz5dpeJ8EUG4BkbllofzGizNrLXj3gc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+6zLYWAwbrZ3apG9I5dBpCy/pd8mXPUHp8/BZoksk6P0/c3ziu
	AwOEmJGyY5slLUCxxaBvt6lFLmC/HLWF43mRZAZt3IiQJb1nv43/BpGXZIFvIWVo3xp/CEWfCSX
	zh81SRJNXcinbQziPxnKa597y1tRcg6c=
X-Gm-Gg: AYBFou2NRx57TqmtELEUao1SZcBmaFVk4AHnaiMxjRn8TXgvBwoWkMnsNZoRCc3QYYZ
	73Kzm/53mTDJv3H8nP38BDRqFuIMZWVlzXaxJCumki2hP4KefLvw/z3cswiY4oZOWbtxwkaNzYy
	Sp6o35Ju5EnzetQBj45MGFDO+2eg6AhowTM5sVdLGlyWzh/W2oAlCRpj5JKCf2JQotydgnElY9C
	todw+gs4ag+qOPXJOUnDVVyrd9bubw8TQZ/OtOsYCOdwyezHRioEVCWjKN9l2DGvN/4WE/TsXET
	Oe3B9O19vQ7N9YGQq6vUJ8/2oV1XSlL7jKxw2DCNNgvZbsRrTuuPw254ZzGZCN8YGZK8SQ4kzYD
	DeEqHuAFt402i8ebMVrHETH1j5dF34YRaoRACUl8fHu8RlGew2o/pqIJECfRE1SjzvwROcIWP
X-Received: by 2002:a05:6402:2279:b0:6b4:e433:ee16 with SMTP id
 4fb4d7f45d1cf-6b777832d28mr414278a12.43.1794349239980; Tue, 10 Nov 2026
 14:20:39 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110130956.160024-1-andrzej.piatyszek@gmail.com>
In-Reply-To: <20261110130956.160024-1-andrzej.piatyszek@gmail.com>
From: =?UTF-8?Q?Andrzej_Pi=C4=85tyszek?= <andrzej.piatyszek@gmail.com>
Date: Tue, 10 Nov 2026 23:20:03 +0100
X-Gm-Features: AclHuK9T0jEWuuyeKcsaFJF8n0gaPG1UTvH-Fz13rz1eUpDPmmJS8CQsHVhEDC4
Message-ID: <CABwS-fbOhshTN1KQV81LNRmyZ9cOvJsHgyYnOQvosLUF87iAog@mail.gmail.com>
Subject: Re: [PATCH 0/3] drm/amd/display: HDMI FRL training fixes for slow sinks
To: amd-gfx@lists.freedesktop.org
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
	Rodrigo Siqueira <siqueira@igalia.com>, Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Fangzhi Zuo <Jerry.Zuo@amd.com>, Relja Vojvodic <Relja.Vojvodic@amd.com>, 
	Ilya Bakoulin <Ilya.Bakoulin@amd.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Please drop this series.

As Sashiko pointed out, patch 2 raises the LTS:3 timeout past the HDMI
T_FLT limit, which commits f38686268b0d and 007834be6760 tuned for
compliance. I'll send a v2 that keeps patch 1 as a general fix and
enables the rest only for the affected TV, through an EDID quirk.

Thanks,
Andrzej


wt., 10 lis 2026 o 14:15 Andrzej Pi=C4=85tyszek
<andrzej.piatyszek@gmail.com> napisa=C5=82(a):
>
> With FRL on by default since commit 5fd3b60d9b80 ("drm/amd/display:
> Enable HDMI FRL by default"), an RX 9070 XT mostly trains a Samsung
> QE65Q80T (2020) at 6 Gbps x 3, where 4K 120 Hz needs DSC. Windows on
> the same machine trains it at 10 Gbps x 4.
>
> The TV needs one TxFFE step at 10 Gbps x 4, but requested levels never
> reach the PHY; with patch 1, the driver programs them right away. The
> TV sometimes answers an LTP request only after up to 967 ms, while the
> driver waits only 220 ms in LTS:3; patch 2 raises the limit to 1 s.
> After waking up, the TV can stay silent at 10 Gbps x 4 for up to about
> four seconds, but link verification gives up on that rate after one
> attempt; with patch 3, verification tries the same rate again first, as
> the enable path does.
>
> Tested on 7.3 with an equivalent backport. Without the series, 4 of 6
> boots and TV wake-ups ended at 6 Gbps x 3. With patches 1 and 2, 16 of
> 20 reached 10 Gbps x 4, and the other 4 are the case patch 3 handles.
> With all three, all 63 boots and TV wake-ups over 12 days reached
> 10 Gbps x 4. In 13 of them the sink stayed silent at first during link
> verification and answered after one to three more attempts at the same
> rate. On amd-staging-drm-next the series is build-tested only.
>
> Andrzej Pi=C4=85tyszek (3):
>   drm/amd/display: Apply requested TxFFE level right away in FRL
>     training
>   drm/amd/display: Wait up to 1 s for slow sinks in FRL link training
>   drm/amd/display: Retry the same FRL rate after a sink timeout
>
>  .../display/dc/link/protocols/link_hdmi_frl.c | 56 +++++++++++--------
>  1 file changed, 33 insertions(+), 23 deletions(-)
>
>
> base-commit: 47df73aa49d1988c8f684b7caf8be6570e966844
> --
> 2.56.0
>
