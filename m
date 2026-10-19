Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792421653;
	b=FVut/64oWnam+Y9bL+FnQWyt+UiXUP5HsZeFR9lmvYM4wOosdQMvfD2iM4sHpzInPRLK
	 RDDN8x5SVc6V1gTOUh1aICvrOoAL6x/1v6rXVTUT7N/qVLHaBC5A4Zp90KFYzkf3N9jG1
	 1Ct/AxnFug3MY2sme5ZOU0yPBzYNinJoeIHM5NQCRYTSyL87F1u+qt/v2/WZTkBX5KO/g
	 Dm0VCJGVnob/YX4WwGvLLBJgiDN5OSiy4cf6A+7Rl5qYuBsXQQjAyy6aocplO+GI0rBPU
	 YhAi3rMmdK7V13OYJ9CJkuNqtlCSaiAR9Sf9ncFpbkcscoMpe5GkvA7/KhSWfG9Hxwg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792421653;
	h=Received:DKIM-Signature:Received:X-MC-Unique:X-Mimecast-MFC-AGG-ID:
	 Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:
	 Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=LA9yLlWDsUw4mAlFrb8iNJ8Iy8siUyde3QGxANbXUgc=;
	b=wFNEFwQj1rpfay6H2d7b6BSL37/i//5DMloNMB88ZzVPqRFNdS5PLYJDx0tnlmkT+ZAj
	 OlKDjNGbqVz7nJhdQrRFqBBdRXBDmPZCWF42JXoPzCDIoUcA8dmM6sTn4+PEJa4Esasfk
	 j0rUdif2w0Je1WRm3kJI1Sz5l51lIOXXNaTblRg3LuxA+PDghItVx+y9rIkZbNRFmR4XD
	 lOL4LbjYvpQ6bTW7TI+26TtZwcjUGzaM1E8CyHGxw6MLYfUjG/EsPSJXWFIM+gLCxyrmJ
	 z/M7duexvdo6eAr5MFEVOzEdWRhxoh5AnRMFLRe5k8YGcm+JdHLdMZt1W6tfu0y2Tug==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UvtLynSd;
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
Received: from aws-us-west-2-korg-listserv-1.web.codeaurora.org (ip-10-30-226-211.us-west-2.compute.internal [10.30.226.211])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 587C6606DA4A
	for <linux-kernel.vger.kernel.org@localhost.mlmmj>; Mon, 19 Oct 2026 14:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UvtLynSd
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF1947D95F
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792421653; cv=none; b=kPEYdFh3nxyJl79FGJKeIhZfNVSWTGBoMzE9yI0OIg9Saht+UiEeqeVInRldsRslLz2FlE00J+YFZ59pF/syBY7npNhlBwHNIMW/BjKpufCdAvHMJha7AlGHmnAUtdQsdKKPfu5e1/kz5J+Cdsf8m1r+UAqagFV6lCkkZE9X5Bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792421653; c=relaxed/simple;
	bh=f/SGXW3zS8s9qfLrgBkvDJ+xdVjRbBYrPEPmubUH4Ko=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Slpn0TrxU4Ax55jZ0E5EVo1IrDhyrGibztutQ87AkJ8Hn65F+Eskjmv9dmb5CrZ9+HushdzT5wJ1vw5qT7RY1V+5EZG94c9rTUzyYLtDYpOCvvCpvhMV7QTDVETEpGHUcIYbok0tHWhZuKynb8tYXEYKNpNLf/FGjio2I51HOU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UvtLynSd; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792421650;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LA9yLlWDsUw4mAlFrb8iNJ8Iy8siUyde3QGxANbXUgc=;
	b=UvtLynSdU2e0dyCiWhqmESnUtFzGg1EQGqE2wVPoGifBwpchOVjwLwyL5iZr3EwmwoF6g6
	jFz/EOgQEYObmfe/kPQ3wKMJ2CedbxYeQJVpiTXTS2Q9pXYeCxlzVV3iIIVLN6dXB4zLNE
	c/DD7O0taz/Xveaf3DPRZsS6J6wjZ5w=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-58-BFeS7YMuPXOJqu7Wckh88g-1; Mon,
 19 Oct 2026 14:54:00 +0000
