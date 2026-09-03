Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B163F4A64E1
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 13:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788440557; cv=none; b=ftLNmumnp+7P7SseGVkOwljxEG4byZYgr8h9ztUuUWXTqxjhCJH+EnytgSPjxzYwmuj7QWgs+92LECv3+XLSfUHk+ITvubcth1kMJjuTHCHUYfBsqZqTtsGQ4OXxQVhIfXg6Ifn56Y6h4Lq5zooi4x2SZfjNFTRoX2oestG54P4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788440557; c=relaxed/simple;
	bh=iNUyMqHvX3S8pNMhywE3RHDU4buVV5PMKqGs2Ue0/Hs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YWWKAA+wTpGrt1vXalKrFYMYjYxP24KBXgsLca5pAgZYOBMjeiBwSyIWtwT+yoH3akzYcJNPzm+a+aVfHlodx9yrM1d3yAkoOHm8GQnNNs5NjFJGHBnS2rFtTwbxo6Mpo65MXt4FqX3fwQa6zB5Rr2Moha1J1oCazTmCsw++izI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RlDh2bxk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WRE+fxuY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RlDh2bxk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WRE+fxuY"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683AHAJS212404
	for <linux-kernel@vger.kernel.org>; Thu, 3 Sep 2026 13:02:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RxbC8SJCtxAxQqyfjLxRAGHc
	UklS+ixE7pJvZTRJkeY=; b=RlDh2bxk5UMrd5AiBM0FL2s52PEI6s7AW0Qkt2+R
	zSA1ZYIUxF9V+kJqiXMtnxZLxlrlfpmVDCakGrKTSvFv4EyDamM7GyVmikD1/XUU
	0HPi7b0br90hsaLxTj7siq8cvw7ef1zO7Ca7PhxnGYoIkV3VPh50QF8YM//5mKvv
	vpFH+k0Lxa1drxGBn6J8hzEuMp23vzb0JL/5vodB/hQ6eHxFIPEofGK+amUIjD/T
	YLO/AmaqScrdPyKn0pDH0JZOu+h6+wi8qibqb6Ke5CY9Qg0wN/i7i5ibFsPsk2mL
	y4xS8dgisaA/7Tpy8AzgYDEZnzPk/8+U+nBEYHWvzinLeg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf1pyj05u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 13:02:29 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-78830648c43so501820137.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 06:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788440548; x=1789045348; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RxbC8SJCtxAxQqyfjLxRAGHcUklS+ixE7pJvZTRJkeY=;
        b=WRE+fxuYIeR9/JXBMS8ElGrWamhd2K3snH8cNKxU6w6z+ky8jX1eUsAr0dRqWABF9K
         +AvRymAY9lNwQbVR3jXZJajDk3et0FkUCWExc/OeP/v5KOlVaGHJJ9vd3RocbjffvrJX
         vH8Ro0pwOiIC73u5BtEBY3qCdr320cjZhYuSdFZ3q5miJ/tX6pe2nW76P6fKxxT9Yu20
         vcRKH4C92TYuTW3hKAGFvLh7zVkvFsTCC4LIiXVIVBJHPlC+DhK3JDrzN0FJWU1Q5bcu
         Y45Vt2YNwl1moRUoXBNMA5YT0Lpx7ENd1ZP7NDtbH/hvKbr01+JUP0UjN5U9a9wRs66w
         vfPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788440548; x=1789045348;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RxbC8SJCtxAxQqyfjLxRAGHcUklS+ixE7pJvZTRJkeY=;
        b=sRRPBitGiLV6cWA1paiGVECxqDvxhdYTRb4rHxHpTzUaQwQRXCbXGxk0oM8HmcSUiw
         zb4p1r8ssAhZ7W37ydKSBKbE9FmgXV2F2JJl7Gq34xCLlHvBCw+A71xNt1OwiWOrKKj6
         ht8ZGxF77WQW9VfVEmlX4Y0BB+VnVkvMHzsLRvUrrzXANuRE3HYa4qIP6wVgmmSQyzFG
         8DM3I+VN5trGY953aHbOTciU7sB7dQmjGScSheH2X5MAZN290Mrix6F5rnkkzpyGftnj
         BD++lSmpEk8RZCveyc8EKj30P2N3B4pATrW4H4AKnVk0Z1Wjns5wzxxOe3Uj0j7GPigk
         934A==
X-Forwarded-Encrypted: i=1; AKwUvBzOuhOqZlJp/pAFNFqwENYRzMGQQlhQ9m7yDnpp/0+zv4JVW72OpxZuQC95TPS9KTRAV30oaBq2hLPuOK8=@vger.kernel.org
X-Gm-Message-State: AFuF++mrmY+IoC7oNgOX+p0i7R6agundSmFlWws61h4/IS4DlnxCPtCR
	62z7cC1lz1ewunMkjzRt8XcttcBtG4O7hm/OXaxdYZz+KOU/OWGFkAHuo3IRCRu8t1d66sfxfFw
	zDO2yu1ribK3HTZDjsiqsO/jB4C/OKyCpbN3yyfyhrZVTe1++PDuzRFzbi+ic9vpXOC8=
