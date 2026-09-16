Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFC7B466AED
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 08:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789548019; cv=none; b=vCP9juElva+R4vLnQyQVM6f2LhQmWn5InRnoEgBqChQK4/6kyc0A1hGL7XEFBMP0lFcwhYt42obQPkUME9kQi6knFwPOkaRDuSP+RXhTdwV7eM7xBctvLrmkDQgTNau440y5sDbt7B01TRicgKMWS67Z6szs6Xql38U7wCG7KzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789548019; c=relaxed/simple;
	bh=V+uPST908ARcUPbXsZ044ImTTxG4hdUNF6WNYVa1khE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dRQ5iZdAXBYwOPqMe/C+RXrvQlVuNbSSDJSvydJiqJiiBlMxlS1X7BWZM7Oe/Ao1PjRX9CE5SVWbQs7+ZqpCUb6u6xVzOjnCwPQcSrjYoZgH8fCu0DiphbUoZUqp3cekOFFnAvpeQG6gUyID9+INmjBttN52oCGN5WCDCz3bUos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CzkOeRvK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kczu56EZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CzkOeRvK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kczu56EZ"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G68ouw2085145
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 08:40:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0v0esT5zQ0L/7sBuFLspH1Wt9EuNM6Iwk/HfF5ZHe2E=; b=CzkOeRvKZ/Il1fGq
	PfgHu7bAoFRYlU1hcVGhiYp7ou5rH95zbeILnNuLzAZ0QL17PL50zJ0rRoRDmuTO
	wvwj0tQAdSLdRUmvQv4zGDY0jN+IKXAG+IGqnIJAoGuF0p+bhKkPYHZlwSiNq+1C
	lusrNWf3kL86da9h/kfq0hPAEt4OTzG1angAnV79j4oyKJteoAXN1K1L2Mn8Oo0L
	K72y0qnEVR4TMpHBh6Ic8ja2i/8zJaXnjoQMclW/F5nuBl5b+TxZdWVIKthwdv/s
	7VyO28k3JswSvm1+GusSnyaphy+uFf32epbGhoOIHhL2tPLD8lolBbckzeAUoO65
	4DQsMw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqjcksd8y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 08:40:15 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-939c30aa9a0so488861985a.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 01:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789548015; x=1790152815; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0v0esT5zQ0L/7sBuFLspH1Wt9EuNM6Iwk/HfF5ZHe2E=;
        b=kczu56EZ1DKgqEDxpVsRaTfFxXcJFfj/eknvS02JjrqILwrzrry5s0KifMrTv0p+wM
         QJyVQEEh9ROOACEXFCuBhYnImVD3Ru208Lw+5nD8uPgsw4NzEs14U1JNbpBT024nX2fY
         DmRk5FuXnBGYL80XAGHtXDTkKB6RlCnGhUPwHFC6bWnxxU9C4usPUKAxpIJTF3t+Tr6C
         Wk0mMSjcb4mM0Mg983EwM4PuCXsAgrXy9WYV40MCFyuF8pWpMKe3iFZsksL8bJJKlT3T
         xo93zyQsE/oVADZ5BPMxW8NLRTFaBWg4v9xcpRRRWYaNOHzUjPfvDKcAvQhM72dtYgTI
         v8mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789548015; x=1790152815;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0v0esT5zQ0L/7sBuFLspH1Wt9EuNM6Iwk/HfF5ZHe2E=;
        b=HXKz9zZDwvMX2izhPTh8KmfxiRZvNPa0pkxnL5rHbU2vDt5p6H/Os2YMIkWnsz93la
         3PC60YIaTTN2dtKbyAZjbD9c7tJZEOay97tqoIgfFGKftrIICC0z9t491E3TGzPt1HYK
         7HVWaHfvV+yhod0EE5wf/1fE5WhbK5fhW0//L6lyLg/U7nHCczuLc8FhNF8KVWgOIz96
         nKwhjERbFrwBKfrXTi0+VxN6QHv7VDGct+MMT8VfyOFuOxryKvZoNM8JgaMiZR8SA3pY
         kaX7yCVtkxuy/6nomyEqriK3pPiKdlZYpQoHpJtbbsL8XCJD6c8lfdjEdQvajhOa4hlK
         cngA==
X-Gm-Message-State: AFuF++laeWPdiQTYkmEhw8skMGR8HlAUlXKnMt3LzF4d+Cf2daTDSTLl
	QP2jqxq8hdLCuHtga4Ut5Fkfd6k5TItkHa8VtfffYrRXjxeTyqRcdxER1jH1LVn763LrOZlx0kg
	0nrilQfxKlzWHADOZ652bULqWP6Q6gzJAIImxrp0NnvsFkk1z4E2RDu4ZViaKgNtCoOF2uQbFD3
	o=
