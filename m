Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EF7537C0FD
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 19:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791572976; cv=none; b=qbvuzykc16J43nIdFaO5+rpG2ln0GCmmKMZEdrtkuQt07APT68INn4YBoupN98KlJtUqWHdK2rdwF8/dlojTcD+gbGOlAWYWIw0GZE7L8yQmDlVej74R/IKSP4A09VYEqdfCB9JaIxe7HDwG+RVYdLbZTmCaQQjc2Ex2JXMjms0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791572976; c=relaxed/simple;
	bh=enq4qEPadXLBj3ZEPOJuLUnc8Wm+dGgNBPwI0Y+P42g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UHPmtQBKX/91BMMwI23QWzHdS2vNAhdup7itfl0MXqL6urVss3X13w7iqXQPPYAv1DgxL+jJRIymCbP/1H2tzW5pX+e/LDJXy5YM/7qnBD/lCOV/JBZ/CWe0Hmu9yy3orKlGppRAkqEXjZOFGrsXdKqPVuCcLBJQ32gVQrqO0tI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bK3kjLUH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ibdr3lAL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bK3kjLUH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ibdr3lAL"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 699HZfPx1016267
	for <linux-kernel@vger.kernel.org>; Fri, 9 Oct 2026 19:09:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6RnvA+SzXeNiiPl6kbPgmaqN
	40rW8M++VLsuhxvpSuk=; b=bK3kjLUHOjAYMA64rylS13ZyomDlvdvhEncWYxZ+
	ZI4vYibVjFjiWx5Kvb5NEaC0GKtJT4UpldZlapoHSuLnKEziL/owKZCQkxbp9ZKr
	Y3P5tihtC8m0UCOlMZn0CprNhzTnTmRatsETNc9PGJa0SgF3+XtddUTy0PTMBWf6
	kktLxFjLzFXTGAnpQZmtH0LeofwlhIvPN6C0GD0vfK7oPAKbVi8fuhLc8aRxeEvT
	sZVsHNvAZ1+M52/C5CTqhdh9/CKbwyxC5O6PRkNWC3SW5inyg4XQv+yKi9lKy+VF
	qNK9xozcpWQ9bjG9+fyBUru+PVLI2IaT+Rh9Cb4Hesm5Dg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h74t88c53-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 19:09:34 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93bf4c0af4eso483404185a.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 12:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791572973; x=1792177773; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6RnvA+SzXeNiiPl6kbPgmaqN40rW8M++VLsuhxvpSuk=;
        b=ibdr3lAL5DEPQiALLodb2nIoF75S2KMnVuq5WmhF4vpC6KnzKMeZrbssAqZdjADVsQ
         SnMe6PT0idm8QA7qIKMR7bKGljfJ/bgqRRgUAk1OeGqdp4SsI0E6SfEKRQdMQJjK7Tsr
         U5c+xjPlFA7H0Jf5PkwjaPXV6wKQ2acW6ZDxMRvxrJdJyZVylFSV4B9B7vfEgxheVotv
         YLjATZt6D/B+KD+rGfvhp2mVe3URyr2UOtFG5vI0JsgYV7/VKBdlD13UM4aiVck4F0k6
         jkVHKAAWQQ5UQjAX7pvnEBRIWBx6w+tgUxIKTMnurWB2eTjN5F+07vNkIRkflReT+qKg
         Z1mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791572973; x=1792177773;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6RnvA+SzXeNiiPl6kbPgmaqN40rW8M++VLsuhxvpSuk=;
        b=Q0iLklBOY/yQtCEa/igCepEtmqtcn9TiGMwc/EILGi9bPTh7Mq8DTIWhifhl0iehU5
         4TRCncXD+o2Wc0zUqUlB8RbCHd2uUf1Qx+cl1hGyuJSL2VFzH0p2bF5R4iPU+NwDm+98
         JIZcWi+l6D8Y9p8LK4IySR1LvCwZrvEwtcUZtiNYL39aYFRZ5+5XL/gvUtjP6sBAhR7l
         HIAUY4m5W5Ys9ta68JKf50ZnKMe2NxUQiOWdUhTT1MuCFt8Kh6R4ykyxgSTlEzmNI7tz
         vhCSyNPRAkgIAoQiYaJlORkf6wlsKasq60fUkojE3u8rekWkF0kakTX9e2uhFUd8Gerd
         t7QA==
X-Forwarded-Encrypted: i=1; AKwUvBw08sSeLQxr/0/tprTB+vauNrKbBKPlbGj9GodCVtNi9mIwsSU2XYuy+DyLm7e05fJOezEqIrDNOz4YB9Q=@vger.kernel.org
X-Gm-Message-State: AFuF++n5EMw/k+KrioUhV14Xv+AtufpsNkxxJ9q3Rtbe7OxtBIPxji6T
	Bnrzp8TZLjMZ/cVlW+yMgocurxdmk4xT/WUUHgBZPkOPeNlqMDnsShAZUcADqR/KBnSXIC6gICu
	JxyCjRAjwwvSdigbqfM+AIJwiA7WUeJvXxEG2EOXnW3rouc7sE/iwoLd0JjJ7O++sz/s=
