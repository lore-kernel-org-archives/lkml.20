Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E801D4AAC4A
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 08:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789718556; cv=none; b=RMM5HHcmbnHlMEMl5Tj7taDmJE11chAzjXois9nyOuCqXV9ZgKekNZdr2bfoUkphcs3C5veou5idfs816/QiAr35gIDm2Gc9cKjf5v7jHjd/Ja4Tq6kz9lmLFEKiPOe+dLnVWd1GSHbt7E0KVrrTfiE9W3ynwOfc9NDqt8eoE4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789718556; c=relaxed/simple;
	bh=H0JBUe/EMO1jDRgyP3JDlGDtcpO2ZiZNH1bkYAtEw5E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RATGl4NNryhJwo4Lh01b0uLV0HdV1CIdf9URTdSXN1+vgdjmNmYYRszU7T8YW4fXFAF1UzkHx3gCisrEOQajXU8ZpeOf4Zs2F+OoyHCGxr/Iwc4varQp+UxUaeNWU0KO8mT8hPL9+pjx1+ylnCB6LN/hePSwExVvQp3u+/AQ1kM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EulsZUwO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RMGfZSEI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EulsZUwO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RMGfZSEI"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I5xrUE3834545
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 08:02:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yecFht45A3Z4564vTTjcaZ4Yfxl5AMB1C6lm2vKtsvI=; b=EulsZUwOr1HtmugT
	76JcKklLlxafRkkNiGxkvh1QFsZqImpSCTtX5RbOGBnwErhP2+/jaJylUWMQO1zV
	vw3+Qfz7sjeq5KewahfVEVw9X63m7sZSwHE8ULsI9AuQEPigcwut6kEseF3mJops
	4pBYeVIfyr+3Ucw7klbyFp4yQNDI6Kh75M+rXxP33x96nQFebyH5Eqj9XQGFM5pO
	Kwi2bJz4WiMwgRYAOQtniAFUlQ4bUVZ5ozjTThagXEH51uGmdpsD3rJuR9yEhZHh
	eVoTmUACezDeOuIt5UC+GI8A3mXlJZgP2KQL9wfKlXhb++gmMb3zhGJz2AlH6SgW
	N4Sygg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gry2brkfj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 08:02:33 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-530db5af1dcso1354151cf.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 01:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789718553; x=1790323353; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yecFht45A3Z4564vTTjcaZ4Yfxl5AMB1C6lm2vKtsvI=;
        b=RMGfZSEINyBYgpbB0hQTKAKYNe6TJP1EybJB6vbM74E2VEZUBK12AjzFORrDgPV8oH
         MGQ5/FEEOTE8a+XlbD2QhCx2PtO9M+CVHjhsJoRoRPrG1UUv4f3dhutQk9YVLCSFrZQf
         x7rAD6DbrEQKiw3zUE1huMlSXQvjSHHe+nYJ0mxk0cFzboI0nAqm7fTmfijywgBHs5kH
         HncDUTRDcq5Xu+oSi8wt+zmJ/v0OSLpSNTD63gqcazTeaOwm/OOY6pvwv56W0D46XVkv
         u6rZgwH891rwvUn/o8PS6N6kVgWm9d06GVOkkg992+JSc5vj3s3l98MOMjjlNaWlAnZX
         j09g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789718553; x=1790323353;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yecFht45A3Z4564vTTjcaZ4Yfxl5AMB1C6lm2vKtsvI=;
        b=ZvtBW8Cwm6mL6+6M9d4FycrtOjGMX0g6uq2WL65wutSbcIh+PfZfH4+zZ13PkOxHrE
         z+Qpn5WuGNQ7UVLS2AaX4KDoFa4JSq8b+kvCySCuzBsjzueLayHR3giRb0zB8LW1k+fw
         GKZzRbXo3KSSfvBrVKqbgJlWYQzIzpd4YJKvNhDvzcnprpvw30owFNF6c3pMcNjr0529
         vtKRqrmXIOlQCFxoljKBPUQOMpYc03vs6t6MK4+IJvVWDMPHX3kFg1+Y9xxCPy6gGVDR
         ghg96we3HLtmXuDxktlUc+oJoaK5sRh6lSELvBUQX3/dss+hqsP+opAg4R8DvhRCnV49
         0IIw==
X-Forwarded-Encrypted: i=1; AKwUvBwl7QsKQBsOr/F4EL8HoEOMzQsGw1FsBVxQyMEgsss4oUqacFZjU2Ui4UlOl45QskAbA/34HqdVcjPFe54=@vger.kernel.org
X-Gm-Message-State: AFuF++n8jc9l58hmvlU8L3mJi1ra1lJfr4XufRXLmZz+H0q1k0dHn/jH
	7Rh7BNOZWke4oF3xQSipmO7EXe1g7Oj2uEAQTxLroeeiPSaeUKsPW079OKhfppnoR01ZYgdgXf/
	XlzJBYrcz/ytDHjOBSMwrFeTcsY+XB7J4D2VkXq+rq0WdmMlelGkuBQA5m6EbWUL3s/o=
