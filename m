Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792585537;
	b=YwWzK2FZ1BjLr8P5RAboy9ySYr1hlyVmD/CktotRRSUStPH9FcpqCtD+m4RoJ6NZxaC5
	 xGsmSH+ve9L9i2TpCOWAADRPs0hHxoL8BMoNP/JAKjCq2if1czGRGlej2+Xe2v1eUPtIq
	 63OTgft2s5gCy2xgc8n9Gyq2lBXn8pd6bFo5QCO5waAlgqJ8dvOQHyl23BjZ6BhzalLGE
	 mzJhcpYAh9GXsnWLCHykBgNZeez9xWyFo5BqTUgZ4NFpKuxnzujsYMW1ctnfV3OIy8g8l
	 lcJ0PdEO1yyKmjtbO7f+dL6h6x7CjGIyZcOJWVHYsKVxohEcHET/6otPpGhnjcPzing==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792585537;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=C7rAKtaKaELVNFK0oBOpKXYxL6DNRFQYfosGXzXCAjo=;
	b=Vp8eMOsW99e0D7lgRhwKcXqq9v7CjWxAsqViRr/7BSApZ+trbaofVsYlSRkuPDbrqh8b
	 H4StXi6IWDpR6gYU/N3vEyJmFxBGNk60/ViaQp1oIsMfiVEmBtgL4MHViPi3XcS+DWtBM
	 1PJk4BU/kJD9GBNZsxdCFYjNhg1cWFTQDYFv1XQfkNZTHvH1sj4kvsT/ie8mXn4tUFrxd
	 bfQL6aRp8KNiPDowEJBI+8cYbd7q8sgJmDdm2RNEqKtYPI/Z9K2jkArlnUUEqKp5PVKbl
	 grIROOlEVwZq7CqhBfMUPT03yzaji1BSGCGvgIB8XiJypoO9q01ywPEl8zDxTOsLPHA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=QcLGTjWT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.181
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3B90606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 12:25:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3B90606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=QcLGTjWT
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-5337fa12431so237631cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 05:25:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792585536; cv=none;
        d=google.com; s=arc-20260327;
        b=nYejUtzc/wIwyefxfzoATFYf/BPU2xasqswh75kyfEmu8+OTDryryv3Vq+qHCgNxhy
         5speBNXGKiT3U1XqwWELA9O94p09mC1MSQs1Z6qcNuLQRoYw7pVb5GII2HT4+sskTHHk
         pJnTL043ZDTwcoTRulfp1JwxKSBlmNP3GB8/KvrLRmMr30ARJyFdtdQZxz4HnXAkYSQO
         UoPW099+bZVc60Mg4ITLaU52KYOBCuKRgR/69RSX/dCeMAhqY7DTz32YgGHuOjNWLZDu
         dOhMTpKCBgOMR5btPbejrhydhbPfb/3qOULybyXrVQ8Omr5yaTgWZOA2MVEaAcf50A7d
         EVZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=C7rAKtaKaELVNFK0oBOpKXYxL6DNRFQYfosGXzXCAjo=;
        fh=yJkJ6CbeFXm5O3IAbR7E0aTGCGk883Fx+LW1N6k8J38=;
        b=Zxj5EnrBAZC1ZhbFirHxZmWpJqaANB8JnWSW8reoZS4VlAkMqeRzbVLNqo+rB35h/I
         yfQRWK6C9TptMyu+CBhMDOf0yn+Tf7dEO9yFW4/0r57CqNYuL2ISKFzIHy6ErAfKAIa3
         vCHlIwt8y2T028lA+a1qMDEzVDYYSq89W2Zz9cZvgRKK1D7ljPTzJVt1+cWI3Yn0loZk
         asGJEaC73XEkWSBlRxeiTj8+jwUxL2LJsakbvh2rl2T2RG5duCIQXWwM1K5tyE6HAabj
         DIkalMCCmrBbgzaukToSEMzDZaIKRXM8fITm6d3Mc7YPSNzISLIu7BL/Go3t++iE0Irh
         AAEg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792585536; x=1793190336; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C7rAKtaKaELVNFK0oBOpKXYxL6DNRFQYfosGXzXCAjo=;
        b=QcLGTjWTwPPBYCWoIqz7nnTEZjKof43bbn+N2cXXqOUKvghC7g4YC55UuHTzzBduS5
         u5NxGvBekE6cVb/LRxpM4Fhlb7IOpgMc4uHIkT4wOmLyLzhaEbGsjLr1yQ2Zj1oFGmk2
         iSWCaKP/JaMI8hdGvcCTph5pCapEaH0Jp0OFxmzOrkDvmk/5UPPJA9OIV+H/A9dvClGt
         5UY6V9qOSMPL7b+v11w4uRNGWnVKqUMd3DRVJ9vlWkjb+YtddlzbRi+0tBQ4nBV7ApMi
         iezj3vkUKORHJyZp23cCr7TnO2fHE4VoaTe1WL/HsPUt+VlClE7d2SjkgT/+fLQjPBuF
         Owfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792585536; x=1793190336;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C7rAKtaKaELVNFK0oBOpKXYxL6DNRFQYfosGXzXCAjo=;
        b=VVHkYa611zVJXqaMO4zWkVauQNlBaSya4OedsvTFLsxHX7FHTs4xEmdCpJQduCnMTU
         2lhIGmYi5glJDng9uhs8xMHBSGO8NVGKznJl42Pl1rlLq5sQie9Qzitn78Zc5jHQUDBg
         Oz9Pamep86TXKo7Cevl1U8i5ZegQMPGRGMJtzC55WjUOURwyg3iGXGPw2uIzmbsfsgjx
         Tsk3UF8KXvQ8+o39orajaAzY3Z4+sF0yMERKQ3mrhVx9lq182AScLl2whKwWNNGhZfwl
         W1Vi6p3rfirg8P6CHP5eJXiWJ6ftcdQzNqV+KKMm2r0Hy8r8pGj3ur4vRfmYTO7q3/mA
         qgNA==
