Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794910854;
	b=Rr5D85C+k8cOk8EWmft2UlxoVDmF0UGFnGZKzpKafl0NvU07SjjzCdATPgoLOq5BFTpD
	 TPF/NqwDZ+2cgWeoD70vw02foN6SKFN6ZZZcd5ciTwLth6p+vto5hNXtOzOYz4GOjYWZn
	 TO3sKshn+JzGoyK2XjWIWGyFuRVUJIIuS1AyGbmNyoavKFDZ0MuZ8qCyXYtwNVaTb2yT/
	 fKYZMbctuhZfM8F2XAlEsV1O0Wh2zVybeZhQy3ynCktAJXwEdE0InGI5i6WC/dQr8Ng1p
	 WtkjlEqRLLG0imjOnHAAPD36+T1uTKuvmX+G84ElnLg3L4GSQ+R6q/rtPacY/749ouQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794910854;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ilGgLF8asMhieoRjJnaDA152krpezAwFlFx6D0TT66g=;
	b=s+HlOlAF5xrpBKrb7gIPhhUuldK352iIZaCogkKAyCuEJrth8i8cWPVLlpijMnrR53pj
	 wOTUKUPTdgSfZqOthaR2d0xf1BqBgByYGLlqNLVAcDrMYwDEa4THNuY7lkZiUbYRSVBfK
	 hnf0aH0hEHW5oX/qVMDMFqgbfCXOwAsuHIhONsk4F3rmL9MEtf2250MgqkZxO8q1WR+i2
	 NuvXZf/rfwqe4GKD9/YO4xFudA1OCG+YLnXdg4/8OJPOEBZxlqJ7TAwtPpIo8n0djHJ1o
	 8FMnc1IvbDH3dgm+9O812p2hB82V7Z+ot8OtIK+VuO+P7xWf7Ar6dp7ddO4yvlKt+mQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g94MOWNz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XjODMonJ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E2F6606A329
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 10:20:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E2F6606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g94MOWNz;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XjODMonJ
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH8i4tT2935297
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 10:20:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ilGgLF8asMhieoRjJnaDA152krpezAwFlFx6D0TT66g=; b=g94MOWNzth+xBunp
	hOmkSpvC0JgQ6l3J4MLRkj++1Aj3Iob5oQovsEtW/rMKc+iynR1k56o2ngfn1sH3
	vFQA08z5vD9negODGIgxfl+5WF3jA1PGgCUYTX+nSAmfit/62phKuKqcC6P7GE4e
	+MtQjH+dvKjOLYUUSLcKrkJsCXWEduS5SL+ZS4L2llzptj2ReP1OmQsCptlWS/54
	4q6Jz12yReAngkZgMpRZfEOsZPIp8KSJSYRAegwpWG371C9fooXkxEvbWqKJTwG4
	+CLaNS4Dra+DQm7j2s+3LVgeJsHDfFmAm1RG0T9ZVZVf+2yA1mp7+iHDPPrce5/b
	8vCRxQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j09m0akj5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 10:20:53 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-947a607ec40so429240685a.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 02:20:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794910852; x=1795515652; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ilGgLF8asMhieoRjJnaDA152krpezAwFlFx6D0TT66g=;
        b=XjODMonJHXxpwmhfHq4jCOgmc+C0k0FJ/3tCgftZn7xoWqq5O7W1TMTD9y3lktpiHb
         qrqbkg66GQ/69oU7KRmgsTxj3zPEB7v3Coe/hL1h6Q6QvkOTNeSmfq34hmJR1BqT9URR
         d4qWJO7oZqPbqZkX03vUekMTwneoMpXkW1WyBHlOsDKwQQMR9eCiSGhwNQ5aO/gtLKgm
         XqJyy0salEvlvGVWTy6xaKmwYnQSOAzwDpTJRe7RDvrfb/vcMaQ1qkH2U7pe/1a3XjPg
         APZskAdmn7AM1+J/yJ6pqTs5CePLMQ65fY5FWE+QnLhMTImzMjVoI6FM1NQzY/6NB4Mb
         bDfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794910852; x=1795515652;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ilGgLF8asMhieoRjJnaDA152krpezAwFlFx6D0TT66g=;
        b=XUun3qEK6jpJzSt2uoFM+CrFnJhtRNuN6gadXAVCKpOxF+5nzZJHBeRBHhSY57k+Lh
         bgR6KieIFP1LXGplSFYqeJ1naFgbMv2W3OfNRFT8IuayaQBrwpY+LvoveWGDc8p+AFjG
         2R60rm1S/BtaCllzkxRmdHrvJ7y51+AEMMQXv8F0B0ZtWGrpGB4ImAfy6Ea0jggz86ZU
         qL/KN+91zYTAJ7XnXp72U25YKliPAzdEGPTSBvg9ivAQxY59GQeoQkNiSZSMK6CWXUBY
         p8vX9Z++e1BZn7qaZHJevyV/G+vjzRpiz6lTIKU9IhhQ+ga7etb2gRPotRY7EXKL/HW6
         ARVg==
X-Forwarded-Encrypted: i=1; AL+hErHMTgl5Z7A/kMq+k6GjahyK1HQNUMTo7Q8nFf835XIEx6YfBZm5z3ln0jLl+pHMeZ6wB1gGDAbmcHmaMm8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+8yHkP+FSysWVRLqvOaRgL1iEt9q0cvPb7qzx5kREwKKBtFnmQ
	3Qim+15hHpdkoEn7ADUDsTSevhGhpnvtblbufajNM7hvWtCmy1k0rhhnt8UyE7BHgkXoD1fP4wb
	Fy9XCETFiLTJi6Iz2jYd+lnCpbor/X0dKMUfkOjOK+yCnZEFq78TvQo/IcnW6a/M099c=
