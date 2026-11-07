Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794013326;
	b=4nPPIwUiv3HuoxMcdmqamhYXzEw3gMnZ+sS+7358bcxmWa1UmDWRXsZUy3C21y87bJZn
	 sgndexgv3Xm7jhpw3vbGr0gkEKerqJBNevNdqYcvVfgFnF2fdk/gFUeuhAazpPyozqLK5
	 q+4I+qUhm9j4VaCCNwCZ0xEoMDysaxIZjP+uwrUJ4k+6NzPW2NaUvwcK2RiVlhgDA6stC
	 sU2i5Ph8HQaFU69pb4Nkjqlna35QXzRGV48hEzxbuvFCJgZJe+4OpalAvGi4Ao3Va8IxC
	 e+ldhLpVkhvNhNCJWiICTiN5s466V1b67Hd+s2h+zcJLoupNe6ook3sgTpS2PXzm8nA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794013326;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=WVOppmOPF0oNPzwcOcitqSAGp8bpqXEMygjr0XfAqEE=;
	b=oEdQ6jgP24l1a9Kysuroc+11+vMS+vxQbazp0NkvoCCeCRH3rXp6iZR7H1eHgPgb0pth
	 P/NAASQTk0WhXksuC8cDKfYLHNKm2lkv+P5Cg0SVE8apyLcJkEYIJ/JWudWsz8mTf584l
	 D6TRgDKDr4JGB1H4TmEMJ/O0JDHkWue0BrcWwS4Cqj13eOxj0K1IdxoFK3Td8DLtvJ720
	 JRkV0raBYsdCC5421iqKnGn3LA5A4v3VfBRXuTCyOGxgPDIpah+46zIHmfTwOLT4N+q81
	 0GaIRC50an7vQv5jlKqiMFKAMnfBY2fsQRQGG2d5zcfGX3xGjj/EoJ9kXfvSR+2iJAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=HUJAVbfA;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C9D5606EEBF
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 01:02:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C9D5606EEBF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=HUJAVbfA
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so10030565e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 17:02:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794013325; x=1794618125; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WVOppmOPF0oNPzwcOcitqSAGp8bpqXEMygjr0XfAqEE=;
        b=HUJAVbfAXgHnnfOkKEqfhXt7eOqE/3lxwihUWmgBgG+QO2xO3Fb3L00X3zIy6iGr+P
         fBCcYkwhfRxizQUPDVM+v1TTjarkWPtRoA/uHniB3oRuhcJ9Z2G+TpoZGSh2DdWscIqI
         O1Kwa9W32sC/mcHITA3jTUcie3AShYLY3WraKRGogb3b4TCpUcC0tgr2wGn9WgoRifDH
         gKPJ1hTfx5JNYDX+deZEp98DZCbWHVoEbV7/AH5pVGydvQmMpp4Jcp5F47TVhNuIvxtX
         SuwCc4RML2+idWggnNsHCt30mCgj9p9Pq5gHb7+ycKJGAVxsYcJsrny5qNbM2wDa1Ajk
         IJ2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794013325; x=1794618125;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WVOppmOPF0oNPzwcOcitqSAGp8bpqXEMygjr0XfAqEE=;
        b=QWc1/+kApjt1fAThT5+duWANVqQyYS+dfCYKVWTu2iIKcHeoQxjiVCUKiEqB+HQOQ7
         XT0upC8cDLv4BbFO/AMRbf/htpbRYgJ5n2jwS6yO59JpUHB/xjSH0dynyzKTVkiJc8XD
         IolcxijZvuW1rnGhmG9Oovjipj5rbBylHCbUX8mZjfQLEltDNQYiVxIIEAoeEJWcckHs
         RRu6bSfId2XtwCil+4kxWcrcB8yAMXONwoIXp+G4Hhib0IT0+W/i+pCMABY85oe3sufu
         DuB7YpJts6qbYmMbyaCqyGvtpt4c/ucs2g0nUTquFfqV/yt56kAfCJXN+oFGeGYJV2pn
         hWAg==
X-Forwarded-Encrypted: i=1; AKwUvBwdzx4f7RfXI7ypdRfg4emGAsbNRU5CGpXP6wuHA6N9AFfm73jtKBaEJXB4sH3sBUkyeQT+xXjL9S1yMc0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/a3NqqCJtNuA4vh9CarlYCH1rUaj/uZgReexrw56UZMurwk5Du
	EpP8M+8VJyr/9eIdYFJA59NEMz/wq0wkwBedCiEvmzF67UdPmVwcbK83zFu3cuLzl6s=
X-Gm-Gg: AYBFou0xZHZhlAI1h8oVXxaz5bu/HU4pGCjc4WucADl4j0hM140+lYUd+JEDLfR3SI1
	8SHm/VaDNqAOJtrGXBLN0bDc5q6R7PeqHWsJRiKNTrzzjhnZRvQNNsit28mbszHkQwEHiy/ilON
	wPrUVHeTPGJhFpMhOvfxzroSxq41E9hDpqbbCSc9oKNOFPdEJj9SE8zyZPoyAoczqM/+E3sm7MC
	Gv8Sx1iViRHhvP2G698jhd1ov+qCuHNVFmd7Heek84hhvOdPWZ0sCR/uvKe8vYU3+PbjxMt+x/M
	gvqfzjOrsOqWvlq/AgVn7vTHStgQ9y/R42uhRpwDClaB4Pw4jlNySfkmSsCQeqVJlvnW2szWUAw
	hJHCSsDinkI20FaU6bKWaKNKt9UrhaQJTV7UO37G//pH9GckzP4fs0TG3AFKp2xQ+FhdqbtrY7X
	NDd6Ueej7ZbM9qeJiYac0rPw3+A9lRvd3RidpYIYALH9o2eJhn/sHq+YHwjyDH5hekSh1IWiGJ1
	F6pcNJwh+p66sThHQ48gRJla4kmHWs5E7+853T+DsQkrxfOhcpcwgTpn11s9Yucz1Iw7BLYQFyu
	Ok3VESX9b+ATiEOr9JVPIg==
