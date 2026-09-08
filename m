Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66271394797
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 07:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788851986; cv=none; b=RxALjD/433vi54Gde6RTYKZdIKBAKmSz5KrZAzM3luWijxE/YxPTOoCbkPRtc7yWsxSHL3k0hOo40/kCaDboYIbnBrSFF9i08r7kVGh24ZArqLQjoFh2v5fPweOL87Qtkxw45U8EzOAk7ND3uSBeukG7021ty4oSq200tJ69ZjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788851986; c=relaxed/simple;
	bh=cB5vGEzXCWOej9U56bH7r2afRVTc9aUEK2BeCbcmu2o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=F/URGo9Kbn+UDDAtWt5pVygdMTMjZIwp6dxonDmAHshO3vNjMoceYqrdD3gd5kRjYrNaTLyu9Zm80iP0vvFMnKrJ6SV+UgFvlDWa2U+gsbbogAPxruVOyzKNqU/2MLlWGxZTVYjr7WVb3U73nlGf+1Dda6qHPYdxkrfA8Ofw1gQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AO2KQ32o; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=csL/24Y3; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AO2KQ32o";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="csL/24Y3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788851984;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PJerBhWmN70q2A8Z21gwtlh6e4xQWjvU+KQeKRQlFIU=;
	b=AO2KQ32odW6f6cJ+S8j3kS7ZsZtJ1w7941Q4sNRcvNIavnDGhCrors9KrmXftAnzALLpQt
	gRKa3Q3rHdpjSokQVlDrDlkcQqKhtN5ytx5R4FO7C1tjgI+dU/Xpoz21tAIar7LVzFiIvo
	OpvYlT8cuCFCAunME2Hxj3eth2bFZNs=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-223-LF4hBdb4OAGlJoNAx5KVQQ-1; Tue, 08 Sep 2026 03:19:40 -0400
X-MC-Unique: LF4hBdb4OAGlJoNAx5KVQQ-1
X-Mimecast-MFC-AGG-ID: LF4hBdb4OAGlJoNAx5KVQQ_1788851979
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-47f4bff865cso2448845f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 00:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788851979; x=1789456779; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PJerBhWmN70q2A8Z21gwtlh6e4xQWjvU+KQeKRQlFIU=;
        b=csL/24Y3lc7to/wL5MBkz3uBVY6WlhnYbApMGwJanDkR+ekR9PHReo1opgNsLRn1px
         B+94C1WLVAZQEyC6q9j73J3lM7I4LwJBfSNETEoMcSQ5BOn6F/c8NV6r6L34hb7MohjL
         X4EXmwjUsq4BA/c66cWz/P7uMDv6S/iMLt6eh0jAoBGpdBWsbnqYYTlK2d29t45/CS84
         DXk1LEqChVWKGzQ6QjkZpUyqJjRvu4IlKkjhiyIcvdrbytSMNKZyH/nnWpkdNsK/G79z
         r4sAQXdkEhAXQU0xQcydT9ggq9b/z8dkxQzbH1D62SXtzAEGWIIVzkjwYZPC6Q2982zs
         +A/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788851979; x=1789456779;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PJerBhWmN70q2A8Z21gwtlh6e4xQWjvU+KQeKRQlFIU=;
        b=iERqcsz3buyW1oqNa6TymAuGS2mqFSpy47qzPyYGn8qdyL5r619XVhvo2fTmt4C/T5
         qwOzA2OxX9yHBYJIZDUFWE7njvslNX3jHH7jwp/y7fe9w8V/95dexc0faOpGJgWDh+eN
         ucD63TSQHr9jhxwpyPkEvCt1YQ0U4Ph7Xc5ceNIEnjtOCUEGqO4TjksKIfxaoWi71WMy
         izCAYpFTLd0zlJNzmjvOiEyq9DHWqXKQjX5z9nceBjCIPrKw16IPIP1He/ctXIwd0lX+
         vDgzB2spR7D16BAuFxdAdOzQdKurWoSG7Hq86V/RQ/SlM1yjNpBE6hInjiNqa46niL/2
         1sqw==
X-Forwarded-Encrypted: i=1; AKwUvBwqoNTE8NynpZq9ZbEA1qsWYDZqHDbtFUcqbE+T+WBvYP2dt7U0jPcgf6MQ97qKR23QZPnGVJAkeDmX7MA=@vger.kernel.org
X-Gm-Message-State: AFuF++knJHa/axxRyYDGv4Xoz9pjJL7FVpLhV150FSsxYXLoGm/UwRtX
	yVfUfokAA+hMAoU5s8jI6aQs0MHCYfjgbMvzRgyCByoqSf6Dn8c9EYkeJ/n2dgcHcfxicW++VUp
	VXxNgnj87Q26EatAIK7HhhGDY5UduMsulDUEBv8RsT+thnZHAt9pFnlrqX85Hs8Jhnw==
