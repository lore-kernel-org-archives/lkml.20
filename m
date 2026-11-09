Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794218903;
	b=4Uho0gCFQC7J2bfR0IM/GQvgaqYP+GD//WTjXSGUiY3VHLO+K5ENK49fI5N7YgsibYii
	 5dUyLn8aJlautn8bTRtGza08Y50pklZB1sWltdSa7onqwlSr3u+QLVT6jCehTg6TO2w2z
	 2BorhT0A5c/RZnsUE3UVa7KTsb6iwddh84n7bkVOTNrbGtD25zWLkb6y7Qht+ncs+IVE/
	 22NGhdGw25nkW6y8QL99iDtTaV4EtNT2ZYGF5wIPUxx72rU4zxrtHba+uP/grTqdibMOW
	 Wgs/mr6mnW83IL+k2jnpRwoyjIdU7TWT47kwE4/jyH4s/+JZ92hxCEF6Mpe3tv0bhNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794218903;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=jEMwXoUBBGwYTnnF99b0m/OVmdHCRRHD5q+loVQvwZ8=;
	b=Flm+lXQgqIlcdQF96sCzq/P4CNoIE0/I1MCb6Jq4wg4TKbl2RZlQdijX+53R/cgEhq/y
	 X1vOi6jCFBVOdWkpYm+peOTBpMWyZSqFw4aa2zRvmN1QYw09UwXuYwCQ/5Tf3ZboExGJI
	 EtvA5BmEbNvF3FoZPzlcleuuvAddAADWT/aV7QE5gY5st8v2vMfeAMLB203Ke2olbPbZr
	 as8lHUsKQ92LrJnlSz6AG4+T9tfvQLfnr6aaD9TkdQMYi0UOXmGKeUqyvStn3qCBNxyB1
	 hiH7Xrqs8yG/JwPA2DQsaVqzooTuHiUC5cwNxV5whIbT1TGTOHLonA/LAuiMZ2OTXAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BJyZ9oK9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Vwzal6ou;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED8B3606A336
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 10:08:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED8B3606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BJyZ9oK9;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Vwzal6ou
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A99ujrX3600418
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 10:08:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jEMwXoUBBGwYTnnF99b0m/OV
	mdHCRRHD5q+loVQvwZ8=; b=BJyZ9oK9jZbGrmHTJ6h0dhcKcwB2wVnR7DJWmapp
	cFt6kssBl83MnPzGtvjnVWvXx0G2Eg/jFmluQs8GXbha39cXQ7BVcRif6TqcdPQs
	Hd1d58OZqhu4PxLiYmltxEpSbmp+AYJshZmpNht+DEqtd9rtR9zdNv3MEipVLbou
	k3QmnDWSjzI0yl8121ZOLSUV6RATbNh0NqINv3S/e3Qf12dmLXLFAPg9g/nCiTBv
	fl2ApZwcel7+d0dOpIlo++2m2RJ0Rv+IO7NCDUUvElUBgmJuO75mSazM2vRhOtvq
	x0KiD/6OrrJloLwd8feUwHAew/74SKqxgLr2rbZBceXx9A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hua588ftc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 10:08:22 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f32050e72so76739285a.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 02:08:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794218901; x=1794823701; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jEMwXoUBBGwYTnnF99b0m/OVmdHCRRHD5q+loVQvwZ8=;
        b=Vwzal6oucKiKqcCTFKffwR5lEq9Hz9D3bE+RtKHObvKkv73vWSPq1QUuaskJtYUcLI
         0Ka5HqXBn0RUvmP8us0bk84uVuklPQN05RV/PTn5xQMGry3bg8qghqsrffeiME2WYlzq
         WBtPlaCyg7y7Vw9dL+lByDBM7Se3fG64QqcNVyJN1JTtYR20lPKXEsgiEb1zBBddr3Ub
         cSzqsU08o6I7LSAGLn/BrXb5fc1AVVlnoNYlYiW0otZT5n6keqLkGBnDdOq1KBSWinY6
         OB+NiyFJXU3a2a6bQ2VKfmPpPV7kJbSSDI+hqwFBYAfAk5CQ3pk09zR7gvHMlaeO3F1q
         U6DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794218901; x=1794823701;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jEMwXoUBBGwYTnnF99b0m/OVmdHCRRHD5q+loVQvwZ8=;
        b=ARkCgwyTS5Ik4IsnAtwoh99p5EpCNcAm/05Gh8EQvED2T4UrQoOmfE0tIFim+gUEu0
         5nPPynHRytNRwI2wcG3B/oIUuEw3WvuLPUya7iigDfaU62vdrMxqUDeS4hLDuDIvpj68
         caOI2gPL1URlKrJkbRwnMgLbwBYjr9JPo6HqAMYgTziHIM3ZBIoUonp+rrNtDtk4bdP4
         Q81mJB+blrfi15MIxUUtS1oBs+KSfFvt7A04UEdwlORba8hLwG8jBRVKyl28kQBS39Zq
         qZJGELW+OZuz6fgKV7zyFxkPTkdQqCVdIK63v5MBLOD0VB/TzbZ4HUFCBb5ufl21/cSq
         yZ6g==
