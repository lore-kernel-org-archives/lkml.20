Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794237418;
	b=tjh9KbyVasvDdS7ron6A2Ik0IlZCi9voqoRwnMulfMN9/4RDQt9+li93IseE9LodLQdE
	 +2Gm2VQughH1KNrZFwDtkAJmEuiDy3ub+y3YANyop/rPs0Df+My59NXP23pGPpq3S01Fa
	 +GCSrXqVhmP+mAEfAhoWLXOVH68CcMPWTba9IB5n9nEeFuvUL3houYAZExUAg7lohRYNt
	 D+v8xPM1m9OcdoYHTO31y00ywowE+qtmwkMES8i7sfK1VLxMCkj71uom7bVNQJx7zmX5R
	 VZobxF9fHK5uQ8h58MrVeA+bV6xWx90A28d1l80kbvCBBmsMqhCOLMpz/8nbuPsTKGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794237418;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Date:From:To:cc:Subject:
	 In-Reply-To:Message-ID:References:MIME-Version:Content-Type:
	 X-Scanned-By;
	bh=dIFanPHsi2uzKVkdR3E3+ACI83Kw4fKElWH0D2yD5fE=;
	b=DGZnF+BmXMgLk2VPgC6GoO+oaCdK55AGQZO66wbeToqh2ABeejq7SNb59fUNXUNN7ARu
	 zTHqemvlomhUpBN4Gkx12Qspvw3ipupWBHklYWQoiMJ33VaonF9G9LtTUvWJ5yHfu24G5
	 5f5acHJkZxKqUanAxJkOms3PrZDMvv/I59/4pvqq6nuX983G8W/v8R133jSOgtPdcILND
	 nsHAd8snEVWchYxKVPrF9kSn6LzivSeLBtVX2bjZn5maYS9BBsbtCIDyTfNqzaNuBUb6z
	 VAavDHRLUfJOqRlzFVVR3tnMfy0kapOnqb2OjFwC1FVJBczEP1/bKMcbQ3KWAgZxvCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BZyn9CyW;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 013CB606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 15:16:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 013CB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BZyn9CyW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794237417;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dIFanPHsi2uzKVkdR3E3+ACI83Kw4fKElWH0D2yD5fE=;
	b=BZyn9CyWPQEF23cpNvfutKPMn38/0dZ2sxPktZP+AwNU+RzabvLLgj8fqaoALTycua9X4j
	fdtBiqFGI7kygYwyqfEMRo8WW2PUCqcEMyYTX57rn3bhM6JUeixiwyM7m1g8pInCVapKy7
	j9Z8APVSpKYAyn7gamsj1CfBni3KIVQ=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-682-tjhm9eS_Me2GEPyqgPmpsA-1; Mon,
 09 Nov 2026 10:16:52 -0500
X-MC-Unique: tjhm9eS_Me2GEPyqgPmpsA-1
X-Mimecast-MFC-AGG-ID: tjhm9eS_Me2GEPyqgPmpsA_1794237411
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8F9B21955F17;
	Mon,  9 Nov 2026 15:16:50 +0000 (UTC)
Received: from mpatocka-thinkpadx1carbongen12.rmtcz.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4E1F926C;
	Mon,  9 Nov 2026 15:16:47 +0000 (UTC)
Date: Mon, 9 Nov 2026 16:16:45 +0100 (CET)
From: Mikulas Patocka <mpatocka@redhat.com>
To: Zhao Feng <zhaofeng2@cmss.chinamobile.com>
cc: dm-devel@lists.linux.dev, agk@redhat.com, snitzer@kernel.org, 
    linux-kernel@vger.kernel.org, 
    syzbot+4b232570d625662eaab4@syzkaller.appspotmail.com, 
    stable@vger.kernel.org
Subject: Re: [PATCH] dm crypt: fix use of uninitialized percpu_counter in
 ctr error path
In-Reply-To: <20261109023753.1278-1-zhaofeng2@cmss.chinamobile.com>
Message-ID: <0ea4f803-33bf-1ba3-b7f0-a11c676c8086@redhat.com>
References: <20261109023753.1278-1-zhaofeng2@cmss.chinamobile.com>
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
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95

Accepted, thanks.

Mikulas



On Mon, 9 Nov 2026, Zhao Feng wrote:

> If percpu_counter_init() fails in crypt_ctr() (e.g. when the
> underlying percpu allocation fails under memory pressure or fault
> injection), the error path jumps to "bad", which calls
> crypt_dtr().  crypt_dtr() then evaluates
> WARN_ON(percpu_counter_sum(&cc->n_allocated_pages) != 0) and calls
> percpu_counter_destroy() on a counter that was never initialized,
> because __percpu_counter_init_many() returns -ENOMEM before
> calling raw_spin_lock_init() on fbc->lock.
> 
> With lockdep enabled this triggers "INFO: trying to register
> non-static key" in __percpu_counter_sum(), as reported by syzbot.
> The console additionally shows "crypt: Unknown error (-ENOMEM)"
> because this failure path sets no ti->error.
> 
> Move percpu_counter_init() to right after the allocation of cc,
> before ti->private is set and before any "goto bad" can happen.
> On failure, set ti->error and free cc directly, so that
> crypt_dtr() is only ever called with an initialized counter.
> 
> Reported-by: syzbot+4b232570d625662eaab4@syzkaller.appspotmail.com
> Closes: https://syzbot.org/bug?extid=4b232570d625662eaab4
> Fixes: 5059353df86e ("dm crypt: limit the number of allocated pages")
> Cc: stable@vger.kernel.org
> Signed-off-by: Zhao Feng <zhaofeng2@cmss.chinamobile.com>
> ---
> Not runtime-tested (the syzbot report has no reproducer; the
> failure requires percpu_counter_init() to fail).  The affected
> crypt_ctr() code is identical in current upstream master, so the
> patch applies there as-is.  The Fixes hash was verified against
> the upstream commit that introduced both the init call in
> crypt_ctr() and the teardown in crypt_dtr().
> 
>  drivers/md/dm-crypt.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/md/dm-crypt.c b/drivers/md/dm-crypt.c
> index 1ff16b8264..3e69dcc366 100644
> --- a/drivers/md/dm-crypt.c
> +++ b/drivers/md/dm-crypt.c
> @@ -3249,6 +3249,14 @@ static int crypt_ctr(struct dm_target *ti, unsigned int argc, char **argv)
>  		ti->error = "Cannot allocate encryption context";
>  		return -ENOMEM;
>  	}
> +
> +	ret = percpu_counter_init(&cc->n_allocated_pages, 0, GFP_KERNEL);
> +	if (ret < 0) {
> +		ti->error = "Cannot initialize page counter";
> +		kfree_sensitive(cc);
> +		return ret;
> +	}
> +
>  	cc->key_size = key_size;
>  	cc->sector_size = (1 << SECTOR_SHIFT);
>  	cc->sector_shift = 0;
> @@ -3260,10 +3268,6 @@ static int crypt_ctr(struct dm_target *ti, unsigned int argc, char **argv)
>  	crypt_calculate_pages_per_client();
>  	spin_unlock(&dm_crypt_clients_lock);
>  
> -	ret = percpu_counter_init(&cc->n_allocated_pages, 0, GFP_KERNEL);
> -	if (ret < 0)
> -		goto bad;
> -
>  	/* Optional parameters need to be read before cipher constructor */
>  	if (argc > 5) {
>  		ret = crypt_ctr_optional(ti, argc - 5, &argv[5]);
> -- 
> 2.39.2
> 
> 
> 

