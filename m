Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D910E367F2F
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 17:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790615749; cv=none; b=rL4O0545dT05c7UaNrra2H+gSSX6/liFoHRaiOVMEKMxs675E1gIjjjQQsEJXShCbw9+eT7vQ3TdfMYXWxVRQWwIP5ku+PK8QlY55SieTgR6dH5gkK75Z8mKqXJxJQraXm2a7vE45LARXnD9AmmRaO6gpVWewnfK8342zGi8nq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790615749; c=relaxed/simple;
	bh=Q4Mh575eg9v5h38oPJgTx8zyEZnzz8QW4/N5Eo9TN0U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iewCORWNJBlXDMG4YRUUhDgfTT2dXp7882LpnkJZndu+3VicXQJlFkde4CcYGpAZnyYCl1Atm2q3wJDJkOnMN0C4s/QobaXr22T8/eI0BD52n+b85vHjJrGc9zd34BvePmSQUt/IIw2M2Y0vhXSrMR2lyXvlBU+anjHWX5yZ2Tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ko+UlpLI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IoNu+9gD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ko+UlpLI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IoNu+9gD"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SEduLO1016602
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 17:15:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1u3D+gLRaugKbtqoIYQkJDsvnpTdBDjmf5rMgadGeF4=; b=Ko+UlpLILdzM90mZ
	1c2FDEHYSDlFZEhxMAwwFYoMIz8n+zMh3rcOFr9uK+thKVXBDXwUWcK4g8JEkW+b
	S4/CXX1msBPXS9HoCQ6zyacpHO0tcIYJ8XsUhM0LpLivpPCIu+yOC/rYUVsnW7Xu
	3b65fGsw//0A1x4kTeFwsW2IzI5qSnTy9N8zIKSombTpkh/IyVpSOkZltfMTFTpU
	T11Q3Pjv44ETZXEpCmFDLcCfDry8mcbeoTDspu7PgFA2/bVeq5C/YHxRn6uolSfV
	qUuvWZde7wtuqnauQluVIDotSRTWTBUITdQX2Vdl2bxKOg8Y7oT2surIj1CdD+PH
	VnE0Ow==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyebq39w6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 17:15:47 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-791463ed29dso2911422137.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 10:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790615746; x=1791220546; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1u3D+gLRaugKbtqoIYQkJDsvnpTdBDjmf5rMgadGeF4=;
        b=IoNu+9gDHgMY1VMiOh4sokKdaBtywGMhSZ8a3MUmNYK0gfoTapmq042ehsjYn9Zd2E
         BJ8TKvUwNDPt3jrcvTTjflXcZ0HVQsrAU1ZdDpPYRsd8tdwnBt9OUUqE2kUip9qGdoih
         8Gr6WzuA+9SYl6OxQswLhlUXvPeXz1LJPACCcYzMe1bxPIP11KjPf7xXkuAcLTLIdk5T
         eQAmreVhyvoIEYsgyCtid4Bl/RqA7xStW6PRbv5rPvghyO/z9bdj6biM2PRNpirSO7oL
         +cOIfwQz+S8k6Y43YtICqSUrbcK4+f6TreVUDOO+7UDR1NmM2JokophUioSe7yom/iLu
         ghYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790615746; x=1791220546;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1u3D+gLRaugKbtqoIYQkJDsvnpTdBDjmf5rMgadGeF4=;
        b=LkGgdrfFo3eXQo+L5/sUNBoOw/UmHDTEwCgcTayDBs7N3gEHoGjUzXGEEqlwrsrx7W
         NfyNg8PKDR4RvvATWA8tUBGtXYu9QdsyjRZUz5jrkUWyYzKApCakcfbMPRrGRNWmWGAe
         OsYvUBtCgPGAVtgvXZgbrH7algjHo6Dmpz1dwBOsn+Fg3Ek6fuYp028ruBmKwg3FkTGa
         IZ+g2gvBZDXe43la6ZHW9VzjIFiE06y7MaFfCUZhA3JQmNlTswUBhov4cAz3UU2/r6F6
         UYqs1Ix7QpqcqVimavX7WbBbMEU/5sc9PqU5pKit6TyPcfZXlfU6RCFlI5ZGGK/wLThP
         yzyg==
X-Forwarded-Encrypted: i=1; AKwUvBxT5DhDE0N863BsPQ0gT1wJa5yXkPXO7Whd0PL5s/RCxbYrK9AdJ5nxUwZci0SO8XlbKfehFyUwGhIqBno=@vger.kernel.org
X-Gm-Message-State: AFq9FYIv7IykDuMqrYT23zazLpVcDQy0S+pCqwgxaU6wYXOkAaTAQvSx
	g4msv0hxRSpoG/GsAGlTF+i5uVB6nrQesUKNR+Cv3AuHgXXUamiIyRXZvCp5J8XI64S0BoEjPHX
	1BmhXTBXg17IjmCbzUCjO9e0FGtCxUdnaYZHqtX3hyff8NbEl9LNyrZ2h0jbmBVswzhA=
