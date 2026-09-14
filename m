Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 524083F20ED
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789371503; cv=none; b=YzBLR7XBK798Z1oy9CSaUVz4bpJBqBaaWRncfwTgdVwPkoIAw4iXSYIEfM9kWFmqc68R+wLHJU9R6hA4X50FCto4JYMq2uJFYyo7vS2ZL7jBPYLZ2Sw5tdhniybaVDVap8Ht1PzPU4FuCelIy9HmTQoABS5YIAYjZh6usAosDiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789371503; c=relaxed/simple;
	bh=eg1exeIQOUuF/0XlpVPIdG70UibnUsfpjsShexP9O3I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f9eWh56CPQGQULQa5VNryHt9YJ2wsaADNHItaxBV/YSay60K2O0jYSmC5UdRgEeESwuTkBwkU1NYVjvojIvPEFCHk+ibmPCYzzva9JdV3yTQqbIlSj6mNB53bew+Eop0IH+yXOsJTwnj7A1YldQJuz+zW/8uuYaWRzQwO6Xs9dA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PFfdjWgR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RmnqzoRd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PFfdjWgR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RmnqzoRd"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5jSBa237681
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:38:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=N3Yny/OsUDy5NzfmpLLzerMK
	Pz5FLRY9LmfMQ5omQeI=; b=PFfdjWgRmIQEBnegwwMgVfrA5q3T7DFEZRkYSmto
	obMUpmUDfAd+tVQba6NOnetiPlCNZXL29U89dxILKerikl4d96jBbJTADvX3Ebfz
	ScDYTcuRNNyur0yi8Cv5CYOHQr5K1rnL+w3YbGtRpVAKgss2F1v04152fsknD6IB
	Gh/B1zmLWdcRKRXjn6k4qxOaTZf1PgAc0v8XvWe5x1DAmy/54Al3u8elR/E2cgEQ
	SSbYEVAlIIquEE+UnP58+vZRFwhZ86+GP2qABpzUC7urOGAaBdfyynz3BMx91JWZ
	2irUNn9f1AQjgvS3Yc9TA5e24SgOENKgLblNseqzd7Deow==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9dnk8s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:38:20 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-939a6937513so463031585a.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 00:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789371499; x=1789976299; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=N3Yny/OsUDy5NzfmpLLzerMKPz5FLRY9LmfMQ5omQeI=;
        b=RmnqzoRdlNbhM82EfLgVN0E2Nw9YfK2n10h6YXjS/Mya/3qovvzf26aPYkZ4rt+JTK
         /q9EniiWhnVB71ySOylNdwEqxUwOnPvRUM4BP6TamyNAQfqNdnZC67Yq/iEGIWFvIgqb
         ArEyA75cRX5HId4X5dY4C/hDZkor3GZJrB170LBZVhMau8XMlZlLvVm2lGM7lYgCpx/Q
         +INjeHPnNnnWjFAj4TjDGYgZnLZICnNvYAZ9QL/yofB1x330EcVMwYb/wdg5lazZba43
         4mAiMc8+SJo/aNJfJGys8pBRW+wx/maiQqNPehzFOvj+/iMqR6kt3dqlfHPI9GEiINxp
         JM+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789371499; x=1789976299;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N3Yny/OsUDy5NzfmpLLzerMKPz5FLRY9LmfMQ5omQeI=;
        b=pBbGpzHmZaEA2mRuS1Pli1oe0fmRy6rk5/Wizfw0ZtCpuJYqaSUcibFDaKwGf4P689
         4wF+QzQ9cGCURMMIlz0OX6FO7/pzayNPRLv0CC7h2aiqgoxuIkOpx5rsPVbRHJXxgX0N
         vdv9pro2JtHlQeSwUWo02SU/Ws8IS6oath2mgIFLAUyKLLpsiLG7d+qX2dhZPwbnscUC
         mJbh2E+LD8MOdXx2gHJ4ikdPnGxtKE30fcB9OkFwC5eEo27E7JfkWaHadpRQ08N3Dt/H
         x06Bo/iB8zvTt++2cO/O/SD99vEngHpJdrRa/QN6x7Zr/7Oii2PQatGiquAfL5EQ8lJE
         knEw==
