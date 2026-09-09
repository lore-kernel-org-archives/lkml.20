Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29321558212
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 13:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788959265; cv=none; b=uinvwdX3FbEpew1e6p1hJFDrQ2FSAJN/gUm4PfLExIt+xbvTzPwda2U2lYlj3l2InUbdcmBkEQlQpJOTLmfAAwqjzdgzpn97pcL0ZkuRCWRfsR/HIxiZCbq7kAnObWWGgJBhXN76FSfWsYQbSN5QztlOvuVa60kOylS+DBXb9Ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788959265; c=relaxed/simple;
	bh=Dt6TXHaOCAqPRIHyG23gzZbwlkqfyVrlSnZmGK9PNhA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=o4FsISVmENgYF+nf8WKjHBusrNl3/0WJsztScHbCW6kr+peGBjDlLGjunfPn8mHlJw84Fb7Ix3vC8UYItlz6AFRKiwhAou7yWJsg6oC4Vo1YtD0fD4bJ8nL4LWON7cdH7QirMafCCfMhce5mY1efNmBnpx3r/ADKhCTwx6MnOWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TWrUGtu5; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TWrUGtu5"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6356f6bso175324f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 06:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788959261; x=1789564061; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=cIISFENV2r2XCrde4HSTQaSrbuJgpNySLxzv3eVQ07w=;
        b=TWrUGtu5vERs/PWeAD+trv6uWQIcHKHMgr7okwkhlqHmTUuK/YYaFmQ6jyKyw10dmh
         s/2ZEcWSRSzQlz0dw5ygAI2x39Hgayp3jnhgv22bbfj9ye7q2hJu8Cy80tQCGs0A2psz
         lVvVmgjvtl8kl9MBp/vpUULLc6WZL2WGaJFDUQDhc+iKnz0m3VPUKB4XDMnBrx+y2QKV
         b650lZezTwM+k4m8SasESY2OSvsjY42K5surMCKoPCkwiFtU5Tn+vWB1bsmYnmDLqWv+
         S5VtyZ+U4R2jagH/FrIICOaqibrLK/F7m1vmMcAvlf098sfvd9hCcpPHU5S9sOr/Rw+d
         5+Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788959261; x=1789564061;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cIISFENV2r2XCrde4HSTQaSrbuJgpNySLxzv3eVQ07w=;
        b=J/+cpJWKoigBw9lP4g+I4g3igIv5WiATDolwK9yuKsZJbgYba9M8yoZfDRWYVI9Nr1
         TRp9OPCUrPAopG9eYXZzYVktNnvLmNjumzhAH4jM1mnuZOaIifrM69PZzz2wNLwDYWZP
         VYm1HMOe24Xhad3blDoYM4VurbBZDotfUPaYd0UWJopLZTwAXpXtf5jcUyhqm3scjPSV
         RY5B3w+EG31fDOymRXaBmmjiIfSObGSzLiCHSzgR4FCRgHqbtUR2COrNSufFtc0Zkh7k
         XQNGh34w7D5xTN2/4vt5NE/UVS8sPzV5GDKuf5YD8KUs5wKUQrG4oKEbM+ulDRbKCXzJ
         5fEw==
X-Forwarded-Encrypted: i=1; AKwUvBzvmZrTqA0ElSAvn7NPzl/mt15BezXKgjkUi5KFiuIRB9y2eeTf90jlmm/WakMQX223e8QmMll6TNJluJQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nBPeJm60r3daHQXTKgpPBGJSjAczbzWcNrMTr/mkH3CSiE+R10
	J1jum/kO56Kk/fDPhvkK8wMsXkQNdjIsVvqWjbYLIEjG5GKLFaU1O4ZgahoEZkJueDQ=
X-Gm-Gg: AYBFou0XuPPNiEv4JI1MtIarZsrPwJ4Z1NJI5L8wPN8GptjlL2yxglvLHZnH+SBFNCQ
	bJ/VTEy7KK1lrRM/sYHu6YRR5bVHPdVR5fdE4AqbtbFoD2+EjuUefMeeFplYw1Vl3HQlRpMQ0mO
	QaBagAmLSIz7gcvR1H/2KhzsdTxK1KafGvMAz7TJkCtSg9DeSfxhUxW4C8y+KhHw3sfkbXq90XQ
	7VnVVjtOUTlGVqYohYig1F0oep5j33dSSrK77wA64g2IyffgaGMeCxlNF4ED3r3/9b2vmyMW0d6
	7W+zBY7vhLGCgdWOpdTvEAd8ENeEQSzmJRKypmDp4xGHETIKgBK6Lko+cbUNS4by4N9wsdFFK8R
	ArYTuhZEYkcUb7Nat0XX7TTeK4w6nGmwacsfcV3eTTDam894TJXdZHggoW03FmqH7jP92gSb5LE
	00V82CvIF9MNRlpgncFOXUNMQjPYjhDecV1wwYJvOf8FHk5vN+5TlsCKdBr7pfqHKO4sXxcxWhr
	L9M9BWcQ7F5QvUViLE=
