Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793833472;
	b=AdwCVv0tLvXJdXM+sC6rjFiIsN7a5+siVXSfISs3koZibtiS2MhBl2ffzsOgWKLLte7D
	 mceanFbvFok3LTRYvd6W6olHy7wNe8riYORYVCzZcHZTQL+wqfiSDbZ+r14vob7XsxsdN
	 awoh5SbPCOZQMsi6P2QH4LDO4cypa7oXjA2risCRFrNHGe5O9G8SNrpCeg3Cj58n8gJ7H
	 d4IIIBkweOazRqfhwdWtNfx/5gUbko84ueUevmgxerf+dQNfiHAGCXNHjm1xyKThjmHrA
	 n3mZH33td9Z2Vih/NtcJGHhKZqOAA2L9qJSvW5417tDBChKqz9TbZ9Lrw9NYlfILMjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793833472;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=tftf03A44iydkYI0lYrITsfjxfNR2F/pHqEC2bTsuUA=;
	b=BAm96J5BeDsDqF1bdSoI+Z4K04UcAbzi1NHUOpr6ZoUm9gRwItdZDrd/cf4dkFnDMfeL
	 rA4p0k1n2FeYJk6ZXbuVPCoDpDzImKjob/Apkh593dBCKovKUCkTjHbGe2h7uRlf/Iswd
	 sjMKCX4ixT6RVxHpw9MVYVGoZDof1AUyuSkClIkE4XifjU8YXrJPhiQ4Kcl2qng7tstvk
	 vyUrprl5cYVjeXaGUd+VRtTgl6sQ0rf8OonnDZ4/rbdiygYMdeUszWukwpvsYoKHXfJt5
	 urMDrzlaAzMxvF5zF0xyb3A62ZNbe1B268A7Wyg/VaxCLnk7TjByjeYffL6/8TOoWTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kRPHO7VA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fHqH8Xl1;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC423606A32C
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 23:04:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC423606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kRPHO7VA;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fHqH8Xl1
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4LbOnX1148941
	for <linux-kernel@vger.kernel.org>; Wed, 4 Nov 2026 23:04:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tftf03A44iydkYI0lYrITsfjxfNR2F/pHqEC2bTsuUA=; b=kRPHO7VAcopwMvqM
	fN0mfVSAzHB5Ty/3A64i/jHQ1SNbytGq+QbeebZ7ODgu4u8YRSAP1bVSHf51cZT8
	ih6vHMagKjXNQDZHzsm3O+K2Dqm1Jgce8gMhr6W2sjpa1CsyXlD+vJHZCT9Vyhxp
	vKjr0tOqyFHbpl1Oab5noPAS7K6fH1b+ockO13+dIaNKnmHuUBPDYk1sYMfYitZP
	naqiajKPlqO+uU4WREwF97ls01X+ELjouKmqp1ExIpj9862HQJ3wPA95mTwyiSgJ
	PDShJlAje5MbtCntcGnwFz+aWzHUcDAfTk2ZadJISv5GwvxyvFlmY0UWvR7wwCQL
	5lBY9Q==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr3r82u9r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 23:04:30 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7cc48fbca26so292128137.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 15:04:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793833470; x=1794438270; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tftf03A44iydkYI0lYrITsfjxfNR2F/pHqEC2bTsuUA=;
        b=fHqH8Xl1RNs/j0g2ThSKcRYvlCUiby8vpie4tSjgjFERUE3gIvnSwkc80yu8qaCirQ
         cfx8b4FPk+7yRrW/yGv1Oew6mjmcie7BovRMS83tqjS0VilqKeZXNe133i4zA0ZynNRK
         pu8iBm0JApKiJEwQFtH2tXZIpuuiICXuQjnVQs+5cpZtKPqmAwMbHLs97tD9ZsHNESkE
         piSCY4eqmwCz6gkZTBYN46trfEZ9ABa8PyJi7niuW2Yo5Wd2apS4sktFsE9aZoigN6Jx
         dV/OMKPTT7+5uxpiSgtockHBzI/Xk3Bdp9kUYz+mHyaB7IyQdMhOLwuR9ZyAm0xXhmbK
         MCrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793833470; x=1794438270;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tftf03A44iydkYI0lYrITsfjxfNR2F/pHqEC2bTsuUA=;
        b=nvvZSA3DOBdm2U/k+iivieoCXjiSFWIdIavoc77G8baYNR17UqNAePMmBdLZ34oiWx
         uv7KxmSsHdBpxbMWoTthzIUFltsUbSZ3kQoV47cgEyi92EioX57e2I1vh+C6BNXlh09j
         GIfwLIPkWlXxNC6b0Vuy3QlSZHOJCZ8JD2dZ9qQogVZEjWXeVfx68cdiMna0iEtkSFqN
         L2n8KISwDO+eHUde3EHDNcfp4OTA3MA/mI93BxVVoKvnkAhLNbK+d0lWiJrkNw30CvqV
         Y3GQPaD9DBD82QZPT8rLB0I7IqTeaDNJgjce5EA4rpZkCmlk7q25GNXjdeBFJ0kqJosL
         5XXQ==
X-Forwarded-Encrypted: i=1; AKwUvBwNR9BAzUYp1rdOzlmWXEnK01lHDkNa0TYrudlypiW3SZ7O/P8kyvqFcGIaV+lbgJLMCuqdkvWxzi6wHSY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/x7HEJdkVqnU6fYH2EhT01AXUvfK7X78Ju5GD+/+Sjx8xOj/v9
	kS0vU+tIBeZZUTgfeYmw4JOZAMIXBY3yUHbLmsJpoY7eIV5cykfVmhGyGzAYzQUOU1PcRlNYvlm
	8dSGPpjuE0P3h3ITrcQm8eHQmHh5ttbeBjAj2UpHK6csoi+ox5tYkq+VQ1zBMqfBIvOA=
