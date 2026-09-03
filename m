Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67D0D1A682E
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 09:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788426356; cv=none; b=eaTk11GLLeo3NdBXONkYJ8w7qmI9zZMz1G52ovRQ/qDCV1BW/UDLjz6jCn8B/5wMKbVeXcjTiTxMjDhg7n+DlkgqYXUc2AGcuby3+wa/fkljFN64LfcXGgVBhXGLFxSneGDd3qUfELWAaZdN4YTpwPIUUghVyIr4qQha9C1v+nU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788426356; c=relaxed/simple;
	bh=16t1wYlESXNHV1d5ogyVgGBrB6MigRcgzWbD0VDvAwE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=r/rQbVzxk5f+NhVwXaBEtgj/vn40MvSyuSIDE3zyUSPDf8vUX69V+zmt0N/zBoQhuN0V8kj9FRuNoTKF8c+JIkYuE0+qQpvQfyKQFWvftB3oF6Amliwt7i4nbZMkZW5/1gyI8gs2j4WIuSVE1UPy6j9W1aysVW7F96/szmCbkrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HWPIG1FM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XZgOPutP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HWPIG1FM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XZgOPutP"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683923eb043807
	for <linux-kernel@vger.kernel.org>; Thu, 3 Sep 2026 09:05:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R+fNWtlDa1iJxJaqJ5MQJoyM+65iCLuwlHSHRZ9Paj0=; b=HWPIG1FM9bu0nPLC
	UK2tHzXvwg+LayGeffGh5BCVloUbESBnlbVFHaAGDLGUGH/yCg3DrEP+PJAtVroP
	r0iUjn1Jf07kZsX+fmqTgOktxsVKmuOse4apq2e6XHJuOAqquwGb4Ro54YDP78Up
	ufDVRhytFP+dSyuZFt1cSW0WAsA5fusM+et44aS9mCY2ha/YWWrjqIG53/PJjpFR
	8njQd/ycBJd0VTz23BfOSF2VWnegImJBF/GL37o4S9Y5aRGAiQqH3TUDDGDg+IaC
	arwy6CJdoRZh5K+a69q/ukV9OLkN8UaFiUpmFhLLLpcjwq3hO+4ooQq0JSp1/41z
	AUwVPQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf1pyh3rp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 09:05:54 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9382f9430deso398391985a.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 02:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788426354; x=1789031154; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=R+fNWtlDa1iJxJaqJ5MQJoyM+65iCLuwlHSHRZ9Paj0=;
        b=XZgOPutPpVilSUYQ7oX5JDZi0U42MJAlZIwPQW8OspgVknG/NmbG6qJtJ547G3LeZU
         yNW1yYjoaAPo+3ANzqw2gJJ4gksEJ5uBvgYXbbqgewiyy3m/vXOLzgFpi0mJuk79QfxM
         azaS5QWZ/n/GPPHWHxTndW0zYjEzAe1UifjgmWW4hHFf3WWI+k7Dicm3XDPO5b/itUw/
         hNKRd4oD+8/yTAz0JRYJijHCoEfIgOh+aNgWtkmk0ez7By3PdAHJZaeqp/qIDPYRXfy9
         uuVp6EG84R1bgCZ/621Mkq6G4aJKbdV27vyUa0Cim7GCCIUgaWli9Lv1TdcsT+NSapxz
         iHlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788426354; x=1789031154;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R+fNWtlDa1iJxJaqJ5MQJoyM+65iCLuwlHSHRZ9Paj0=;
        b=hXv9hu45eDVIhRzzqfXzXJMnssrFXvNbLwMEW7pr8WQ0OBe4Jx0l+7HYpoTd4cVdjX
         c3HYh452T2g4QnJdx2Trwxks43cp/kLJk9AqB+T/oYTnKubfMUjoMxmdjTGPUxjGTP/o
         wqarZanYf0dOWkpSnxpT2Gup34EUvITcGQOxC3UIztIDAUUI3Vk/KP27ZhZoq+l+xM9D
         3GUBSGS3Q/I1a7eNok+sjYZVimxkkdj7KTeHgNlB4JD0mo/iUEROHVwKbANDNIey1+5x
         1egq64mlxP22aom9AboIEi+ekFmptmQsgX3FuRPIq+90f40XFIocpv5DiiNz/H+l5eJB
         PTEw==
X-Forwarded-Encrypted: i=1; AKwUvBxwNRkrzE68l6/02Mx0cHTzJW5XIgBHS8bV7+3yU1nO+ExMGnIo0JLGG4FcVcTCIjXVLFSBmioO+T4ceVI=@vger.kernel.org
X-Gm-Message-State: AFuF++nZMSpbEiOtbGSdGjN6zXg3M8yMsZtGDcjFag9JluZBMDSYdLSy
	jdJhr/woC5wkXlsAktJ8VwX9xFvV+y+Am7TWq63s7EAzOOWl3OKcgZHLEgydcw3dOilR6CViqL5
	ll6qRHU5lPRyozLO94YzWLR0VzuMchqvOKyObYsnZGp/HOWNWc5bvdfn8PtcVSA8Ideo=
