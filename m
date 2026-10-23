Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792777028;
	b=BC6cP8SsrQg/TdREfy0sPgcHqzbnXyBqCZ5UhYOhLS9xB7B61VZLHaSCd/uR344Q1cDz
	 7hcg+tgnz7P3t6qDA7pQXEX80D2EeA/0tdMRWfKEeGi3sH65Jota6cFp2sMPWD2T7nb0f
	 CZUHaCkqTnKJCD0d17yaBjJGAjasEiawLi7kfIvtX8ihaFIIUpFrWBEOOvTEKrPLz0Ref
	 HXHXgFfxmeZmbkJvnByogV/vFRhDDoAm68THNQ7s/bJxSwmH3hgY+aNpRhU19zpXRFwED
	 PIop2XV4sQYzQVm10jmc/j2+9Vg9ixbKZWW7JWt0PdDJhYCkd68kwfXsJ9VDwUy302g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792777028;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:User-Agent:
	 MIME-Version;
	bh=Ahv8hek+EvAXMKlXCTALJglEGd0QFHOYDAP+RILIW24=;
	b=XxlZAc8L5O88LgOFGhpq2oHZtYhcjN6lNYy+tQovMjphKlvYi1W579pzExzbCXbHpMtF
	 2B2s7OTFdhbRJHRwT+BzNEdPd5/8joL3fmZawbmCBGYusUrciJfaYAG9ipPTKLemxE6lo
	 Sns1q4UPFZ/U8Qvt42wIoM8fkv/eDP3Dl0YjF2v4UWDoVCF/E97QfeBEXPtsMfAs2XJQc
	 OLRn4p/4GiWocdj5xZ+dl0cnA3DmFbKAt+Z2HHF1lQbUJMaJAMx+lRGgKefJUgT+d5YlF
	 yDA17pi5v675VQc37ddZrWH+Dr3DWElrH3rE4HMlOmiowHCfgcaBihcLsJOm4DG/g7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HNbZZg9z;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=JicNh2Nh;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4799606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 17:37:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4799606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HNbZZg9z;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=JicNh2Nh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792777027;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ahv8hek+EvAXMKlXCTALJglEGd0QFHOYDAP+RILIW24=;
	b=HNbZZg9zmGXI9nHrpG1HHsIIjfAj4VjT+muTf1O3WrhY9HWdO2N0xs3nXeAUBIXy5M2Rpz
	Ap+1o1JsJ2ApeukhM+KRYwnxcCQOoXFT/+7Rx6RTb9pSiuzKcq2K9IFwM7+stYzfrzQnWh
	axmv6Fm2m5bfgPefu3PgNwzGcgGTKmE=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-436-AgtZ67HsPRGcQvBDilgmPQ-1; Fri, 23 Oct 2026 13:36:59 -0400
X-MC-Unique: AgtZ67HsPRGcQvBDilgmPQ-1
X-Mimecast-MFC-AGG-ID: AgtZ67HsPRGcQvBDilgmPQ_1792777019
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5352436cd78so4257701cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792777019; x=1793381819; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Ahv8hek+EvAXMKlXCTALJglEGd0QFHOYDAP+RILIW24=;
        b=JicNh2NhM+bKqjfVJxtTDyhDIfJgYLdNUjZ5zqhe+edMq2OmfAgFtlKCFG+vNETJ8z
         3rX/VDQVLyZ46UeSllkvbid2D9dNPM8OFah48hRSUKbjGC1aIroWp5KE+2PBLRYHBFpo
         +J09gN9+Z1C4ZBBr91u9tr3Mkfd0SeIFT2GDQWGVysGqtWYMbKJGi9Ksua1VOPUkHDCZ
         eX03l3QwsEuKqCC515rSmjBYxNy1+1bOlMFBZc/gPvrwObEyq2LtpKWMvcRP8zIPqxwF
         GOUwemyNg90HAl8jCIXGZpKguyRSA+va9xj0Vv5qPw2oTGVX3wxsVdfhQ4FBzRjEnpbe
         JSjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792777019; x=1793381819;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ahv8hek+EvAXMKlXCTALJglEGd0QFHOYDAP+RILIW24=;
        b=fEmc1aLyU282AzteuKDphIPNHaPTLsta5Tb9Q4CkUvsj4WAJolWoW2S6PiPrmPXWyM
         GepXnMWFv//uFpcL+RmqWnaj8o0ACKWGF5+2hqIHtkfr+I9IUEelnXqSK1cHw8JuigbF
         HY48RYb4xQy/pEMBXYXXsNV8XkeQwMXEAT4Q4XPNhZHxDnAExJ+qWxlKMqgO2oP3q8Je
         pgA/a+Mle/CRc2sNifMCHOxkttDbc9yXM+5kquI5Ebf/LyVKRysW7w3EXCJxMJ25t1Lu
         eV0uZ61Z2WKUQPlKuIURj2s4EB703mwoqOePEpYOz9PIg+ysfLFU9K9h4j8NkZMJ/jDd
         Xowg==
