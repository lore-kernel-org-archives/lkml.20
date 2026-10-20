Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792463611;
	b=z5Xc1bnfdXfpcdY0BCwMcDJR9BcK/xWVW6AW74M5wW2Rv+qv4V+BSoU02faMzk+HHLWQ
	 fQvuyYzpCZGEuPaTdWxC9SyorNny2eULOqcCh6kvEmbZoL+AmKZ/BoGcnYaQvOVhxijQb
	 sH/CkVSuhX5LZpoUKW1sc/b5GXgvY3YxlaSXA3hJi0rLvDm0q1OGuzQeV3LEEwBeefTw0
	 QYJ+j8EnWMbrNXHVV1pQtjulNlOBJEUj+jQ+a+OmVRaBPb8W8qpSQkfPmrNjU3rRYKX/g
	 WAHX4it+YHqBdEDDRgnsHM7ygUo6XaTWpCQ80uAiJyxukdJHMZow6RWckfdGXXNr4FQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792463611;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=KyR7R/n/BMtcxhz+FKYe9XMZme440csJf63HZ+pAMjQ=;
	b=3G2ygoZ5VjsZFhc2PqdDSbMX1R50u+tx3fGfvsbTqca0Z8vBBlQztAZB8DlFwRKIw9iU
	 79ePsAgybR/26cciLayb7bd8kZuNz9lI1PCs7gNRzKjsYl+h68xHBak6N/cCRCuxN9X+h
	 hkPSdkf7g6Y/Zpv3IKBPw2NmCHSoOkkNez9O3j6gDKVbkaJGWL3LljyMhHAq1CSW6zFe0
	 arNWG9iP3QmF7MEUCDc+oa0NUP7JB/9TpT6WhrG/sG0KPoKeYDSEU5CbN1IG8FtzxVa/T
	 XZl3zhWlKLZr3BMrYfVpTUIAzXPRVgHbA6XMbMxalHCan4xHYTAY2kG+dMuZprkzTVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AvEYhajk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A4JlVp4o;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 479DE606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 02:33:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 479DE606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AvEYhajk;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A4JlVp4o
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K0tTwN4178291
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 02:33:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KyR7R/n/BMtcxhz+FKYe9XMZme440csJf63HZ+pAMjQ=; b=AvEYhajkuQt8o29d
	C7kgM0zGyXGP3h1IR7csnCpzPA/j3ob54BjBq7dqU5iRINmffts9IPO9NFd5K/XV
	3ChTj3Mtju2Bgk1b6sflMxtB6cgkNu2jiiDs5osdBaWWi43WAO1Cr8Ui3gRGobuR
	tiIng0vP37F/Jj3TRTRMS48qV6pZaZU2MbZjBWJRdSP8Ete+0wjSH+WwDpx8XQEi
	v8f50x4nEs7j7Qd6E23RWPnnAAqxO7LEgtMHOHVcQArOCBpKo0bdhieTiR3cpq0f
	BVHUHT3334MfmwFDeC8QrRvrX9ghdrNlzeKu+vZWDLYaxOSVZMdRE0Z6O9x4L7aA
	8RIV2w==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n0fr7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 02:33:29 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-35cbea41088so4622081eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 19:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792463608; x=1793068408; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KyR7R/n/BMtcxhz+FKYe9XMZme440csJf63HZ+pAMjQ=;
        b=A4JlVp4oqhIXbMtZ1KK3SBsSj2irpFLCidsj7Kffk/mM82mUJsHFJgFnZGze8xw4ZP
         HEmyxdZMFWIm0Pg0yUr8zj6ni8Nf6i9sTCldCjM269YrR6fR7E+0opKjZ3c2e5RmjIWT
         Q7WSALAgU9c4ZMpmXrWPZC6HT3hnEXG41USXvAtiHwSyhqCmtqdfEoD98AbMaX1KwcTj
         4uA9+Aeq3Ls0LMgN5q+MS7Wby3z+bm+RlKIDn+tIyLlVcy3ij0DCmqTi8DbRe1c3gt3x
         dQGoaKo9O2CpUMcJml8s3VmJaMq8/8mXke1dlHqjuSKgqfizkubH35aq37BxV/eN0a60
         NI0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792463608; x=1793068408;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KyR7R/n/BMtcxhz+FKYe9XMZme440csJf63HZ+pAMjQ=;
        b=MVnc8kjWFibMNuRj3JRCNtol0guFAym83x9MfgeJisQEjrNa6Je0SW4j6rxiBHcuer
         CR/9dT7bgxV2Xuhbpc/XoWfaKsBMZ82PpDsJiFE9L8iiRYets4fUJdQo113nwE9x33wQ
         HMzjDFlngRstLPNGrzMFjbAsRNJjYQEmOf33QQIkDWQp8zPsts12a4bjeR0VLa7aDusl
         ctULkqQ1WL3Loor/U/y8FqXXSbokXgl3NX0a1PCHEPpz3QoQ2CgIB20kOZGJkHXAwHqS
         n5pP0evdDsM2MMOLB04lAzT0yNZzXvnocAUSeT1Mdzegjicg9i1ZlCXfCNCNpIt4QQnb
         xKbw==
