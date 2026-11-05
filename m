Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793868835;
	b=Ci8KaMnezE15FClX25bUA41Pyk3nXLv0t8hZvfcynE34Ro4Y1xVH7Ot8WouVZmRUtIkU
	 x/a1ESH4FP3F4qZjTwUqUXJRPMYtXWQuwgLdxE9JImkJBo6I9hfjDEFpkahHkPBC6zdh1
	 7Y84ECAJE7hq+KMuBB0M1oVIYa/47XjH/dtn3hux6pRcMz4E6pW4773I3rYP2dJ6s5cca
	 TJCDv8SGKpVQPTbel6E1T/Szt/gU4yTKD8FqsB64JKfmiyS88MKRwO/O5+xRND511+aSV
	 UiggEjrBHBcJXCT1ygGPxF2P6K51TWVclBEGg3LFYS+0LAdricnx4FCGrSGrxbodHIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793868835;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=tEANdsClCEwLq0xOueOCh3MDRD/bgmIT1TCSuqme95o=;
	b=WUaUye9L6IsCVeULyF70GUyWrXhqZ6yNfeABRTLxeLWeDmJbaSTjfRH0DmVoYtTtBAfr
	 B1P+YX4Pk8tsOc2z0RJbu5pAqWs+BP01G84bQAosQFqp+36auaRrknACfQ0boBmzXrcS5
	 8jvt7uOJnNgaAVmIQzLgWcKdQwVXkqPz4uXVTCFdnXmPsjOfIrB/W0cdSsF1bjyS1QBZQ
	 008B8UD/WHBVSDCK8XaQtYHTScxZJ9/z5QqnqsAwM8LlSuvCnkummxDNDI7syhVqNd/9z
	 gd+RlKNV7f3xAe9yxx8vN8Sms90u5HAZNRKlbhTZ4xWcgNQUQpHIDQ+UO3TfonSvT6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NtK1jRhQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iATxgeve;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1A3B606A328
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 08:53:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1A3B606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NtK1jRhQ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iATxgeve
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A56U2dc4169559
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 08:53:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tEANdsClCEwLq0xOueOCh3MDRD/bgmIT1TCSuqme95o=; b=NtK1jRhQDPmPfLbl
	lJRI9GXWkIjGe+ZXQIAyuuMwPV+w9sqhkbyijOxMRAOEPCF8wVttPc9wAE+UJv+s
	TDqIFpQmcKYTxDWBW7lAhNyZWZEviTOPcfBrHCnmAxpUtI2xfTqCCqFDJ4KtfU9a
	FSQlNTe8IJ957w51Wzw9AgndJLObJ/VwjK4dUBlF2CYMNItf8mBnfET2vi5IlcUn
	kQRWYMEJWtUxGDAio0XYqccg8SBZFBo7a4/2XMYePw8/C4JGkkQ2CJmH+YtrOS8X
	mle8yLeEz6aZnzaC7/fJmzgkaCtXvJlIo/uam7OlocQFtuyz/QJ/ae1h93ShDaTW
	7ZTYNQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrmcd8kd1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 08:53:48 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7bf71bbf197so1278307137.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 00:53:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793868828; x=1794473628; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tEANdsClCEwLq0xOueOCh3MDRD/bgmIT1TCSuqme95o=;
        b=iATxgeveKauDkMp/r+SJf68Ws+bDaS4YM+NpUCKzFCYQKKtWirZv/R1EqrCp5Q96IB
         aYhrMC1N1MBOzHaH9gM939JYVPlGe86SIBC2os4IR1gCKRj9h2DN6JQ+8yOq4MgW4b/8
         cFJU9CNxUB1blkv+qpEacbKt8dpVZc7H1D3fCM6CthZkpjh0mQTywZ6rqlFm2XLSu4k6
         SpO/7BUnbjAlGwYv6bLo4wCCRWrXQLskddFiOaP3sKunoPTRTqiOlvSTFJxxpQCMLQke
         x/8HFJxJWMeOfxx50Urrn/kwmCIU8xpVvWrnrK06UDYMbmBEq21Mh+ZdrWfd+35NY9zb
         5WHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793868828; x=1794473628;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tEANdsClCEwLq0xOueOCh3MDRD/bgmIT1TCSuqme95o=;
        b=IfujmqjkM9HcE4j5elJj9Rug49tMuDJEgOYK4VE/8Ud2K1LQ/jH1UYzblGUR5iKGrq
         1CYKjC9IDKJmhHAUzNgHiMEFQfJhU4rkU82z/nGBdqYwk+19HAiIcnd24rU+BzGgfEJ6
         3q8tx627x55N8wHn9IHtSwLEUo5Wyvx6N3ED9Y7kll+5lloy4r8fwL/DiyHm5iXqy5t9
         CE/Tw2JV/ilXUNCiY1/r5qx/mql85nkWIN64jUpmA6AUTnB/iuCeI2h3LoevuoBnqixc
         BFgHB6jufsjVgRKm5jD7nwrnTxJiHWcDa/zMoqSVJyuvCjgKjfcA/Tm8+Iy28poQKWkW
         fCjw==
