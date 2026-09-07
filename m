Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1C6744238D
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 08:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788771183; cv=none; b=T+G2zQ6TjeXvKV/J1HtbwDCWhvppWkZS2wVtsDImYU+44m+hRWj8PdHgdOiBEiPkKEZHaZz23LfzqkxtJe73tCNqHPgULEwtmbNwGJGwRHBpHjvrsV8pJks7cM3Bke3rsrTunz8So/y5+hz04g2ccxQg0z8XE7fpSXa3Wux9eh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788771183; c=relaxed/simple;
	bh=q0qQZEkqK6Msbf3TjaGuKNzYpT4UX5YubX6sxauOmsg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ej87oMxStDcXpYvN7sXSc1bVr+ZQ1FRDetOw6kMQjq+HW8SkNXYL6F72WprIBNwe8r6DDJOdfk79FJYLTShP+NxlQRbQFIeT0bhDYhgcb3dj6JznWV4Z5rHZLZMxf7ieJYIoO5pJtrcJAGZgYlmQyuywpWu2mV6PI04BLaNRfRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ofJu2pYk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=adDpHNsc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ofJu2pYk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="adDpHNsc"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68787TRE3411496
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 08:53:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LdAhXpSY0MrEXYiI76VQYeRGlljeXWxRkvWbDM3zuws=; b=ofJu2pYk34uJjIFz
	XZLwyPiauWz68SDs0FAKcvvBzIpf5Kp+KI6D9cwo4QU0aMzFFFYyrXCxrCU/nugm
	LMJJm70RMoEMuXGxZA5rDgSSlthqS+JeRKYcj00IdGfwfO0GbUNjr9B4Dbh0BJa/
	2gtb9r5ntzlOZADOl/nxindLGn1qojrdlRGC2ZLJZ3/i9oG57qS+EaviIN/KlDZF
	2N35Hn+bE7BbVU7cNppzXedHKlMduOIWydhSWj2vkoMoYK8iib2+Olc4ZnCMArsj
	gDdMAUyq96InWacE7tjvRXr8Q2Hmwq2b5/aEAAweYr6D2lbso6pqK1xxV3KEQ7K7
	95UHjg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghsfyg6ab-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 08:53:00 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93903982af1so754267485a.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 01:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788771180; x=1789375980; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LdAhXpSY0MrEXYiI76VQYeRGlljeXWxRkvWbDM3zuws=;
        b=adDpHNscJJreG4bdzftNfSYGIfGtV5GPSm8D5Sil4S/j/CzU3HHG2GKhvueXLGi5Zr
         7EFwTAI1EWWLyJ4/pwrisMW2VT8dLYHhMBvkBYH02iMMltlRo76ZAvnQKezAccqqyz1e
         NWMcIK72w7qflfNyiZqhiTFr4kdhxcaQA/FyfV+Tne1aTlcBpCf3fHhjhx3LKQrXAzh3
         V/5GTEqIwsrqb1loHz7LS/nOXwDvrGL6u/CCmc7FAXcJva+qp6qtq8F+0de+tL58QBMK
         ObD4AihqfNhYt1a7X7hYtOBkKz5t5ohIQZ1l9E6nNphoWd30hbMxb9O1ePbaedCCQ2Gx
         8zmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788771180; x=1789375980;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LdAhXpSY0MrEXYiI76VQYeRGlljeXWxRkvWbDM3zuws=;
        b=swwVHVsjlaZhSd8+dJsQ7QZtjFTD6iIksGD41hau3SRohhkhJf6W21oQI3a4++uGPT
         GZMapS9L9Zy6pjBkJgOrirqYqtpAPYzL+kpAE1/VCCjUB5UDM3L11jNCHFNRkjH2dnpM
         P06kE/4NsNHacinIzczRAgp+1cL9wcCmqX/eD2qfnn07RnF/oGZyNvTZs3Dy6N5sTBLU
         gFT9apDi6G8n1uZ88kNsDkvgTMa3hTDYvYYWVh5M23KMQBrln+Ji5wWirl35ANy3ut+e
         EKfz35kQZKpiK7JtsFaKu+vMZJ7ML7paHu8npgYkOXSWK3Jd6HUbuvPfPIuW9Jr8QzHR
         NYNQ==
X-Forwarded-Encrypted: i=1; AKwUvBwkypViMGJYf+wkVuYbgwAo+PC/8QvRdbcYIK56yiVevMA7YWb9DezuaVzQIM8xw6ky8tHXEmLQsk4fSGM=@vger.kernel.org
X-Gm-Message-State: AFuF++kDj+03wy4y9vIMxDgsIuzwCfnLvOLlz/+04z2NCbvT6vnzaAFv
	/VPhSgJC39VjP3NWJ38lIxXpJjTIg75fNU0IJ0xZcy8PkuqNvzXetQs8YwT8ApXjZgubpzbb9Fi
	Rt0Mb/4WKb0KFEOuCasK3RG4MFfR9By5CHERVnWID0FMs1GhTZTRbJfBafQn3segRkiI=