X-Forwarded-Encrypted: i=1; AL+hErH2CivJwHpHMHiJOMcEuWfBYLVgznMbvGTOqBzdlQrgYUVhj/1J2tevcfrHjo17h8WmEwP+AQa8TKV20Ss=@vger.kernel.org
X-Gm-Message-State: APuU4Z/K3ihJAErjfC07t3iCrLwqxziasEGPH49KmmY07yTN8OC1OQZE
	qZEZ+a6AFOFIQG9waeoKh3ZqKLfpIm01sIunouzUTCpeakDtEbwtpptCsld09FoK9I/AP4L5Mrr
	vjxcscYu79TH1v/pKCRjcE4Ew808tUbgehePF4sIH4gTkQc0CCswkCs+ngJt23tKhBt0=
X-Gm-Gg: AYBFou0SiyhA6r0BfJovaLwTuTKgvipPg2VBJmyTg0S8kMuucq/XCqHNXvfdi0zyDgE
	4RfvEja2Smg79hcKd26sawCkrR9sVFJoX0qyKXe5ruQqX1fjsgLmYn7hBy7qHx3HOV9uR8xo8nH
	h60YlZHyLDpHcGB9nEVNiy8iWZ3zDgNy+MjdwqDDYwVMTkf5ghgfrC8M1oHomORNg42zpXDhefM
	AnLJmMqBjcEfcmLMTCGwiA8qOPE/Ks+zX8DSkE2VLJMoAIra4bpgXDV35RTMtavTlL+w8UcN7CW
	R+Crjb0ttSJ5SocU2q3hsJf0MHZIRTZDdxVqGsON2UfMglDj2rajVAH/IeMzobFZZQjVQFeQr3t
	l2z8T/xrTm0KaDY5ZAtd7rjTifJlAZzZ5hKMg0g+oU9vQPZf/+Yr9G6LOPFXonW8=
X-Received: by 2002:a05:620a:1794:b0:93f:35a7:cd4 with SMTP id af79cd13be357-947842a5cdcmr557723885a.67.1794218901156;
        Mon, 09 Nov 2026 02:08:21 -0800 (PST)
X-Received: by 2002:a05:620a:1794:b0:93f:35a7:cd4 with SMTP id af79cd13be357-947842a5cdcmr557719885a.67.1794218900518;
        Mon, 09 Nov 2026 02:08:20 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b90619bbd2sm129460515e9.1.2026.11.09.02.08.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 02:08:19 -0800 (PST)
Date: Mon, 9 Nov 2026 12:08:18 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: qcom: scm: Detect Gunyah by Qualcomm's
 hypervisor UID too
Message-ID: <4kxgqjwnu7qutjw5whtahbusa3shkmjy4yoxpypjy3vkko42f2@ek7wdjm47a3a>
References: <20261109-qcom-scm-gunyah-uid-v1-1-2776343f9a3b@gmail.com>
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
In-Reply-To: <20261109-qcom-scm-gunyah-uid-v1-1-2776343f9a3b@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA0MCBTYWx0ZWRfX1ZZaAL8yVmQe
 7u4KH/KfQPQC4RqrmGKtzU9M6+zYihz7LVwPFuRoEUvml/M81pe7QOiXikpDsfOTfDEpWDEODsd
 fnj5IZG97dxzCWFZ19JSLHHFxiS6PaWPoQCqkHlLnqHfhd6Hl8oceDTr2GpwJps4wZnrwr1qZ0u
 duTI21AxeScoibnclnXgNV2TvL63KkZhWfMU4Yt5Bgwv85cr83N5tDyFNcnIVxGoeNaxs7CRjF7
 L6B1bU3EusBR8I+1LJfsLdBgTu1fed9XMrAxe2Oh6i5Nd3vK918WdPkILS3o1Ia/U+dLFKfonw8
 V9f7DMGhW9KkGkKsxLYtD2FF1OTbL5KmVrF1rUNehra1dwFLg7k2kxO0es+fwABwiXfSaMz7JJe
 JK6HPRF/1AWgqM/PxLzLJD39scZLTuVPs+jGV+PMQxjPvHDwFNHJHNRpLLbvYiUvfRY7W4xaf0c
 kHEmDQwkv3EShpyc5KA==
X-Proofpoint-ORIG-GUID: d0F5jK8w2dX3rL8dx2nfVB5FnW3MAXjO
X-Proofpoint-GUID: d0F5jK8w2dX3rL8dx2nfVB5FnW3MAXjO
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA0MCBTYWx0ZWRfX9pf3+T9JAOz0
 drU87muuKdJBl/RPOMO8zO74PccY9m3Ofs5m0G0bBQ/QIC2mFc8RpWENE80Dn80V8YkmR7IynT2
 PmsinOSLliXP0f3EBXfta7Bkb2L/FwE=
X-Authority-Analysis: v=2.4 cv=C9V8WgP+ c=1 sm=1 tr=0 ts=6af19b96 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=BqTCDE78pFX49Jf4NhIA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090040

On 26-11-09 00:30:23, Stanislav Aleksandrov wrote:
> qcom_scm registers the Gunyah watchdog only when the hypervisor reports
> the Gunyah UID. On the Samsung Galaxy XR (Qualcomm Halliday), Gunyah
> reports Qualcomm's hypervisor UID instead, so gunyah_wdt never probes
> there, and no other watchdog is available.
> 
> Accept Qualcomm's hypervisor UID too. gunyah_wdt still checks for the
> watchdog: where the hypervisor reports this UID without it, the probe
> returns -ENODEV.
> 
> Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
