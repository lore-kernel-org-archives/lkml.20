Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CE0643CEF3
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 07:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791788873; cv=none; b=tWPY/MCrI0xpP7B1fOKGcifWTy8fBZpBV7xNlXxO8+hwCnOFc2mx7fQ9ZFQWAlv9qCdWXxQtgkuoiAWi7IeqWlh5lOIpjBeQyJLk9fZimGmEbGLn08pTaoQKrwofM5POmNSOWh8NcGyuaOkr5GoE+UCcTPfJuHh6AXbpdxvKuNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791788873; c=relaxed/simple;
	bh=wyIvfO3AJDS7jsg+sAaLI5vGI2NBvE/NGzSkTigIFpA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=surZVVb5ixOt/ipDRCmze49hHaIGWJywxjameUsBnRZ7XqmcTiMwJxb8P/ngBknDr8xW2dNHSNzn8aloBeAShEUIoNv8kSZ200M5HKsURJ1wGvWcLbVv8KSjvjqytSBh2FPUrlFBFsfYxd4MTBqYPlQKfq04UjIS/7GqOP4nAs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HJzQrsh9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UfUdY22S; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HJzQrsh9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UfUdY22S"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C55xHK4068798
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 07:07:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RNKTY4aJcI20ifqIZ2FJrC3/QdSGvuOgdM7YFVDGL0w=; b=HJzQrsh9IvHeO/wR
	VoNVJTjuVOm0bmH7gX6xUrCkUYtkZ/coJTCEj1qfwcQYuCwF9fg0sCnJ9qze2Htl
	6WPZpEljhgJdj4rB3hJpSCeVFlgWjmWwSwRvZXLsKS4DApXIKd054ZkxMsj6awVw
	Jyb6QxF+pNrFLPhVggLst3h+5LJQ2apEQhduAw2yx/xBl68dEN559/YHfOJagJUK
	U7glh1OtNX6bL3hmZU2bFIGVRmH1nDXhS/yKBTT4Prm0iir6a7/p2LHdBLW9399f
	kVJ39f/rHddo19ZOgVHCFiXKDRpLDVOcXFsFGpXEaaf0gexQhWb5MFWkzRJQ2nsP
	HFLZ5w==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7ehjn9an-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 07:07:51 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cd5e8574384so249298a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 00:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791788871; x=1792393671; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RNKTY4aJcI20ifqIZ2FJrC3/QdSGvuOgdM7YFVDGL0w=;
        b=UfUdY22SQotXoSVgwRbvl1MEZdlOb3PZA5Evocmcnu47KeIk7TKTqsS4VvX+oVJ0rj
         8JpM33CXEFM0o7nUzeRnr60ePDY6tu0j8sFQPZ54ZahPAlCUJJreuH7CU0xgTJ0+equR
         AErMuaVF6O5QAGMU5DR92zYN3w+l8+c2lEPbBstoix2BuPoF/HJ9mlkpS7bF8aOz6hBc
         HEuYQ0yEd9zP2beF/wITIP4UjjvfPhUxpDAsjom0d2qIAKMur/IkAkOEmWsko/Lj4I/f
         x0aNCYG+hR5jpGWnwGyp4EfgMIz95j6JM2dg+FbvmNdQkwOmI8KjXLyS8Zga5TDGdUP4
         XwIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791788871; x=1792393671;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RNKTY4aJcI20ifqIZ2FJrC3/QdSGvuOgdM7YFVDGL0w=;
        b=dVbJfmrl3hOht4uA9Jbqbd5NVC6v8O6Zdd0g6+zFscPk5ioPEOw4TRFCQwhWloG0D6
         VSfHwJyb5UFIzHt4KioZbkMKa+ZszBqmifxH/EtGP3M4A0rEhf+Tt9FkUEDJKDzBGkpr
         WCgQj0eXT6k6Sfyk2+WG9nMKRpN12mEidozcVvee+FKrmxWruDFcN96VZADOBoVht1p2
         neu7UafIaocQ6tKOpllP4pRB34lQfMOU3NC5h0xt4FYYdAqcWrZZISAUPr8GNHLq1kMP
         QcposUPyK4dC2OuWOejB/4m9dZo5hpQn2Gb3dVziJyW96lve14G/YtSTAixnhpN1yZtY
         JU5w==
