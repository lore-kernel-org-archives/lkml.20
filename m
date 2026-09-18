Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97FBE38F65B
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 14:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789741666; cv=none; b=gFrRLWE9BTfZKsJdGednwnF+Xx8atJxNOd1d094xPfcjgDjFNL9mCQOBRA40t+zYGZAwFzjoWz/jdPAA3r7S3j3QnzH4uTYPqEq72sUBOJUEqR57JLb7y9S3uQb7/b1ASRyaUd4cnMFejIQ/Cjc0tnYdp/VANWT1yBx4LyAI3fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789741666; c=relaxed/simple;
	bh=sgunm2sNjagt46bq1ZIC/qX8k5vKqpE4P8hC394mvU8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t3ToGO2uCz2a3VMqekdHTBOJKFhy3YXAHn9NHJwJmQhkJiUetlJoIXU2LKemrez0fvBv7DsYKSlpU/i4pXoqSwtNaPZlhi5gt7Zwnf9N4+8d95JGuMQKjklxqm4Dh87cLWPv+c8q/nQFiwoaDr0Gi1z06UOA3aOOHffCfcWjZs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Q0c/haM4; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Q0c/haM4"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a6056c2064so941697a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 07:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789741663; x=1790346463; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BnD2Ei89mkiOFb1zZQQ79Aq7EmWfIQzBftxY+5mS48k=;
        b=Q0c/haM434hFxRb9HrsA8HMhQ0aOYGv8PgHBrbqBJeyp/+aT5rApMn3T0JqghomwUW
         q8y2OWHAWCdnBzrh1nqiidF/S8Hp98uwPim6fYZfFsVX690bH/yv3113Q00lT7nb3fNG
         CRscyAc6emTw4eOnjRlzLsRVxc512gqkfkRZb8oypb7n9gFZJfIxA1B4OsUlwzlLOvFA
         zJ12gqU0/I1Hr+dE+lUijjXGRIQ5yD3533ZduBBF9fOnaawbEWC3xH6nXnGF9l9rT3ua
         qcY/rZJw9ABTJUHRati5Vdte22n0RM8V8fdXj/jf2ptSov9y9/iL+XoITfh6OSdpv4Ta
         W04g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789741663; x=1790346463;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BnD2Ei89mkiOFb1zZQQ79Aq7EmWfIQzBftxY+5mS48k=;
        b=bsq6iNX0SHlfLaickJoQ9iNyEucOiFvndz9kxqdYK6u65LRhsMN3bEIeLrYJD9+f2y
         0CV4nRUQwwXJueh2f7+rqCv34kOTIYh7TPi2pQnTjEemKvlavDSyW4SSuNniQbMsyo+H
         GDmgV1DCRl0r+B6zxtPyBB/uKz98Jra+C/C3Q2h4ADiOsAlU8Ib7hN6d7uvN5kSd7Y36
         I1bOoNf90H8gyxW97ZSC9CF1K3BtN4/jAQk/sffh4T0IB47gFvR1D9Q/W5JC0TZssWdh
         7Z8eDamiyBSCiowi+sU1etZtm7oa5Uhb6RJ8QhimEtwTnfLtoegkxlzcscrybkAdXBYp
         8L0Q==
X-Forwarded-Encrypted: i=1; AKwUvBxUMJ8Lf2BS45Zy5yhhEziLW1e9aqDgfMy0UokmM/rsqI7dZ/c0n/s1Gvif6a/2+fMp0HGfHdKinMz5wu0=@vger.kernel.org
X-Gm-Message-State: AFuF++k8q70xf84o4oQRraksutytPf10EtcZPrC6v0HNzDKDOw8aq0ti
	1DEqdyDInLY74zPZEulhSb8wcgxC28l8zJF7AfAuF0l1lsN6GLNmRGkeG9m71nkskYY=
