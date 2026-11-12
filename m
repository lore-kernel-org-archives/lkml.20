Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794448701;
	b=WDikDwQFJqzX8tsMnQCaT4P/eSNBNdXr181xlb6eMnZXLuCTMTWlTXXrG1w7Ue6dAmBy
	 jpcpKDqx6ELMMgHpyD68bGmeu4MxnZWBly6qbgv1A6eNIFJvE+mz+k8fl7KNOf86h5rmW
	 aSwJHHUfzxGDl6Taxvn1T4tJ+s8EoujEV8w3cbrJfa9hAN5MYlzh/l/37DGYdai7A60K9
	 quSAF3lsyC79YXI/Q5bhT1+jW8ilBCONl3mvZ9GLla8O1xBogjuf1pN5YCMHTEI5WusT2
	 LA/kXgxw11QRRFRdMDN8JoZDnWTKO4KwANSvppPL8D0VRQrs3pkU9+K/65VcRBpBx0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794448701;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=fFeZXEbhmfUqv+BRu8zMGHHr1ieq05uAvFEKtu7g9xE=;
	b=mjpV/ljz7Irb4E3Ms/6fHN8GuvvsaR2eYuecLeipMVW9yjCS6kE3xOvTgBxK5ezD2Cyx
	 P3rh9r+5a1lssBdIbAB42M+WxuC+oIqujKfyoHI+lYaJALYAVQtLzLrLC7krlBSi7ec+w
	 +apEW0GFwRuEi2hJJHX2X0hX3TNaGTx5EaNNmvuLDt1zo7T5HINJkc/euBrjNhRXxCpd4
	 BYBePlaXbOwfj1PnyqtxlMgcKZUUjra+Y87mkfpKwROKeAB7JMp5mgkkuiRQQkx8nemUy
	 azVs1Y95Ab1u3FLvRZ+APAOTeItbg11tFiJz2rVwB2Jhmhd+gcoPuTl6MBx8IkNZE5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=MIwkcfFT;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FD88606A333
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 01:58:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FD88606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=MIwkcfFT
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-491971ac844so3491719f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:58:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794448699; x=1795053499; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fFeZXEbhmfUqv+BRu8zMGHHr1ieq05uAvFEKtu7g9xE=;
        b=MIwkcfFTDw1CFc7M9hKieOExGiw8T7CiLf3t3+t5CV7xhSgAAX3qJnWHyYdHW2btbM
         APU0VO+UqBPrBJGFTOQWRbrbsDleNI5QY4VxP8RT8LkEvyQ+PE0omWuzozZ5+gotOHen
         G8gVkQ00aMI7aBuiN+ov0zpDQ+3ACCU2PSR4Vxhw8ekGOmC6oaSFFnl4+MI7YviqTcTb
         9Pqb5kr8d/lj8ka+ynlS8cek49k8EpLeUDvQlXOXKNWiOKFSGhgpu/xv8gok1gue9gfv
         rudmZL6JMrjW2AK2Zn0lfAwuj0gxYZb5J/bvH62bMQOiuaS67jSlJSqcvmNU/GVJcGpU
         Jd0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794448699; x=1795053499;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fFeZXEbhmfUqv+BRu8zMGHHr1ieq05uAvFEKtu7g9xE=;
        b=tEnUreE5RZkTJ7kDEJOseMT8t0ZYgDVoNM7UJeq9MkhN5Q/D97SR4N5SZT6fPSM76l
         s1YA5GxWoSYvZirs2ktdwI8/tJYKm8RC4COqiAJ1NVg+7AfUssww55W7CLKzAYpC64X3
         06Btldc8z8PQhILychK/c3apuleBXsbePrVmFdPY3eqxLfU59aoACNAsh9AGlB+L0MX2
         x6KOtOvcRMCsJEax8tMlI59JkwrxiCsPMY4QpqkSk9w5b1FQ1BlUU28UfGxBu7OIgREj
         Soa1LpkaybT+IsloKvnh9HHVNxbIoM7biRjjesJwQ7Sm4XCFshKN97UySsOv8PivFN8l
         NOPQ==