X-Forwarded-Encrypted: i=1; AKwUvBxS/aZbXDXWkSkQf514W0U2Pvbn7n1BX4xl02WoRmTPtLgc7HPo3oD4CV3GKnMMQt33uTz7jdqGSXWc13o=@vger.kernel.org
X-Gm-Message-State: AFuF++kGnBwi9bMjIkh9D3lkrwAQn3bAqhcJUKemlafKmiYLbJyJnlbQ
	OnDLID69hbWWels85+BRlcLPbCbrW3ED5bD7r2k3oXGbgq4xOtZIwPCtZ6/Gn9YM9uusHz15Yuz
	4tr3XQJ88PxWCpLOOOn/BOAsqjexOoqOypQ1CCSFU0GhpqXuacFi8EK/bAzTjvW9XX4M=
X-Gm-Gg: AYBFou0OfSrrejznnyiMksk1rEhyihS2ZukCiyTDbBF2hFPoeG5/S/xY0MVOdx0yDu8
	shzrU0JtyV9ahQpPI6l8zRC0goWOtMerfEsiJlBXs/rdZQT/CgyNRVPcSO04fo2uJjtUj9mmVvk
	GwIfg6MSKlMjJ8NSNUDIwk6pB2WiQYjs6UhYHAinTV3dsCi1vmJ1O9uKUDieKm1YN4Ocs7BsH1R
	XhcCPjJ6nUWWaXN4YWjbWHdZqgERmt26tpVBmwwdftxoiaoLBDTUpxCECQbeUR8lC4pdK+9ZNjT
	i2QOxiQqB75oZ7jncnQGXCqFF0Piwj4EmdYCO7hUMMojrGEzZs9zyIqkarzDxGOHuxxIrp4Xg4u
	Is7N0SQTJunRWVw==
X-Received: by 2002:a05:620a:4889:b0:934:ab73:ac53 with SMTP id af79cd13be357-93a294bf61cmr210771885a.0.1789371499357;
        Mon, 14 Sep 2026 00:38:19 -0700 (PDT)
X-Received: by 2002:a05:620a:4889:b0:934:ab73:ac53 with SMTP id af79cd13be357-93a294bf61cmr210767385a.0.1789371498818;
        Mon, 14 Sep 2026 00:38:18 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb33ee5csm24899801f8f.20.2026.09.14.00.38.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:38:17 -0700 (PDT)
Date: Mon, 14 Sep 2026 10:38:16 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 10/31] arm64: dts: qcom: sm6350: Add domain idle state
 names
Message-ID: <pkyhw2dwwbzlp3v2kr2h72jlixzlouappyal6kahrrgezs2dol@o6ku3lbgbtev>
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
 <20260914-b4-idle-state-name-v1-10-660c31187819@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-b4-idle-state-name-v1-10-660c31187819@oss.qualcomm.com>
X-Proofpoint-GUID: ksAiGmXqrZrUIKAU4Mg0M_Ld7bvE7tJK
X-Proofpoint-ORIG-GUID: ksAiGmXqrZrUIKAU4Mg0M_Ld7bvE7tJK
X-Authority-Analysis: v=2.4 cv=NelzRGD4 c=1 sm=1 tr=0 ts=6aa7a46c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=Dm1D3uWegqzzbaKFt_AA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEwNiBTYWx0ZWRfXwOU4fuGxQaz2
 FfAnC895bD5wU9f5dkw2ZEWVZX1bPBSfmiKZ33jV/bR9ZqieJ08p0Mvxac4LFcI0fDSe0cRQHLS
 WZyB4FliqMdSlw0dTA8RzKV+cQDv+XE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEwNiBTYWx0ZWRfX3XVW3330TfvY
 k4eMtVZ6w3T8xLiSIplOht82RvwzrPFjTufMugPQW/e/k/zLxuhV8wiognJajc+t1Eg3LcAEPhK
 mME5oekDj8yap8xWwI58HpHLUKweLM0y5ATvzRkFj8lkyrt6e4y+xcG1m683ey+0yDFt9o5oQtW
 WsLJ5Q/C1dlIKR+XwP0MnoLhtXLtLyHp6hJsOUAVMcghwWtCPK8ZThbZwkb1DBl+cnzMGRIb8rj
 BpNjN5EDI7cs06Z0IW4r45HuJ0s4Z3sndDqJi4K7/RbmZpvFzwzn9QMBONsV7fU45BTiYDbMa1j
 zUVS2niEJOif9QyXOn2FNriEPlI1CT6nJdZNWLXKE6CP+BoEWBvFIwbHr2Idg7tapnSOEtItT00
 VAZEmMer2iTQcNqQ7kRbAerB6JpbdHvbX9K3ixCglj97Mz46OTZxxI7cipEk+zwk2KoKfXs9lxH
 MtU4eYQDAgSlVBhj3mg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140106

On 26-09-14 12:29:42, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
