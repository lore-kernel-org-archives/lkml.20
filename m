Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 880AA286425
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 13:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790430063; cv=none; b=Buop0gYAWx++vVw+Y8gMLKnvMNbWyccvPkRSRYlPPN67yyM8KfK4jXFOTuebkUCCtx+TQqE9K+Zl9n9tT/bY8cLu3Lqr86n5DDe7C6cyNR5V7HpqiYn/bbCxhBLzGsE6SZwJ4Gt+EExsaS2NLxXKCGBzS66rPifkFFPqzPX3Z1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790430063; c=relaxed/simple;
	bh=w6XavIMw57aHLiDolrRY4GGk/U21PS94Ij+L0KosGQ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cBraw6P9A+36gOlIyncesf5Z6qFTymMHllLvguYL4V0+7XZy7pfP6A0GwILSG6akdie3VED8Y9tk2O0rzrLimpDeQi3bJRD0VU6kzemv6Fzg9KEbFrWI9BbxIBgrW/wy5iLHLmNKvdJwdvNHmy93QM4b78CFIQ0opWJZkf0Pe2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wvd+C60p; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wvd+C60p"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4887f690df6so1066735f8f.1
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 06:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790430060; x=1791034860; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bAJZqOMLmiD+huTN0vJljnBzZgWbzy5vIPKgZ6U/QBA=;
        b=wvd+C60pzAInPP0VrZqsWJr4EyCRDLvHeF7KYaIKTqiVOjxQm4YDji1QOBLfKx3R0c
         K/wWKCCEskdbZMl5ADQT9qm4lrkTovDS/4H+5+DlzfEy7+4W0+yH4tLOrgCMnkkwN4r6
         ahJN9VmOlmmLqxpcbLCEp0HawJwiFqEJo2Eg6qAXk5O+whdeWRCBNKDKYjaJm8cxreZn
         WWlMdhnV5Rwd+tQxYmA6Cruzbbe2+LdMOaPC7n8e5Vy59O5J98hLgnekoSfH4V0ghVgu
         xzUijM9QTpeyKcjXGVVr68u6DWrihJ8Wc2JZh1K2pGju3C8HaSe+9q6DUVlhdTipF1xk
         AdbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790430060; x=1791034860;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bAJZqOMLmiD+huTN0vJljnBzZgWbzy5vIPKgZ6U/QBA=;
        b=d5naUAvCaF8JLDQYquDk/PMgxS4jQDq4J7Bi0dLuYGgMLhZXXNwfk+h17bE4X8F3v7
         f4anWeMVToenMwrMzII4/s3vbgdDIskP+Oqf0Wdm+wkn2YkMPTFi9p/JYfKTtudDK8Gn
         jDu5sgmxTuRqFI6o2vQNCa8TUTWHHsEok4pajo+/vsz8MEsmEPUJtgu3sVjdLXIJ9ERG
         1B7yYKTHB10hvaPZHEBPUqQr9PwEHF/LIonDl5u6WC1yO9dfnu89w8NTe3i9YUOyp3ho
         /i2HLrvJlkzdnOfxJP6Uwudt6wPD2XaXUQ8pJuVnR9SeNeKh15QLaFuJWf4PO0chzo1V
         ZA9Q==
X-Forwarded-Encrypted: i=1; AKwUvBxATjDGyEaEcFHcmwK0gbNw5tWt+lnJaYEy92Be400TapM54qKaau97kU2hhOTXiDNuW8S87l5haFAqwos=@vger.kernel.org
X-Gm-Message-State: AFq9FYIi23Gh7H5F4+/xL0bpdFWzhgt6lGGx83vSDU74oMnRXpXfrMk+
	Thgk34KI1Fm2SOIJ7mvmjTiGZLuCJkVegUAoMb+vDOaVxXOr1yRoKs2ips1EweU7PHk=
X-Gm-Gg: AYBFou15k3ydecK8aGbyDYpSs1N2lwiD/4LX+Z/al2sFkh7zGQ2PhKyYT+nrXFGicA7
	D1pEYNfliGlikHk8F8bvhaPkHclLP7Q3Zrb0Gl8LSQ9mnaJ15VneqxnKZXStHinuRreU69QzCGD
	3+vUQoM9bZDPPB3yhL7sRtEHBnQQLHzgE8f5og9kdpFjakWirEC8oj73ZAtJQJV6QeJH8aafx1M
	oftdft+/FUgbW7/Kl3Rn9iexvsKSybNuJDYviBKLHdr0Fcj2rYikGQoU9FeOmZzKZuDy9JrXSjc
	JwLK6niPC9YKOrb7EvCHnSNyekIGKKTqyiOjanLdt/gZ+6Yqkmhgen+ifvc2ghgaUoeWhHNpq4w
	6U6n1rjfx+RZ0dBle0lYhttRXPZtV2aOSdOPkdCqL+xeCQTn6FdKYwP5sCnSDC6yIzhFppiQ4xa
	h00HwKDomfwzydTSIV4axeTZTYc8CBCCt5KM+FOEz/QYzKj55CPCcYSd+dVyzuWIZT+GGcqR9jY
	Uv+V7rYV3c=
X-Received: by 2002:a05:6000:2910:b0:488:8987:663b with SMTP id ffacd0b85a97d-48889876a66mr2785861f8f.23.1790430055389;
        Sat, 26 Sep 2026 06:40:55 -0700 (PDT)
Received: from [192.168.0.167] ([109.77.79.156])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a349731sm14660447f8f.12.2026.09.26.06.40.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Sep 2026 06:40:54 -0700 (PDT)
Message-ID: <bd0a8dd8-7d0b-441d-9b14-25fb153465db@linaro.org>
Date: Sat, 26 Sep 2026 14:40:53 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 05/12] usb: typec: qcom: Make typec_port accept also
 different structure
To: david@ixit.cz, Alexey Minnekhanov <alexeymin@minlexx.ru>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Lee Jones <lee@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 phone-devel@vger.kernel.org, mfd@lists.linux.dev
References: <20260926-typec-v1-0-31adc19f32c6@ixit.cz>
 <20260926-typec-v1-5-31adc19f32c6@ixit.cz>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260926-typec-v1-5-31adc19f32c6@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26/09/2026 13:40, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg<david@ixit.cz>
> 
> This is needed by followup commit introducing 1st gen of type-c support.
> 
> Assisted-by: LLM
> Co-developed-by: Alexey Minnekhanov<alexeymin@minlexx.ru>
> Signed-off-by: Alexey Minnekhanov<alexeymin@minlexx.ru>
> Signed-off-by: David Heidelberg<david@ixit.cz>
Same comment.

Understood its needed but, please describe why. I haven't read the next 
patch yet but I guess you are going to have something other than struct 
pmic_typec_port *

Again a minor nit you an fixup in the next rev

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
