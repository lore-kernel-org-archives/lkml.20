Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 150B53A5E98
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 08:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790064756; cv=none; b=Gn7kDS/vhcY1JlaGCXttgSC/Pi4RkMlRReODW7r1QlFR1LazIoqZzlDMwEafg3gbR4RFdXcDmZxoHgNnnDNYpNMqgB5/2i3OWS0YT2RHWYTujB/wI6wyGcMAJdyou+HmviZRJgCuddJ1VfnZsbiTcrmEpII8FBYO6V3Wi4zJlf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790064756; c=relaxed/simple;
	bh=FzwzCp2B3CQrL8UWS3VMy1GU1joePEyGfnMV0kBpM7A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fF2fxwcIJQRi1+D8NbOV+E3eJJOzDLuOTP8PA2lMnBFG6DwDwjyEQ8z0xV5VsqXTtLR1yKW3up7hOdOFW99CJwfyMM8GCYA0CIJVjTRb3L7vFvIJssYAsIMHkvFPmQVM89ZNg3LA8nO5rYO7Dr3Dkm4LqKqMSivsxJbUOiRdc2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AOsZ5kLn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bvJKamrH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AOsZ5kLn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bvJKamrH"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M6r2U92579100
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 08:12:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=czex32aQLz7Wor3ZwCAP8jwK
	GlUOBphDFuP6jLqE8W0=; b=AOsZ5kLnNaEZC6jEnx5gtyQv8DV0FjojSlMnM/Qw
	M3NFGOApHMPDWFq/DqkvSgDF7amG+8R9DwLCQ2f4nNIXDUFqq6dxXIdKViN4XidJ
	dAhF36NcPaqZWaNziG5WsVqkfIuT2tFSTCI5OENkHW3HYuw5Ck8aOpGT3u9pREnl
	yONur2P7z8NxIAEqKiZbDzw7/eRzXLrUBsrloN0OQBWG2IlrhfKyLP+ucb20FE6k
	+i36puQkjTSFJm+a+c98k7R4Gu9R/dUDaT3AojxuqhfHTOq0Vq5WRApFP42clcJZ
	wRCR+JUcpYa4maq1gYyHE70LjCbJaUUN5FZroW3S4dJ0ug==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gub32acbn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 08:12:33 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39aee9b4cf2so6883633a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 01:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790064753; x=1790669553; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=czex32aQLz7Wor3ZwCAP8jwKGlUOBphDFuP6jLqE8W0=;
        b=bvJKamrHyqSONGVkFNdsgvbZGH9LlRb9qjNTpE361+mBvzAwT9u1PCbslPQwAsbAE5
         gvF5kuBg3mHxyeHcfcKZERNyylW2HOYtriittnZSPvqcXc94CHHClBfKLE4xTKPizRPD
         IMTJU9bCst6hDJac5i9hac/gpdpm+/GElD5lvqguUrcE8YG8jULHLlgzrNosMm/mR0VL
         TbQ+uul+AL6EqKSRNNqbRn5/WJvgOMLTwYVxrSAEnt2fm7TvfxyYeMeAhsQElVCQRLM0
         95kW7BvXwT4MNi1aJnbf19JQXhuUXSaYzVWajIdOGw8umhW/f20Dz5HiAjfBkNCy/LZ2
         vmOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790064753; x=1790669553;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=czex32aQLz7Wor3ZwCAP8jwKGlUOBphDFuP6jLqE8W0=;
        b=CZNAKFA9jgeCvWAf+azsDUdz8gN+39OC3Dy/+ShF+tT8bjyVzBujM07AB8qP83/X4G
         zTE6re1YxgDvSgW5yijk2zwgrBpTcxiN7WLbf2gKvOgj43KQyl1tiKJq+jGiIxO/RZeL
         asdCQKnX83xMKioRKOhjVcRaUY0gZxX66Bwf1Qcu5nNXC+yQ/dtVEhJWIohp1a1tJoYT
         LugBbjnOW9FEtDzino2BTMLz/WP25CMMi3UHpePcXxBMyEMXqdhN1ahUrOlz64rYgl9y
         sp7d0HzeS9dGW7697oshSULNC1iZhJRmvzbBNTVMbyFCCyInLpA1hqIbFgB2GhdnRm+J
         7oTg==
X-Forwarded-Encrypted: i=1; AKwUvBxlLLFrpbkSISDgSHqkNPeFTddveIOi2mPGm0zztdjwYxJLGJ30Dvn67nY+t98RsTwVd3oogra4YCHIp1c=@vger.kernel.org
X-Gm-Message-State: AFuF++l116VePBNbEBlCtLYWECzwM6WmeZPvlERM+NQe6fdsTgsL/LgN
	UH+roShb7mdx5qBFlrGp3QqVYSMSiNSHnYH+oTOqXZ25UR94Moa944LlUr7PYKpD8mwVdOkglYK
	cAzykndxLZJy1ugc2ZQhvFgErHO849XAD/B1OY7OEOKvDPpIJ52HSBDnEcPmYlWwm/tE=
