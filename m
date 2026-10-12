Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC59D3164BB
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791810205; cv=none; b=cKIMly0a2lmpmnC2LXtW8whNGg7gFzt4mPpQwWYXwPEcEzHzKrRNt7naY/e74FCQPf50e68dc00V0rvohEDTBuUsiAP93u+X39xmiJhUrw7vNZrBKfQltA44OIwS3gbpq9Gzurm8AUBG4waMTQ2TsUcMAVVzPdzdmt46DnD29aE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791810205; c=relaxed/simple;
	bh=JspSAmg2h5s7/0NVQMAr3BatjKhkiwjv9OkJ2Opmc0A=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=rHweVnVe+bvXTLMSO5hkU+nX7Bd/MPwnezPtFsfXOCn0fRcdyAS0smgQdhIQi+kB5Vxjo50DVOTG51kE7Ez8jGmcIYOWs/CvYJ3xfceLA09zRuGuOyAQ0GtGQaK9DPXunQA/XQiGTAk9xxE7x8Eaix/07YqloKoCgxCALGVsvxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com; spf=pass smtp.mailfrom=imd-tec.com; dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b=UOoBGhzr; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b="UOoBGhzr"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48afe75f055so1745063f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 06:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=imd-tec.com; s=google; t=1791810201; x=1792415001; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=AYpBwd7jtueYD/5N70HOFcX5OQ+BSChXVXn/2tIlCDg=;
        b=UOoBGhzrGEw+HGMlx7IVUpVUgc6bCcBcbBTvnjFs5bsnFlmWxp135zoU9ec5H5RZ3E
         JeqJmDJVbIoj3hOkIo3a7Nw2KxdaEIVXYRKO3AWwjKkgxHecxe8fhrJmloZYa9/B8oT0
         YqFJ6rGp2XLbmfLoq0cSJULmvuYmPEwjqc4AF3CnSrzLmglJJKnIM2Spt4vTNvZi56eH
         8iQ/ETQlVN7cVbAsZZEyiE4TxabozgFxYJJaFSLm8jEhVQ7z0QQKuvT1vzcZyTOkX1nR
         7rwYpHJUaKn8V3o19LTo9s/0vX+tfdMvfWrjKl0ZoP2K4TW+OYEsqEsXa0yp43e4ov2N
         BAcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791810201; x=1792415001;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AYpBwd7jtueYD/5N70HOFcX5OQ+BSChXVXn/2tIlCDg=;
        b=IBvdoa1lmP55HL0RiXM5wNo0t1Uasvj1pGB7Wvu4r6CK325bwj3JEbTvb42bJ9T8wh
         V7WQuBZcXUT/1NXaYEHu8NS3sUUSf33o1B8I3ilOpXH67H6crKsf/+oQHptJwJlX/h3J
         vJu4lYQ7aLZNEZOPhAiSB0McUpoC0coZ69Q/L6YBuXeROAkzJxakITb0yd6XxBywsxu6
         pUBBfNeQMZ2j4BHeFgpkZ882t6VHphEkdy623RWCxjbKwiPMU3XxqbDJf9EntsfytEDk
         Vspng4Iiv9p8Sj2zJOo8MfJsRtDlXItWoOjpIF8yj+Jy5lQXv4n/S+ZAG2TcSwE39Yoo
         B8vw==
X-Forwarded-Encrypted: i=1; AKwUvBw3O7HNHB9uXDB0lby2Lq7NtFxXFM2o8GfYev4saakJrIrawZpuqq0GpK0jdAJ+YKNPckxjlmC30gIy0xk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJiYgOQl0YAe+mP2pyYxhBD6Kj5gMt5GsqN2141HkvA/wCw5CeI
	pkO61DHkwCgsqMvxRt0BGgC5wA39fk71EtZ6sbIQHkjqlIljk4rv4zeKY4GAcOIoNi8=
