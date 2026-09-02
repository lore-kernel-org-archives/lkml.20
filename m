Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BD613EE1D3
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 08:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788339397; cv=none; b=inx2VenItqXQao84luzcSDZDwL4BiFy6WoRW47rAH2SsK1504b5MTaYnrZrPFiYTqUstawX7cOMO1lM460U325JFMuLEWm28RVM/YWKU01AJ2ilM8BaGIdNWBKW7mJx638IdguJYvx+dyOzo8Qd4LQIJ15/9Ex0Cq6DKphdo1QU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788339397; c=relaxed/simple;
	bh=Hkd7WTFmIkuhSa1Lj9Ua/wTrqEfFcr8VgdL7VPdGPqY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YhUcnibvR7pTWnoT9Ggyfl76M/BPGte5QLtovTWXKQPWE1nGtbROL7GQfwh6qEykh4jcJK7xUdOeBBVLzPuHAiVdWB3i9YJzBhwxcuDoKPTgCeDzTda7CgJ5qe3319TXKpSTCg5TAWF6tugpsJDBB0O5reW5YZwqNhLy8Q7Vkyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fU4qlX3W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=elDkipne; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fU4qlX3W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="elDkipne"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6826WBdN588382
	for <linux-kernel@vger.kernel.org>; Wed, 2 Sep 2026 08:56:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/QOK9WvQe6jUV3BBjRVMVi73
	3JCIvhjtwq+YyPWtdNU=; b=fU4qlX3WW28/3oPqaAGLDrVjbf+XxneHLH91r71y
	Vv7W4MEcQAVA3MJoMlATX8IzXpfmdoPI34TckvUDFFL0A8wmv/wgnbUJxb7fKTkw
	QFkesvN9Zx8IKmmF0GoE+j0ZldC2Bn3ko171H74srFf0eG7VXWIvD0cQI5SQyOth
	S48R8SgNZFXZsPJOM1Sx5jhuKcMzS1wVe/Jv8SwAmHEJav9IJdgLSnNoO6PrrUIm
	c0PEmRnGTAVl1dHe8XhP8FCSWVzXkJOulrI2cpj6MhmYiK7S2FvcT/Teey5tCOZS
	3M1YOD2WQpT+xttxY5ydfSeUhLKIZhsACJVcJiJJwF6DSw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ge435tsjx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 08:56:34 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-936708f129aso143628685a.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 01:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788339394; x=1788944194; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/QOK9WvQe6jUV3BBjRVMVi733JCIvhjtwq+YyPWtdNU=;
        b=elDkipneH4AYAvU2iz+HGeaZNhw4mWJHe2uIDvNg2rMX0tdRg38n+84Xht6QO5Xa8q
         qBmy1Imq/cNV3jnxAMzu1JkaPo/HSQa1BXsYC7MWWfYDYzl5wZ556w0u3WcHTVAvR3gH
         kS+YTACfFhQ119IGqkTjfiCqOidTFfrqsbMUF+7V8RddzdUjdePqi+3ECeUojKXEJNuZ
         XXCQiR9Eh6nbrV8bZDTGr1lJvGA6PnNrA5Ls9Jny9QMkfcQEBb5dxxaxDGPR08hJExJk
         SDJ82dn63tSeA3RoEP6LRK6JqCcKk9Bfqn4G+gxIWwXTT8Qxx4BkWnzAmefaKaxZCvcD
         eXgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788339394; x=1788944194;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/QOK9WvQe6jUV3BBjRVMVi733JCIvhjtwq+YyPWtdNU=;
        b=DjbQkKUKU+Bwi+9XGdt+jt9IyD++9jZEWZKbopp0zIrrYbK1hHfGuNx5VY5thEU4KP
         v9qKXOhEMcZ5TPBDeF/U7VbO6mDHLr4VtjLlDRFCjJDHauZLrnwvlDXKc5otN532SE/w
         NsLxqqvPf3EfR4/PrR9kPpVswt56Y/p3V+rnH1RMx4rKwZTpDkoa1ptUH3Jqe6CxLkz4
         08O3LAZwUYUmtrJfhvu8I9Bp4gl+vbui8l/73GRWpnSTnL3GvNxcCLeFRIfNrrOtxvKh
         cvQlPKt8iwqrwTlA/9e11All/aOXzH2rqzquIVzhP15Rp3aE4bdEUBOVmZEKzaq88ERf
         A+Kg==
X-Forwarded-Encrypted: i=1; AHgh+RraZkPP8/788kRQOnXwm8JblqMqWI57C94Q1cfMBronOPVrgeW2y2W2CVsC7Stw03RiNggDWh4M4g2Rs+o=@vger.kernel.org
X-Gm-Message-State: AFuF++kESvWzxaARwN84B6oNDfToQDBsNoJ+ytqpzvL9IV2jFlxB4vpw
	gwVEXYKl4FI4y7xpRLRnibpBSretFQ1gE+9S80Kx/nFCwJnEZvPUCIxmdJE1V66l/rCzWOLfUp0
	CjdPhyYVAQxGy9bykdRBgqrdjSZ2cRiEQa7T/BjtYcduWhjqL4CORjvkma7Btjgy/fuM=
