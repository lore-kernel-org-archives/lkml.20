Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D50841B8C6
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 15:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789227134; cv=none; b=pgHnnAQAB2clozBa8AzYKtDHoRtiVULKdhvY7y00Ed7MMP985X2VLhxJFDBuZRj3S04CtDCaMJobfPForfLi2P63PrV+xQGj2f7HW2Y6BtOatvcuKTGRMSYpxZCoXQM60iH7dJqU6a4ZGougFDtnuYFk8KB/0zcH2iyRl3jHeHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789227134; c=relaxed/simple;
	bh=kA03Dsr/1AHH0hl43xERedXPdz2D5bE29hNcSja11iU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HeCuHcWXahGxfIqEXF8jt6LUhxgtHQ95prKVQl+Cb85sjj+ljw/XzjbLKfH8yBuvq14qQ/4LUKK4Ae2MFwGD7L/OmLad3V+AbcAKz6SHBf4XlbSFQpQSi/0jV8OwBuuubHTd1Ub1BgujSNwL3rDwYgmOemMUHsQduXfOT+gOjeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nnyhJEI9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X1qH04rB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nnyhJEI9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X1qH04rB"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68CEddXg3827337
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 15:32:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/5DBiz3xkQf+uQf9ORN1tCQu
	Bg+aStW3CqHxiKqhVrM=; b=nnyhJEI9E3IYeBxHDuIP/mBraAXITH56GgjaASKc
	9IuRE73qmmt6TOmsrUTPvc1RhVfd7Qgs5NxRlK1HERk6x1zTQxq8/IgcfKbcsrJ4
	+N3/67zGdoZFehzA50MeUrFVF/G1iWjzTzX6iNQA670l+8fCkgZqGyJswuvIZmso
	3T4lpVif4E7rTfbxiGDQwX6mIr+K9FgD+HHa+UkwFpTYPBZktIq+zOOItbZKOpEs
	FwGwr3xhOTw5wDDIS66/8ryyGNNTK2mBsBSv1mGtlFW5ewFgSQACBq+GxqfT9Awx
	D66E5XV6h/ESUrjEV4oxLRAZiTNiswktMVMQO2HKXpmbJA==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9dh90q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 15:32:11 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5c7ab4af214so630584e0c.1
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 08:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789227131; x=1789831931; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/5DBiz3xkQf+uQf9ORN1tCQuBg+aStW3CqHxiKqhVrM=;
        b=X1qH04rBEDZu0mVBvr6LLVeekxDrC/LywjOe0Dj1XiBx6O9cqLRICKU4Zq2sZOAjH9
         tfiRbFfdROREMXE+RFQFfefUX4c+/QpyUGXi+i+cEEIx6GVg1eUU+5sN9PGBC7O73mh/
         u7dxdSS8XcnfhcePkDqFEVAifynTdxwpFgpklTGvUecskLF5rtvuZu/4uzYZ31O/pg7N
         7/DT8t9KpNroqik87iNxdEZOHngn3dDirRfLMsXnfTG01PiKVoX9GMmJVlh/lMWiPbXQ
         AmONeaKsOmdL2GSM7YuG8eEYaG3XgZBSeJ4eWOcFZos7PUktb2kk9/QxOAZvIaHrE9qq
         hD5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789227131; x=1789831931;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/5DBiz3xkQf+uQf9ORN1tCQuBg+aStW3CqHxiKqhVrM=;
        b=dUwImKNo37VY/uSTlhApODR4cFpsgK2ofegog2tSSs4CfdXciqvjTj8Qtf9gbHucA8
         MZDkiiZh76vCleJ7LgSNyYeI3DrGilVmPjyXmsxP9pun+6cN43TS9nVBV3Qh1Mad8PfA
         dk69GQ10zG6QH/2HdP0DmTHEXHJA8iVeIXJOvWKje9d3WLYLken9e+F7wtaPBJ3JcWH9
         Z/XSlQQb7DPDcVtx6HdJiMzD1lo65d3UtiA40/0I1r4QCDhIWy0XlmguT0sQ+pkEeGMO
         3uHdbeyLI1cfhIGRIP4LpKmvR/9LOFgkQ7iVPNDGfdz31xvqALJye4mPWphgQM2caizA
         ux1A==
X-Forwarded-Encrypted: i=1; AKwUvBwpmVUl9LuitcL1gy/i8vxSMmbwayZpda/8arhqKMrBXWzDRv5pf44ocO8gdhpcGOWF+VLavAESezH8JBo=@vger.kernel.org
X-Gm-Message-State: AFuF++n+BvYJJNXr5CEB3w4p6iktcgW1VMcot9YprKZ3vfyKPgN16LDC
	DnngmvISyr4kROYSvqhSFTPFpkrmln7MO8x8lygSIhqm8H1kk8EOCpmPosTvUhngYQ0C5Ft9ZBt
	CnJNMW+WE/QRkGTnSV45e56mE4/s5/vUrgMJT32JogPkGhIwO4I+X/eigoVYCWnUlx/Q=
