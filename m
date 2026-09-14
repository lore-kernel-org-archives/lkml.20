Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 814BA42902E
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 14:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789394598; cv=none; b=NBdtjw+rXnwS33OXHnskvL9Kay1eRJsQuYSANC8iBmUqxCxKkLILr4b60sqncqJtVtHGkFfGoUrjrGfowmOFHKvBSPWA+CTMNV1jePqAA9OTqH2kdNfF9Ao1r++/bT/UuTSDjBHKuGCu1RJTaeiJ23JI7g6sbjTLWDTZG3c+YoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789394598; c=relaxed/simple;
	bh=veFrKTAc8vROn8LflcgK9hdghqncqe4wOIseyA6YVQQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tz3PfHpcUWfyCGLXrrsGQb2YyOWGGFcY73cwKwzNrlw8Xwr2EwiLisBDOWuQjFOTURMx9OuZs5CzxNbds2tYK9XMUBdZqRBmkMxnAQbG9H8AcWD9roFIdkCiXgqfZDkmKplsHHxx/qtRmxSOjQywuz7r88VSSOTSsKeKFmBGPhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YBhRUMTc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hocREiVR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YBhRUMTc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hocREiVR"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ED0ZBm1025903
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 14:03:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bJLwYSimBgZLHlMCLJs49ctc
	RaD6WjoWxoa1Bx4XulI=; b=YBhRUMTc1WezRos+cEr+2rhnWlYmqXw4Hy9YQP2R
	vaQiwLYmZUZ8Suz0/7BUDm28BYVZD4LtpMKwKYu0jF7ItWIo/5SSG0/LMCErm2oz
	Z7JhAYel1S8oqrf8uKWyIoPqgkNEoeZc/qDpcJGcWgP2OVlqkZVogaybUlB4CP4U
	lMtgTeLyBOoFxOt4V2T5F99G6i+F7XrteMdBre6o66LI3/QILsi79xxDvmZjVA7k
	o5NKQDPG0CVxpb35H7fdzqjKOMF9T9+zJjjzlWo8Am4TWi/SB0rdgwSEuhMa/jxG
	V4d/8e8dU6tv2JZzQHzpF92Fb9aRwr5QOglGBS/fdOpbgQ==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpdb5s85g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 14:03:15 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c7d2076f8aso3628150e0c.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789394594; x=1789999394; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bJLwYSimBgZLHlMCLJs49ctcRaD6WjoWxoa1Bx4XulI=;
        b=hocREiVRAWAKiHu/5kDlv3UsQZYiczITVJ9Arn+ciFY8VaQy6lG7Q7QALHLzAuSHlq
         zos0PNPomI3PAYu7zAH06GmVydPigvZld6oje56ncoVVWCXt3GtvJP81rWCmPMORHRuo
         Wh4TncbQoCjPijJdPwavlgkUhKBBm6aCtSMEBd68e/vNV7pYFyXNuxYFrU4msriLOAgX
         AtopY61u2xxQ1988mJfmJ49if0qRTjA8pGHw9R/95ngnBsGLw7P7QNJHHcBmoT6iyuAQ
         oJ15WQZ/T7p0iU24dzA0lTQuDaq+i3dQUWe2KGuo5q5EaaDamdLqxlaat5qRyHzMtV6t
         QJIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789394594; x=1789999394;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bJLwYSimBgZLHlMCLJs49ctcRaD6WjoWxoa1Bx4XulI=;
        b=noB6L1TRY/Ro7Ie58/1hWy7iTa+NrrUtaEd2memSZq8dBERUonNGgS9QnlmWPGuc8F
         qUcDr9qhcZE7bbFLH5FMMKkXEU4ukm9F7K/gu3dB1y6IKpH+1x1x1PmGPDG+FrVsp0b/
         TJaN2gOPlks13dgD36tZv4HVa0pea4EkG70PtJaeGH2uAsR8+PMWbqZ86CVQ+aXOFPb4
         3buTYbSdG+UnsQbtyM1Jv7eLT909nbb5hMUzZuXBwgCGb6PJjQ2PdVmQwN8NH6GVf/wD
         O/SWBr9aoY/aWHGLXXUG2ycDzKlc29i+HG526tshtpezDCX6UWeb/STR8vjOi+8xFdeH
         6YpQ==
X-Forwarded-Encrypted: i=1; AKwUvBzUhcjn/MQm3hdCnFHhukIxRBJ1G2Y9F0xR/kkAjuXo5XSPX0os5QaLcSvwziajFKeryblMrRfS1REOgfI=@vger.kernel.org
X-Gm-Message-State: AFuF++l2Kkp7GzfXOXlEKqD3qU8K2TNwE7vPkswEOiA6f9bmN8FO0Q35
	R1LTL1Mnh6huUhZ13EaEDDaUmfKNWQOO/aI4MXCZ2Mw+DuPDtz5S84lF0eyyVHWm29qujMYSRYC
	WYr08MHJadrCRarEevR/IHvfOpdYykH+bvtpT3ZP86wy4y+VkOsKmfpUFAQ0nL4Eu3cA=
