Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4108E4DDB59
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 15:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789658140; cv=none; b=mX8/347NzjlfPhUCkKSEO8HEauyTdPPd+5vWLJTR76hKhdLLLFPBGG+4HtBP95hImqd+997wcGycUrIOKw9/NPgNe0Dc8AppRZ030PscFumJA+u2ZN2WRpipPin9vgspGuZesNXz1y7hJ+mpd4wtypV0st0Q3k83+0rpskabdp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789658140; c=relaxed/simple;
	bh=HWTYcYmqxnMfOvc0toVfLAh9HcAZf26tjOq5sUKW7ZU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qpOSJuTtB+yByz47p0TiLx6w4rLF4PDd5TfW5CHHVVJlntsxUoQ0U1DffNgDFomR9m5rqky7jZsDxtUU9Ech/B+EORE+FcjG2L1Is9x1PdPgAXgKoK8ehxizCJDlkp9/941OHYbjGFqjND9Phc2IqGmGZ/3Un2LWkWI27QkLKes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KO6Yq6Nm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TirllznP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KO6Yq6Nm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TirllznP"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HDiVpL2974891
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 15:15:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fiKuRho5vpq4oB0Iyg7qtY/3
	GWuotzNlqShh/ODLOOc=; b=KO6Yq6Nm8LNj7p9Z45l+BYAzzTU9HZT1iv+8OoKu
	5TbzurtBQG3TWS3mEiUffDGQzlgiOZZlfjUqxqqjKXPg9bbe23RD6esyFhYHObrb
	HngdSGVSqR5YD7r98kW8hwCzRMRZVP+8fshgxANRaXXXjvZE30onkzjul9FMZQeI
	aJu5PrX79l1+XCtnqewDgpMrAlaly/eNYquohJmNjKA0dja4740VAipbLQ9oZ0ZI
	Rm/m3UhsTGDgiWqt7KOZsoaPwYZeBtaM9CqEKmTjSGLIDAyuYJrZM7zdg2uaSIHm
	4mDxIg6iB+ZibwIB7LbQeqj5NTA0OLjQdHFcOCNfjwA/2A==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grdd6hmms-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 15:15:21 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-90e98e74535so18827856d6.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 08:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789658120; x=1790262920; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fiKuRho5vpq4oB0Iyg7qtY/3GWuotzNlqShh/ODLOOc=;
        b=TirllznPBhAx9LwZdM5nS2qitQJRN8uXZi1SYqYCrwgiPMK2dgQ4VDFN/iFNC/f++V
         2YTLt9zRqu9+xdvD1oEURwldov+jwjFVQ5juYjQ+1A60ZcXp2LDIgrxmwe9XqYKwl29x
         K9yDusvOe1yG4/kZixf8xNwhf6wzn4sezcH9QZocCALThopcs/NGqe/dSXeICjx+vRyF
         +GBlQq4CrIKSkDDcC/qeysevxNjC/XeVB4iiVBc+zlXxomYTbrR03SnxepMzkdGY+giw
         qS1PTlHjtRE19tYps4T0gfLm9SOJIsfdHpvNxTJdfvy72xj00YgooniFWdk1yN17HSm5
         fujA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789658120; x=1790262920;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fiKuRho5vpq4oB0Iyg7qtY/3GWuotzNlqShh/ODLOOc=;
        b=cFe0FEK9ea8z5txe2J6eYqxMSRtf7SJ2Ai4l+PV4qJpoq/lRjgR9cJn+6UK1aXAVmI
         9DeJbm/EV8x3LYiIkenu6jTr5BNV86d0hmKxH7oviTc6aO4tfcU2KmxQVgicZKx0YSii
         O1h4PQHGDJOUfdrWWkV4sTG3j69sRjYczZ2NLBqdg3vCpeECKYCA8t8Md+nbV/Qh9u8d
         6+fklXRRV3hQAspHeeoI60le+8DtZps/cuVVIR0/68JN+FmOjXaizYhPy7/lRlAcGln4
         c9Jk7FJ9mRy5aLV5RvXuePUUApqZHvkPmT4QorEvuSZVG8yVq/640ACF4aajELNeC5pM
         tr5Q==
X-Forwarded-Encrypted: i=1; AKwUvBzYfdqGap17Nyg4G6KTe76LffwvtWurW8bedO+QBTzCyJw1as/bcwm+XaIJf9+NHudXHIObQQTR94KMYOY=@vger.kernel.org
X-Gm-Message-State: AFuF++kl5om+fW1HgNUqHdzeilhWYcvK9wC2fwJvnAY37wzNIHLgWVTU
	PnYHR9V+up4iRIWM2P6PRLpxx2lIAvVYTiI/09uYO9iPVkb6K7r0W58te2tpa5sOE1G9nHkr4j+
	QAy9VnfVRrKSVIoVOKAbC0TG6wx/S0IDqZQdtaoAH+m3bAKdw4YRPZQ9tgLH9Y/mBCGE=
