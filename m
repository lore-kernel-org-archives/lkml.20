Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793025516;
	b=Q8M9D1vO7UzJuvT4ZEMZDFkeD2ijzoN/pN4cQnQq6e0JU/QUMLCkvJ61Tknn60mQX6HW
	 uoWgtsqqqDZvANpknGLwlTuUIjmIu1jaUCwfF71ZU+RBSDvE1H2mQsA3bK2TBWV7Teow2
	 0WpFWKBWSrHuEXXaSx5LFaiVqurr5B1FORAFE0jBjUbIgsrE7ABAhMsRHiTFScp3xoz1r
	 gzOwei22IYzkFGjVnaADpadCzboWniXKKI11+7mJoe53kwcVyHJLQRctA7fFA3+k3oGV+
	 nXx2cKEF6SNaqpYt5VbI+9pUF97tYKRxbATYBF2UOYlhS1riI+gtKSqkzFcIqFhnBiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793025516;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=1M86rViJTscv2Hqb6GQf4GI3sO2/N2byXiLqjAgB39k=;
	b=o5GtjQ9MOGowHdqvvXqEXDsrGWoISI/Jm25OwehKB8RzLyzJ3TiTkcWPNMpTckJ4cHKa
	 xMAO7aQk7FLlDIWmD505mPSJ3So8tOcNX2oIU42e1636yYu8w0riSO/cNxaBOxEg79ajn
	 ojensRuPz+ghoVHdOw2W44xBlXnQSGPfMeVWyu2pCO4on9BD8nf+RFJm7V4DRoQx6hLQA
	 n5UMkBvGtRWORZEy5uI0SYmFuTzCEGteoiSz03nsNUkeUQnNHS4loSO2PLWRyi5jWwk6q
	 gm6xGUf8f9Y5mEvjHtFlsEkKeEkx/btN3c3iy1cBq3k7T/hN9fdStYC58vPXmS2To2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=gbttxd0P;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B88C606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 14:38:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B88C606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=gbttxd0P
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48e10a70540so1730670f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 07:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793025515; x=1793630315; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1M86rViJTscv2Hqb6GQf4GI3sO2/N2byXiLqjAgB39k=;
        b=gbttxd0PE7ohK81EuMWEF3BAJ9lsS8RDFMVL0T0QOka24HA+GVQ+BpzQV6EOgcmCTm
         NflAoR45waG96fLmJgdjvqhACzNAfs20EQ/Qnqj9RxjJsE9lBKSfzI4tlNX8XnuZLg7L
         j09iD9HTiY3F7SCIshIcAe4dhqJlYjBup9EJ2maVJD7sOY8XSUOH5AebO51XyhP3K1cr
         DtrSVw+f77Wv+fBwzNZvD/47CeDpGqBn7Cdpeg3LNGPvkcrBmVXOG+5Tsqkq6ELdQDtK
         HkMMbxesQuKMaasI7Wj4v/Jt831d4XGMfvkORp+NLGg2KQB3vYZdiNoSvPnLG3qIVAp3
         N0mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793025515; x=1793630315;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1M86rViJTscv2Hqb6GQf4GI3sO2/N2byXiLqjAgB39k=;
        b=MhgriWIhmoxcTfkNtuYvYCcEWgMrMELpiZRAMfwPXIwAYSUpLLwB0mVGwwDP1WkjjZ
         v9hAjErOBRX3APrHSAde2hMj+PSGhXTUKY4j8RvktHAFhZt5Pk4yY3US3W0MjFqjmIqV
         pV2pqD66/2Oz2CNDlRXI/nt1o2kJfJYbNIoFBtiQmZEGzMKLV6cZGiXdYqaMyBML/zf/
         jALafnQbUfkr1tPkkqto9mI1NBHkCNM3VbQC4DQ9mQKZDqrqZpMEH2L0K4aSSsKAm/61
         /MWblHc9F3pLMMB6RwLjQcqqW/WFdWrZx+uMh+u0jTXMl2xzHv0O7sck0XOKbzB7Gkec
         U7GA==
X-Forwarded-Encrypted: i=1; AKwUvByJZrPyFJWTPU1tLkgSejIr4ueLAODNPrzd9hpAbdY2+zJ2Uyt+PFZ+sJmjecnc/I4XeEUl6y/H92foM8c=@vger.kernel.org
X-Gm-Message-State: AFq9FYIcGCp4/NtBM93mbBQVT2WdGNWcVU+TE+N5dubUUAWsqOFCk1Nf
	msN6shbtbnspjEUV/R1J6Acu+sUh0+PlJltw/X/ov/Yu8lOfr5Zi9vCG50y88sJ8K9M=
X-Gm-Gg: AYBFou16T+/b5VaDfeQDi3u2S2pe4ESPvvafoFLoLhM9IABrMRXoZOZGLzki9c1A5Ay
	xFOEU3ej6v5HjO8ORQxyfxT5jJNHcQ3O7aRoXistvrQ1vMKWcFoDC68W0QDvbkSh7hJHNgnq1um
	NWDki4NvARfl0OCQPhpc+TrSEQOy+3tKZt8HotL0OWGQw9ZXtwfCVzbeTlAs9F5Ha1eMSvDoLMP
	11v/CT9PrMhg8M0rNsO/1QAGhMZDxIN2Km8uJILh8ktPjVh/BpUslm/WkQ8gxT1PC1zNQeaIGR7
	qJHfZyThJuB3d0mGGcV3CMLnUnJSGyNkHY0SWJbLb6KNPjeZ2Ywso2q6JuxbQ3rwlNiZLSQtAOx
	7D3E+0tULNXfqo+ErPI7otu9M+9NmHWAw19Pe1qGuir26foT2yIZid2ZU77Fowfm9vtzQeAX/Tk
	QgoOBFeT1hKXm7krGarA1CKQmLH+8X3lPkZGa9QljAWdFQjUulma3bNgZWRbPF4KCgHrqYOtBmV
	DkrKmG9kU+qa85Fnj0PxZKL9N0QXwL1Vmxqngiz286mLBGZ1lr7lpZdYmE2MRwj8mM=
X-Received: by 2002:a05:6000:250d:b0:48c:7143:610c with SMTP id ffacd0b85a97d-48e3eb8bcb6mr13216874f8f.36.1793025514695;
        Mon, 26 Oct 2026 07:38:34 -0700 (PDT)
Received: from [192.168.0.167] ([64.43.151.16])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc39b3sm17390775f8f.10.2026.10.26.07.38.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 07:38:34 -0700 (PDT)
Message-ID: <bdd89ef0-9cb5-4926-a8ec-92d8a4d78738@linaro.org>
Date: Mon, 26 Oct 2026 14:38:33 +0000
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
Subject: Re: [PATCH v3 4/6] media: qcom: camss: share VFE clock sources by the
 highest rate
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261026133726.3249235-1-atanas.filipov@oss.qualcomm.com>
 <20261026133726.3249235-5-atanas.filipov@oss.qualcomm.com>
 <CAFEp6-29k2AoJq1+Rv8a3GE8Da1sZ4E9-RUd4ez-EwOajx0RTA@mail.gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <CAFEp6-29k2AoJq1+Rv8a3GE8Da1sZ4E9-RUd4ez-EwOajx0RTA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26/10/2026 14:35, Loic Poulain wrote:
>> Rate ranges are enabled through the vfe_clock_ranges resource flag, so
>> far only on SM8250.
> Why? I think it would make sense to use it unconditionally.

Yeah, my intention suggesting this wasn't to have it booled off into sm8250.

Also would be grateful if you'd add Suggested-by:
