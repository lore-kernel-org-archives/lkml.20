Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794774012;
	b=MhHeTt4kh3DvpGrRqbKpGob6oEgx8/1floZjw/KJqnbSgtECHni9utVil2kBT1ZOhLR6
	 g9fhIuB23n493j0qL7zMQYKecb7gYzvxR6gfumtL/V9nNLoLI7vITTjJO37Fcoye3eGvZ
	 1lgMABhDMjtOQkWaKqSKp1U/cRXHvgMJkU09o3faf9qPxN1il70/P1VyOKxALt14WfA+0
	 XjFF+JRlt3CHTjcVAsXwuV+5dEK2dy4/x4naGw6SBOmQdg0LkzE4PmL4sh3Ek5qc650sK
	 1sAY2dHXQw64rTUjTUZ65bX9c9b8dRJhJN/HcLDkTxYCtJU1V+rr7v65i+XBpoj/+LA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794774012;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=CaRibSDX967uA35L6kgScherbBSVBQv4m+BbaTToGZs=;
	b=CJwijhkoBgFXiyRkXZSIPDs+TjpBpoljUjyOfgruLraWY+JjB3ePcYnFAwT+j2bQ+kP/
	 +e1teyguL5mQa1h7IeqkBf3EuM34gMpSFoaY99qbpuIvRY2kLqBztT5Caq52C48a533N5
	 9PTLvyIQTUvvlEuzX/iLEqEcaTKf4nxyQRWwUzuxskH9wEsD8Dgim/vrxYaEVIMica/6W
	 Zi7HYPw8mSGzv/BKJ4V7KNC3Ez0ODKmsOJvAfTnKjWyyIg5i0zyd8vT/fVPKs6g2XurMw
	 d9tkOwySnXDDPsdZD3Wy+iTYn1TpiUjSLVAD5VNZRYgXNtENA0mfTtDqdfIU3YhzuUQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V20xGs3t;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E0DA606A89B;
	Sun, 15 Nov 2026 20:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V20xGs3t
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794774012;
	b=luYU1409QOJuxdd+c7IuhgxCPS69aEFrHtLirAH8HA+kTYQNIoCCQGgNCVVAjTGYufeh
	 bUZID7eNOEdTuyhqdqfUdksVLzDOrSKqFpgiNOclx2gtaKkfjHrjEe0SzuZOhEqn7Hp+b
	 MCQ6ZwOGKm6WS/3dF1yvF8e5zr3TK9/Y77fZXPx69015Pi1bjGZsPk9FsTqu5C0rrCoA3
	 0ePl1KOJgzE5buIcosI2C+QXlmlxf82nu/USDokIiJdCoiqmTMI1gDOjyUuSySQ7cWfq1
	 t1SMogcaayys+Xuazw9rGVkPwMnNcETgJYwf/WHw5b31kEev0cwSLI1cXexCS3wuLkQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794774012;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=CaRibSDX967uA35L6kgScherbBSVBQv4m+BbaTToGZs=;
	b=207Urwfmua7W49D64eG+Noxh5Saf479wR1LKXOvYgEaWAPb3nNmJlvF9LwLBeeFsYR0Z
	 e7P0BGum1SRbROZNe3fQJtFDHT+mfS9n+bDgrqeeleFtYH46ga2UAjymeHm1Ql8IwNn7C
	 My0bBYx+mBhY4JVfTQK3LfonDb3/3QUNNHT8MN1oehxNigIx7Bc6NST7EvLmV34Fpi5y+
	 fUxRXzLP9RdyZ3maUkaWHn+Nj7m2tItISzQSRaIw5UMrHythTDu02h6qAwP+VXnDv7Kf3
	 SpUHukEfReAn1HsWgi+v8/fo4UIr9kXiQmwHASDR3zsCuKB3oaSeLQ/3KAwdFZkw9Bw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CB52E1F000C5;
	Sun, 15 Nov 2026 20:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794774012;
	bh=CaRibSDX967uA35L6kgScherbBSVBQv4m+BbaTToGZs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=V20xGs3tGILqN6FgZS79zwSyzWBYxubvmlJh2DuvkUMdgB3j/09kgv+tZLUPpTBMx
	 crcHXeXT/CNpu6NCaQwNtc7E8C/yFtDtsdu1gxjAJtL7Az6MoUG2TQa/zWw5VDtxXU
	 NiN8KC5PODZ+IcItu621eB0rUjfGU2rZME2R/HrPyroalIdCtZ+86f+VjpweqpCX4i
	 sY04W0I3kg6zVXybKMi3E8TBV0VUXVFTE2ltgvb0Wz3RLssEYWQjYFQ0+oSK7bSIH/
	 RT10INUwU2CTOf/j5T+eO483jOgBSxVaBMRUKA41ce+BIMZQ5kRDKKGrBNal+BJkfe
	 MTzNMJoPxOqeQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 93FEE4A1B7;
	Sun, 15 Nov 2026 20:20:10 +0000 (UTC)
