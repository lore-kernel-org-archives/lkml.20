Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 642B7480DED
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 10:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791972777; cv=none; b=V7cDa7Ycxh2ibs7O2qqx7uN4u301EfWSKuYCpp3p3mArm33drA4Kzy25x/lwc/aDzQbolsuGLqbHfbxIGfezsftAmR9cmgWcaR51y9a4ByE88PzaUrv2PDhduUuZEQh678KC8xsYV9scRXm/XGVm2KVjA+bsqq/l7pqd7UdAE1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791972777; c=relaxed/simple;
	bh=iGF0ToWzepPr98jsRO1VDaOzoW2Lrf3NwBDljOcn/7M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cxkkxhvvcHplc7fZrL3RMuVWQ862vH88e2j8zqTqJX8+uVmQ8O0NwcpS9/LflPCP+/YLLohuvBZ1rJeOfH14NH6DtbSC/nIQ/D2mO5d23cYHZW3APxp+cwWKtevXjX2EbcPVKPtzQgsmItFM5fEZw90D3uGVdGzGzirE4bpS0f8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hpoyNJ6i; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bszaWMi8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hpoyNJ6i";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bszaWMi8"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E4eIAU806980
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 10:12:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NsOphvA+HygCA0aKE9tMdQTvaBEHpFaG8dK+k+KXwEU=; b=hpoyNJ6iZqKqAtz+
	CWxQnvjYCIUS9hdhTb2z2Th/AhBx7H17UL6hRB6Pw75ACUyEBf+v3dEHKhTARmno
	MJQsF020Z/G0xr+pnf0D7evuyQUK616Jx2+xPBbGgUljjzx44/x4MKJFKSS/vx+D
	VkHiAU+E3gvHxQMhlQOUmJqd9O/TfpHohV45D7W8myJDuFaFAq8aEUKZ5opt+tTt
	bBm6Wf84YIzdxj1iM2B54Jrwtsa5tzobxXlSPxL7Eg7SRu5Ib3qm9xitWycbncni
	k+cLapnGq1CTAPcEaRQBqwq9hdkoNEBs66H4x02mIVzi8iLdaMniIsHJAGB2J8CW
	9lU37g==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9ud6awwf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 10:12:54 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-88a10162189so303803b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 03:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791972774; x=1792577574; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NsOphvA+HygCA0aKE9tMdQTvaBEHpFaG8dK+k+KXwEU=;
        b=bszaWMi8f36pbYEMmCjvaRiGH2+knmJ+QEhc7/ZU//Ms0NBuCBPczyrugGGPAJRGP5
         h0IQ8YS8Dy4tCCGajIO6rYfiDU9XILbXjHa4oSTCsWSzZ2v6LiyiRmt6ONPd5C9rTco8
         ESEmRFei/DinZmbyKzCD0XXuJBMyBB3iaEtdowbcG8VcEJGwea3wIoi5tCcm1wMRgPBo
         QCyMYJlr2RLLsi8pgvkfInVOjhzODf1JcEIgd2w1kcdzEP3fdkdFW5peOTwWVarvh1xs
         E/TC80KKXllArZ9hZj6P8Pz/dsILwFRjGNwgvfhEJHUQL5wpC3tX2Dqbjyxo95C50hS+
         Wwog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791972774; x=1792577574;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NsOphvA+HygCA0aKE9tMdQTvaBEHpFaG8dK+k+KXwEU=;
        b=uG1OouLVl/N2O65lXZ+0rbt1xpclnxD8cBMd59CONVVoQoSxN5CKX+C1moSQ2G/sKY
         SMNa11GyEPEBkbREeug137Y3NXQwmBOdiDhTR5IyVgjjWTv+EVSPhQtNkGBbn6Bp8cPP
         FXRFBtyxrNlYDXV1g0oEohZGRRbOCULI1z0wxyQVqiicOn+TUleIvhENdWniJGZe0w8D
         HgvG3nXDh+u8YiLlooYbR9ODvDqZ5DnGupI7405+Zu01dRJYXcJ1rIP9qfnccEBTK4y0
         7CyhzfOKOoBe7ls7EPVLfclFuhpwVzvRn66ZSRkWYQ0aWzVPj7RDPAMsRfSwBByTJv6+
         QOzA==
X-Forwarded-Encrypted: i=1; AKwUvByUL4MAKrxCiuUzSNK4/yhWFG3WhZ2C6uWziAmMjrDtyL8Q+WElgHjVuqDuDLn9Sw+EE9LkvQYGvN2pUf0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKESKOpqP5+u4/BeGOvgX4Rg5wKiuymeL5ciAsbBQR8R+tfswHw
	dWsjSYgXiHHCOtbtdSoaG5ezYQ+DtApDHZNFha3LYZe4RGcAWQWSg7QixG3IKtaUMwlbg0VrJL9
	Lpb9gCoSP2CGhuYNI/ybCC5YyR423vHEh+n2rrEFfWNiLUYlDXALMBS1pM00So833pDk=
