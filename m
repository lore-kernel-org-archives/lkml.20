Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C0D04D599C
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 15:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789658014; cv=none; b=jCw3fRSA9M/biNcJ1V8T0eVLyR9BJnLSYKlCc7KZdeGROsQ3URla5rh079SwR7VqcY2dBGNyFjPPbvOzRrNQS9JZ1fvcIEtwSDhsFZjEOGQtUqQQfrpTfRV8R86z+ia51uUMjaqdEv0kj9QLS7zaemLpsBQChlh24JiigSv8t7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789658014; c=relaxed/simple;
	bh=paqpoG8A4JciWm0Yi0xCGT0zRCzEjM5jx7MzwRpqNmM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xp3DAwzuyg9wR7UOQIGsOraldydLKN9FkivgaU28hp8bOf9P+5wHVlivNbEOHW8zwxHvTAL4ULZJNg4gPxq+lVu5l/avRvi6DZYwal75kBTEQ4ZRy2/IBCBP4Nr6FlvFUTfy8MdaHO2tgku7SWgpP9GWPdwvDOz8jJN3WWqJENE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EkRcriYz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OCbzL0HA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EkRcriYz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OCbzL0HA"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HDiMQi2086392
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 15:13:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zfrc8qw901WP9UYLMClq/rIp
	EzRNbwSdAodDRf5Hpf8=; b=EkRcriYzqIU8TIJZEBKGji2mIDGxuNhVG1o6u1pC
	3FP0pkVbN24cP2mpPIsAZNL9/PwAnxu82TIZ+9fEB+7Zrz0edMKJ1jyreiEfZMLd
	YEaslotYosKisXIARixuLvQ73Akp9Db8R65/dkyr0qHkYy1lqdmn1OQbt161d4w7
	cMAtlS3j2tlyS67GlDnpDVuORK7UQkCtMyWhD8cBDemmdpkZhtiIPH6jZ+yhyWn0
	m1cLMYWVEzrGGKM4AioaALvY1sEJNwAle2/INKCIu0D8cdmPOa9x83mxj2IV2hvA
	OhpJxWrLphAt3b1/8MEjLl1AVIjrdsOJqMmJjtWJvYR2Bg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grfu40xkg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 15:13:18 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9308eafb465so280066285a.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 08:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789657998; x=1790262798; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zfrc8qw901WP9UYLMClq/rIpEzRNbwSdAodDRf5Hpf8=;
        b=OCbzL0HAbwtCpESRyzAQODZI1oHmR+zV6z5vWUCh0W+Zgw1sTl41eUSpnkf2pe+DhS
         HxwYVv5VMxgLe7DVWEpLfpAFDanaJFxQlHyw3dERo4x10azPey0+2/D5Il39BnIPOF7M
         zqAxs4+MgftIka/om8QrevDYOpPpEpBr9tp7gHr52E3SQrq4x3fHPPwgMEoRAD/C64b/
         PhfhiHRidtRB58op5e7fZbDBRcfPMko3ArSorFB39F9bGx5UJh5VnQ7Yx/2rXOyXmJBn
         hCxfAevVnResRlgCplgcH7+9rE4GPcLiryKi4akxV7n+AB0Ot6mKru5f0pnZsP10Kqks
         1K0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789657998; x=1790262798;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zfrc8qw901WP9UYLMClq/rIpEzRNbwSdAodDRf5Hpf8=;
        b=26t7SwK4qX3NjAuuNiSch8cKUfpd2i4MPB1leVNrVSSRW24ldry9VrRyZzHV9E3LaU
         oOwj+CgZZ4VOr7QocVXbIPLqe89GAlaQtBIjndbbu8Qr0SUO7A3bbjSFN5j/N3RbjjXx
         QTCjrcSLIlinPshVW8FIlDIwRtIIm+6ZAqElOL8b7rJocxvdnuFAzpOsDAeAfINSqSO2
         cg7BJ0HHg0dLvlgphSUrAdrPpw8F6NgkYHhpFCUbToUfxriZwlS1pXg1otsOpOEckLQy
         pJpaPjzeiHOokZArlApMffhb7WWmgUN7idHcbWj3I/nT5k6VilCxTMiQZaJgkJbYmlZw
         4K1g==
X-Forwarded-Encrypted: i=1; AKwUvBz7HQnsCnRHVTDOIQiht8N9ZtZpO2gDsjAiOrMs4Lu/9WgF2l6N+suEBKuM9XeQvwf3HSzC19dcwyynvBA=@vger.kernel.org
X-Gm-Message-State: AFuF++m5c7DXH1rJm5q9210snI0TI8gE+mia609edTAorDQA58QsExS+
	crYVhGAMNM8LEjUprJJYKuoUc8zA0YrGOr5BDrUK6cemORyyVx0wLiFJy2QCayks1ZDkPgV1yoQ
	ds/o8Ul9qT/Hfzx+BrtO3j3e9Vh+xaBXXLPmxl4Yw2Tueqlq0MjVqosN/v6VUirv/cEQ=