X-Gm-Gg: AYBFou291rvH42JWB7Q5DVGDd3ZdALimTLQWyJgW7kiMWCrfh5oIRwjBwBDrr11o6wq
	x61tQP2A7H+GNodTILJaOHa0npUCjVRjQwhqj0G1AS2inmkeLImahiXF0v24PGHcG8pBH3FSP94
	zJ+OzJ2OXO7O2e1C0Y7I6RI+rG2+XkNLtCYUn56ZY/s3cX+zBwk3r/A02iq6nbjkvbx4UAtIk5d
	rUPaPMXHBn4pbehPVwpa+neQFj4jmXoTOuD1xUEKYevUAsJP8Qhdfsp9fRT0pyYyI+7zp2pd/xg
	upxvgRBu2aACAL2/1L/KOkOUuGFV6AdAKxxFxnPwaVngRJeHzxYVsrYDi1Fip7oqsrjh+yqohei
	NQHRB8tL97HsE8jayMcwPuw==
X-Received: by 2002:a05:6214:e8d:b0:912:16fd:b389 with SMTP id 6a1803df08f44-912570aade9mr19737476d6.5.1789718548089;
        Fri, 18 Sep 2026 01:02:28 -0700 (PDT)
X-Received: by 2002:a05:6214:e8d:b0:912:16fd:b389 with SMTP id 6a1803df08f44-912570aade9mr19736916d6.5.1789718547676;
        Fri, 18 Sep 2026 01:02:27 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa5975d070sm505624a12.23.2026.09.18.01.02.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 01:02:26 -0700 (PDT)
Message-ID: <be0e4cf6-f16e-4dbb-a5e4-85760c20f37d@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 10:02:24 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] power: supply: qcom_smbx: Remove const from desc
 allocation type
To: Kees Cook <kees@kernel.org>, Casey Connolly <casey.connolly@linaro.org>
Cc: Kees Cook <kees+treewide@kernel.org>, Sebastian Reichel <sre@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
References: <20260917211309.i.765-kees@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260917211309.i.765-kees@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDEwOSBTYWx0ZWRfX8yUI78P7+r+J
 qJh0L5mKctrfdODqXVrQypqEeg7hCHJvxioCPBtNVj/a/7xOoucJqI/Qz65O3d2UiLQktB9ai6/
 MymrWdPBWsYOyfsdGeXTeJfzsSKUWjf8Teo30NkCrEsjB6Bi8OMNBwkLdx0he7z/lFOZ4n36+Hg
 MuOpuQQrVbtBOIIcQp0a6byfCeEXF8vpR+ML0vVU4mbLcMKHvycAvbS8sfbuxCYZI86K7wgSnGl
 bB7bVNRtXljiGBkXfEofognl46XzGqmv/Gh4UJVZo7dUQtGIerfNt42O5MDnYDoplpAeJeOHvKo
 u0zkwSQzV+YN0XsjYj1vmtr3dlKO680Yny5PfND71NFJK5FP+KgPeYIPAWT/TMHtKjQX+qUwIWr
 +89MD/cLS/bkZLGpsUP6AVcwbBEaYxhygxa3idWFAg7X0V+1APeKLFSk4+6UT5FMloFYsyeigJ6
 /GfhAQrnwj2xSYgZm7g==
X-Proofpoint-GUID: OKWQ8zYgcaHr4TWIuldZUGxEQwyPnx6-
X-Authority-Analysis: v=2.4 cv=bYP+w+PB c=1 sm=1 tr=0 ts=6aacf019 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=SE4sDywN97dQNR5h7vgA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDEwOSBTYWx0ZWRfXzLMvvGF30cyK
 LiftddfWfnLW5FHDo9a4XOiizXl7Ik1GCqxnsLaA6QP+OPiZMIANEXRapAoIY+eLGRwkERSQTvV
 cCD410+rQ+bJZy1ibcOvUprfpo9efXw=
X-Proofpoint-ORIG-GUID: OKWQ8zYgcaHr4TWIuldZUGxEQwyPnx6-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180109

On 9/17/26 11:13 PM, Kees Cook wrote:
> From: Kees Cook <kees+treewide@kernel.org>
> 
> In preparation for making the devm_kmalloc family of allocators type
> aware, we need to make sure that the returned type from the allocation
> matches the type of the variable being assigned. (Before, the allocator
> would always return "void *", which can be implicitly cast to any
> pointer type.)
> 
> The assigned type is "struct power_supply_desc *", but the converted
> allocation type would be "const struct power_supply_desc *", as the size
> was taken from "smb_psy_desc", which is a
> "static const struct power_supply_desc". As there is no general way to
> remove const qualifiers, take the size from the assignment target
> instead. No change in allocation size results.
> 
> Build tested ARCH=x86_64 allmodconfig with GCC 16.2.0:
> drivers/power/supply/qcom_smbx.o
> 
> Assisted-by: LLM coccinelle
> Signed-off-by: Kees Cook <kees+treewide@kernel.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
