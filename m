Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794606319;
	b=2bRIZc2xWZr9UVa6DUHSyB+Ed2faKT4SRsNPeMYpCcmOhVDCp6VriyFXUtgrtXDxPQpm
	 GpqcQ+i0A87D5EUr0ZU0Vkla39zw01gylaPh5Z7kNoR1peW9wVmaLZjA6YZ79zo7+I8lB
	 8uP6sUda/UKymAdiF52lwcSt5znnzbPBAvTfXFJCdOfVjRwomVGMQApoRkWgDlDYLTQ+X
	 fzn6h0jrADMPhC8qdZGv1VVjIZqVshp+SqDNjYXz1xALuAUCoGJ8I7uuFEb2q0/K6Vupi
	 n3sNRnYqCHXEJaoULX+0NfEPRHOet9v24lThojcVcLJGVIdmf4x7YNrURq5pWgpM4RA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794606319;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=n7PzzPHa/4mCBK10OYpFHdY2nQ0SUiiLZ/8MiqaUUMw=;
	b=VBvi+EPHq3mp/jhy/rbMS+z+Hj8uladhdIJY2fJ/6jIJn4NU7pdQrTb10Y8+t6bRLjuw
	 QGWGA/4A450DisTXprm2J6OxJYBa+XHMMa8m+1gdt/qEpXxNAvOy6yohuF0hJRx/T5XA+
	 WkiE9rSPQiI12Q+5V2gzjHpBHONc7X1PfXR61EVoET4nBxldIUj8wGrFceKBmoTKgjAZv
	 C6pok9RuRIjGso5dEkqd3ABMOp15syIP3AmG5flMCJrpUX437Gj5KC2e4EEE2Q9P7khOZ
	 42SezKbnoV9nAssOFoHEp9WuTNRmMLBeuOkZ6ByWJ79t4PA+f3KmtuxLgGDYdYIldNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X2kmQ9jA;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D804E606A880
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 21:45:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D804E606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X2kmQ9jA
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so24076715e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:45:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794606317; x=1795211117; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=n7PzzPHa/4mCBK10OYpFHdY2nQ0SUiiLZ/8MiqaUUMw=;
        b=X2kmQ9jAZauNlJWXZXIdL+UMkH2O8fV3yqTUNDTPDhKVBRW0TF6c4k1+ZQocEwvhdH
         Jrf+A/+QlSk5RuBXHyEm+zSGeP96jNBIfB7PmBzJ/7qgPiW6sWmK0fjDqV3qoEPbRWyZ
         vGlV3gyAwFMLminwBDLQbbPj+6eH5nn+rsYAu3FfVavkPK9u3XXqNItOCt2WrEPF/Toa
         hsVEM4cgbhjcbiBO+Yg3Orp+faF++rAoMORfiAI49C8d9QgQ7Sd9BdcXQLIT6WTf03kN
         v230k1OGSQCXq+4lnUUfLGh7eDR+wJsdH4bt6jDAyD2kFm2NnswR2hhHELywQsqKfNk9
         ywJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794606317; x=1795211117;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n7PzzPHa/4mCBK10OYpFHdY2nQ0SUiiLZ/8MiqaUUMw=;
        b=JKXn8oWguH8ermMoepNVYW7HMtph1Q5pcqT+FnjPfYM8cmm10jTa67fJTOCv+yTv/P
         46dN92l1d9SD7PP2+mbxZneVqotAYJgr7HCRg2+e1NYErvdUdHzTyPE6q+yDdqzghkm2
         6/l2LuQvNBIpNWuZ9lS1qsh0NOP+Q7fzG+wddNSXmO6COJ72+7ln8uP/A4+dQXDVPaBg
         3PxeoQQZP9QqG/E9ldCNe2v7y2rmiu/jxMrr4mJoU0OcaZWqC1gs0mjyGCXRBAPUWchB
         T9FQiaQyDTwic2jCOPAzM3xQBclF/pgpBwpQcl8NyosO1Hk5iHFbIqOO5VH4vEnpjz90
         rcng==
