Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794214643;
	b=wKQ6jbJ7roXWuYxbOmB7gDDOtia7Gva+BOxiXsCi9qFhVD1x3mnpIqS7IR6UvVI9P1ss
	 eNSYzyLmO+2oPkD8n1BXlNAcm5P8QSsy8Gd5uSYA8pXsmYlQVG1Xplc9J0yCVJGXTaBKv
	 ILhfVWqijOwRz+knNDw9NseZ2VOAkdo6vjRo0m6z2aFSyIo2YqaA+mzO5+m0ta1JArFzg
	 WnFlMg1dDbxMDC9senoi+xJrL+sOfQGz2nxvo4CMRBp5EPCIgsi5wx0v0c1MBfwOAWyud
	 anq8il1C88bMtI+6tsNJpLUBzMfFAvzgHwKaC/8XOHGNLiQ7AwO10yEh2iEpjrv2sJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794214643;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=XzEGE3tZdC7w1G3PUODyH7sAeFFJNDrzFSsizGE/Oiw=;
	b=g8VoljGhpBG7ZIa1MH3CFTfk4oDCmaldznjvfC6ndnuEkXIHNmMTQ2OrkJkUuTMG/3nh
	 VueKUUkMJOEl/l4jtAoKU3J8MsgtoaIoqXrV4SHyjBtmD9FF3rjwKwsIf4dDlyX7QMoH2
	 S+dqoKt4fy3Hwd+jLJjo21acbwwYSm70BdKV3RIE6j/8fiJ0mPqlVq40TulNpgViYS+BX
	 8g7VM/kMXHshye5JLmHa2NIFAgdEh8OMJcGP1bgQ2HJOwHQd7yE4LoghYdn611UXd2m6u
	 1KO9y2nXNfcWBVOED648H7pc6N6R5kvgFwNWD3vsoCirwndpQFWe/Bouna5XAf3z0Gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Qi51nJHP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VeFy6aM3;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF26E606A322
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 08:57:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF26E606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Qi51nJHP;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VeFy6aM3
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A969xZw055799
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 08:57:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XzEGE3tZdC7w1G3PUODyH7sAeFFJNDrzFSsizGE/Oiw=; b=Qi51nJHPDFbJ7q8n
	qXkhTkmLCX/0LKCsplGWLTa1YMVJ3RwOt9AsTDmtZxJF62wlaCj3zv2Ze8Est1aa
	580pukGyxUUlTtAc8xrMQzhh/GOoI2A4URoEJL+LMW9hkiSg3154okCev2fGp00b
	vXkH87SlXdmdYv38+2XRSmP6FVSWZjBLfFRovyeJSZT9qb3mMyipvzS/O9hClenr
	2dHkQm6Elrvpwp71fNarlQIDxOvNn+ieCYjrAQGylXPpanmlz+Bn5OKKknMDbuDv
	/NQ2viBqKaC33FiMSFCOuqqWOvb2Q/aBWksxnXWh2w4lUQcv4jFEtrTqXdpsV8rM
	rWsEJA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4htuqm2cdf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 08:57:21 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7d2c7a903a1so523573137.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 00:57:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794214641; x=1794819441; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XzEGE3tZdC7w1G3PUODyH7sAeFFJNDrzFSsizGE/Oiw=;
        b=VeFy6aM3M2DUbgHAo/GOqbpk9ncqOFx5dD+e1aYRK0Q2Fxoti7uLbz7kV/6Ka2XWMx
         Ws37jKObk+ZQd+ZkKNzLS+VZMNckFJu9O+1hWC/yxJ1O72A4639vF7ZwI8O2zx4T0/vR
         7nRVlvBOP11Uh4M3/IBsBOmxdpg9aE9Ye2FC2t98fGbWwS5DrrUfKmJGRvzdVXd8YHMn
         HKuRYDH3OsrcccEoEayJ90TS/xZauzdfb17nL90es/bVRAzHMyEDHJ7LGu1Ya7Xkdtrl
         lQZ3Cf+o7cq3CDmDIArPLdFtgtstcJYcSUeDER3T4bA9xtTfxj6IIOaa4zXJWNG5xUkr
         d2QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794214641; x=1794819441;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XzEGE3tZdC7w1G3PUODyH7sAeFFJNDrzFSsizGE/Oiw=;
        b=2jh6JM2X6gYg7Bn/OBbK740U75VYW+GixqhmAfzwAACSDcdlZcBypHGZ1qcMWnOJAe
         N7SXpF6nagu3AHgveGI5Qp4rT0MIgtAh1phqUmD39v7CQ5AvweIJ07MX/mvnaYMtbd5V
         g5I3Ei1kzs1XhGa0MU3++sEAdcs2RhWshRa8TbFJEd8DoJ/fE3z1kIjlgHMGO9+ul0UG
         dvXo6uW6KY6qvHIGz1cUd8/ut5Vf3faFh5/ogITSM0p5AuEQRUytxaJoMvtPpPvVSwbn
         OEqSbisy/YURkquZyZzgC90GVRbtn8cAhqGZUV8Stl36cQ5B/7SruWZ/wdqvhT0UmIwU
         iIZw==
