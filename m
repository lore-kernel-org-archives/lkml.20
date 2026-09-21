Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BEB0493D54
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 12:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789992747; cv=none; b=mWx1ph+eMlVkQBAkpxP8dJ9EeRTLyRzWEOSkWoMWTOVb+xfJEn3d0xQmOQoHtgilLStwFo1z+is5EfBTGUOFgh5UDphoH1rBaFyCnH5+zTFxh5gtWen6hlcnE9eKt7kDUWrjJXzx7uKWbhYP8PZejjGCfg2MduLq61UhMQ9YDys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789992747; c=relaxed/simple;
	bh=C5CqAbIBYojRahKDMYFkV5V+YuwntGhRs70Hkua634w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RNZ3XedioR4jHt2UDzoGUr3rc5C9TCvsFs1muCD5HnJWReMec8Ty96sMBBJSMWYNWfDPcpdR2dt3uUYbjw+A8oZns8l8rOWIMZX3LhIticZqOGLxStke8lfT6GtisukZKRasfNgWMFWko0ZSZMSxH99ELoQULBMhjJVQHojNi5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZhaTLzjQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Re6uaI/l; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZhaTLzjQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Re6uaI/l"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LAdxYi934217
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 12:12:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=p049Drg8l5sadIccCCFWkY6i
	QG1vQj2D0+87Sxiwffw=; b=ZhaTLzjQpE9uwnA8Bn3WwYs/Uh4o+nbcYbN/mVd2
	dabpaCHCGZLEpBU8S59sGrtOVR1wGhcQat9sJJU5WFjT6fUrDVOmHkJg25jUODtF
	rIZf2LlUWBgg3mxhH8x9uBXh6J9/vM07y8Tonf2fmqprCaqgiEQuT2LsTt2qhs+p
	Ld741EiZAEoyX2VpW0eqm9zlD8IHWTkwmGt3I/v/rQ4kTSHlPXPVTQlBvfDmFuF8
	axdEp+MeClvc2k7BmGxlXWeEIhh91WXZ8pKnSFSaG3YP71TqavxsbUCosUbZKpVJ
	B7DbYpnHb9zFWHuIbuzN12XFX2HtXZmalJiQXxiVRibcZQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtq8bahgj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 12:12:23 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-79cdabf7d89so3125284137.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 05:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789992742; x=1790597542; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p049Drg8l5sadIccCCFWkY6iQG1vQj2D0+87Sxiwffw=;
        b=Re6uaI/lmOCNnMpS+40sqH3OpVd+n72A1ToZP3aanD4MYUjqK//w3sUeS9HmiytWKN
         RuLMgVGSn/vioAs3+1xerUyRDqMZlBBLaPRyJ0ofus0UIbz+MocK/9F01+bQypSfNSF8
         aQikgq239dqHLfIGLAajGnwT2kmfKLgbmnPG7dn0vQ/tp6pO/qDE8ywbnYMj+iDECPP9
         WKz243W4Lw5gD1v85hu9W676Panm5O17If8hwq4ko7GVdWZWg3j8BzI9oTvvN/kivIyO
         gXKqVKOtTh52dZjGEGm9U4oAPjQFjMqJQkOhgSy+qlxll5cGke/AVG2O0Arx1LL7f7ak
         VpsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789992742; x=1790597542;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p049Drg8l5sadIccCCFWkY6iQG1vQj2D0+87Sxiwffw=;
        b=tJd3/FbX8Y2ObIM/PCQDmP/lULHL9mSPFrQOabXovayB/WvDp0V1WfvjyVRv+ECp8k
         xzR9MJvPcNLaDT+wWuYa0xnPLpiBnf6sv06UwINgQlqw5ybhWqcRHETLJVTpn6AO+616
         w03duoMjJgWHEBGxJYbJBGQ7TbUemc7hn41kRiTNvgar5U1JMyc/awX9lCHS8gBmzm1O
         MowXd9Q5FxJf7P9Q7I/P73GqaJfBRKy4fdWWM2cRzI1Dry9r/iemJA1B9tRBv0aVF8Ju
         +W7lmA3PslIj4EA2HT51L8OLlxsyaxKlZkjG7h+QtvG9VnqhLam7P++r3gzII2bfKA9O
         Pp/Q==
X-Forwarded-Encrypted: i=1; AKwUvBxySYukrXP2mrC79Inpp2+w0OZ5hxRgAGcRRjmgvX+W6fyy9XK7OzR/xBpLSGOoddz4ouU7L/VU2QT/2/Q=@vger.kernel.org
X-Gm-Message-State: AFuF++mmZZSaDEooJ0VNcVu54YAi9guNSD9NNxBVZ3kL9mcUM0XZofpV
	BgG8igWmosrjUFmaFxG/5xz8Tkf9BoIDl69Mr1m1rJPsKBdGf6uU7DU3ZE72iJ05X8733RyWOwS
	rqqSpN2uEcEUK8JmN/Ri1av7WnzQWYXFhO9yFf3/nw9nxowra4+RTkutZdy+YZIJ40cg=