X-Gm-Gg: AYBFou3ECMttPXNLVWPrZX1SR53D1mnvZ+ZbCPVNJTa6d/wlzgYW/WNl1Qa721pYr5x
	m2HeOaYlDC5QICtaGDDuj4sdTjlyAce7I6gn2gKylr9N+bMDoyUisrqQoRad1L7c0N+XqowVdbM
	bCOoye3jcpV+nkfi0qoWWoErRCJCSRW0JH9Edxs9t22fGpFYsHxYkfVuIVHvP8UPx9DY1SFqXYO
	qFTyRPPGIyxYkSlRtiTdzgr9CcBHCYbHgUuThZ5AylOvPXicLCqQ7s2bUe63SsRGJRneQABv+9E
	tjjHKgF7aLGBa74ExYzZ89/MnL0y2kouIETFYxCxgkrV6cGw7s/vbiksHN3Zg8o+nMJdEzu/MRB
	GD5u8//2efiP17VAWL+uUXybHPZsSwWrUYyI4bGGKf19vioJN40BQFRPYJkv/pnoYyfJrEMsuC3
	s=
X-Received: by 2002:a05:620a:4592:b0:93e:e2ec:3bf with SMTP id af79cd13be357-9494bcc9ef9mr2151887985a.78.1794910852108;
        Tue, 17 Nov 2026 02:20:52 -0800 (PST)
X-Received: by 2002:a05:620a:4592:b0:93e:e2ec:3bf with SMTP id af79cd13be357-9494bcc9ef9mr2151884985a.78.1794910851460;
        Tue, 17 Nov 2026 02:20:51 -0800 (PST)
Received: from brgl-qcom.local ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb783854cesm90386485e9.1.2026.11.17.02.20.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 02:20:50 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Lixu Zhang <lixu.zhang@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Haotian Zhang <vulab@iscas.ac.cn>,
        Alexandre Becholey <alex@becholey.ch>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        stable@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: ljca: Validate the pin index of interrupt events
Date: Tue, 17 Nov 2026 11:20:48 +0100
Message-ID: <179491079451.28213.15188778805240746031.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261113144432.1354180-1-alex@becholey.ch>
References: <20261113144432.1354180-1-alex@becholey.ch>
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
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA0MSBTYWx0ZWRfX08LjjTKzlALf
 l5DiuLY9GMuO2zySUocHZHBhYp2+xY/IJqDqm+NVICRLSom6xqeVi1n0T6Af49skh85YVE1U33v
 Jdb8lJXFoBiRlAdp+QoVypky1ediaUU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA0MSBTYWx0ZWRfXxF+vM0c5SUeZ
 hor8In3PWWGwoCJ/6JVLYfizn+MEGo5+1JdZ8EpVivncVv78yxTJoBs2iSmLleRdxTotQf6A6O0
 mSm2t3/RI79ukG7a/vQZZ1Vms3eaeuP5dPCb5waE1OJ1oCTzn/euh50OH6QEE618Ht9oJo8aifT
 9nIwXbKnrV1Ah1TelYaY8+AKeUm110MyTp5e/W/xQxA+QBaTK7KaWuTmw1SJ5H7NwVAV2ZU2Cwu
 uL4HcxKuDoDmu/WhqFpvq3UeLTj6K9N+U85OgZ3hCmc+/lwfsXKkG2tEprZmUe1cr7chf3859A/
 yb2ltwgWTTOrwevwXzC0NVS1sYrTPLAlCWbuEVhDK5K3xTU7pQkVDNkNsMl/x2+KCL1Ih0yNE2B
 6m6VRy5uE/9j1FCstp54+GESr64FctG9iPisdqSejQd0UUK2DrIsBVuISitoPipTGPiHR7JXZvM
 To9Da4BnW82fA0gw61w==
X-Proofpoint-GUID: KD55cRqZVMi91ml5kawdKQzqoXECzrrk
X-Proofpoint-ORIG-GUID: KD55cRqZVMi91ml5kawdKQzqoXECzrrk
X-Authority-Analysis: v=2.4 cv=F7rC5ahN c=1 sm=1 tr=0 ts=6afc2a85 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=tYqXyjVJoe5DErGjTNgA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170041


On Fri, 13 Nov 2026 14:44:58 +0000, Alexandre Becholey wrote:
> ljca_gpio_event_cb() takes the pin index of every item in a GPIO
> interrupt event from the device and passes it to set_bit() on the
> reenable_irqs bitmap, which is only LJCA_MAX_GPIO_NUM (64) bits long.
> The index is a u8, so a malfunctioning or malicious device can set
> bits past the end of the bitmap, in the members that follow it in
> struct ljca_gpio_dev: the output_enabled bitmap, the connect_mode
> pointer and the irq_lock mutex. connect_mode is later dereferenced and
> written to by ljca_gpio_set_config() and ljca_irq_set_type(), so the
> device can flip bits of a kernel pointer that is then used for a write.
> 
> [...]

If you have an LLM write the commit messages, please ask it to be more concise,
half the stuff in this commit message is just slop.

Applied, thanks!

[1/1] gpio: ljca: Validate the pin index of interrupt events
      https://git.kernel.org/brgl/c/e6e2181c6920ff59ded349a100f80cf85d074601

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
