Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE32A3C0A07
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 06:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791526700; cv=none; b=lxC69DeCnbKPvFvsPuf61PvEel6HYhBQ2tt6yh4t/zhrDUllR3unz4uWbalGZrYZ/XWkoTj9KfpN5p8lKPS3gW+5yzH25jm6TmF/EPb9zDuEORpQmrf3XF5oNKk578sf0OFswE+2q2ksFnZAKLuZkh4WG65dBBfoYXmMQW1qBRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791526700; c=relaxed/simple;
	bh=rCY7+48PTkAn540OrQ61wjv1+BXj1jS0fk3ADRA/nqo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rvoQ+nXfCUcl0bsurlI52dQUEETvqOPQeks5jgrPHZGWQ2StZNrE1Jkuj9qQ3xAdoTszJZ7QWqPC2TkGD/HZn+wkMjNNaEq4YgQKRfyq1hEJ9n3piK3P/m8qobZ9tKhex6K74iemZmX7gyoLxMP/60jrjrM/oARp89SGs/meocQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nj4wJ++A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C4SaRm0H; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nj4wJ++A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C4SaRm0H"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6993HHrm1712706
	for <linux-kernel@vger.kernel.org>; Fri, 9 Oct 2026 06:18:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C+cpcIHle0L9Ji+owdA1hX6Vn5Za9wzxxI+3oH/nAuU=; b=Nj4wJ++AJBKvafj7
	36sQsQxQuxtaZbp8bb2yzXlY2MXYJanP8gNDkUYvsE6JGP+yHihygc7EvOdNV2Na
	qEU6Ov1gqEei1UIuYuo9fNTUp0fxHWVneHFhIZB7MDIpwb//rYXmKQWQUvRQCFsS
	vOPkWhunL1aChSmVhB8Qfk30t6CURg+GRip0mBUUpFG4mZUFVkXzRXTA4jlfy8p5
	Ov1ikNuMTN/WaS09IaGuWR0Ij3YvA4LUqSaSp+yHbWdvCEp06GpbuBSDfKeWGpAF
	jPB7C7g4MbzyVimmRz+m4cQN74VfRf+4A9m3IACyT2uevUBM137hy5uCc2YgeFB/
	lE3oXw==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fxwa7ft-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 06:18:19 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-151ba226e1bso9047725c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 23:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791526698; x=1792131498; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C+cpcIHle0L9Ji+owdA1hX6Vn5Za9wzxxI+3oH/nAuU=;
        b=C4SaRm0Hoc09ZYcBUd14GJSTy+KyHJgJkZiAdLSXrz2h9xFq1qqVL5CnKSf8qzHcqg
         wgRMdH3P/lwQ9RUgo9tPfXf1Bkg7PCVNqABzRghcKXqWWnnD7+vmMllx3gPosQZDPN0G
         1mWJTVH+yXFh0RcC3FRlRzCqR9zaDtYmVsi7mzuRnyFR012JYUz5NxgBXrPoMZGwwtNC
         oDgRvsFD865Y5ir+Z3HViXiD4H4CiEnEKoVC67+a8bbFVXImHTBUEQ+y1NhaBOcIqqa2
         3H7fMQPdTSyZTPJsK+TOycUVoFKQhT+X/P0JC/PK9FbJpZA7BPA3wFHLd6AhBNij9x4a
         recw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791526698; x=1792131498;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C+cpcIHle0L9Ji+owdA1hX6Vn5Za9wzxxI+3oH/nAuU=;
        b=nzLt5OThaay6lcFPtp4uQ3qoq7vhLXF+ruTklnA+JDy8n08nQogFUiz0M3gEG20uX/
         dv9Kwo/BzFsPgHoWKQRtvBBDMsIB/sTTjmGW9px0UMqbNxs44UKtyNiz8asyINPAL7sh
         fDJBk4WytwhsS1Aw2iUOl8VmkepQq3XzeFxcTY8/Qu255GOI/SYgJi9cmfz4RvyPcZA0
         B+ErjZ7fhjwcaaS3MkbxXLHAmlneWO65rwfZITc0mrswtmevyqFeRRZT6OV9asZuZBu+
         HAkUBo4Q5yPL0hlgH9cnt8V5Jkc4e4QNeE4g1fBtOXcXWyYvpoF2GOKkrLd44Jqp9ulf
         zWLg==
X-Forwarded-Encrypted: i=1; AKwUvBxvnZ9fkVq224C0OQv7ShRKelbYvkon7kkBHdcAKAGi8KISRWA215UC7csjUNg+TLx0iDzjCxHf/9Zw4P8=@vger.kernel.org
X-Gm-Message-State: AFuF++ntvPXw9ymXWNejpGPw3UUUF21sMUECgh4uUxPw1B8uxUGKNA9h
	Tc9p2znKaYzp+GjqVPw3JfPVcyHtMGYiD9iIjNRF7KT0bmA8p2Win2MlcP9IIxOxomRlDTT+XOu
	BW06Vvh6kVc2pzBeSSIvrYndh1vj0K5utrUnMHofaCAj4vxHUx5Gxx1Eo+ZDoS5Sy8f8=
X-Gm-Gg: AYBFou29qNSpjn7ppskmlIwV+jWi+FD0tKkMavMA3JCIU4hcpCQfzs5w9Punh7YTGVU
	D23iYLdMmgrwsM/t8RyoMXThJvGPweP09XJw7zFGWKAimNgZ09vGjhjz+ajl4FG1hFNZoBsGd01
	O/o6oKTxnBEDhGfkAYoq7mLmN7+Otw3AQfFk6/SUddRBYhQuq6ViH7FwT4pxibujHmOg57iu0CA
	tXLQm/PiXryFtjbaWRRfCZl40x0JeLx5o1mIJK7L+R7/GZef+mhf7OcorCuSnlhTAMNX+K74qLH
	r5vcRtAezWeCThP5Sqced6oHFLZ3Zmvz6CqLasNneC2VHihUVWoSFhtU8p/hbn9+IZcMRro7n3A
	bC6FZrrKgULyDMxp9NGOqiW+P6SyMg4iT/c6vXA==
