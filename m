Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CDF754EEB6
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 12:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788955824; cv=none; b=Hp+rmSt+P3jBWpLUbH5VMuDS/UmHiJQV3y0kRRKHR0SRfRvx4nxy7/O0rjewk184z9FBmUDachIU6DFBP6wFc4OGcVeYdbHPkC9TQI88O9zO13PPxeBhK3gB12RMrpQZbTQT+LXo+H1K9Vr9eZaawV0GNn5cwznmXRr8zFwq3uY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788955824; c=relaxed/simple;
	bh=yKb5Uynka4fpXbxfDYHt31nQ/YVe6uRyGsWovuDWWHY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fS000Ja/YxHY/jtNRi8n75fJ1vsElPgKIOS+6EWXzvKXGYdvaO1K7aqN2RiTOoIh1ty+swJgfTkQQ1Bndy2Q0O7CfojPeZwDEfikX3+vdbB9/D02XLOW5Q6UCtwT1xxOVGGD8pXyyHuyYS1JcVPXof7KCjYTvto5z1wXo4kzK5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EVfISfEF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T2ygIZXu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EVfISfEF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T2ygIZXu"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BU9tf2959505
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 12:10:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X1iR+eoTd4aOG8iSBLGH4p8K/MxGiEwmmRE3XAFMcXM=; b=EVfISfEFYdWOaQZv
	3AK88fBo7ZU4/v/vzugoKIqztTn7fV22+ekDtjce9mSTgSnOpHcO0Onwkwjqagso
	GshwM0COkF6ZNRhJMuKAoqqR0PXqBZTESR564jN6pPhqshIii22H/4FbArdIMQb3
	p9k6egwIeea5R0TxLi2MG/E5y8XovKGKsQIepuI2KbS4g+daqK9GHOf8OLY9aRR9
	AT1nKqUfinOQV9YjtIxfUuQCwFa/L55dRx7FA0RZfIt9XwvmaXCiLJPo3nwyT+Nv
	K0NHapXwSUsQQcaVKkPgcouIZKtJao4sWfNlgmANgFDh1iXN8o1DopumqlgCKQJR
	e3//ow==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjqdw400a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 12:10:22 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-789eb1bdd79so163006137.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 05:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788955821; x=1789560621; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X1iR+eoTd4aOG8iSBLGH4p8K/MxGiEwmmRE3XAFMcXM=;
        b=T2ygIZXuaeFxZDdGo4Ts1aBdGADIed8ayCEguGSDn4tQMf6FccOYec1DEZjuWsQOs6
         IyWm2fkUHAXt30iEGlAa3hnWhNXAfaLHMhIztSf7vL8Pvi/r/e7GIBCd2sfNb85t+IhL
         byAKvHtjpWKPnR1kfxlpQYSrX8tzhETKE+2Skk4XKAYpBBc99AAqIF4jW7QGWnyAN4dK
         hrnsXcid4lkxExqn10CH/ZkO5hJKuOz+MS9XjNxL2IPfj8KveKQp7ZtbqUJpaPkFUo95
         8e2jjyRcQzQpuQbBQB8sTz0DxlEuCLxqFSydrxhmRj4JW7oxziQNGRbwvz4Vgf5aDe2V
         9hJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788955821; x=1789560621;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X1iR+eoTd4aOG8iSBLGH4p8K/MxGiEwmmRE3XAFMcXM=;
        b=iwDce+qp6bCQCrrj3yzIotSgTtwjezRkkr5I6nHKOl2bDq+nOwCv+3a8qxANJWT1ZN
         6n8DCODSmFa1c9+tFdzyOPO866dHEH/hwj/OswWaatb+aX8RdBJwE+j6oE/8ZWTN3WBe
         CmOyWZY+05aK2uqrDY/kUqTtW+u7EOwhtK0XlygCUWbw0bkmNaBQcEi6hZiu8QADE2yF
         Mz4fSoVDAud9nu2qbGBRQrAeV/hdh4+jeIfujmJFIwLKQEgRu+OWq2kBNWbAIK8vJwY4
         kkIZSuO63Jct61lhX/AVXLHeBHa2h6grFPQCj6k9rEMR5EGxeJZWmrCRNqx+QLconZ8Z
         hfQw==
X-Forwarded-Encrypted: i=1; AKwUvBwblijqzXry6L+Mf20cXqNF2TKI06e65UmLwIHCi4BX5GxnKTLeGmHcDjuo0ay0cXIqg9AwIyomD27nDX4=@vger.kernel.org
X-Gm-Message-State: AFuF++nudd2QR2C5hXHWoDTSE9GHPAjhnXgNf97EQFTlke5aGgSyK5sN
	xfNU9DZ5F33c93OVOWRnMzaPwY3TcIoKavs5r6hyYD52L1aHdH5VOodcCuF0m2oNiLvV+Zc33Ug
	3GoGoYBDNgGNrYTbYUzS1CSzv28OEmeHyYhIi86V9KojiDZqYVJCZcditlM97dDNslss=
