Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1DCE518131
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 15:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791904358; cv=pass; b=Js2JqRwepXMYm2OdOwlV89Oqb+zQ9Y0Nr0QHieQvuR9UJ/x4A/aG7Fgg79lrca4NPJUYpGsrzqPhLmLkNJkBr/NgmVm0HWEa9l+NyukhxYy+F8HFZfT0Izu27t/kki8l74xicnF3Z2yTnESDgtWIevMZrB6e0OHK2MILA4RE6eI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791904358; c=relaxed/simple;
	bh=AI0ZNZro2e5xfwR/yU0/G9qLqrgZW5G00ldr43QvkCw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QEY2jUET6uLKhqZ+1lbabdsF+hd9sMiblPzg+YvHoGAv+b7IIgGDQJD4UdWH3OnViqcRWf3A2pCzag0CoSH9ZL3QfihtZOopv7cyhLHzzMDChYL528wAuua1z3h5d2nKudneAVPR+J3mn+bssK0quB41C9Y/9yB8lCOdiPiS5wU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qbRFI4v/; arc=pass smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qbRFI4v/"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-8b0a28a720aso17929787b3.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:12:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791904357; cv=none;
        d=google.com; s=arc-20260327;
        b=i4PMPibVNbBcKepVS2D3IeemIlpUDJ2LTEMkGnJEYKmpfFmHheRmPP+acqf+NIG9TT
         yMuo/LDkOiexViRyv9KKl/IREFEvgYneVKLEEGmvvOJ+Kk+YujUL6wjfq4hnDGfcyf3G
         V94cjRKOS0lxYE1BisEMoy3A3hmk+fuZjmQR+Om6Bvfu38tC/tx8JGE/qCUulc1nk7N+
         /oeGVlpWpiZxmailhiZ82zTGmd6kD5+O4uJKqbflbKk3zHaS1cta/W9BL50oAejPcWD0
         rSGZdNxroYoZVknq3oPCxoLDvMCXCFgZxRATPgb1HMMwY5bUOeca+7YnlW7Om6/F09g2
         TKqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YafMoLqe18iw4aIAeYzIFkS8WNyubVQPGLMZPnnm2Mo=;
        fh=W+XfrnzMLerZUGSQM1nSp/WB36mJtaDixrsP/zpCPRM=;
        b=AZvksmer3zqvRqlLX59Xdj31qo92eBiwIHwGK4DC50NFZuVS7+ijKOJmMAg0bfUQDU
         4wI3M52omWVloewWhtgIXs3ERi17JMN10Z0iel0F7UXMCzpkTrs/fJ1VGdaURid6DhA1
         SZWCP9o6W5topqJp+AVaRPFbqXn3gjvhYEZtVCOngcboSxEiRaJN6Vlfpc7f2CIBDe6I
         rtiZh4IYCMJjjCuUNduvQ77v+7fQrN9zP0CKCpELj7f7QLf8HDS6Km1g3lQQXMQlwCQ8
         hk7EvZZPTHElxQRDkp1Q+ZW0XmyDWGDfi0+swfoR49UTZIT2ksPnne8BFYG7KuadHZDq
         TSzA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791904357; x=1792509157; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YafMoLqe18iw4aIAeYzIFkS8WNyubVQPGLMZPnnm2Mo=;
        b=qbRFI4v/cDrhupon4mjfeShAd34/dTaOIaZzM0/dX5ZTBlSnRYOAe2d64gRNQj7AX9
         XlLWuSD9rfwxqrn0qUg3gWn5ibBAIp4bb8/ManXNJtHPaFduZFJufS69y4u6T8FWQs1y
         hRMuj7Xb5X6OEtq06C+fkVa3cfnbma1yAWPW9eY9r2gZNT41TnCCwla1uMVIu+p2/llG
         sJPYdg/uqiKbos3AmVem/x6+ngJUcLfEYVbXAaUy8RmDdG25hmYxmQRRCMbnDrcYsbLP
         X8StoLk+a+qciJ9mrqAIjt9ULRszHXTMOzgQK8gpQgIKLlgY4nkj4QaUOAdiX0/J9gn/
         Mp3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904357; x=1792509157;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YafMoLqe18iw4aIAeYzIFkS8WNyubVQPGLMZPnnm2Mo=;
        b=t79YclFkrtxQM8STxcAXtW2DRtgNHfJF33lN1oZ8MR9AfO71EgTlZWG5b0BCCf5SrL
         rLpHLrkdDjFN1SIpWIkNOWMbQ8gNUyz6W1bAoeyZbjl8li9mBoQkzUqZOrwxwvy6mvyp
         GLeyVGFC4oN6Iltsw3jiTZJ794OaQRn+jG6UryTLKKQZLGnMzA+j5X4ePP/XczD/PBCS
         aIaTmPtGQy87sLHEvvaGqrt7KP5AOB74/SWJ5IGyno/FzI47WPKDYYCcnB7GJ6+tKmvj
         vBXknmk9jZETZNc/GddURRDCrVYojAXxeIJa6XoaPGx+rwN9wIo+hSX2Uepdn9CWT0S4
         JvVw==
