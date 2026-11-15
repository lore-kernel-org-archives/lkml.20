Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794744306;
	b=tq7ImPydYvyEHaMNf4E5vnIlE6qUC1WvEscIWG4LI9uxWns9/ZnGKvF9Z7MfZZvBeL9U
	 b3VI1BSY8QknVGn4im/vFOyu4M4ubbfZas0+GawcgmsdiNKz9dDUQJxQWuiE4V3lqtx68
	 6doI7Pt1wh8xbIV/OHvPKPWYTBwYsPyzXwDhwe+Dj/5n3EtiZ7+ed2zanFagof6BVGuGD
	 5xqTR1KYusLariyLyO3/3yAx9FReWcSSdVb7AqD+yy9ZFu3iQlGAqrsu9ViBY1IqumDXE
	 PEBGbexWNH+R3Z2SuxgATdC3D/+hhsESjgyN40TLPcaIlZ0WkBax6BAhMlM2bkHCCRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794744306;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=ZX7ZEhQfl7zn0ja70UCAxY+bTQCiZDULfmlHtdn9utU=;
	b=MjIEcLlGRBaCrzalHeJ2Yv6hWBHjHmDLKQbX8BxBtl7lrCnDAuYUtmEOO3NzKErgE+7D
	 Onkk97NIWlTnmzsiLeblnmnI+RK1cAROkB7YKqAx3NXlLhEMnllbSgh17VzK+J7jZuHmu
	 yBgG1s2Orrzn+lVZWLqr59WTRC7pAV56jAqW6H3czv2QFGwuERMrEnjGYQsdbicxQW+TW
	 Qgit8bgIC69H0lpVf2Z1N37uz19n1kNYl5Xge4K/L+HcCep7+shpcraaP6t0o3f4NY7RL
	 /OJYwn60zWx0o+4j5tAAlUdSEQj7KcKeBHoQQVM4idoec9a7apRg/Fz1TbT5k9rDKQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=BWNNjBki;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B824F606A31D
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 12:05:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B824F606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=BWNNjBki
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso27583375e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 04:05:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794744304; x=1795349104; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZX7ZEhQfl7zn0ja70UCAxY+bTQCiZDULfmlHtdn9utU=;
        b=BWNNjBkib8an+oyBZyJADhDa56gBBq04KQvE0jWVFpSJfKxpF4gKrAJaqtGgQ9A7Sk
         ojS6OtMdXCNiENKdce+QVKFflf9mEeRXGuwOfIUJ6ge95F2lMlClOFtMNlc4TMSPM0J8
         OV2FXRdUFoZjdPN3arL5fxZOttuMPOroAyZZOBC7Ur5ZUcnxq1huRbmcstdqw1kgjnAr
         p0ABZijR6NLOhZ2WnekX3RIVDKxp+9ngiyZWFPwfZXDz4vy9t+jSaKtI1nNue4l72DDh
         cQtlj1JRMaanxpySB0K8/6m66GzX8SQjTDawrPFHoWZ3u1MpjINNtwJRoQM1ToXyNUfW
         1a4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794744304; x=1795349104;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZX7ZEhQfl7zn0ja70UCAxY+bTQCiZDULfmlHtdn9utU=;
        b=2AYMcfmMGWzusyANRzvPFGO5VA6flME4ekZ/qPXAgpCp2dy6kIkEfbpTklLyDALXHa
         WiMt1k0jvwGSKt9do/SGRE5VwYXQhrVrJ85aTqK3Ta+tasELITK+5TA07mjwS6zK5Te7
         amdiwEsF/QhFr61BX7E+K2QKhOSdZmAkWUL17ZSWSRpuyfDn8gYeRQ3Q7ybW/BTUQ8gL
         Ob12Ec8yCYGILDCV5qYWnWqohzJcCqRP1eBlICwCYLVhM2Jp6e5oynZHQVfVHKekgvXY
         NcRdsFVf7jHs+hsQDrduz1e9BEY9Rtj5n3sCQsZD+7EOosVMJcafCdG4ZBTuXPhukjB8
         qT6w==