X-Gm-Gg: AYBFou1SGb8ePH9QyPUFNbYqjhpJKBI2VpHezv+LtzIV/e2QqeBih51iHDsLqmEdVoW
	bs6TvLucE+rzZ3SROA6iVE0gA6+oO4nrqnexD7odRohTBDT573TPSmnsh2aoaYmW9a341tu6ido
	N3a7euAP2N0IsrYwGy4QlJLSayNM5QQjR0hwspn34e/oloDBMtvogBR7mlmfBfqiQ1ESDsB5m3c
	Uc5k8gx/v9V2g/9hURlV+hZ7zqtlRHjH6yycw42dS0ZzaSm3hjYenwXMnBBWpPuokCVNhb6qwOB
	zhkP4kPEivWqrzpu+7VpUBs5UUY7rN1ww/ONlH40TPkFfBYLzAGJBF9WJqhfjKTLjz7G5MsJ8Db
	XRiXgqquj2trDVRM=
X-Received: by 2002:a05:620a:f10:b0:939:f49c:1b30 with SMTP id af79cd13be357-93bb770f35fmr1139312185a.13.1789657998374;
        Thu, 17 Sep 2026 08:13:18 -0700 (PDT)
X-Received: by 2002:a05:620a:f10:b0:939:f49c:1b30 with SMTP id af79cd13be357-93bb770f35fmr1139305585a.13.1789657997720;
        Thu, 17 Sep 2026 08:13:17 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbfd935cfsm51140265e9.0.2026.09.17.08.13.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:13:16 -0700 (PDT)
Date: Thu, 17 Sep 2026 18:13:15 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 05/15] arm64: dts: qcom: sc8180x: Move PCIe phy and
 GPIOs to root port node
Message-ID: <ylxhdwgse4nkqqkeybolivgyhqyrcmitno4qm25xpdyicud6as@mtp45cpifc6i>
References: <20260917-root_port_v2-v2-0-6272b7caae9a@oss.qualcomm.com>
 <20260917-root_port_v2-v2-5-6272b7caae9a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-root_port_v2-v2-5-6272b7caae9a@oss.qualcomm.com>
X-Proofpoint-GUID: 0AxkG4BOaV9MkHhULthOPJtf2S94ZswU
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDIxNCBTYWx0ZWRfX4hiRtd9lizK2
 zbcpP6PruCvF0FZFT/oZpy8ZE6Mo6g+Miw0is9R2SlUbK9R/k4S29sEtRFP8s03MxMcFnDDDx4t
 +Kq0f3rsnIn3DXumRrNV1T1AAKfVtlo=
X-Proofpoint-ORIG-GUID: 0AxkG4BOaV9MkHhULthOPJtf2S94ZswU
X-Authority-Analysis: v=2.4 cv=LbipeTfi c=1 sm=1 tr=0 ts=6aac038f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=adJbRHicXYsKkr84VsUA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDIxNCBTYWx0ZWRfX16eWPikWKLf/
 Ak1GtKV56OVNpG/rMTTfH2G183xRMfKrM7NTgGErkCBMFkSGUsgm0PgWGBjsdWKnv+u1nR2d6Xp
 mZFjeqdOa5PSiy7zJ41jD6dpr3pwVArDIFH3GJWnxdg0OramQ4urRQFmlRh7jCYquSiwAxxXYhP
 6hp0KWN7bJmGKjsJoki3LylIGzacNhUA70Cz376NP7XDenoGhuwgmSCihNSUvVcs/cYAa4wwuI2
 zDb3Xb+lSmk00S8V8PsEvcQk4w2L1z8rHQ4zp6ewhM2AabFmBQkb1UqvGNPtZHc/fExNnkVbVvm
 h6aAYSJuQG6LKxl1qLgnLMiR0k2vOwxYPKzPcEywBBQsDGEs63jVlR0iPAIeF3WtlI+hU691cLD
 +Qe6/45t8sxFA60ttDqplqpiX210n1FuMjTYpEqAGsPnQYY2SO0k5C9SAP7rD8rb72ci6eHxdOA
 1oMme4x2LS5WrM5/znw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 spamscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170214

On 26-09-17 17:55:19, Krishna Chaitanya Chundru wrote:
> The PCIe phy reference and the perst/wake GPIO properties are
> per root port and belong in the root port node (pcie@0), not in the
> RC controller node. Move phys and phy-names from the controller to
> pcie0_port0, pcie1_port0, pcie2_port0, and pcie3_port0, adding
> labels to these nodes to allow board-level overrides. Move
> perst-gpios/wake-gpios from the controller overrides to the
> respective port nodes in the board files, renaming perst-gpios to
> reset-gpios to match the binding used in the root port context.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
