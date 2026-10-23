Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792722604;
	b=Jk2qkHC1Emlmv/449h/AC0BEsIhuBWU3FHfBvwxJnXynDTxGcStg/7xWZOlDjYe79dDH
	 cOK+MbirLcEV4OrtrgknkDN4a/DlZlAIwWoW4eBjQlrp1Ht8/h0c3GXkyg9y5k3O1P9dw
	 RwfsS7FiUlhtIePlmtabLT58NVkY599MQQwl7bGASdxfcm2e9zMCPgN7x/1GzeHAOZeJk
	 F4ipMsW0Vz/xVCMkOh9TJFo/cD28HZfjYcEfYHmpPK2A3YzIWYEqeSKBPuKASJMwDBklg
	 Xwd6J5gYBbgAxMhk33Jj5lmbbua44rBX3BseX/Yl6jfQ4yRjSMF02FuFTMwPCImw5Ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792722604;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=PdL9lRrDABEAZ0rJfjxtsf4RmpFyqkToBsIy06Xtq1c=;
	b=5ZTnoTqfE7AJDc6VwtWBpOgDwhxTVQu7mINJEF3HqikfFrkrnVW/L9ika8dcnG7kRO5o
	 Ct7+CdSVPtvosG7oXvWYOgvsuarFvvxP9y3Qe9gij+pHm60LaCnf10IDPcdQGmzxw73th
	 cATEimP7c7Vkl+XzbCj7OFpTvygapOxxL9GCRFaeA92T+H11zxIp1Cy7hCrqA9JFluF6V
	 K3dETXzMroPoNtzcrKL577ubcmzzCSY5y9S9SF+sbjy9WMujzkC6iZIHV4oj+crVEwTI9
	 C7n6hcU7dCR78qsalyLZBes6YWNluz8Ae3BnL/MApKNArf5CkuPIWF7Xt7HANnzgUEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=QKTpNGQe;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B452606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 02:30:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B452606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=QKTpNGQe
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a1ec92f655so3127485e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 19:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792722602; x=1793327402; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PdL9lRrDABEAZ0rJfjxtsf4RmpFyqkToBsIy06Xtq1c=;
        b=QKTpNGQeHuPcHVVFaGvv94423Cq43ubsrjWnObMhrYfXlzEcX94SxQTLAWH02AovTo
         fDyxSRzPz+4gUu5SneGGNnIAwd6VOne8oRDJJOIFJ2PJsMYMk3Wo1dK1hK4PzDa9LW43
         sFoUZY0VLAG6+OKBBZxe5FxH3ZHHoe+UHuT4RXgwSB0Nl/pYxWvZRm/2Adm7oKdF3Nvk
         yQbeRfDMV/7ygvHnIl6uO15MgyCKCAYca/FmMMPCYIvpRXNaie2b2Ii0n6ausr2epIOu
         S97UrWMtMgfS3+2iAJByUfZVKQ+bNGc54jw6x7WwV/lVBxVa4TeGNp5mEtj6y5fNJ1Ju
         sLHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792722602; x=1793327402;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PdL9lRrDABEAZ0rJfjxtsf4RmpFyqkToBsIy06Xtq1c=;
        b=Rm0wM/ZILdb4CiyR+UHLxztAvxhLJwYdeDzUAG1eGepco/v37gOWH7uwOVdZ8UbAIY
         QtqLzrxY9pvEZNVGGKcULf3mH3rpQLr+XcQZbT2ljxnUBYkK0hJltj51xzrNo7GUn4DM
         jjG6KjWQrjEeK5UWbc7iLeYBDJCi4CVDS6kR+SSleJyXdXm4+l6Yc5J9JD20Vzei6dF0
         y5K7bG9SCSpnuhoX7pok6yoSFmzEv5SP6tmta0PREcHwygVC+nXUwuw6PR03VgMpyHsi
         VKIudvnkD7+i36bJC0wIUMOfl8GwpnvsDliU+cjjJkDjpcORj6JcdSKnz+JbVcQwqix+
         HfAg==
X-Forwarded-Encrypted: i=1; AKwUvBwzKeQlQZHiDP7Ssn+j8u+gd5UQ4bEHXv+7TvkOhQx/PA5NKEzzvYvHWMgjHAXkYRBAR6b6JDVWI02FPy0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKdIlIz6L2Ysak/S/pg4XueaBaX0MQPy9TxSbEdg2kwbfZydtWq
	qRM/QoVPvJ0xDHsgrPDiUTrDpUfA/ERFMtkgt5WOiIQVj2FRuoTBEK9INNr9uIJv44U=
