Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D0EE36B922
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792140347; cv=none; b=bmtXAVXzLLCfGknMBGyR1A+a6GdhZDR2cgSf4hWNb/oDf+yEz9t+fQMWnqTALM98+OI8BuWmk9I1GI0u6J3qZgiZvB2Xtz5s/4wQCIXLOAnj5t0Z5oJfPNehCj96HIejEtGe/kK0RB5mf43bgqKS4oLF4IW0REpOfYm6y1Q2aGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792140347; c=relaxed/simple;
	bh=4DWdvYSZbltHTKrrl3zNKEpEpeSmgAfafqI4HEusAwg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UBQ89G4nCgC6NfWq4TIhZmdDe/FtN9NeyAvkZHG037yKuyw0ZHZ+oVhJBGBwBDO2cntPdkhk3lA6P+LPEvbTJrXe8U1/bSV/VDpPDZNZkQeUq+NOG/pynGhOaz12Aq/tVZ38KgKGEHI41n8wR+6M7+mXt4rX8aKknV8SfVpc4WY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AUiiExEv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I0c4eV+V; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AUiiExEv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I0c4eV+V"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G2Ycpl405920
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:45:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YKJUG7T5zsDndsDIoritPt6ZZxWvYNXXCF3jPcsflzs=; b=AUiiExEvmcUDWy+i
	qgPehgXWO+2M2u61szHy5Aq8LQtIhcksrpp2usKk6OIYqaoSo4va1D07zyHKbnjJ
	iQjqKI/PQae+MXjGm2p1ulQTUmFCyLiS33uNjOce9Lp0VaA9CslGeI8YFIGqzvBq
	5G8Sfrle0VA7dIXZPOEafmOeuXrz3hYZ6w5MlI88kpBcTKOeaE2m/+m8J/q10vJz
	fAdx2KyAfJie9D6ZWAGsqbCKG9ZCnk598SafPgiG5oQ/825usgcWsIvl+pLAvSNe
	M9xcfpyyEdH1dMJBYg/QiX09aTZ+3ZRXxBZ3gabh65Sdfis72uTiv53zKycUpXTs
	aoFoZA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb3sa2vg8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:45:44 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-53635fe2335so389321cf.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 01:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792140344; x=1792745144; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YKJUG7T5zsDndsDIoritPt6ZZxWvYNXXCF3jPcsflzs=;
        b=I0c4eV+VUCXG66QwD+r08Y4USeLkvAogM/ulmWS6xsv8/oFxBjwqSaLOrKjWY9Se2B
         M2XwgUUe5Kg3T91P1qI5iwN2NUVwVtasMt0AulnIFZB3979gAp5PPgWBKoZE0FyS2ppm
         2A6cYWo2MpSf9Lxaf5SwvW9pBsUu9502ShFFo+zhI0c13wRcJVObosYiFfN9j7brrjw6
         Hi1ZqXq0FCMom4fDwtesy4jVK6i/+RjaShB0aqDypjjdyr5huyyM72rUdE75eyiBJNVK
         4VjO92/950/VocGyXNdivCh4Y6mKcbhOri91tQyHAFpgQfOiXg3IB3EyBS3LOLGYX7SS
         b7ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792140344; x=1792745144;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YKJUG7T5zsDndsDIoritPt6ZZxWvYNXXCF3jPcsflzs=;
        b=O7mXlxPkwNYeGvwcsRfr3DBTVeOKK0E+eqEW71xnAT3IWh3Yh0GQRdGhzpbbq9xzHi
         AW9qitnGhIf1LvA60ezyaqundDtKFdFCD3YcOhnuDPidRnas7kHl1faxnL0aNlO4XCTC
         uR95Cp4GYKnGXYL/pMSDwBe3DVXnftD0WcSlttnGh0XGvK5x1+VOEANi0b6YYY76Z5uH
         iIIQzLWzer/Nxa/AxXI47lzMZlqJvrq1ltHe9s/OuFW2OECUZoKLVi6cnUBfT/3i8cFl
         DTen+uOK7FE4Vy4Rn7MkdBxoAGlGf/P5pNazDipoZ3k/f2JX6uYb3HWWcX2IPOOcdiyw
         6VwA==
X-Forwarded-Encrypted: i=1; AKwUvByvWpgmHObaPIvVbo9Nk263MssH3dkT+ekzpBHQjxidtFqmNWA4KKfbvP8teb+qrsrmW9thC/JPTL9npvU=@vger.kernel.org
X-Gm-Message-State: AFq9FYK4kT9RB9TrtyKiH5eQNGKHL5lMfLKdiPbx7QzKemt6CKr/UnW9
	uawsD1mx9R2X03AcXHz0quGMYgJoa1J5PC71HXpGkjEyKONRw8sPpoWLqgluW7M6vrEAI6a6sO9
	+nT3jnbmMmMbDrVwCww5qkWLbqVlO7LlYBXGLMnSJu+UNAqQdj1OsCwW6CAxa3aPwOU0=
