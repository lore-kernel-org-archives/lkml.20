Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A794E51C341
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792058375; cv=none; b=tFFMUHNp+SJ3WXEbldi1/kyRBFJfi3R0GGfgY/638XPxUSyMONcXnG2en42AQiC7Chq/ZFId529sTk69bkB2X5RL7QbRO2JUl+K2ZzUH9Jy4SeGxJwf82xDhLbNep7YKEG1TkTDVl2MtoSSF3IEVK2iTi7vdSEXCQa4aqHFsx4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792058375; c=relaxed/simple;
	bh=TPS7X4ywFuxBY42kPyEJIt1jO4uVByHGfOTGcFT5gY0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SysZouLLChsU5rEbidyVqFhyCIVX7bo+RI4DRqN+HsSREujnB2gPhr7MYYTA4tp3b5gcxoBBXLHluAXzl/ORD2BBU6HuSXklHNemscA020037plxSkE0zOzAjk15voLXXQxU524aBZwdke6mHsXXj1RDAtq9zalfG8AbrW9EOjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EZQXzvmP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HCNvQmAU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EZQXzvmP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HCNvQmAU"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jG8s4077443
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:59:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D6HuWkRZ6PRSrIH0wP63PHXsk5UEYGZ9FwZw3iYvNzM=; b=EZQXzvmPqP3s+ndG
	3cqt0tBC8YYtcP2Y6j9paPblMmif2RMsTsj4i1tep01sfhxbf1ywdLS7VnP969g0
	BkujYvJOHsoDrz6zIjtKl1ZTugQ0pk4QajE2CcKZOk9Y6OmLSfgAc2ZX70yp2i9y
	gRpQCf1j9v+53rGE3fih1K6DMdo41BRiMhVL8xmzfJN3fyd1tUW04dpsnlh/9rlX
	xDuHRhawlg6APlLsXMdX0a8dh2mcDsCgPuyOAuyOUtavNOThCT90kDNEk21py50s
	IVFMXmtKKpCHcrLlUz93E/rgAmCjjOeqBlcxAc3o2OKGYL9ryH43Kz83lGu7vNcL
	t3hQ4A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4havbc03y0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:59:33 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93caf7856ffso1041937785a.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 02:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792058373; x=1792663173; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D6HuWkRZ6PRSrIH0wP63PHXsk5UEYGZ9FwZw3iYvNzM=;
        b=HCNvQmAUVLjjpMFsTpSFQWwF5ggbuBNYdoQnsl9lG+gwvEilsSFRJmC/3BTY2T/dr8
         +pz04XimJk2elxOgHDv5mf0L3a64eVnDXNaIz3uqANxpmT4yJWYZf/kbm/4wGPNz1Qyw
         IMhVZ+bER7rFhwp1OdWLc/pKFsklg9eJ6QW18kB70lWX6Afu8mRuboLqVCbXELxxRnEK
         PCAIauRopcOSoC2NzGm8CroUtxSVzccdKeOrJiX124Z2af6N0f/YLPpQHQM5TizAXiy0
         2wtA31rFyx7MVOyPEKGK19dOyEnah46JS1dS3IudapEa7ZtBEVmqh46bGF4uJnyiHuW8
         3E4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792058373; x=1792663173;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D6HuWkRZ6PRSrIH0wP63PHXsk5UEYGZ9FwZw3iYvNzM=;
        b=FzU6aah8Ah1p6qEJnnkUApxVmn5RAbe5Ebku/a5BbUImxV02z+uuMAdmH9kblEtHjS
         kOX4Uz7peKis2ylSxsLlaiDQHUUtFRGprrakwwuMh0UmGaakOgXTKIjinqv1EEBVOrzC
         5dwFWPxCp7RtvoQYPouLGNKu6Ovkp60OamDq2uOSNVLbMJAhlqR3CYbqXIId+Zr8AWYw
         Uft499Bk9tZDB9veqdUL4xfTrsfAEIdpVQS7CgG+LeypWClQpSAfKWCjAv6Db02pIHXY
         /dv5Z8YmmRdob4wsUrWIIPZO6RvtvjLkqDxgoLe1Ff/SfNXIHGmu5dOGJrG1A6rAolgw
         8bSQ==
