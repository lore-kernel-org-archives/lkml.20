Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EA6A266B72;
	Thu, 24 Sep 2026 05:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790226971; cv=none; b=XJHG4nl4bGPvSw2faGTY2aaiUIgipqcXl335+6yYwn4wESBbjamEaVgivV60C70PoRcreEHlyOGQuVoRB8NCn4azkoj7siHQb4hzeVcx10SdpAowk9+XNqnjWKVfCcpxjt43Fv2A01gfgIwkqv5BBzY/Emi2vatELNvkCr03Unw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790226971; c=relaxed/simple;
	bh=ICdb5i9Y8TxqnSABRpsDpsLJCQwOj3uyC0HJJ88lcNY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iTV+B+eO67p8zUGPorRhsYMsPlzkaF7ahBCJ4FCHzwSwASdFJ+/loDhfzwdWbp6/b92jAo9kJ4p987LYUtC64yD0eSBRayAC+jwlEcByTm9Hc/igg/WYJziT5U1CrsNJXAO3z1glTpZEDNlyqvRkXTUfr4Zyd67woLaqIm6RuV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oJcpG1w5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oJcpG1w5"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O43LhW364882;
	Thu, 24 Sep 2026 05:16:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iafcNu8yXs+bPIbNuDe2M/Cy42B+aT+ZoPL5h7CbL8o=; b=oJcpG1w5n9/Eucyh
	NpXXH9cm2hvlpiCPTlx0maH1Fjc1Q/wKJfP32StlWZI6XsPkBboxOHLRFHne9xVo
	2KeA1NigOrFIXdPPMfeoOTeiutUfwuYMKB3S3QApsB6JyOL/bDTD3y8QDOJu6zAu
	GhldJOnszc72NUZRueeMMfWPurvUH71zRptfZKhcNhMTtacI1GaL3ERRZF4mVy2C
	Jvt/nFGGfx9F+BpVj1nGCQ0x9cHVwuYlekUlyp6sO2eKuQMxKl5EuFcC6B8LI2Sr
	zVzhngyp4u7d7/6gAvu6rWOZPtZptGd5nq4/O2Shd784pyduZAr7iGc0VuyrO2sE
	JWnl7g==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvvgh86f3-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 24 Sep 2026 05:16:07 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 68O5G4d22068402;
	Thu, 24 Sep 2026 05:16:04 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-kotarake-hyd.qualcomm.com [10.213.97.140])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 68O5G43N2068381
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 24 Sep 2026 05:16:04 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 2389607)
	id 5E70FB44; Thu, 24 Sep 2026 10:46:03 +0530 (+0530)
Date: Thu, 24 Sep 2026 10:46:03 +0530
From: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: qcom: shikra-iqs-som: Correct PM8150 L10
 voltage range
Message-ID: <20260924051603.xzrmwo26vtds66o4@hu-kotarake-hyd.qualcomm.com>
References: <20260922-fix_l10_max-v1-1-d0c99f063bf4@oss.qualcomm.com>
 <3ae1124a-e070-4641-8a25-42cde4426f44@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3ae1124a-e070-4641-8a25-42cde4426f44@oss.qualcomm.com>
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Authority-Analysis: v=2.4 cv=KYhHIgYD c=1 sm=1 tr=0 ts=6ab4b218 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=T0APZzI2klfUa3LYWF0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: et8rnWoZoWi7CxwwdJJV927Sqzq7Kp98
X-Proofpoint-ORIG-GUID: et8rnWoZoWi7CxwwdJJV927Sqzq7Kp98
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDAyMiBTYWx0ZWRfX5E9317/I4dzi
 kUjfxWoSUe8wh7WYfGen2nYu5i40c9+Bj/4eWau2sscuRbO321cKmjpuLcrnXDkH3DQuzXuhTpf
 DZSYY5xA3hJ8SkfqzT1msG9yP6LRQtI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDAyMiBTYWx0ZWRfX/taQ4p/VIX7w
 5/A0cikCDY2CU+Qpk4RSRIuZ5yZihPNbGagbvZxQMTd0WiQqSuW8xX//7TpEKAOVgnyUWe5V/so
 5m4KVB45zUBD+mgFw9zKLSnDkUj7GtgwMAJp6ywFet6LfMCpyzytFQ8EGgXZgici8j3sQ+b6bVz
 AlpqtqVp+aexI1TWCBd3XmNyj6pAXNHWJCir/22XiN1pnMlczum3gxwEwpjRiqO8mT/l99XA8x/
 U7I3JjnNtQS+aTpE7d1EHUhLhZ6zuMSc7SEkTdn7kYenDLd45ggqNfl6SQ7cCAJAXOYSvGOeGpo
 7zbCSNRyPXpwE4+ZAUz1yfd4ZdW7tNPnr+iYTmFloJi+Pgr851bagpkDV5eNPEIiahik3qwMsZX
 U0gyojbyOBPLOv9UeTwa9DXC0cTPh2yUjxqYphODjHSt8beCBrGe8Y9B+fJVeu2/rj8ST02dFM7
 3s1uZmd9+dl0cwmR+YA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240022

On Tue, Sep 22, 2026 at 05:50:19PM +0200, Konrad Dybcio wrote:
> On 9/22/26 2:39 PM, Rakesh Kota wrote:
> > Update the PM8150 L10 regulator maximum voltage from 3.544 V to
> > 3.3 V, matching the supported voltage range for the Shikra IQS SoM.
> 
> This is a good start, but please mention explicitly what
> constitutes that range - is it e.g. because there are
> peripherals on that rail that can only sustain 3v3?
>

On Shikra IQS, the L10 rail supplies the SD card’s VMMC. Its maximum
voltage must be limited to 3.3 V because the derived VQMMC voltage on L2
supports up to approximately 3.3 V. Allowing VMMC to reach 3.544 V can
drive VQMMC beyond its supported range, potentially causing SD bus bit
errors and resulting in the voltage negotiation failure:

l2: unsupportable voltage range: 3500000-3296000uV

Reducing L10’s maximum voltage to 3.3 V keeps both rails within their
supported operating ranges.

regards
Rakesh Kota

