Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FDD038E8A2
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 22:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790029468; cv=none; b=ZgbPukS80Au7Hd+Lw7+9VthhYcIs9cOtVbxULYkVyGDzrpYmb+QgQwYcWEaM9vPZLT/dYLLH5eWTWmgpc0nYKVfH911PhUt8xroUG1PFshPCb998q6siIe3MJ3ATlzK/OjBqHm8wY5JbM1Ve6XpsWUUgT1CxVpB4Nji7UqSd/i0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790029468; c=relaxed/simple;
	bh=cTHWcAl7qmoMh+M8rTW5ybSijmOqpXvsrSf3CLOsj5Y=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=edASJ+CWPQhYlFMrLgkEIBLRBhFCI9okc4dnnzvqeOAvvdLmAYse38FUlm0sQFEOqNnHvtd07xeinI6yM45qFPcq/SJvVN/n6+/ybZm5NJxIbR9puIidG9bgvuBRdRGeK7NRaaJ7LWvRSUrYsVZVXJrFs4lOJwZ22iSQ65pDR+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K/xcSmpx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EXZd5048; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K/xcSmpx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EXZd5048"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LKeVUc955739
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 22:24:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OEnrmQFNO2k7A12pfE7wpLl5Xljl8coTbLHitjukYz0=; b=K/xcSmpxtl9n8TQh
	Rl2usZ/nN/0vFKrk61FkqDv7ONpqFyqom8ZcGVkPRjrL0OFfL0C3xBzoKNlMeSju
	p2rPHj5hIFHZ0R+/0o/rdT7wJ8GIDprx6he44zqzcbO7MN7BYv6oL5JBiWP71nMU
	vmyW/mc54wDCjf1I6H/dY9KkgfxJhBNFX/ncUkJjYX1V9x0p0U3geOfYM3zQtNZ8
	x7gIubUZDaDDAgIwapP8NCLD7473rhRERVaIOA1+PKEIXzZLNq9ed9ETlqI9C3Oa
	KemlSJoFwzwV0k3vcka/9TMuIiQV0DsA6R02Jahhcc08rTr7YFQRLIoIVmitvQJv
	WUXR8g==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu7tshe8s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 22:24:26 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39b6416441eso5713541a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 15:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790029466; x=1790634266; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=OEnrmQFNO2k7A12pfE7wpLl5Xljl8coTbLHitjukYz0=;
        b=EXZd5048ydD2OUgBR2uOGdO267uxuKWc+Kr1EVJOfmHCtEeurO2quQqfiKvrW32EEm
         HGDDO3i+F0gRn76kTJmYVapf8tXkW7LOqFMyiP4hZA779FBpmNR0kFBgoAVMwAwMPLn/
         rUgoW3FxnJU+8HY651NimuDQ6JgAsWOUWacWd1YN1BG2yIvVf1cnMyvveh5i3/ul2Zur
         Ad9KQjIccnSX5tyTS/GkZGpXAJM/uL/AOsxaiyYqaJNVFPDmrPWDL12VA8UnPqXHc3kD
         hLpMn3xMZYD4iXEcCdhooShHceE3DFwEDwrfyVEC0B4TVd7kV+DuqwCjJby0c5f5Teld
         Kpkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790029466; x=1790634266;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OEnrmQFNO2k7A12pfE7wpLl5Xljl8coTbLHitjukYz0=;
        b=bRSE7AlN4uZk5m5TLPzvAS/cM3M+PfFotanoyPx9ZxvoGTjC82sXaLYhIiP8U80fcR
         YAMSsiOj/I+l3meloCe7TUBfTPfDQ7W+7dLAizc5C6aY/6pH/2mbPuNNp1sat1LOw1/o
         bqRBNutYH30fBWVvkzohQf2nx8NTN4wdCX58TTfP0hRTAPTuMOv8wcgcFeJSa67LA/1o
         W1wfjPfnl2JmnDtiDhTd56hdIL2C1WC1QeLMaXtd44dFjOnpZCTOfHxxqOdb4uxsH1Df
         x6wdRqunbn4m98ARl0zqaJoCSHYnj3xBYK+u/TkHh4Oc+UxD01LPh1RoLoJP/6RNi5TE
         1LJQ==
X-Forwarded-Encrypted: i=1; AKwUvBxWFSLGKWDwG4ZaJAoczL9or3pOYTFmmbIwlmyJ9Sb2U4YMpi0rLuBTw5SgyXeabSeRpcxuLa5vTX0avOg=@vger.kernel.org
X-Gm-Message-State: AFuF++krOaHMWt6BbNKH1t7x4ltRodQGi9WAsPvGPlXV5WkGwP7jprnY
	/7G+QG5uPeeGEGbsi1B6xK3vpqgdrmtDPxF/5bapsdl9P6WS7Z6XUFkwxPnwra5xr0Bv1M0viSV
	1nrYpQGIj9Lq9tahiwaIQM6xG7Y1X/tHWrNKhPWuoNeAOqrWP/EpCo1Ppbg6j3W6metA=
