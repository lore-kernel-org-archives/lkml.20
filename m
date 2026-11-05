Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793905143;
	b=S8dTwW0NKMV8J/O5PLQOmh6fYQl1Tpv2cGBg0sE/aM/UXIP6YETw84pk6DBo/mpWNTZN
	 bhink39oa7gCsuHyE4JRwVLPeQbT0z++zM2LSK6oBPrnMNHtPCX7wu3uFd5iNJxmt4Ea8
	 lOTvnVarLz/7LbXJYKJEnORg1tDLjdW0zF9KwKS9/AI5+OChJpRfw7YhQ3qqF71+hpIze
	 9KvSRak61fziwXjoEGLmpoC1WHwv9/glC3ADmttiJuXRCxQZ5e+aTi71WRjX0P0mNf/Ob
	 rVq/ZNez042lOR5vDk2XfEIksvOQnWCIvE+110ddqN+c+71yB9Snryf/+atCq87YlKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793905143;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:User-Agent:
	 MIME-Version;
	bh=GtVJ5fDzJs7dwdJ7kQ13zFePN7w2DrejpnY2Ytkrdiw=;
	b=0l8hl/dYabLYzZh7D4sIsfwGuisAE/2olx/tc3C0Hu2RCjPHhjRQxeuT/fmoTjCUSOVI
	 Mjj/wVgjuntdecXauCe9bx9AOy+dR/x665UWBpdkPRQezEPO5vso80APqO4Kg5YBuMbzC
	 X2k4kAn3qZ495tiDbV+3QG5H6eEOcGQRghrjjekAzt/t4uCa9svzSEj46JOlYreFmf151
	 O1xT0bM3vU8Tr926lgqMcJtkxlJV4KZAA5fxGhcrRNNdsjRh4DfaiO21m9tsHn+0wgHAz
	 afyutBt9No+I7wHwhkLP6lObEfSSAtMx2gM3+wrcjLP0MyA0EnsiPHC7EofrZt9fcQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DLycYrth;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=L6B5jDV+;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59536606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 18:59:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59536606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DLycYrth;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=L6B5jDV+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793905142;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GtVJ5fDzJs7dwdJ7kQ13zFePN7w2DrejpnY2Ytkrdiw=;
	b=DLycYrthOKqS3R3zYxK2muqHFBISPvgO4v38GTHXpzYpF6mhFL5dSE108rxcXAzhvrWEQP
	pfTBNZmanqSEuoiVkQdtEJUMcmKe1DWAOuZqJRfGo7eP4f+9TO0FM6GiaEO/YpyOs0voNM
	Tvm6zrFyS6wbBiwQX4HEWCqOPyFjU/I=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-335--NNLpO90NBeUgy7sJFOX0g-1; Thu, 05 Nov 2026 13:59:01 -0500
X-MC-Unique: -NNLpO90NBeUgy7sJFOX0g-1
X-Mimecast-MFC-AGG-ID: -NNLpO90NBeUgy7sJFOX0g_1793905140
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-8b2fb1f981fso34077537b3.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 10:59:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793905140; x=1794509940; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=GtVJ5fDzJs7dwdJ7kQ13zFePN7w2DrejpnY2Ytkrdiw=;
        b=L6B5jDV+fhmnDVZIKwO414AEnkdbC1y9UlWdyY1sY+9FXLp/OIb2pRQKxf8LxNGfqR
         GKsAe/hXDkpUfK5VNDRnXJmryWsxw4i3rPhyfLYDkfBXhj8qJMkwvLyJt0DDza48mJ5p
         7nDNabYytCLVRcEqiofEIXUIxj0yjn7JU/ecb9LxCxFmzdp0rvHikgCwEepns6xLUfey
         OPTw0xywPSbGwfIwQ3LaAQk27GwQ7KyzZGgqezX16MuU6g46/LL70JH6hhPbA7h1f2JX
         HkBXVHFq0TsHZ8t3xZRAC0rr4L0d8gymrARfhz3q5ZCa+ogTQAiTSR5nuFSLHCcGJRdq
         tYlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793905140; x=1794509940;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GtVJ5fDzJs7dwdJ7kQ13zFePN7w2DrejpnY2Ytkrdiw=;
        b=mLeBzqouQf0F0gtsRQGSJSJCbg9Z9jWTk3EWfVmfgbKabZ++dlvK5xGXUTYnIdJhhu
         8KbPwVcqCmgQvnKLWjeHL8jKCFq8V7HuDOKwJXEX1WO0JNZSCcN0BPTDKM6QJKN0XZaK
         +1yrUmSmeiJTExIVIUH0fo3Cy6ni4CKKHMsbNad7eVR0Qdd/G4nv6gem+dLX7sUMSySv
         W4pyOdzqHKjR0BDjDv8xj1wHHOwA8FCAQAXkDPSOKfcEW5OcMk/nBQcXmgd/opjFVmTd
         2pvI84hv1ZwvEtsRvI7YmR2mSX1GlvEiyN61AJE1fhrBTGX2iiIPWQdEX1+sBRJRudUC
         cKOA==
