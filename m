Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3003B52759D
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 12:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792066893; cv=none; b=Jg8vaYQIFHK+PoiA8gjD/H1BjwPAkfzRTgxF9GItFcYEUNj8Bu/ZBN4/rXKB4xWp9zj+ms4Sq66ZCvcVM1INXOviZrB0zkf+lCYXt3kHvS6YumzJuwPEmt1Fot0XsAKMdlt0OTgq0kY0zsPm7VYgALyIBWC0ubgYgvUYc6owszs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792066893; c=relaxed/simple;
	bh=Wze7BopAd+EmWC1Uc0aVJpdVDI8Ue7K/O1WBlJdyYv8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W3sxgmU9izbQ1t8LYqaxTq4otyj6OJZ8xcK9NfInplca7yiHb2+oDsrUe6uqsrShLPuzKXAA/tPcCdEXR72L9KzXrLo5LF1JPUwpmc2KY9WttrmrrwuOXy4YzLLRqDpDzeDNkmMioMHiEnlhbqCWtu8GVM8H/ColvGJy30mFIPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cUKVqd1X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ivxNDHy8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cUKVqd1X";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ivxNDHy8"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jT9E2809328
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 12:21:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uOFINkoyaoIwUdShZgLDnM7JgCoxlJqF+XqCJgYS6Rg=; b=cUKVqd1Xe51I2+l/
	JkxqpjvowwnZ0Mh7V2dXR43lKe5YBQXPIpP7MuaJ7vlfpNaMoRUPuwv9+s8Wwmz/
	noLlSZcdHmLvd2qOuFzKk+KEsXqL037ylSYh5n66qeqlpPWxbEP9491ZgVT9JmJE
	YUtvDB8R376h6+kFQeiBCy8fnlULXFrMY7EpuPsqn8CPRq0prAqRiWmsjLxfzoii
	IM6piZSFpNPQMX7bP4jlqKYSDxa4+AOFnF8Jz8KpbZF6MtPm0jljtYWMD3TR3woZ
	OmT70xh2jtCszoWZTio4t2lJM1g2BV23SC3rCdNYJfUJN9NLQ0dCVYHx94wZqcV/
	JytFzw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4han54tgvw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 12:21:30 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-934963b2bc0so1000455385a.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 05:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792066885; x=1792671685; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uOFINkoyaoIwUdShZgLDnM7JgCoxlJqF+XqCJgYS6Rg=;
        b=ivxNDHy8mLpk7PdgfKLW1ixgCa7FGMVuJMVoNq2hEWZF3im6eGZvdkxMnPBr+fkcyk
         5p2szLoy2+x2I+bG58RQamvFkCbwMpPChAPgkIqo/UXk4Bncd3EMEWPdbm8M8PbRf2xx
         tttF+T6iX8zllR/CwWWhzoixi+q/X+IbzRSoXFNfCi+2jwsrRO9H8tONgkbusenjq/kc
         D6FmWH6wIprZpOJA02dDtYGyNaRDwyGmh4aOT8YGtOOzkqH7tsL+IUUMHBwyIJcLd5K+
         U8svrElaT205ziy4IQQJ0lxVWJs+KLhms7J16qocig0cPeF6wwAfJhkMT8RPs2xGC/5n
         DYvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792066885; x=1792671685;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uOFINkoyaoIwUdShZgLDnM7JgCoxlJqF+XqCJgYS6Rg=;
        b=D9P5eeTBkPmhwrPMPpnfpUtcHBZw61t7yQ+AuW8mCCtMrYhuT7YQQIfNhJKfoQNTiu
         Sz3bndvqe3pIrnuGED39Ejz4vnyybaUoNXMNEC0jtm7R1/Qs9kxfZNHSR/v8BuqmgXjY
         OV+UpiPvo3GU/nJLN7StQ6r2a0r5lhMLaMrdCwgJdKdMhgpl8ZVojV6ZfKNd1lGda6sa
         1W1gn7X3mClXXlwFhKgf4AZESdiLi3O86gHLVyH08xqpTcQBUrrmENoYFSk5khjVOe46
         5b8u6wF5E4Y7dZNg3AuG4CXTrN0rKnOsMwPvPhc3UQCePzn/qB0L79Qs224gqYxZWgOE
         qzog==
X-Forwarded-Encrypted: i=1; AKwUvBz0hwGCmXmOwvK9BLXsJQ3xf15RWlCW/BMo/ZJpPKGmc2N0kqw3Qh8Qb5pIGtnIfCDQ3eSD0iWinYTZFTY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJBxcMNqtFlc8ShRL05rjFKlwngQ6mjDREQHJAiO9LfXQP7vWS4
	GwmkM6stGszpHRsNNu2kj0gFT1C3jDgOD+mJCtzmY3eDMZnztZv+2Kz81I3lJQ/jZQOHbwuMBVZ
	FLVPkm9X1qRd3xlNi742E9Pa7cn8TrmtJWix9d3RN/JxAvDPZhamXT9KW2KYXGV5giiA=
