Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 519C03B9616
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 17:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792259340; cv=none; b=BrUeEmKqZdKAf2emr7GO+DoHL5DuS08Jke5fFgWHCnM9RToLrw1+cNboa1GUrJvlR07D8DvEbdhFrpw/A7PWoDygDaBg2GRy77klgkVfdjb4e1YsHyL6e3+pcK+Dg+uq7IAio/zoz1JKeBbH2pk0ItHkARfaJAxT6zy8qEIgD6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792259340; c=relaxed/simple;
	bh=Aw/rmo0SoMK4/1lMvg0jDlp4PW6t+/JYcPEVs+qk2SU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WFzmXeCkirW0yR4UNqP4c4KjE46zmh+mhziCEh0lFxi29JnqjewMt72vXhE0dBOCmCAAGwljfTPgLreGCz72tjgmRnwQg4LqcLoSfJ0vBHNfT8SVgMjbihHoK+j0wpj1/TQ+EF35AqurmzPMw+vJKlC1aya8MgDwrdlO8gbWY9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pBmRWW19; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gQR7WHr5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pBmRWW19";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gQR7WHr5"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69HGA2Mq2032697
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 17:48:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2Ou8ogkNR435OrDIBgnY4JKUYxvqILFoUJ2x+sQgdqc=; b=pBmRWW19n67uiEGr
	mbT51M6fvZ6VAFyrAkl8BlM1cMc636y5XnCOQx990UIlWHlsOUcQeh5umXvxtUKz
	j6qrSCLUD/o66mnrqq+DO1E/x/gCYNC8G1QVIZqR7rsfsyWWsk6L2QV9kTLMphAF
	405KNjZw7Lq7Jbj6Vi4eUZDcB8wmAK6ON8MhG3DHH+9ZkSRGzL132LBPwVn47Z6o
	3UAWUU1eCQ1yVHPYBLk4K56krSEsFGoaFp6ti/6zFCy8SQWvXpxML3DmCeFSvAq3
	woBrsRnfqMiP85VzEK2FxGniEGvJty0CiUtl6JogOUOKLjnJAvqQYsi1IhP49z7m
	UZRzmw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc0kxhga2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 17:48:58 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3548cdfd2fbso1231622eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 10:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792259337; x=1792864137; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2Ou8ogkNR435OrDIBgnY4JKUYxvqILFoUJ2x+sQgdqc=;
        b=gQR7WHr5WWNc+snOSZhWnht9TsMm0jUpmypnPf037sFK/FZfKP+hsS1xSJA36hpMw+
         M/JHpJMue78aMDKH5RONbOBMitM9Yd1EU5PDvOogs78aG/d0hOHniXDo7GWqWPgn1/Et
         YxeMMlCFrJ1USgE8XjvPmqTGBMGVzGnvBzh0zFQitnXuAOceb3czvGs/VgYVMHqCL820
         pmh6VPpGqYSV8Er9LmcMseS6Kndm0t/SlEdRXCMnizTKGhNEIljrWw9EWbTRfTMSjs0q
         ZJBXHdV9PkGFwCU0COaGf7SwdksHOBEiI6UQVXsQ/MmHm3HuohwOU2rPuyrN7/jRMlZf
         /76g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792259337; x=1792864137;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2Ou8ogkNR435OrDIBgnY4JKUYxvqILFoUJ2x+sQgdqc=;
        b=17kCf9PR6jK74QDVYbu9zbgdbN3in5YqVWeJ/4BzLml2AtNsHEbW0A/zIVCCelJZO/
         IhyMrkR9/kAS23vrhLN89yMckoRD8YV0R5ut76PuisNQBPoMTJRGDiS/t3SrKpt0xXra
         uzCbJhtX4dIEqZD5+0yntMOtpnl0EWKhbF4ecWolXjGU9yNxFLAd/dFRSX7rrhmXzbvK
         k72moSskhGdnQp4GZBeYQO7gtuxi7I6Xmqq1VWaj8LNsyKZlAOkbQy4QMPrS63oetgsn
         KVUJ4NzS1C/HRlDcGiYc9ePiA+ANfUgaNZCmlgKj2DeJLj/I8dgPngFHyi/LBy2MR65n
         ighQ==
X-Forwarded-Encrypted: i=1; AKwUvBy+6KOSDm9m7MmbbI3ivwbRGFZEX5TSAgmIYwrM93ekAR6tljvJdhOTyFYqE1PoJXm9y28+Wv2UHcB2GWg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKs+mGMnKYF/2WuF9mwPu4Yf3v7a+A0OUdd5ZYY0ZZAJkGZ/RFU
	2GF9DT0BhqyRMD9q6sh0vbbIqnjtsloHuyOu2q+dmYA5kqSJ9e5xfQPxqUN7QgTdoTHtQf+57ks
	dkqnRZBnnLEh7ZVgNLfCjvL8E1eS9GZkeMgsLsgFFWFjEAUFq71b7zigJNr8QKxAw0Ng=
