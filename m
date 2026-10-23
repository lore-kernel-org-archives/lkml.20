Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792750724;
	b=QWMcY2OJEKMrjmttY73pNL9M24LQ1LIOE7B5JTH0ssbFtpsVnEgpuScpj2vz4tQ+Ndfh
	 kRkr3S1dAsOux0rqCVYsmG17cT3JUnEWurxm/RqNDMMTDIEDqDSsWWFEEv1qzEiN3TNL4
	 Z/dGU67pqII7lG9490XVT8CvAsgVHpWEajmeN8MB7CceaoVoj2dPrcHCH8tljtLw/F82h
	 AIJjVm+keVAa8lKfGhgROXBfaoGwymvfLc3XMIpz9010FyqQZKwu3MykQUqOhqkOVawWs
	 QQ+eK+wtcC/gA8gYzZcVg+T+EtO1x7K10w0zY+eY2cBnem1OcHje6XQbrjVngzAHBSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792750724;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=YjAarnCifburoEXGvsqsh/sxDLJBq4lP12OGzhjxpF8=;
	b=Oz39cAoDyAeHX5TlF3ImFt9JJcio024Sn5Cq+GJmky3kSFnpGkLECHvhWdLkf2coqeVj
	 jSaH/7ZiIBr6oKzXBfcyFXkl6kdQXba2LXv+bu7v3gxfJicjXkiTWbOsEugTNPVYSGJK5
	 Z3YTVIT+Xm05PQn2cqXPBLHAn+2wPq8EeX+enc2nZ3VB1/bfm4BFnapVC+wlGaWPmUf4p
	 fs0Re64BkRz4xb3yxgM1bhv6J3VjJbYTKePczi07qdZiN3YPbQfkz9UKSza5kLV9t4TG7
	 FhXTypgQjP6T0Gz6unWg9itqzxI2IoZCxD55N/abEgS15zjzkqW4IPmMZcXS+o5tXMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BcgynjsH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YE8GQJzl;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D11C606A321
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:18:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D11C606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BcgynjsH;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YE8GQJzl
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NAAZ3k980653
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:18:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YjAarnCifburoEXGvsqsh/sxDLJBq4lP12OGzhjxpF8=; b=BcgynjsHOsEyW0p7
	JmBaDsQ6nFQLkANcOVu+eCxU9MThVEiziIsFIThVRj72ESReWsq/2Fjlue6EMw7f
	QG7t3qTn0WrzVdngMbQxjibzLT4HeKhh3qX6VnfwOLHzcXvE5ilS23eCh0gfEZ3V
	gJdN1CF7iZTXsVzV/Da4x6OyFDP+nAvYJbtvKk8g4DpMYruI3A4MmZNNGmIgHFuh
	HQLr5vagq7d9LX6Hl5Z7FUUkE8k6BcGB7QJFrW6hfi9MgYUijr0hAVom3M6rkMS2
	cyyjxy/uNB3eb+d6uEcH7zV8JdmH2kJx/yvZVhQwRVX0UqIOddcFZnJf/IIQ9HG7
	+vI2uA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfsmatn7d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:18:42 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cb6391e89so153471385a.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 03:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792750722; x=1793355522; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YjAarnCifburoEXGvsqsh/sxDLJBq4lP12OGzhjxpF8=;
        b=YE8GQJzlyuIDwIzkXS6EO/0vsC7REihvins5pqREw2lJ5PJjl1pPc8vGO91lstg23V
         PYFf3ZDLCAVT11iD1QaK3DfSR4+OWhlhT0cIcoIOFLJukihXDfo0fILomrH6bUoMS8RE
         E1Ddl3AXgAy8Vzy2uop749Lg6Ute4hBPt+Bokfg8TsE8m28iuuKSPWfavtZLlvSgAzup
         Ieau/oLgkKsQ6ZI4QRyQo4tvjQnnw8751/HAgYhq8TCWA9UWiYLa+Bfs+8uOthHI52EY
         6YM/LEVxpgDZ+lPAIPJjg1gfdHmMnka2eeKNXISkFWrr7ydGRE+jjBNYWyxlHx6jZgj/
         sZkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792750722; x=1793355522;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YjAarnCifburoEXGvsqsh/sxDLJBq4lP12OGzhjxpF8=;
        b=YCg4df8b4oFTGam16Jx0JAuvpOgURdKEmmz9JZ1CUCs4PJ3P0raQ4CcOE/ic+EequN
         oYSofFP5yDk3rvmk0PsMePytlQN3RmP4A/GlOYIewzoRgytM/2r8/sx+vFY7tM95Abbd
         exiG7I4PTxF3sUe6f14wvLsITMaFkR058TLJAeaXOFQVEu4IXuvSbvDtLg5xKd1AncFL
         8mnX1rr8CBpDsc2ZluoXjPsFoa3lpFIZ+j+tuD8BGpdGo7SmCLpxNrP8iNa443O0Am+P
         Bn40uVFPK02tamJNAglVr0fFTqehCt/2jEUXHShEJNala5APTiLsMBDl+K4Y0z4pQ422
         i/Xw==
