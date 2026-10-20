Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792475796;
	b=v735S93+Ve6OkaXs80L5/XPdm7ePt/ZAgreyRznZL4P9VbQGiGOGbnK+ABRVF4PA2lT6
	 Ip5o6EioP1V0KzwFwkWhE10w2nC37nlHDdxao7eoz0rjjW1n82MMfsFtXZaKOPXEBMLWk
	 MWNfjZ6MbNiIhDGw65eoG0kwbHDBl1BziQm5EdQUi4/dKrqqtE9iLJFeOYi4VH8+TCble
	 UvxEKwWCRXVVCupuEW74QhvS1HiDSyU0f0miVHYulNqXb/eBcQurzSc2Zeiu8KSWAJPLa
	 fPEjpfkf9kp5JkkDXKwLXxFBjiRH7OfoGw/DPTivor2fgX3TbbcG9J6Ypwi8xTcAbMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792475796;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=g/d66k/gQK/HdTC2UUu/9HP36tv/UJE9YEW3GOuJqiE=;
	b=FHDMsY8Z5h1r6FmbUC6bfubb1BfR3iUWp5N4mVHP825DgPXJg0vqYtRdPEeqHNZEr+Eg
	 AtIlzhMqFzrCv1Kgt8U+NsE7jUejd0F3bvjSIxk8tn2/P7Z4OEDEm2pGivSeUjP+/UKJx
	 JbgYpqL14wavGmr9vNuHv9Dul/Nsu40PXgUxCIYeEGs6FMUh8IGgDbqqSakhkohLR3v0T
	 eolMPLddeDNY4Oq2X8PbvIxqVRoJ72ZMz0WpfWMCMryns4M47OQ3oyGJbwu7KU/5c81nh
	 VYL0GPl5pS4ZAGJkUCeyK1cv2KItgWEtphDo8YsdQdguMGhIKTCTQn1ywPfIju0BVfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NH2C92lf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YbaGngDf;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AE64606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 05:56:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6AE64606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NH2C92lf;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YbaGngDf
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K0tbEA3807765
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 05:56:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g/d66k/gQK/HdTC2UUu/9HP36tv/UJE9YEW3GOuJqiE=; b=NH2C92lfNBImskll
	dH8DLgqQz+uzNdtBusatZnbj7Dxq4Db2XPobHPJ/55ElXzrrWERceZeQO/haf48A
	s2C7YEQxgPlxV49BmJgvtDCyWv7P8dUABvvHJG0UpAxStF3gpwWdbRWxkfyZFZNP
	927cDFIQPLZ/Y6EHRpXPPDQQTsbq3mSjSajCdrFrI5aM9VRZjjrMTjFhyNOp0DML
	QwYSi728zZrNMmFX5KlXJR5lqFYIFEJWKszZWV9gdbmW9kTsoqAb/QyzMe6X2L1t
	5jeMUhUrOjpR6sNsgvwkjWFJgwsrSvHBEz67RkB0zIbCZxBw0CqlrUT91XVV9q/V
	v9xJeQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5p92sm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 05:56:35 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f2bdebfc5so95500385a.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 22:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792475795; x=1793080595; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g/d66k/gQK/HdTC2UUu/9HP36tv/UJE9YEW3GOuJqiE=;
        b=YbaGngDfJQv5ZXjtmtjLjBrib4lwDF9SLTrs6XE0Y2Kx3F5E6ECQMIwxEBMVrJsih4
         2ezZQTe+sStp5rYfmWhVWYbuAsBVSWXMuZgF0NVSVP4AQqCXLDJpGyMjszZ6iuyDvHOl
         q7jLedekXMcmVwLfHoC4LmFhKZAHpSjxZdfp5p8NZXrKpLlpORLCGO8TUBZkmyiJ/vlV
         GOu+/u3rJUmWcInu6KaaROpDSVp0nExGXpworsD9ikZNWYLpJiLNu0lNCaxONCFqBkvV
         5XzItj3sArLaZ7oXmBk5SLYvxugfd7It4duaQl1h+SeJc0GGnbK1KcTTJZj6McYfEjeM
         zo3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792475795; x=1793080595;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g/d66k/gQK/HdTC2UUu/9HP36tv/UJE9YEW3GOuJqiE=;
        b=a2VTHaUX9vIva0mXB2uPsDzsCCGudmTWIdub65ogr/ogO5I0gYSRMaZXl+2HvgYDOj
         /RwZ/rv1FaO0bVxzOK9Mx3QAU3aeaeWZ20+pHe0UBRf6nH6jn63TzkFxdvHhZTCGSqNl
         JH7bwVp3DsSwjWD1fuZLunWvKlGmOEIsFkocRq0O9j4yt33e5ryb6M4ao+dtaYvXuoYf
         k28QwE0X20ZwfSIEaWrcO5Vc7lNvQK3cCizw4vGdfS5jC5XD8CH41kx3pkX9vJI31jSp
         jmSvPzzHGe6E9kDu+qFXDVn2hvESQXBWFRWfGX0zi9Cmd/SLq6Jq1a4xDwWgFfWYvMVX
         f/sQ==
X-Forwarded-Encrypted: i=1; AKwUvBzcoy3b9ZEAGRf2tNJOwolZsX1lZcz+FUFKRdmFRsfZvoAj6+etwAEvEZMx1rT1f0MhZM4kuqKukqQqhj4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLt517kznvUQh6h/qaxBiK5OtjFUklL26Nt1/DGREEMaDRIWUih
	+ryqqf1TF/PR2BctaSgGExBxzRgCYtRTNJ9vcvksHxXc3rOmIFVwI0NmWEUdfjnHgOZFSDOCEi2
	o9Q3zb9zCm+9XBS/ikBLYIHcrJuYJNQFRvL3tZXrINBStVxQryvnKlMxdLtgr4yteU8Y=
