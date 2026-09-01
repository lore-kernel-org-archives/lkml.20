Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E233425879
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 16:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788278453; cv=none; b=bdPC7HdtA6G6sPj1/SaAu7LdiCv9nAsvBRPHf/GmZ4oiCTG8d3XnZ8NRqVcOB3DGR//9a7PFlfpoJn0Jvm6PQV75KJW+iMbYMtpV4XCZXdc0B0BBFF62zI8TQfKt5axphpLIejZTK3z/ZUErRgNVJHBgXozjEHtOSNJDEM7OQ+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788278453; c=relaxed/simple;
	bh=VWsXx0oUb/3cr023vldlEdubGn4liZ5nYTzyVVD9Pso=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PFb7LpJaaTionW4/D5R1zN4KiRTIsSa9v5ORKZ5zdhvcbelxoXN6HJylGFYZbclBgBGxggg8w809Xh+l5rThgSBq1rZWOek+bWEytghKQwNl6v7Fm83C/EhdoseUx4jpxRAmZFR/DnPYomwrKcBPv+8DJdNmwbY6tVOulWWNFNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O23rdkJI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RfAWnGfN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O23rdkJI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RfAWnGfN"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681E8do53913701
	for <linux-kernel@vger.kernel.org>; Tue, 1 Sep 2026 16:00:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s4J8eQJ9hKtkVUcAFRu9iHtJLeOFXzc723DIMlxjsbk=; b=O23rdkJIh/Al3g4I
	7HkC+OcZ7W0SgTtl8NgVSu/avNHVZc7hsCvhT4YhH936ODyxkaF+skSyRXcydeOW
	I192VD41gpMnYAVdY2qZH5ajE92nq6yfUF9Cp2ShrKCpXBj0T5WM7LQzvEu8zpWQ
	btFnVtqWjJOFdlABBy7ORiTPZyS3mhEmMopZXaiH+zlQk7Eo3o6zKzeKOvSBaEEI
	XDNJfzjjGMkextk3rmN/ZswgLcI4FrWY7/VomOY0AYyYvDm9pyY64dqkZsUivk2D
	Yc/JDM3+SZ8vFB+uphi/442vX7hdpxn/zKkU4+F/faHBr85EDZQXTuYDyyIhEZyu
	regG5g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdsnu2k5f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 16:00:51 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e5fc4c7e9so9328185a.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 09:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788278450; x=1788883250; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=s4J8eQJ9hKtkVUcAFRu9iHtJLeOFXzc723DIMlxjsbk=;
        b=RfAWnGfN13dHD+B8s16eZhWjqd2QVIEFG+u4B9PLgOavrBmzxz6RY169EBg9jvLlux
         D9qJ6Ynh1O6NpyuFjIHPIi7dteKdhOR9j7B3Lm5Z3MiqjJ6xrE9JrZ2upgxijnTVNuEp
         cQIoffINLJwNN3t/rlgKYOQ3BpsyVO2BO0TyhPD/V7I6NOrdy5B9ILSKeSWwi3LhswuX
         lh/2uxaxiVfCVVwkG1L4SJuawR0NoPVvU3J7l6qK/NWiWXRWTJwbT+l1aa7ObptRfOKG
         EGy7VBA4gpjGOS0vaiKK8tN1YE60K2+EzYlS2/BpFGnrSlhH65X/EgQQmV+HqEShJfmJ
         83lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788278450; x=1788883250;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s4J8eQJ9hKtkVUcAFRu9iHtJLeOFXzc723DIMlxjsbk=;
        b=ll8b4jIRNlc6Nps8BbVKGe/RIGb61gK6MC0LGX5L80Bimo5eAzP8JhkqnYgX/HWfJt
         jSOuKa8x/E5Hl5uIDX+U1oSF+N2I51hCO79mR7bj0uTP34/ZadQDLVUzOr3qk+yjD0wd
         TZ+79nIdYUYmzT8aNvS1qeZ7sibUEwH3PWdChd6QFTMb8qCsWHyWgArIOl2TK1YeVWCB
         bdKKGqUJJzpI6CtOiMFquDEoF3PxczRtSIRMAGbxh/IPd8nyjnvLfPmS+SNfsLPCaKxF
         JUeHlSPxXPpWAGOBGR9IDs8ueyPi6o0MPEDVuVr/P+3OwwMVLVBKuws20imbtckfJeb2
         YJ8A==
X-Forwarded-Encrypted: i=1; AHgh+RrvOsgG80cogUb3RZrCuFlI+VeghV+F83si66Tgt7L+HKJ+eQdxYm4MZG1u/Q/tdApvka7zARnYNwNDPfs=@vger.kernel.org
X-Gm-Message-State: AFuF++mogPGwnS8xZO8y0xqKlYCGCqUemWNqlupZeI/2X20ZvihtbiCY
	1IAHcsO8ySLzhKc7KpPPm117GPu0an91aPrAfQkFWzHV1vZGvYL+p/FNC7Pe+6NV+H8+jkqpa9B
	tGAiGP5GqP2/HbI0MkyYn5eNSKQo3nrB2/kBCTrOvBR1T+fkngLhMfDL5UUWGPGKa4V0=
