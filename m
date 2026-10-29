Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793263923;
	b=BBM8vSZg800K1rggxcZazekEZsKFKF4iFG0/SAHzP6SSUvJZxFVpj+rzDR20UcgsECIz
	 PUmM6LFyoTBwDJ2fcW1OsOIQ44/l+MFLTsAA5pPUfZ46b2MxxTX2SMo6uacP5B4w4WApx
	 8gVwswPwzPCJEK8aZJvXIdJxeEpkwzRjPcYLx84gZX87UVa6Loa7GJptlzyjZc4zhLTnW
	 1IBAyCUpuDUa8rVb1uHlfCL6YUMjda0x86TQ1t2MVtpQC7Qt0Cl+eHTY/tyW+kiEECyB8
	 cuxM7JQvbYETVI91qJcbIcFNnmX6crN/gxnQC9NoOxZEEeRbad3iCE0YI71GNCC2NpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793263923;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=4X4any+tpNBwR1eQM52jJjIuQZyhJ8gQ4zFYTx06K2Q=;
	b=DR+o8dJHm2yWXQd8TF/RD+gN2Q6w08xA68vPrd+zBI+D5I+Rt4zYRuI+f+fDkUjz+kng
	 Kea6YT6U5wwxO/cWEbnxCRVmnv/RpKnTrWl5TDwRJZ0tqlrow0E24y5tDMNuWfSQdnCVg
	 MnlOVm0EPBb9X0krlvU2GoDxqPtW6cN1LfLF0aD3uZkt5t6e7sq89fvI7rpXtThmLZ3fU
	 nOBVx1mm3agOoKn0rKt62wipwePdQaTYM7QJPT5l57krXP4gupP85O/rpUoJqdwCcwo+p
	 KTl7kb4kgjA2TTp4igzvdrWbtCNAah/JJ8iplP6VCLqejw0cg2ArzAjUT451TzHfnkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TCPGIrKz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LstxmWn+;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A60DC606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:52:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A60DC606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TCPGIrKz;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LstxmWn+
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T5H6cx2244541
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:52:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4X4any+tpNBwR1eQM52jJjIu
	QZyhJ8gQ4zFYTx06K2Q=; b=TCPGIrKzjCSWP3h5PJlMJg5RBYB55gPdGRqJ+6rK
	JCzGa73VdvDYoNmf8/WtblZLsYUTjLU1uTpg8CT80KJAgCsGVuoG3iT1g35ZN+Au
	VcSYPBtXSRPpZp3Xf2BYsFeQNhQ66BXjAD4DDF9iJwTy65j/qKLnx6mmxd42zJzA
	L6usUXi7VLUmHRMj6HZ4J7rigQwKOORvcAT2vu2kwW+s82au8TY6yd1v4aKzeZb7
	QN23g+Du/zYQaJFMjuD84r2P20tzZjRdty8qB95hIoUif8sPtoMcsg6GLD2cIRPK
	g2B7H/48QlIhQwLSga2MElGZQicnIFNjJrBQjdb94taKGw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hky5s8v15-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:52:01 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9440b27c1feso276280885a.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 01:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793263921; x=1793868721; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4X4any+tpNBwR1eQM52jJjIuQZyhJ8gQ4zFYTx06K2Q=;
        b=LstxmWn+3iJSyqQtakDQ9UBEPK0rNZwr9PI4Run997dr45KdW5Jl7z5vXC0Z2vg1FX
         bRcm0CNf1/Y9nJYjYCIDOXTfuHcTB5BdzhQcGrI9XuWfPnHLQiNGvYaYYFBcmgC+TnmB
         olE/YuLnDPKOiQ9nBYbMxNg5OC9l+ZTvwKtDLMwAU0CZMLbRxKAGUwdm2CtlSXlKHTnr
         NFtlnQq4Tm+JLoMzae6OY4peHatlonJ0Sowa8ZtdKAkMuwr+QZGSqDvcCiqr1NlR0n30
         Tb9WRsBF14lc7cWD7XXOGssi2NIVdbT5etHf8bABjjT4JrgAMnvhs2LQU35ci3TguEd9
         ISTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793263921; x=1793868721;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4X4any+tpNBwR1eQM52jJjIuQZyhJ8gQ4zFYTx06K2Q=;
        b=XvmVWJe1CRxMeDfL9a6DgeFiuExKI/7eM65gh0maYsUq0LuhJOUGbR3vO7nXlOxGbT
         Sq8s6q3nQcRoGZlzKjlLUYfabcvkv/oN3j/qWMy4fPb7I6SUWwjnaHYI5y+e88iJ2ilz
         4JJApzHbSvz1tTfrMg6WYYakJ7uUP/vKi4zOcbqimGZRRIt0/HfnG6YYAZ0z1Q13ckEI
         S1ElWoXQnN3MnfsQorO1osL9D7QAjnmhFmEezLQCV9fFJBXryOwWEEcXbvpx71amkhK9
         jbh8oKjj2uZT8yTTtk7s6tnSVSmVE2e6wvKBJCeU5D3dL3NKlavwzXXVhU9jv6wqxRb5
         DG6g==
