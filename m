Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6DBE481A81
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 12:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788352587; cv=pass; b=NCX7+Tx4OaxFvosqG8edV9eraix2wed219GQ2rtvGDQ6pWWPoFbggftnvzZpFA8lOAQy2Rb5JjaMWhrRAC+mw9pKDDHMGCq6fhwkPJYKQSgyQcThD4fKnGlzkFDyDBN+3HMaolV19+jajeOtPKl3mfydMXFT789Crs457I2vrGw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788352587; c=relaxed/simple;
	bh=l4Av1tnk1DJx0lSAkYYujTq4Pm3LS+q9DUKaEcW0p0k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J+qmYNBm4YRDNDfiSzM8KDl+SvQ5nTr5mlTQT8ViADFhaw91ELhPITXAAFeJi3euVMfTwdt7frK1Aj5M2nZdyRjYVs6EbRU+D0xJRm7e+lXwxByJQ30OEq0z4bmRI3WWFz/Ah08PWFXSzLdhxLnMdm8CQ8f5c2rpj3Jl5tbUGK4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=icBZMDs6; arc=pass smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="icBZMDs6"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cc1e1ff659bso1023898a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 05:36:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788352585; cv=none;
        d=google.com; s=arc-20260327;
        b=TK+p5JmKfmrL0dGjmxTf7YTx8ONLSNwfcxylpG2fXkt4cUlil4wnsHXe3hj/BrgSIm
         /hog8U13qpCreObhTU9nF6WXALbxaIHbqc4/njV0EuVQutRLnb/AVMDOOexKnHwm4naN
         9zObA5tPOPq5O1qSa+WdIG6/kMBF83z1H+l3FLb8TMU7FAhMzXFxKI1wFuPZxoWelhk0
         ZRVn3ad55AIsW33mPMlI1M/puZEx7ZX8citB1BMl7aa12rOUyHioSaR54ycdgDXR2aMS
         6tuUwnWyDxOjx5PLGggOiE5gfy1VKmS3R3e08MQxOsLIUmF0DPPzQwvo8zEj1oa5InzV
         6rWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=AKF+zPcaGnIjcBYSYaoawLCl82XfK40W4BF+GG+bvXE=;
        fh=xD/hiFMYaB3dQasKU56qw3HApKtmSSJvAE92YRd3jVc=;
        b=AeON4nVjok/hfr+JG0Bikhts9xC9bh8Q6x0+PPsY6CsEiDeUfBtY1v6tfmOj1WYB+L
         NDy/cTL83w+RBeKPuBEMAfv6oZ9G+v0FezRdI+uh9OaTPPs/XBt0zadSkSr5yKfCiZvx
         BW9jgkutetYjsw5xuD3PrQnY7vqXaiQd5ScRvsGAhF4HSgyFpiC7OcMjRndD86KKqozJ
         if5nhN8KT+CvRQbMZ6oSJ/2WAi7OpF8eUBgjFTNKufmtFBSt7HIiaZ/2Yi6SSxApbo8v
         NWfh+Gm9+RfMiKDf6P6TAsJE2sasvCnXX/L+p/5eHweoT6HRs3fISSCfpvQhKLByUp7X
         Cw6Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788352585; x=1788957385; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AKF+zPcaGnIjcBYSYaoawLCl82XfK40W4BF+GG+bvXE=;
        b=icBZMDs6gdGThp9mnSjY93nd4DczNlmpeEcj75C33xVyZEn/RjDNuZNkK9bhRlnsCw
         rQ3C24Z2fnBv6y1ylf/Hd4yM4p2oURSuHsorEQasIJujska7orqkl1SG3ll84ixBYOrc
         cxw+paPBljTpEg1vIh27Wm0zfcaZMTLQkZZ3iW3cLK7+5t9zqD5bjMUzi5y34otFLu55
         pIEyo2ga/mwgI6ulhrG4y9MQWZ6qA40ra6w0QlCcS8vRsp3eQhP6jqkxiTEpRdr+MPpO
         K5Cw3Kn8r/G+kzpl1xP8XAU3Pf1SYHxle4cP83GY1fnlUeJWw8qndvRqD+Tbv0L76a//
         Royg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788352585; x=1788957385;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AKF+zPcaGnIjcBYSYaoawLCl82XfK40W4BF+GG+bvXE=;
        b=GpTfTj/Ci8AhobrkwPvJQSkIWenhkOJjFnJwjy2LDubKQmAi2Ex+7Emc1YRXo0Qpva
         0VTjEeLLHcUHP6tyuxEeoOQsLUTdGS6W6PmwW/ZGSKFD+x0RY9JkaWZGO6MLN9nvNbJ4
         PwgMKkbndBQ+GJzjzNYLoYqpNuSsacl98gf0WO8j1z8sP8HT4z8AC12QAAYzOHaNol2f
         reLfk6loTMXZ90ymWfB8GXp881X5NW2rm4Msv5tVC1AXXiDjLWbVzKElf+JHDigBMlj0
         Rvhcbo7G9VVrNZzKTj07epV4Rr5tBD0aTCL6bFvPyZlhZA9Ut0kJgY8D/cD6dLMxeNPb
         /ERQ==
