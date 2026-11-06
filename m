Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793972886;
	b=3cj7j30SuUNtg3RIY3Ov28cnvDWiTmFc7LHoKfutaafpJ5S+6ILLHSShpCWBM1QqXaKW
	 HzIM5ARQQbe29tufu0pKzjglmsHQEr+oD2YpVhNk7K3WUiTixgVDzY+sy90KnV4I33Yhk
	 RNF5vqAt1uw6+beZG0ih1gvIU+11fkvj89zmb13scxzH9L1zJJApb5Km7O5312K7+tUXp
	 mlXe19QRve5R05/JWsbfK+gqY65PhhZUstnOj3+frDQ3AGmOlZe1IIKyqjUBUBCVx/56H
	 0YzZ3CJjiV0ZJENTUuykdlVXiI1N+HrisChtXDvk16XNTxU930LVmDaYaULfXsopUkA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793972886;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=8jqpwl4T8NAec+YKpbFVjez9aIN63QELEDMAzpK5tE4=;
	b=3h4EQvYcZz2RoaoNj8Y/LMSDtsWKo7kSHHhNLKNLnvudvtBWXRwBnbLlUWqUkREBPY7Q
	 LFBaeuiuos3dKjDLQkJHmiKlQ130KAbDeByEkcmpMYAfC9UU7ZS59lS7heh82BVsfUuR/
	 tlVuR+v3UeVSkwZRkeONW6cKdK3KbUXQxU7qYM+6l6tGnx+kqke6UQRgVQGlyS+Vx7HrG
	 r4WELbooOz51qGIh+t4FtqnElcQx5Xw2oYtauPyks7K/PRmX9zKpBbA8HeYVkxm54guRm
	 IENDhHlCYn6CrD38FDI0njYNSeo6Kfd95j5bez+XvWh2Y+uTa5OKUUfxvhrZsvlDo8Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=stellman-greene.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=stellman-greene-com.20260707.gappssmtp.com header.i=@stellman-greene-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="Df60Nu/4";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.46
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58FE8606A32C
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 13:48:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58FE8606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stellman-greene.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=stellman-greene-com.20260707.gappssmtp.com header.i=@stellman-greene-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Df60Nu/4
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-91c76540d0bso6088346d6.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 05:48:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793972885; cv=none;
        d=google.com; s=arc-20260327;
        b=aMw/pvw+J1+jtgvqn0JX1lFkeSmv4AB78240BeaTP7Rk0lA7cPYQKTHyS3re2fixNl
         giIcSi34c8l59y+SLn67pK9iob5ptaTsuRZtEfw30JRh8necPZhlDjN1HGTfp16usyMq
         VMCTLOezJhwKfbT0PaX/39LMmw9fvRINBleLcXlSH9qPAWZshfKi1xu7H8zRFCfiSNpY
         rHhLgJ1f4E1/OUCdHrWpqhVMelPPpmMSl3a+FpV/j0ydDHjDtuqr9zrPf2XuISBzZ/lB
         DVHkUFc9soazEufKsRlbUgDwb7m3OvRu8AjyhkSBxv5VSlPq8Qwjt5KDJYjBdSnKSTn1
         nGzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8jqpwl4T8NAec+YKpbFVjez9aIN63QELEDMAzpK5tE4=;
        fh=WiWtXj9LXQ/W4KuEFFcAgiNNnJIH3Vzhv87LKH8Y83M=;
        b=ZsfEDjRrN9QFtw4dK3Ayr3uzaVI5rXOw0wf2GCBIiDDZvQpdxvPZ2hkfOEf7OuNSWz
         2ebUp464dEoMqz/OHBfsG4rKnA65x5E+ckqseyudGJlz9q3f3w9sRoOcUi7OZuxupkxn
         J+aOkUYInEmVLgZXOm/6NanOP0N/Y4aF82LdWTCobDpXRcHUM5tqxBlKJbIFrrlwpeSj
         RV5bSTH+8RKmio5180gsnc0mhH5ujHzSyJiovkIhMUd6BTbeu2lspg4IGMmV4ub2aaN4
         NRonBSfPM1V7cpbM4bcyo/IeeVKApOHUTUyTzpaGCQvFjOvmeKZPdD/a9JAEQQCEWdKK
         76+g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=stellman-greene-com.20260707.gappssmtp.com; s=20260707; t=1793972885; x=1794577685; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8jqpwl4T8NAec+YKpbFVjez9aIN63QELEDMAzpK5tE4=;
        b=Df60Nu/4pGiBs1+4S3NLwFqijPzwsuukkAwrKjlptwY25uCNI+/cGgDB09kMcAw0mg
         6cQDhip/eDd3Z5JsLYuFKCg46n0gj1nq0+mfZC2a0ptPwb1oMAKLR9sntXDFPvjMPVwx
         aQs8sG16P4duHAlpVsnuxPk9ljRJiVryN66R8nUNSx168pqozo+hIAtyDft+Xb3sWzY5
         W3K1bIJBMqWvKKqTeTgu98dLXIAztg51yxQ/cLJk1vI+ntsVj/XYkXBEvd50QaXBOwz5
         YQQEMHsOk/+7uuDPPqfMzM43O0MP2ZtJfLbMavUc1BcT76+YoRVJpf671+r8f9Ux3wpI
         JPeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793972885; x=1794577685;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8jqpwl4T8NAec+YKpbFVjez9aIN63QELEDMAzpK5tE4=;
        b=YJ0DcYOFUB0p7SXPLbzAD9xULVTiUYpBMyA2MKISM9sVj4+fmwM8Al7CdCTmTYGcZj
         OszBKh3oO7BZ/xXeFrqoS6vwd8/Hl/zRtvWboJu5IFcIaTR8hl8oZf2yfhI2ZXUxSinh
         Tvr6ncqUmi8OFE9HeLADszeMG//mCaCgkWXxPVGZQT+avojSe2oMkDpheBal2rhAXhc5
         OKleItsBRpkV9U4dx48lY0XSRilwMoStK4XqABnyemtw0PWns0EgEcFwvPm0T0WuBwDe
         TDIpf1NGlW1rc3zQVU2C4suQ/ffgvBNwL5fuHkXkHpgI7jHSEd+Z6tBaVgCL9OYu7/u0
         0uAw==
