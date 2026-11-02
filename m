Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793612583;
	b=BcgKQkfCwWyGYHHR17SC6ebiDy8Y4TVMNLcd4FPgxmI6bdBqIlJeKiPCged1D8S9DfKa
	 0RhLbUKHXkgskq2ihH1tf9nbK1Po7qSekgIrmPGGhbkHcUVzsX8vGUCbwOsBI2vKObHO1
	 GeDSPXs96z10zGHkbIBcjIGBcCNuFJPSo5mlPlBaFzE2Jc5liif5giePcWrvXYjArok/s
	 rB5jMVqu7X1ZrbBLHbve3/7uYCYLZ9zSfZaQv6cWv84+Xl9wSPWwQMamvX5J3yCanpRxy
	 4MCKlzb9dT9gSDNUeF+MY+N8Y891HqfgnwzRMmPP8u+pktuOa62jbBR3GTQhOnKfe5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793612583;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=89EGtrCdAoR6l+ecweYzP++OTOh+V/yp5mFZY6u3Czk=;
	b=J6ZnTSMS6TMP/SHSNOTnU0q4ubjZ7/a7BtVLvw/utlpKBMoj6UuLmwATQCzkwbhgcdZt
	 wrxXcSeYZF1gKWztQy12mMTz7OypbkNDYdfF8lTt0mwEDtntxBKZak0KJ+wA5fYxsXLMD
	 QPN01UwdUo6NeDT5x6vuOoWsECfPyT7vbAS9qfRyCVqinjJPLYQMYQVftfomtGX2c6dh8
	 PurBH32I1twFg+NCJA6LOoN6tqe09x/Y8PhFczjyd721+5PpGB0uLPc4lsAO22EQf9qtT
	 D4cqyhgvgPbKDqXKSJGBP/HFkPetdQXmZn7XQvkN5jkMztfNYLIizFqcr8tqzKvMl/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="l1G/73LQ";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="ivhqNUJ/";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6871E606A332
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 09:43:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6871E606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l1G/73LQ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ivhqNUJ/
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29A2r23402655
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 09:43:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	89EGtrCdAoR6l+ecweYzP++OTOh+V/yp5mFZY6u3Czk=; b=l1G/73LQcGRmSUnO
	U8g2uH4q/i/X6dJsZbxfny/nj5qSQ7E5d/Hb41csjkojGkyMIVad2hgXswZ5yqsR
	ry3Wztcvc6Gsh/GGbYLHEBbSvqXnGK0h1WCcU7I1J9GLGveAU/JzzlPfAUGwLz7G
	e+x8nrKuvCXkxxy7FlaKZ4BotliNu/3/+spekyaH2GozaGUHsQOonXozu6Rn03V8
	Znnhgh7vDEeYpnL8+RoIZjLdyaQXEiwwiML8RC5wcj4ccfiunp6wl9S8+cwNTDjT
	rldgk/A7tuGiobm5D+SUeYaiPvgoJRoYzFD7YHwkZoJmvoQj/MHgtX1uYA6Lr7Ao
	Lshe7Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hppfe8frf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 09:43:01 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-934963b2bc0so545238685a.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 01:43:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793612581; x=1794217381; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=89EGtrCdAoR6l+ecweYzP++OTOh+V/yp5mFZY6u3Czk=;
        b=ivhqNUJ/mSGC8BIFDiZz4qkI+K7xTVyqF+eNVifs4bHVcrRoB8hfUIwy5xuklzKD26
         Kx69d9mG8oyIdwNJPTBr5TjOVzlzgIJCUhC+uSnAXznpqQYWeIcXxdVJTrRWjFmOOsdc
         RHGQc6yd4jQ1jm9dC5v9xKh/XyGzzw6eRCoBPU1hkjCKQKDOF/FVFvk8Fd/AB1md9a7C
         QpGuOH19YwwwogeQsMPHDbJbYkbcN0m+EPT+7s/huqa6JimPe/0bpg9NCKUI+G+y4vyn
         uWGp0kSzeaPCqZPI1y/vGEks3bwaixYMpuW4byHhd0H6DUg4b5kEF4SYSELDmUEoRwy5
         BTeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793612581; x=1794217381;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=89EGtrCdAoR6l+ecweYzP++OTOh+V/yp5mFZY6u3Czk=;
        b=UX8cV5S4bzD+hdIFR+ps+wYj16mJYvhmT0xsHcHIS64q3DCpys9njV4LHnLid2FzcR
         3tt+Vm+e4OK42Zn2ycWWZkEZKySOuZJ2uF4Hpoym44IRUIJ/CSgkkxMk9X6A7eHDtU7A
         Njtx18CUie1qvJeM0jqtZcYZ1NigoYvTMuTlCwYyIkX4UtBBqT1cc8I3KbfI5mLn7Tqi
         RwBJe1casDsfaqXuUXVaf4haatEWNqJkbvLeD8c6FsceT+dsWvm61N/fYmzFMhm4nW6g
         rohd4V0e2VZJxgJfygW0FrYSa7U8YXTMC5hNY1IKbJ1a6NHjfdy16akJYVvBsxL5XB4A
         Ee6A==
