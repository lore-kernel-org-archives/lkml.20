Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792569387;
	b=WzBNEP6eUWS6oQF9BTY/y1PFzYGJ6MudJARfr+l7jqwUdkFf4AQdo7v5D5/2/SUW7qzJ
	 0ZHP2R7gAoAC+REsh+DtISLqBj5m0GxYWmSJtKKizcmJsNzjwBZ8ye2nI0YxGlrbg7pjI
	 oE3QvsEI51prToaIhSvrM5vQqHgShqP663MqEKw9VA3GRP1G6yTnWsCwikAOG7A5JHe5B
	 t27QuvQ4YaBOW8qapdTwptUn65N3ZA2Ve+jJHhz8xF3EsU6b7gX2sTJ3641AqDU9pxuGc
	 wlwcNm5aJtik/06ldWVj5OwasYs8UpIqcriAZPF3SNzwKCB/yOBmQxc4Vy3fl2hP7iA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792569387;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=VtRi6NOkXIi+aaB3jGkA45qxJ9Ov5814u3vrzyc8hMY=;
	b=fFFiZnv4drodJIP0pRKYJlDUREB5xBusPfNRQiXZH5yosg9AB7kKEYipCQ3LHbv92J1E
	 GtOt+QB+9f7kPGgiorY+PrpUhrxNJzALXLbRvmoDCR2/ii9x64yCfQRzx9cjpK7kugE5O
	 +OzY8nnWkK9rZr7LNOZQmKX4So7yldjBmOkdSDzBP8TvGOLdXyZogMIuMCmhn61SztWeH
	 HIzoi/IwQHvy67FhniYfIZRWp6oMd+K6x/VguocJkwIKn0ZtzspAKTFxFRHXbt1tqvPlG
	 7YM4hz5l5ShPsgrDs6MuOfwEulwBZdl+GvJiR5HpcjoScHg3TO20dpxrbHWUNLTyzEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="CRh/3UNl";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Cw7PQG2K;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15DBC606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 07:56:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15DBC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CRh/3UNl;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Cw7PQG2K
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L7rcsC535989
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 07:56:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VtRi6NOkXIi+aaB3jGkA45qxJ9Ov5814u3vrzyc8hMY=; b=CRh/3UNlIucC+zki
	MtYd0tPvDejrTamQIYwzAE7rCfb2L+JzDmLk82ApMX2kPsN0hzhAgom0xByAAQL5
	88WIyVZlAi6m0LGr1FxzDzwdcTQlxofPmulB0ZlPmyYOJuNUUlk6ymj2aZx6QbDi
	9WPkc7B6Sj3Rt7yJdWbqg75JjNXa6MEYv2irL7B43Z+nNeLd5G1nIdjZwWByqLsW
	El3rasoS6IMyFjFi4RRhLkqDsgxC3NvShpqT8Qh/T83XLyjyCMuVlJOns/C0sVYX
	Rdf3KQerpIckRa39IHtsr+D+6pUzyFWmo/LINx81+nQOHfVOEcA0fHkdS5FqRjEp
	6uqfhQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hedajjp7j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 07:56:25 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93ea6b66e53so14177185a.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 00:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792569385; x=1793174185; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VtRi6NOkXIi+aaB3jGkA45qxJ9Ov5814u3vrzyc8hMY=;
        b=Cw7PQG2KIjPke8dKznkPO7J0GlsLQIkLq85aYVwQwNM5p/Uo8cFRtvuibpKmEGqrTh
         DkXU+Ktn8ZCz50pU/m1611qo6tGJCqYRqv30CxRBW0d73jvvgUVuOIUaqxikCGZRn2Cw
         mDbuBR9PWAgJeqfDKdJ+NLVhk0cQwTRP0AGlAHapaPjqQOXK8tcxs5cAq9ZRm7n2jmzy
         G3edI8JbhXb9T6oTiucKhPbi5f9E8K/iFJsBTcwzv7V6ucDkyWqnZWr8AGnE2OHVTMBP
         8bNM4THI4iE082n5V3BiHEgJZJTyYLE/Vr28EU+Cot7oZBqYlgQ/ptlWJJdB8m4n7Me6
         1z2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792569385; x=1793174185;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VtRi6NOkXIi+aaB3jGkA45qxJ9Ov5814u3vrzyc8hMY=;
        b=OAkEnlff8k5xLlbGz/DkRCbKwJXHXcWEOEcI+ooZhLfRmwJXXWCV2VPS4s+qjNtdmh
         P9xXzT5dhrjGuutguqoVildA3tLKdPQCGTRkHnibzstbvHjPggH8JYQLLdLK1LJv4EOn
         BUZWdyQVtOHkEGGiOQf+9deCAR0sRW/WF9rcw8fOivD9ND7WxI1S2sex9vGDTj1Huhuz
         yGqtFRp3FijtcpSLEKbi34sdkYkKa98qFYvqskJW8IvvBMm2rzcEnjxyLkTV8nCIhkBK
         BpwyQZk3Waecf6WSP5Lb7yIanX18UAh/5V3hHV71tWm5v5U+XG2ftMB3ktkFbfTY3yD6
         Fnmg==
