Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3497B49B5DC
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 07:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789718362; cv=none; b=e2zXK2+UNw96JIyJKN0jYnQsK1kCYYZCcU/9dLUj2jdfBusBkE1GwOwikckr2NvHYqmbvMyaE/9hwVWFWFScfk34v0ROWLstWe0asAu36SUyclXsZu5qln7sdtAPHpJGc9nZ9hDrkHztqef8gyp3KCclFtJjKB6JQRQtQ/cuDmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789718362; c=relaxed/simple;
	bh=NoScTolTln6SzZFFnTSrBIYf0gOGmMfSl2RkO09h6Hs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PQ8m/8Bv4gU6kqisKO0qLPu4x64qxg8/UmqvCs9q3xsMOjHmu11erNOqj86jdC5++zYT4w2bnLuqyQsltAN30y722eO/0s104GAjJO24ZmuubaY+KIMxINryS34NCVJtctZj/RVmUqQg0+v5fLapr1CbpuiXZMe+O+4khoDNHUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G2QYcHcd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jVWYK/Tx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G2QYcHcd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jVWYK/Tx"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I60V1X021396
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 07:59:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=t9TcokNUvapNvs8MZupRzXGs
	/bjc65TFxkc8LMJv/4Y=; b=G2QYcHcdfzdJsDNzam9ju8Nuaa0OHX5cGR80I78+
	77f5hgXD5/ia9lkYW4ykRV2SeD/LKVJ4li+yjNk0f2jbkkx6sKliLjNjvENjmMt1
	kHM3TgGs68UAed2JklzjIRhjeztJHc2xPg6wsg8UcPztI0R05qCfYET+hC2vq0nk
	4x3MD1+Wjs9e5UlJgCpMAn666ZS0duxYroI8f0y4io8qQB5TkkrvTuXpIwA933ud
	2f6yoDx4AFoNXjhBD/YfaoSvUwJdJd8a7iKSA0F3jpqsvVHQLAm5we19BT9pWZMx
	1HYdNslj9or7mXZAaP2zj9s8S2hicQv04nVhOBIDJhyaug==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grnqeau7w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 07:59:19 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a2d361e1aso107964885a.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 00:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789718359; x=1790323159; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t9TcokNUvapNvs8MZupRzXGs/bjc65TFxkc8LMJv/4Y=;
        b=jVWYK/Txo4tFt3ZsSi/6REpxDgX/iSn2fYN251K8tBEpA6am9dijzE7vSJTh157akH
         yiAo5pZYk39h90prjKc9vovcx4lYd2Qvc/qDWVH7w/8y9fNedmHCHAwsNuCqhRNIp/08
         F/4lZDX3yIJ62vRlVNXmGBP+rm83GQ1vxBiCINTjm/xjtcU/hwT4ZzL2kPemDzc/ARbq
         L/iuA8P/6TF3H/i29TXmhtoqI33Waz7DFk5dHa0k8zggzEhUU4PZ8HZmhNjJyShpXVPc
         m2KdeGL/jI+AZTZAlBDoWy+lqZvBYr2hXl6W7GyLKj+W+SBpj0Ttr8iYmOBurHgm65RK
         +Nyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789718359; x=1790323159;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t9TcokNUvapNvs8MZupRzXGs/bjc65TFxkc8LMJv/4Y=;
        b=WEOPGpyEXjC87kNR8hFvjEx9almSVBX7Cx7cSty1D8x3EAUyLnGpt32TVnK61l45G9
         Ib66wD5r6kNgUVpPGbJfuBJmG/qrJ5Lqvbl8G8bHNUR47XaeoyzL8Xe2ZUeEQbdISKlN
         jjctrWbOwXF0Q7JGPin4RA8Z1HWxYMoOyUBGyYv8wMDzuMFSyqh4F8dm9bfnzb5Nq4K5
         NcxbapQ6nxnYR87A2FT70DAngHMj34FXzzukgupaw4fjKVkxI1mp38dJ/Zj2E/LrKoW1
         SqLYzei40zOOi++ZikL7yYr4nJVFgpnZ1Y5jsKWQPNiO8yZ4f7DrKpDGmhEX/bZObQKT
         4ZUw==
X-Forwarded-Encrypted: i=1; AKwUvByK4hlY/4JvA49rZigcHPqBxUvoYxPbbeGjQU/QDzUIH6glg5uEuUb4wC1zQ3HFpVaKt/DhT5H4dljaemk=@vger.kernel.org
X-Gm-Message-State: AFuF++nN87TdkV/+FoSRr+ALkkwRcm6dvyDr5M2sQZ+1wQ39XHVljxE0
	REPD+en0G5pGAtl13Jn9CgLLmA6/FEfrbBNbjdGR2P7lPJ3xizEIouJq5QWX8nBYmF6RjU4cXgM
	j42uhtdBSCMm5EQdItKxqTv6FFJZ6DJtJjsuuY6NSZEFj074NrIbhffSfnmpSGOIOLEo=
