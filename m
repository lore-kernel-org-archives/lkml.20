Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0797030149F
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 08:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788770946; cv=none; b=tbcebWEDQ7INQag5lKUo+yPEBsLjz80zjT3ogB3x+np1OAXCtKPLgfoVU7gv3lmlmonrSnOfqQZjEtSrqqdIXiLI9KAd0M5AGgWaEmfpcrdp5PNHaXiJ/xM+knM+Lq7yEd+ukISe1IO8xnsfuyYj2+06/4wlCsNlsOUIVKBisxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788770946; c=relaxed/simple;
	bh=KNbGQKtxz8KcCXd2VzZErD0YC+USpVaTQvnS4gqOR5M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hY1aOxv0f4NKYL52vCSbTF/VkoeMXvyo5OSSNeallxUFPids2QlrXkpsZa4m7Ytb0Htb1zd3Mj66QoonK+0BFtB0nenWQ2BUwUAh/+HeXeBwKMOcr9Y6HnXyXqRYg12C2yvBbhl9oP59IVxLpczaTL7FMsRK8zgqpKBafpUpNiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZL3zZ0a/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SYBjyyd6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZL3zZ0a/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SYBjyyd6"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6877NNrj333060
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 08:49:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d/0hMYtV0AUTvKgdIzntIko+FkAJyCqkPlgmbhqUNjk=; b=ZL3zZ0a//OqFRTiZ
	BVksRn9MpDegor2kl8y1SmU9no2vhNptk8la6MFQedNLeBqIYkyG1uCzcXQviN22
	gsEJbb+gBeD9MmHMDC2yAjsCc+GhbGGSfm8AeFNpp8+XUvDfZsi7OvRjOnUvNvef
	srOyl0NrPrPIXm9p+zwuuXR4kaQU9SUm4ksGe3VSmAJXee3dl9JqxCIH/LX6/UOW
	ZuLIV9Vyqdl0M9vMDfpGaWcnvCjfRgN3jB4/lEq9O2rlZDEkO6iQ/LlTAnSipfjW
	P2WEXTl/W4/gmz1gE5xf0Zu27H85vKRj6oPXRkawQlMXXK82+agOwQYVnK1zppws
	Vr59Aw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghrua8frm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 08:49:03 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93903982af1so753732585a.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 01:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788770942; x=1789375742; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=d/0hMYtV0AUTvKgdIzntIko+FkAJyCqkPlgmbhqUNjk=;
        b=SYBjyyd6uDxJSnAhqs6V/mnMR0shsF7OTXxRZ+v/3H5R35zxjd8ItEjfCqz4bby5aA
         CgBzcymTxbJK34zLTh0JIYWSvIwGO/d/JxLClq4+S9BvmvUq47Qji23kUjumUO5+ioMZ
         ZuMBo51D+GMGl8kZFGG7+HcR2GaYAbEmwjSnt6IdOIftHog1KoHsOtTaRhWVVK4CL9VM
         +mFjaEbNKcHEfMxTvi05+sLL700XBS/BVQY0iR5S2k+ruUQbWi7fLJThXkb9SZLvVOkg
         0iuBraGKDhsqqLDjO4R0ZanG2YtelyfrH6RyOXGr1wsB2Qxg9KhiSMfFhJpulBverKjY
         DWCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788770942; x=1789375742;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d/0hMYtV0AUTvKgdIzntIko+FkAJyCqkPlgmbhqUNjk=;
        b=hyDJv7+WhSDn4Ts1dF5gWJhhZo+/SZ3+WKIQnHVeMV3RWZ2EAFL+uyuAc20KsFH5kb
         PQird+LdYYygQWp9XeupmYnjXfoOEePSW5zAKXEYh7BJlhwB7izA6DS3+6ZKLZiZ0JbB
         LpcIQAW5VFv+EgzkDjVwuYfCSS9o1LrulH+pbDMmf7FuQy5I3COqlmH6FtA+xXQDmZcJ
         UB/J9UqdxoqnJ8H1vEzTgtkq1WC2myY7s39jmoJP7AWFyHafYi2amVB2orq99QvxGIsg
         L1AkL8D6k5wqLtkJIVjJDrvVH0WlZkX7MmjoByIOesaiUjIgilgYbYEUvXvSiv7Ijypi
         9wAQ==
X-Forwarded-Encrypted: i=1; AKwUvBzk8DXpO+gAJbm5y2pDc5MGUH0A8t4hrCXoBq58Kz/T5auXpvaLmkscNXcnsA8R6xAU2eVonay7zEBBcQk=@vger.kernel.org
X-Gm-Message-State: AFuF++mpYTb3jYbvla7Bz+4uP2s2fURUuyDXh9eeHZN0qPqOq/6R8rxz
	NiQcneRk9geBW9nWCjuAu6Sh12nw2UsFDDKxKiXlCcmt0lVx+eFuohk+aExklJ1swr13xmA/4e3
	NBxMKDRUKAQ9mOVXpJ9uSyvHugJmk9m6vkuYlVJlGc125uvFKf0zwIVfx+92ssp2Ajis=
