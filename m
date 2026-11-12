Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794490355;
	b=0+6ODdXokReVAxlStP2MwkyM3X0UjuHjofnyBuSJPTMNIRGDu1pyxfnDfkZGODh99EMx
	 LVCu8TWjcYTCwD0BIsw8VqB1FRXTEEpNYkky0U3c+3jpLU7B4AopT0dcGjwusC+JyqrIW
	 HSoqp8tf2mqUBZ1nKTnUvI4QABCNBusmcluQ9hrLj5KbE/0mI/R6o96vxQA5yuOVynCQv
	 BJCsniQsjay7CFTvX9PV3vHLkF5rmaD2aBF4QMd8zbsmwaaVXSbEJq5JB9iYotG//INR/
	 qnD16dqbeSjwfbo1hg68uk5qT3wTVAQ3uFyAHSh8wiqoNOCCoZWPUK2EM/gWu9NFH5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794490355;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=L9yXVJlvnIi0O3A1aADezHuY7eDDpasAZKPrrDv5azE=;
	b=mUA5/uEjjoJnZaNxAYOAimdacC5l2jfr6YBykStRYd84CNRNhJ/al6Mw6NHiF90HX4y1
	 Nly3T9u9PV9cjWW0+28HTBk8zoLb0kuNsfhbyxUEWRaY2y6+AQrhFCddQcHkQPsk+t67F
	 MrYL10XYSXPbDWQ4T7Hvp4mLJEp8mpImOOfIrHw4J59aTrJV0eaANVzk5B7jzfnFkGmcb
	 0iSwE6QuN5TP9g5zTcv071hY1RL4EBU3m5/3zJ5cLbdQMdaIW1B81eFTB0RaWlfAFfVim
	 +AkiE6I6NaHiIR0/IquIg0f9rjHpMAqLuim5NCJSXxglX79GYBqiMpKlX1FlAtQ+ZGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=H6RvHYjN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L5X6P+jh;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 929EA606A327
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 13:32:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 929EA606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=H6RvHYjN;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L5X6P+jh
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACBhPAw441999
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 13:32:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L9yXVJlvnIi0O3A1aADezHuY7eDDpasAZKPrrDv5azE=; b=H6RvHYjNNjqOJOAi
	M4V6IlTSok0SApN/vq7rMc9JX615Ss4MbGhL5Hwrp8L9+CmiyJWMimzuAQ9ZLNhf
	mugRDTOTe6gQZTn34iVxh3Cg2g1BkNo790ZpN8ePlPZzUOq1IfmTIGV2POF/5dUX
	R+Ki7rRFpIFo4eCWbyPK7hpBp/Nh5hv5xLUKIC4aDpYXrimZo3rIroK8ByHilqS+
	UXNN+kR9MBE5rRIAkSIPNWzIbtvc4krm/uuFJk8OUb1/rAeMgcGiZwXL3n6GEOnj
	IuHVqT3BSaawMNEPcJB/6foUELfmvcGOwNq+BMCrfKQ39KWT8lyBZ52iYu+EhfpA
	/EMonA==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw7nc1ms3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 13:32:33 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5ece56bfeadso3559103e0c.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 05:32:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794490353; x=1795095153; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=L9yXVJlvnIi0O3A1aADezHuY7eDDpasAZKPrrDv5azE=;
        b=L5X6P+jhJ1RKuVyG85YpHcptVAQtIU0esAwNJmsdXPUKFNdSedOw4BaIrpEkhkCLR4
         0MggITV2x3OWGouZnvMnOMQBMPwLja2jq1DSVGAAtvNs/X6UGWFLR5t/Zcjf6choEzPO
         T5hTQwRsn8azfeqqedN7IrfXKZUJpxPFxqJHmJ3ro1uUPZrciu7gyVdGkFMNUBg7CijU
         eArnNw3+UhzY63rFtXn2/gkiZaQMfwvrjA5YZkUMrpVwpwpgG9IgXMG8kO1Hbj5E9V0h
         J1nALUKDozoylV1HY1Ru34bxX34I+lr2pOuSq4mRyv/sAuTwA6NFcuAEkCsnPysK7bGm
         0Nrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794490353; x=1795095153;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L9yXVJlvnIi0O3A1aADezHuY7eDDpasAZKPrrDv5azE=;
        b=WlKMQcvO3nf0KV3/KC8HOz8mM4b2fWMRXTvARI72hlyfBsQGPwckmJKCxsKa1ntqga
         BWW9J+URsGq3vfKzlQxqWVoEQFU6scI+Fbc+RvFqq/m+ltEr4tN4gSdt8cbulmzl5gyL
         JTllgnVRaU9M8MEOvTRJBa41Rm2xmhkQbMj3PprCNybBS3yFYnvQA3U6+vwA9QniDoQ/
         4XUkrXTGi+3h2GQ5QXcYdfgEMTm08+GwzhkML+oE1HZ7Fgu1Ipt2E52WWWblI+vf1e47
         I0T/3kkaeCI3q1Lek/nDCczdHJc/oISpEF8/D2dsNxPhvrQ+EUtQaN4HHDNVBboR5I3x
         vNfw==
