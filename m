Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793627922;
	b=mjhYpgHiY3wW1Nhdb/3CpXEWbDCX2QqXIS6im8kP8b+uH599Vsk4Yul1cjcJtYufD/Gf
	 wtNLbCK95H9P+T2h1FhGDD9MePJiujG8ClKDSDBitdsgX61EKe1MDyZWtxCSgEy19EDEg
	 Rcan+E7Bk/uwg7KWq0Y6SXRRvU34P+1rTO0ITov5ma97ETQ3duBAKoMq9PZ9DB0f811O9
	 HlgSpQnFmrm2O8XDChcFHHXleFrJcfANn0B3X7JbqiLhQSwlhpDY9b9lUcUH1m5DD8W10
	 NehayUM3jTbOufCt2OZoTwtWhvHn7uB31roYSWoZ1DeC9QFwtrwYKJr8Jw8Lm10yluA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793627922;
	h=Received:DKIM-Signature:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=3QToyCmrd5g9TGZqXK1YjfzTCUE1p2g5NVCSB13BeBQ=;
	b=C8png0m06Y7XYbXHnybHD+6utm+dkncDv+st6zJvKKxcXnoax7HKtgD1E6uyVI67/V3V
	 Yko9KhxZQfTreBrNKsgKPrtY6X4OmAV0oXcFi5I/h/xMrq4SORx+c1z9Fc02orGcmCYSV
	 jZlRNQfLtDQMOqapiS0OxyZYIyjRiBq/xDxgsnZO+ab7Ftce8BknsLeSIDnUxBoNOSfOG
	 SK22mkqFyBOLwFcdHx2zBk3jXESGPLpkyvmpsCsbWjxFaPp2+8h15gMLgdrWSH1kUPFR/
	 WUVwXrFbPjZE4cUkzny8r6H+0//dp+vP5vdLR3r7iyQgMbZ5gB1Q9SWr8IrBSHrLU2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MfGvGrX1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64B7E60A380C;
	Mon,  2 Nov 2026 13:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MfGvGrX1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C23091F00A1C;
	Mon,  2 Nov 2026 13:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793627922;
	bh=3QToyCmrd5g9TGZqXK1YjfzTCUE1p2g5NVCSB13BeBQ=;
	h=From:Subject:Date:To:Cc;
	b=MfGvGrX1P1+cglTbpqI1vZaM2K0nI+uFQ1+36cUw/jgKT8EnDsvizrgwSWVztQaaz
	 YBAKTZUpffdCawP/zF/9TKSp1uUW8TabuqWV6SYKazBOsO0X9Apj86CIdJ/4Lzo/BF
	 YpCmSTbhNlFxE18bjNON+4f7MPYHzhVM2h34EF236Uz4VBlbQoAGRv/M24ZKCUYe90
	 5AoIrEiOR/+kxotVjpaeLnzQuD4UQYiS3KxQLUV9fbTCPalMnNn6asusOZgAWmxhwP
	 bjnUhjXGDBJP6gcVovnm9gYKFxG9Dujjn5lEvkK2qVn9f8W1nEkezfrIJVtpk0x+CZ
	 P9ck4zc9M4SuQ==
From: Konrad Dybcio <konradybcio@kernel.org>
Subject: [PATCH 0/2] Patch up sc8280xp/Glymur USB3 PHY sequences
Date: Mon, 02 Nov 2026 14:58:35 +0100
Message-Id: <20261102-topic-usb3_sequence-v1-0-5b144f5e6865@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6CMBBG4auQWdukreKCqxhjmPKDw6JghxITw
 t2tsPwW722kSAKlptooYRWVKRa4S0Xh3cYBRrpi8tbfnbPeLNMswWTl60vxyYgBhrv2xr2twR5
 Uyjmhl+9xfTxPa+YRYfmvaN9/6+0KoXcAAAA=
X-Change-ID: 20261102-topic-usb3_sequence-bda4bf05eb2e
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793627920; l=561;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=JHvM33Z5VlAyKZP57NR5Bvtojwx029Z16yzsmS1JpoM=;
 b=6026gVPkyhGc77uIUhjiHsW3oUGbTen/5nZKBU8XdN44MJCpCROlW0TRgDonw7Bd+1LfnulDr
 /elvGuaAXo6AMgM+/CrgeQmBkYzNyCzpaTD5pSSujO+snDZLP/SzHID
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

Bring them in line with docs.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
Konrad Dybcio (2):
      phy: qcom: qmp-combo: Update Glymur USB3 settings
      phy: qcom: qmp-combo: Update SC8280XP USB3 PCS settings

 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 65 ++++++++++++++++---------------
 1 file changed, 33 insertions(+), 32 deletions(-)
---
base-commit: 7649ba73f9e7e1e04d0b46213e39c79ae09dd55c
change-id: 20261102-topic-usb3_sequence-bda4bf05eb2e

Best regards,
--  
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

