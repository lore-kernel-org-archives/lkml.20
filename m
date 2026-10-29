Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793267742;
	b=pHhlCmuYv1f/MrvtWqsLysPq6fhATMCNYCQzEG8OndtHf+54dh6tM7s8QIbNmWRU4J9A
	 1mjEKBqsYp1F44GA+81khgLwyHmvqmJTknD1+NEYve0HlzjKzfUufCSdHY6b9qFs4STUu
	 Am+jumh0/pdHaXOEYSgBCFjL1LrX17CF9GLUaY2DeWyTqY7UfRuXsDzHZDqbqOM3WOaW0
	 QVTwizLexGlFB/lslPa2hgxVugW+dWUbOgc8ABbjZrj0f0udWpwfO3jpfyZqcqANIWrZ6
	 dbrNF3g3rnWBsDxS//CdSfzqRT+nrIwm28I5GtgxToedDRnLK4LpylL6OGDXJqhRU9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793267742;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=ksP9i61srkHlhtbK1i5oAkg99zATJN9LSQpqwUBBB14=;
	b=Cf44QumpX4oxbT/pCCEwEkvdNvGAZAaEKAvWMHxRxwNEpW08dFhPawZrJGiD5ikX8B2e
	 pX5n3s54TjOaXabUJncRxdTeXvke1DZujytAot4Y8yCe0NUwOIarGrr5aQNC40K4dy4wb
	 QaJtvLwJgry7BBONQgo6DcYHlRyabJjdVpsW7tHHuAY0UqPvf0XIkcIotXtm50znVK3Ou
	 LrY7C2lvveezO+2GZg5DXmI2BlaGbM/JHDHR2xN+xopLkGbNOH1OgExvKvlcoST0bf+3h
	 TaSI30rWZv4MrbPQ0MNfylPZ0u+qhHnQwBbmVX0Eox2MSTyLtcks53vbMQnnNnq6VeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=hPfZ71sm;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 348DE606A563
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:55:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 348DE606A563
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=hPfZ71sm
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so18851805e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 02:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793267741; x=1793872541; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ksP9i61srkHlhtbK1i5oAkg99zATJN9LSQpqwUBBB14=;
        b=hPfZ71smleHC7ixkE0H1t29RlmtXn7P8xlxHqenZ9fIrbH3AbG5dHXyU2JxcoO0Oif
         Fy/f1ZTLT/VZ2ccZrDESu+qRRzefayd4AVoa/Oa0IvH+t911sH355K/2wPOwlzGHBkb0
         hVzpjUjuNBHWkU4xO1TnMrAzvM/3OVKJOEK5+K0yP2mFs6gXwNP6RqleujHa+NEG0H8+
         ODxz8S5ZOflqXD57oqCsCgwr7DhDIaNouKCD4C5Mxw8ZBG06U16+ViP0nUW5lozMmiUQ
         RWDUXLumZNZEI5Z0Cs7mmnMUH5K5VrLzfYl/yKJ5dfc+jbqJauSN7+VYUZAfERieyh9H
         ymvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793267741; x=1793872541;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ksP9i61srkHlhtbK1i5oAkg99zATJN9LSQpqwUBBB14=;
        b=vDGEgV2zz+yDHNMSiz6LgsYYHjnDWjwjXSOqlTTMEUThfDXx1djXYe8b0XWETDlix2
         l1u7kFyWLEutN65oPUhbLeEhXb3osWU7krLAz9MicR+FcV0ROgpT5hYZ4C0/rmoWvqRK
         CMyBvG6EloUx2OkJn0L+shK3K1kOCT1xN7XOGdxAg5NuiyLX5Kxa0e6is1QPSG990uwL
         oXbSCSx7Sjuu5wJM3eUUQX6oPl1lxbafFT3bqYibErnYmfLQY9EMkqN9HJ3Nyy++4TZs
         BcKOGZSd8n6jI41yBLkiAd2nGgZeXzp5LdkCfRHc+BttO17zf/KrYfmrtZuJIJF518b6
         AdAA==
X-Forwarded-Encrypted: i=1; AKwUvBx90Qhu/FsEev2DbEbynxcqavtuICH4I4Aox6bH9pp1/5Ca+vwNss9CRRPE1Uj+7R4EiQNWmu9zhWYawNE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLUV4eh7nD5TfkgJV9rtC90ZqyqMjBA+i5OoQhD9Ey7uxtFOCZy
	zymiWE/+5A1c3vV1YmFAhoLNllG7NZ9X1JHZc8cyrv+DBzlzCF3vfdrhRQILAfo8Y7U=