X-Forwarded-Encrypted: i=1; AL+hErFr6AF2Nivd4a5LMVXAAP4eio54fBRg1NQL/ZQRE81NdG6YpDGCBtdz5UKL9PGTsTVvTLFoKXpTwNmfl6s=@vger.kernel.org
X-Gm-Message-State: APuU4Z9m7grziMCo/LtVrAmUYX7zYemTY9XA6s1MdR3tc540Vt6Srufm
	p8W0kSVAHzvOiU7eEb7woFL27+7Mx+bAlHt0LhTk5HbboRfd2SfaD34PtOf/jPZmwzzRbPgH5YV
	kjBOUREL+ZL4BXP8n3Eiiw1LxpoJJ1lW73mEzlUjm23gyT8tocR/LBVvL6VPs5YvQSQU=
X-Gm-Gg: AYBFou0VhgK2vuJ2lxDN78GUUoRYHX5qGFcIsFejdKx5L0Ig17Pyzd8XZ3pSMM0dH3m
	r7IHk0hayPkgMAXTDhTBH62S9aHLZST2MARTdmcCoIMiKjq5rfJ13Kvpv1Q3kmV9LTxplPk8Gls
	Izo3DUcqIPIKdZOG305lqZh3nk+bPVR/HDAwIoSy4xQ8iqVIRMJo9zgdAeBzF1Gy5jdPtj32U5g
	EYz9feIfVoHpeqfHm5ay8aeryL+XxZGOo+gT91/n/BIlcbK4cJzTF7rRoYhJslaKbq+BpiufdED
	66hUPjUTWzdOlVSv7cp1RYZaqfysZL370J1S2fjxTTpkaHQC3TQGCaLycgYHkeN2OHT+n+252kS
	y4UBobpGV4oFI6K+IlTRFhjOhv+uAh66ruNn+GkiBMX01WjLIk+KqI+t+bGgztg/nWiE8nULZxM
	qNJZq1LNZUFKSd6hty65J2F7UAQ3yCcNTI9DhD+9xzlqIsUmuqOYJRsLJmpVyRUkvZ+4+TC92id
	yDqyNxojD1BYtuiL2nR6uac58cEB3cBuhOBwRBbLGOb
X-Received: by 2002:a05:6122:e153:b0:5ec:5f1b:f725 with SMTP id 71dfb90a1353d-5ee1c4862d1mr2361236e0c.23.1794490352721;
        Thu, 12 Nov 2026 05:32:32 -0800 (PST)
X-Received: by 2002:a05:6122:e153:b0:5ec:5f1b:f725 with SMTP id 71dfb90a1353d-5ee1c4862d1mr2361193e0c.23.1794490352219;
        Thu, 12 Nov 2026 05:32:32 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a6a4195sm339950666b.86.2026.11.12.05.32.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 05:32:31 -0800 (PST)