X-Forwarded-Encrypted: i=1; AKwUvByuxC1wfjImlhQrneOHR0HuzyiLQsUYcbw5OeMU9z8JMyxwoGbFqP2DfBlgm5r6SsmmCUXnjxuEZ0K6Bjc=@vger.kernel.org
X-Gm-Message-State: AFq9FYI1zrKqWIJdVk3gJCGCej38saH72Whv7Ic3N94pdTD2/5ZLhd2y
	ZwjuE+3IDmzWwd1mRkWNmkxDoQspllQ/ghsCSraEgUAahz5xp7/U3d/BM4pAIKvYgntU0sXHS6v
	VE+fDM3OvEmhexEC48kDvg0nkKxDVsHEyYlWtpLKskHhBm3AqtpfhcH6PW2XmfF5i6nM=
X-Gm-Gg: AYBFou1Gn8corDAX2LA5twVWglrI+rW5pcOAfqRCDZ+xfMpApkXdQIf+J9FyK18qzqq
	3vx9Mh4w8iMdLNrKUBb3mcinbzseixJHssTis/O7EncA3p7w+CqcnrTKBOL6wu3RarPQ3YNzhSU
	A6JCWHXd08sx4JcM+fxXr4vpmTbubhesYcO0S+YivnV45N9JhdGWyaaXQvdzQOE4x5o/kfhF3DJ
	MKrZ1MX0kXiun3nz6UHxpJA242ua1hLvW13aP28nPCN8bBlJavHZqADUj3/qtHhxu+VbDVJuR2+
	n8hPh74mZQZuWwNx53o1WTTqI5cmzOCVgKSR857VTTk12HqdDes/Jmj7FwvY394fA8nFXEmq/Uk
	gYOV7SxJyi/qEPb7j5dVgJyG3QDn98cLYqwhtG7x/bJwqa8IKJu/woczfQL88gQve+g==
X-Received: by 2002:a17:903:22ce:b0:2df:8fc8:6203 with SMTP id d9443c01a7336-2e84289cdf5mr115605045ad.2.1791788870499;
        Mon, 12 Oct 2026 00:07:50 -0700 (PDT)
X-Received: by 2002:a17:903:22ce:b0:2df:8fc8:6203 with SMTP id d9443c01a7336-2e84289cdf5mr115604485ad.2.1791788869724;
        Mon, 12 Oct 2026 00:07:49 -0700 (PDT)
Received: from [10.133.33.112] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e888808bb6sm19887445ad.58.2026.10.12.00.07.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 00:07:49 -0700 (PDT)
Message-ID: <a06c2618-a2c6-4aed-a41d-9d6f888931ea@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 15:07:44 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/8] ASoC: qcom: Add audio support for Hawi and Maili
 platforms
To: Mark Brown <broonie@kernel.org>,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Abel Vesa <abelvesa@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260923084627.748920-1-prasad.kumpatla@oss.qualcomm.com>
 <arPxJqKoCXfF4TCu@sirena.co.uk>
From: "Aiqun(Maria) Yu" <aiqun.yu@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <arPxJqKoCXfF4TCu@sirena.co.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAyOCBTYWx0ZWRfX79nizmQcuMqm
 P62I+cMoGNvfhMx2ufc8L0j0yfDyCOJv0laVANKX5HtyKogXHHNYQW7whiHLPneBxU2/McCkKu/
 O37VevSc+pzCEYZu7ZSBM0mTq5ytKZXCzBajs8iVYizggf5GWLczRayElkZTGXFfOG+Iw5pF6bg
 MiA6/TbdmxFz894vIC9+LoAqKcsOqqBz+hiYtasYfTjUBV76H6mATeubijh+2Ps6q93gzGAlCm8
 M1T2byG3NyQ2YALi6ED3ikahV6ojK3nIBDeGHyd3BkBZx7/is5lBB/zwa9XqOhBOBZSTZk3+HIy
 jG3k/NKqFvoHbuW6Lo2yATy37ulgV16zr7p/twpMLUcb6vsGXKfIHhUoF/YR1z11bLAnJ3dTL3w
 txIsWqXsZKYhIrgpjUeAPRU9fCsU72LrOsk4A6Xx16ewFa2cpQvf+WbQSz8W9rwSnNg6k7XENWK
 waWTRnLPo3lalMhZptQ==
X-Proofpoint-ORIG-GUID: la735G5WIYsQsdkCxCVnsDrSumF9febr
X-Authority-Analysis: v=2.4 cv=MpTHeGae c=1 sm=1 tr=0 ts=6acc8747 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Awcj7odc3Zx0pgQxwzEA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: la735G5WIYsQsdkCxCVnsDrSumF9febr
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAyOCBTYWx0ZWRfX054abaFZi2Zl
 a+JjzV9tvkdmos0qhYzVh66TYXWh4qo6adCFr01kBpZ0kysKaUrOk2w1iUEOX9Pqr2701ci0I+S
 OQuXPNcI8C1X4tUYYiVFP8DQ+JIhTM4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_02,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120028

