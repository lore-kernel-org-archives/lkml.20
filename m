Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BA2D493646
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 08:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791533511; cv=none; b=jSSWbX824AiCUS6uWNPAxQXhK3L8k4nIkCb9XriFfRTGGbhb0ZL22wUD1Z8zPC12ZgXnJDwXYRWqPlYTlMPRevxwPpeg/GjIHy/+Wg5dXXccAAj0hj5BXrW4XpV+CeZ5D8b50jtWcrqzOhb8DKH8LXc34iUPwI5iiOpwhlqEs3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791533511; c=relaxed/simple;
	bh=gRbbps69VA7y6AulrLwCFY/nwePzdK2qYrbO3Y+LK9M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UrO1O+787NsAhPU7y+UnF6SzyzzG2iyncvl+MHlDgPI48piXpftc8qpP3w1yPCXWU9NZhvWR0nmYKSkpxsOHzM76KzLPkEZOE0OxO42C9IF9Tqk0tdHwJ3g6xewWf8VnhdVY2+1bjanNz3j1rLIBEZlIgZdjENUySkxRD6wkSMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fzcMbtO/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LWTyU4ps; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fzcMbtO/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LWTyU4ps"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6993HOV11089441
	for <linux-kernel@vger.kernel.org>; Fri, 9 Oct 2026 08:11:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	laHJsYnI/7xvkYGI4cOJBcsCLbJtIbGPxkDhu0frTK4=; b=fzcMbtO/4jaXDsL7
	gyiTrLMv+dryBtFCkSLJXLL6xRC3loCmHoBxikesbtcI2n59pEfjAbFFqVlys9cK
	wgzZbkBfOCDuOdR728Q0enWZ9JbdarRUaf/Y5t8zWkQ/1Ad+A2Kw6W73cf/sGLo+
	TH2ZrS7MF7HIwVJAirB8J48huJvqMPKmpX2IIIxaD6Iqfoxi4p1nQSfvtbm+Kb+X
	IEGXn9VvZ6c8KC4cvcFOER6dWWmzUmAHOX7uIaIsBDeu2F2vtH5KcogCsxd0iW4N
	8eJ/PG2jfE6q4ywIf0IenZsF0/s5ls/d09K0zripZ/U5DgTAYz12jurE/vDxZCiq
	aUgBvw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6ekvawts-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 08:11:45 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cc359d9easo1032592685a.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 01:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791533505; x=1792138305; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=laHJsYnI/7xvkYGI4cOJBcsCLbJtIbGPxkDhu0frTK4=;
        b=LWTyU4ps7R1nnh3W2ZLte7OPxr0Cn9kCJoGYhRJAsbJcr2Z+QbXNIdCATJVpPl9hCx
         cN5SCfK/JReW/5Ruw46AYztuTqKZisaSVDyomfgN02mQAm9pZDwqlJt4BjMMdJTpy9Cx
         Pmv8YtSrWyjoWUq190x4dUxmyaymhAtOFbChD1ZG2hxtV8pTq6VKK7YX7V7Ds8DOwv7G
         02H6AMnAqQyg5BeDf7iv3fQ0o3sdZXqAr8U/8iAJ5mdCdnRgwnDU5h2i59tX9/4Z4/ij
         NKrfN7nd6mEMTiAUlbzVB2a/gCEpvN06w+lMGaYy0+YBmOllfCHQMMY6mkvOggezpeek
         Nang==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791533505; x=1792138305;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=laHJsYnI/7xvkYGI4cOJBcsCLbJtIbGPxkDhu0frTK4=;
        b=n45Jk+1QxFlSuniW81FoPKkJOfdUKM7usUNRRax45dlqF7Bi4kvfpX8If6eL+B+x9W
         JlJSzDuLdzzTyV8/H8YEr2qcfcvRFHEsCPyUoVkxEZr6N6dtuVU3CMcaYMBYvuKOZ8bf
         hRCl+6QQkMiRwfizafxz1gfM4BaxvnwWWCARXL/7/q4EV/hurWMtX9G2XOCB2YVzDxdc
         lGdndn2jQj1SmQ8DErkhemAz7tKHMjW1I80dakmXBOIDeR+jip3d9bjOAg4TafK3L9wY
         kTeh6I/MsOf/JNDBWleU/2SQJfteMJ/dUpWPcdfnOW9Q7N5uH+SUJl8AmE1agCGEFapi
         wQzg==
X-Forwarded-Encrypted: i=1; AKwUvBzPlkC9a0OrAEplqN3PMLGeQAkBK3ULKsqPwJ6aWXk/VlbPdx0I3dM+IAGQDF1FLhFZr+2vACxDLpVybZE=@vger.kernel.org
X-Gm-Message-State: AFuF++mz4g3Je+SZ55+OQBoCxoc5FlQrD8cLzsIunQq3YXsf0dn/BKK2
	Kippetz7E5XXXiFQjf1M9aU0+DxwZ0i0O3MATIFoXfZd0YrtZk0Io7K1nmSzF+jJ/NUG82gNEOD
	VSKUPx66R2hvF0fDzgtelAxV/jmMpu5a+b6+w9nOZqgmpSTNXQpYanDUxMjsER02R+F8=
