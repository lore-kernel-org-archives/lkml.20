Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E00A63B71DF
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 02:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789697456; cv=pass; b=kAe/zdMG0UahPZdbt+mNd/Huc6VT+Sg58VoiUWIoVyH5uh4alUfWQbIVtqJUN88S8yCJzSWcFpttXq75uq5I/H1/QsQvYPV4HWlWBp/QdeE/0lemNAqzjCtB5jWa8raBgsVaWZWknYsYdlJpe4iJg8mUn3mjJiFkN4kjvf81uPc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789697456; c=relaxed/simple;
	bh=1sQBP7SrkiTRTrgayl1ZMm59v8E7DacBcXYFi37yUzk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RiuFTta7WnMLv9FhoxTeUO0XUmNM3wWAz2Q0Q62GLALecEmmodGKb5u6H1G1p5jjWWV/Kv/PgZcNarbgStgzIh3UsTfJXe5N5dRphE7xq4PbglhCMcRutGPwFWX6DrGY8Ar+/gWlVRdGKAu4ipTjcXVkkIe7LchhksxxrcHEi10=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PHl6crkm; arc=pass smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PHl6crkm"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d8fb334ddcso2011585ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 19:10:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789697438; cv=none;
        d=google.com; s=arc-20260327;
        b=hSKXtXD6/hW6Vio1TGV5ivWUGG9kjoVvORfhjOL6bJWByCKDdSmttbUM/YG3Gf/Xh9
         yqIUkflWQfoSYRYGZ591TANWI18rRsW6jAcUQOnC6Z/xK9ulhLQ3KWH2WClPkl0Dd53m
         Ae/0P4LDp6eZ+xoxZ1ug+HAAbef+iSu9enOuvSuVcoW6csX9WtxKqwPQl/d1MzR8uoOj
         AImYtoVxh/JsX2hSwuVpK8W1D3SmZ2YXhHjO+q4FkCMMGtQfxI363pHScRcw0RizAOyS
         +UU9RFbiu6ISh8nPsQ2KeA+DHujJo/d95fbjH511Ysnp8K7DFJy6YF0ZKyyY1Mu8ZH0t
         EHlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1sQBP7SrkiTRTrgayl1ZMm59v8E7DacBcXYFi37yUzk=;
        fh=owtJG34zXOFk3gCm/R2fbTtlMM+WtslJPkis8KNMGYM=;
        b=sdiYhURfnyf8giyT/YBneSpCTeIewMzbyjZHAAv/z0/+6tB3VR1eS9GxVyxTmZOzpy
         Jce3mQK269OQt0TOG3dY4znsGGAbgS1g5WvRNPEmZ9xyu21I0pi1CrCQofLB/OGeFvuD
         w8rDrtUctzrWbCMpUaUHW2kj2LGu0PpNn3h1YXh9qC/x0GFTOSFI2w4l0GW8gPHI8NgG
         kX2+0ZCYa8vpPCgIl0NF/wAv5cjzVX71rfS0ozX9Bx80lA7jgAArpEXi5mm74HG3kPGa
         OJE+AjI9galKt1u6CKRMQtBKKQOluyYBQjCH+z5yFOLsFsVFmFxB7afCA37t3WB+4FQx
         NztA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789697438; x=1790302238; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1sQBP7SrkiTRTrgayl1ZMm59v8E7DacBcXYFi37yUzk=;
        b=PHl6crkm73fjSPV3qwbNtdvvgUWfbFJUu75vjkG0WS8aNCEeA9ORcN7EEAakPNDLZ5
         YB0c1l6muddfY2jMfAQbqpw4I4dWROiCXZF1IOOVHmkEtTxJa7U1UFn9/7Rjzgsq4gqj
         mGosE/A6baJb9wFmCGHdBM8339JPjthQurWwpUx8s1xPYo7g5HZRuOKQzWDUcuPv67RV
         gcwXPG5GYg9XVP9gBkTahTWAq7ffG0ho0Oe4OAspYvF/cVgFb4gtmCith421CtJ5jkNj
         D+sOxmb3qQRRU1EFopCNaNUCXF6nV8AU0QoV5yzEmMUQo5QRJMI6Bav76IMMwcKU4C8x
         vbVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789697438; x=1790302238;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1sQBP7SrkiTRTrgayl1ZMm59v8E7DacBcXYFi37yUzk=;
        b=dkVETUBk8Q2viy9AUvQBRky97S+sLUCWTdqt1G21ddDbjDFR9lM2aCOOoNwjN+8UpW
         +RNEPK3GA8B8JUn35dfU6xPZqHdbMYpJsZeC60sQ1aG7TZingMx0TsfMD18KMuTLBvAy
         BkkAC2UbCXGwCAV8Tsn5RaAWUVz7BRBhJ8akPlIm9Lcn4d+yD5FyUwxnzrxvqB64P+eJ
         PXo7ZD5UYLo4N9z09Lz6iIeOMPkvR+94AaNsSgh8X+/GCSZBgnncMU7lWii6i0mutUby
         93We1uRGS/4A0faW/nR+V796ZC+ckQzNbdSTOESwwRqQt87Zlwqc8jSOciVxlZ+fPVf6
         e/MA==
