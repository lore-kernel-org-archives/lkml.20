Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793251036;
	b=ffSIMwIuaLUsFq+Y/oho3MonYDmJi4MqBd+Z9Hvjuwpl3xuJg6sl5nsY84chqm+eVw7P
	 9oJdEr0ZAqqQUUpmjRQfjJYyeMC0eZouHcmHcIyKljWk+FObVDQ+Ytq9dksA3hPcQTm6Q
	 3R+5mxiMRSJ6fRq/U3N6XbSwkc79jL3RQJbHceqB49197ad3qzPmWc3H56drAuvjvjZtm
	 zBFbJBF3ntUYx2jiVydS4sWJJou0R8r7gotpw8UjGETwcOMXWyFzHhFq4o19xe5SQrPOQ
	 ZGt8nsOVAE+EGqaYDpSbFditPa0VxOM1QziYl0ntDjVNP8iIyzQ61H5BICTrcouG45w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793251036;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=zS6jG1ivlI4v7YRYbvRdu0UguaFFk8Sw22mlkI7ZM6w=;
	b=tbnVrfRfjdgA/7CqajfcTP1MMx5jrItTJ+rd7Wff3xxvCExICQI4Z1URVcKX388hVf9m
	 s+JU2HXnQpmqSkraRB+fADSJEj/Dn3zPdIoOt+cjb1vsUlfSmOPl4ogwszu998+rrSIud
	 JSFZv46ry8BQKd3Kd9ldAlEhIHgD0htD6mUHyoI9O71/ERM1ALkYiDDCPOAfTg5ZPhkay
	 o9S2MeZA9Bm5XVWM7lZV8Dbc+1weoUkD8fBmknv/OCqSPWBjElUzcIvGWuUWKe6rapCZ1
	 eTepfFLFA2VJH94rBqjFl5QQeW0Wakq/McoD28nleA3EnMVo71KTuC+KpRmvc4D6RYA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fDKBazgh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18F54606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 05:17:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18F54606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fDKBazgh
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c3f04e0e65fso295259666b.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 22:17:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793251034; cv=none;
        d=google.com; s=arc-20260327;
        b=FCGxaXF3ESC+s4AQBGtJw9mOu5xZdZOef53M9K2aGKgz/K8L1EUqAlQsfeN6wgnjvB
         EYTi6wc1IC8rLVQjGIvMrjLrgnKbSslBzH+sj5jd1Lv7ArzluKvCrYS69b2M0DuSvGY1
         piFBhma11FJb2FqGWpo5fyT9k+AuazeURZDNilZwOc8QJRUPcSAO5y4lBL8TT0rUE+ih
         0UJHM51Tz+FeD/nxr56UGbj6DUYodV3/3Uksm1QpS6XHrAg+KmI5UehqsfhD29/d+ev8
         G25DpYE79vyFkOOOh0rms9k0YfXcgdbYX3L8VHRue58uFvdOm4d/nobbiwTSgXRo+2aj
         ZFSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=zS6jG1ivlI4v7YRYbvRdu0UguaFFk8Sw22mlkI7ZM6w=;
        fh=QmTzUr9vqukNgq5a/T3lJF/oKPMqiwWeKAOQOn8ljZk=;
        b=nu59fNBQAgGNU+BHKmbKqQ0pEr0Ub6P/VSLo13utl966cTMHhYUChZb1YAZRtoLgwY
         1S2eezTTRvp2rhJNntSRpQmrQPWG7yxtHNmiVQI9OkSzo82jJfpci8ebfzTCF1juEihf
         juDjZhdd+nAURzfuTSoBMfXnC8tlem9TfDKw0GCfhOuQEwSgyIiQAUUJjxSJCCiJeFfC
         IELQl54TmNGWm27uC/KVmVVaaJaDgLU32rUkkOU3HaoEKRUH9+4rkoiY9QWCX+vJ7JdH
         V7a02UTqioBg2xcLVQLC/6kHm6lbrCDSC/QC/UyjymboVWeAsHFP6ioh+u2/OatdEyYC
         GU7g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793251034; x=1793855834; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zS6jG1ivlI4v7YRYbvRdu0UguaFFk8Sw22mlkI7ZM6w=;
        b=fDKBazghu3akkEMeb64q0IByekzNETir+cHGx0sv6gp7ljiKtzdoZDEskoYBNZYQkT
         9feBPNl7AHbkJxez8nf8AEyu31YkD93vUN6Uh+6XVdOCwCeaBxhh58HMTdjPp4fVBy93
         BRqtPG5YThNsY+pqwqvDIJp+Op48vwKk9aT5r6YjW+KqXliNSOmkurEB0135vwpyUbqk
         la4b6fxfsvDv8UtjPsKWKC+OZ91eIByOeI8ykwJm8uV2BRLmUphN2nvjOhSgifRkiAC4
         wCTV62nRWVnn+6RDyKBhsNrgnF9VBGceycLOLfCDIJDIWX+bXkRGSgF5Y5RLMQgMOB4A
         bfEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793251034; x=1793855834;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zS6jG1ivlI4v7YRYbvRdu0UguaFFk8Sw22mlkI7ZM6w=;
        b=MhjHhE2hfZwX1IM45phZsHajggqtWASFzqrEHkiVkDxiEzrDCk2zF/PSRmCrN1JuDt
         EGo80rcvKsHZrb2VQBDnKXRKWuzFy1PgUhoYdkteRurDBlnIQJGWJKGpM6n68OLUrhgu
         7Gaj1jtjCPfrmhnwq6zxqBvrmtY+e1xhiRkn0qOD773k3q51cK+S8w+XmhzPidIv3vbT
         XLxE4FISsPrO+Qqj9KU7GaWGsxo0kxv6u6cn5FUSHuKecUa6MuLi4K8WBANXphgkb+cl
         tDIpgurjEJtAJrnouHkYPnvFUhKb27KbQWCZY4YaatM1nZHwaUaNs8u64SyQElJIlnEX
         jykA==