X-Forwarded-Encrypted: i=1; AKwUvBxAU6NJAOH0ci8eUnif6kaUVksPW+bJER9IpmbPiXc065yuxreuVkhJmXyIpPp67aeeU4R+l6/CbTDl9Us=@vger.kernel.org
X-Gm-Message-State: AFq9FYLVFo5hfizRV12nXTZCxrVh7de8Enl/bW6T140UgKXfHcUTlLwr
	61ltuLY1n6UTdfxYuwK0exIya4xp4WwJerWcdtRV5kqQFeuF+ev6Xk86BNFhjxYNOpUdgiAp4HW
	9glG4BW4SXyE4ftXAb5mbqdbUXurGNtKN0qp1dAxFcMyfwbaQqTV3RodNjd3ZmQJs0Ng=
X-Gm-Gg: AYBFou2cB560LUoRFaqdPojCHh/m51yPvnpAKf8+Dbbj/9GHe0W9se8mVeVofCy7qD1
	RSQRPKGBJUwcfDlaXr2vpkDrY2hlfJBGmeCYyemhxu4kFB6odoIyYvKsMN5X7ZVpzsgNbUMsVJF
	guotBuTIT1Ye+cdP54AHL1iFWPfADXhee39yU6CVJuLwfzIG1zHooREVs3TvqOxfTmo+0Y8zCj7
	hV/IBcbKkEJx5xcsFl1vg4LKvpzH+oyJV6WhtugCVBGW2Zj11LbGt8oq1+rLvaQ4B8IdtxUr5WE
	GBe2mxHf09ppNq0mpP9V77NCvebzr5nmeSIimKoU/c41o4+JdyLnrPWPPe4Q7pEsdlcUCzJdai0
	l+zuZ4J1OugOjJYg8DEwV89SA6A==
X-Received: by 2002:a05:620a:31a7:b0:939:c71d:8d15 with SMTP id af79cd13be357-93ebd229eb4mr3052887385a.14.1792058372823;
        Thu, 15 Oct 2026 02:59:32 -0700 (PDT)
X-Received: by 2002:a05:620a:31a7:b0:939:c71d:8d15 with SMTP id af79cd13be357-93ebd229eb4mr3052884385a.14.1792058372259;
        Thu, 15 Oct 2026 02:59:32 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48de09693c7sm22128628f8f.4.2026.10.15.02.59.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 02:59:31 -0700 (PDT)
Message-ID: <fef22189-05c5-423f-b0e8-c1ba9dad0fed@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 10:59:30 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] ASoC: qcom: qdsp6: report the position of a drained
 buffer
To: Vladyslav Tymoshchuk <tvlad744@gmail.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Zhang Jiaxi <Z1529105815@outlook.com>,
        Johan Hovold <johan@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261014162703.10172-1-tvlad744@gmail.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20261014162703.10172-1-tvlad744@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=QbvzLcbv c=1 sm=1 tr=0 ts=6ad0a405 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8 a=vypxUws9g1tSpB0FtU8A:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzOSBTYWx0ZWRfXwG0IEW949Jbo
 8kHGMIR5jxxJEoIyKBwfTowsHzZ+YG5k9g3YNj+4oOkkdNTUpwJK1XIdpBiiSP69/zoHXIiJkdz
 kLwYQnl6uPu5oVc4l7T0lLi54ycOcOk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzOSBTYWx0ZWRfX6WQnuVYMzwUR
 tdVdUJl+ltafkLGYQ04Yorbn9Ef5HqAz6miApg/RtBpb0cWQ6+tp8acOgmXVf5cpLyZY+RVmdi9
 TU5DTallW4Wma2lPlvCI2y5ZcePrxzjZLCQZ4uUIt7yg55tDZ3aSQoJrByAt9mAfEfSBcVPmeIR
 3kkPv3rHJi6WHRxBDpScBYKUZKA94b9HMmDs8lpoTzvLMYDgK9w6MM3eYIvfecBkHlOBV/ZgfAz
 NZUy+ImvYeSRgNoSecBHIfIpvuhucpAk1ZrcqPdiYOaVaCaDleQbEC5flaQaICeBrGaaCPTb8Ue
 imnWjtKCQMi7WqDDlaaR9BlKuAn1a1WnvapFITYMk4Ew00+7Bm4yWg+78QZi4ywEfVw2N3/Wbcw
 XfD5jNEW72kWqhL6mKsb0LZHhcy/3P7Pu/j52+ZBic9+PseoxfIJ3oKLxv58en6+TVapN6OfE/6
 8r0gYJA+1ssQtNcTrmw==
