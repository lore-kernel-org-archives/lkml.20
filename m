Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6C533BE162
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 10:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792147807; cv=none; b=pOfeDz2WSZXEnHeDexy9Rb2ANCH05MioZKk36nuxlvNbxptMwG26kzsuu1W7S2zPLWQ64UBJigooNQtd3T7ZFABPy0JPNM+Z3ZdWogSMhBF8xv6j0Dsi+00worycAwmcAw/pTdAhiL0p4FQCQJEvJUh2vNvUHCPcZ3EffAXYI1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792147807; c=relaxed/simple;
	bh=U8xUhBZ2f/kkhuBOykgloPNFWKazFRIm//qLiwVE7iM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pe7Lo2Oz331Fc/+EYIjcCglB2Y962c1GfMXmzJdxkLnEUCXxPHmWMJKSuaaYJBJIXxP6wBG7g4F/I0hto5LVH6hX+ljXLcfxqt9HsGEEPZ325xrKTUeZSP5GqrZoOEuVIu7AxjmcgaZPexfY5lYv2gMfVULODSuRzIln1+LExr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KDFLm7WD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WuSQ9o3u; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KDFLm7WD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WuSQ9o3u"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GAAAU21983169
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 10:50:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k7IjtS+liWyVhegtfUxpKcwt7nA/GvT2mnO8kEfaBY8=; b=KDFLm7WDjdFSWKCn
	JLQNDj/WX8//nfSPhvhauZ+5hauVRkFliSfKHys8GdykmrnH/VpPErquCJObScfh
	8bCtnsgGb6spti/bbDCq+y5PgE4ZD0DqCDjO7UHd8wR6H0CpNf78rJiFvaYs1wlV
	6qQYAg/7rVA0qLyJreQQRQDXLIvlfgIXQxhAR/ZXCii0S8I61GlNPkeWQsQjce1a
	+dQqeh67NcbuqTKPNHEFFr2jHXxk5OUysbvyrVywfn0ITtkfVRkB25tOeY3HjqES
	3piShFQ15FYNq2R2T/U1UT58Do7biODm7pGMgGTDYU2mTcHyrSoWPAxYVWOJxhZ1
	LYtaHQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb8a8a8r2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 10:50:05 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cac495d99so49274785a.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 03:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792147805; x=1792752605; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k7IjtS+liWyVhegtfUxpKcwt7nA/GvT2mnO8kEfaBY8=;
        b=WuSQ9o3uyW0OfHuq7Z8Uxh3JOtGTb+FmbePUuhFmtWBqXMsAUA1vubWDKe+6g9EncP
         lPt/vWJcRqOqtUr2mh0hvYnL65nVKVe62v7Wh9+77B0jvzshRd0vAgGv4RyoYYPw32jF
         5za1mROpHxH6KTrLXOcIThl0iPbrxTWUuXO8y318RJAu+XAZxMhEh7tCfBuf8ULj541q
         /hXtXMyc7x4cXitEUawP/lR4172bTO4Dxw7l6qCnxQO+CyXnc8tF9c5jLgAwaEXHjCmE
         1YHLsD6eJX9PINuYFVUv9l8UOkHJeWrVmZpxfxPB2osxG4WIXpywfUfFVoqhE7HJqwyB
         cdaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792147805; x=1792752605;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k7IjtS+liWyVhegtfUxpKcwt7nA/GvT2mnO8kEfaBY8=;
        b=M38/gonRp3l00PP+OognhazTpLyIl+SlhsUWh4NSfNfiZOMz++OSxc8NxnfKdiE53u
         o+tK1xKCWilnKWnQ67jKyrn1DZC8TWMDLQIVo8pGxXF0PJS5B+m+lV+DdK5wJrG2qmQe
         YeQmit8NrE3T2fwGXm2y7rLSNx1et8ua0X9R2i8NGIUJGYCDmS2EE7HAaKSvftxD4pvI
         QOKbKbJGXNTv/uKTdY0SIPAmTqbOX8O7o73yvj1dnFYDpNpl+TD/auDgECLpXvMSIOdr
         Lg9hd3/qX4LnjOic3dj6nKrnAUPFo+IGa+gt3aJBVBE3ahAb3LEb+su/EbXZ4nO0TGY7
         l0Ag==
X-Forwarded-Encrypted: i=1; AKwUvBzITZ3NTZXgz9xwZik3SJ/e5TgstUbe2celE9izJgrS0ReHXBtQQnaUgfOAcFXsCLfWfCjOwXm1OaTYRWs=@vger.kernel.org
X-Gm-Message-State: AFq9FYKOfGip2cc3O+vcg8E118s01YUteUbqTmCyp8ft5XMwJKtd8p5B
	fBt/kJO79v+AEQyGW1TAcZa/I6t4uTFYuRYw0Xp1BeQzZxGAYX+HmSRzMeuifJTvZFnITuYElJT
	MIcaGhsiOWQgbKuhslhfX3LbEk2IL9krnj3WzF12X8xXhutOZdHfIDWXiOsO7ZS+9S8k=
