Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C746C599A2A
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 17:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788889766; cv=none; b=qA8UJUunuulcQJ3Nqnsa+oglphRnTq67W5E7guwAnA6yQWq2FM5cMn45R5O5GXImfDLomwuG7DNHqlsThsfUhLU6dAbxw9FwsuFC02mOFIAvWmxVJttofyKUZrT4E2Ng7ipJubWrfTC/2D436En22AqeROfS6FVbJFyllPORaMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788889766; c=relaxed/simple;
	bh=mWaxN87JC2EDFezne34c7EaHfBw90oiDI4rQKPLfvvU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Yj1ASPgBEtcuLEpKakiyeSwG9YMOScV5n3AaaCnH7B8YqoZn4e/NB2+QjAkGfxb16H5VyZ+KqXnaq5KwqPNSw5U1utKly160GXcArhT0qUyB/Iiik7bVKHOk5Q2GDBiMdRJw0W/P4lo0PXdddGIJyt7YQ6kEczRpWnq67o7KnWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kcvmtLm+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KSo7tkNW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kcvmtLm+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KSo7tkNW"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688GLmS03502003
	for <linux-kernel@vger.kernel.org>; Tue, 8 Sep 2026 17:49:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vXpB3HjGCxpveG5hbmpDHm8SjVKdHjWqdRtp8+xhDXg=; b=kcvmtLm+rk8tRsVG
	EO/cUkorf9R8iho59kOuEkIxzUHpyBJbJ2uUFEbPkKRNSoXGMnjVJwQ/YgBWuv2R
	aHV91uZn+k5kRwSWofrb0Z8nv0KhVmrBqbs8R85Rp1fKzqasOuoqngI66qY2Faox
	mYTkaMutXs/qSuBE9ZCkwovTKdLdkciH1oEVlrRIsHGe7oxPgZG2hbP2/whgIgWC
	hAWlWdlpxz6baK9YlsoTO7naq7iFryvmJIZhMIA9LrU+fCw7EvkoMLFWSsD8prkH
	sxLrO40KxsAn1IHpGVPDrt5oKPM7OhwnAA4Wt5wJmt3LK8y9v98nG2LdmFtK1+pL
	ejm9ig==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjntpgdt2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 17:49:23 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-97e8d95121cso390206241.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 10:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788889763; x=1789494563; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vXpB3HjGCxpveG5hbmpDHm8SjVKdHjWqdRtp8+xhDXg=;
        b=KSo7tkNW5WJKzMJHyMLdrf9bUEpI4LHpPAnVo5LcG/UgdNU308mI8IEJOoeGnkgXLf
         8iKxnJ06YT+rE1b+2AWSw9cU+0RhFe3MQgRrm+cp9M1VhZHdhw3EDrzRiCqjK3JmFQzs
         KI9nl94W6fV7q+7HJVx1h7ETBeYHDRx2pVSei3DWuTzkJVKzPOvNu+jIEd/eLXsYAY7b
         4sGo5r6Kg2+GOWsNNt1QS3z2OjcPnCVwH/6VBjKjHiFSM9yRsK8JHBnwxenBTYEz8cRg
         w00q5LvExKv3KON6j4VnimYMxiDEEy8zwC6EQRQM5lhSM+sH6a9cg9Fn/pDQcRlvlqrv
         zXNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788889763; x=1789494563;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vXpB3HjGCxpveG5hbmpDHm8SjVKdHjWqdRtp8+xhDXg=;
        b=g4OPt7C/2xKTSG7J5WFxdOebX/xMvRjN4PtLd8iZXzwV1hgZrJxnYiVgLctXPWSfGs
         mVAEVGj/iHAyLisS0rKDOL9m3D2FloVkYssmzbRPjmcYhsbPgx4Z06vuVO/pMeLIGcIA
         7oNbCc5TrsvXDGz75N+gtIW15L7IMyjZQTdYgadrWvMURi2G/56VJMC5NEye/yys6RRZ
         kw27x1ekReOEjUdhC+uKNsrAwOdsUNHil6vZIojJNhmAuAchFYxzbA5ddo1OsqgCov7b
         fsRliP/T0fv9wU8CdbHa4sbKRKSnYpCkbLaSpTT3OM+6Srw3IG8fCQrRRpoXzRWKFG0K
         EG7w==
