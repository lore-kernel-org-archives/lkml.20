Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793944950;
	b=zoHIZHSoybbmOzYGoqL6jArezUC5HJsuESHjVzESqdBjHN+S2gVcKQmtwol/4lNM0ESb
	 IqhT14tm5ctZBh79LTYnckikoFYXbyLHfP9ZaQSAcrHOG8WM7+T/q0iYGfwqo8Qqu8HGV
	 LKuhf0BXnMZxTY0YxIhlpjYeYUrEkU8tY8gEgchd8fSwU6CZqUvDbRg5s8fVnROpVSqEG
	 YXatjFh1TIo2vhV+cq7h+yWAd3fEeToOw5lI2j1Iyq9hGhZhLWPP5uOkA7Xr7u+qbmU+i
	 N+ZAO3iki4DRn96+OvBDY79LxPJufOh3tshHPUqrdXgbnbPOLQ4xJRkoarlXfL6yz7g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793944950;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=upxm4MPlU7N3NfgqAJOH0IPRX5g3aVwXiEtIrdH4MTo=;
	b=wZeckBWf8yOmkAUegjVK30f1URjd5ZRDx2VhxmrJnkgaardGlPfunZa9hOq7Yta9QzoB
	 vEcTkQE5FQswCh0eiIEaesCPvGKPl4WjW2iL26eBCjE9zXJCNh4HMclyyXzpebC0F1fYg
	 ldz+o5FjRdwajKrG5bnZbC5U8xYV8aBmliNhK6Bi75ck8aRzu0tpsqGXEBfEvg4JRc1lc
	 0FQ0E0SepFvjrbUqZTQF6HOGiQ2GMk4P2T+cX/ovSSJr55vtzG7g7+LSU+8p/5WeFomgz
	 EVpuGTMxkOKUN05vudcXjTZSGULi94ouvk/OjvUIeLKsAKBtZhoARKAwgZycsZNgC5Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MU217h2+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01504606A329
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 06:02:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01504606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MU217h2+
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c40f29667e6so39087866b.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 22:02:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793944948; cv=none;
        d=google.com; s=arc-20260327;
        b=U07iFxZxPYPZQTL+Vfe1GwTFQ9ptvJAw7x23gZ70H1iATp/0aLZ5BXzWbvkk8d7FNo
         aEl4qiOgQx2y0cRVA6/C5NZ0zaGM5dK/c4SUEgZ3KyMG2RKrsCGYe8LJ2OdKV5X54M8b
         oXzMtGCk2IrusiLpbsOAEheTzT5imbmiPqdzDqzNc3y98nRAFduBi9LEYPu3zXq/HWMM
         QnvL5gGJPLzWFbx6DvP4Qzaq0A6R6K/rJpz9ING0gl3Obskh+ZJkjkGWoeyHikGm+o6e
         T1OgzY+KqFJlrlIYV2nT35/2MjSBIzwLXdPNnlls7pPcHbXSZ8Olj1WVUSKzMmpWpQ2y
         S1eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=upxm4MPlU7N3NfgqAJOH0IPRX5g3aVwXiEtIrdH4MTo=;
        fh=1n39forGTrysttHVdseFr72URV6BFVs3GpnNWcOji7g=;
        b=qLR8Tse2Cq1b9FQggx8iO4mLPnFkZw+T9w74k4aW6oH3P8GvdgtmY5ryEs/JlJt9iA
         uGXcA2DiNVHCXN4ykoVXq2XVWuZAShbdnAcEHrJ88N2K9APfcIKLbDiGnf32GmdE09eD
         VCz3m815vJQ3+ZqEOTnHPo1ucTc9A1WE89qOkIQdK9Dt9GWj/q67ztjZ44Z2V9WE4cd7
         YKAl5F7QELsHeZjBMM2Gz1H96ZQ7XAF77+pt4ZsSs6/tNDRsNYfwQn1sX5qUqgq+0D7t
         ByQYBA1NGVZISsK6twkYsI/H9pDe/BgKKX02aOytGUcFyPgRm8SI/1sg0tqQg70+QufR
         GMuQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793944948; x=1794549748; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=upxm4MPlU7N3NfgqAJOH0IPRX5g3aVwXiEtIrdH4MTo=;
        b=MU217h2+0eERrqYba0rrf3WXQN92LuCzTp6j7sdlJu+GYLO/kCkie1ZHHu9k9lrgZp
         CKKnTMQfLQs5kiyXAfxCxwfvnBZXPVAFqPHSxoGpdKUE3ZOt0kpMnXkBn/uaf+FwTTu0
         BG5QSdusCxDz45pvQAkbgGTw7ondU7W7b9OxYbF1ZXSWe9yP4urk/zgYauxOQ5upl0IN
         a7cxcQJNl9iPjiPPJwL8T2v2nDl/Iug8czBx2fOKeMNd3OsUUK5jDN9v7UarVZvUjxoN
         wSBPLDyG8antoD6ihod1LeQD0yK97xnwSDBWzaCLiEbaH6U0MRXfIsBF2jEr7T/Y2npW
         cp1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793944948; x=1794549748;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=upxm4MPlU7N3NfgqAJOH0IPRX5g3aVwXiEtIrdH4MTo=;
        b=cQUJOHbsHTnt5uvnQnB1RKaX02JRG6ClxgOr/CDvzt3Cj8sToYyGbaKqLVmq6N7m2a
         2oHAGq6gm7T4XOSzVQiUyQdhG5wCc97uyapn+vUidz2fsO8dZykpAnix0tmbXCkBoPRr
         kqYZPVXr+XRfEigIHTR7njmcK8O96OnudewJpkfDBZmMgYh1xXIJFpfH0p+vqebS1dla
         tX65W1WXr5Zf82pSKT6JZPfm8Gd8lSNJkZbfpN2R8OOZN3eVfy0CFYgzUI0tIZCHfgzp
         ME+V0LR0Oz0oJdMH2Pd8AhQVtueggf32HNtR31HS0wCjB0QeMn4kmZ3fIuPCrI7VpEIt
         8AdA==
