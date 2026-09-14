Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53D64331EC0
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789371770; cv=none; b=r2kA861EWwWlAEdn3iSQedtj9+uhjEsVXdP2+vxwlB9QdhJVchfQlGVxd4GGSLe+COsBi8jp8vo2XWtyRM8ekDIKc6PkHhBB2b4j0jzxRCHpiUY2Fs+JVGcuL1k6UAfx6o6AyakU8F3giuyMmXYt4EOlso9mFZEj+5CqRZenYJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789371770; c=relaxed/simple;
	bh=+Xgv1A1tyIYQo04kYDL62oQ7DJQJ0ukUjIS2GQ6e9qY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jvFbBc3LggBvvPw0tM2Hp4j12pkEVmjMFtPQS3Or0gIiXw8bL2TjWMYb2diP9OBX3dSGqYSVqrKfixYbnFSlyGYoa4p2krQrzRVvXAwPqhEJnSI6LUpzcTraHBwxs7E/PWEOl0eh8pIML4hDc60nxQ4P0dyOMVj7n98fux1VFgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hlfTLmEN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QwOZjCtI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hlfTLmEN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QwOZjCtI"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E7S3p33351636
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:42:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XFGQubof2OTfl6Uw+DrwikAF
	xXdv49oU0NYc0i9jX/w=; b=hlfTLmENbKHejq5c1PsnEbjD2RXRw1g/Z8l8GOsk
	1N/60IDHZdDJWYDBInBuKi/3JwnsIF8ct4QE6t5av2o3CqYtqE7E5LZmn2oxboVt
	/dbnre4p3qAfPT+rAcoPPg6BuZ6w/1ZbY2vvIy8VDo2puWelh/ZTS7gttlARs+DB
	2m9vSHwFnvHranCE94fLyuvzuszqD9zB1yeRNTi4Jr7hmiKhmIGy2kQHVyePgUgo
	e+OwQJbQ+IBVhnKRLuaSlkB99QjwKDIT+JEI8cPOEhzycVPp5OgeORtwPzToA59W
	pLaaEftUhvTgwQ2rXQNR0n6A3pW3oWwSHe+9H+aGq7fPuA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpcjg01rt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:42:48 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93903622880so810043285a.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 00:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789371768; x=1789976568; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XFGQubof2OTfl6Uw+DrwikAFxXdv49oU0NYc0i9jX/w=;
        b=QwOZjCtIxfQfQuu0dtOXzJjivyG00elaqHqlEaAAFtjggmHGWdtgtXIyyoij2ZPpUp
         vvY0UKaz6YSl1k89EGh3XDpY+1/BCTZTuoNS9doN1QmQMxCf9GwtlTLMa+8/6RAKMSqw
         5PcQr1PehMUB7yAUUecmPshoXmxNdqMEUUGadUw3KJzsMxU70/RlDgxqVvGURehkUIPA
         ZpBevrjFZEhFzYDpGxlUg6/w5ob7UlgA7nxPLi8YRaV0iofOY0AFTjmRFzjy8l4a50qU
         jzqkm9S21nEYbeRYt1eUcYrm5PW/tWl90Lk3Sb/ArkCRn0P5sYlo6x78yoWcoNN+fuzp
         1SMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789371768; x=1789976568;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XFGQubof2OTfl6Uw+DrwikAFxXdv49oU0NYc0i9jX/w=;
        b=Mb4wR/wJCCCM+E5pVSsK4YGGNGjz4eRlN03MuoK0x2mc1vEjK8UgqfLlvTw6Bc4GYw
         Md6hQ/jvbXly7XuDaqO9jC08XSQDgLK8mC/XLy/HJYsVfIVuGLygzwPd7nOsoSVXBgPp
         8olSXJcdA+O5QeNspnu2XBjo/Bvm7scdFdjzwgqTcmFGy6q/yv1fgEkRXBbYPkS+nfWz
         98QdqL+8QFPRcSoclD/I8dqB7viD94nRRDyHytkzkedCYBZnxHy3RECYQzm2ijatuf4p
         vITjM23RKFh5Huiyk952hPnxyzDzwsQM5kr4/GBpVQ+6cubeiKSoYgF2/SjHq+MpFmlX
         wFKA==