X-Gm-Gg: AYBFou1NIUdnySoYXVb8EO20FASxY2f7vNwsQ6BXa0EAd3+kKjBxHEuiBhqlPmf+ozS
	dc3/dKLjnoXTKqlsynZmhNVa35KZrxA+6oseDmclKcVyQAaerHspUFsMfVjAaOFtRjIJ0YRA7pk
	b06EEbH2/QKHBKt7AaiI0JGX/zxrtOj3jKvLnW7m+XVu76sxnpjMuEBwyYaPvRl7e6hhSOaDuUM
	oX20lfMKZPqyvHNMrrJOtRCjC4CivkfLzY+Ecu/2pjB/nmbeALimZpAUCFFmYhU1ogutAqmnDtB
	GO0qt9PRFpbTH3D06STiEFprBcfmA8uh/Cqg3JlHle4gdORUH8l6oCyaRR9bUyOOoawUFkrDE3g
	qw+qgfMitxVQYWWYn+TKe31uPOzQ=
X-Received: by 2002:a05:7022:294:20b0:179:a1d0:be39 with SMTP id a92af1059eb24-18513109770mr4604668c88.29.1792259337051;
        Sat, 17 Oct 2026 10:48:57 -0700 (PDT)
X-Received: by 2002:a05:7022:294:20b0:179:a1d0:be39 with SMTP id a92af1059eb24-18513109770mr4604632c88.29.1792259336472;
        Sat, 17 Oct 2026 10:48:56 -0700 (PDT)
Received: from [192.168.1.8] ([115.98.177.53])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831b859142sm15651224c88.18.2026.10.17.10.48.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Oct 2026 10:48:56 -0700 (PDT)
Message-ID: <851434b3-4cf1-4371-9b4a-57dba8022e13@oss.qualcomm.com>
Date: Sat, 17 Oct 2026 23:18:48 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] dt-bindings: phy: qcom: Add qcom,sa8775p-csi2-phy
 schema
To: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>, bod@kernel.org,
        vkoul@kernel.org, kishon@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org,
        mani@kernel.org
Cc: gjorgji.rosikopulos@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        jigarkumar.zala@oss.qualcomm.com, loic.poulain@oss.qualcomm.com,
        vladimir.zapolskiy@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261016235502.2274268-1-anusha.nandi@oss.qualcomm.com>
 <20261016235502.2274268-3-anusha.nandi@oss.qualcomm.com>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <20261016235502.2274268-3-anusha.nandi@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDA3MCBTYWx0ZWRfXySasMjgxLDNT
 1rVzKrTAIuKjpJW8v+Zlzt5/Umi6Geep+B2pwSon2FtiZ7lq/gy4ii4OS01UeA/oo4D/wO8Vr7r
 asHYhi1/oPBT2+wBE7Z63WvQbqxa2GI=
X-Authority-Analysis: v=2.4 cv=JpZkP84C c=1 sm=1 tr=0 ts=6ad3b50a cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=iaXPdgsK/hfklW56b25dCw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=1xeFRXLZlQdsslsJnZkA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDA3MCBTYWx0ZWRfXw0Q/oCH4cIVa
 jf4ajk4vlKEv5Pl9b3nkAznjcM/HabEsEgsO9Z57sUxBmTfS5/ls9UGIpXjtPk/AVtSg9/lgq+9
 sJF6mUGM74g7Yg2K5w5s6U3cXkdGC2V3q+EMsx6UDTxkf7ofVdKIOHuK/giy3h3gaRg4B5Kuncn
 4BILDBbWZOr4gK1+WDTQSzD44ggjyx8/chMZrSTt3nloE+0Ds1L5fPuAxp/VnKtINSMpNdXsL20
 C9KioFmyHR2FaRLznmJ6BhffTSYqxn3mnzaZ800QvZ9xayiK/yran5STruxZLic5nOu7JoKIH9c
 FEMOHScXHtw/VViHWi8wCxuP4LVFdd6wvIYxMdIVsVH03duzhsCzxwpA31JeSAkYnPVwPWxGpPA
 RDPIOSyI0Qhjc2Xx6+995BW/6IYVGP7vZlRYRFPGdgk0omTyeEf9tR+Pn8EwmOobVo+fREp2l41
 YizawUJIb1yiEenbn5g==
X-Proofpoint-ORIG-GUID: fVVoC8ByofjqveYt7ZmP0jvh2ju5Ge9I
X-Proofpoint-GUID: fVVoC8ByofjqveYt7ZmP0jvh2ju5Ge9I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_05,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610170070



On 17-10-2026 05:24, Anusha Arun Nandi wrote:
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/media/video-interfaces.h>
> +
> +    csiphy0: csiphy@ac9c000 {
> +        compatible = "qcom,sa8775p-csi2-phy";
> +        reg = <0x0ac9c000 0x2000>;
> +
DTS uses 2-cell reg but binding example uses 1-cell. Please align:
  reg = <0x0 0x0ac9c000 0x0 0x2000>;

https://lore.kernel.org/all/20261017001116.2318647-2-anusha.nandi@oss.qualcomm.com/
-- 
Regards,
Nihal Kumar Gupta

