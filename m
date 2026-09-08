Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8825A2F8E81
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 05:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788843690; cv=none; b=hfAronXUvntPor1RMm3SehEvMoQPa9Qy9TiRDmcQIK0VDKT5KWGTPlNij+YesiDefnTjpNJE2XI6dGcf1ywSNc4f10WezdxHTcdUFZ1maBITrOE/C90ZrmtUOF6Lmo9e1TSiKf2tPE9hbCs767IiyztQqqFvwehX0uBfetZ06BA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788843690; c=relaxed/simple;
	bh=V+6ScvaiLo3JPN0wkVRmkS7bOLe8c075r83hcHldHlo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qt+LYUa3qZAOzP95+ryv4B1S/+MKI9sI5rOMT+KIz9IJQ0+VeUitr5HRTo8trsNLsChUnU0UZ6lXXum6VGsB4XBSlwIif5jettBu++AtiDkIrktGpaVIgC5FLzm1GpRqQm4D/92fRhqbDTTPxpZTWDY1hfxlKrmr5qx7uMSmS/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E4dze73v; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TPYhT8Xl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E4dze73v";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TPYhT8Xl"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687NlTck1867127
	for <linux-kernel@vger.kernel.org>; Tue, 8 Sep 2026 05:01:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jhTD6XyG06zkUFyhXjqwJP5PsLsMnHTDifmAKJrZVq0=; b=E4dze73vOYcJmOsl
	DoBhJt7JXDTrf8nHORTblhEjWf2q6NL8sxbveTvIMT4cqs+rUw8a5bEuoiXX27Sr
	W6bb8aZcPZz75aoXjrgzBhoYvzmF/rgafPNg94rV8taMk1KGD+ucg7juWJeQ40oy
	EKlSa54PXcVCT026h4+KhyQWdh1AOxb8WXUO9tKXGdEI6GfbGBUq6eMISiUk/FIQ
	cx9hZDTniJYRjgfb6JcwWdk+KcTeGUapdZGta25uYfXoDWjl1TVrp0/3NJoUCDPD
	4Hw70Di0CoDAkQDQD050+1kP9Xuzvr+9iEeag9yUCEt2whrQcQ/uGB5ZkkRsXmYW
	+F0f3A==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghtdqkfe4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 05:01:27 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2db0a41434bso76058395ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 22:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788843686; x=1789448486; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jhTD6XyG06zkUFyhXjqwJP5PsLsMnHTDifmAKJrZVq0=;
        b=TPYhT8XlYZbvqikfYpE1lCA7N5IquVMh+naq5JRKnFqwcUHgj4bAyS2dbhbJ1nt+tU
         XV4dw7d2oCRCVXvWiTlTHIxKVOjPQTjDVs1cy8MdelR0L60JYOO8afX43GQFSUz5jMMT
         /w9dEaYLv3jtqFqT9Xb+6rhWKGmy4rwsAxPe6y2B2rqvqSVWodlhpaCTk53j1ksqaRRb
         qNqyYvri13Nuqd4LgzLJ4AW/1ArwpG4O0cwki9V6SRHswFP1sBUlUtu/M05iEf0aPzKn
         YKRKdzluUjEEpeCJGRHJL3XdizcF8d4NENN+AHrZ88mXju9VyjIqOgl+lIecBjEi4Tvr
         GvIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788843686; x=1789448486;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jhTD6XyG06zkUFyhXjqwJP5PsLsMnHTDifmAKJrZVq0=;
        b=Mq6y6eO/Xeyo6nMUOcJx7oHTfJARXRPTYa9FopGX6Y6u0VoXhNc72mbQzMjWhJYFnC
         76yJlMPnzQL4bBax62fRhSZcoaIp7VE5OVSCubNiFfF6k+7Ikn7DVC+EV0mkamJQnNhv
         BO513pVqigU/e6TszG+5Wp3qoP3eXBKI/5X6ExTgjzu+uq/kJ+9f192eM64aOYJvUQAE
         qOqhnsz2Uf5UG2xCGEnoKYkWVihaJC4RBqOWkjDq9g0mUTJLKVuKKjcr13csDceQYuSe
         7uretjP+Gn8cOafZgBg8mTu5K7y3qECKfQtrVxLqtw/6D76Jw2JvVXvg8ay+FfKmku/j
         eiFg==
X-Forwarded-Encrypted: i=1; AKwUvBwu3m/PC80qj/sS5gZV0cPz9hVg1igyIDbe1ZF/yH3DcubhbYdgpbOUsv6GrcZh08uc1Lm4dZrz7C7qu0Y=@vger.kernel.org
X-Gm-Message-State: AFuF++m9lAxEQMAWb/moKIzYq6ZKKEDsX+RQVh2cYKArAlpz7FBifjXY
	QzwikathhRPmYw10PHo7l1Gayz670EjtjFELyjainWV0892uygKT6dci80uFc/dhqvEqwLs2q05
	eVJ7DDYu9l6fc7SyevYMjjs5TSTUEHN0r5OW0Z02fax0Yyd5xZ453ZnPEFNwopmIjDmM=
