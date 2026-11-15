Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794757927;
	b=kmdxE38oBmWY/P8LlrHn9G9w9mfpSsvHSic+t17vVWceQdMWvBGZCbJBg/jWF167Wgze
	 yajRflR+3Ion7Yz8OJAmPfrc6M2ubTFiJpmIfgMhZRfrjwC3hWkd1FTrCbNfC6KvGm0gF
	 NXQDYx5uvBhtLkOnGjdU54MDEbD+CyyFDcTqsZrIG/d+B1stavT+2H2Z2sf0SveOgvPOW
	 AqkKblIFffh8HxwVxuq1KBYQkQ3lHR5rBy5Apc+2OHhz2mgg/S8G2VkUk/+s6nzCw0xeh
	 P6SgX7YaVEUFewcfURDg1Q/gNbojf1XBnAv1FxbJGcgQaviZyUjdrV5G4ei4hvqqiBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794757927;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Scanned-By;
	bh=9IgiEftk86Exm37bg3Zur+DbX5I2RnFSX2hzBREhK00=;
	b=TcGNNcNEDMVNPWwnAXaMeXmNdZ/4qLshwkJzepLHbEQGLacb+ntBEp4rN3xrjPEmmwAC
	 8uZgAsXV0OBAKSXYu2XSenWBsgHP/AhZXh+Ywp38wIhtButH9KfVQ4pF803WvUJKv1oOX
	 LUcpml9CDDjvw9pVJg0Tx/G28nJkovickmwTJ4FhsZCSf2Fdlb8lXVOKNqf6mhkf4x7A1
	 ur4bICqdwE46AwaUGDZprH2xjWKXDm4yp5bFLLxNJrmSOSIV8dnIx2JkBuA/ZlKBXaIXa
	 b63uYaGq3EeNQa5Rfn6c8qVPsr46hfsYSFV2+yF0A6ntUXWIl2I6FcurLZCzNaAp27A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="Q/+NoRu6";
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ED7E606A327
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 15:52:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6ED7E606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Q/+NoRu6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794757925;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9IgiEftk86Exm37bg3Zur+DbX5I2RnFSX2hzBREhK00=;
	b=Q/+NoRu6SHS59eeSAJ7sR3il2n50pvZLPi9MHmMg2RtX7XX7anjg+3t1azq6I1AYb/3qnZ
	9VRlWPydKyz+S89oYkoFETYCEDNzIXmndPK5FqNcPhVWhFb/zFZuZHOuqyDuz4M4kgWdfX
	gkmRgUJWZpj3GQ881WC+6WtZaB+bcNo=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-382-_bVS6r_UMnewo3cwi-yJVg-1; Sun,
 15 Nov 2026 10:52:01 -0500
X-MC-Unique: _bVS6r_UMnewo3cwi-yJVg-1
X-Mimecast-MFC-AGG-ID: _bVS6r_UMnewo3cwi-yJVg_1794757920
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id EE4F718004DA;
	Sun, 15 Nov 2026 15:51:59 +0000 (UTC)
Received: from [100.91.18.181] (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 78446589;
	Sun, 15 Nov 2026 15:51:58 +0000 (UTC)
Message-ID: <1f2a8f19-aecf-4c32-b6b2-36b0af6d0d06@redhat.com>
Date: Sun, 15 Nov 2026 10:51:57 -0500
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-7.4-fixes] cgroup/cpuset: Remove redundant
 WARN_ON_ONCE() in remote_cpus_update()
To: Ridong Chen <ridong.chen@linux.dev>, Tejun Heo <tj@kernel.org>,
 Johannes Weiner <hannes@cmpxchg.org>, =?UTF-8?Q?Michal_Koutn=C3=BD?=
 <mkoutny@suse.com>
Cc: cgroups@vger.kernel.org, linux-kernel@vger.kernel.org,
 Sashiko <sashiko-bot@kernel.org>, Ridong Chen <chenridong@xiaomi.com>
References: <20261114100612.1380464-1-ridong.chen@linux.dev>
Content-Language: en-US
From: Waiman Long <longman@redhat.com>
In-Reply-To: <20261114100612.1380464-1-ridong.chen@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95

On 11/14/26 5:06 AM, Ridong Chen wrote:
> From: Ridong Chen <chenridong@xiaomi.com>
>
> remote_cpus_update() warns if the CPUs to be added to a remote partition
> intersect subpartitions_cpus, and then checks the very same condition
> right below to set PERR_NOCPUS and invalidate the partition:
>
> 	WARN_ON_ONCE(cpumask_intersects(tmp->addmask, subpartitions_cpus));
> 	if (!capable(CAP_SYS_ADMIN))
> 		WRITE_ONCE(cs->prs_err, PERR_ACCESS);
> 	else if (cpumask_intersects(tmp->addmask, subpartitions_cpus) ||
> 		 cpumask_subset(top_cpuset.effective_cpus, tmp->addmask))
> 		WRITE_ONCE(cs->prs_err, PERR_NOCPUS);
>
> Sashiko reported that the warning could be triggered by a write to a
> cpuset control file, before the CAP_SYS_ADMIN check, which would panic a
> system with panic_on_warn set.
>
> The warning was added by commit 86888c7bd117 ("cgroup/cpuset: Add
> warnings to catch inconsistency in exclusive CPUs") as an assertion that
> such CPUs have been filtered out before. No way to trigger it with the
> current interfaces has been found, as these CPUs are rejected when
> cpuset.cpus.exclusive is written. But the warning is redundant, as the
> conflict is handled right below anyway.
>
> Remove the warning and rely on the PERR_NOCPUS check, the same as
> remote_partition_enable() already does for this conflict.
>
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Link: https://sashiko.dev/#/patchset/20261114083124.1340140-1-ridong.chen%40linux.dev?part=6
> Signed-off-by: Ridong Chen <chenridong@xiaomi.com>
> ---
>   kernel/cgroup/cpuset.c | 1 -
>   1 file changed, 1 deletion(-)
>
> diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
> index 7e374210c123..0be0d26c442b 100644
> --- a/kernel/cgroup/cpuset.c
> +++ b/kernel/cgroup/cpuset.c
> @@ -1833,7 +1833,6 @@ static void remote_cpus_update(struct cpuset *cs, struct cpumask *xcpus,
>   	 * left in the top cpuset.
>   	 */
>   	if (adding) {
> -		WARN_ON_ONCE(cpumask_intersects(tmp->addmask, subpartitions_cpus));
>   		if (!capable(CAP_SYS_ADMIN))
>   			WRITE_ONCE(cs->prs_err, PERR_ACCESS);
>   		else if (cpumask_intersects(tmp->addmask, subpartitions_cpus) ||
>
> base-commit: e234ed1bb82c96a5643fd70784f16cf3d72eeed3
Reviewed-by: Waiman Long <longman@redhat.com>

