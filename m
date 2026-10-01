Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D1173BB677
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 23:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790896287; cv=pass; b=QtssbCaudfp3iLhmmJ4XbqvnafYaatDCFgIwLQ4ZXDdSJ07bT5YDm548rxqTis40BpL7DTBxVRp7FuKxJ+yTEqkV0js8u9qm69ICCr4WgbWV6Z12ArRF2fbgYJpH220MKBPndgGo+hjjBSFHgjXzHXdnR+UeUsp9a7nARwpmk88=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790896287; c=relaxed/simple;
	bh=4Nb1L9U4YfwNkyfWFRjbEZ8/q2Pq0SGn9d6+3u74spM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h157JecpXDQ63wTgihYDzoVeym540Y3sX/mmH59Dgc2uy4lDNAp/gtspVBuyMdGyhzOUiNWWq9u1/RRjOQ8wPkeq63b8YVlwMP/ej6Mxta4nGXEqgJvyeF8cOyRJ+LT7oSqKnduvt8bvHN2DLBWItawy/XhcQFRrRDrdzctI10Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Xt1B567I; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Wa2MUxmo; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Xt1B567I";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Wa2MUxmo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790896282;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4Nb1L9U4YfwNkyfWFRjbEZ8/q2Pq0SGn9d6+3u74spM=;
	b=Xt1B567Ij8yNv3xYfWogjK+OHHVGH6fIgBx2dISAgzVbyN/lsOEwxS0H8DdlaqfWLJT1Ga
	V7wChZEM01wjON1FkeXLnY/C6QGkLmi7+sgUOOkYY7rOFU7+pX/LvU+Q7MGsqYyogU2H26
	k0MGrEmuc3MiePZczGd1cLDi72mfFXc=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-326-T76MyY0IMBa0bRn0TnuMgA-1; Thu, 01 Oct 2026 19:11:21 -0400
X-MC-Unique: T76MyY0IMBa0bRn0TnuMgA-1
X-Mimecast-MFC-AGG-ID: T76MyY0IMBa0bRn0TnuMgA_1790896280
Received: by mail-lj1-f200.google.com with SMTP id 38308e7fff4ca-3a782da8ce7so8938721fa.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 16:11:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790896280; cv=none;
        d=google.com; s=arc-20260327;
        b=HHrp863wWFf/YgITzi3xsBqQyguNBGsVkKH+I/e8pEzhZBuGq0qCpsBKSlxZm0qerr
         vtGv3y9CBe5g9badjoMaw7ZZSDc7NpU8P6lqjInmdRfk8iZEnVabaT4PdSzsTRP87irZ
         iBKZy2EAaIvzi+WwgO1jozrlnI1uthdeL3sA8qj/twqY31L51GjWlCicYJ4sEm8LOcgQ
         rLExUB8Fufxn65/SIL4m5y9/vau4DOj/+ElFR5uwjkMS0a4WCVUhCX26gSFq/SJgM6l1
         0xPhIR3N7369gTmFoLCceGuDwa80B5P8WF35cFwNkNoJjljIRKwEMPYaj10xgnFyRX+6
         RAQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4Nb1L9U4YfwNkyfWFRjbEZ8/q2Pq0SGn9d6+3u74spM=;
        fh=g5lkSu0TjlPIgrvBgcmqzcQxnHxiAAXX1M1o+qaRsAc=;
        b=lyF7JS6tZ++fV7Qe5Lkszg7uWaQm49PH8UvdkEGoXWEUyV8gonbRmYEoeT9BPH9grH
         zA1RtCsZwcnuo0e0h9aSvdlb54RM6GXPUtQM8LMBGxz/dbbMB1TaxNnbX1xQCyTc+0J1
         Y3vKBgg7vwlGtEcmz+Szf+E7+5gxATz7sAYkcrvtWabIANoWGWimdu3RDkV/h269lZL0
         BcF9fUh1wTSHLQFVBhIf8q5xhUqEyJ7xEecuYpuO9yEpFj4cRm/C0aYnMpRcRd2JjG7x
         358C6UInJJ8zY0bKXQGlqwivRDy7Pz266I/kRIqdOfq3u7n1vMwzZBdMhMORwcyhNcZP
         8r0g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790896280; x=1791501080; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4Nb1L9U4YfwNkyfWFRjbEZ8/q2Pq0SGn9d6+3u74spM=;
        b=Wa2MUxmoHqQeaWkqEaIG76ImK0a0iitDkUWU0gydq36wiDqpkTTFyOwCZRceRrMCz5
         fEy+h5SnoZ0O4NWU7ipO9KLrc8Fc5gRDuncBQOL1Rl3xP3oz8AZm6ogzO0CosR0lkguJ
         C6z+JkID/M3jn9KIcwbG44B+gmqdE/pGlsv85IxT7S3ZPip4XibEBtYmrBOuuytUaLqx
         9/c1MObiTIONuOyvkv7Q5FT8SzgTU3zmdPivAgi5xwwxZ3K7fjFrOwcXRH6lGzbG51ev
         DmAiJnNxlHGXDPPh9pdu5ma2033IAGOGEvxRfTVgd7Tvo50nPnSScZcbYDNm6oaQLcGt
         XjlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790896280; x=1791501080;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4Nb1L9U4YfwNkyfWFRjbEZ8/q2Pq0SGn9d6+3u74spM=;
        b=R6mLH1+quoLhl4Rf/W4XlEZjeDZXw68UV7ns+cLzCU7fymCZ+L36CJAuWVaN+0vbVb
         22psz/omrENpbxWIPfTTAKdvAyOi4llZDB9fYw4iLLQubuGJw+f7Zj135/GqmX7Zo67S
         F3vpg3q+GLR1WGjXuImhfqOfx2k5tkCr03cxXRSm91dH/GQiYNDjNOGM9J6t1DgiLItP
         c4io6d5pqwSwu6RtQWiVUJohhrv2ZPz48j0iJCqfyx8vSv7X6t+ZjFj5rcgsnXwa7H/2
         a9LP7g/QOauFf1DUdSsyFiJaL0qCzpJi8oZTAlgyRmdbznfq3/YvqTOEh91xuhvyJ1RB
         4lJA==