X-Gm-Gg: AYBFou0DhdZc7nkieEvwnEfnqjKqFjIagI6AD+XlXBoNXN/9Leas2cRxmJXoRV7Dr0R
	phgttxgvZ5eE4alq/jZwa5t1cYgwgj6V5yD5wUDvzXGfR6JQ2K5g1i4nh7LM/ZRp4w8BfP3zDUA
	LR+xJVX+09hdOMBEm2s49VdWbsPGxLh+gG3WNoDi3mwIONEQ/RHWp8rtsm8+nHBtzZwlUdM57Pg
	hUsdZjCN269nHBkD1oLqKtBngtwHD3e0QcXDr4cqwpw8vZSKgGIq3sOkz+h60B6+mSSN8OVYPhL
	hKKMqZHopT8VfwJb/f1p3FtVNveDEqT4oeU8l3C7c++FPr4oGOU0yHGhmVKL6aQnsFNRjSQT4uS
	53Sd6nvBqD+W7zLyz9IN9IQ==
X-Received: by 2002:a05:6102:534a:b0:780:6fc7:2181 with SMTP id ada2fe7eead31-78a4a6dd842mr4431698137.2.1788955821050;
        Wed, 09 Sep 2026 05:10:21 -0700 (PDT)
X-Received: by 2002:a05:6102:534a:b0:780:6fc7:2181 with SMTP id ada2fe7eead31-78a4a6dd842mr4431685137.2.1788955820608;
        Wed, 09 Sep 2026 05:10:20 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c28e9aec296sm471566666b.28.2026.09.09.05.10.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 05:10:19 -0700 (PDT)
Message-ID: <5a13b69f-317b-41b4-91e4-4d9f7d85ee2e@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 14:10:17 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] clk: qcom: ipq-cmn-pll: keep the CMN block bus clocks
 enabled
To: Mieczyslaw Nalewaj <namiltd@yahoo.com>, Stanislaw Pal <kuncy7@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc: Jie Luo <jie.luo@oss.qualcomm.com>, Georg Seema <georgseema@gmail.com>,
        Brian Masney <bmasney@redhat.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
References: <20260805193638.15327-1-kuncy7@gmail.com>
 <20260813093351.178419-1-kuncy7@gmail.com>
 <11b0c7d4-4e77-42a8-9528-6dacafd3e251@yahoo.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <11b0c7d4-4e77-42a8-9528-6dacafd3e251@yahoo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: mhTJpzNOgWULm8M-PLYPJW97v5AyyjaE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDEzNCBTYWx0ZWRfX9d73EbqplmFT
 F4DlD6UE94ESm/+Xde8eyRZWvOmaxrWCA+utbKXC1CP9UP0jslZL4QzmiCOG+kddhwAI2vDHvHZ
 3TxhD07kn7f4ORybEFNZThNuEoZsRCM=
X-Proofpoint-GUID: mhTJpzNOgWULm8M-PLYPJW97v5AyyjaE
X-Authority-Analysis: v=2.4 cv=Bo2tB4X5 c=1 sm=1 tr=0 ts=6aa14cae cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=dScmzdbaH-RYzaEnKG4A:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDEzNCBTYWx0ZWRfX7Y+So0JUguIK
 8XEv9AB7HeUiEmSSWLVyMM8UlqQdpcvhNDiB0SwJZwMITYcGEHeazuncYo5EGksit8RuYHXqt20
 dZg85lQUS6XGzreYmxzPy76/OXa3ncUQMp+/u+rorikzCOA39zbJMHqa7SCjhF56zWr7lcm5JHi
 6ZdkvhOdg6WX6RzGcPHHkVfLvC4gUAv9OS2ek4izUviM2tbVyVynkTxxmsLEPy9z/NMKPOE27gR
 lUUsOuDbDLLwjjbikF6oSHM7tEfKIDsZA21WvoyWZ+DkTskksfI7jYRZCvt8C+HXRCSHuG3gCr0
 4hD6kJ64RYB4oO8Cb2iiAs3p2C8e4LPuZFOn/nS8meYCsq/1Owqq3YReogUIBQHdUSPRS9jNjMv
 UDFIOTFxewIoDkCJE6OgInbws1ly1uCCZBzolTMrVMDIKQwSNVzU49j9fQc5j1wFF/qGqJVZQ2a
 cU07YIOdbsxSH/6WlHg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090134

On 9/8/26 12:57 PM, Mieczyslaw Nalewaj wrote:
> Hi Stephen, Bjorn,
> 
> Just a quick ping regarding this series. The discussion between Stanislaw and Qualcomm (Jie Luo) has been fully settled in late August. It was proven that handling this on the UNIPHY side is not possible due to the early stage of the watchdog reset.
> 
> Are there any remaining concerns, or can this v4 be picked up for the next cycle?

Since it doesn't seem like a proper fix is coming soon, this is
much better than keeping the platform broken in the meantime

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