X-Forwarded-Encrypted: i=1; AKwUvBx8n1mJ+Z4V9+/slcz7qKbVbcZZVQgkJWJfokcEv0sMkMy3W/XjlDkPv3JjMEjtPtHywkbsUr6WYEgKoZw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLVzB+7Stb5RHHjbE/lQrHrcZjudN+RLteTjjKl4/gTakhboIun
	MudWOJzI0qwan4lGA5xmqR30PCGiu3iZJdszPD23VhbA9QJFNUP2+Ci5nWmJLbeOrnAmLi3TOy3
	vXGQUIjSBndNqGDy5XsF7n51C9mDQFo8=
X-Gm-Gg: AYBFou2xQTFFjncntPDR5JVtJHG1zZkwBHMPEu5+wTcgQGWakNFp8tSv5U0MCRxqGSh
	bW5N9bXvLCXV7uujzGXNwetvOxXrqgnHO7dEvzPhgNXqfEyB6Kzu3tlRu03JqRnmrTgKGX5EyGM
	5hXJ6OHtsc880pMWqO/bJK+XbDsfvY66GSIRsM972OeStNyhGL/q/qR/a4MZ+scytYzPq3CtNkw
	+f0VVxCVWCGlflR5mcb1cxsGEiY60Y5SrpMAfa9IduG8TT+UfUSaYVMXQLJJHV1e4+foUidakMw
	9M1l8+orbYboTlJmu7YJW7xKv4hTsJEDASc79qHwLhJe7CGWB//YCjpRDA==
X-Received: by 2002:a05:690c:ec4:b0:8ae:845:5179 with SMTP id
 00721157ae682-8b07ede2328mr48534107b3.26.1791904356554; Tue, 13 Oct 2026
 08:12:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <pm-pmb-c2667fb9cc42fbb7943c-v2-d4b95981cdbb696491c5@gmail.com> <877bjmgc5f.wl-tiwai@suse.de>
In-Reply-To: <877bjmgc5f.wl-tiwai@suse.de>
From: Cen Zhang <zzzccc427@gmail.com>
Date: Tue, 13 Oct 2026 23:12:25 +0800
X-Gm-Features: AclHuK_LQ8g9OOiFHhZyIZww1_H2mRji9cKUZLRwzcXhSb0U5WxNj3lClm_Vg7c
Message-ID: <CAFRLqsWGYjnFv8yc4V7_r7NiS2AJ7A5jDN1wx6PV7444TJjFLA@mail.gmail.com>
Subject: Re: [PATCH] ALSA: hda: Serialize virtual-master hook registration
To: Takashi Iwai <tiwai@suse.de>
Cc: perex@perex.cz, tiwai@suse.com, 2022090917019@std.uestc.edu.cn, 
	hemanth.selam@gmail.com, nfraprado@collabora.com, songxiebing@kylinos.cn, 
	sammiee5311@gmail.com, kees@kernel.org, cassiogabrielcontato@gmail.com, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	baijiaju1990@gmail.com, jjzuming@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

Takashi Iwai <tiwai@suse.de> =E4=BA=8E2026=E5=B9=B410=E6=9C=8813=E6=97=A5=
=E5=91=A8=E4=BA=8C 17:53=E5=86=99=E9=81=93=EF=BC=9A
>
> It's not nice to use such a low-level guard here in the upper driver.
> So I guess it's better to move the rwsem guard into
> snd_ctl_add_vmaster_hook().  But it'd need to pass the card pointer,
> too.
>
> Alternatively, you can rearrange the assignment in
> snd_ctl_add_vmaster_hook() and put a barrier to assure the
> hook_private_data store, too.
>
>
> thanks,
>
> Takashi

Thank you for the review and suggestion. I have prepared v2 using the first
approach.

Best regards,
Cen Zhang
