Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70CA739EB5B
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 07:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788853568; cv=none; b=aqqGjvzo5gjpua5S9bzRMs7gjwfpPRKzDcPxZWMyBgGw2a52q7MH0ohyxhRzSSXKXzOFK71LtPSopiG5vo2AEz8WZ1JWNEDbz3DXfq2tpe7acKOpspWs3+LMhwe3+IXmeBMOHyZkHYUcoFQsALyXdkVIdn+t6kJEETeW2eIis5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788853568; c=relaxed/simple;
	bh=/k4NN5ZvigHEWII4XqzAhdsnLMEvGB94IbEEYRspaqg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WqBd8fx6gnddRbdvGzk8hSNVIIM1urIkHk93pUX8KW0nmCO3nwrJy4xhEL3snJ5ZkZwrR4yOsBEaaJHU6s6VNgnfckJwiB1cf1Vu3ueEF/NAm4ROuYNSNid3n4E8ipYYWA+KS1DwqizmeAoLDdFnUcO2QMqgxFbwyn0/gd5w+p0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JL2MWCYw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NoROWcjx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JL2MWCYw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NoROWcjx"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6886MAIl2363464
	for <linux-kernel@vger.kernel.org>; Tue, 8 Sep 2026 07:46:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CPPlan7RPQxL6Nh+mwIREZZarwU6eqHjYUARcNl/4rw=; b=JL2MWCYww6RCk9qp
	Uehibd/QxrMCX9h3MWfCq1+l1F0hArj+Mrx6WfqzebPX8b+dr+IDCBpP+fr8Xbt7
	0Dhvl+dJTA4tr0LZynrjuKsf03sqrpTyYQ1/uzXHnQim4HYyMKJ/OWi0ACIKwAzt
	2M9xeUsyqPzq1nchMGhggph9XV4jZ74V2Yh9uwL0XUrdDLhZqHAtt4PA3O/Yh1vi
	OZmLOex4sRr8135PA5eLj5e3BFgEPb03c7vas8InzTzoaIWrOQzZVansSB1HmdtF
	q+mFECxz/ODNv37JbJQzlrkcU5HQKnnN05DwOfw4ztAladQn35MnNysTKmPNu9Qw
	Tj9JgQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjagugw27-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 07:46:06 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9349ba88188so42052685a.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 00:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788853566; x=1789458366; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CPPlan7RPQxL6Nh+mwIREZZarwU6eqHjYUARcNl/4rw=;
        b=NoROWcjxcOBZKlU2kkE92OgXmHuwzFYsX4H6812fqw+OK7bNiD24s1NgY4q7bSqPF4
         tvG0+SZT+YNxs8tDSN3GhTNLHmAz23pLFdTnIkN2/X039PbkCDitin5TQZUKeohyHyPW
         Fui33S8yydFbzcz7eHvmJzL059bcy0JxDOISS2NY+U464brLBungQONXahsCCFhKmYS/
         RWi1FaWpiyd0ypgZd9mQeTK3H7w8BvLSavfKaQlr8tZzVN2vKjM5EeemobeWJKGmaaV5
         7/0SSmuLYP+8gspYzXz8UXKKDtk+1hxArnlhxbmyZ9hGx8FYJE1uaFhL2GZJcfo+XvLn
         lsGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788853566; x=1789458366;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CPPlan7RPQxL6Nh+mwIREZZarwU6eqHjYUARcNl/4rw=;
        b=XVFyLbAK0jFiFexVLEeM6zYMHO6s7VI5J9ysePq++tDz+pzJx3JPfJ85Oh/OO8cF3m
         iMkib55d123nc9FSJ8C0JmYZyrcD83ewR7mB6At3iXlZRFqcWSQJd6EDiCRi+oLaTaSc
         RQjXx5xzB8Sef+iFQCiyCI5kvfgpzMqV6/SEl18326ta5pbXuR4uhPgc29BSZ/Ntmu1N
         JiZu0ffWwMIJ2bPhhQLHyzb9hsxKMsR43emyJ15g3eHtvwCA4xLcovG/LRDwzmCdLORP
         J4kErGM80ojQzMkPfy+UGU/JvOCpvK6HbVWsxmfcBocjIgzzY2sgFpxgSF0nexNRo/Wo
         uFCA==
