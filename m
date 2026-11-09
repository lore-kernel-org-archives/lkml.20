Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794216405;
	b=y0O14zU1pmH1r9J78DgYRSJcMuTtgogl4XXbvDVMOdJuDPkVKGxPQSruGbYxuEHyaoud
	 FrnROg786Y72QxVe6WxijdWguuBknMwirDmjmmJ5tQ6mnFQMLgpUX39k2Xudpf7/KAAMl
	 GWc90dBID85zgCgJDTWBXMkPTOGnhO2qZU+LDe1W7zkiZ7tPzeTLHJeRm37n3ciGea67Q
	 Gmt+UAGuODqsH2C0/wftxdtOVG9GYPS8X3fo0bb0fGdAoy4RjlZkEwDLnEabmlC/twjm2
	 0Q1VNzQT3cae6V6LBldUm9JrykBnmmrZ5HssGcF6av9YHqfuZQkTGSVse/P+4ZjIlqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794216405;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=L+gz2J/ZGi177mXkyUJST89Pwyo852hzkeYwHBsRBvY=;
	b=hH38XNdJ8dklLaPFt4W5xfq98LJb7k3RE+/Aw87I5Dn9iR9RZrDGMpK/OGi038Cw0pwI
	 P1zX8gjLc7muCKxbJt46e0fPxqK43SvMoZCX5zcRx25Si0H/DneGrYVJrOsPolv/Tym0d
	 VoVXhm5XiewJFRNqD7p0rLqu5bkHUIUvef+57I6YDQt/ix+3F7AjRrU2PADfkWAFXfTK8
	 PaOI9XzHn2FEIIYQ4PRncjbr73uyEBprUMUk8X1NIWC3GzjgHvsWn/QQqErSMaaSvGlUE
	 8eTEoA5yFc4ut/NjeUAn1cwXk2M6C5fxfDdFWcF19WJRdaOsQWjbq9fDtdvjMRhjj0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pwdU+FhC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QySonPPO;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBE90606D805
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 09:26:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBE90606D805
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pwdU+FhC;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QySonPPO
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A96A8EM3634425
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 09:26:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L+gz2J/ZGi177mXkyUJST89Pwyo852hzkeYwHBsRBvY=; b=pwdU+FhCCLc9mGTs
	zL5gW5iNmwWp31l7jET7VATfGm7Tkbd5RDGmczlA4JR/1qekae0jK649oCg9/WuJ
	dpW0pupK1or/1rHKlkLkkOeADJHUweRwZX3FF+QCCqcfFdU398NsqbvU2/fXq93T
	tTIJhMkyudAo6GDz+b2qfzwVJrWKgmQ3zFysp4KBAmm7AvWeuDwsisJslWdPCbjq
	YBICDJnADwKjmPoFlqQ3ubb/rEGacyPZ6Wm7Lw8ObDzGEpHDLZ6ThAVhT0CBaJEy
	JU5Pbsi5cTK45cV3H7dAKM3wFGF3kajnD6Lj/VD4XiUYlSCz8fz2tbdqCrR6lxqk
	McNxPg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hu6x2h0p5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 09:26:43 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f1440e081so17694685a.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 01:26:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794216403; x=1794821203; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L+gz2J/ZGi177mXkyUJST89Pwyo852hzkeYwHBsRBvY=;
        b=QySonPPOLUMzUYRUrIdAv1pMKYmkkHWh4yQZAuu49lmoL2xoLymN6axSvXxnZbbjgo
         PW1ikPAW6By9yheab9zNHlGRSOJjedxah6JInCNYqtUZuvpmZq8taTj1nYWOwB/5kjEp
         GCgNC2CgGfqqaBWzeG3gjkFtP9KVlMvTT/doyKsjHzWKRmwOTfXJnRAJJRKYSgkDy/UW
         wksfJkPgI9Vu9/QhhaqIfRsif34u7sxOwiPTCuTRVTFQPBcIpqFA3rFM+Cfy83I2OkpA
         ufeFJhCx4Zw8VClp+VPBpJ3Ix1vYnyEakTQ7gv2X9wTeexBG6C/mmjJK5EHYvWZSv7aZ
         Endg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794216403; x=1794821203;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L+gz2J/ZGi177mXkyUJST89Pwyo852hzkeYwHBsRBvY=;
        b=G8AN1ZWt6X+7i+NJc9so5rCnYpoBDA+NjnOdROJYU1mgLGFqwMSuH+rCc9DRQ41Rnz
         bL5AX2UvGO3G2sZGXUWMjm5D/xcYMMMBZ9DjYT1SC64eIxFiupUFiI3WLpipNbNqAcmP
         /vI3zXCGZDMgfi9Tx7TGv8tML3Qg9b/L5R4ov681XDYXpvthC9DORRNlg5C7OKeb0uyG
         6OYDdoCuSqyXBMnWsOoqkoz+twtHoyxSucsLmTQ02+JOFpGvxcAjLxIQxXt+qRcnvehN
         DjMy0V8DNprakic9Ct0ng9dMupVVFzRBjo/x+2FWXT8rKpzCLQq1T+3UnCo6XaQlBzJa
         5LtA==
