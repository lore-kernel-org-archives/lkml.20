Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 495CB397343
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 17:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788976673; cv=none; b=I/zVi3FB8eXmSgK3NWbbCR9Ir2tDIPqZK1SINKs9hFiXYE5gs1JIT4EL/YFkCaDtUS2UAIzxMnlArosCSie3n2jLpCfuBcEAWxOFS+jxRBOkEwwk7KD83IPyAC/ISUIpDR2y12tAPCoxFvXnFc4nYvkXBtq0VKZNSAfg4PbZpms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788976673; c=relaxed/simple;
	bh=3NPLBG25V52WEVA0T+bxcWlBgkVPZwOS61fz//H+weE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=lBYBcrBrg9crWs8hRAtBWWtGeS6f2X7hUSca+AOqGA+joRczHhakzgtUjmh4RvsERJ3BgXfrHQXO0nxT7+oZSfSsTuT8RjeYF8IYF3DqT6Uj/1/iVh5d8JdI/QQYKwkCUsomZUucT5oKaVcf+RWd5MHiBPH+UNhF3mWNPuGy40I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SAE1JLhU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hJn1gVBn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SAE1JLhU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hJn1gVBn"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689H7IXJ3412750
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 17:57:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oVSiJVg7iYewYL7oMPCyOTblcroO6eMx2rR2SaZTWqQ=; b=SAE1JLhUdRfP0yFK
	M0vuplRk083yCO9ycP5+uYllzmFsUQRnA/BVpfkYyjLQk0Xk8CaVya3UhHqHamHZ
	lNVZTikzuLaLcx04hsbpxXq9KRa3ey2OlJRlZ69lcLcjslcJrgJHuhHRAIjGhqkP
	B+ji+pV8XqJQTgjTf+Mw5ODg440TIjxQlRlrdtuzGeM3ZhkfvQE2wKgrMXXpJp9u
	g1WBBc+tjioIyGzRyD5koox1fkFvqNyAROh/nJWHsoWDL2VdYStohXHfPT43ngVy
	6SSzH8o8ml5Zbz0dQAnVHwiwzLuNTRkyHCTaWVJO75l9IDkM1tHKbPAYOboNuZR4
	ENyL1A==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk6xh1reb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 17:57:51 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38dbf293831so12501159a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 10:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788976671; x=1789581471; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oVSiJVg7iYewYL7oMPCyOTblcroO6eMx2rR2SaZTWqQ=;
        b=hJn1gVBnRu5igsNIEdHraFsTKm4moI9LYDaELU8MZQ+dqUW0M0UyxaoqYAjoV8yCKs
         RDtnT7A4mn9Z/k0SO7tDYQl8UKLNz2jtNXIrZ18OQ6CyZEMVM84wxjywMr5uMONO8Y6Z
         ijTcihBxCWd/OBIj9UVyQdQekqCw5cR/mFkSmyBw1zfC+wjQHzsFNsVtnq4hcBM1CyRf
         LfqRC+waMIIT6poe9kel3qpgqF4wmBJc/uApHi3HFzDPu9BT3udf8cvkgVJ+muHN8XvU
         1sz4S9OPP151f3dBcBHc0TaqmHbpRRWcqBNgpPktAwjTeOxQhtjxNJzxso0+SeVUIvLs
         msPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788976671; x=1789581471;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oVSiJVg7iYewYL7oMPCyOTblcroO6eMx2rR2SaZTWqQ=;
        b=YW/4PXyl0gA5JH/0pmnLzV16zsopDfhR5eDjdw/Vo+586qAm48j850awBscf7e8VhA
         lHgxVz7uD82FcnepzZ0XL9LyIGf8kpGE6xHZz6JwTxlCujC4jOlsHqIRe1d5q9lp0e3X
         6gmK3z6UN+DZVUHsRoQ+WV6zGzsSy3P8c24qeMmlZXZq38yWITGVyD9+1feYe5mLSC3v
         v3Dws7TrMNqWJYtKMnBuDukutdnxlySk4czYSSIKss3a4fUrhCvfpdvBYbMojtOD7WNC
         81iRINrPSR/F+oW+k06J49j8v6GW9l07FGFd2ybm6UBVFrwyuuM67SqBc0e+4vnF9C2h
         oAAQ==
X-Forwarded-Encrypted: i=1; AKwUvBzLwvZ7zxacithnDJBjb/Qz5H2/b0tGP2DcF9CzNoUj+rcifdYuxNrzbVmVLrDmIgLgrVJ8LUd6RtrOrL8=@vger.kernel.org
X-Gm-Message-State: AFuF++n6qjbbeT1ZtzRDRU+vDWOBHUD9o3ApfuacrQKkYnH8XIeeYNlA
	+NwSR3i3Is3GmBALFSJ+5wKTZcGD4Ty9OGE4vdoGWJWZvIiEQvVL/fCc4XNGH+5n5nSZSU8vmGt
	tvcSK/5vMZFShkur1ZWSktNQM+Tpt17vQVWjavflwPJZ7+CT1WT0KNlbgEirG8diB8Q0VPO01Yz
	g=
