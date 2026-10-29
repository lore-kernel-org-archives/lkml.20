Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793267741;
	b=xPcaJS1nizoImFBxEpHjG9eeUF9P0wTZ0MHq6Cwv3JlvxQ7p8uhToGDbkniUd2P6ZdRa
	 St/pSHyNFDKbzwJYHLWW8JgekZ0c9YqOzEB9AO5Sq0uOfCwHFutnkR2+8pp5NVOHaoBrC
	 /IMhORheAGYpvgdQ/CpbXYzP85Mkgf7djWRvpdvrtJC6PQWfM5176VBngLX1VNSlfxFk2
	 1ZP6Dl+43O+Byw41OJcyIZ0OuZhxCHLl3NtEyas4Emd4KZVPGZpMFcxVvaIAnBkTXvybb
	 aiJjSXNQfHS873OHPWCY0ETJ6xWXlzwbSGm8jSYmG+25Gz3e1p+5zsh1ONkJRmxHhmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793267741;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=d1bOiDkiB2DSSslkZg+fkJGrdVPxshsLRrleDenduHI=;
	b=SsOEMmjLw3PkGnpWE5Mj0R00IBuK7IAu6GDAwQcG+CZpR8RqzcHwO/f+uj2r4h5ZA7eY
	 34+KL1rowlPEII8FsBtU/B/FiVaRurKYYkjrYdxelrXdK3xU4HJKjFp2uWgoJoeIZhuMY
	 z7gUm/69JQLB1WO67Y800J9iJDHlBPhpzdWCaRG0aizzUH5/eyUqso5c8+zZi/HeE+dFC
	 AR80oDZBC1gXaFh7KFHdZbG4SYLXHFUbFuHjUD/Ww8UU3AKDfKktNzWmW5DepJnfRXika
	 JIjhxqGe0qkJ3h6fPa1/rrPvjX5z6glstIU72QGFxN+XP3+0rUc0M0sVZuRlRmVuwqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=DnRP4j+H;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F14560A6F5E
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:55:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F14560A6F5E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=DnRP4j+H
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48e0d1da913so350877f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 02:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793267739; x=1793872539; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d1bOiDkiB2DSSslkZg+fkJGrdVPxshsLRrleDenduHI=;
        b=DnRP4j+HyEUtKO5AZ4keU0FixH0F07kyXOEOODaR89xyGnIhgguXdPCBsxZ8iQSbBe
         IdKUluLh6ska5E671cZaPoq+0wsg8nyx5WN87ffNjmSUyWipkk+q3Qp75SxHoIHMzY6w
         bI1+1p0eoYaJSgaALwIxQzt/ca8THzb+drFlqiIPs7SMBjeuY+C3wJoyaZ8gdAL4fhTG
         5U/5lr0bNwLNoCqhFcc06bSzTJvF1RrootoJ7lRXG3sp04CH1koWR9omvD+KFp9GcLeM
         Sb2nyWxGjHtf64/aZq5SOivSPqiMJOk4KKIeJutY3ikBEzAzrIb3Yz0p9+SL8ZaRa8lN
         f7ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793267739; x=1793872539;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d1bOiDkiB2DSSslkZg+fkJGrdVPxshsLRrleDenduHI=;
        b=kcQUGphw3o37FSWzGfEaDyEnX285WU+Z0Y2n/xuthYHIcYzPMQqiHG3N+FpfTqj/rp
         gQwCjm9RWNCjK0tB8UP5kPnlp9xq5vVL9XwBqiJyVu7ICxoPkcGlXhh+5HYrqRQ6Xhai
         cCqM9eJKSeVvNtsUnEgxtky4H/dGnx6BjqJ3dKiJBUoyYbJPAaIQMmu5S1/LQCKwMNQ7
         n6qNYK0GAJ00sycTYSq/EaAWXQGC/bA8uaFM9u35EbwMKAJGdXisXYKmZ5fWUngIpFes
         OmWQ1CeYHmWs8nCJ7W6mKOsmm0bqzYFuT2l06kVfTakbKzGmORZwjSeqaiEsxQ16Ttcx
         R1eA==
X-Forwarded-Encrypted: i=1; AKwUvByDhCI7Dgao5eBmDOiCFQKaJ2fS4iCDJt7fCZHxy0/YIiwaygHNlqyzpagEsTtWXQC3s/P5Lpczz1TmPrA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIHAFlz8F/TX8Vj6/0ExmKrzPCUGy9e0F5wu3l3nRF0oGL5OgQi
	QIEGSinKvm7BGDo/v0Jtu0GLqc6zkKcTLi1dcUGvV4syl1ObCAz42bSmsfKG8oIa/EFBCjmVjlj
	PiH05
X-Gm-Gg: AYBFou2BTR+vTkPca+dKskO72k2ZgtbDX+HT2NV3tmcX9lyJo6db8H3h7XiLYyrXo8A
	9aqdxq5IcpZBbc99374X25MHeS5noW8APgnrM3vNmejMKtAzduSaW9plz80dPFg1EuB5feyK410
	cQhiRYZnkKPiyHFezEZ5kekGb1O3Bt6aoRCOoMIDnZNutBuOLWWrj6uVAbcBCAMn8erTid1o7P4
	em0VRhUmQ8rk3jD4rViOoexOJtjs02EkXU/TKsEsWSDMce02Qnxgd2+7mfTr9iHi+FUOSNP97PZ
	erueydhVjTASoOA3+FbilgkRRDdHQ6j7pZoOlTEJeKY1u01VRkLElp5Fc9OcsYPMIuTa+FpYJ6b
	j1UXeJNgKO7iExu0yMhODA9Jpr5DeFQkeWwQEIzfVDYwLoJ0RJHqobRRko/C1L2GVuQyb+3P6Z1
	3NyldXf4YVPjb76YiMx1lvbFtj1vxqbMmq4WRYNXpC/RuW2rbs1BQGK09D3yMmGmZGF7gQCXrTy
	hBapjyDZlycWdTnlnDDS9Mw3iZcLPBr2+GczEAOXiKlP9A8IEm3T9SnMv2dq4IdTpvPtHwoSvTb
	skvib1eVrsDdE4eAxeg=
