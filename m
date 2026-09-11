Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93716390C90
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 12:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789130272; cv=none; b=bb+PIRYRBzTCBZ3AjGwGPGAyHEANC9+80UOk0TNAPruycQDJlvg2pMeRHLfNAuFkb/0W/CV3/Jq6cPUUeKtzOr1JJsElhJlWf5DgLlWyvQlRdn0r0Fw8jaiYlI9hyjIzxSJ/duG3DK0ine9FBQiwKL2Ysh6HoELJf+mvwpiwUww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789130272; c=relaxed/simple;
	bh=DPV9nZ2tuZC9Vf3UqrU8CW0urglkq7RragP398hHe/E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Rzup6k99qdpwdFY50W2SdLRrvdeIfasskhwVdWYlvc3aT9YZhio77BlofMDKpRLEFW9SOm+Ec0ahicTCHNa0g9NWM9se2168dWnG/uLWWkFfa2eFEvwSa3th3GHbfGnQhtAePGvaotp1SY1SuBO7YM7B/hE7+ZQAW5w5V6jLpLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XY96Vqic; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=DRFVpZiz; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XY96Vqic";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="DRFVpZiz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789130270;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=JTS7PBVapSbj0SlRRVYRECPQGWduxlCI7H9TX0/I6IA=;
	b=XY96Vqic1xM3pJyQemqXKzPu04Bn1euSstu8UVCcVUk7e20u43leakOqdBVQbkC4XcWn/e
	G1mXgemhS94SRVnsGekQLdH1yXpDvKc4L6pzhMgQjk8eL3O0zK0Wp6sm9WqXX/sG67mFeV
	HJMQhOSXOklDc7Y7611pkK5M1fI5HfU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-216-pm4_DNyYNO-n-k84-3AFxw-1; Fri, 11 Sep 2026 08:37:49 -0400
X-MC-Unique: pm4_DNyYNO-n-k84-3AFxw-1
X-Mimecast-MFC-AGG-ID: pm4_DNyYNO-n-k84-3AFxw_1789130268
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-49cd83ca361so8656775e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 05:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789130268; x=1789735068; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JTS7PBVapSbj0SlRRVYRECPQGWduxlCI7H9TX0/I6IA=;
        b=DRFVpZizQ46NOO7mbYWO++J0YjmAR/pS3bzqQp/3dHuOSMSelFgiI71hhuTvvz49xP
         CDYqCHLJIgt/ygO8I+fIz10ntjJG1a3FeUyBykN+VACe641jJ1MpRnuipdtSBwDrf+t4
         6CLqY+0qwm1OnBcWSj9UV6kzsmjV+bNUFJm7MszpC8W4hv1zEW1KhCN+9cIzZ7teumdh
         9avwKVGk3ibWx92PRb3AH1ogzjReZiI/cdBNJxnLhw+VKRTwZ9UtBJS+aEBmdn8VH2QW
         dXKfXOxW1kKPnQemhBW++dHj2+DqYIDrZWWN7gIFyoyCdevd4k8/TsCm0iJzT1oiTcJ6
         K0/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789130268; x=1789735068;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JTS7PBVapSbj0SlRRVYRECPQGWduxlCI7H9TX0/I6IA=;
        b=I2zNtY+uSg3yUvXaIQaUyao/OlGTSO2FZIUvNyTXnuUJUjY56MKLsCoPf0Bm0wc0u/
         myl7JFGNQf/29vFdAVpbs/pCcHUJyiXl1G9BtemniPkTmMcIUyNjdfD+gl49zneDAjKR
         BbpOY9qjk5dSPtcg9i5AeEi24xST4df/MtxKA2hupCVsrNM489+IvMpm68PckuC7bof/
         qjhUsZrWup2lL5qgLPK+CACHB2Lwhs5pXT6a/XAnZMpqfByLC9MOmhCdDZVY9NTv9bnO
         WnCcjeXW5/Xt5wwdhYc94kwn4auNActVhQCpBZBZEhjpqNyo7EGC0MLRD9VCnQfKPGFe
         QsDQ==
