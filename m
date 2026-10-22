Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792640683;
	b=szbY9KKCq+PmEwH1pf/73z9/uw6fPpUvlQ+8isqjbBmEedRyUvka0puxxHF474MhJxtD
	 y/rw1ntGsia9tyvmgA4TxmE5zB9D/PCHQv/GEKsfw8COH5yG7HIO03KVsvrT1spsjdo4T
	 WdksunfNc9y56xqT4XyLOuxTmDsAI85Kjwpzgn0iCIGPkH60/qlQAImQe1S/SuAPaAJNt
	 NgIb+8BKSMPhTTe+azWTQ0AEBHfKCWzW0EdSGDVdIgLo9MLlWCZA5giXt3e/fXIG81AF0
	 a0MhUIhfAY0wetA/yJk80o0JQAHjpwu61us4f9AMCYRRQyMoIUicJvyyCkMP0HIrpUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792640683;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=IG6kRcjYBU/g4TMKgH392ux+rt1j2tFirKvhQsBLVGA=;
	b=C/21kC9TWYoHPfeTPYzVe7IKgRThEs3/8GEEvVHzbmjE6Srqy7wsD1UcuXWIZlO4Ru4m
	 8qUxSrZU3XxwKVO9LqslmzxZqitccrB6cP+7XBpVMecGL7PQFP1acJZIYvy0yRY3ulYZk
	 5S7lELWEcunt+7rqHPVm1PaogzKlwWSpHGsps3E5QyMXZ4GIixUyUOX7qwSzARu0IVrmU
	 tIj6pz2eq21deJ8sT6C+xCv15LT/dFsFMrYOWc714LxcgujvlgeeIYvMjnze2LT0otwSU
	 LneZodklNzCY9tf7XEMKFqeSFZNs9BTz6ByNqVzgZJtEhVt64O+H3gStuqHpFIwvxLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=bf3tVT52;
	arc=none smtp.remote-ip=209.85.216.70
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4AD6606A31B
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 03:44:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4AD6606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=bf3tVT52
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3abfcf726dcso2280345a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 20:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792640682; x=1793245482; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IG6kRcjYBU/g4TMKgH392ux+rt1j2tFirKvhQsBLVGA=;
        b=bf3tVT52Xz5oe7HWwuYdS4vPehCYzK78ylgL27ucbRU+UeqRtEzcHk7F3S011WkXBF
         pQuhp6XFXukbPgM2erGAacWTr/XOdRowGieSeW8VcwaJiC+Y2eNlY3A//Nj8ELV23hxt
         OsBKLdmoEABBSzY/V8U5xamVzwUJdCku0jOLMVUWcMy5jtcKeuzTMhti1bufQZRftZpm
         l8g9Uya13AwmIKkMUb7GpoqwLDpgOf3/M822hqMcL00rWm3tw6buIhmtj4/Y9E0wkdsE
         LHQMfTZEye1o5BMPKPXsFaUuZvYlon1uaBwxocZeCF/iclZfi04952tpqpyZERt8PCoI
         GvBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792640682; x=1793245482;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IG6kRcjYBU/g4TMKgH392ux+rt1j2tFirKvhQsBLVGA=;
        b=mcPWGuoj8vHITtzpwizUL7OMEJdnAZ3pFftGDOGkSVTGMLzntVVN8Y0p6nFnHEtasX
         plKFwU1uKOoU/7lsHla3RBMPRgroIcUE9EPSxpkZs2JjylE9jI8W42spJQZ07xJFVYdR
         ua4V/FyynVcyRFbc3pdj9PAalLYzCdIbCOXs6c6IuWCQBWYV7FF4lxUNMA5PGFF221pp
         hHhr/JmeY0lqOKcyWty8dyrvhPNjN0w/Ry65HpqQx+4rgWUnu1Vtd+0yzbiyefBeSbbB
         BEiLIPB89j5pK4wBhNXjDzvaNsQAf70mLYQhvtI9vrY0fe/cZlFHEUh6pPL3cd9Te+Mj
         dKYg==
X-Forwarded-Encrypted: i=1; AKwUvByqghA/zATD2/amF2Sm21pYxkgfLLSVKIr5suEKoOHPI5n4QGXNPYHsVzimGy55qFYuJuZMY/7I3IvV+dA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLwWKmkYCTKuA+bN+wQ9dR3TlFM7pk2qN4gmTHpkY6iyNUfdGQY
	43Jqk3rWYDIc6jZXnGEC6UmmfBKMN94sJGst4Fb1aGKnPukaqeA56IzIiGMZYy4UDBmw8Du4CaV
	U/bkbI1GxnryWNUj8pyMRbQ==
X-Received: from pjwo21.prod.google.com ([2002:a17:90a:d255:b0:3ac:989f:b65f])
 (user=stanleyjhu job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:548e:b0:3a8:2c7e:8986 with SMTP id 98e67ed59e1d1-3ad86f44838mr3389905a91.17.1792640681540;
 Wed, 21 Oct 2026 20:44:41 -0700 (PDT)
Date: Thu, 22 Oct 2026 11:44:39 +0800
In-Reply-To: <fdb5c391-01ef-4a23-94c2-4f3853909348@acm.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261021035450.3488805-1-stanleyjhu@google.com>
 <20261021040615.3566831-1-stanleyjhu@google.com> <20261021040615.3566831-3-stanleyjhu@google.com>
 <db4d4e246ad6b4769f736db0d3d1678adf9d59cb.camel@mediatek.com>
 <CAE14pdcR7NPqK3W6Pfy+FkRrXSXB9wFuweOhLyFtSye_Bg4vWw@mail.gmail.com> <fdb5c391-01ef-4a23-94c2-4f3853909348@acm.org>
X-Mailer: git-send-email 2.56.0.218.g1ec904b173-goog
Message-ID: <20261022034439.3033316-1-stanleyjhu@google.com>
Subject: Re: [PATCH v4 5/6] scsi: ufs: core: Fix double release in ufshcd_abort()
From: Stanley Jhu <stanleyjhu@google.com>
To: Bart Van Assche <bvanassche@acm.org>, Peter Wang <peter.wang@mediatek.com>
Cc: "Martin K . Petersen" <mkp@kernel.org>, linux-scsi@vger.kernel.org, 
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Bean Huo <beanhuo@micron.com>, 
	Can Guo <can.guo@oss.qualcomm.com>, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On 10/21/26 9:37 AM, Bart Van Assche wrote:
> Do we really need the code that checks that a command has completed
> without notification interrupt? I have never encountered any logs on
> any test setup that indicates that this happened.

Agreed, we do not need this branch, and v5 removes it. If a completion
interrupt is lost or arrives after the command times out, leaving the
command to the SCSI error handler makes recovery slower in that rare
corner case, which is acceptable since it only happens after a timeout.

I will send v5 shortly.
