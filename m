Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCAB3471421
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789388867; cv=none; b=imE5w2cn+oNFj1hrAw9aEtaTFdLMI1pFfc1vtH4WvQqCpUAZZB3GDOgq2oUAN2VOoYCRsuUYspHo8bLnAL3eMPsJh9k3rmc8YX1HQjMIRwQGEh8c63j3Ma7dbVeXsoVqGBHNE7LylYv0rVZf5BqjUDhAwG3cq8v8CAc8kGz13Rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789388867; c=relaxed/simple;
	bh=V7li5Dw9nmkHeY7iCABC8exOwEM/gxkTUPUJ2FR2iOI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fiTVBTQbSC/UiZ3e+WEoDL/Zf4YcxfyfTDQ2qmiBc45V9wT0ppuK8PnR/6LlnTVhbnmgL0UGhH+pYmBDklJvGeL94G98JBkxqWEJbNKZHOT/3jra08paXeufI1YjsG2/bkWf6RFyaiHKh7bZYrLjBoM0egZt/WlE/5kha0A8Gu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jqYAtlnf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XR/HHADZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jqYAtlnf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XR/HHADZ"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAm1sc727573
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:27:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jiFJ73bnfwYbpydUm5rz06+aMTJCWc5/QgNe5wl8U14=; b=jqYAtlnf6v6d+eKP
	80uKAgparEQeqgBKuxMPK/F4Fo6O3Wzk4pacDYlRx7KJkWJ25leVo0s8/otxiiaa
	ZCrjK7km7HcEtsxbknIoBPvdMDqjjld6k8J6XTRDpuIs9L0kLEbjn6wa0ZYBzmJl
	6nWq7Hc8xotMOCy4TW9lbJv0b1mwN+dJENq8OsyGdJ2Mb+MkFbbCkBoZxaY58v9u
	b2fBrAj4Q5igD+HVs1VQk1h2JpEM3EnhbdPU9sVPqNymT8/i/p+iqnCLCfuEh2ga
	SJWriJYN0B5SD/KUPy68YjMEgxsnhPqjSWRhvq56FZ/lSRwrsFU6dyKa7l0VKesk
	IU8qpA==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpdb5rvb8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:27:44 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5c8383e6a13so56830e0c.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 05:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789388864; x=1789993664; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jiFJ73bnfwYbpydUm5rz06+aMTJCWc5/QgNe5wl8U14=;
        b=XR/HHADZRqyssLV3qfdSX/TrKobxZcfTIaf+6Nyb7T5UUslaTJ8LZCxfkFcT/6ON6P
         trVLJoNUM5L77W5HU/jG8tImF7xZUUNcx0PUza+fluthhd11BGqjEKenLJhYvNnUJk3f
         lLCKOTUI4iac9WF8Of9jNlgOGy5wGMukxJ5cmzTLxzvKhjpNo7D2tt4ERBggD9UXDjbM
         OtLeB+ASf9laeNC5Pn5dclV9Eo+esd3FUJsVZjzUnPJkn0+wklgxfRB56kEkbX/6v5JK
         v4t5ruyKL+j4ZGSea92ZIsXLUqdjGl320JF/lj2HKm6AQ4R1j2FydpRm/inCwSv/+nXO
         Iq1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789388864; x=1789993664;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jiFJ73bnfwYbpydUm5rz06+aMTJCWc5/QgNe5wl8U14=;
        b=XsaGSp5gVqtQFLOsivFungPWRtknmMjBYx6BNZs1d9G23EE8B6iMlfYHTnWxwGi3Cz
         exDGuJ7e6Q/4d2l1eI+Tlz8Lh5oYiFSPr9BKCjUynHP1OqNQXh6ZmMtDlVKSTqAXE2po
         q2nF7xfD/HiXYxVpTLlmsbKQGx9YX4Eul5RK8J67qO1Mo+w35KnvtLb1zHji56Pplbhu
         VYLarG8JrAt7UFMu4eMQ8tw3BWDLGzsmpUpQuSgPGmQfmuagof2+dTUQTlQo51cxhqEc
         ZMycmsmqaXqTd12xInZik9HHwSoDzyS2siztv/0k2fE0haZCRvy1gBhI5gdkvrHR82iJ
         wFFg==