X-Gm-Gg: AYBFou1MV/LbbrGam/BjbBp4BCGesb7cuYfm0I/us1k/7MRFWuOampf3QJ3+mqzylNF
	wfKIK27d1ZLyuXqOCr9QgRYWWrmMtH+ex6GL4hzSKR78VjxbDes/Kh5gg91cu44jKM2/YfhfLi1
	YzXgeY7MY4Tg3IRhQQtLSulOyYpST8jMdIxahpoSDMkxkJg5WEfpOfcZXsYX+OPQrG6a4T46kfJ
	CK68yfwiuOG64l6yuHDfSAhgmq9hxgxl4k2wG6lU1VZMB05C7KqnYlT78hGmO3vTz+bjVkmQFPv
	NwczshfHTV/zjiwQDwq5sd/yfMo3b9qL7IgBmDnxwKp/AVsaOoS1TEMrRV+JYZyn9V9ZN3gfx2+
	38Wz2B9RpTRoqSUYZiAggjnaBiafQxnnsDBZ3lYq5TQ==
X-Received: by 2002:a17:90b:1a8f:b0:398:d2a0:87ff with SMTP id 98e67ed59e1d1-39b26101029mr40141190a91.1.1788843686072;
        Mon, 07 Sep 2026 22:01:26 -0700 (PDT)
X-Received: by 2002:a17:90b:1a8f:b0:398:d2a0:87ff with SMTP id 98e67ed59e1d1-39b26101029mr40141162a91.1.1788843685573;
        Mon, 07 Sep 2026 22:01:25 -0700 (PDT)
Received: from [10.217.217.129] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b25f8d2c5sm24555583a91.2.2026.09.07.22.01.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 22:01:24 -0700 (PDT)
Message-ID: <a08e64a3-d5d9-4568-a795-6c5ed355ae05@oss.qualcomm.com>
Date: Tue, 8 Sep 2026 10:30:53 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] interconnect: qcom: x1e80100: enable QoS
 configuration
To: Marc Zyngier <maz@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Mostafa Saleh <smostafa@google.com>, Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak
 <quic_rjendra@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
References: <20260527-x1e80100_qos-v2-0-305c6539e6d2@oss.qualcomm.com>
 <20260527-x1e80100_qos-v2-2-305c6539e6d2@oss.qualcomm.com>
 <apgeBNSiP01YfNcs@google.com> <86ld9d4h4n.wl-maz@kernel.org>
 <f58bd978-ca45-48b9-a928-45a2878fb54a@oss.qualcomm.com>
 <86jyox4fas.wl-maz@kernel.org>
 <ca962589-3b6c-4e5d-a11e-b49cf20dc262@oss.qualcomm.com>
 <86bja94234.wl-maz@kernel.org>
 <0916741e-442e-431a-9831-9457e3af1cf0@oss.qualcomm.com>
 <86a4pt3t15.wl-maz@kernel.org>
Content-Language: en-US
From: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
In-Reply-To: <86a4pt3t15.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA1MCBTYWx0ZWRfX5W3bhYcUuR40
 1d743Cwxc35FAy5p95iOH8WltBBM05UQ9s1VJlndzSn3Xd6Juwd+31Cv+AIi1UFWVt9/d4/Rcwa
 y2cpcv0xOGMLQkyDolijdvlb9JtdKCdw/Pk1Eqvk9+Q0sF4iFFPeUoJ20VQw6jodR5sdn3sQbBk
 OoxS0W3gN/b0ZfWT9zng/zXBSwKN2QAbnCxrYAkncMIdQtbCJJO2KoIZehxJ6WbcXDTEMxtyPCs
 t/WSRZgJcvcH3ougVOOnTlP7B/8QQ8DeIK3oXokFbbbM6TyL05oza89W4IZvJuYkE5CMO43TdF4
 uaLiucUOpcoKQuP+Vws5MqTG50inHZ9RbKLvxf//EwyuLsEHyhh7dIMYCyvw8LNEdXCEqyH5eKj
 j3aMxs47WjPN0h6xqqIDuFPTg9i8bptiSp02MpjPA53Ha4wNkTZAPM0Sh59c61LdhkOmFpv+wZX
 uTJXhwHyrSZft+JGZcA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA1MCBTYWx0ZWRfXyAWqytTXXcQK
 3v1CAZLe+2kA8VxQBfPJfeCg/i8zHskUipUjjrpXoltgtK9tVbjCIzi9oT0Z9EFW4z0GkduJsjO
 CFun+/7s105D8tiSzWsWGi32T025wqI=
