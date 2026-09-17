Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 027033E4109
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 04:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789621167; cv=pass; b=Gg3UbLKs80e27U3KyYvvOvKb9GOVpVqFoXY25p/gCF742PHsSGbM8taQ/dzgX99QGwijlc6TjbDNDoMSOD4fkOnfgx116r4TUPKtsM7WqdCfTUU09JAQk5OuiJ+XQR4c2AHjEWl7ruRK0pZ16lVskqu1tCUMRoxMIKsYRTr4EhQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789621167; c=relaxed/simple;
	bh=Ys9L0ucaJJLCKvclDt5NcM4991LNRcI43c0uE7gSk/s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gskplXbDL67LSbvCrDUa0ga98J0nr4CDHr16Pzf6BWV3t+9dTmZIab/J/VXVj3UbviLdKKTxIC2Eu2YD/M5cx6hB+85b7+Fj7xggx5zhhIBRnCDCiUM/wP4alpQ0NRXDmV0n5nFqyK22TR5fhssE+RaRAlgsP4N09znWLz391e8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YJeUk0LO; arc=pass smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YJeUk0LO"
Received: by mail-qk2-f13.google.com with SMTP id d75a77b69052e-530e2f50d01so4377351cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 21:59:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789621165; cv=none;
        d=google.com; s=arc-20260327;
        b=ssYEnFVeu1uu/b6Z0nAss+W+E6qZAXsPzUJgVGWPCYeIf14yOxI0aKw+KuycZ7bFus
         jyRSCOUeAAzELldnb4jbTfXv8I0kHbLwuwhTdRkIn4L/WX3erY47vib1pIOrVp4DNVi/
         RKDZRmeBjSWY+6HDS5iZzeofvyG8SoTNCze3wz5tYj3pQH04ugL6PBLokC1iY+ZORU6M
         vFMD3jsvDp8BTEsmqaLyi0VtQWAzY/Yras8shNN2a4KGcGHer8dAJBXpkQuRo2/dlK17
         NeS6RR2EpCzEEZakCAOuEdSqmPm8XbNq3kkkbUD7jE5+FBGOYrXXallfWBBkDeZXtIh2
         GLpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Ys9L0ucaJJLCKvclDt5NcM4991LNRcI43c0uE7gSk/s=;
        fh=B8jDlpcd1nZL7JpOPuabulY8IJvBdEBYy+bQ4omPjHY=;
        b=hNiIw48A0IUIJIbbUa0rNeci7zZtio8FY9I6AknIaXUlly3dp7Txzp/PHDwJj4ei+b
         n9jHKMV0YZb3qNIa7izZYrjyfhAYFPqFJuwsCCZJqcWRLA35tRhb3kD37kFHYwpmxDpT
         gdmkeUhDAamhSINLXkuLCc+ZdOUC3Z6v0ZPuh/gqtaA2/8tx+cw6na5iXqkJTDQNbLR0
         1pjLTfVMLmxeNMAccyk/QbfuXfDdoA/omFT/ul7E9rHsUJCmjjl48GGiVnUx00NFCyVl
         ZNKewzwNKRLtfVFVHvY2V2RNousRxL/jDyW4uKMsohD50AzLWwE6fzdvYRK+9v5KM9BO
         p/6A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789621165; x=1790225965; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ys9L0ucaJJLCKvclDt5NcM4991LNRcI43c0uE7gSk/s=;
        b=YJeUk0LOOhI6yD95EdzH4XfiNqMBD1TvhNxBzZVDY9W4QOxZjU+cqiySDWCH7bBLnM
         mpG3KL2f4yIwkPoGKr5kIkwDDn/MSVRsl9IrEhYPcPP/c3+aJggAdSHvOjgBIJ2iX5K+
         DsnBE6DafTiFyVs56zT29mgP1ztEnC4dEr91TIMk6zSvbTJZSBOinkgtdqYPien+UYUa
         lRdTVO5TXY3Xfi0ZKQSQtOfSKXoqZa8LtdFhFp9KP5Nm4s7ZMb6cjnc8GNnKGVG9iR4d
         0EBj3dWVqyS79o/gCJd9Oa7eA7S4NRb44MBVto6WtMHAAnu27Vy7ZxFlcv3tkfck9/tV
         gh7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789621165; x=1790225965;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Ys9L0ucaJJLCKvclDt5NcM4991LNRcI43c0uE7gSk/s=;
        b=IchE6C+WnBhdCh2zY8Wi/uMiM6/sDyeacZAyQ5ca18bo2vPJ9SY7+Z1cyvLjedciCJ
         LH0/dpnduF3Fb/N0LFjgEvrwSmAUgenSrDPMuV5JdUEFhAlB0Jl2InyUNjfbWatX0fu3
         olJWDyRoBfYWwWdgAszjcVMmQ1xA8ZUUUCElYGJ+SgZgch/WYjMvUHDmKCuGUzrBOYxt
         JQk2IscY/m7ZkUwj2msR53NMGQIiJFP+JqQ7YasNQ7NzoGPAgZ+oMoDcTigQRBdD01wi
         qSeCTDrdWxVLtxbFwdWNniYPP8Hbyp1ZMVB5M0Ata/6iIH47Pk8aXCj9c1Z1CoNta1sF
         mD/Q==