X-Gm-Gg: AYBFou0aaD3mb7H2kENM++TpmA6A1CjJQpmiy2uMExc6eXBoctWL9Qq+VZ2OLw6N6P2
	Ed8CvA1VhIA/xpo2CFvXflMpuG4K/RtzpabTTWaYHlhY401xoh0Wm8bDSizfknqHwNmhWeoZhtd
	07q5YdOv/rJtLIS/IVdAlJEfnoK3hcseJioDpbslENva4mW0bkNpA/T2tFjTbyEnDSWlVVlvsPL
	+2GCk0yE186oqxEMUbOfNz978pfGoOxXlAx+ky5p6jiFmQggrOOMX6axCI8YHA0A2dAiypuZgus
	jaRUb3Un2JFskjiY+tYPG3qeJ8Q4vPqywdjvpPDp72ERLdJwSCG2OOz/gmtR1TuceppUhfwr0tE
	8ApoAJs+RkPewIwHxrG29LXcB/A==
X-Received: by 2002:a17:90b:4b85:b0:3a0:42a9:9c73 with SMTP id 98e67ed59e1d1-3a042a99fd2mr5462355a91.38.1790029465921;
        Mon, 21 Sep 2026 15:24:25 -0700 (PDT)
X-Received: by 2002:a17:90b:4b85:b0:3a0:42a9:9c73 with SMTP id 98e67ed59e1d1-3a042a99fd2mr5462337a91.38.1790029465452;
        Mon, 21 Sep 2026 15:24:25 -0700 (PDT)
Received: from localhost ([50.35.44.179])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e613014aasm34921eec.22.2026.09.21.15.24.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 15:24:25 -0700 (PDT)
Date: Mon, 21 Sep 2026 15:24:22 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Jason Gunthorpe <jgg@nvidia.com>,
        Catalin
 Marinas <catalin.marinas@arm.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Jeremy Linton <jeremy.linton@arm.com>,
        Jonathan Cameron <jic23@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Mark Rutland
 <mark.rutland@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>, Will Deacon
 <will@kernel.org>,
        Steven Price <steven.price@arm.com>,
        Suzuki K Poulose
 <Suzuki.Poulose@arm.com>,
        Andre Przywara <andre.przywara@arm.com>,
        Suzuki K
 Poulose <suzuki.poulose@ram.com>
Subject: Re: [PATCH v12 4/7] arm64: realm: Move Realm memory encryption ops
 to RSI code
Message-ID: <20260921152422.00006d80@oss.qualcomm.com>
In-Reply-To: <20260921053807.354802-5-aneesh.kumar@kernel.org>
References: <20260921053807.354802-1-aneesh.kumar@kernel.org>
	<20260921053807.354802-5-aneesh.kumar@kernel.org>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: D8q4c-csRZl-WidYLOCMqz0-2kF3juyp
X-Authority-Analysis: v=2.4 cv=aqgnmiZV c=1 sm=1 tr=0 ts=6ab1ae9a cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=aNnz9XPx1a4JIXSYt2cE/A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=OqFrNVoMAAAA:8 a=7CQSdrXTAAAA:8 a=Ikd4Dj_1AAAA:8
 a=EUspDBNiAAAA:8 a=O44U9CcMlGbnah6vnssA:9 a=CjuIK1q_8ugA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=H-multw7KC1Cw6hvqdV4:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDMyOCBTYWx0ZWRfX3sMUbT7trpEG
 pgdSk2OI5k6IAjRGgzlA9CZvupIhKQWEtM26JBaDFnMld/eKMvIB4NppYdUn1dHsjXePM2RaIIy
 Y7Zw3iKEGfxpSnCkPC92GVGZ6NpGR00=
X-Proofpoint-GUID: D8q4c-csRZl-WidYLOCMqz0-2kF3juyp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDMyOCBTYWx0ZWRfX2EgQmIO+9I5W
 m/xhxm7iVqU1clfQQ87PIYm9R5mAzYTSdt8JkUcMosBhuq9LBwyst1xmOmRehnNB/PY6lxUBVGA
 a3ctfd0KedsLEHcGoY0qsPS0ztK6TqYEUuq2rnzp5aMOJm56MPFyDPeRDxshZp6gixUy9JmzUFL
 KHzMaam0/k9NH0t3g/OJz/nqYw4Vngna3dhLz8VKnmWAueIXNJxeq7GEsKOMbh9cvOxN5gYqcP6
 fKjpTQpgWj5r9nbG6seXJXl0kAdlDK2FGJjZkHt9V/TqX919u4Zjw0QAgp/mlfouARYPfxoC/+L
 VynCinhmr2zIjZ6yEN1kxazvSUJASUj0SzQLYlrq36+lbCPccOfotWZ5F7qgJqlHYetNO7zYSrW
 cWjC86qZxuPc/f7DawXM0sYw8uwnA24RMk/rD5jrRSOZ3VJ7JSedok62iBfAeLfMRs570KZRsdA
 KutQQ0P/Yi1bNTLgVSA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_06,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210328

On Mon, 21 Sep 2026 11:08:04 +0530
"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org> wrote:

> Realm memory encryption callbacks are CCA-specific. Keep the Realm callback
> registration with the RSI initialization code instead of pageattr.c, which
> only needs to provide the low-level page-attribute transition helper.
> 
> Export __set_memory_enc_dec() within arm64 so the RSI code can wrap it with
> the Realm-specific encrypt/decrypt callbacks and warning policy.
> 
> No functional changes in this patch.
> 
> Reviewed-by: Suzuki K Poulose <suzuki.poulose@ram.com>
> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
Mostly for completeness and so I don't read it in a possible v13.
Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
