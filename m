Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA7894B44AF
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 15:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789658366; cv=none; b=kmmfIizLoA+iH+e9DpJUPAjtMycQmu0X/gX1jZqasVSxtp5Yp0pfXe8tlGXNCamgd8QL5WWM7AHwQGuuWt/gBrKqQ3y60rynGpJ9uwMFTs81Y4qGDfwdXbrEhpQD7hgfkKUUCpDmNuUUrFnOLt7/dN6mEIA4W46YgCHDx74hb/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789658366; c=relaxed/simple;
	bh=/Z4wTl5LbY0XS8lD0jM8Zpl6/x1nCA9cmHP2BE9iPO8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cModWqD2n4pkp1ye9/Nq59drCQBVausb9LLELgc74MqotarPHEXOh5ZcdI08zpSZzlcfWKqDNCdJ2thWJfnyQMXEqeat2qcVKJyMAdqHpD7LqTDck5UFn1MgPp++12pZA6gCKIVLAZoLr/IHnz0CPW+KY1kqi0EO0i//Ow/qoII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H3M5a60c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FtQOm/4A; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H3M5a60c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FtQOm/4A"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HDj6O11175864
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 15:19:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dGdv5m0CdvJUBahz873MblPC
	ZhKo8nu4pgz+cDmXb7s=; b=H3M5a60ctYzdxN2N+tDCL2JB9h7NHZ2vDRbUUMJJ
	FjqsxjgfCNm7iLveOxykFM47WSJHYNo8aoTzdvPfMw5w749p0mMsCxon3WfIMa9F
	yxAXiumfSU9dP3e+f+G729+rRXGPf+B3nBuInG8eRKm4CZVNKbAMpulCrdUJcIrb
	JYRaT5KfCuQ3QDxolfMKQoQRIln1vazGy7+x91DsA+vTLTpKOY9QxXd27E4jzqV7
	BleHw4BSgCMwzsEtXWtAcd/fi1/gNQPXMNCm0qHF1s375rNHiKI5fqhELFthrarM
	axDyVXUZ5Jj+Axelxd9HqGiFR7PShDaySCvwOXwkdO+Q6w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grca0sx3h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 15:19:14 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-530f49fc5ffso31411811cf.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 08:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789658354; x=1790263154; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dGdv5m0CdvJUBahz873MblPCZhKo8nu4pgz+cDmXb7s=;
        b=FtQOm/4AVogV/CHNnd6yJSgD2DqglRqWdQXtMLJgK9vQsppsMqyKicd4qI74KnzfH9
         N/NPtVl+ibXtUOQB7/RCS3nUfo/uS0vM6H1NeNMXtXxdg5WUD5j1wQjmhPQpOw3xVdSE
         lLuW9YNuYToJara0rHTLrhkELxdDrEKImy1MxPQp1OwmFkQ5qalS1qJC4sKSg5VTaFJQ
         KWwIi7R9EbsH1u9BPXKeLyaobZvQ0KC7gdDgVa8gSR4mq0afwXtK/ZmQqswFtD3v3W/m
         UWOAMErO9YLQj4TFpUrQy6hfCnGwVRXg2Q7ZFIC8BUuj84zwSj1XqMjCpgVxvYDDeIvc
         zPsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789658354; x=1790263154;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dGdv5m0CdvJUBahz873MblPCZhKo8nu4pgz+cDmXb7s=;
        b=JPl4BPkyIvnw2uAxEY8vdBTgk52s2uTGFGcNlTPjS8DjxhG09jXtP+0/VekVHF/F7h
         Phlr15/WrVusc8zvxHbWU/2p0rgj6XSP/+hsn7hCqnfMn0BOsarl/I7ZSTugucBjSWmz
         4EBkWboRtrV6MSKCSckXZq6ug/DEcLUvJQO0qxI9Iyz3Jkc1t9LA5wrny7VcI67mSFho
         XE60NngpOBoxuIZSFQ8x8jMeDpSRd/EmWFQiSxssOnl/ScgjGpmnVFWE5DAGQcfByQfC
         kLz+GFBTue6cfR9YM7AU45gpTZyuPtGFgVyv+KjPdnUcEuH1tnouVBnGEcdItmlgPD2C
         QGgw==
X-Forwarded-Encrypted: i=1; AKwUvBwiuMkCeW/VYZieWS1VVjvz8V0d5xoNoKk3R9qxaYCcaaTOcGvziiidDY8ujKBllcl60qFTgZ2yRWhKTZ0=@vger.kernel.org
X-Gm-Message-State: AFuF++klzTzxfyQg8IFFg9aXIjJqroyQlpndhuDImmaIBBUsnghJl+FJ
	zSDg3kNdnrUVSBOV1l3PI1DBmycQFnLQ5IgjY9qw80+rwanJBqqjPsOcScEU3v3o3eckyil0cHb
	hhGYb+NwbBYre7WH0plEUCmA0xtSARxYZEC9gCLY/hES13vQGUW0RlejmXKDPB09qQVw=
