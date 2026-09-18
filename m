Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7D154B1B5E
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 12:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789732919; cv=pass; b=XpQz+7EENMMc8xsNSOITOiZ3OVDuo4NQLvY9JkMK+PUm1cY0aStHF0SDDtIyvLeChL3fBTMERfSOw+7wAHxzRjMozgEP2YAcbW6L1q5XtH7l4S6EtqrIgjRL0L7exx4fos6EREC9QxXyVW/zwZFHPSRI+XYXwyBhVMpWX6seIZU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789732919; c=relaxed/simple;
	bh=M1dK5DFyS2Xdz4T/diTsjALrxvZ/bfOp5H11ne5BCCo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hM45+5McwnD/Mn4979b3rZ6jqm+j+lmyvTCLvqI0REis7U7ow/NuscETo4wf4xMON4c1FEcdzpi9mmGGZFaylcdZkOQ0zVhOcFVVbA9jylvuRTrIar9OB9WgGIOEznSV5KrrN7B0gyaTQyW3Hp+Rlw66jYVUKtPU5BYJiZplRkI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a/FVqspF; arc=pass smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a/FVqspF"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-52fb76ec504so3408291cf.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 05:01:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789732916; cv=none;
        d=google.com; s=arc-20260327;
        b=Jyh379EDWRQ/OCNLV/KQwQHUbxGjEm71eX3wrZqzmiRA7hFwl9cokRBlG3As1RFsfN
         zfHLlsUPPGaOND07CaqMb+JHgavAiqdos//Zbfp1zJUZ5Pj5konTrqCvJJOZmVDH1xZr
         CDNOcm0l6tN5i/quQEDdlL30AvU8jXNEmo43k550ftcbMaU8W2xMG1+UgGtFQvht9nyT
         xDVCV2BuoJy6QqHdr/fRTsKoqoh4jma31Yj6qE+4Otu8FXXxgSnYS6NMAGBD/n6gGpzQ
         BdplXezXwU0VjAnvl1+YSuySdCiL18bfwZEmyQBEI9s5fc1f/vai9ZJR2QpN5NrJEmMs
         rUiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=M1dK5DFyS2Xdz4T/diTsjALrxvZ/bfOp5H11ne5BCCo=;
        fh=5z8pExEl5pPkF3OSPRMGCk1fED8iyaVQu34CaC1aOis=;
        b=GRjhTIukvycfWOl9rOJYlrZ3NmAZXHshLS3s4qnjRk6LycoVOrABnNdqYdLQ7UXRxw
         pTa/Gk6tfoF1GC64oo2m2hOO/zv0KZhYagqVF4F1PsGLIdGjhIAsAN+Jr93LRDKNMevk
         SVGWBpPS2eNK3UPUJ02zLKlGXVZtlyPbt6SJ7VjzCHSSSNLnmfSpI9zT/ky3Ii5qI48f
         D7IvAXxBgJntHCuGOQHHifeC3VdbZKx4UH3knLwttZmFwdNRy40aEydymycyQfTaTj+P
         sUVPj7jVug3rVh6+rgW9yZcMyV4RObZlJEvqdQQ40KSzpfHfFl84JX01jXcJa/YpKudS
         VFUg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789732916; x=1790337716; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M1dK5DFyS2Xdz4T/diTsjALrxvZ/bfOp5H11ne5BCCo=;
        b=a/FVqspFnoZVJqVCKknw+PsR8Tj3CV4XK3np/pgDkLQ9DZ1bCLG/pWTP+b9bfNUuJy
         Dq3Sgh+aq39ZlHJbztUaFKIGtmIMUpB9KvIJkos63asDzUucV+Lzm8QHoIat8AAxW3UO
         8PK8FOg4Ka5nmBdb9Fxs8EEtjKgjIfbFOmK3FWiD+83EZP3ZNFNVohOeZJPNL8n1Y4IE
         knYmV2LAED9vJeqwUkfcgTeUhiaygZLH0fk4jhwv9RVOWsjuVaqMWVr464w7epAB1y4a
         ZDj54WIpFPk1BUvl8xbBtM3HnoHW+mrpQjSHEzuFnWUWZNgTtznfHajTXaL5aygoxWDE
         9uAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789732916; x=1790337716;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=M1dK5DFyS2Xdz4T/diTsjALrxvZ/bfOp5H11ne5BCCo=;
        b=wvjhbmF+DptHViRTbRmI2bXyJ1s2amR4kE9ZcSxyjX5ByfRs6OUaylH6qfitFcf8TE
         m1bA7cnQfZToXW47A6wIScmTotMPJR76xLul+yyddorT4ZVdkDIVRX3CjBEqI7lnS2fH
         f91d6YCqxvmbOUIr0myATXKSteP7gH9SxgIZeOlalONaXsuZDPiAd4ZAGQZDWOAUyTX2
         nHRet/ys/od2mtky4ufE2CM9N+UmEvQ1owqHxmR33wutV8E7vRAdrqf+GK4dqWOPWTmS
         HvumgxPdxvOrWKfT1LZB5adOXktKlrNwMwt+GqcZnb0iUgYhJy4T/vXFQSqxtt+HLx9y
         PiYQ==
