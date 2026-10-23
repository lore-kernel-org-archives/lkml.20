Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792751044;
	b=bfCU2FUeqAyiHywezlxc7fd71a1SwTJMncucQJbHqPBzV9gCjWO5qoRp1PKnm18gb32y
	 MTNhuRWMK2srHYmL2FxOh3jIXXpI+uyTWUKpXVhFzq8kPvmUC1vb+wkcrOOP/+cHOC8ej
	 ZThKl3TJzfxt00MmumQTMyMfEGimuPYDsk8yESxLdvvsWdZ9Aou1PxlugojfBgoul6TVJ
	 GVyyewKlvSQhA5ZMlkPhqpf8yhGx/shsdpaJE2OQv+Ess4OJzzoGUSJdXPebB2BT2fPfl
	 6T1Jd9ILYz7NgWVbAXMXzz/+ioJvi3zkDH4bM50zuHHesdgKoBtZZ6ue2P+4DOEvTew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792751044;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=AB1BQQvVTkQHNjM+5OSNHokWQOtdwlR/NDdlUhu12m0=;
	b=CoNCMZDMH3OMXN1RB+pbi2+0aBfJHaCz0rMq7sICcIHrhvKmA+QPhyJ2OCH9QJicGVIu
	 L5DEXpvqYt1JWA+5+3j7GwaSgS25gceOzxq/vy98IAY97uiD68uZhTDbU0IBikDkcWxF3
	 zUVvXl5a+bp4cp26PjMLoRTwl099W/fhT0nDGksLl/NSRzhQwQW2hR5vMD/4Pjd7Rsvnz
	 7ZRW29E2V7SnmBLotfj1Qkq1CtjXBGuG2+pQ8bNbtaCbWb4py2YFKDO/MUwAieajlL47T
	 UETmY96xiNS92OexmNkLA/2Xo1oLNB5lyWg83O7uW1ghA5xGPC8g3nh1SOkhWGjNzmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=k6fcnEVF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AYSjHGAw;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62605606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:24:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62605606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=k6fcnEVF;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AYSjHGAw
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NAAHXI1597388
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:24:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AB1BQQvVTkQHNjM+5OSNHokWQOtdwlR/NDdlUhu12m0=; b=k6fcnEVFqKFqohpu
	26hkUttDEURZCKKo3dqJ/CGgx8kw7R0zM/0d2FdEZSi7r+zGMS/s9YUn2mSomQnf
	iWl3hJJHL7UMsfuzWzK8ILQ6cWQVsNFLNjeVp6PLqvzRkJqJcwPZ+CuNLnjsDc0U
	bmCobvZOP75/U/b0J/ryfHEh18Zr/8TNZe3zEV9KWtt8R6wqlaL46bjZZhdLosEb
	Gtbk9wT7fklnZg9bF3JdbwA7SiPP/H8gsOLnkfAy2oKK/iGeECt3wZyHtgLprzU1
	Wvr1qb8FnxlNpUS1MB7MxI3kzoXsl7kYv/F0wx66rTuX7fzt1Dup8W42Z2oDFWTI
	jXdOmQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqms36n4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:24:03 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f1f1f2ecfso18010085a.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 03:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792751042; x=1793355842; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AB1BQQvVTkQHNjM+5OSNHokWQOtdwlR/NDdlUhu12m0=;
        b=AYSjHGAwTqMqfuHFa+2iIy+hQI/Ym+fvYlpp1uDkZVf5Pf5fJin8tEp7Um5GtONPp1
         yXOWwLi3V9ESqlVQe7z0ablVcnQm7ObB9B/Ds84/HxRxLWAaTAWfxNLjlOjrHzY1bWmj
         HDGhjvxmX2FHwLto2DMNp+v4hdczvr7TeXu+J3dCxHhTnaoZAwTMA+mikl2vhOgqZUaK
         MOXcFvPUZHNQp0VfRVPdMLTpkBbPRz4xRNdmgYGNk48leQTbpkH/7aUB2CKEsBCs1Ew5
         edjnQqPMrqco0J38z8pVWfTxjb8Sn0urXzAQoFKXior970Nl3IeSoso7wPT/2K/rpI4a
         4CzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792751042; x=1793355842;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AB1BQQvVTkQHNjM+5OSNHokWQOtdwlR/NDdlUhu12m0=;
        b=ytB/rSSFOdWOiE0y268LcF7zcMoSDeG0Ig/GmJpssGsE7B4im3TFHjqZ7o9UEDMOKt
         LM655xnBIBKlregCLOeVKZShOqdNEMSDM0c51f+6lChyu4kJI2FiZesiviwWOaSd75EH
         5BCrn7Z0/06MzQW8Yl4dh6fmYdYdB2f6hWrGzwmsdXZ56VLmvi3RNBn0E6UzelmvgUld
         h1ylwxNRDEAyXS5Cub8iqbnAPiTMNFHgB1VztwgRSgPaJG9zTt6skwfkwGm2A23+Bw5V
         DvLt4/3VleSxEWBUGFZix+7pMfr1js7aMR8ZccH4RevVPLnWjZNhiLIQLU5iHuou7lhn
         SJwA==
