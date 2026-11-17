Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794906844;
	b=3qUVdk5KKMNKxoLndLDrAd64OzCKrQbrbdqakqMp2si2zmbjp4eTUNBnXoUnOczr1b5o
	 D2OQ8X2bK2Jg51y2L5WsACWqdhlkLGruU6vEF70ILCwXdygTYn1h2U+EpO2yc4wVlrs8U
	 s7fTMM5yxQJYeEGs1FFIvxJfYUeCJ56O3hsKgm+ZvcF4xF+ETRr0QOk9sYWVNt4w/P1ah
	 UDomsiHGth1oH+5S3juM1gC2BXUW3HAQAObeWNGyZyg+rTweByiyMuWz4sn1VlMtU9Gra
	 CSK17EnMjSdAanKL2hRYU25pT+HOPV02tp4z52mNuO7QuDEDkYuxmpaWwflmn3HTEhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794906844;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+w54tE3YfSTZ+ts4Fj+EjjQA9ICa2KmKJm+TS/7vB4k=;
	b=PjkckLLk8nefm6oGToqE/d1L9hKh743R4qK3J+b5xI46CumlpMGAgDEv1lgoOsU7DEqs
	 MXb14LEPCKkn++nw8phHdQgk2cMVZktpsKhTT6Z9iJ4Qcygjm9iVUaRGvRQK4GQT4aAjr
	 2db8hNPFrm1UPERhvdodqjcFYb8bqa6hu5QXpHmgqoigA/4T4RWhJgBH9Md0WAWSVILxQ
	 nXzXeO7E1F422FJDUJS+upeYmxHLIk7yvnNAuZQjZByx5E9mH5IqQ9FKqz4RWsFbIzCsW
	 gTiPJi9pBmnav2nMpOvSlTWV+7uVi1knJ4P5pFFZmVDmwkhnt1Qaoo4ftsTRysYzJzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="hZVTzDz/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TBaXqZMR;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF87E606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:14:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF87E606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hZVTzDz/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TBaXqZMR
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH8bdPj199951
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:14:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+w54tE3YfSTZ+ts4Fj+EjjQA9ICa2KmKJm+TS/7vB4k=; b=hZVTzDz/XtTO4viP
	FrXqnBfgsXE8rhjwexNMBxTEZozKv8tMrH9ZciFDgdjBJeW0OI5F4vcxAM3iAaDD
	hY3okPvDHyjGDImGxeNQQS3iUZ0ma49hba1JTDK626caUjM8zBPnWapjKZfdaIZ1
	8zXvVZh0Wj3LnI+WRwFFkF4HatLVTCXSpkFllwN4YGcGkJ3M2gumTxv4Vv1hW0lF
	v2epjszqr7uwBMeamodpZMdfDmrh6N9WhAmhhnp5Yn48G5YjJ8eVQkyWVeM9OFUD
	71kUTgeM8sW2j6YEq+v+9Ldo53x6nQbrUN+uy3Aq2fM7viIt0xwrA+slYyiTT0a6
	gpVXCA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j038mc084-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:14:02 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-94960131befso542630085a.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 01:14:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794906842; x=1795511642; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+w54tE3YfSTZ+ts4Fj+EjjQA9ICa2KmKJm+TS/7vB4k=;
        b=TBaXqZMRTpNeSO6OLDFX8q9T+ai5snOlWnNAmVZEQyFoz+bYoleAHGWIgAQvaYDbV9
         NzXKpJz6e76UoZC18oS4AEv0rpHZRE04Ym7cGA6qF9iEm2ylCUUc37bM6MVPoaX9wS5e
         8KLxuHxhtk0JUmWmTLBcZ66eIPwm7tyui/OvBFrvSZhU8O8+CxlJcpxn5Y2KNcnEDrW9
         c8R8tx/bCtSCHByvR2kANqxT+ZSnFn/9w0z+HFTi1kDKhp8bTdLEMQ/15Ez7gCB1C2O6
         OcekxhrC3Z3YOGSsZQD64BH0UqV4dt8rAK6FSEEGOdFgwoJhyjRZCTtXPBixJjc43Zox
         dQ9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794906842; x=1795511642;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+w54tE3YfSTZ+ts4Fj+EjjQA9ICa2KmKJm+TS/7vB4k=;
        b=Y476sSFjtF8bVK1vqIHCTImjYfB/nt19XWCG+bXVfiZ5tppajSdPp/YjWfC+FkHuqq
         1d+fYSyvD40dw3xe3LVlJskNaw9yMYHWsMJIZGfd5Drx1gSNnZSgnNQydXBPi9NHZ9Un
         CGT8QscVFa4L9cmDFuynlhFl67Gblgvvc6l3oW1DY7zD/TTWpvwgqmo2oq0aoQ9wsasl
         DPWbGKHS8le9FcK+XN4lnvOOLct+ulTgJVf6agU5i9cpM0pHfV22Cpj31PvvDuo17Cg9
         LDkv9B+ANpbDouscKSlF3ZR1ZmIzRI9+tFNF0GVJDfdaAYcdD4BPFZqWZumHaC5Ak8jj
         EFYA==
