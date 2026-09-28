Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BECA3ACA6A
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 06:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790576193; cv=pass; b=Rk394LSj39kDi/CXZNN+Yakoly37JKGAhe49x193891/aYnTUIrAlISs0FutNo6AA3UNOQFlGCMnJijH+CLgz6kNxMFdEsyeX0wtqxS0UGZzAiONsVpmEVj/FL0yvtwPQ7mJ/2M6S1YFFTGOfT8X5XSBeNfmdupq159d5lvv6bc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790576193; c=relaxed/simple;
	bh=UjLMTkNUsMTAhppS3VjvlrSLbd3vV2p7wtKDBinOEwQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H0uJbF8WeLxvztln8lN1uHLqckfVtAOsMaXGesLKv1OksnNoGZiyImei8JQhQ9BxyAdr57XPsG0j+sq4BMkQVZel8p7gXVZfyfELaT/K+hDrJqGcuTqCDdy9EyWt2PDB43wf5ItFF99xdC0ffSg8wDwXlSdJGUF+dCR2pmBPYnU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KXDR2pEM; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KXDR2pEM"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a5d8fe88f7so389028a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 23:16:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790576190; cv=none;
        d=google.com; s=arc-20260327;
        b=I7ddzsRADucSkipenpMruzqfG9cbu9zpA7itGleBt1LuTwXeWsw5WYwxZHnGi/A3gs
         f9zbfg+Qy8PMvuXBLllTU3BcOGthKsPWUaogIdKUGCt3qUBBO1frgP59+7bdVUg5wVJu
         Os98DDrA3wWA2dkWNqdQ9a78t3CKgPVq56lVzp07Qg3QiOQy2AYnjsRfwHIM7WoHuelo
         VMniIaATOgmc/y/xk693Uls0QyO09kqz3NqvKRoy+7gA8MuuttRkVmrtXt4ewUEoOszm
         2pppblT7FkKYa5u+rmqcBWouOe2Hb+kQfiom5qGChmtLvfKVRnAmw44ouO7tZ9riqUJV
         elCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UjLMTkNUsMTAhppS3VjvlrSLbd3vV2p7wtKDBinOEwQ=;
        fh=rjjLbhGOc+7RgYhc7f6h4V123Yq7CkKMcXSrhQYAJF0=;
        b=C900ZUyzFjid1gqB7Lkv9QTclWBxrW8AHO4e0r0aUpsBzx8CTSQdMNsRvGXs6WwrrL
         InxDQrmea/Ia6sMdLCD57K1Ph44+egL/y2u+cyARTEDpJbSINPKjkzzHj21yVNQ6LXaJ
         3lBG/edQ55PpnIORPrTfu5ZNbJJHulkbgmxqU5nFcv9enf1dg0bI01jBBjIS+QnxEa4T
         U7QU075D8PCmlW0OW0uhJk4EnD+DkWpjFft2Yie4aX3/2QW4w4oIFvgFyzrklRerrg4g
         VvL5+1ZR4PRif6YnobTODD9Erbu8QvPxvMa8/T4qKlJXmltCdPckTr4kIsjTNxry34bv
         cQUw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790576190; x=1791180990; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UjLMTkNUsMTAhppS3VjvlrSLbd3vV2p7wtKDBinOEwQ=;
        b=KXDR2pEM1JTLSxBj3wu9/o164MNmf454aZ44Thf2vTM156Ks03aMOJq5qhUWpydv7w
         36dX8Lb++kFHLk7kqmqu4aABQ/f4OruhsYjcBE8lrUwl8ksmWOruS+UZtlJzfC/seFZr
         HavIZXgr0de1ONBuIegYb4ZJM0v0ZtJMGZscsKr/vfVkd41aD/PVymcPgi/6iGTud0Fq
         DLNJpmxvWn50jAkXnKdPy+zJw6rcz5Xy//6P/Js/ftYPFJl2M2R9Rpd+HW9RCE/Tc0xB
         g+qNzwzqph/No56lN78rZ05898pllNfOGRguS5ZYQLXjj5+/cFR16gM1lQ+An4Lxfc7f
         b2+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790576190; x=1791180990;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UjLMTkNUsMTAhppS3VjvlrSLbd3vV2p7wtKDBinOEwQ=;
        b=c8JGXw+PD1csK8PZmZCqsyb2wX0Jd/fTV/5ZCzrM1vAVPBVvlNQpL1X4CfVxPNuwj+
         6SQzqaSLB1fNJPXS99b6fb4Ga19ZWAa9Z1+88n1KXw3PgSKHc0Yy7qFySy6qmE2dY7Z3
         2dyAV/HlmFawX61pu2xIFmyKBXkgmsBdgl6xOU6oKzWFRfPqHIHYGw1f/dpgRzgjsTcD
         707M3ZK0fTx3EEHN90Uo+3iErvHpnK48GLabh13m5brHxeMAP0p1Zi1mTpi4de0kVkO4
         C27GahW0d+A8cBQ6tq0ubrBmLsytoowgN3gOSJ/PvediVX81ObLBsi4QLC6YWPqHZLxl
         k80Q==