X-Forwarded-Encrypted: i=1; AKwUvBzzhWgjNAT6LYib7u2YjWECw9yKGWn4zuqLZZNCQIQukw1519BaeyWDJUemZF+ULTaCMS8rGLtTVBFFeHc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLwgIeTUcbCllzec9y3zsCWILpDS23ocK+2htfdn438ZOrdX7a8
	YmMArzk1D1iHCM8IHtiomnoCzogIclaGbq01S1vxbgE9+YmGl5DYQenGYUzMVhy8kLLPdCcUHDO
	dnEbkJ+FRwH4UyfhDRZHsC17J1rs9DtXq5C251clt3Rqw4pbR/iFKeyPn9/yf5kYbvqI=
X-Gm-Gg: AYBFou3Ea42oEmq7XNrvtEWuiViizMYUQ7sdFV2DXBbjujndsPY09B7KTTBGo0I5O7n
	fUR3XAHd3vHsVcJTeZcR7ZuPhKhMZx6vPXDhLMs4kOXFWy23LUrSf0Mtd1LS0KjV/KoP/E4gJUh
	Y8nzpnEYenp0LISYtw5EB1Ape0hXGfaHB3T+CNzY0lNaWGyqJDiAWK2J4kfjs9YQEDpuVwjTgPZ
	xdZGuWl03q85WTfBywZXJXY2AvGrZgeWf+lXK67WSO7NKKEvh8CMMzzlXiFizWTIbdrl3bPu/JN
	YR2XP4+zNjR29slw8TuPt1iAYp/Kuafxi54LzrQg0OMKgSQuDBfkIWDBB1W16PcdowFeszrNTZ6
	qX/tVKVQQVbe9YSTAxKR4eA3CjDQ+b2LI8wY=
X-Received: by 2002:a05:7022:1709:b0:144:fc5b:2121 with SMTP id a92af1059eb24-1851257915bmr10416492c88.17.1792463607831;
        Mon, 19 Oct 2026 19:33:27 -0700 (PDT)
X-Received: by 2002:a05:7022:1709:b0:144:fc5b:2121 with SMTP id a92af1059eb24-1851257915bmr10416462c88.17.1792463607203;
        Mon, 19 Oct 2026 19:33:27 -0700 (PDT)
Received: from [192.168.1.235] ([47.231.130.140])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-18319d3b880sm30462917c88.10.2026.10.19.19.33.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 19:33:26 -0700 (PDT)
Message-ID: <6b9e2f4f-70e3-46cb-9c81-48df7a8e1cbe@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 19:33:25 -0700
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
Subject: Re: [PATCH 1/7] phy: qcom-mipi-csi2: fix -EEXIST probe failure on
 single power-domain SoCs
To: Bryan O'Donoghue <bod@kernel.org>, vkoul@kernel.org, kishon@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        neil.armstrong@linaro.org, mani@kernel.org
Cc: gjorgji.rosikopulos@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        jigarkumar.zala@oss.qualcomm.com, loic.poulain@oss.qualcomm.com,
        vladimir.zapolskiy@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261016235502.2274268-1-anusha.nandi@oss.qualcomm.com>
 <0L6D4EGEbw9SabH4L1sIcfqiZK6SmLBEjQEK5ljwkWxWQyXebQ9BNv71oBQmg61s3p8ja2Se4FlB5VtG5EdMXQ==@protonmail.internalid>
 <20261016235502.2274268-2-anusha.nandi@oss.qualcomm.com>
 <fc2c2f40-8a55-442a-9b0a-d73f040af60d@kernel.org>
