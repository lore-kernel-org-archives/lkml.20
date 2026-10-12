Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A59F49D5A2
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791818928; cv=none; b=SN486ENE0mjKbH8wCh754XFV5u1BgfPQ4ENL8OeNV8RUEJ2cYQj6tw8nhCeEpTgJUMuytml8F+QP4Mr/n9gRY1lmOdvTtDRLCNAbxXZKQ+s0ywoWXH9QhVvnYGNCQDc+D9qRCYth9j81Cq2+oZn990MVJFEH4vo/Y0RWegu3Yok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791818928; c=relaxed/simple;
	bh=xRoJhJ1AvQpHt61hi2ZYmyap1RubXShFWJ+UOKcfqj0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VX3dP7ujWaZuqpfqFcC3P8CgMreZU1eRX2snpH0Buu0kZrfTCtJh8JlBhk1TDvhVoSV0Z7rnBLMC2pJ5hZN5z7ZqPKVjjaXdtjyLJPXKl6VWnt7RunIRnVHop2UooWMY3G4RnjIJlepOvyiHQHszkK9N0G/eKByBDOKKJWQ30CI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mkmsDk3t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GAFSokU3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mkmsDk3t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GAFSokU3"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC0VhX2088718
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:28:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n5VagN2mi3Fe/oMevwo3rCpI6oJ8tUsL3jWLuRR0zfs=; b=mkmsDk3t7JXGj9NW
	GiiirFEh6sLpZ5gc3S+7IJ8NPIXF7YyQLdsRlp/yFZbXjrKkujjcGq3+2/kyjBVl
	yEDSjYUtfOi1k0bxlssUJ5w3tclmYpDgG8WosdL6Xul+tvBrBDjqpe/0CTnJ1Qra
	goGtzMyQ/BG/SGXhtczwg6cdCGmTxrL1qZOPw9lzVXLXEZElbfq9sZdohMKSA54w
	b6Bj6WRDOZO7L5Q426uwxD+EvPtFMjwlB89tBBAc6re7Qy4jHRjiIl1WnegB10LX
	WVjlWiaRFCLXbPsUgEBPl+n/Fb77p9g/9cPLQ/Rxd7MIfbgDeS3KGQfbCpHE0XsF
	+vpSOw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8sgu2mbg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:28:45 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93edac58b24so12484785a.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791818925; x=1792423725; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n5VagN2mi3Fe/oMevwo3rCpI6oJ8tUsL3jWLuRR0zfs=;
        b=GAFSokU3ptguN7d3ejsXqWFWVMvNPsQ94rU/VEwBy15LnT+ILm9KjJM7+1dC8qxRpU
         TNsm+hqmUgx6lLI1iit7XiEpJ0bn/yuoExRQ9zoOeMYcnVqIi6Ki7DfN2YtBwdIutzoQ
         AE9nlLW9glet+m38cJlwbT0xRyTRsvlDd0fWvq5wcbo508OO0IaybgeWbEg+m0DoW6A/
         XZFM9x5mZsnRo4nGleZbKFx8RRUV8q7Ld4tt3mvNwvs/M/Am9zsg4LZ86MTjqjhM9TxC
         6AhYYQPoIat0vvtOcA/tvqhwn0dMOOYsGbH7zr0Vi/Rrn5vKx+657KkBFuFRP26G3Ip/
         jPVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791818925; x=1792423725;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n5VagN2mi3Fe/oMevwo3rCpI6oJ8tUsL3jWLuRR0zfs=;
        b=DaRQWgUrK6mSot6zgxhbE/O8gwLwwLnujODmCA664pHyqes8KkzLK9tlBMQnesu6Fe
         QOlT9r90zqt8ytyep6hcXPmJC/blP41ieWdIMJNzdOl/qyfZPdZ7KRtI7p9k4G3nsuki
         qPDDFm188YRzDpMYr3N5OZ/CiFsskf50oo6DCD9+/E/gtOUy+A9Cw9cI+eQzXBEdgupN
         dxu9uF0g4U+1VdpLbs1g/NzxV3Dzg+KVbasbEKz94pNv37qltlgDOLiqqqm0cLyu/tgs
         UcaOzc65oEDkGvGfrdrxg5i0m7o0Ft7vzIn2+nE1eofALyuMZiQRoAlB9OuFrFeXx5Ep
         9hXw==
X-Forwarded-Encrypted: i=1; AKwUvByfj3j19U1ug26pXn3pMF9VNM5nGnwdFNTOCLQDZ8wh1cnXWmi4FZkWEbt1VtBwAPGhT085MrZJXSYv6zY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLqC/LidGOxWpzASb21xNOmLkEI1F9EamvzHNkg6EXQtB7X0sag
	56J8eE9z/wqnTPaxYOeYTlVPS1IfQxU4tR4v7lnE9r39AF4FBKBdAPXxoXeoY/z/jJH7z1fSGGr
	USaB/u9TAdqiVxR1kq7MnCwxCriyaEKFkjcWca5iGHvx1gslMQlLd5hZIRxGXLYF08FA=
