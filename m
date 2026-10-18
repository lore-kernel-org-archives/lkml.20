Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD6B041CB4D
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 19:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792351492; cv=none; b=dRCiVAte0RCrj1JjNJ6pfPo7NMLPuUv18vUfdGhuMs4Jke8hGvn5oUy9r1Y6m+cm8YbfcKceu6TC2aypVUZkXp24VDdFl1GRkbih4tNpCqFkCB6nI0kWb4wsRdWrm0cHClFfP3Vih73SRtDdgqi9+8kippuqPGF6BD6MvcSqsxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792351492; c=relaxed/simple;
	bh=YuTSyzPwXKhPhZHoKxzOloJV3Vz1FrQSyVr0HWn8gug=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N2EzQTFmpm/AoePXD7ju2gOmYy0FOimB36rfX7q5qs7uu1vsPpg9SELYZLes4qMN/m+Lfiwq96qvNKG5Fx1Vej0+rOk4PGtB2qS9AtJUGDuK15lkEcqy8GxD0R7a28wwFglnaiCb0r2Kh8AskDldsTuXVKU+xIpZcLJg7ukzEwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZvTmoXMY; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Qp7GhmKQ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZvTmoXMY";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Qp7GhmKQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792351487;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kZevltrwKAvYM+Logu2umHQbFiDiJJvS6eiPwGpSCUY=;
	b=ZvTmoXMYUpvEjlH1oWzYkHmdsF5OqgAYyqyE+suXUaKHJXlCBSnJKzZJNh5tSghwjm2JA0
	CaE3y+hWJlNPn8DLq49wV2d/swujG+m/YM/LB1ndDuzDZUkPy4NqeSHgwBABQbp71nkfLM
	yNbH8atUBAhSW/kJd3NJSOIGyJXMKPQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-191-VxwBz4ObP6u5yRtpD603bQ-1; Sun, 18 Oct 2026 19:24:46 +0000
X-MC-Unique: VxwBz4ObP6u5yRtpD603bQ-1
X-Mimecast-MFC-AGG-ID: VxwBz4ObP6u5yRtpD603bQ_1792351485
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-4870142f030so867529f8f.2
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 12:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792351485; x=1792956285; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kZevltrwKAvYM+Logu2umHQbFiDiJJvS6eiPwGpSCUY=;
        b=Qp7GhmKQEl0Qc301NULVc9LZpgMa3ADRPPESl15Bne+xmXFE3MFylBGfnRG460PoRj
         VhgPDsFzFIQSkm/X55sngrs2e4Kl8ZbPkopIKmEZLg5F/woq+Eg5n9P4V/3Jn1KI9Vpx
         CYffU2441vBQreS8sUX5YDCa+MPbgDzoKFDhz3WSdw4Q6UyytqiQNwVUXWG8O4ltDHAN
         9rKoty0odW1fmS52sf3pexJTGBtJUJQF9GYbqyANkkyVXyzH8z2wa6ycMep4lJFt0e/F
         8ipTzmhkflyPLMF3K6xTA6ttskbRojhgpdUjVZ/G16TjJ2OTu6PkhCX4e28GF8KqHFfC
         o5TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792351485; x=1792956285;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kZevltrwKAvYM+Logu2umHQbFiDiJJvS6eiPwGpSCUY=;
        b=gcdFlQwOfBNTKFx3a7H6I9tYavw8/95stDSlzZA8qDsBeyEMW5eCvMo1zOfCF5BjPe
         PBbHIEduHaqGTdat4+uMkI/mcknMDI4nUFe8HbjfS3Up5Kaw9Ara5KghnooOSUxwU0Ue
         BDg/+1ZBr8Zi5Sgo59kX3TZoSVfzxUDYxXBvtMv4XlMjDaLwhnqp1a1Mogxz1PbJqmZm
         hybRzk5SciPjcQbSW97JmmN3yTXXOVmhCWoxgBUt4p3p6o6M/e4d9hTbhAcPBNcDeV5h
         RQ+Ee02mAz0SgxzC/3bIg8MRD0E6k4BjswiVYBPOXfHaGjhJixNe8fwZpYrCcrAt/Nd5
         ObHQ==
X-Forwarded-Encrypted: i=1; AKwUvByNMnaZNmabWtP+aYcfSxHXpNlAeWUs+GDlx5dBrbiA9MbI0F5dseYA0DN1gFONT28nGQMuShWS3ljJj5w=@vger.kernel.org
X-Gm-Message-State: AFq9FYJBQ4rEjM5VUEaRD30AHE8rfL+lZKxPzUK1BAzGScnF2qXosWmw
	Ew/YnPBY7wR/baJulMmmP7mb4fZeEV+tTICSSsYSlM1kwrIDnr6TWVn5HaF6N+kwEevIcRQz9kM
	2FboaRWjH6qyyJMItCKmVwTQCywRMe29/B4VeafiPycgFC3efcBkNxrRzlQM5iZ4U1g==
