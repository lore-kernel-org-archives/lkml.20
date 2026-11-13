Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794549401;
	b=m5bUoigH6SCyE7YVkCnXezLD9Euclsa7STsD9XEBJ4r2+sltEFsb5Gn3HWEzKPxfb2ic
	 2SbijgD7Mome9O1twz9XfsysnfGJ90jh4U0W0wtoogBKuVtzjFy7iWxY95/xPpmR8UsDs
	 nbk0i/a0o9AA4Z9E8tFtZAg9qMrARe9K73Xc21ITuOKiuDad676oMh+rzK08oWtFg53Bk
	 KeJ4No2vsRlOn5HVhhry/5zu94sBASRmQ5xtC5e2e0V660VgXuQcHfzULW9jir9yiOTZo
	 LTJ6hUU6qrnmtdgZ+IpxuuzQfLQqB1xcsEi4CkK4oCEUGuDA55Ppr3vp/EQLladDoQQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794549401;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=CyYKJ2XHN0ueROsD0D37/Kxc+UdXNCVk/iQdBfNPhlw=;
	b=GYOazHKtriiS52T+z0rQI6TJnlvl3q/anaJvixN9q3L/lR15UnaB15dEM0myt3n37eZU
	 2Lh+OqBembkXhnjZ7oxjmdYPvq1y/BML2SV7g3NHIFoAbBwyCdttYEd3Q6HaWN958OObe
	 /KO49WmA4rdIlFQqPmDVSfU/dr3t14YEcld9OesuSLc/EyiHOmZo4Eu2JmzTLF0/xWM9E
	 adckhIRq0+ovIBxRX9hXN7hoqQKg+J/Wd41ABrH30qgK4EaJ4HrmD+PgDyqWdNM/D7vDW
	 o99eOWn0tUxiLIvJFl0S3910uRxVy/uderIPW6UJA0V1fT9dsDQW4TB7GH17rLoHaoA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ExsJ8bGE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DDA6606A330;
	Fri, 13 Nov 2026 05:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ExsJ8bGE
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794549401;
	b=jtOaF+kD/9zy5soAL/aDdBYDvVhNDiUIq6mo3AZuzYgmga70eKqLe7ieh69D2kcwWDUR
	 LXvoykP2cAHhV2XS8EYpA9g3ajzXdQeMyFl24hyF3TcYXMCD3PpxzqJJfdmW+A9M2tmSH
	 2FQm/d31k8Bb7Zsrb8BdqMrHTXlt8XoLRQRq+2hxt68MxR5MOvsQYmQPlFyTduQfKd9gO
	 eR26um3pQt4rSAwEte4TWFfn2NihiDWuTc3QsUo4FNrlkFu608BgC6cB9ZC3I/TolMkzp
	 pCPXlEYcSKhg/1EmF9pQfQkv1WF62boe0kfRG2gmVBbI9AKzFLOJgC2ultw8AtRZw8A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794549401;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=CyYKJ2XHN0ueROsD0D37/Kxc+UdXNCVk/iQdBfNPhlw=;
	b=Ya/JRpJ4iFSJ6EGlAnPwJyE9ROUmaFpYNfB7rkcldYc3+OJTUtrXGUXEoz77ghDrLmJh
	 XIgvpN/4YKGP4/s2d5V4ZJFfzp889tokpFIC/8Z/x3Ss9UjibNj/pE041AkJfdv3HT/q5
	 Kb/UuapGZmkpXaPRSJX8lAjXejrNIS99kMh5vqCVi4orGzjHyZL0g0DdffCsToHDyUmqk
	 X68hPj346YreJAOBM9Kue2ETYnKZqGKrQyi0tn8RQwCtxHpTcolycYGHwPOSXgbXP/11n
	 JxLCXigBAgHcJ4U6FawQbLZtR4bbGwPA845/7UjXK3VJbADkynEyCtE7O/YTN5vJDaw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 16D8D1F000C6;
	Fri, 13 Nov 2026 05:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794549401;
	bh=CyYKJ2XHN0ueROsD0D37/Kxc+UdXNCVk/iQdBfNPhlw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=ExsJ8bGEuE0fOPN7Z1gtV4Em1L9cG55je6op+acuOTDt+RsJ7avhqhY8kCoZeRb1G
	 R9srCujnrALwpsP1RbZzn1hZTrMq7oN2i24vRN8ncqvfkcuGBOV9lV6DkB7bK27DSG
	 LA0EmdFCpA6VJagAjAjnT/GbtSW7QrN+kzvwlVIw12016SQKBX7+N8di0YHKbc4coB
	 OHQR3QAai8p0oMvtVTuz7KFAudzQbNNrAm75z3CGGQEvUawq9mdH+mEfQLK4LzVMZp
	 zvmzXko7z4JshWHtMQV52tRoLF0QAroa2KV1cDwqDtKDBrGuZwFYYSuezSvFJMJyKl
	 11IKxWLQ//MHw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id D46384761A;
	Fri, 13 Nov 2026 05:56:37 +0000 (UTC)
From: Ishu Brar via B4 Relay <devnull+patches.brar.si@kernel.org>
Date: Fri, 13 Nov 2026 11:26:39 +0530
Subject: [PATCH v3 6/6] drm/msm: mdss: Add SM7250 support
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
Message-Id: <20261113-dpu-sm7250-v3-6-30bdec59d204@brar.si>
References: <20261113-dpu-sm7250-v3-0-30bdec59d204@brar.si>
In-Reply-To: <20261113-dpu-sm7250-v3-0-30bdec59d204@brar.si>
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, Ishu Brar <patches@brar.si>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794549395; l=935;
 i=patches@brar.si; h=from:subject:message-id;
 bh=cuDZuz9tdcvui7XRO0ZIEMGONp1eurphXY1/XMpNa0g=;
 b=muggCIjN8bodXEgemPdTxGK2G/6jAMX88u65805W6Xm9DYqpCJIR7aKU6IdH3xCc/NNd1ERi/
 mzviZBk2Fe/Asqr8RyPIa19HLkUaxjtyKJ+zlzYixKHdrIK/BSHeM2B
X-Developer-Key: i=patches@brar.si; a=ed25519;
 pk=Ds+E23E3ntzjPzuBDyVRkOouclcNI5k75R+N42yJtCk=
X-Endpoint-Received: by B4 Relay for patches@brar.si/default with
 auth_id=1189
X-Original-From: Ishu Brar <patches@brar.si>
Reply-To: patches@brar.si
Content-Transfer-Encoding: 7bit

From: Ishu Brar <patches@brar.si>

Add support for MDSS on SM7250.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Ishu Brar <patches@brar.si>
---
 drivers/gpu/drm/msm/msm_mdss.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index e69b122f2687..f619052bbb46 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -562,6 +562,7 @@ static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,sm6350-mdss", .data = &data_76k8 },
 	{ .compatible = "qcom,sm6375-mdss", .data = &data_76k8 },
 	{ .compatible = "qcom,sm7150-mdss", .data = &data_76k8 },
+	{ .compatible = "qcom,sm7250-mdss", .data = &data_76k8 },
 	{ .compatible = "qcom,sm8150-mdss", .data = &data_76k8 },
 	{ .compatible = "qcom,sm8250-mdss", .data = &data_76k8 },
 	{ .compatible = "qcom,sm8350-mdss", .data = &data_74k },

-- 
2.56.1