Content-Language: en-US
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
In-Reply-To: <fc2c2f40-8a55-442a-9b0a-d73f040af60d@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: cD7V3eM9Xb6IpyIC55mi5QvSSklpbKvo
X-Proofpoint-ORIG-GUID: cD7V3eM9Xb6IpyIC55mi5QvSSklpbKvo
X-Authority-Analysis: v=2.4 cv=L7qI0OT8 c=1 sm=1 tr=0 ts=6ad6d2f9 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=TcmD64HtHlR11PSYA/r07w==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=YCULunOEXgq0kEsXk6YA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAwOSBTYWx0ZWRfXxJmnHLx6sfcu
 VnMZKgK5iB9fyZpxjLnDl2RKyOybFt+pnqexaDjl9WriINt3rtooY0fswX8QN/Xdecw9StFNKqh
 05yShURaUg9t4/gVpVq3u9V+nghJkE/vDecz4WmFSo3SAsQnPi5QyGJa1fjm33CuUD6VwiVfLsl
 5COXRi+LuizfvZuhkTcFw42MS9YxZbRVEF9bO99jeDEwJCZHMGM9/HY9iJRnxRCZgIgSysKjI9j
 q6y/dw5hKTznQ4jjh4tN3DPFIzoEMrkVybUJM2oAjCVj6akFOG0lLLggSKrO4q0xc8RKv797TwP
 O/UweSTxxYJmKfB8Z7yutWpgs91QX7Rn3p8wtKVD5Dx8nW5Q2RBZjiBFqPx4Q1VV8JyoI4hJpQQ
 CoMMub5I/WuiyUXhJzqPRdO6dKeWoCulqu5snznJz/9PgwMDopyPuRJtHGve2jhYyep7x5QRi9P
 qDXLMHkUUdMMszPk7cA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAwOSBTYWx0ZWRfXzfqBhCN/y5Eg
 FsqYdSGJ8jJPLKBXVYoiP8hd5d3Xqw3U30JrMbBACvDRrD0pVWoTSTZnbQxkw2UJZvQsJvbQJMb
 evzIMMEDteb3qsRjl8r/B6NmmQa+d5c=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200009

Hi Bryan,

Thank you for the feedback! Will drop this patch as a fix
with the other comments addressed.

Regards,
Anusha