X-Forwarded-Encrypted: i=1; AKwUvBychNxxe4P3UPq19W1ccqqbm/wxpeI9xGzs8ptGGHDz580IcxqmNXfKC7KJoclNoKlQ+LyOm44Tz4I+xQ8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLKgCo51JTyROuG92lWOPLSUsxd12vgXeI7Yi5pF/4s/wY+6hma
	XpJnvsgLl1cp4foI3Bx+qEw/mujgIGwWdwA+cpZRBP8bWbf0n0JoIZaIlCbq+aEDT258wjDMO2B
	J/ipR2uuJkLPqO7EM3zw68CUA923TYIprhlcr4KjKqWGpxfiuqS9gXMglciSJJP0TewfKbSWib9
	E=
X-Gm-Gg: AYBFou3i8VPHUWorHCvXbVhsT3y6el5UE3xMD963iIkHLqy8C3QlAEyYb5CxkHw5hw9
	jCoRLrOaUq50urjqjTsXqy0zrXaOKz3AmNYElpS5RRw2ttGRtJi0vFjeNRDpHyzHvqSQ4u2Ih7f
	A813U0Rgp1hQPSg2NntKP+vpLYAas2DsKL362/uORX78Xt5boEmG7CVRZ0Rs5ehHpDhccR9RlJv
	wYZ58JUQjU3OAumvumbNhY5xMclKJ0KacOYO5QP2dse0JzYl/Q72rYrJ38KZa6Q1uS4Z+hxTZHd
	zevjdry1JwiidV8rQEHdP9gEVjOq36qNpS8nqi1jaiWWZFRoibhoz0txAM33g5vXCVZhwxMpX7/
	BzL35y4566PklGpZ/FNRBuQmRUIybPxgvpOkWvaLxfesAb22GjN6tNAJ2JVnDJOmp8XDWj8NTos
	gZ
X-Received: by 2002:a05:620a:2627:b0:93c:c7c6:90b5 with SMTP id af79cd13be357-944214cb3b8mr1490954985a.9.1793612580625;
        Mon, 02 Nov 2026 01:43:00 -0800 (PST)
X-Received: by 2002:a05:620a:2627:b0:93c:c7c6:90b5 with SMTP id af79cd13be357-944214cb3b8mr1490952285a.9.1793612580149;
        Mon, 02 Nov 2026 01:43:00 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b725b8sm19124292f8f.20.2026.11.02.01.42.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 01:42:59 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Guenter Roeck <linux@roeck-us.net>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] gpio: sa1100: defer GPIO chip registration to postcore_initcall
Date: Mon,  2 Nov 2026 10:42:57 +0100
Message-ID: <179361257407.49840.3441048970024202305.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261029-sa1100-swnode-fix-v1-1-112f4d83d191@gmail.com>
References: <20261029-sa1100-swnode-fix-v1-1-112f4d83d191@gmail.com>
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
X-Authority-Analysis: v=2.4 cv=SeZi5fRu c=1 sm=1 tr=0 ts=6ae85b25 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=c9_QNTXIi0YaEdUqp3IA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzOCBTYWx0ZWRfX0Q8QEPWy1Shh
 sYuacvXhS6s/mAqxC9K/NbtwnO17ODeh3/Vd/wHK0KGJTY2zUVqZUX1cYIpT+iqQvx+KSCe6pPC
 Np6n2q8Zf/K+fnnCht+xAj54YeZn55YimUCLImvhg1Ndxr+hBxZGW3wqWZlLrcHWGwsaAdNem39
 b6sNSf8Sin/kQbKPobuGR2q0dCItNK9qcRHVXa/i4UwrgteXMJQu33a9B7fB2A+QLp3Q0AFDeQk
 c59AazHAyVt+nc/rCwxHbym8Pb8vrgusZ7eHAmmkgGIjG9NuLZbmAv2f0FWF+y0pFKNsYVO+Rgg
 U5/wcXfUBTamY3BXKnhEkPNNi4FDHaKp0t0ToW3x8javCDVi5/VwsGHW6Ef+rDlnqLt4e3gjGRe
 OSTnfBkvrTtwgLtIL+X83iLrY8zkIiA4h5Mtit/ztHGiQEO12F5I9jKi82bxMrVP6/RD1WyhyoU
 UdDxwUrg9NyCI9m4CzA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzOCBTYWx0ZWRfX3iCVrIJOTDG3
 nkSGCOnhBtSkpbTzf2sHW3lAxmYwm9sUsdcNHPp1/gm/aynCpDS2RdgC6chs7LA13003Kf22cHP
 xrpfssQquDMTLmgJHR+PZLtmwuX6LyQ=
X-Proofpoint-ORIG-GUID: dckzFivvAOw8iUbj_nr5Pid-mMZQ9B49
X-Proofpoint-GUID: dckzFivvAOw8iUbj_nr5Pid-mMZQ9B49
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020038


On Thu, 29 Oct 2026 11:58:15 -0700, Dmitry Torokhov wrote:
> Registering the software node and the GPIO chip for the SA-1100 GPIO
> controller during early IRQ initialization causes boot hangs on
> SA-1100 platforms because the software node subsystem has not yet
> been initialized. At that early boot stage, attempting to register
> software nodes dereferences a NULL kset pointer before console or
> driver model initialization.
> 
> [...]

Applied, thanks!

[1/1] gpio: sa1100: defer GPIO chip registration to postcore_initcall
      https://git.kernel.org/brgl/c/32c89e32b3fef2ee0aa5c4d0b0fb089bb20b3223

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