X-Forwarded-Encrypted: i=1; AL+hErG3IzNX99LJYkb5a6YnwlRquxTPAWKihCJTWJJFUK26lQqjf8g5ugWWFlD5psAgUAnBK8hHR7V8EP5TA+0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/rWWW3a11z+X1ET1EgTv+VO1AMqJyWa3/g+cYSjfq+qdaUZPuV
	ZblbgyKF7JmraUxHyN3W5iCA7N/2/9H2813BOvDgVKgKqM79gDXkvzowTcXFn+uFpBHVABZ5LOB
	13c+GT5nDdSG5aX0b1i8MW9JO7PXHHSp3Z8aRt31NroCVWlV8L7svvnNb4zuRgy0CHzU=
X-Gm-Gg: AYBFou021bYq/IowLXRYWMPDmP2EHHo9j7HNPucqy1BiBs2jfCLnUXmndiABIluEgcb
	K80cTj5a+Axha4egIEXx9F3ggHI12fBcUcExDwNkHN4H+e+P3lczr2dIyabRg2LZ7Z0Q0L5oA0f
	aP2TUL9DNUZTHNLXO3JzKV4rT8YwMQd+JEuKIRChBksPbhINAXleALGwowIHQMOI5bkZVFG2CmQ
	K4TfXdc0epMmr3PLn8P+fdlGdt0apjV95z+C5ehHBJgRcbKRYs5m0z9xXVK5/kOg70EC5osveRq
	t3RDkyyWAfEBWECMEWIFWlQmNAdXnE0nenPTN4pSjycyRhZgNTq0rt5B6q5/vvtWjWKCZvWB/1S
	0DAqXB7xjGv8f26qN/BmzJL08tv9+XftHZzg8AK8DSLhSpfPNtjb1YMG01T7mKSphuVD5qMGlgG
	c=
X-Received: by 2002:a05:620a:3726:b0:949:6b0d:7309 with SMTP id af79cd13be357-9496b0d7681mr1398324685a.75.1794906842064;
        Tue, 17 Nov 2026 01:14:02 -0800 (PST)
X-Received: by 2002:a05:620a:3726:b0:949:6b0d:7309 with SMTP id af79cd13be357-9496b0d7681mr1398321285a.75.1794906841503;
        Tue, 17 Nov 2026 01:14:01 -0800 (PST)
Received: from brgl-qcom.local ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a4dec730f7sm1177496f8f.11.2026.11.17.01.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 01:14:00 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: Re: (subset) [PATCH v3 0/3] Supporting LTC4284 which is a negative voltage hotswap controller
Date: Tue, 17 Nov 2026 10:13:58 +0100
Message-ID: <179490683060.18860.17025405055140807603.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261117-staging-ltc4284-v3-0-326bb844e08c@analog.com>
References: <20261117-staging-ltc4284-v3-0-326bb844e08c@analog.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAzNiBTYWx0ZWRfX86fkMex89t/6
 +XHnfyetOnMhCuS6ueDxjugrSl0VgtJtyDrc2fjFPHRnpAhznT+qL28/7Akw++B71X0kYGTSsIN
 0QwNKb2wp8iQGHCQVPlsIcPV2xRPAQOHwlVx0oBFVtLtQuWwZSSssdouKawjF/n3Rks4rw6djqG
 FRIrzBywHPHyDc0aPmBjKf7d9VE1q9tfE6vCFNfkzIv+tkoKvw/m7f+LMqzoNYavg5poHEEq0+s
 D0mIK+6XNDD1arwM1iBRuronvnIp2ODoc2zBPWKVO7/XhIa7mj6wuKRQhzDlZ2z/lXv9uYEaLkw
 eVsrlcO/ZkK0ngUNgh0XFQghp5zwmQ3GXTe3zjRcHzsYAFDKjSOResJNTKBDvQRc5qnF1w1bEqA
 gRYxrORFRTzcm7Zd1ew7J6qCy9Yt95Q1Se2OJ/mu9rlt5WsOMiAqxjn9+zXOJFga+naXaIc2jBO
 x/uWeNK+3sP7015cPqg==
X-Authority-Analysis: v=2.4 cv=TckDJhQh c=1 sm=1 tr=0 ts=6afc1ada cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=6zx4bRIOlK1EkWDDbbUA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: PiXmXWUjKINzZP5kRmDqejYqc0Cnb6bC
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAzNiBTYWx0ZWRfXwasKPaQw6Fs7
 2HRnG43wShsfY/SAk6EWGeoQ2i+flrEmhbPmuF+jRaauTRSNd26G05hF6pY0nAhTzTSacNvXuCE
 GoWN2BOJ7+s3VqfIMgLz0dGpM0VV4No=
X-Proofpoint-GUID: PiXmXWUjKINzZP5kRmDqejYqc0Cnb6bC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 clxscore=1015 spamscore=0 malwarescore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170036


On Tue, 17 Nov 2026 16:26:47 +0800, Alexis Czezar Torreno wrote:
> LTC4284 is a negative voltage hot swap controller that drives an external
> N-channel MOSFET to allow a board to be safely inserted and removed from a
> live backplane.
> 
> LTC4284 is very similar to LTC4283 but for higher power. The device features
> programmable current limit with foldback and independently adjustable inrush
> current to optimize the MOSFET safe operating area (SOA). The SOA timer
> limits MOSFET temperature rise for reliable protection against overstresses.
> LTC4284 also has up to 8 pins that can be configured as GPIOs.
> 
> [...]

Applied, thanks!

[3/3] gpio: gpio-ltc4283: update Kconfig description to include LTC4284
      https://git.kernel.org/brgl/c/c6d8ebd7324cefda867a701b4341605b681aa3f5

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
