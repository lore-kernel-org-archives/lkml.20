Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794302409;
	b=YkoLnOYUvBF3n83HZP7XK6kDiqAbr3/cyVgT89aVSkSsGLxedZUc7stp+/L45NCX3l81
	 IBohxVvZLNwcBzbFBBzdFxvqeP0hF2NCckCaNxrTa5bDYSkdIi9fFZRayCOJR71SPZKXs
	 4RoWOIGjm5+gnlOb4whsE0/Tj38ZvNPMYz+tXYGl3RWNh7IIP8t6z8Qy7tb49UaKyKxyR
	 du9zbw+plDU4tq8oAv76jCMGe2XWnNHhGFqWNgZPV0s44wUM1y4v9Y/yLIIReRZrnetrS
	 1n9VCuRIhAB+skC/kVXpwikVcWrsaPslwwcyAfDPRu0Hkgqmtm8Oce4IHXlTinlGdkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794302409;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=U0rF/YGsgU73kTjU8DxG6mhapC8dZnPAgQMhAUjM1sY=;
	b=qgFPY8nhShmPUBZlQUZQB23GB3Q22PNzrWmZkZDIM/nrt9QFu2jsAjly10/evSairSNq
	 CXXOoLjLC3Ur+77iKbbHfE087naZ61A+/pQE5gRTw9JttpHrFet5Nj/tATjHMX/3x01VD
	 Xx3lO0dh//UwYDMz2ofFY9U42yYBibNBmBSfp422gXnDfChy+lK4r2n56DHS9lE4QvtzV
	 6z+7ijMJjL/yNggaS/xr67U/p0F/XD250ChyiQspB4LVDUf2rWqjpwaGjIDub2dSBgN4r
	 jbdWFHmMjBkGSdoFG5k+UJW9+HDKo0qVs345nkWSbAX+Rb/0E/n4oj+/YggsQsWxYsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dFivqpVf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TNTLlnuo;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ADFA60A3835
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:20:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7ADFA60A3835
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dFivqpVf;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TNTLlnuo
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA7lBvo3402940
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:20:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U0rF/YGsgU73kTjU8DxG6mhapC8dZnPAgQMhAUjM1sY=; b=dFivqpVf/nwF9r33
	JheznplMIhov4kqAzKCUHPewlN98uV+AJ26XJXZjH4WkeuAygv7cEpS5y4i67Gdk
	S+rRkSI7+px6qDQUfsq5AVwLGI5VvExErqUdKqd5j5a6Ms8tepxcwd5PNx9Ja4cZ
	Rsow1S9msWQq8fQMmtHzM03GANgclhDrK6qARpKixDYIs6uW4PtgvgIJhOgLCvX0
	sU+speKRrNwMMVp1qAK9jcL08rm3EtQrK5/UybN/Dk4i7OuGn9cvWMVjJ4inoHtj
	P1BUvuI6sDo31ffKUFnEgIuHiA7I6r1mhNIunyvtIL58eoveEGcjx3zCNubpJkoa
	dxyghA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hufx8420r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:20:07 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93caf7856ffso413691685a.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 01:20:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794302407; x=1794907207; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U0rF/YGsgU73kTjU8DxG6mhapC8dZnPAgQMhAUjM1sY=;
        b=TNTLlnuo39/cRhCnr0X/J/bsYwdKq9vGzq2xuUHwzKtpJa1pre3/+ZIzxpAhzDAnPK
         IxQ/KCTq9eBwQGqvmoRGNqApeGT414oL0CXl0YH8cH3g2Ilr827JTytc1y4eHTqvVHtO
         AT5cCSQv0v01CtwYCR5KfTPblhbH2kDDUxVuoy4985SloQvV9T9UviYJ42HkuzKzZUzN
         e4YTvjNxnXVHguG5Unlwbza0Qf+c8Enq5MNMygAwK42SqH3Bj8oApAkVBSWHA95YBRy5
         bATvyLpcJUCnC/Tjo2REgAdb80bsUL1QcKalLravl1nKTL3h3o/A6rP42CjjacfrZy+s
         01eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794302407; x=1794907207;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U0rF/YGsgU73kTjU8DxG6mhapC8dZnPAgQMhAUjM1sY=;
        b=pvXvbZd7BMRWIjc2xNS3LgQ2C+vaozkvydeyZX/6ekL1r9eEF/IRcSMRKujB8ClnRf
         O56vapQ/t9OEF+aZu845v9pbi7oT92htPW+S+hvpeh2dpcgOUI97NwcadM58omf55nFq
         H/s//I+Eot8/HU85TOoFIdZ87RiWU6CV5VIXJpjz5ZxETrtn5tMLmMk6sbGoJOF0jg1/
         UlSmq3x8kNchIIR4PjqRWHEA6HdOpo+XAiCom3e5AjtOM+QzOw/Qn1u3iYHqUnX71rwV
         LyqmGL5G/HUP5T1+wsvNuFODnY7MladyK1QFdrj6xshZtwwTXxMBmMjh4v4evIYmibNE
         ZQNA==
X-Forwarded-Encrypted: i=1; AL+hErH8qGO+3mA1E72lY7lKeXb0+ClAj42s8bTmdpClNJ/x43kI1PPH6LRQYlqbrN3ljgTuw97eWY3Urhv1gto=@vger.kernel.org
X-Gm-Message-State: APuU4Z+VcYSblzXRU5B9nUewlR4X6bgZpsJ5xNTgB0uXTle2gTz99dJ8
	+1oNuXcqH7yGe7DWh7evPdppznZldmFZhvoHjIQRZK4VBsP4aYxxJO32PexbJuWRH6RFxVpMDIW
	HKfBQXOx20OqLJD9OT5qzaC8w0YRS1kXkF7cSz0L9tOsKn3zoLO5j4hOnjL+kZHKpxks=
