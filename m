Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03F3B3515FB
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 16:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788195542; cv=pass; b=AEFIVOdRi3+RNSqa+5uQeFVX53NSU0nxhfJVfL9iWWqdF1yCPIdWmbeAfakzsc87/5+IL2cOe5pcCYBd+P1kn4Pw/ViBSAgm8lFVX4sLS2dx+zqvFIkUPqIekvZXbL5ZOeJY9qFKYykEfLUZV6QEgrKpMzJf5emHvWpYRlqjeyo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788195542; c=relaxed/simple;
	bh=CsQfL1tfliO9VnEQEMentzg6G++ksmXz6fvZ/EjRAig=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pMYpDRf/CiItENysvyg5a5zZyp42uwnX2XWTyeRwfKsesEHLllJ8QS+/7pHQ0ExQ8iZcIAH1eCc7vv4pioo5OlsvT2bqvhz9BPhF4t3lBRW1jASjVjqI1fsYTy/pb2YflyGeKPYbT6rS0/9N7DwaiP33CFRK+ZvX+kTPk0LT2Lk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZGsOi5WU; arc=pass smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZGsOi5WU"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6a60f0dbeccso4906730a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 09:59:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788195539; cv=none;
        d=google.com; s=arc-20260327;
        b=TTOdsFiGyqRipZV8Ti6i1H2L0D0hfhAPTLOCI1pAu9FYre7d2xTuY5q4JlcTYoMI6v
         0VVzFTUIO9ATQb76vRZG5CFneGBp89OI3f3puYe+zsokF7RBFRGw8LFNxeZZ0kvnLtR2
         r9YukQyhAzM9IaG9qEiBmfSkxKEB8bdYXLOzQNDKWeGOgp00DjCB3Ki6Ugd1/j5DBkVb
         fxcsNEWAr0CHGg8q+RQF3oqxdVOMmKcLWMzxbqqC98CNMjAk8B1YdKLqYqtOw0bzt+uf
         KEwQzvSccctIKx0QAH9zT1rqJn1aF2Xw+hAyFZ0g90FVADeBc7yUR83Buh/p9ov2p3lp
         Ktgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=CsQfL1tfliO9VnEQEMentzg6G++ksmXz6fvZ/EjRAig=;
        fh=FerOyxVzYYC/PcNuvUsGmOXhjR9GcgFZAYUgGIUoXwI=;
        b=KF6w4Rv40WAtCKFWpPAt56k89QCgjVOQ/jr1+/E9SOdPr9FuEJZ3qirkWMl6sqAk97
         +tzcjgaJDgXQo09npLrIW4fsncSOSy196zpZQRsPTRVB+u80rLOoaY5EEKzpJHriRj9j
         X0bCsW2pQsGMiYGTDM9SRld05FLAwsglpxvMrPLBXz77WzAJ0mdGDkKVeTh1aRDITF5Z
         vB+Z9QN3XQCkGS4KGFMmBkLBIU5ck+mLA4cRg4DpCBVpCteIwFSpT9vBlvDfR9WWWX3q
         g54x5Zq9DebnMTHzoLR3n8NYFgQDu2KcL3zF//ZwYKpGFirxjHzUPz62I652zg3ofGM/
         TwmQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788195539; x=1788800339; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CsQfL1tfliO9VnEQEMentzg6G++ksmXz6fvZ/EjRAig=;
        b=ZGsOi5WU9NCQ6LpJt2GfhoVhcq89740BkN5EAsWwL23z5tXHZOdYrFpPAxCORjnYCz
         wcacjl/jgGNZfd0aOYrasGmlwizhuT9FrkAD5yZCJxHIjGrOWuS9+dnxGU2CqM4unriD
         lRlgCvZa0i//bnUwiRaoDyPEQmghvv4HFod1xoee8OqgPtK96Lqe/4nwD0wIRX//a4TD
         e52wZx6pAv6+sLbaVTdMZb0lxUZhsM+XAJ4DXBborvYWXQjEsU0qZff6VHucIYFsE2Lq
         svCDEXUZZTJWFm/bXEOln/MpdjpLMgdAdsN5xeCXD6AzolaBqkTXbhQHO/LVarr5d4pr
         Myqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788195539; x=1788800339;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CsQfL1tfliO9VnEQEMentzg6G++ksmXz6fvZ/EjRAig=;
        b=WeGKJKEU6o1mDO9QSoEir7a9TgBg0njig1WF6yTJGGOK6f76e1RM34mvdUs7t3+mf/
         POYeIr14C1a1CoP2R84+lYREXCcwDdH00QILxe00HNAK35MtxfBkQJee7lVK3hoCCPOE
         dNTSfPgPTUL+VH95xnIw1oaS/X0baEMR6xr/FZSbR0+GUkbHjUS43+QPi4+d81ToLRmP
         ieC2lwQ8K7kHVWJDl2AqbkdsjeTanSx4MY0Jqd1AHxEfioKJmVAGRfz6Z4+ZuhGbqxOr
         r+k3DNuGRVS8h8+H8CzDVz1yEI7UTt5/JhlNe/6QwKgPSzXhO/xKUA7onXLaPCbTe8XS
         ccVQ==