X-Gm-Gg: AYBFou2VgI73OdHNZYXRY4s/mBxG8Z2P3YtC4l+wZBTcTwnJx3frSu9y0h57SdxgZKw
	zJLW6wUK5axxmf96TbvYRJXsj9wKPgjpSqng45+TUWFiZFVtbOAsGu8lckfzVmBlrkL6RB7wq9U
	G5uPzwTwh94L+YI/CQgGiaEmoyLJJ/vwYUBxB5FEMktzCTzxGhJAueba4ANT2X/HN6A0mFHnhku
	r/Cmuj8FbGlV3kZsFHQ7UYznSxM00+/39tdTQ/qF6XEfu2fJkmAiVtAuejewRvGRgniuiYftmBb
	yXVj3Aq20M/Pb7TFjlO9MrZ4qrA1s7/bfAwtteQo24vX0MsRNoEXg8w3yDu84xEBRNhC4C0Qbn8
	Bf+LlWxVg6TOzYH+Ep8mxoAsVbw==
X-Received: by 2002:a05:620a:43a4:b0:939:6de9:4cf9 with SMTP id af79cd13be357-9398072e3ecmr38297685a.44.1788770942198;
        Mon, 07 Sep 2026 01:49:02 -0700 (PDT)
X-Received: by 2002:a05:620a:43a4:b0:939:6de9:4cf9 with SMTP id af79cd13be357-9398072e3ecmr38291785a.44.1788770941737;
        Mon, 07 Sep 2026 01:49:01 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:48dd:b57:9236:95f2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d07b371afsm191513345e9.9.2026.09.07.01.48.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 01:49:00 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Xilin Wu <sophon@radxa.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        Stephen Chen <stephen@radxa.com>, Junhao Xie <bigfoot@radxa.com>
Subject: Re: (subset) [PATCH 0/6] arm64: dts: qcom: Add support for Radxa Dragon Q8B
Date: Mon,  7 Sep 2026 10:48:58 +0200
Message-ID: <178877092324.9461.18090953151782895380.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260901-q8b-dts-v1-0-7de0b6a73d08@radxa.com>
References: <20260901-q8b-dts-v1-0-7de0b6a73d08@radxa.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: eeR7pwz88lPBWmJIOO5XA3KvEO1qmILG
X-Authority-Analysis: v=2.4 cv=U+aiy+ru c=1 sm=1 tr=0 ts=6a9e7a7f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=RT5i7AouTkpRziyCYWYA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: eeR7pwz88lPBWmJIOO5XA3KvEO1qmILG
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA5NSBTYWx0ZWRfX5pV6pn4sMiyS
 b87j8qxVDyWM40vZys6RTyFA2nKda70pIRfrDyYXBKqcEdHwOG7ofKZIq9ciQKnYossUev0VDCh
 p1aDvybhgEXy98UmAEAoZxGiluSfZsY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA5NSBTYWx0ZWRfX0JIFquGUa53W
 4JZkXZE64CodVIbXygKCT5D4XKHGrTTqn7B7+rmiu466pd4vZ/MyVjT3DRX8gJq0hr80LGeTpex
 fhYmQD5hpgItj5LlbAyfaFpR5PKoPKTJo0oe1yfhEHrAWx0WZoMlJbaRD8JOca2RzGkhAG718NB
 J1piQUPMrrucYzKgEjwVv56rSkgZoEvaUxQCXfzv5TBEyLN/ZRn2wbfTH3qmHaemGGmGUMLAQG6
 mNROicRqZ2MtBi9YjhU9Ozcp4IPN7tGT99pz88O1ALoCO+yVRuurXo+eQOW6JLpOufOkw2/Rrtv
 0WtpvIV5chx2qrTG6Xt/BjOJunpFjPH7rnn5vWjPGC8+miLgkwgKgV/bkpF8u8bHQYMv8bQRYqJ
 MHviSOcb3bHMmrBgZMbzuqzzVmQ+9WwFSARcFMrHrw3N1EjJ0n8mK4xNuxU047EZ9XyTZ5sBw2Z
 51NwFjFXHQe2X9DAWsw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070095


On Tue, 01 Sep 2026 16:47:53 +0800, Xilin Wu wrote:
> The Radxa Dragon Q8B is a single-board computer based on the Qualcomm
> Snapdragon 8cx Gen 3 (SC8280XP) platform.
> 
> The board provides UFS and microSD storage, two M.2 M-key slots, an M.2
> E-key slot, a QPS615/TC9563 PCIe switch, USB Type-C ports with DisplayPort
> alternate mode, USB Type-A ports, HDMI 2.1 output, headset audio and
> a 40-pin expansion header.
> 
> [...]

Applied, thanks!

[5/6] dt-bindings: pinctrl: qcom,sc8280xp-tlmm: allow gpio-line-names
      https://git.kernel.org/brgl/c/d4f74023be11eb9aea9a8c0b0582f20aa2c2640b

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
