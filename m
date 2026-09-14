Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82FC937204E
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789371867; cv=none; b=lFG0iPNjcBS0lmKEo6qwreLevLoEspRZyJsgoRUcILJrhNPociynvD4aupByRt9KoZZaO6asQXIscG2Y2f+cnm+c/0uLb/7X4EyCoJ1npynm74RcWO7eetIcNtepTdbMnTriNXgaRsifDibsCVqFUeRHKSpFYPGY/URiuKuGZms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789371867; c=relaxed/simple;
	bh=P9FxzeMC6lbyENHI8BdJ3yY++OGFptNNDYQD1C5o638=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jXONLECwL4tfIvfkIK1V4ZRRpUadndltMkT41vu9LJCDx5qD4gW1KAVp4AWN02a7AM7jNQY2Sr1FRi2Ns+/Wcu6wr83DV7wGHXwmo07FnRYECEttJJKIM7Lc8XvUu8xi10oRUklqMnRhANgm5CpSeWMvcIjke7vpvlDQsMRc2Gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QXzl8vGB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AgA+W1lF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QXzl8vGB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AgA+W1lF"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5ilqd793355
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:44:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/cd802JdT+cCUorD0ME29Cwq
	TidSfnnaAlDvsoD0fbI=; b=QXzl8vGBcHmkbbmUXMpi7SIbtHg4v/l6nT7W4W+V
	EmfD18zYCeTAJbwWtad1b//eZVbqw0d7cxNJlX/xAW+Y2nST21r3memjpHQT/igF
	R33OYAhQcGBdBVFctBG660Z/5iRSYWQvKl/OH4kv7xTsRK16+31QtfpFpmwSRQpW
	lsh8UDhuw0CgpUto7jH8zW80m1nZ9XsE26asmsaksdx+wcjZfmIZVpj8AfBEcWYQ
	Mo7Ox0oMLipsNRyexFKg2XsJOEdqiKvg/Ihx4cBPT8e7fjPnPdxwD13SpBM1p9Yt
	5AogGcugiXnbdPOpuBCkzd4cTDqyt2l1jypQK/RqBfkZ2w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9cnhw6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:44:25 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-939f1847fb9so325562385a.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 00:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789371865; x=1789976665; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/cd802JdT+cCUorD0ME29CwqTidSfnnaAlDvsoD0fbI=;
        b=AgA+W1lFglp0klND7jYuWJhzy/p8ytc5o1kKct8ZO4wrGurmbj2POQbgLWoE2ewLwb
         LoVPmeb2aLxYrW15KpHVgA0kshltelrW2EGq/q8hxBRcmF+FCOwUIL8fMA663m+mJkuz
         KEZX2ID2gu9huJSlIBsS70ltfGmbGbY0aT17GiqPIVvk3NHVZ2gRZ9Ygz6JZ92HEvQN1
         u/PDvno9tpbrPixzg63/lszpry/xoXEmvMhFf/9lRt+7T2ueNsd99GDg3V3ax3akYGeG
         W7BR04dH+RElESaE9vYC3juKt2kCBXNn6Fq/steAbjugqPvCDHWEZ8PyG39OW8PcSb/G
         6Fbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789371865; x=1789976665;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/cd802JdT+cCUorD0ME29CwqTidSfnnaAlDvsoD0fbI=;
        b=ZyOPKfSkWW7tNyUF0DyTC+dW5L/l8+Re6QIrTs61HXLkg8Qvp6YF9iyPAAU0GDtEGt
         BMC4UAzmrI05vJC1hyZHXV0kbuyqQYrWO5lVX4S/pr6cB9H4gt+3j7/yIpLbyPY1yIV4
         GJ1/VWa51FJoMgsiUNF0j5qQXNDoISoK9w217ZLS1ADfIO2fjpXg7PTsQ11Pw1UD93ki
         HKe/ECwdWlY3dFEUiTLodPv9QJqrhJbLkFfRrrqEc76DTWu2emQOJTKmrFbnrxBimtw0
         jF3g2XpF7ONZ60tJWQ6d268yf/jg8YR+N5wzJ/Wgm791CFZlaHB26ixnJ1ugrMOVf/Ka
         AA8w==
X-Forwarded-Encrypted: i=1; AKwUvBzVDq88CmHXicW3xuVpwZ8+I54el+LdYJg3BAI862fPZt5XkxxlGXa3/0ti8rChecMTD+LuDCcGir/RK6U=@vger.kernel.org
X-Gm-Message-State: AFuF++ktEC+UULGre709PMdT8p+mLoQNwThCnlCiYRrwm9Nk5vvq7KKc
	ydxLbSC9RxWZ9LR3Jvdsxz5KbrSxT75r+HgAIjPWFG57G1J9SyYGdmvkS5eMEDD0yDB/M6yAvs8
	VKNy9EKBFMOwPTzhCiRCg2VofenKYcTMLYUmY16wHUyi5+HvilCoYv3sXUCWvh9OIDT8VBmdbUo
	Q=
