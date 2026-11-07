Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794013329;
	b=bebuyXZ/bUCcel8lTTo6d6U2ouoGLiPQ3/MSMX2nOCRD7zdz2HLAjolGb24pgqTlw5ua
	 myDcf4k6oAQ7dmoc8Rdnh4LyALCiN2ZKefC+5nm7KCeOyoYgeZj/Xw2+YZ5us0RKYH2kx
	 zi225zM3OEH7pp8Cn+rb6pXr0qkXgerW0jrZv4KRXdUsxwqyn3BlbKFOnnxI+7o19wvnR
	 4fcechGIR0bE2i00nOXPulR0aIm/U5MXNeDd3wsdtgMFhUnhisLtyYjUAJGuwFou1DLMu
	 ZYTwzC+2VQsS7TyvymvSJ+cUxId8lawLd1UiQ074C5xKXnJkiTmngr9E3DQV16Mqfkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794013329;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=pk/3CWE6bTvPjpMU+QpkcG//CRX9jmwJSAKem9wEU1k=;
	b=HpI4uDdhX9B1LIYn9djk2HQC5uyx4KMhf9/17do9+8LIzyoOAzE5EnhOcsUVrHrF9HXs
	 kZegSxALJ914Krq5QA1IgMcXExhBKYSP0FBBIn521ZAHgQAJl1f705la0K/LGP37M1xdn
	 KjvBryRBJKzn9sBzN93eBqs3CBSScAhKo9SxY41P5uTAMKILzvxlOogfVundfRaefUNI7
	 x+eWgs0A2J67iRhTsauUXTMFuXDFOHJoMo+CyLDq+PtptxvOi0aIzBcZkzyhP2G+T+wZi
	 QijHjjMflhzl81w143EdxBoROAsFBt8nZq5eK9Lfks9nnb3HUjD4+MHNEW4FAEjbISQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=aBLroX92;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E6D2606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 01:02:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E6D2606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=aBLroX92
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so12561095e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 17:02:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794013327; x=1794618127; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pk/3CWE6bTvPjpMU+QpkcG//CRX9jmwJSAKem9wEU1k=;
        b=aBLroX92b9BDgcFjWegdtcTzS42C0OXf4qOg5GrKNk22oKZqSbJaQdJpI7kzMqTDkT
         RpYAhuPEKz+e4yMuUrUXCpo/EJ+S5lpkaE2VfNFqg5H79Ahn++cGrDTGrPcV9tK79o8i
         HcYUFvAmAHS6oeKxe8pHXL/OWnb/BH66mdgU6pqlTIUjnK6NDKWPgzxNFDeOcRquof/9
         Udi3m3nqiene0NwZE0Tx/cKS+ZSDfVaaVtJ9JgYTOn+e3Tn7rBmpgCn5QLSK4CYql/p3
         7JVO2hKMbYsBoobS8T6BgOBgn04FeTAd8dh8XATGQWi8voG6DDe2vACmn/emUpk1IBSE
         dlig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794013327; x=1794618127;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pk/3CWE6bTvPjpMU+QpkcG//CRX9jmwJSAKem9wEU1k=;
        b=JCnG4mRVuLwnJHguRie4PqghvzV82mXF1hbJTZuZKFIhfVa1zWU8cRwhmoA9I/g4pi
         1uDRJnuvh9LikJsivUgHG4c03xis70oQNyA/RrNbzaVvSlzgi++sRvlQ2jwX/rKgX5+T
         gtjevJ7Eh1X4J11oZBwO3qRfjKDa5sMfCo2vLW0s8P2sVhsJO24W3qVrpUcwo64vuRSR
         j08ITM+nQxedQURx0ny2qkRfGc569cAxz16xlcJTlWXS994vxn5ns+b3gmxGTPN/Xj6G
         z7nwbJIBY2kDSmK0CPbuQM85S3UsONqfU4dFPVgSaKghBm9ALoLjURPLGMW7iccrenAK
         7+fw==
X-Forwarded-Encrypted: i=1; AKwUvBwPybIxOIYz9DONfQFsXHCc3VFSlEkVCAk4ziWfuBXPRlSkYAVUXytxfXQN9t14J0wHxzEqd8TpYCIXg1I=@vger.kernel.org
X-Gm-Message-State: APuU4Z8YcFMeAVSx98IjGh5CAwF3zXK/6NZhEBpffOkyoC8WLxsYVj3l
	QNbh7Gs81olAUWdykVOdbpppDfYpXMPOAhKrtwQU7JRR+WIR9MBxkaBYpXmCexsVCsQ=