X-Forwarded-Encrypted: i=1; AKwUvBxk1ETU7iW7PCXGxDgNq55EbAAVfrxNnMrBcvI1E6g+o97TorRRBOoyz44/YJBBS1QsZLReubOCh5qW9gg=@vger.kernel.org
X-Gm-Message-State: AFuF++mfTaIE2OqdQnmJqf6SZDCKwipD5gHvV23vTYN0megXa38WuB0q
	Q6RC2bxMlfkL3rrctqtx4iJcSSYY7Yy1FnJLMR/Ytd8pOxQCddqRdLzofuoBhyZHzuHPgmgxJYd
	EHPoR1gwuqEjDTRNu+XEywlp0dBAsOyfu4ZILeJ1QLkXKczpS+UtnusGGfjrnH1+WFJk=
X-Gm-Gg: AYBFou2joGl40ALIIsudN5wJTeU8J+2QQ/MYnFG8N90aLMNCCBVD3LrD17Laj+ij4h+
	YwGkoKWmh8JhjPmLQW5pwKI0zvQxCVavuQeAb4E0DQLmquk/unRMSU4qZP9uAcRmodKntMyrlit
	dkCGrcMufQnuoFiODpD4M+03YCjYCPoOH9v6tQUOddRrRJj+Ogjj7z2FBs+lvlgXPquRCZ3lSO+
	YlK44WJNY0a2SEePvL6G/oYKtAo1/x/kEhLfNl4L9CXMozpJgqNP5nw0jhqy8hcy52C0EKxarI8
	e0IEiY8552SrRHN8nVAmuvyDVTl96eLtJg9GTQzvFwPAuA7w0wh52MwLyfaob6+rMxUOnfcUXk3
	QsIHxMPBo7l8o1zR7cNGIew==
X-Received: by 2002:a05:620a:448b:b0:939:8148:1e3d with SMTP id af79cd13be357-939916fe312mr1637853685a.2.1788853565779;
        Tue, 08 Sep 2026 00:46:05 -0700 (PDT)
X-Received: by 2002:a05:620a:448b:b0:939:8148:1e3d with SMTP id af79cd13be357-939916fe312mr1637849385a.2.1788853565166;
        Tue, 08 Sep 2026 00:46:05 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d036440sm571202066b.5.2026.09.08.00.46.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 00:46:04 -0700 (PDT)
Message-ID: <14bb6196-8274-4c94-922e-4ec8e2d7f2e5@oss.qualcomm.com>
Date: Tue, 8 Sep 2026 09:46:02 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/4] regulator: qcom-rpmh: readback voltage/bypass/mode
 set during bootup
To: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260801-b4-read-rpmh-v5-v6-0-9fcb54928523@oss.qualcomm.com>
 <20260801-b4-read-rpmh-v5-v6-3-9fcb54928523@oss.qualcomm.com>
 <0a73bc50-71f4-43f8-9d95-14a763d63c61@oss.qualcomm.com>
 <5b2yo644hjtnyue42da6zltxpai2hlod3verxbkecbmmaw2ktj@6qhufjoik7kw>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <5b2yo644hjtnyue42da6zltxpai2hlod3verxbkecbmmaw2ktj@6qhufjoik7kw>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TqLWQjXh c=1 sm=1 tr=0 ts=6a9fbd3e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=adMJ7yc68CmF4DSecPsA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: gXMPQpwR4RhnhLknP38j_dLtk3pjhpZi