X-Received: by 2002:a05:701b:4349:b0:15c:20b8:796e with SMTP id a92af1059eb24-16a5f112b00mr1097315c88.22.1791526698146;
        Thu, 08 Oct 2026 23:18:18 -0700 (PDT)
X-Received: by 2002:a05:701b:4349:b0:15c:20b8:796e with SMTP id a92af1059eb24-16a5f112b00mr1097280c88.22.1791526697566;
        Thu, 08 Oct 2026 23:18:17 -0700 (PDT)
Received: from [10.218.21.154] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a31f6be0sm7716862c88.13.2026.10.08.23.18.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 23:18:17 -0700 (PDT)
Message-ID: <394cbef8-e993-4741-819b-bb074d4c0d33@oss.qualcomm.com>
Date: Fri, 9 Oct 2026 11:48:10 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] ASoC: qcom: Add Nord audio support
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Srinivas Kandagatla <srini@kernel.org>,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20261008-nord-asoc-driver-support-v2-v2-0-0b6f7e94060d@oss.qualcomm.com>
 <ashIbH52KeAcHeML@QCOM-aGQu4IUr3Y>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <ashIbH52KeAcHeML@QCOM-aGQu4IUr3Y>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAyNCBTYWx0ZWRfX+0mLJAGUdARQ
 3vYM8FvHqoP77LUcwfPJWjGsCL5+2xq6dIm0bnNJOsEi42ZAHwOp47JnvtlgWKi4wkkYUkAF7oL
 NnBQ/wpWk065xiWdKYBftXwalpC48AgwsFR7fOHwQWkWoF0dLL/EsCvvfS2/DKg7/L5BMuWn3J8
 pmrtmlS11sJhhnqTMCjGGizmwc7AcFd933U1dMhdW45kGPhgMliljcyXkcD0ff5J75fh9mnTgiA
 t/Gm9vU8G1omrLzZegEqXz6erdS2QYUdxWQyS5Jh4MV6YE21Zrtvu99C4a/JRFgCELP+rr1aK8X
 5MUNwkROLuITv72eKGYoRa4ayg7qnRmTo9Td+xXtJidLYPqNSYFy6vD2SSeOjRbsaJ6lhTgEmB7
 lvQRpPsewojPO2BDQ0wH2911DlM7rdycpo62Xv2OnokzoU3cXFed8sM5FXJhGBYZNjNL9vQqBKK
 3jbmgy03bHMx8wNJQlw==
X-Proofpoint-GUID: XwPvA2_u8J41gnIGxDiH4wZG6xQlSb-9
X-Authority-Analysis: v=2.4 cv=cMB1IVeN c=1 sm=1 tr=0 ts=6ac8872b cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=5CsdgRGpw5DW-Y5J6h4A:9
 a=QEXdDO2ut3YA:10 a=Kq8ClHjjuc5pcCNDwlU0:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAyNCBTYWx0ZWRfX7jBr0Wkh1YoZ
 f3Rwb11d76coAjrfDXSCp7hJDrbobB81QjRKCEx7s1MjCagNHnsJLbsfsd153upHcdYPnQ1PZLe
 3afU+RlDLmtN2GefsToQv9b18PDlMFk=
X-Proofpoint-ORIG-GUID: XwPvA2_u8J41gnIGxDiH4wZG6xQlSb-9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_02,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 lowpriorityscore=0
 malwarescore=0 adultscore=0 bulkscore=0 impostorscore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610090024



On 10/9/2026 7:20 AM, Shawn Guo wrote:
> On Thu, Oct 08, 2026 at 04:36:40PM +0530, Mohammad Rafi Shaik wrote:
>> This series adds audio support for the Qualcomm Nord Ride and
>> RRD boards and includes the required machine driver, device tree
>> binding updates, and codec improvements needed for the board's
>> external audio codec configuration.
>>
>> Nord Ride uses a PCM1681 DAC for playback and an ADAU1979 ADC for capture.
>> Compared to other SC8280XP based platforms, Nord Ride requires
>> board-specific DAI format and codec clock configuration to support
>> the external PCM1681 DAC and ADAU1979 ADC.
>>
>> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>> ---
>> Changes in v2:
>> - Dropped patch 1 from v1, as the ADAU1979 codec change has already been applied.
>> - Moved the compatible string from the board-specific file to the SoC file, as suggested by Shawn.
>> - Added runtime PM support to the PCM1681 codec to manage the SCK clock sequence.
>> - Added TDM support to the PCM1681 codec.
>> - Added the required POR delay to the PCM1681 codec, as suggested by Mark Brown.
>> - Replaced LPASS DAI IDs with QAIF DAI IDs.
>> - Link to v1: https://patch.msgid.link/20260907-nord-asoc-driver-support-v1-0-997d3b20cf43@oss.qualcomm.com
> 
> I expect some PCM1681 driver changes in v2 to address Konrad's
> comment [1]. Or do I miss something?
> 

Thanks for pointing out.

i missed this since comment in Device tree. Will fix in next revision.

Best Regards,
Rafi.


> Shawn
> 
> [1] https://lore.kernel.org/all/d2d2feff-4823-43dc-9014-099e69195280@oss.qualcomm.com/

