Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B2D34AE102
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 08:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790844777; cv=none; b=hHR0F7OrPRNN6iZli81wLd4LZX9xzLG/PyhgB7eT3poHtO8hlw5dSHrBOtTiJEQr+ZyyDWxQ9pzahsKN+bdHCWgPrzDu8GwS7OZ0apF/J6qKSKc/Ma5bx07mkErOAntCKddOknYWSUoxTzGajUOUSVaeXaTcVouOF6ZhkTEI+ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790844777; c=relaxed/simple;
	bh=Y9yhMCMPK9PruBiJ6LLN0jqdCuRUWCX6MRlxm3UxClk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fX2InuVB5CVslLK37uXpKXSFa/lxlkZIUh8t87N9BDcvXqOsyFcELLxE5ps7p4BFRyeORjoZRhvbwIUqY30PhHnhkKd5d65OBWYYAkncv4ODoLn9qmVNCZcv9tT3rrlAuU32CH9wAvzrh4S5lt5Ho9Z+7gtjLbfBvP5+oxskzlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wendy.sh; spf=pass smtp.mailfrom=wendy.sh; dkim=pass (2048-bit key) header.d=wendy-sh.20251104.gappssmtp.com header.i=@wendy-sh.20251104.gappssmtp.com header.b=hZUvRIol; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wendy.sh
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wendy.sh
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wendy-sh.20251104.gappssmtp.com header.i=@wendy-sh.20251104.gappssmtp.com header.b="hZUvRIol"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e6598dd44so39106975e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 01:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wendy-sh.20251104.gappssmtp.com; s=20251104; t=1790844772; x=1791449572; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZoHLp2qEvUU4qcQZHZqw/kSI80wjja3vkqgsp5gvpnQ=;
        b=hZUvRIolB3i9n9hDbgaKj22rKmXPO5fsvbNjVF8kgAJKEt9GW5VnqpciHJkxVjiemz
         hn+yxCqgccnfcy1/MzkQjpfQI6uNdgeNskLHMUvhHlmujvlui2vpgb2oOoRWv7A4Y3Zc
         5E5W+G4fod5Ncy30PaEM4uVg9NZgAUawn/etf6HMmo6zSWsdMHS1lEryL5v8ZY7tBjtm
         AVVgayOZ9mi9dIJUwvmEjgi947qOH4cfoue6J8Do73+zjFJNScTBBW+wlUMZqpMl6b5i
         kAsjCdWxJ6NGx0I0ElB8KmJPQJgeP9a91cxwqsyqE44R6xjTDrS9yLEbJqmdkKqe6KwA
         H9Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790844772; x=1791449572;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZoHLp2qEvUU4qcQZHZqw/kSI80wjja3vkqgsp5gvpnQ=;
        b=rswBzHLeqBZU1/yNksAhU1rxXCLs3aLN8Upf/x8ltuohMZGHaXxUvG0RHpTN9tp60S
         BGmPVphHvqmUDg8TOmNxPOP/43LdU12qoOcaSl482hlQ1xk9+YyZQHb+qlhGojlue6Zj
         3PZqURcV2SjfXSmhNaqtqYBW5M6Gys1ZxdPL47WiqCsrtybtk7tVPMuej0jHWVYbYs3U
         Ot76rv7Xb5RJmdEfn2SfD+lawpt52a83EvEjOhEQEi16fqC4DBZm2uDpzJQdzHyVXr1k
         9xrpl27iKGd2e4dC/3C70kBeHTdwVIlLCkzSH0BfMeSldzgMtbgRHZvQWf8ihssV6XXV
         rcQg==
X-Forwarded-Encrypted: i=1; AKwUvBxRMhlJHH8RiEy7thIFZNu8a+7GrYKnu13joSRsy/Z5rRD+uuiJcBjcuKHHXVl2JAbncxVij+8gV71L8rE=@vger.kernel.org
X-Gm-Message-State: AFuF++kmPgXjslGb5PGVSf7aN9IfwQNGofyqqnFnbGOas0JHdF7bE+Cx
	l1g2wDlyC9mkJdRHJBctMJi9i5BIabyLLr4Y6z+8cJuEyQLtUiV7T0ES7cVmSJopm70=
