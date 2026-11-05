Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793890582;
	b=ADVobXXm4CeVqMZ4pQcHGeBvXFqoZcw//r9+NLOvvJfFaARo8c4NNL/2yj1lAkJjfqCl
	 9bPQFiUUAVg1SHJo83bI+84GKZxvLWc2CaUUdmCI3mDA9rKzAW3XKQHS2H/qAfZ7K9nUN
	 fQ+QTlHmV5rAGZPlC6MAesMtE7UOD7tAwS/J7n/ndeLWU1uX1JC80yoTAvhBErpGCKiJA
	 thQrcQRJ+cYj/S/wsiLdN6ss15yGFBre7SbaFD5SobW0XRu396SQ6zrAS8pRnQ3CBX47h
	 QxzwcqgvLnGJRIL7UX/mgCrlwNfqQKJ6vuEgqPLOsfDNQCOdQMWvOStvum6ZYYYBnhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793890582;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Date:From:To:cc:Subject:
	 In-Reply-To:Message-ID:References:MIME-Version:Content-Type:
	 X-Scanned-By;
	bh=4bDMURwR4/SSIEXVeA3LG2zR14gTTur39HxrnuGcJtw=;
	b=NbvKhSyyaaEIb8E1dbOi/m3kagP9nDxIRv9HDkOY2xnDqpcwdrQXXFvbFFMJKV0Vdmd8
	 HpzElIlvPhpEFJsl5qDPAmA2+CNb4YGNCnfJlnqC2b4DBPC3wVmAkHcnFd5M7WqCmQo63
	 FBikd+kUpGlFqJtxH3o0IdMK/0M+2Ar79cstoM3Tlc0+DBhmhGmaZOG+bzWLuU2bmaYkL
	 +W5lyZLlvI0Bl7FQ2WnSU90IrxvMHXbCt3rsNlZOrOFsyD6E22f7M4GHqkqI/j3GzlJOx
	 bxE9ozkldmnew1EMwJLXOCEPXB904a8QGaL4mGI3S7eG9ryWzXC8LwhDrFUV7ibFB3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RutVUPQ1;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2237E606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 14:56:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2237E606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RutVUPQ1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793890581;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4bDMURwR4/SSIEXVeA3LG2zR14gTTur39HxrnuGcJtw=;
	b=RutVUPQ1zjoIObhsd0NAAHnj1eUIdXDSV+vNEFEUxeLT7IU43uN16vse7B/m0pLMCE7EIh
	KccHa++zfa/ogVDE0bG0DkjIHgQn1P0VcDEZyMwTNS8A/XgnrCsE3tphuZ46J9XFtIC3CP
	Pq8IYnpn7wnimQuQBM88J8hGyCz/8n8=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-374-wY38ywd9OEu1BFmjVE8mCA-1; Thu,
 05 Nov 2026 09:56:18 -0500
X-MC-Unique: wY38ywd9OEu1BFmjVE8mCA-1
X-Mimecast-MFC-AGG-ID: wY38ywd9OEu1BFmjVE8mCA_1793890577
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2886A1955E95;
	Thu,  5 Nov 2026 14:56:16 +0000 (UTC)
Received: from mpatocka-thinkpadx1carbongen12.rmtcz.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 30E601800284;
	Thu,  5 Nov 2026 14:56:13 +0000 (UTC)
Date: Thu, 5 Nov 2026 15:56:11 +0100 (CET)
From: Mikulas Patocka <mpatocka@redhat.com>
To: Wentao Liang <vulab@iscas.ac.cn>
cc: agk@redhat.com, snitzer@kernel.org, bmarzins@redhat.com, 
    dm-devel@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] dm-sysfs: fix misbehavior if kobject_init_and_add fails
In-Reply-To: <20261103082329.1159472-1-vulab@iscas.ac.cn>
Message-ID: <32ebd466-6d90-dbe3-a77e-53dbb827e887@redhat.com>
References: <20261103082329.1159472-1-vulab@iscas.ac.cn>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

Hi

The bug is real, but the patch is wrong. As Sashiko noted, 
kobject_init_and_add would see an uninitialized kboject if it were called 
the second time.

I created this patch for this bug.

Mikulas


dm-sysfs: fix misbehavior if kobject_init_and_add fails

If kobject_init_and_add, we must call kobject_put (see the comment at
kobject_init_and_add).

Before calling kobject_init_and_add, we must zero the kobject (see
https://lwn.net/Articles/52085/). If the first call to dm_sysfs_init
failed, it may be called again, and that second call would see an
uninitialized kobject.

Cc: stable@vger.kernel.org
Fixes: 784aae735d9b ("dm: add name and uuid to sysfs")
Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>

---
 drivers/md/dm-sysfs.c |   17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

Index: linux-2.6/drivers/md/dm-sysfs.c
===================================================================
--- linux-2.6.orig/drivers/md/dm-sysfs.c
+++ linux-2.6/drivers/md/dm-sysfs.c
@@ -128,9 +128,20 @@ static const struct kobj_type dm_ktype =
  */
 int dm_sysfs_init(struct mapped_device *md)
 {
-	return kobject_init_and_add(dm_kobject(md), &dm_ktype,
-				    &disk_to_dev(dm_disk(md))->kobj,
-				    "%s", "dm");
+	struct kobject *kobj = dm_kobject(md);
+	int r;
+
+	/* The kobject must be zeroed before calling kobject_init */
+	memset(kobj, 0, sizeof(struct kobject));
+	r = kobject_init_and_add(kobj, &dm_ktype,
+				 &disk_to_dev(dm_disk(md))->kobj,
+				 "%s", "dm");
+	if (unlikely(r)) {
+		/* Weird semantics - we must call kobject_put on failure */
+		dm_sysfs_exit(md);
+		return r;
+	}
+	return 0;
 }
 
 /*


On Tue, 3 Nov 2026, Wentao Liang wrote:

> dm_sysfs_init() uses kobject_init_and_add(), which requires a matching
> put even when adding the object fails. dm_setup_md_queue() currently
> unwinds the disk and holder links without releasing this object. Since
> md->type is still DM_TYPE_NONE, cleanup_mapped_device() also skips the
> sysfs cleanup, leaving the initialized kobject behind.
> 
> Call dm_sysfs_exit() before unwinding a failed sysfs initialization. This
> both puts the kobject and waits for its release callback, including when
> CONFIG_DEBUG_KOBJECT_RELEASE delays that callback, before the mapped
> device can be freed or its queue setup retried.
> 
> Fixes: 784aae735d9b ("dm: add name and uuid to sysfs")
> Cc: stable@vger.kernel.org
> Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
>  drivers/md/dm.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/md/dm.c b/drivers/md/dm.c
> index 1881d86111fb..08b87fd6f955 100644
> --- a/drivers/md/dm.c
> +++ b/drivers/md/dm.c
> @@ -2647,8 +2647,10 @@ int dm_setup_md_queue(struct mapped_device *md, struct dm_table *t)
>  	mutex_unlock(&md->table_devices_lock);
>  
>  	r = dm_sysfs_init(md);
> -	if (r)
> +	if (r) {
> +		dm_sysfs_exit(md);
>  		goto lock_out_undo_holders;
> +	}
>  
>  	md->type = type;
>  
> -- 
> 2.34.1
> 

