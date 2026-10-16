Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE12F312825
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 13:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792157452; cv=pass; b=YZqJ9Z2xy02YYBpBWN8seDCpUGvLK8L56NfqWEU8aWsgOQUA+622Jx5ZDWWsHPB+OfIFP2P4QYeAUawcv1P89nBbyF8seDfY38zh24HR8NZOl8M1edwYe9bTNQ3o1Sg6ho/DHHl37Jf6Bti+RevmYUZB5uejNmkGPZYpD12lwFQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792157452; c=relaxed/simple;
	bh=Tg8osBMlJW2gUg24u+geNatqsk8I0c48ehEw/o0APJ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nvt8EWFNQ+sm/dznju20W7sOjV0AOCQ2iy44SbN8aSkaIaNkRtVeIW0IYfvRvlu5o2XxjQ7NPcWnXl3z5GA+MK3nIRf6CGf6ANGIWPPcW95ByPkBHaGJlGz57rd+zK4qLYumGBw+xMzZeCoo4MCc65Lv0xzTbuNSsUZc3CFBei8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=drEAeZ4I; arc=pass smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="drEAeZ4I"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-888cbacf70eso70518287b3.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 06:30:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792157448; cv=none;
        d=google.com; s=arc-20260327;
        b=ZpbManafe5dp6R22mWoBnw+xg2qvilXbRvDdNoOV55mdhIqBnNX2OujJscmK5i2ia0
         e2XOljAs3w+tJqvgfVh++4DbQ/xpi++AD6mxbs9MrTE/AnOq/HdfMi6fDDpUhkb5SS2c
         WLVwEZ8R1v086jGHyO39riuFVX/P7JegdSxfrELV1202PeBAnzg9FBllMnoodhaoZaKA
         37WVK2hQx2qewLzHuMXrDqhH1R+S7qFL3wQvl/xM0CKKosaoepZNuAnFBJVPWjUPo22C
         npnhy+q1fcjFq4zZhCOIKrbNbse9U0+YST3hpTK1q8Ei3xuqh9/7DqAabUokXkXNy97u
         I/aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rIm59MgkRPMNvXfj/Jkes4vvlVAq1JGQG1mz/QlOwQo=;
        fh=OdjtqekM8hv91G1sjMdIh2qgUTu0x2fUJOf5QyevEbw=;
        b=DdY8ojgp/fIPjUJIMhmJEwe1AgZ4e9zd7cWYbL8eCkIvxf1u7OtG5dmmtADyIraLUk
         MJAVijJwFzMJFwhdMTCKQ+cICyaOpAeib/fh9quVd/3ZeFh/5ra/dwjh4iuW61OPCOF6
         Q0UI5w/ZK3DjSqgwS1yhAo9l+cW6g5IkAft8TWRchKQMz5qIUCRSSduuKrPqaJiASKrM
         nbB4OHDX272KTZoQchVCtchqVp3fxs6TulSwgF2w7oDHzNK0dVPQ/xfBLM10UdJ+fB8I
         QGPoC+2amJuWOGjWmVRlOokwki33GBRp+VcPg3DKSacYSZaliO05OJdnojCssDP+jChx
         Ejdw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792157448; x=1792762248; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rIm59MgkRPMNvXfj/Jkes4vvlVAq1JGQG1mz/QlOwQo=;
        b=drEAeZ4Is2P5qjLVtmTBn+HFfFgR4BV+4prbSVsy6JLOuS4BGHjO4PFOPmIA0KLGHg
         L4NI1XiPtQRCnJHavS2o3aEWXxuh0BfJJ/2QtpJdGCv841wWJCb10mJTSl5IpxYiQAuJ
         4OngJdPXGmgpdBKl3Si6Vceep5jQadSpHtPsqEPIzipMyhjT8uwTyio7d/Qh10hX9Pv+
         5eKO86JQ89huoEKcCwSwCihFNc4fNu2f1Ccqpzx8mihXZjwzsNN85xwQaOI8eM5NIqpe
         bER78hba6NXXXmw32BnzR9JHo8wWr4Hwc12Ny82TE+Dk3nSR3wgqZZe/lbfvtcd9kw1y
         MeCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792157448; x=1792762248;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rIm59MgkRPMNvXfj/Jkes4vvlVAq1JGQG1mz/QlOwQo=;
        b=fWcj8Z+YwWmGgNVY3wE6tQqOeNUOX+FtIi9WDg42tzf48cN/gt80PnL4NlhE6jfqtr
         QIQ19gJgKMf/qjFWrWWR/yChe1kk/7wXRgXdZTjii1g5SJzJBH79DG40XImIai7SY6bL
         Z0N+bkrssTbLozo5dIWFGzgvZX5NkhH10iwo0os4Nz9GbqSiEIijPkHmGsz389Ov9OMM
         Hadm9bYoLB5/MVrSTx+CHVYg7HKNIhpP+a2+uuEzraABpCbr2LV+nkCXeFYE5PLdcwIM
         /EO31P3zlNW8IaeB8zOT1hoRQjKl4HnJkTXcYFvNYH6JDAwWuUA2BJicwquEkDhCIV4R
         EaDA==