X-Forwarded-Encrypted: i=1; AKwUvBxzaKcVJ+afxnx1RlqCNxhHXroXfq1vcyLDT1MlttOEBCQomnkh2EM5x70e+upEMQuQoA/+59Z4mNuY5cc=@vger.kernel.org
X-Gm-Message-State: AFuF++mDC9NUICAEUGTtcM+MEW7E+cDZefx/OD3VeI/ZaAgOQ78XTy4O
	kL0Xq/RwLlRTAGZhWzHEFC1YtqQK0dxOuOH/am5/IbNKmRGyWOOhKXoJNRRg/oUCrEcM5oxSvC+
	IjWo20NT+NShfvDSFpB7g+O0DJv3j5uQ=
X-Gm-Gg: AYBFou1kO/eASLb+kSc+4PLMiw7Ceg0o6Divwsvd+GB4J9ke8EX0LvlGAZlLw0tj9Pp
	cvvaOLJiWEGDo6frYxbUGBpa8Aof9T2pnKtdxhK2aClTqFIpfJkFoe/aNJOFXhjtS98rwvBGXcw
	Aexj2KrWX8YMZCYcWvBYqIq/Mk78Z346Rol+FTXvz6bh21koTiLp/dxumoHDtOwoIIcPXxHfWXE
	ICyu3UDusA2yykcDtKIM2aJzwmjZ78L6/CWuzhKsXXwoJKtQ6BMs3j/w7AZR3hAtT2g/GGeNqem
	pofeK6jfqm4xKDXXQ5XWanU54SGMrr3bZCVds9fLpdnoWjpZec+sdiVg
X-Received: by 2002:a05:622a:1392:b0:530:e310:7439 with SMTP id
 d75a77b69052e-5327f54ac04mr93088881cf.32.1789621164815; Wed, 16 Sep 2026
 21:59:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916155855.9022-1-palaomer100@gmail.com> <87zexgyjja.fsf@yellow.woof>
In-Reply-To: <87zexgyjja.fsf@yellow.woof>
From: =?UTF-8?Q?=C3=96mer_PALA?= <palaomer100@gmail.com>
Date: Thu, 17 Sep 2026 07:59:04 +0300
X-Gm-Features: AcwNN1UKMcLREXIyRIuWx-k1CYLHgQSw4KdkriB049iBSdx-PiCuENl6cXQpi1M
Message-ID: <CAKhZXnpZEBdcb4MDQds50bfrkv9Xh65BvkpeVpngGb2te_BzZw@mail.gmail.com>
Subject: Re: [PATCH] staging: greybus: add newline to sysfs_emit return
To: Nam Cao <namcao@linutronix.de>
Cc: vaibhav.sr@gmail.com, mgreer@animalcreek.com, johan@kernel.org, 
	elder@kernel.org, gregkh@linuxfoundation.org, greybus-dev@lists.linaro.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Nam Cao wrote:
>
>
> Also no, sorry. See:
> https://lore.kernel.org/linux-staging/anw3nOfSGKoq-1E_@stanley.mountain/
>
> It is a good idea to look up the mailing list archive for other patches
> attempting to do the same thing.
>
> Nam

sorry for wasting your time

best regards
Omer PALA