X-Gm-Gg: AYBFou3zL9ES7v8ExliXrJom8g50IaUmbPHUJWj6GvuL/sStzObXj4D91dwC2tIDGLS
	XyZg2dpfjH/bZ36L2W9KOFUJa+/ytInQ0Bti08evF/SXtBpCPJHOzpegITjtvklBytzU67dIjkE
	KCbzSOKgvk5nUrOiO5wj3ixsNtT4fQS3luyBODtn74olOqyT3UOY+Cmi3iXkvlAGyTBeLoxGXWD
	xb/lXfYYCUsIDzIFeHLgnF8i0PrezF289AJgVXh0lgWA3cGTHjEOMmO61zRz4xtkMjLY4zr5Amy
	wnb1L16vbRXUei5rOEKBFZluQ1Upm4Xs5raDvxoZDFGiSAROGbTymscR/baE063vsZZfT5JKRQ4
	dny2KTJdkxMnXn9wpI8WLqcgYP5q94lQBZmJrc0qh6pHHNHf34Mx4+DdSj2s2IGQJ8SMkPE0pT6
	8UjkWRY13oIva8NQ7NT/FNnTxEGDQ7GNyGsSswMEQ2gGxP3QpU56+NAwbgfhwU+TLpwcizkZ1PL
	pEC1Wk=
X-Received: by 2002:a05:600c:4745:b0:4a0:1e3a:411a with SMTP id 5b1f17b1804b1-4a01e3a417emr39422725e9.1.1790844771644;
        Thu, 01 Oct 2026 01:52:51 -0700 (PDT)
Received: from bke.ddns.sjp.renault.br ([5.2.196.22])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f979f4fsm55556345e9.4.2026.10.01.01.52.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 01:52:51 -0700 (PDT)
From: Benjamin Kelenyi <benjamin@wendy.sh>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>,
	Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Christopher Obbard <chris.obbard@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Benjamin Kelenyi <benjamin@wendy.sh>
Subject: [PATCH] arm64: dts: qcom: agatti: Make the ADSP remote heap no-map
Date: Thu,  1 Oct 2026 11:52:47 +0300
Message-ID: <20261001085247.1897991-1-benjamin@wendy.sh>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ADSP remote heap is declared as a reusable CMA pool. The ADSP has no
IOMMU, so fastrpc hands the whole region to the DSP with
qcom_scm_assign_mem() when it probes, while CMA keeps lending the pool's
pages to movable allocations. Once memory runs low the kernel touches a
page the DSP now owns, and the board resets without an oops.

On an Arduino UNO Q (QRB2210, 4 GB), writing and reading back 3.5 GB
through the page cache resets the board within seconds. With fastrpc
blacklisted, or with the heap declared no-map, the same test passes
repeatedly.

Declare the heap no-map, so the kernel never uses it, as the other
platforms' remote heaps are.

Fixes: 3fbf3b85bf86 ("arm64: dts: qcom: agatti: Add memory-region for audio PD")
Link: https://lore.kernel.org/all/20260908070331.2189A1F00A3A@smtp.kernel.org/
Signed-off-by: Benjamin Kelenyi <benjamin@wendy.sh>
---
 arch/arm64/boot/dts/qcom/agatti.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/agatti.dtsi b/arch/arm64/boot/dts/qcom/agatti.dtsi
index d9f4cbf..3ff97ea 100644
--- a/arch/arm64/boot/dts/qcom/agatti.dtsi
+++ b/arch/arm64/boot/dts/qcom/agatti.dtsi
@@ -385,7 +385,7 @@
 		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap {
 			compatible = "shared-dma-pool";
 			alloc-ranges = <0x0 0x0 0x1 0x0>;
-			reusable;
+			no-map;
 			alignment = <0x0 0x400000>;
 			size = <0x0 0x800000>;
 		};
-- 
2.43.0