X-Gm-Gg: AYBFou1TLwIdMZV/nHxbh7HOGU+Sn/cpPUgxGO6lgakQkPwUQsfPyEKD4vapqQoC2FO
	At7xju7YAZBI4Wms1KQV1zFFcERiBCx4F1buyF2u59wKpAhwhg9crrxjpipoowl6OSzh6UA4gdo
	ko2DEYkuLOUH4JUatewphs6ni2asuklX5ez+lTmqhPkG3bTttlDJj1X9U2I13YNaPP+36JjUbc+
	X8Z7yk5ttk6HBAuubVNyNionwSkFB4mFAtmRV8pvEIGgrgT3Bno9gq3LUxn5BUoBohEqcyMtjld
	5S+IzPwF1c0sy7daKRcJFmZRfTyGLCihxz+yK/zM46XsONnVAcj1v2CP1m92KNC/QFBgtGyybPA
	wBwAuCOqzEEgpjmY=
X-Received: by 2002:a05:620a:468e:b0:939:13bf:e861 with SMTP id af79cd13be357-93bdc9fdc60mr232592285a.40.1789718359000;
        Fri, 18 Sep 2026 00:59:19 -0700 (PDT)
X-Received: by 2002:a05:620a:468e:b0:939:13bf:e861 with SMTP id af79cd13be357-93bdc9fdc60mr232589185a.40.1789718358463;
        Fri, 18 Sep 2026 00:59:18 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd216ec7sm132320955e9.8.2026.09.18.00.59.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 00:59:17 -0700 (PDT)
Date: Fri, 18 Sep 2026 10:59:15 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Amit Nischal <quic_anischal@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 3/3] clk: qcom: rcg2: Clear force enable after rate
 failure
Message-ID: <fzcarbdkfwns5gaibjq6gvcrin4u4vbtglsm7jjkyke3k7baht@yadlibk2u3dv>
References: <20260917-topic-qc_clk_fixes-v1-0-5531cb00514b@oss.qualcomm.com>
 <20260917-topic-qc_clk_fixes-v1-3-5531cb00514b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-topic-qc_clk_fixes-v1-3-5531cb00514b@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: SOZVh_n-JmV1vMYHOKRFAI6F8jhf44If
X-Authority-Analysis: v=2.4 cv=FfiiV5+6 c=1 sm=1 tr=0 ts=6aacef57 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=yD9qS6Ighlce5qk2PfcA:9 a=CjuIK1q_8ugA:10 a=ZXulRonScM0A:10
 a=zZCYzV9kfG8A:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: SOZVh_n-JmV1vMYHOKRFAI6F8jhf44If
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDEwOSBTYWx0ZWRfXyUpRj5hH9Exu
 U1pf7vFPYhrjBZY25h3wKtUVwN/IuhsyZwZGnqI7zFbxolOUFu1/Jocf1FRXuOMhlJH89lf7MNB
 bXZ8C85T6I2jyqMMKsrPkjjsO3vFG3Dtosh5rDxHgl5PEteRgdrVnvZMyKf7VNIqsrKaZ2CzGrm
 G2MchFjbgoBozSo2wPk9hRTd/05Hh3Y8eHlaRVFXmvU7+xFirkJscne+BPmOMPCLq7G9CCTYgCp
 KmIkPfNpSxwD8CRJtCPsJVGlH6reY1s+aE0VoAf+PTv1wk3FF83WW4gttFJjA3Nm8WhE5/VCCYS
 cGF8zeF4JbcOiPCMBCfGEz/kzivxh9S8MX4y+IIiyKRPtgbR+fsxZvMk5Lk3TFOOyOS7kvDZ4zQ
 qUEiIQ3lpEOteJEAhZu6jflp/uEY2apn+lQxYRYUXFv0JpIwNfvax89W6OwhL7RncLCJQRrlcSf
 4PEMAlhd/XPsU6Lw89Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDEwOSBTYWx0ZWRfX6GeK8QwW45VK
 WE2QxI4h0Vu1pWM7xlOzh6xEltIvt2eprJL9at30QiHusakNT4oJX7W+a8cbFaupN0erqjrRcUL
 pl3vBCnmX3JkkmdnhHAOlzZPW0V3ITY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180109

On 26-09-17 11:06:55, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Shared RCG rate changes assert force-enable before programming the new
> configuration. If programming fails, the function returns without
> clearing force-enable, leaving the root running while CCF can release
> temporary parent and resource references.
> 
> Attempt to clear force-enable on the configuration error path before
> returning the original programming error. This restores the same cleanup
> performed after a successful configuration while preserving the primary
> failure for callers.
> 
> Fixes: 7ef6f11887bd ("clk: qcom: Configure the RCGs to a safe source as needed")
> Assisted-by: LLM
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