X-Forwarded-Encrypted: i=1; AKwUvBzAGlrMzv5ils5X3bRBIdTiE9PkwHyjpcH/Q7Rr3KZxVYKo/s0loLUARf6l309eAw23C2BXUPlAEFIesto=@vger.kernel.org
X-Gm-Message-State: AFq9FYL/6pQU1d1w50nF1h2B+/wEGODxMOfe3sI2KYxvOK6AGrPxiUAI
	0RjxtdchBPxYjEqCi83wowpr4rRwYJZQfePfsWI4QxiW6irU1FH2dWPhbFaK1/eesNOgr4ceWxz
	n8XTtnGBiTHn24pGogjax6hr0ZIk2FJfAw1JL0tOaPcseDEk36mOXjsAB0U7UjDCi860=
X-Gm-Gg: AYBFou11nIE1UtX0hfqpKL7JSYYOEjsvQdEQ0YYYfzLeTBnBQE1QvXj7kw00owEClAX
	fjOYgqhhw99TravSfP9LqCMTQhJKFEdiyVJZUT7/z6iq3fEVtVdXtsJibRdVuEykyfdx8tmjnK3
	n0lNMj3UwSXm/FogVNQD8fLW5wMsuxEeC35Ne1rwxRMpRxx6Fz4Unj3p2cYzqcIo5zDe6jGDuD0
	CF30zr7rao9TvYfjaoKVoJ5/+MknrIf/0XTOdJpcUr3RC5zacmmyuGlOWkM08rVHdWyAbw+G00o
	OBUs7i7PIVagf+9P3Jjen85KbBfaCRd68JVWyDnsvOMkM0QY7lEqfc5jdvMz/jJjPBJCxV0EmYU
	SfdSIXpGtvOff3LUurM8lYCgI02g=
X-Received: by 2002:a05:620a:298c:b0:93f:2ab9:729e with SMTP id af79cd13be357-93f6f79c238mr362488385a.21.1792750721709;
        Fri, 23 Oct 2026 03:18:41 -0700 (PDT)
X-Received: by 2002:a05:620a:298c:b0:93f:2ab9:729e with SMTP id af79cd13be357-93f6f79c238mr362484485a.21.1792750721242;
        Fri, 23 Oct 2026 03:18:41 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e38053b8asm3894504f8f.42.2026.10.23.03.18.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 03:18:40 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bradford Love <brad@nextdimension.cc>, linux-gpio@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-media@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Russell King <linux@armlinux.org.uk>,
        Hauke Mehrtens <hauke@hauke-m.de>,
        =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v1 0/7] gpiolib: kill gpio_request_one()
