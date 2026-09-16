Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D5D63B14AA
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 05:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789537810; cv=none; b=BudxI+Lpzwd0ByVR8slJoQdzVaQlsBTGD0oIuCafx7LiiVkm2Mi60q46GrbOcP2bKVUnUr15qQ+1iM474iH31yHdgWscHajIWkIeoVrw1rnam6vT/7pah2U8j8plSrUh7HRsJiREyHpy0CyVoIv1QW6hwtK8cGL5LOiLRqKGRAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789537810; c=relaxed/simple;
	bh=1o3UUeX5SyO/7s0qR20vXeFpKutvw4S5SelUnoNEQ4E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nBn9w3eE+izSLoELf5O5MnykEPGbBu6TSrM9WqOg9fwLNVZiqcbRL+EySJ6DG4JswSPm0sHbRmYXR4K6mI/bwBSwSdrsy87fhEJurCrHj1hqZDO/I9PgbozwSOtzq9wBn/1idvLdOoPPtGxXb4x8OhTc253BS8gg/vHX5/vuZNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AGIJwSEB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QrrQjJJo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AGIJwSEB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QrrQjJJo"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G5lrPB081083
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 05:50:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sydXEQboxWYY2OF+1019+c02kN3LlYjXa79sZbQyCcc=; b=AGIJwSEB+L9UUUuz
	6GaT7q57+exQXcySaCa2vpF5wHop5bPz2l+J8K8jSM0OyLJtDnxFNS8NWVdqX+2w
	mG2SOS41SL56lBqhl+hik417Xs98ghBDtKvtNQiggoNw/2LN+gwegFAcDq/P4Ngy
	0SCaNUIfJM4y+PBf63/V0QYdH3EQ4v7cPRz1D1YXZP3EK45Hkk3sx+yaiS6BNFnx
	21zyYLSFWhysLLhi2FiPhWumUma/R+QxBOqZ4uvwt0suZEQUy7kf3vuYMizRADjG
	r8xZjmGoAkhcGOyhc7KzfslI+/kUCdvSTxRqvT9mM1V2bv3eiKm+YNTR4DqboTF3
	VxuyTQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqagejk0v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 05:50:07 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93a01d1d1b6so669362585a.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 22:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789537807; x=1790142607; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sydXEQboxWYY2OF+1019+c02kN3LlYjXa79sZbQyCcc=;
        b=QrrQjJJo/3vJ7uoRmxT5QA0C/M99ev8XwFenyiwUcbKJA2mgjMku8dUP+qPefYoTjP
         p2INuPGWY6X9ribOqwCHc6k2i1y7OFOA9fRBCNAVnrMWwZ9tJuFLKefmjewBkWNcXS7D
         xmYDz1wg2dG1KHrcScHZWyXWjmEPPEWWbEt3KXAegsnjPBg2xctR7nPUByul0I1CUxxu
         fn0PoZcHfUA65padVrXR8J/j4nPfMtgFAoYhqdorg7l9RjxqooVB7xGovwPU7/+GwAak
         Anmst74vSJd11JgcQ1Gt6M3D2JnzpqRd7qMPUwedBKZHgXpGOga4iMGYRwsLZ9wSPDiH
         ytgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789537807; x=1790142607;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sydXEQboxWYY2OF+1019+c02kN3LlYjXa79sZbQyCcc=;
        b=IybGAahB/vF5RbP4asmtZUig4BZrRUhkoLOREOWJ0iraU7iz9rT+bzJ3Ih1qi5J/tU
         jNIX1fWUA3be9DJwJa6dTh7PVA0MZ1/XM4/E8DvLixA4XhC6wXe/nda++kslRGoVWBY4
         9WrYNBWse2i0YSwqY+HsVhK8GZLHFFckKwgI2VTGdFkMx34Yiyb1wB+B6ncUI0t+0SI1
         WRH6O6FhdBkzNquSMPOGrcfGiByu9kGuYv3ld/5cA177mGZlcYFgmxkuhFnEgvrnT0tL
         QSEugK7zmIGrCglJLNoJi81rkm6bAabrpA5UI++A9812rkETpURWJrtnIacj2iJ9Zx5O
         kVNQ==
X-Forwarded-Encrypted: i=1; AKwUvBxeMYTnS/lFLB9neOUT42BgEGnmGpOaDK8mFApkTs24fGztK7VF/zW5xq9SrE/K/uwbYMkDW4V2CbIgkz8=@vger.kernel.org
X-Gm-Message-State: AFuF++nypV+No7t5enGN6XiZgUHjtXnnylqxF24tWQlJU4CXo+/g1Qka
	hfPjRFdvgL4feBTa6XDyLPiLyTAtW9DWrlYbmZEN/5NTpVqB3o0X4vVzH4N0zNDN93Haa32QX/4
	JDwXbmZTiRGHsUwvxU93LHFefRh3QIjE45efOxh+AF05zGguY9y+cNfWMUFUoCA5pm3hR80rE2X
	g=
