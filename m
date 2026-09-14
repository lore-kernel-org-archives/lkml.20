Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5264444A3E8
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789388914; cv=none; b=Z1Z15pb1vG09HdK3Bwccji4InGbHYEzkJ8G3S3B0xtI9vvTy0VKu0taxLlYfK1lT0BPUSgzw/0RiUaU685s+CWpndjKlpvsFKLSajPsnTQcEwhCDa0GNxC/Q2NhJHJKQz9ueR460wRwDJqq7nje23zscdiJlb5X1TRD5b6Sh88s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789388914; c=relaxed/simple;
	bh=9DL0kYRPp1aAw5C12Omv4zJnYSX+EN6BhsllZoa07R8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h5+Mpk70agA5jTQtRTwPD9OpXBB7S565sLoyr9K35E+r4QAXPK4hnosUxKFmOQnnQO/R4vBBM3eGG9EI8Pel5WsesKC4C5bbkJeqmdEn2NvLkmnOeND+DcHXGQt7B8L9uyPS3D7oX4D5dUTPBY4IHohBqnMgKfqfrvrylVy8E90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XmeNuqhf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BETfhcmi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XmeNuqhf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BETfhcmi"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAmLGQ4032508
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:28:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fVRiChZYr/F9P/d74sBkacRr5i+5ai6D7md1w2IZUxE=; b=XmeNuqhfb5Iy7QlQ
	MzsyAC4FVsVPHbCsLxMHNqeqwwnthia+TawigQ+TgzFjV7mzmTXwBDa46Y4DoS3q
	SwgWHAhI+sRU8eNicDrpqVpCxxGtUcZ+X0Jp8tkU2MpgqnefDwwI58wTCgQCBzXl
	fMYSoboKQAdIzzMtr9szjkYoc4DfR+yybucbmj2wZcZOiyNLc3RvtxLnubKgLonm
	9S5lQmC7enmhbW/GEsT8CtF9YgG+SRkWWNcvdex1XfKwQuVc+h9gUdawdhVLrW38
	JH0dA+xJJ2ISR6ofhuZoRQphSSbZEKsiadOGXfTGvJ3RE/xoPaDJd442/BtCoyMO
	4/sVJQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpeuq8hd9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:28:32 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9349ba88188so54286185a.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 05:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789388912; x=1789993712; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fVRiChZYr/F9P/d74sBkacRr5i+5ai6D7md1w2IZUxE=;
        b=BETfhcmiVi7h5wVPY95ojyqVfTBbuAJ2KAJXvFyaz15CUNpZ3IKfbiAe0Za5mtkNyQ
         xROimNjJRe9ICTOF2FxWdv9d3S6X3TQTpf7Sh48iFLj6yFyI8YT1eBnx9f2os03D1WEP
         eIfvEwEuDYS3B6M7HfPdGgkpEXlbPXHlsX9X5+hMlc8xQJjJ6v/EWuvm9XOB68kMVVNG
         p071sNXVBmvM4I1slRPMcqbkOShNWHfPplFL1d1j2S2XRoDSmo73agQPNIBApAbcG3hZ
         deaDEwK4II4quTi9x/FIb/JXxSluwDNnwxesgGJ8epveSq/q/ydxubbvH/2q1iG6ftE6
         xqYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789388912; x=1789993712;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fVRiChZYr/F9P/d74sBkacRr5i+5ai6D7md1w2IZUxE=;
        b=IHgUUORs6A9M04HIwxCVKr71MsEQzsXYw2MKPdunNqKbyM4tAHvPAAPNlpADjA+fh8
         cDtA8o7RW0z0JxrFvwUjxl7YvlMufG88VA33abAC+LZifm7L1BNLNvbrO8YkcTs/gR+C
         COsQqR6Z+XjU+Te98H1mNdt4Z3NnxhmhyFvKGRMUZ9w7oaAANjPPcm2qK5heJjHCymqy
         ML4VQKh25oLEqGYYhvoL0JKmPjGzPYsrzw/uiIbSJK3VOnpFohU8uK3NnrTFfJgdsTyk
         gjK1vKaQKxXhBpUZY1FsZQrYhdXVU9//1N28l0mbT4MksS4wwQqs3QBG2fam4/XsccnG
         MXwQ==