X-Gm-Gg: AYBFou3ksQSYUpRAXBWGF3y+roo3IzVH2mWh0zTDaVh78gESljwgZXfXHOxITQB2FmV
	aF8lzGxyYmU3AUaFd4I1un64rjne4fMW5/EtVtf0f1VT3Hm9431dp++Uwmi0sXEwA6cpN0Iwcve
	/4kl2dzckdbrlUvR8t6vGEdihX/DjIuZksb72D+JtmqyvYxW8nDleAh0+KgbfFMtEVrM1+JLNFA
	r8oMEoTP0LkNESFDkacdftValoD0tBEixyeL9w3SzdOzUTMx+w/E7i7s/6d30K/O3a5xP9C4W4P
	6LJlMbvKIL9rmu6PqpGXqN2cDcmYXkDWNPbBVkKL4cXll37zvk6ziPEO/mTniOxgDv141nTmOGY
	GVfBm371p4MDZtZc=
X-Received: by 2002:a05:620a:2715:b0:93e:5677:317b with SMTP id af79cd13be357-93eb96549cbmr498463285a.25.1791572973241;
        Fri, 09 Oct 2026 12:09:33 -0700 (PDT)
X-Received: by 2002:a05:620a:2715:b0:93e:5677:317b with SMTP id af79cd13be357-93eb96549cbmr498458985a.25.1791572972648;
        Fri, 09 Oct 2026 12:09:32 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf2e0dbsm78770315e9.11.2026.10.09.12.09.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 12:09:31 -0700 (PDT)
Date: Fri, 9 Oct 2026 22:09:30 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: juerg.haefliger@canonical.com
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: qcom: x1-hp-omnibook-x14: Consolidate
 pmics and chassis
Message-ID: <sie22supg25mtwcsekvu7sry4z4uuxmftupekpypltc3lewpsi@n7eal23pgkss>
References: <20261008-dts-qcom-hp-omnibook-x14-cleanup-v1-0-9702f7c6f9a0@canonical.com>
 <20261008-dts-qcom-hp-omnibook-x14-cleanup-v1-1-9702f7c6f9a0@canonical.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261008-dts-qcom-hp-omnibook-x14-cleanup-v1-1-9702f7c6f9a0@canonical.com>
X-Proofpoint-ORIG-GUID: mXSZ6GZBMtpE7Y10e5QH36TiZp8SY81r
X-Proofpoint-GUID: mXSZ6GZBMtpE7Y10e5QH36TiZp8SY81r
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA3NiBTYWx0ZWRfXy6zJLGz52nBn
 /K24e8xx7Nw8T2rR4BJAUxbF4zI/Otu0TYnXeFMqDyKUVZyB4tsOwuzKTIghR2x5OCpdlAFEuYG
 dtfu6jI9GBZL6DnP5Z/JlMEF+2itkBw=
X-Authority-Analysis: v=2.4 cv=JuNkP84C c=1 sm=1 tr=0 ts=6ac93bee cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=EiYrS7xXfcF7w+nkr41hpQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=DfNHnWVPAAAA:8 a=EUspDBNiAAAA:8 a=tb8V0W7vhrSWw5vyytIA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=rjTVMONInIDnV1a_A2c_:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA3NiBTYWx0ZWRfXyv6D69SgOQHw
 HmPP4DkCG0YWtXRaUYoUDviLRHSnvyh1T2gdeZw9B8Rf73T+gn8RRPf9YSj785JRFnMfKHw+25q
 A7xHGhfxgubmMxnUSDM2SYLx/m7ALSgmHkeRxG/FyZ//aT4bZTNPP8j11sQDz4oswi8pKcvFja8
 aPqdyAs2hHefy+RrPK1wrSBRO1PQCxMTlXXqAbxC8If0muDI0oYOSp5Mj7cXqFsDENj8QNR14iW
 RI2lVbayH0dB7X2aePpKR2okIxLQQ4oPgSbN/OGsn6jwdIFeg6mDejGSTauNTPSD3cv6nB9Jdfi
 szccV/O7eiGiHxWz250EZdcbkxcjyf7ForvijK7rRzmwP9SX/TgQ+7O8WVWvXs49Afpcfci2oWe
 lUXQSI9DNflGmaeSZUB1Ff95VFi9mJ4N2ha5z8tXjHY5FWr2R+uE5Flfd2/MmPdTcpXh7k/4+wB
 VeH9POY5cqPME62l10w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_05,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 impostorscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610090076

On 26-10-08 20:34:45, Juerg Haefliger via B4 Relay wrote:
> From: Juerg Haefliger <juerg.haefliger@canonical.com>
> 
> hamoa-pmics.dtsi and chassis-type are identical across the HP Omnibook X14
> boards that include this shared dtsi, so move them there.
> 
> Signed-off-by: Juerg Haefliger <juerg.haefliger@canonical.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
