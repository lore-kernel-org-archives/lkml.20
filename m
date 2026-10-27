Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793098023;
	b=0ISeXdpSzLEgkZ8wBRfxAevQjhuYIg0XoCk88fXYeI5PqiLTu4qDQQD+Cx/ZGiL368ny
	 8fw8pdTHces3LL80QiIC6f2DYRCugny1Em4Lvur9Z6JS6Itrbk3enX2oUCWocp4EbnSOF
	 KU/5CyugeDmT3wm/BsN1uFZ432v9i8NkWp8SqxKreg5rdbqz0z41pxNcg8RtRh3fWf6TE
	 L+hA5x0D7KYrGX3rY6rYIlDvbXFw+k9jT9ZIcrMf+/P2cZL/xzjyde06JwwFfxGI/WT7V
	 IIdbzjOg238pR1417n83LJNZ4EZUvAvaK2Psoicqy/w1bCsvTKRwIr4LdouK7Dm8HWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793098023;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=IxH/wTKz60XBJsUzmqABeAlfFRVAsNaqXRe4BJeY61A=;
	b=aGKCq0v4U4tU5Fa+opdhWORL+n7k/wiO04v+zAtzqIKBqS4v6RrVz/N/6EJw+125WL8X
	 STOl3AtMYYpcJy/lb3NuJIFxJ3GpQ3CMThP43zQmwSb1CRpIzSD7nt17u6Lo7O6uhoq//
	 2LdgFgcGbW7Uvhz1RWtFEE723U8EXzZor93GncXN2tuzSoTnK/vuku5CNrgsbn+5rBQER
	 u8NyOkMt/nsNoUZcGeKZaBNv7eprCh7DMgKE1I5rhskgn7Cu4jQekQFwz6gSYWu0akXEt
	 IZhDEBve+onX1FLXuvMapqzMEMmOVeP/SBhTuirBzLkaxt8W8CsvrDOs5bxMLuyxUtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a08wf+Sq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Hl+AVOWC;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F9F2606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 10:47:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F9F2606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a08wf+Sq;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Hl+AVOWC
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAe6Wb1935934
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 10:47:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IxH/wTKz60XBJsUzmqABeAlfFRVAsNaqXRe4BJeY61A=; b=a08wf+SqybYfPFpj
	CytNS6e4xDsBCkAlLEx1QU4PEo3mSYKh8DvmOmD25zWSYiDLe5VxrfoksTWKId9h
	Sz90DiVgekaD6JdCoOAPLu9JpWoHFvVcqyLgXzwIEoWd8yVVy0oDC/teYrclqvNd
	qCeYoorf5tiEqCsc0L9loQGJ4sBCQXA6EDmlYRKMztilJImASV9wzhnVrn1Zwt5W
	3EmhDT91onmQ+9MPym84c22NJGUET488USoXhXZiLwgk1AiBYqEH4+ve6/KPQSjJ
	4aIvH5WymHGAZQ4HcR95r59UQFhTWVdjW+eTOQevO2KTPG9n4vKDBQA72Os6tl+d
	Ak2Jfg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjfavte6e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 10:47:01 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-536708d1a3eso15631981cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 03:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793098020; x=1793702820; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IxH/wTKz60XBJsUzmqABeAlfFRVAsNaqXRe4BJeY61A=;
        b=Hl+AVOWCU4ZrcfwUxKJkxKivhj+CjijexNngoCePy/1nLR6+tX4s1XPIfCaOuUThPg
         AeyX1QIWNpA2OlyHse450PiZ7cCmgKVEQoohGvdBi4VwKL3cRa6gkk+WpzJw5lCHUva2
         a3Ob7+jbXXfeWEvnbOhVgwK3Xh7ie5yuLkSr8kkNXedp3jzAq8Yr8RIb4Ce1UhgX4zgD
         SsfUB34qduiwBnfZE5BsworOoBMewd7vGghjj2wJesW/bkLnIKHHMN4+nppiH1Ye/bAJ
         58N82lJkvYiG9S1TUdFZi1qUrC0zBpJDR82Gp0+XlxhqasxskA9TwzWFh3vNzl+Mi5ch
         NntQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793098020; x=1793702820;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IxH/wTKz60XBJsUzmqABeAlfFRVAsNaqXRe4BJeY61A=;
        b=pN2/Qro8Mx8q3f78y1Myepdf/2c8w4XnFG3GiB7XQnMxSgt29BA/0Yplm9e0P7p3mE
         FSz5I3TofjqT0RyoXRwXaHk+oOmR/xDRyWDVL0t6A+V7M0LjGkklO1j9t9mYxCFyv45k
         tY1T44ig8GdDXqZDMr+LwbrqJZ8r4IEwAC8KRpAvmuGcN27mFjHFeJuwaHUj5i7INMhM
         zYu9ml7TbBcNA+nSGZwqsXhM2o7/4KRxhG9LiEr4hgoJ08ei0jjCxfg4glqofjFP8Kn+
         YTLCiR04N4Prun+Ovrha9NAciyEwY+yeXf0VOzRr2BvMUIKNn5gkCN+PxAhT8/yhL2uZ
         pfgQ==