X-Gm-Gg: AYBFou3PcIOp/oJfvKq/Sc58p5YVE+xz1sQtFXUnuAf09msv8Xiwz0ucx63+fNqQnCP
	fI2W6ldZ5+98kbRIxaCrp8OV23PQIon2yO2Drz4mn7Z42LEyAt9xNJuRyrJp9Y3YEWBJ1XdFVCO
	siY5FC0Z33mEn+hBZPeLZ60lfCASxFdE+Yzn64WqUEt/etjy4f6cA5NHTFzLEQvxRcbznuBFGxH
	ZVGk+U1xmFPZxDQeJI7QYstQ/IADg2VPtCPdyGF39cYXelTXaSQik+jlHqZChmtxOS2bY1cjYUX
	rYBUJL49ZUnyClVqFaOGXBPLCYwr84tORzPHG+WviHJ65/cr5/hk+hVja3UYlSkk1qMihR9gVK2
	IqhPDibpLzdewb8i2k166AOKm7RA=
X-Received: by 2002:a05:620a:470b:b0:93e:c12c:43fd with SMTP id af79cd13be357-93ec12c4a90mr2887412685a.74.1792066885351;
        Thu, 15 Oct 2026 05:21:25 -0700 (PDT)
X-Received: by 2002:a05:620a:470b:b0:93e:c12c:43fd with SMTP id af79cd13be357-93ec12c4a90mr2887406885a.74.1792066884748;
        Thu, 15 Oct 2026 05:21:24 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0bc5e0asm18551537f8f.50.2026.10.15.05.21.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 05:21:23 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Shenwei Wang <shenwei.wang@nxp.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v7 0/4] gpio: mxc: misc bug fixes
Date: Thu, 15 Oct 2026 14:21:21 +0200
Message-ID: <179206687877.10309.9401675786609225009.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261013-gpio-mxc-cleanup-v7-0-c4d769587d3e@nxp.com>
References: <20261013-gpio-mxc-cleanup-v7-0-c4d769587d3e@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=RYQFmFtv c=1 sm=1 tr=0 ts=6ad0c54b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=FbT2nVsXUnx1RHKrfWgA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA0OSBTYWx0ZWRfXxzbVOLX4wLx7
 yjoJrM3QihGhQcmatRJMHXAVZdso4Inbv3ki/sVV3obE6B7RazPE4mtSWZJLEtnlrkUFgoJFXP4
 zwa8aSm8ew9A/5wXrZ5gf8qESMFdyVFcBQaT6BDyIy67gzzt3ejJ2+P7DQWQnZupyYFWrc4XQoI
 gGIc41R/pOPwOwnI84v9rmtaCk5TlivzB7D7VKYCtwGVM1/D/5kO/tchJ9VDUnzNV5XuOt4/0XG
 38gw9J4DQXQvFYg5CLwLCsSfroltOK7GVfE6jSoecZ2LebZbfJT8qN8GpiNZiNlQ7KXK/eVxrCv
 uHkFlANgbcmx/CJTDErjlREauIC4OPiw6TuzpzTkNxNlL6O4nSJpCrg0uBoM22HB0GDMOW3RwEi
 +5yPNPQL+jbAjlxXHsB4qMX+mzARYZxkrHr4RvlrhWEfOBlX4XIiMYPK944KB2N1zulC90gbrNO
 3G/NyMA15J1/dcqVz1Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA0OSBTYWx0ZWRfXwLBEjGyOUBTn
 jZq6XoUvTZI8ct9iOpF/JK2715R9a/rzfAqgLYmU6yuG+u2nK54rP5vM6aViroznZMbSEUryJYV
 XOL7jTbkqAd3QXt0tF8c6K2u/F06T48=
X-Proofpoint-GUID: StCVy8_7EGzyJR9h_5kXenJytEB6pLm7
X-Proofpoint-ORIG-GUID: StCVy8_7EGzyJR9h_5kXenJytEB6pLm7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150049


On Tue, 13 Oct 2026 14:01:08 +0800, Peng Fan (OSS) wrote:
> This is a subset focusing on bug fixes, that separated from thread [1]
> 
>   1. Fix a race where the chained IRQ handler is installed before the IRQ
>      domain, generic IRQ chip, and port list entry are ready.  An interrupt
>      arriving in that window dereferences port->domain while still NULL
>      (mx3 path) or walks an incomplete list (mx2 path).  Move the handler
>      install after all dependencies are set up.
> 
> [...]

Applied, thanks!

[1/4] gpio: mxc: fix race between chained IRQ handler install and probe completion
      https://git.kernel.org/brgl/c/38d44f78f041ffe60c8e2443b99434a199e7541d
[2/4] gpio: mxc: fix both_edges bit operations
      https://git.kernel.org/brgl/c/b7719c575dec69146f6d537fd616b27083c0cf45
[3/4] gpio: mxc: fix wakeup_pads bit operations
      https://git.kernel.org/brgl/c/170aeff46fb54f41545c85a72aec525aebc79d44
[4/4] gpio: mxc: fix race between gpiochip registration and IRQ domain setup
      https://git.kernel.org/brgl/c/205cccd06e545694754e1bf8d626ea96e742cd8a

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