X-Gm-Gg: AYBFou2AQXjygIH3W6kjbIBImgmQGBJCjq8p2OXbsBRvSVz7XPmLwQEzi7Ra0zxVW7h
	DJy2wc+QrUFWk5/WMbEIsiqOiozTsXdW3Dr52pGl7DK7g6qlFb4fZhKK1tUhS5tawpzJX8HXrx/
	bo4HNBxHjoJ78Q9buOZAFRaxcEJsQb7i1G0DjgJbpaB2RnRdWrYx6eCaEm6xey7EvFQuu4i92mR
	nqHhG3AJOlgqKfghQOmELS8hxv5nCYwLGjrWWJRUDIxx2cWzdzinKD8nT0uH24+/PP65FhlUpHP
	5+DrCWJ0gkRUurMZW9KXDQX3w5MdVY7V8CP0gjUdFPUfTOSCzHEWaquzj6QOemvDNl3VsTACwEu
	v92bEjLxJXwUf6A96o8JjS8WvjhPwwkw=
X-Received: by 2002:a05:6102:6a85:b0:7b5:6bb2:538f with SMTP id ada2fe7eead31-7b56bc1b855mr1331252137.34.1790615746025;
        Mon, 28 Sep 2026 10:15:46 -0700 (PDT)
X-Received: by 2002:a05:6102:6a85:b0:7b5:6bb2:538f with SMTP id ada2fe7eead31-7b56bc1b855mr1331233137.34.1790615745623;
        Mon, 28 Sep 2026 10:15:45 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1e:67:47fe:5aa2:fd46:9d43:a18d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00d0ea071sm5818675e9.9.2026.09.28.10.15.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 10:15:43 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Yu Zhang <yu.zhang@oss.qualcomm.com>, linux-gpio@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] pinctrl: qcom: spmi-gpio: make direction changes exclusive
Date: Mon, 28 Sep 2026 19:15:40 +0200
Message-ID: <179061573784.16260.12006529556377696896.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260927010913.1212600-1-shengchao.guo@oss.qualcomm.com>
References: <20260927010913.1212600-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: JyLKDVZVLrV8e26x1Sk8FyKZ9umSiVg_
X-Proofpoint-GUID: JyLKDVZVLrV8e26x1Sk8FyKZ9umSiVg_
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA2OCBTYWx0ZWRfXwDNB3p/u4Hhp
 vPWLpRKAigrFb4UnkwWzA1QYcUNtU6knyUhRSojr2AsY9P2H8YfZHlsAVeeTX21KRURIpgDWMzb
 3ahC2IAWt/LVXRx6Qqf7vf6DBFRT0uc=
X-Authority-Analysis: v=2.4 cv=EqRHPicA c=1 sm=1 tr=0 ts=6abaa0c3 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=AuevRWDVcb3JQNfGZAwA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA2OCBTYWx0ZWRfX2c8kIFAXIDyc
 ROMiKpD0/jXWYvjAY1UB9aLC1/P6fOdOqiP8MDK6WkI1vCRjAbh7vfkekc9IqF9Pz604mqvb9cQ
 Csats9su7myDeWLKYalUhIzwu75JL0qbgVRfIxlmEyuc8Ya/e4DMLL4U8LxFBCTMKdVMstM8Mfd
 PgQ9MLvHHUQbo+e+1k2tu3cqI0gjzN+TemA8prRNUcfsNd8F6MCgH0ww4L8/Hrbu5d+UUd/rYXF
 Ept48nUAUWsAOBRnLdO6iP7sSYPo3rYE54E2VUsUnjHHPZLJSytI1BsITAiHk4dSGwI9QXRybnr
 WvbGsZRQX6cpmpZ/W4+xIG+LU/TvF9BjepIwtpIh9MdljbwJZ7qvc4U5VDY+26BIBTpDDMkb6e9
 boDCctcxTy0p+aGGxqNL5KiENaT5hdjEP/PcwIz9w8NFyS4t4pk3UG0o3n0t5wQq7+cBuIxaguk
 IS98e72+yJoObtym9gw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 phishscore=0 clxscore=1015 spamscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280068


On Sun, 27 Sep 2026 09:09:13 +0800, Shawn Guo wrote:
> Neither direction callback clears the opposite buffer: .direction_output()
> only packs PIN_CONFIG_LEVEL and .direction_input() only packs
> PIN_CONFIG_INPUT_ENABLE.  As pmic_gpio_populate() seeds input_enabled and
> output_enabled from MODE_CTL, a pad left in DIGITAL_INPUT[_OUTPUT] by the
> bootloader ends up in DIGITAL_INPUT_OUTPUT whichever direction is
> requested.  That leaves an input still driving the line, and makes
> pmic_gpio_get_direction() report an output as an input, which breaks
> consumers that read the direction back:
> 
> [...]

Applied, thanks!

[1/1] pinctrl: qcom: spmi-gpio: make direction changes exclusive
      https://git.kernel.org/brgl/c/19fc4240358be2a25ce8e0a49a2819588ed61c5d

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