X-Gm-Gg: AYBFou2xmqxhX9J/pWW57F7sjlEEdR7dnrJopGHKKlYFKWm4VEK8tXtzpaKf7VEqJ5Z
	rUMdMwFsDoIf0MVUfqZaQIV25Iw8fw64r2Apoh2m/qd8QbBL7qFFpEoKKebo2mW+IsdPgMR+4hs
	AzbehY1UGmPWppCj3YByz3IVhkx8CLhREgm7slUmyqJatBL3uUy7Gjmyk+k9ojk9YRO94T2smkR
	KuHmqJWooqClZX0to26kAk5S+N+VEv2cF7ztG4uT75Zr0MfIA4VazIEhn7FKqAR+biY2mINk4hD
	eORD5nTXVOFwq5mFjn5l0+eyrFEGKy+B4UGCjPEh5HdFAofrH60rA/ppJw+oxx1rPgIgXw==
X-Received: by 2002:a05:600c:859a:b0:4a1:d8c5:b23f with SMTP id 5b1f17b1804b1-4a1d8c5bb82mr91473535e9.24.1792351485138;
        Sun, 18 Oct 2026 12:24:45 -0700 (PDT)
X-Received: by 2002:a05:600c:859a:b0:4a1:d8c5:b23f with SMTP id 5b1f17b1804b1-4a1d8c5bb82mr91473295e9.24.1792351484626;
        Sun, 18 Oct 2026 12:24:44 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:3fd7:5300:3d6b:52a4:a23f:9d0b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1d30d778bsm207005645e9.9.2026.10.18.12.24.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 12:24:43 -0700 (PDT)
Date: Sun, 18 Oct 2026 15:24:41 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Haoran Wang <haoranwangsec@gmail.com>
Cc: jasowangio@gmail.com, kvm@vger.kernel.org,
	virtualization@lists.linux.dev, netdev@vger.kernel.org,
	eperezma@redhat.com, linux-kernel@vger.kernel.org,
	security@kernel.org
Subject: Re: [BUG] vhost/vringh: __get_user without access_ok leaks kernel
 memory via vDPA passthrough
Message-ID: <20261018152358-mutt-send-email-mst@kernel.org>
References: <6ad07f8a.a0c71a5e.2d2efd.977a@mx.google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6ad07f8a.a0c71a5e.2d2efd.977a@mx.google.com>

On Thu, Oct 15, 2026 at 03:23:45PM +0800, Haoran Wang wrote:
> I'd like to report an issue in drivers/vhost/vringh.c:1216 (function
> getu16_iotlb), found via static analysis of Linux 7.0.11 and verified
> against the 7.2.10 source tree. I have reproduced the leak on an
> unmodified 7.2.10 kernel.


This should fix it I think? Can you confirm pls?

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 drivers/vhost/vringh.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/vhost/vringh.c b/drivers/vhost/vringh.c
index 9066f9f12ba1..4b097170bd36 100644
--- a/drivers/vhost/vringh.c
+++ b/drivers/vhost/vringh.c
@@ -1213,7 +1213,11 @@ static inline int getu16_iotlb(const struct vringh *vrh,
 		return ret;
 
 	if (vrh->use_va) {
-		ret = __get_user(tmp, (__virtio16 __user *)ivec.iov.iovec[0].iov_base);
+		__virtio16 __user *uaddr = ivec.iov.iovec[0].iov_base;
+
+		if (!access_ok(uaddr, sizeof(*p)))
+			return -EFAULT;
+		ret = __get_user(tmp, uaddr);
 		if (ret)
 			return ret;
 	} else {
@@ -1251,7 +1255,11 @@ static inline int putu16_iotlb(const struct vringh *vrh,
 	tmp = cpu_to_vringh16(vrh, val);
 
 	if (vrh->use_va) {
-		ret = __put_user(tmp, (__virtio16 __user *)ivec.iov.iovec[0].iov_base);
+		__virtio16 __user *uaddr = ivec.iov.iovec[0].iov_base;
+
+		if (!access_ok(uaddr, sizeof(*p)))
+			return -EFAULT;
+		ret = __put_user(tmp, uaddr);
 		if (ret)
 			return ret;
 	} else {

