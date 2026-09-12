Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 314F43C9ED6
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 10:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789209024; cv=none; b=CHCpWTeEYmoY/kcTm0fd0AXf1FfZQtj1MwDICnpqH6WOzUj/jHkpsD4rpSd1hFSih/IeRrinsyI8xhgooi4fBc6qZKK00VtxItKVyIVPF3xypvFljQUz4WIiD4IEMATpgH5nRywwoDVUJcyAbetkMWtJGeOJT9fa5sQdKE7JwjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789209024; c=relaxed/simple;
	bh=3CK3xCUajGrp7pvQnfknL5Fj9ZEZS2Pv8v/un+O/o8Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VkmTkpjnjp9vUk4Pz5wC4TTDHys3EWh7MopNqKpQTnFDjwhkA5EKm+hkgYhFxr6XXlVoZlpJG0X61FvqRX9C1w2m2uOOz8JiwnuLahSQbf1PpkVXc9ytpy/4fhiUYDE60Ge9x56bLnhc0sZ4W7HWcMRolwhi1u1cQ/aB2gEQ1zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Dqvt1Dt8; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=kAXdTql4; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Dqvt1Dt8";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="kAXdTql4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789209022;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Vv/+pDbq3xCxMWCwYrvbxXYMa9928ghppZcRWXUY5gE=;
	b=Dqvt1Dt8fdXefJdkkFuqAhy8e3TASVv5QvRJfIRApN6NaptkXMR94foH4b1OfDcvRZvvLO
	rhEFc/Cdbcqnk5xcnQjJrhgeQAnc0xqC5HRpe/L9VZqOo0v+Fi7nrXNhUVqhvCQKUh0KRB
	QE+zbKWVdxQ/4YBa7a9jC0ql3RVIOdk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-417-3f5uDkoyPm6L0AxrK5Wx3w-1; Sat, 12 Sep 2026 06:30:20 -0400
X-MC-Unique: 3f5uDkoyPm6L0AxrK5Wx3w-1
X-Mimecast-MFC-AGG-ID: 3f5uDkoyPm6L0AxrK5Wx3w_1789209019
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-49e6422198fso11163025e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 03:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789209019; x=1789813819; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Vv/+pDbq3xCxMWCwYrvbxXYMa9928ghppZcRWXUY5gE=;
        b=kAXdTql4gEtdP6/oUeUHvnqUUY3eWCdBo8i0wCnaSJ4lSxinFLAkA52u74Qz5aMl2J
         JTdXmqeWMQZDMcSj9jSGFeqWkg1RB8l5FRP+16Jtzt2f6NM6ZSMoQzuUelGmBhMIucQf
         yoXXASij6tZkl6La8OzN5qcEYzNn3XC+4v9Ps3DevXe2Ahddr2f+HJh0hW+qxv3/Ha6W
         Eo3BFmQ4AenvMfvf1QUZPUsIpLoqYGo8DAOdf2RVXeCxqvBHfYfJrBJVfCTcx9w5uzwR
         cfSKIRDiuQjhQvfDSlohJWiNO5Pb/1ef2A6dQ2GmTrCA1Tqz5sb9tyHZTmzXWjeSvAQP
         LVNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789209019; x=1789813819;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vv/+pDbq3xCxMWCwYrvbxXYMa9928ghppZcRWXUY5gE=;
        b=EJYlnU41qnw8ogGt39gPfhKdEnDgTzRP5JMjwn08FQMwORlF2ktFQP1G3LgPoOSZbv
         /1trn4RMfgmbTPiTWi86zGg443wwRzRqNzfefWBRY75+Yh2yIW7QIktM81r4HRgfXzjO
         S+uaaO5P9hNRxzAhBqRXNsxsghy9lbhnpINfwwTjSTyyoIs4+rEx+tr/+D+72aSEFes2
         Mhw8WHfMZ9sy6D0vs/UP4AsnhScOgBa/T7HltZetlsKHEvQbQ8OTvMAFr0X4sraWd9D1
         Krb5FXJz/BvNIbyd+r/zwaY1VtM87JOOkOHjeQXZ9NsVEc0oxVmknyc5TfMpNKEJvHVX
         2yVg==
X-Forwarded-Encrypted: i=1; AKwUvBzNWzVvQvkcT8xKxIWA52gdHjzz//WKua80rVoZ1b1w5XFZfgn9+x1IPADvv7agKcn6QhFYBo/ajaxcBwc=@vger.kernel.org
X-Gm-Message-State: AFuF++nevOgNw/Jl0mTERPu3W86v9uP7QV5juAOhhPxpH/ca8Xh+3flI
	DXdrmNa8Q5OA3YIj0Oxlhwu/mqe6ldgBTekBm6tkad8kB9rExNRVnHdxaD0ERbc77FjfyROEQiX
	LSOrH4kuuKJ4j0fU8w61XdAzAKIjqlOXywqTw1SzEyd1JniU/X4FRLDJteHzk5+kfAg==
X-Gm-Gg: AYBFou0kvpnVJT7zPJlLM/4Yrp4x1eEe4hhbr7fb3T61ZMnjZ45QfLJvt3NEYmTkojP
	JpjYN/d7KR6e5Jog2N2do5YdxPpPZY5U3RasxJnQG9GaiZcINCOX2ov82p2S3r5S28I+mXP9UH0
	2nOC8Jam1TPYzwsgZV/Y202ydHL1gLpSNLnL3oeXUHZkEQm1lRDyPE5Ic0NLms/kjo1M7jI+05R
	JNvxrHsTijeuqc+BE/qTOurHTrSRvAgzxq4ziK+3UULhgWJqeyToVtGZwE3Sk7m7uxm//eiZhYr
	0uNuNJzMHFl+3KOfHFEXeSQq30jnmAeOOHVrVbrWQ4Ls6shbEPAYnnQf4MYqN1PnUjI=
X-Received: by 2002:a05:600c:470a:b0:49c:ee20:e787 with SMTP id 5b1f17b1804b1-49e61878adamr168329715e9.1.1789209019234;
        Sat, 12 Sep 2026 03:30:19 -0700 (PDT)
X-Received: by 2002:a05:600c:470a:b0:49c:ee20:e787 with SMTP id 5b1f17b1804b1-49e61878adamr168329105e9.1.1789209018770;
        Sat, 12 Sep 2026 03:30:18 -0700 (PDT)
Received: from redhat.com ([147.235.223.59])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6fe9d3e3sm21582255e9.0.2026.09.12.03.30.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 03:30:15 -0700 (PDT)
Date: Sat, 12 Sep 2026 06:30:14 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: virtualization@lists.linux.dev
Cc: jasowangio@gmail.com, eperezma@redhat.com, xuanzhuo@linux.alibaba.com,
	jiri@resnulli.us, kmehltretter@gmail.com, sashiko-bot@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/3] virtio: synchronize callbacks after device reset
Message-ID: <8ae2995ee649adcfe1398f7f1c4fc9f7028c3db1.1789204858.git.mst@redhat.com>
References: <cover.1789204858.git.mst@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1789204858.git.mst@redhat.com>
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
Fixes: c46eccdaadab ("virtio: document virtio_reset_device")
Tested-by: Karl Mehltretter <kmehltretter@gmail.com>
Acked-by: Karl Mehltretter <kmehltretter@gmail.com>
Assisted-by: LLM
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---

Notes (changelog):
    unchanged since v2

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

