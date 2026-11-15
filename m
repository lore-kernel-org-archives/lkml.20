Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794774011;
	b=wkp0/wlKwmfAJvE7nceHIrxgq4wTRqEIRRgQiQ+l0udYbD0Y4SSXOq7B6uWrvPJbE38Z
	 xp7V1XBN55sl/qBHlZ3G5w9AoxD+DQyeztsdEo/FL9aBrRrlHcZa6IN9YQEudI84FmCC1
	 ZcHHCcM07RE6/jC+HQpwc4+ZUrKlFz4iXz4G6j/BZIghIMxGcPKnExjD6639hJQUS+8H3
	 8Adrewo8uG03a89niuT4yCoATyJe8MFG84dw/2YLeQeiclaVYPCB/065bF6rm9a0XZQli
	 wH1TrhCGRYzyQxJLAx2lkVgrDzollfEHSCP43Z35xAx5N79L32w5UqsrXnLu1YqqZJA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794774011;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=EN2NmmqOAbfZZaXF5GONSczDEUOw42oz8DpjDqn11QU=;
	b=eleTLQyXWdokshKutfzsIWYU6WfUAeyEigyuafIbE+OvFSC6BzX6GhDp5ta4gWAoFuXh
	 ac6PXj/4TujX3lYEyjKYv3su6IKbBcQetzPvOvaiN46H1ycf1GGpedCYnR7gTBS88CKVH
	 mnwTkl1Xw6yzu1t3+3FCsIzK47ULvoZRPk41vjNr+g+sfFT4zC2Ec2HgRdCJSzLRmYJQP
	 3q4GE5qKJfrTaX4C7+TfVyPrSQREfB8bNEnXC2AxSijjg/+xKJi/iE9WToL+s/PBSdGSn
	 AUv9FZb/pGqqvoLFSA8mfK2dPsqaQt8YhEIJnSsZJ8jl5GOPorXsPMm+63inGTZM6zg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="TEHj9Lz/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A9F606A332;
	Sun, 15 Nov 2026 20:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TEHj9Lz/
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794774011;
	b=FSKNtxEcgE4HfSwWaqqFW1JSVkEWgXqhukhX2zIH7bsrxRR/JLyFnceY248dZ47Ka5Yj
	 Z81ClqeipqLc8GFu9FAPzPoBlekl/BIFpJaSzaF/AHRKB8IRouPGdNHH3AX2PtKfzJEwm
	 2TlLNjmpzaS66Q7q8ty8S8o7KHEVF+DkbNiKypOL4DjOv2zbBjTIMdKFxJz4IHO4gkqvS
	 /zJVtPL7EcGrelFAUBRp87grGNZqNhzw4nwhGZWdvb5516c0SPV8EYWUqOhStA+aWrqHD
	 PSrgiEiP7qHZ3VPXqpwCM9DxmZWEkjjj3CGCwVmd7cFg88yixZNYdB6CSIJv8WyiHKg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794774011;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=EN2NmmqOAbfZZaXF5GONSczDEUOw42oz8DpjDqn11QU=;
	b=CE9snKksp/p7cQ+W1OaFC6wjPRFbIZqK9FW/Pl1Ql3m8aJ1QvQhmZJPisXTWkP34456g
	 Ieug51TRP8rCcKkQDYtDibnV4geNfuG0SGakw7P5Lk+tdq/eyHZuyC2crHYuaXGC73jT1
	 bJCFQmd/wHXj9Z/VfHXwoOkO1ViLRxfxzPHMkc1o9FsokHh8kri4TONd78f9a2UAJiKVD
	 x2Q+NxYtpl+IBrf7FsiaymiyF42n6M681TtMmc3Xm6B6Zl5fpKZ6BxxAXECBSihasLUgF
	 uTd0jfsbeMqwF+X5jbaluKe6XaDVnWk1pXZNTB9bZzDL88fKStYtAjLzqonBvLaFd3A==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B09A91F000C5;
	Sun, 15 Nov 2026 20:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794774011;
	bh=EN2NmmqOAbfZZaXF5GONSczDEUOw42oz8DpjDqn11QU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=TEHj9Lz/vVb+mazqUAgfq2y6KnAF2Vm50c9hpW+7LtmsyaF1ctKDVuLuJKzhmv93g
	 VXNEjXqTTkp86s0tVLhItf7SHQ1Q11XsanhCv6HnSss06PiTbO/Rhi/yTn6LgQ74AA
	 9M1WcWI5CcJuxEjYB0X5sPHF920yCYtw49eIpHelDZZe4eJAotDOgdqEvHmh8ENhlk
	 RTbxPPq4JhGGTKHjtsPu9/mpFJVehqL2VQ0cDzMC4imsxiBJFA2QHJqmWBzxVLKGPD
	 WVBCE69nyjafUWADPVZexXtmq1TvnQXhW9ghi5zrkSyPTWPXcmALKMAPTxzXVQCcjp
	 dB0oPL/Z1jqiQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 416DA4A1A2;
	Sun, 15 Nov 2026 20:20:10 +0000 (UTC)
From: Venkat Yadlapati via B4 Relay <devnull+venkat.yadlapati.yahoo.com@kernel.org>
Date: Mon, 16 Nov 2026 01:50:09 +0530
Subject: [PATCH 01/11] dt-bindings: arm: qcom,ids: Add SoC ID for SM8845
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
Message-Id: <20261116-molokai-soc-v1-1-3b2ee920fa3b@yahoo.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794774008; l=843;
 i=venkat.yadlapati@yahoo.com; s=20261023; h=from:subject:message-id;
 bh=Huu4jgIWWLIBCJ+KxfQNa+x6WFgeqmS8XykCrE56Ww4=;
 b=3Rqvz7jbO56ICCt5IWSUWRBTjiMOrAhtex0QQdvQ9Lhr4UZeTkh9y+n4nqZxmcj4mt6CTjiaM
 fsf4B2IHm7dBmBZ3FA0iXD2r1AwiBx7EkjKmBIBnJZZ9bzuu0Cfq9ju
X-Developer-Key: i=venkat.yadlapati@yahoo.com; a=ed25519;
 pk=e8KStCtEMvUP1Se/riB/KVnDAQFEVR2Dw2PcuA8/eME=
X-Endpoint-Received: by B4 Relay for venkat.yadlapati@yahoo.com/20261023
 with auth_id=1303
X-Original-From: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
Reply-To: venkat.yadlapati@yahoo.com
Content-Transfer-Encoding: 7bit

From: Venkat Yadlapati <venkat.yadlapati@yahoo.com>

Add the ID of the Qualcomm SM8845 (Molokai), a variant of the SM8850
(Kaanapali), as the Motorola Signature reports it in SMEM. socinfo uses
it to report the SoC by name.

An LLM was used to help write this commit message.

Signed-off-by: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
---
 include/dt-bindings/arm/qcom,ids.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/arm/qcom,ids.h b/include/dt-bindings/arm/qcom,ids.h
index d89d3b5dd00c..5e4af9edcd77 100644
--- a/include/dt-bindings/arm/qcom,ids.h
+++ b/include/dt-bindings/arm/qcom,ids.h
@@ -300,6 +300,7 @@
 #define QCOM_ID_QCS8275			675
 #define QCOM_ID_QCS9075			676
 #define QCOM_ID_QCS615			680
+#define QCOM_ID_SM8845			685
 #define QCOM_ID_SA8797P			690
 #define QCOM_ID_SM8975			707
 #define QCOM_ID_CQ7790M			731

-- 
2.56.0