X-Forwarded-Encrypted: i=1; AKwUvBz3+AHY4sV+32+cRZMljIlVvGkzVfsqbmlzAvlzPi0kGvcfySZGwlkDT+RJq9B4KLDpHrmA98S6aKzQW3g=@vger.kernel.org
X-Gm-Message-State: AFq9FYJsSTuTDtz5nlLuDG7ddJkFQsIkFdy0pPCFx3qsbjYBfkCekzii
	4p9fvfvEYmjlG7JRzsic63SgjIx1VmQE+NdSuGSYeZd2MrkeCJKYNXJ8sOvMVcEeaBOWCCNsE7A
	eZ9ogArrtKVotoz1/3f5zUaukQ1I5nSEHxGtLTyLLvoB7Sn4m7Vbi6Dv6bPSsYfkqO5A/cY9zsD
	hFvidI
X-Gm-Gg: AYBFou3TVq1U5ee5OWIxs2PCTQiWXiQ2XHmwBb4sQnbTAqiHurbgJnOBqUhh1qBvdK9
	QwsfuoJtRlyVY611qZlrrFFUEnLr/mFqaXJ4HM0ABhXNoiKUapEZrSkLnBO0mrQZzGxSph18IdL
	r55qayHWND3CAwNW0kOvozUyI+DNnMbL1/RdKnv4OK0ZwtSLcnWloBTx6KU5IATZVv6lINkC0cx
	z7HIPRLD398tkj8mk3FaM/YEj+pgXjkWh5PY1iBkEvqO6pBrTyfP9YAR+Z4strhYXpc2gdxE0zu
	g5mvc5NqcRH+ts/z3eLHnq/B/ClvftzhZoqgLBc8MShuN8FEhSu46eVnLJ2sWSki2fEQvG9W7f/
	rDkNGkfbV58e6t/Nwps/2pA==
X-Received: by 2002:a05:620a:6844:b0:93f:211f:7ba4 with SMTP id af79cd13be357-93f57fb9f56mr317895685a.5.1792569384901;
        Wed, 21 Oct 2026 00:56:24 -0700 (PDT)
X-Received: by 2002:a05:620a:6844:b0:93f:211f:7ba4 with SMTP id af79cd13be357-93f57fb9f56mr317893885a.5.1792569384549;
        Wed, 21 Oct 2026 00:56:24 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4030dafd6sm564712a12.7.2026.10.21.00.56.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 00:56:23 -0700 (PDT)
Message-ID: <fa8e5c37-3663-4576-9dbc-db655038823b@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 09:56:22 +0200
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
Subject: Re: [PATCH] usb: hcd-pci: avoid double disable on surprise removal
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261020-topic-hub_pci-v1-1-bccdaef0344f@oss.qualcomm.com>
 <a25e2100-e01f-49b7-b794-da1027dffedf@rowland.harvard.edu>
 <01f4dc0b-8ed8-46ce-9ff3-df811bd4b84f@rowland.harvard.edu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <01f4dc0b-8ed8-46ce-9ff3-df811bd4b84f@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzMSBTYWx0ZWRfXwC8atRBa7z8L
 ezLilVT54xZHE/rfxLwb8K/4d/t9p3lYUC+gmi8WTBywWcCw28uP330JNioFHiY2ZBq3wIi9bHX
 34/N8Lk83iw+Z0VZqBdtZaV9aYH+eBlmYLnDPpd2leezJ4ve86KmB0Y+e9EHAtGLmJsjRKGFpSn
 r7nk3a5zLpnIrbdjStXZv+Gui9UgDDBRq1uACYlHBNvSIPsylK4OpnKW++euZomgOCKZWw0P6JK
 11Hmt6XZU4pytpap51PzkVtIDgRzgAjvSbOXEOtYm67/5qRwYp9VZZydNuaH+CqPD3HsCoucOC0
 /E59Prwx4cY4qCkK986eUqGRxgtdD1N1dQ4tU0cT1BAVBnMySMQXMIkY9pmUuGsyUKb4kEKAdpD
 HuswUryOpkRWQnVoNoEwanY6F1PKDvd3+DztP4OtoX0+7qr77If5iB6DceB1FEqMExDlfn2x0GZ
 SpsD3LuIlbFt2QVyCqg==
X-Proofpoint-GUID: YvLrX2DS0FPBowLN8I9njavDnc56O1EK
X-Proofpoint-ORIG-GUID: YvLrX2DS0FPBowLN8I9njavDnc56O1EK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzMSBTYWx0ZWRfX04faqAE03t5O
 XsaCf+b2YeTIDY1IcccaezPORcKTEZ/nZGzsul50dsGvTDdpRGyJG4nYrcUmlPYQV7cFP2JNdtJ
 +b8/uCgVeb3er8Ez13onHSkCVQUA6r8=
X-Authority-Analysis: v=2.4 cv=HrTjiETS c=1 sm=1 tr=0 ts=6ad87029 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=Hy5RNq0q4uYjtSN2GX4A:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210031

On 10/20/26 9:55 PM, Alan Stern wrote:
> On Tue, Oct 20, 2026 at 03:52:28PM -0400, Alan Stern wrote:
>> On Tue, Oct 20, 2026 at 05:05:39PM +0200, Konrad Dybcio wrote:
>>> A PCI HCD can be surprise-removed after suspend_common() disables it
>>> and before resume_common() re-enables it. Avoid a second call to
>>> pci_disable_device() in the remove path when no enable reference
>>> remains.
>>
>> Does the double disable actually cause any problems?

At the very least, from drivers/pci/pci.c:

void pci_disable_device(struct pci_dev *dev)
{
        dev_WARN_ONCE(&dev->dev, atomic_read(&dev->enable_cnt) <= 0,
                      "disabling already-disabled device");


> Also, is your patch any different from this one from two days ago?
> 
> https://lore.kernel.org/linux-usb/20261018164134.134106-1-cole@unwrap.rs/

No, we can take that one instead.

Konrad