X-Gm-Gg: AR+sD10yIqiIbpnF6rxF+Op6XaT9zeoY8uRxGyhlChbSqihTY6/Yn39Esa5+Z2wiid5
	3Be98zG3K3M7ZUnKeBeSdHuA3V5HkYxUJ4kNXO9hSTb9LsqSq7qZ8fi6cEdS2zFQow1pQEBOzPn
	VzuSIM/H6b2zTPQNvHjM4Ows8mVRxxczspRe5WO1WEQp1N/E1tt6ONOHoTDTnEmYBpoPlt1dOq1
	jKRI6Dusw06aoBjRx2RDvkRvgv3IV/batdJZOhprrInGeoOXp4oVDxhvU4N8RFGRz/G7fhLOZDI
	gDbLGiFgLBHeq/C8fwE6s4YGPw467cMbAktRTmkKCIoPkRbr5YWqUwM5aYfCUJsS0mhcXBO2W4X
	luV7cXUJRO8mOE3R7G3iV5FzypQ==
X-Received: by 2002:a05:620a:6190:b0:936:41fe:2351 with SMTP id af79cd13be357-939138fc2a3mr4281593685a.30.1788278450005;
        Tue, 01 Sep 2026 09:00:50 -0700 (PDT)
X-Received: by 2002:a05:620a:6190:b0:936:41fe:2351 with SMTP id af79cd13be357-939138fc2a3mr4281573085a.30.1788278449321;
        Tue, 01 Sep 2026 09:00:49 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:fd4:cb20:f8d2:dc94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cd8148fbdsm89484475e9.3.2026.09.01.09.00.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 09:00:48 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Mika Westerberg <westeri@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kivan <vaknins33@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Mario Limonciello <mario.limonciello@amd.com>,
        linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org, Hans de Goede <hansg@kernel.org>
Subject: Re: [PATCH] gpiolib: acpi: Add ignore_wake quirk for ASUS ZenBook UX425UA_UM425UA
Date: Tue,  1 Sep 2026 18:00:46 +0200
Message-ID: <178827844334.39529.382963115769227795.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260821070651.39763-1-vaknins33@gmail.com>
References: <20260821070651.39763-1-vaknins33@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDE0MSBTYWx0ZWRfX+CiX8zM7pT5l
 /LabgsOVpnc5J1gK1u4BRtpXL8gbsSzMpWBjKHB6c+Es3Hlz+M0GGdzR/GgBM1285YR1/7PIxUw
 GhIwukRXr/0aRgZf7vH0Wt5H9S3MsmIB085Au2E6qzzoXaE8/Hydz1fJXlb/BnthbKKocJoGjr6
 VJr8SP7iznzWYyYbawT0CWAJUyaBiH/zEt2fp5Y5cLW8g0un1lDYKnoEHj0opaS88jcwAnnoL3j
 dl+pxgxkvZWEMxeuPg3WKcCugCav0HR9+P4ZhS6AguXkpKmrUQzfVrxW9E5hap8r7GWruv8eht8
 EMwD+7OJ1xY6nprjo+kmJyJ+ulegrlKLsJwfliyTKhXSCUcjJhM3tlld7i5Hk34ccMpG3RItX7U
 gQO2+O2x6GtySj7O0vcA/BL5t+mACRjNy56C28RFf4s8YNyfdONJDMiicKZWGXXhjuIypYTA4Dy
 g3v48vFGR2Op3r2bdLQ==
X-Authority-Analysis: v=2.4 cv=L6ItheT8 c=1 sm=1 tr=0 ts=6a96f6b3 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=uIWaOjwd8bGiIQV9JQEA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDE0MSBTYWx0ZWRfX8EWX/dBPNdQA
 n8RdIBIoM2ja9VKgbOWoIjC4jcW25zJESd5ShfXmWfJBDnY7FMubJWTIwRKM9u3JCLejjK1WLOo
 bFlEn++SpAZ0X/nWTIn8tlJahlVqHiQ=
X-Proofpoint-ORIG-GUID: cCi1YKbmHB6MtodPED2-i5Wxy2f2OPoG
X-Proofpoint-GUID: cCi1YKbmHB6MtodPED2-i5Wxy2f2OPoG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_04,2026-09-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010141


On Fri, 21 Aug 2026 10:06:50 +0300, Kivan wrote:
> The ASUS ZenBook UX425UA_UM425UA (with AMD Ryzen 7 5700U SoC) fails
> to stay suspended in s2idle (Modern Standby), prematurely waking
> after 1-3 seconds with 0% hardware sleep achieved.
> 
> In the laptop's ACPI SSDT tables (SSDT15), GPIO Pin 24 (hex 0x18) is
> defined in _AEI as ExclusiveAndWake targeting the PCIe bridge device
> \_SB.PCI0.GPP3:
> 
> [...]

Applied, thanks!

[1/1] gpiolib: acpi: Add ignore_wake quirk for ASUS ZenBook UX425UA_UM425UA
      https://git.kernel.org/brgl/c/1900b5a41493e7050c68c1e62780d6fb9a209457

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
