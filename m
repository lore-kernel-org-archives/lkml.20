Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F50E35C6AD
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 06:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789022898; cv=none; b=Y3D0D9d/5jdPqlLfbBEyPfQvaCS8XIOvDqA8vKG6hpTiuHKn18Bt6r26s5efcToepw3x3sh+FVx5d6NuXZ7NxoqvqShD/K2RSHWE00OQsjDGJs3EbafQHlsG/l6SGdOcemhEwv+Ze4szspc5XJ9vT4EdNz3qn6wj2vBduI/67/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789022898; c=relaxed/simple;
	bh=3L2b69RJJnuw4lcVLlXhAoSaQwGiXuIlqO+HnG/X7Eg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=okm1u0PwowQ3Ci6lzC0vdSdCQ8WlqDE6xDWT4/z+JQ1oVQNSF/bDcg8xBt7L8JclJAp5+wFZdkCKoVX785r6xwmE/daOPCmIPER5YAI1OfZ2xrgaNKSZBJz2usMxRtHBKXXAw2eys4IKbMrpNI1XH2vqDPPVx129EXHLAFkRfi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R2abuqHU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hmgy4cct; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R2abuqHU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hmgy4cct"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A5H1gD4143034
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 06:48:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mvvRWLQy9D9Ms1FXD+eDgTSA
	ed6FXm3bAYuAa8sMroM=; b=R2abuqHUbLMV3Wno4oDzY4fc54qu8N2STmCSvSG5
	nFInWaQ9NXOAUCB/53zkPYwe/su6S2FrpvRki969Qei5sFOnGAH6u8rnQ/NS9nF7
	8tPrMD/5WKwRK0iXZebxquaEiXeKIFawu8Lgu1m62PiV1DxuuN5mWkc1WusrcG3N
	sMhJSxwHPwQA1NE8ebA5+iefmYGAvnrTdVCcAonY115HL5VxxVKbMyfqqa0d8n7e
	kQVly/qbV4xrEyAJSlIjlJ6DGkUemT6OOHD8/Vrmlf+yozrJ8TS3pbdTL8WNReEq
	4RQ7US2Ib7RllZ1+9kcW90wvFasTl0pNKECp2rLVQYFuJA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcyd2enm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 06:48:16 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39533bb224cso4429330a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 23:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789022895; x=1789627695; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mvvRWLQy9D9Ms1FXD+eDgTSAed6FXm3bAYuAa8sMroM=;
        b=Hmgy4cctXnBrxY8Nvcva6lk8NZ5GfqVVkrwo4fQsLz3fzHS2z+Cvf8XKCkWxIwmosp
         wGq8KmCbPBQxha61NG//ZMt3Pze4B+U6wGlmEXaaZk+n+8cDqFJUp5K+bs0XahUblZWO
         GI06J3bm8ArJe8j9lOC3k+7HTKXSlbH6ZtAj49uGkSH0CY6g2NOGUK7v+UyLX9aLyNiC
         NsoYix70UYNrsgo7OncOqceodMaVt+wOJsEZpanPA2YSMGycwGKac6arzFQ1RPVpdpJW
         Yi4Vvab+V7qodArrTPKwnWFKfixYJ5Z/ISjweQruoTUu7KdlAIeVfVTp7SqN98WRvWS+
         lkTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789022895; x=1789627695;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mvvRWLQy9D9Ms1FXD+eDgTSAed6FXm3bAYuAa8sMroM=;
        b=pVHKCMjfQ8nPM000pei0uPer+5fnoDS7XeQFQo1me9CC79L4ft/5mk8x36f5ivCIr1
         siuTUEpK1A8+YWSm6ew8Kv2lC11RihNxXUzYA8M4xEAffkX5AZAv8G4BLcJjZi9kLpzf
         0HGYeJy1Is0wCe+ZQJ+/HGUaa/fOfCm7bBsuXiJygjTkJP+LfWg0araDvI0oSoUHMSF7
         PeizEUWsBheT2rsfI2iuvwCVwtZJ9MwPK/aSmGewhwCZlqnGnalzMfqyYLpDZ/LXva0r
         a5rpWhsVeIkGXFUlEgRwew80bcedIsXOZsbMns3MSNm01PirTTEaTvwKCwCBhyf3WWiG
         Iq+w==
X-Forwarded-Encrypted: i=1; AKwUvBz7tmFvBdsrqyo1cmcuQgBK6EKmc847B/4GJZOrj94pGgkqXEuX37Ufy+4OU9ZwKvXfSikfgwNC3BAkDYc=@vger.kernel.org
X-Gm-Message-State: AFuF++kggIzWtVoCj4WpPrbUNCcMinFodORzvIwWZ8u0Q2hGRoCGf4Ro
	S6/WZtwAvuL3u2O8xpw2IS18L5FNehedA49h0jmSCvVSQVHuA9k0JKTi72i2iY18aRUtsstlFtN
	YN2jTtSiNrVGU/j1ejnOBx9PqZdA3NHp+1rKCrt+gja00KzPlZqSu+8LhVolFn6QbtOg=