X-Forwarded-Encrypted: i=1; AL+hErFFRYy6ZQ9O8euyJHUfqYHe95HQCVjFVSL50wNksvtzxnvr5jxMO9d2oK6g8L837RSwFqVxGjvTLLXnXpQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+hMDL4C9pVvJmNjEO22NnwxnE4lW3zinawEsMS8ePrzixAs2en
	59Lpa4TS64ej9Mmud+KE80+SQ2KDEoeUJBgFMI7OI/BwHNOT++BvXRLIbtg5S7EtVaE=
X-Gm-Gg: AYBFou31iC+99c20t9P9DpHFSO3kmXNOObcDAy4/Vpb55KfR5KUTtdtPN6S1wTzENyX
	EQ2WY3d/0Zkc7qD3oWyhZOgv2UP6sPvOi5I865CaXJI/yyFfknUUcFrgjDczxVpY+zgg71KIEK2
	TbPa24H6WrnfdR0fHHePaf3OUNNBJHjAu6AsSI6lrS6LFWKH8wbuLhh4+WNHD7Mwm/nIZe758b1
	x99qfQdWg0OHPxuBOYmJusk8HMuAiV8eQ3ZkAgsGuZD5ZvQ9zpaJJaVHDTndMALhrAnQ1DSsJgs
	T72oEz/BMuHHJZFYJFh/pln8V6yIGYp3lMBSd50dXgdCB2vJPRkmJkPmKMCxBQxOIUIa81ObIoA
	RB3EqqCqfD8uCSDhKxEzsyPxaY2htBUsUQFVQqxk190RVXVDbGuj6HqJQ9Hsj0a9C+o4rZHsfCw
	GK1eka9AGYK/cq4GVioUq/Qn5rDvTglKLA8UsAJ23QQ+ZTtc3g/OC9DqU5HxCISgg4lfqpQWt49
	+R3Fi3r/Aaa1wZjRf86hpgGxz34RLIU/xx3F2iedZnRcNSD+JTSaFtUznKLo0eF17otGrKwUbod
	9dissuS0re22sbsKCXvOwz6qFlDaHgqya+/1eK0u
X-Received: by 2002:a05:6000:4027:b0:491:45bc:d69a with SMTP id ffacd0b85a97d-499c792ea42mr6742918f8f.44.1794448699467;
        Wed, 11 Nov 2026 17:58:19 -0800 (PST)
Received: from [192.168.0.167] ([109.76.11.16])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-499823761f5sm8864900f8f.2.2026.11.11.17.58.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 17:58:18 -0800 (PST)
Message-ID: <1e6f7588-aa9d-434b-aa8a-d45031df5a4a@linaro.org>
Date: Thu, 12 Nov 2026 01:58:16 +0000
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
Subject: Re: [PATCH v3 2/4] media: qcom: camss: vfe-4-1: program the RDI write
 master buffer size
To: Allan Siriani <allan@fatecpompeia.edu.br>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Todor Tomov <todor.too@gmail.com>, Hans Verkuil <hverkuil@kernel.org>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261111135338.27008-1-allan@fatecpompeia.edu.br>
 <20261111135338.27008-3-allan@fatecpompeia.edu.br>
 <6fdd46b6-e57e-4688-8231-b31b61810cb4@linaro.org>
 <20261111154536.24163-1-allan@fatecpompeia.edu.br>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261111154536.24163-1-allan@fatecpompeia.edu.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/11/2026 15:45, Allan Siriani wrote:
> On 11/11/2026 14:35, Bryan O'Donoghue wrote:
>> I would appreciate a more direct and succinct problem description.
> How about:
> 
>    media: qcom: camss: vfe-4-1: program RDI write buffer size
> 
>    MSM8226 has no CAMSS IOMMU. Program WR_BUFFER_CFG from the active
>    format and clear WR_IMAGE_SIZE to prevent RDI buffer overruns.
> 
> Can you take it with this changelog when applying, or do you want a v4?

Works for me thx

---
bod
