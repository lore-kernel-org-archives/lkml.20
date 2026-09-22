Received: from mail-dy2-f12.google.com (mail-dy2-f12.google.com [74.125.229.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B80EA3E8C78
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 21:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790111524; cv=none; b=QORwVkC5yTcMMnu9BN7BAPzH6+Wz5lmI2XVNeqFQWUhVMOmLYXDUUBOPmINJQDCdH6whmHodcjv2IeNtVjBpYVDJ8WiEV2vkY367Rnru+TEjWbDhAXzOh/JNDKSUkavB0uzC9954P2tAgCUwHGBMryuP1IO0GcFfTny+PioxvYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790111524; c=relaxed/simple;
	bh=pwkIcIUByJ9bqE4bpqhEhpT5m+9siVjLIN8nEvUfo1c=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=VB+bo3wHu7nQqQ+YypMbsXQwcpzJ5gHEa73KJQW2rZ7oow/fzd+6hfxDq2VnzLq5dfgysH4egQIB1MvuNxq1+dZRMuXwLerm1hfPHLr5QIfHMrkMSA+weVCCquAbKSQp4YJq9V4AbiHNk1M9OEU60k3J5y0HDq4oMgiOkhrn/pQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j225aI0o; arc=none smtp.client-ip=74.125.229.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j225aI0o"
Received: by mail-dy2-f12.google.com with SMTP id 5a478bee46e88-33b9e805130so178686eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 14:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790111511; x=1790716311; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HFc3cVt28AUvIwgg0fMAo3JWLIDnX5xw3DJZeSq88MY=;
        b=j225aI0o7rU7Lql2ONANtcjymgdYQXyGyUE5AqFgx8dcKu2o018VnCrt102qzR9N8T
         I3lx9iN7NV2SqIqqpqyAqY+7LjE0yCcPkHZGBBaHzQRBm/jjpOu33jfzaxTPj91Jq4XN
         gHozCPjnad7DsQcjx/67TedonU9FVAE7352mkZmsBdPhk/ZJKqQFhAhbDoz2eey+JONX
         mZObAcw8yMYlnD3fjT0fPrGij6dhbI1+uOsVa817xu+btH+8FeAsUOJLxJwpt+dKM+w5
         ap0TBicLcSPpFGrA7NvO0cB3HmKXCH74lnpCu8/VHVnk7oyJOiLr0k66yjUTRad9zBnY
         JL3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790111511; x=1790716311;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HFc3cVt28AUvIwgg0fMAo3JWLIDnX5xw3DJZeSq88MY=;
        b=oRT71qEvmvqgmTdXQ209F5wLnm19yTIRXE7tbUx9T2/yfJFgLmUosVBDpJkl3XTPxr
         OSIeWIBYst4gOB2rba++mCihmq8gOzTvBxqmxhvNes9t/oam8pyszY53EOnzPH2jZ3vT
         Ls2x293TuPGI2iCwLSm+4NKMIe1mUDjvkcrflXezdVCoBDz0AS+JjEjY4dgEiqe4aH+R
         CTTnrgjB6TEOCg8fD8JP5Az0j0Z5IIEyaVebV3ZrFu4ezmNrV/gAjlNPag5zjshScBUD
         MS/OvMbEfAZVQN2tWpnTHAg8IthitOJ7vIGShEvH6kwESqvqkfkjtZWPvGu+m+pBCQFf
         EQlA==
X-Forwarded-Encrypted: i=1; AKwUvByQU4cjO7zEAGeXSojS3CWVBoq0+rY7rRV3s0M0j9S2jkOUfWO/Vtk7nvH413JhXFiRzie4bQy6WtamqxQ=@vger.kernel.org
X-Gm-Message-State: AFuF++l1evcrnAbawVnFMEZcckoB5T35HWB7i1hc9M1myXEXvUdg4O5+
	U7X40cBIPwrm3DHXqvdNiOrToczM5AbhzQ7feLsL3q7E8uQKQ/dNnT89
X-Gm-Gg: AYBFou385Y/gwiTZRvQnPMJtAGhEGvttmSq5opb/3KY18Pm9WOBCldFw1aqL+C4ziCL
	M01wl+UYTamg4XMSvEg8MLWgw/DU3WdU3pWHfe49zo5b6G0BsrDvIxr13bKTrMcQKv5oB2rc82e
	27tryjt0JcbDdA5GA9NIb1iK6b6uBKmOgKQgIIXxVjhGzUIQcWH8F3LneDQHxtpBcxRir4tiq65
	L3PAmWOKQjVOODJJy61kcitrZcPrcynO3pg4hoCZevLRO/Xu0tu+eIl0XG2l8D2WH9Z0QUhpErL
	7LbntzvIKKrvYjRUkkeqc374VU3kiQ6XpJ0rDQr421UtPWYbQ7dWJjqbPXfljM6X2thbVE/m21B
	nu7TZahGdmcXqVBo2FL70oUvYSr8hfEJ+n9qHPkZKjzyiPKV2F/IlVW4uWbFlXC8iVKn561WHP0
	zrNTPotGRRaCdZ68IFnNEovd0aFCwbA5Vbi4V0obu7Za0GxSYRc/xn7+cC8lEV6OBXiuOqbMtdY
	gQvkg6AU7kgrhuf6BdN7XxMvaW150Gziz7caV7LRgf5s/SYOLSeLfhb3vTv5eoJqqfO/Lx0hV4=
X-Received: by 2002:a05:693c:41db:10b0:33e:6b65:5eb6 with SMTP id 5a478bee46e88-33e8dec45f6mr503707eec.30.1790111510073;
        Tue, 22 Sep 2026 14:11:50 -0700 (PDT)
Received: from Inspiron-14-5420.. ([2402:e280:21c6:671:f16e:2102:25ad:9cdb])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e939fdd91sm943147eec.4.2026.09.22.14.11.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 14:11:49 -0700 (PDT)
From: "Hemendra M. Naik" <hemendranaik@gmail.com>
To: netdev@vger.kernel.org
Cc: jiri@resnulli.us,
	jhs@mojatatu.com,
	linux-kernel@vger.kernel.org,
	vishy0777@gmail.com,
	tahiliani@nitk.edu.in,
	"Hemendra M. Naik" <hemendranaik@gmail.com>
Subject: [PATCH iproute2-next v7 0/2] tc: fq_pie: add per-flow class statistics support
Date: Wed, 23 Sep 2026 02:41:37 +0530
Message-Id: <20260922211139.38570-1-hemendranaik@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

FQ-PIE exposes no per-flow AQM state in userspace today. This series
adds tc support for printing per-flow statistics via
'tc -s class show', matching the kernel fq_pie class ops series.

The corresponding kernel series can be viewed here:
https://lore.kernel.org/netdev/20260922205924.32173-1-hemendranaik@gmail.com/

Both the kernel and iproute2 patches can also be found in GitHub:
- https://github.com/H-N41K/linux-net-next/tree/fq_pie_class_stats/
- https://github.com/H-N41K/iproute2-next/tree/fq_pie_class_stats/
---
Changelog:

v7:
- Removed UAPI header changes. The series now contains 2 commits.

v6: https://lore.kernel.org/netdev/20260919061254.39678-1-hemendranaik@gmail.com/
- No code changes since v5.
- Rebased over the latest iproute2-next tree and re-submitted patch.

v5: https://lore.kernel.org/netdev/20260902040221.83734-1-hemendranaik@gmail.com/
- Addressed Sashiko review comments (folded into patch 1/3):
 - Dropped empty tc_fq_pie_xqd_stats placeholder; class_stats is now a direct
   struct member in the UAPI header.

v4: https://lore.kernel.org/netdev/20260727165028.106817-1-hemendranaik@gmail.com/
- Split into 3 patches: fq_pie class stats, pie avg_dq_rate
  formatting, and tc_pie_xstats comment fixes.

v3: https://lore.kernel.org/netdev/20260630184453.171410-1-hemendranaik@gmail.com/
- Moved print_nl() into each xstats type block to preserve output
  formatting.

v2: https://lore.kernel.org/netdev/20260614130729.10076-1-hemendranaik@gmail.com/
- Addressed ABI backward compatibility issue.

v1: https://lore.kernel.org/netdev/20260531131411.28213-1-hemendranaik@gmail.com/
- Initial submission

Hemendra M. Naik (2):
  tc: fq_pie: add support for printing per-flow PIE statistics
  tc: pie: print avg_dq_rate in human-readable format

 man/man8/tc-fq_pie.8 | 18 ++++++++++++++
 man/man8/tc-pie.8    |  2 +-
 tc/q_fq_pie.c        | 59 ++++++++++++++++++++++++++++++--------------
 tc/q_pie.c           |  4 +--
 4 files changed, 61 insertions(+), 22 deletions(-)

-- 
2.34.1

