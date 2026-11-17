Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794903586;
	b=iUri3DNVocuSCvpyzPfqH7UVzfYCkLzq2Xk/VpvbwDQFxV+XhMwtRofBoBwAc8wXVBin
	 z0MsEgFblubEAJQVZtjJX9oBQK7WAnFyqaw7+sas9VBf64oANGWM0Clh+R4ABNFRU2O1i
	 NM3jo+ulX4yvOMK5GJ4aDPWryhZ2vPWEpNTQKsns793ugeUeJqfYzY3ZQkaoSbfoBI6VQ
	 p9PCvsyn4sqxIATP/+LOHYm1Ksefm6UaYXORXWgfR6+squEI33zURRnnXtgE9WB9v7BHT
	 7keG1GvTLGOZSyiFecSAgeocGtI+S3H8uQX4eJpJ1NhwRhle3ou8OwvX+5PojPti5ZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794903586;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ny7AiiPk/oZ9PlbRw4f2tbZfuBw0koUKDbxKbxil8rA=;
	b=5tdj3J8lQvBJNjMigr5UsClHupDfCLarh8u1cMAabEHMHMSXD/x/FNBKF3a9LgAnvwLg
	 2O4fudVCKJ1FN5Cik4dtIRx+PlBnbTuKAnM1Ln806DPTOd0sPPSOcGOVU2t5Z1zmOmrX/
	 YSpKC3Ca/OIffWrvw+iNri05tHyi4DY3C3ttrgOwLg1lqJmPvpskXfWSn2UdHoxiCN13O
	 72ZdzzZPwTdT2DtYd0nJVfVr1tOhlucqDo+ZBJzOeu2elNHAiCFNxs1ZwacUEm7+NoJhv
	 AUVL7X+kNv9boq3N8dgu2duvjXdENzhxh7+1w/TMTU9jSI5Mo9JF24JJltZzNS6x18g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MVgKlbY1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FIZXluDy;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C04E606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:19:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C04E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MVgKlbY1;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FIZXluDy
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH2aFNO200048
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:19:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ny7AiiPk/oZ9PlbRw4f2tbZfuBw0koUKDbxKbxil8rA=; b=MVgKlbY1bK+UWWCe
	tNNVlrxzx851sPGGa92DnVtzARZyeTjZAtAThk0nKfi+7MiXZHu5TR819FXc9/re
	tyGCkGR8aVXCvijpc/pfb6i5EOBp5DP3QeEhyCDkLqoPaY6AVwaK8oP9sIUnYDUw
	TQkiGyYmj4a+hqQdOuO8rDd7jI1h4ovvTMGCk3ihVGnqjasCyTw3Z2dY58RcIC3O
	QzzdrcOFHo9HCsTgcq2xw2VqVpbYTRi1hyazGYzoklzWL02wgpMS0s23Li6zDh7j
	QglVWCnNBnNcvceIjv+GJMisNUzmJnYjIeM5gU+ITBEf3z69K2xdueQZDMJMQPSV
	pqMnYQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j038mbrpd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:19:44 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-934963b2bc0so848373085a.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 00:19:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794903584; x=1795508384; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ny7AiiPk/oZ9PlbRw4f2tbZfuBw0koUKDbxKbxil8rA=;
        b=FIZXluDys6JMdL4KGo3NWkJhkGgocEo+vvKVZil043EWuoQhGYACRo7sqCTp/mLCJ8
         /nAWmp0BvG0j808w1JzvcZgNwvgEqM/26/I7PIO9Wezx2k1l59NYUvn+P35UetkPcQGR
         VWeovMCEtn904ri4xQedUlPMKDzUi1k59wbFohQpG+Fc1TQa9VJ0wIzR4pNovoTCyqwl
         Szq/NBYVFmxISrznT/w2ffGcewk2vNo9NB9jrIYdul4VG3QEwceVWlg/NxSTCBl6CKIt
         +/FcqSmw3yTnyfxQ0r8cZWJRcTvLkDUFUnEakXhUbb6+c0Ij+akOE8ZhiLet2PKb7neg
         m8XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794903584; x=1795508384;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ny7AiiPk/oZ9PlbRw4f2tbZfuBw0koUKDbxKbxil8rA=;
        b=FA0kbIEP8fblB1p42d2l/i0XLGllhyyGTf/Aw4ZsLgypmJmql/NfiM4v+1aJJYU13L
         lQGd4DcKa0lTEbq3g1oi/dou8upQmdaP0DS2rYIZP8DxLhFy8Q60i96rPU+GkHFqy0Aa
         V0X/fBa09kQ/UMnJgC4oiaa+Vt5vbeLY1mYXVpF695fPFVlsa5AhePmtNivTHtYBOV+i
         39BBbkrgnkWl49AY5YER7QDpWcDKvjPcXJ2lC82qZ5Au/5BhZnzSBv/kQsP7PHTGz51R
         X7IgKzj13z5UJ64bokvlxLGwGOfXneti8tSOf8J9lx7GhR/FkkD7JIu3TwDQ+JUbg8K/
         LUVQ==