X-Gm-Gg: AYBFou14a0gQ6WXvyPKv4Rt75ujubjFl7NJLUIT7bpaa2TQYxmom9THXFvXJ5SHf0oi
	3/sCFTYNgkvJgxA3M9KsMhSYCrqBTc6UZPrHGPQB1gQf64YoMzk44susf/RdOSIJMgXu29z/lFy
	tVHXOtkg+0PQk2PaP4pfuFA23e55VXuR0m5BVlCa4zedrgzU2kiU9vm/F3MbuPmkf0zSvHos4bv
	AHA7R1F3c5FjDMk95Ikk2sd7JO14Qp1bqDGVJ61WfNt0vOKJRdncRPM5fbetgIGUKeVttM6vUGQ
	vtRCvT05RBNxSs4vA3NHXSquZ76EJfuQ88SW5iEGGWsKEHzh7Ap4mq7v9jYsdp9Vt7Dn/o129Up
	4tE6F5lj1HGWt2/cfpI5N2sQX+B6uDswECw2cID2gQwuf8NZxzvRYLWGNX48KkymQ6ZHqcURbag
	FoNnfVXrhumtOYHKL2iuxA0RkquzAVIZzKBcJN5KlTiRsh3NIC/ZH8D7AminYN6zya1yZhyiTwA
	fETnPCqP7rqEkw4bPbWjLIThDsm5G69+j24bfd3tiBFRMuTPmeYd2uCbCP7iKI2Ssldj2njB28s
	9zj2Z0IIf4pJufnKhb3nkQ==
X-Received: by 2002:a05:600c:1d1d:b0:4a2:1612:637a with SMTP id 5b1f17b1804b1-4b6df4f28bdmr70945495e9.16.1794013326583;
        Fri, 06 Nov 2026 17:02:06 -0800 (PST)
Received: from [127.0.0.1] ([109.77.115.215])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e3291531sm24526375e9.15.2026.11.06.17.02.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 17:02:06 -0800 (PST)
From: bryan.odonoghue@linaro.org
X-Google-Original-From: bod@kernel.org
Date: Sat, 07 Nov 2026 01:01:54 +0000
Subject: [PATCH v3 11/11] media: qcom: camss: Switch on frame_sync_en for
 csid-340
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261107-v4l2-frame-sync-v3-11-e5bf7073a35d@kernel.org>
References: <20261107-v4l2-frame-sync-v3-0-e5bf7073a35d@kernel.org>
In-Reply-To: <20261107-v4l2-frame-sync-v3-0-e5bf7073a35d@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1104; i=bod@kernel.org;
 h=from:subject:message-id; bh=UApk8Y4wLDTQJN9GGeqd/uvucLZuS+qiJSOYGDtTUSY=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBq7niAk1vUQmBpHBSKgslQK/sbDuautKhYABgRd
 Uhz3oS3Ec6JAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCau54gAAKCRAicTuzoY3I
 OlHaEACL7gyTPuBMwmeVHIim2sX9bwmUoOLTEi8ZAAgv5tPUHIBq0Vzu3VIZFRP1b5WhCr602fD
 F9OJAabkJuIONJ/Elaz0EKpVDVg3/uXjKEFAswmqOduZLD0kSPjelyg02Botl5TX3n0vctzbDfG
 RADgTEVulwl9741DBzAt3AAvQurzMPNcla6a1nQ1fyUOpGzPCLtRpNXPKQxL6gVrTU+XvOOfQD9
 yw3mrbRHAPt/4Cc24hH+HsjztEb2bQSmHi0ghWRpzd76dp+sdff1Wc/QECB6eE1LmQlV+ERs46a
 ov6whPcH8jSnqM76aX6ebOyQ9Uwjuozl99f2ycDx7+kmHJmN4POxe41JIPCvvWttq/s7XP/Ufqu
 tkTbWWl+Fx3drqpowiWbWYGoyYW9o07t2xE4zVEPBx9OJVt59o7IPMl1tvDGhdhIb5wrojOLKCh
 8MG8iPf9cp2q+IfrWUMMdBBfxLhJ8sIpU4Boq7QN0q4i3FdEYKaBA3Ft3pTp7fMabREXlb/wMiw
 uCl9BPhx7pd5En9jKTtv+egr9/Lyns46HWmbkYGF4XswDkDztdgks0lrous+1ZDvZX9TpAHI43e
 Crjg9oiSgb3aLDTh9nV4XtcYMLuZTkTBYzFOnDSuDbuXwxnx8bYw6ciSVt6HBkXpzPgEh7v5OTS
 Ffl40+5PbZwDLKg==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

From: Loic Poulain <loic.poulain@oss.qualcomm.com>

Switch frame_sync_en to true to track and consume SOF/EOF data.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
---
 drivers/media/platform/qcom/camss/camss.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index bfff28e789b04..ac12960264adf 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -733,6 +733,7 @@ static const struct camss_subdev_resources csid_res_2290[] = {
 		.reg = { "csid0" },
 		.interrupt = { "csid0" },
 		.csid = {
+			.frame_sync_en = true,
 			.hw_ops = &csid_ops_340,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.formats = &csid_formats_gen2
@@ -749,6 +750,7 @@ static const struct camss_subdev_resources csid_res_2290[] = {
 		.reg = { "csid1" },
 		.interrupt = { "csid1" },
 		.csid = {
+			.frame_sync_en = true,
 			.hw_ops = &csid_ops_340,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.formats = &csid_formats_gen2

-- 
2.56.0

