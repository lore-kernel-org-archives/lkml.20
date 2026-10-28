Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793201033;
	b=4G6woz1UJydGksw4g80N89YBQweRD+sp+JWtnC7wj9fEXa+oP2ssCRckBMaj2ubSZgbG
	 a3bj8uPQVrohNmMpc8fc6knhymtaUH4FA1sPmFPZfjOLbCZu7CX+HJb03VAF9NJcfWjtd
	 5olPUoK2d/plMvXnsMLuWXlZqMmoKFhoKBm94WAACMsjqZoMnAAN9M0WzcB4l/Uplv7pS
	 1odAP2pGeiIk8VLMIi5/TVpqycogpRQ2KjNu1hFb1UurbRDHts6JqM2qFA99iKv6Uoz7w
	 0jU0Xuh4B1EOq2QhrgnlKDKL5pV/7L6eZnIwjkzfckR/REVSZz1oe9vxIO9N2EsqmZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793201033;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Dl9wCZd7aXQK3/hvAJmLj2CWEPQf32CA5XL7IGwgTcI=;
	b=GpyRh/1Q0myGwMR8x6YOlkqpkZslTH9vCjaY5ADqVKi9+br17MhHlXo7JqcHFFHAQfup
	 N53I+FsFDnzYcSC9OAGqVjElrNn+pKBueiz/tlSp2UEq1/2ueHQYawEHk1TPWwDq95RL6
	 PrZW/z6uCzmUXoCFmbWcwwdTFqmIRUp6GHAFFbkp9FE3OevneewjGVgOSLXl/lamV7cFd
	 pamfugfsIBMU03WtSyqVOqj6yg1jiIbtNCyjMT6iWMqq50Z2z/YuHy4dq301y5qEF4uzF
	 uEZoNnVMtWOGFhQcYhx3Rct5awcm6tE543O8yHruAYl8gaUD2+Qiomvy9qktHhkvIcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IxyQpW7d;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A3C606A320
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:23:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55A3C606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IxyQpW7d
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3ae691283ecso197013a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793201033; x=1793805833; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dl9wCZd7aXQK3/hvAJmLj2CWEPQf32CA5XL7IGwgTcI=;
        b=IxyQpW7do0qxjdLnTW6gqcE2/Kvp+2GHGCZ2MrrfbYY2HmdYMU1kubUOaxo7vBeNsK
         6eRBKUWSj8dNOJ//L0iAORMgRsN/CEXWLyrs/dzrmfMnqigUw3WqrXmwmxKV9ZwqEOvV
         5K92gq2TP/S9LR6OTBVusC6um+6R+vOby+5H7ZuVzqaSojFF7/Ppq+TY2RGgSpov2TkN
         OatuoAwCPRMKwY2qD0s/CN9tq6269QEqEUgFcT5P6L/580mCVd2K5aN/QzSk2a6tpoKJ
         cUau0swhG9ztvjsTumASrXTd1mQh2W/RyDwzwyffjZRKuZ79S+lytPXwiLzctcx+YyqD
         rVxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793201033; x=1793805833;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dl9wCZd7aXQK3/hvAJmLj2CWEPQf32CA5XL7IGwgTcI=;
        b=DSjk9whM5A4sEumGhVyuPx7cra32uGtNJM6UGmjK9QesGjz3htuRIgSoa4CjMdebd1
         ZK3XUwOHLPsZJLwVij2fZB6qVdAk+IRqeQtlmHuC3Arx0sWr/vKNXRvxL+1JgKD+YJBB
         aiM9F1waAFe6pWRql1Clnc7bi8iffW9yC/F+zzOfnkwYh7ZjHjtnyo0P3N16N6Zobl8R
         tkrZPTjBT756qY1a38epFWaRLpTSEIIssp9QPZ7v4XcTNVvLBELePuVY11NAX7GYLEWO
         3OfP8ekHROxFv4OlROqFgBhUZU9j17g6QIUFpSsLGcp5xF8aOVzoi6tc5P0n8+FNPdQn
         SFmQ==
X-Forwarded-Encrypted: i=1; AKwUvBwmT/RuI7+/Vc8kZ9lt9Qik2ijX4MrNoYV3Q3/mdR0aci9Cd23UodJZNByEn2BjNTlwPi0LdDSYcJbigr0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLFWf2NRFpF52Nisao9LbgeJnu/sDQQdUajOjwW5EiB4URJ4pWf
	JpnXf0ZY1rjAw+kMPPSxyZKtBaaxaFWKL3pk+V4Ux8m/yf5KcF527u4=
X-Gm-Gg: AYBFou0Q4pX7bX/Q7Fb4Y/cBMtV/i7BSORMsciN6Sbil2Qs2w9KcusL0gXg/lNO+cyk
	Pp7h825sOFvbAfrp4RYz+9qnVgqzvB1XugKSYZ0aeWoPbxMetSAKS8ODi7vAM1sepYJrrNWbU/t
	yagtQwiwVAIPORK9Q6rRApnFKhDHWoJWnCW002EFgxrd8pEg0qkRJrIIS7TCufSZZbOqJVaZbCd
	5cB0/O6JSfCXIwJTqo+gmcW0ENCPXug9nWPEJh7ys98wITmspJJb95kgYZ6OVI8dMTCAnBqeRv0
	36qzGQDrAYsxjwrCEQupu1iY0AdmLlrGf1UUCTl9kMWTC+CJ78BFfGX3fU6ReRxrnG2bc5326Wn
	Bptg664t6f0/lPh+Kp6gLkI7eHeS6Gsj0+DI5uDWYiMDO93Mu+5mJZ2FV6BaRBA4Xs5DWewRNbo
	IaQ7BD/Ul8xon85/HGK5FP5j1UfUS97RTO1M8Co5//T8gcrdYxeo7LkU8lpghix5P7VZY0gf3Vf
	hNB+7fEmj7wtRJqZyv7aJNVLHtA3M6cz5xus9clALxA+2D00zRHXJhC+KuCbkwfv8KCSAbQ1ThD
	ZaP17iTOprgYKrIx8DJtyGtXskZfBnmgNMV+dVpOrtWMj8WDHKRADPcxQ2EoS08=
X-Received: by 2002:a17:90b:1a85:b0:3a7:d9bc:d204 with SMTP id 98e67ed59e1d1-3ae403dd709mr3918191a91.17.1793201032676;
        Wed, 28 Oct 2026 08:23:52 -0700 (PDT)
Received: from [10.1.1.198] ([71.212.222.246])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdac68402a1sm3415834a12.1.2026.10.28.08.23.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 08:23:48 -0700 (PDT)
Message-ID: <a59c982d-67f2-4e86-a110-ac7c1e0f1a6f@gmail.com>
Date: Wed, 28 Oct 2026 08:23:44 -0700
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
Subject: Re: phy: qcom: qmp-combo: Glymur USB Gen2 fails on one port (chip rev
 2.0)
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Wesley Cheng <wesley.cheng@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Nabige Aala <nabige.aala@oss.qualcomm.com>,
 Mahadevan P <mahadevan.p@oss.qualcomm.com>, linux-phy@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <5b31ea48-7918-4f0b-b012-6915b384b922@gmail.com>
 <76e97352-3a54-40de-8ef0-eef0ca27ca73@oss.qualcomm.com>
 <830ef909-d0d9-4f4f-8b73-0fc0cb7b46eb@gmail.com>
 <80fad9c9-4a90-447e-96cb-b1fb0ed98a36@oss.qualcomm.com>
Content-Language: en-US
From: Burke Cates <burke.cates@gmail.com>
In-Reply-To: <80fad9c9-4a90-447e-96cb-b1fb0ed98a36@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28/10/2026 05:22, Konrad Dybcio wrote:
> Is this something you've also seen with your local changes?

yes, but only one data point. I'll roll back to to that later and collect some more data. Anything you want to see?