X-Forwarded-Encrypted: i=1; AKwUvByCCog4kHLAvKGX34d54IJXqs/orzE96ULCHH39L5d3wHCHMz+j7iUREZDNTBSm//q3V8JlzXehhkn/Y/k=@vger.kernel.org
X-Gm-Message-State: AFuF++lJCDxkm8Dhz+NqS22ii+9/QVT5U1EZDUbO5bXOu0vKFQGS4iG2
	ZlcAYzSaV+AcLbAMhW82axYArflW5TLWTxEReG7P47mvQAAebs32jadgbhpix9fEKxbVRwVSqpt
	1Kk/y34akd0gG6n/SQTm+l2XAzEEmlHA=
X-Gm-Gg: AYBFou3v5Sg53oX/JgJieks8v5uXan27lSDC8QrHMIKfim1qusHVrSknfSTZ4zRWa++
	nlabWLy8siOsiefy0lPnS9ZEJsusmY1YG0r5Cgl3hlTfIW4i5DjzLM23d1Yygf/aeYYj9qX8vyE
	6MKY3XZqEtEklX44giLLw8cjw5y1NhLp0YI1RqVv97fmGZU8wwFI7bwMPYeOtlGIQlxJxv40/hZ
	Nu365mVPtlWZq6CbpdLV/oD4p9RvkSUixxhbD+/9ph0OW7hWeV34ixPoJDBAaZLIxu1GddPUVjW
	hvSEi/AS5oETAKg+PR8s+0QQz9F5+Ox2t03kKFBVYvQ6BR4rx8SHOuuHg5rMfJWjqmu+8MEAs3X
	Vu72muhR5jKM=
X-Received: by 2002:a05:622a:118b:b0:531:1e10:b660 with SMTP id
 d75a77b69052e-5329e3ae068mr34191691cf.28.1789732916427; Fri, 18 Sep 2026
 05:01:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917212751.16729-1-palaomer100@gmail.com> <f98165f2-270d-4117-8492-e1bc94b19330@kernel.org>
In-Reply-To: <f98165f2-270d-4117-8492-e1bc94b19330@kernel.org>
From: =?UTF-8?Q?=C3=96mer_PALA?= <palaomer100@gmail.com>
Date: Fri, 18 Sep 2026 15:01:26 +0300
X-Gm-Features: AcwNN1W44O_4sp_NosZJ8Bq5gVP124lqZbtMfXYK9VzIpzw4FBq01MkB6Is0T3Q
Message-ID: <CAKhZXnoyoqdz+BxfDsVH-Mzq7hdpY+_hwrY=K97UnBJigt1Acw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: iio: adc: Add AD7816 binding
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: nuno.sa@analog.com, Michael.Hennerich@analog.com, jic23@kernel.org, 
	dlechner@baylibre.com, andy@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux@analog.com, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Krzysztof Kozlowski <krzk@kernel.org> wrote:
> Then why are you posting this? Did you read discussions I linked before?
> If so, why repeating the same?
>
> Best regards,
> Krzysztof

Hi Krzysztof,

You are completely right, and I apologize for missing this. I will
drop this patch since the driver is still under staging.

Thank you for your guidance and patience.

Sorry for wasting your time.

Best regards,
Omer PALA