X-Gm-Gg: AYBFou24pJn2DR6yyRF3xm23QnjmjzhAjVWEggb0bK2FEhwUQBPD6ORs0iDzVEYTaoQ
	ZNNamIwfYE+UpjdHwE6LjacHMERzj+/cjkFXJjjGCLvrkSCfB9UMW3S8GiokMvzxLybJDKcdwiX
	yCdVn9oHOvkeTmzOcoSz54erppa8C7c8z8J+4fPgawljAr6c4XcJMsnCcydpctTWxHI3mZKoxzb
	//mrNzgD6ROtO24Sa+eun24Lw9EWdo+QVsx79aoe+VQLrmF1xJVkLVp1cLbkDw7YVvCpm+KveyT
	PMhPXf8/7bSJYBUdfQFzBqC/vNyG3N5wSgq8Hn149yBO+X8DnaxHBZc09wPAQfWw/NVvNFLGZU1
	B/zNRusHdqd18Tv4KGEcBoEOrfhU=
X-Received: by 2002:a05:620a:390a:b0:939:b8d6:9b1c with SMTP id af79cd13be357-93bb77b1c21mr246030685a.19.1789548015202;
        Wed, 16 Sep 2026 01:40:15 -0700 (PDT)
X-Received: by 2002:a05:620a:390a:b0:939:b8d6:9b1c with SMTP id af79cd13be357-93bb77b1c21mr246027385a.19.1789548014553;
        Wed, 16 Sep 2026 01:40:14 -0700 (PDT)
Received: from brgl-qcom.local ([90.161.207.100])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83d906d8sm73865635e9.5.2026.09.16.01.40.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 01:40:13 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linux-kernel@vger.kernel.org, monstr@monstr.eu, git@amd.com,
        Michal Simek <michal.simek@amd.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
        Srinivas Neeli <srinivas.neeli@amd.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
        "moderated list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH] dt-bindings: gpio: zynq: Add parsing of hogs
Date: Wed, 16 Sep 2026 10:40:10 +0200
Message-ID: <178954800853.4594.8595812335240808989.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <0b17cd7e24ea9a92a3e5268a1f9e5a840960ac6d.1789375913.git.michal.simek@amd.com>
References: <0b17cd7e24ea9a92a3e5268a1f9e5a840960ac6d.1789375913.git.michal.simek@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDExMiBTYWx0ZWRfXxpVKR4KSalDM
 r8jluwjc+E3qC4+7nyXJjPqXDDgrf8thU9uVZ0tqFMhNpapt29mX8blBjAsIOVn5Be6jdqwxE5Y
 rWrxzNf2ktpP+jjBsfswK4jxrKHCRY8=
X-Authority-Analysis: v=2.4 cv=PsIG/AM3 c=1 sm=1 tr=0 ts=6aaa55ef cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=BQ2oiuy6hHN+kKmom1QVvA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=UEueuJH-RofihTD06CQA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: gAfnsEmDiSY7qta31FAYMBKx266bgSMX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDExMiBTYWx0ZWRfXzZIYkwZObIXm
 dJKDUeb62tQPnzeGn+tA96WA6ml3vwCgi8j89AyZdE11ax4IKhgmRQgV2qnU1amnZDzC2hN4VUw
 cu7oVptTLyOCYo4Lg3a7ZSg9E6vYwoZS82vw4SseHOi2bYXGx1X3Sgi+//gSuxguRl4EWeW0omJ
 j9B51jqijQM8D2xo0dUtwFrGGfNTIef/Ok2R8CsocRqPPJzAIS/5JO2uzag6K7pFP0+rWBjmhT6
 cOcERf6cgtXZnWoFxfLzpbCP/mInVvKFrzzhDQzotfVv3mdbWagyQIa0w2hmgigxdFdB06IHSne
 hJ/xoPbzENViDVKBtVtgeU5Zhm5NchegAIzxJijDqzu7MbjoBgkf7CoAl1Rmprv77j79TRQGI3S
 9Z1RNOsK3Puv3sPjaILPY0QAlNP/JekhcCRU/nJGzQus92cQPve7uFL8y1X38DuogWDKJgjEt8J
 dlzjCNQd+SmNq/LN6cw==
X-Proofpoint-GUID: gAfnsEmDiSY7qta31FAYMBKx266bgSMX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 phishscore=0 spamscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609160112


On Mon, 14 Sep 2026 10:51:54 +0200, Michal Simek wrote:
> Allow parsing GPIO controller children nodes with GPIO hogs the same way
> it is done by commit 545908a9fb9c ("dt-bindings: gpio-mmio: Support
> hogs") and commit e8f2ca6be61f ("dt-bindings: gpio: ast2400-gpio: Add
> hogs parsing").
> 
> 

Applied, thanks!

[1/1] dt-bindings: gpio: zynq: Add parsing of hogs
      https://git.kernel.org/brgl/c/4bfe5b08a5912d1720689b1fc7f46c9b8641997d

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