X-Forwarded-Encrypted: i=1; AL+hErFgfbrPaM4wg63AoBo8IqbN8XZuZ4RcYiPpmuVuP6b1Vu63I8UIDItIhjYVE4/kKKzIknEEvTQJU3XW0uo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8BsuegfG056ohceVtzgsgZUVoVIcKU8FtTetxk1U2ziJEPMvvx
	+WO4wtOI07AGwd/W9p1yR9e8Awd0lBUX32o6TfH+kvI+HW9Ua6D5jBWNKb2fHLh+IwG8OcZ+B74
	JKDubtgOKDqqzhB/N2JWquO3jUScZ5Zl6y6g7THMDBZ5RizN3liJ/cKBWj4CBU2bC0844JkoJvQ
	==
X-Gm-Gg: AYBFou20fReZ7007NpeGZE47stf1vEwPESqjn4bqizpmc2RrFIZP8YZ5fE9E+yoFvxV
	q5QKELXB3JzKUByFGh+GaPy6nykjwMz7hOr82qbzvi0NEYjakXTHVWKTYsuzJZr67IbeeRgxzpe
	BQFJsEfAG1mHRRj225xum8FokpcLgshKUrkZW6BJYjzrxOaunwUjX9rcDHyQebTPpriL2Y0B3cd
	TMFJLn3uYUwDQ61L/xUUXNR5dCXxetT19VeA19b05tQQBzsxhtshz+/BOtPw6ndsL5JoEK5bYoO
	4bAWiRBeOD4TYZ7c2ng/UU4nTZWveKJXy41AzcyoWlSv1u/4nP/ZGOBgjv+ET+U8d/f9e59luOr
	Wl1xSNfbBUP5eOFXVVPmw7tWSpNjisWi5gfhOT4rxejCDORbNFHJFPk07NmEAxbkFUga5A/IRHc
	dOLSWZnGhj1eeZDJ4zPXryMoN4Kq1tY/rJ7MDMxw6VhUy0cP+m/vkFGTr9Tjrl94Eud+3nQDw=
X-Received: by 2002:a53:bd83:0:b0:679:887f:a2bf with SMTP id 956f58d0204a3-67c142c35eamr78962d50.36.1793905140290;
        Thu, 05 Nov 2026 10:59:00 -0800 (PST)
X-Received: by 2002:a53:bd83:0:b0:679:887f:a2bf with SMTP id 956f58d0204a3-67c142c35eamr78942d50.36.1793905139634;
        Thu, 05 Nov 2026 10:58:59 -0800 (PST)
Received: from loberman-thinkpadp16gen3.rmtusma.csb ([2600:6c65:2440:d8c:aa2b:ddff:fe88:da74])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67c135e8d5esm242675d50.19.2026.11.05.10.58.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 10:58:58 -0800 (PST)
Message-ID: <7dccd24b8dc18be694ffca063cd4c13655ff1c9a.camel@redhat.com>
Subject: Re: [PATCH 1/2] target: iblock: drop the dead kmap() NULL check
From: Laurence Oberman <loberman@redhat.com>
To: shao.mingyin@zte.com.cn, mkp@kernel.org, linux-scsi@vger.kernel.org, 
	target-devel@vger.kernel.org
Cc: James.Bottomley@HansenPartnership.com, linux-kernel@vger.kernel.org
Date: Thu, 05 Nov 2026 13:58:57 -0500
In-Reply-To: <20261105193351820CRZfBnzFE8zZm2DrNx0T_@zte.com.cn>
References: 
	20261105193346452uAUQ3LtGtsQ_d_O9gjAw5@zte.com.cn <20261105193351820CRZfBnzFE8zZm2DrNx0T_@zte.com.cn>
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

On Thu, 2026-11-05 at 19:33 +0800, shao.mingyin@zte.com.cn wrote:
> From: Shao Mingyin <shao.mingyin@zte.com.cn>
>=20
> kmap() never returns NULL, so the check after it is dead code.
>=20
> No functional change.
>=20
> Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
> ---
> diff --git a/drivers/target/target_core_iblock.c
> b/drivers/target/target_core_iblock.c
> index ea65d39fef88..604fca959f2e 100644
> --- a/drivers/target/target_core_iblock.c
> +++ b/drivers/target/target_core_iblock.c
> @@ -461,8 +461,6 @@ iblock_execute_zero_out(struct block_device
> *bdev, struct se_cmd *cmd)
> =C2=A0	int ret;
> =C2=A0
> =C2=A0	buf =3D kmap(sg_page(sg)) + sg->offset;
> -	if (!buf)
> -		return TCM_LOGICAL_UNIT_COMMUNICATION_FAILURE;
> =C2=A0	/*
> =C2=A0	 * Fall back to block_execute_write_same() slow-path if
> =C2=A0	 * incoming WRITE_SAME payload does not contain zeros.

Looks good.
Reviewed-by: Laurence Oberman <loberman@redhat.com>

