Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793625374;
	b=wTozRNPa2kOmp2UqWF/CRcb1OGUO3b62rDzm1e/l/vn9Oo8mPTkN517uu1H3p/JXk1tl
	 YLCrTBipoRq3IcWRDqdEmNRMzwYcuwD5GVnvAukf3y6wjjaOOsADgVfR43yp6Mlil02TF
	 5sWLv1agCT/H2LRAy2e5+ThmcqYAIQ/c0DZG/PMPd1u4DbX+K7L+e/+6w7b13NWPksyvl
	 lfelSXM/3wLomTIZ1bbqopCBq+iLDqTvP99UfNEtrAoYMrOu/trFjzy/lI9564o93gOmy
	 T3VAe59fZsmkloH4EWLj/nFV1VnK9rPgHfmvb0pF9hM0xSYQiexk/Cp+/agkTXZ5Flw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793625374;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=hya+gIi2koVDG+4j5QPeJpDU2NBaBm8cxAs4R6GPce4=;
	b=KsCspsu10/d1M98so2P4OCQ1HW7TanwEXRpyFmH/mQ9ki+jE9gaFTkAnGVg1rztS0/+A
	 dKqfBIf9OOwqW4VmzoydYfSN3e0G7tC/SlmlsRlwNwIGWubAhmzji70D6WldUWvQKqinG
	 godVGN7Nhr8LvhyNRl9Nh+HECLpEidFNDxtmZ61OPkLMMpIhJiLX7JoUN3+fG/84qVUqQ
	 3RnW7aCmEAzVqwr5QaBTLDKb7aXz4+Eo2wpfDJ+As1x+h9eMLSWI+pONnsFrX66mbK59G
	 /1KxitU6+KUuXS4r0F4z0Ta5BQX395rWv9qYdsvv4ymgwJZCHsaTRf3waul+0LauEtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bh7Yibi8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iB0C7hhP;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71B28606A327
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 13:16:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71B28606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bh7Yibi8;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iB0C7hhP
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DAHro2902123
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 13:16:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hya+gIi2koVDG+4j5QPeJpDU
	2NBaBm8cxAs4R6GPce4=; b=bh7Yibi8Iu8gQDZIzYkTL2FAG8azATUPfbqncMs5
	rJVSbvMcQodfBpDCDXlHdjKqTYJQjIG3nhIuv/Z7bBPMTKJmenp8MufQd21yuNJ/
	c7wQtDpofYJrV4QqucwqJKGhHULRdxZxc/IYUk0BAFtIsInrqyTThqebx+Bol4eS
	pC/2XzINCsHZIu1aSTVd6PLrGgu5K/lDdYObnUluaFXTtGVJd+AIuNnIRECBhqlt
	3sGn3so+mnVwNtFO9te4UNlmDxeIGzwM2eZR2OW2wvLXzxF3mbgPM7yc4bjesrSo
	VXvio64AvYghFD6wEGiiEbAfDCbbxwQ8d6bvFekv5q8EkA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpsavgf4s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 13:16:13 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7c10b8abe29so2439613137.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 05:16:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793625372; x=1794230172; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hya+gIi2koVDG+4j5QPeJpDU2NBaBm8cxAs4R6GPce4=;
        b=iB0C7hhPWOeseuJcHVHNqGffHixBd4wmCIYNVs1pBzWuxV4mO2OZEw2SHj4i7cesKQ
         ekKRy2hr2ASG6AYY531k59OlSpB0cKcUa59TRK3TzZ7MARfRzzDhkMfYWyvhnYXVXaZ2
         efGL6PII1rCQ0B9PVrXu43GEIgiqpjrWlNtuegQAXVMwkUEHLY1mDx76JltW0OaTNx3L
         R1SiajC9XSgHo/KYLrEsBoJHAEkCtZncgd2O3bCNpPEpMNl/o4DRFodtjvWnjMyKCZJU
         k5emVczePpy4CwTGEk/LeO//H1Rbl98QeJMsIHDIpT5OwyaUJRuijQ9gtaOQI3zH0LF5
         7wLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793625372; x=1794230172;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hya+gIi2koVDG+4j5QPeJpDU2NBaBm8cxAs4R6GPce4=;
        b=ht0nlJdjRgkMkq+NTG8h/5KQowDNArb2HfTpu0TPp06OYu202HPINwKvDWgeQNnno8
         EzBLUw+7FBfRrRq9BzWV21PCoN1KhGBAUKIFYXV/JgAmwAbVdDI12mKqiUr9FKFsSXMv
         DVKmgKed6Ob0Dr1Fk4Adj6CgMZKQajD1sc62l3knu8kXi32Kmm7C8JTj1Qxe3MAEUYV3
         gbkPPHe/Abxfs69FMFGWIzrQUfbOzneIYzzq1hK6Kt83bGaLW4EI7PRu7nB6eWV0reKi
         jYJKqXPyQX3jwtimwZrZOrwB/0AxFzJQScoJTS34E+uF5qqL7B1oB8a59N0Idcg4vr5J
         UoVA==
X-Forwarded-Encrypted: i=1; AKwUvBzheAmoEa5EZsTEXp0poi+3AFPub8OxVnQwtWEqN/6/Oq9Cla70/qtxuUpJx38vcwS07VRFuUVO5yk3dgM=@vger.kernel.org
X-Gm-Message-State: APuU4Z96NcRuzMvpmHWXG+Lrrb8hhC3eoQ7LHRfXXkG1sGUJOIykAHO9
	3v3A307foo6/+geLsMxgEoeMvpjfbSe6dfXz2eF/4woP7Ah+fWiv9YAxcHVu2VenYoX5c26jDkp
	6pO483Gjinj9m2xFPAlIHqZnLkpISTWez0K0P5AZUh0gwAov2HYPcaNJI6VIFUkSZi2s=
