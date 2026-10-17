Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57DE133939C
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 13:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792244132; cv=none; b=Ov79zGpFANmUlftCQ3s2ETMu4L4hbr1yPtI7T2UVIYNNt1aZ7BUldpi0q8Sx/ksUhWcdYHcwpeLGYHg0WhCkC4ejS83ruT5TGFJ83kVKo0sqUuq5SSN4REeeHCMFK+a0WUO1zpSIzDFmERejdZYvmJVmXpV99/MwNEyE6E22buM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792244132; c=relaxed/simple;
	bh=gBGo24fl5Af6G7SCsbJb5/idqIuEjFcib/+jlSFpkLE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ESIPPqrxA0SzLuDT6VIC9YQMykeD5qwJKsxKMhQVoqKFAf7NhhlE/Jqd90qEbKtcYhWU70lJDdWHIoT4IFhP78UquvYEVgR74nWZOQ6SKvz4LeTPDAaMCo78OkcG42kt5sN0N0tkE4xAbv6sbpyIpIEhywpk5MdK/I5MvYQMs40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GzRXa0WX; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GzRXa0WX"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a1dfd49525so910225e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 06:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792244129; x=1792848929; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Bg8gcmVf98z+OPBCGbYb/r+iHjc/oki2rBnkAci8HgU=;
        b=GzRXa0WXUD3So3RP5HtlDhI0t2k2BrlVLbcmaBT4T/kMicK4Hq0KNKkw1KpbEFqbzl
         u0Y4aSogFLrOxRoAwwQUWQp1H78VzBZTIbuJZ+uFdN8XmdYZC/+hHlDxmxmZfEW8rn5f
         +UAxJTwiywIZrRDlw7ufNS5pJLzbvMBocUYd/ac7/qSQQQna9+hljdKc6KQFvQl77w/p
         IjLS5MRnIK30Sl+UNttobQy7bRd5TqKFKMMglUV/6n9CTLLJ7RZGP6zJi1pmhhSAEURE
         FT2EQVzm2V0ktk+O4YqHJ9gaig0K4xX2oFEzDSRaII0j626AEiMeX45m64ZYUvACzKXN
         CKLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792244129; x=1792848929;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bg8gcmVf98z+OPBCGbYb/r+iHjc/oki2rBnkAci8HgU=;
        b=OEaFJL7rmKzoBL6iuc1HF7dLxtDPLoeGXv5bBoSiQJ4WOQVWN2YYTkzj6W2Zei1ViC
         pjsS4HYCk9sa5gVNQvZJ+PTCsZv1Um8ETJ0PsPx3QP7AJyG2Z1LeQrCTPEroYmHNZIPZ
         qDjM6Nj13Fj4s0OYng8H+aAx2mKOyM/uHx2GdMdp6nwzG+i57iUiyKdM7Icpq/C4y9dS
         oCDw7JIp1kocg0BH211c7llltzqeSypfctMnJaPkBVqoZRjzjbeQ0ZIvVOyp2rIHoYtL
         d9fY5s3kxPG2bRcUEF0B0B7m4eeXPBO7rxva8H7j2cJ0jQlwl6yvlb2+9p5Trj4ck03V
         I9Hg==
X-Forwarded-Encrypted: i=1; AKwUvBy2FORKuJWYquKMJyNleLY+33W5RLxJJ4PpDeLklOvzUL4oTxwwvPeNyqmxl9N9702s0XyY1aoQZD47ZP0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJBE4jwodi2+TMyHJV9EU8RoafV7U2/nM3GHty8NGWaiPRzz6Y5
	Rb71DmJXnb5HJ1XCHMoTGaTMZgZvi3tJBfJ7Kir+FPfoN9dyt3kS5QVdhb4cdckIYUE=
X-Gm-Gg: AYBFou3W6rJuejilQhel6xXLTQ7bRdXP8m5MK5saSVVuJj55iE54qP/kI+WbA7fspRt
	3L0As7KsXRkF1tsxbbgup1fQlx5wFjrXQywyTn92SB7q4oaH2i8WGVjsx4540OADWUkJjRQbX0H
	hMMD5BGIHVB4h6rmy30hMG9ToLt5rEa2td7yY+7BYQyZMJndrnTyrz5qXwFP6btchWm673rA8KI
	scgiCBtJpuavs8TDHt0Mf6bKHDE/3LjCn1MOuIAG05Hy8qP3Ad6q/X1ujN77LdLRn4XiJlwJtNk
	eWAUK/2yk7lqw7SBsYKtZQ4/4t0AWYgqhk43RxANXubx/3Kf/BxVROcMko8NR8IhwHGIyuPzKLr
	VvuCcNdpQmEWI8U6Z0ZDJqzQcS5FrdUnXoSHPEJcYPCoa4OD3jim9kXglLL3iOynToOfKIE4QB/
	qK+A/cZnLFyiYx9YnM6Vwgy+Un5YnqfGZ16BT2mUsK0HvcegGG8mdGDcYTY24gBEgNpAncM5Yjf
	ugdgm26UtVL
X-Received: by 2002:a05:600c:3b2a:b0:4a1:d1f7:bf4 with SMTP id 5b1f17b1804b1-4a1d75fcdc6mr63156145e9.12.1792244129542;
        Sat, 17 Oct 2026 06:35:29 -0700 (PDT)
Received: from [192.168.0.167] ([109.77.131.195])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1ce33155fsm90508865e9.4.2026.10.17.06.35.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Oct 2026 06:35:28 -0700 (PDT)
Message-ID: <4d307e32-04c1-4df2-b93f-9dd187fa53b5@linaro.org>
Date: Sat, 17 Oct 2026 14:35:27 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/6] phy: qcom-mipi-csi2: C-PHY for X1E80100
To: George Neacsu <geocausa@gmail.com>,
 Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 David Heidelberg <david@ixit.cz>, Neil Armstrong
 <neil.armstrong@linaro.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
 Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
 Suresh Vankadara <svankada@qti.qualcomm.com>, tjose@qti.qualcomm.com,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, linux-phy@lists.infradead.org,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, jigarkumar.zala@oss.qualcomm.com,
 hariram.purushothaman@oss.qualcomm.com
References: <20261016-x1e-cphy-rfc-v3-0-40a346a72153@gmail.com>
 <db2fffdd-634c-4728-a2a6-2ab1816b07ba@oss.qualcomm.com>
 <20261017070443.989736-1-geocausa@gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261017070443.989736-1-geocausa@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/10/2026 08:04, George Neacsu wrote:
> Bryan, Vinod: unless you would rather take this series, I will follow
> Anusha's.

Fine by me, TBH I hadn't yet cottoned-on to the fact that the cphy init 
sequences had been buried in the dphy file so, I'm happier with an 
approach that = a separation of concerns between CPHY and DPHY as well 
as absorption of both your and David's prior art - with appropriate 
Co-Developed-by citations and SOBs.

One thing I am picking up on with an initial scan is the absence of the 
clock calculation helper functions in this new series.

Anyway let's see if that turns out to be required with a deep dive on 
this one.

I will mark your series as superseded in patchwork on the understanding 
you will rebase on top of Anusha's work.

---
bod