X-Gm-Gg: AYBFou3+BwhxlInw+my6ccReEtjBiwY9m+F5HUlGXj3C2+fULce0FQ2zv+HPeabvPG4
	o6BosUsdCgkAKZLy3OJSVaRaZLmA3IwRhqBLGuuSSSL845P0e5tiIQt5FE5/1zpAGSX4v3NvWlP
	cuCzmO/AvXheCvxhALjkpitpG4iGVilAqhM6JkvBKvsMa9V/viZxVUEiu+Gq6cwfeBYdtgDFK8b
	laDywtIbkfEg2AW93iLr45Xlf3LAJpK0Bv3T9VpXp50Oqwv4b3NhwUClvZkaaLvJOqlZJAo8Ytf
	gc3N0yXGtzG+laySfWq9pi0dwBJqv4hn/zRd0B4WYIbupiOtRrlGqpXOb4IoFFSfUyp0RSbx51v
	cCGIRNYyeWkejNOwM1ayJlvabh0pn
X-Received: by 2002:a05:620a:450c:b0:939:6dfa:48fc with SMTP id af79cd13be357-93bb796a4c8mr198355585a.50.1789537802423;
        Tue, 15 Sep 2026 22:50:02 -0700 (PDT)
X-Received: by 2002:a05:620a:450c:b0:939:6dfa:48fc with SMTP id af79cd13be357-93bb796a4c8mr198351085a.50.1789537801906;
        Tue, 15 Sep 2026 22:50:01 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83b02211sm52631695e9.9.2026.09.15.22.50.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 22:50:01 -0700 (PDT)
Message-ID: <3b3a9bf0-6fa7-401e-bc19-390bf22ff30f@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 07:49:59 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] irqchip/qcom-pdc: fix linking against QCOM_SCM firmware
To: Arnd Bergmann <arnd@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org
References: <20260915195948.3521662-1-arnd@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260915195948.3521662-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDA3MyBTYWx0ZWRfX+KAkCmpRwW/D
 zeMUn0e7wW6FNoqHnqdB+cVy8h1xiMTEQiTZkit0SEcJeQicRSYHxv/K3AMcteytL16odPrbVwk
 aiY0skTs4SAm/caDnZjRpiDdGyKKT3M=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDA3MyBTYWx0ZWRfX2ZjqjZZxlig2
 qmWk2vwbv7mc2XM5Ki5bc2/KOKNKmNEsJO2w4ucntlYF4mZLYNhCm1M0GoYyKZUB5Ho1G3hVTcw
 yUCBWza35TBe460QTPYUIveSjXqCU7ZC5+4IqgeoRRD8Rj4OeaTQaroBmgmWAswBW6kBQHoSeI9
 DOmrhsBwnI1kvTHLFMUuS9wYWddj3QhLSLTDY+3kfHln2/glyIqiTQzYydsxK5imWRMkDysPCLa
 SC99qdASZH+3fQhtEpsp++Ovdm+YYvs69Nl5nyt9f37p1nQrCoHkmPrMlDtGxjPRSu1FIz5xy+E
 i8V/dAdYX6Ur3tRpwTy2WLlbL3nHQIqNJL8fmr/EiOwMMqHBCaAzcJpWwst5fRe3EQ4t6x8PVe4
 gUZgZxJqx/B8C5m1Vrzz/7JSW57/rJd2SkNAHolrpE6qjWL+5zIL/qJvgIBDJynaXrqqe1rpyAk
 fmpe5nXvB09laph8Ywg==
X-Proofpoint-GUID: YyHZhW_axx8HKWxiFk-nj_1h6_Z6fP_2
X-Proofpoint-ORIG-GUID: YyHZhW_axx8HKWxiFk-nj_1h6_Z6fP_2
X-Authority-Analysis: v=2.4 cv=PcZqFShd c=1 sm=1 tr=0 ts=6aaa2e0f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=c6t8_EwWaMI6EkzQIlkA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160073

On 15/09/2026 21:59, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Build testing with SCM disabled or in a loadable module fails
> with a link error:
> 
> s390-linux-ld: drivers/irqchip/qcom-pdc.o: in function `qcom_pdc_probe':
> qcom-pdc.c:(.text+0x18b8): undefined reference to `qcom_scm_is_available'
> qcom-pdc.c:(.text+0x18ce): undefined reference to `qcom_scm_io_writel'
> 
> As QCOM_SCM can already be enabled for compile testing on non-qualcomm
> machines, but is always enabled on Qualcomm Arm kernels, use that
> as the Kconfig dependency and remove the ||COMPILE_TEST check.
> 
> Fixes: 1b852de05f74 ("irqchip/qcom: Enable compile testing for QCOM_PDC and QCOM_MPM")
> Fixes: ad01c2b2f291 ("irqchip/qcom-pdc: Configure PDC to pass through mode")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof
