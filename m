Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794475019;
	b=GUwu78JcZ0iDZXSUrapKrtuALWni5B4JagaWT0zyc6jcSP1psT64jxlIKUDh12TI8XA2
	 i4V9bPdMSjKEd5Jsm4eLFcSJsuP+LOJXKZwVQGYrIyFE7YtgJt1CFFy2/zUMS5LqB6zOH
	 5XI0kfKETVsIII8bD9LP8/zZVvMhOxn+HoT33bb0dN8rE8aYKREj57E1XwjD7Qg59jxE+
	 Kq8Yj76oq9MdL+XjFNyGoocEhtbXfgR32IBrAjbMe6/hqERucUkBXttWBXbCphnwXGdTp
	 QojG1mBANnkvw0Nf2jGRo01sNp7LxYTPR/s6c75KtL/H8FopxkdoBnCOU4oBsnfAT0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794475019;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=N2P6nDd9tifAxlLFJmiQ99UaxUAK1441F1X72vcKcaA=;
	b=Jd0aadRrdnzuXoBTbyiyd4K4SY/TkMsAJ6w1ibOGL5tbotoN87Mz0Osx/8HV4WHsgXX2
	 RFhYESHCscEEd6LH3E5uS+74ruIm6RdFLteBchnuhgXHBRLhFo9AWUNyGh6XzAayu5ai/
	 Fsgd0t2sl2IY16UdazQSDfRt++jFHU9KaKKnxmOgp+dmdTFsMosuXDfdMDZGfH1Mi353y
	 mNZw0IXlIYoNc30oV7w3HR1Wt3YuvqJiHGD5+0mocudRtwqdpZ4b9epdSOTNfmgfGpOr4
	 XOMyxYSmwp1v74Zig8i10omKvsu8IBRlPG7mgty4wm3IcqhTndSVk9KEt3OSckjJ8HQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VM83kiH7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RTsoKJL7;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81C38606A32D
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:16:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81C38606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VM83kiH7;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RTsoKJL7
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC2ZUhv4092542
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:16:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N2P6nDd9tifAxlLFJmiQ99UaxUAK1441F1X72vcKcaA=; b=VM83kiH7iyLX/Hbk
	yxYV/l/fERM25JjD0j6/Xgd9GGvK++07mWI8dPt5k91y7Ygw1O/FRD4CzEPq5ikn
	yKLpFuodDY/Vh4pMIP2JNB7Fm7Y06jdOBCrzqKXWaYsvZr3D+RV2m7eWGn9tOxJ2
	464MA5QDr6z0cDzH/Xa9pSoryt2FT3C6NqpQdeWle+Bi6WZY47EmKPyzYKBhoueV
	wtHut9adM6PBB75/XE5MkqTz8qfIrhQ3o+cQahjhk8l3pWVsSc/oFQLswV1MrItX
	aZkxxR4ggvfVhyh++jn/3FQINAYft2x1o0djkYCTs1AuIDw5YKYGCgKoxAABGcID
	luWqYA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw0m8j4r8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:16:58 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5362ce9df1eso4138861cf.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 01:16:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794475018; x=1795079818; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N2P6nDd9tifAxlLFJmiQ99UaxUAK1441F1X72vcKcaA=;
        b=RTsoKJL7GfN3fbldcW5qwgsnoRtB9UVcbNv68XtJcHDyicbaV7uJrQ4Y5aGz0Xu/7H
         TL3wDkuqv3aSxtfb0RGni4bkJ5ko7bAOtZJKXtRvJs5BGVEVR8Tk/u8E0F4EX9EMGauv
         7VpVxDBXW6K4vQP2ukf1A0eXG0+CCf3LDx86GdF6NARhT4sK2rbzHwIp8y8PpQRugWG/
         kSTmkFE/GD50Q4o8T2xM7CxMrYRDg8JOaY7NkEr08sXTeWxUFzNywtmmo6ZEkO33r7F8
         tFj+M6kgLcxxDijN3Qd0maMR4IQ5tsKhswFI0dA7ohg2PWQwQyY4YjXBQmxQ48bdHvPw
         cUOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794475018; x=1795079818;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N2P6nDd9tifAxlLFJmiQ99UaxUAK1441F1X72vcKcaA=;
        b=daGGPlvRnhokBu5912NleF/kvlN8e8xrwDkHna9SPadnQAnDeVJxQzRMGEePgODmkZ
         9P5A8pgpU9MrJY4yBaziYrRMYk9R1+ikEZNSZT8jCdh/qixICPRRI8vZMrtWoljnLf46
         Kl5foh7s9eI/zLTtNJaf86WxIWLkECa+PQnwMrb7fRdZuBYU6XvzhnbH9sm67NH9N5Jw
         HuIDUgcE6+v73DndAYaP0T9IulG5rMnwUnZ/otTYNUA7fSxqmbZlKtNosyHffVUrP8Zj
         9j5gp3twj8pO8su8ZMZTczRoFcc+Y53XuSrmVMGHWGKyYz6oI5/ILrCy40gc8ulcyoZi
         FW9Q==
X-Forwarded-Encrypted: i=1; AL+hErFQvj6BrIjXYskhw4JJZgqi185su13fI69rXxC2zuQWHDhsKbwGVro+BKqyiYTj/hHDWX8tpRHPt6G7WF4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Ee+n2ha8d5GMP0jEau+U9xoPljaWcmjm8zlPcP5m9YFOTyHEz
	NTsREuIo7EYxLs5eIP9hsRuMJ9gi9XuQ1nm2iH8o2mnrZs0UurF7dtfRcgzLRNTEJURWklmKjOC
	lEi9Ib4WZpFRI5PAZLw3piCJiS2zpwhswt4rZ9QxH0gWCNeq0Vn3lsQ/5UP+4nMG4ZPb4COgu6U
	Q=
