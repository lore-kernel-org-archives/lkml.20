Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 540E23C7689
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 08:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790064791; cv=none; b=ugoXsedFATCww3RLw/XRbKQ1n/QXB5JZIEeA+xAs2MOMarozPPgQf7GnO6+vfrv1wgdfAfLu14W+MdbNG8JpXO/aP7pFurggbpMM3IpeHsTCYSQzYnvkFkUNMlYNF5A8uSch6nPifjs/kh+KigM4Twt0KpL/7pWOhG+l7C/xIvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790064791; c=relaxed/simple;
	bh=omLLYoBrKLOzbalzOhPdQtYottoHpwv7uf1NSl7g44I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZD4rBCjphCLLLadZvt6YTxskKEt5veAQLaJ4UQWAwE37mzMlZdHBuu7xNS7n0jD+JTWl25jMZLKkjEpzmYmhn5cNk59I+J9wRLY+sCyu0W4CuZqEpwVB2dWGgt/Sd3Ru09kYy42Qr+AqZCN14VnTIEFohNT3aCkftZs8JI9iZnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VunhVUXC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EJA7oBO8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VunhVUXC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EJA7oBO8"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M2sLUc3675278
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 08:13:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ITZ7U9bHx3O3ChSLQaPRjkc6
	o4GzrK34Wvd9RlYR2g4=; b=VunhVUXCitPOFSsygH8ooVCxBlRkr5e57uV/NM++
	MKo2syKt1EaVJzTkxbwFakrD6UkSCUyzzWAtxv6MxYlWrao/YzUKZz/AolFTARkI
	/Jomp+R/9tfFEkcudRzDEqeEd6FMtTDL75JdjIYonxFW/RjbSY5KIF6Z8OKhzBdC
	lVaSTjMu3xWWD6Go+Hl0yJiBrGR+9vljxzJJRwDz9Rg8Mh/y+Hyv+hI6Reort0cY
	Qr4N9QpbAPlejQariDGciAKUDrKuhPbyDAvw11XOwSJU0DORiTcPDMZja1gWd5N+
	a+ciYu3Gtd9p5mAo7LR1WZbJYOe3K/csEH3ZnPqPqOfHRQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guha5s56e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 08:13:07 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cec4226c70so48221585ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 01:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790064786; x=1790669586; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ITZ7U9bHx3O3ChSLQaPRjkc6o4GzrK34Wvd9RlYR2g4=;
        b=EJA7oBO8vBVYNE+OnlVDSnoANJ8vraEdtAJnTR4mlZfrMSwaXjK8/8Wf91izObieNh
         AspUV5uPpOLg1vrebueUCf7BAHLudIhzpl5ZvFUlsnVpOb2xxM7/zNL8CjSYOoM1M5+Z
         JJ1I/VmNYq17H9J9gafVf3+Plj+9oiIxHaGz3xo/OMG17wEqS6WVZq9/INaBUuQQJQKV
         99DjyqTnRthe1YGLUAEyzspW/rznrX5ffdhQnNS3APrVLKSlGDkPof/FSQfdav/LopOI
         bkAAarTLMHO2nADsJDIVT0VfadzsH9CNyolANj9OfLjpqs0yRIZfYO+oSf4lonmLz0Gb
         OzgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790064786; x=1790669586;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ITZ7U9bHx3O3ChSLQaPRjkc6o4GzrK34Wvd9RlYR2g4=;
        b=ijSgZvvyg0yg+Lq1EohwLhlnGrCvx9Kc7kUS/xNIIyFqDGkj5xGxZ5ypYrByEFsuUn
         8G1jZaE0wzl6BXaU9ZayODVibqb0sXK/p0N5t//bwRi+n1/P8gpeWt72TkOcW1T2+Tim
         fNsVwMj3cC9bziCZ/cgzZNBwQxjex+Xwu5XT/o4x05AoQyfEE/+i5D54Q+KKtF7lU9/s
         G39VT11+eB139gdquZOnD9aoC+EtgUkzgPglXXHM4/VWPSMaRLH1J560DLveGyajbwyO
         HnGy+kRJw6XNH3f6ZQwr/O8NQYiVWHyuEdAZLcln+UZ6XJh7TYDTudfgI46MXgq/nBz7
         4jaA==
X-Forwarded-Encrypted: i=1; AKwUvBy9ZvHPbQSm8NXIder/LcgjF+SlaZGquB7jow3VMJ1YgmiWopF16Rc6D8c5BMax7ThyHVXZYtVeX1Wo7SA=@vger.kernel.org
X-Gm-Message-State: AFuF++nrgxbDJrZPQrfKI0glkQ0QCJRVb0er9FifhTDQQW3FnpwN1moz
	C20lWtqJ4z79oe/6h8xK4kokjv0OslZqsqlgT3SzuykuAuotMGjv59ES7m05l3UPxckLzVZs9Ig
	TTmeqoBn9oT4B2fptA70ITlqo3pukQjrC9H3UYgobDiKKreNg+oBGJztiTgfU50wT3ps=