X-Forwarded-Encrypted: i=1; AKwUvByXOb44oN9OWboaK6Nip4JdFdyxzdeqgMQ31Wz6UHevFS7KhlO8xJDDw0KCCIagfsoTTvV1E8QkmEnUPD4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8x/1r0CEooK8+w14rxIx8RvxRnuPXmms4V2PjfeeFaJl746/ox
	qLqiaknEHfp4q4ExKuw/cIbCAsCkw8uQoo+7Sr1LXEmKEfJYotHlFTzqriMj9nDUJW7Dl+COQ79
	SY2AsFkUcnX3i0g9l4gOCch7UWfZyjrU=
X-Gm-Gg: AYBFou0bWF2Ue4PMjLBgDdp13ygTgMKQMQCR3kuePBa73mP6zClfMQu8eIar+iicwcr
	BEhIbBht4TFhDk72LTcIcb+AncJ7wMGpf+hbSIHKLLKiKJSKpXJquSebfPkDKp/2Uztt4eQCTiC
	6ux/bt5f7h3DHO8qoP0YiG/2Ibskvbd5/uT+oDdVIroIdhNG1GODrp00X5JAikwFQRYIRFitVfW
	7eev/OD7+lWbu1XHUjooObUkmXvvFtm2j4PaSb5825No1AGetaWUFhyY3bDirWJdlDn0u0/pqhZ
	bxtsoq8lxOCRV7QQeAc3lR62wBfmXsvdUWdwJjMqpJmDIBu6bRq+Z6dBu5HsMoToex+X9S6y3gh
	IXzhPdG4bYD08FOcbVF4I3W1CH24bnSG38SaB4/ezcim2R/Y6yA22nuXQobbFLhDBA05+M/UAEv
	kpFw6WdP+4CUP1vK8M5nDswxpEKlEe6nwVLJnGkE6DlkuO1PW8e4EvGWFpQiSqxXjrn+Ggc1MR/
	pzY/+r0w4+5sjLu
