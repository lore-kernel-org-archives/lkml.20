Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 970A03CEB8D
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 15:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792078334; cv=none; b=XgZhuWsEG56m8snMlFMTSbXeaJCEi1v8RZlDO5Jeb6P6VqIlJtKucCq39L+uEzElz7XZz5tGoSGiFVE3tb4RvyQkMzGx8w9jkAI8Zl+RuKijJuoBU6LyEQp9weZodqqQpIrRSIunY+67Ju+hzgLc5+DCWuulgwOfq6hswY6iBrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792078334; c=relaxed/simple;
	bh=e0sIXOKR0xs1k00jTBjY8M4GueDsJ90MJVOQ7kmfR9o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hejUJJgpfqY6NLlRIw4WetZY2cGdCl5zzvWvaqQg+2G9hRPtPrD9e+Sa3w2bnOalYRuMwgUveSZMQu3FgN37sUjOtH77612YJlIyY6wujX0wTsQiQAkoLMy7TPN0zRKch3Nm4GvnvKb4gNZO0oEJha3CM5CSfHaW8NWrf8yNTkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rep2Iu/h; arc=none smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rep2Iu/h"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-15ea896ddc8so3209539c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 08:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792078324; x=1792683124; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=S/PW3Wn5OQKVEn/pyyX/DchOj7A4//pr+AwRdQo+Qcw=;
        b=rep2Iu/h18yExdoFhtminP/+Tg7yImU5iAqSgnj3OVk74g7ljzA+w/khRQ3ecpTV3R
         o9Vq0LA3KfK2FyZFGMJGsjiRQtap+wN7zdZWNTriqx2ap2LUSYUjaFX+WuL3ww+bcQIg
         /p+o3vUWxlp92BKSBs2V88WcBOMuzxKwKttPeckbAXiqvPdx2FFKJ/PL+9lNMf/ti/cM
         pnmiwpKBhya74dYhQyECX/ns+y5K1QaEDUXp+KOyVtezd25hdkXiv26LtMmzTzrnuq1m
         VW6+72QldHclPhbTfDRE3YdoiRTqkNDGUnD726TlWfZetWBvFqSoNEaDKSVY3SbV8xdm
         VaiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792078324; x=1792683124;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S/PW3Wn5OQKVEn/pyyX/DchOj7A4//pr+AwRdQo+Qcw=;
        b=qdoYSP5UXYAlwg3y6pDhfDG3Y+IwJkceSJswlvpe78W0vU1vwztzkPLt4txa8wuS+t
         aK59r2u6l7xiKOkHt/MqZyevufSajcvHwokHX2qU1QCnV3uVNMG9mricN8x7L89867FY
         iCUXgDk4aNdb/NqK/IZPmCJ4PJvYyQNmDtoDnp7+LdwsZsrQ4p/9uiqNjAaMsXA75zgk
         ZzRo4zJJJpFCcWKZFI+m6UFZvE7ScOplwM9c0DaUJr2bGCm4CnqPBfX/ag/pRCc8E7wz
         ju2AgR2whD+SGSG3/cUufr+LnYdzARgHBEf0fXDnqG3pO/Tbjjac2ZXXJiLY416Emjec
         5POQ==
X-Forwarded-Encrypted: i=1; AKwUvBx1Yb8tagsvP+5FjZp0zGDNJMGMTctUGhQh5esBhyaDVuU9lOwGCtJ6A+q2GCi0uJTYABi2Vw4JvhgN4fs=@vger.kernel.org
X-Gm-Message-State: AFq9FYLP22MhqbT1CSZCbPKZGyqfTGJ1tCDfPJwN/mmV1DyOy7Sddvjk
	mwmvu3/GLQ1lxYdVZ/w9srBOHtGX035Tc3OIud+SSyCUiIGMdOtF3L/z
X-Gm-Gg: AYBFou01G2fQtREETd2TUZa6mwE5Stwp4KQ2Ld2PVb+pjKN7QSWqRJH6hv/wiCvhvtc
	B3OVa7P2eNHhxLvTEBW7kG0X0KwKdqfM5Qea1L5RLGeNH8QGHS+Ow8RJona/MHAtKFcFL85kYHN
	c4tEeC2NPgZObpZLz/ue9Y+9ebD5Pc4w+XkEArbgcYp5geZ+AVFuu8RfVDTCOY9t1XZe/QAyKwd
	tIKTGyYa4gKPLBTYNVvGJq83dV8vlcPqUSXjbZqZyRsgIWHwL7EAS/cJpQnPT8ZPKTBgd/N4LIY
	KMp9A8d6ANiiEgTq5V3WkxcmOEIhrj5bMpoYqzcnu9FqDyV+RxGARRXHyGbidIKLQLAAu/opTej
	X7nHSUAf5N6jiIwZjaAbz6ooxyGNs6xSGO88YKVeJoZbTUNS0WYc0RcCj+8tnh05G99HqsmavPI
	Ee4KL8s2kqc2qMjkX6PFSJBHrO/aA5AcYlLv1Y/rqChJjkDUt4UNqCbFAK4kwog6fDqWCwa5hKq
	MW7
X-Received: by 2002:a05:7022:295:20b0:151:6e80:baa9 with SMTP id a92af1059eb24-16a5e49fdaemr24329739c88.12.1792078324288;
        Thu, 15 Oct 2026 08:32:04 -0700 (PDT)
Received: from user ([2405:201:c052:b00b:a490:42fc:1e02:1d0b])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-16997c21ff3sm56081603c88.2.2026.10.15.08.32.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 08:32:03 -0700 (PDT)
Date: Thu, 15 Oct 2026 21:01:49 +0530
From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
To: Luka Gejak <luka.gejak@linux.dev>
Cc: gregkh@linuxfoundation.org, outreachy@lists.linux.dev,
	error27@gmail.com, ethantidmore06@gmail.com, dennylin0707@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: remove unnecessary parentheses
Message-ID: <atDx5dH81s87HInI@user>
References: <20261015120634.95218-1-pavankumaryalagada@gmail.com>
 <5d577cb1b4a91e8cdfda171bc7100105ae90d91e@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5d577cb1b4a91e8cdfda171bc7100105ae90d91e@linux.dev>

On Thu, Oct 15, 2026 at 02:11:19PM +0000, Luka Gejak wrote:
> October 15, 2026 at 2:06 PM, pavankumaryalagada@gmail.com wrote:
> 
> 
> > 
> > From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
> > 
> > Remove redundant parentheses around the address-of operator to
> > follow kernel coding style.
> > 
> > Signed-off-by: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
> > ---
> 
> Hi Yalagada,

Hi Luka,
> 
> I'm just letting you know that this change is no longer needed as the
> entire staging/rtl8723bs driver is being deprecated and removed.
> Support for RTL8723BS has been ported to rtw88 subsystem.
> 

Thank you for letting me know.

Pavan

> Best regards,
> Luka Gejak