X-Forwarded-Encrypted: i=1; AL+hErGsOibfWDdu+r4Ku85rHDrK+iE8euZTzKfcnze56Xq0R7NqBjn6MeqV6V2GCQTXIuhvtcdnNMqoKnYOiRw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+rP+/7uFV7Y6Haag2zwbH35EQ+mryuLb04XWvC5NAtchiDG19l
	HZHy9wFl51+V/bj9QxSb451CyBoXV+HXlKF/fkiZwMHlGjl54hl/9xRX
X-Gm-Gg: AYBFou0zhi3uNEZSQz/EKpw5KZ8Upn+4jI2pF1pld+78C0xleyvU9LOi1ldoVYKTcsJ
	kx6bOnqAOw82w/cUZJJyZgBh5OwMSFzAwQJhXdYeoeEtihgHstsHweeIozYiWYEV/3Wt5BMLWYq
	cNpdbMBGFCNQG8Xy/a+rsZjvzc5tViklQCnqbV2nDbe5Wd5j8q2LqXN6osaBa+JewfLWRJgDlOl
	BjEAK9KRx+AKcNMbZn/kXm6NMniEp3M3B5uvycMkL4txaOl0Wm2gE1J0ObxP7h13M4HWs9sSWK0
	8+3AprKK3MtSKH9FSW3f0ogaQLzpqtOHdlAYDifxI+G9r2a1PhScwUhH2lo7trc8CpcA57Co8Cb
	o4M4GV+F9jUL0BupPxxpBrXNcatlKd2A3OhQqUXcBxSOJDpKbi8ZXGFhpwAYZpJ342EadZYC6di
	czn9roC3J08UYQVLVEubHOF0xBZ/MNM+wkm/cl67dRjovgXRJthlli56ik6EDjIRjal/1L56OHI
	11eKsKzuio2gh8RJnhd9rjeBXbcT+z5rDrIU0Y/3xcW+4bvG5bK2NuCZ4QnNL9s+YC5iuWKXxxd
	o1vhmdTIkkK8sRrHX85FOG/3rt8B9Kot3vnmjUd5KNOnFBjbfg==
X-Received: by 2002:a05:600c:1daa:b0:4a1:d087:f6ab with SMTP id 5b1f17b1804b1-4bb55a4ea8emr79392275e9.18.1794606317190;
        Fri, 13 Nov 2026 13:45:17 -0800 (PST)
Received: from vivobook-s16.fritz.box ([2a02:908:e843:f280:6cae:291b:a1:8362])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55acdccfsm96131245e9.8.2026.11.13.13.45.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 13:45:16 -0800 (PST)
From: "Ingo A. Kubbilun" <ingo.kubbilun@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Ingo A. Kubbilun" <ingo.kubbilun@gmail.com>
Subject: [PATCH] firmware: qcom: scm: allow QSEECOM on ASUS Vivobook S16 S3607QA
Date: Fri, 13 Nov 2026 22:45:04 +0100
Message-ID: <20261113214514.229363-1-ingo.kubbilun@gmail.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enables the uefisecapp client (EFI variables, efibootmgr, RTC offset).

Developed with the help of an AI coding assistant (Anthropic Claude),
which drafted the changes from the Windows ACPI tables, existing device
trees and test logs; reviewed, built and tested on the device by the
submitter.

Signed-off-by: Ingo A. Kubbilun <ingo.kubbilun@gmail.com>
---
 drivers/firmware/qcom/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 030e4ba90812..8dd0d38291b4 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2228,6 +2228,7 @@ static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "acer,swift-go-sfa14-11" },
 	{ .compatible = "asus,vivobook-s15" },
 	{ .compatible = "asus,vivobook-s15-x1p4" },
+	{ .compatible = "asus,vivobook-s16-s3607qa" },
 	{ .compatible = "asus,zenbook-a14-ux3407na" },
 	{ .compatible = "asus,zenbook-a14-ux3407qa" },
 	{ .compatible = "asus,zenbook-a14-ux3407ra" },
-- 
2.47.3

