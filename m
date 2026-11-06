Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793943819;
	b=GTAc4nNWHdMGueUV7jxtmGtJ4aextHnSunS2+vMSMyvleSMb7j8DWWA7khcl/s+l2m8U
	 xDATFN1GSzdnMsyyveKtKvJvwLM53p5hqRZuE2YTfrKQEIcQWilSoD/AU0oRVgq1MYgGe
	 goGh+S34rCr8L05KSsS/k77dy1/Zva5pVMBvmRxDCLfGuojHfr6B1iIu843BUI2vldg8R
	 eviB+AGAurbsIVAGzalXHdenYKNbsDRevCQTATqH3GonY8TfCLERcjb82wR+Xv340gI/g
	 u4pjXCMzYGcouJs7HvPAaD7gFE3XqmM1C9WFi37Nt48YeFNtpvnqi+FZuy5Ju/PxSZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793943819;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=BLZ2qq0SMM/jpN1DQFJySBn7gK2jN8dBcZ5p8HUJucI=;
	b=uC7+B8enYX72d6wTI9qFusd7orz2IF3l1LfrGxc2wTvbfBa+xGeB7W8AYSpQNmt5RLTM
	 31o2PvJox63WuQQZIPYA8VmqfZ/w302mUws9k/09O+MSfD0WsYv6SSXwrCrjd8MWnfuDh
	 tsYDvlytBGDj1ks2jgJa7kRY6nVnhs0ETJ4TM+GoYDA9yTybQ/1S2zvk5fOIqF3yIyQBt
	 Gdu0Bk+MrVYnlzJoWbYVhHcmifi8QuDbrXIv4lpGJBD6WEAKG0acLvvn+btOZFjXDuP7O
	 PYaA3v13I5bpBE3HPbKU/8FFf9Kt2NWwhnQ8ENMi2Rbzu2XWUZKQZiP+WamjyBAUcNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LpF4AnT9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xlx8mvRQ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A731606A32D
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 05:43:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A731606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LpF4AnT9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xlx8mvRQ
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6406Nf1867126
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 05:43:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=BLZ2qq0SMM/jpN1DQFJySBn7gK2jN8dBcZ5
	p8HUJucI=; b=LpF4AnT9qfz4uoICQQnJbcr+VttSjVrZKi03KtqPSrsPeQLU07q
	BZvVdUdbMpQPaLKJYa5lfVRAcOxpo+uka74U9fSNLxM5Q5xRvAo6hNGnIwg49zoX
	m1r1udMMaM323hPKhiuQ7ObhFIVr72rZY/JeNe1MJAU5HaV+UBhp6hSGxY7tWdFu
	JlV89MTS51CMf+NZjrlhzwrhbRnyp6n0Y2EfHb9g2cnldvc/zlqwmBnIDeVV7Ytx
	E0tj6N0JPetvkHrOMM4640DZKAJaS1uQu4IY7DI3Ezt6RSVJoYfQuXzh3OBq1lor
	1np9rwBN9I9kFJqxEWLKZvTyoqUPzwj0JWQ==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p994dj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 05:43:37 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-8b3228a3d24so3602727b3.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 21:43:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793943816; x=1794548616; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BLZ2qq0SMM/jpN1DQFJySBn7gK2jN8dBcZ5p8HUJucI=;
        b=Xlx8mvRQaD6ABKZa16oTBupzF5Akjkkh1XR2v2JcpXC7ODruaO8hi+C9yOf4bkbXsu
         8pq12jh9fJ82ocW+Hy39Goo9sGnd35jbE9QgABNtBV3Kd5HrO1ntmlYdIWr3Z6rvOlOT
         bR0cZ97ENEr7SrcTjuKOXFsU/lLsb3M/RzliWz7vlj5h/H2EZghMPur6ofqjLkSWWgyg
         QbgeIkn+7zBio72hCi8Jgxrqi5uQEU23oturoE8TQGhAS5M9ZqqgVkXpufQ2unsGbX2x
         ODF6BurWBJEw0CAEZ8nis0d9stTJIIkt9wVx2OuAenzZ+/tHRAMmSwq7Nr5JFLq/+XkJ
         Iv6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793943816; x=1794548616;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BLZ2qq0SMM/jpN1DQFJySBn7gK2jN8dBcZ5p8HUJucI=;
        b=VLQA6P8l7rdIn+9Lv7zizDgnrFEGk8IC9HlZ3dtGMhqRfRO14pvGMd7SWElAEWX4zf
         Sb2Ayo0NB2GB1OtDaX/xA78CV4qsAJ5Zg2Y4wXRlhUg+rRdk1Zh8e4uz/IhhMskeMBaC
         2CRvXQWb7PohlEgH37U3KszQ0OtudlIz5i1eXsxdxm1UiY+bsdM6PbdlImr5tDg4cdR+
         VDvbU0cY1g1OlTmAqgDjaOwkGO88SXl0qzVCpdcj/AwOLtIBnKe6mO8WL+1xpSyHDT2a
         22UIEveUiTo6y3Nhq3Y5MA1Wec5uMESebQ3UTzFiIR+r/Hp95XunPcqYDIJrdYd0d5eN
         46fA==
X-Forwarded-Encrypted: i=1; AL+hErEpqtFUFq8JJgCRntmml/DPEo7qgBEoTpJZlh4bsVimCMf5FyCb0fAOBBpyzCqfx03zOrxNRgTiZnkRtTs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9khJhTdoEeT38OpFemhTbarIcWjiouszrQcWOSP2+ypQkSUS+Z
	kl4z267eO4liyWdT8vjLM2ukZW2SWzIrZQgFd9cB7n36yCxQxNnubeAcAFJaoxdzScttFvQYeFn
	ktoYoglprH57WIZJ5xWUjdGPo8kQuUpQc19DAG0l6aMfyprWxI2A3KGoM4XHAR0wk6Tk=
