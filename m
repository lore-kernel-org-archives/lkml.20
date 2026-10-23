Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792791859;
	b=Tt9Nn0c+IJ75pusCGfGqHGzMP2U+BD5zFMbgXXPtIkeWx70keHR4ixAwuYJhmWtjyRAH
	 5J2wTvxEXG8Uc08Ecl8yBzS+znoI6l9B4kPJDh1fHv7aasCNzEUH+rUWaJ9UG6zQt/Bhb
	 uKuTm+goKg4yX1rKSk6nPk02N68kaOQQoqlRxvWSAvQAxRihvkPFnaQIkABJZy9PysR9y
	 mUwZiyyZ/o1cbAd01VoEureD2QXLPLmABpLYD5bpZgqMS/Xx8YFe2va+VmvK30x0WTvni
	 8EvHZId4uKzMhPk/q+wRxeWklawf6No6pn5CTZRR8jli7hxi0YteLPfGUiJ6r+2Tcig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792791859;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=fFwyhZCXORgrLkzDtxE/mSv92Ck+rSlYQsSs3nn1b1E=;
	b=JW8pHuUHpCP3icpa7SjbN8qYM1QGGDA38B0efBeiCIKMUccTPBJpQWztaBFcEz+5B2qt
	 cCz3LMDYBOifmL5yiUXcOFLB3g5n7RGiAVlJoYNItmDqfhFD1mcv2uHy8Z73ELjG68TZm
	 EwoJGlUsbunQFZS4D63uB7AChkgUaH9S0cWbjpiEPsxqwrffOVoaWCWEIJVlnQa8O2Sco
	 63/enioslvaqi6ffbY/bQ607FwuKAA5p4lnLmZWqxpdmnZq+qiVTSuviax9cFTuvuw2Qf
	 jkQR04XKhObpxxRLVr3j80AidIHSwcbRwBrJns0gpPeNcOBS5SoAOd4cstyJ7GA2EpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=mlFIvltp;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42D77606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 21:44:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42D77606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=mlFIvltp
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a208d93758so13877765e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 14:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792791858; x=1793396658; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fFwyhZCXORgrLkzDtxE/mSv92Ck+rSlYQsSs3nn1b1E=;
        b=mlFIvltpQf//XRh4JIZWCEhPJNJ0X/sQhjQhiV4wzLgBap50wkui+qFJRqfQ3YDRk1
         yHrOFrS5vtSk+Yj9CrrFgHVyHo4KKLmIYBaRTM/7bj25gxU06M7VfQCUDI5s4oOeWcKi
         F2DLBsHnk/8lWkH5W/MTIG6K5uKsg84EIbIpD98Yer2j1HB2cyW6kRBGnoRYL2rOWKJ/
         TMDpqq4l0qY2PMRtmJz/10lj9/HkD5YDbOHEUNMayjlxBFrqfDvM4ND1pILr+Wp4uD2r
         eN7CY/Aj2TOzSEIuaZystdERQIs9nH35oiHz6TmbIUQ0iwv7Bs/UPsnfxchnRQzyprGD
         0+XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792791858; x=1793396658;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fFwyhZCXORgrLkzDtxE/mSv92Ck+rSlYQsSs3nn1b1E=;
        b=U/5KhuO3kG/cLu2EQ+E2YdZ0++ROssLymSFcuzTb9wlWT4XFdXGWYkNGeLexPZw3DI
         XjhH8TMrKBKzekqpNKuuUpFTgFa7Lxvxw4nGfRykBL4n6VH+hQ8RYDe2B8jj65pmXez0
         VQvg4xcw6m4hPfMlb3Kkb+FzJQSC1WC7swheNBbZSLhWj9Xs5oIM+Dn8PaMhnCrJL0KO
         7X2CNQGGQjHWfIXq/a71XXpeXK0Cv/ymsb84Rb+g14DZaK2ZJ2b0cnaDPH8XHY102Udo
         /INN34sCuS4vlNMtgCAQDniGEzz4Y0UzxvZ8QvbexvMeuIm7WjNZxd0mHsTU0fOo//iy
         Xqzg==
X-Forwarded-Encrypted: i=1; AKwUvBzdnGEDfz1POXjt8DE3LuzaBLagCc6CmUDzVPCrlSc/eWAJAmA5pg7vC3GiJWrX2wR2LR60lkc6YPjgSqk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJoh0tWKZXemLnachqsLcl+eegxiGC1Y06Tsva1X8hrYma12h5A
	4zmp1wiEN7FLChYsXVQdysg7NunVv00yhxYBY/aFw/HJXB9Lxg45VS/c+uGIWxoPljg=
X-Gm-Gg: AYBFou14hplTCU5jMGvgCc9zIR7yO/I9e6sokTgcVGx3WByETUONwFkSKnB4r3aGigu
	YE1powsb9P5UQE9JMclqGk65WXlc5KYS1ktrDHMrOQ23zS16g2LYB3pa+1MqOTmvXuXroH6GY/f
	A5CoM9QxvT6XDRpTgDlhkDXjAT0H8g2oYybEBadnB//9Md/4z+mHAdyutXcXpcCXnMTdGD0G00W
	IbslowhHhFLi38+udsodz1JpL3krD81nPonzHIirmsyUGEp7RDkCymHreP5uY2IDeg9KskcSYxV
	+OHq0t/fQBjylNKR+W32RacfVFAzofkkWC3rxjcMcakFvsUO1x81QsGL7ORwTJvU0ob/qPbMRnN
	et1MWvudQOV6xjcVrzRTmmCe45THAg5F9dCkedFjVBsV+G0avhugof8SmXS0reD8UK+qcm9XGE8
	iKWZSGXHOVkqrZSUaxyioSgWivYZM8XrTPxO7+j7bRlrENoZmFTlsGdus6rv2/Nz93ltFEWRovX
	OOz81LYj7gOVtSphTfmESAqlx4hhcXfagnH6rOMDzLCdzCym8cz1UG0uzMlWKu53ZGF
X-Received: by 2002:a05:600c:6095:b0:49f:fdca:c361 with SMTP id 5b1f17b1804b1-4a35ac99412mr2318005e9.12.1792791857174;
        Fri, 23 Oct 2026 14:44:17 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.107.26])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a55e786sm10434525e9.3.2026.10.23.14.44.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 14:44:16 -0700 (PDT)
Message-ID: <1574aa17-dd5d-43a7-a433-ecef6a8ce136@linaro.org>
Date: Fri, 23 Oct 2026 22:44:15 +0100
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
Subject: Re: [PATCH 0/4] media: qcom: camss: share VFE clock sources on SM8250
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261023152857.2859767-1-atanas.filipov@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261023152857.2859767-1-atanas.filipov@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23/10/2026 16:28, Atanas Filipov wrote:
> The aggregation only covers the CAMSS VFEs. Drivers outside CAMSS that
> use the same shared clock sources are not covered and are left to a
> separate change.

Hmm.

Lets discuss that change so. We need to represent shared clocks through 
CamNoC anyway right ?

---
bod
