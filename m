Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D10F40EBB1
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 08:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790153390; cv=none; b=dGpDV7I1pHPaNoBS6o8cj1ukeKPWbG/wVFcGIccKlcPsBUJrCgTPyPRQf2VEwCgm51+moQD/txnRLCL08+YfF/CcJ/N2FZcaY1NBps1Kktxu3vyIqmwPtDJ+LbkV+LYMfd2ubrLHWEybzJUBd1OgMRz2IBi7XR1mnlIUuL0683Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790153390; c=relaxed/simple;
	bh=cxzXBbMsdZF9TeyCb10H6lrW1get7uGvkOjPx4zLuTA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=alElwPbQRQWizJpThJ+uj5osjs78nizrTfCULVWlI4AJr1TrUKcnZWCIRhFGOC4EUXzDvRTAQQTojNONRFSilKniuvpdLcJ1+gzhf5pKGiYfAc+BVCaRAHX1HONuYnBui9ElWxzZ9YG1rNSOOyM6yVhkzHLcPv/vgKYm0jPTxKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jH8Qmg9y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AQS8ZPJI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jH8Qmg9y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AQS8ZPJI"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N8JRu53701104
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 08:49:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	utlvqtMchWtCC+XcUEgzWRs3KfFgniwcYifuRa3zTB8=; b=jH8Qmg9ya8OiyBxg
	TzpLC3x0KbJQYjHG2zXS7IbFbTX3tBWK+i4/99z1j2Wo9Laz45fPMQEnL4azu5t0
	gxGpTh9qFHpbLXd1WfgXC3P/DR7VwBE/G/nqtx2d2nZhGyK5XwNyRaDHAXe0b/wY
	3Hi0AXrs9xIk9YOowArVEnpqSzbTCegrkDPfLPVCgTvrJ8Ng4sfLdAngFo5mPZgn
	OGSDBj0bHvni9AZWiTWIY7Lh1Qc2d3P3LSv34Gpt7SEdOT3Buj44WY8FlHpt8Z6/
	GBX4AT9SkTTwmD/ViN3CRYnUc6l6wKSPKZSC2yfdE56rbSGuAMu3cAZz1o540HIU
	BE3F8A==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gv428st2k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 08:49:47 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-9106bb33cdfso1617096d6.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 01:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790153387; x=1790758187; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=utlvqtMchWtCC+XcUEgzWRs3KfFgniwcYifuRa3zTB8=;
        b=AQS8ZPJIj67yCYEx98JzIdQh7dBVWTcDg822/KZMeczRkxZespdS40dOkrh2kdA1vF
         6vPWKPGlBG9qgXw0Ums2MEY5yQOD/LxGyAcDHdcxpgUhPIDGgrORF+ps1yghnmsqq0oR
         X7NAHmWunXsxaD1OT5sFsDtwJwjPRqD4jM7JTabrHU1LrYbWUsJ9Aoj7LFScvi4J0KR5
         xHlDIKBBdHqW6MvMXOKMwIV11wFVCK4eh0syjJOGf3tV6JWpIGFn613QGqfK6g2vrSoy
         /eKVl2o1y5RT2MW8YK6h4IhjGyOA5iCTyxoyN3EDe7+bBNCZHllZ4XLapv1Ik7tVlz32
         5P0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790153387; x=1790758187;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=utlvqtMchWtCC+XcUEgzWRs3KfFgniwcYifuRa3zTB8=;
        b=tBYuf5rekojeQMN2WSJJxWhhNZy8LZdpN9gH5i0kxkiD0v6UeE2XbkjC/+L/TUIgUu
         Bs9P3JoprPsE4JUOyCeUoLBt/1zi4bNWdKYJc2wGUV6fFazYfCrlDd8i/1Fx6OMltylN
         Pi3KwpYSCcaT83VaIM+3LMiDfQz3gJbS9dECj2ReT6ZqtGubwk08vvq9GZhYnA+fmkod
         cnUqXGmITOX1e9HcyY66ZaQ1hFfDAp7WrxAiudqKhvyC++8y2m3gxjxJCH0r7D3PRrU0
         XfqeZ6JUtVE8j3vUaR0JNvb7A4uNWBBxL4ZoDRgSMTDPbOAi6sv9GTNROLlttjDHsVuP
         +kkQ==
X-Forwarded-Encrypted: i=1; AKwUvBwlw0X2ZmlcItbTG50Mq0oQRfV9WMCpklqwJNh9gV97U18jRjqDr8VfcY6K7GtZzptgmQNfECTqIubx9LA=@vger.kernel.org
X-Gm-Message-State: AFuF++nSZHdO+ywfw1JJccY/ywn70UlsnCAcoPGWcOMa0tj+EJUIL8Qr
	CEAea2d17ibalqKOXVRBBdx3jXKD/x6++SwGW0KN88xInmovumzZk8CceEUKsECCx48cDoVRrvq
	CNoMIupqIlwvoMqKMsV1aKULlgnMVdowc19iDKHsNZsJY9M3VlqGeb6J1wl/Vr6cz0dc=
