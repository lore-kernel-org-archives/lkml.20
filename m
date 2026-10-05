Received: from mail-pz2-f38.google.com (mail-pz2-f38.google.com [74.125.228.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAFC344E053
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 09:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791193017; cv=pass; b=i3E5rRDUZwTF86xjsSc1o7qvIxuTKKbJ6T9dBdDWGpTGLZLOnugtmeXw+LXnt8ExNCd+wHfvaYK9VzQM9+32rcmo6ca0WimHrYNaUfXe1Nq3lsqo/Xev1WUXikTK9KRmICIK+D1zoZa1jO0BnFyrkidKzgREPLRlAtGQapJzD5I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791193017; c=relaxed/simple;
	bh=ALY8PRLZB7eYZm4BgZsEwueCWb0wgVU/gIyTN+rhhkE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tTQ43J6G9dPunZ77k2BPJfbYrXYjbZ38sPUAgIhajOa2cT/I6cGue7D/ftTqV+oQU8HUuWeNkxAg4H7kcIFVviJIaWh+Z33WDu9b89bIPlsYXcwR3Z2wQUi1S3N4iOJPbMyj2BL/HZJM1chevlq7G48yQq0t3rusMQJEp8syb/0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rF8yAsmW; arc=pass smtp.client-ip=74.125.228.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rF8yAsmW"
Received: by mail-pz2-f38.google.com with SMTP id d2e1a72fcca58-881a3a28e72so435164b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 02:36:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791193009; cv=none;
        d=google.com; s=arc-20260327;
        b=A6QXkS3X81YGD73j+k4VBNwHW3JaQ/kJWVWeaLJPqy52vvFFoc97s3Dw5+jObv7De4
         O1nBNAmSbLBUna3Ao3oM6eX5A1n8+NwOGFp3n//Kh82wu2CjNZlVmwQss0GQKNVxNzuS
         NuGCdRBqQTrqzfxGSLwE5UMfhF4qKAvqtTq2yaZn6KpHQTHBwmJ7GoqD8l1Cn0jJ6nei
         wVEtmDBiZeHJHIWTHTssA+NlMgo/zYQoWzM6pcR6WUDI7iFYJVw5wLMgX6dISiwtFAjT
         28PSxOPD649SvFEiGXWyz7DR/x7Lxc9OU7eOZziH4oOP/Zf/x77xI3d9AHpPyRPUwuyp
         Qtew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ALY8PRLZB7eYZm4BgZsEwueCWb0wgVU/gIyTN+rhhkE=;
        fh=3/LdfbtNXOmgI5qTFw0mVEFmWn4Bk0B2e0idHs97JLE=;
        b=RhL2Lq8toufFV7iELt9RjskNCG8eZEs3sgcQLZGy++vAQJcvb/aTZoyUNGBInuZaJm
         /Us9nGDcMTw7vmyeN43f7TKIqK+v6J3xM2RhiZKRXw6W1YOJ7nBRRMh+EcP+lEDzZe2k
         NLEBr0d0YZY0xaaoVpzgAGE/ghNcgiK+On2aQmLPqmAD9yxuUz5X8AJMuFSPXuJKncnc
         Hf4q4oKgY+VxP7iiVB3uVmolb5Nn1duHdEcib0i4QeGCGJqvy5kT51ieyP9eqX+4vYr0
         91HtXNTZiLnS8Qp7KQ+mTd7JmQdeLeH6Xs6xCJVPu8IJvZ2vx6aAGS+0zvcmuwX7UsZt
         x/9w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791193009; x=1791797809; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ALY8PRLZB7eYZm4BgZsEwueCWb0wgVU/gIyTN+rhhkE=;
        b=rF8yAsmW5VZM3zbBrA58w8NnuCXRjwO12yMmZ1bPqbBWLNpujUFrrx60abMf2ynIQe
         SAAkpG5F6xoBv5ah0gC7XrLjnMtqHlf0WL7U0GuWrukvE3pHIAk01NlOe4WlZADUkj+u
         h/wfE+9AV0mpGcxO3pMeFdC+1kpWYZB/Xe9OiGw6894ct/M/gup3Z/vhKbnbZeZBX4Gv
         ldr1nQNsG9W1+DJNCNfw0rVTAhppt0dnnSCd2y5WrMN6+/LFXXetjVlDoToL7Wb4EADD
         xQ2FXr4I+e8nL8IWp4EqQdTI8GeVZKD/eKYtWtRHBxk8iFQWMBGbES7ciao/uojzo3et
         0B1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791193009; x=1791797809;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ALY8PRLZB7eYZm4BgZsEwueCWb0wgVU/gIyTN+rhhkE=;
        b=moMhAaZbskTuksJnzdDBOTAsmSy+iybIxxygZotZcu8TJgB2KL+5iHxbgQasH00+kO
         5+tCxzfqj7Ft9FxQvssEq547j/EylDD7t7RVUKfiPpzhIwHJpjmw11ztimG2XP6OB6oO
         C0/8yGuOJ1lpCdKcPftHtlYHlbKVJiD0sJS+pvB10syJN5h5CWzPGec9Fqjagy5i79xT
         xGBFz6z9UoUocTYfllJr6FUG08Sb6SM+T3vI0fcmXoadIdHNqO62him9H0GpdntbGa47
         QYiJal8FiUnCOJN+gkgrUNDLETosCbHrEu1C4rKJLl3RedVsmIAB5PlZ+M5xSPZu/X+D
         GIsg==
X-Forwarded-Encrypted: i=1; AKwUvByAoysIrrZVZk+2SBmYl0li06FZyDFi6XoCY0JVSEirxTz1exq6L0WBHRw3LRpxBfL1ymJppOzis0ZF3NY=@vger.kernel.org
X-Gm-Message-State: AFuF++mr22kEtsnmho9aibBvla+NHHaEprcZ3xz85WWwByE5dJo10Ubg
	vPlA1qVdmk9c2UdBQgfwPJ9PFXnS9T2fVeylucvURAhj16zhrLB1pJ5tVdVyWoXSFwNK3RgqMqh
	7QzCtfXY4fO8mgRQWAB4gVKl5WhYDhu4=
X-Gm-Gg: AYBFou0i88QPA6dfzXGDr6Q7fq7lYZVNaHl8MM4vEzxSt0gs2h0d00sljcmA5k7XSPH
	Xs1AN6+FJMQ4e9eVWzzj0/fEmLg4xDPgcddW1Zui7fvYtwdd2ysa67o9nlHcxDzjhFUQRwedBrg
	VEThzBLuXv9P1ZFwG7Y8jrwWQGsZ1gpkUqS2t4bPn2iAeVpfF5HBNTBpX/Y7e/iPqxFpqmbfCEg
	s9bID3CJGxsLtGTk0qQe44gfmyVH8CuJo27RKl8axPPQMg14k+dWFqWY0oWI7eG4bSSqIi8cPip
	hTMDFfflMGuRENeMq4rROugVOVg48lPLujcKJIsLl5GJXgZPXTZUD6fnHkDD/IvebOVxuTbdsmN
	SVRoUFQNyt+SxIrDba/Y5YBaGE7cFn0doHehnA/TmU/aXyDYgyShVVZl4QJq81XBl5P8=
X-Received: by 2002:a05:6a20:ad98:b0:3dd:a196:308f with SMTP id
 adf61e73a8af0-3e0bd41280fmr9275066637.63.1791193009054; Mon, 05 Oct 2026
 02:36:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260925044908.450775-1-phucduc.bui@gmail.com>
 <20260925044908.450775-7-phucduc.bui@gmail.com> <asKt42FgsbhSbQUP@sirena.org.uk>
 <CAABR9nFyEJBwXP=4SjuGNfGQJub2y_DPE87c6j6BPmqMBgjESA@mail.gmail.com> <asNbjSrPYVbeqSae@sirena.co.uk>
In-Reply-To: <asNbjSrPYVbeqSae@sirena.co.uk>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 5 Oct 2026 16:36:37 +0700
X-Gm-Features: AclHuK8rGaIRVCf1BZigYTPKZbRcvBezN-u_N5cJZ31HBEOmlU5r-ZSIA4c-8uQ
Message-ID: <CAABR9nEXM1OSnV6L4=N1YCbtWn5yMNr+OMEZ4p8h3WMaQXbgmA@mail.gmail.com>
Subject: Re: [PATCH 06/14] ASoC: mediatek: mt8195: Fix FE startup error handling
To: Mark Brown <broonie@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Trevor Wu <trevor.wu@mediatek.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, cassiogabrielcontato@gmail.com, 
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	Haotian Zhang <vulab@iscas.ac.cn>, HariKrishna Sagala <hariconscious@gmail.com>, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Mark,

Thank you for your feedback.

>
> > > This will return 1 if a new constraint is installed which is not a
> > > failure.
>
> > Do you mean snd_pcm_hw_constraint_integer() rather than
> > snd_pcm_hw_constraint_step()?
>
> Sorry, yes - Noticed it in the _fe_startup() that was called just
> before as you say and didn't specifically check that function.

Some MediaTek *_fe_startup() functions (mt8195, mt2701, mt8188) can
return a positive value on success, e.g. because they return the result
of snd_pcm_hw_constraint_integer(), which is 1 when it sets the integer
flag. Others, such as mt8186, return 0 on success. This looks
inconsistent.

On the core side, snd_soc_dai_startup() only treats ret == 0 as success:
it calls soc_dai_mark_push() only in that case.

Is a positive return from startup intentional/allowed?
If not, I can send a patch making the MediaTek startup functions return 0
on success.
If it is allowed, I can instead change snd_soc_dai_startup() to call
soc_dai_mark_push() when ret >= 0.

Best regards,
Phuc