X-Forwarded-Encrypted: i=1; AKwUvBweuEExV/5OWhtb2P7q2SkO7Wx6GEkJpZXsJ1dc/P4RWGyFMTd6BE7M9EBZZML1KAmbp4zNva5sZSUzR64=@vger.kernel.org
X-Gm-Message-State: AFuF++m9HZqryHcfJgR0JukgRvU+YbpofvgePwGc00byQujCVtDhil3C
	4s0dYjl2syTuYrACOxCJ7SeYg3eRIZkoK4bs/Av6HTowkQzm3JNiZPYuT/nGNIW4jSyTnioYHQW
	cB7uQ9Mjc06GuX1C/K2jNNYj0O77DwHk=
X-Gm-Gg: AYBFou38As7eaB6NB1ukbGlbctlWfG3i0fXt/UvL05D13GdT/epEFIT3s3HGwumRWB7
	ritOPiEgTSGHevwJP5i82iuWECguOXFAT9Rt+ZcUJa4zXs+herx8WIzCRIkWA4Buft+F/i+h4r4
	iXO0KG7vuRUR+Koe+cFnUfQLXkB3N7LQC1x0Sl4qxGijkQOg9hXWZTqNquZycqVFzBJs9Rpm4YR
	ILO7L7ALi+dJg8xj+do81qapK1hOKVO3LWDuci4H+k3ezcHBjqhVtTo+ZzemLbQmaGSUDjHwrU3
	7lVvy5Q6S/fmE8Z7meQsQDvvYv6lOtLZ+EwEnJUs7cAEr045tp2gK3j8iIzQ89EMLTxJXbIgCC+
	r3w==
X-Received: by 2002:a05:6402:3509:b0:6a6:32f9:d7d0 with SMTP id
 4fb4d7f45d1cf-6a632f9d92bmr7965344a12.21.1788195538559; Mon, 31 Aug 2026
 09:58:58 -0700 (PDT)
Received: from 637551599889 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 31 Aug 2026 18:58:57 +0200
Received: from 637551599889 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 31 Aug 2026 18:58:57 +0200
From: Kelvin Zhang <zhangxp1998@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <69df3654-4f5d-4f8e-8860-62e545897192@kernel.org>
References: <CAH=xXfEFL7w7nsU3xjNubKJ1soYMqT-DbJBuyzfEX4Rv3rdFEA@mail.gmail.com>
 <CAH=xXfHL4bWFMVa=-a8sRuR_bn9VcaFRo+X3eeZfedSa0C7dww@mail.gmail.com> <69df3654-4f5d-4f8e-8860-62e545897192@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 31 Aug 2026 18:58:57 +0200
X-Gm-Features: AcwNN1VwC0SeCPllS52NvRnYaVl9oX696Jt5ylne-NYCkQLRrEX8lr32DGjiAPU
Message-ID: <CAH=xXfGNRpY9y6p7u6dJwUqv2ct2RX+W=K8F0t96hJoA-tMkzQ@mail.gmail.com>
Subject: Re: [PATCH v3 01/11] f2fs: initialize sb_info early in f2fs_fill_super
To: Chao Yu <chao@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Chao,

Sorry about that. The previous Gmail API send path encoded the patch body as
quoted-printable, and the delivered copy ended up with hard-wrapped hunk
headers.

I have switched to git send-email and am resending the unchanged series as v4.
I will also verify the received copy with git am.

Thanks for catching this.

Regards,
Kelvin
