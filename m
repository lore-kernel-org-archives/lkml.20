Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794302344;
	b=4HzrZKogbQm+GvajIKxSMeG1ZFoA+OO/7dUYfmfzze37q7XV2QP0wOcgki9GG+1b+70S
	 73Wf0h4OaGGINg+TjDchPCXDeKmp5MfH8cQG4j2YsoLYuUDDtYHFQ5MEOWZVWhRr9Mgpi
	 BT0CzT+A1iSJcnTgLrB8BB2vtwZ6hZJNZyusqLIDZcUPpUSHqsnJ8KjFevCaZZSfqLFfC
	 HwO1CB1hW8SgaiGtsqTThDKK1/nhqOt7dGNx1Wd1sRy+CayNU3BiffkvpfniZeEmMRZS2
	 oZu/X5ieSxRiITic1LiIz7TPOPuDTexXm28JY3KPyp0qzxHpBAtzp7MgbIv4hKRdWrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794302344;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=RrfbhJhpWyjn5vAaoJoaKtZ+zVmxKxTyBXnZ3krPL+Q=;
	b=ocnLJII1FV0rQHJGL44z9GRJYN/w4T4gsiy3RBtsIEDmc3M0lCv9pKWAgyobjerF3ROD
	 nYxdjjik9twRZzXI6qhwKw/jYbfGLvA7QmT+wmaUSkEFtQBP63+rw7lDRXUQeNTWjONEw
	 31vMLB3bxeWci5FwbxVgTfO0AozCF8kPGCb56SeKyMM9G4EPbju7zjAc/U726vmAnqa30
	 vPzCePNhGf1P0ZyYpSSZLTruW68tFP3EDXZU8oO82bCAEjWdI6XuyAl8x7Zng6P5sltMY
	 s+AEtPNZ4wkooWi7ti3EASmRcVjVb2Kd4cchSAUEFJ34w8QovUYSCcjxkazk+f+mBNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lGdQVQDw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SDqUyk+n;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6161F6076137
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:19:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6161F6076137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lGdQVQDw;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SDqUyk+n
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA7l6mX2433761
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:19:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RrfbhJhpWyjn5vAaoJoaKtZ+zVmxKxTyBXnZ3krPL+Q=; b=lGdQVQDw79Sh9JG1
	8t+u/9SE1w9T/GDpMW3jqAX6AqQHlngxI3rIix8AENJ8NV/bocMLECKXVkTVsXt9
	HXa3CMR2BcGNT28XH5HhLRl7rEFy4Wfp0YtPiJ9iGgHNXn+RbzCenwWA3csg7/DB
	s7P9Ezc/8AlMmofHYtop9siWG4WM391uMEda3DhZkWDi7VF7n0Oz4uhqywfU9dT+
	gcclxyMxa8U9lUH2HWAq7laq5FWoWKrnVMsoeYaTUYSo7MsejR3gKSUtFXjruPre
	Wdg2TLtNGyxodwHNkfWr927hc9gwlUTpjvxpoBzVFQ19Yhod1d9pjMABT9tXXXXI
	sdAt8w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hux848kre-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:19:03 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93e92aad34aso472017985a.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 01:19:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794302343; x=1794907143; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RrfbhJhpWyjn5vAaoJoaKtZ+zVmxKxTyBXnZ3krPL+Q=;
        b=SDqUyk+necOVYJzybnwYI2ofeiM8nlUZsEglufLnX8VNlNX/pBzqhXLfdgmhm80CF8
         pTa5DAU4ve0MNlFg1WEIoklPInTf1mQSXwoEOhPpbLqJwRNDdSIzVBE1ZNzYU1yakv6F
         1/LhZgwCURRXOt7wlM2NGegaKQHICQ2glEv2p2pZR+HRhOaDlF+46d9P1InUcye1btsM
         YzNIp7gCjEeUA0J9z3fLlIDXv7UQ4+5K6FipPkVrLBZyJ/FFwG15XdKIbeB9pJ72LnC5
         aCtbDNLmA1ntqfh941rHIOnN+aj3kxKFro0djmhuYesTgStQvElA0BwPUJMmQMejn/iA
         geXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794302343; x=1794907143;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RrfbhJhpWyjn5vAaoJoaKtZ+zVmxKxTyBXnZ3krPL+Q=;
        b=vjCX8v8kNuSPRSy3y8RbYyMmenUj9qvhUAP/8ROX1l+lh7u/NUA0dOxjhR02ZBwboa
         erGUryvCqoH4jTWsV2+ohAw3Y5ZtpVoukN8irNWISf3s0HE7LkW9A4NCV/+jf032/6qY
         AxlrpjTzEfCwIEEaQZIdw3zgSN8GSRPfvJ+JfcGbLyu24oRjceOkfeVgwW6iSHfVjLcI
         y/hyRQIJKCRm6le9b9jokryIT2NIB7+JPLGz5QBxAAd+ggrNQfyWv/65AI3AuQ7zRsj/
         QgqrcWc+YCWHZjXQsV4sxefmnSfHTbkPBKq3isgE8TXwhleaegDLlW42waR7kPVV42UA
         jG9g==
