Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793604739;
	b=yEEghra3k2VvnfI7TQuoLE9AB8Zy+ZN2jFVde+id+Opb7eMXP3rdKebWvekWMmqHo5oe
	 C/RHsTMLR/CUqMrdpFV8zIUEu6Bx220Mni9i3/YvpKKIX45UZYQ71twg9Hr5Q43k/M1Mq
	 yi1nuoAP4u7V5twU6DrBE8idEZhX/F+F2BVvSp09C5Hqk2cHMQzQpk2chLIbbcFqqlBFm
	 7LchcQuEHU71poCN7VBDl0DCn4MYCFGxDGkdFYpLCqwaZ3XhCoZvvIGz4p7g8k9IcPqAp
	 s8qvxDrwP+t7GeafWMstAg6i4XMwtpRncOpn160ghhzxzN8uFQodj46c/YxUYB6sXjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793604739;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=P6mFFCiL8lIPiaMGx8F2iqO0rpdGKsv7l3cO/bPM0n4=;
	b=VMe5PZ08n28A80N7/l+aej8z5YFDN+x0/Jvm1KdbHlGucb2ZO737rZQczZERPlVKCCgI
	 /SywH0OBaAmJXOuaPqpaFx5/xHLnkkv0TV4wfXlR1ksA4mwnjePbVJygMnPmAgM6az5Ds
	 qo/ZrGQHApFFg3Br9A+OzGrCLgYhiA02s9u7uhVsBU+umrfm0OtstiKo5winJeoKnZlKx
	 4rcaVT06gxffy1MdBGltOYxxJW1u8dcEHzWncyUJOr9MGSNCcsnGQkdgB35PNWuIya37K
	 MIHRjRRh4wYSl2+SxFJGsfV3pnV+RuwOhcmKxR3GxOcPBugYYbB66xS3YzSNkJW2ssA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dWonRU4Q;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aRHkkdTK;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC38606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 07:32:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBC38606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dWonRU4Q;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aRHkkdTK
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A23vUrQ2192519
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 07:32:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P6mFFCiL8lIPiaMGx8F2iqO0rpdGKsv7l3cO/bPM0n4=; b=dWonRU4Q+/LEfOMw
	nvCbJdrIzu4jsc7tq5zoseQmsFCEOORMyF41B9D6chd9bfBM/Q1G6mAW+whh9MYT
	pK9uxM+o/4vH49BL4t4bJTt9bifuHeSYg2sLJO0JGm7fC8KrZp3rsHI+VPQKccqp
	uWoj4T3hYqHBn5+R5q/mxN6L4zpxVnGj8RI7o+L8Fi/ZAmTLXakkHqvvOkICLAXm
	13HLDGNQX0Ye0HbnBimrwCqeDk1isaPwT/nRUKTUvBXC07TdPus7VTVObAmO/CDR
	s4thpjEpLAnzk81nC3dDgq+SVevVQHemb+Ohd/6XeAo1pMSLw3aqrzPWp1SFl61Z
	60mhrw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn93enj7b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 07:32:18 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ea785a4decso33000945ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 23:32:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793604737; x=1794209537; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P6mFFCiL8lIPiaMGx8F2iqO0rpdGKsv7l3cO/bPM0n4=;
        b=aRHkkdTKQXybd1KHGc+2gPPwqinsNnb5/6EUZsCMH+1okFs2J1fjS3M43zOdMW0xwZ
         3baE0JcjtZ1qh7Fdd2MkTw+b/CEsRyNcfckq3pFjH0I960LpyH0Wtnj0VDHEuzWV+1NO
         iwdS/SmD9QWq12Jfmlh6dOOyzcUc4vL+ebeGEh4ckqaMKC/UjMfmMX6priQtsIz6Tc5k
         Q97f2Z/vetHiAknOApJUszJFcHGV4VZ1aTulCVgY1aLHCfJAfLrlWVSdmMZHCzK8Vp2w
         RuFSZbgjVlDD5dB1Mjj+2ZbpBFBDuIaqj4nuWYUXsJo4cLfVrxZ3Ez3QDrd/6iwt5vSx
         vTzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793604737; x=1794209537;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P6mFFCiL8lIPiaMGx8F2iqO0rpdGKsv7l3cO/bPM0n4=;
        b=vhCMe5tNUiyfwlrSYCSJTCS+eWbcXmdkZTWQRRgCi3227kszDJzXqbB6wYNIlK0JO9
         au8TZbc/AvwogVFHp83iCSV8UULR0J0VJipzFo/lB+AMBC37LYcy8MLGMQztU5zs8Dy1
         u+TZIPlYWqaq7+DOJIwuUdJ9cVm6dhN12CvZofSAVwpDck9QXF6A8a33C/dQZ7knbcez
         0TzLuaNBKK0seL9gLiCyw1ISypDF4U4+My8vixbY4dPEDN5RJ63kaLZ437hBaGKDh9vX
         qhOgmsD5P2WAttkqIYshEMG4TG5VP8QK7xR8dolNSC+KGkgju6n2YWZHjd5Wo9s0tTsL
         JAjQ==
X-Forwarded-Encrypted: i=1; AKwUvBye9VMCCDb39d0gpMC/JjhI2KrrYq7Y7ybr9OWOZWEZJcxfz80ulgSY7+fM8LtwMPa8sUB0ViiM20RI8YE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/JWY+2DOcXgQmVf9QsAzhLjbu6qjicVQJCphDr1vnhFk0OAPyR
	D+lSKlqLu+6qvocuixweAFQlelzVR4NGhRg26JOUSipkhK0aW++W2aA0pjqZZebNcY5e78au6ZV
	rjYPEqGvVxU8E6bzpi0ECzjrtv5QW1QK/3hfOedGyP32c0h4pKpsI6KXE4r3sv6aQTXg=