X-Gm-Gg: AYBFou2/tXyEtKZELC9tdVxLa+FRyilblWp1UmEb/ShQnJz9zL/fP8/H/IjVQRaTiJw
	i6KMe+G+1KGD3/t/18YDHVmgRVbTtEgmRxS3rn+G24aWznjQciY48rdCMNdc1kbYGZ/OK+KviA6
	Lc0Lm98r8lalAfKLAaQjxB5/o7bfb0+EL1UV8fCwHYzLLNS0rjpyE397HDMBnls9t0oBjutEVHj
	6EV+f4ZmbAX52nTDHEt+u9K/X4fvwsn9Zii2x8LaK9fMuDbINsr8+UqFVK8nIXYuOy4uTpux/fE
	nCnIDMVSiN+dPRcFpqTLSN/rENIJvsHn3UQ9NnGZkYCi6p2cCaWT55RnyCxZjaMJIpy0bQb4ACS
	h4mKiHpzOn9FR8Oi/f00613y7zaw=
X-Received: by 2002:a05:6a00:a01:b0:886:bb44:631f with SMTP id d2e1a72fcca58-897c6e1c80emr15158211b3a.10.1791972773870;
        Wed, 14 Oct 2026 03:12:53 -0700 (PDT)
X-Received: by 2002:a05:6a00:a01:b0:886:bb44:631f with SMTP id d2e1a72fcca58-897c6e1c80emr15158186b3a.10.1791972773411;
        Wed, 14 Oct 2026 03:12:53 -0700 (PDT)
Received: from [10.218.18.193] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89d804fab99sm947148b3a.46.2026.10.14.03.12.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 03:12:53 -0700 (PDT)
Message-ID: <47290c05-bf04-4f38-8061-e1d7f9815e96@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 15:42:48 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] This series resends the self-contained ASoC
 changes from the earlier Hawi/Maili LPASS audio submission.
To: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, ajay.nandam@oss.qualcomm.com
References: <20261009111719.2609060-1-prasad.kumpatla@oss.qualcomm.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <20261009111719.2609060-1-prasad.kumpatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: SM33FxF64eqhOpLW7Kf6JbIiF4FeaoJQ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA0MCBTYWx0ZWRfX9t29ze2MC74G
 cuutDfgl1sYWsRPzzguCjmFMI+kR/Zr7brSrnB0NXkzBk2pZP4FB/9uVnpMKLSp4mnkYIwlGpCs
 12Vt/bUhbuI5Ny2E7BptAf8NJUAVJnk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA0MCBTYWx0ZWRfX6SzsZ/+ThPir
 K96YB1dnb/EhVq1mRQIMk9fgcvVu1pjq+ihrcqwxybAIXcXuZpp75slHyLV6JK4p80c616j2nHb
 u9muERBH5JXB9C71knrz4bBI44SmmwZ0rgegsDFij3GKrf7XZCwUqCeC0pCCGGbPY3P0c4p15On
 NrmTTQANzLt7XkiqEGjewlMkoi/soCa2J9FfzDqpYdFPh+O/q/wzLl3biO68zLXSZTsV6in9E1+
 KLhSorgi8VyVDlFsjdy08lydvQEuSMj/NLOXk1J0Lsr37Q9DHJYDpt03JD6jnex7/ZEIGTWUIJh
 wBxrW10qbU9lEz/blOU2RaxAmaWIHoUYasB79Fi9Y3r2bMgZXm2KkfBEIi6VM+SnilQynvvYmjM
 vZ9qbIV3s3poEgDVYo8RwM8yOjZb12W6Ufv9ggZKLhiz4l0T6mEV3JK+ILNKjPj5cLAxthQywp1
 3myv9GHVHfWWchAlPLA==
X-Authority-Analysis: v=2.4 cv=fJ6sTpae c=1 sm=1 tr=0 ts=6acf55a6 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=1SQLs8w1TVd8_krkn-8A:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: SM33FxF64eqhOpLW7Kf6JbIiF4FeaoJQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 adultscore=0 impostorscore=0 phishscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140040



On 10/9/2026 4:47 PM, Prasad Kumpatla wrote:
> Hi,
> 
> The original v1 series included bindings, devicetree and defconfig changes
> which either depend on other LPASS macro/platform updates or need to be
> handled with the corresponding platform enablement. Keep this revision scoped
> to the two ASoC changes which are independent and can be reviewed/applied
> separately.
> 
> The October 6 subset was incorrectly posted as v1. This v2 supersedes that
> posting and keeps the revision history tied to the original September 23 v1
> series.

LGTM

Reviewed-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>

Tested-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>


> 
> Previous submissions:
> v1:
>    https://lore.kernel.org/all/20260923084627.748920-1-prasad.kumpatla@oss.qualcomm.com/
> incorrectly-numbered subset:
>    https://lore.kernel.org/all/20261006053717.3455143-1-prasad.kumpatla@oss.qualcomm.com/
> 
> ---
> Changes in v2:
> - Correct the revision number. These patches were previously posted as part
>    of the September 23 v1 Hawi/Maili audio series; the October 6 subset was
>    incorrectly labelled v1.
> - Drop the Maili LPASS macro binding and Hawi/Maili DTS patches from this
>    series because they depend on other platform/audio changes still being
>    reviewed.
> - Drop the arm64 defconfig patch from this series. That patch belongs with
>    the Hawi/Maili platform enablement and needs a separate rationale if it is
>    reposted.
> - Keep only the two independent ASoC patches.
> 
> Prasad Kumpatla (2):
>    ASoC: codecs: wsa885x: Reset registers on teardown for B2B playback
>    ASoC: qcom: sc8280xp: add Maili sound card configuration
> 
>   sound/soc/codecs/wsa885x.c | 11 ++++++++++-
>   sound/soc/qcom/sc8280xp.c  | 11 ++++++++++-
>   2 files changed, 20 insertions(+), 2 deletions(-)
> 