X-Received: by 2002:a05:6214:2b83:b0:91e:a43b:26cd with SMTP id
 6a1803df08f44-91ea95a3fd1mr33712806d6.16.1793972885126; Fri, 06 Nov 2026
 05:48:05 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106-nvmet-ana-grpid-1-yuehongwu@cmss.chinamobile.com> <20261106-nvmet-ana-grpid-followup-1-yuehongwu@cmss.chinamobile.com>
In-Reply-To: <20261106-nvmet-ana-grpid-followup-1-yuehongwu@cmss.chinamobile.com>
From: Andrew Stellman <astellman@stellman-greene.com>
Date: Fri, 6 Nov 2026 08:47:54 -0500
X-Gm-Features: AclHuK-hfRPakEFQNMVr9rih3D0VIh32QLrrqCOq2352-Ya5dBeXDTdZ4o2gQfk
Message-ID: <CAChPuV9c4VubdZO461MjVb2xb_Fj2+SYJcDc7wOvStdvYSU1NA@mail.gmail.com>
Subject: Re: [PATCH] nvmet: clamp the last ANA group index against the real
 array size
To: Yuehong Wu <wuyuehong@cmss.chinamobile.com>
Cc: linux-nvme@lists.infradead.org, Christoph Hellwig <hch@lst.de>, 
	Sagi Grimberg <sagi@grimberg.me>, Chaitanya Kulkarni <kch@nvidia.com>, Keith Busch <kbusch@kernel.org>, 
	Maurizio Lombardi <mlombard@redhat.com>, Mohamed Khalfella <mkhalfella@purestorage.com>, 
	Nitesh Shetty <nj.shetty@samsung.com>, Hannes Reinecke <hare@suse.de>, 
	Randy Dunlap <rdunlap@infradead.org>, Aurelien Aptel <aaptel@nvidia.com>, 
	Nilay Shroff <nilay@linux.ibm.com>, Jesse Taube <jtaubepe@redhat.com>, 
	Rongzheng Wang <testwrzwrz@gmail.com>, Kees Cook <kees@kernel.org>, Rosen Penev <rosenp@gmail.com>, 
	Guixin Liu <kanie@linux.alibaba.com>, Qing Zhang <diasyzhang@tencent.com>, 
	Eric Biggers <ebiggers@kernel.org>, Julian Sun <sunjunchao@bytedance.com>, 
	Yu Zhang <yuz08559@gmail.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks, Yuehong. I=E2=80=99ve sent a v2 of my original that answers Sagi=E2=
=80=99s
question and links to your testing:
https://lore.kernel.org/r/20261106134313.34829-1-astellman@stellman-greene.=
com



On Fri, Nov 6, 2026 at 2:04=E2=80=AFAM Yuehong Wu
<wuyuehong@cmss.chinamobile.com> wrote:
>
> I missed that this was already reported: Andrew posted the same two-line
> change on 2026-09-10
>
>   https://lore.kernel.org/linux-nvme/20260910154849.66095-1-astellman@ste=
llman-greene.com/
>
> and Sagi asked in that thread whether it had been tested.  That patch
> reasons the same way, and it also cites the spec wording for a valid ANA
> group identifier (non-zero and <=3D ANAGRPMAX), which mine should have
> quoted as well.
>
> What I can add is the evidence that was asked for.  On
> 7.3.0-next-20261027, with two kernels built from the same tree that
> differ only in these two lines and no instrumentation, the nvme-loop
> transport shows: a group created as ports/1/ana_groups/128 is
> absent from the ANA log page before the patch (ngrps=3D1) and present
> after it (ngrps=3D2); 128 written to a namespace ana_grpid reads back as =
0
> before the patch and as 128 after it, with the namespace accounted to
> group 128; and removing the group again adds a phantom group 128 (state
> inaccessible, 0 namespaces) to the ANA log page only in the unpatched
> kernel.  The exact steps are in the --- section of my patch.
>
> Andrew's patch is against a September tree and no longer applies, which
> is why I sent a rebased version.  If you would rather take his original,
> I have no objection.
>
>
>