X-Forwarded-Encrypted: i=1; AKwUvBz+Lo6g5PR7yCmkW5kxhlQUWMby2an6DvRgkw+DKHrCwLHkpXMEDsSQNULGtqelCbFxz6bJrdU5dP8hlZQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJaQ3N3ExUeLcjVJiQp590pRWUEWpAoaDCw23E+nOaONJ5LZX9c
	5+eI6NB37Gu+ERA0BDt5l2uYx3ZcCnOrQfWbqrcsJb1WLEGAj1+KykUHAiKY2iwZqY3Ke0ds0G/
	9OAjqqciANJ3FP8xc/PprTtyzzL6S4N4=
X-Gm-Gg: AYBFou2oNBV8ErFPcfQm/VEqhQcm0fAMZFolJBUEqkU8r4AV/vTB8u12GnWJ6D8FIew
	4j0PDFyY4wtKWDIaGnBjBCBf762/sdwAu9n1Ik3b2xbOlLcyDCHsCuGvM4/XxusdSkFJdhxJzmp
	kVN9wc9H0xjhW5cARULhhajnpT/6O/2PA9o6zQMMB35hTsxSJRaeyJawRDn5JUsTctf5cTnK0Ip
	6PN1ct5altgLsJTQME6DV9xPRSr+6yE/p4l6088VFY6f2PiqK3hhztIRt7imXvTLKE1NiBFVa+7
	OrUOTd0mkgpS2TWXo1S1H1pkRQxdUY9D7BYkAMSKJIjT5PBJny0xYRxwEt2ce4jYQh4DXZA/LhM
	xqRn5uZl2qSJyyjkhyvtZ742bLc4qOQzMWtqrqVC6XTnt+Fg+zNtDUDoDVVmlnv2diLlg0iAeea
	an2q1rYnTfT5Cxca4=
X-Received: by 2002:a17:907:9c05:b0:c29:63f2:99bb with SMTP id
 a640c23a62f3a-c49be064d35mr374194066b.47.1793251034232; Wed, 28 Oct 2026
 22:17:14 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023223533.686085-1-christian.aurichzm@gmail.com> <eeaabd5c-7df2-41fa-8f43-69c8d4853e7c@windriver.com>
In-Reply-To: <eeaabd5c-7df2-41fa-8f43-69c8d4853e7c@windriver.com>
From: Christian Aurich Zanettini Martins <christian.aurichzm@gmail.com>
Date: Thu, 29 Oct 2026 02:17:02 -0300
X-Gm-Features: AclHuK_JpQDUONBjla1Ai0oyorNTPqTGvEsrW1NB8qXMSIX3h6B5CLZay4px1WQ
Message-ID: <CAPDkpGqDt+ibYUfnkXzsOWB-KSnMctZkEFyVWGXmwO=UTwh=9g@mail.gmail.com>
Subject: Re: [PATCH] fs/ntfs3: fix double ni_unlock() in ntfs_readdir()
To: "Zhou, Yun" <yun.zhou@windriver.com>
Cc: almaz.alexandrovich@paragon-software.com, ntfs3@lists.linux.dev, 
	linux-kernel@vger.kernel.org, 
	syzbot+5c0ed4f2974a8b100ed4@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"

On 10/29/26 11:25, Zhou, Yun wrote:
> The issue is caused by a conflict between two patches from different
> time periods.

Thanks, you're right. I'll send a v2 with the commit message fixed.

I'll keep the Fixes tag on your commit (7a5aa6c45072 after the rebase),
since that's where the bug first shows up in the tree.