X-Proofpoint-ORIG-GUID: LZz3s9M3J-PFE8__XDcl5bRAbPK-deIJ
X-Authority-Analysis: v=2.4 cv=U6aiy+ru c=1 sm=1 tr=0 ts=6a9f96a7 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=sWLy_TsMIpJ6H1EfkIsA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: LZz3s9M3J-PFE8__XDcl5bRAbPK-deIJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_07,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609080050



On 9/7/2026 10:20 PM, Marc Zyngier wrote:
> On Mon, 07 Sep 2026 15:34:35 +0100,
> Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 9/7/26 3:34 PM, Marc Zyngier wrote:
>>> On Mon, 07 Sep 2026 14:20:26 +0100,
>>> Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:
>>>>
>>>> On 9/7/26 10:49 AM, Marc Zyngier wrote:
>>>>> On Mon, 07 Sep 2026 09:18:38 +0100,
>>>>> Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com> wrote:
>>
>> [...]
>>
>>>>>> The current patch enable QoS for Hamoa SoC, which get programmed only during
>>>>>> driver probe. This shouldn't impact or cause any spurious resets once the 
>>>>>> device is booted up and probe is successful.
>>>>>
>>>>> And yet it absolutely does break things.
>>>>>
>>>>> With this patch applied, the box resets within 5GB of heavy network
>>>>> traffic, probably because some transaction get delayed, and a watchdog
>>>>> fires. With the patch reverted, the box keeps receiving packets, and
>>>>> everything is hunky dory (100GB+ so far).
>>>>>
>>>>> Which makes me think that the set of hardcoded parameters in this
>>>>> patch is not universal at all.
>>>>
>>>> They are, provided the configuration is for the right SoC..
>>>
>>> Is x1e001de different from x1e80100? AFAIK, it is only a binned
>>> version of the same SoC. How do you explain the above regression?
>>
>> I somehow skimmed over the fact you said it's on the devkit and not
>> on the mini-x mentioned before.
>>
>> I pulled the Hamoa settings I could find, there are some updates but
>> none seem particularly related (maybe the PCIe one? I don't know how
>> the network card is connected), please give the attached patch a try.
> 
> I cherry-picked the Hamoa-specific patch, and gave it a go. Same
> result (hard reset while synchronising a bunch of files), but this
> time with a nice little message:
> 
> [  272.468031] nvme nvme0: controller is down; will reset: CSTS=0xffffffff, PCI_STATUS=0xffff
> [  272.468039] nvme nvme0: Does your device have a faulty power saving mode enabled?
> [  272.468039] nvme nvme0: Try "nvme_core.default_ps_max_latency_us=0 pcie_aspm=off pcie_port_pm=off" and report a bug
> 
> indicating that PCIe has died.
> 
> None of that happens without the QoS stuff.
> 
>> If nothing else, please "bisect" the QoS additions until it stops
>> crashing. Although perhaps applying only some of the settings may
>> have its own set of dragons..
> 
> That's not exactly encouraging, is it? And if the "recommended" set of
> tunables is not up to scratch, surely there should be a way to opt-out
> until someone figures out what's wrong. Something like this:
> 
Compared to Hamoa, some PCIe ports are removed on Purwa.
Let me share you an updated patch to try.

> diff --git a/drivers/interconnect/qcom/icc-rpmh.c b/drivers/interconnect/qcom/icc-rpmh.c
> index 3b445acefece7..3a4743c364dac 100644
> --- a/drivers/interconnect/qcom/icc-rpmh.c
> +++ b/drivers/interconnect/qcom/icc-rpmh.c
> @@ -224,6 +224,9 @@ static int qcom_icc_rpmh_configure_qos(struct qcom_icc_provider *qp)
>  	return ret;
>  }
>  
> +static bool enable_qos = true;
> +module_param(enable_qos, bool, 0660);
> +
>  int qcom_icc_rpmh_probe(struct platform_device *pdev)
>  {
>  	const struct qcom_icc_desc *desc;
> @@ -308,6 +311,11 @@ int qcom_icc_rpmh_probe(struct platform_device *pdev)
>  		struct resource *res;
>  		void __iomem *base;
>  
> +		if (!enable_qos) {
> +			dev_info(dev, "Skipping QoS (command line)\n");
> +			goto skip_qos_config;
> +		}
> +
>  		/* Try parent's regmap first */
>  		qp->regmap = dev_get_regmap(dev->parent, NULL);
>  		if (!qp->regmap) {
> 
> At least people stuck with Purwa or other abandonware (such as the
> devkit) would still have a usable machine.
> 
> 	M.
> 
> 