X-Forwarded-Encrypted: i=1; AL+hErEjB6+A9H/MSxbMIAfFZZ5OzvKwgBrTnLAPezeUsqOPI9R7XKV2cAfFVq/V4NyRkrcOPL4GKbYarWEuOeI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+HCeb/f84k3M0hMxjCHPQSZU6kGbPfo5VJ+21ENa8b8QefDNCr
	uIVCa4y0ntyxfhVgO4f4y/y6sTyShZ73rNIFVwCIB24JYUrmv+sUXCAwvngtcMDO4vXNt+GLqXV
	57WaSeOn4h7nIO6XD2xgznUWlxwtlGScyinaXNIvaBie6tysoGskltt0vJltA80Qz3k0=
X-Gm-Gg: AYBFou0JHvR2lBgUxctcqkr+HXKpSz8sXGdYbSG4xvJ4nTHL2JrsCc5E2X+o/S+evpt
	G9vGtkeNyLJ00zXUFnxGDo/t3SVm6/+4aAnLrpiCpfdEvwDEwA2yb8JzZsojbjeDQzsp6skFmtt
	gziEIgpLwfUpSczh2Fi6YwxBN2UIPKbR+JM8azml7gGpPzcmXPksXJHIdOtWmvhV9TxZx+5oWcL
	g6OOeYm07fq496uuTe/3w4b1/1N5hvJuWDQUxq9Cz98yBMCd5Uy5jjGcdmy1ctjv0jz/Np61mjY
	97Fve0op4ScrzSjodsnGPWNTV9Dd+MWgowxjCdxZ12P/fvOSuwvJjw4Dqpz6eR19kBDtSk8y8e0
	DoKbwNOsxdxTFqiyhTkOFXo850ch9r9vN4MJs2FpEZICDP2Ia1cTzyVN3E2Hvo7aZSXR9xaU4Xw
	fIS9HTonWCQ9SJ44b/O7KMqXld0Vh+7xD3r5DVnS9pbcxUptfXG0wfIOODgT0+9g==
X-Received: by 2002:a05:6102:3ed4:b0:7cc:1045:604 with SMTP id ada2fe7eead31-7d2db195765mr1024638137.30.1794214641207;
        Mon, 09 Nov 2026 00:57:21 -0800 (PST)
X-Received: by 2002:a05:6102:3ed4:b0:7cc:1045:604 with SMTP id ada2fe7eead31-7d2db195765mr1024622137.30.1794214640680;
        Mon, 09 Nov 2026 00:57:20 -0800 (PST)
Received: from brgl-qcom.home (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49592f38e55sm9001442f8f.4.2026.11.09.00.57.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 00:57:19 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH] gpio: of: fix potential misconfiguration of hogged lines
Date: Mon,  9 Nov 2026 09:57:18 +0100
Message-ID: <179421463614.21176.6551038527438941872.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261105-gpiolib-of-hog-uninitialized-v1-1-fcaeaccefab6@oss.qualcomm.com>
References: <20261105-gpiolib-of-hog-uninitialized-v1-1-fcaeaccefab6@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAzNSBTYWx0ZWRfX6xU/yjFJDpN3
 JeoGEB8pp8AgHFXOJzYPuwX+XV2Lo/z7kQgV1AMMtesNSeMBtpbici9pMT1Cq3i47PaiQX6aTv2
 QeGV4WwylmPaNvrIA6tgYdt/9xjh5Js=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAzNSBTYWx0ZWRfX8D6n6fv0FISQ
 J+AG8VWG2ZFxE1KV+FiPgPIzCmR/sU3mYnPwBVO5RN+dUvpiATezeMf+4F4C7zuJWxLiKD+Afam
 aG12JVTdfEp8VIC0zXSMmPrNuGEkBY3ucG2mdng94ibfEpNt+73ppmJqnr0mAERyZxBdAGxUx+N
 7KCaXbIJUj/cSRsVtqO5aG7SDTJmG0u7zyTT0G0peGw8J66MXk09Dh9L3jZ1pbk3rS4XnKUwKqJ
 A0dc6Szz35h35wS6K7iSFn6k1umzJNCVII4dVZuSpoyQJ50yd8Yv8PAjrTxyPl3DwUEaoqUli1D
 kFA3YtL+ajjgjLg15NDmqI1dHeNnRsH/RSsnv8/shH6P8l9eTw/6AR9VlGkfdbpSgZ5iLuGx7Ew
 RHuiJqgUpylE/5AEt7AcnWLHdtwoCd6Lh3Bbhv0985L7dAGoNly+yP+8LP+8VDgqSju4n2L/RmG
 79z7bSybWcAjYVo44hA==
X-Authority-Analysis: v=2.4 cv=JLquIMKb c=1 sm=1 tr=0 ts=6af18af1 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=ePiHbNq-gTG-vOfASXAA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: 7omcqTDYpDZUKochRtomvUk4gP49UTYM
X-Proofpoint-ORIG-GUID: 7omcqTDYpDZUKochRtomvUk4gP49UTYM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090035


On Thu, 05 Nov 2026 14:37:52 +0100, Bartosz Golaszewski wrote:
> In of_gpiochip_get_lflags() the local variable xlate_flags is declared
> without being initialized before its address is passed to
> of_xlate_and_get_gpiod_flags() when processing a devicetree gpio-hog
> child node. If a driver uses an of_xlate() callback that doesn't update
> the flags argument (like gpiochip_fwd_delay_of_xlate()) we'll end up
> passing that uninitialized value to of_convert_gpio_flags(), potentially
> misconfiguring the hogged GPIO.
> 
> [...]

Applied, thanks!

[1/1] gpio: of: fix potential misconfiguration of hogged lines
      https://git.kernel.org/brgl/c/c62364eeac0f123478fca2f2d8e2424fdcd55032

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