X-Gm-Gg: AYBFou2J9G5Kpy9Mo7hotz/u+PneqzOWwkh8oHd7l/LyEhd+yiUSU0te6MgmTjV0Jzm
	l86qoV938HAPD8VgfJQGJx7HS3HTMfX8IlBJ11w3YK7MyC72YsqpL4CVBR80vMa220jJ6VjQLOY
	aM+vrwvsikco+i/sq7Uj0R/TLVUcRByX9dFoQ45pac6SolggyKGmrSeyS7FfpE1bzoQdzh+dVxg
	7MNCDxw2y3bjZqtLlbAXQE83pcMyKy98NRLc44H6icnspZuzfrM2cb/wVXr+bcp8HNKb7W7e2lk
	e7m+4+PNjedvWPIEWoKTum/TXeZsYl5MVxaJSBLKz7+grOUuAJW+N2iHRT90SBKkz3EReKATkbo
	ZLOLvRsJ0FUiD0pQDMGmi2TH3EzRKMWPLkXmxlh7ViQ7vPGhsT9MsYFcffa3OBSTES2p/rtI=
X-Received: by 2002:a05:622a:e48a:10b0:54d:42f2:78cd with SMTP id d75a77b69052e-556bade17afmr78818541cf.0.1794475017607;
        Thu, 12 Nov 2026 01:16:57 -0800 (PST)
X-Received: by 2002:a05:622a:e48a:10b0:54d:42f2:78cd with SMTP id d75a77b69052e-556bade17afmr78818331cf.0.1794475017160;
        Thu, 12 Nov 2026 01:16:57 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a693e82sm318371066b.83.2026.11.12.01.16.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 01:16:56 -0800 (PST)
Message-ID: <897d7742-fc16-466a-8a3d-985292431fb5@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 10:16:53 +0100
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
Subject: Re: [PATCH v3 0/4] arm64: dts: qcom: nord: Add USB support
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20261013-nord-usb-dwc-dts-v3-0-bcaaf3faae24@oss.qualcomm.com>
 <avDL8IzfY1AcDjzY@zenbook>
 <o6t6le343ifmu5w33z55ik473xfynt6urv465xe3bn7hyhmncn@7atsac6o5bwo>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <o6t6le343ifmu5w33z55ik473xfynt6urv465xe3bn7hyhmncn@7atsac6o5bwo>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzNiBTYWx0ZWRfX5/2MiTxQKVq3
 eCut68WlYeZi+HxfKigM/dl4llXxnBn0PaQ1eas6X3XdBy6kn4WUEW5DNQvo+LNtMVoOeGL/Gss
 EcBLAIwg6o4C9dNWPbaXpTCATQC4WC4=
X-Proofpoint-GUID: CM4O0_y1FYdXbP6IIq0_nN670n2UCcpL
X-Proofpoint-ORIG-GUID: CM4O0_y1FYdXbP6IIq0_nN670n2UCcpL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzNiBTYWx0ZWRfX00i9o7QBEh31
 bhWME9NRa9/8OA5gJp9E04QTRWBK3EwEBvXwHnbJMSXuta3lFqaqvWW1Oej20DR8Mj2GWbIiJ3r
 rFj4tyswmHOzh96V1rGIFNeMSS28jETacymsTITvH6gvUEymgA9XrN+pU3uXhKd7l+YcMjELQ0v
 8DAo8FemqDHqnMQwR+OYHORUZ7CAZDt7MjpYBFHQ79TKyBUubAy0P65uvqZC4I4Di81+T4hPcvj
 7C17vA+SNgdy04uiTn8LfLCS9py9FXY1OuYY1qxuKDHfQABrHJWcqlJOipdIE2eNpEK2rLSNOku
 ZBHSkumDWWY/NnkxSCvkuJNBsR37LTb18hyQyKcKtbRryt5KF4MBY8Dqc7sJTxOlq/hozCFMKK2
 Nbe9PtW6dnBoZpigxhhL1e5fyPHchmK9XXWZDwY5++RnXK/j8xSdxzIXiHXmtCfMvuuIRlkC9Et
 XvVzltWFlIzKURUIOmA==
X-Authority-Analysis: v=2.4 cv=Q9dHcI2a c=1 sm=1 tr=0 ts=6af5840a cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=TCVveBvLx2__rFtw55MA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 adultscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120036

On 11/12/26 10:15 AM, Bartosz Golaszewski wrote:
> On Sun, Nov 08, 2026 at 01:23:18PM -0600, Bjorn Andersson wrote:
>> On Tue, Oct 13, 2026 at 01:34:45PM +0200, Bartosz Golaszewski wrote:
>>> Note: This is v7.4 material and depends on several patches that are
>>> still not in linux-next. Sending it out to solicit reviews.

[...]

>>> Dependencies:
>>> - PMIC DTS: https://lore.kernel.org/all/20260929155152.1898666-1-shengchao.guo@oss.qualcomm.com/
>>> - FUSB15201: https://lore.kernel.org/all/20260916135918.1017527-1-shengchao.guo@oss.qualcomm.com/
>>> - USB PHY clock fix: https://lore.kernel.org/all/20261008015017.3359804-1-shengchao.guo@oss.qualcomm.com/
>>>
>>
>> Figured you resubmitted this because the external dependencies was
>> settled. Apparently not, so I had to back this out again after applying
>> it.
>>
>> Please resubmit once the dependencies are in linux-next.
>>
> 
> The only thing left is the FUSB15201 series and it's only a run-time and
> dtbs_check-time dependency. Can we proceed with this or do the repeater
> bindings need to go first?

We could pick it like that, but Krzysztof would reject the arm-soc PR.

Konrad