X-Forwarded-Encrypted: i=1; AKwUvBxlwF939vWYIDuD0EA0JdHPoopBAd3xruMRtEzvGQItMRIcevopHLRbBHBOvUrMa4EGcO0jvj7hjxh2pJk=@vger.kernel.org
X-Gm-Message-State: AFuF++k/oJIjGxskienTIleKOUgPt3YWo4FsWj9Tt/cUS9cQ0BGhaQWv
	dchgM8zPqXua1YkXsGZwD/D477/W4uTRKR3TivDYC2TiZrG/vFEgu3zpGdsEQA6XDFE3wVX6jTZ
	IdiUZ5GhNxFJ+5AlvFfEvDfbnK16UMFc=
X-Gm-Gg: AYBFou3AdS9RvyweU78+7+gY7aEON5vzksnvZ9MApzHG6M895vzj3oGYqpoVWSd7jqt
	TUORSDJbM/PON3DfNjzCJOcwGstktxpztADugt8bSYXm26EWeo2LREmHOBY6i6XD96bV4Cm+drx
	2WF/tZOuLG7rZafTKBlAjt9HLGkeQRVJ6wAdvIJ6yMdcwQlKivgSibrhqFh0EbsUJIFDvWVG3kZ
	M0ZFLuXYdSN19hL00hU3Vfz4LVLQQo3YgCInrHvw91mTZTmvWXcaN/tXxSn3zLmHFuWy3OZ/n/Y
	MR9xgabIHbZKd1+rg0hRlljJ24wDEqPBNPs3ovWtHwZMGYe2RA27J/pHduD2CSQ3hiXIoy01v5x
	D/bfwh5kAKogHIAZKQ8vqtdIivn6A9BMINOOAA95YxNNZ3TAaF3fM/Sfd
X-Received: by 2002:a17:90b:2b8b:b0:398:ba9e:75ff with SMTP id
 98e67ed59e1d1-39aee12c707mr7182503a91.21.1788352584935; Wed, 02 Sep 2026
 05:36:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <apgNYDiSiPmNZspF@sirena.org.uk>
In-Reply-To: <apgNYDiSiPmNZspF@sirena.org.uk>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Wed, 2 Sep 2026 19:36:11 +0700
X-Gm-Features: AcwNN1Vtr0Lsg-kbSWCKKSOZOMM-LcknKctZC3VLEs2BTvZp3shOSfxe4zqP398
Message-ID: <CAABR9nFEbNxQ_oWCvZobOJnmCBdhAdTYfrm=sMzygh28CMFFtA@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the gpio-brgl tree
To: Mark Brown <broonie@kernel.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Mark,

Thanks for the report.

>
> /tmp/next/build/drivers/gpio/gpio-altera.c: In function 'altera_gpio_probe':
> /tmp/next/build/drivers/gpio/gpio-altera.c:224:21: error: 'irq' undeclared (first use in this function); did you mean 'girq'?
>   224 |                 if (irq != -ENXIO)
>       |                     ^~~
>       |                     girq
>

This was my mistake.
This issue was caused by using 'irq' instead of 'mapped_irq' in
altera_gpio_probe().
I haven't encountered this situation before. Should I send a v2 with this fix,
or should I send a separate patch to fix it?

Best regards,
Phuc