X-Forwarded-Encrypted: i=1; AKwUvByWodmFWPqOI9HGsVWogWLQ5cs7x/RI9qdvISO7YcxvZS42CwRxPtmgDCDgNoBaMor41h8dtvcczU57Umg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIWKX+LT1hUpg8OPgjt11U/CpI3efoHDJCXFl1ynkgcntdsSNP9
	ZF+jVhJyZcqW59flBcazGL8GLRtteW7OlzGfWSqrBaj9FI73+WUlb4KVbnMFCYWzSz3jjTteiAk
	Qfv3G1JPmTZ8fbBvOgRmlg8WkgZt28OBVCDtEdv3P90tKzeoW8Ue6XHk7wSSjN+yHfA==
X-Gm-Gg: AYBFou1IWoxhb7KJPOFRi3PqCPCaCvxCOhdDZw3uEckYo0kgYte3eIOm738hbAwgLkj
	/YXnWt1Afoz3ZkloFgbdMK9jvmV/AietkMkGZfD4C9V/qC7a1Uv3XQkS2Ik52MzIXSYeLS+9nW+
	F600zvkMBnmw+Gd1+Aap15JYdfxGNdHo+giXXk7Ks2kQY/2QxmiLjdIfLARtTpF5eMw2EKwqYxK
	ywdwI/P8BUQA4RU7RXob6T4i6ji5fx83dfoHsr9F3tYHpabfcVfoRAbhnoce+ZGf7YxftRkgnFE
	/i4yvEXl9NU7zhUfwqEhPgwX+YLEII5ENGWP2kAsnK3mHMnYHQqz3N5YTHBlY7lWoCiXbAw=
X-Received: by 2002:a05:622a:5b97:b0:532:f0a2:ef4 with SMTP id d75a77b69052e-536c25f7a86mr39840431cf.26.1792777018682;
        Fri, 23 Oct 2026 10:36:58 -0700 (PDT)
X-Received: by 2002:a05:622a:5b97:b0:532:f0a2:ef4 with SMTP id d75a77b69052e-536c25f7a86mr39839981cf.26.1792777018044;
        Fri, 23 Oct 2026 10:36:58 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53836c4c71fsm2658041cf.25.2026.10.23.10.36.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:36:56 -0700 (PDT)
Message-ID: <04409702791cbc2519355d2291ae9db5f4e44339.camel@redhat.com>
Subject: Re: [PATCH] docs: remove Assisted-by reference
From: lyude@redhat.com
To: Troy Benjegerdes <hozer@hozed.org>
Cc: Jori Koolstra <jkoolstra@xs4all.nl>, Kees Cook <kees@kernel.org>, Randy
 Dunlap <rdunlap@infradead.org>, Sasha Levin <sashal@kernel.org>,
 corbet@lwn.net, 	skhan@linuxfoundation.org, federico.vaga@vaga.pv.it,
 apw@canonical.com, 	joe@perches.com, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, 	linux-kernel@vger.kernel.org
Date: Fri, 23 Oct 2026 13:36:55 -0400
In-Reply-To: <atoNuurgxrKV4aid@false>
References: <20261009083137.3-1-sashal@kernel.org>
	 <202610122124.08E058768D@keescook>
	 <ea3ff257-70e2-43e4-aba7-140e84994872@infradead.org>
	 <202610130120.E43D236E@keescook> <as4gLo_6acb_zZu0@daedalus>
	 <4a55a48948a1f01686b0471307b6fc2d52be7896.camel@redhat.com>
	 <atoNuurgxrKV4aid@false>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-2.fc43) 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Thu, 2026-10-22 at 13:20 +0000, Troy Benjegerdes wrote:
>=20
>=20
> This is why I'd like to know *which* LLM I'm dealing with, so at
> least
> if the human is not paying attention, maybe the LLM developers will
> care
> enough to provision a large enough context window to actually retain
> the
> critique.

I have to be honest: if the human is not paying attention, it is the
same as a contributor repeatedly sending patches and not responding to
patch reviews in any meaningful way. I don't see any reason why
maintainers should be responsible for carrying the patch the rest of
the way, this falls straight into slop territory and goes even further
into "if I see someone repeatedly doing this with their submissions the
chance of me actually looking over any of them goes down dramatically".

Also, it's not like it gets the critique anyway. Whether or not it
follows it is up to chance.

