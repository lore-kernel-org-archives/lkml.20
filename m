Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794814801;
	b=QBzbgIyleM2YWA2wAvn9xz84uID2OQmDQMRWRVxM1RVerVoKASQfxbVJ/KABSaK0kbLG
	 dyde1i8T5lQxEH8lh33531qdMuA5Yq+qbk4MEMVMdRG9P1PNguEzJh+bW4oG/N0YePU4F
	 JOmOKVmR8Bk3wzdOv3TVhvVaMWdZFV1gcV/mUcBbkk5ObUYrSGE5NtjL7AZyq5UW3t7K1
	 JHCBytpTXT2L5LbpSXYKFCKAChauAqOaOLaefI8FNc2C4qgn9IeRru0vwHGEQY02BrXAp
	 qIIJCNsUqNcSzuxq4MCRf2O4rsJrmKZA3Vp7L8zfvissl7EunDOUhf7Ft8d8C6nbNmw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794814801;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=FGcd8G6eEIfp12BfUfsUpDp8eyyYcLEi1lDS3aM6nx0=;
	b=Xs5nHJiR/CCFv8n/+7FH21c4HLu++QfS7SOk5zwCm4pqlbFtjaNZEmAvkoGzbnhaCR3o
	 +9CwdkJLo82Bdbtnu7qZPBYj8fWfhn3lmy1Nb8tU8UHpW4ByLZAcdDHz/gR/9p/zN+54q
	 wNRuJS2ebVS/aP71lbX8Tu1LRN7oKA77y+V0MSEiEPeN1mRUIaBbBffqoXGdEPVDZkDUt
	 Baa7LCwGBwVUR5Kuhpi/gqs5Ah72x5nj0poMY/UvRxFHw2gAQOpQyJPReaP9o6DVjaGJE
	 g8Xe3BhHovJh1I3MiBUhe3NdpmwfBruhc7Cwlbv8yPQLCp1tHERfrGrf044S/zihNAw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a4UYrTU0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 883AC606A323;
	Mon, 16 Nov 2026 07:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a4UYrTU0
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794814801;
	b=kteWAM8yUvRRVVI/qcHJM9l7T6W6L3V2soBS599bRpeRwcOLuYzCK8U4sY0mr/8OKWEQ
	 roXxiKxK3UjGNxA0aDZJxJXvSEsN7K+gqm4JMCR5bPAGm5TQpW9qJFzLdcgdMpOjcrDlW
	 Qd5JL/OZig+p1om1jB/L/zFXRyMG0sQgWYGD5DzbBOba1vs/Wk4K4PdsDfIjgUIJxOvIf
	 /6Ygycoh/Vk2JVUT4SnqkyXSQOFl3qbyAacqeNWgI3+FS07sFn73Eqi0+LM2kAKL9b6mg
	 KTqRCtXioG2cfygBPwL6USd5SuisyPG0rTxEKaxKRK6Yd656Bm7HDX2iWgZYWqLH0fQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794814801;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=FGcd8G6eEIfp12BfUfsUpDp8eyyYcLEi1lDS3aM6nx0=;
	b=DZEvCbnRssesk2QdnndakUXHurHAwvJRFAe9cFt6IXCBZ65yGz7zXqFDFzvFJYWswdIq
	 6VN/ONiL63mIhFe4O/+nfSV6rmvgcZd/tEGgcSBZHRAfYs2lvbyNZ6SOxKIPbURe34qKj
	 p/k4o9n/iO4pbcaW+YNGBaKMrIIO1JQoM4mbAAm8XdhSTgRIQTYrgeaV06Jd+iXc6W33O
	 /iUAAB0TlsmgxppYIFnhYB4oMjcFkNgZcHA8Kfui7PR8udnNn8pM6LPpsCFhPa1kfllu5
	 +qFkaEBtK5DtUmfIdPwD13qRdboW1TQM7PQ8IgoqalEJQGdLaiz89wZf7LeJC2xYMIA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8813F1F000C9;
	Mon, 16 Nov 2026 07:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794814801;
	bh=FGcd8G6eEIfp12BfUfsUpDp8eyyYcLEi1lDS3aM6nx0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=a4UYrTU0i2UYTaneoApCx+ZfQ5B25HcWU9uMtzBdNFqxOvwgOY352pc5ddQKOr614
	 O4srM0ht0nuUapeDx6aEGmtOpb/HPh48ey9GWJQb9NjlPC9mfKGn813zPUhd0WcCZW
	 8hAEGRnkLWW/MQOlH+bWBmGYe4W4w07f5pC2tDcFC+hDQWPVnIJxyisVtCxRImJoM3
	 WjZtfY5ioeZs4sNXz6qt2gUwjmXYWbOdXtIEobCzXoL7jSQzgas/tBsx+1Yn2Rytxq
	 oJ2FMVQoUiMulWZIU13b+yCc0ZpY0wFuRps1JS8jp68mYFe3Vuu8vMEcj1WElUypIp
	 MCryAkAPjndPA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 189234A39C;
	Mon, 16 Nov 2026 07:40:00 +0000 (UTC)
From: Venkat Yadlapati via B4 Relay <devnull+venkat.yadlapati.yahoo.com@kernel.org>
Date: Mon, 16 Nov 2026 13:09:59 +0530
Subject: [PATCH v2 01/11] dt-bindings: arm: qcom,ids: Add SoC ID for SM8845
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
Message-Id: <20261116-molokai-soc-v2-1-9dc4dddc4e96@yahoo.com>
References: <20261116-molokai-soc-v2-0-9dc4dddc4e96@yahoo.com>
In-Reply-To: <20261116-molokai-soc-v2-0-9dc4dddc4e96@yahoo.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794814798; l=843;
 i=venkat.yadlapati@yahoo.com; s=20261023; h=from:subject:message-id;
 bh=6WOqBRlGEhZ2acQGDKgoll93XYgXjPBiaMe4x1oXDaE=;
 b=vZPnQhsIiFQKwCQ4ye9F3WU12U59ZQIg8u2ozud0qgQvXkcAvou4Svz7gUJWWvh8BpMj9Pq5u
 wslAyg1MnyuAxswGqCxAnLTf6ShCHXr/NjdksHGtQckciTgh780qKy9
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
2.56.1