X-Forwarded-Encrypted: i=1; AKwUvBwXfdWXYvEAp9pPp9Pv7NphP8dTO35WM/6yiUWm/B05lZIpal9/E2qTv5quQy0Md73B6/x3LK6o5dM49xo=@vger.kernel.org
X-Gm-Message-State: AFuF++nLxUMVikusLe1/V/jU6HoCkv0OXjw8nkwZWU5I6m7SE7OXGdvK
	Or6xtmNZxYtmLbFKjFadl51ikSvNqppOqoVEC3RP/uXe7SSSub9FesINM68yYVO7FZ90FsDmcf+
	EIqjOw+5EgwmQcGQgKEgAkW6cmjqwE0aHRDlHU4lWRoIs1U26bkAgmAfn4T9F2CdgYKre3GzaQl
	k=
X-Gm-Gg: AYBFou2qyBuMfw6Riuyw5mbQdax9Sabo2mosXfZcVJ3aRK5stuY6yH+5Zx241+FH5tt
	zB3rn8B8IP+cIGtir3UVPuCeIugfvQA/uur0LaCyOMvHMsT5pxe4u4YConuTuwnrq4uP0du9gUE
	szG1AvCr5DLzpbti3Tjm9+56Lcu2gfyTTTtOTjZG9op365bY1wrdJEoKtG8EEUeO+R42TIH6zMx
	PSCag+ZoCMmaRpH8uTRik1cMyK8OPsuFY/vyGdxbjdLACjdEmw27iC8/BJUmNyBH/lSf6xBpodD
	eTJbZd2iuK1ohLQrQCuoe9loytQVy9dDDTyN2zrsN3HX/z2TrwBFOPID6H6bZMDNlGU4CQsP6tq
	xafWcXEmd/PCJl93jSUQ4CA==
X-Received: by 2002:a05:620a:4806:b0:93a:19cc:107a with SMTP id af79cd13be357-93a297c2f9dmr279734285a.1.1789388911397;
        Mon, 14 Sep 2026 05:28:31 -0700 (PDT)
X-Received: by 2002:a05:620a:4806:b0:93a:19cc:107a with SMTP id af79cd13be357-93a297c2f9dmr279728785a.1.1789388911045;
        Mon, 14 Sep 2026 05:28:31 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2965c4cf01sm425149666b.1.2026.09.14.05.28.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 05:28:30 -0700 (PDT)
Message-ID: <ccfcfd57-3adb-4a50-bd15-6e2eb64555d7@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 14:28:28 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 28/31] arm64: dts: qcom: sdx75: Add domain idle state
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
 <20260914-b4-idle-state-name-v1-28-660c31187819@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260914-b4-idle-state-name-v1-28-660c31187819@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE3NyBTYWx0ZWRfXzXhIIqP+tapr
 ucSZlCHBhY6D1DAa8/Ne0EUmzvnO15s+t4TXlcmiH/GJ6bJGb0+Muyv7DWwvB5nAvdqaGqXE2AQ
 EchrJ/R0UKHQMSQkBIaVmP0npmktgny2QrruQ5DmrOctkNMilOXZWuuGRYsWwrjVJZc0VYx1n64
 yWG39T62JQZ7XO8Kk/6WDrTzaP1dHQa1UdTjUyT4hl21q1FBH84tOdXyhXfVlkCL1uizDABWcjp
 Yfz/25pvXotdkfKR5ZizgKjqWFaHuX24RNzfjep9icZhSczllVN6g53dI1rTgugjfXQvKTZbiaC
 GwQ3vf5bODWNyoEM4OXTe6uqCgVQXL4JKOk/c32zd6j7VZBlbs7Q//GRMhxiHW5lh3WmYFrd1Op
 r/M9BVjcmgDlCfNAVR/okgOMePa3L22yOgNt4oAkEW/bxl/WmvgCMqO78Nu/YrLQpmpx3lXQ4aF
 o9r9RE4Jmxw5cmzRDTg==
X-Authority-Analysis: v=2.4 cv=TrFzFzXh c=1 sm=1 tr=0 ts=6aa7e870 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=Dm1D3uWegqzzbaKFt_AA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: bNdnmW3-oA4mDctEA4rBNHw_tgIEr_Ij
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE3NyBTYWx0ZWRfX4fklR01/GAwt
 1a4OOIT7SUVzWgB9Z+ORd9Mtqw5aMDl6w2ixbJjrOzQ/A22QD3/uCWXVEyquO8qU5ype5rnZx0t
 h4Q+xu2ksXLXnKREYaDcQ9YnSEvWWeA=
X-Proofpoint-GUID: bNdnmW3-oA4mDctEA4rBNHw_tgIEr_Ij
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140177

On 9/14/26 9:00 AM, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
