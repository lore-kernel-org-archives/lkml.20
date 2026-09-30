Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AA84446BEA
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 08:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790758722; cv=none; b=noPbkSUtjShfge91empuPXiuMGKizR7EyE4MOQm2/Z6sGD8img8Nf+3JM3lSYWwW4IghTfRb0d7EIVHAOLK138nzLOrsqyKvTdG1OVNcC8CBvnH+pD+KJS+s2kUT1CEndf6/JEbxMfECuQK4f1pap5sRT98ouIuuAt0PKQIfGm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790758722; c=relaxed/simple;
	bh=DclLSPQjBnmSdixRZuF1wFUgHZD20UEbmsBV8C7XsdU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BSSpEH934gkNBMy0Ble9TX9LeOqCytT59iys/+iLlO1/uPVaUU4hxOAxn/Kf9Q5q2uzm9nW9aziUFxGnvj9Z5w2p2FpYLyeV23jMwg8ovVW2V1a9iczrSupg62N3wChZxgYaCfqf06wRLDx4qqi2WpSXF0pi4v7Av15n60P+oK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lIynEI7r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ClMciLXi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lIynEI7r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ClMciLXi"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68U7depY3489298
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 08:58:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fCldqX24kRznYB/wd3GJ0ptCoXwDp+BFX6MP6pxs/R8=; b=lIynEI7r9Rv7+sEv
	rlYontRA5b+PM4QLkADn+/8qcN4vMzOJTLC2Pr53cLv4r8lJ4+4XpuelhKZK7rcl
	lqr5pCKEjEbbK4qy1kOhninZTtfZhKbCEAAaWWndSfic9Xe35EJXO/CDW8poUD//
	8EqCHgzUEaYO1kacdRZWGvELbCTyKamL8wZSNYemQDRaqsBGTRvkiaZwn9PXTVSA
	r2FtP4v/CtgUEJYJ4MHU0K2yWh4SPGUR+wIvUzHPehk1Z3vBcLKR23/qX0ZBtJKQ
	FrYaAN+AHADObxieKoZIOyHIGwz2sRvKODcLNCtFfQF4Fw43ThW8Yb7SfoMF+IKG
	7uta9Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0j97uc0w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 08:58:38 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93bf3eeb42cso82766785a.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 01:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790758717; x=1791363517; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fCldqX24kRznYB/wd3GJ0ptCoXwDp+BFX6MP6pxs/R8=;
        b=ClMciLXi3dbEm1fyxFXheyEKurL06GwrTWhWKviaprztEgA28OJ01YiCqD8kAQZXUX
         7FwzKIIlQthtR//+8gImfIyj51203c/F+YPgZBn3xMjTsqsaKqWwHJszcQo3c1R7/2ba
         EdUUVu/4VTrZ74XkRUg0+zbZzZyGMRbUNoDi02c0tvD+5IZq3gKvmqTdi8B8JENuWv3R
         jTgDp3fR0gmRk34CvF1iARmKrYHqDGORSKGY9kjDvb3ycigRgTHecQtp6+iur4cJe/Wt
         tay8/3yjPSVvT9RLd5g19xWbdQcwaP8Bh8eU0J9uQFjiCnlIEn0OFdYOtSloU8TAPaVi
         c9GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790758717; x=1791363517;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fCldqX24kRznYB/wd3GJ0ptCoXwDp+BFX6MP6pxs/R8=;
        b=y2lJ9WVKNzHBV2xBB89GDO+Zb/UK9hUZ8uPVu3/blv58FgtfLdiWgkli9KJ9FA/5Wt
         4VvolGVbUI5HfWVKX01sVSh+5Bfp/kwbtP8k+zFm4veRX0CLca0Nk8M7oqnZ28lyc+sp
         fV+8D+2p0peXvidlJB/lgDr6DFBBEwwyrhYNflylxfjOgykAWplrqgkkwojjBbSMDayM
         nvx3nmMPT4U48zTTMnzy7IOSVqIWYe5lHaijYrWWc1TuESKX85rIVW5AzjlMsqr4R38+
         OpcFNA45PjFkUq/UIPKkIXvSxpBtm6bFjc50HLJchYdWhrQ0NsrLkp1r8haMOtuphP6p
         mJ7A==
X-Forwarded-Encrypted: i=1; AKwUvByzIYct05lSZjS81b+47JqVJ4j5dEtaMmI3ObSRJyLlquT9JKsaOqKB6P2HMnUyRP6lJOWN5w2aibb8T4E=@vger.kernel.org
X-Gm-Message-State: AFuF++ndd0Lfti1HxacGTja4uLT5DQ4U0wc8DO0180OlfAze6pciVlEO
	SawA5I+nXqn+VqyrpBTxma6Ujv/XBm8jvqft6PQv/0c1sbGdgZJuzuhV6NIBZHvkI4Ge2cbr0k3
	nPqhBTQ3gzmSzcanPmLghjnFggQeixUUv+Sko+XN8pSBHYJXYIqA6W3bSuu0zX+85jHk=
