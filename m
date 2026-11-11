Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794404966;
	b=btHkIoverU6qTRHNer3hTp5vGz9iyPcAReN5DaXCcxLf/52ATDEFT/tWcbVRUn2I13yf
	 /epUmK1Pv2A66eQwfrKxcgW3bo7qyTfx48LMyk61+hq9vXXZKLECI4bBd1EQS7s1VKuE2
	 e+FtxruUzUFVq2YrSzq2fMfThzqYdYO1G1zgllhfCKaJjKuNFvDGQBwyPyOKysQ/8xwpS
	 OUp0n7UTXDRYMwpGsvxWwXcZE780w7Jg3J1f5l30GGkrbjddo9fYCN3haPP7GUa2DnE90
	 qJfmyrpAxBdd5KPaOsdWom7rcUi0seJI/LnPr6VE9nzw32XuRZtKPn2O3aPbIPzPS4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794404966;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 X-Google-Original-From:Date:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=lSwWMcsTLqANVOz4thWu0HIN2eRkabNLMzH9iPg6N8k=;
	b=naxGvcP6ILpYxiOg0O51A89MoE3eNfe6I90jjr+OvFegbyI5rpcDIT3aUjfRho+XLVT+
	 e64+rBJMU0f0CbeW0ckIjR8dtHEinjrcOpTgshdkRqh/yde32vFMRtJbgpELdC6FLTV7d
	 X6mhR0kUUxDg62IhNC6AtaGgB5kyVv5Coqr7hs6q+tEFRoc55zCDueoVjrP5B/laBQKMc
	 gPE9Igo2df0IWaKR//a1FeQUJqB37hF8Ea8KW5g/lF4/h9ZaCECOPFNmBm8Q2R2A7A2jk
	 ysUlLn0nvmhMqgwA8gw9gJmkDijcr9wNrAKdV7nVXsoyYuk61c46gKQTNh2u7MoHcEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="lB7/Hzob";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="R/3aetT1";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F06DE606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:49:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F06DE606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lB7/Hzob;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R/3aetT1
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABCZ3cv2356788
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:49:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lSwWMcsTLqANVOz4thWu0HIN
	2eRkabNLMzH9iPg6N8k=; b=lB7/Hzob4wLxXBROFUWrgxOKFTaWUHM4A11zqpLA
	1/h6bh6ahoqD44zc15wX/MkMcrR0pudtST8tGqcgjdjDcrEokAACwTX3GHBIhKsn
	jnD5v0lTh0d72AgLahC35H30jQDEFhXYlrGUXfhdx34Uxv01SebyBkEk1XVkx3pH
	XUHH+B8ubL6ZcXnf61rK1knn6EHmHaavScy95AvIppr8GnnHBMj32yPbVTB+heKh
	UZdE+QPsYiqw+8RVeHv1jtTLU+1ET/FpTX6uNvxJLNXpD7+w/4TkTzHUsg1kCgCX
	DD2OVYIfRuSGkMROECj0DPfCt982JiEWdhnbYjzzoXmksQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvgjdj2em-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:49:24 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93909014c85so672746085a.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 05:49:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794404963; x=1795009763; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lSwWMcsTLqANVOz4thWu0HIN2eRkabNLMzH9iPg6N8k=;
        b=R/3aetT1YIa+rNP5YYo8s8q2ij+cylbptPJZRokzd4MWOr0Vfv4SA5X+LTvLOI8kI7
         zjYIcae3O0yLpbL1yMJGoV4AUP7sPlzJaVo8Qj9Su3KiQI+V3dTz6/WsRDzBN2DOywiN
         RJDxgcKz/e6PajGPDY8+FEbnys2KqEBkkdYEGA0JdhCMJ569Ud5eN34lz2LEUCBTkHvv
         uRnJhAOcp0qnO/BxYpIIVjQLHYoHR3HcnlUpm5has7xGz9CKv3+qcJp3i70BSYU3DHvB
         smUDo5OfyGNt1u2sfaM72SFe1rj8G1rH76Qf/B18gm50qtELhqUE4xZraeHvDHUAP9lD
         tLUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794404963; x=1795009763;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lSwWMcsTLqANVOz4thWu0HIN2eRkabNLMzH9iPg6N8k=;
        b=sDCfA4TTmnO6enUsIoHFaGbmCSZeEok+akpiGkUUyVzy591kKby0aVg8Pyl/LsmMue
         UEe+hQISsqLxrimQ6bdkCh/eUQfIMBEq3yMVHuyvEwi21WoxswQ73pfaeE+K5hxhV0An
         EHKARKOXEzYVpx8Bsd/Lf7i/fLv1YOLi0N+oOLDyphhzjpfMhOtnlru4rHabyJ57OhFY
         KvXM9p/6wJsM89MmRXWUAZ7IWWF0BPr5CW93ojFsr4L1bZIqC9XW5HrJ+aZzjdtVItV9
         1ODmbhwYR7GxEcyrhqF23akhixvOaIjStTevDHJF+2TexTeT5oels+LF+ABCGCdc+5J7
         kwpw==
