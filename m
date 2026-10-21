Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792599661;
	b=ZrXGlZScSGYfByi+sKKtOqRIROOiCMBaTW0bO6Ut6TOd9WI2dGuRheze6y7CUVR7cexJ
	 xp6/wixrQ7i/NkssHbHT/r9uUNTrVIAIHXVlLq2MBgBmcH23nToB/O4GZWfRpFCuj9JCp
	 Ox4LXB/jtqjzz71XV3VWNkemEh1JRI8svMlBSTIBalgrxIWc3iQuDRmT5B7WNRlGdaxA0
	 KjQYVFddI01JISGQZzD5PaFqRiheElTZjznmG7/1ccsSJoaukk5y7vzvzDddWJZtZdp/s
	 3VjqxpTqYpuywuSOeVz8J9UJYTO/EH9shIVZgExw6OVLZWHZu5paP398CIc4/xLnknA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792599661;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=3W+k5df5twd/uwIwPEZLuB82lN0JvdHr4jO4Du0Y9TU=;
	b=L5IY5E3BFpeeoOry/BkX7RnANPHCi1OQUwlYhqgWZ0W+Prxt3ntBH2ONg8WnI4EYWInk
	 xFMWX3sGkeO2P0PciOn97zsqenpR1ucibYFF3tpz9tsMLhRyL6xaEr+ihYGIHbWElOrT9
	 hhTTIcepSeVRwLG43LZLrFfRFJfbTgeFPSTL8xPD+dKW9eQhfuctIU7QLKqbNIaWc92zZ
	 d0Vad80SBuh1NeCGINlEl54NupwjCll+jv4y2TC+mJVTECqTFbpPg1ji/pg6sOUq+LN8t
	 0soges3qYUguBHH23oQ8n0R8sXbLKa69VatIh0TcLiOxznLFX51HVMPt7UGHSv2+1gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aFwq3WuU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CQmriEFf;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB6D7606AD11
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 16:21:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB6D7606AD11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aFwq3WuU;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CQmriEFf
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LFTw2Z991790
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 16:20:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3W+k5df5twd/uwIwPEZLuB82lN0JvdHr4jO4Du0Y9TU=; b=aFwq3WuUbVXDccU6
	ImyH2DdBjjpi9JffnMykpYkmPPyflDaD7oOAy+hZ3XZAposKZjUgaDlS4XawLN7i
	kkJxvoDaZJ77FNCLX5TBxEpJST6D/nriLtxkUMCw7Tbm9dakplSQls8FNw6r6Dz1
	IC+RoxfII7elux/+iPoegwbE133XoorW+5FY1mDsbiD/eWS254w0t5syY00rrl/2
	ti8Xgs3kk4c7csJoDWLYR+TT8ziKSocv2B2+e7TtULdiZ01BE2WNtAMCU8v2sBpG
	w13+UuRQLb4WTwrf+lovp+Q6t0acYTpILdljrIJTFFOHu54hMeIVTI3l9T7DfqjM
	WOjU8Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heh5r40fb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 16:20:59 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f2373e9b4so103951985a.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792599659; x=1793204459; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3W+k5df5twd/uwIwPEZLuB82lN0JvdHr4jO4Du0Y9TU=;
        b=CQmriEFfeOG70Q/TgOLioizPnkvqo0SoGbNfA7JY6K5LRyEKWEjp6y/UZyi883KLgw
         jYX+wc0GsYjw6EJ1xVo+3ncRGacUo0JhjTmzbOD1kwyUITETL0DDEMKnINQr5ra5Mxad
         wsN5+VaNPuwfGuKDK78te7hb7dqiOzGgyloA5fseLVVxyxYZp/LkK/rTQOBEjLsFYBvy
         HlD0w5KFCd3uu5OOlzpqXFzZJipZmaJVz6rm9+57bFEk67L6Q/nwdbcKYIhDtOQ3BqJK
         PDbGQ4XUO3S4x0jWIkS8h2IbUXEjhNkgql9kEPALDXUdINWwJlyckXskKsKH/vvA/3HW
         O2ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792599659; x=1793204459;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3W+k5df5twd/uwIwPEZLuB82lN0JvdHr4jO4Du0Y9TU=;
        b=1E83kb4YFKgYvyojSyo6ru1wiNLMjwIES8Wo2hzVKmK6jgwaNVkuhakMarwC3fGt+v
         9BDOczxIUKJotp4wTwqXjQsucecBd1daQ83JI0rHaB7ScfhLGJnd9fQubZVZ638JxA4+
         Qt8tImwraxNvj0oAhFLah3MF8tqaGAkfK1KIc77u9HWQu2SdsJKUkYJm4aI+UsWrCEcN
         Y8vkVpQNdL56HoGd7QnD2AQ+WSluLVrxhD59V1WH1mueWFAVLSpNKf/OD9HfZ/VWPTqe
         kvGUUfZs16dZHomG7RCtt0edBP8Ni0d0I9bRMN7lhhMyVmRXPZwl3GfjGLnjQEQWWiHe
         CkMA==