X-Forwarded-Encrypted: i=1; AKwUvBxCIago5gYs90ZdMFIxXqlAZUaP+burkpEAKneKWjV/FIhiXJZjhHk4Z+irfs/GMi5HHybFQkajNhHZgPk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLQb/YRRq3Dp84VPNV5SvqPv006ILsmr6vcFrt3eXE8bjN2qdFx
	nOGR1/ZQ5T8ePvckcYWq2SNUxTW9UXnD4YBV8eXOaBV9fxnkfF9DdhVnBZN09tYTbLQFWPbY0l6
	8egLX2sX5bI2M8yw0fi9TUXDWYHNyK+Du/jcFhYoqkJz2hT3/QFvEQhITl6nzDREQ7zg=
X-Gm-Gg: AYBFou0Cf11o1C1LxNRQOPoYEUCggS/cPYCFhZripZ2oD+gvDW4I8aBkU6OnEq2Xq8p
	ig4zmdheZ54/viG5HwYw/ipLsxdsHXSdAOpWRpfgI7X5g/VsgJ3kasxAwwAPornFOYs1XLDWOPP
	zmbgCELPwnY0OE5qhx7/kXGVO1wKyJecIqpfrzpv3kQFDJoZMrCnlb1S3eGNGUg8E2P2mfrUeon
	Z4c4MCnj3Qj3wqpeBIvvnBY/x/0QR8YVxqmHib362dON8gHtf/kMYEsMP0bq6IhASPcxUqEGK1H
	u/afBxfcQpNf97Bc9mhF27OoGjMWZx/DdOYMnvdWWHoleh7+f4p1YWAziMnlq30jmznI+Fbwtu9
	e62NPTrcx70rlw7ufFbfVwQ==
X-Received: by 2002:ae9:e208:0:b0:93e:e111:2771 with SMTP id af79cd13be357-93f6f7c51c8mr345314485a.2.1792751042440;
        Fri, 23 Oct 2026 03:24:02 -0700 (PDT)
X-Received: by 2002:ae9:e208:0:b0:93e:e111:2771 with SMTP id af79cd13be357-93f6f7c51c8mr345311285a.2.1792751041992;
        Fri, 23 Oct 2026 03:24:01 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46a5cb7fc6sm86648666b.51.2026.10.23.03.23.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 03:24:01 -0700 (PDT)
Message-ID: <de3e5baf-dab5-417b-a9ed-225cbc56ce1a@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 12:23:59 +0200
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
Subject: Re: [PATCH v1 1/2] phy: qcom: qmp-combo: Add PM suspend/resume
 callbacks