X-Gm-Gg: AYBFou24x+C37LXekdLSGpjIg7ajhkNm75fE/n1zCEoo8xD6Xki4yPFx/11QD4Sfeft
	PjbNHfezjX1woBLBytlwNCsOrmn1Fl82gmLmY7tr+iLSmtN8juMfJOyagGOBhFquZMmIG/ReNIA
	kxBM6oreOTLdzwjhL14aTw4kYgbPegQVIEWi/SUvIoo++Yd5RYlfL6eD9tkVMrpEZaeYYIEXFFq
	bZ0xv5Qrk7n719a0DKWgCrjeEEYzWytClfu5oTtwsOHlZe60AGYJthBT96kGiRkU5wEjPEXaclf
	vEbp4dmz5EiF/OPeznbgVj+qunatDQ3IYrbi6WqFqFhNaruWbTCxPdK+6ueS/VwQz8xV9r8Murl
	rY4Z1OTpJb4tKRzIg03oJUg==
X-Received: by 2002:a05:620a:370b:b0:93a:1312:ff19 with SMTP id af79cd13be357-93ca97a23a9mr93904585a.5.1790758717416;
        Wed, 30 Sep 2026 01:58:37 -0700 (PDT)
X-Received: by 2002:a05:620a:370b:b0:93a:1312:ff19 with SMTP id af79cd13be357-93ca97a23a9mr93901285a.5.1790758716949;
        Wed, 30 Sep 2026 01:58:36 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e22f803ddsm31029066b.47.2026.09.30.01.58.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 01:58:36 -0700 (PDT)
Message-ID: <647d877a-3b47-46bd-a5fd-9c4f4ff11dea@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 10:58:33 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: qcom: mmcc-sdm660: set num_parents on
 mdss_axi_clk
To: fabricioakio@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
        Martin Botka <martin.botka@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260928-sdm660-clk-fixes-v1-0-5d5bb84e3258@gmail.com>
 <20260928-sdm660-clk-fixes-v1-2-5d5bb84e3258@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260928-sdm660-clk-fixes-v1-2-5d5bb84e3258@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: tsr51qsaHO_qDRR4b8skk4tww2aX0Rwi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDAzNSBTYWx0ZWRfX3yOmalDnAxU6
 8n6RVoVhNep68X6xUp1+x5v10LUC4DmQXmgoRfI4W0JdwSdrdHXHmGzJeKn11ITCv/QImTAANlJ
 4zOaxtUoEn7bUoi/osicp9VH2Vq9T1SX85QujZ4+V/V+FmNxDTQChVA7SNFb0QM1uLFTEJFX885
 zOjUpdstZzhIfg0V9gfF9KgJ8L2L5XLprbPxiBE9ES8G5P4eCDoS86mpkRLSwT9IiGKttEDKd9w
 501SE79QPGakByVNNs5jK8unEK4H62XsSeEd0ntvKvtt9ZOTMCjZJGgOXW7UURxjpg8ehPCJZ6p
 lag5h4/BaCHbk9wSiEnJffAzUINc1WButbigT5ju+eP29SQUu4ll70M7/K4bo3Q313VYa6JwemC
 65wv8MUqqdXs5XCOFGTpPux3eGU6OhSaeWusGThEBLu2BacCv8xAHUUItunhhm4W0+utvHHiv5I
 A+ZvG3QfLJQon3w8wsA==
X-Proofpoint-ORIG-GUID: tsr51qsaHO_qDRR4b8skk4tww2aX0Rwi
X-Authority-Analysis: v=2.4 cv=BPImP1QG c=1 sm=1 tr=0 ts=6abccf3e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=9-MLHjcu7MZYho5Sk30A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDAzNSBTYWx0ZWRfX+gSEmu/xMOpO
 +7E3JsQ1DRlpp+DMh3pIDWBqfhwXKURgYIJ7/eiSMtwv7uAKGMarTAloz0nKzUswID4dbLZDDKC
 p2Yo9D6lXRwnST4dFzErFobsXxNeHj8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300035

On 9/28/26 7:41 PM, Fabricio Akio via B4 Relay wrote:
> From: Fabricio Akio <fabricioakio@gmail.com>
> 
> mdss_axi_clk names axi_clk_src in parent_hws but leaves num_parents at
> zero, so the array is never read and the branch registers as a root
> clock -- no rate of its own, and no reference on its parent:
> 
>   axi_clk_src   en=0 rate=384000000
>   mdss_axi_clk  en=1 rate=0
> 
> It is the only branch in this driver missing the field.
> 
> Fixes: 5db3ae8b33de ("clk: qcom: Add SDM660 Multimedia Clock Controller (MMCC) driver")
> Signed-off-by: Fabricio Akio <fabricioakio@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