X-Proofpoint-ORIG-GUID: fbBSgYJQZbrUHfbCoV4fNQXi9lYOU_m7
X-Proofpoint-GUID: fbBSgYJQZbrUHfbCoV4fNQXi9lYOU_m7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 phishscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150039



On 10/14/26 5:26 PM, Vladyslav Tymoshchuk wrote:
> Since commit a93dad6f4e6a ("ASoC: q6apm-dai: make use of
> q6apm_get_hw_pointer") q6apm-dai reports one frame less than the
> position of the last buffer the DSP returned, and commit 44432315444c
> ("ASoC: qcom: q6asm-dai: use q6asm_get_hw_pointer") did the same in
> q6asm-dai. When the application stops feeding a playback stream, the
> position never reaches appl_ptr: ALSA never sees the underrun, the
> stream stays RUNNING without period interrupts, and drain ends on its
> timeout with -EIO. On a OnePlus Pad 3 (SM8750) this left PipeWire's
> PCM stuck for hours after a stall.
> 
> Patch 1 wraps the q6apm position to 0 at the end of the ring, as before
> a93dad6f4e6a. Patch 2 resets the q6apm hw pointer on prepare, which
> a93dad6f4e6a also stopped doing. Patch 3 is patch 1 for q6asm-dai.
> 
> Patches 1 and 2 are tested on SM8750 (numbers in patch 1). Patch 3 is
> compile-tested only; a test on a Q6ASM board (RB3, RB5) and on x1e or
> sc8280xp for patches 1 and 2 would be very welcome.
> 
> The RFC "ASoC: qcom: q6apm: correct PCM formats and error handling" by
> Zhang Jiaxi [1] touches the same hw pointer, in graph_callback() (4/4
> "recover PCM from failed data receipts"). The two do not conflict:
> that series changes when the hw pointer is published, this one how it
> is turned into a position and when it is reset, and that series
> applies on top of this one on sound/for-next without conflicts.
> 
> The analysis, the patches and this text were drafted with an AI
> assistant (Claude, see Assisted-by); I reviewed them and ran the tests
> described in the patches.
> 
> [1] https://lore.kernel.org/r/SY5PR01MB10600B2BE812BAA1B0FA501B4A1932@SY5PR01MB10600.ausprd01.prod.outlook.com
> 
> Vladyslav Tymoshchuk (3):
>   ASoC: qcom: q6apm-dai: wrap the position of a full ring to 0
>   ASoC: qcom: q6apm: reset the hw pointer with the fragment queue
>   ASoC: qcom: q6asm-dai: wrap the position of a full ring to 0

Thanks for the patches,
Lgtm, tested on Lenovo T14s Gen7

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Tested-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

--srini
> 
>  sound/soc/qcom/qdsp6/q6apm-dai.c | 12 ++++++++----
>  sound/soc/qcom/qdsp6/q6apm.c     |  1 +
>  sound/soc/qcom/qdsp6/q6asm-dai.c |  7 +++----
>  3 files changed, 12 insertions(+), 8 deletions(-)
> 
> 
> base-commit: 8ef28aef33f2d5da6959ad6b579ec3cfccc009f6