X-Forwarded-Encrypted: i=1; AKwUvBwFr6MbbvGiLCUQ9tyuVm5Fy1UVPlDrxKoMdoGmlmd/ZFrsse5ZoPSLUOeM9OFCIfIZSY8l0CpSXDBTNbE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKUQmifUe3DIhxpujGtKR+epQk8jUShlSwcV1fyYfWGvJUtGC9t
	XLXu3Qh3bnQcy3BN+GXsYe2b2M/+di5GzrLjNJeoFYjwPAEXpguOQ9Kb7Fa/M9ANeTpEeFvlCH1
	/smZl/E/cvXvub0wMqmDf3e8qcmSfGiM=
X-Gm-Gg: AYBFou3AynEUBIMvXV5/fWYn9x+Z5qoRSrCsR3qzQ3RHcMRF2TERnff5DH7DyKEM/yM
	i6AV/7imQzhNBJYtndRkhiamZ9H7Fcvvqk2c1xvRJoDQ6jDVLSX6J+PxrF/DverTBl8tBUE0HKf
	MpEprO1VbZI0HDt5kAZVEGE15N6Koj72/Jyiax058rmESzAjLTEkh6B5VgUiSQkh915egXYWBhc
	FaRnwaKzZ2r2dOLEjvVPtZ3FfU+XatKSKHg2UqzF4xqynBolS8POCkgEjyTnE2Gx5aq0EX4ktc9
	3ocUOl7ep+wCI+anNQ20fvY+vxx+wewvNfri2WiwG4vDtc/JHBLAB6+LMwpWw+cNZei+m1Y1Mul
	2MjiI/3Nk1UQ=
X-Received: by 2002:a05:6402:400b:b0:6aa:91c2:63b0 with SMTP id
 4fb4d7f45d1cf-6aae1fb697dmr8189174a12.2.1790576189556; Sun, 27 Sep 2026
 23:16:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260927073203.3694279-1-nicoyip.dev@gmail.com> <7960d73e-e316-4853-8398-144742e866d3@linux.ibm.com>
In-Reply-To: <7960d73e-e316-4853-8398-144742e866d3@linux.ibm.com>
From: Chengfeng Ye <nicoyip.dev@gmail.com>
Date: Mon, 28 Sep 2026 14:16:18 +0800
X-Gm-Features: AclHuK96mTZ2XsqOn0lcw6M7Xfg64Z655RWGZWQn7KbinRvEPkfuuOyZHISF2wk
Message-ID: <CAAo+4rU=hCYRfhQLf4DS-_5xsYqfVfQ0YYEgBj1OLdbbMPccrA@mail.gmail.com>
Subject: Re: [PATCH net] net/smc: serialize sndbuf descriptor release with
 diagnostic dumps
To: Mahanta Jambigi <mjambigi@linux.ibm.com>
Cc: "D. Wythe" <alibuda@linux.alibaba.com>, Dust Li <dust.li@linux.alibaba.com>, 
	Sidraya Jayagond <sidraya@linux.ibm.com>, Tony Lu <tonylu@linux.alibaba.com>, 
	Wen Gu <guwen@linux.alibaba.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Wenjia Zhang <wenjia@linux.ibm.com>, linux-rdma@vger.kernel.org, 
	linux-s390@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 1:57=E2=80=AFPM Mahanta Jambigi <mjambigi@linux.ibm=
.com> wrote:
>
> Agreed. This is addressed in v6[1] by unhashing the socket at the top of
> smc_conn_kill(), before smcd_buf_detach() runs, so no hashed socket can
> have its sndbuf_desc freed under a concurrent diag reader.
>
> [1]
> https://lore.kernel.org/netdev/20260926065023.1629497-1-mjambigi@linux.ib=
m.com/
>

Hi Mahanta,

Thanks for pointing this out, I didn't notice there was a patch
working on the same problem. Please drop my patch in favour of yours.

Best Regards,
Chengfeng
