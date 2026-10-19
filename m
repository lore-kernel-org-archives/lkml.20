Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C5424E80B0
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 12:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792413095; cv=none; b=VZBx00WI8+nhW1AqrG4Dw67Fm2CI7sraORaGT75S54CeHkMPMuQj9nJSABHec8FuNQa46RRS8DK36Y6j6vZLuZyEkQt7MEj/7tPyeX9sX/pdZ8/6bQz6dTIHTMR2zUlE6ZBk5x0XnV0MeV9R+8366lWpks7QZ6pmWdJdF0N8u9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792413095; c=relaxed/simple;
	bh=8EGxWuYlQ7OXKhzQbvph7ohelP0EC9V3y0OQ4e+V/kE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cfQmx9OVlK0QaIbwTnYQUVLZ5TkU+N3FtaqMjbHMKZLmtgeQzyG4GivYCECRqls20+b9BUVp+rt+gwr9naQTpjX5TDLCxLkSga7X6b1bpf/QCwKd4jCabdVgqoTKN2KXgO6zFwiaUN1J3WofLAhpBH37cRjo2tHBUk0jy8i+rIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PgXxb2lP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZAg1ldlz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PgXxb2lP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZAg1ldlz"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8OteV2752271
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 12:31:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	txESpfZ1KaTUu4rWKR+uZuZxaLU8Tf/Hk0bNSZQy788=; b=PgXxb2lPr8/6R74a
	4EMF60QmvDN4AltVu/aRXIWapYshPM/aRd4TppnpCrjI/2YXQZXRbZiG5jh3glSM
	uujC8uFb78h+4iejMiPiX452wkGFjRXatOYLOr3oX9r3bTTCqC/Ga4GV+DK3cAtt
	MJLjnjk0WlKolKmr0hV6zrQkixIrEl0RnSJMeQUKoUuBchNISoR+n72biJ1+KHhF
	rURKfkxtN41j3pfXzodr0d1rFmjtDh8ninwh9p9QNbkAeTmJnzo+mag9ngY8aOCk
	EJP7C+hrRL6ViFFbY2a3N85q3WHWyxjkHfgFuJMHXkW/kwToWiu7zmncNykthO2X
	bftmYQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf48h1jp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 12:31:13 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7cc081f3066so45526137.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 05:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792413073; x=1793017873; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=txESpfZ1KaTUu4rWKR+uZuZxaLU8Tf/Hk0bNSZQy788=;
        b=ZAg1ldlzUi6CYYY8ljiuPoxvdBkbLUKpE7q0SL9Bza0lpWYffImNNc/L/anl+JKhxP
         Fu54ET93EWJ4aa9s9UXD7nz/cfq2Q3tuH5dWa3N4051Yu6b++UUfkULz2EkB2KtKAiI+
         p3fTdw3KwES7/ficD62FWOD4UuGl8mpMAtVw2+rBIGRtEQsDfSwyZCCYSXw3yPD4Kthi
         cAL5qC6/6psfA0czXfFiOThsYq9SGUFx3vD+Av4b2S0vrN9E50XpYvnl7/k33YejISDt
         q2B/yX5NR668LgWk7zJCCghWS0X33yNOcrHY5sbdhlyCaGbueMChi09jRCaKw9XKDSyE
         8KlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792413073; x=1793017873;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=txESpfZ1KaTUu4rWKR+uZuZxaLU8Tf/Hk0bNSZQy788=;
        b=tG5vVscRHpZ0A2Icqkmj/9rDYTOvreJ8bD3ru5IUczlFsTam17N/qKmJkzEZdFYknc
         XeHgJWNc6yErjut2wL26cVQlYGzBl3Kw1eCKqAOPpXlG03wKOX3jJi4YxUvT9Ft+C709
         Z+0bexzDeXJGJb8Lf/DqP3UL4PH51PkRNcMP99WzZzymRrHQPYjhdphtTju9LkwEh+ys
         xfz9OMFLWedMRHDs9aYEELBvNasLzkyNW45yMfFjSWr7UgtQmEu+mfgbLXevqZfID5//
         rKQ7utzMfU7S5/WguQkRJ9/M47zrJJy+OOR68KKckzDwNxJ+z2LLHSO8b8t66uRJ9OgL
         2Omg==
X-Forwarded-Encrypted: i=1; AKwUvBwBOwpRvJfCcBod7C4k/gL58qAf6uv8pW1nFPDLDFLoGLg6BhBL2sFH7HUYqeMjH1yy4mpRHuol8Cw76zk=@vger.kernel.org
X-Gm-Message-State: AFq9FYK1RAPAROgC+1uKVf9CvjZiWeK14QB4kBfCqCRDnuGcfCcJnK4G
	rDKUHVzRneOsJJwwk1/NIIw6kcc0s1bu5w+Fby7wlRziLrEMniHryFxJdTvvJA1bTTth12QDX+t
	ekZX9qSZTHs6g0BQ6bCyArFwxzUQmZ0/n/y+x2D5qgplXY3aHmSeHQAsnNfxCrQapBQ4=
