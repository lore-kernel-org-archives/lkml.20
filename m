Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB5F739A079
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 12:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789561801; cv=none; b=oqNOs0xz2YpjAhZHzfEGBDb8mPTN1uR/yntaTZsOxP0gZRIvstVtnSDUrHSyBhOWV2SVGYDHxXFKwH3lavI20E8br5aqLvFg18oP9BQ9u7Qik8HmiwpaXPM8kY8yyOqqBg4bZUKGO38eCRhQyX233Eb+KHXBnu8mnutujqouMj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789561801; c=relaxed/simple;
	bh=VV/ZxcpkxyDx6mlCeBCzzhp0o6+5/SpiA7NzDJ1JKcw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lSqPtgoxU8io6TO/lHxBAT507c3C9xHoMcB8tHHOeHvU7DK0jrkScu9M+v9464FK6no/e0UBEE9NRgrA5zDkaHFuP3qYpaAFxszXV+LZiRjKbAb/gSTl+M+ueZ7tSpkw0MeyD0LPjJtaKZUi6ITTUoAyls34u5FAApsHBL5SQ3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dP707TW1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VY4kpfSo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dP707TW1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VY4kpfSo"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G92tVR1721192
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 12:29:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fy4R4SqF8jXijlVWnUPUTEknCsWxR9i03yH4i+tHqNA=; b=dP707TW1UpgrbwTA
	f85h4lARGOVSNaL6AoGJPaIGSa/dgvtY8P5biUxeEeGinIj7xvmq++s6M+NWSC2D
	nyCczuBCWqZ1Z+FV56f8gM503+f8YNRRyOz7GP+TTKFI3U2zMlx5tkSwU6RA61An
	RNHwkh5OmdWq56FmO+D47uqzpXmyfA4xXNpjYq98Aus1UJnp0afeCY2UiAcUQru/
	1VNaEY1IsmFufkTTeT99e+up2TSu1nmedOFyY50ckVf8HLqzlxlqb6+SGT1ymgvo
	PZMKossW3z+4YHyus9qFvyhHo9IeYxPgBYmugwzTMI3+i+zL4AQhQDrODl7Kj459
	Y1XZng==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqbmnktu5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 12:29:59 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9349ba88188so104568185a.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 05:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789561798; x=1790166598; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fy4R4SqF8jXijlVWnUPUTEknCsWxR9i03yH4i+tHqNA=;
        b=VY4kpfSozyowKdF6LHrxHjwUZWwwxQcdmGU3nqq50rRlbkHkXgdk9tlfefZ3BwW6bk
         JxYJfpLWLDGYGkGx9ifYNDH600l88cbhzE2UwLD33tmS1lQWs1p5Pwyjuox33LjPcaSJ
         eH8kBlufBq7JBlCA+HF1gtBwe5A7kmCeC0HecCd6HKdYmWQ/JmXtUI4hi/dfOPP6/uEB
         NcOkxYKAO660gKSezGsyDftxRBruW58sGg/TXHgrqEU2MoqRvhxaNe6osSggUejCykCP
         GNQe78arA/8hdzbvlLxkLFjD+TunFtLJOLWHb1e4CbJgi2nymWtYwSlb8+LBo8k6VYWv
         RwnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789561798; x=1790166598;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fy4R4SqF8jXijlVWnUPUTEknCsWxR9i03yH4i+tHqNA=;
        b=QscvbqFEvTbVlkk50OjvzR0/dOMj3i+j6MZyuRBA0hoxyHSkpXHrpnfUUnfanvdjL/
         kMQjyzSs/9zx+NUY3Vhw/BilAwYXWuRHa1ydd36TtDrQrtbpRb9W6DuWS9EaJxwR44CG
         XM2F7cwOzGSMwxtZ8DEf8G/jFOoiwHSRNbgDKJcrjTpl+pmMNg5e5AH/h6hLxsT8lgxz
         XASEwWR6xu2TRvamAiTevxZHYZ4hOu2oo8tiLrVaMvw23aXUjQ71g/MfwUZV0KjGAQqF
         qHpnUnIVl0qtj1oTfDzZnvErv+ma9hEQjyRS7HgJRB3mR8wXzZ6nofYOReNmSpv2QyVE
         LeTA==
X-Forwarded-Encrypted: i=1; AKwUvBx/JOcFTr9rDdfT4RlSaM1y0lU65EagNZpoLuNWtOLfCqDlNZwDXyNZpMHSHvgKwuXFPnY/+wgSTjOzV/k=@vger.kernel.org
X-Gm-Message-State: AFuF++kobsxUMKrWRvOckoaxChtHBFDc3O8Xfb+oifzjZkpONuikcH6X
	2zio+VkUvEgoGh1HJze145T9lh12X4TpCQ8aZQF1YK06OoiIc6YW371f4qjmHWlcxvJKeyrjnqt
	rvQYdoNCskCTBXHMXuRdTZCZy8jNEd4yYNpcVidf9oF+FOVhS+knrrQJwXpM1mOg2Eho=