X-Forwarded-Encrypted: i=1; AKwUvBycVkkvemb2BXlhb7lMLMIgfkIINxFPwJgk5AMgUMWAyPw8EjMkY6KAcddMuPaZ/vO2C7X53osEhkVkRGw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/eAOqZWOvSB+ueoy4aBddu2VpSjcd/9d0Lg51OvfH2NmqK5SaH
	sV2CqJdEPcnmHiwyoW4EqSkjo8Rve3EhAcgQ6hv2lj86X3Dm/VWlrIMf/Lnq1sJ2a0Q8zxnwC7o
	WubbuTtSF3lMvNB8ae2Ktn6EokJCW+1I=
X-Gm-Gg: AYBFou3nTmsTMjkInrV1uldA/ole0jhtX4nuV0ToJ3606vPCAWvrIMXUkMUlvfBNTXt
	C7lOdI1UOOaW3PjUt6JM2b5H2Ah4H65YbrIV9xummP1CH3HagiYht6TcGPnU/s9WnMfgc5oCbAW
	hfHWXQUyrTQawdlczABojeOFNAKsVRXUK8/u2P9lpBN+UBOOgDVpBvlh8tmFCO/tkD+ml8HSP1t
	kCoCGKeKwRCmT7moJ61dRKYChHvjBE0o12u6VL6D7n0Xpgx9XnBlFlhD10PcQY5E5QjJTyAPctV
	SRaAl8poNNGGSQYP4Wug/gLnPsGNJibV100QD+CUSNvvE84/UbxL2QKG0uxhjX6XK2Xuah10WHd
	llDQuoN0WIQ3y6sZlDNBSqCW35G1QEGBN103n7oH9UYqOSmgXZj6ELxupaLY9iMcjC7GA
X-Received: by 2002:a17:907:7b9e:b0:c42:4750:8d33 with SMTP id
 a640c23a62f3a-c4d355354efmr132932866b.28.1793944948293; Thu, 05 Nov 2026
 22:02:28 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105193426.2999631-1-stjepan.poljak@gmail.com> <20261105144316-mutt-send-email-mst@kernel.org>
In-Reply-To: <20261105144316-mutt-send-email-mst@kernel.org>
From: Stjepan Poljak <stjepan.poljak@gmail.com>
Date: Fri, 6 Nov 2026 07:02:16 +0100
X-Gm-Features: AclHuK-YNzSXRW1RHjomN8YIUKv427RnMYB6bCZCxyhE73XOJIrYBtMyz-mjos8
Message-ID: <CAKVkeTxfwL9vFx_AFgevsQ1Kg0=DE9aSPYTcw8ZuyejhE+w7ng@mail.gmail.com>
Subject: Re: [PATCH] virtio_ring: return an error pointer from vring_create_virtqueue()
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Jason Wang <jasowangio@gmail.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
	=?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
	Richard Weinberger <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Cornelia Huck <cohuck@redhat.com>, 
	Halil Pasic <pasic@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Alexander Graf <graf@amazon.com>, virtualization@lists.linux.dev, 
	linux-um@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 8:43=E2=80=AFPM Michael S. Tsirkin <mst@redhat.com> =
wrote:
>
> not how you ae supposed to attribute LLM use.
>

Sorry about that. I've sent the v2 with corrected LLM disclosure as
"Assisted-by": https://lore.kernel.org/virtualization/20261106055635.301988=
9-1-stjepan.poljak@gmail.com/T/#u

Thank you,
Stjepan Poljak
