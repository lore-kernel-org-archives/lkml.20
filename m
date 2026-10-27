Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793098767;
	b=d6MplUpngA2ITKaNiQL6PgQM7joBx9A/J/ULtZqFv4D2ZOAgfontc9PL/8qQ0LSZHHaz
	 CHCN7zWeyfu//yfKvNCtwtfq9CCiU/lZOuHfDz95pcoGu9C/VspE988NnRX84d4V2HR2/
	 CySnnQhVuuX0lJo39pT/1tR/hf0W6joDRljHI6nT6E0uIVyWJ8d9dmLHd7Lti5HGt2MXe
	 CYek5qqaOBm4XeCHc1NtCXpHyBDbf8FTHjFomGhQ47tO5FAg7J39jLFg5cOAujN2KoXiQ
	 ZEdI1p96fxhQ2Flxm9i1wWV/MD6NRf6RDYYRBn8ITnqqyyXM0UP2G7oqMO8yM5xtChQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793098767;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ykAqLoi1r7lMGwbeK2sUFMARw3wZakPbFC2fhUJSl/o=;
	b=Nhzez6Odyu8Grqe7v2GtcRdxPhlvuHb5ZYNY16yT2BCGE1sGnfi8P2fySDMjYSJyw9Ht
	 iiT8aC24HgnjvBksxTmyU1CJvnYvzh+oR7jCjkwaWrK2Z9hILgaGC0yUOaeSM28Pphsr9
	 rUL7pkj2jKX2xPaA9NmyRiBDnK5kadJ8vQFVhe7EI70Iq+ti9UtolzNHfepXdkU6rFkSi
	 rSvy62TgI0rmfgaCZESSMLZiTuyRt3d2V8SrASfLZM0+3+/emdq2pXk0rRxTf0HjQtTxS
	 pC2tG2KW9VLpujAV8uGNLenKjySP+zQqcNa0AXj2kX8zmV3QceG7aiWzpx1DNBaxvkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OMBgYIPt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="hueOEQT/";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00FB2606A321
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 10:59:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00FB2606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OMBgYIPt;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hueOEQT/
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAeBJG1615033
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 10:59:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ykAqLoi1r7lMGwbeK2sUFMAR
	w3wZakPbFC2fhUJSl/o=; b=OMBgYIPt9T08DlmnRfVl6Gi+DMt6ReICnWuXECkd
	MBE7LkZ0raB+jlsfl8WtH+h+vzcGxO9v8OVBBodYX/wiPt2R/aOn9n5LNav3++IP
	W6Wa85taDipM9pgkzo1cjPrwGnvXJ2Lr4Vih5YOtu1ZnkUW9bSnnVd7DXalmFbi3
	Zp1YXpZuTlCKjZWlbePxsCCTglCpukctIPvppBeFpqjmPc1AWHq64ek9UMzqqDQ3
	BKBLgFL8YEHTHg6ZOu+SUYIGTXEr71oojboRRdLYw98rH00DSTAPiukDrjx5xc/s
	ZTJ0QOxQ5/rZfPoLR+/zcD2GrBrvaFVCZSIrSEE96WdwyQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjqf5rtde-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 10:59:20 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-535131e4c25so109674431cf.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 03:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793098760; x=1793703560; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ykAqLoi1r7lMGwbeK2sUFMARw3wZakPbFC2fhUJSl/o=;
        b=hueOEQT/1f8F+8ejN0tfrj+PWmvO8rcKLox5IHvLDu/0azAYz84w1OuyRUxs7ylFA4
         2NBwl0ELm2a/5JONVpDPLnT22l/XbT/Ro1hxpUrvF5QuC4IWcX3W3wa/LX2A6Hh1LbAo
         zFIsWV1IFnHDgxVECn7Aw+aDjKcXGYnowOlxHqpoOdvSvh7ImFKgOlzoLNtav0NNZPfh
         tO/ZIVg6DHi47JiM1tCQJ5yamnTLuDw5SgnG1bpP9ytEX23JWNXDg/LUoUGpNlWwELa9
         45t/VZRAVoGNF34CRAJqiSNKQcN6l9aYTMcJKHb1AsyEeD+pF5XqLICTyksRVhSqfYqY
         hSZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793098760; x=1793703560;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ykAqLoi1r7lMGwbeK2sUFMARw3wZakPbFC2fhUJSl/o=;
        b=F3kvI1/Byyi9JBqKe4CMLmnH5Om+SLzR2uUFEsNCGEXrRI44mMJBemhe16uAI0mBgh
         EkzY/zJwgzRtPZW/W1qKfd86QYMlcEGj/9Uw+0wPgup7PWKWcqLgZQVbPgbFM9e5oahf
         eI5AeABO2MwZO7tQ6EZdEYsw1PyJrBBDk+Jp3YtXMHFSJ2JuPA3aFsV+u5enQUXsxvwF
         2NFM68rfjQ+LQFIQKvX5iIPsvAaFcYf+W6cUCWEdn5t00ckrGc7SbjIHq62iJIzq5lvw
         EJO/Daock4mtUwT/XGOIxv6dRIwOHYmlj2IP1yW9XL6gLltXUKbyKTBAgh/l0Ab8pLqO
         UAYA==
X-Forwarded-Encrypted: i=1; AKwUvBxO0L+9DX88F/VRzZeINWBe86JvNXS7z/B91sWALdkQt9zpZuEvMmrvaWYMe5BuaxmkKUiWUKDid1TC4tQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLZLRfbhhLzzNDl0zwsQY/DsXyqllgcMQoD5p7ZEb5Voow1MLqQ
	Fpfm8IzzMdwbqvpe1Pr1r1uFEEbZnzG5RjBt8OBVqIS695qXIcrIBcWwp8JC/Q+P9ljRWu0AJxp
	IEcLHPTDhVujqiTyT3kX17gKHx/goU5wtjxpnccYFAOT2gNUfIgLE+YCDbn4ebG82VqQ=
