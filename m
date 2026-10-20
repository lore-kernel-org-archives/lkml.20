Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792503065;
	b=A2taXiscAnuMB6vU4zrpr0o3k5i8/8Fj4p4HnuR95FAjrfiCbp1i3vA96THlGnSg8bRN
	 B2FUv+Wl/VLCxTbLtLzJ70NBa9AKpgD0aC4wt1+q8G9tMT8ygaUd3EsVYizzWh+Oxx6um
	 n+cQVdb3ejKCzpoMqBU7kGddZmT5CP3upL8M7OJ51WdWaulHSqbTcwA8trNp3XW34NU1k
	 +tWHyJIbVxyPkyVrsqxAHvgoJC83lB62iIPbDOCVYs4vm/8/VCQUIIJXR1pU/qJDmOic5
	 8f+vZR3Aq89gZrUmAVEEztO6p2YUmNOQf9F+AB9qRcDwh5hDhA/ZvKpTuBQfWoIJ+Vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792503065;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:Received:Received:From:In-Reply-To:
	 MIME-Version:References:Date:X-Gmail-Original-Message-ID:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=fgA/Zhp68dHEavBmIayWw25ZtfdqSPSrDKUimhdzG9U=;
	b=wGmHRnq3c1W9cuhoRF0Z3fMoWC8kTw9UuGTLbFWNIrmffVvgA9gt587B3q77Q2LCrI9C
	 0Z6Z602/c/7jpwxd1FjR630a2vergBg8raZLaQQFUOZvNPV/JzxsoKsaus0s67W7mKjpw
	 rWc7/sz+vhCSmHcyFsWRQM1/pwKwnEq+nrWbBQpLqa4P169qCvoyTxz0LtMto+gPpwv1A
	 NfyJEde0ohssCHNvinC1vS9F9GjFNkYaJYgEheE3EWES1JThRL+KShMexm21durHnpewv
	 6OYpnNoW8qtZWWSI3PTHk0SzVofnJ/CpQMVLkjR1gtprarKc8TV7rhnfp0y5gxbQgOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MD0t2he+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31BFE60A5BCC
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MD0t2he+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10C1F1F000D4
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792503065;
	bh=fgA/Zhp68dHEavBmIayWw25ZtfdqSPSrDKUimhdzG9U=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=MD0t2he+fnrS3zQpoa8BP0vzDeJBx/S8lmVYnJSM/nwxdCs0N0tejSWSgHgfY6Dhd
	 dp0PIHrjkeURGp1rxlm529uKVqavWg7Iunn8FHDCwpVSe6bpZcRvn4sKHXajN0yFmq
	 mtNewlO14zf1JkOvs/Y9NNMNrIEfFIYr/mCl4RlD8YjmHyUh3aQ8do9EURXn/36rFg
	 pKSDtS2xd1dmInRJHkt6rFXJGLg5dfT25xYF2yCxrmsVCTBOIfLSGRyisci1I+0PpP
	 lZ/S5pRxUGvAQ8Rr3dm5gdyaNyfqwCqXglu3/CnnOKW+ub/4RQ4FJGEW756rwQW5U4
	 sNlwvYgVyhQ/Q==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3a808f09021so21511031fa.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:31:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwr0W/pkatbZ/SEWa94cpluVfWPRCFM7V89jn0pHyevkh1SyPmGdv+hdgm3SiCs/E98al3xKOTVcvkbfPk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJA0KmUfUj4uGiHc17h+eM5/YqQ5/AxDsbvk3GtTTAbKBxkf695
	YU/M63iYFRZabb4OIykQCcAuYhspiKpwaA231aPbpHiX2jflk3AmQ4yaoiWNJRWprya19hphBN0
	NSKp7GDQo/+CoHyCenmrwi0mUBaCKgHbmjaXhvj7J9g==
X-Received: by 2002:a05:651c:2111:b0:3ac:41ca:1104 with SMTP id
 38308e7fff4ca-3ac41ca13e1mr919641fa.0.1792503062833; Tue, 20 Oct 2026
 06:31:02 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 20 Oct 2026 06:31:01 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 20 Oct 2026 06:31:01 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20261020-qce-fixes-aead-v12-0-77a2e09abd0c@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020-qce-fixes-aead-v12-0-77a2e09abd0c@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 06:31:01 -0700
X-Gmail-Original-Message-ID: <CAMRc=Md+y1SRft0+qWpy2Pj=ZK6TL1hmBWCq0jnVBxYDmQnu_w@mail.gmail.com>
X-Gm-Features: AclHuK8JpK4nWSYDUH42Iv3zGzmNhtB0xqKaw0hDbR_OOIMnU3XpnrmRoofeLP8
Message-ID: <CAMRc=Md+y1SRft0+qWpy2Pj=ZK6TL1hmBWCq0jnVBxYDmQnu_w@mail.gmail.com>
Subject: Re: [PATCH v12 0/3] crypto - qce: fix self-test issues in aead
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, Eneas U de Queiroz <cotequeiroz@gmail.com>, 
	Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>, Eric Biggers <ebiggers@kernel.org>, 
	Demi Marie Obenour <demiobenour@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	Abel Vesa <abelvesa@kernel.org>, linux-crypto@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 20 Oct 2026 14:47:00 +0200, Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> said:
> As requested by Herbert: this is the aead part of the QCE fixes sent
> separately for easier review.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

Ok, looks like there are no more sashiko comments on this one as well. Could we
get the three separate series with fixes upstream before v7.4-rc1 to enable
further rework of the driver? Once in linux-next, I'll also resend the driver
adding the new module parameter and removing the BROKEN label.

Bart
