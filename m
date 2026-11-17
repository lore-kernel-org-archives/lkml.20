Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794894081;
	b=Y24uOd1Z9fKwhqABPZGSeGny2lR6I3zFJIX9KSWrWuLyrZFCtK6Ah9tCpvVHw+cdNGfc
	 ieCyvCDqdp/rBl/6YyDascZqUIg+3yUe1bBnTWKTnFqrgD8uvn7TUCFKy/CD7soLrcaN/
	 KG3EEkxR9BKLLpQGGTrB3+1aFOrtSAtqN9Z3IeyruyyM+KuG4aKeodLjjTW72zeSuNtqy
	 HSs41vkICXTZQpVF6WaRxC5S5W4CXalmeqVNhr2FnC5XfiBXcVHorzPwk5MJ2EemtwtVr
	 Z2KD8cYPYuETu8yeOriT0ftryUpQMGD/Axo8ISzt25ylu571T6wL6rZ6uOg/BxNiR9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794894081;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=kgXAga4SQ2gGcYIcOPrgNzb4Xfca195d5V/zBY0TA5E=;
	b=2Rvo0CtnH+ZxRtp1xUJSP/4+HgTbVoLU/2FTcleQnfY9/oOwQg9fKcJ1okvyIQNp9KAB
	 3I0Y1sK66rIxbLyutE24goWVBhR9ZlQ86fnKPQ4ZwL1WchqRb5gkyVFtB4lwHiKX4d1pW
	 cuuE37cOXE3xmeb2mj4C9Nd2N/s85uGdbC6Pwaa5Ukn2UpNCUo1NQJWhDT84LjWU+GTsO
	 xHdWZAMITNlTFKHiRRVmf3x10hYg6tBvBHP2CtNSpxSL2hzRv24TrVtYk2w3GmX081C6Y
	 csdJ6gQLQBCD6WSkXBgZnCWc2bwy0n3tlK33S5vIung3yRlM6jnyhnk0NT93A2bUVZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=PQr3PgP+;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C775C606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 05:41:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C775C606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=PQr3PgP+
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1b3ada81853so3923694c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 21:41:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794894080; x=1795498880; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kgXAga4SQ2gGcYIcOPrgNzb4Xfca195d5V/zBY0TA5E=;
        b=PQr3PgP+hc6DT0aQU/F4mOKsRUSEulybv2c1ObP3i+DkihztlWEctX0OrUgl6usesp
         LjVss/ez54+GKqptmSO447ZTgQARt4/Hqnxbxe4wKrARIDHxATiTAuXAUYnd5srby+N9
         vIOlcV7Nd504l6AaiMlFfzLDi9l5+R6A7aeaaPeYS/SdAVWDOIhSPf47Riiy2R6M+m75
         Ukgmqhi7cJ0OgnvcKLaHEGrytFD+SRwSV0uvePUfCnI6UPFqzp3h2OWF+CpLD3vPaxqN
         L2GFjD1uwlGTm474BmzBxVLJXBEP3UcTQIALBo1pSXC6QfWbbogt02vvQ0hKRpb2TPsp
         1BtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794894080; x=1795498880;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kgXAga4SQ2gGcYIcOPrgNzb4Xfca195d5V/zBY0TA5E=;
        b=styav+QPIMYnALhZY95uRXjXYS3RMdjsfXP2pgDpiSa4AfqQrvb/HHcYvz9W5wPpKQ
         8/2smGiMzPSa6Sz5iFAFWZYc75tFTzoKR87OtoyeAoJvhxRJq4VLTIVl1ABGy1Ytb56b
         PVYUhrgRPeBCgj2dBAyagHG2IO3so/OCBsNReTd94mGrBU98uypyDoVTjRDCbrrI4yw/
         tWDPemUJKvqD51BpeXeIHr3Sb6aKi5SBdEVxxvZXzzdm8kfVyp0wGc+Gr1XkO1QUCCga
         gN1Vu16r5qB8JNgLQFeUbEeh1efU47ySD5I7nVSKHIbz5hvY61viEj2sSNbPlzsQ4FFD
         bQvQ==
