Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792499571;
	b=VOWOLfAscuH6Y4M+waKaL/r1xPA3Qr6UotJn7OAuc6NuXg75+9h7sfUUbGkVV3aOcxGw
	 VN7otrPaf5cu00PPergvM0EC6ezjzoyvnyWuoktb3DdlgJsLl+VA737InBVjV77xWnXhv
	 lb5suIsPL3/lSnRex90oyGaK27J7VRAT+nxQJ5+NGIC6xkidfbv2UybG5O65WpFtCBOt1
	 vR8cwDLtEutUhLVraid/CGMt4bErmTrRPa6VWNj/59g0XvMiXe+YCguZFUPFkiC+vJVSZ
	 Ub/wa3CjY6l9d+ZKRxF7jimo89G8RIGsQQ+RuT3suwooJSDtEYlijctN4XRze3maNGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792499571;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=mT2zW5I1WlZY2/7FQG2aOjw8oD42hU3uLHvKxDQfAJs=;
	b=RzW23UTqjftv84mebjGVdShjpEve/3jme01bRqidAXAx7nLEJtktgOWzHb9Qeq4w+XPV
	 NGBnIWh6TErxlR4kfWw84DhdjLo7HpZlMJps37XcS59juV+yMM86mQZCLWyTpSNhtvDC3
	 QQFVauNYgYV+/QSQ18PWqzb0wjsvDHQmHfqpqZoXVq4tRwL2PfBPpras2N6ISlDQfisj9
	 IKjzQz51Yc5ZrfcdC29EIr3be5sT0NbJUX0/ey4tlb5egM6f9MI+LHJl5Ovy5dMdjkIP+
	 uM9pWKmSSQDWAkE5qUq9i7DQp18e1/LMHTv8qMqyynxrMvHMOivZpyg/4gN6HXDiQxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MxXkJ245;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ob6ZogyF;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC0A3606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:32:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC0A3606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MxXkJ245;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ob6ZogyF
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KAwtfH1929062
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:32:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mT2zW5I1WlZY2/7FQG2aOjw8oD42hU3uLHvKxDQfAJs=; b=MxXkJ245Fbhum7/Z
	7a70COi0qXtZslToWtGW2SIFV4hVPZx4qI+2rEiYtCBNvHTjUxCQC1Hh7fZNANGD
	qAj+cuoDcakC7aXX8GfnpHyLkUY0FTw39xvM/vVnECGggOdYNQ9VTtoPEgDOvLc3
	nltv09bE1W5HDnkmR94P3i/vKLZ1W117kVHaH95NAQHZ/5EzNgHDgg8pmQ3/Lo3X
	bS5fzQLIPJpvrjpzGH0lKyjcZ7FPRyba5/PXY3bwdHero8mN1xwZUcOd2eNVwmxG
	E3RF3YaHZ89r/9DGeN2hNXJ9V/s1nIbHWgk0SJHTiw3jYCZMH1EdXJrJFf15vIpJ
	kiP+9A==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5ntcgp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:32:48 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91256a7b7b3so52638826d6.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 05:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792499568; x=1793104368; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mT2zW5I1WlZY2/7FQG2aOjw8oD42hU3uLHvKxDQfAJs=;
        b=Ob6ZogyFJY7a2FON4vCx0g3C8cGkF0WIkkulygDQAuS755I7imEfSUE3R8Se5pIxzd
         hfhqeXwiiBM8KHpg+mHN/gIbH8I8L2ByFsCte7efF5VKd9aoS3Ks7sRNmDPFxIP8Agv6
         5XRprUr2vS+p65kpo0LTDw6vwSKu39SCb1+SpA+273VJduLNTvxWKF8gunF3ok7eqEPO
         JzMWCtQbpmb28LyOfl3ZNnTTCL4O0wAYuoVMHAPfrMGF07SzF1NE5W298PK6yod4WX5V
         z61aT5Ea2S5HyBLmAXTtQc1meKmQH4a0r9yvyOcuSEwEy2yRKEwbt6mGeyeL9AEC6Px5
         ksCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792499568; x=1793104368;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mT2zW5I1WlZY2/7FQG2aOjw8oD42hU3uLHvKxDQfAJs=;
        b=b9r5tRJClYoKwIi581yW4vW1xahQ01hH1ltSOk4DQ7+nZNqucId+AEJ9ZaM6HUt7X1
         UeR+GVlDUqwqIzi/vhN8l/58cfYNZyWMRIdZ8/SViW0rjwWpiLGWWrGMY8ccIX6v9ZA7
         gbe1KXUdS2FP/tWyuFypEL36kD3XjDwpW6x2/Q3c8uIO4HArwe8FNx0d3uNwquW1WOZb
         M6V6oYc5w6DsYwrDYHcHvtgr/vCO+M74RMxIwsJnfNmae5t/PNdyXm6IVteueyt/vTCy
         xtEdFo07Bq9o5GZkxBOSrIXrXTxLc6HBS4VAnVnWzXET2lfx5c5CXzt4BJm2QNGvet0y
         lB7A==
