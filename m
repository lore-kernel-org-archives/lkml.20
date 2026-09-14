Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C02E53E5ED5
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789371851; cv=none; b=aJwl5N9Ck53huKIKSvLJDigyt5Z5/PH/FwOfjPqV81qQmETiMCRgOyI9GuzYf6xnEl9ldCPtZnXN7HZ0q9+mjO1Ruh13QCHvH13wKf3jnL4QevPVsmQ5+DAhAvt3uo6cMuxlNb8FYWop4F5C/2jwUmxIOJBSNCN6QxheW/XzEsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789371851; c=relaxed/simple;
	bh=6E7eD5i46s7Y77mhiBVLdDFbZv58IH6wFPqFdJ++ZsU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NHn+ayKi2l04yoGlkl7IRV2cvLJ1Zwa3P29NkDMsNP7AjtHgKYZTYib0TVwIby3VRReQvaOJBZNFxRfDUT+kAMAqtC+TWaT6MqNcWbHOwm02D5G6K6qVtR6If3HRp/9AR0rr8UndzU7klfcGt0J2LIUeTnQICbL4igwZkvDLCZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i7OC17Qk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D9SC9jes; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i7OC17Qk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D9SC9jes"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5jMBR794261
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:44:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=IIRDghMKdS7lTK7Oj9uzZshr
	yaDadoJKytPnTqaUWgQ=; b=i7OC17Qksnj32zlP30KCMJWsmzza6njv5lntn5dG
	re2alAt6Il0m4EajDEyI0gg+QIHp9EhM+SgnPhXyQYqUDyJIpL7Z+rol9Z8Wi3v0
	/cX+OIBunjvq424/ZT62eT5Kc3G3I39tIxRawS25lVaiJFGDgiG3/KrT2EUNGIIF
	LH+cdFO1Rl6Xqh4bmsnalhzi9zAEtiSz776w/N0j5K35VLPGFQ9lipYcHtmdId12
	/EluztG7NMNckUJ5SC/qHjmX1unNsdZiLHQOAowX9ofyyWb98WlytgO0sPeYyGU8
	M9pWj7XSoTeHfWzZsKbgVYcyKD0FAXAOLHL8zJLkMbcLSg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9cnhur-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:44:08 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91219341db7so51474576d6.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 00:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789371847; x=1789976647; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IIRDghMKdS7lTK7Oj9uzZshryaDadoJKytPnTqaUWgQ=;
        b=D9SC9jesXaLykcir4Y9wyY3QHECt86NUIiWMAaon6ThNYLoj4r93EYKus6JRUFNtJU
         DSZ9/El8P6rN8wm2LCQUImZjB7NTpDZjMgtcQ3Eb1ktxv8iJB0SefIbBGlg30NBK5SgQ
         KAEO9+6Qjkz5dsfmHnwaHDnybGWv3YIPeVL+jdUaNtlOXLT6g5VHNoJQYzkd35fTPkVU
         is+VN7Ua8FOHL2dZ5nlwSH+xL0xcj0qpRW5nJ5YdWR27B+FB7xTfmDYSIq2fENLuBHbc
         GjtwB+4hTizz3QdL2wIQ1Ia3n2g7yrisPAFpADSs75twPEeT1EoG6eesB4NNXEQ0Kxs/
         py8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789371847; x=1789976647;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IIRDghMKdS7lTK7Oj9uzZshryaDadoJKytPnTqaUWgQ=;
        b=MhTmFLF93BtgRgq/Mg3HNkvs8j6LzOHKHb9WKgTG+zg1dpNU8obbeAcITmqihS+yks
         5od0yTcisdqAFwH9l9jtpq/kMjSkCADDWHb+h5sP6h3ehoiOmz3080vXcGMcNIaJS2pX
         wu4elJ/vJmPznHH948+Tfrsb1pOiWzaZwRZOKnD2uatsK6E7/aGhOZCVKF1qSAUFJxAF
         92HdvTjlgHrgnOjtyKEBGknVnV8yDYtaD8RHtz9eg54bgzFwHrtI+ONKIXZfin2Ijxkt
         O2wrweO4hiszYQGsjgg0gRr/3+ze5krrpMQTvd1c1CBtc7/W8G+bG9GPXgQkthnQV7Jt
         bjvA==