X-Forwarded-Encrypted: i=1; AL+hErGC6Tzzw8b+wSiDVajcZi8RdJ+DyZktC6aLcCvr/9Z/E0jPnWcFPAbOkrTYgAGpSv2fPVQ6YK4QJSvUSOM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+yHrolGRrMSm9CBxyxkbgOaZveF5CpSHkveGI4p8nnGTpqBMS1
	R5j+qIy7f5TCkCtlr5oUi640N4iMrQTmJDfbKaTfsdlmazrjc8tK3OtxEBCPz/Ln9Zg=
X-Gm-Gg: AYBFou1buW9adV8jErFEMVC7xRnCFKE775KXlqTQaL2C+T1QNjWU8wygmd2vf/kd5wk
	+RSFID7OOMVv3w3+axuEBNNnBDECwOh/I3hJ51v5UpxbQE1wJXxXUDDdeFjra9W/QQg/bUVac/W
	leX7jlOYdrWapk0LZPDbuyab37qwKgtOkasYX3OawbeKHVaJG0g4ts6u69WJNATLWRpn8z0uZuu
	Fv43xeoRjEOQ43dX8kwSPVTb58TIUWk/hmZDVgoY/5hU3IFjQLuX4qQbjQ+NbQzDJcAi08UKjPA
	XSAAGlHaDsbEms1GZfAvLe7UHp7UzbfSsL/uBAcvVpxIO1l32o0DEauBYXc98BZ7fT2kTAq2s1i
	9etJW4jW8P6F7DtSMiet4Itnpt4s5q2/pvv+qX+55/4VPoJ6Ewv+LKXS8nCVf2xga/kQ60VLagN
	6jjveaKKIwklnnEPDJjbFpwbsy4He8z6y/wjGWLclWGDdvlsebeI35XpihQbOizz3QVyo3Y9z8k
	sKRYDoyc39VTLiKLDMSl61Oo2YKezYPfzgnnLYY5uLbuTfDnOod6PIUz9vtal+gKh/9d9t+Tsd2
	sX0ZSyfLzDwy8LDfvtX6DxH0gFS48Q==
X-Received: by 2002:a05:7022:290:b0:185:4ad4:3d15 with SMTP id a92af1059eb24-1b503068235mr10688010c88.1.1794894079483;
        Mon, 16 Nov 2026 21:41:19 -0800 (PST)
Received: from localhost ([122.172.83.36])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b524049e0asm17957878c88.4.2026.11.16.21.41.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 21:41:18 -0800 (PST)
Date: Tue, 17 Nov 2026 11:11:15 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>,
	linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] Add cpufreq support for Qualcomm Halliday
 (SXR2250P)
Message-ID: <avvo-0Gj9u4ZdCyh@vireshk-B250M-D3H>
References: <20261116-halliday-cpufreq-v2-0-e518cc055457@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261116-halliday-cpufreq-v2-0-e518cc055457@gmail.com>

On 16-11-26, 21:25, Stanislav Aleksandrov wrote:
> Document the CPUFREQ hardware (EPSS) of the Qualcomm Halliday SoC and
> keep cpufreq-dt from probing on it.
> 
> This is part of the bring-up of the Qualcomm Halliday SoC (SXR2250P)
> in the Samsung Galaxy XR. The DT changes follow in a separate series.
> 
> This work was made together with Claude, ChatGPT and Gemini.
> Reviewed and tested on my Galaxy XR, where cpufreq runs through
> qcom-cpufreq-hw.
> 
> Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
> ---
> Changes in v2:
> - Add the qcom-hw binding from the DT series (12/17 there), so that
>   the cpufreq patches are in one series:
>   https://patch.msgid.link/20261109-halliday-dts-v1-12-289114ab8197@gmail.com
> - Use the "cpufreq: dt-platdev:" subject prefix (Zhongqiu)
> - Link to v1: https://patch.msgid.link/20261109-halliday-cpufreq-v1-1-d87a397396fd@gmail.com
> 
> ---
> Stanislav Aleksandrov (2):
>       dt-bindings: cpufreq: qcom-hw: Document Halliday CPUFREQ hardware
>       cpufreq: dt-platdev: Add Halliday to blocklist
> 
>  Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml | 2 ++
>  drivers/cpufreq/cpufreq-dt-platdev.c                           | 1 +
>  2 files changed, 3 insertions(+)

Applied. Thanks.

-- 
viresh