X-Forwarded-Encrypted: i=1; AKwUvBxzP6FlrSfa5gSXsw7FpDb9J20sdHmbSVtiv2pidXisPFsU4FZEy5B20FVcccvtQnP6zmx/x0rCVFry6wI=@vger.kernel.org
X-Gm-Message-State: AFuF++lBUioQvLyrWNuZDQ+x9OsKJ8C2p/qTzey/iEFgal2GpAA3teUH
	B3FbERC1CijpFzx6zRJ7Ixdsgwy2tLFc4xvIbhgeNiIUwiGl3Xcy8JRCG6+/4F3jmtJ1mT5/IYI
	gJEexdO5KzXAlZVmWSl0idSV9lp9HKTBsdPs6bNYo0iNOYmvPvIM5wtA8heIKsR2LQ6OjlrFz+t
	Q=
X-Gm-Gg: AYBFou21vd7n/34dldICT4hCalzvMok36cdwsE/TR3Y+BAN8OdQccc81oiVNq0ZDkQ3
	6Qk4wxgf8N/taPQgr13naK4O3UZnTD/6uL/2Q/Dk4IGsEwVqtphwgtX8N0vhU1xS8laIp14QWIG
	FmmJiIJ3f2YUnR8VCDdIANYq76ariHqCaDRMM0QnPnU3ewPtXRbYWqmqkump0a/4HS4+hTh7HYs
	Ix5C34fnh32Oq0YQWt1ux5rRbBW2rR9WEG3usL3inYuxznB8rBjLWVk5JfxKFfYeVYCsH32dqzS
	t+VgopK1gz5QrqS4iis8P6R54ZKs8uZFlHF5qXg1FmXMpala+J2740i8SYGitBsOO27Yad82gt5
	kjRMqiUi5UYBZBf4kqEbgjWyARDo=
X-Received: by 2002:a05:6102:38c7:b0:779:e75e:63c6 with SMTP id ada2fe7eead31-78a4a99f93emr11680302137.12.1788889762899;
        Tue, 08 Sep 2026 10:49:22 -0700 (PDT)
X-Received: by 2002:a05:6102:38c7:b0:779:e75e:63c6 with SMTP id ada2fe7eead31-78a4a99f93emr11680279137.12.1788889762354;
        Tue, 08 Sep 2026 10:49:22 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49ce5563c6csm413124815e9.4.2026.09.08.10.49.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 10:49:21 -0700 (PDT)
Message-ID: <1b0b1079-2646-41e2-a513-6513934e8ba6@oss.qualcomm.com>
Date: Tue, 8 Sep 2026 18:49:20 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/11] ASoC: SDCA: export PM helpers keyed on
 sdca_class_drv
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Takashi Iwai <tiwai@suse.com>,
        Faiz Nabi Kuchay <fkuchay@oss.qualcomm.com>,
        Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
        patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260907083727.733705-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260907083727.733705-3-srinivas.kandagatla@oss.qualcomm.com>
 <aqA2W+hSCjLVIa2m@opensource.cirrus.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <aqA2W+hSCjLVIa2m@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE5MyBTYWx0ZWRfX6OzucaTb8itl
 KHDSLemWeb1qFOzr6U7H2LmT5xeRtu2dOlTSEJdHbTmsV8oXaeqEvkFgEs1xC9TqqNiTJaUoSmB
 yZZa4omDt+e9AlpQ2RlDcBfqHI7+Fq9+6V8BIjImqpr4LsGHB5sscKWRFKKX8uKCrOy11yRYJdq
 eMCr6T8rbwIW34qU6FBSzo2bwkPN9nfjq8DB7pbnQvehjw/xQsC9RIpycoTyRSAkoH6Nq5gchQs
 8NPc7Ne0LZShvF6UtYdcmGy3W2HQjk9+LI2/wL7P5S9qq35VRTBoWIS3GaNrbDEJauw4j9/f41b
 mTGxgosE+/Ttcfy1+1dPpHetnopOm+Su6teuPfDoj/E3/TwTBE54My+HECyIqMG4Ze/eUP52Dn6
 z8XbKqjO+5LN4+UsCQJ/SHFbnr4LhcBJ9QeJ/iq/3/0dS49iTidVJTCZvhXE7qofJscOphLNe89
 ZyD4sGm0zoQ11auwssw==