X-Gm-Gg: AYBFou2HOnMOxrDf7LLVwmW7gqCATRC5gozEVgiSUIPAz0EORvPeEHfJDGryBW4ipYB
	PqZOzHoAcNSKTqCBGlHazLLz+lBzWQIt4MsQ1vFhIP94wQsU99Y1PVmXDP8mT9kCE7gtIwhptV/
	CvChBUTKDlMUilpnxC4r+HadnTtMRIQQe5Li7reReLhVOGq6WqA8GRrDM4WTJR0Wo0Ahj7M3Fs+
	LIPmgEFv6UCKen4pfotGos7GCXVBll1wwFDrI+u7NtPYvZY/bxyMRFUiJLLIvmzdZInQhhIBwV5
	zybn1Sv/NVR1+w800OsNm2mMYCGwruzxEv/F+QhDomY/ADHu9cbzgj/mjKtfuvraurH+gwAc9NP
	WbqZUUyLCYI27+nznkLwsw2vjnh67WZEZKFnrY2tYHQ==
X-Received: by 2002:a17:903:1987:b0:2dd:ad73:c98a with SMTP id d9443c01a7336-2df60b471c5mr4789895ad.34.1790064786317;
        Tue, 22 Sep 2026 01:13:06 -0700 (PDT)
X-Received: by 2002:a17:903:1987:b0:2dd:ad73:c98a with SMTP id d9443c01a7336-2df60b471c5mr4789505ad.34.1790064785891;
        Tue, 22 Sep 2026 01:13:05 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e6129b37csm3678940eec.15.2026.09.22.01.13.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 01:13:05 -0700 (PDT)
Date: Tue, 22 Sep 2026 16:12:58 +0800
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
Subject: Re: [PATCH v4 6/6] phy: qcom: qmp-pcie: Add Nord Gen5x16 PCIe
 multi-PHY support
Message-ID: <arI4imcmjEyVzTOo@QCOM-aGQu4IUr3Y>
References: <20260921-nord-v4-0-ed05c6e09240@oss.qualcomm.com>
 <20260921-nord-v4-6-ed05c6e09240@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921-nord-v4-6-ed05c6e09240@oss.qualcomm.com>
X-Proofpoint-GUID: 6kPzwcDIAsbbgTuC7T3Ey6vtU8XmUZ0R
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDExNiBTYWx0ZWRfX+hBFdM0rLMpO
 lhArL/7fPmTqxa7ekNLma/byitnN36jG6J7RnaPJ+kjLldigdvW4bg3+3ggOqh80TAauPj9vB2H
 5rC1ArFYC0G2JjOOjkgTUjcF+5Edi7c=
X-Authority-Analysis: v=2.4 cv=U+4Hnuru c=1 sm=1 tr=0 ts=6ab23893 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=Y4sVft1UDeOkrP7wHAgA:9 a=CjuIK1q_8ugA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: 6kPzwcDIAsbbgTuC7T3Ey6vtU8XmUZ0R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDExNiBTYWx0ZWRfXxBBZ8q7zS+g/
 sCSkYIzqP/mh7YdmkWzlY6slndAzpMNnqSQbxOCQdgXS/tbhAyZrbhUvm6BtxmEEpzGLz+OC7I+
 BE4cQWowC+UO1NvUT/dVR2JCDSAEyOVZH9fVQZQe+TNWj7UgrTBr4fVJK4rGxJ6sh1YJOMtwJfJ
 oMTGbQYw1CLY06bImmEOzPErTDOMoc+ICuvUXW2CUpV3DNgA9IdN9LeZtKS0dykm10vX/L7VxU+
 kY4WbBmXpAzNvwQzFXRMSWBk4gSUU+FY84ttPPYLFEw29OyDOrKvsZsRI0K54G92woSjwxYecl0
 t5NwXw9jIxQPfACczSCEw7Gb5x1SMO9GB1+3F+PSE2olum3+QUvFE8ZnDx7PiYLF3Qf7/eStCkE
 hQBWr3sLJLK+NxidGTqfXBULp5xooyE6xnE1+0PXdrypdLhiJuymdFx+P1HFA//UnZVynE3Sn2x
 PXqUMBx+dY8jniOyGvQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220116

On Mon, Sep 21, 2026 at 11:07:14AM +0530, Krishna Chaitanya Chundru wrote:
> Add support for the Nord Gen5x16 bifurcated QMP PCIe PHY.
> 
> Nord has a single PCIe PHY block split into four ports which can be
> used in multiple lane configurations: x16, x8+x8, x8+x4+x4 and
> x8+x4+x2+x2. The active topology is selected through the link mode
> configuration register, and the driver exposes the corresponding PHY
> instances based on that mode.
> 
> Unlike Glymur, where the PHY is initialized by firmware, Nord requires
> Linux to program the PHY registers. Add the PLL, TXRXZ, PCS and PCS
> lane initialization tables, along with the required power-up,
> power-down and soft-reset sequencing.
> 
> Add per-port and grouped PHY configurations for all supported Nord
> lane modes. Also add support for regular PHY resets in addition to the
> NOCSR reset.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

Reviewed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
