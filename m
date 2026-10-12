Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62D96422533
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 19:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791831978; cv=pass; b=hGxrl+ZYGmtp8/3AY7iWZPglXGpuuQEH2IsfvKl6mcA1TwmrTENAF1IOALWdmUEc0BNhZC2Q0mMqa+faq1NCsqhAxYUs8SM1w4jwUBaZzJbkQrNAmWslxW0mFC9l4n1I/+nS+TBuCbvz5M8093A8TmMHGB0q5luJT/jtNQYx5NA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791831978; c=relaxed/simple;
	bh=QLp3HKsqGsshDCWSPd0ffrvTNfaxMvsL0rFxADDYYVM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DRMxkbtWxEWj6KBuRzP3oEew6BefXaDv1RtmbUnMcahLk/KRwJAmQ50jKdxc8g4sbkjztNhWm1lF6P+iNKbx2KRqAYPAqLXUIvSRgQoEOIK8fheGLrmOksGD2EqCu8/qSYTTLGHU/Zgu/rP0HgMtshdFtADnCWHcFA2McIuOxss=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I2I58Xd+; arc=pass smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I2I58Xd+"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3a87e23860cso25168961fa.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:06:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791831975; cv=none;
        d=google.com; s=arc-20260327;
        b=q6D7M/Cf1g6uj1F8T4sgNARuAGYhqSJVGF0d50g/LZMx3gklTSMvA6p3XOdjQFadRB
         4neNzy4vG9/XrL698IAG2mTY6uOiwbK3IZJvoKZyE839wl6ot4T87S07HQEubjx4G9ft
         bk0jgIFKiY5ErNglg6ygi53GKDJZmtixaLvksnTKBJ+4k2dc0aYKK1FartOCJkQ8EbQN
         W1PUfQygkgPYLfA0x0r6y39ClQYmOkLdE8tecFJaM+bNTegvJ5qxiGX01pr1aA0JteDQ
         n+xjDo/YM8gsEfxMKEqrgD2BwQt8nwIqF/C3FzjXe9J9NQMRXLHnlyhaHavSFkW2oNXU
         tOBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QLp3HKsqGsshDCWSPd0ffrvTNfaxMvsL0rFxADDYYVM=;
        fh=uez9AxxnWwkjS81LfhJO0Slp8HVmZ57nC3WsRv/2JxU=;
        b=bojV9hTmJQO0/uwMlGGXKEU6GN1BcFcijr1c1afSN1gzQ5Uw6yp+baS44c46Z0ud2X
         0eOBNbhVx9y1oYdTEkE2Q+/RJZok8dHD88spaMlzFxyMyUzYnpjV1OKT5PKYhvPeILQJ
         /XdhkozaYSMNkKx1qYLHWP5uqoej7hch2IWJhwFFvtajNgCH6t2LpRKtArvjOt4B844S
         ubffjE0sxycpLw/ZTcLgiz0Tr4E3m7m7N2vn2a9BN72zq6fJYYIpX5te/lJOQx5n7sl1
         89JX7IjPQueMHyBrz1+9ujMi6E+buN4t961fkMaRRAW7u+mpFJKQE1J8JFiQkQ8sLrdp
         XTrw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791831975; x=1792436775; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QLp3HKsqGsshDCWSPd0ffrvTNfaxMvsL0rFxADDYYVM=;
        b=I2I58Xd+n4pXn6kfPLew1OhAimo+xaM7Kn8fT2nUOtxKCPV4xKcRkT0sj9Kxgyo9Zv
         4RAKXQsuIfNT8xMJYfjiGceVCsW69IFJ6OZ0xnni63Vo3shUSPwFwoTIOCIaWTyV1qKj
         i9ZJpPDP0Y0VSHbGyF9MtcyUSF8WQG8sGqrpHv1q6Fk7kBE5QjiEM1TrptzWRHjN9LAm
         T4OiMVcF4Wf98CMux+Z4b7TEo2UEXO+cEKP30sCio6aSEylJZAIVvfAP6tMK+0J5Anrs
         M3drT5y6rXWH7996Rv/CvIIdSR1E0Lb05Yo7W/q8+ptWlDmqueZvf6Ab75XTfbPa5l24
         iZlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791831975; x=1792436775;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QLp3HKsqGsshDCWSPd0ffrvTNfaxMvsL0rFxADDYYVM=;
        b=jFh9AOkGoY0rENqvzLrdW6L6LliglYBbwPaQkoOPFf9DNjfnSRIuADXOHmV9grh8F4
         jdCty2W9/tnB4hQCuDw89sQFKZpux2MVt73AcZU3EaCPfoHxfX9Hi0RstmN7EOILJnlP
         uXex9NHQ3rEry0PAgEX9Ru+oNPtF9nLZ+hErmi0yNAztqb2I7Wc9n+YYW5L8l3swSvVB
         Ea+oABcLdjM2vl454SPinCwFr6sxW2eCEqHflUQTG7Stp2kymP5egOyu9KzVwzXD8J1S
         gQbGLgbtz5K45RTlqnaow/sIHAnRfUIII6ooSI8FVKf4ptYN+bzWwx9FSE2X52t28G27
         jFBQ==