X-Gm-Gg: AYBFou2YKb6kScJeENRIOPGEA0tqm/3UHj2bDADnn59XXahmhdBdWknREcWAEhNCv84
	fQFoL/99P8d/YKcn7TTo+Mu1QlIDYFSjacReBmbsA7Gs0cUmJALzsiA5c4L7mH/455ETDi1GfgZ
	bnapl6KD6kQjjQvu5H8BXbDM9b0+cd4UUcigOes62AwMRmY4XBCBN3EsdjlzBFopHhM4xce7ctr
	IBTRDWgHzk6wqVg7WpvBvGVVgOzZGqGrHPIWxRDY5XG9GFLg9eaGWF/upmCGc/zNouREZZxlv3b
	XP8MG4eZOwQMdqbz68l1ILAIUZ56cnLTu7yvuvzgNybGa/Y2Ror6ktyz7NjdUeRXpGu4/wpEGgh
	3CNXUCKL7ofqZpY2bq6bNY9wEAaR3h7A4t+lsQ1pOsA==
X-Received: by 2002:a17:90b:574e:b0:39e:1fb6:9659 with SMTP id 98e67ed59e1d1-3a073116705mr395971a91.22.1790064752870;
        Tue, 22 Sep 2026 01:12:32 -0700 (PDT)
X-Received: by 2002:a17:90b:574e:b0:39e:1fb6:9659 with SMTP id 98e67ed59e1d1-3a073116705mr395943a91.22.1790064752305;
        Tue, 22 Sep 2026 01:12:32 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f2a44cc8sm3084889c88.13.2026.09.22.01.12.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 01:12:31 -0700 (PDT)
Date: Tue, 22 Sep 2026 16:12:24 +0800
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
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org
Subject: Re: [PATCH v4 5/6] phy: qcom: qmp-pcie: Refactor common multiphy
 handling
Message-ID: <arI4aLn4GSnVQXO3@QCOM-aGQu4IUr3Y>
References: <20260921-nord-v4-0-ed05c6e09240@oss.qualcomm.com>
 <20260921-nord-v4-5-ed05c6e09240@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921-nord-v4-5-ed05c6e09240@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=B8ssQ+tM c=1 sm=1 tr=0 ts=6ab23871 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=Y4sVft1UDeOkrP7wHAgA:9 a=CjuIK1q_8ugA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: OKJZRg1UfgRZ9kw16WLRgpKMXbuwKUjH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDExNiBTYWx0ZWRfX4P/2nCJER/Ch
 NG5d4Iyvrihzk2VUFXaCRB4XZW3f5C+VtJFjbom5rYrP5uSEW/4J3fpUM/m1v92z2WGusfop6q+
 H6cMDMyMUnAi32cQUvGt8CSvXuKsmOD4QGonwR1yUd0BOsuAUq5+8IV1de7HR5bbQZmvIVKaUDm
 YxG6GcgEwXYDLyllKzgdacbJDndV7ajvSmH0PTddwaSgvFSEu8pfiT1dwcUxIDWgkIeIBubslMQ
 4h+TuopTAjny4RZFfVUaN2/sIAh7o1dHlGoXdgULa7Vg9qF/9et69UyRFssiXbRN+MTWoJ4p50x
 eOkrzheV6F+ZjwaytHdTQnfISXvUMH0+eKKFyRsLkZKDAiE1tEQTieVe91RwWNUOZ6AZdAfWgay
 YxTtNr41m/zGBxbHJDiejIu3DI9SMvaIqdUy8xjhqZGfwPTnb5xcyHlLI5rb4qukCJkuDtPq1kJ
 U/fz5SLQ0TWFaDsS4xA==
X-Proofpoint-GUID: OKJZRg1UfgRZ9kw16WLRgpKMXbuwKUjH
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDExNiBTYWx0ZWRfX1UoIQO2a2bdI
 Ps1keT4Hm7pKQkSDs9IEdYns4Txua6tSLv78FhCk3QJ/rS6RIiRnu+aMQv505S7Fjm6pK6ipyU5
 7X5yvMbqQgQcF956e0uUDPjx2XycmTk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 spamscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609220116

On Mon, Sep 21, 2026 at 11:07:13AM +0530, Krishna Chaitanya Chundru wrote:
> Reuse the existing port resource arrays for Glymur register regions,
> power domains, and NOCSR resets instead of maintaining duplicate
> Glymur-specific lists.
> 
> Attach each PHY instance's power domains to the device created for that
> PHY. This ensures that the associated GDSCs are managed with the
> lifetime of the individual PHY device rather than the parent multiphy
> platform device.
> 
> Validate the clock-output-names property before using its count for
> allocation, and use a generic module description.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

Reviewed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