X-Forwarded-Encrypted: i=1; AKwUvBycWXVWELLXZI9CvMSiG4fjjGKCbknQQEByEZd5QuxpriAknrRpnRBpExJbLzhPCavcwXYl/lDij3ChhAo=@vger.kernel.org
X-Gm-Message-State: AFq9FYL0GT2aIsFTNgYm+4ZQzhtiMH1P021RlbTJxYzHVI6nD2sNgbUt
	Ey7c04MOGjUvjRkCeZTUYOrM8wZY+ku7J3fSrZNhMKN0tb0pHLCcb4nLlqJ/c42TqZKDZ1t3ytg
	FXoAuj1gL66fRMGCI+0NMSKMLKDRm0Oi+IpVGxXF6rJ1EU2kOIWJ4oGTCmoXeOXFXYAM=
X-Gm-Gg: AYBFou2Un3niAAG/fEswE2DWhaml5PYkgvubbNrqEC7JVmcVvVF4G7IVtz7Ccd69Nch
	JqWfuVBa2TPSLbhccMHcvvjbVYvAA7hzpMx1O8oJ7B37hGp/OG+nM39TMI5rAymhmETjVy2oW8N
	zkiFGyb53ezHEOn8rrNMzmjsmp7qtGi5tV104Ggnu1eqEEH8lVTsIqx/vruWAHT7/npEtRV6nLU
	zo8IK0Bws9IQ1vAeO+BDpGb+mBdwK3fDb6x+R5z89HnlDct8EyDBXYo0mjv1cPtdDEJy9VsbtZu
	IRO/UHJ2UeLFpzAKkSsoxuGoBJJkWEJekPT9gdVN4vWN7iRUj60+VXnswXrq7rDfIg3NHc+Z8D0
	pQt0AS0mS1IyDSldYoRnLVfixQe4=
X-Received: by 2002:a05:620a:a7d7:10b0:93f:3163:3e25 with SMTP id af79cd13be357-93f31634247mr931725285a.24.1792499568001;
        Tue, 20 Oct 2026 05:32:48 -0700 (PDT)
X-Received: by 2002:a05:620a:a7d7:10b0:93f:3163:3e25 with SMTP id af79cd13be357-93f31634247mr931722485a.24.1792499567536;
        Tue, 20 Oct 2026 05:32:47 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d838dd6sm5866725f8f.58.2026.10.20.05.32.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 05:32:46 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/4] gpio: kunit: add test cases for platform lookup tables
Date: Tue, 20 Oct 2026 14:32:42 +0200
Message-ID: <179249955803.22604.7440027670903099589.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261013-gpio-kunit-plat-lookup-v3-0-3907f913e964@oss.qualcomm.com>
References: <20261013-gpio-kunit-plat-lookup-v3-0-3907f913e964@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA0OSBTYWx0ZWRfXymxRv409VlcD
 05v8hawKKVN8ObrdGHGCyFbDRYHf5vk4MC8XvPNnW4Tu+D0i/CuI1VM+iZiG3G/2L/XbVGfj6s2
 pn1gpjM96+62frzq/MOmGDeUD0J7e9c=
X-Proofpoint-GUID: 77OijHEAgXferjGypeZpiJnk4xlYqP6Z
X-Proofpoint-ORIG-GUID: 77OijHEAgXferjGypeZpiJnk4xlYqP6Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA0OSBTYWx0ZWRfX061eha3zZX0i
 J6piZMrJCbYDg9qmJL2KsNIVQH1kWzrS5BtDa8QDu9jKxWZeVi6thXOYw+oMA8YfeV/AksgbWn5
 3O/RusFojSaAxXc1E7Mdux2Q/9uQrsvYCw+n/KvHGc68H/ekuz27kb9jD3ymbNA2uq+Q1VmR/d3
 KSijyIDW6q4sfSG8Niuz/is1jd/7MshlndvhGpogOVC7UIWVApwJUIOfcChpEZjTViT48Nrs/0W
 GwdOUyHJ+FwTTSYFwp2s+zsowtwQGM7zVAfBCEzfcs+PXeI6HfGdZyQsrQ/sj+BdSeRtTOWh9mq
 Qw4xqYwfvYeVcEMPBu+S49nigIJQZEtcJUT/XlBNHRvtp12F4iyPAo2LYRfVGS+yo0LtominUr6
 e3W7hKQ1QmOVllXtntb/a+B7sEVIrYrk4yLERAllmol9ypzHK7/6ZOXB1H4v38cjPz6CNlVUqn6
 979Mdo9xI0a3kWR2kfg==
X-Authority-Analysis: v=2.4 cv=TcsDJhQh c=1 sm=1 tr=0 ts=6ad75f70 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=FdTQldbedhwpIuYvQycA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200049


On Tue, 13 Oct 2026 15:02:59 +0200, Bartosz Golaszewski wrote:
> Add test cases for platform machine lookup for GPIOs along with some
> minor refactoring.
> 
> 

Applied, thanks!

[1/4] gpio: kunit: fix the label of the dummy GPIO chip
      https://git.kernel.org/brgl/c/26615aab18d5a2c71170cb217bd80ee2aaf937db
[2/4] gpio: kunit: factor out common code for waiting for device probe
      https://git.kernel.org/brgl/c/c3e8906112e0c2f139b6d2c3db25835e8ccf643d
[3/4] gpio: kunit: rename the swnode consumer to a more generic test consumer
      https://git.kernel.org/brgl/c/d4904cd39642e52291ec84dc9c1879cd811f4e09
[4/4] gpio: kunit: add a test case for platform lookup tables
      https://git.kernel.org/brgl/c/9b0183f6943516a071e74990646e95d046b082b4

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
