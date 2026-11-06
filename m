Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793957210;
	b=lHTd2SIch5b5nCSOsEYhw12MLAE0a3Wn96aL9frMTiA7HDR33pa8VvmevpFYqPRZNvYi
	 HtD/e0Z2XpP4wqxz9IC6EUYEqIyaXJ/CiKA00vyNCR4iSV18JnH//DDEQI7eAwg0459yU
	 FfJpp71iA8j1lbIYG4VZo6inJ5gViMiO6NYNdnV9oWyC+OOflbh+SP/vnY7TLClEvKrfX
	 aEGynjODGxTBKMBVWcthCqtjzg/eetjDKscyR0bI0XwlTD9YdWhuCJeY/mxEABZxy1MqH
	 QkTy1B4aq0CvJhPEFObyMLlUMldxJsh3KF57Soor/1qrzpi+0wlsOBVY2Avabh8fdGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793957210;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=3K44iXg682ES6cQqXP/vaebmy1hmlkMqK0BWGhBphpA=;
	b=UHWkQz++MHz3L64Gpv47UEyqDe9Ta7SMmifA4209lymFDEW+/JcudTjPp9KtOcU45slt
	 nRb2IiAHNBInerIn0jQc+Jjs557xUCwnJW9Qr8hcj+AUYGI6hChH80MjJRxKDlt3SdWey
	 Wts4EC9LvBmYP2soDfxHxYXs2lYugJSzLGaIPVILkj5oj3pEUSgpsaGRfeKK+Hn5XlJDE
	 2mqGdL5wfLQ11u/Kf9wClKC0Zjgpkb+/ygVLCfiobyjJ0OyDDsVwjrwJ3Iki+GQ24eaxI
	 oJtksvEOiTnUQRJkLOkqYoHaBYDYT0tCejZTyfntk3yOPr7NS0SyVaPf2Ypeo8PZ3lQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LQtBEyXg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="D8Mph/MH";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A06D9606A335
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 09:26:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A06D9606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LQtBEyXg;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D8Mph/MH
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A67RS0j3284392
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 09:26:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3K44iXg682ES6cQqXP/vaebmy1hmlkMqK0BWGhBphpA=; b=LQtBEyXgdvkQtjB9
	L4oquiSaCbd86MjTzPlPO0ozfjFeE7zCASJhcWw0D7+rBBRB1lne7CpQWwrWVLgs
	CuEHyCt2vZaKXj7yiQBkswTjZPRhrP0whFUV2ul7Kniw4PuliyFke2vzc4/sbCtA
	Evd0vs7qt1i0MfGfr3zVlb7J5i30ZM5yGCR6aIMc/8BJj8PElFCOo1YsJ4eGsqUU
	hZcOuuEc4Gj2XbIEJCyiB67WAs0qcA8OBkxpNgXvwj8KBIhpwJMCcmChChlmRUQ6
	wlfP+KpO1WLb4Z/F+WnT+gTM7eFQWbOJa1rCGUj+0rZx+ZaMsG3Xgm+e0rBXfd+Y
	Qu/EjA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pa23w0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 09:26:48 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f5844e383so86103185a.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 01:26:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793957208; x=1794562008; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3K44iXg682ES6cQqXP/vaebmy1hmlkMqK0BWGhBphpA=;
        b=D8Mph/MHYwROJ/8rsKfMpOxPPxyRqDXigNCCbkKr/Gxgu6Jnj+vIysGrdhENf5yY3+
         58LaJNkKhjEufKY2ZKia0iDntDfFAEY5jZCnf3dVrC8dc/HRc2dO1JVj2sLYOIy9Cqt0
         UQlfsFQKXiYivpmEG9PiQyKv1II3a1t+5zxqnSClRLXxNyNe8NnJ92BS8yjls2+86lS2
         3QeMLaesucXEgZ+TXmS1HwxzPLHLTr/31rs1ZmckBAieJOGkZ4P8RCA6I6sBPPQPSapf
         JG/WdKrkDFq/lRT36yGSspIdsfKdFS7QT7f9UhcHd6tBoeTf5iOSW5Cy0IkiLesi8ESg
         DEdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793957208; x=1794562008;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3K44iXg682ES6cQqXP/vaebmy1hmlkMqK0BWGhBphpA=;
        b=CT6/4WrMIg2jNNiJ5mv4tB33CNqK0/nGWVYLnNcIpjO4Qn9Bm1uDMQHjvH4T1vmI5z
         AyJdudcRAVH8w7ngoKA0yt5Ok5eCIWE9q0cSIraj+mJ3T2N3zIrj8g3KaWl2jtno8Sj9
         qtNJLMmuIIPs9rzOFrFXJwKui+Zgks6kas1WibkRUl54JWmKL9Pno771LCs8IiiLXAXg
         VKypaWlKupdN151F5HzW8xlyTaQmRM4CaMi0KhyFPO08EyhmnAPfe38i8ZwMEbItt69k
         S+hAon98itoPfyIA9RI3OzJqNlmOZ05eUZYS81Nk5Ee0nrbsrp4115Gcs85rXlq7HNI7
         eq0A==
X-Forwarded-Encrypted: i=1; AKwUvBxvfxN294Mcnf+fTvWkDqddDCqH6wFF0iKM5B4VCz7mfxdRoYs6Ni0/qI5OYNq/JXzhRaB0C8L02y1xS98=@vger.kernel.org
X-Gm-Message-State: APuU4Z+9WvhH/WJ2ltR197Px98Eb5VjKBEWV5IjEbYsyXPriuFTABMs+
	IQAJwY7KYJEEielwHAQyKLl2xVWJT70TQswwzbS/pQxpn9aUARrzUZq2eeeLzRlelWeGk1dWS1e
	M3cqSrpt9Xino6nWDIZB3RHHlh/jkVjO4WIvki8v5UPMMulurEd9yS0N5cu3dX82pIdM=