X-Received: by 2002:a05:6000:22c5:b0:485:847f:fd9b with SMTP id ffacd0b85a97d-485ba5ac3f3mr2264895f8f.6.1788959260993;
        Wed, 09 Sep 2026 06:07:40 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883927a3sm34031175f8f.11.2026.09.09.06.07.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 06:07:40 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v2 0/2] drm/msm/a6xx: use correct timestamp counter on A750
 GPU
Date: Wed, 09 Sep 2026 15:07:36 +0200
Message-Id: <20260909-topic-sm8650-gmu-a750-timestamp-reg-v2-0-091d74958951@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABhaoWoC/5WOQQ6DIBREr2JY9zdIKmBXvUfjAvUXf1PEAJo2x
 rsX7Qm6m5dM3szKIgbCyK7FygIuFMmPGcSpYN1gRotAfWYmuJC85hqSn6iD6LSsOFg3g1E5JHI
 Yk3ETBLQgUFWqQilU3bNsmgI+6H2s3Jsfx7l9Ypd29d4YKCYfPseNpdx7/y0uJXAQ+qI17yVK3
 d5eNJrgzz5Y1mzb9gX/6Bpn6QAAAA==
X-Change-ID: 20260908-topic-sm8650-gmu-a750-timestamp-reg-2e7575e6279d
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Akhil P Oommen <akhilpo@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1242;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=Dt6TXHaOCAqPRIHyG23gzZbwlkqfyVrlSnZmGK9PNhA=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqoVoaUYOK5cYji+iRpHkEtlj5XxUOkOjIna0kvFWK
 Fty7pB+JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaqFaGgAKCRB33NvayMhJ0aDjD/
 9LVjaYE13VUpqoz9aDR9mXIVZ1leeGD7ajm7mmps4uVyy+4P/L+NVuxJVVWAyFViTwQqenY/+Kjw4y
 Bci+MTG1qOeEsv0XSLGVk7lE9GVehq5IBJWbreqMrMdj7uKpR7B8hoR7H5FpxBF1qM1Dqu6/CT+wLy
 jMDC6kqUALrYUBkemzPBVR7f7tRR1O8uXbrbSmjsUY/rBqx90JBU7BbDUnlIGMzLPF8Gw2d0uasZQr
 XfckT6BvCz9riotZ7MwEhVomAXbou2F42rUXwX1p47NZOLP4IT+/+L9ua1c+lnG6vXxPCWh0Qzjgj3
 IEHjpDzLMoIMr6KLqqutoWE7YgcgxXs5Rget635Hj8n6dHlMHyhbKrH1tQ6HdDc84KBbBnwFJ4Xzr4
 03UZbp/wpS5PFLxY4CihyypfI1VMuoTqrCsKK+8dFrE+KEPjwARZ8M5lYejrn3rI+Yo/cYoRnYh/su
 +jNlsD14SeRGBQfzL7AbCU7Bn22t00dSBLzykGA228FBG3ACi5U5oUIACgCDqMs1EkeFQ6mByQ6uYd
 GPfvJFqGiGpIVMTQ3VQ/Hebr6jDEeYFAo5q1IzRp1Y3yIManq0LkqIDpxevdKk8Y7dINwrxPLSVhLW
 wx7i3b5Jq8BTcBRIzGXGKnRIyyENhUkSNKI26vBWcWqlLiVjENDKoUYHmcyQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The A750 uses a different counter register as used on the downstream
driver:

static u64 gen7_9_0_read_alwayson(struct adreno_device *adreno_dev)
{
...
	/* Always use the GMU AO counter when doing a AHB read */
	gmu_core_regread(device, GEN7_GMU_CX_AO_COUNTER_HI, &hi);
	gmu_core_regread(device, GEN7_GMU_CX_AO_COUNTER_LO, &lo);
...
}

gen7_reg.h:#define GEN7_GMU_CX_AO_COUNTER_LO		0x1f880
gen7_reg.h:#define GEN7_GMU_CX_AO_COUNTER_HI		0x1f881

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v2:
- Fix swapped H/L registers in XML
- Link to v1: https://patch.msgid.link/20260908-topic-sm8650-gmu-a750-timestamp-reg-v1-0-284880d6e68b@linaro.org

---
Neil Armstrong (2):
      drm/msm/a6xx: Add CX AO Counter registers used for a750 GPUs
      drm/msm/a6xx: Use CX AO Counter register for timestamp on a750 GPUs

 drivers/gpu/drm/msm/adreno/a6xx_gpu.c             | 12 +++++++++---
 drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml |  2 ++
 2 files changed, 11 insertions(+), 3 deletions(-)
---
base-commit: df2908090cda368b01ff43709f51890076c56157
change-id: 20260908-topic-sm8650-gmu-a750-timestamp-reg-2e7575e6279d

Best regards,
--  
Neil Armstrong <neil.armstrong@linaro.org>