X-Gm-Gg: AYBFou2u8u5SeEE1PC/0LzlrpUSQlcGDLrcCboiEte7P9J9FiwCaMeTKlXqWw5sBgbt
	Fn4RpWwUViZ0Qn2Zg10gy6EPJs4tZ8F0chJsrCDQvjipG+GcNJlpcyLtDh/qg4jv/XR7DoDjVYy
	J0fl4iwS61Vc1lGeWMx89AWUkOYRiJp7yAUGNWlhbYzLUpTkv3bxlfmY8C0WiBFjRB5vE7omyr2
	lVRIlOJEMBagALBYDf3M1JqyeReBP1El94jp39psuz1ZmvG2sIkrEA3jgur8z76aDQU6Tcoin7d
	7lsnE1DHlq1KCqogMgn5EPLBeF3nSjb2rb2MpJ+UnzZ2d5uYboMIdp6otNk2XTRtXZRtn0fw/XA
	bndGZ/u4G8DvXD6/iDJA2GM1fs/eOa93/
X-Received: by 2002:a05:6214:1307:b0:90e:8d21:714 with SMTP id 6a1803df08f44-9140c3d4acdmr34040166d6.2.1790153386694;
        Wed, 23 Sep 2026 01:49:46 -0700 (PDT)
X-Received: by 2002:a05:6214:1307:b0:90e:8d21:714 with SMTP id 6a1803df08f44-9140c3d4acdmr34039986d6.2.1790153386272;
        Wed, 23 Sep 2026 01:49:46 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aab37eaab7sm1171451a12.4.2026.09.23.01.49.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 01:49:45 -0700 (PDT)
Message-ID: <bac16296-42ee-4b18-b605-9ed178210f4e@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 10:49:43 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] misc: fastrpc: Don't fail probe when the SDSP memory
 assign fails
To: david@ixit.cz, Srinivas Kandagatla <srini@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Xingjing Deng <micro6947@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        stable@vger.kernel.org
References: <20260923-fastrpc-fail-slow-v1-1-f3f6fabba6e3@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260923-fastrpc-fail-slow-v1-1-f3f6fabba6e3@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=EZdd0/mC c=1 sm=1 tr=0 ts=6ab392ab cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=MpUze-A7R06OsIlp248A:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: cBq9EoUzUvInjMHtRQbgTw8hUlhOFiB_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAzNSBTYWx0ZWRfX2tbtayepzGAf
 lgovl8Bcd4gjq/ocbKU1Fh5eBnWyef5XL9Pj54JCsPRWDGJLt/+PPbxlSF2PqVLP7kwbdgg7s7K
 mh+cd5mwCcm6yRDzDC030Jg1yrPJtLOiIDyEmOhByeyaYWcIQrhSQynTdCDqoDiBbeLFyE/75xg
 p2NdRzqc/qa8j5e3TaEHqmUysSv5ciTP0SbBtmSwJsXit8mKIg9DLWAaVvseHqdSQAc++VUryJT
 p12IGJhccg/Si4F9BtBbotvan4GATNGzxH3DgrsFqvdvI3rDwmLm7OOulXt+usYUu+LUs70WAAC
 WTIhNvWnpJiZWCSQAjMDdSpz4k5P1kFrMSuhQAYR71Zp6R/XQa/1QbhKlwl2gD/jMmE4whuR//g
 UZlFobnT/J97uMEWgJKBaSP+QX+FLMZVg7OTcf161dV1V9DATURrAUeC5LC05/10X4akg+T6+hX
 pM6ZpGBXB0fEwn9IONA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAzNSBTYWx0ZWRfXycuedYbwpJqr
 9GNn7Am4Un/x18GM1YUvrmTA3Pay1F03lpAklNZ5meAv69dJWeB8j7f4m75MhOP7VB6X828UsjI
 KHqr1TpjsauOPCYy6oOkI5IgR0kdXUk=
X-Proofpoint-GUID: cBq9EoUzUvInjMHtRQbgTw8hUlhOFiB_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609230035

On 9/23/26 12:38 AM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> A failed qcom_scm_assign_mem() aborts fastrpc_rpmsg_probe(). On SDM845 this
> turns every SLPI subsystem restart into an endless probe failure loop:
> 
>  remoteproc3: crash detected in slpi: type fatal error
>  remoteproc3: remote processor slpi is now up
>  qcom_scm firmware:scm: Assign memory protection call failed -22
>  qcom,fastrpc 5c00000.remoteproc:glink-edge.fastrpcglink-apps-dsp.-1.-1: probe with driver qcom,fastrpc failed with error -22
>  qcom,fastrpc 5c00000.remoteproc:glink-edge.fastrpcglink-apps-dsp.-1.-1: rpmsg_dev_probe: failed: -22
> 
> The first assign succeeds and hands the reserved region to the VMIDs
> described in qcom,vmids. qcom_scm_assign_mem() reports the resulting
> owner set back through @srcvm, but the driver discards it, and nothing
> reverses the assignment in fastrpc_rpmsg_remove().

Making it do so there sounds like a better fix!

Konrad