X-Gm-Gg: AYBFou1w3nYzxMnMEMUYaIi9nN27Pmgp6/jHncBcrAH+BFLkoqCCjAOMEBycNAZJs6l
	ltA+NLf+lqIBbQ4LhDa1vORiHr8926muhZte3n7fVfO5J8FmmWKButZchHxDUv9u8+y9sjasMB1
	n9jXu4uwCuICcp65+F5BBvArVSb4ejv4fP+JeaUTWnYV8R4g4+TgN9BBFyl2uZKIgN4UugfamWw
	Egq1E6Ch10LtxgwEnATBu8pIrGxGoPvviahlJ43FVs//mRH0mUH3bzTg9fKHHJ5cFI5hZheh07L
	nl9FYIxRJS24Tqfm8QmvMwDhv/iHFxUFxausJk+rcKr9OgHqymPwZhcUTbGzgqQXuIIKaA/v/aN
	yCwD+vMbZSLi8Bw==
X-Received: by 2002:a05:6102:14a8:b0:7a7:1db6:c75f with SMTP id ada2fe7eead31-7a71db70ec9mr2160547137.17.1789992742336;
        Mon, 21 Sep 2026 05:12:22 -0700 (PDT)
X-Received: by 2002:a05:6102:14a8:b0:7a7:1db6:c75f with SMTP id ada2fe7eead31-7a71db70ec9mr2160481137.17.1789992741775;
        Mon, 21 Sep 2026 05:12:21 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd103325sm263684855e9.9.2026.09.21.05.12.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 05:12:20 -0700 (PDT)
Date: Mon, 21 Sep 2026 15:12:19 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: use assign_bit() where applicable
Message-ID: <3nr3krue7zqpguca4yhm7rgxpnfw3vtamlkj2caxrmutatrytg@uosrsfrui4ll>
References: <20260918141833.3023124-1-peng.fan@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918141833.3023124-1-peng.fan@oss.nxp.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE3NiBTYWx0ZWRfXy+48t0ky50tk
 LSgHm+zt6LUbWhNJCTnV2wQrqqCMUgrTSE+afVDYbRw/XL04Udwtoe48pav8BpTfdJZ50kCLLzI
 dflajyezPd1NCZOnMUuMTYJHBzdg8witWp+1JtRZNNJgi/8Oat1HIMI3Vbme407M4bmrSndTuY0
 6TS/lmI+WABeZ0ym4T+7BFzycm1iKxAVbwqx6BLb7fO6ytabnoXa66a+s5Dtftk0ZnvN9e8elED
 7r3J3lyh4gGc7zjc7QPUc+NacGZBjsckWKb64XF94mEMAONVyOWrFq7wvotKxVo/Mt9aY+k08xS
 QmmTYhgv8gXeQkOEivEDBdlJFI7WSAAKn+k7+pUrWE+06sk3jVCo4Y7ns0frk9FzIO5ULCUemYV
 xMSEWfOwfeFfKO/L5aFbPFINy8iOF4o3sPBuAXN4mQ1D3jETCB1gVRnt6Aimo4p4LOGyY25iPLS
 h2Fa8gr2WH8Pi7W/qhQ==
X-Proofpoint-GUID: BQvONiv06uKccP9PEpJkv6aogKlFmX0a
X-Authority-Analysis: v=2.4 cv=T/8Z3PKQ c=1 sm=1 tr=0 ts=6ab11f27 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=8AirrxEcAAAA:8 a=EUspDBNiAAAA:8 a=nSpsjYtsPra2AegJnUsA:9 a=CjuIK1q_8ugA:10
 a=crWF4MFLhNY0qMRaF8an:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-ORIG-GUID: BQvONiv06uKccP9PEpJkv6aogKlFmX0a
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE3NiBTYWx0ZWRfX/qwBM0eI7P9T
 LbfXGXbL0Z1WdXOY36ngHY2CddTccuB/qjfEoerRAQJ13jWadjqCx/Cxp2eegAQVkGIDWd5cd2j
 p6pCZ2bxamUavLKrxWTmXdPb3rYMy2w=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210176

On 26-09-18 22:18:32, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Convert open-coded if/else with set_bit/clear_bit and their
> non-atomic __set_bit/__clear_bit variants to the assign_bit/__assign_bit
> API.
> 
> Done with Coccinelle semantic patch:
>     // set_bit -> clear_bit => assign_bit
> 
>     @@
>     expression cond, bit, addr;
>     @@
> 
>     -if (cond)
>     -        set_bit(bit, addr);
>     -else
>     -        clear_bit(bit, addr);
>     +assign_bit(bit, addr, cond);
> 
>     // clear_bit -> set_bit => assign_bit
> 
>     @@
>     expression cond, bit, addr;
>     @@
> 
>     -if (cond)
>     -        clear_bit(bit, addr);
>     -else
>     -        set_bit(bit, addr);
>     +assign_bit(bit, addr, !cond);
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