X-Gm-Gg: AYBFou3Qoe/T6ReY/kMMvJR8xJC0gIKjHe8iCOcvzzS1RK1kDZnchntsrcVBrzcktOE
	4m2Uz2TlrcQaJb8QhOb3Tdv1eB71Bzx23i0XTVlQ5BFXdvouLn/8z8v3dJlKBiZLBoLzO/N4/RF
	DfeQkHmRpZixgdPOcR4Xe6Mf3gv28uZdIKVs30ekEhvdZgqrJ3xnGPT6cZbJvw2WvogoldaDuBS
	xfqFg2pTSiqmAjaIg46+kupqT7oLxPY5e88p0PIipa97GZGty2dnspcqSwal/MvIyivGCWhosts
	zQCREf1dPzxs1PV/J9ZlozW/xtrknZa+I99Gnt25IbwsD0CwRpBg4ZeVaz1HX2k+FjQZlvj/gYP
	7LggXVjiO5ckQAbxAoJnqNujYT4emJcPHelR20/3zTU3jkzldv6TKr5RRo6siZQli5aTMF9heXw
	bUhRz9
X-Received: by 2002:a17:902:d4d0:b0:2e5:1069:fc11 with SMTP id d9443c01a7336-2eb1aab5040mr79983445ad.1.1793604737356;
        Sun, 01 Nov 2026 23:32:17 -0800 (PST)
X-Received: by 2002:a17:902:d4d0:b0:2e5:1069:fc11 with SMTP id d9443c01a7336-2eb1aab5040mr79983215ad.1.1793604736850;
        Sun, 01 Nov 2026 23:32:16 -0800 (PST)
Received: from hu-anantiwa-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb39052f0fsm23861775ad.11.2026.11.01.23.32.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 23:32:16 -0800 (PST)
From: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 13:01:35 +0530
Subject: [PATCH v3 5/6] arm64: defconfig: Enable PWM_CLK for backlight PWM
 support
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-lyra-display-upstream-post-v3-5-7f660c3b622c@oss.qualcomm.com>
References: <20261102-lyra-display-upstream-post-v3-0-7f660c3b622c@oss.qualcomm.com>
In-Reply-To: <20261102-lyra-display-upstream-post-v3-0-7f660c3b622c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Anand Tiwari <anand.tiwari@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793604704; l=756;
 i=anand.tiwari@oss.qualcomm.com; s=20260717; h=from:subject:message-id;
 bh=D574Y22uTji1IMYHtzDZtLzIycKBRn05fzUPAQ1Xe0U=;
 b=/ZryEtzmyp06P+iMnFK9/3xFBaYu3B6I0tOctWwl5MAOe5aUs4FQw3ghXnuw/3LmliZqtsg3b
 jw0bmq+2E7hCcOU15UUe4MdnXg8EggGKKKH0DVUrX0CF7blBAziNY3s
X-Developer-Key: i=anand.tiwari@oss.qualcomm.com; a=ed25519;
 pk=ygURjl6LxwG8EhgPNHYYgCZLsaXFgWZZoHRRyud5B40=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAyOSBTYWx0ZWRfXx07UnFK5iPq3
 iSEON2mULlN6+bKO/8YJVdq3O7hG1BSn9LBsyrIQubyYpaf7h4a3PF2uxORWJjtNAeMe0w1d/J2
 fylocL2WEUgiKWJKFm1pdC4vGgOFSrzk1NS4fpFH+i/BEL95xnqwAqPUDpsf25ABHXLYnangwjp
 8jyOWnkPQDpXBOQYCtqD9OSqQXhits+h7yu9bUPANgxYVg2BzOaPoriX/bUIPTwT69GARQB93hr
 HKmQMZb+8i0SHqXsmEXhV40XKm4LFC19F5My/6Vmxa12O7dtRA8t0bwoBYD1HAvok4xQ+C/l3MV
 yTHr0DQZtI2mIwwM7gh72CRJENy8OwvN9gxdmgi/9J0c0IPqBV4be5dUjGe9Ya7u8kEJau4F+u9
 0NuW05HWcMkvewJAohkH3oMmXF5fcxV/BYSx7L9e9AnAiuH2wscEUgX1Chv2rgfzonW9WfxcJD/
 6uxNTTq0vH9EfOOopTA==
X-Authority-Analysis: v=2.4 cv=FciiV5+6 c=1 sm=1 tr=0 ts=6ae83c82 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=FxRAHWTHE1z7yW8SwP0A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: 62eacs-tvTDnUKqkWIZnuQSvDOlSJsur
X-Proofpoint-GUID: 62eacs-tvTDnUKqkWIZnuQSvDOlSJsur
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAyOSBTYWx0ZWRfX0tv5pBGJks3R
 DZE57dRrEyVvkiC/M1ycsPKnWXYBe7nqB7rumoeLXSbHWM3Sn7LG7EVZBuB9zzpqw5d9qXfNK6G
 iWorUmZB3SOeLD8C39WuGMvsCEztM88=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020029

Enable CONFIG_PWM_CLK so the generic clock-based PWM driver is
available, used by the Qualcomm Talos Lyra EVK LVDS panel overlay
backlight.

Signed-off-by: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 50d6357727af..365a69470d13 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1620,6 +1620,7 @@ CONFIG_PWM_ADP5585=m
 CONFIG_PWM_APPLE=m
 CONFIG_PWM_BCM2835=m
 CONFIG_PWM_BRCMSTB=m
+CONFIG_PWM_CLK=m
 CONFIG_PWM_CROS_EC=m
 CONFIG_PWM_IMX27=m
 CONFIG_PWM_MEDIATEK=m

-- 
2.55.0