X-Gm-Message-State: AFq9FYIO2Si4UhIcMeqJNCnIht7UIkwOuXEdu1sfXDVn2J64YgRUaZa1
	VmGuoKF6j8/ng/pkeDdGqpbYFVnXBtYDhkWO8/ujRbRs/nbt/2JeGdhzwpBZHswq/wifyWr9Vqj
	UXKnbpDjVFFcbgfQtYhCLE9XRWcVbc6Q6fobQHvMp
X-Gm-Gg: AYBFou1PnV4Ak+cuk+q0CzgPtIsX2IsFSOuEnI9oo5WQWoeu31iqEt+7jJsv2+/iC1o
	rBmFLbugVfMbShrx1m0zDGIZGdZNK4whCKPyYkm/n0gzsJG9EB1jEuzEQw+4xdGCEpJHDDK3jX8
	kxieWepZhwjpjD3gCBWd/BgJZ03/Jf/ZYvLX9lSIQt3kEWuEEjJ3QcfHLYPsDwzQnHkcr15Ywh1
	hDwvPbtDxaEELum2IVXP6SUukf0GTup9pJbY35g/q759PxtP1+Loi2m6kHphm2kHYcRSUd96qIC
	1QR7AVV0FQcXxIw+tuXpea6KSJqo1Js1GVDqIijqJ+lABZnd1hgu232OZwAQKnesdFAPJwAqmuP
	FSlYG8kwOg8xtEAqH/Rph8+aEcbB7k8GP4vVWvaSTvafyaPbMtAjmLP6imwBICgDBeCok
X-Received: by 2002:a05:622a:1103:b0:534:313:9b4e with SMTP id
 d75a77b69052e-5368512568emr39727821cf.5.1792585535104; Wed, 21 Oct 2026
 05:25:35 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020121159.2154649-1-sadrul@google.com> <20261021-miserabel-zahnrad-gepachtet-9bacbeb24a4c@brauner>
In-Reply-To: <20261021-miserabel-zahnrad-gepachtet-9bacbeb24a4c@brauner>
From: Sadrul Chowdhury <sadrul@google.com>
Date: Wed, 21 Oct 2026 08:25:24 -0400
X-Gm-Features: AclHuK8aD2JqJ1CUN-PK4H1g53g_Wt5nf2Vtd4t499zqOIAxdZ1WFXXEm-h8zAY
Message-ID: <CAKgcGXiE6U-oBJ1sJS4fDurqRweSTdgYfoewLaTSJgi7kSqC3Q@mail.gmail.com>
Subject: Re: [RESEND 1/2] fs/epoll: mark epoll_wait tasks TASK_FREEZABLE
To: Christian Brauner <brauner@kernel.org>
Cc: linux-kernel@vger.kernel.org, 
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Jan Kara <jack@suse.cz>, linux-fsdevel@vger.kernel.org, 
	Pavel Machek <pavel@kernel.org>, linux-pm@vger.kernel.org, 
	John Stultz <jstultz@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2026 at 6:54=E2=80=AFAM Christian Brauner <brauner@kernel.o=
rg> wrote:
[snip]
>
> Seems you generated this against an Android tree. Generate it against
> current mainline and resend, please.

Thank you for the feedback. I will resend v2 shortly against current mainli=
ne.

Regards,
Sadrul