Date: Fri, 23 Oct 2026 12:18:38 +0200
Message-ID: <179275071555.146035.13882849400290683549.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260715185112.1323510-1-andriy.shevchenko@linux.intel.com>
References: <20260715185112.1323510-1-andriy.shevchenko@linux.intel.com>
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
X-Authority-Analysis: v=2.4 cv=V7LoQuni c=1 sm=1 tr=0 ts=6adb3482 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=xyndvWGceNBv60aQF6QA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAzOSBTYWx0ZWRfX0WHvdIktowI1
 cIN8YUPfIaC0I3bzlkOWN0rVi6q6a4kj+IBlxAPxTAX4njXzX6D0oIkqvdVwuXtFEDSwWg6WiOH
 W3z7SEi6LZO9o9gcdYlLbGl6vLAtr0g=
X-Proofpoint-GUID: H5kxIEL-_PUGcAJd6MXxceK_obGQxzwW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAzOSBTYWx0ZWRfX+iRufClmQsd5
 HJtF7aWz0iFLHHZA53LJJU70s9gs9L3YP4BZTorkJWmKYp+QHAX8lT2kw8uLuJJGAw0c+TnmUin
 xJnoN7qpE8ZQl1tSiuY8qgoaXxtifjvizWLepHBNvUMPw8VIHtjUPk5SH7QcIG8FvDT/j6xZqVh
 +3TFMPqJ5w4+k64wmadqcjhgaCmmt6udI/DQ7uIRbrj9sDjMAmbtd0NrMgtyXAx6WulnNy6A3cJ
 6rZPAbyWTmpPpjfB85fHQ38txguLND/FI7httwg1+BFpoEEGpphCVGEEqCg4WZYwkf96AdEtrdB
 ECf+618cbsYXSKmhAu7tTDTlKz2RG+wKkbnCmHzdTWRTtqC/xmvFg/P2wxwW42bJXYmwwxmz5dk
 uegy9unXiJTyIr75kF95lzhUJr+xWmgvkqF80o4ZXwsXR3cDSQnIZu27GJd0+Q+p83Z/ay+HpOx
 nH0eajO+ObQapojYJTA==
X-Proofpoint-ORIG-GUID: H5kxIEL-_PUGcAJd6MXxceK_obGQxzwW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230039


On Wed, 15 Jul 2026 20:46:40 +0200, Andy Shevchenko wrote:
> This is the finilazation of the work announced in the commit 61e1fd2abca4
> ("gpiolib: legacy: Make sure we kill gpio_request_one() first"). With this
> small series we kill gpio_request_one() and leave only two legacy calls
> devm_gpio_request_one() and gpio_request(), where the managed one has only
> a few users and high chances to be killed soon as well.
> 
> The series is supposed to go via GPIO tree (due to nature of the last patch)
> with possible immutable branch for others. Please, ack.
> 
> [...]

Applied, thanks!

[1/7] ARM: pxa: spitz: Open code gpio_request_one()
      https://git.kernel.org/brgl/c/e4c5145a8c42b1ff8c36d209b265d65005fb2a8e
[2/7] media: em28xx: Split em28xx_pctv_290e_set_lna_gpio() helper
      https://git.kernel.org/brgl/c/aa6a84558231f61264bd09c8ef013c7bca63db1e
[3/7] media: em28xx: Open code gpio_request_one()
      https://git.kernel.org/brgl/c/492c8f997533acc550bc23be73b847f5e7bf3e75
[4/7] MIPS: BCM47XX: Open code gpio_request_one()
      https://git.kernel.org/brgl/c/878804621d798dc9eff6148732f74adbc45e99de
[5/7] MIPS: BCM63XX: Remove one time use ephy_reset_gpio_flags
      https://git.kernel.org/brgl/c/6eeba9dc60aa6a5e2a617c7e08a6ad4da325c1f9
[6/7] MIPS: BCM63XX: Open code gpio_request_one()
      https://git.kernel.org/brgl/c/1805476b1a49aea62787072b28d7a2d5880c53da
[7/7] gpiolib: Get rid of not used anymore gpio_request_one()
      https://git.kernel.org/brgl/c/dbc9f76c3ce301c76991574e1944a0d2a8717062

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