X-Forwarded-Encrypted: i=1; AKwUvBzsG0+cBO5360Y6faMiS09F7ATMXwRKANiXq8Ce83iqCyVo3Yd1wxAJCmgWSZuP6K5k+AQZl597y5lCjTk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKLqSwcaMGk+vLFRTCHV6dYJoVCEPVGYLdQByC9ZyFnz7laQwX7
	LLGQkcpP/Es06dHoeDD1KH4w1ncmrGeCpX0OHCR7o/tcycZrRbu/PZMYpJ3wtYBwTH+1zWYqC9W
	cEDgyUOxEW6jC6heiJ1Cxf9ZCYViBoHCxrzkygiTcdTU0/L9Dzzl/c8odv0S5eo920t8h3vOJ50
	6xJzO49SvXBWX4v0szNYJBsEUR4qxAUxQVTSWZVU2K
X-Gm-Gg: AYBFou1KBvLnqFUaFgDvpOpSsbZkgvBKa+fR0IBJvbDhWGS07mbg0O61xdl2sYO5ImR
	aZDlIckQoOwlVsRzjvDG758AMMjKS9vwh3YpTWBX9MMvpu+LfnrJ0Srdq69AUyDMA0Jsd5IidPr
	DKIs/vgP40kRoMNqsk08cW+9JfsKO/kehSutZZ/6FBjPHZJt/MLGRoF6qE
X-Received: by 2002:a2e:8a9c:0:b0:3a7:8294:caac with SMTP id 38308e7fff4ca-3a8828d995fmr1606231fa.3.1790896279786;
        Thu, 01 Oct 2026 16:11:19 -0700 (PDT)
X-Received: by 2002:a2e:8a9c:0:b0:3a7:8294:caac with SMTP id
 38308e7fff4ca-3a8828d995fmr1606171fa.3.1790896279429; Thu, 01 Oct 2026
 16:11:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ar4BZ26gjQEjZgIa@stanley.mountain>
In-Reply-To: <ar4BZ26gjQEjZgIa@stanley.mountain>
From: Alexander Aring <aahringo@redhat.com>
Date: Thu, 1 Oct 2026 19:11:08 -0400
X-Gm-Features: AclHuK_ZIZU9AoOcMzsszikhvoplml_bm1WdOkYBM7Pkh36bT-GWQFKoCy-TOGc
Message-ID: <CAK-6q+is-tnpfGqiNCj-SyHYAKfe4ZYQH15=c_rqOy7pkgCoTw@mail.gmail.com>
Subject: Re: [PATCH] dlm: clean up a type in waiters_read()
To: Dan Carpenter <error27@gmail.com>
Cc: David Teigland <teigland@redhat.com>, gfs2@lists.linux.dev, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Oct 1, 2026 at 2:45=E2=80=AFAM Dan Carpenter <error27@gmail.com> wr=
ote:
>
> This doesn't affect runtime but "rv" stores error codes and so
> declare it as ssize_t instead of size_t.
>
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Acked-by: Alexander Aring <aahringo@redhat.com>

- Alex