On 10/19/2026 2:55 AM, Bryan O'Donoghue wrote:
> On 17/10/2026 00:54, Anusha Arun Nandi wrote:
>> sa8775p, qcs8300 and sc7280 each list exactly one power-domain ("top")
>> on the CSI2 PHY node. For a device with a single power-domain phandle,
>> the generic platform-bus code (platform_probe() ->
>> dev_pm_domain_attach()) auto-attaches it via genpd_dev_pm_attach()
>> before the driver's own probe() runs. phy_qcom_mipi_csi2_probe() then
>> unconditionally calls devm_pm_domain_attach_list(), which fails with
>> -EEXIST because dev->pm_domain is already set, and the driver treats
>> that as fatal:
>>
>>    qcom-mipi-csi2-phy ace6000.phy: error -EEXIST: Failed to attach
>>    power-domain list
>>    qcom-mipi-csi2-phy ace6000.phy: probe with driver qcom-mipi-csi2-phy
>>    failed with error -17
>>
>> x1e80100 is unaffected: it lists three power-domains, so the generic
>> code does not auto-attach any of them (auto-attach only applies to
>> single-power-domain devices); the driver's explicit attach is the
>> only one that runs.
>>
>> For the single power-domain case, call dev_pm_domain_attach() instead
>> of devm_pm_domain_attach_list(): it returns early when dev->pm_domain
>> is already set, so csi2phy->pd_list is left NULL rather than built up
>> by hand. The three call sites that walk pd_list for genpd
>> performance-state scaling now guard against a NULL pd_list, which is
>> harmless since scaling is unused (scaled = false) on every SoC that has
>> a single "top" domain.
> 
> Fix implies bug but, this patch really adds support for one power-domain
> cases.
> 
> I think the patch title should be something like "Add support for single
> power-domain case"
> 
> or if you believe it is a bugfix level change add
> 
> Fixes:
> Cc: stable@vger.kernel.org
> 
> My own preference is "Add support" since the driver hasn't been designed
> to support single PD cases thus far but, OTOH you could make an argument
> that that is in fact a design bug.
> 
>> Signed-off-by: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
>> ---
>>   .../phy/qualcomm/phy-qcom-mipi-csi2-core.c    | 24 +++++++++++++------
>>   1 file changed, 17 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c b/drivers/
>> phy/qualcomm/phy-qcom-mipi-csi2-core.c
>> index c0a4fa20eaf0..00285be9dd64 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
>> @@ -43,7 +43,7 @@ phy_qcom_mipi_csi2_set_clock_rates(struct
>> mipi_csi2phy_device *csi2phy,
>>       }
>>
>>       pstate = 0;
>> -    for (i = 0; i < csi2phy->pd_list->num_pds; i++) {
>> +    for (i = 0; csi2phy->pd_list && i < csi2phy->pd_list->num_pds; i+
>> +) {
>>           unsigned int perf;
>>
>>           if (!csi2phy->soc_cfg->genpds[i].scaled)
>> @@ -174,7 +174,7 @@ static int phy_qcom_mipi_csi2_power_on(struct phy
>> *phy)
>>   unset_rate:
>>       dev_pm_opp_set_rate(csi2phy->dev, 0);
>>
>> -    for (i = 0; i < csi2phy->pd_list->num_pds; i++) {
>> +    for (i = 0; csi2phy->pd_list && i < csi2phy->pd_list->num_pds; i+
>> +) {
>>           if (!csi2phy->soc_cfg->genpds[i].scaled)
>>               continue;
>>
>> @@ -204,7 +204,7 @@ static int phy_qcom_mipi_csi2_power_off(struct phy
>> *phy)
>>
>>       dev_pm_opp_set_rate(csi2phy->dev, 0);
>>
>> -    for (i = 0; i < csi2phy->pd_list->num_pds; i++) {
>> +    for (i = 0; csi2phy->pd_list && i < csi2phy->pd_list->num_pds; i+
>> +) {
>>           if (!csi2phy->soc_cfg->genpds[i].scaled)
>>               continue;
>>
>> @@ -233,6 +233,19 @@ static int
>> phy_qcom_mipi_csi2_attach_pm_domains(struct mipi_csi2phy_device *csi2
>>       const char **pd_names;
>>       int i;
>>
>> +    /*
>> +     * A device with a single power-domain entry in the devicetree is
>> +     * already attached by the generic platform-bus code before probe()
>> +     * runs (genpd_dev_pm_attach()), so calling
>> devm_pm_domain_attach_list()
>> +     * here would fail with -EEXIST. dev_pm_domain_attach() returns
>> early
>> +     * in that case (dev->pm_domain already set) instead of leaving
>> +     * csi2phy->pd_list unset; this is fine since pd_list is only
>> used for
>> +     * performance-state scaling, which is unused ("scaled = false") on
>> +     * every SoC that has a single "top" power-domain.
>> +     */
> 
> This is alot of comment - looks like LLM babble to me. I think it can be
> dropped the code is pretty obvious, if num_genpds == 1 do this other
> thing here.
> 
>> +    if (csi2phy->soc_cfg->num_genpds == 1)
>> +        return dev_pm_domain_attach(csi2phy->dev, 0);
>> +
>>       pd_names = devm_kzalloc(csi2phy->dev,
>>                   sizeof(char *) * csi2phy->soc_cfg->num_genpds,
>>                   GFP_KERNEL);
>> @@ -369,11 +382,8 @@ static int phy_qcom_mipi_csi2_probe(struct
>> platform_device *pdev)
>>           return ret;
>>
>>       ret = phy_qcom_mipi_csi2_attach_pm_domains(csi2phy);
>> -    if (ret < 0 || csi2phy->pd_list == NULL) {
>> -        if (ret == 0)
>> -            ret = -ENODEV;
>> +    if (ret < 0)
>>           return dev_err_probe(dev, ret, "Failed to attach power-
>> domain list\n");
>> -    }
>>
>>       ret = devm_pm_runtime_enable(dev);
>>       if (ret < 0)
>> -- 
>> 2.34.1
> 

