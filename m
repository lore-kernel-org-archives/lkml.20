Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81BE738550C
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 09:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789463583; cv=none; b=drwT11fRXyXmXIGMQD0/x7X+ZT+0w367Ml+lYK0gQye54JmZxdR90E5WLDEUca7Jx1Omyhm613BzgPazSOKGNRGwcqHo1t9Th+Je3Xfe/Np+2gcbpd+xDK53YoTaJ85paTVeWWsgNvqzl621PaB3WfX9X7TrVGLZT5bwASYs1Oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789463583; c=relaxed/simple;
	bh=vxWMbiQh9UJmWPGfEPk739/9AIIk1UDGU3QXq2/A7lo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=njI1UUt/blYGZ44y6peHq8Pi48ch4WTAZx+r44uJVZhyBEt1YTqSHB/b4D7nw6znfTpnTxM5SZI6GVTi8PgDIwENWmwWwDCneEMxpoJ1xKzv5GaZPnF7Dh1qSD6k4LhLpfWUAOuAlnCxxTUoAZBdoOXwCRS90bGDeRDMTQS9L6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FiEXPjX0; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FiEXPjX0"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a99cd5115bso4946959a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 02:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789463580; x=1790068380; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vxWMbiQh9UJmWPGfEPk739/9AIIk1UDGU3QXq2/A7lo=;
        b=FiEXPjX0Q2NoTetGSEeCGig12tHI2fcwYYsC5ikYKcUTppbVyABJmRF/ooAqm7Ukbf
         x5V8xJxvWOOB5m5j97t7CXAr8oaxrVRWtfjdHuePJep3soTGONtAU0W1IC9SAKxdbLGW
         rRkQGnl/wJUGD9ctAaMEigUCXrs0OcVhYmqAIhttPyafsPAT5ZURCiz+D3Dqtq6vV5o5
         BquKQpA2kjM/jn/L3fJIybrvgq8ybGvyE/hQdot+vC+MCfGlid+EUcaEMPwr4Mv5Fit0
         mNRbW9kJWnmmUt4rqLN/xOl4VUArzM5J580gdQnRZ4vLki9Wh6QVtVEU67CMPptq+VgQ
         KXAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789463580; x=1790068380;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vxWMbiQh9UJmWPGfEPk739/9AIIk1UDGU3QXq2/A7lo=;
        b=kBXxXvi2l7+czCv5WszrI/m6zsZ90yIZDd9htr0zrtME6QFtsxcm7JkhAeTjcZlnQ+
         a6DrYfxn+o19D7evf4hCkw8RHOMPRyJGOceb9har9K2Sb5ZGgtxuK6QMObHSy8n78F1v
         UNRzOpLKBxfuykTBx63h8nn1G1y1SZGuh7Sms45QkIgBy2DQ/x/1P1DvOu3yIPq/gwTF
         v8iUDr8Kz/yx455Lv5iS9ZsqpgWDTk8k4k1Mk+5MdD9O7SZxfRoV+WH8iKeJo99CndHk
         htSR+8Us8qObukLFKVGq0Msgws3of/VXdtGgYfevI4DMOBsJH8/lABhme9r8gIyIuz6w
         FgNA==
X-Forwarded-Encrypted: i=1; AKwUvByDwnNTo2RnWn5wTDkGo1mW6E2XS9WuyC2PuGtaopqHcl7IvlCU3GDAfhY/4/SB+p+YfrTfmSO+S1mcchE=@vger.kernel.org
X-Gm-Message-State: AFuF++n+bdbh4TFQxnHln7ZCfXPe0fi1wNQ62KsojEbuZ/P3IAf2q/0P
	rquuWyl1WUmwWi07cVMc1WJJbijZmkyP4vY+rEVw7Em/i/mBNMjq9OeyzY5+DLfZFFA=
X-Gm-Gg: AYBFou0xg3WEPyDhQtUGQK0JiCMkL2WvS0nCD8RKske79e0XXpR+iQXw00Qz8Uxw5+V
	LHJpGUJgdFTE6yNdCLUUyLHCRhTSr+KY5TcbksRD87flfKNBmWtynsh8Oz2GON4fsa080no+ne8
	Uu/c+tt8C0Tuphrhyk1irZLzEXD3IqdUoZuiaWL7hirt1sfhZAGiBCb/U29VfIdZea+NoqzHkyk
	rkK2O5Xy2MZNqHLE62/MpI9wk/AE1LjWTrx0E6A1ikSuAuPRBB772ip9+Zp6rIUL9aKIvnP1bGU
	NUx9cQ2gwCQnuxytSoxzqTB9fthwlDoGsXckO3V4Haw/9hw8VPiBQeUWhqcw9AdyRXbrYSod0+3
	g1n1FSTnEESVTRizoyBnqXRi7YP6fmURV7vVx7ZSetsOGacvc1rAXYMBtvCEvHIl27tLw8PuDRw
	9mM6ilupsx+vwR8Mp4TtpBfLBFnudlmupcZXtSY+yVopCGZT+2PkUl2u7NooEcpaTlfMkaPLGdp
	dXGpXWDAK4=
X-Received: by 2002:a17:907:c18:b0:c26:19de:9ad5 with SMTP id a640c23a62f3a-c29b875519cmr367897666b.45.1789463579606;
        Tue, 15 Sep 2026 02:12:59 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.15.202])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29660ead67sm546278866b.51.2026.09.15.02.12.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 02:12:59 -0700 (PDT)
Message-ID: <f34a3505-6216-4654-afdb-cb797fb8cc95@linaro.org>
Date: Tue, 15 Sep 2026 10:12:58 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] media: qcom: camss: take the link frequency from the
 CSI-2 transmitter
To: Hitesh Patel <hitesh@ebytelogic.com>
Cc: linux-media@vger.kernel.org,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, ravi@ebytelogic.com
References: <20260914133416.1030231-1-hitesh@ebytelogic.com>
 <20260914133416.1030231-2-hitesh@ebytelogic.com>
 <bd3fa7ab-9c60-4697-a0bc-92877e8a2885@linaro.org>
 <20260915090929.1284112-1-hitesh@ebytelogic.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260915090929.1284112-1-hitesh@ebytelogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/09/2026 10:08, Hitesh Patel wrote:
> I will use that in v2 and drop the extra parameter, which
> also leaves the callers untouched. Does that work for you?

yes

---
bod