X-Gm-Gg: AYBFou0W5kR7FFEx9UB9maygtN5h9PG+ibOuJnVdObSrtLtDkt8cxKSnnZ7kF93H6xr
	txuOYldJDGf2JArt7r9nCBhDS8DetCdIkl/bDT224U6ekGaU2xlb+vqHutf8XWOJlsNK2WMKBNK
	s2kxCCC7UD45x8GLrwnjRlznqQmUr8AAV2kQlwgWFY5/Gh8b4kyUaNpNqCXw/ImAh/XlZ7J7sd3
	ohUqTRqi2Hzqz62QlUGRXLMvXYAS+YOTsPEBqWDdYRSU65j3TH2U0h+CVPrsB1zckEQ0XylVECb
	HYB+FStSfEdDvzyQq6y0DOx54TeRlTZ/OT8LsmbuNFvD5Xn0VFoVXEA2F2QjCoCaR+0weY9Km+J
	vTVJ1llXBtDpdVjblz/eMMHUAZTsa91S8PZQqX0XRSUdol+zaaYyqkFqxyM641eIm4jdJh6Bh2O
	dTFFtF0lZG3BnLctn9aeiqKAtmzw4Fj83/cg==
X-Received: by 2002:a05:690c:f86:b0:8b2:aea2:64c5 with SMTP id 00721157ae682-8b341b11f7amr7066287b3.96.1793943816271;
        Thu, 05 Nov 2026 21:43:36 -0800 (PST)
X-Received: by 2002:a05:690c:f86:b0:8b2:aea2:64c5 with SMTP id 00721157ae682-8b341b11f7amr7066117b3.96.1793943815822;
        Thu, 05 Nov 2026 21:43:35 -0800 (PST)
Received: from x2e.lan (108-208-224-205.lightspeed.gnbonc.sbcglobal.net. [108.208.224.205])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b33f884790sm12162267b3.41.2026.11.05.21.43.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 21:43:35 -0800 (PST)
From: Tyler Baker <tyler.baker@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] ASoC: fix the x1e80100 card after an ADSP restart
Date: Fri,  6 Nov 2026 00:43:31 -0500
Message-ID: <20261106054333.2748248-1-tyler.baker@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: OGyAD7KD6Cstc0uj--QVY_84h5AkMc9v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAyMiBTYWx0ZWRfXzvMUJvjMGh41
 EEUjqN9AXwvYYgqoQdS766OLVTcu4a67LlfpuhPr+yHyhvliHt0jZ9zVrsdCuMQ9dSmR77+jb3H
 T+2OwSNNHnAyB78zunBEAoTCOXW2fWkw92qse+lhoc/91f7jY3jTMnda0nGpA1xVZhxyyfRPWq8
 IyKwtc9cFCKEQBtczcRi5vZ2URH+99aReyrOVSddKarToBOzAb/Qu3S40R8l1kvDxDdPlTXrwYX
 XDwJAXdJzbQECrwWjDUKAAnY43SPC6z9y9oKcF1UpvuV4KENtvC2n7Hvy0zTAP/7sOe/Mr+YKwA
 tIeANnEmArUTy9wstq5tOepMLKXSvTUNG0o3gW8z6JxBOj34HnHPLVBkcmXdZ3l2pm1/s+pOMNy
 SewRsYXPW0JUF8Orzjs6vKEI0mGGzAUPC4dfEjULYHDIZFwQHZFejlW4l4aqrob55EE2EfaJjWm
 9kCGi+ap4XFzCJe8GqA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAyMiBTYWx0ZWRfXxaBFL8mS4ePT
 tYu+GCTQp1SNbZI7e09KYikWDaIkDuxdLjrxBrX5VrOWkLQarwB73w0Xqawtps4+6c9xORloNjg
 tx3ZNEEt3Dow3EFryQm3oLp0Xjp9MTQ=
X-Authority-Analysis: v=2.4 cv=WMzqzXsR c=1 sm=1 tr=0 ts=6aed6909 cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=PFxtTy0squD/fJwW5Be2sw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=ahqmK09zdcNxaaV6BQIA:9 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-GUID: OGyAD7KD6Cstc0uj--QVY_84h5AkMc9v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060022

On Qualcomm boards an ADSP restart unbinds and rebinds the LPASS pin
controller, the SoundWire controllers and the codecs, and the card binds
again once they are back. On the Hamoa IoT EVK two things break on that
path: the DAI link names point at the SoundWire controllers' freed
strings, and the headset jack is never recreated.

The speakers also need Abel's reset-gpio parent fix [1] and the
gpiolib-shared follow-up [2].

Tested on the Hamoa IoT EVK on next-20261103: ADSP crash idle and
during playback, the card comes back with its controls, the headset
jack and working playback.

[1] https://lore.kernel.org/r/20261026-b4-reset-gpio-parent-to-gpio-controller-v1-1-11549e6ea930@oss.qualcomm.com
[2] https://lore.kernel.org/r/20261106052851.2741296-1-tyler.baker@oss.qualcomm.com

Tyler Baker (2):
  ASoC: soc-core: copy the DAI link names into the card
  ASoC: qcom: x1e80100: recreate the headset jack on card rebind

 sound/soc/qcom/x1e80100.c | 18 ++++++++++++++++++
 sound/soc/soc-core.c      | 16 ++++++++++++++++
 2 files changed, 34 insertions(+)

-- 
2.47.3

