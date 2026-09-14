Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3DD144F576
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789388832; cv=none; b=Uy5ltv4LXXPnYY8h4jMXh0mO97HY9AbNiE8UbOkk26Cj9LQJ6zboez/ebbIwT634d2O8bwo92iNF+SnDui/y+m14N1+OQJItTS1yBuH4LEmFDQYvhO264sPgivsRHm43RnwIv9b1bWmYi55O5a6X88K7aJj8VtPvBi2XjJliPvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789388832; c=relaxed/simple;
	bh=kaHTc8mwyexifTG/gEdjPikKelXz4dglxqdNskT+sp4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I33hXNGru+HvchRzarCFn4S3H0eO3C+FpjNV3vwjVcL5jlPcDM/Tk9xK7svpfR1OzcKGsxlI3Df2U4nVw3h+bc+Lkk0kRXXXBZXAR95AKoeIyHYTi2lwUgpdH2oQzQYUCdRuA+kErH5BSyYeNLfN7aDu2HlBpO2pqOy1vPKkeJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KamH1ueW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hOevV7H4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KamH1ueW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hOevV7H4"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAm291901949
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:27:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Cu19DPEPP40HQZKxOJNhMMxBP7q201tiaMYjNBEzxUw=; b=KamH1ueWtT/sXz3R
	ZIqgwYY+wc2e2D3fr95NeUwEUxgPOBn9GIZ+/Udrklua4gniFqlSj49vwWw67ri+
	8iQpcC4sRsVsGovuxm1YoOLR33hNvAcXkMZsHkgYLaCRNl8ElyOx9RxkGvRFNA8z
	xP4jAzFXYVOCy2sWyae8A9y/p7WQxzfDtDSeuLO9NZuKYbO0Y/2Rk0KgcToYqdk9
	BaMXj1wgfK6sIKZtnK/Yb974XXI9aueSHwLR6WIRVJ1xrmf+UIBysleVj+2jEg2l
	MAmDhCPG1+ONGOiJSKuOiyTz3L5vAfyuYkzg2jNwgx8TfFZpqMEsYo0w66PUV765
	nEyNhQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpdevru49-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:27:09 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5bf9ff71075so152916e0c.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 05:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789388829; x=1789993629; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Cu19DPEPP40HQZKxOJNhMMxBP7q201tiaMYjNBEzxUw=;
        b=hOevV7H4yXtBg+474J0uovoEPo40Wv/wZf7MCv7tmRsC2va6/wlEqkMFungok9r7fU
         dg9eLfpwcMmDb0L+ko2PYN02+1hnBr7GHzEiJk0nbbjQ36Oj56+jbxWN6tBavwaCtc1U
         LyoktnljuShUhvQnbJJ32zwSNjAorS8lUKirs4xnANiKVWbchkW0uTSviyFSCbvqKsyd
         GxV7cKZra5LuNGjKAx0aK6Ryo7k+i+P4ajeD5g3ecycWdftrZ4NG6nNz0OjwvxmB1q+p
         E9Gxh7j1jPnXm6rra1gFm+W+qnjUj8glFXAI9lYjGzPlSH0jZZ66M4JQ/6y4a4hAd/YW
         W3dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789388829; x=1789993629;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Cu19DPEPP40HQZKxOJNhMMxBP7q201tiaMYjNBEzxUw=;
        b=M8uRlnLXaLtiHzYDCW03Dbnm40Iy4+hrQ4MCk90pQ4tpwRivqUVh3KfeHyruXMsnph
         ToUKu88MWU3sbSzQ921dr1vKfidgHj5GjQ3SxfEn/nTaSi1PpWDetXAPLUaHfGpwg5gP
         anFZTVKmAksioxgMTnWHIEOJBYv8l+ndzLHWFSu9SIp9nn9xr5r0QEK+6SXQk1nbK7V7
         qeCk0UvAL84v1gCIXsNYkmG9AFVDxc82ha7z9Rm8lwC892INW08hyncBkthDtCC+ZZr3
         LRGGGM9uMihTvZxK4jnLPm14rD2JA4JtRJcGf3KXXWe9ospdKd4dI6TZmu0aQZQyYNbD
         yn4w==
X-Forwarded-Encrypted: i=1; AKwUvBx5rI/jCXbb/KTcxjhbgU2KElfrsHDS/CGq0bt3qsyKaZe827guSpeKDnmvUi09z2JXOESYk9OQht7ASnQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nh2xBGpAySnoDEP69zIYPX58PmlUca2DXpkNy/FA+H4yCQZr5T
	bgmRKTVqyipnlK8RL/moq2h0H+oOaQ4gHudbrJmuGqAPKz5DBKvArPOCjga8EptZduTPOl0TfB3
	II97M9SiWYqCiYQPovetA9PysQ7RDtLn7j8foMCmaHb/Mk15AiF31DWi/yiszInlJIPw=