X-Gm-Gg: AYBFou0FbnkvQaomTbyHa0pNu944Py1zjYLyQCR1VUzmQLpwOFVHot57ImxGKHzx7DQ
	Tvc9Yy+3PrdolbjojTKKpas1l/yhtx5XWIo7NFSIsi+wiaQLQ8J83kL3ugJJqcn0OkkdsjxNHIw
	nOduSppf5zLs96rWpm1knUW9aK0PiilvLWmtSmjMvX4ufqMWDJM0P4VWShls515h9MmJ6D/MDjA
	yE1zgwlvfKgIvqt/I4wC0sgSILoSg4KLeD7OV3vTjrMUiEz2mUgNrz3wQF98l5tcQxGh7dOH0HC
	+8RnzvYpv4yi0a/Qc/z8tpHCKpDtxw08+LRpC02UHKNUJJMrpYGKgahATgkV6XnJkVK5QvFs0Ec
	mrnf3UdOfc+EGmHvKulwXk4ZPGsI=
X-Received: by 2002:a05:620a:270d:b0:93e:976b:5c44 with SMTP id af79cd13be357-93ebd2960d8mr145640585a.65.1791533505204;
        Fri, 09 Oct 2026 01:11:45 -0700 (PDT)
X-Received: by 2002:a05:620a:270d:b0:93e:976b:5c44 with SMTP id af79cd13be357-93ebd2960d8mr145636485a.65.1791533504545;
        Fri, 09 Oct 2026 01:11:44 -0700 (PDT)
Received: from hackbox.tail37bb1b.ts.net ([188.27.161.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18be97d1esm65404655e9.8.2026.10.09.01.11.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 01:11:43 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Frank.Li@nxp.com, Wentao Liang <vulab@iscas.ac.cn>
Cc: abelvesa@kernel.org, aisheng.dong@nxp.com, bmasney@redhat.com,
        festevam@gmail.com, imx@lists.linux.dev, kernel@pengutronix.de,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, mturquette@baylibre.com,
        peng.fan@nxp.com, s.hauer@pengutronix.de, sboyd@kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH] clk: imx: Fix clock reference leak in imx_get_clk_hw_by_name()
Date: Fri,  9 Oct 2026 11:11:34 +0300
Message-ID: <179153345647.1914323.1489876411002078599.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260915055515.1730145-1-vulab@iscas.ac.cn>
References: <20260915055515.1730145-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: m7tyaMEenKp5d2QnvorKfoTiqU35TfaM
X-Authority-Analysis: v=2.4 cv=csYOAF4i c=1 sm=1 tr=0 ts=6ac8a1c2 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=EiYrS7xXfcF7w+nkr41hpQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=DNK6b7R2SRMYshW6mIMA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAzMiBTYWx0ZWRfX/PTSBW4UPuzG
 Crco21lDwnwtH0cVh+IXjtWJK5M9vk9tkfkIsPmC6N9iFri/IUgse7MBWx11lNlBiO/S8qGZvLr
 NDBBIMjzVnpKXwkCnmj9owF66wHOpp2fQ1VnUcdByRYHvQuhPvO3jsAlxLiCPBCvMKp5vHshFnp
 d/ECxMz1q4ybCm6xu0wVBc3WSd5bU8COi4/Ry7yA/pO3H4xmNqBqsG+ujY0FFGMW0poDs+uoAzi
 AEg2V9plZ7y2G7kJLQpF4MuB5RVLHmr4ctWyJb4wdU6nWODYgE9TPR1OHXDVlDWrdZ/+3Uomheo
 +6YGmb4MEpldQdnSB3CakM727CGY8JvnMFO8S+xC8nYDleU8WK3XDVR54vrQ4FqeiCjDgersgRP
 C3NBdlqB0s52e0d/NGT9EjVenV0/IRPiOwp7g/P0Gpkd9evWN+RKdYeOjqsCYNJKU65X3hYz8Gw
 Hc/K6C3fBMr+gzoBBgA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAzMiBTYWx0ZWRfXw44yUfeR+kub
 DjHrTt9AAQQ/97BkuSyT5gdbdwVtgFPP2DmS7y0OgKyU4is4TKkMEDD8kLepRfkdZoPKdHTKto8
 sKTqazOJffw58n8NvkAV5+pDmEyVLog=
X-Proofpoint-GUID: m7tyaMEenKp5d2QnvorKfoTiqU35TfaM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_02,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090032


On Tue, 15 Sep 2026 05:55:15 +0000, Wentao Liang wrote:
> imx_get_clk_hw_by_name() obtains a consumer clock with
> of_clk_get_by_name(), extracts the hardware pointer with __clk_get_hw()
> and returns it without ever calling clk_put(), leaking the consumer
> reference on both return paths.
> 
> Extract the hardware pointer first and drop the clock reference with
> clk_put() before returning.
> 
> [...]

Applied, thanks!

[1/1] clk: imx: Fix clock reference leak in imx_get_clk_hw_by_name()
      commit: 8e177ca735761a1f03e1dedffd7ab00d6d0540ae

Best regards,
-- 
Abel Vesa <abel.vesa@oss.qualcomm.com>