X-Gm-Gg: AYBFou0WUqMOBy4WRQjb2uYRYV0Zmg7Qex8nKuEhUa2YDv3q+QyYSdaBPsamqWHdpgS
	B36Hi3D4taqvQJw2gqKt5fhfmn6kfsv2k8Y3rVR31N8Js1reeYTdUp7HyysIIx6D3o3Ig5V4NtV
	SZ4mxVD8elBwu6OvRf33fZF+wSMjibth1l2rX1vU/4W20SRstlBeb4CdRlLIXlduJ6XrLuQFlSB
	VYbOWi3JEaf8NmjhJBGrtLGkK3BYkxJhkIZuyTQqHGiojiJh1NkYU60TnTxAfVhmwi1esIJzD9u
	YXDcXHjFTHT0QBnQagi8lQQ8zBPylT7H37D1qMZ5dREQeOdPL9Gi//Va7x5/diKsIzuC4uxfX5U
	CE/dBndAfG7c/xA==
X-Received: by 2002:ac8:5f50:0:b0:532:9adc:63ae with SMTP id d75a77b69052e-5329adc72b0mr11447481cf.63.1789658114766;
        Thu, 17 Sep 2026 08:15:14 -0700 (PDT)
X-Received: by 2002:ac8:5f50:0:b0:532:9adc:63ae with SMTP id d75a77b69052e-5329adc72b0mr11446811cf.63.1789658114163;
        Thu, 17 Sep 2026 08:15:14 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd2563ccsm102251575e9.13.2026.09.17.08.15.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:15:13 -0700 (PDT)
Date: Thu, 17 Sep 2026 18:15:11 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 12/15] arm64: dts: qcom: sm8650: Move PCIe phy and
 GPIOs to root port node
Message-ID: <si5cdl4yynao6fdx4mtaiccoryryxtdqgy6v2og4zln5q5e4ew@hkmsdncacbtk>
References: <20260917-root_port_v2-v2-0-6272b7caae9a@oss.qualcomm.com>
 <20260917-root_port_v2-v2-12-6272b7caae9a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-root_port_v2-v2-12-6272b7caae9a@oss.qualcomm.com>
X-Proofpoint-GUID: avtBIjPb4KHiQl5Z1rmVu29BrX1nAstu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDIxNiBTYWx0ZWRfX4wQM+2zVKUeO
 EVjuawCgKMGQ65euzldsRU/MlDwd0lP6Ztpp1NMDYB30SkrQkNeb+YQ2dzy7jhLeoBAwn8fDMl3
 zsPy0A2vaGQGv84fHMJ1wnZPeBRi/757wo4qOlpHzeq7RoBroJxhmnjukBGPP3YoPI91JaETQ77
 YkJ5vEKLi2cwVO4KrFLHqc3i09PpjH48p595M8PUBSPmZtVtHI1FWy+9vF93SrolmgUENlxIJt/
 WwtBFBGsZ4Bvr/CdZX2fd0930fbIdXNWFahVs1KZm4bBB9MyRVLE2oYQ9usvcGgmTtwdG3YPrNK
 1aZyclz5jXFs7MXLTGkiHohw97n0mZdJp3/0rDLTD7IVriuuJ3vHXNx2fsm3Wh77GDNYf6zbOVf
 LL9QAHJqgCYyJuomfHIZPTc+sN0b4VGuGrFvLgEd0rfRBh28sYEzZ8VwwnYeFW0tMJ34ciB9Xwi
 bkgKGGqpmmuAuGLVq5Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDIxNiBTYWx0ZWRfX5gZwxtWWYVwy
 8Jvk2U2PDdYBo8jg6auvtm60VOD/4otn8K2I6E2lC8B/tms81Uuke0ndMmOAphz+dC9bE7s86fh
 i2JIfKXqg4VqRa0rxbEKWeMYiTtvaVg=
X-Authority-Analysis: v=2.4 cv=GeOCDgXL c=1 sm=1 tr=0 ts=6aac0409 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=adJbRHicXYsKkr84VsUA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: avtBIjPb4KHiQl5Z1rmVu29BrX1nAstu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170216

On 26-09-17 17:55:26, Krishna Chaitanya Chundru wrote:
> The PCIe phy reference and the perst/wake GPIO properties are
> per root port and belong in the root port node (pcie@0), not in the
> RC controller node. Move phys and phy-names from the controller to
> the existing pcieport0 and pcie1_port0, allowing board-level
> overrides. Move perst-gpios/wake-gpios from the controller overrides
> to the respective port nodes in the board files, renaming perst-gpios
> to reset-gpios to match the binding used in the root port context.
> 
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