X-Gm-Gg: AYBFou3LBy+yZlEY1UCku6KGJCZB1AhSoOladGMBiePzY1W6mXcUdWIT4PLq6gEfNDF
	pgWv0xX9FScz+Y3pZGxkVJVma7tQ7dpIX+BbJsmvov1GPVRos9yrA8yFfs4Eg0VILJ/vxGkFsSJ
	q/jxAzwAW28+V6e0Kl8jvzwS+qc9IO9vyhPwmaaT5jWpnpqLsj0Pv2ZTDSlJVwemJQESVgje6XE
	Af8Y5uwucVYGvdHGH5JOL5IF0AFoAK+STTSK/pAK8ZNb3J/WhH4jWM0QYFl1bE5YV/N0MRvZUbA
	0mVz6RkKeKkWLg8WAjd8jQnHaqL7mpDIE0dp/6gnKubstXgAT9J2R8RBDxoSreBeRKZmT/MnwLL
	alW4sQsQHyB/pL7k=
X-Received: by 2002:a05:6122:1055:b0:5c7:c898:9817 with SMTP id 71dfb90a1353d-5c974bbfa09mr1904896e0c.7.1789394594172;
        Mon, 14 Sep 2026 07:03:14 -0700 (PDT)
X-Received: by 2002:a05:6122:1055:b0:5c7:c898:9817 with SMTP id 71dfb90a1353d-5c974bbfa09mr1904778e0c.7.1789394593473;
        Mon, 14 Sep 2026 07:03:13 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb3602eesm25999064f8f.34.2026.09.14.07.03.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 07:03:12 -0700 (PDT)
Date: Mon, 14 Sep 2026 17:03:10 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@sandisk.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        gopikrishna.garmidi@oss.qualcomm.com, jagadeesh.kona@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, nitin.rawat@oss.qualcomm.com,
        sibi.sankar@oss.qualcomm.com, Taniya Das <taniya.das@oss.qualcomm.com>
Subject: Re: [PATCH 5/5] phy: qcom-qmp-ufs: Add Glymur support
Message-ID: <bhwywy2ldrpwff4wxi3slisbggqt74pqz523ksanusssmpfvbn@ht7pp3fafw6p>
References: <20260911-glymur_ufs_qcb_enablement-v1-0-b9fc5e2ee99a@oss.qualcomm.com>
 <20260911-glymur_ufs_qcb_enablement-v1-5-b9fc5e2ee99a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911-glymur_ufs_qcb_enablement-v1-5-b9fc5e2ee99a@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDIwMCBTYWx0ZWRfX/nsJ9GYHTBwP
 14m87QsUaJJfvcJRT7rJO1U619X8u2AuFodTe9NtZkhh76b0IWhDruD8cpubePR4rULXPoYLGiz
 KYldMX1uq7nVnIkf7J98y2bFULp3T0E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDIwMCBTYWx0ZWRfXx2WcDSCFoVgb
 DmpkhnLvM3/neEM6kUMl1LHrzcQppHjj1l/DsSUifAse+/jU6q/YzJTM3HzgfxjkfUmFCgaBpeE
 eFzscGFImvgv8Yb4ZnOZT/HaGETHdNosW8POzwYP7GXCJcY1BpUVQPVYWnrCnEwm1OQbD8lNivb
 4uuK1k9OsNpj5S5nLS39zb6nqvVyVotzYUHHaYIvyIHgSNwgO9r04Judt7F6f+LQTmhJkX7enKS
 CVeBygHISWBa23Jvfuk4npaFmzVpPU2djQe2AC+SktnFArUKT15i2Wkp2ioVTDBZpRod5dlw1eZ
 ua3Tb2tEscP8x5+b7nYZkiVirUMbUWs0Epg+kBb79UgyF5G/EMn+ygGZcaYOxMUv6uCitF+/RAN
 QOJMPGk6aZZkkHKKfP7Z+gg3kNtZrY7ue1xTEGyhnERzyt1JOg1QWm3On5xz+zZ9Dgu+mjvyC3h
 dslTlCaz3H2YOGqEgJg==
X-Proofpoint-GUID: k7AsQariVrWXYCtoi2fkgsdohLXdy2Wd
X-Authority-Analysis: v=2.4 cv=Ie4Symqa c=1 sm=1 tr=0 ts=6aa7fea3 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=l9x3Jx16obnCIVmqrg4A:9 a=CjuIK1q_8ugA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-ORIG-GUID: k7AsQariVrWXYCtoi2fkgsdohLXdy2Wd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140200

On 26-09-11 22:17:09, Pradeep P V K wrote:
> Add the init sequence tables and config for the UFS QMP phy found in
> the Glymur SoC.
> 
> Signed-off-by: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