X-Gm-Gg: AR+sD13SvtLU9u9ennpe7TaBbwTja9V7bA2gZSGnEseBrSXeKZChXUO5Bl0FI5wd7va
	quus/Pq4968LCVOBK7BN+R+WrtY3NV5rrnMiftczZPU7+iDkx6IIhFZ7Hii1CaLGqjs4+BU4DZR
	1YTo3VKTcRt2WwGYdLUgSCYvFsiE6hNzB1dtGnZXDtDNFAYfV9zOY8w6F9zn6qPxUrxQc6NUBUO
	GHCYeMsTdOW1LXAmg/5JPIcE7okTUD99kif19jigLLCgEpQSqUv0HB/PS3+QEqA2Yzys0IsteN7
	NnQ8T1dDAtkhH2MGh5JmtMt8zu1rkPHSLgI+J7w9Ddi7NieamPZfPBcz16mEBqUG884W5QXgI3O
	CFEjxutGA7zf0+YU=
X-Received: by 2002:a05:620a:bca:b0:92e:535b:e08b with SMTP id af79cd13be357-93960f57dfdmr345501285a.33.1788339393020;
        Wed, 02 Sep 2026 01:56:33 -0700 (PDT)
X-Received: by 2002:a05:620a:bca:b0:92e:535b:e08b with SMTP id af79cd13be357-93960f57dfdmr345497285a.33.1788339392514;
        Wed, 02 Sep 2026 01:56:32 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e80388sm6241821f8f.14.2026.09.02.01.56.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 01:56:31 -0700 (PDT)
Date: Wed, 2 Sep 2026 11:56:29 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: jens.glathe@oldschoolsolutions.biz
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, stable@vger.kernel.org,
        "Dr. David Alan Gilbert" <dave@treblig.org>
Subject: Re: [PATCH 3/5] usb: typec: mux: ps883x: refactor DP altmode
 handling and support TYPEC_DP_STATE_F
Message-ID: <yit5hlvrumamlkp653uleqczt534aabcgrw75q4utxpistsnfv@ctd4lu27fndm>
References: <20260718-ps883x-disable-usb4-v1-0-cec86d0b909e@oldschoolsolutions.biz>
 <20260718-ps883x-disable-usb4-v1-3-cec86d0b909e@oldschoolsolutions.biz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260718-ps883x-disable-usb4-v1-3-cec86d0b909e@oldschoolsolutions.biz>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA3OCBTYWx0ZWRfX+9I1iP30jakZ
 tADW+NI5fQJS5+UfoByRO3T1DGaOkyrsbTF9q32J5Ps8ZacK8ki3RvO21Vi0jeRkrL7vHvJiXlB
 2V1o1EbOniZzLErNyBMzpIc0/JNvlb/0nu8VVNa51QCdfIV5EHlBUjhjbNDEuEEBTKoNOH2IGtm
 bs7AE+xH2ggp5QVY1uDWLoCyJ3KMhXbzd3uNmxBfwK7MKg0D9+ddlyQ1G6tn1mTs/BqgymGTVGO
 C0npYd68UbL5r69LPPq/0wg6GUTCxPvkKymQo58rHmOYRpP/7Cxp0UW4mcAG2hzo+es/x2wYe6x
 4YYfStgoRLHutnfN7v6b8wFHoSlKORh5Yjla2EpcHxIF/tg5wp6pG07O/JlCDKikaxdVZihFBmM
 ce/lWY8/b9m4CR/JEqGvC5ZQfQ3wzB5ICdEPBVYPO00d0AWGbxY8RHaA5wpNlZFvIpMjIGECJyF
 KtynRCloK5l2y02U8LA==
X-Proofpoint-GUID: M-6iTXjWZeX2oWVqBlJZQNFUDkBC9Uc3
X-Proofpoint-ORIG-GUID: M-6iTXjWZeX2oWVqBlJZQNFUDkBC9Uc3
X-Authority-Analysis: v=2.4 cv=JpnBas4C c=1 sm=1 tr=0 ts=6a97e4c3 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=G5ilVN+faPP2Ze1SHB4iFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=gxl3bz0cAAAA:8 a=EUspDBNiAAAA:8 a=Xqxl2qIfDM1Vn1vrR_wA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA3OCBTYWx0ZWRfX9amc/ay8n1sM
 lClTUcm34uGov6EDXwxv3ClYjSZuFJrRgCD57YTPyU3HL1A0jZZOK7f9hqNDCGn3SyD2vsfmX5i
 v4pAoY2DkhSmjABYLtw0GckUbQNJ1JE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_01,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
 spamscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020078

On 26-07-18 19:06:31, Jens Glathe via B4 Relay wrote:
> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> 
> Several docks, including the Lenovo 40B0 and SSK SC220, still send the
> legacy TYPEC_DP_STATE_F mode request (deprecated since DisplayPort Alt
> Mode spec version 1.0b). Treat it as USB3 + DP altmode (same as
> TYPEC_DP_STATE_D) so that DP altmode works correctly, especially on
> the 40B0 in Type-C fallback mode.
> 
> Extract the state handling into ps883x_apply_dp_altmode() (modelled
> after qmp-combo-phy) for consistency.
> 
> Assisted-by: Grok(xAI):4.3
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