X-Gm-Gg: AYBFou0/dJ9TblDdgnU9cMGUiMwbgoKaQy6dgur4x5JM53SOOGUc+CIdTDAouWctlGv
	eRajC/0Numj+ehAS3jbaaq8Xt7yNwUxYHCq9oYhFD+GrgBdjSbAmSzBNxyCUyVaeILs1qidN4sA
	7Nfo7vle21DjlkadVV1OxvQ0BqLuj8uEMKOouvLiexf/kRanCU4I7JDWtq6c3U0C4RF42C4QAfq
	P1XroNzDR9Ct9cn/WjZv5mEtsc9ihNq4g7yRDHO5ktJWrPNJsQ2QfBK9GL324mXeuMVxTNhYGy/
	msD8HnhrKOEivPs3VQF14johffGKAr92f0zYkpp28LzjyzvaZFozKH88K1w9fWeRNEFLYB5QVqT
	CqxA96ndIET2yaQ==
X-Received: by 2002:a05:6122:180f:b0:5c8:4bd6:fe with SMTP id 71dfb90a1353d-5c965ef7403mr2720622e0c.8.1789227131146;
        Sat, 12 Sep 2026 08:32:11 -0700 (PDT)
X-Received: by 2002:a05:6122:180f:b0:5c8:4bd6:fe with SMTP id 71dfb90a1353d-5c965ef7403mr2720349e0c.8.1789227129945;
        Sat, 12 Sep 2026 08:32:09 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb32d3c7sm12842770f8f.10.2026.09.12.08.32.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 08:32:08 -0700 (PDT)
Date: Sat, 12 Sep 2026 18:32:07 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH 3/5] arm64: dts: qcom: nord-embedded: Add USB resources
 and PHYs
Message-ID: <xzuh3522zh4hqck6kr4piauyzoyczbtv7ngnrjdn4rr5jz45r2@7uwm2rvm5mq6>
References: <20260911142040.100263-1-shengchao.guo@oss.qualcomm.com>
 <20260911142040.100263-4-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911142040.100263-4-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-GUID: cVkw_a2HTB31rkJ4OycC_Bp4cn0JjoYH
X-Proofpoint-ORIG-GUID: cVkw_a2HTB31rkJ4OycC_Bp4cn0JjoYH
X-Authority-Analysis: v=2.4 cv=NelzRGD4 c=1 sm=1 tr=0 ts=6aa5707b cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=yfiF4Zao35L6hQxt72EA:9 a=CjuIK1q_8ugA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEyMDIyMyBTYWx0ZWRfXwhc9BcX8rgJi
 K0IXI3JAYDavNbG8PRHi2/fy99CZxed5492ZW8HEzmxVLpsPTps8pLPgbtOOQjD/Fa6CN0P7D89
 PhSorMTsl4E82YI3DhboT+T+2RGON0Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEyMDIyMyBTYWx0ZWRfX/3Gi4LyzPbML
 j+wXlKxAR/CWKiTT3CoHedFRUDI2knI0hzDxUXGC2LUzhryBZ1RZQ3nDtiDuSx8gXkqhopoFaVY
 GmL2C56d/E0E0BX/FtWJXIDdUlq8217CEj2E5ZBT92oo7Q6anLPra/lPXTVzVxg+xJHE+XayaAt
 tajNx8k/Zy1fzbcDYRR4NTQz54r4Dquu9ZMdNWts/ShHu4SBgfwC+ea82lrosPUrfGq9Z/PJMjA
 vS5FR2G2MtYVXOH6+SjEkE/MktjQh4xNn5QWErhEl88nVZIT/K9cV7BKUyxGlASJ1uAhSwEYj/4
 h8lb3cXJmMA2j2GNKrAUTp8eSu8nzZ1CuhEYJ1D6CdsIS2lJWFwbPonits4GR5Z562ylaJMspoI
 q3lUuW9FEdHnNNBe+g5J50gN54K+Hla4S5Ni6rVcxAcrVpeOOdpqXWXc9SIOICFVs2JA1/qngMG
 3/IM2VEBNiXYa5XcHZA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-12_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609120223

On 26-09-11 22:20:38, Shawn Guo wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> 
> Add the platform resources for the three USB controllers on the embedded
> Nord variant: clocks, resets, power domains and interconnect paths.
> 
> Add the eUSB2 PHY for each of the three controllers, plus the QMP combo
> PHYs for USB_0 and USB_1, and feed the two QMP USB3 pipe clocks back
> into negcc, which so far carried placeholder zeros in their place.
> 
> The eUSB2 PHY of instance 2 gets no 'resets': the SoC provides only two
> QUSB2PHY block resets, belonging to instances 0 and 1. Instance 2 comes
> out of reset with the rest of the USB20 tile, driven by the controller.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