X-Gm-Gg: AYBFou0umvasucUkZzW+nppS0OnbRCOgHck1lS1Cmg2YBMRZuBoBwzF/9IvbcqYwIwu
	zNlBd4zjPHDI6GYKRZVhexAZQvdPZksj/W4O0Dd+CbVCap6rdWiizfrBkIwvq/FQlbglfaUAip6
	EDld9vwwBy8D6p657eP7iItAum+5DMre24E1qxCSvJsf4lw0TyfSOqZvQPyAdqi7AXgPeoI9N8X
	+vbbK/mytUQNpK90UhilSeL66sJsg6M6Z6G3edECn6AFjFrm0BbjBUoAcxoJxas5ycxBwiiJ9G+
	m9vEfWOXG4bY8hlZ2pA1W74zo8jRUvx6ZOSa3SKHwNtQaTjJqH06qhWcWm+x7kUulV0wAsqumOY
	6lFRGO4pG3zhrIaZjNyfyOdzKtp+Qom1E9/eVVwJKDFVUy48lsVn+wlC0QVB63ClMbglmKo8WI5
	ke8AMFtGJrmrxA1qXcz6yqsfCuRuROE7yocsF/pJyotwIqT47u/ns2nVNcYFcF4st5SigEMK3Ke
	TZB/ciQjeDxsEBiDf/p9i1heibICaUGWykUKj5qTXL6MKOSj2hYR/N4tjVlq8G/0Pxx/AXYFvok
	soW2KJmlpvE/EamEsDuOww==
X-Received: by 2002:a05:600c:8b09:b0:4a1:6f78:842f with SMTP id 5b1f17b1804b1-4a18e4987b8mr186087765e9.11.1791810200910;
        Mon, 12 Oct 2026 06:03:20 -0700 (PDT)
Received: from [127.0.1.1] ([82.71.135.85])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9abdaa5sm20088782f8f.35.2026.10.12.06.03.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 06:03:20 -0700 (PDT)
From: William Bright <william.bright@imd-tec.com>
Subject: [PATCH 0/3] media: qcom: camss: Add the SM8550 CSI TPGs
Date: Mon, 12 Oct 2026 14:03:02 +0100
Message-Id: <20261012-sm8550-camss-tpg-v1-0-620ab6f151dd@imd-tec.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIbazGoC/yXMQQ7CIBBA0as0s3YSQCHiVUwXLYx1TIoN05omh
 LsXdfkW/xcQykwCt65Apg8Lv1ODPnUQnkOaCDk2g1HGaaUNyny1VmEYZhFclwndGJX3+nI2wUP
 LlkwP3n/Le/+3bOOLwvr9QK0HidmYMnQAAAA=
X-Change-ID: 20261012-sm8550-camss-tpg-6bd0991432c9
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Depeng Shao <quic_depengs@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 William Bright <william.bright@imd-tec.com>
X-Mailer: b4 0.15.2

SM8550 has three CSI test pattern generators next to the CSIPHYs. They
report hardware version 2.1.0, the same as the x1e80100 TPGs, so the
existing gen1 TPG ops drive them unchanged.

Describe their register regions in the binding and in sm8550.dtsi and
add them to the SM8550 camss resources.

Signed-off-by: William Bright <william.bright@imd-tec.com>
---
William Bright (3):
      dt-bindings: media: qcom,sm8550-camss: Add the CSI TPG regions
      media: qcom: camss: Add the SM8550 CSI TPGs
      arm64: dts: qcom: sm8550: Add the CSI TPG regions to camss

 .../bindings/media/qcom,sm8550-camss.yaml          |  7 ++-
 arch/arm64/boot/dts/qcom/sm8550.dtsi               | 10 ++++-
 drivers/media/platform/qcom/camss/camss.c          | 50 ++++++++++++++++++++++
 3 files changed, 64 insertions(+), 3 deletions(-)
---
base-commit: ba86f67908354f41f269ca1d64b22e4624766dcf
change-id: 20261012-sm8550-camss-tpg-6bd0991432c9

Best regards,
--  
William Bright <william.bright@imd-tec.com>

