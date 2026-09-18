Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24AB43546D7
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 07:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789718379; cv=none; b=k91UYsKNShtuBVqwHLHIJO5EdATJrgrR1VbYE+pFvWSTF0oAS24kiHH4wH/mAsa0tpHyQWr/fyFU9I62lu0LYdT1paXHwQ3cSXZUrDBpNMItRPI4Wl0499X+RUUsUQVJrA/A9RHnIcp+/cc6jhawGPLH4tVVDegu1xtq9zCP6Gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789718379; c=relaxed/simple;
	bh=TgzAnU/9GcL2OUaDzZzcoxSazgXpxCCn2FZR9xAtA0g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CdHQT1FOheYWi6E0QF3TccZC7Z0qWK29AWe+pLaT8vJcAANcE7NqvEUfkcMCpVyZI5nBChMiBNqxwbNzfxa6qn0qhh714x937vpGOZYqC7HE7v7K8o6PM7VvJwFd1ZykoJu+CBL7psMtpkND64/NnuFWXYJeHJRuSrUwQFaOC5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I4Rz5zCX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YqXYZ/mf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I4Rz5zCX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YqXYZ/mf"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I60WkK021456
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 07:59:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7H8+qVFCgEbhZNN14kB3tTwnx4DooRfea+gEM4MvUho=; b=I4Rz5zCXrC8Tkl75
	tMtl99QGUjyhWez+pRToyZDtV3LhRQ9bFVS0qHyopIuthhAySkiZwdx+YspS/Q24
	zLbELXcvPkJ+ewNLtLhVc4X7bJ0mpH20NgnzFtYoZQ6GgK1/RaddsyEoiKtOvtpo
	Mas/lgv6mXAN6/q/gUp7KlCcgdXwhMeo9x6OF4RknpaB9rxAE6A5lOCl5I6ljsxr
	kvu8bVKYxFYMUGBLhJeJeqqAk9MijR67ePqvrVkS7lYNnLzLwCwARGj0+q3RkH8N
	YaAgSrsf2PNjL3LdDH1s7+hn7r0mg2VmO/mmqaZEfkbP3+lh8DVerLWjhEKgN1U1
	mbk+sw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grnqeau92-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 07:59:36 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91219341db7so10307786d6.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 00:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789718376; x=1790323176; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7H8+qVFCgEbhZNN14kB3tTwnx4DooRfea+gEM4MvUho=;
        b=YqXYZ/mf7GyK6rXNoLInyMXjlTn/cr0oi0iN95a32k0Ac1eg7MgAw23r5AnBjZ1Dbn
         6fY5wCbgH1IxZENX/Ddy8bocvNKkF/VOiSNK8PAvZWiCnMPoJrym0urtj6K3jDUxgDZc
         6VOTQgLozHZt+mtjde0+wCNqqB1YuZkDgscjaW2C6mnjuTogr18sjQLNkjBALTCz0r/+
         OdLaPvWsIcVTyYv/MGflOOAuyqfc0bNvY3LjyHG5Hi25uXuFst4m0etQ7XTpfFiYzcFc
         mQ7e2cUYaS5Aq3FMhg9khqeNRGDq8cbgIYXYUai132edi1fNT4ccZxSQfv46TaSVtO1F
         GBxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789718376; x=1790323176;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7H8+qVFCgEbhZNN14kB3tTwnx4DooRfea+gEM4MvUho=;
        b=goN2Nsk0+O4PGiaKD96ayCA581VgcybIBzZJgczd0sZGG/M78s6oVZ6rQfZh9Cbzl4
         mTv34Os5uX0yoWOuazn1OroEXKFWI29wjkb9awf0wpKelkbQJTsQlOGJ1Vqs9Pp158iy
         5/WB91pCGH+oSatVnjjqmTVl+y61iqHp31AmbaiaYHUlnmR8W+Jpv9LEXYxejdlnGMoJ
         0UbjzhsBcojAbuzK4HXaF5Dhyxj3t7RQlMesYiDRNnXWqOIJxlWaa8+o1fRJgx7NCVLq
         NkQOfS7LV2KBkHKNLXtOKmul3pYfY8/bfNnfaPeFI2wmRExBOs0yi2BGSeStP67LpwlF
         GEUA==
X-Forwarded-Encrypted: i=1; AKwUvBwuPo7aoLWJLa08/IhEureQn/avBSUVRhAq5QyfyTVSbV2rxyIkBO3fhWIgK/p9g4eBWfv8/w2kwqIk8E0=@vger.kernel.org
X-Gm-Message-State: AFuF++lV8P9r2UzvctRkUJlAQzCUtV3/G+33QyYX+EHG42/RYUvdVyZu
	25zFI1eaabAr39anxsHr6o8IBuEj+0+Ad82/Km6WqlZguLriWLhmHJJUlAeKyFAr6j13ifyxITY
	AA4h5AvCDXUpnNuin64C6YTh7nku+xg0ptyRz0CFWz8SKoEO1uksx+ii0NASbmfXXzZg=