X-Gm-Gg: AYBFou0F4tGXXE/UpEpC3nXX2m1u6vmi0rEe4CWasRQx84yjnD0e3m+DiljKU19Qubx
	fGWPtcljikyumHPCYm4ERFCW7qwYwDCldsf29zDl8m8XiYAI6RKqeIJR68M9M+1d1FS8G4oyOzL
	0XpVxGvtPx0ziU1aEXVPHjQfWLyY/I6ZWYBJFM7lqHWG9417FbCKq/ML42b4vkLOw63E66OeZds
	b1v6NSxy7YM5F88uuRsWfqniGigPTwaKv+NbAi9Mx8v5Ar6BKTM78ELxALWzzFbIRBoa5IhWUvw
	QGBFGwj1qQr/3EOyPrkTLAO4Fr1n3EhWQUJcBNotNLgKlxTiMrzbmy//c7pyhaITeitIkzMi5gW
	u10FD9chKbYM9b/JXEmLTCZuHSMjjXjLZHIt+fvthogjpXHQ978nmBHB+z67vG8rqlrZGxkLSus
	YO
X-Received: by 2002:a05:620a:a0d8:20b0:945:fb2e:ef72 with SMTP id af79cd13be357-945fb2efacemr32798685a.29.1793957207918;
        Fri, 06 Nov 2026 01:26:47 -0800 (PST)
X-Received: by 2002:a05:620a:a0d8:20b0:945:fb2e:ef72 with SMTP id af79cd13be357-945fb2efacemr32796585a.29.1793957207461;
        Fri, 06 Nov 2026 01:26:47 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b5725fb0d1sm123089945e9.8.2026.11.06.01.26.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 01:26:46 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Paolo Pisati <p.pisati@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] gpio-f7188x: Add support for NCT5104D
Date: Fri,  6 Nov 2026 10:26:44 +0100
Message-ID: <179395720176.5712.7302643079404579604.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261103162738.135836-1-p.pisati@gmail.com>
References: <20261103162738.135836-1-p.pisati@gmail.com>
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
X-Proofpoint-GUID: oEz4MsHqJo5dxn7d_hp5eB8Nd9Rlu92Z
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAzNyBTYWx0ZWRfX05IrcjPh3/wq
 bgCDHvcgvb+sDhgUtMcTj4D9qJAh6PEyyd4zsMnW9nURZpZr7tUw+6rvgSUHmP4A1xEIp1G/+KX
 Ru23hjCRoN87SIHqubwW4HIDtWHUCS4=
X-Authority-Analysis: v=2.4 cv=e7WT2qp/ c=1 sm=1 tr=0 ts=6aed9d58 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=eXtmUnHh1kbX-eyUVDAA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAzNyBTYWx0ZWRfX4Xrat6+V9egp
 XfmWbe2OGj+uMnCtqQEbxI6w004fkPdXQOkCgDF/aavGXfc7Z7yvyZ+IgcumTOmbCWp1tEtaLtV
 s0Kr2x34OVOExpheQCWSbwkSqzXaP7qt1t7BTd+4U+xg2BqTN4TxbYBj6msox8E/JxoNTpbjCeU
 o9BY6nge25kDOMotDQsnL83IOOqoLzSRRg2Qnyoldtg7+Lcf9vM9luMWpBfYE9UVufxUuQ5vWcX
 ggnb3Fo4VrRTcgBT4ce595ptYHKhaBWu76lN4ta3Eau01d59gKtYHuZUCkrwhhHBeMdbu5Y/MYg
 f177k4ss27knz0FHxRaNO8B7f0H3Oe9tPqjcU73N+HQhkqc8/LSUNkg5EW3zUGyfdCpjxl5++jv
 e7elzJqep3lcAeHH84+ZT67DXs2Z7Fui+FW9Eft/Tb/irO+lKO50ESLl2yx7pciJuk/eTOVVkxx
 qzDu9bXRH8kZ0B9oTDw==
X-Proofpoint-ORIG-GUID: oEz4MsHqJo5dxn7d_hp5eB8Nd9Rlu92Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060037


On Tue, 03 Nov 2026 17:27:37 +0100, Paolo Pisati wrote:
> The Nuvoton NCT5104D is a Super I/O with four UARTs and 17 GPIO lines,
> found on PC Engines APU2 boards. Like the NCT6126D, it keeps its GPIOs
> in logical device 7, uses 1 for input in the direction register, and
> has a single data register and no Fintek vendor ID.
> 
> It differs from the NCT6126D in three ways:
> - the device ID carries the silicon revision in its low nibble, so
>   match 0xC452 (rev. B) and 0xC453 (rev. C); the NCT6102D and NCT6106D
>   report the same IDs and are untested
> - the output type sits in logical device 0x0F, one register per group,
>   with 1 for open drain
> - GP0x and GP1x share their pins with UART C and UART D (CR1C bits 3
>   and 2). Register a bank only when its pins are routed to GPIO and its
>   group is enabled in LD7 CR30, and log each skipped bank
> 
> [...]

Applied, thanks!

[1/1] gpio-f7188x: Add support for NCT5104D
      https://git.kernel.org/brgl/c/75b1038b88ddb729cfc8d5652d944924b16cc8a5

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