X-Forwarded-Encrypted: i=1; AKwUvByn08ZWFA5MOQSL6NfoY9ynFNaL8GNTPlPn4+pFUg0QxgqUYRm1Fgl4aM9hUPY4eCInfFSrdmPPf/0JPbk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJU0xjzz2GD/lwNIdON2+m7mIWeKKscZbsGIbKYkv9YlFS9fxRV
	Sr4F3HnxQPs6OY5Q3NXLvgov9KSe5HRq6/7MRM5c81qo171AwOIDjxYlrRQ0gao1T4HoYozVJKz
	HqWxJ7TWIZ6s56YznG9kgDkqqT8EfUaBgX9iq5R5RruU1mDj9vVB9LzY68jjfvVE6snZzWXa95G
	g=
X-Gm-Gg: AYBFou3AUxEly6j00OIo0/0Er+Ybkoc2tioUt/BZC7OgATDghk/5SeM7k2YQhzO8i1B
	L5BoTaeFbjBJ4/8OY4ZcFUfIck2lZmOK10HC2gMHskpcrw+brtCkkElIMpdiwvY02A8sYKE5nKp
	VnEOAiU8K1hB+SCxAbiliMWdHV88U9WS1iDAD9Rz1zRkRu3oM4qs0zgHqXyfN71Bi7GqUTwdU3+
	Wfc2dmzQp2WPi3Gg00IDPrKc8DzX5CTUqCV9Jq0MSx2JRK6AQgeup0xVHDmUExRM7sSQN3cLHTY
	30hH3lkSSaMnLYU26Wpvfc1Q3BkY9/CaTKOXB5KDJrozSFEK9jDqXIO/Cuxbpz/6/HGGijm0TwJ
	9CI4IZhpKyjpLGPJfgjXfwp6wkTs4YQHbjhOFDVJfbn0mmHqgilft1MO211eHWw==
X-Received: by 2002:a05:620a:269b:b0:93b:bce3:5499 with SMTP id af79cd13be357-93f57ebdd46mr452136785a.6.1792599658495;
        Wed, 21 Oct 2026 09:20:58 -0700 (PDT)