X-Gm-Gg: AYBFou3sndxb0ROm63tL8HvEv4J8vDGXv64ygCCY1B2WowgwlEwrjrXVHHVlBFTt7QY
	Qwif3Az1c8jkebtybRv4CRA7l4teo8OVXI2aL1rEbaJ+UN8z7p0TbuPn2ZXHRNOnXUT4qVuM58l
	Z9+OzZV+NyH8NrKg4Avk2dLWXt9Ky+0FhtrpXebYwI1AgponS0EaDkkWQ8rLQEbB3RUR7AuSzFH
	nEc6EbaVak6rfmO5F1mzritYUrHcCz2YtCY0cvByRgUfyt3oYD5TnIEO5pS+9M906LrJx8iGC7C
	2SdIGaltJthiFgUwFkSgWmKyL29retxYoHb3WgQ1i4XRie2tocyAN7tgg1yidnLT5PDEef7k04p
	5TFeipyvkmNmHEEC3t2RQtupPWQ==
X-Received: by 2002:a05:620a:708d:b0:939:49f1:f975 with SMTP id af79cd13be357-9398072f43amr2299768885a.43.1788771179781;
        Mon, 07 Sep 2026 01:52:59 -0700 (PDT)
X-Received: by 2002:a05:620a:708d:b0:939:49f1:f975 with SMTP id af79cd13be357-9398072f43amr2299765885a.43.1788771179427;
        Mon, 07 Sep 2026 01:52:59 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:48dd:b57:9236:95f2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883a9b49sm22984773f8f.17.2026.09.07.01.52.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 01:52:58 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linux-gpio@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: mvebu: name regmaps to fix debugfs collisions
Date: Mon,  7 Sep 2026 10:52:56 +0200
Message-ID: <178877117448.9999.18406164256759299941.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260905004334.177074-1-rosenp@gmail.com>
References: <20260905004334.177074-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: z58K82FDhRGi7n4K8PL6201ZulqXHZ6k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA5NiBTYWx0ZWRfX+iu20qUmqW/D
 kDTGxyhM+WC/6yjXeqOH5HIXwzQa7l2yiNkE/n3uybMCNghX3sdsPpD1lGN0P8ybhdSOTmA+KaU
 xnm0Ma/tB6X08kqoq/PgkGLdMLDQsHaTrgwd1jZwJdAB3I6HQjillAq5mO1JzYlSiccUGwyIOos
 R4HfMcOKDCC6mRyjyVJMXDFqTnZLCiH98O/+RtdH7/HbGdxDiwTJUemVC6qULQqrZEMyjMSblBu
 xO4MEQ/S9BIFcV01KmaZEhOT0ZJKoUic8DyKXACosiy02Tx2IQjpu0MqpodoIosXKXT9WgiR5Gh
 AhKPLzjifZcldvz6EkoNW/wxOcj9G3YwmZjwk7iOMNI0rYxpOmPB4zPH3TlNRvraGCSX+Upqqrd
 TzUHIsrl71FlNFpf3Gy835ExL6Ckuk/RqYrluC1YH6OBtpM9sBfJNocccp4uz0kMQGKO8F0nJH+
 fa9Vgt6ASsVGNMt5FUQ==
X-Proofpoint-GUID: z58K82FDhRGi7n4K8PL6201ZulqXHZ6k
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA5NiBTYWx0ZWRfX20sci47u7jKQ
 GVZSkb1t5JSt1KXQqJZ1x4d4jdGH9sVkKYRW+Eluk+dqJMFCnf6QdUCEdeyf+fYdemyXzg67hOk
 ZxG2RoZFOZ+sRpM9+tHcOmAPCyiNl/s=
X-Authority-Analysis: v=2.4 cv=AduB2XXG c=1 sm=1 tr=0 ts=6a9e7b6c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=8q2mPcn4PX5QYCfP6OYA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0
 phishscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070096


On Fri, 04 Sep 2026 17:43:34 -0700, Rosen Penev wrote:
> Each marvell,armada-370-gpio node provides both 'gpio' and 'pwm'
> register windows, and the driver creates one regmap per window on the
> same platform device.  The shared regmap_config was unnamed, so both
> maps defaulted their debugfs directory to dev_name(), e.g.
> 
>   debugfs: 'f1018100.gpio' already exists in 'regmap'
> 
> [...]

Applied, thanks!

[1/1] gpio: mvebu: name regmaps to fix debugfs collisions
      https://git.kernel.org/brgl/c/4d305c2273123119c27d6e4c822215e650c451e3

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
