Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793266664;
	b=HURyHvO4J4FlOat31G88k8/4B9mvO6cIyQkViZ+/ux9X4uhix4Nstv1E8A7EHzecSP8F
	 rGr7H0XECcm10RjSJ3ZuCbqsHpfo/MS6uoIrWpySjwLIqCdK/gRxE5PLlfCjBVjgyciCo
	 CKmicmsiZIMUtKGIUKsM+y9JxllVD4/xwDKD6nZYPKaNwuM0F8fKUKF8h3tKTWk7V2H9N
	 TGTKliIoTKAG9YfaZvYmUbU+d+dxFdvFBs+AdSDJExOW7/97dKHJEg4M1MKi5Jreo/oQk
	 HO0T/ADQITbcXRc1ggCwsKnzDkrkRm9QZMjPOzQEYzJTyYNgCmlFikkdraZ47NZUy/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793266664;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=DM2Q/kSYWYqLMCbF8lnJCCCQdVX+uPwPiquxROWwhc0=;
	b=4xH2FDmwd+2/sV62qJUyVee/A3LwsB8HP5eD+qFgopSG3zV32XNOvd2bwAlZBxrLfe+H
	 aag5G+GiBbo1f0FY4DC03xWRVyCsRNOUAVNhEpKR6CieozDwd2+n5Tc1HFdEU4VDgPBrd
	 tTQnqDD6QA9JolFSHdJ25/+6v29J+a4wxUXeuAS1C3Sr4g6YnKtSePeHNMa5aBHKe39No
	 2HyvGGJrcm2XyHYUaBN7xS4wuKetwfYhthaQmqbPj1shBgOvZtIcta5JiIXglc+/N8MS0
	 VQWhBH/0pWASQVTN1dD4lel4LlqLuheWVomCQspFrCnDbWMBhjW2aBbE4F3BpjS9DAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Tvlfi9kk;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A9AF606A323
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:37:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A9AF606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Tvlfi9kk
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a7992e2f7dso16648295e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 02:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793266662; x=1793871462; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DM2Q/kSYWYqLMCbF8lnJCCCQdVX+uPwPiquxROWwhc0=;
        b=Tvlfi9kkVZdSPhIzlLydhHuDpvCbtkpigMXcPJSx/VgUJ3csemwFPH3EtWdV6Etp+P
         NbA66dOQOQlfNFxvQLgA9rBK2HoBeYyqhpjO0SbDlVPDOrALYrUSrno76UJXo9pW1MtN
         GXMHERCWzFSHDCvPpVUfyp11hY5p9q9zI8gWDawSaayo1Q6ztGlGglgWXUN6gbuF2xa4
         Bfh8q3hoAvJ8jPs7HKaplnHqDmF5d+EdmhP0mzlcJdQ+/ddbPkZoNoxdb28lC7EeIBoU
         /xjeUhZnu9Sq8QYLDi9HwKGYgp7EqJfa8ogCGSD01XRIv1RxASB9WH2WSeJht6btVfxT
         TPYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793266662; x=1793871462;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DM2Q/kSYWYqLMCbF8lnJCCCQdVX+uPwPiquxROWwhc0=;
        b=G2XGneJ37JMKc9HB4cMKgnKsKwl36SUOhaMSa2vfyl0aRxOK4uxYEF10EW7xVTFQJ7
         lyzH97BP9joebcr1ESAld7j4D41zlDuHLKhGlC+OARSoRTTrmNCQA7BGy+w+5OhOeTDU
         xf8a6iUhHs5TAzeMNhouUaFwZUtkqZLjorBmHYC88zsRUSDTrau8C6pt+bSrcduHG3Y8
         ENrvxUOa0fMi1WPxUaNUc+F+dNiI5TM6gqvGIdkda4oYofKPJSBC8iv+AMCDdnDPebF2
         /Cq+gTz7I7n6fWHXKraWMTb1Ma/eZAM1VPAKZRuZOgwBl4aaeA5JPYXILPdMrMqPbd9V
         4jMA==
X-Forwarded-Encrypted: i=1; AKwUvByUW4OY3TSVx4w3ozXQR3U+v6aiUiwFGLKw9qKShX1QG8wkS3EYM7u/JXBppoSimFVeKnLjzyyZYNLh/RQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIEhcjeaXRTwyrRqWXcTET6YdRMaumQ3NGw6L/a+aBLwZtqQ9fe
	4+kPBHl1E05DAh7fyQWgNquJepKxMdMSMFE9M6IwAKZzrtfbKIrMjxVnNtXVKbvdJ0c=
X-Gm-Gg: AYBFou20/D9p10H7AVogihmJiJw5oYGJBEuN8n5N5J0Zy8bAwzL+9Va8/NNjlk6swjt
	9xONkkkCflUQH1jQp1r3G2bedI+1UhXAhG62Ki0StFX6hL+yVB7dcFkfwJO25w0DlbdTOV6aHyE
	5UrGZtNJghdWJghEF02V8iR/ge0prRxyCwjuHVqtZ04FcoZZuTVtG1ZEV36nsjzKzIZ0OqEkj9/
	VFWPa+rjXxQeTgBdH1/atXqUBd7DuhfqMcAdsfqWDLN50ubmmzn4IikRcPokVfr/BemK/BJRXWX
	9+J5TVIaz25KOXpxtxPMwOLRvwQ5YFlNQFJcU5OhT4uA/z3vEZDUG8HdmU9LvTU5yLJxhmLCImb
	tOQnQuU2IrQugLnBzjaF4W5iKllwoi0H2XhdkG5BIAguH4h9WCNAl3UcXO3OEQ12NubE21DZDqq
	gebSxOtSEEcRrWxxgSMneO+Bep172ylPjpN+QiLVtDsLi9wHI2hlWvt/QiPBNzb/J2MBpcu+ti3
	JAzDuvSwqlnypBMHgIQQfFC5expLI6+2sJKPv3J8s2msczFD0ZLNwavCvm9LnNCYbD7huJo1YU1
	mxn8VFKqFX2oOwJ6sj7GgNOhG0mswCdi2HxJEHiO
X-Received: by 2002:a05:600c:4455:b0:4a3:59c7:f226 with SMTP id 5b1f17b1804b1-4a965ec950amr104208525e9.6.1793266662424;
        Thu, 29 Oct 2026 02:37:42 -0700 (PDT)
Received: from [192.168.0.167] ([64.43.45.156])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7f7f4cdbsm59460365e9.7.2026.10.29.02.37.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 02:37:41 -0700 (PDT)
Message-ID: <f3a1ad00-5c74-4922-9c65-dd7a56c72582@linaro.org>
Date: Thu, 29 Oct 2026 09:37:40 +0000
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
Subject: Re: [PATCH 0/9] media: camss: add SM8750 support
To: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261028034105.326535-1-xiaqinghuan@mail.ustc.edu.cn>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261028034105.326535-1-xiaqinghuan@mail.ustc.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi.

Thanks for your series but, I'd like to proceed with Hanxiang's 
contribution.

If there are further fixes you'd like to submit on top of that enabling 
series, please feel free to do so.

---
bod