X-Gm-Gg: AYBFou1TxsNakgnayiHh+XszKmO/SpjVXi8gt1zcMunEX3uAleni0rjcC7cupW5jyBE
	sX3IUaUufFqPhLaUtnSEagOPmnn5NvYLM+XuzM0LeU+fCuWuonq88gjBC4fIpyMN1fk9P7FN9hf
	N9MX+BWfT/U7lUPRuLcWaGupdDBcvN+wEYXFokJdMn79dC+u7j4WcmuAEvSJk+/iNDNS6xZ1ed0
	qv2BjASh8WGhTv2S7tUHd2mRs+x7G7xKTspo3D7YVzLCD/w8wrmCJzxitfyR3u6iEcd7n2pRts/
	2k3Svfnk2p3KrmFaKzukR6n9wcYCXL+6IwTa8CX7RBMdxV0NwBtDoeXwpzETLw00aEwMu0bWyLy
	kqQbTgOHaZrXM1LT6Ev9Mmmb5IRKLX2DJZ/Wz/j/KCsGg1UpiL92Nojnz1rUnLtPoLvCpNe11OA
	==
X-Received: by 2002:a05:6102:3706:b0:7c3:9b0c:a75 with SMTP id ada2fe7eead31-7d0725ceb28mr6081023137.12.1793833470020;
        Wed, 04 Nov 2026 15:04:30 -0800 (PST)
X-Received: by 2002:a05:6102:3706:b0:7c3:9b0c:a75 with SMTP id ada2fe7eead31-7d0725ceb28mr6080979137.12.1793833469448;
        Wed, 04 Nov 2026 15:04:29 -0800 (PST)
Received: from [192.168.1.110] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed552afcsm6267878f8f.41.2026.11.04.15.04.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 15:04:27 -0800 (PST)
Message-ID: <3b390b39-c27b-4b62-aa49-5b1bb56c3cfb@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 00:04:25 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] tty: serial: pch_uart: replace chan->device->dev
 with dmaengine_get_provider_device()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Frank.Li@oss.nxp.com
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        John Ogness <john.ogness@linutronix.de>,
        "Mike Rapoport (Microsoft)" <rppt@kernel.org>,
        Zhaoyang Yu <2426767509@qq.com>, Haoxiang Li <haoxiang_li2024@163.com>,
        "open list:TTY LAYER AND SERIAL DRIVERS" <linux-kernel@vger.kernel.org>,
        "open list:TTY LAYER AND SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        imx@lists.linux.dev
References: <20261104145211.3209669-1-Frank.Li@oss.nxp.com>
 <auuaYxoZm2T25cU5@ashevche-desk.local>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <auuaYxoZm2T25cU5@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: cac4YhFWTG5BR55eTRmzArNWOnG_aih7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA5MCBTYWx0ZWRfXwn0KttGnbzMs
 9wC8kc6eYHTV3e8my/lWpvvbU7SqPRCYkhHx/uB6JYdbs6J90RbZiKanIKxPQfdfDGbSOXJ4UuB
 PL04SlPBOxd0vYwbG1+J3mkrnz8SidYAEt+YryXLIzy1QOduMR2/HwUu07kNXkKHJWvI0spbOuH
 HDu3kNaw5+eK4xqtAX0tWGH6Ec+0P2OhvODsOWVyEZB5tPS0tfdXe06Mbw2ay407iPWn6DGqtFK
 TuzHy1HL2vFvT4go+4M46nnahBdxhGTV6ZUk4nYs+5jEsM43DQ2XLgTAKJDNoPGU/+DfMBtVzLb
 r/KJvQyFEvaP9x9Aps0DCuBTIPwZtDmBUw+0+rstSFjTflDwizVvLfTm5YbrSFRSytwtkoGo5o4
 sDixNmqNLvwgwKuyuvlOIyvWFcTp/9VBwoRBslVmawJJeaCYEra7OU5whfSKClDue4cy2Fs3Bit
 VILdqlujvJt7D3PCfeQ==
X-Proofpoint-GUID: cac4YhFWTG5BR55eTRmzArNWOnG_aih7
X-Authority-Analysis: v=2.4 cv=UuP2pOwB c=1 sm=1 tr=0 ts=6aebb9fe cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=8AirrxEcAAAA:8 a=09QxJ2vAxbTnJTa0ltsA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=gYDTvv6II1OnSo0itH1n:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA5MCBTYWx0ZWRfXwsj7y9NDwjjl
 JD4WNv0VKxi5s2GZuWAor6q0UNOJUFHlvc48h6jwMjY6VKyU7ga0HJfwo08t/Lzp6BFPnBbi0vr
 YiJNdYZu0czGYQfa4AHwXO+Q27R1H18=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0
 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040090

On 04/11/2026 21:49, Andy Shevchenko wrote:
> On Wed, Nov 04, 2026 at 09:52:06AM -0500, Frank.Li@oss.nxp.com wrote:
>>
>> Use the dmaengine_get_provider_device() API instead of directly
>> accessing chan->device->dev to get the DMA provider device.
>>
>> No functional change. Prepare make to struct dma_device private to the DMA
>> engine.
> 
> Krzysztof, this patch was a split from the bundle by a reviewer request (not me
> FWIW), and author obeyed. So, you can do the same in cases when you got something
> you want to review independently on other content which most likely is a noise
> (to you).

Do you propose that I read all patches and complain that partial reviews
should be split? How does this proposal solve my complain that:
1. Incomplete/partial reviews will be marked as full review of the commit.
2. People get same credit even if they intentionally did not read 95% of
the patch as the people who read 100% of the patch.

Best regards,
Krzysztof
