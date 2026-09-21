Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB4F342A176
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 23:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790032140; cv=none; b=UI/ApVlaUqptpr05QIWc1LLkmrOqQAxxRhIWAbasfc+QOQMBnw1ZvqAGfb9AeACPtOqDw/lmzZyuz6nr/fn11aqpDLtzLcWZvs180tvhotEvjQSvXvwGkiQ4IjnwiYHwCDVE4ouQ7rsXAXIvBKYEkp3FzcywAQx9PFthYuis/s0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790032140; c=relaxed/simple;
	bh=kAvYqeh9lhIbm8YtKATUVDPt4SSV0dL/01lCzjcwo3Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rUGevKPkAV4VSUwUkZDmXNyEqWQWTlYjjJDZ8Cv+zUXizXhhE3BIf96kYAmiqu8U515eg3KrjlsGqrI4GgZLPq+/ObtZrFr4FoQBtxtHHHS4OfG1VkX+2BPQ6czgWbHY6gQP+EuffKf/MGRZ7uzeLL2ePkyfbOF3eSCR2dp+l9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QyZUYmCF; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QyZUYmCF"
Received: by mail-qk2-f13.google.com with SMTP id af79cd13be357-93910ca5aa7so318936385a.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 16:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790032138; x=1790636938; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=81aKjimYrYOGXnfGd1vfh7o17MNAV+GZaQTkl+KjGW8=;
        b=QyZUYmCFqcGdPDyj4LBCoxHGM3l8H92abHSqBj5QZZpXopqZSyK2Q5bFOaguO9b/IO
         amUpJJWphzwIfhp3awJ0SEoCjqA2VbDlYzYpgOKHbPlesrGdT0qY/Jz84vj6s17+ua89
         1pvcqTcZo8KcPzZlN9W8Lll3MUCQd9md+Clz6fqwOISzSx+mRNW0oXxexnynFvql6sC2
         qzFI9M5TvlTf/k5I7pxJDKtj8xhEGw2i9ZuWQ0J2ou2tF06iXVDSsYTYvc+n+ZXCt/+F
         qVmrGJY8P+2Mk/JUgyJ7MOSeF0tn7BiBDUJCXiMgq2YE1awp3nDuFx5EDA2643Rb1U9w
         lR8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790032138; x=1790636938;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=81aKjimYrYOGXnfGd1vfh7o17MNAV+GZaQTkl+KjGW8=;
        b=YQ6FcA7ncyEjYxVaNCv+GkD/wOGL4k/opUwGOghKEfAv/OzAVsvn3LMhAAHTnfrRMC
         mj89i+6OOzVXnZJfeWlPu+SQ8G5ZticB+5ilmxbQ6Cf5yuPpzImKZw8DbHxudT258r3h
         vqX2z7ve1p78NNSlnqDebaSMTARtZqg7k9oV52+eLkxD/AMvIxhK1CHm1aKCyzzZGxX8
         bFWfnDgf+lGXiwQKtFRk6lfTIc1+e0GnrfOFkuOGHhRU0Fg5f3ZW1xloEs2oaRI6MZ5J
         gy4/RIS+QgFZ/oDLpG9FLqO7r75UOLjXh4XRs9P6w+5TWirlVcwuwcjKmHjhyJiJKiTc
         TVdw==
X-Forwarded-Encrypted: i=1; AKwUvBzcLUGPADieJ732QP/gT+qV4SXNmpGO+ZJpHKR0iLjeHpcYkylhuttO4Xa5OnRUD+ant2Lblo1mP/G9wnM=@vger.kernel.org
X-Gm-Message-State: AFuF++kmEB7+YwqqEnpiVIxwXuXKolrrVznmEQD/w0ojfgohCGZPn/kW
	sq/2JZw81kH9pCkjAt3sXFN5x9jFLflOJ53Hd56db9LlUTlrKogL/6Y=
X-Gm-Gg: AYBFou1kHqZTjC8GSHJwSkmM2LBVhnl8zN0YNR8QjFErYuuUOBDQUrjvHQSJ6f3I6ui
	eBwZ3tULCcOD+dDifpTgSxwGKpNvf0U+QX//SFOlh2SixT4VxRfjbM/gq0YLaWxnknOiVigrivi
	oxRMC4xmm1AwATXYmvyKYOO3gbp6TvVVj7kMJ7AYbXTwoaRvcsg9/shbn5zk47VShPcIeynjWx4
	+BFXIX+oAXdjMZLnEKMR9p4nT4tCX0RbiI6vCrwQLkk6StP/+3t4VjXwnFpuNMCJilEpdKhdvyq
	Dly3t9LLD45XdbYfNA7rEv/4biW024yBKYagEyvN18C2EMJdpUQIKWpYfspZSJokBIw4zkl3IgP
	nQZwzLf7nl9fKrYjZ+uoEByoprR9/tNJquuoSOTZsTWo2vJg7lolCNwAmuUx5x/zPUnXSW/Sfx6
	rcYHRvoypYE5hFTQYmqRoGEwoZGoed+2OYw0xlUB21y/SBk4rHF9qe07KWG6gCf5NXuOCJq2BIa
	JakUwYEnsxa/vRvfGkmGuVf6jIejRCv7v9j0TGakEGu7mDSprci/ucj6IY9+Gh/2d2NZQaYKlOq
	n1VXX1QuqKxMfIcodUQ15rCVxTRZ
X-Received: by 2002:a05:620a:6f0c:b0:939:feaa:949c with SMTP id af79cd13be357-93c15eed484mr268135185a.36.1790032137800;
        Mon, 21 Sep 2026 16:08:57 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c19a7f592sm39933985a.17.2026.09.21.16.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 16:08:57 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-usb@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 2/2] usb: gadget: tegra-xudc: Disable reset delayed works
Date: Mon, 21 Sep 2026 19:08:48 -0400
Message-ID: <20260921230849.502492-3-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260921230849.502492-1-mhun512@gmail.com>
References: <20260921230849.502492-1-mhun512@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The devm port-status IRQ stays registered through remove() and can
queue port_reset_war_work and plc_reset_work after
cancel_delayed_work_sync() returns.  remove() never stops the first.

disable_delayed_work_sync() drains both and rejects a later queue.
usb_role_sw_work stays on cancel_work_sync().  The PHY notifier is its
producer and is unregistered before this cancel.

This issue was identified during our ongoing static-analysis research
while reviewing kernel code.

Fixes: 49db427232fe ("usb: gadget: Add UDC driver for tegra XUSB device mode controller")
Cc: stable@vger.kernel.org # 6.10+
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
Changes in v2:
- Keep the Fixes tag on one line. (Thierry Reding)
- Disable plc_reset_work too.  The port-status IRQ can requeue it.
  (Thierry Reding)

 drivers/usb/gadget/udc/tegra-xudc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/tegra-xudc.c b/drivers/usb/gadget/udc/tegra-xudc.c
index a0585a1f19f0..dd0a033b4a7f 100644
--- a/drivers/usb/gadget/udc/tegra-xudc.c
+++ b/drivers/usb/gadget/udc/tegra-xudc.c
@@ -3932,7 +3932,8 @@ static void tegra_xudc_remove(struct platform_device *pdev)
 						&xudc->vbus_nb);
 	}
 
-	cancel_delayed_work_sync(&xudc->plc_reset_work);
+	disable_delayed_work_sync(&xudc->port_reset_war_work);
+	disable_delayed_work_sync(&xudc->plc_reset_work);
 	cancel_work_sync(&xudc->usb_role_sw_work);
 
 	usb_del_gadget_udc(&xudc->gadget);
-- 
2.53.0

