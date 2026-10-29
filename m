Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793291803;
	b=gdNalJ3QjfxIRnj04SpjDhKanWGyY/UHc5TCvky6Aj0f+PafnztM92XG/hJ2reAEemss
	 lsI4IKhxqWNspZS407X2EHO8Wna8/fmlA6Bs2SWuyPuH2YDL1RLUB0L6K9nS4+mYIlGto
	 dbkBt6ZDkREiB0cLe9wfawIpCwSJnAwhyPEjeA47O5BovYSKwSXqPBV+ebLjq5BYY2FVy
	 y/cZwAX3eXonVSQNfm3/zZ6iO05qE3wHLkfxsow31/vwneWTTDZU/YQaVNS8pisP/1pnG
	 xVJw6PJa4lp17Ykq5+Hyo+mJTBW6GlDddwgZkA6m7em9GGHB3HblBcmNjB2jR/qHB2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793291803;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:User-Agent:
	 MIME-Version;
	bh=Xh5GwzoMNDORSahml54f6zY7X7ZcIcv/dWobqKgZ/mM=;
	b=dkmTy4rXfqUZBHvw6foUKqHk/TK7TEzX1wIUiTfuIUriqfsGUS2eNBoB1EOwfqBsU12U
	 SaK5UxqE0n71CvUJZ+Jc3e6X4j0cLlkVVIjp3SN7F7nkYtmXocs8oGbKHjkln66Wy3zDw
	 mqD+gSymBJRf2NRyP+f2+1AM4lAN+mGFEH/fyPo99gKdAMg+aqtfEukpliS52fdx0iKpJ
	 5QgWLTdAmNcf/1qtmbXcrfQxmTAwrupldhCdG83XrHMewebwu3TUsZ6bgMk6FFQWd5+ET
	 thx7xShkalxYcyrkq3lejlxNl8Z/F6eJl9p48kM/iaOQkP9bBXvsp5MLdhkFvBcIfTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YA6WUPkU;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=B9sXz07p;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98AA9606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 16:36:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98AA9606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YA6WUPkU;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=B9sXz07p
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793291801;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Xh5GwzoMNDORSahml54f6zY7X7ZcIcv/dWobqKgZ/mM=;
	b=YA6WUPkUH2VubiO6dRSVe36456q3Oo2A09tPc+b9F2Vp7t7qp6nqHtiF/FyncMiFfC/jxo
	37yBMQJejGeg9QkxqDfzS1D1UVlMlpRmovYxmbzYvyws3v//vLQ8UdZtxYM15uOv9lxlfx
	4KXXJJwrNwXzsCd/IcvuK1H/+Ty5dW0=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-552-4ihGom6gOSuEbkwwSC92-w-1; Thu, 29 Oct 2026 12:36:39 -0400
X-MC-Unique: 4ihGom6gOSuEbkwwSC92-w-1
X-Mimecast-MFC-AGG-ID: 4ihGom6gOSuEbkwwSC92-w_1793291799
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-917a7c17166so51338846d6.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793291799; x=1793896599; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Xh5GwzoMNDORSahml54f6zY7X7ZcIcv/dWobqKgZ/mM=;
        b=B9sXz07pKESqyGR7JHQOLqWP2l8Hktxn8N9gBhXQGahhdRoB5KWScnd0VlxgmJA5rF
         b42xRFTZQL2brWPazu2Uw85LcIcTWNEQMcKyXXIT4ZrWAe3e/emdJtQ1Ws5P+Af1xuJE
         WuY83zjy+vQ1QY7UC4unJqjPDKAHP9KGPAbb3j7zYsHTJJGflfrNoIgZI2du1790Gvu/
         sJ+HE4uqNlDwahpkfl6rHhtuOiNhxLeow3yeARX7K6+b8pmja5uF7O1fQcDT/Sw5aec3
         PN7LG5qGl15+qkqeSIP37HVlhChQsG8xBQVwieO3M9W9GqdflAdOdgktLhTsksxPvsOO
         LLkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793291799; x=1793896599;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xh5GwzoMNDORSahml54f6zY7X7ZcIcv/dWobqKgZ/mM=;
        b=PHOkoQq/E1saTJNl0F+iMx8u9tiIgp3GcNm4U1y5ddN7YZMDOCsad5KdAH6ZKMQMr9
         nxRgvS+qQ+OQigxOr04y/DeNBeL0BnNxpUN0x+OKqKwKm7JNzcRradfXDlvHSooIZGET
         Jj+W0U3PoGnli+nqD+9ug1eqrHYM1rX98pi1TVJIaMAOQTblh3R7XiqWD7jdswS40FfP
         f27wP4WlQ/JpT9tP2UNfmZa3/+FoE/Nw7b9ejBcLNM4ax+l+W611rUnwTDEHJ5taGABW
         T+oZZnb6JgStAi1+qWsgGmoFQH78bDxNuwCwYDGPdfFeE0S3IadzQq092uPL/6OXDXrU
         66JQ==