X-Forwarded-Encrypted: i=1; AKwUvBzmszFSCRlf9ehUbAzUv0e7JCPyJxxaLBHo7foDKG04yzGwCb24QSc7b+zpd+j6s/1jXVhxOxE5H4eoLHY=@vger.kernel.org
X-Gm-Message-State: AFq9FYITq3ITRXa+F+3xtAMFyxYF3ND9NvzZoXeEvzW/uXrpPA3z/Jjn
	Gsbd0s0vHZJnYhOVwNV6ZOtoz8khsQ0By6c+zHJY88WOLu1FTBwr9rDPkEv4JWW9g7aqKc9pSvI
	McZJZUaNbYofRbiBrDikXNwgTO0XJEeg=
X-Gm-Gg: AYBFou3P/KxNL1ClNX+fY/sw2OASxsqO1QiENI7fdHlHfYDFbuw+AsoJehrCwISCMbN
	g/GFZR1jAtSZfIwhf1b+2YEoVosEDAjsdLtioOxv5+sp4VKBlASLLT+4xjr1fo0x9M1tPGP/5vM
	/fmkVU5mGu/8LuCxz0Vsf1Dx8k4bXL5wg2s7Ppa4QaIAj7/3BrLXfezdREPNB35ZrXzODgamOMV
	dmg0EDSqdIkdn991UnZ2Wgrcj69Bw0h8JhGYM4j1eBP4aQeVmQRHjBUj7nb0bFleaqdRbXnS+o1
	v+pxsPiQqLN1PFSNXOMzsHyIIEp/QyAop7ilXVJoHvJiBQqCIQDpn/y+SJNBTjnMtOFEcT7+lW+
	ZLLqY1Xbd/Q==
X-Received: by 2002:a05:690c:350d:b0:8ab:4b1b:fb27 with SMTP id
 00721157ae682-8b07ed90e31mr80020807b3.23.1792157448333; Fri, 16 Oct 2026
 06:30:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <pm-pmb-0f2e227b93626e3c7554-v2-0b7a6296bbea01ae57e8@gmail.com>
 <87ik316gq4.wl-tiwai@suse.de> <CAFRLqsVH=Xkeoh2icgSftWCnk3uEUGPst=N3qeGoZ7Zy9+W6WA@mail.gmail.com>
 <87cxt9u74s.wl-tiwai@suse.de>
In-Reply-To: <87cxt9u74s.wl-tiwai@suse.de>
From: Cen Zhang <zzzccc427@gmail.com>
Date: Fri, 16 Oct 2026 21:30:36 +0800
X-Gm-Features: AclHuK_-8NTVn4hstDmRuq6xyfPlF3KXeqTSQtUBU9lQ4ZX21sfTb7zarC3sCB4
Message-ID: <CAFRLqsWCmGOf6HfEN=NY9JJQBLEXi58ccUr5cijSDPM_ARcc1g@mail.gmail.com>
Subject: Re: [PATCH] ALSA: jack: Protect debugfs setup against control removal
To: Takashi Iwai <tiwai@suse.de>
Cc: perex@perex.cz, tiwai@suse.com, phucduc.bui@gmail.com, kees@kernel.org, 
	blum@kernel.org, hui.wang@canonical.com, kai.vehmanen@linux.intel.com, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	baijiaju1990@gmail.com, jjzuming@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

Takashi Iwai <tiwai@suse.de> =E4=BA=8E2026=E5=B9=B410=E6=9C=8816=E6=97=A5=
=E5=91=A8=E4=BA=94 21:06=E5=86=99=E9=81=93=EF=BC=9A
>
> OK.  Meanwhile, I think we should work on the jack driver code a bit
> more regarding the debugfs: namely, the debugfs is exposed already at
> the creation of kctls, so they are accessible before other interface
> registration via snd_card_register().  The debugfs addition should be
> rather moved to the register phase for avoiding the unexpected access
> via debugfs, instead.  I'm going to submit a patch later.
>
>
> thanks,
>
> Takashi

It seems that this problem does indeed exist. Once you send this patch,
I=E2=80=99ll be happy to help review it. Thank you very much.

Best regards,
Cen Zhang
