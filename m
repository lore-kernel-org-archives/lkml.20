Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794122576;
	b=j45wWrfKVUQNS4jFTjKKa3GjUM/BIV+R7bIK5KUqg3dG8E3a5KL5p5PxGmthldgM7li/
	 2XyiucfcQ/5E+YdlqcdnnIlwFju3VLrtx+4JAMnLhFdSRlxc1PTfqfwpIiHJcvD7y/P/s
	 QikYj1i0XOlTPvGNalf4CCs5sZWWNXjaJxgnTMDGZVcj2Iarzf/x7+nRR/YA7ySaOT0YR
	 ZxP0eFWu9aO2zFb+Pjhlsog8gpv/cP5Hw4siRd+FhAlsSNKO3+y4xoXBa1lTcdIps3g7V
	 SlKI2K9G9A+dR3j/K2k4Ot3g0n36QKRGdHyCqOYa8XckBqy52p6UyrLHBkonB1yq9ng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794122576;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=PyGRZT8lhbyjsAytyG/dL8TatW8134zpllV1HW3ktT4=;
	b=vz+MfcFa+m0qEDBwbRx1cSFjefEx0WvLHHUsmMJyRfqJkB826vL3iwCt+K5lemXKzidq
	 Hphork1y9H9/99wUgWbMZPpaZ5ol9CWv+iNQKXDFddtktjj6vIYIXYsANxwceM3bewQUv
	 Vl2xChukssbhe5z1MozMOzznZZlcbNSoh0fjRw5VXfsTpMyuuKj4tvGTqaYoW6FP+Xm+K
	 udhikT5UTJCfRalVt2Yax9UkDa9Num3sK99OwjUP95FDOQDWtbs0+JeSy95MH8AKjRRYC
	 Cy/Ys4HLhcynUVdEV/3FNfGYfvzJmImWdN6jjxkWfTbsJB5D6fWimRXDcb+cjXgj6tQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jpv0f3js;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="X/Qfnwpp";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD772606A321
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 07:22:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD772606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jpv0f3js;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X/Qfnwpp
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A84LGCo438879
	for <linux-kernel@vger.kernel.org>; Sun, 8 Nov 2026 07:22:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PyGRZT8lhbyjsAytyG/dL8TatW8134zpllV1HW3ktT4=; b=jpv0f3jsWwKVGGEP
	vI+eJUQQYFk46IVeHaV72VIg+FCEM+q437YWrxU+mLGslhG46WMtops6k/ebvUZa
	Leh3dM4hNfpiD9QguXbLxP3Sue/8L1OaIgIeoxcDeNLeBI2krhszH5XhWah6wsuu
	IUexpZtZZy84jsR2Aoea1TyBHqrkhqAJOodN7fYxTQjQkY1kP48bQoYbzXl+cMVK
	9tnE8KvUW7Re2Iz3ZOw6wwrxdyDlOYhlJKWYbZtuDuzOjESthsd3ueVmD8xBe9bp
	ANqbYKCYWWbaG3k8JwmTcMSj4QzPFsckuJpqnH8k+r7UX94VRHadstoqivY7RfPR
	PKU4mw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsv732dk4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 07:22:54 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36d1353fdcdso657132eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 23:22:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794122574; x=1794727374; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PyGRZT8lhbyjsAytyG/dL8TatW8134zpllV1HW3ktT4=;
        b=X/QfnwppEic8gY3UqvCSAeWiqKoTe4eYncln5PbAmdenODvFNOjFekIHA0IJ1augj7
         reLsJ9Gc7tiykeK3iTnRxuC2XtxXzvRtCxTyvnEJnta1Ho/iptifK0mbKGPw4dMwwVzU
         jX8sep4cCQUQPG3rgAGDh3J0fsvmcj4QGgjOt729/I1+cHYDNmhwTmn4jX5joZKRVISC
         U7upCSpW8bLn/FDwTgONzoTllUR4iJhJflwYq7OCG+MLA0zh8DRZKlWUZizZKHMaYZez
         TumXnWrTt1x2QDfEELmb34c2mO/tFd+rXjIVbPhquoGg1bbotKOB2sFCZfB0yR/pO5UQ
         cJbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794122574; x=1794727374;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PyGRZT8lhbyjsAytyG/dL8TatW8134zpllV1HW3ktT4=;
        b=FE2tA7cuiswh8gsSGTqyHaZ7acsbdUICXr+ffMLqXmYZLdDlfIM4/YJMCVVOCob3WM
         aOyJVbTBnQDDaak/5V3DJLT6zyskcMLhDb2wjOJHxU09VQAsIX2EOo4nZcaKawwx2R58
         jUwx1gsZIT10Cw2rbfEhyH+QAexuXoieiPyoyKQMMltDZkmKgpQH83QsIy6z7PfUOUc0
         mIKYAhTNM1ZU5r5qBCA7D5j0zxGKVLRUIic4ifPaBSYpBWpwQxKKCM7yF2/PB8CJx5Nr
         QVXKGcEMYJzV9zK4OdEE4F7CuCeRUzKQo+wfsGroTyGHRgtDCqDWchvQMJkleMJ4tI9g
         Jn1g==