X-Gm-Gg: AYBFou1tJd8lBDtwdZ53G1+NhP9LQkzLPiBS8xzDIpxR1UhWHc7tG43+wfxj5Q8DwZN
	YikyOK0D9BACLtn9vKFb8gyXhHc698KUPkxT6y+c/LbtS/76xLYxfjUXhmnyiP7fKnG4HmYnHDf
	7n1qo20q5p58ytDC5mkFVom31qcqSOgQdL5qNKlsQR14uq2Hh+sjIuU4RI6bocV46k/cMqAk2tX
	GM7cHTxyT7L7mAnQpq1D13H8hlG0CmolaKwnjMjbqpvVq+hyR4WbAgC+Te9Yw2rZ4X6h6o3Q8gY
	0m4czKWmKwojPjYMQ2TM4lHs6oQDsv7I0SJJF2HzVs5IHtOthXbpZGcbKcUCCrjH2rj+tyE/cCq
	mdTZkUKfH0knBdi2u2omWOrvcR0cJBCizQkjXzbY+q3M=
X-Received: by 2002:a17:90b:580e:b0:385:393e:7124 with SMTP id 98e67ed59e1d1-39b261cfd97mr56212294a91.14.1789022894613;
        Wed, 09 Sep 2026 23:48:14 -0700 (PDT)
X-Received: by 2002:a17:90b:580e:b0:385:393e:7124 with SMTP id 98e67ed59e1d1-39b261cfd97mr56212222a91.14.1789022894101;
        Wed, 09 Sep 2026 23:48:14 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339ac24d7esm77812195eec.15.2026.09.09.23.48.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 23:48:13 -0700 (PDT)
Date: Thu, 10 Sep 2026 14:48:06 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
Subject: Re: [PATCH v3 4/5] phy: qcom: qmp: Move
 qphy_setbits/clrbits/checkbits to common header
Message-ID: <aqJSpqRmq5721Unb@QCOM-aGQu4IUr3Y>
References: <20260909-nord-v3-0-b0a82721c547@oss.qualcomm.com>
 <20260909-nord-v3-4-b0a82721c547@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909-nord-v3-4-b0a82721c547@oss.qualcomm.com>
X-Proofpoint-GUID: n8lss73djfcrqLwv8OdwokBIAvKRsDlK
X-Authority-Analysis: v=2.4 cv=ef+o7LEH c=1 sm=1 tr=0 ts=6aa252b0 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=Y4sVft1UDeOkrP7wHAgA:9 a=CjuIK1q_8ugA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: n8lss73djfcrqLwv8OdwokBIAvKRsDlK
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDA3MSBTYWx0ZWRfXyovzPmW7GXyB
 HWd6pH/w1A9Dn0EZm//V7CuFvxZbu+xv5kFk8s4IqiAjR598FwmEZrF35tMCPeqQrwC3Yvaq6tY
 tyP1wKNKUDZHXbdMFrTA+5T4nKyXozU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDA3MSBTYWx0ZWRfX7HRI8F16QVMk
 Onv456u9RIjAHO+gjRfHbo/fh1UqkKxS/4iOoDmIcqf3r/WQ3E7odp7BcOfQC1teIx0vYEJl5Ea
 g/kvNT8VWnYiZrUUwhDQGA0cQFD5lCRFUCIlazZTGzgaA28IXLNJ6Ft3o9XxMpdht3Vp+255Qla
 pwyr3TbltIbDlFl4sdHruVp6m/TqQBopDDLudS87+46a5aqj7VwE5G2l1PtUGVvz8+etduiSHhT
 ELEN3C2RXCZWwLu7t62VW63DrcuggccOjwd7jNokLYWhCs6qj+xEVE3CoXBzQofSuU91pu1eXYU
 eOXkZtKU9cv4iYQVgDdx5RigMjW+XsIndGhVua+ZM2iM4U1mrfC0M++wZGnVYOSahr8rroQJpxb
 TIDkCf16Ek7PLSFGquL4Pr65oR5ZmAgWrmwtVm2+Fr5NulNFXGJwlhKstZM1tejVW1fU4M12Ctb
 0fNQrwmyfjsELBAdv4A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 phishscore=0 impostorscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609100071

On Wed, Sep 09, 2026 at 05:18:19PM +0530, Krishna Chaitanya Chundru wrote:
> qphy_setbits(), qphy_clrbits() and qphy_checkbits() were duplicated
> verbatim across phy-qcom-qmp-pcie.c, phy-qcom-qmp-pcie-msm8996.c,
> phy-qcom-qmp-ufs.c, phy-qcom-qmp-usb.c, phy-qcom-qmp-usbc.c and
> phy-qcom-qmp-combo.c. Move them to the shared phy-qcom-qmp-common.h,
> which all of these drivers already include, and drop the local copies.
> 
> This also makes the helpers available to phy-qcom-qmp-pcie-multiphy.c
> without introducing yet another copy.
> 
> Suggested-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

Reviewed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