X-Forwarded-Encrypted: i=1; AL+hErHnMddoYFXw/goqpQPXjrE3SilhGWknBbbwFrv2FEHQw2euDZpL5rskOlFOQHOwkiJ5e5rKnFVvuBNR4Jw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8QWx74uaLDBISdIyhJSMlNGS+mYd2TVLhAq1d/by8LttbxzvvO
	wtC61M/rjAptrd0+3x6HJwN/1xUDFSLFCOHSuZXWXUmkmJ/g6QM7EoS2c04nA93H3HauLjwkKwa
	oKgwGHUoCGn3eBcX1vOQCbqZ4JNgof8IqehsNV+AR2c4bAhpabQDy1VGenrlPz4LLioM=
X-Gm-Gg: AYBFou1o+oWjtyIgQ7Q5sCnQehcJKWshKZcoCkuzCNh7BWIOI3iSUSpHusveUktxIcu
	Ft3T+97FoFZW4ZkZXW2ywrm63Gw/dYxcUMge2IULXefK0AO1hYTxEpSSgep1dv7NgifqbrIybzc
	rYp/aL0jJ+gpgroLtrKh0Pde5jqkhifgGF9e1ufhpOizBmr6R13/rJLfrnfhxGH70ojEO0lwuxh
	Aaa9J0pTZ/EZBAHYfQZmne1Uk+g2OOv5qfw4bU4qV791LQOHUbrXnogC3QEl2gSmmIBhwD3bgG2
	Xg6yy1gmA6YKzP6jiyILBnw9pX09z22flLr16iy2oiv+S0tIeUc1MbWKtkwFDbu3uzwoNWNk/0K
	MKAnl7d5gSqCJTKerB4tdJPQNCuS+5vithWtEUKkfzPu7sglsFNZFfqJKuqq/OcFoHgs5ApMGI9
	o=
X-Received: by 2002:a05:620a:2628:b0:93f:2d10:ea49 with SMTP id af79cd13be357-9494bbe6ea1mr2238501985a.45.1794903583701;
        Tue, 17 Nov 2026 00:19:43 -0800 (PST)
X-Received: by 2002:a05:620a:2628:b0:93f:2d10:ea49 with SMTP id af79cd13be357-9494bbe6ea1mr2238499885a.45.1794903583279;
        Tue, 17 Nov 2026 00:19:43 -0800 (PST)
Received: from brgl-qcom.local ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c609c8a77sm26986871f8f.49.2026.11.17.00.19.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:19:42 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: brgl@kernel.org, Gu Bin <gubin@cmss.chinamobile.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        warthog618@gmail.com, andriy.shevchenko@linux.intel.com,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] tools: gpio: gpio-watch: do not clobber errno on read error
Date: Tue, 17 Nov 2026 09:19:40 +0100
Message-ID: <179490357461.14174.7875840926920818948.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261113035723.2215-1-gubin@cmss.chinamobile.com>
References: <20261113035723.2215-1-gubin@cmss.chinamobile.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAzMiBTYWx0ZWRfX/D6DwZwWWZLU
 ga+/eQLgB6OUj9y82LbpzHTEJ79SDbCBpoydIAQjwOz5bm7EE/YFHznz6JjvyQXXT5qgIq0XTux
 8mdX4bHp1vcowce0CC5zsmb84SrTdzw3wPdbnibcgXR7QH1lgOmkBWnDJNqZY7H0+fLDYcgUxZa
 W6eWXKJ3P5f57fycy7F1vQdCOR1akGzVzip3u7d5KvPT07odAkcBq0JQTo0Fctjev02jyxUwoW1
 SR+zQU+sSPZh23f95QVcGPh1r4Mq1ILIXnTCGHs7UtXeRELiCViSXHm4E0cJKzZyrsXe51dL+Nr
 0RFHj9a+Grk05hJrr9Fif22RxZcTtw1zKdD8+CDKB6v1npz6QgnupIq16Jg6HSeoiYEa2j9drXw
 j26t5EundNBtfGb/Ukju2/lYwFeYc0eAVCqbmZ/XsZfPVwdfiZcU8b2YcoYRdF4VP02jedI34Oj
 wNtlPTfYzKtoWxB4jiQ==
X-Authority-Analysis: v=2.4 cv=TckDJhQh c=1 sm=1 tr=0 ts=6afc0e20 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Yka6hBzTXpN0FCfeuc4A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: giox93hrGXbhyXVs-6YEp96sV49JK3jE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAzMiBTYWx0ZWRfX9iBlkeEf/Huf
 GOi9BDG1D1+wOPhTwcSmgObLQ8kxIXZBE2j9uKIRE2GygAx4GgDJ/zSwwvpaCCXzIZ2kena+rDw
 msQVuWz8Rg7ax3k0eVGyNPGL55QPaoY=
X-Proofpoint-GUID: giox93hrGXbhyXVs-6YEp96sV49JK3jE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 clxscore=1015 spamscore=0 malwarescore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170032


On Fri, 13 Nov 2026 11:57:22 +0800, Gu Bin wrote:
> gpio-watch reads line change events from a gpiochip character device
> and reports a read() error or short read with perror(), which prints
> strerror(errno).  If read() fails, say with EINTR, the inner
> 
> 	if (rd != sizeof(chg))
> 		errno = EIO;
> 
> [...]

Applied, thanks!

[1/1] tools: gpio: gpio-watch: do not clobber errno on read error
      https://git.kernel.org/brgl/c/845dbb71d620c8f76ed63fa2cd25008194ad3426

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
