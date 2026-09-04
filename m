Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ECFC3385AC
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 09:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788512414; cv=none; b=cs6dvvZvJJU51jm+6ndDT0An2RaVcBO5N/669TOij9jJf5jp8un4i42RcOxkpP/qA8VE0tDok2mpl1gmSbMNmIBM2BPSBG+B1bfwDu7/mTRNZrpzJ5gMxL8KqkCVjfWvIydkH8G3TVtOalhXT75Bd5hhCMFC/0yLIieUAd8tDto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788512414; c=relaxed/simple;
	bh=TwdMkfkku+7xLhkQkYda0UxtIy+OV/r23+7AedMhDfE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NzYR9+Q+o93bm/IwS8XlmAHq4Ss1Igvw0b5uuFdoO8XUWNQyrALDdy1Rrp6nx+8d+I9shhOXjsDtGCXKqIog9Cuxn7IhrSCFYIUgRpYMDy2vQP0dQlugWJc268sDbHVnkAsWNYXOgOSHVmLvPfkAG7RTX+YdUjLiYBjDOdL6bRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RgwQcusi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jdsnk4EK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RgwQcusi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jdsnk4EK"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6847mlrt1770395
	for <linux-kernel@vger.kernel.org>; Fri, 4 Sep 2026 09:00:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hPrFnyRkQ5lya7hdY6VenELDRNtS6j9fb64j+zDHYFs=; b=RgwQcusiD+sBqz0F
	jF2XOTgx2pvLO5qTcCp/KU57VdohSxr1FqohE1cUY2tk70/TPuqmFfLaMLktqg5G
	p4MqrQnqlWaHEFJUah4LmnpDevNJ2eLS/gnd0y1pFcnONHPfRtNjZQIVvRymxVSY
	v4R5GIk+wNf0LXbGizShkEWD5YmrmXmp0Xbd1PHNjPXeDphndDl8Ddm1kU8w8OZB
	/YZ6QQtzCG95q1v9KMPEviI16gYbWaZVyfLdO+kisFMjX9kKo1Ks5eGMfFdUZiSs
	rUPqZPmbNa63fw8kXGxpLCAHsjUTGkR52R5Qo/+UoO25SToQqlmkMr/Y2+Ue1T1w
	ifDMYw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfpmqrwqs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 09:00:10 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93821883e26so17275285a.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 02:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788512410; x=1789117210; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hPrFnyRkQ5lya7hdY6VenELDRNtS6j9fb64j+zDHYFs=;
        b=jdsnk4EKXh1WqVTD9C1oTBn+Uu6oiMFKyeZjw3rDJOHOqNFAbSFSLiXnyeqmUJ716q
         k6BuLP9rMlm3LvzQH5aKTJ69VW4aH4Jgvpcwnd/u5f+BWs8gzijsrrJ51IHJ+tNyrJwH
         HY6Qgd/bcpam873DI5q8CG2Gr3NfaDAThuzBK3/Jgz1wWeHkm4kTgYAAxdIkJyJ1J25P
         udSCsfBRFyfudfue4AxElVrHgoHM3MqiRu8sYQdsgylW4VaAuW99L1lKdo0z5GuWsp9i
         QPwLNtQAGhO97PeuUcewqKy5tv5o1BfmNiM8vEh/UclW6eqj22Fel+uIWUopYRn3+VuM
         BK8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788512410; x=1789117210;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hPrFnyRkQ5lya7hdY6VenELDRNtS6j9fb64j+zDHYFs=;
        b=lTLG55U+4eFOeRV2wOdi9VwRNBnfBpeCbKTmLgbCk7ygQDHQB7qbgXZCPSMudXAtq5
         A5Je7U1aFaymY3GjwQymeUfwS4Y2ZIW8YdmAMk0l6I0+5GSI29nOfr8Ft7h9ymCJNdKu
         K6LopROk30mmDI98PnQ3n1q7rXpvuY9NH/gosElbPgtwm7ZRGbK78MbZMRaDbXCou8PM
         wW9M7stJJSnFW418CTvR134/K7KtPdBFpbmjJPW0lJxBTpLGVW3sP7RE4aTMrdcqQBaE
         mpSGrtu1a60IMpAGox7mr+e/ZYxKmjObJFbc6JB4pH9u6N2Gt1ggcWWHYeLKBAbP6JDc
         W0WQ==
X-Forwarded-Encrypted: i=1; AKwUvBy20RV7l/2y7Nyuo+vyjhUE+sYMo+vQoh0RE6b9Lbsw2tHSCizHPvL6qgi/sALQDb+oMJG+qiNgfm5t7m4=@vger.kernel.org
X-Gm-Message-State: AFuF++ndn9Gcj4x23Ib2Tqj+29Wa/pS2ZvJuGHJPFj1xcEBcUBFcGXhv
	VgWhRbJ3eHBrf+GwSN46t2hO+YJb1tnIgsVICVkMZI2oYUCDlaV2N+5j5cPuyMk1bymj6bTUD8G
	ydCQI6/emxTcRMUUqXBbecwjqwWTmu5G9mcYwbh/dNw7M0mIBDMHW5o6Y+VaiHWTTRx0=