X-Authority-Analysis: v=2.4 cv=N+AZ0W9B c=1 sm=1 tr=0 ts=6aa04aa3 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=tyrENRfuTtrdjV8_xjIA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-ORIG-GUID: Qjb-hQX1Y5aG7LtfFaA4xCWTQYNZBqLE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE5MyBTYWx0ZWRfX+Od9AF7z8ij/
 ut17MbQtjxYOhrBcXE1h0ed1ZcVDveOl1sLeTd8x1VWCZdG4pmjbH3k/k79LIDrCs47fo0DwYcP
 BsvICXqfxNVw/ATzhQAPFvdDaDxS3AE=
X-Proofpoint-GUID: Qjb-hQX1Y5aG7LtfFaA4xCWTQYNZBqLE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609080193

On 9/8/26 5:22 PM, Charles Keepax wrote:
> On Mon, Sep 07, 2026 at 09:37:16AM +0100, Srinivas Kandagatla wrote:
>> The class PM callbacks pull sdca_class_drv out of drvdata, so the
>> built-in class_sdw_driver owns the drvdata slot.  That works for the
>> generic case but blocks codec drivers that want to embed
>> sdca_class_drv in their own private struct -- they need drvdata for
>> their codec priv.
>>
>> Split the four callbacks into exported helpers that take a
>> struct sdca_class_drv * directly:
>>
>>   sdca_class_system_suspend()
>>   sdca_class_system_resume()
>>   sdca_class_runtime_suspend()
>>   sdca_class_runtime_resume()
>>
>> Codec drivers can now compose these into their own dev_pm_ops without
>> going through drvdata.
>>
>> For the built-in class_sdw_driver, add small dev_pm_ops wrappers that
>> fetch drv from drvdata, wire them into sdca_class_pm_ops, and export
>> the ops so any generic SDCA slave can pick them up as-is.
>>
>> No functional change: the built-in class_sdw_driver keeps the same PM
>> semantics; only the internal plumbing shifts to operate on
>> sdca_class_drv instead of struct device *dev.
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> ---
>> +/*
>> + * PM helpers.  Codec drivers embed sdca_class_drv in their own priv,
>> + * own dev_set_drvdata(), and compose these into their own dev_pm_ops:
>> + *
>> + *	static int wcd_runtime_suspend(struct device *dev) {
>> + *		struct wcd_priv *priv = dev_get_drvdata(dev);
>> + *		return sdca_class_runtime_suspend(&priv->class);
>> + *	}
>> + *
>> + * The built-in class_sdw_driver in sdca_class.c uses sdca_class_pm_ops
>> + * directly because it stashes the sdca_class_drv in drvdata itself.
>> + */
>> +int sdca_class_runtime_suspend(struct sdca_class_drv *drv);
>> +int sdca_class_runtime_resume(struct sdca_class_drv *drv);
>> +int sdca_class_system_suspend(struct sdca_class_drv *drv);
>> +int sdca_class_system_resume(struct sdca_class_drv *drv);
>> +extern const struct dev_pm_ops sdca_class_pm_ops;
> 
> I don't think we use sdca_class_pm_ops outside the class driver
> here, I would leave that internal unless we have a need for it.
You are right, I will remove this in v3.

--srini

> 
> Thanks,
> Charles