X-Gm-Gg: AYBFou35ix59CU5CHQqkLyQQldI+OxlqsxCdY3EFO9mV5rM/8MziZ0HmYiW8Z0uS4Rs
	TwK+YptQjw3FrxWa/h5n5US3W4eU7K5yPS0YKO6ky5CJ+9SvkCdfhhf/FemRkKqSqJLWXq/V182
	eh28umqtKxPzUX9khvfyqZFYLLyWW+OQZYeReCULsl6wjsYQGTyLImDuVus4j4jz9HPExuhg22/
	5MMoAQXuy0D4ELWQLRj7WErHRfWWgkcxH0vLMC3mtIyPrecyenIJrVnry9fpEYDNPGOTsPrc/3D
	bbiYWPcLUZ6mcL5/kFgL9PMjvkR5SzBiD1DoUr3TtZXkAfHH1Q2GhsUVWnbYY8MpjxghFNDPW0S
	2RgqljckeGE87BUmGQnButBoZculi5trvkAuZicCG9H2wdx1LbH8p7Yv1bc0PmRaMrT1Gdrft5t
	qhfW1JWvCNYtgdqCu8s7TaUdTmAMIDVJxmiAC6iTIkuQ9dyLl/KK3PYLsF1pZmbw==
X-Received: by 2002:a05:620a:2988:b0:93e:bcbf:88 with SMTP id af79cd13be357-9479f1cce74mr339173485a.4.1794302406643;
        Tue, 10 Nov 2026 01:20:06 -0800 (PST)
X-Received: by 2002:a05:620a:2988:b0:93e:bcbf:88 with SMTP id af79cd13be357-9479f1cce74mr339170585a.4.1794302406191;
        Tue, 10 Nov 2026 01:20:06 -0800 (PST)
Received: from brgl-qcom.home (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fba35csm47266795e9.1.2026.11.10.01.20.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 01:20:05 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Andrew Lunn <andrew@lunn.ch>, Baruch Siach <baruch@tkos.co.il>,
        Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
        Gregory CLEMENT <gregory.clement@bootlin.com>,
        Rosen Penev <rosenp@gmail.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH v2] gpio: mvebu: fix sleeping-while-atomic in mvebu_gpio_level_irq_mask()
Date: Tue, 10 Nov 2026 10:20:03 +0100
Message-ID: <179430240150.6721.16840326534172400556.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261109-gpio-mvebu-sleeping-while-atomic-v2-1-41f070421e70@oss.qualcomm.com>
References: <20261109-gpio-mvebu-sleeping-while-atomic-v2-1-41f070421e70@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=AbYkjHXG c=1 sm=1 tr=0 ts=6af2e1c7 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=v8OVC4ajcfB9Cz4e_FwA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: iodoL4iikj0RdRI8HvxIfextbA7Ye9oa
X-Proofpoint-ORIG-GUID: iodoL4iikj0RdRI8HvxIfextbA7Ye9oa
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAzNyBTYWx0ZWRfX3zD0A7kM+ubY
 AwoYbDW43ij3g/voTdliKsjOxqm8lm+JyCvvqCFkZrW48tCqh+E/WwdWAZtz204jRlB84GJ26YJ
 6s9h7s0zoHCVmkJIHOIPYHdgcx+mK9c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAzNyBTYWx0ZWRfX/goIJGPDeSEl
 26q/WwqaZsCA62yT6J2nYvTTIN527JGcmNTGo/YiEgY4D/STofW9MdA22ZBs1jIrHcbgUp3ON/d
 P3dVvLh2GMtJ5Wy1HFO84vhJxkVLHUsxW2UyN3mh2SyCX7pxcGh+oUNnvq7663e3/my6giFdnJV
 n38lKlUcbYbweHK5egFkezEEt4pS1Vj+62GOg6py43z7eHgpknu0lGVRQyLy6fqmzjyBgYyY0Xu
 v1bwgayURVnx4FaQGx9jZDgqvnyHfL+bxwu/t82EC1iYxuxIw8a6i7Haw74tZ/WQpiGUIoGoxPl
 WZcaiToYwz2J3yBU6z5p2U8J7xlMEhtWQlgWtO7GOBmagwiUsPIVB8ROv6WSnHyvmetgFRi/CVS
 7vUsUklK9ajnIHE4NsO0DhLteiYi2a0yBCElYT7Jryyuu+kIIwMeX0oNeErn6Xcgkm8KB9IeJsY
 T02ghje1MXIxvbnlzyA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 bulkscore=0 spamscore=0 clxscore=1015 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100037


On Mon, 09 Nov 2026 11:34:36 +0100, Bartosz Golaszewski wrote:
> mvebu_gpio_write_level_mask() is called with a raw spinlock taken but
> the underlying regmap uses a standard spinlock which can sleep on
> RT_PREEMPT kernels. Add the .use_raw_spinlock attribute to the
> appropriate regmap config.
> 
> 

Applied, thanks!

[1/1] gpio: mvebu: fix sleeping-while-atomic in mvebu_gpio_level_irq_mask()
      https://git.kernel.org/brgl/c/42269cdb3d3b46ba6e80f31d0e00d0bdcff1d8d4

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