X-Gm-Gg: AYBFou0EVYJwvwKcChcoAsN5Qo+oZICQIja2X+CnmNCWn3lQWhq4Ogkyd54T48UBI34
	FJQNe79i2OcOyF9DV7JP/x86tpJ+BZgF0tD05vneu7xunrAVKL0QfkLIOVhlYmKGXyHqJLub0y4
	JOjr6FWZKUbrF6X3feJXtl+HH9aQ4c5OOPZomWaABI8WXrJ7pmWiCks7o+YVEk30+d41ydMK+he
	uo9OAGfky4InlwqH+EywU131jTO7sm0ri61888Zb2+9Vh/KEbwEXKCyvt/uU5oHQ3LNKRs8qrQD
	z0WUfmujuaphv29t9/foN0j7h1w5mvXJWfB4dxj/iCX/7RoGgMwssACnwzA+oPBJFBv+3EZicAp
	99cpBrGabjm/vNDpLENV9cw==
X-Received: by 2002:a05:6102:50ab:b0:799:e864:aaba with SMTP id ada2fe7eead31-79b58b76fc7mr377282137.1.1789388829009;
        Mon, 14 Sep 2026 05:27:09 -0700 (PDT)
X-Received: by 2002:a05:6102:50ab:b0:799:e864:aaba with SMTP id ada2fe7eead31-79b58b76fc7mr377215137.1.1789388823814;
        Mon, 14 Sep 2026 05:27:03 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a5a33262c2sm28658961fa.20.2026.09.14.05.27.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 05:27:01 -0700 (PDT)
Message-ID: <5a5ebd09-580b-4a97-b8db-30bdbfe8a81a@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 14:26:59 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 21/31] arm64: dts: qcom: lemans: Add domain idle state
 names
To: Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
 <20260914-b4-idle-state-name-v1-21-660c31187819@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260914-b4-idle-state-name-v1-21-660c31187819@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: nFNfAVeQX2n-AiyM-txjbNVQ68wtWqPK
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE3NyBTYWx0ZWRfX7ZopN7J+qGqp
 1bEOcI3XVFmWPF3+MX6x1ifw0mP+ljG7rKHiXymLzeC/GIBRLPuiw7o21ZyiqUU3HUZGAvNBcly
 4JYhJ473v6K0Ho1gOV/0TTsk1x9W34A=
X-Proofpoint-GUID: nFNfAVeQX2n-AiyM-txjbNVQ68wtWqPK
X-Authority-Analysis: v=2.4 cv=ftpJ914f c=1 sm=1 tr=0 ts=6aa7e81d cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=VzlDMD57B-Cyvd2ajsMA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE3NyBTYWx0ZWRfX2lovjCMIEvGg
 wOQx61AccT7AnH1wIZ/HApHVyEP/1Anqej31CVUU6sa0uFgZTCPuBIjAMVc5dcnimwMeZcsiN4v
 Bf/S0nxdPRAQgasvhIBxGNB93Dlibf9BsT/l7ayKWGKoX/bEEIm7PMwSOyIH7vsjF3/JBSsEPgo
 /shytbxSD9SRJOaeBBRMkgvGHnfVjSbqaLFmGjfYw9YLmGCkaJh4BQ2pJ1/EqsaJAD+BA+FDpVk
 HzTzWnxPtRAfMfszIbADHSJFqNz1NgjiR+0bABBoJfWYrgsOtEcdDkci/uLLVOsOn+irfjxVN83
 aalKHFdH0tHv+6Ujf5JqbGCGao5qco25bM0AXRHWiv0QyN6JLu+8SASYhTgcPkrj5LrZswrfatH
 CsKRY5M8V4yRVVl7lrwG4BgldlOmQe24X4Jx3zYfKRFNrkTiuY6sNgJXENq5HdxEkcuLDD+M31L
 Zx4YMmK5M54mfMeyZAQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140177

On 9/14/26 8:59 AM, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle states so low power
> modes are described consistently and their names are printed in pmdomain
> debugfs.
> 
> While at it, update the CPU idle state name to match the low power mode
> it describes.
> 
> Use a big CPU idle state label for the shared CPU idle state, since all
> eight CPUs use it.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