X-MC-Unique: BFeS7YMuPXOJqu7Wckh88g-1
X-Mimecast-MFC-AGG-ID: BFeS7YMuPXOJqu7Wckh88g_1792421637
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A9A5A195399B;
	Mon, 19 Oct 2026 14:53:46 +0000 (UTC)
Received: from [100.91.18.181] (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 07778410;
	Mon, 19 Oct 2026 14:53:42 +0000 (UTC)
Message-ID: <1bae2a1a-e4fd-4f11-94e3-c9ff9b37a399@redhat.com>
Date: Mon, 19 Oct 2026 10:53:41 -0400
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
Subject: Re: [PATCH 2/2] cgroup/cpuset: use mems_allowed_seq when checking a
 policy nodemask
To: "Gregory Price (Meta)" <gourry@gourry.net>, linux-mm@kvack.org,
 cgroups@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, kernel-team@meta.com,
 ridong.chen@linux.dev, tj@kernel.org, hannes@cmpxchg.org, mkoutny@suse.com,
 akpm@linux-foundation.org, vbabka@kernel.org, surenb@google.com,
 mhocko@suse.com, brendan.jackman@linux.dev, ziy@nvidia.com,
 david@kernel.org, mgorman@techsingularity.net
References: <20261014222456.2318284-1-gourry@gourry.net>
 <20261014222456.2318284-3-gourry@gourry.net>
Content-Language: en-US
From: Waiman Long <longman@redhat.com>
In-Reply-To: <20261014222456.2318284-3-gourry@gourry.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95

On 10/14/26 6:24 PM, Gregory Price (Meta) wrote:
> A cpuset update changes the task's mems_allowed and rebinds its
> mempolicy in separate steps under mems_allowed_seq, but the check
> reads both without it.  This can cause a spurious numa placement
> miss under some cpuset/mempolicy combinations.
>
> A reader that loads one mask before the update and the other after
> it can see a spurious empty intersection and drop the nodemask.
>
> For example, a task with cpuset.mems={0} and MPOL_BIND={0}.  If the
> cpuset moves to mems={1,2}, the policy is rebound to {1}.
>
> The allocator can race and compare the old mems_allowed {0} against
> the new policy {1} - which will result in a dropped nodemask and a
> misplaced allocation on node 2.
>
> Simply retry the intersection until mems_allowed_seq is stable.
>
> This covers the task policy, which is rebound under mems_allowed_seq.
> VMA policies are rebound afterwards by mpol_rebind_mm(), outside
> mems_allowed_seq, and are not covered by this change.
>
> Fixes: cc9a6c877661 ("cpuset: mm: reduce large amounts of memory barrier related damage v3")
> Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
> ---
>   kernel/cgroup/cpuset.c | 13 ++++++++++++-
>   1 file changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
> index 3f52717c19654..8ee239d5c6b48 100644
> --- a/kernel/cgroup/cpuset.c
> +++ b/kernel/cgroup/cpuset.c
> @@ -4354,10 +4354,21 @@ nodemask_t cpuset_mems_allowed(struct task_struct *tsk)
>    * @nodemask: the nodemask to be checked
>    *
>    * Are any of the nodes in the nodemask allowed in current->mems_allowed?
> + *
> + * A cpuset update rebinds the task's mempolicy and changes mems_allowed in
> + * separate steps, so retry if an update raced with the check.
>    */
>   int cpuset_nodemask_valid_mems_allowed(const nodemask_t *nodemask)
>   {
> -	return nodes_intersects(*nodemask, current->mems_allowed);
> +	unsigned int seq;
> +	int ret;
> +
> +	do {
> +		seq = read_mems_allowed_begin();
> +		ret = nodes_intersects(*nodemask, current->mems_allowed);
> +	} while (read_mems_allowed_retry(seq));
> +
> +	return ret;
>   }
>   
>   /*
Reviewed-by: Waiman Long <longman@redhat.com>