X-Gm-Message-State: AFuF++k1dAQw6Oia1zIhv4WfaWZEXjln5f+W5DOMfyH3m7AYrAAQMwN/
	20YT86TmRZHy5R/SaY8GsLwX9ScrGgdpYts7eNDXZ/b3ABic+zey2jJSlcq93pHEpfYQO4GNr4q
	ZL4IxHHbZ3iCn+1W9Mmz4DMfYhHpvQ9V/4WfUmWm65jEVHLCTbyEH8es+AfukfjyOgCh2hWY3vL
	WhhTzfmIlKHCaZZ2oRs/4aHDHfYO7PTbOgx3p2xLlatIk=
X-Gm-Gg: AYBFou0Bv9XBnrLyXIfo5tIzw5UabFvkdrBz4zYrah0huE3oZHeQWtRq3zZ1FMLpg0J
	9m+mpx/pAqowKDR4CMN92zElrPLSYAKPopY0NMSXfZUx/TN9s2MDl/ilkj5PrJWd+gbP1ac0IGj
	Mlnz75FnSQCrpRewHJzZMtxqVekie1ueqXArOjzMlFqjwVd3hXzGnMXt6VbMQbkmCJuMN1nA/g0
	VcDp6FNCCqSIdc68pZysPv6I2bu8drifT6K0sCSSVTBrAsv3RIud45lienHW6hmB2+uWkeyg+r0
	UeA+HVIboPMOl7HJGNN8STsG+oRnu5upVjDEb0wBKxMmjxYBbnNF8VQPkxN0/RpaPTIzgkNqTqc
	wpGbXGz9ORX6m1pIlPz6Ikv0=
X-Received: by 2002:a05:600c:3588:b0:49c:fc6c:be1a with SMTP id 5b1f17b1804b1-49e619d530emr50197215e9.32.1789130267651;
        Fri, 11 Sep 2026 05:37:47 -0700 (PDT)
X-Received: by 2002:a05:600c:3588:b0:49c:fc6c:be1a with SMTP id 5b1f17b1804b1-49e619d530emr50196375e9.32.1789130266965;
        Fri, 11 Sep 2026 05:37:46 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-79-236.inter.net.il. [80.230.79.236])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26c39086sm137607995e9.10.2026.09.11.05.37.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 05:37:46 -0700 (PDT)
Date: Fri, 11 Sep 2026 08:37:44 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Jason Wang <jasowangio@gmail.com>,
	Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	virtualization@lists.linux.dev
Subject: [PATCH 1/2] virtio: synchronize callbacks after device reset
Message-ID: <8f71425918a148dcad1be993ccabd39582d246ee.1789130213.git.mst@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email 2.51.2.2891.g4157995a80.dirty
X-Mutt-Fcc: =sent

virtio_reset_device says:
	Note: this guarantees that vq callbacks are not in progress
but in practice, only virtio pci correctly synchronizes the cbs.

On other transports, a callback that is already executing, keeps running
while the driver tears down the state it uses.

Add virtio_synchronize_cbs to virtio_reset_device fixing this for all
transports that correctly implement synchronize_cbs().

Reported-by: Karl Mehltretter <kmehltretter@gmail.com>
Link: https://lore.kernel.org/all/20260818040433.66986-1-kmehltretter@gmail.com/
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 drivers/virtio/virtio.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/virtio/virtio.c b/drivers/virtio/virtio.c
index b6c9e927bef5..a8588d7ad109 100644
--- a/drivers/virtio/virtio.c
+++ b/drivers/virtio/virtio.c
@@ -264,6 +264,8 @@ void virtio_reset_device(struct virtio_device *dev)
 #endif
 
 	dev->config->reset(dev);
+	/* Flush pending VQ/configuration callbacks. */
+	virtio_synchronize_cbs(dev);
 }
 EXPORT_SYMBOL_GPL(virtio_reset_device);
 
-- 
MST