On 9/23/2026 11:32 PM, Mark Brown wrote:
> On Wed, Sep 23, 2026 at 02:16:19PM +0530, Prasad Kumpatla wrote:
> 
>> base-commit: 6c58e38b255a3e0c11e513e3b8de85eb26fb02b5
>> prerequisite-patch-id: e6735f29343dd80d0e7ad48b6874eab4a5d7efc6
>> prerequisite-patch-id: ac7bc5ad958bb392a57871dde1f79c2fc520d482
>> prerequisite-patch-id: 332b888996b9d6c58e8c90eada37dc14137755ea
>> prerequisite-patch-id: 21e9dfd02f282ea4239f12d91ac8a2be76aaad29
>> prerequisite-patch-id: 52f17e16e09853e366ecc3da2676654df79daf06
>> prerequisite-patch-id: f0b1cd1f1f8daf0e1814a338446d493d64c9469f
>> prerequisite-patch-id: 29a1620a2ea61c0b7b052220e5ea522b1fbf2ad8
>> prerequisite-patch-id: 0872295385e6712bf342d84f095ec3710abde8d8
>> prerequisite-patch-id: 69807d41bbbd6177da4374639ae280501f3f60df
>> prerequisite-patch-id: d9f8613cac873926d6d2fd77e45002d34954b434
>> prerequisite-patch-id: 446fe28b27dbf5ce4240704d89296a5af69e8b21
>> prerequisite-patch-id: dc5ac9645789f25b3742dc4fca08dab4c1e4826d
>> prerequisite-patch-id: 0521512205679cad2462ecda959239aadc48cce6
> 
> As I have repeatedly told Qualcomm people please stop sending me patches
> that don't apply, please collaborate with your colleagues to get
> whatever it is you depend on merged and once that has happened send your
> new stuff.  Qualcomm is sending a very high volume of patches, they seem

Thanks to Mark for discussing this with us offline during LPC as well.

We now have additional context to share. Since the SoC was officially
announced on the same day, we are able to upstream the device tree and
audio support together, rather than upstreaming only the driver support
ahead of the device tree series.

Therefore, we don't see a need to hold back the device tree series and
would like to include full device tree support as part of this submission.

> to get limited review from other Qualcomm people and progress very
> slowly.  I'm getting a lot of Qualcomm code sent to me, in hard to
> manage forms.  Please also consider helping out with review of other
> code, not just submitting your own.  This is not directed to you

I also discussed this offline with Prasad, and he agreed to provide more
public review feedback going forward.

For this specific case, we learned some lessons from the previous
series. We intentionally based the Hawi binding and driver support
(LPASS codec v4.0) on the earlier series [1] for LPASS codec v4.1.
Although there is no hard dependency between v4.0 and v4.1, we felt this
approach would make the changes easier to review and provide better
context for reviewers.

[1]https://lore.kernel.org/all/20260922-add_shikra_support-v1-0-6c6cb6444caf@oss.qualcomm.com/
> specifically, this is more Qualcomm as a whole.
> 
> I've dropped this for now, please resend once it can at least be
> applied.

Well noted.

Those dependencies are actively being worked on. Three out of the five
patch series have already been applied. We will monitor the remaining
dependencies and post an updated version once they are ready to be applied.

More details of those dependencies:
  [1] ASoC: qcom: Add QAIF AIF MI2S and TDM DAI support (applied)

https://lore.kernel.org/all/20260918-qaif_dai_id_support-v1-0-ed863c0e5e45@oss.qualcomm.com/

  [2] Add LPASS VA CSR HeartBeat pulse clock support (Reviewed-by)

https://lore.kernel.org/all/20260917-master-v8-0-823d2c5d090a@oss.qualcomm.com/

  [3] ASoC: qcom: Add shikra and Hawi LPASS macro support (under review)

https://lore.kernel.org/all/20260922-add_shikra_support-v1-0-6c6cb6444caf@oss.qualcomm.com/

  [4] arm64: dts: qcom: Introduce the Device Tree for the Hawi SoC (applied)

https://lore.kernel.org/all/20260923-hawi-dt-post-v1-0-e41473b6298b@oss.qualcomm.com/

  [5] arm64: dts: qcom: Introduce the Device Tree for the Maili SoC
(under review)

https://lore.kernel.org/all/20260922-maili-dts-v1-0-ac2b1b76bfd9@oss.qualcomm.com/

-- 
Thx and BRs,
Aiqun(Maria) Yu