X-Gm-Gg: AYBFou3cjGl8aENu9DmTUP67Xhbs8BbAcfOOtIbHvW6Y/D341T72QioBZyerEy0Qyp8
	UJoEh7xBmqWy9GCAJfB9X2spV0N8Ufnv4WRzjTxfPDOgLxGyquvxM/ibrztSB6Dmk7UYgE3ME/V
	MwWNgp/r9c4wSalK6dXFRYR3yxyWlfEJq2xt7Ex6+MKOQl5JsxUlOzduxNhSegfmgBURiHxcvkq
	fg0s26+2OuIgfj9N7VSwu7MDHBwxAvmO7doeom9mQAJzFVzIlCVp6p9MfKQmm8xbQqgKZ0RCFxL
	Eo+LefNWUqdm0CB4BLTETzok2YCkqXqEgDkBqwDlMa0lSVgFgrqbHUbn53ncb1XgPNAp8Pt4dTJ
	/0c6ScjkbONu8O1xFmWCXHFB6NeE=
X-Received: by 2002:a05:620a:6ccd:b0:936:78c8:e286 with SMTP id af79cd13be357-93960f3bdfcmr1342723085a.25.1788426353710;
        Thu, 03 Sep 2026 02:05:53 -0700 (PDT)
X-Received: by 2002:a05:620a:6ccd:b0:936:78c8:e286 with SMTP id af79cd13be357-93960f3bdfcmr1342719385a.25.1788426353317;
        Thu, 03 Sep 2026 02:05:53 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:1c7d:412b:f9d3:3bfc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448eeae34sm13252650f8f.32.2026.09.03.02.05.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 02:05:52 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Adrian Ng <adrianhoyin.ng@altera.com>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, phucduc.bui@gmail.com
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] gpio: altera: Fix build failure caused by undeclared 'irq'
Date: Thu,  3 Sep 2026 11:05:50 +0200
Message-ID: <178842634831.35041.2924834087804467248.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260903030700.132068-1-phucduc.bui@gmail.com>
References: <20260903030700.132068-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA3NyBTYWx0ZWRfXwcbf5DrMNs5E
 PSvuTVZ2AMTJzslVQk0iGN50D/HDs0EmCgkd2lrkZAilAZTp9gkk68wlH3s87xurJN56lIxTyzd
 KjPjqIQeHnh9QUQLvievC1zjXwJh3yMdcguKX6Y5XD3Qz6REODe78lhFIiPiJbAdl3739hHFbFk
 QYwZGCt1a2CBgzaVkCh4xkLNIIoPof1dLrzl9zotgbCsw74T6WWTyTk4o1mGjrOBv1z05Xqd47O
 57RLrnpd/lBY+ZNXCGkoslUTapta416mVQWhRDraTMuAMGa1fcLGUHvRfZ8FPjd/unSAVnP6by7
 3lUZutxL/R6kaf+n+lprHZt7b/N2lz6OPB6eQlvVecshKrLsMjw5RXdbw1Zwzb4/W3A0hkZAKPw
 k2Bk11oFYASJpwkPgVpIt+d39UkMewAoi12v6JhSrO5DQm7fKPnYwl6Th0FUbwOU4dK/NbaDBPZ
 Howlm6M3tft3tfxbiwg==
X-Proofpoint-ORIG-GUID: 2DZm3aPwtSVS7zIZALqbWX7LPqsefDJA
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA3NyBTYWx0ZWRfX/AtkqAwhlinG
 IfaMOa8I45cQmWJAQAKqYDSUqvnGOnQXGJ4BKRV9r8spGxseji1PH4gI10KTaSn6cb1lDk6J4/d
 b1Ebvm3+Ua6LLQfS//OpUJ6aeXeHM20=
X-Proofpoint-GUID: 2DZm3aPwtSVS7zIZALqbWX7LPqsefDJA
X-Authority-Analysis: v=2.4 cv=DMO/JSNb c=1 sm=1 tr=0 ts=6a993872 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=vs4kvO7ZzleYl6-6OcgA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 suspectscore=0 adultscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030077


On Thu, 03 Sep 2026 10:07:00 +0700, phucduc.bui@gmail.com wrote:
> Use 'mapped_irq' instead of the undefined 'irq' variable in
> altera_gpio_probe().
> 
> The incorrect variable name causes the driver to fail to build with
> an 'irq' undeclared error.
> 
> 
> [...]

Applied, thanks!

[1/1] gpio: altera: Fix build failure caused by undeclared 'irq'
      https://git.kernel.org/brgl/c/a2cfc48fee416f0ea78e7dc38acbf2ce072574cc

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