X-Received: by 2002:a05:620a:269b:b0:93b:bce3:5499 with SMTP id af79cd13be357-93f57ebdd46mr452130685a.6.1792599657853;
        Wed, 21 Oct 2026 09:20:57 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:3887:4025:a805:2ac9? ([2a05:6e02:1041:c10:3887:4025:a805:2ac9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e25835404sm7092835f8f.42.2026.10.21.09.20.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 09:20:56 -0700 (PDT)
Message-ID: <2d885d41-7d05-458c-8364-e206dab12792@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 18:20:55 +0200
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
Subject: Re: [PATCH v3] arm64: dts: qcom: x1e78100-thinkpad-t14s: Add thermal
 zones for PMICs
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, johannes.goede@oss.qualcomm.com,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mark Pearson <mpearson-lenovo@squebb.ca>
References: <20261014193524.5590-1-daniel.lezcano@oss.qualcomm.com>
 <atH0oW5j9pxsTty4@linaro.org>
 <aca2cd5d-18e1-406d-a062-e219478b243c@oss.qualcomm.com>
 <ath8tHxHOdA7G-Bx@linaro.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <ath8tHxHOdA7G-Bx@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aI5lOr9m c=1 sm=1 tr=0 ts=6ad8e66b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=OaStsYZM47bEMq8ebD0A:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: X5TmgqfeKcAzFODpEZJzmj7Ng7eXymFk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA2NSBTYWx0ZWRfX9Lv8nOQN3Fyi
 FQRNlXMaGSDi56Ac4XRQsGRKPk8l3ofb4JbQDseN+fFgX8HTzqnLWRrajJ00p5N/w4gBE0GS56a
 xGvwFcHxqZRDRtvuxhNb6qJsgUNafqjNH8DEr9naLz+rZFvPkxIzAXmPK84jFLwwpzK0gd5J/J+
 H+t9SMjvWq+VieefivUryxyHe7rekl0QUBiuj1hAvFVhsZOy5D4aEp4Sk8o3ILUNtF0OVHuBRQV
 5g+TAyatb0q9+aZLf8Bwkj0CNhFiuaHmR1kkiLTTuNfb3Mn5es4D0aMncp2Vt8Dx1/SHvl9Dd9n
 A1epp1i+sMLs92bfNI+RQ8k7X0v0y8mut41rsdKbAkk6GHr21OQaOWN5SgKt4FHFzC5+oGhkHPU
 PVh4dDhutfgaT40RdW9NN7hcdvMz+cAEdQyvKBdMQKq6mRAznm3gkn9fD9B0vqa5MCrCBgLQE1D
 96yiEdq74s5SjMcS02A==
X-Proofpoint-GUID: X5TmgqfeKcAzFODpEZJzmj7Ng7eXymFk
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA2NSBTYWx0ZWRfX58WO1Gr7WCkV
 EjPUeukIrBc5mAM/QP+DukzKJoAKfb4CrH47Di9ZdmaFV9Jjhj/uV260FXtrP5p/9tepKV9A4pa
 n7V9gEDa29uYLhL6PRNbkRH49P1C6I0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210065

On 10/21/26 10:49, Stephan Gerhold wrote:
> On Tue, Oct 20, 2026 at 06:08:56PM +0200, Daniel Lezcano wrote:
>>
>> Thanks Stephan for the additional information, that's very helpful.
>>
>> We currently have an urgent thermal issue on this platform, and getting this
>> thermal mitigation upstream is important to prevent overheating under
>> sustained workloads.
>>
>> Would it be acceptable to address the sensor naming and description
>> improvements in a follow-up patch, so that we can get the thermal protection
>> in place first?
>>
>> Of course, if any of these changes are critical for the correctness of the
>> thermal mitigation, we should address them now.
>>
> 
> I have no intention to delay this patch. In fact, since I'm using the
> latest unmodified stable kernel on my T14s, I'm also suffering from
> these thermal issues. :-)
> 
> On the other hand, we are at the beginning of the merge window and Bjorn
> is unlikely to queue patches until that ends. The changes that
> I suggested are purely cosmetic (the names of the thermal zones), there
> is no need to repeat the thermal validation. The throttling behavior
> will be identical no matter which name is used for the thermal zones.
> 
> IMO we should use the remaining time until the merge window ends to
> correct the naming to avoid any confusion for people reading the patch
> once it lands.

Ok, fair enough

I propose the following names for the thermal zone:

  dram-board-thermal
  gpu-board-thermal
  fan-board-thermal
  wwan-board-thermal
  chg-board-thermal
  cpu-board-thermal
  typec-board-thermal

so we can capture with the name the ones related to the non-on-die sensors

Sounds good ?