X-Forwarded-Encrypted: i=1; AKwUvBwFUu/gBzmptiH45/Pq/p5xozIfzWKDbYc+/RVozq0t505xLTByfogpsgAIxY85LTtn7i623cRri3605W8=@vger.kernel.org
X-Gm-Message-State: AFuF++kR/AjwikwIeNa52BQqksOcVf6S8u6ipuztqRaamZtXAx3EcdMg
	i3UcJ/XpEm0FW3YneFt/OXCpvL67Lkk1a5lay+mVDu/gGUKBQILOZDc53SHbGc4TQVgPFL37d6k
	kvOuqud9gv70LB2A2e9tAcNLL3yOx+ENVmQbMd5+yPMVVam2nC3OouqdY2Hj4U3cGto47slNMp2
	E=
X-Gm-Gg: AYBFou1Rja1BpzSu7HuEnudVFDOYdZOla2p1MLorECW41+i+t8ldjaq/aGbSAi5ZCYW
	qjHVEwLOi/BSZ23HEZSp3ebfNoZANFFf2YHvdVBvV7WsBRnrG5aCozzmjSb84ClGChkYBscIRWm
	UljL0m5qVTNG+BfztGqXy19pYXFALqQO3+c/WcLABu90/LQxwv5o8GVH1DbbttGl5PIv767eSoZ
	7ZXS7c3XxD+Jc50rJyi3mTiwzCXUXZf7O4g53f3x+fYtotWUQsHwx/vIRuqMjLXdeu7nwTRz0y1
	92VDhsxOYBBpD+SNa1oBHjGQ/4NaEER1N97IUCA7py2VTNqjuLbJPKKz5io2CE+id6DB+9nMWdo
	IKEz+3pIUu+Y5ovVFeoHYxQ==
X-Received: by 2002:a05:6122:4a52:20b0:5c8:356d:c872 with SMTP id 71dfb90a1353d-5c981ebdb36mr358392e0c.3.1789388864069;
        Mon, 14 Sep 2026 05:27:44 -0700 (PDT)
X-Received: by 2002:a05:6122:4a52:20b0:5c8:356d:c872 with SMTP id 71dfb90a1353d-5c981ebdb36mr358369e0c.3.1789388863619;
        Mon, 14 Sep 2026 05:27:43 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a047aa12sm2432030e87.74.2026.09.14.05.27.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 05:27:42 -0700 (PDT)
Message-ID: <d6b04f9b-f51a-41bc-895c-f5fb5cee62fd@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 14:27:41 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 23/31] arm64: dts: qcom: msm8916: Add domain idle state
 names
To: Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
 <20260914-b4-idle-state-name-v1-23-660c31187819@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260914-b4-idle-state-name-v1-23-660c31187819@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE3NyBTYWx0ZWRfX8EzKdptE6YBp
 1bITnaOA7dLQvw3YpcfZ5QB6XBicqHk5x0pYt/uwC1HcAEQcsTe2QSpg/6fS1II0S3pAXILEX0A
 WPRUOmpLZC973Feno2k4ANGSvym79jI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE3NyBTYWx0ZWRfXyh/xTpNAUuP3
 EA58NYNxdxrpMS8SZ2b93BOkBCga5Jm8SEDV6xbVNiQl4pfNLlwhHQSlPEGMD/afjOT3BLNli3H
 vaTi2BCZNU6nrnOClSFAqJFVMdMlW6+9ZHj1uxsI5zLwxfnlugxD6XqaiSMdKpcF70q3gEqF3lJ
 uKzvV23WTQp8wCyxzWF+LFczkO8qBXqzIBNxxln2Y8J9UHUufcyf6rdInafqZexWccXg4q+qOAh
 avWBY/prRNOB02K1zHqd/98rYc4frq/jeDWn+31wuYTzesWuoQmItnSs6xrxD9tOm2Jg0hz+P/r
 R0NEG4gExanILY3i+OyYl3GyXgmQkAAVTpw58gCWVXi3oTKm1cSOxGp+rd2/VxBrLfgdGiNdNZk
 unfBlKQGFVW2NVpvaS46Wb6jGsTL5zR+47isZiMKC8Il7tbb3UwSdtGxl+PLxutHzo2PnlpyTp9
 A5Rj/W+Iyt0lDd8Kn8A==
X-Proofpoint-GUID: rKTXinX4ff4CrJuZNU414taJdBrzX6IB
X-Authority-Analysis: v=2.4 cv=Ie4Symqa c=1 sm=1 tr=0 ts=6aa7e840 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=HAnpKfeiUU4SruykqnYA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-ORIG-GUID: rKTXinX4ff4CrJuZNU414taJdBrzX6IB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140177

On 9/14/26 8:59 AM, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> While at it, update CPU idle state names to match the low power modes
> they describe.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
