Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792661266;
	b=Z7HfUegmtRaHJyxyGmcTUy6KepH5H2Qyd1nDE/Mv6EwlhD5Dbyec9mr18363zkS49PUJ
	 hxLR9g5hV8QiaAvJo3eoaLGFVBKJQMIWElyCzKRmtzJyB5pAOIBTafClD66uYszDYQtKU
	 ahgr2ZhwsGm4JY9l8foKIFK0KKfxhuYD8p1f1iK6DHcw/iFYTv63tl3KcfA12WKNa24Nn
	 S0flygrdRGYZMloF+7gmkIp8NtjaBXtBa4MG2bZlpbDOibyjxFQKmRhMN+07jYp5Bz+Lj
	 LX1v1JmiI8AFu02mbcCOXNT1yAgAD4wGmv3Tn4LV9UFwABQ1ttoC9YcHVkVR5kZGRiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792661266;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=IyT7fwjUNFNu0NAAjlLz6JQgqyL2WtB5iiNKLluFvCs=;
	b=5h0IWRyqxdblcQGquuemi9ea6rUvtkzaQOcm8WrigiXIv/TT3KXMP9URUP3JEtYBk55n
	 T684YaZPGnMu6787hDGxq+s8/ZedOj69KfrIF6E73bfMUGHv1emh+3Zm5Aertv+50BotN
	 2Fqdd1thCGGkN+tyAkWH5WcT/m2wU3FwH+VfmRYG/GPcC2FVRqp3Mc+WxlCLhsj3Oz7oO
	 eZCCUoqRHzpqvJ1z82e4+PF6sbUlObqJreAqo70yTHYlhjkXSozc5mjAaZl5uOMpkneza
	 8tZnWR+NPqDCOvgCGO/ul7Q3Q4d4RCPXdtIvGxv88zkgZIFxw8K+9iEdpsSX4kbGQzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=B4AbYG7l;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="fUe90/x7";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF56D606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:27:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF56D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=B4AbYG7l;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fUe90/x7
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M70ELQ2516128
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:27:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IyT7fwjUNFNu0NAAjlLz6JQgqyL2WtB5iiNKLluFvCs=; b=B4AbYG7lnrJgKWKL
	CUUYVPrPmNE4FBjdYSgr9aq+iBuZDvy0sDenENjOSKXWEHNqUOTtzs/L5Kn8y8O2
	WDkiTOtDdWKHHJD1s7FW6G06M9uKLGfYIrRk1nq+FlDKuyYbPhHz3Zkeg0gy0wRI
	0Um5szZwsNEGdxQuxJL+y4uCzkL7NC7NnyJ9TmOOPvXDwUK2ptMsWa/fa7D5Q5KN
	XYjiGFhjpemCyYc7Nzg9OVI5lWPHOmjzqcIAUqgisYdithFBlUZlc3MyrZKPV8D/
	LZTQjjpvqxQvCO6pYOHfZC5JNdYQ93scOC00E2rnDwa2EwF8Fnh8zBJ761i6c2PN
	AcaE6g==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93a9pw1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:27:45 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cd0b795aa8cso449397a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 02:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792661264; x=1793266064; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IyT7fwjUNFNu0NAAjlLz6JQgqyL2WtB5iiNKLluFvCs=;
        b=fUe90/x7h5NtO8907E0Vn48jVBFXS02qeXA1kT5Ytkto1Y0MxyFm4Qx546k/ErHQfL
         wtYc4oWP+ZzBnIU3Mr1/jDDvEhPrEC0ehwegzcZkXQu6IwdR33OAeAi3K6jNG0rXQjmz
         1EqF123mAFlL3nnC/hpDFEf95If/Ox/CVvOUc8qSR9scp4SLD90qojxXD1ijoCt3bccx
         zYRSL0R3igNGP6LjBeKrOYWM+iSfULDC+LEKy+T4gyMD2bUiSFQ4XemBCZPAVA+Covoh
         T01jP5m61iPtNmaH9o2QHeLj7Dr+NFF6iHV95JiS2Yqqjh4l0Z1Rzw6WinJSOdN9PfUQ
         b6VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792661264; x=1793266064;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IyT7fwjUNFNu0NAAjlLz6JQgqyL2WtB5iiNKLluFvCs=;
        b=AZTwu+zcMwCa9Gj9/7g6EixENLi1u33SPU2ctFwXcNzoQkscb59gzDJB8RTiXkiADy
         yVy8TwX3KlsrJtUeKi8oP7oqCZQycCP4JT0nU+sji9mmO56ZA/gVdf+aoVWONhBbd6Gl
         vM4c43KsMkIpqCOKTD1A+eycadAppne0ofetIT2fEspWBcyZPER8sTdoAIVHSilxSw27
         QYwcNC/l7WMn1PyZqqBDjeTX4NjGalwQS01PfK9MD7wPVsgx9JiKPmmNTTQXE2na55Jk
         N3ZaiqlQZKKdhjHzxMd6eokmgymC7raw2vOVoz1dswtNRhXs6YQ4Si2RnY6IqqQzXDh0
         55ZA==
X-Forwarded-Encrypted: i=1; AKwUvByg58bu9a9TJ75y70d8DLKS46Sp+FXKUl4b3+T39x47jqDtVB/OMUsVIedytnx59H8QQ6wMxtfTTQi3+UU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLBSDxwcnnApGZ46xyA0S3PwcYMI4vZQKbDhPIfXoNYsR8CkQDJ
	8y1BPHYs7Z5GueXZRs/dE8udAYNdWC1C0sv+eU7r9XaC1Aa7XozJJg+clLmrZ7WoCkz45Do0NAc
	k6X+QKZmGsiP/3XGeiBrRfn3Xs15X4ytjxEzXIgGmgO2M4x6Q8V/v8MbtyAy9D9AZYyo=