X-Gm-Gg: AYBFou06eIxpE5smL/NVNWFBJt5W1eN4v56SLL+086/Orq3gcQNh1peJMNF4DnNydDh
	XE7ngovfAdeK/1Ys55uNYqmnZgl61bKtu2wQSfXidEZaYfLz4dk60UaW1Gwp8bD0sgC/i62aB/0
	HQGLmmU5n6XEYAufqfPxZiNC6hrdK4bt3DqgiBlNKFyN9XO0hoTxJClOIxeEMS1fPXLojGRqcpj
	ST8Nm2CN+B1tWaVf/e4Ug8LybUofBWZe2UVjEjbwYGX3dPyzXibRPnKeEpz/q7P54Imuz04/Tp/
	NsboLSzgFUmkzu5CLYFciNo0l/PbcqNh1Y5Kss4GwzTMayaKv449m2kTI2aPlFn2kK2IFNkMHFk
	UyjpQ0AkknYyUXQ==
X-Received: by 2002:a05:6214:5b01:b0:912:517b:4105 with SMTP id 6a1803df08f44-912517b434emr16106776d6.55.1789658353586;
        Thu, 17 Sep 2026 08:19:13 -0700 (PDT)
X-Received: by 2002:a05:6214:5b01:b0:912:517b:4105 with SMTP id 6a1803df08f44-912517b434emr16105666d6.55.1789658352927;
        Thu, 17 Sep 2026 08:19:12 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd23ac75sm83193285e9.13.2026.09.17.08.19.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:19:12 -0700 (PDT)
Date: Thu, 17 Sep 2026 18:19:10 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 08/15] arm64: dts: qcom: sm8250: Move PCIe phy and
 GPIOs to root port node
Message-ID: <dn5syafhr2z3ezwr5gqi2ssr72g6ikhxpkfztj2h2opj2aqvmd@a2jlbfecmz3x>
References: <20260917-root_port_v2-v2-0-6272b7caae9a@oss.qualcomm.com>
 <20260917-root_port_v2-v2-8-6272b7caae9a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-root_port_v2-v2-8-6272b7caae9a@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: X4rDElxA22B86CRrUdnDgbz8H-XqfTNX
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDIxNyBTYWx0ZWRfX24tSqH5qXGtq
 z4BkX8ZsdVjI61ch9bixRvewX9MRNqXZO96/RZZakvwR2lfeBz2vu6CPidmwGNcL3W9Tj1CP8qP
 8hFIW58YTsk6SpQ4e4O1WgXPurFv/wk=
X-Proofpoint-GUID: X4rDElxA22B86CRrUdnDgbz8H-XqfTNX
X-Authority-Analysis: v=2.4 cv=dOQzC+Zb c=1 sm=1 tr=0 ts=6aac04f2 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=adJbRHicXYsKkr84VsUA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDIxNyBTYWx0ZWRfXye3uQbdglk6i
 HyXMf+PAX9zUo6G8TlvdibKDfKxsIWgI34Ye0k9YTn9QQfgwRH1NlgkfMNEeLdEu1P8qzplFQyj
 Aoo2bMRWxRJw/+iLDhKlP1c/JcsU4aaCT+Rx2h68a/s5S259SS5seiS6wYhFWHhj9Z3w1PWXX8j
 Qk8Ftmkr5O8WUU/PZMOhP6jVXejHvjSxovftd5nXkzVM08gYzKyJ+ttql3TVeK9FiqaTv/gzYKq
 +LKTn0XVA3+BeACVYC8IZbSEk7wMmbAJd8Q5PYMWElxUIoIbTOAfWUpMQs6BWC064Lpdvuajpyo
 SQV+/3Zm9ggbm70yrh8FERfbPMMr9EHa7ljkyZmUpsgpAE0dTg8K7czh08t3IKjAYEqEib/5G+0
 rz+YzvMigWNTILsEG4Xu0M+Xk/324Ow/aHhDuix5W2pK1NTiO/rmN+TF1/xUjMF1K8rj6O0OCTF
 0oVEy18nCqTq/cnnLmw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170217

On 26-09-17 17:55:22, Krishna Chaitanya Chundru wrote:
> The PCIe phy reference and the perst/wake GPIO properties are
> per root port and belong in the root port node (pcie@0), not in the
> RC controller node. Move phys, phy-names, perst-gpios, and wake-gpios
> from the controller to the existing pcieport0 and newly labeled
> pcie1_port0 and pcie2_port0, allowing board-level overrides. Rename
> perst-gpios to reset-gpios to match the binding used in the root
> port context.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