X-Gm-Gg: AYBFou3PJZOkRaAQSmo+2Na3MKPkSHDfk6A3DRMhWEoSELbUyp7H3e/rb09KfM8uZHa
	DyfXDVbHaDx5zyA4dMsmxlJgi8yHUkzw4+uDgumtGeGTDWVMdxo6ZKEKpZv+6WMPBwWdhGN5G48
	BBYW2FWr1DeneeW56A/iKPiFHvmGrrHTE+0zKXMqfzWYGSJfkKG7VYZmX4yTw43asXnn8U3gU4M
	dSNgR7xrWN9vQMh6J2kP36vdSgdq49gagLJipob4n1IbPduGGaC+seccHQLzewpRi2BB4xfQD8e
	jN9kaBJzgN2uHsNNLuJat32Y+rBWsr5PGvvWt3HXj6TToVZhVriUjSfLjVT0wQ+AERTyg/VRoG9
	k8z4p1ebnkw+zpsZnIfupRA==
X-Received: by 2002:a05:6102:50a1:b0:7c3:91f5:26d4 with SMTP id ada2fe7eead31-7cc369efc05mr1517840137.3.1792413072779;
        Mon, 19 Oct 2026 05:31:12 -0700 (PDT)
X-Received: by 2002:a05:6102:50a1:b0:7c3:91f5:26d4 with SMTP id ada2fe7eead31-7cc369efc05mr1517832137.3.1792413072286;
        Mon, 19 Oct 2026 05:31:12 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1ea48bsm3601007a12.35.2026.10.19.05.31.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 05:31:11 -0700 (PDT)
Message-ID: <e675b54f-9eae-46f0-a207-02580fd0b974@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 14:31:08 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: lemans: Add Draco EVK board
To: Gopikishan Thawre <gopikishan.thawre@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>,
        Ajinkya Inchure <ainchure@qti.qualcomm.com>,
        Anuj Tripathi <anuj.tripathi@oss.qualcomm.com>
References: <20261019-lemans-draco-final-changes-bringup-v1-0-dcabe94f1074@oss.qualcomm.com>
 <20261019-lemans-draco-final-changes-bringup-v1-3-dcabe94f1074@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261019-lemans-draco-final-changes-bringup-v1-3-dcabe94f1074@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA0OSBTYWx0ZWRfX6BpvFj3EsWnt
 uvBqZ+4uuq4WGWwAtFgqRYm23Amjo9LOMW/LIdd6V3Ea6B2q7ACvwF/PsQMpkpTysgW/mXh7vOT
 mOOtwlXEfKC5P2N8Wiwdvt0ORqNeQvbjxftkPE+YBsRt4VOdTK0+PXLlnTuX28MIYpz8QuquD68
 IJ0FeYqTjx/wxffFmV3otpa/+RTT62NSiY3O9n/PWI8A+RE4SI+oRtG5CJbzl2dEnbtvDsa55mP
 gs917TefPGejkFCF4tr5yFlXUENP0jq0gnsJxYqukkmW6Ogs8Wg/+lcj5J3AUdBnd+eaZNKXv0W
 +4VC07yUvBDRRt9SZQ7ifPfRLwLTheJp2rT7QlohEZG/05MsO1DMr95KmKB3O4ppI7APcx5CLFc
 gMMvPpX6Lu/oQF7ItI49kZ2JK6rZ4kUA5GoYbwr3oV8OpnqktwspJH5p6sZA/l/SNvx+M0/OHVA
 weS6fXgoJ59Lz8tva4Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA0OSBTYWx0ZWRfX4UB/ZVq5H7iA
 pxEv5bMSn5DcFOms6JfiCC3BZKMUzZf5T+aW8H3xpl5jdSTIa2Zv/9ba33aMsGpVbu/EfcozXuq
 khqfo+i/eE+IMfM4YGLmaxeISv344QI=
X-Proofpoint-ORIG-GUID: dv8N_KhHiLXR72t84nFLBJcPHDP_5ANf
X-Authority-Analysis: v=2.4 cv=Qr/LTlyd c=1 sm=1 tr=0 ts=6ad60d91 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=2y-c5VRBA9tA1ecnzscA:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: dv8N_KhHiLXR72t84nFLBJcPHDP_5ANf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190049

On 10/19/26 12:27 PM, Gopikishan Thawre wrote:
> Add the device tree for the LeMans Draco EVK platform which combines
> the LeMans Draco EVK SoM and Draco carrier board.
> 
> This device tree adds board-specific peripheral configuration on top
> of the SoM, including:
> 

[...]

> +	ethernet0_default: ethernet0-default-state {
> +		ethernet0_mdc: ethernet0-mdc-pins {

Please drop unused labels

Konrad