X-Forwarded-Encrypted: i=1; AKwUvBybAmlFl2NSVEW1bCVE5P3LlxEV8Fx0bqIxqGOUnp0pAOQ7wKTe1beVlKViWVakyTkuRDCAqEfDDzkr0r4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLltCAIQ/hxbDuBk7cmRnzRhMc+yya70c+mlAp0sOvXnh6oEgUW
	SgTLy8eqSqAVbkHFJ2N/lM619RmFzyWkCNM0YVC6BC1DzbsVHZo8MVQR5auDMO1IU4pbXi1993a
	WUepRUy5jMMs58DSyXCcmLo+GWoXG4ci5cWq3P14WcSRRe6PLzqZMXpJN27GzM8Gk0wg=
X-Gm-Gg: AYBFou0edpZibsSYS1yB7BdqinGIGRValt/JCMvoFX7z4brL0mE4/TimsefX2dd2Tx5
	qdk2aWbNvA/R9HZiyKZNAntRGhgCtLX/m76xV2iKeeVRW4fELooO+obAFSZgTCGbE28wX82sfa3
	Z/xMtIY/saDuIZHI2hvedMxrj9HS/WB4+508ybhn9KhB1/itxT1X3c0uDNBXT3KOGEkjRETa5t0
	IIA8sak2XiuDQYU1ZpBTVMWdeZBJwHGjlmQVm/ATwjNe2N9DJ/CV6vr9n/VaEzLI+FQ/6RqffZ0
	/C3s830O5CjpgNqjAyY1sp3oNeCApTBSznvkbi4/OV3Cfbfq+VrZbmD1XP6zD9pl7GvUWCO/lIP
	WPCQtGU8MLc90hFR3rOT/4Q==
X-Received: by 2002:a05:620a:4918:b0:93f:1fc5:f07b with SMTP id af79cd13be357-940ef7e9992mr1516912385a.2.1793098020515;
        Tue, 27 Oct 2026 03:47:00 -0700 (PDT)
X-Received: by 2002:a05:620a:4918:b0:93f:1fc5:f07b with SMTP id af79cd13be357-940ef7e9992mr1516908285a.2.1793098019913;
        Tue, 27 Oct 2026 03:46:59 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b47b29dfc3sm1138884a12.32.2026.10.27.03.46.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 03:46:58 -0700 (PDT)
Message-ID: <2a77fa74-6016-48ee-a1b4-1df45b1652d0@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 11:46:55 +0100
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
Subject: Re: [PATCH] remoteproc: qcom: pas: Print auth error code
To: effeffe99@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261026-pas-auth-error-v1-1-1569e83358e5@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261026-pas-auth-error-v1-1-1569e83358e5@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 9IJp4djMbI6AvquyhE_hfGLlWyqoI7qR
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0MiBTYWx0ZWRfX+2nIAEtJCLvF
 JPSLbJiE5vOpw0i5lL4iBWSiefw8Q0o1yB8Fl4zlYPORb+2nXz/0Y6YG/2W6D1uu18mREC/w/qj
 I133nknwKSH4QPVHscbEpmOsu9qGGXc=
X-Authority-Analysis: v=2.4 cv=EIeTQFZC c=1 sm=1 tr=0 ts=6ae08125 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=xm1_ZTsVmEa9A2bUQEYA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: 9IJp4djMbI6AvquyhE_hfGLlWyqoI7qR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0MiBTYWx0ZWRfX5xg6uEREi2N2
 Cf1g8f+FXK42k97ZPQLSwf9rEV8prat9s4JrUgp0APqZlIgZc/+JM9GeNAMMZSNm+ZtIZosXcIj
 GooyWvkxm3MQrYhtj+HudpkObHtDxXiaBR56vBVRMX8CI+8NgyG7RzoT4UAZ5SXu/d1j4Z7d22K
 Q743e6MNJqEM12mqnmNhngib6sspNLrPxDgcsQ6E0mSz0Ak7OaicRZJvAHymBmK/ct3ZSPVYckh
 wy7KJhnBa2KfxrCMxcHf0q/hEI/EJcNdFMATLmHpx0gmAUowuDJibwgwTu0Q6FcirpBvnm+WDIu
 D1mQeMOTDjOAyETRpVrE2VcjgkjkT5Z/ctGhuIoXA6pSBRC+vwYw5iBR4Ia2BXwEj1wa3Dbdjam
 4502FWiVd2t2GvueDJ1Vt7oj+1wlfeQFApn5rPuAxvcAYZLIMHQmPB4n1XCQZoUigAOMFv3w0Ff
 RJesSlHG34EvLUpOJpA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 suspectscore=0 spamscore=0 phishscore=0
 bulkscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270042

On 10/26/26 7:19 PM, Filippo Falezza via B4 Relay wrote:
> From: Filippo Falezza <effeffe99@gmail.com>
> 
> When a subsystem fails to start, qcom_pas_start() logs "failed to
> authenticate image and release reset", but drops the error returned by
> qcom_pas_prepare_and_auth_reset(). That code tells the failures apart:
> a negative errno is either a clock, interconnect or SHM bridge failure
> on the Linux side or the SCM call's own status, remapped by
> qcom_scm_call(); a positive value is the status the PIL service
> returned for the request. Without it, finding out which one happened
> means adding a print and rebuilding the kernel.
> 
> Print the error code, for the DTB image as well as the main one.
> 
> Signed-off-by: Filippo Falezza <effeffe99@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
