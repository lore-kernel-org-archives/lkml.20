Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794859244;
	b=zE//Dnv4Ha0Vzfu6h9/S4/uomsRk5XL8gys6/Wh8SAEZzx7Os+rdQrDX2B4MTHDoErS9
	 l17128GCrnJIFZesCcRtRB2C/hQGysh5IHi+v1GEar8WI800Po2xWCiMIxm5IWKIrIZ/C
	 1Z93Zua9uibTupsJdcvpCCd3GIOUxPuSX4grShoTzUgiBj32kaXMU2zz1CbI2m4jjlK/Y
	 CIOyN9UVDTqUMrYTx8OMDUZhDobaNmLiUANqSAYIcM67/tlPq+Ap75EpLzDLwrzqJEGDs
	 5GctznQjkU66Z54WetSgQfnLMu6xynBbiiuEAxMJ2LDmU1HDTMuZo53ND/Zm56TIs+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794859244;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Date:From:To:cc:Subject:
	 In-Reply-To:Message-ID:References:MIME-Version:Content-Type:
	 X-Scanned-By;
	bh=BWD/vpvxbsY8uBbAHZokY+AV+nKje0i3PXiJI8BfHII=;
	b=Nah0551Q064c52Kl9cPjZEmZsfzvXAIVDF02osFTlBFPC3HK4/eSahkRAs3bo/wEC4uY
	 wOaoWLYPh8nHs16bY9Dqb/W5abeG0Dg1IEZj0qV51wdLqsqw1aNzVuIVuynUPXpeGTjsH
	 GcIRBS4Va35y/+pXKVbI3wEbdP2U806jrLAPeE2VXOOpnqfQCzx1jE1nqUmiQqziw9eR+
	 fdjQ8DY3expi8nApybb8QMBKX2nkCmWOMf0dVbVkuGONubWWP8R2InIEGyyYIRWG3d/77
	 f8IYHa1vTFvb3+Q5oLAczIR6YJbA1rWHfc9NcsCk6REPqlbFuVpP16ca+fywf0hCEYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=T237+y3K;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9874C606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 20:00:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9874C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=T237+y3K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794859242;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BWD/vpvxbsY8uBbAHZokY+AV+nKje0i3PXiJI8BfHII=;
	b=T237+y3KIJUeMByjK51qNPBVIItuEs1s/RPvvZv3Qy7P9nBVHOLZwMSbCIRqlozZPFtZeL
	/zlHdMCIjKuYesE0b0VtzKStEL/ZmUcU+sFBC+/2JwjyNDn5wzx//lwL2j6gApWb5A4G21
	wOCC9mMP23NKjPMwpotiSy92uJZWqaM=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-681-MIFi9gTNNBK1DT0jUeqjyA-1; Mon,
 16 Nov 2026 15:00:40 -0500
X-MC-Unique: MIFi9gTNNBK1DT0jUeqjyA-1
X-Mimecast-MFC-AGG-ID: MIFi9gTNNBK1DT0jUeqjyA_1794859239
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 896DC1955F4A;
	Mon, 16 Nov 2026 20:00:39 +0000 (UTC)
Received: from mpatocka-thinkpadx1carbongen12.rmtcz.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8C2EF3001DA7;
	Mon, 16 Nov 2026 20:00:37 +0000 (UTC)
Date: Mon, 16 Nov 2026 21:00:34 +0100 (CET)
From: Mikulas Patocka <mpatocka@redhat.com>
To: Donut Oreo Computer I <donut.oreo.computer@gmail.com>
cc: dm-devel@lists.linux.dev, Alasdair Kergon <agk@redhat.com>, 
    Mike Snitzer <snitzer@kernel.org>, 
    Benjamin Marzinski <bmarzins@redhat.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dm btree: Remove redundant index condition
In-Reply-To: <CALKjhPewyFB0=2tfyNVuDPosTAisDD2YcejTpX+0iiKRXdsGaw@mail.gmail.com>
Message-ID: <f9266fcb-d030-dd16-e16f-0569b93bf4b6@redhat.com>
References: <CALKjhPewyFB0=2tfyNVuDPosTAisDD2YcejTpX+0iiKRXdsGaw@mail.gmail.com>
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
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4



On Fri, 6 Nov 2026, Donut Oreo Computer I wrote:

> The index is unsigned, so checking whether i is non-negative is
> unnecessary.

Really?

In the caller, there is

"unsigned int level, index = -1, last_level = info->levels - 1;"

In btree_insert_raw, there is "int r, i = *index, top = 1;"

If you cast -1 to unsigned int and then cast it back to int, you get -1.

So, it doesn't seem like an obvious dead code to me.

Mikulas

> Signed-off-by: Donut Oreo Computer <donut.oreo.computer@gmail.com>
> ---
>  drivers/md/persistent-data/dm-btree.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/md/persistent-data/dm-btree.c
> b/drivers/md/persistent-data/dm-btree.c
> index dd02eee4a23c..b7ac2f6d1d71 100644
> --- a/drivers/md/persistent-data/dm-btree.c
> +++ b/drivers/md/persistent-data/dm-btree.c
> @@ -1108,7 +1108,7 @@ static int btree_insert_raw(struct shadow_spine
> *s, dm_block_t root,
>                  * see a way to do this automatically as part of the spine
>                  * op.
>                  */
> -               if (shadow_has_parent(s) && i >= 0) { /* FIXME: second
> clause unness. */
> +               if (shadow_has_parent(s)) {
>                         __le64 location =
> cpu_to_le64(dm_block_location(shadow_current(s)));
> 
>                         __dm_bless_for_disk(&location);
> --
> 2.56.0
> 