X-Forwarded-Encrypted: i=1; AKwUvBynEeeaLrXSP3xXxWCPESxoTx1bdK7BD+tWBH4G87Ygh5bsRhU5AZtXYaL+bV8N7ZITxszULKid0FLkI74=@vger.kernel.org
X-Gm-Message-State: AFq9FYLQyRu7j4XhxvLaDbglKZES6Wav72QWGUIOelThYejLo1Tbl0PB
	M8g4n4+BcJzcAVy8bBjtd/o7iPI3/bfRwtPIYOkmAgn41UN5qCKPE1dFCxviMbJu8Cm4uA3TlRI
	6WDCbagZqEja0OLUT15VPZOjimWpmAIyQJKzxGviaayLtEG/Ia2Sj0Y6lv42VYg5clA==
X-Gm-Gg: AYBFou3HQMXDsJQ5cuzMGDGyztcU21mS/Rs3O/f8qLeWL8MhrMvT47nqU4T9N/9HD2l
	cuXM2g45rvTTJht7xoSo/ay7QC3LJLO9w8Pm2Bs3y5n10OJMSd1KtrhuM6RxXbu2yq0Wy2GS45T
	deEZqKTDKgIZqQFZJ+97AqlE53ziR02mRmJTUH6kPXDuTHGhungG2hF9qaeRwPavdDXGWjMNnC3
	Nlq23nNW95nSayrKZkfReggU17yf5GgrxntdypsIugAfnDbd47qMEVnJ5pgYHHTRpc+EXBLoBfr
	eMKWyODGXIORym5r1Xd/cIIAClx+hbNdd3uP8910EBqJd3SiXJaOyfoyAGqKWw1f9o1CX33vBPO
	PJhvcMunTmGUmadps6VH5wH1TgPIjDtv8IeTy5/JQU+M0NIY0KRaPxfi/EMfCirU5urnzPEjl5H
	ZOq1gAUy0LB8KOpjonJRDuCYw9PBULEUQRGQFU/63d8+plCaF94MEqVKiw9ww3MA+kY80WqUU=
X-Received: by 2002:a05:6214:4609:b0:91c:7b54:b19f with SMTP id 6a1803df08f44-91c7d1ff57bmr83917696d6.45.1793291799068;
        Thu, 29 Oct 2026 09:36:39 -0700 (PDT)
X-Received: by 2002:a05:6214:4609:b0:91c:7b54:b19f with SMTP id 6a1803df08f44-91c7d1ff57bmr83917396d6.45.1793291798472;
        Thu, 29 Oct 2026 09:36:38 -0700 (PDT)
Received: from loberman-thinkpadp16gen3.rmtusma.csb ([2600:6c65:2440:d8c:aa2b:ddff:fe88:da74])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ca3131f9asm416106d6.26.2026.10.29.09.36.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 09:36:37 -0700 (PDT)
Message-ID: <8f2bf8761328abfd3ebcda9fd227fc0abff212e8.camel@redhat.com>
Subject: Re: [PATCH] scsi: qedf: Remove unesseary function call
From: Laurence Oberman <loberman@redhat.com>
To: Jesse Taube <jtaubepe@redhat.com>, "Martin K. Petersen"
	 <martin.petersen@oracle.com>
Cc: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, "James E.J.
 Bottomley" <James.Bottomley@HansenPartnership.com>, Nimal Prabudoss I
 <nprabudo@redhat.com>, 	jmeneghi@redhat.com, Nilesh Javali
 <njavali@marvell.com>, Manish Rangankar	 <mrangankar@marvell.com>,
 GR-ETH-Storage-Upstream@marvell.com
Date: Thu, 29 Oct 2026 12:36:36 -0400
In-Reply-To: <20261029160443.904468-1-jtaubepe@redhat.com>
References: <20261029160443.904468-1-jtaubepe@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44) 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Thu, 2026-10-29 at 12:04 -0400, Jesse Taube wrote:
> The result of `skb_transport_header` was unused. Calling this
> function
> warned when `skb_transport_header_was_set` returned false causing a
> panic on debug kernels.
>=20
> Signed-off-by: Jesse Taube <jtaubepe@redhat.com>
> ---
> =C2=A0drivers/scsi/qedf/qedf_main.c | 1 -
> =C2=A01 file changed, 1 deletion(-)
>=20
> diff --git a/drivers/scsi/qedf/qedf_main.c
> b/drivers/scsi/qedf/qedf_main.c
> index da429b3a4283..f2bc0ac684e0 100644
> --- a/drivers/scsi/qedf/qedf_main.c
> +++ b/drivers/scsi/qedf/qedf_main.c
> @@ -2496,7 +2496,6 @@ static void qedf_recv_frame(struct qedf_ctx
> *qedf,
> =C2=A0
> =C2=A0	/* Pull the header */
> =C2=A0	hp =3D (struct fcoe_hdr *)skb->data;
> -	fh =3D (struct fc_frame_header *) skb_transport_header(skb);
> =C2=A0	skb_pull(skb, sizeof(struct fcoe_hdr));
> =C2=A0	fr_len =3D skb->len - sizeof(struct fcoe_crc_eof);
> =C2=A0

Looks good
Reviewed-by: Laurence Oberman <loberman@redhat.com>