X-Gm-Gg: AYBFou1l6O9uWTR0E09ouFq4T1JPCsj9tmufRNXGIgBkkOByCeo2I/i3WGr0oNJ/zgQ
	/M1j3BLKDPV8coPe0aoZrD7PDWucR9B0ewEJVQCwBrx6aLk6HhuxjlEiMmz2qTSv83B3gk04y2N
	hkPOuB982W7Attyzbd4JK56zq8VlIyQWcwM0kpFYfY8qUzaITdF4ElIbzvbaC0rvlt5B106Sdul
	9t5TMEYSpiJgdD12tlcVSmF7Qs0bDL3oaKCixQPuOy+Q/QguNsliLsbIr8xAR/+C7qzvt3eHwYc
	yxcAVz+fg9j4CrkYjoJHXmtfYJAPYQUrivhh0KbuJ95x7shjIc31rknkxkf/kwXFwqiv6L/EWV3
	9Z6kr1ilXHIwWnfJy1Rp1y6EFFCRklNuuJHLm9Be2sWSISKGB/Vni
X-Received: by 2002:a05:600c:1c29:b0:49d:5ff:f408 with SMTP id 5b1f17b1804b1-49d05fff5bbmr284794625e9.15.1788851979082;
        Tue, 08 Sep 2026 00:19:39 -0700 (PDT)
X-Received: by 2002:a05:600c:1c29:b0:49d:5ff:f408 with SMTP id 5b1f17b1804b1-49d05fff5bbmr284793925e9.15.1788851978584;
        Tue, 08 Sep 2026 00:19:38 -0700 (PDT)
Received: from [100.90.169.165] (5920ab7b.static.cust.trined.nl. [89.32.171.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d057f4778sm269094115e9.8.2026.09.08.00.19.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 00:19:37 -0700 (PDT)
From: Eelco Chaudron <echaudro@redhat.com>
To: Norbert Szetei <norbert@doyensec.com>
Cc: netdev@vger.kernel.org, Aaron Conole <aconole@redhat.com>,
 Ilya Maximets <i.maximets@ovn.org>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 dev@openvswitch.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] net: openvswitch: fix use-after-free of the flow
 table mask array
Date: Tue, 08 Sep 2026 09:19:36 +0200
X-Mailer: MailMate (3.0r7030)
Message-ID: <FD8A4D46-E107-455C-8F3F-0F52D3CBAA74@redhat.com>
In-Reply-To: <DE115F9C-2545-423E-A702-986FC952FD62@doyensec.com>
References: <DE115F9C-2545-423E-A702-986FC952FD62@doyensec.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-MS-Reactions: disallow



On 6 Sep 2026, at 10:21, Norbert Szetei wrote:

> tbl_mask_array_realloc() retires the old mask_array before it stops bei=
ng
> reachable:
>
> 	old =3D ovsl_dereference(tbl->mask_array);
> 	if (old) {
> 		...
> 		call_rcu(&old->rcu, mask_array_rcu_cb);
> 	}
>
> 	rcu_assign_pointer(tbl->mask_array, new);
>
> call_rcu() only waits for read-side critical sections already in flight=
=2E
> tbl->mask_array still points at old between the call_rcu() and the
> rcu_assign_pointer(), so a reader entering ovs_flow_tbl_lookup_stats() =
in
> that window picks up old in a fresh critical section that the pending
> grace period does not cover.
>
> tbl_mask_array_realloc() runs in process context under ovs_mutex, so th=
e
> window is preemptible and can outlast the grace period. Then
> mask_array_rcu_cb() frees old before the swap runs:
>
>   BUG: KASAN: slab-use-after-free in flow_lookup.constprop.0+0x2bf/0x2f=
0
>   Read of size 8 at addr ffff888020b3e018 by task poc/741
>    flow_lookup.constprop.0+0x2bf/0x2f0
>    ovs_flow_tbl_lookup_stats+0x4a3/0x5c0
>    ovs_dp_process_packet+0x19c/0x710
>    ovs_vport_receive+0x243/0x390
>    internal_dev_xmit+0x81/0x170
>   Freed by task 728:
>    kfree+0x16a/0x4e0
>    rcu_core+0x853/0x1030
>
> Publish the new array before retiring the old one. The kfree_rcu() that=

> call_rcu() replaced ran after the swap.
>
> Fixes: eac87c413bf9 ("net: openvswitch: reorder masks array based on us=
age")
> Cc: stable@vger.kernel.org
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Norbert Szetei <norbert@doyensec.com>
> ---

Changes look good to me. Although not really necessary, I did run all the=
 kernel userspace tests, and they pass.

Acked-by: Eelco Chaudron echaudro@redhat.com