X-Gm-Gg: AYBFou1cTLM8IEcOh8v4It8QAooajX6qSoawVZ0muenwxA59sv+rJRzFJOeBzJ2LIRb
	7x8G+UhdEdbE8SzP1fhZyxv3mAHlYbHHyGbzpZzUYj44fLK0+omYbdQKxqBg5NijLudj/UxJ5g0
	MOGsWnOkgh+5ZQWZMIPefnwTe/KGdCP9AN5vAo3+bTznF2+2KcIoJ7yLnFxvmwLnbi2BsqDmHxJ
	kBeQVAEMfDd4JmMlTqrXCnIFJfeKbVZOERk0NsVuJpObPfS9OsyYLClnSsawdpJo7jxadzityqX
	hLRrCbXp1DNrJtI8muI4vzhbrZXym7PSExe/zspm5QlSQ0dbEgKGW0SZByip6ICjOH5zHJDwVHt
	xEoQ/kIyhoEOLB4SCNsUHcA==
X-Received: by 2002:a05:620a:700a:b0:939:94c4:b799 with SMTP id af79cd13be357-93bb796fd75mr298861285a.5.1789561797884;
        Wed, 16 Sep 2026 05:29:57 -0700 (PDT)
X-Received: by 2002:a05:620a:700a:b0:939:94c4:b799 with SMTP id af79cd13be357-93bb796fd75mr298857285a.5.1789561797372;
        Wed, 16 Sep 2026 05:29:57 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29de63a7c8sm128217466b.51.2026.09.16.05.29.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 05:29:56 -0700 (PDT)
Message-ID: <85d212d9-533f-461c-8af2-b8771a4c9b8d@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 14:29:53 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: glymur: Add Asus Zenbook A14
 (UX3407NA)
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Nicko van Someren <nicko@nicko.org>,
        Chris Pouliot <chris@pouliot.me>
References: <20260915-zenbook-dts-v2-0-41de8669a7a8@oss.qualcomm.com>
 <20260915-zenbook-dts-v2-2-41de8669a7a8@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260915-zenbook-dts-v2-2-41de8669a7a8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=POyaavqC c=1 sm=1 tr=0 ts=6aaa8bc7 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=iJghmAGICTQdFqE060AA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDE2NiBTYWx0ZWRfX6Pi2zM/h01d1
 SJAYMbOV0U+36a4P79scZKaYAbEF8N0XKRLlvSB2MLHgI0bcM+nUyP3PY5SrIp72rFJcmwycCvZ
 OShkZOdJfF3ECQhkGFPTdURAdBW+2G2pxSPP4WFlRwiTYL+/AnWF0KDcSn3p9oiCHAFVBixt8ED
 QJfSyv8bq0tI/Y5DcabiD/I0wYI6aEmk6H8rQckSDVq6hQ97tPIF0agcHRoVfnaK11XOapHctXm
 4Iay/GuO0MhY//FzLd+U0TbXMXvqnMVus5deIaeSGxRgqOGrPc1dbLWmS8ZzQhPhZpdfT//xcMK
 K9o64KQY9KjDOaC09GH/NPK4dLx4kT6lJCRRW/JXhP9sN+5Apg3oDFUwDylsrjydVMANQ96vpsP
 HFle7A2plHKI964EsO6fbKR8w/IgyiE+WLUQa24oJUaiWfgUGMAd8nucHrO8zxz3vufW5SNI7aI
 v/ZpqVb4C7JFEFmoobQ==
X-Proofpoint-GUID: AzCXj_Sw7YVyAvnHvLRvpbr4lxgh6-_f
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDE2NiBTYWx0ZWRfXz6RxAq44o1yw
 Vd/pDUtqj/6rtmvMne+ssTWkMo8a+FD8GSBmraRYMZNGodpWxVTZKzsouwII/jJvPThCMj9YVmM
 Vuqa8pMMPTTgb/+0OjSh8IR3jUZTFXk=
X-Proofpoint-ORIG-GUID: AzCXj_Sw7YVyAvnHvLRvpbr4lxgh6-_f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0
 suspectscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160166

On 9/16/26 3:54 AM, Bjorn Andersson wrote:
> UX3407NA is a variant of the Asus Zenbook A14 built on the Qualcomm
> Glymur platform. It comes with an 18-core X2 Elite SoC, 32GB DDR, and
> the other typical Glymur platform capabilities.
> 
> The Asus Zenbook uses &pcie3b for NVMe storage, the screen is WUXGA
> OLED, it has two USB Type-C ports, one USB Type-A, and one HDMI port.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
