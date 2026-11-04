Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793802019;
	b=XjEFMKMIU45FOntSIiyB39tUodNFekhC45VOjiUO1TGKuRt7v5ziM0nJPVbXPey600xq
	 7gaIJCGTjWJiCjPDOu3nQN3DpTqlWcLH0Vyn4bpJUSN/J27tm/hY7iZX1mHenRG5AyH31
	 l0d7BWCa3qnKE1kYgjj2+hesOhHSXtFXzBbk43rJP4DlRlbQmS+IBbWxUl6UW5nnMMFM8
	 8oYs4pSwEiIkjxb5685TpsHf17OVSXTnEZ5XjrNyMoMD3vp9p1ZLga5UMmPjDLQwOLuo0
	 suyaDE1T+HCGa+miRc8te1iZeLqbCqX2yWLj3zpzbpECbuc1VEpg08NKYk76kaXs2uA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793802019;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=cTFlIKCtY2beSm3M+7wixuQ4NtEsFsbXStwjOBxwJrc=;
	b=fCLwPZb70hUN7bj7JWQGN3A+cZOPzPPdSI/ZOAq5nSvn+Gp9hjv3yx+/7lnSMeBS6zK7
	 2YomL81ImR5Yw5l9Ayzkn6En7mXU7jBjreK2zCkTpoC4cx9VqpPqD/DWf8RtQ4MZZ8eUv
	 60BbKljrM+48UFuy1n6/JXFY5VsFJJtnLrB6oXWsmVmtUTFJSN7Clni6CnLxqBH8ZXl9I
	 XBERK4LcOra3lQwuSzZ5hkuAFskKgIyx/zoNylL6B0HVMSGKYzlt2Si3BpMNbMTiCppTR
	 FxN12zxft8PbF1g2JhM4laryqv9Sq3G6QD4O0is6NWK512hZ/NZ3Gmbbi63BRXrfaPA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=wetterwald.eu;
	spf=pass smtp.mailfrom=wetterwald.eu;
	dkim=pass header.d=wetterwald.eu header.i=@wetterwald.eu header.a=rsa-sha256 header.s=wetter header.b=afNJZ2rQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.50
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 170B2606A328
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 14:20:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 170B2606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wetterwald.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wetterwald.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wetterwald.eu header.i=@wetterwald.eu header.a=rsa-sha256 header.s=wetter header.b=afNJZ2rQ
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5bfc9154ceaso572323e87.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 06:20:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793802012; cv=none;
        d=google.com; s=arc-20260327;
        b=lRybPkIwxdddb7AmWgPC3r1uAlmwv+eEVSvu6ACyp5HG9B2P8S/oc0PwDc49+mgFfV
         JTG38VgRXyMzqzU+rTJj4SLU9VxuJVOPHJZ3tojbz6pOq2+5Hdf4ugMtn65WE4zg2nFF
         NBr/AONzQVULV5phYLrcc/hr939zteEKvZ82n0/CLW10zdn6fekyAUOtKgXj0XnirSEl
         8/Ol2RWYGSptGcmnEnW7AA5JdWDendPOfc4KZlT8pdUBm0AlItLnc+/LLc28pEsEDjhI
         Hny178YKjTysRBCggHrjnEQy1e+jcyT0GkFQAF4kYMj1ypS/P5aBp2cxQ7Y5wsaQ/qcn
         Elyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cTFlIKCtY2beSm3M+7wixuQ4NtEsFsbXStwjOBxwJrc=;
        fh=QDpEJeRlzqEiDdvEuopF6I7inlJTCzGlulorDCPqAzQ=;
        b=mHaNSSteSbm/Ww7XlKZbcfdD/C2075drMfPt8ASnMyNNIQe94WVOQSme+AUlfE7/wK
         rtqWMFr6QDT/0XUyzHOdEtPN99ylWBdyRxVLOjN405Wp1GWBM+GXeFlKxHi3Fkpuc90M
         oBH0dqA6o0rl7Ms16Aq2SQI7bfk9ZOUITcrtRHesTx5QZ6/7D1cw4zwHtEiTw4Gaz0j6
         Ovz7BiboOGCjmwP1E+DHB5+u6+PccKszH1F6RSL4QwWzBaDI/YTPmfcIroRyhrXeZMW3
         42slF3iku9vGcBlfubeWQdB0h1hha22EEyyOKoQ6F88TTJd500EHVkhmOvQwIxYspkdl
         dmWw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wetterwald.eu; s=wetter; t=1793802012; x=1794406812; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cTFlIKCtY2beSm3M+7wixuQ4NtEsFsbXStwjOBxwJrc=;
        b=afNJZ2rQ9qQx3O7VuiyticCj5W73O+b40pJ8tAqtJqKTnZf+HIFcvIaIhERaunY0ll
         X7O28RnugQ7xeeqcTBPmQ+EZbBuAEMDFhHiEwLMOtPJU+w+omIvBijQpW7bpogOj3pgN
         2si4gMc1LFGsCjcSYoIqIs3z+KwdxMfysLKoy9Bf9v6S/ahsksgkcj+wAOU04HNApQnO
         SzKu+8MGTXpZgT+seFRmamyo60bik8Xg/UW09rC3S2CwwPEGC4Nmr6YEyJkPXbjPpnfW
         rAuJ/P+zH8WZpwWW3Xz61PDUCVDsFnmckTUe32JB4irknwd3VKx/3YsX+V1C9f5gQx8c
         zCxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793802012; x=1794406812;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cTFlIKCtY2beSm3M+7wixuQ4NtEsFsbXStwjOBxwJrc=;
        b=pqQLehRjZ+G/q45zEP/7Dwdue/sEDjwSDr2p8zPIndrSl/TyTFgi5sm1VMegq6rIx+
         v/rmIJPYQtUYTVDN7ndHWaGNwDYHhzBU+SKUlxEacimtossI7aQuDtxvSGWywSLIjyPi
         3lpyvZtRWrNGIIOxI7EnKWV+S0h8FYOOWyJK67Q4FI5eqW7/3sRB4/3hrCN6ulVqM4KH
         JaLiWWvD63ZD5b4F/XqqclVji164A+M6a6SAjE6LiNdtANGtLcM5kkpNFz9berG5bZ39
         8MCmLfOJs7PWidWeO5uKt3fm2dS1K7UaspR5jgTJvNeB+jQIrGF0rFL6Vo3ivnLSA4vl
         Ba7Q==