X-Proofpoint-ORIG-GUID: gXMPQpwR4RhnhLknP38j_dLtk3pjhpZi
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA3OCBTYWx0ZWRfX9qCZjSuZD1rR
 R71Xzz0OOyceWh8KOzLYE6JUhWbLgOmpKR0sOwhmXbfO2P/Mcqt6XivFXYuCRJGQYSB9JaNpmsH
 hrfGfrOwgDXaZg/fAEFBq+miwb7OA3c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA3OCBTYWx0ZWRfX21uS0XHk/cxt
 iAyqlcYa01Vs2I/G6cvTQmNiDFJiheygpZzWatfVe6ocU13+lnG+glPK5+61aiKeTZYh23jx2UH
 ZH5kfAaI9z147MvIkVdzUszU3X9MhMEarYHoybh9j/2r6YhfkrbxfQVyIKPqmkYPuT3BW/6tjVz
 tSrfbyvLlJzebNHRNMxfbiH3bHHaBURALB33j0Q6Gz9LJXd4C7jxby4tnMw252EK2YgFqBUb43i
 N8g60SXyTy8LIZJh3IC1vYNbpf68dWa0de245M3MdtYfyaGTCIMfNE7u4AhChzv+rn3NXQx8vaD
 gLz8FYYStItu6e4gRF8qoE94KjZl90oHNGHA4A+tmMXUbh+vpD6Krty4kna7A8o0EHluQWVTrEc
 KFdXcNSMrOovLc33RUGcEkLS9uCwZnkL6R/Q4Kf1rNrCl2kV+jQL5ZdJ1jUl61pcQ3WpETJzykJ
 +94YZKI54MTktr3LWhQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 phishscore=0 malwarescore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080078

On 9/7/26 2:59 PM, Kamal Wadhwa wrote:
> On Tue, Sep 01, 2026 at 11:49:42AM +0200, Konrad Dybcio wrote:
>> On 8/1/26 10:00 AM, Kamal Wadhwa wrote:
>>> Currently, during regulator registration, regulator framework sends an
>>> unnecessary `min-microvolts` request for the rpmh-regulator device. This
>>> happens because in current design, we do not have a way to readback the
>>> voltage settings that was set during the bootloader stage.
>>>
>>> Fix this by using the rpmh_read() API to read the regulator voltage
>>> settings done during boot and make it available to regulator framework
>>> from the very first read after the bootup.
>>>
>>> Also use this API to read the mode/bypass settings as well. This will
>>> provide the regulator framework a sense of the initial settings done by
>>> bootloader and thus preventing any redundant writes for any setting post
>>> bootup incase the same setting was already applied during bootup.
>>>
>>> Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
>>> ---
>>
>> SC8180X Primus hangs with this patch applied and so does SM8150 HDK.
> 
> Ok, i did see some issues on SM8550 but those were mainly related to the
> voltage range check leading to some regulator failing to probe, for that
> this below change may help.
> https://lore.kernel.org/all/20260720-b4-regulator-core-clamp-voltage-v1-1-8e5eec076a8e@oss.qualcomm.com/
> 
> But i suppose you may already have it?

Yes


> do you see the problem with the rpmh_read() or in the voltage range check?

Applying

20260812-rpmh-timeout-debug-v1-v3-0-68c0a40dce23@oss.qualcomm.com

I get:

[   12.735771] qcom_rpmh RSC:apps_rsc
[   12.739294] qcom_rpmh Request: tcs-in-use:YES state=2 wait_for_compl=1
[   12.749622] qcom_rpmh TCS=0 [ctrlr-sts:BUSY amc-mode:0x1010000 irq-sts:WAITING]
[   12.763769] qcom_rpmh        CMD=0 [addr=0x43100(VRM/smpc8) data=0x7 resp-required sts=triggered+sent-to-aoss]
[   12.781024] qcom_rpmh Request: tcs-in-use:YES state=2 wait_for_compl=1
[   12.797493] qcom_rpmh TCS=1 [ctrlr-sts:BUSY amc-mode:0x1010000 irq-sts:WAITING]
[   12.811733] qcom_rpmh        CMD=0 [addr=0x40000(VRM/smpa5) data=0x0 resp-required sts=triggered+sent-to-aoss]
[   12.829006] qcom_rpmh HW IRQ 37 is NOT PENDING at GIC
[   12.843942] qcom_rpmh Completion is not done
[   12.853536] qcom_rpmh ERROR: Accelerator(s) at AOSS did not respond

Neither S8C nor S5A are "special", neither of them feeds an
ARC resource (at a glance, anyway)

so it's the read part,

RPMH_REGULATOR_REG_VRM_VOLTAGE and RPMH_REGULATOR_REG_VRM_MODE stall

RPMH_REGULATOR_REG_ENABLE interestingly doesn't

Konrad