X-Gm-Gg: AYBFou34N7SnRLIWqHVQ2fxz3VeFz3B5NqYH9BWSf27OUpJartupUSwaFNiy+QYKY5Q
	pA0RW0hd5nQxPkpttmOv2ifjAoiBEw02JEscEAW4mX8ZIZZ3EgesFy3rcpbm1RDQM4jJ4V33+sh
	pI659ZSo+0W40L4iofWLL6au31FgI8vbAeJ9ds3EX8mcQLHwHX4ia7lkZm/Ep8e8Ys+DHN9fMs/
	po+xvuhExOcOu04MTcbZK5423GxPYcE/diKcxseV3MtGkjjaKtX9kM0t3pc7cGrgk87e3HDTv0n
	+gNaRphwWGTa/YW6jMSS6cstJqJkQwwrQhahyXZaXEBRV6oK3/CCAYHm3mBlEonSNHqbEk8x8+B
	Psu0deIskgjUk2hflZjyby9F6WL5l2BNlwN2KIwx7759cs6wXaXdfJavbZ2+cCEQy/0yCbWOknn
	KMKHfrR63xkq8sGkkqGbSm8wC0dbxEfHdQ32SUTXySHNTijHzRg0sHAh9opztDd2Byl/fWS61cr
	p4RJAO6ePpRDwknbOvnmmGrwxqQs/MWEEixx4AY7WrYnPie1nV3z76ptpI3bbI+uBqxI6dsPg8U
	qiWzLlgH6muXFKm40dptrzHpz08zjyo0zauH74f1
X-Received: by 2002:a05:600c:b99:b0:4a1:f7f4:7ced with SMTP id 5b1f17b1804b1-4a966c41a43mr108339155e9.17.1793267740589;
        Thu, 29 Oct 2026 02:55:40 -0700 (PDT)
Received: from [127.0.0.1] ([64.43.45.156])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd37f4sm40437160f8f.44.2026.10.29.02.55.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 02:55:40 -0700 (PDT)
From: bryan.odonoghue@linaro.org
X-Google-Original-From: bod@kernel.org
Date: Thu, 29 Oct 2026 09:55:23 +0000
Subject: [PATCH 14/14] media: qcom: camss: Switch on frame_sync_en for
 sdm845
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
Message-Id: <20261029-v4l2-frame-sync-v1-14-d37992559c58@kernel.org>
References: <20261029-v4l2-frame-sync-v1-0-d37992559c58@kernel.org>
In-Reply-To: <20261029-v4l2-frame-sync-v1-0-d37992559c58@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1340; i=bod@kernel.org;
 h=from:subject:message-id; bh=rn7FeESqvi7fxDDcMAXb76UUN7ncMp5AipCFIA8OzZA=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBq4xgOsU7P33pfDuiglt/mOZbjSaxKzTw0yyMIN
 3yzylVbQ4KJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCauMYDgAKCRAicTuzoY3I
 Op7+D/9G5VlAqgH5yWbH10CQ0UsZrG2n74y7nJO0H+CO/pUhxXEn4nQaPEhkp9wOk7In0PfBcpC
 J9ZGvXi96jWE334KQOjsJXn4qLLcYqTpmD+psXAOkJIfxRGQGJ6XmMK5IIainddY94nPyLP0CwG
 78byyJ9ckTLa+LOnw5a372FqoM5i7J1Ex+MUf7K24U6mL1NQtOwHayACpYkog2lOjVMnljAqP+S
 i2JfDZZ7CxG58UKpbiR04YZrEoWxahAAAfKk36+0V5AeYemfeTV0TQ5HNdyNvbv0OqFrWRH5cj4
 I4qS8+kX04t6bjAZGl4StmnHbCZLJyflxAxcFX9MWX2n+5r44yeYrCdvL9ksNBQ9iX9LI/PK1Vl
 +yNDTPvQqvuV6tu9FNXoAy1uVMqzE+uLIv2UW5pPM7jLQF2v/l5MCXj8zOGI2iFcgxVDHi7qr/E
 cn8S+AJN1fL+gR2VrAi/rqAFvtjbdGVbzlYeyxrmb2Xw42vZCULv9jjB2FXCs2fQvFRIxrOV+b3
 SD/I4eJ4mksd9hY2pStzFugVoXMOZX2v7UVRrg9hUoYEhYKQDmtVlFanT0dOoBhBYW/g++7LFjl
 uGTvdWK6dqwbKuHV+ek+egmT/PzR878UBOtkUOubU7qZRlLaf4dQBr+25f2FfbLP+T/dtjTUNOl
 sgPpnxZE7AQ8/Sw==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Switch frame_sync_en to true to track and consume SOF/EOF data.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 23f0b63580bae..1e470d7583743 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -1361,6 +1361,7 @@ static const struct camss_subdev_resources csid_res_845[] = {
 		.reg = { "csid0" },
 		.interrupt = { "csid0" },
 		.csid = {
+			.frame_sync_en = 1,
 			.hw_ops = &csid_ops_gen2,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.formats = &csid_formats_gen2
@@ -1389,6 +1390,7 @@ static const struct camss_subdev_resources csid_res_845[] = {
 		.reg = { "csid1" },
 		.interrupt = { "csid1" },
 		.csid = {
+			.frame_sync_en = 1,
 			.hw_ops = &csid_ops_gen2,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.formats = &csid_formats_gen2
@@ -1418,6 +1420,7 @@ static const struct camss_subdev_resources csid_res_845[] = {
 		.interrupt = { "csid2" },
 		.csid = {
 			.is_lite = true,
+			.frame_sync_en = 1,
 			.hw_ops = &csid_ops_gen2,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.formats = &csid_formats_gen2

-- 
2.56.0