X-Gm-Gg: AYBFou3s+WzTLqykIlvfMDmml26CrpCSN3Cwh/ErZ1FXelbZYj32stRH8QBwDP3yOzQ
	HwGeG2fG8KE/bXraAbaZ+rQDby54R/JUYfQEJr6c01iVF+nGwW/e2fUZk6vffG+Yfi20CmPR/ZG
	+vtSR/6E831i9iGewB81FM5+ZZ4KSmbE/SB8lurkTMyI5mpZY98ySUJtigvDMVBX9eQ0CxT2CRt
	jb/hq0LVgU5bDUpiw16ebg1gv9NfvMd6wN9LSfTfBJwYZ4yo5PyzzsyPh5uXBFozTPUeM8uc4v7
	rUdZccw7+GD6zZmGa0PkPd+6GOPVD6smYA43V1RQlYGM1eWR83FgQEFdZZF+x+3fhWOkEENtksc
	ff6zI0kl1o75efSFvj498Dg==
X-Received: by 2002:a05:622a:13cf:b0:534:f411:a5ab with SMTP id d75a77b69052e-5359fba6f4bmr420749401cf.4.1792140344271;
        Fri, 16 Oct 2026 01:45:44 -0700 (PDT)
X-Received: by 2002:a05:622a:13cf:b0:534:f411:a5ab with SMTP id d75a77b69052e-5359fba6f4bmr420749011cf.4.1792140343686;
        Fri, 16 Oct 2026 01:45:43 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4091eacbc5sm50742866b.68.2026.10.16.01.45.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 01:45:42 -0700 (PDT)
Message-ID: <380b8aaf-33d2-4c9f-a746-10f080711f22@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 10:45:40 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sm8350: Add the EPSS L3 provider
To: me@fromdisposition.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261016-sm8350-cpu-bw-v1-0-044ac6dc9565@fromdisposition.org>
 <20261016-sm8350-cpu-bw-v1-1-044ac6dc9565@fromdisposition.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261016-sm8350-cpu-bw-v1-1-044ac6dc9565@fromdisposition.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAzNCBTYWx0ZWRfXxPv8l7yRsgdo
 OKkUAVOJVgdOPzT6EcmO21CmRXgUJqCLftPLN18HR/G+aNytCtR21TUNQIKstoZpvFDRulccNyb
 Db1K5FxGS91zfIjE+CYfhnQsmOVI/BY=
X-Proofpoint-ORIG-GUID: zyuopucXWoPj6AbqHyN7p3NpSqMHCQgZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAzNCBTYWx0ZWRfX2uHIbnXgZo9M
 POPlGSpGMCMCc3rz2D4W9zyrZHpgLKmLVJB7U02Ff2Erc4Br5iwsqpqKmi+HjbllLq/oJiSaisG
 rvwOjDhs/XBa1jLhxUVpcVLOrN9iNOAnL5NsC6r10W6RqBaMMxNtCV7a/xpHK61SIjBC1l6iaIa
 6pHMzSDi7hntP418LoPAGI3f4o5Y4RawZ2W7dqL+HRHZOP6b82pIo2bH/+SUuTT6nbyUGcObx1d
 N4VUB32iaoUcreOz6AN11CBHF/1dlmV7VSshgOMP0cgk6EJeNzMIn8JURmDKmQYQGpVF6Z4ON0N
 c8bDoCqgZlLe1Y2b6tUM0ASLv00cwx3hGvVSAFnG0AEnCL06P1yd2406vt5aW36PAVFaT4HIEdS
 ELL7trFA1eRu3WeiwLxrbTFA1QOzMypfdC5h/6w4s9jDdf4PTQ7vQvGUL0r3nv7J9wETd0kKWxk
 RAqJdM0M94ZIdF097mQ==
X-Proofpoint-GUID: zyuopucXWoPj6AbqHyN7p3NpSqMHCQgZ
X-Authority-Analysis: v=2.4 cv=AN0XGc5Z c=1 sm=1 tr=0 ts=6ad1e438 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=Tt5JBQAfAAAA:8 a=EUspDBNiAAAA:8 a=rBtVOrUcsPcThs3KVNEA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=kpHMOrJS8sLNr5ru0mYA:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0 spamscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160034

On 10/16/26 8:01 AM, Demeter Barna via B4 Relay wrote:
> From: Demeter Barna <me@fromdisposition.org>
> 
> Add the EPSS L3 block, already documented as qcom,sm8350-epss-l3, so
> that the CPUs can vote for the L3 frequency.
> 
> Unlike on SM8250, the L3 is voted through the L3_VOTE register, as the
> downstream driver for this SoC does. The generic qcom,epss-l3 fallback
> selects that, so no driver change is needed.

This pargraph is mildly useful in the context of this commit

anywho

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