X-Forwarded-Encrypted: i=1; AL+hErFpiav7BrE8ISlVwbR+XshiMeRfOLYiToev3XOTycd2TL8aTLtf+IbTdvdMyY6t0tdbXM/359Y05QmYOA0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8XMqjvnPAqYP+G2MgMzm5LQg6fN6OuAhW0PrrluekRw2Wjx7Xw
	F6MeAV+xaFtIXjp8xLw/5bC1amSlV2LRDCSuayin2GiZiRhQUY+a9yGFAUqzPLutg+c=
X-Gm-Gg: AYBFou0ZPNR/2rvsBaxvZFSYVlqqYR6rTaQX4GjlJeIgU94Hj1xFGQfa4fTTwzVESS7
	OQ8newx/Vkh4bRni9fr//CsQ3zG/Ekx48JuaMutEoo9MNz/vor41bZQiXRqJZMCG5Lemvd3GmNq
	v4YbRGvxwSpq0dL99JaG2UWcW0LkuA1HvtBGv+1zTZJZ0WymoKmcFtWODqAK9MPfqg51Z+khqDm
	nH3VSjvfuI8DdUa0JVSMZDu18YuFjuGIGMy7nsMA8QYDCi+VJT/kHJAzwFVqj1bv/vevxI2mr40
	NVKy2J708d9tFk8BVA2Gj02TybiKEYC6APdJ6NMYv9Zat7AbZvysY4JFS1VTeAasdNYSTCPSkL5
	5hOc09S1MtiUwvzqhU0idwczGCOGj0yzO/ES7tf/l82KXUA9dbJpWi/9xhYIJ5gyz+qgNESsJRS
	dbzQAvNm9lpqvLOn3VSCn/OaFpuUGc0t05MCRTE/ecRJArljFUoarcktiaX+YuycaRCAqOEW7do
	JCwt3xIhdrJJzQFNkuqTtXcfc2XMd4pU2TuVflJC4WrPpVFPALjukRWTzX3R+ZS4ElrxKdrh+Xt
	Wj63brn8dLYcis35SQ3EAnblScybuTXwj1QQWVS20sY=
X-Received: by 2002:a05:600c:698d:b0:4bb:5de1:e92c with SMTP id 5b1f17b1804b1-4bb5de1f262mr108419295e9.26.1794744304054;
        Sun, 15 Nov 2026 04:05:04 -0800 (PST)
Received: from [192.168.0.167] ([78.152.238.245])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e33ae5bsm267265565e9.3.2026.11.15.04.05.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 04:05:03 -0800 (PST)
Message-ID: <a4a3df2a-eb90-427f-8881-f857100779db@linaro.org>
Date: Sun, 15 Nov 2026 12:05:02 +0000
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
Subject: Re: [PATCH v7 01/23] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add
 SM8750 CSI2 PHY
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 Frank Li <Frank.Li@nxp.com>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20261114-add-support-for-camss-on-sm8750-v7-0-8ff2a11835f6@oss.qualcomm.com>
 <20261114-add-support-for-camss-on-sm8750-v7-1-8ff2a11835f6@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261114-add-support-for-camss-on-sm8750-v7-1-8ff2a11835f6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/11/2026 11:29, Wenmeng Liu wrote:
> The SM8750 camera subsystem has six CSI2 D-PHY blocks. Describe them
> with a standalone "qcom,sm8750-csi2-phy" compatible, so the CAMSS
> binding can instantiate the CSIPHY nodes as separate phy devices.

C-PHY, D-PHY and combo mode ?

It would be nice to get an accurate description.

> Signed-off-by: Hangxiang Ma<hangxiang.ma@oss.qualcomm.com>
> Signed-off-by: Wenmeng Liu<wenmeng.liu@oss.qualcomm.com>

---
bod