X-Forwarded-Encrypted: i=1; AL+hErGsTXMDznjgjbg85lmNPseMWeNOVVUnZgN/hJPqLIJQ9/37HR0+1V+floVeWfnN8ABuvQzdvAHu6IklCFI=@vger.kernel.org
X-Gm-Message-State: APuU4Z++ThspVyW7bSuPGHve6Ein9j+JlQJVaUGhtPWSi+0U047UR10I
	NVuv88S4F0q4xjlCa9J6vlxIlvxXBTPZCQx+ggGQEI9meLcaM46jNj6wB7cCgUQUUUlnRNq1fG+
	eBrAePOyb/TPq03fqMGLMcdw8tzksQQZtQ4fCHiIeKC7eJzL6YFv+gvTKBpGbBPGALas=
X-Gm-Gg: AYBFou3382e52ALGxLUtQ+JjtNTQCmZceC/Qo9Sq25cruTgqpGmLIVolE/r/exKgF1c
	LUJThFWWiNsUC4BZNWc1j6GbgR5aM2ETbfwjFdwYYxHJnBOfa+qEQpHRfdysZgXi4sRQ8T/wdvb
	Gwvk7bHZspnjP539ZKW1frZM50oMFggLUxsihlRg2fDDod2b3RMy/JXHEGWFzyL7xAeZdC+Jjf+
	NoerMnZm5KhaELh+ReL/CF9TcFvEJcAlJlGuIUmHgfr3ifiFr9wyyjise5K8AoO2TnNkrxlOV2F
	i2j2XxxKHGQQq4XZVqdcf4T7wpmvbTwyfFBZ2uUX49DaGcaTcScJYh00O3oM1UHf4mHNNKPsFqX
	dd8I9Ov1GmBDK3+4j9tBuR7z4M2FmtjooPMm/uT5IVwyN1dzpJMIOLsdlFGZHhe6oX6ZNgF//D1
	+nZA==
X-Received: by 2002:a05:620a:1a03:b0:93e:c12c:f127 with SMTP id af79cd13be357-947b00d6dd4mr341949485a.83.1794404963187;
        Wed, 11 Nov 2026 05:49:23 -0800 (PST)
X-Received: by 2002:a05:620a:1a03:b0:93e:c12c:f127 with SMTP id af79cd13be357-947b00d6dd4mr341943885a.83.1794404962512;
        Wed, 11 Nov 2026 05:49:22 -0800 (PST)
Received: from trex (50.red-81-37-172.dynamicip.rima-tde.net. [81.37.172.50])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498362eb14asm10330443f8f.34.2026.11.11.05.49.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 05:49:21 -0800 (PST)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Wed, 11 Nov 2026 14:49:20 +0100
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>, peterhuewe@gmx.de,
        jgg@ziepe.ca, sumit.garg@oss.qualcomm.com,
        linux-kernel@vger.kernel.org, linux-integrity@vger.kernel.org