X-Forwarded-Encrypted: i=1; AKwUvBxz1ZVaYzbYFNfAIUqU6CJJvbXZeXqzsW7CiUlqQqNWA9mjM9ukY+m4KGdnjQF1cGoF6MN0mcAXNbQEseU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/joIrA470vRFK6zFbg4ykTgzaqhwATRdUQ731a4H+muIW6OD/T
	XBnmrKEeBNMp6Q4QqaeSbXI86jk3bjSwKIY3Yqb+ho6qq2Hfu5lcZH4bW4gvOQ20SxXnA0mWzXh
	czCK2FT8gye+90QXAt9/Fz+XuqPF1OrrZ0w+xgvWMXw==
X-Gm-Gg: AYBFou0gq8yzwmQlasgFikI1nDLjhTaKN6syR4CnNo4FYEeGUmam7Vvq1eIknVs5KMP
	wmC5TxlRamvaAzKQ1SEPHH0etyclfyIUvXWIVVRMOh+y5uzzHnpmgmFohuvL9M3IqoTb9sFSTf/
	uj0RYCxKufvOENj02zPIigPT4obZisQBoKjolv59mKBV6G6T/V0dSMoXfqUDHSIDsrt4pSUwu3A
	L3B2s/7THXPW8KBAN8Y9krsJ6sFyvTO9py6wD0am0O87zNSZhOkM+nyAb0tK/vD1IfzC2/Fl6eS
	vr+yTbCEBpG+/CsH4mTkZ4RJUU0o7M1tdGLk6ryd3ieNhBwwqEI1xLIcr0WFwkXBjHVuYJMTrA/
	Ntw21C1NV3TyZgQpaf2aDL+cICzz2fvudzPAWGfZfzdcLZpyxYKQk5SgLCEbKZF3jlBYc
X-Received: by 2002:a05:6512:1394:b0:5bf:d1e5:6533 with SMTP id
 2adb3069b0e04-5bfd951f9a1mr5985954e87.4.1793802012004; Wed, 04 Nov 2026
 06:20:12 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAFERDQ0FpdVvA5VJxOyRAE_pgxnPVmFx1tkZio5R272j6Bs4tg@mail.gmail.com>
 <20261022082927.59030-1-martin@wetterwald.eu> <2026102218-vowel-plutonium-629e@gregkh>
In-Reply-To: <2026102218-vowel-plutonium-629e@gregkh>
From: Martin Wetterwald <martin@wetterwald.eu>
Date: Wed, 4 Nov 2026 15:20:00 +0100
X-Gm-Features: AclHuK_I0DmQgyoOW_ayNCdieQ-bUqhZ24CNIegOfCwJ565mihqQwxeJ6QVlwrY
Message-ID: <CAFERDQ1GeAwFGBQ09eu8p69c_b3_CzAeEfTwiEaVCG_22RQdtQ@mail.gmail.com>
Subject: Re: [PATCH v2] platform/raspberrypi: vchiq: register bus at subsys_initcall
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jai Luthra <jai.luthra@ideasonboard.com>, 
	Gaston Gonzalez <gascoar@gmail.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Stefan Wahren <wahrenst@gmx.net>, 
	Phil Elwell <phil@raspberrypi.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Umang Jain <uajain@igalia.com>, Kees Cook <kees@kernel.org>, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 22, 2026 at 3:31=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Thu, Oct 22, 2026 at 10:29:24AM +0200, Martin Wetterwald wrote:
> > Hi Greg,
> > this is a regression introduced by aa125180c673 (via your tree) in
> > 6.19-rc1 and present in 6.19.y through 7.3.y. If the staging pull for
> > 7.4-rc1 has not been sent yet, could you take it there? Otherwise,
> > staging-linus would be great. Thanks!
>
> This is not a staging driver anymore, please route it through the proper
> tree after -rc1 is out.
>
> thanks,
>
> greg k-h

Hi Florian,
Now that -rc1 is out, could you take the patch?

I've checked 7.4-rc1 and I confirm the issue is still present.

Thanks!
Martin