X-Forwarded-Encrypted: i=1; AL+hErHHJPgcQmmz/WhMmmf55A+WyE546100GVL4M1ma5yTytF5G6Vwi2FBevv+6YSlsas9v9VDCLtzD1qt1N7U=@vger.kernel.org
X-Gm-Message-State: APuU4Z/qBZ1E0Ea+ukxA7m6A+VCaDXv5rlKwJBDTZcDN6q4g4HlzQ+Vx
	wYN6GdKLQRm0sIX7LRxzpHTldIQb1mMvjHkjVSbO1fUkGOiDTp7vS9suGlEf3U+zSJC8qQRUa2w
	pSm7Ij8Ds1fRzIQYY8SH4pWBhesBq0QkL5pg+oCCd5nfN4D0NhrI/f9TCSrH7nndon/w=
X-Gm-Gg: AYBFou0SKj2LQ80w6puSrM7/h7fRUPrv38is3YnffvOtBfdyZ3YaihvhKZQC+auaxB9
	/++ocTr1pNZ9+RIhkEQpl+djxR9bwCcx+kx7QYibKxcRCqm+VKN35Ps4MRH403+tfI4SSuvOS1W
	ghd4WUiFkC84hWbcUxeOkg/yJVhjv96M0xp28org/D2W/JmVX7cNAkynz43Ey0jANI6fcxtdXJy
	c4OVwQPx/IILS2a4qvzPStZnCO64RaOw7n5KjrncAJrWbdHOPhPOh68sX+HT5PCKLEi8F7vEzEF
	VXT97SpFaxiCg9QqGMCseJcXccd+Z3jMYufkCsr/r4bVUQsZzP9ZsMwrGSBXlTPWpYMCESbNLmF
	C0QGd7SUk42Gf97t3OLNrhhT5lhuhbFimKa4FEsxZ9XGsH6d1ygbLr/QCpAA+s+m6hriqJnoSca
	64gcA=
X-Received: by 2002:a05:7301:730e:b0:370:a11f:dcb7 with SMTP id 5a478bee46e88-372579ad46dmr2084879eec.41.1794122573934;
        Sat, 07 Nov 2026 23:22:53 -0800 (PST)
X-Received: by 2002:a05:7301:730e:b0:370:a11f:dcb7 with SMTP id 5a478bee46e88-372579ad46dmr2084856eec.41.1794122573331;
        Sat, 07 Nov 2026 23:22:53 -0800 (PST)
Received: from [192.168.29.246] ([49.37.135.186])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37265618e11sm3280847eec.7.2026.11.07.23.22.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Nov 2026 23:22:52 -0800 (PST)
Message-ID: <875bc537-af18-4d4e-86d0-9bf0ed7992db@oss.qualcomm.com>
Date: Sun, 8 Nov 2026 12:52:26 +0530
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
Subject: Re: [PATCH v2] usb: dwc3: Update nominal max votes for qcom usb
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20261105100626.2003771-1-akash.kumar@oss.qualcomm.com>
 <e2847855-c096-4aac-bc85-386f5502131f@oss.qualcomm.com>
Content-Language: en-US
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
In-Reply-To: <e2847855-c096-4aac-bc85-386f5502131f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA4MDAyOSBTYWx0ZWRfX0bMcE7rgoxC5
 qZ3nvXEbFvJq9747QY7hqr3zIEpMd3GSoV4u+FbAK29uMiVHkXm3NiWgprJnApd4RWSvAJdcle6
 RK93kU6/nKEwRGOwhIdeKU3gvDN9LHIdQhZAUtuCYfjYFdlNYaZA004xNKPtyFpTStWOnsnqWMH
 UxvRh5CHf5TKr6btcSJHSgqwhlS4TLi7EH2c/0qv/8wOHhRn6kSMDOp3l1u46q2sN2rfLeq6jwe
 7vrkMasZBRxK8KxCjtOTlWyRkPaNgBu1S/xIXiep3hF0dhZrdAgQsZNQSdDUwUnntvkpBKv6jYv
 hSBo1PuhFUQ9VDfDmRDugxpGrCLXvsRfE/gATAZDSB3WA0ZdvhRbzahpTGzhc3FEMB1IKVftevi
 02XwDPVT1PAEPeOik0Qrq+Z1dDqpwpSy+H+BWyyxQvChTLgwwlhiWZ7jGIJUHoonFkaB3J/Vk9n
 MJnDem9WE7oCZ2YT0Ig==