X-Forwarded-Encrypted: i=1; AL+hErEwrAfwM1eqdC/hnKESeIWgFQRx3WEo8zCiolto25JvabdaTamACaRstm0B5JtfEHONHZxIctqdUoLGTII=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Nnr28+1kl4YLYnfBP1aNwmza4c8mBhPhwyFO8r1TaPSvhMj7X
	5mSWyeqryE41ktrw+P/lRmcDrEle976B4TOVbq5VfchYgOW95PZ93mlAoaoAvDCaFqTId4has5x
	uyMpPQu50fffxkx7OMpG/tCz2E7moMvNvkPfHfkXLG6LcDAKIiUgdWoyZfZCo43pxWbQ=
X-Gm-Gg: AYBFou1ZLCMyqL6AzHwq9piF8vJlpxMh7SVbbKdjnqluL1xmsEweTrk/4aDR1R5qwwe
	zDmuZlMOQkaAVpoA7Ze8ztCrTiPbw7eUbFlL+d2CY5Lyx5y/KMILIrHbjx/wfGdMFb3aGTb01Ef
	inFdbt4XLud6hejs+YM5w8QxSLAdVWLgI9m4Lf/FOJDKPZMDTbCsnfrF/gOO0atFNuK/9LXmvlm
	P3hxB99H/BMZ4f6eSDXpXoE/RL9xDxS+jaLaRagr7rK9i6jjvmU+TqkP172hafPjmRw0+f2qXMk
	XTT37KfM7kHoApr7Mk0Z5pwxjdKHrVfo+sofzymv6B4sFTlhlf5T+u0PoqiySICt91gRpqycziP
	tQQregAj3kKL+MtdIhls9rqpPbK7O0X8mcqd+xJpJlJmeFNAtCVBtFhCPymXEa/hN7ZXSW+m/3l
	l5Y+MXyP7i1+y5LGvFQ4/Kc9TSgGlQRCBMKQRU4jg4MCYHRNWPnooUiiH/XW3cXA==
X-Received: by 2002:a05:620a:319e:b0:93f:633b:ee1f with SMTP id af79cd13be357-9479f2b50c8mr335994985a.28.1794302342583;
        Tue, 10 Nov 2026 01:19:02 -0800 (PST)
X-Received: by 2002:a05:620a:319e:b0:93f:633b:ee1f with SMTP id af79cd13be357-9479f2b50c8mr335993185a.28.1794302342156;
        Tue, 10 Nov 2026 01:19:02 -0800 (PST)
Received: from brgl-qcom.home (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fba476sm60276505e9.2.2026.11.10.01.19.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 01:19:01 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH] gpiolib: synchronize updates of descriptor labels
Date: Tue, 10 Nov 2026 10:18:59 +0100
Message-ID: <179430233645.6529.8490191928778846102.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261105-gpiolib-set-desc-label-corruption-v1-1-fa84726ceac0@oss.qualcomm.com>
References: <20261105-gpiolib-set-desc-label-corruption-v1-1-fa84726ceac0@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAzNiBTYWx0ZWRfX8RmXkJgp1IOa
 oX7E3NoMKUQ/wQQJpkIn/PzpEGfabhEaslNour4owYNzNcRGyApR11omrflaykULWexOD07abnb
 qxdV6dco5imjw9TJ1OM5WKRqMfiA6tS3oMUgDRqwH7agCMUafEujMhKwUn7UAwzbUquM4jkl598
 6GAypuEzKcr5T+E+tMyj6y7qZMyWq34hhucNTmbI0PIA0x2c38g4TuLAzntOyFxTG7sqI++Hzbc
 Pns4EGyFxL8useGAFRczuI/JFkUzhaZjH1W9F3zt1uDChwUG7HNEKhlLy8eBR07HP8KDMu+8R4i
 io9bX3jYIY/iKInE/szLmRWjs29VV8I370m5hB20r0Rnly7G8FMRcBu23egxd8Vh1F5oRNWPsZ8
 mEgaFrTA4Kfo+fcs+aBW+swSjIO/1SYqap0+G2oKpW3haR+p/fLhVygdR8wklGatxo0DS2bzF18
 1ZB8MetR0DjKPMkvPIQ==
X-Proofpoint-GUID: -dPc-NXy0wdlX541lGdI2LzIw5IyEk25
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAzNiBTYWx0ZWRfX3lrC0slffHva
 Jf+8IIGObUzLWqEibiS0jA3mkImyJj2VCAibWFpj1l/Y922k0C1JkNYa37rHgFjlu5fitUc6g/R
 E7carfjZZPZIXDDLt+K+GkObkMxGdnw=
X-Proofpoint-ORIG-GUID: -dPc-NXy0wdlX541lGdI2LzIw5IyEk25
X-Authority-Analysis: v=2.4 cv=JNSuIMKb c=1 sm=1 tr=0 ts=6af2e187 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=w_KnAPlzl-2QHVUEQtYA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100036


On Thu, 05 Nov 2026 14:23:45 +0100, Bartosz Golaszewski wrote:
> desc_set_label() swaps desc->label with rcu_replace_pointer() but
> without any synchronization of concurrent updates. The swap is a plain
> read + write: two threads can observe the same old label and then call
> call_scru() on the same SRCU head corrupting the state of the chain.
> 
> Add a spinlock to struct gpio_device - we're using a single spinlock for
> all descriptors as using a per-descriptor lock would unnecessarily bloat
> the size of the desc array with very little chance and no consequences of
> contention - and use it to serialize the pointer update.
> 
> [...]

Applied, thanks!

[1/1] gpiolib: synchronize updates of descriptor labels
      https://git.kernel.org/brgl/c/82028344caeed2ea3536708906adee02e472633d

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