X-Gm-Gg: AYBFou2b5304+wqUbuSHjRjFoVPvH5C2AM5fc8ymBbe4DpBGcv4ZWVcY5aYcbr9B3TN
	ser+v0pPG3P+V6KZHOmuruuKGLMXFXoLQSweXJtrrRI8ncfz11ZHwXUcsIeULWI0bDM6pN0NtfC
	iltLCc4Tg+vH4gko3D+RbVQTdJMKDs6RR98XKBVabUt5YUpFmtTik0Fgeta1P2yCSiHjETGQQ9G
	q3+ReyEIWzri+8o7vppYtZDgv0fE4RM4PMBQU4BflRy4bF4l5uqs77tJIbyrdD4vxwZVQoTVovN
	oOrQHEM7V15ifWciEwELOA6a4lo38kiO1aO9r+HJLPsFvKSY1TZzmDpVhYGjljBqFl6SIhW3qvu
	jyvSc0E8iYtB2DqvL2RH6EcAR16qXNN2irYTP0tRs11cdzCNXu0h5Xpc7TVBQ
X-Received: by 2002:a05:620a:8399:b0:93b:d8b3:f9ca with SMTP id af79cd13be357-93bdc6db3b6mr214413285a.21.1789718376421;
        Fri, 18 Sep 2026 00:59:36 -0700 (PDT)
X-Received: by 2002:a05:620a:8399:b0:93b:d8b3:f9ca with SMTP id af79cd13be357-93bdc6db3b6mr214411785a.21.1789718376036;
        Fri, 18 Sep 2026 00:59:36 -0700 (PDT)
Received: from brgl-qcom.local (185.pool62-37-34.static.orange.es. [62.37.34.185])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4871feb5de3sm2358157f8f.1.2026.09.18.00.59.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 00:59:34 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Frank Wunderlich <linux@fw-web.de>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Frank Wunderlich <frank-w@public-files.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        frank.wunderlich@linux.dev
Subject: Re: [PATCH v2] gpiolib: use of_node_name if line-name is missing
Date: Fri, 18 Sep 2026 09:59:32 +0200
Message-ID: <178971836797.4310.16876510471798115989.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260917153712.134367-1-linux@fw-web.de>
References: <20260917153712.134367-1-linux@fw-web.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: DIf-Z3yeSNhlKbHhAtmMiCCNdJgnc3uH
X-Authority-Analysis: v=2.4 cv=FfiiV5+6 c=1 sm=1 tr=0 ts=6aacef69 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=gMXnIfcteCbZVvXnpe26Ng==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=31KojLRLK06XSZVqnngA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: DIf-Z3yeSNhlKbHhAtmMiCCNdJgnc3uH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDEwOSBTYWx0ZWRfX4D9+LPpEjIqK
 2vFxWF0KU8x27rjSW0RjfLp8B71WPmvFhU8nSBS10Ve288VzqmfqDuA8uiWei4jSAaG2DIEyy2V
 sNkllluQl653tXw2ZTDN2knDZk9qvU26AS4niYLwWlR0o3KYQK7LmItsWYjaMbut8gqvrBD/h43
 fALOmrJz4EnxzDRlnwcBfK5STqvPOdgJnkQUL5F3K080rn4FXK5FpD2pF1sChRnG/n0kTD+v1wf
 vMKQfdABou9jBJQme1ghLpQccG8gCuHpEH6FzvWYGBjY8xDXFI3ilSSeahanJYedODZGzj+wVR5
 zPPpEbj0dE+5YggFsWYKMdQbSkDHEoKOvjIpJ8/JBJSA4Ul1J2js9C7e7pOP5SxjH131xtuFMdT
 1kJqshBliyv7e6HU0gi4zznkROU/E421XBZJLD5ANzDvyFA+3JZ5SyQEoLZMIoxLpm82qkWPjIF
 LlO9FXXE53ZIb4EMRjQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDEwOSBTYWx0ZWRfX7BrUoZGbr9Fm
 CakVPf/RMEpvyvvk8dDqt6qgf6mqOkA/s9s2tAzSfpBFnphoNlYFvrr5YwKKI2ms0iWZhsjHzBP
 z6LIiF1YB2Ft45hPFIGkslpQ5pFpkg4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180109


On Thu, 17 Sep 2026 17:37:11 +0200, Frank Wunderlich wrote:
> Until v7.0, GPIO hogs inherited the DT node name when no line-name
> property was specified. This was implemented as a fallback in
> of_parse_own_gpio().
> 
> Commit d1d564ec4992 ("gpio: move hogs into GPIO core") moved hog parsing
> into the GPIO core and removed this fallback.
> 
> [...]

Applied, thanks!

[1/1] gpiolib: use of_node_name if line-name is missing
      https://git.kernel.org/brgl/c/d54a489c8c4b627775445d54a6cbd32f209bda8f

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