X-Gm-Gg: AYBFou2AQC1V9ahGH8oPJK/rU60BSxfuPTktb3tSms+RAAUHvG7Z5/4AfTF8gDXkUL5
	Dr9xHHjSEGnCSqb4FNenBaTtwt8QgJKC2PhYDlR59x26RpZuxOeSpWv5it8U6QGZtMzeGmRn1+y
	25V8FmmSrFIaZLdDbo8DVVly0IPjDIo+kJQrNmyuns7F2IuAEK3DG5/OuaiyzJodLoqwd+usPjb
	uKr3nx6LXMQtvtclzJKD3ViF6+IUEag+ZM/J1VNOyWdAdfqVQAy0vMDpf6jVXoBvCbveUXxtqVx
	DmWfZKDhg+OYEExvuE581+DDawOs4EJrDLTDgTlIVp6YqSQrKupUFY8V86S9e0KEVeaVfA9tldk
	imORfGNHJi/nIOA==
X-Received: by 2002:a05:6102:3749:b0:784:4156:80e3 with SMTP id ada2fe7eead31-78a1f24853bmr3308848137.7.1788440548316;
        Thu, 03 Sep 2026 06:02:28 -0700 (PDT)
X-Received: by 2002:a05:6102:3749:b0:784:4156:80e3 with SMTP id ada2fe7eead31-78a1f24853bmr3308818137.7.1788440547636;
        Thu, 03 Sep 2026 06:02:27 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee6023edsm68179745e9.7.2026.09.03.06.02.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 06:02:26 -0700 (PDT)
Date: Thu, 3 Sep 2026 16:02:25 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Luo Jie <jie.luo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, quic_kkumarcs@quicinc.com,
        quic_linchen@quicinc.com, quic_leiwei@quicinc.com,
        quic_suruchia@quicinc.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 01/12] clk: qcom: ipq-cmn-pll: Use
 devm_clk_hw_register_fixed_rate_parent_data
Message-ID: <yfvkgixouxknoc24eg53wgluzh5jufx6hcodqx2hci73puqqab@fqkut4o2yktz>
References: <20260814-qcom_ipq5210_cmnpll-v3-0-21c3db378611@oss.qualcomm.com>
 <20260814-qcom_ipq5210_cmnpll-v3-1-21c3db378611@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260814-qcom_ipq5210_cmnpll-v3-1-21c3db378611@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDExMyBTYWx0ZWRfX8jTqi8P2JPMV
 86H6TR5KiGd23IAGW7n9GEVUJWYQtHUaUta4hNlEi1xvTQgfgEv19UNYNoGmelpgkfylU2SdLld
 h5X+9nQoI2sQ2bupMULHlZ0vNn0jhjey2banj4AzZhMzmBRGUZlHdONs00YevPhj9tYy6Xkt+2G
 Iqv/md2wT6+61jG+q1uHSbT9LhLT4GkdrQR8lSs6BvO9CSMhQ3nNAvGwEM7hnJE5boxd++8ot5i
 MWzxZdWeliQG4kFjiD9BCFz0c+PXY4V7uALNOhTIVv5j3EWwTKolAnS0oMVnjhVtcSut+oZFRUt
 L3h9OXmzVtazmjfGyLcxEucowUfzbOl0zs/XUdkXVCNx+VWVpgc7HrtSe6rLn38s5kP4By7TcVm
 xuKy2K9rlwmGSu68W1s87n8Fqg64DKCLlLo3Zb/Igpk1TGuVXruFCM9TBhBHKats+N6G1uGLBgR
 6zjY1BugrWlJ1U3chwg==
X-Proofpoint-ORIG-GUID: kzgp9hOPjwNq0hTeyqtrDp2qiB68ukJ0
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDExMyBTYWx0ZWRfX4mBXuTl1PFgj
 hGYDv9vuEVNVV/mM64Hs+0wWb5g2rQD95NI562tHsel5UqpdUUuOvTJaGag5vrrH+yYsAOD9Tpb
 p63HdlANQ/J9ll2Asbjvcrlj4nMJiAI=
X-Proofpoint-GUID: kzgp9hOPjwNq0hTeyqtrDp2qiB68ukJ0
X-Authority-Analysis: v=2.4 cv=DMO/JSNb c=1 sm=1 tr=0 ts=6a996fe5 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=q7XEBjOi5DRkXzmV0jSBjQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=C_jcV2f4aFh2m0BU-kAA:9 a=CjuIK1q_8ugA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 suspectscore=0 adultscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030113

On 26-08-14 05:48:11, Luo Jie wrote:
> Replace clk_hw_register_fixed_rate_parent_hw() with the managed
> devm_clk_hw_register_fixed_rate_parent_data() so the fixed-rate output
> clocks are automatically unregistered when the device is unbound.
> 
> Since all clocks in the driver are now registered via devm_ variants,
> the remove callback 'ipq_cmn_pll_clk_remove()' and the manual
> 'unregister_fixed_clk' error-path loop are no longer needed and are
> removed.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