X-Gm-Gg: AYBFou278z+njrTao0PPLEKeKKxdpYDnH30VLuPOy1Qzi3IwKBZ0zYvK4rutj3DbF82
	v0iJQtkMT+Wi4/atf6Yzjk7Jqshjm1xsHcbduJ0QmpoNm/E7fxZ9+36ly8o5D/xUCLJkqi2owis
	8CXRHjFygvhQkjUwbn5eod4D6tfQgBoIh9yyzQAEjkKTaybpcf8ye4dWaEh80/Xe2D7CrnpFHrv
	WHq1VNtNwpyqgpyrrheog1L6fLCQcwL5WAxTIMCGjLlDJ5vbSh1JdxDEtlXuz/UpmVnrzGXfkFJ
	IEMltLq8dlYadjEdkw+ARu+YoFEpwxWBWLhDxEcmhBz5olTn29iJauUNZbToZiBnSzL+SaRVVu8
	ayKj7f7fwTuO7GBzb0qw4bA==
X-Received: by 2002:a05:620a:2718:b0:93a:ec4:e5f2 with SMTP id af79cd13be357-93ebd6e4c09mr1934179085a.6.1791818925162;
        Mon, 12 Oct 2026 08:28:45 -0700 (PDT)
X-Received: by 2002:a05:620a:2718:b0:93a:ec4:e5f2 with SMTP id af79cd13be357-93ebd6e4c09mr1934173285a.6.1791818924627;
        Mon, 12 Oct 2026 08:28:44 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9ac702fsm475916266b.65.2026.10.12.08.28.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 08:28:43 -0700 (PDT)
Message-ID: <fb6f9a49-e9da-4650-9b28-06932034aabd@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 17:28:42 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 23/38] arm: dts: qcom: msm8226: Add space between
 OR-operator
To: Waqar Hameed <waqar.hameed@axis.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: kernel@axis.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1790892852.git.waqar.hameed@axis.com>
 <9be1ad0392168b91389ce8d6a896d8be6173aea0.1790892852.git.waqar.hameed@axis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <9be1ad0392168b91389ce8d6a896d8be6173aea0.1790892852.git.waqar.hameed@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=QdzzLcbv c=1 sm=1 tr=0 ts=6accfcae cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=3-RhneuVAAAA:8 a=EUspDBNiAAAA:8 a=Ae01CA2AY_RmMo-c5YcA:9 a=QEXdDO2ut3YA:10
 a=hTkh0tvSPVsA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=VLVLkjT_5ZicWzSuYqSo:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfX1m4/sT9Y9UgQ
 GIa3lTA26iNpdUTR5g9IVTKIb0yMNVzZKFxkunLxTA2xhtazo44NMIAwz8zrMw4MVizBgDC50hx
 kAM7awZCOGqV+/jSVHGVT+I+HYJfGfDPPXXcBHkId2vRmZauzT4h/g5Aps2nn8bGArssqYn3Xzr
 9utPNOAglyZyyNkO7P7PtYusXsJhX/NzO30vQjf594CR//HoXZV3KZNQU5vUJAFVBFFDBhpm9EF
 709Mob5T3qgg4kL1+lxv8Th7ZGRBYrXneTRmy0XXrvg6RC5NryZYKZFhe2iTAsWXvoFsPUbwOAp
 8CUVV+i1Yt3aeIgrpfVmoDZNlOTyPbsbsBXXOuBm4n2jmk6tOqE8LXlM0Bw5JdC6WzwklcOpQxO
 G0GTU3Fur17gvFEbaVpQ3XNIZMQkjL8Man6mRp38nJXtpBjR69xgOuRXR6lGXaL6QeQYfScQqXt
 aA3HX9MGkDA75DMDyeA==
X-Proofpoint-ORIG-GUID: A3TP41zXjX9NWKBgTUhp6GqKSJRA_wBs
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfX2d+FcCp+CKBC
 2GvNGlS9sBPauNAcDkPXVP0BiekdZjUP9Hl3Rmcb3yc0Px8tICjRsJ0aPzzwLA0zIETfQmSGBzG
 BnuxbUnIDQr+5wZX1tnmNuAGgG+T9Io=
X-Proofpoint-GUID: A3TP41zXjX9NWKBgTUhp6GqKSJRA_wBs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120061

On 10/2/26 12:36 AM, Waqar Hameed wrote:
> There should be a space between binary operators. Found/fixed with
> dtfmt (Devicetree Source formatter).
> 
> Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