X-Gm-Gg: AYBFou1FBfK3wMvzWAfhl8/3vbXBTikJWBs9MLAs31/7bu5ZJvCVsdq2YhblKGNYRnA
	NtBS2alGEry50PFpvkmHtfL5EeT0mQMAF+9hCO9ibgW2gm2EA7s7Qn5RW/QRxo1qNTers34dtI9
	3Da1iO5YZh09s6YCI6lEMNCC+CI/M3aXlZp90fuXkSBHTWAykuC6S81stUDpx+ZFX1AMfn0kVTy
	w5bbEL+cq9nPIxzW9dKNFvss4pfB0CQKSzA4QlQFF9ot63QERl8L9TA5l4fvLQaQFXfmOc3xA3L
	XTAeLGQZP/n1eiMSEO3nsvVk+lkSRk6oMS5CETbsT6Ni8Q1f2oqLiyyf0flzAQaOQxP5nQ8CEJ9
	MNIf7atn3ENZWsX62aKXCPA==
X-Received: by 2002:a05:620a:19a5:b0:93e:571e:94f0 with SMTP id af79cd13be357-93f29cf1c85mr1969052985a.3.1792475794637;
        Mon, 19 Oct 2026 22:56:34 -0700 (PDT)
X-Received: by 2002:a05:620a:19a5:b0:93e:571e:94f0 with SMTP id af79cd13be357-93f29cf1c85mr1969051485a.3.1792475794158;
        Mon, 19 Oct 2026 22:56:34 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b3f05d3b7esm118056a12.35.2026.10.19.22.56.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 22:56:32 -0700 (PDT)
Message-ID: <8a63e842-3b06-4eaa-95ae-4ba4ebe2ca1c@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 07:56:30 +0200
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
Subject: Re: [PATCH] soc: qcom: icc-bwmon: drop the bandwidth vote across
 system suspend
To: =?UTF-8?Q?Ram=C3=B3n_Jes=C3=BAs_Miranda_Hern=C3=A1ndez?=
 <ramonjesusmiranda@gmail.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, krzk@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <73ab680a-ad47-4270-a7e9-48df70e86fed@oss.qualcomm.com>
 <CAP08=V3QB+pq0jd3UcAqzUhffv9D1fLO2UJjEKk6hURFRFfrmQ@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAP08=V3QB+pq0jd3UcAqzUhffv9D1fLO2UJjEKk6hURFRFfrmQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: VVObouUQ9wI1DnS4RxWAHgoAe6ymyshF
X-Authority-Analysis: v=2.4 cv=fb84WEQF c=1 sm=1 tr=0 ts=6ad70293 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=phjmEUDewNKgeIt9zHMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAyMyBTYWx0ZWRfX+yETt2Q1HOce
 M3CD9LrtvS7Bc//Y+JBJuzEE2gvuAsAhKxSIoU8uvNsmqhPeYMZxL+l/baFFao/+Zfl1vX5SPV1
 LFAP2vjK/9DKsy5rndRHEFqJE/Ycpzz6sA+eezobYBH84YrNSytQ6R7WnevqqyJMEU767DAkK9r
 2tEPNhdM0mGQg2OYHLTvcxZp0GRP+gGiqoAEnyLVBTK33ktb5J4zmvuom2BwSV8VTaDaMRShVMw
 iaVlAr+xm3CWoMuDWYrFqO+vnP/ELKCF7T3gb5dH224SFi6gAcCdtrfMajNm49k3nRzEDmKXIj0
 dCWLkc2uFcSEn7+p0v39lp/JaugdqO7EelsxJz3kxXrHtipsnfF9b+R6sGm7e1V61X20yfRirU3
 GgfA0r7T5DkkallTJ7j2O4tA0AgVRPM/z/iEYDEVvaaCi6Mw+xcLg8ltQAhGE3vrDcrNCS7hYdK
 ooFTDfOXE2Lwq6cWHiA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAyMyBTYWx0ZWRfX/TG23b6M9+R8
 5iGNfU39wQsyz+2xSxeV0NpGWFKGS1QzwE/VeDQpgJHeHvBeswoA+FjFo/ZbHEQrFR4Sx9ibBmO
 XDtff1q7fstHVKE+zO/cxee/KFCJxqs=
X-Proofpoint-ORIG-GUID: VVObouUQ9wI1DnS4RxWAHgoAe6ymyshF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 phishscore=0 clxscore=1015 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200023

On 10/19/26 5:48 PM, Ramón Jesús Miranda Hernández wrote:
> Hi Konrad,
> 
> Thanks for asking. I have now run the negative test on X1E80100 (Surface
> Pro 11): kernel 7.2.8-arch1-10 with the icc-bwmon PM ops removed (patch
> 0002 reverted), then s2idle.
> 
> - Duration: 10308 s (2 h 52 min), suspended 14:23 to 17:15 local.
> - Residency from qcom_stats: CXSD 100 %, AOSD 99.8 % (S0ix), DDR 100 %.
> - With the patch, earlier runs of 849 s and 880 s: S0ix 99.7 % and 99.9 %.
> - No CDSP crash (sleep_statsi) during this boot.
> 
> This contradicts the claim in my commit message that the qcom_stats "ddr"
> counter never advances without the patch. In this configuration it does
> advance, so reverting the PM ops alone does not break DDR collapse on this
> platform. It is one sample, and the runs differ in duration and conditions,
> so it is not a controlled comparison. I have not yet read the bwmon votes
> from the interconnect debugfs before suspend; I can add that if you want it.

No, this is conclusive enough that we can drop this patch.

Konrad