X-Received: by 2002:a05:600c:4f0f:b0:4a2:e0c:2b0a with SMTP id 5b1f17b1804b1-4b6df5ea98dmr73002115e9.16.1794013324705;
        Fri, 06 Nov 2026 17:02:04 -0800 (PST)
Received: from [127.0.0.1] ([109.77.115.215])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e3291531sm24526375e9.15.2026.11.06.17.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 17:02:04 -0800 (PST)
From: bryan.odonoghue@linaro.org
X-Google-Original-From: bod@kernel.org
Date: Sat, 07 Nov 2026 01:01:52 +0000
Subject: [PATCH v3 09/11] media: qcom: camss: Switch on frame_sync_en for
 x1e/x2e
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
Message-Id: <20261107-v4l2-frame-sync-v3-9-e5bf7073a35d@kernel.org>
References: <20261107-v4l2-frame-sync-v3-0-e5bf7073a35d@kernel.org>
In-Reply-To: <20261107-v4l2-frame-sync-v3-0-e5bf7073a35d@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2079; i=bod@kernel.org;
 h=from:subject:message-id; bh=DXNUQKSL1UUmzc8AGuykclATY5iBLPt7wD2yXM5hnAA=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBq7nh/S6VmlcFdfBkMCXtHjo8D/B2ArAk4K59QI
 gk6UhV8bjSJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCau54fwAKCRAicTuzoY3I
 OugeD/9kSVCLRPiCuIo3sJuPXfxeAcvqE3cKWqAtbtXSS//SuZxbzlayEcM8SyieSQQuy0s0LhX
 QeiczEXKS2yYZ0aHWWrI2YUUU5Y8YWnO8hj1ySrt3rPVuMEWfPZLciXJlaGSugbvBpizLjBpzI2
 WTwoQc0oP4xqjN1/9PF1L+0yjd70ZU5+uMxGSOq3RNlunM4OBWZsMJYdShPYAEVIYJykvyQpTXK
 LpXUV1okjlx/hYeLvV5Jh5TygtS0hxfqaeTfr3ugGiWJ3+FsSBD/XAdJrh4ljg5OhGgErigTQBQ
 LZypl/zdYwJavXdaE6M1btwe4qb2YFY/za8jsL3R7Gqg9EmDMvo+DaBnSLr4n6oC93gCerOqx4F
 R41eYxhqhD0uSNmsv9SUp62BVUrXlk6m5hxq0GxtSBW/0zTDkyS5QyV37VxoWcFKXt7xL3sYXlN
 rA6wWWb/n0PGh/5j1YhLPiKWSaDn5nWswURE09oxWDkY5/dznljUomrjjK+Tocjj8zP6KcecRjN
 9OOrmM2U/eJx1xyfBgjZlHW1hDqrYLyDYS9Al+rb2e73p1yPejvsSTgDctRe0KwSINZ3h+1WizM
 MMXkXQvTnsiZ29xKkg7ExaJEph8gZilOPe6Rmmh+NbwXm0neu0TRAoFM/45S4axaeEZAF6c5DdY
 bAmUweoGQRMjvOg==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Switch frame_sync_en to true to track and consume SOF/EOF data.

Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # x1e CRD
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
---
 drivers/media/platform/qcom/camss/camss.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index b7821019241d7..7911b30494ac9 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4255,6 +4255,7 @@ static const struct camss_subdev_resources csid_res_x1e80100[] = {
 		.reg = { "csid0" },
 		.interrupt = { "csid0" },
 		.csid = {
+			.frame_sync_en = true,
 			.hw_ops = &csid_ops_680,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.formats = &csid_formats_gen2
@@ -4275,6 +4276,7 @@ static const struct camss_subdev_resources csid_res_x1e80100[] = {
 		.reg = { "csid1" },
 		.interrupt = { "csid1" },
 		.csid = {
+			.frame_sync_en = true,
 			.hw_ops = &csid_ops_680,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.formats = &csid_formats_gen2
@@ -4295,6 +4297,7 @@ static const struct camss_subdev_resources csid_res_x1e80100[] = {
 		.reg = { "csid2" },
 		.interrupt = { "csid2" },
 		.csid = {
+			.frame_sync_en = true,
 			.hw_ops = &csid_ops_680,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.formats = &csid_formats_gen2
@@ -4316,6 +4319,7 @@ static const struct camss_subdev_resources csid_res_x1e80100[] = {
 		.interrupt = { "csid_lite0" },
 		.csid = {
 			.is_lite = true,
+			.frame_sync_en = true,
 			.hw_ops = &csid_ops_680,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.formats = &csid_formats_gen2
@@ -4338,6 +4342,7 @@ static const struct camss_subdev_resources csid_res_x1e80100[] = {
 		.interrupt = { "csid_lite1" },
 		.csid = {
 			.is_lite = true,
+			.frame_sync_en = true,
 			.hw_ops = &csid_ops_680,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.formats = &csid_formats_gen2

-- 
2.56.0