X-Forwarded-Encrypted: i=1; AKwUvBx0YYjEBMJWy+DeOWL00W294U3KX1pzKaOQQjUC0yYZYMFXqs8w17JA5IjpD6sLinsZD1EoTLngeoBex8g=@vger.kernel.org
X-Gm-Message-State: AFq9FYJIuedSf29S1wjBS+QmqckLSAIxyBqhr3AxD215gdsrNM+pAztu
	dJhHWw3Em9Jq5QyVae9e9LpV0eOSoIBYtQQXxRaGMRtlFSAlAKUjzs9jmKp46XY1ratNoAyL+xj
	xa/CMEwNIEkMyS0dHbbSCZV1jHdAXPOI=
X-Gm-Gg: AYBFou1K41HD8AOuKgFSeYSRfBtQXoY8MHvICjX7395lLhnTMy3Q9BgSrSayKHW95qM
	UFco09f2mmpkFE32UVxq5qL3SeCEbj0wPreUfKnXeFP9h4leoRyjSVw1AisvADW3iW2D483uQ7B
	HXF3cgaEtpjw7JVDpqgfVRGZl5FxyaOF845wMMesh6Vtn4gBE8S/RsdCUcRYjLJcIFghShfPA2V
	O2nXyR9OSd3PB9ulUypNp7+nCYu0Iz1PtFn/pSRSoBKknmnbHvTCdiWKUmPcRARzMkh08fKcm32
	H2ny514/ElXDatx0vx3swpuqB/3w9pgfUFIiwhYJeC933itjRtYx8NdEqZxY640L80NZcL+ynLQ
	EBbVPCDRSg7+yIQSB2+Oh+O8t9Wqwi9ZMGXPLnI9ELamRp6NdT/+xFIottatZM4dr2/EHRGy9xF
	GK+cmDtKPv58UnU9vOhhJ5/9Hk+EGBPwgnhTcGQxBd
X-Received: by 2002:a2e:be88:0:b0:3a9:9eb0:de86 with SMTP id
 38308e7fff4ca-3a9c2b2bec4mr24167141fa.16.1791831975227; Mon, 12 Oct 2026
 12:06:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012161322.930099-1-johnsingleton@google.com> <20261012161322.930099-2-johnsingleton@google.com>
In-Reply-To: <20261012161322.930099-2-johnsingleton@google.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 12 Oct 2026 22:05:35 +0300
X-Gm-Features: AclHuK8fAF2fSWnfjrxj_cT8t7W-huCmBhhYSwYrfd_UWmKMMD4Pm4VmZJDTQS4
Message-ID: <CAHp75Ve0jonWgyAQrXXa3L84zw=ZsgW9U80UYpkKtWVaMYgjjQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] staging: media: atomisp: Remove extraneous dev_dbg
To: johnsingleton@google.com
Cc: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andy Shevchenko <andy@kernel.org>, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 7:13=E2=80=AFPM John Singleton <johnsingleton@googl=
e.com> wrote:
>
> Remove dev_dbg calls that (per checkpatch) are duplicative
> wrt ftrace.

Reviewed-by: Andy Shevchenko <andy@kernel.org>

--=20
With Best Regards,
Andy Shevchenko