X-Gm-Gg: AYBFou2O78eKDRgEaLA/mIjo1QmTv+RmkeffdlnnuUYntVQ0VBxKsaJZQEJiRWP8Dco
	5us3wel2tvH5cZ+LB3PAxJchJrl74R5GSzaad1MAYIBUQs6izGZtwY41lLXhLLYKBhHjvUMEFze
	rFm5sYlgafxvpXp8i+GZGjbiJayNd9iPopD/rnGeo9mdfs9LvlATkL/qa2Dse75AKmOXau1OBGI
	UGgqXDPX82lVBBhzY9qtTrR/aApLaf6J6NQJUxW4qL1SzqQ2RMN/y5xaM0xuSokxmM/floDMg16
	EZpf8iNXEAjJB0OYIbQ4e2qtBODIr8QFk/vy1oMjv3zfcgQvFZ5k1a1btOHZYSsGirZQ01i/R/C
	4kR8Qlj7Ic5LaNDEvoc662AvWV578+nCZObbjKdy46FsvTyuMCrWPy9zvIZrQWTvSmMXBKBlNOB
	j+uOAzuOXrNFmuITMlAJibouctI7bQJrP7ZApjv+LgIUKtOiUzXHO0HOG173mIZP6dbMU22OxWO
	wPyv6pgKA==
X-Received: by 2002:a17:906:478d:b0:c29:5a76:72be with SMTP id a640c23a62f3a-c2a157c41a8mr252060066b.24.1789741662748;
        Fri, 18 Sep 2026 07:27:42 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.4.225])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a1bb8ba5bsm61582566b.45.2026.09.18.07.27.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 07:27:42 -0700 (PDT)
Message-ID: <fd6bf432-0ce8-4793-821f-f08321b13a5b@linaro.org>
Date: Fri, 18 Sep 2026 15:27:40 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v20 2/6] phy: core: Add phy_get_by_of_node()
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bryan O'Donoghue <bod@kernel.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Felipe Balbi <balbi@ti.com>,
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-phy@lists.infradead.org,
 Krzysztof Kozlowski <krzk@kernel.org>
References: <20260918-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v20-0-dc244e124e71@linaro.org>
 <20260918-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v20-2-dc244e124e71@linaro.org>
 <211caa95-dfbc-427d-8ce8-49cc76c24124@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <211caa95-dfbc-427d-8ce8-49cc76c24124@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 18/09/2026 15:10, Neil Armstrong wrote:
>>   EXPORT_SYMBOL_GPL(devm_of_phy_get_by_index);
>> +/**
>> + * phy_get_by_of_node() - lookup and obtain a reference to a phy by 
>> device_node
>> + * @np: node containing the phy
>> + *
>> + * Returns: the phy associated with the device node or ERR_PTR.
>> + */
>> +struct phy *phy_get_by_of_node(struct device_node *np)
>> +{
>> +    struct of_phandle_args args = { .np = np, .args_count = 0 };
>> +    struct phy *phy;
>> +
>> +    mutex_lock(&phy_provider_mutex);
> 
> I don't really understand the usage of lockdep_assert_held(), but why
> does _of_phy_get() uses lockdep_assert_held() and here you use mutex_lock()
> like before patch 1 ?
> 
> Neil

assert_lockdep_held() is just an assertion that the lock is held, Loic 
suggested adding it BTW. It ensures that when another function calls 
this function it holds phy_provider_mutex.

i.e.

phy_get_by_of_node()
{
	mutex_lock(&phy_provider_mutex);
	_of_phy_get();
	mutex_unlock(&phy_provider_mutex);
}
EXPORT_SYMBOL(phy_get_by_of_node);

_of_phy_get()
{
	lockdep_assert_held(&phy_provider_mutex);
	/* happy days */
}

phy_broken_locking()
{
	_of_phy_get();
}
EXPORT_SYMBOL(phy_broken_locking);

_of_phy_get()
{
	lockdep_assert_held(&phy_provider_mutex);
	/* wails plaintively into the void */
}

---
bod