Message-ID: <6876daaa-1e9e-4f69-855f-53dfb2b8a7ee@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 14:32:30 +0100
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
Subject: Re: [PATCH] ASoC: soc-core: start rtd->num_components at zero
To: Mark Brown <broonie@kernel.org>, Dennis Gilmore <dennis@ausil.us>,
        kees@kernel.org
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, gustavoars@kernel.org,
        linux-sound@vger.kernel.org, linux-hardening@vger.kernel.org,
        linux-kernel@vger.kernel.org, michael.hennerich@analog.com,
        nuno.sa@analog.com, dlechner@baylibre.com, linux-spi@vger.kernel.org,
        miriam.rachel.korenblit@intel.com, linux-wireless@vger.kernel.org
References: <20261112025252.71375-1-dennis@ausil.us>
 <179448342405.66517.5463730214277229760.b4-review@b4>
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Content-Language: en-US, nl
In-Reply-To: <179448342405.66517.5463730214277229760.b4-review@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 1j1wjLMZfMx-exktwsiOsPxvq9tO2HuU
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA1MyBTYWx0ZWRfX+OM11FMbq2X/
 3U2/VY+JT4SFLQGDCEj8QYrgxEjoeYhHIG1r1BiZe0GxayOm1Q38d/rq9gog7rxzY7Xx/8x+HDR
 xQVtiRClr4u1x92gaacrkNuocIN8hfg=
X-Proofpoint-GUID: 1j1wjLMZfMx-exktwsiOsPxvq9tO2HuU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA1MyBTYWx0ZWRfXy88z4xQ/fc3x
 /MfEyZsAuSfyJsYUgafxbx1uOQf9+lXGQ8PtgL+tJJfIIE/WZcHRrekxs7Ytfog1euhuUsTK2EI
 DwrlZ/r1/gP1kq/567K6C2uZh5XT5DRDSQ1StVrwYdseB2eMst0OGX4gJRaSzrVfILrOS1E/HlM
 HZzY+tGg6H/yS7MJ9b1riQ18if24lio2Y2dW/bvdlmGJRA1+vlEq6xQGl+74CKYc402ONKrRKg/
 Hvx5dOgwrrf+nGW49hl1QM2/8g3uUH9EeBGtBA009kYgQY16FsRAS/IR/olw9yJeb3hpVsJxfnP
 7UxPWzbL7gITMLkD2cu+/BAEiKKMvGzkCEeRI5R32MIdiZ1qDLca/8+eBIKcpxXKTAdnaPpEjHC
 vlbVycJQ9+s368LMqPIDdLyD/xYjV4Ica85utol9LIBJFathTA0AWWGFBX+NSKDLd3SUeJ3XBFl
 tWkBi548h3PiAY5vadQ==
X-Authority-Analysis: v=2.4 cv=A8b5rKWG c=1 sm=1 tr=0 ts=6af5bff1 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=_62txuixjVeDG2zLGvAA:9 a=QEXdDO2ut3YA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120053

Hi Mark,

I was about to send a regression bug report for 7.4-rc2 but I first
checked the list to see if a fix was already available and I'm happy
to report that this fixes things for me:

Tested-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Also the patch looks good to me:

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

On 12-Nov-26 12:37, Mark Brown wrote:
>> Since the conversion to devm_kzalloc_flex(), the allocator sets the
>> __counted_by() counter num_components to the allocated length
>> (num_cpus + num_codecs + num_platforms). This only happens when the
>> compiler supports __builtin_counted_by_ref() (GCC 16 here). With
>> older compilers the counter stays zero, as before.
> 
> This doesn't apply against current code, I think this is an issue that
> was already fixed.  Please check and resend if it's still needed.

This applies cleanly on 7.4-rc2 and fixes a regression breaking
audio on a lot of different devices there.

If some form of this is already in ASoC-next, then that needs to be
send to Linux as a fix ASAP.



@Kees, have you seen Dennis' remark about the