X-Received: by 2002:a05:6000:40ca:b0:48d:efcb:1fea with SMTP id ffacd0b85a97d-48e646ec3b9mr5879841f8f.0.1793267738881;
        Thu, 29 Oct 2026 02:55:38 -0700 (PDT)
Received: from [127.0.0.1] ([64.43.45.156])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd37f4sm40437160f8f.44.2026.10.29.02.55.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 02:55:38 -0700 (PDT)
From: bryan.odonoghue@linaro.org
X-Google-Original-From: bod@kernel.org
Date: Thu, 29 Oct 2026 09:55:21 +0000
Subject: [PATCH 12/14] media: qcom: camss: Switch on frame_sync_en for
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
Message-Id: <20261029-v4l2-frame-sync-v1-12-d37992559c58@kernel.org>
References: <20261029-v4l2-frame-sync-v1-0-d37992559c58@kernel.org>
In-Reply-To: <20261029-v4l2-frame-sync-v1-0-d37992559c58@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2029; i=bod@kernel.org;
 h=from:subject:message-id; bh=GES2SWHstugCKn14TXZwrUS3vqQM4tPb7r96zzm0ljI=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBq4xgOn51RotNBvvnCb+jCOML5Ct1M07I5f+OzN
 3/akZ8OPy2JAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCauMYDgAKCRAicTuzoY3I
 OmIOD/4sO+FesZitO9eQxEbojP7JV5nH3B+7YJHiWQIYAX+hVBj6Mx6NZUWF+QMs6QObwt44T5p
 GVcyt9ekPHhC6ly0WtxFCyX2tU3RM0sPLYYOP6nibb5v4P4cFcOxbeIa61A11bXOhvNfZQyf/fa
 ESF1vCHEACnId3xQ9gzYyBtGv9t95hKpiL+iTYC2t52E57WSc+6YKr2Efyi6ouzYlRAqhPn20RX
 H6mRNChGTd5QWVgcCyY7apsZ6Nszet2/NfbkOa8GjmL3i94qoFW0tdwDzvPNw45gcOBbbGsJBIX
 +fXwL/hlfXv0Ya7vz7cEPxYOSsd1Y9pjrqTSRdYouck44sYbPFcN53DBaRuEXKT8muvagwM0IjL
 AfrJ7PJQOhAY658xPW4lof8COp+v92CbjxVz62+XkSQVY2XmRjLnsYWqUl6eaVU9ruBoxn63NGM
 UXqaXQsuMlGtSAuya0+S71sxjx2NYBsDwt1flCu4IIqcIPsABRF8TLdJRn2UGy4qWecVfQXO7s9
 mFRXod3AOkwFdsTntz1O4k9DEtj5W4ERQg5aK7nNjoaQYAOdLdDjTHSbpM9lDu0mJkIpJL5W3VQ
 jCFeKMp31+pmXga6OxiK7J11epx5mZ3puho4PJQJfOg0vtMIhnIMSErLRmTrXaOoIb8KKA/GbO3
 vmFA6o5eCmyeBYg==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Switch frame_sync_en to true to track and consume SOF/EOF data.

Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # x1e CRD
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index cd5a297a26970..10bf91b467f66 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4243,6 +4243,7 @@ static const struct camss_subdev_resources csid_res_x1e80100[] = {
 		.reg = { "csid0" },
 		.interrupt = { "csid0" },
 		.csid = {
+			.frame_sync_en = true,
 			.hw_ops = &csid_ops_680,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.formats = &csid_formats_gen2
@@ -4263,6 +4264,7 @@ static const struct camss_subdev_resources csid_res_x1e80100[] = {
 		.reg = { "csid1" },
 		.interrupt = { "csid1" },
 		.csid = {
+			.frame_sync_en = true,
 			.hw_ops = &csid_ops_680,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.formats = &csid_formats_gen2
@@ -4283,6 +4285,7 @@ static const struct camss_subdev_resources csid_res_x1e80100[] = {
 		.reg = { "csid2" },
 		.interrupt = { "csid2" },
 		.csid = {
+			.frame_sync_en = true,
 			.hw_ops = &csid_ops_680,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.formats = &csid_formats_gen2
@@ -4304,6 +4307,7 @@ static const struct camss_subdev_resources csid_res_x1e80100[] = {
 		.interrupt = { "csid_lite0" },
 		.csid = {
 			.is_lite = true,
+			.frame_sync_en = true,
 			.hw_ops = &csid_ops_680,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.formats = &csid_formats_gen2
@@ -4326,6 +4330,7 @@ static const struct camss_subdev_resources csid_res_x1e80100[] = {
 		.interrupt = { "csid_lite1" },
 		.csid = {
 			.is_lite = true,
+			.frame_sync_en = true,
 			.hw_ops = &csid_ops_680,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.formats = &csid_formats_gen2

-- 
2.56.0