X-Gm-Gg: AYBFou3CG1A5P8qGfKkUDlpDeABpZvS23kua+0jTW5ZJy8B0J7mJxcoNLPEYHF/B0lt
	qdyJidDwkTOEnvQZch9RC5bkCjlvEiJ7I+d/9JXlYzKGdjzLgUtZDFyM3vPbzm+svHjLe9h/EnS
	YSu18Aaook4NXN7olqlBm1pzxW5Z0PDIC6wIwgus3JbZyXwhcVrcIWxiqzZ6V6Jsq2qTSPzjA1X
	0O85E/1IgzBXxizc7urHRO6WRQRWCv7m8Uz1aeq0ayNn6UCDR6auFlqZOmQjLM6Q3k68Jl42F0w
	aD9Rl0Rgl8DfI1FWpH6XnLs6ZdcRksvLTc6p6r6o6I1Cr9aRegdQiZb22Csy8zGXeuXPWUEZcYg
	d1OsScmmGT7gGeJeiAOPOSSnICrbLrLSc9pUONIH1UV/OYWkcDA/yHtjg8ICl7XU=
X-Received: by 2002:a67:e111:0:b0:78e:1e0f:ea42 with SMTP id ada2fe7eead31-7d07223fbb2mr3757430137.2.1793625372212;
        Mon, 02 Nov 2026 05:16:12 -0800 (PST)
X-Received: by 2002:a67:e111:0:b0:78e:1e0f:ea42 with SMTP id ada2fe7eead31-7d07223fbb2mr3757411137.2.1793625371414;
        Mon, 02 Nov 2026 05:16:11 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf60f1114sm298991405e9.7.2026.11.02.05.16.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 05:16:10 -0800 (PST)
Date: Mon, 2 Nov 2026 15:16:09 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Yu Zhang <yu.zhang@oss.qualcomm.com>,
        Shuai Zhang <shuai.zhang@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v4 6/7] arm64: dts: qcom: nord-rrd: Add WCN7850 WLAN
 support
Message-ID: <5irujcxbl7w6nvtjp5en3z6rwn64cc27ln5yrs45msncjjjfk2@znziikd3jpgi>
References: <20261031142433.1212809-1-shengchao.guo@oss.qualcomm.com>
 <20261031142433.1212809-7-shengchao.guo@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261031142433.1212809-7-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1MiBTYWx0ZWRfX9IR286L6SPT4
 aVCxca4GK+3hTrODR9/67W7gaCAXombkxkVup/HYFtKMH39TCufQQHvNe+w/q6XvOuEviCz0l2o
 swPUjmvBhn/A8lxvII4eUOg5qDG0WQn+KoFoxyFvrwwi9hg/TYTeI8BSwtBSt3P4digf2aIS7/b
 zOYbmwkSEPibKoKT09eM7OT07o032krIkA6WJ+zhdnS94xs/7l64gV4kGILumsgfQmTPgpiD8TB
 NOOXdEZL6pnmPz5zeqIOGl6ZpBTmIC3mH7KzWFEPiKjKzAiff3K4IAlbQc8GVtcZV2R3NbJtj/g
 /muba1V19qNHCd8vvPz3Z16vcolmlCHnLKn/pFmg4eTbGloHxx0j/4ELSasGDZDDxTSJlA/CRqo
 1Tu6IENzsp5SySyLykRcHNJpEjIUTt5PH4jSPC7ckqnqcmCxNKBshDc+VLwi+Z0JLwdv80l/zXv
 C7RMwLVU3eCkPxnDTow==
X-Proofpoint-GUID: KUfeZmF82y0ROcUIS5ssv4Rpmut1Vy_i
X-Authority-Analysis: v=2.4 cv=FZmiV5+6 c=1 sm=1 tr=0 ts=6ae88d1d cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=9wUN3dL8otb4LRdDC5gA:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1MiBTYWx0ZWRfXzh+d3Qs2M9mz
 J+AuWk832pOU9vUFM/yUwxhpn03PwSd0D1GRpj7I3TY95gDKGZwlZhqjMQI8C/NwK2B78HLqnz+
 hsNpbgG+IYyY3eivP0dMPTOhDEkluMM=
X-Proofpoint-ORIG-GUID: KUfeZmF82y0ROcUIS5ssv4Rpmut1Vy_i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0 phishscore=0
 malwarescore=0 spamscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020052

On 26-10-31 22:24:32, Shawn Guo wrote:
> From: "Yu Zhang(Yuriy)" <yu.zhang@oss.qualcomm.com>
> 
> The Nord RRD carries a QCA6797AQ (WCN7850) LGA module on a
> connectivity adapter card hanging off PCIe2.  Three PMIC GPIOs gate the
> module supplies: PWR_CORE (pmau0102_e GPIO6) enables the DBU_CORE_VL,
> DBU_CORE_VM and DBU_CORE_VH regulators feeding VDD_CORE_VL/VM/VH,
> PWR_CTRL1 (pmau0102_e GPIO8) enables DBU4, which produces the 3.3 V rail,
> and PWR_CTRL2 (pmau0102_e GPIO7) enables the 1.9 V rail.
> 
> Describe those rails, the WCN7850 PMU that derives the chip supplies from
> them, and the PCIe endpoint node consuming the PMU outputs.
> 
> Signed-off-by: Yu Zhang (Yuriy) <yu.zhang@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
