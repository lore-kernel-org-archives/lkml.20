Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33A6D52CCED
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 14:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792072933; cv=none; b=f9oPd2sBq1/Tyq33MlD+f9jF6Q+EtGzyWMQtHODogs0k1JTVxzDTbjXJ6F+0b2zoOlBxql8ZgzlbG+GdMvsOpy1bqpHBV+fOzOqCYdyUwOOzIB2jlMf/xm1TOthGeREJEMeGGmeY5fEtjDMamQtJMOlillPs/CcxZep4NgkJA60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792072933; c=relaxed/simple;
	bh=schUaY7dyl451VZO8g3HhdjcVmhyLtyRRPBvzz1ZL7s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NjrBgon+qTgUH/+T8fWDt/AeVlYIvkeoQ3/zAQyQx0GIG1wnWz+sy4Z+WqeQiwEZZia6NUo9bRyaXw/qy49bmeEPm52ORzM2Jv4bst0/Jcxs07oXZpmrInBbtNcbcCVHVZV6lvXEdKxg/DQmohtaJeQ5ALXJyf9qzICSWx2+OgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kK71gbJ8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Cxlnd8Ci; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kK71gbJ8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Cxlnd8Ci"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9kHCT2999206
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 14:02:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Bg389eeTV21m7IPBaUUrgSXJpvs8Auq52lzO2Add3j0=; b=kK71gbJ8yc/chBbo
	iNBE/0tX4zPcid5HHbCO3s0hUdGfnBJ0oRLu28ZHZ1BFHUro8AxdUzXEVzJk+cji
	zwmwZrBg6jvt00lVEYVXrl9YCcz9cDeurFQMmvYHuTzz6epxRnFGJhb89pJmiWo5
	e67is8aQOPw/1EX+r9QmxXhnEniloENU5iEDUB3TwAVINYUUkHfs43dNZakA2vk1
	nklgXVULUf2gAT5MUpn1hnTC4D3dotEy/tIQSVdOQCikPyqcAwVHy24naRReeL0j
	uVsNNDlNTZBUYDePW+ZzCOfO5Qbrn4uPdRm3fu9XbV6bVQKi32aeFOpnHJamYucy
	M1pZPw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hausm19n5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 14:02:11 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7cc081f3066so22154137.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792072930; x=1792677730; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bg389eeTV21m7IPBaUUrgSXJpvs8Auq52lzO2Add3j0=;
        b=Cxlnd8CiYmn+BK9pKseYNQpV1JZYMOabwbLrZxz0iy/PNUICGpRvAufrSNTblK4a4F
         85TsrD4wJUrb1tqZbmfOiQsQLCTOnOqw40sk05rXPbNq5oHCOPqKNjPY8+KDgasc4K36
         QCBEYKYXbg/ujAsqLlMoUOA3Tm+c+aZ+fkzTw2arTd+SoAIFKtgCQ40DaDQA/Jid558s
         a2WIe0Zu8OOwSkq1iFD4k0MGAwnDMVz9O6kTFYNZjg+vXeLbvj4bea+cng/3YZuzNE+u
         pe6gJCIQgKjGM4+YbT2e929fG4GK+iipIAx4xq1TUT2OIbR77vSqYsmPXBYxpR2N8VQs
         2Ovg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792072930; x=1792677730;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bg389eeTV21m7IPBaUUrgSXJpvs8Auq52lzO2Add3j0=;
        b=UpC6qbWG+P3w0WK6lfqG0Oil+KWcqUgoiYfzRL4PeYvrhhiM46KBZILE3Cc/3UuUuY
         BOKMSzsHhZAUkdqfoytuEwqcSINje/cGBdvol9w3B6Ppqly00pyAlU3sEGR+nGELewbT
         TINuyLUlHN6LMPoNPb32lSm464SK0EwHobZpQGqksJfjo3q3/I84894rqCsPF9nWNMdf
         uwL5FVQqX7xH86nbF4+ZqiRdNYuUZMiSjwti32YEy91ngmS9/+TAaIEfB9HBFqq4uZJV
         oXBBSDUkbtXhbfuNLcR0CkY9eUXWI06FWYUpBovTvftwIKiJsNHM1WTTfGl8Msfw4Bc0
         poJw==
X-Forwarded-Encrypted: i=1; AKwUvBz0YdHgGEQ9tyR73hF3eeMANCUnPG0D4n4/PixdlCHlKJgD7FATAyUcD/yKLWOi4kBV2dvkDtgnSLPTTS4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKuVnTbhnUtzIm9x3iCRpg9I0EYzBO5pUbtd7OZ9oKogTSk2Trl
	xJKh5B7lNOVvTnlENu5OcHWL/i87PxxRQu0S/hr+QOr6LCnzA2xxfWfPJZVD/hWgZ6JhyIvO8dj
	kcTvlVkKZ9RKX6Fg59+03ApcvmVQyTLvhK6uNgsSRrmE/NrhpOB4Yjg4ilJH7izKrLYHkgVwzh5
	A=