X-Gm-Gg: AYBFou1LrsXDLlMwN9S+AulrCiDfo6kiMTY+e+JSHOYYImpWFEtP61/SMYQK+mejmlg
	Z04PyXz384iPXqmyWJZWapEsxI3ipjSjgb1MZ8/G8DEaMqfla0SmhfRlJHmSuZ028u3kC7LySd2
	lAaAHZCRRTRjfRoiWzso0Idp3VnTAgTec2g2KcgU0pMLJgfEtnBF9Dr7UyxBtbL+9Kp5DwX7Lb7
	MIuf/lY7y/2vn9jTPDqI8pz8yFhcCD+hjr2ueeViM/x48MIMaA98o+/LQmF+QkWrZoL/xDziAz4
	ju2VIak4pXnd4m+ubYThjhvZkjb9QGsFZqKfjDa+MEQK53C6qx4ABGcKSYD3K9wmBRZFRXoNTtO
	2ActLZ+Nj8dYzKEszJhWeow==
X-Received: by 2002:a05:620a:1a10:b0:93c:c96c:a5b4 with SMTP id af79cd13be357-93ebd23a4f6mr4072003985a.4.1792147804562;
        Fri, 16 Oct 2026 03:50:04 -0700 (PDT)
X-Received: by 2002:a05:620a:1a10:b0:93c:c96c:a5b4 with SMTP id af79cd13be357-93ebd23a4f6mr4072000485a.4.1792147803965;
        Fri, 16 Oct 2026 03:50:03 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1d8b4csm750199a12.26.2026.10.16.03.50.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 03:50:02 -0700 (PDT)
Message-ID: <67366b4e-21d8-4094-abff-b0539bae47c3@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 12:50:00 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] phy: qcom-qusb2: describe autoresume bit
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kathiravan T <quic_kathirav@quicinc.com>,
        Baruch Siach <baruch@tkos.co.il>, Dmitry Baryshkov <lumag@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Manu Gautam <mgautam@codeaurora.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260920-fix-qusb2-v3-0-c273e75c9fb7@oss.qualcomm.com>
 <20260920-fix-qusb2-v3-3-c273e75c9fb7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260920-fix-qusb2-v3-3-c273e75c9fb7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA0MyBTYWx0ZWRfXwpUfv3tu8ekR
 IvKgtALp0VM8iM76IfhqaPw/rTdcZ8oYBVMbIEQRHLzKkKCDb20MYbuH2VvKUMq2dQkYXR491BB
 6eIQm88cpJ7ac4dThfIK+qhe0YgQ+7Y=
X-Proofpoint-ORIG-GUID: cmqnj0ig6E1ggQAkk2jleYpS5eRemY_l
X-Authority-Analysis: v=2.4 cv=GJadgeNK c=1 sm=1 tr=0 ts=6ad2015d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=ma_R596jXcS_LPZDPT8A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA0MyBTYWx0ZWRfX1/QL3OJFoY2f
 i/bKbSGIzhefB68WOx3dbFTlGPsi/43OK0n8/ZRi6qa3TqY6M4O2RjrBKOhdsBiOup8yWxAMeDI
 9lJgOsLEobiPCvRa6Hail5GFeEPXOWwGK6nYMKcpIE7H5nYefFgXBxmpEATMFAQ6LR0vqgv1mB0
 GvE16xsjA5iUk7X03BCy/l9Jy58BZOPrVKIaracz5pN9EQJYBMsKwWJfAgk9XW4nLnl73ElCJY0
 2l3hWUQAknuHrWubhoJh7GMSbhcfgIvC0g1DTS7qNoIF60j8iOnmrAJUfI3sNl2cFiOIsxZAGgv
 1q3simYVqusz8xriuzPBIcgKdxWKM4815210jKH8r3M8667X1qMr94ptrOF/4HJNR+A1VATjR1p
 AvAYuIcBhtLTrsqKvdyVTtf0rBUkFE1DQbNr2XEktKQgMuo6HcwQq1JfIr773xdEDH4TiRnVhJz
 WR+W/zSV5128Qy1XQ2A==
X-Proofpoint-GUID: cmqnj0ig6E1ggQAkk2jleYpS5eRemY_l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160043

On 9/20/26 3:59 PM, Dmitry Baryshkov wrote:
> There is a confusion regarding the autoresume bit. Some verions of the
> QUSB2 PHY have it in the TEST1 register, while on the others it is a
> part of the TEST_CTRL register. When adding support for autoresume bit,
> the code attempted to simplify the handling of those registers, putting
> both registers to the TEST1 layout entry. In the end,
> ipq6018_regs_layout ended up correctly definig TEST1 register at 0x98
> (because platforms using that layout didn't use autoresume), while
> msm8996_regs_layout used TEST_CTRL offset (0xb8) for the TEST1
> layout entry.
> 
> Update the platform data to specify the register to be used for
> autoresume handling, define both TEST1 and TEST_CTRL registers and merge
> ipq6018_regs_layout and msm8996_regs_layout which become identical
> afterwards.
> 
> Fixes: 891a96f65ac3 ("phy: qcom-qusb2: Add support for runtime PM")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

GPT has a concern:

[P2] Preserve Shikra's autoresume behavior

shikra_phy_cfg uses msm8996_regs_layout but doesn't set
autoresume_disable. This adds TEST_CTRL[3] to the shared layout, so
runtime suspend will now toggle it for Shikra whenever the PHY mode
is valid. Previously, its unset autoresume_en was zero, making these
writes no-ops. Unless enabling autoresume on Shikra is intentional
and verified, preserve the old behavior by disabling it for this
configuration.

but I think that's fine since we *want* autoresume?

Konrad