X-Gm-Gg: AYBFou0XyVDVH4rlr6L8NLzbS0YAehZqcHmiJgoF1D6pSYxeafk3mFnqnkMxuIaySpj
	gzmpfZkA7hrp2ENylcLFAE1TFKLAylWYjhXJZ74OMfFGXp6AIDCrTIFTqFodbJkSi4cuTf+64LF
	5SkfLs1FntmebOExt/YBPchsA6VSsEqObvd2G9mF1z5mgmWMFX9+xVyv9pTTKHAxzfIYPKhjixq
	iDlr+NB7YQ3bmn053y+Dhk+DXmoclsO3pxJQGRn4qzfj6Y71xGZX1WhwYmmYBgDj2Y1YOT27w4u
	eqioJEdxoPtfIfYUtPM+gpu9hNqWgJ4SZrUtd4IJi1K39Ak5c7HiWTsYSNfImn/QzeHDfhxA827
	uEs8/OPzHMgP2KclxPMLJvidrZYI7JlFtjME56yriLTPJ27+xRZ9XAAlyASonrZB/THcFnAo4r8
	ThpQ3AWxGUOuWtmN2HKp7GfAkaO+nf3H+Hk1PEwYcwuUY9zL/V1QGaqrbdEbGbQ937L7zBwRgpD
	mqZMFZp3p+a7V5veI2HCC5EVKfBOsIhdFHmRsvYqGhPn/+qw3zDT2dfjaww3+cuC2dmNsvvK/ve
	fY2PU8HJb6WE
X-Received: by 2002:a05:600c:3542:b0:4a2:b73:d15c with SMTP id 5b1f17b1804b1-4a211c51a9bmr12422005e9.3.1792722602389;
        Thu, 22 Oct 2026 19:30:02 -0700 (PDT)
Received: from [192.168.0.167] ([51.37.82.204])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a211bba03esm20901525e9.9.2026.10.22.19.30.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 19:30:01 -0700 (PDT)
Message-ID: <237b20f5-3354-49d7-add8-71170d450306@linaro.org>
Date: Fri, 23 Oct 2026 03:30:00 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: greybus: Replace format specifiers
To: Johan Hovold <johan@kernel.org>, Julia Lawall <julia.lawall@inria.fr>
Cc: Alex Elder <elder@ieee.org>, pavankumaryalagada@gmail.com,
 greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 outreachy@lists.linux.dev, elder@kernel.org, gregkh@linuxfoundation.org,
 vaibhav.sr@gmail.com, mgreer@animalcreek.com, vireshk@kernel.org,
 rmfrfs@gmail.com, dtwlin@gmail.com, linux-kernel@vger.kernel.org
References: <20261021163437.280930-1-pavankumaryalagada@gmail.com>
 <3433f922-bffb-4f1c-8e06-a7a87f5dbcaf@ieee.org>
 <d0a4a257-1ec9-7096-11db-5ff4b3244bac@inria.fr>
 <4c393ce3-41ae-4f4e-9af0-4eb7cf1c425a@ieee.org>
 <6b5a87f-3ca-ddc4-1ea8-f3ee7f45d83@inria.fr>
 <atoVKX09VDnak7EZ@hovoldconsulting.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <atoVKX09VDnak7EZ@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/10/2026 14:52, Johan Hovold wrote:
> On Thu, Oct 22, 2026 at 09:45:51AM -0400, Julia Lawall wrote:
>> On Thu, 22 Oct 2026, Alex Elder wrote:
>>> On 10/22/26 8:35 AM, Julia Lawall wrote:
>>>> Does anyone on the greybus list know anything about this person:
>>>>
>>>> Bryan O'Donoghue <pure.logic@nexus-software.ie>
>>>>
>>>> The email address is not valid, which is somewhat tiresome...
>>>
>>> Bryan was on the Greybus kernel team.  Remove that address from
>>> the list.  I'll let him know that e-mail is bouncing so he can
>>> add himself back.
>>
>> Actually, the email comes from the MAINTAINERS file.
> 
> Hmm. I haven't seen any such bounces (and I CC:ed that address a couple
> of hours ago).
> 
> Bryan, is your nexus-software address still valid?
> 
> Johan

Not at all.

20261023022913.3763777-1-bod@kernel.org

---
bod