X-Forwarded-Encrypted: i=1; AKwUvBwzQ2+4j2xFOyiQv2MP/14vLuFBIf6q5/0MJ+lDlT/AM827wjVCWD7AVzOD01u3fX4VUqwA+woTkztLFuw=@vger.kernel.org
X-Gm-Message-State: AFuF++m034teKTF8ZyPIsCJjLX2Qmptp4i3y3GZvD2WfQcuDpQUj/nk4
	MUdTgFGYGJkcMjYJ3rb3RBfrBHbuPDIG9mH2Qjx0HX4+MeTJIOt7TPDygenYOEN6xiEKCIef0x8
	j8UYPsxunbwo7XqjcoSwDyCL5eOwHditDYitvgTbaT5+ey4nR2xsRz2Ao142kNj4ya/Y=
X-Gm-Gg: AYBFou0s8NfCGDgAUKQvkjNKn0gWjw0zf5T+RxoRetxR6rN/m9oQUYHnZDgPuCFtJe9
	hGcQxNWIgpvP6UeXzGUSw/zA2MEt0C/EPQS6s02oaeQ4ciIDaNB0/pSKFPwCOpohcjPsvfqgusS
	b4qKU+Lykkhq2zrJ/jDbJULbZlvaywPY2KopC+HtYR0s+AmTJ57aEdNdfSpgKcNBr0ap9WAyok8
	piI42oOkRx77GX0DTwhPg7eeGc+F2zv4lxcGAWtGyBSDOVAY85rLSJX2T3bz2GGZukxOHbquDOB
	Kn4wfn8Z2ECkgPHMWZytcUrTjViEM72dOa5mH6LR9E0ccnthdx/IyTa4GREjnF6FrrmlHgR1zL/
	c7ig22HvaybDDG28=
X-Received: by 2002:a05:620a:2548:b0:939:78ab:3c5f with SMTP id af79cd13be357-93a297c8d1cmr209146085a.9.1789371847249;
        Mon, 14 Sep 2026 00:44:07 -0700 (PDT)
X-Received: by 2002:a05:620a:2548:b0:939:78ab:3c5f with SMTP id af79cd13be357-93a297c8d1cmr209142785a.9.1789371846698;
        Mon, 14 Sep 2026 00:44:06 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb34f353sm24005162f8f.26.2026.09.14.00.44.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:44:05 -0700 (PDT)
Date: Mon, 14 Sep 2026 10:44:03 +0300
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
Subject: Re: [PATCH 30/31] arm64: dts: qcom: sc7180: Add domain idle state
 names
Message-ID: <skntn7i6iecjzufijj25zvalg2xcaxwqa5aresahychjhrlt5q@ginodspziu73>
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
 <20260914-b4-idle-state-name-v1-30-660c31187819@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-b4-idle-state-name-v1-30-660c31187819@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEwOSBTYWx0ZWRfX4RV8wdBlp/62
 3IghUeQpoY3JU1Qyuo2vvkOD+LzO3P5jYHWpHOqKtT/GBUdn+smSMS1fi8YoNCa6t8gPYfG7Q3l
 sEVU5TW92qpm2n3ZyQCh8atJBeyaTV3VptHGERyWaAfsjkk7PoZDbhWgXSmmaBocy+gQHLXROLA
 6FlkQTbJKtvrcm9OI9gCY83pyU4puQ0Ik32HmGHsiSjtEkACVb+Y/bhDm9fXoOgf3kI7JlVIoD7
 sYHjZspr04NHmcDcC5/1ZXStCQxuzYlswN5Jkn7VwitK9sxVmq8mFXKG9ndqWecjoF9ItoEW1eA
 mXbkWqwIjC2rX+c1DDGtzd35V4rSQZneFuvm60cUGCJDTH2iw0Y1cKPJmW0NbAqKql1fqIzb6W1
 OiklUyrs/UQ1vUbFWfdOi6s46X1IrVhlGuFK14hMP6RyQWgGjwEMtwMaUXxic7EKUHByTApKTQu
 vG66ax1sYRUtkC2K3+A==
X-Authority-Analysis: v=2.4 cv=EMyTQFZC c=1 sm=1 tr=0 ts=6aa7a5c8 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=HAnpKfeiUU4SruykqnYA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEwOSBTYWx0ZWRfX8Ft7J7S2xi89
 r2O+NeUr/mungToRzPpfcz8XaYrqsA4uIqK+6gK0rRS6pnz0tfFg4RtYjTEG//WJf7bdzoOD081
 YQNKd4UEO45OR/xUHhgy1EKhSmf9P0E=
X-Proofpoint-GUID: vnOYqpZqypE5r7q2J4QuwYTWCIpXfqr2
X-Proofpoint-ORIG-GUID: vnOYqpZqypE5r7q2J4QuwYTWCIpXfqr2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 bulkscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140109

On 26-09-14 12:30:02, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> While at it, update CPU idle state names to match the low power modes
> they describe.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