X-Proofpoint-ORIG-GUID: F1fsNNaKJ5suj8uKMn3O1gJ2jeWPuwi9
X-Authority-Analysis: v=2.4 cv=bcb+w+PB c=1 sm=1 tr=0 ts=6af0234e cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=TqP+r86b5SBipocsz4eaag==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=n4YLBavcT-XMWCbpQ5sA:9 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA4MDAyOSBTYWx0ZWRfXxYRbgu2eKsCD
 d3XV6T1ugctBBrORjxdKyP4omBFuAGIqGmMHijbwA0UsrlhzwccF6n5tDpFzKakTHbHpCnZr6qd
 +jqW215+OlEhd/UEbMrEtDnX9tSFQjw=
X-Proofpoint-GUID: F1fsNNaKJ5suj8uKMn3O1gJ2jeWPuwi9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-08_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015
 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611080029


On 05-11-2026 21:11, Konrad Dybcio wrote:
> On 11/5/26 11:02 AM, Akash Kumar wrote:
>> Increase the nominal max USB memory bandwidth vote to let DDR scale
>> higher within its nominal corner, fixing glitches seen during
>> simultaneous USB audio use cases.
>>
>> USB_MEMORY_PEAK_SS_BW is raised from 2500 MB/s to 4500 MB/s (+2000
>> MB/s, ~1.8x). This ICC vote does not by itself determine DDR
> Can we scale this depending of the real speed of the connected
> device adjusted for the real data throughput? i.e. if we walk
> the tree and min/max as appropriate, we end up with say 10G
> wire speed, out of which we can shave off some static overhead
>
> 4500 MB/s is 36 Gb/s which is way beyond what USB3 can do, in
> any configuration.
>
> Konrad
>
> Hi Konrad,
>
> Two things worth separating here:
>
> 1) The ICC vote is not a USB wire-speed requirement, so it
> shouldn't be compared directly against the USB3 line rate. This
> number is a DDR/memory-interconnect bandwidth vote; the platform's
> interconnect/OPP table is what maps a given vote to a DDR
> frequency/voltage corner. 4500 MB/s doesn't mean we expect 36 Gb/s
> on the wire - it means we want the memory subsystem's bus matrix to
> have enough headroom that the platform's table picks the higher
> in-corner DDR frequency instead of pinning it at the lower one. The
> vote intentionally carries margin for the aggregate memory traffic
> of the whole USB subsystem (descriptors, buffering, concurrent
> audio capture/playback, etc.), not just the raw bulk payload of one
> device, which is why it doesn't map 1:1 to link speed.
>
> 2) We do already have a speed-based split for this, just not a
> per-device dynamic one. dwc3_qcom_interconnect_init() picks between
> the HS and SS vote pairs based on usb_get_maximum_speed() of the
> controller:
>
>      max_speed = usb_get_maximum_speed(qcom->dwc.dev);
>      if (max_speed >= USB_SPEED_SUPER || max_speed == USB_SPEED_UNKNOWN)
>              ret = icc_set_bw(qcom->icc_path_ddr,
>                              USB_MEMORY_AVG_SS_BW, USB_MEMORY_PEAK_SS_BW);
>      else
>              ret = icc_set_bw(qcom->icc_path_ddr,
>                              USB_MEMORY_AVG_HS_BW, USB_MEMORY_PEAK_HS_BW);
>
> This patch only touches the SS tier's peak value; a controller
> whose maximum speed is HS is unaffected. It's set once at probe
> based on the controller's maximum capability rather than walking
> the topology for the actually-negotiated speed of whatever is
> plugged in at a given moment, so it's intentionally a worst-case
> value rather than a precise per-device figure - which is also why
> it's sized for the glitch we saw under concurrent audio+bulk load
> rather than for a single device's best-case throughput.
>
> Thanks,
> Akash