X-Gm-Gg: AYBFou00L6EIsKPGIS0Gqi+wNN2/G2JXLepz7Wx5eBuW9sY8bKjLPpLZslzLwSXIFD+
	kMs7wKq/227lYo/V/NHw2J4JlKIT3Yz7wurfVt8gpQ+kGb1AjWqIVu9+vDOH3B51UZsCKn7pp7n
	KY6q9bXUI3G9QQN9T2vSJf+H1FkAUWmKIrIeUw47jYPG/I3pPKPXgBYqoNnu7E/vGk4wjdO6YnA
	jldOPpy+rliL0oksoQrShr6viDcMTwzfahWnh8DkDx92D/LfQXIN3EYJJlR/LgIQwl9CLZWReHy
	AzjUmIdsQmGcxFkQ/sHAQae+nS/kfL9L9r+/RSNETMbqa/xXqDsARpNM4F3mT7spswWX2gqNEnz
	96O9Sa9uN5ngUCWIr9iHZTLShk3dfOMNKS/bxR+LIR1aoa1J+JE4uwd8=
X-Received: by 2002:a17:90a:1c96:b0:39b:66ee:a14 with SMTP id 98e67ed59e1d1-39b66ee3442mr19656025a91.25.1788976670639;
        Wed, 09 Sep 2026 10:57:50 -0700 (PDT)
X-Received: by 2002:a17:90a:1c96:b0:39b:66ee:a14 with SMTP id 98e67ed59e1d1-39b66ee3442mr19655977a91.25.1788976670182;
        Wed, 09 Sep 2026 10:57:50 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-339770f0489sm14478225eec.8.2026.09.09.10.57.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 10:57:49 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        P Praneesh <praneesh.p@oss.qualcomm.com>,
        Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20260813-ext-msdu-fix-v1-1-c5e80ccd061a@oss.qualcomm.com>
References: <20260813-ext-msdu-fix-v1-1-c5e80ccd061a@oss.qualcomm.com>
Subject: Re: [PATCH] wifi: ath12k: fix DMA unwind for ext MSDU descriptor
 retry
Message-Id: <178897666910.2048605.5900469756207740270.b4-ty@oss.qualcomm.com>
Date: Wed, 09 Sep 2026 10:57:49 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDIwMCBTYWx0ZWRfX24o507q5haya
 bataz5NHx1VkPZupWnlzAOx9kHr2tTagqPtV86zvoXVXPnB59MppTj6K3l8RopiPbL1q4OOJXYX
 QpLPEnmB5MZy2AQdptPU/byMkqMPJ1TATh5mUdBhAAoRxKz0C3cytAD1Ctiuj8vFJxi+eTKrRKs
 oX+OeeePrRSebZWJIbUG8s6cmKlkfp3GzHpuDCbgTyb0Y5NdN7cbmfQ4mSUytWxKgNzqIOh2rUs
 G1c0uNAZ2Ms4L2r7if2fixSu7SCa9z88HLyRLGT7gkBZA0YXD9SLxZgSXmqA+Nb2pNz3zGgufKA
 H//oRaQl6QMBeznht/I7jlKKutB4VxTnUBS3Z9rOLkx3OcQh+Tn0wsPqUelEINXP8T6Fic4Yb6a
 W08u8XZPC1RoeDE3NKCNNwcWDMKq2B6MRI99JkBzwhe0M453qtRRjtNmjCWIq1tl2bDmxFSH6+Q
 zx4Fwm6LTrLFyqT53xA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDIwMCBTYWx0ZWRfX/e4X8pu+Bny0
 ohOPZRMg4D6VkgdgR/yFXuNqd/BtJY3S2um2pKMNTt6BnsfZXaJOCwI1ZEp8L4Dp/TBpTv0DPU7
 kKNxViiUtRhZS+HMs8c7r3LzT+9B7tM=
X-Proofpoint-GUID: wAcdhtq9dSODXvkC-K6c57G9nTtSRsTy
X-Authority-Analysis: v=2.4 cv=KOlqylFo c=1 sm=1 tr=0 ts=6aa19e1f cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=hShXsiTv-2AdAf_wJi4A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: wAcdhtq9dSODXvkC-K6c57G9nTtSRsTy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090200


On Thu, 13 Aug 2026 23:09:20 +0530, Rameshkumar Sundaram wrote:
> ath12k_wifi7_dp_tx() maps the original MSDU into ti.paddr and
> stores the address in skb_cb->paddr. When an extended MSDU descriptor
> is used, the function later maps the ext descriptor and overwrites
> ti.paddr and ti.data_len with the ext-desc DMA address and length.
> 
> If TCL ring allocation then fails, the error path first unmaps the
> ext-desc DMA address from skb_cb->paddr_ext_desc. It then falls through
> to fail_unmap_dma, which uses ti.paddr/ti.data_len for the original
> MSDU unmap. At that point ti.paddr still refers to the ext-desc
> mapping, so the ext descriptor is unmapped twice and the original MSDU
> mapping is left mapped.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: fix DMA unwind for ext MSDU descriptor retry
      commit: 4de5a8a0edddc453f1a4c93b6d9f09013a23b72e

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>