X-Forwarded-Encrypted: i=1; AKwUvBwS2YUjqn+RJN6aD4NWqMqPmDESyGRviGXs1Xcc0FopNPaSv7XtdzdcV6XNkaxDsnKVRBMXl86OiVmWVUI=@vger.kernel.org
X-Gm-Message-State: AFuF++m53rTXqf6kFhme/c/lHQBc5GGdxtmZELoQrZfYpK4jPliWAaHB
	fcVuquZdcR362YJHvQ5Y2SBKU65FRWSD3rAHeviuzeANPMnoW1jMqU6W+G8j5mmWNFxSX1E1I1d
	BGzehn7uTaOvuOKhztuq5btzp/+5xSxnTdzEWWTUi+NnhV9YYvGXCHfd/cNlBBYqZPFk=
X-Gm-Gg: AYBFou2/kSPAbpf/UPq6uIZm19bViuT7t+loeo3HgdQpuTkr5rnPecVn2yLHJJYVVMS
	v8/eaL+elLkXgLmHuW3gSfNLefkehjCa0Fa8hv8ZcqF6S9m2AEEbR9Ykw0JceTPgLnqDIGyTPgn
	5dZAFdbka7jDRVfHZREcva+OIjb0lnPSzFATO5qMWpu8/bJ8yuVFWqM2ugw+Jbyl2VtfqRzelx+
	DH0a1b52yqwwXITD46K8KGoeQWcBuVkk47X0Y9TMyJYarb5EqLpEKatEIqj3TPPq0x2NpNfCmOv
	eivPHMpshrl+VJ0Zv1SPj98rNjmsTT8Ms8Ujf+MJWqJ+bZpCy6sWIc+I2I+9tDTDszWr6fc+92a
	LVZodG7GNWIkHl+8=
X-Received: by 2002:a05:620a:4710:b0:939:fcf1:5c27 with SMTP id af79cd13be357-93a18551fc3mr544144785a.8.1789371767544;
        Mon, 14 Sep 2026 00:42:47 -0700 (PDT)
X-Received: by 2002:a05:620a:4710:b0:939:fcf1:5c27 with SMTP id af79cd13be357-93a18551fc3mr544130885a.8.1789371762350;
        Mon, 14 Sep 2026 00:42:42 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e69f053b7sm217241795e9.9.2026.09.14.00.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:42:39 -0700 (PDT)
Date: Mon, 14 Sep 2026 10:42:37 +0300
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
Subject: Re: [PATCH 26/31] arm64: dts: qcom: sar2130p: Add domain idle state
 names
Message-ID: <iongvsbeork4xzzumcbyur22lom3dthddcwevq52tneeooqx3z@dqojykfp6nbs>
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
 <20260914-b4-idle-state-name-v1-26-660c31187819@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-b4-idle-state-name-v1-26-660c31187819@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=CKa/zhrD c=1 sm=1 tr=0 ts=6aa7a578 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=HAnpKfeiUU4SruykqnYA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: a9yfPbPQUZBa-T6P83vH7P55iKwWkSd1
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEwOCBTYWx0ZWRfXywvV6hKoxzR7
 wN4amHiP/qqA1gv2ca2sLAHetiAOMzXgUIKu0IyW4MXoG0CtfQuBt9YO9jgnim9UPYKfxuVkNjT
 fiTwd5elG9vBXIeIufeRqAu69+w+9EQ=
X-Proofpoint-GUID: a9yfPbPQUZBa-T6P83vH7P55iKwWkSd1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEwOCBTYWx0ZWRfX6DpRfM3dia5W
 aupZVjaYnGQ9gr5GHR35cvtAOubCy536ceCNBqh3LNRUYkwqMjCgxc3zeBbGyAXEjuvYZdJuF5u
 kSpcAScdddIk5FtBoNFo78lhzaNEGzrmCe10NZvk/pRYVZ90QqmTsx0W6sTtDbB5wKW8SR4Dtdu
 EnSdXKkArUp+NdMlr/BawI/FKCneQ6Twkej87xmryTBiFH19VebNHG9Zn41wACFlAnxcbfp1zUm
 CDlsSm3ruZiL7RlIORcYCs9pBCVfvqjW7uXDVK3+4lCDARGElyHWaqhIpluGXN4fAz7NmMDOt4U
 5c+hIlqVX4i6SCOHlgGyNngGJqsVSv/wuZY3frzoU3FXH2jkHovMd8tTVS/XYq/fdPQzBz14FNq
 IgnIRx78kI3cEkQTF/+sX2G6qnDHjinLuSu4NXcl+BPB0dPrDOn8XapmrEisdVs9uDYhGpaJZ4h
 4GReku0BdT0la8O/thw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140108

On 26-09-14 12:29:58, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> While at it, update CPU idle state names to match the low power modes
> they describe.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