X-Gm-Gg: AYBFou1Prk2YWOeIwhvTbzAsK+xOeA6svtZDh8TUsAx2m8eY1zsCf3oMY2WWNDKUt9F
	PfBktqvIBlXCy9trLi8ijrBPu18ecTFdok8eiqiILW2Vk7+vCjxe95gwCLFYvbw1HGHiervYA0N
	VWdMrQjsRiTgVB4evygcx8YVX+keUhvhVugQZOBn7ourspa5EZVwxzWDZlFLCJrHCb9yjLVTYU1
	3ENnuElyzEs7sXmr/KocyJk4acJPoxmT3/U9k7U4anqek72bZCe7I1Q3rMv3Lxnt/RJEr6KrNNr
	ukg50xEFn9QIRw8jce1QYpm0h+44RaDcg/jTbMM2gR7xP4asq2Zohys7v5YkmYR7TDOBe4btQPx
	QX7v+sYpp8Q5C3Lui7SS/qA==
X-Received: by 2002:a05:6122:2c09:b0:5ea:8fce:8a45 with SMTP id 71dfb90a1353d-5ea8fce8d42mr304546e0c.5.1792072930285;
        Thu, 15 Oct 2026 07:02:10 -0700 (PDT)
X-Received: by 2002:a05:6122:2c09:b0:5ea:8fce:8a45 with SMTP id 71dfb90a1353d-5ea8fce8d42mr304483e0c.5.1792072929078;
        Thu, 15 Oct 2026 07:02:09 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3ed9b3abe2sm129743266b.38.2026.10.15.07.02.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 07:02:08 -0700 (PDT)
Message-ID: <0d1a67f0-6cd9-4801-a25d-32c5ea043580@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 16:02:05 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: eliza: Add FastRPC support
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260916-dts-qcom-eliza-add-fastrpc-v2-1-95ed704ff268@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260916-dts-qcom-eliza-add-fastrpc-v2-1-95ed704ff268@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: wHpG9EPY_ywzw-1GJcNtAQbDRHQLr64u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA1NSBTYWx0ZWRfX7eFkFdLUrL1O
 Vj5QgBsa+OTep++W8lPU1VjFDX3xO4x7zeJzudPEOCjcCJsECk9hpRrjmNvCtQwCeZjHteZEhq3
 X2VBZilR728kVTRY6kOycdWdBAB6P+vkB2DabsDyK7Gpbk34ZRoGKc/oCkTQ03IzPbbs0gl+NGs
 ehJ6Mq5C8FMoKJ9MAvVz27xK5lEK8glk8WSwFip9H4pia4ajOZW+c8Dw+YePAeUEKZc9DcKptLc
 i/nGgXXX5iL+zsyb7ek5qDV006F/W4lej8L29KF6rakiIabfMkdLoqStEgp8Nkrw5re3hjHhbxh
 NTDpZUeMMDvx0V84IJnck6BSGruaE19gYJLa5BZzTYudi4fQbNqpC4WHW2+JRMAifnmGICHKq4P
 5dO7syXHgC5OUvwSb/UEmmJtYy9S9ChxdDHjNlnPjMiWuXZS/Z8+cmZZGGofoGEAqt6IuD38gjq
 0IEb5uBHivkrgYQ4ImQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA1NSBTYWx0ZWRfX9Y430qoCBm//
 yH+p0vQK6gO9DrN5MGR8Su5i/Px8Pt5MCBTdXIoysJiHRKrahKytoCv+eLNACZ0g3eJHa5F9gc5
 PZzjQr/iC2HB/fLNMfzxSyybW+Ubgyo=
X-Authority-Analysis: v=2.4 cv=Eb5d0/mC c=1 sm=1 tr=0 ts=6ad0dce3 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=YH52cVpet1kxF2CUr3gA:9 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=crWF4MFLhNY0qMRaF8an:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: wHpG9EPY_ywzw-1GJcNtAQbDRHQLr64u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150055

On 9/16/26 1:04 PM, Abel Vesa wrote:
> Describe the FastRPC nodes for both ADSP and CDSP remoteprocs.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
> Changes in v2:
> - Rebase onto next-20260915.
> - Drop the CDSP glink-edge description, as it was merged with the
>   CDSP remoteproc support.
> - Use the documented 0x1063-0x1066 secondary ADSP SID values.
> - Drop the undocumented tertiary ADSP CB7 stream (0x1087).
> - Link to v1: https://patch.msgid.link/20260721-dts-qcom-eliza-add-fastrpc-v1-1-cbea68d8e01b@oss.qualcomm.com
> ---

GPT tells me you should have a memory-region for the audioPD heap
(in case you copy-paste it, there are patches from ~today to do
s/reusable/no-map/ to prevent an unauthorized access after we map
the memory away through SCM)

Konrad