From: Venkat Yadlapati via B4 Relay <devnull+venkat.yadlapati.yahoo.com@kernel.org>
Date: Mon, 16 Nov 2026 01:50:13 +0530
Subject: [PATCH 05/11] soc: qcom: pd-mapper: Add support for Molokai
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
Message-Id: <20261116-molokai-soc-v1-5-3b2ee920fa3b@yahoo.com>
References: <20261116-molokai-soc-v1-0-3b2ee920fa3b@yahoo.com>
In-Reply-To: <20261116-molokai-soc-v1-0-3b2ee920fa3b@yahoo.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Venkat Yadlapati <venkat.yadlapati@yahoo.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794774008; l=997;
 i=venkat.yadlapati@yahoo.com; s=20261023; h=from:subject:message-id;
 bh=hqMYRxdsjsTVFj3g/jRWTO3ssdW/IgytRVVXNoGCxvs=;
 b=qcUcIMG+7BiSLU7JuKNCiO2op/CNmbo2wrh2I+Zo091NK7iZ6ltZdbaqA1eAb32JbXVtZpfcU
 apho4egfIx3B+qRD2bE/0Cq4bErVigRi8p8oTj9FdYt1/UaFm2VOebE
X-Developer-Key: i=venkat.yadlapati@yahoo.com; a=ed25519;
 pk=e8KStCtEMvUP1Se/riB/KVnDAQFEVR2Dw2PcuA8/eME=
X-Endpoint-Received: by B4 Relay for venkat.yadlapati@yahoo.com/20261023
 with auth_id=1303
X-Original-From: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
Reply-To: venkat.yadlapati@yahoo.com
Content-Transfer-Encoding: 7bit

From: Venkat Yadlapati <venkat.yadlapati@yahoo.com>

Molokai (SM8845) has the same remoteproc protection domains as Kaanapali.

An LLM was used to help write this commit message.

Signed-off-by: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
---
 drivers/soc/qcom/qcom_pd_mapper.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/qcom_pd_mapper.c b/drivers/soc/qcom/qcom_pd_mapper.c
index e38647f3d7fd..b7800d4f8370 100644
--- a/drivers/soc/qcom/qcom_pd_mapper.c
+++ b/drivers/soc/qcom/qcom_pd_mapper.c
@@ -634,6 +634,7 @@ static const struct of_device_id qcom_pdm_domains[] __maybe_unused = {
 	{ .compatible = "qcom,kaanapali", .data = kaanapali_domains, },
 	{ .compatible = "qcom,mahua", .data = glymur_domains, },
 	{ .compatible = "qcom,milos", .data = sm8550_domains, },
+	{ .compatible = "qcom,molokai", .data = kaanapali_domains, },
 	{ .compatible = "qcom,msm8226", .data = NULL, },
 	{ .compatible = "qcom,msm8909", .data = NULL, },
 	{ .compatible = "qcom,msm8916", .data = NULL, },

-- 
2.56.0