X-Gm-Gg: AYBFou3GQyss0mw5IqI3yCgEXaTqdKY9PlsOK3rMp7LY/5BSfYrT5slvPLW3lEp8xzj
	sz5sRUgHEpvocICvfSW5NxlkqR+eqBikEgFg2Hrf1IEC82Qp7pM4SFx8RTGSA3+bQQivb8MxKTK
	VW1AJw9QRbFSBEkaE7j4EaLr6fa5CY/oRtbLUwBdZ0mfHJ5Nq+jqsBHGzU6OZCEDX8AxsVBvma2
	8tED40mOHhK7YeG+6d3MwUNS8H03tM6hpEzjl4ZQEW6RrqAdkqHPGTTKmRdFu2pGKTDuCIB4ED0
	1DtIL0hThqxClN3h+KmksQGWcYOvF9ucK4l5hD2LGl9H9Kx1NiZyb0bQizucWSRK5+UNt1LCjQv
	OT70LYzp62GKlXZE=
X-Received: by 2002:a05:620a:3185:b0:939:4b0a:f0fe with SMTP id af79cd13be357-93a2977bc24mr195765385a.14.1789371864668;
        Mon, 14 Sep 2026 00:44:24 -0700 (PDT)
X-Received: by 2002:a05:620a:3185:b0:939:4b0a:f0fe with SMTP id af79cd13be357-93a2977bc24mr195763685a.14.1789371864202;
        Mon, 14 Sep 2026 00:44:24 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb35bed0sm25573045f8f.32.2026.09.14.00.44.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:44:23 -0700 (PDT)
Date: Mon, 14 Sep 2026 10:44:21 +0300
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
Subject: Re: [PATCH 31/31] arm64: dts: qcom: sc7280: Add domain idle state
 names
Message-ID: <yf3lksc6cztulduwnl3bpw3p2gto5wk3iwmvdvpovsr2ry2wm6@wxqotyf6vx6f>
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
 <20260914-b4-idle-state-name-v1-31-660c31187819@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-b4-idle-state-name-v1-31-660c31187819@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEwOSBTYWx0ZWRfX6eUzYNPkPu9a
 n5xy1rfHAYhgdNTL1mPZKoDM0e1Cy8YQl6L28ukMLJLwAmHP1NMk0C8NN8OAV90IF651+bXajVj
 MIR3eeto0DWfuf8i9nbuVMXNQ8s74ZlOWagec46x3SxJyvjwuUFDJcFY5FuEbO5MqPlgLPnreCC
 GdELawDZCjo+kkYPFGjEDdRJK9SJ9WT5w3A6N/nxAjWrRdi4Pp4BFm1PwDnhbO2b2Q/wH2QIPjC
 vieFwWUQstAECGh3SBpbqOxsMX2rsY/Xhe0PEUVR3Csb8zT6uTiIplGdwh1VSS0QI9ia3GdDAy5
 3GqmRRta0BKOLVgYf3zrprt6UeTZHtzfWpi7KBNgcOaAm7XUHoavghTbwqcOkP1Fb0FXsVnvyVj
 JruKAAVjLJ6zIjFj4JPnuf5E+ZkrzGZFc9mN9aEcB5nSn3ADkPYAzYP65q67h9hXJ9d209t5Qnm
 z55p34FOGe5fpORn+cQ==
X-Authority-Analysis: v=2.4 cv=EMyTQFZC c=1 sm=1 tr=0 ts=6aa7a5d9 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=HAnpKfeiUU4SruykqnYA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEwOSBTYWx0ZWRfX+NFZfFyWacxy
 6B4W3/lJKs0qYWoP8zI3r76aSZHx14CvJJB22ZfIXBdKqDKdbQxvLXOpLD2hD5toEGXTXhPC2Jd
 FaL+Kk4wrVxTI6EVsT0FXymfzVYEtTI=
X-Proofpoint-GUID: ZNS5zsNmMtM4YGJpOt5kNFyv8ut1v1BL
X-Proofpoint-ORIG-GUID: ZNS5zsNmMtM4YGJpOt5kNFyv8ut1v1BL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 bulkscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140109

On 26-09-14 12:30:03, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> While at it, update CPU idle state names to match the low power modes
> they describe.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