X-Forwarded-Encrypted: i=1; AKwUvByadXPx22bxKgcZw6KdMO2kCLg9qjOOtSfEz8A6NmhfI441AjYRacX9blzdxcf87caXu5uc0xcXS186kMo=@vger.kernel.org
X-Gm-Message-State: AFuF++me0pD4I5BzDJHXne+r57y7LTTu9tTHrRx+Xtvwr06uuPu0DVa/
	GaVqpStwHmML6aMB2Q5VLwQ6ebTBwSJP3Yz6Ej/XYsYLiJQW6wyywmCt99mCUTc4yVaa+9iSl1z
	obhr/2dQyirDtn6Ttri7SEet4pSu+Oj0=
X-Gm-Gg: AYBFou0rDp2LfyKwCi0lRuSeWu45IYBFUaWuTjOLvh0u658v6fbQd7uZVDmEDejzkoB
	Muf5XPxq6Tybc9JZCWA4EpWHz6iXL86talCOVVgQ2hJHJdVSL6fmMRH4aQpq2JlaJBEpyPSG3ru
	TxYmmWWDVfr17R8mml+9ucj0Bx+TWOEsVqzI+6/zgakt86odc67kFhXx8y7IxoQd0WkrVOLSUr/
	Z0BUng2KJXv/jGzdNGPfcGj3lkPqAu7LbZeOY81Iaz2QNJ50DjPrANXIcBpEFqyg7BXajhLBg3S
	tdZ4aCrQMT4VHfu4AzC6Owyyvl3dhiq8hFIbBPG+Knb+XPkqz2/dlLBmAO/FurtOoSf0wHMIq7a
	4GiP0g/gJpYKfEySqmgFK1+QmBLREc5ypolI3EqQKhcy2zAq69oG57jCoo1bVMjtA8T1MhQ5kiQ
	==
X-Received: by 2002:a17:902:f68b:b0:2d6:fee6:65ae with SMTP id
 d9443c01a7336-2ddb1ab3983mr24249855ad.4.1789697438293; Thu, 17 Sep 2026
 19:10:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260911135711.109338-1-jiayuan.chen@linux.dev> <20260917185926.1bb7c430@kernel.org>
In-Reply-To: <20260917185926.1bb7c430@kernel.org>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Thu, 17 Sep 2026 19:10:27 -0700
X-Gm-Features: AcwNN1X9hXr2f0Sb6Klu9W7uMPQkOFPox7maFcjw4UGshBodQT-bZgDlH6jEEwg
Message-ID: <CAADnVQKaXUj2uxgqerh7N_CDxneg2AgF9VJ2SddG=rgn1de1sQ@mail.gmail.com>
Subject: Re: [PATCH bpf v3 0/2] net: xdp: fix bpf_xdp_shrink_data() page
 handling on generic XDP and veth
To: Jakub Kicinski <kuba@kernel.org>
Cc: Jiayuan Chen <jiayuan.chen@linux.dev>, bpf <bpf@vger.kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	Stanislav Fomichev <sdf@fomichev.me>, Simon Horman <horms@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Shuah Khan <shuah@kernel.org>, Kuniyuki Iwashima <kuniyu@google.com>, Hangbin Liu <liuhangbin@gmail.com>, 
	Martin Karsten <mkarsten@uwaterloo.ca>, =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@redhat.com>, 
	Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>, Eelco Chaudron <echaudro@redhat.com>, 
	LKML <linux-kernel@vger.kernel.org>, Network Development <netdev@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2026 at 6:59=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Fri, 11 Sep 2026 21:56:50 +0800 Jiayuan Chen wrote:
> > I'm always confused which tree(net or bpf) should XDP target.
>
> Selfishly Id prefer net so that all our CI would just run without any
> manual effort on my part :) But perhaps BPF folks will disagree using
> basically the same argument.. :S If not perhaps please switch to net?

yes please :)
all of xsk, xdp, veth can (should?) go through net tree.
We can deal with sockmap poster child until it's cured of bugs.