Subject: Re: [PATCH v2 1/2] tpm: add OP-TEE transport core and a discrete TPM
 driver
Message-ID: <avRyYBpQcYx-xo9o@trex>
References: <20261110141923.3100770-1-jorge.ramirez@oss.qualcomm.com>
 <20261110141923.3100770-2-jorge.ramirez@oss.qualcomm.com>
 <avM0uIlZxZIga4dY@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <avM0uIlZxZIga4dY@kernel.org>
X-Authority-Analysis: v=2.4 cv=E7tYNqdl c=1 sm=1 tr=0 ts=6af47264 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=VbO86HPdXvN82gCvB8O6pw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=kVfuh0FxlVcxPe7lGXYA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-ORIG-GUID: LfWL6NQbxeuoWYIqELNU0qpaVS_We_t4
X-Proofpoint-GUID: LfWL6NQbxeuoWYIqELNU0qpaVS_We_t4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA1NCBTYWx0ZWRfX5XlSZ6wV+iBA
 oJfLNGJDjSm8dfCIW5EExRy+WFA/48MVXSSLZ2dhHgSdOSdy04n6ac/JfrSoa6HVggPAGk4n4FW
 3ywaoKdx7upjGthGJfbQt5EB19BoLfS2yh43si75d14mg5iH9lWfIf6WzFZBE4x6r10OgxxCZEw
 IcR5XFMuvLBFlRu8hpq55XAVp7WfW9iXmVdkKWnnnsGV+bS3JZzLzNp3fcH2alrrNrdJRsqWBUn
 lRpptxhTgX2zFLb3JlJnuvck0h6GOZUpKffqtSeWvFw1+ZLnZvvemr9AeqOr6AX5QezHgPvCcDC
 znKGHF2/VUJusGnnoyAuIgQxr3xwVXaAqYcuQladK0+c81eKlxdnJ//mXrgfDBd/ISRpj+zPO/3
 gzRrj7frzdX7Hiv96Un+5X7hKWAFnLKa54xSnSGsRTEZzGOZoSbBRDu/fywgrX1PuPNPFeQt/m0
 jNoL8EvXxntF2+9wbUg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA1NCBTYWx0ZWRfX0i62/T3Ay/zc
 t5U7xnFXqIMsXdEld+UfNANTQCea7jARaXKUvKcY1rMCtJxXf9IIU2t0QOGPKgkciF/L+WVtqhF
 7fze54+ElUPrgfnTmbBctXn2cUKmYqs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110054

On 10/11/26 17:14:00, Jarkko Sakkinen wrote:
> On Tue, Nov 10, 2026 at 03:19:08PM +0100, Jorge Ramirez-Ortiz wrote:
> > Some platforms place a real (discrete) TPM on a bus that only the secure
> > world can drive. OP-TEE owns that bus, so the normal world cannot reach
> > the chip directly; it instead exposes a mediator trusted application
> > that relays TPM2 commands. Add a driver that talks to that application
> > and presents the chip as a standard TPM2 character device, so the
> > normal-world TPM stack works unchanged.
> > 
> > This is a separate driver from the firmware-TPM one rather than a reuse
> > of it. The TEE transport is the same and is shared through a common
> > core, but the device identity differs: the firmware TPM uses its own
> > application and a public-login session, whereas a discrete chip needs
> > its own application and is restricted to kernel access so that user
> > space and other applications cannot submit raw commands to it. Folding
> > both into one driver would also break on a platform that has both.
> > 
> > Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> 
> Looks pretty good. Did you check the Sashiko remark?
> 
> https://sashiko.dev/#/patchset/20261110141923.3100770-1-jorge.ramirez%40oss.qualcomm.com
> 
> Br, Jarkko

um, right, that is a bug correctly addressed by the ftpm implementation
(the shutdown callback needs to go in the core as well)

will post a v3. thanks!
