Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A36A33033FD
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 15:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791301662; cv=none; b=hOFeJVYyL3sTOXgngepUeQc/Cbg2eWLlR58MYwmbT9NUbEIdnLRhThZD5BMcthxquiVJcB5hoeJTI0VVH6Lu2Vod+3iTgn74JQHpdfq0peCOXzmtwbi41I6CgQ2bB7Iuj5XMMzGwgrjDjXEeGtA/qkFIBXrCi1M9ufj6akwuwho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791301662; c=relaxed/simple;
	bh=WQgo3gi3KAogDGueOlvmgGly9rIsGOBFx1w+r5ob4TM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UWXIxB/1PvbLVmvsYKKC9m/Ja989cLZbvCk5T6+U25Znu7bn5WtIdql7k9LEg4zlHSRXV4cKscdIwTbfvszS7fO/pCYWmipbQF8PVGIcf3hcWBf2SLfEtFV3BqgQd3Ks482sJKKXR589NqltEVv6gV99sQUEHqdWrK+40OYztdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linbit.com; spf=pass smtp.mailfrom=linbit.com; dkim=pass (2048-bit key) header.d=linbit.com header.i=@linbit.com header.b=GLbwmj3B; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linbit.com header.i=@linbit.com header.b="GLbwmj3B"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4995b0343c1so16368705e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 08:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linbit.com; s=google; t=1791301634; x=1791906434; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8OrE7D9wgxOgfXoLfMaem3xj7KYquRVAqPRjESEqerc=;
        b=GLbwmj3BiorrlaEuk9/CYZ3IWQ0VtKCWU6sRGd2CgF6ZEiHxdmaMj8NTuxUFYWzySS
         Jkqv1dD86hEqeZgsLVonNMydCDhke/LAovTninfIEV+LPu45EF/PTL3JrTfRVBYl7FUX
         JPEUph3C7loydpv3ZSIhJgim0Wd84iAqqfznR8ddJ93zkyQzlC63VwDjHD24DVc+Zba4
         2QtZ4XNo+yIcEKabzJld3KjRfLZjXW9WOV/6kwz3Erp8LlMgyp7vk5KbSIgYgbUc1n5q
         inGps0qUc1VPYjHd45e0BUCGzhr+7BHRrYqdXNTxgrDLBkxdDgsegiqlctnsSGdkubUs
         EyrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791301634; x=1791906434;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8OrE7D9wgxOgfXoLfMaem3xj7KYquRVAqPRjESEqerc=;
        b=nUb05VYFhwgZQCPFtvRiAzTqufOEw8zNIbtJbc9ZJ6qHSrCqIXvWQX3bwvbTNaz86Y
         1lZWaI0ds2e6roIWaBshL55M/YOOtSRkT/7YRuxlCBQyDyGmXjXsNpzw673Eu3EThbhO
         r/BQ+m4neOaQBvw4b+PUEiNtEual3G49rrByRKCH+SdoLC1HkB1+FSF7nwr1aFd0HQyV
         7beN5IQcGstxZtKaHLyD4GxJ4DScYozyHhAygD3zJmmgAhDGDfT6X3o0YbqwxEh1jX+F
         5EE6RsssJwXHeVPGFD9YlPLATxC9rAEECuHoRELkgtJYwUXY9kFbP6l2VfBNmYpz9plC
         5kxw==
X-Forwarded-Encrypted: i=1; AKwUvBzGV/7ctfvsG1PqYLN8l8KAGXNw/AI8kSnoh0uItkkk4OeAaY9GgATx77D2HOlp9EsRJevbQnvXhCE6TEk=@vger.kernel.org
X-Gm-Message-State: AFuF++lCDqnoSVlOJnlK64jf6kK7+eBoWuGBXCNvKaUhKcUdno88NLZG
	8hAd2sK7OacLK5VJ+UPg9TdRBqGArSh/Qtf2kaJXMxKBK4VwkFS3DsvT/fPPosh7BVQ=
X-Gm-Gg: AYBFou1+wy/1mhVtvTEVgR7f143zDsnIpYASdjbZ6yBRaFH8Z6zbyckHH19OgTfmqrF
	A96lsXNF2DeiSEBTMTwvDI5gXD2QihoNtbvi7GbE6lzzMGEpCUN0EGFp5VlO8FsPwfukG8NnQvv
	ON61NclAzV6YCKHiDYG4Sx4K/5L3dcjG5InPK8rcx3s4l653gbd1RXZS2PajcCxjzF+JBNGN6Ts
	QYIiwx/6uvXG9/5ghCK0hdOqd5T8Htdpjfx75XbBFxU9EAOn3Wlp1MPnLTWi+qaHo/CXr43q13y
	17PLUHB4FAtB4OdRDN2NYIKyXIBQAPQSURkqsHzGpwWewN4L6cXoUjweuTcWBrN6VLk16GnQo3S
	4xhFzLhE9GV3ylGxZbb8JU9XpIKWrh5Nh1EImHSekbziBUMA9NVOK3oiC+ZsyAUu+92ate9DY97
	AuiD9L+VxNtk7G4Kc5mIY9FfC3Bu+G+IDu5eZ1WEr0EHbaaevmQN7CwJobs8vUmO2mo/hHRXpGc
	ehFGMguXkwDcusMsAk8I5yhorshce7b
X-Received: by 2002:a05:600d:82c2:b0:49c:cee0:f383 with SMTP id 5b1f17b1804b1-4a17b54978cmr36665195e9.16.1791301634297;
        Tue, 06 Oct 2026 08:47:14 -0700 (PDT)
Received: from localhost.localdomain ([2001:4bc9:b00f:d376:7c33:9a50:ef33:f391])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178c5b9d6sm72087205e9.13.2026.10.06.08.47.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 08:47:13 -0700 (PDT)
From: =?UTF-8?q?Christoph=20B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars@linbit.com>,
	drbd-dev@lists.linux.dev,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Christoph=20B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>
Subject: [PATCH v2 20/20] drbd: remove BROKEN for DRBD
Date: Tue,  6 Oct 2026 17:46:07 +0200
Message-ID: <20261006154607.3936501-21-christoph.boehmwalder@linbit.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261006154607.3936501-1-christoph.boehmwalder@linbit.com>
References: <20261006154607.3936501-1-christoph.boehmwalder@linbit.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Remove the BROKEN dependency now that the DRBD 9 rework is complete
and the driver compiles cleanly again.

Signed-off-by: Christoph Böhmwalder <christoph.boehmwalder@linbit.com>
---
 drivers/block/drbd/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/block/drbd/Kconfig b/drivers/block/drbd/Kconfig
index 261965d7b054..06be6ce164f5 100644
--- a/drivers/block/drbd/Kconfig
+++ b/drivers/block/drbd/Kconfig
@@ -9,7 +9,6 @@ comment "DRBD disabled because PROC_FS or INET not selected"
 config BLK_DEV_DRBD
 	tristate "DRBD Distributed Replicated Block Device support"
 	depends on PROC_FS && INET
-	depends on BROKEN
 	select LRU_CACHE
 	select CRC32
 	help
-- 
2.55.0

