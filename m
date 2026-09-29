Received: from mail-dl2-f42.google.com (mail-dl2-f42.google.com [74.125.229.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A69B85012A3
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 10:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790676456; cv=none; b=PERH76EjL8K0t7jg8o81t3ewf7PL5QiDwRXje+JDs6h2337BImMEDmZ7EB3vniyoV+84DDvMUt07X5avENWyFfk+I9CHDG+VfzMRMbfAcVPgX0oP/TYNGJRSVfdAP2fhrVz6o2rvAeRlbD/mTboqMrqMRQRs7Qly3QXG8LsIvzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790676456; c=relaxed/simple;
	bh=KJFLEZ1v4mTD+m/l/3qSuOzDumZPPFtC6lZTh/jPfDs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pobthOvMLa7GlA33gIGobIsGzSo5sv+PZleNp0fLgCcYUY0OGucDgvN3A31HDZFyDjuD9F0PsFerx71mYhPs3vg0Bno54JNlUE3bhGo03S6lIXM/OHkFz/iODkFqfn9CLnhFyafhBAHv+JwVKl7BDV5TW2E6r7BfjB3Nl7/73hY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UufCtY2/; arc=none smtp.client-ip=74.125.229.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UufCtY2/"
Received: by mail-dl2-f42.google.com with SMTP id a92af1059eb24-144efd1ea76so2291750c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 03:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790676443; x=1791281243; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mMSM/kY1l4Gzn1BlIvdJFdJREWDCkpXwh6FxH2SOcxI=;
        b=UufCtY2/weguc8BuB8PzLTNjXPYbV6Dips6UZ7khgiwkLJP27IGu//WOhYnvSVWIJ4
         gTka285nd6BvGc1W7cUGmwhwEAPm0l0JQFleDnV5+YylH0IGWQuC/uw1KJfAqgRRNs6b
         rsSIreJV9u1sItJxp3/bF06xyQ3e99l1le1YZoT6c2ph3OT2Vb1oUeKDuUHUNDEJvHaS
         eXyfD6+g+a4U8vqeyw4DQU2VAz4x401rmLjO2oNMzcXhWCjlp6GzackIQIBV7A6DhpZl
         S+5tLKHwGJfKOW1tB+E0VSldVMQcTA+zOqk5xSrSI+Vg0C+UyUIjGG7sZiw1rTpQbrg2
         rZcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790676443; x=1791281243;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mMSM/kY1l4Gzn1BlIvdJFdJREWDCkpXwh6FxH2SOcxI=;
        b=rHAS9NIZebVi5i6NFQCzLWu/ZeTxN/CgGzjlQObquHtzps5WWWkFahJst0HuS0rU/m
         bGrBjAcWJb4GFX5oZgIcS3/GazLtgMy8FhG9gjcTATvaYv78F2MS/6qODaawBYG+3dzD
         pDMcVkMTaEvAySue6C6L+rgntctyCzzWbCzsgXAKkkmS2mNknb+mugZioyye3JFfklVw
         R8CT7oBpL407mkQNz8JsTAcU84KyovOl5J1JxHjP0c0odPSvJKFvWtEpqqpi1YRw5xNc
         GO0XlXaTyJqRN1XHp/BTl7cstuaXWlEdgVWe0AZEPBUun78NGP3qNI79HSn1oxMQrcw9
         Micw==
X-Forwarded-Encrypted: i=1; AKwUvBxErL2eSE9dOEcn2/xDGO2woHqpA85X3U0FfTQ+tqV4TDd2onfRO9R/Z5HVS1Vv+Lb5P2GA26ToPQbPyPU=@vger.kernel.org
X-Gm-Message-State: AFuF++nqS+l1qnLm57CYK44C6yx/2Yo90rUZ+aHuf04i5GVHq21lEfr2
	2XG6MrNU3mkuEZnjpc3jWJXQHd1pGPLkKuLPhmPAVImQ4WZPzBxF+thv
X-Gm-Gg: AYBFou1XYkjtz+DhGqncYGMDtNVCCOhYvPRATJHt6hcs0yfnq6Impi+7WCUDXM4uik2
	XbdnOpem+IG7uEYCIoMmLhwalQ0vVt/vMLtfKE2j0h90L9Sd29IRHoKBhNeAPZKxCGLteg3WeSg
	DwCM43wcBJKEhE50bjVgFhFBhqzRWzqKOvu6eAR0q1B7y0fsxj13p57W6Lra0ZjUhgYC5zlVd/Z
	4zdRka4tU3IbE7xq88xbxwlrf/4S/JqEj/2cU4xfiYi3RhDrhZo46NnaeXt3dqO6i4J/ubdWF/8
	83ADvh6dslZPKDdNnfveWtsajrgslB9kx7hMwhBXcPX9eRDjxzCw1uW62wa40rTHumjjSoap7Gz
	oIbbgG3D2IWxSl8Rpw3huxcfXuvW62mHhdofUmsr4rak68BHGbKHzbrsacMJfIIdRJNkdny1g++
	iGvjvEwRHQwsQSM5iaaH/vukDITGNzyofncUwzkrqSJCsYVKKBzair9EgKZg==
X-Received: by 2002:a05:7022:289:b0:14a:33d:f581 with SMTP id a92af1059eb24-14a033df628mr5250637c88.22.1790676442638;
        Tue, 29 Sep 2026 03:07:22 -0700 (PDT)
Received: from evangelion-g ([2a09:bac5:40e4:11cd::1c6:2])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34141a4a5ecsm36445307eec.3.2026.09.29.03.07.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 03:07:22 -0700 (PDT)
From: Ayush Yaduvanshi <ayush37735@gmail.com>
To: Edward Cree <ecree.xilinx@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>
Cc: netdev@vger.kernel.org,
	linux-net-drivers@amd.com,
	linux-kernel@vger.kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-kernel-mentees@lists.linux.dev,
	Ayush Yaduvanshi <ayush37735@gmail.com>
Subject: [PATCH net-next] sfc: siena: fix kernel-doc description for efx_ptp_timeset
Date: Tue, 29 Sep 2026 15:36:24 +0530
Message-ID: <20260929100625.50380-1-ayush37735@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove excess @valid struct member description from

efx_ptp_timeset.

Signed-off-by: Ayush Yaduvanshi <ayush37735@gmail.com>
---
 drivers/net/ethernet/sfc/siena/ptp.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/ethernet/sfc/siena/ptp.c b/drivers/net/ethernet/sfc/siena/ptp.c
index 0b723a127364..d643e41ae773 100644
--- a/drivers/net/ethernet/sfc/siena/ptp.c
+++ b/drivers/net/ethernet/sfc/siena/ptp.c
@@ -196,7 +196,6 @@ struct efx_ptp_event_rx {
  * @wait: Number of NIC clock ticks between hardware timestamp being read and
  *          host end time being seen
  * @window: Difference of host_end and host_start
- * @valid: Whether this timeset is valid
  */
 struct efx_ptp_timeset {
 	u32 host_start;
-- 
2.53.0