X-Forwarded-Encrypted: i=1; AL+hErH+wVrHaWamOLrvubXys3UX3m+7dd/16dv7guR/hzDh5MAONnfzOpfPdCHu6APNeebfNM0mfv3HkFl4ba8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+y5HcIPenR1/r/3pDTMnb3qYh9pIABF4wkN7Ai6ydQHZ5oMB6v
	XRq6g4xwydQ35Sgo7tzSQVa0uW/+3wXi87rNQWlFsgHe46aYi8DPW4HC5f8fMAMR4bSN1ElA0nO
	XYFCGG4H/URey5cyc8geV/ma0f+CbjceFf985vG4NZSfBIcoUFqV5MptevgTpa4aejkw=
X-Gm-Gg: AYBFou1q/L4ztMKBpxd60FBGnw42ibKQ+1bt24Sj7O1cNCs6lEw5Q6hfqpRhzrWWjFS
	FDlddRRy00Bmr0fWDMzXMNZ81eT1Qbxabw/qEpDQnTjUi+HoclLcfojy6Hdi4nnk+YdXRcwtc4A
	2hyDCo0waJ27AhFRHzMudl3WiJ3ZyYwj42s6jyABaYmxpev7lql5k3f3TRoTFPWOUh4vDPkUB04
	xabZrmCrF+7c+DIEX7MEneIrutTBxgZ7eylRafndz6QxSAQoJeiVkHkoJL+KIgYhWAC/TvXpD07
	EIz4MLnxpPK/Z80WN88403BHAO8rOuUFGYE/01KG2OfVwr5mMwb3n8r6w0K3yx/ts+uYHDG26e2
	wimZEag9BMrC6+JwI15ascyVVRJe5Q7sgi0Auvr5cL0jASaa+Pz9XhFhDVcNWUeYpo2by4w==
X-Received: by 2002:a05:620a:a41b:10b0:939:9ef4:79eb with SMTP id af79cd13be357-947842c05b3mr512746285a.6.1794216403095;
        Mon, 09 Nov 2026 01:26:43 -0800 (PST)
X-Received: by 2002:a05:620a:a41b:10b0:939:9ef4:79eb with SMTP id af79cd13be357-947842c05b3mr512744285a.6.1794216402619;
        Mon, 09 Nov 2026 01:26:42 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b721ea4134sm1200061a12.9.2026.11.09.01.26.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 01:26:41 -0800 (PST)
Message-ID: <46b043bf-19f0-4b7f-8c6b-b8835838338c@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 10:26:39 +0100
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
Subject: Re: [PATCH 4/4] phy: qualcomm: qcom-m31: Do not request reset by
 index
To: Philipp Zabel <p.zabel@pengutronix.de>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20261106-reset-deindex-phy-v1-0-6a9c9f428be8@pengutronix.de>
 <20261106-reset-deindex-phy-v1-4-6a9c9f428be8@pengutronix.de>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261106-reset-deindex-phy-v1-4-6a9c9f428be8@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TMjQ2Fla c=1 sm=1 tr=0 ts=6af191d3 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=IWuRp9V-5v9cUcI_31kA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAzNyBTYWx0ZWRfX7iBAnh7QIQAu
 GOG/yCm2qAvr9yyxMomerIyq6Ctv92roJb1Qzzmn8S9zbPfEvoqGMboHLrvRbEupfV5KKcZa3rt
 2t9+w8fKa2mgWX+4xVhyb4huNQRtjLVOY6rCsOkC3PHGqyCAIZTgmMOu5ZOlMd74IL0GZN8WiF8
 Lb/gvRZAlI95D8eBsmkfqL2mGf02bjxJyLBJfz6+PHCQ6nTJo/mh36r+eOhqyXK2kCnZkf1u+rg
 5Tt9gutOuI9FjRQG5tmkDlTbTchGCwDG555rtecGC5QCcptOzdWhdKldktHbYhF1cM8p0qR49uc
 X9MS0/soJ1oFppkiIlWAgJOFWNghtv4fHKjPzqhZrYWzMgP2YTrbIQwQus2ZeI1BJzJaGEZcvhh
 reXFGnAyLfmfRgntHt4OmuFoFL/yyFTU15TsCkXttOu0371C1nFWUFdlg6qzu6LIFarvzbRqRal
 Qd2gCiea05kO5OjIs+w==
X-Proofpoint-GUID: -kirqwVaB1MbslipONezYWyo2r_Z1Ro1
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAzNyBTYWx0ZWRfX+2eXA569jZeq
 eij0o+1taLfkZyPHd3s/VrArpidDVksLSODaFcgYSycZ+U7Yt2pc4HmH5mk5dCTSs2e+TpC3E13
 kf8m/6PuERIzpkRz8RsSCLCcEI8xm24=
X-Proofpoint-ORIG-GUID: -kirqwVaB1MbslipONezYWyo2r_Z1Ro1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090037

On 11/6/26 4:01 PM, Philipp Zabel wrote:
> There is no need to request a single reset by index.
> Use devm_reset_control_get_exclusive() to request the first and only
> reset.
> 
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