X-Gm-Gg: AYBFou3jNCCkduO+L/BB1Azizwb/js8/4GA058OssZOBQJaCALCRG/oPwX8EX7TBQSX
	KuQNOCK1sDLglJlT1eSbQdYJ6A6U2stOUgQCA6Xt/5ZBjxW5BESYZmf4pPv6wE7OvFqnneSkGRW
	/SrjvVQqzeZS6J1Xdg5OXftg3MQ8nInPud90ax0h5wGdG1Pv4c6fqT8aF90y1u17ovnELjGF/D3
	kvBrALAX1lchWskAXEaC9X96Hn4ncbQXSB0bQpQ8/EU48lrS6VgzAT0wNsT0nkPolKcWkcxET44
	RAP60zVf/58OoYCAeWpFwZExcIkrLbLILMNHT9+89L8mZzOClHPjEjUi57I6fBzYtuGyeMmEtGA
	RYhhhGUZSKjwkH46ImF1CAg==
X-Received: by 2002:a05:620a:178d:b0:939:4a24:4de4 with SMTP id af79cd13be357-93980c5c987mr285927685a.5.1788512406231;
        Fri, 04 Sep 2026 02:00:06 -0700 (PDT)
X-Received: by 2002:a05:620a:178d:b0:939:4a24:4de4 with SMTP id af79cd13be357-93980c5c987mr285923885a.5.1788512405649;
        Fri, 04 Sep 2026 02:00:05 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a7e6c20c0fsm895767a12.30.2026.09.04.02.00.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 02:00:03 -0700 (PDT)
Message-ID: <0f5494c7-c3c1-4668-a09f-d8c43d1c58b9@oss.qualcomm.com>
Date: Fri, 4 Sep 2026 11:00:01 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/9] soc: qcom: geni: Derive SE clock configuration
 from OPP table on SA8255P
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Mark Brown <broonie@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, mukesh.savaliya@oss.qualcomm.com,
        chandana.chiluveru@oss.qualcomm.com, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-i2c@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-0-091697dbeb02@oss.qualcomm.com>
 <CAPx+jO9fcvBsxe9yx9oK=0EXmpNwub5ba0a-TGk1WRFaRGsqpA@mail.gmail.com>
 <177884a8-902f-49be-8fcb-b2bec3ec7d6c@oss.qualcomm.com>
 <CAPx+jO8bXn2F3cWz87Ozjrh00E+a_UWBrHeUViTEkTL87JHW9Q@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAPx+jO8bXn2F3cWz87Ozjrh00E+a_UWBrHeUViTEkTL87JHW9Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDA4MSBTYWx0ZWRfXyHGPEkkgPyPO
 Zu85rxsJYa9YsQWqLMkDV2GbZHdGfM8ouUmwDhW/2HGKerWZInMRHJTPt4tfgXkFNPiO44to9sE
 KLEp5FL6fVAJ/SScpT696eAS8jKEGxc=
X-Authority-Analysis: v=2.4 cv=eovvCIpX c=1 sm=1 tr=0 ts=6a9a889a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=tfn4aQiUfrmVOWBwnpMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDA4MSBTYWx0ZWRfX7BbUpyCWx0tC
 Wf7kZdPjxKaXS39C9850gc0uvjIr4PPUhzH1muiC1kZ8kzYvjgJL4Z8UIASsbJ0xJlN8qebJDeP
 PmtzcY70SURRc/frlrMM4TMu5X8EzHQbCt+dYUifVyWtiBpXB8HW7HYMYRJJXTAfjeZ1drkvdII
 vJZN2y6XgRYx8JWYeNycvOQJGlAi4xElc5VHjOeAl8zv+Zg9AZYWERieQXfB1SjQDaEcAOxe1DY
 f6wT0+TelGknMrBp7geFt34zrm62NMdzaMR8fS/6xXdeJfQeFzLJirO13mBYayIyECTWP5LeExL
 9TuOB8Q8k1fH/ZdzAsd+LpGtE3mcRtbxgm/9pO6NXrM32BRGnJ3k2Gg7ncdTB6nfuXiyzpoZEx4
 34wmIE7z6jS/iJlfuslfvihELY1IyEyNkn02UDjSexf1Qrq5I4/u+562arkYY5IWcHHjNlT6j+R
 7OisgUGXM/TcBccthvw==
X-Proofpoint-ORIG-GUID: IzECLtBt9WnlIpX8lLuIC_ys7VyPxEgW
X-Proofpoint-GUID: IzECLtBt9WnlIpX8lLuIC_ys7VyPxEgW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 impostorscore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609040081

On 9/4/26 9:56 AM, Ulf Hansson wrote:
> On Tue, Sep 1, 2026 at 6:48 PM Praveen Talari
> <praveen.talari@oss.qualcomm.com> wrote:

[...]

> So geni_se_clk_freq_match() is used by two consumer drivers today,
> drivers/spi/spi-geni-qcom.c and drivers/tty/serial/qcom_geni_serial.c.
> 
> Beyond the $subject series, there will be even more consumer drivers
> that call these platform specific functions. As I said above, I don't
> think this is moving things in the right direction.
> 
> If this can't be solved with generic frameworks (clocks and OPP),
> please clarify why so we can figure out a better way forward.

The way I read it, isn't geni_se_clk_freq_match() more or less
dev_pm_opp_find_freq_exact() called in a loop with an increasing
divider?

Konrad