X-Forwarded-Encrypted: i=1; AKwUvBwyUSwt2WyrZBHQ7BKrn6BX/Yu2r8eZPFp7xFfDvLW1+/R+Zj5h28rB5QvVEaAJvRU80drJhbhdV4GBp/8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJJozmo2wiqsT/WNGnoBZbQXruYp4F8hiaQAssTzCVpJeq2iahb
	d2fCFoyc722XAe6msACtaqHgSBkhx2V8p/wvpTX8Xqu4oG5J04u930Lr+Vg/VD4qFiEgfgYYq9W
	2SOsenV68L+QIwFlMwUXQLoo+8+AXChuBPZHcQzcdII7cwO0884Rf3SXEqAd3sHIlxEw=
X-Gm-Gg: AYBFou3FXBOQ1zYI8mRuyorsjta747+TB2kaOOsjihGzhAh4wzvtn4jbBnsHe/QukOX
	Ie+BI9K8NilezddjqeO15H/W+lCrwgzoCGTzdS0vA5g9LM+aRF1C1Xy3rpuLr2cr7oxCexvkjCI
	bD3LdEgAn2i6OoUKE5b+ErAFAcdrRygQRFZ8cpAn7K148ocwqN0uNqGmrmvWr+GEGMEIJcjwQ8Z
	p9aFhn/0T7auEQwXkHQl+lbUbsi9C4fzg3phx+M4R7sPBX8yv6e/6/Dtq43UW/H1+luwLzgW/uO
	58LrATTT+4oBhGRuccEmmh4C1rT7OFIcM54JKX3dvgmvkzfnisqVOgMZ2MYGxC22JylMfTUwXbF
	mgtULDxq2JC80Y20b5LaPwJ/f2r8+bZ+kyj5mbonmZoiKNyJ/bsTcVrfjnS0IoXON
X-Received: by 2002:a05:620a:1b95:b0:93e:722b:1f79 with SMTP id af79cd13be357-94408ce05d8mr692530285a.53.1793263920615;
        Thu, 29 Oct 2026 01:52:00 -0700 (PDT)
X-Received: by 2002:a05:620a:1b95:b0:93e:722b:1f79 with SMTP id af79cd13be357-94408ce05d8mr692527485a.53.1793263920071;
        Thu, 29 Oct 2026 01:52:00 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3eb8f248sm32973063f8f.6.2026.10.29.01.51.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 01:51:59 -0700 (PDT)
Date: Thu, 29 Oct 2026 10:51:57 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 2/3] arm64: dts: qcom: Consolidate Glymur CoB power grid
Message-ID: <wnfymou72wbsew2krp6ub4z3j5om47fz5aexoyiqllri75rqgp@dt6g2lyrarx2>
References: <20261028-topic-sip_cob-v1-0-80ab6704aca3@oss.qualcomm.com>
 <20261028-topic-sip_cob-v1-2-80ab6704aca3@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261028-topic-sip_cob-v1-2-80ab6704aca3@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAzNCBTYWx0ZWRfX9pO7e/5blvXM
 NObVeMEypYMEKpywV4i8hmqfd2V2dE1Bi58trw059C2Xtmy2CUN2Cpr/BXqf0ITg1AKbeV03Zm9
 NqfRfoc7UG7bWLmrIa8aN8bdBQ+OjDRdlHdHDDBrjlU/KYjTQTIbT2X1OGKwAvvcofQA+8n8+zK
 CcsqvkU1KdH3eentojb+d5EzuPOSh/7aT6iZ9/z2GKebH76JEPk3VxdlDvSuLu8rmlD+LKZNB7t
 tLW+lau2uDLeGft7vA24i7SQmsDZYxsqU3fPFVr3bA/SUI4BZGPCQmNLi5ZUQFGpGhEbyHph7vl
 VIzJiRWd2oIjGwuCJyufktXCvdyCzdNyHCBOtE7wxAuDp1iIEnQo5t0g9HX+BSdCU5n1YFLyw8o
 yUFmfmgOmKzTDI0lQrSVEC3KOzks7u4eAzjSWaU6A0r2+mwuifqBSLm73gv3jzvw/7vY4uY3UUN
 +EZVnbZ8lLUZrLl454Q==
X-Proofpoint-ORIG-GUID: 0cUlJO5Jh90Kvqj-LvhcD824FKwQL0dm
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAzNCBTYWx0ZWRfX5sfvORNHbD9y
 7+6LdCSdsL74+LzeYtc+MeHcXdn25VbiDzEkk7hR9Z9Szb28jBinLD4mGVRK1YP9Jle3StBtXo/
 tk3Dh7qwSjWdI6xPg2uxbPA4wcNYjbc=
X-Proofpoint-GUID: 0cUlJO5Jh90Kvqj-LvhcD824FKwQL0dm
X-Authority-Analysis: v=2.4 cv=f/vdl+yM c=1 sm=1 tr=0 ts=6ae30931 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=WbsCytHUCBBKkCb54EYA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290034

On 26-10-28 21:04:25, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The power grid is partly defined by connections to the on-SoC
> peripherals, which (due to various reasons, electrical and practical)
> are well-defined for each PMIC configuration. Factor out the common
> bits for Glymur CoB devices.
> 
> Because some DTs (mostly the CRD) disagreed about certain values, I
> made sure to look up the desired one for each of these common rails,
> they are now set as expected.
> 
> This enables one to take care of most required vreg settings with a
> single #include.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

With the concerns from sashiko addressed, this looks good to me, so:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