X-Forwarded-Encrypted: i=1; AKwUvBwj6xNDSxF0ElGheuFXWUvex9R5YaNOcQjE2g7ca7NXFrIST6aLvWvWJs5rEaldFHi3fSEIqeuoNoMD6Hc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8486jtPWpH4HqalbhSHh5y4xmxb5DQ+JlHsvAN6LfygKwIvyVM
	yfKkLk3VfOJARRKl4JMk1ja0+1RwIJbjnD8mx4PI9KZs581Y/tS62Wdyi1gmwyK69o85IrqWUGO
	X/NCGSAzfEKIG4WppHU+aGz55cQEywq8UWBZX3NtkygLi1PFoKGPhjn+pMvN3RxTEJSQ=
X-Gm-Gg: AYBFou3fe42k7jS6qO71Edw5qwTzgEWixVp7Q7qIDE3LzgAaKg9B1drfwLAJVgDcll2
	sdmqtqItqPXUlqTYwVm9oCn8JsbuFb8aNL1peLk972754yu4NL3I6zsOZFPBvCED0ydDkyqI/YX
	Gk4SVkrKROl9f2JJ053T9ugHjZApvfPHQtLxGUryoZf04q22V1hlqnWqVzg+gZxkk90T6ZLZBeu
	6Eg3eiVKTuHAZQyAeEWP3CcjG0EBLzfQggbD9LscSBZT5jwEPdozMls2dCGsp8psllwHmS7tcaG
	2WrOj/0pSjZYoJ8Um1eaXWzRlZNEdDSJiqxsCFrceqVpCpm30WUmAtGlohwy5fQgZoofr/XHqQb
	BlkMLCeVHoLSyTsKGyPqB4Kd6WmBEcZzouIgBGKmamK39Tn3jgAzEYMMGAH1EeV/shCXBRvbKoK
	Do
X-Received: by 2002:a05:6102:80a4:b0:7d2:7827:c03 with SMTP id ada2fe7eead31-7d278270d6fmr2667815137.25.1793868827862;
        Thu, 05 Nov 2026 00:53:47 -0800 (PST)
X-Received: by 2002:a05:6102:80a4:b0:7d2:7827:c03 with SMTP id ada2fe7eead31-7d278270d6fmr2667808137.25.1793868827489;
        Thu, 05 Nov 2026 00:53:47 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fecf8e341sm8972866f8f.25.2026.11.05.00.53.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 00:53:46 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Adrian Ng <adrianhoyin.ng@altera.com>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Support Opensource <support.opensource@diasemi.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
        Srinivas Neeli <srinivas.neeli@amd.com>,
        Michal Simek <michal.simek@amd.com>,
        "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, patches@opensource.cirrus.com
Subject: Re: [PATCH] gpio: Convert to subsys_platform_driver()
Date: Thu,  5 Nov 2026 09:53:44 +0100
Message-ID: <179386882212.12982.11268787304162434768.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261104113309.1634121-1-peng.fan@oss.nxp.com>
References: <20261104113309.1634121-1-peng.fan@oss.nxp.com>
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
X-Authority-Analysis: v=2.4 cv=EOGTQFZC c=1 sm=1 tr=0 ts=6aec441c cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=DqZYlRkov0yPPlpfqKoA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: n3Qwm1Z7LAPVkMweOwFzttqKsYXV1AHN
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAzNSBTYWx0ZWRfXz/o9xjrYFBlA
 vXczHLdq7B0PEqQQhEHPD5OyWr9Zpg9lg1e6uMdUb+4UWnifsnXNQl00jQ1QwVYh2oZ6pjjXon4
 6rqYbI6zaJYXGDlZ65PS16SOWiCo7KI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAzNSBTYWx0ZWRfXy57xa9fFbj/V
 hXk0t6NYaGhp6r+zKvPe/BhuSWlCMejt7N/NQ6CgLk2R7LuofGE9TCbLp0rr+N8oNaSVLyDHxGe
 gDKK868p/3KPssFHnp1VhlR1P4YZ4gou3u9e8NrQx1aeT9I+hkO1aSg1hLSz/6lxVYRrjVjUj1q
 xRLnF4drEGYXHwWGtcfc8QAshE3ZiVJpfmKc4TNVcafvFZ+jPNn/5Cb62gGdAnXByPaqE6p0ayn
 ZDkrVCmZddarZck5xfNRO8dqDd76Du96tPafg/LRfF1r2p0vOzRGuojAF2ibetfzfEAA4HYxCI3
 m4+AHCeikBvR4Y/uPrJO+o0QwTCqZuzb7mwEwa8S286JoitB73w0NKeSLf7mcVjz1Y3eICjhWlQ
 hMjIcusF3e16bC8WxBGf6O66zGryT4zPWZDePIeESb1m0ztnSVjXxKB9up1UOGcgVSsZY+GqUG4
 WFOAVas9ANHrqfyChyg==
X-Proofpoint-ORIG-GUID: n3Qwm1Z7LAPVkMweOwFzttqKsYXV1AHN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050035


On Wed, 04 Nov 2026 19:33:09 +0800, Peng Fan (OSS) wrote:
> Replace the open-coded subsys_initcall()/module_exit() platform driver
> registration with subsys_platform_driver().
> 
> No functional change.
> 
> 

Applied, thanks!

[1/1] gpio: Convert to subsys_platform_driver()
      https://git.kernel.org/brgl/c/123be56be13ca95f5bd5f143bc2d6edf0fe71221

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