X-Gm-Gg: AYBFou30aYD8c0YhtXGwHDn90ZGH2E5rAXbmBQfDPCHSampgSnvhDIlXE4ZXDUKLUD7
	i4Dr0lW4vjGn7B+pC1Rgc6kLh5dR4lnZZUyVC3b4xJmQD5TmRl1ZBXqoLiyAGBPpoT0qjvjP6hm
	69jE2yOHkq84HPHsuXmjrJ1hI+BYQ1eUBjtD/xiAFcSLHh3+jbKkSab+uKf7CsTnKsVVeiWLouA
	iL/TiYep6wQ52fZ+rBz4Duq9hYWsE3N32IMD81isfguvTpy6NbPbHH3OuXBQfqcAeB2nczgBx5j
	SjABYpHiMS+WayZEmLnCQVidwglbLrGEi0ecK7Pib+hkSKEJ4rVYgZgbgE4MeLvPaTvOlpW9UNK
	PUuiT1rjyf/rF4fHb
X-Received: by 2002:ac8:5750:0:b0:535:33a0:520c with SMTP id d75a77b69052e-5383b350840mr170740421cf.3.1793098760228;
        Tue, 27 Oct 2026 03:59:20 -0700 (PDT)
X-Received: by 2002:ac8:5750:0:b0:535:33a0:520c with SMTP id d75a77b69052e-5383b350840mr170740191cf.3.1793098759624;
        Tue, 27 Oct 2026 03:59:19 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a5ea0df763sm178309875e9.3.2026.10.27.03.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 03:59:18 -0700 (PDT)
Date: Tue, 27 Oct 2026 12:59:17 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, Marc Zyngier <maz@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Anna-Maria Behnsen <anna-maria@linutronix.de>,
        Frederic Weisbecker <frederic@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 6/9] arm64: dts: qcom: sm6375: Do not mark MPM as a
 power domain provider
Message-ID: <junlahp3txwwj2bs6pi3lhlvidxcp3zgvszb74xbciv4n4ymvo@tfyhqi6tr7mz>
References: <20261015-b4-shikra_lpm_addition-v2-0-ac7f1a0d5638@oss.qualcomm.com>
 <20261015-b4-shikra_lpm_addition-v2-6-ac7f1a0d5638@oss.qualcomm.com>
 <5ad62m2ix47ynkq2ikghkxdqpcyv2tjixtojdobpjpdwbkkab6@gjklpaosvpk7>
 <114418ab-dab6-4772-994e-5babeed72b65@oss.qualcomm.com>
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
In-Reply-To: <114418ab-dab6-4772-994e-5babeed72b65@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0MyBTYWx0ZWRfX7/yoxsm+qRuL
 6c61LxOaGkLtcat1Q2GjBNnUqBaaAwUTlkuFysFgGLtaZhwsbxQEg6yZDt9mPLXj1aEKvyWmh6J
 tWw0iUSS9zfZQCYa8lPTB4CdhrFk5pM=
X-Proofpoint-ORIG-GUID: gTR8OiHBpreCNrHE_902JKanZb2tV5tx
X-Proofpoint-GUID: gTR8OiHBpreCNrHE_902JKanZb2tV5tx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0MyBTYWx0ZWRfX0RPfYjRZWTpb
 HhXbvnoseTDIn19XlZy26oQW5sWw9SPw+/AVHnAzm2OVuSo7RzSU7t5FEq3LtnZxlG0J/jd83CC
 1H4GIL+N2p9GHcbc7y76qHXL2Y66vIXZZo6JW0GURYbBxPNR1CxGoW1C+SGT958/hJjMBpcr7Vq
 vcNL9A/yyuiD8UZ4BOi9Tm+bdMZpSB/UsoG8M86/CXo1KTc9hIucCDuIisnJN/Pp1D+KXvkxcJC
 rqRcJehvrVD5ldy28C/M2Q0eLK2tTl01XLEpCHEal31l/wkA4esM7OzP7tCjEeUrTHlENTctAYg
 yEIz4sCxXh+OMhLV2yB23TKRLFBRKE0vqSj6C/2xRIQ+U/eRXTnAVZtOwGJ1JsCRxdUhu1/JC13
 Unj+y0g3GHApmk6ZuY97QTcLwd9fGwu9eMIf2cUh4qvtfF326NmLyktMZjAHoJ/F2LEJflVbrsR
 pd2ygCts7nSBxOiaE3A==
X-Authority-Analysis: v=2.4 cv=UOFIjyfy c=1 sm=1 tr=0 ts=6ae08408 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=bcB-52WucOyEF5bHse4A:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 clxscore=1015 impostorscore=0
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270043

On 26-10-27 11:23:25, Sneh Mankad wrote:
> On 20-10-2026 18:30, Abel Vesa wrote:
> > On 26-10-15 15:25:22, Sneh Mankad wrote:
> >> To make the MPM design more logical and avoid probe dependencies, the RPM
> >> notification is managed by registering for CPU_PM notifications.
> >>
> >> Remove #power-domain-cells property from MPM device.
> > 
> > Can you elaborate a bit on how the two phrases above are related?
> 
> The MPM driver now supports two ways to handle sending the RPM notification,
> either in the genPD's power_off callback as power domain provider, or within
> the CPU_PM notification framework. Removing #power-domain-cells instructs MPM
> driver to follow the latter path, which as explained in cover letter would
> help avoid probe dependencies.

This should go into commit message, I think.

Thanks,
Abel