To: Prashanth K <prashanth.k@oss.qualcomm.com>, Vinod Koul
 <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20261022104321.306679-1-prashanth.k@oss.qualcomm.com>
 <20261022104321.306679-2-prashanth.k@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261022104321.306679-2-prashanth.k@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA0MCBTYWx0ZWRfX29+TmD43hlxs
 wdb39whJHejqg6r7p4CaGYVi1PlKpRPJUlcwoGhR1HKBILqS5xY/US7UndSyR68EZiL6ZJ4I9Il
 6HBtdErbQvEImaDc3N436HAB7aiYsggA4BCHzIJKiFiuN4xK2taY2uLAGNdJEj4q03ktLWIaAQD
 hYEgB3dULerxv2A/WilX896WMDXWt9TSKmmyiMk7Tpw52TzIGGh+p4S6j0P4eCpwyXYksuRIzMw
 88mWVB1oUOLPFhvX4IqV7MojmOFly5cXYt0IKi/45PzjyDTXGqBD4GCe1VMJoP//eJyFUJ2mM+4
 PIWPOEvQwXObXkRPyfGjPbrd4xCqXS/cYycAtbKbIyBxDURBTqFDO8c8mLTsphEzgBYEeWGYNY3
 Wt0Aw1gBXF/TC4OL/iSGH828950BsrkN9Kqi5O7yRVs0uAx4FP4jj/v8QJB8cN5sp7B1r7CPTfW
 dzrdLI7/xVlC9nEkppA==
X-Proofpoint-GUID: cKtmMldqDoK4SYHX9rW0LFfVDGLcrgbk
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA0MCBTYWx0ZWRfXypjuk7+Fu+me
 tps3KRRPGyG0TSsZRAQwnfv0ewghwXFBZuszK7hz/7rOYwjWPFzzAoWuHsw4fxCVYEpc9C0Q4U5
 mW7Jm1VSfjeqz/3RvyKWSSfUb0+BkcY=
X-Authority-Analysis: v=2.4 cv=UdbE26SN c=1 sm=1 tr=0 ts=6adb35c3 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=fBNUL6i4Ua7AmJppQHsA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: cKtmMldqDoK4SYHX9rW0LFfVDGLcrgbk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230040

On 10/22/26 12:43 PM, Prashanth K wrote:
> Currently when we perform system suspend, the phy clocks aren't
> turned off leading to power leakage. Prevent this by adding PM
> suspend/resume callbacks for the qmp-combo-phy which toggles
> clocks on/off correspondingly.
> 
> Signed-off-by: Prashanth K <prashanth.k@oss.qualcomm.com>
> ---

Well this still leaves pm_runtime_forbid() in the probe function..

>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> index c39ced168d03..f624195c9b84 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> @@ -4463,9 +4463,26 @@ static int __maybe_unused qmp_combo_runtime_resume(struct device *dev)
>  	return 0;
>  }
>  
> +static int __maybe_unused qmp_combo_pm_suspend(struct device *dev)
> +{
> +	if (pm_runtime_suspended(dev))
> +		return 0;
> +
> +	return qmp_combo_runtime_suspend(dev);
> +}
> +
> +static int __maybe_unused qmp_combo_pm_resume(struct device *dev)
> +{
> +	if (pm_runtime_suspended(dev))
> +		return 0;
> +
> +	return qmp_combo_runtime_resume(dev);
> +}
> +
>  static const struct dev_pm_ops qmp_combo_pm_ops = {
>  	SET_RUNTIME_PM_OPS(qmp_combo_runtime_suspend,
>  			   qmp_combo_runtime_resume, NULL)
> +	SET_SYSTEM_SLEEP_PM_OPS(qmp_combo_pm_suspend, qmp_combo_pm_resume)

You can instead do

+	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+				pm_runtime_force_resume)

and as a related fix, we should probably throw a mutex guard into the
runtime pm functions

Konrad