X-Gm-Gg: AYBFou2Q8HrPft8T8p2QtbuIWDsSBJH+OnWD/iWkh4Ju7JIohRuol7D3kRMV4cK/9IJ
	NBQAcnIyMJC4SJWlgBZP2Bgvh+nsiASPJ5MYf5OFxh++Y/DtlL5qsbpSYTKexNFeBSLJ2wag6Z2
	v98EcbwfHZFafH71Jk/pH7qNv4+9SQ5XBiHnWnHKQfByhuguh35R+FHd0Y7X2ugD5iH5fN+opao
	dXqZTemlMbC32hs+uLd5qnDWNTHoK1fpncBOaS+LuAiXskdbu8Ne1z+tBHTQ3IDYRjemoQl8q5l
	8Ff2L7TJc6oiYZq/RU2Z9nXx2S15/+WjzZ1IePh3Tg8dG/3wEer1vkkEEfSiUi3WTEa5zcEDOFn
	aOdS8KzDcVV6+M94UEDSGvj5At3dgiP1KtA==
X-Received: by 2002:a05:6a21:7317:b0:3e2:3de2:5947 with SMTP id adf61e73a8af0-3e2a09dde1fmr1349105637.16.1792661264442;
        Thu, 22 Oct 2026 02:27:44 -0700 (PDT)
X-Received: by 2002:a05:6a21:7317:b0:3e2:3de2:5947 with SMTP id adf61e73a8af0-3e2a09dde1fmr1349092637.16.1792661263974;
        Thu, 22 Oct 2026 02:27:43 -0700 (PDT)
Received: from [10.219.56.252] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd6b84831d3sm976688a12.10.2026.10.22.02.27.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 02:27:43 -0700 (PDT)
Message-ID: <28a4a452-340c-4ac6-afba-5cd39b370ceb@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 14:57:38 +0530
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64: dts: qcom: Remove FastRPC compute CB9 entries
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        ekansh.gupta@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
        arnd@arndb.de
References: <20261016052042.3755352-1-abhinav.parihar@oss.qualcomm.com>
 <b0763841-cfe9-4355-b900-ae43d93dedf6@oss.qualcomm.com>
Content-Language: en-US
From: Abhinav Parihar <abhinav.parihar@oss.qualcomm.com>
In-Reply-To: <b0763841-cfe9-4355-b900-ae43d93dedf6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=JudkP84C c=1 sm=1 tr=0 ts=6ad9d711 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=OuD0wRZ8gfjUqNd7lbQA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: fqEYx-cp6ItjMqegbBZMfFpAqid1Wnva
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzNyBTYWx0ZWRfXxi13LSQxAdLn
 7Vg5nnMWwH1mmsjOuBrvjXR1aplKb1ByGfANuhKPq+hOOqxDI/XBKLW9kynBU7i780ZA0rOea5A
 0DQkmm/p2J2mxxCmE03VAtatw5vqO6g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzNyBTYWx0ZWRfX4inaYPHm8BAw
 /13N3hkTjfxl+TmtE1juZckxjuD18fW6bWPa5dLkLtF4Be/VfUzqJla6B8yl5s/rVIq4NhNsC4V
 +WNmTwgVn0nmfBm+DjzRtG40Kr7WG8dtKrEwiPSspMX0yXTfmgxtk80DTEjuBVt70Sf52hqILwA
 Ao+zFpQgIObHy3AHsTzbk0yUV6sZRRt/i9uyREhIGdi1+oCRBFZCJ8DyuK6tvFJ9/COgcWRWZVb
 yB9k2yZyPH8R4IEU3izjkIg2tYJ3x8lB51Vmrgfc8K+vWb2xSASqC6g3MiqUo9WzB5OI9vp7OGY
 r2RIGqsPS7tYtgZrVOjgFBgCh0INXDmjtpXdcDq+Zzlq/8gFtY/5ShEAAE1vcNUoPb2fyk5P6Ih
 qGwRP6wi0j32wZlkpwKru0lJ8o/Ixr8dSYtrSjB9PYgD6ub1Gxt2nP3Z+sYG9nu6wKBIoUzUr4Q
 Xi72mX08F1Yfn+8WY5Q==
X-Proofpoint-GUID: fqEYx-cp6ItjMqegbBZMfFpAqid1Wnva
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610220037


On 10/16/2026 2:15 PM, Konrad Dybcio wrote:
> On 10/16/26 7:20 AM, Abhinav Parihar wrote:
>> Context bank 9 is reserved for secure use cases and must not be exposed
>> as a FastRPC compute context bank for non-secure offloading.
> The lack of a platform name in the commit message and a split over that
> suggests this is a universal truth for all Qualcomm platforms, yet the
> patch only limits this to some of those who currently define a cb@9.
>
> Please make it more clear which one is intended.
Ack, patch v2 will have patch series including removal from all 
platforms having cb@9
>> Remove the compute-cb@9 nodes from the Lemans and Monaco device trees to
>> prevent clients from selecting a secure context bank for normal FastRPC
>> workloads.
>>
>> Secure use case support is not currently implemented upstream.
> Ordering this sentence before the previous paragraph would make the
> commit message read more naturally
>
> Konrad
Ack
