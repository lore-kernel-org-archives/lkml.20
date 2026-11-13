Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794535694;
	b=kWqfXMlCdFCnzm46SwxzzN4KOHQ3Xqaz1n65WTagzfXST3pst1mOp3z1ie5g5zao+8eP
	 ednZmQ6Jh3yj28sXKIMGi6Gdg4fTEQHucBgmwL/huBK9ZfjBnVmZ4FababW53Og2UddjP
	 Rpte6hCdtve6lqaxr4y/uggrRFFq7NwjmmMf2cQujwlHi6MS7BchfAhVZJZ0wMp8erYxD
	 kd1mE6yH4k2fpapH7oUvPyTsmgPtmSMg4OhJHrH4FGDpT/OxO3SGAIftkaTl6iu7lsIy7
	 DfpqmuOn370CCW5gv5//gKpSN8a1RV9LicARoLO7sxLCZRO8bpgBTp+CEmd6WZ6FrSQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794535694;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=aNvdaJwzrU7dKbL8hglaP0KiPMauObfmKP0USfT2P2w=;
	b=uhZsI5AxzuRE8vpU002mzzvg9z7YvUjLFtr/wd7XJG2M28S2foqxJQ8yTLRZYgw7tfub
	 xOQL+SXlj5t1YQDRf/swj7WR4r9baMgkWho0mwO5UDeLZuyBiaGE6Q+qrFI3Ittttc2m/
	 2fPrmpmKp1uq6ubeZJ2wGzVbSU/suEmS9PUIb1OElT/ZXz9T1t5Ts4X+yLk645tgDPpbY
	 OiHaY8GVNefnCcClDp44nA7fhQOODWa+55KUSOqz8W2B+fCNwwSt65ikRaDwaA6bP6cUP
	 lanqWLjKB6fUxoAy3qzFKPzIXMzRCNgCnscKkaZt4S+d4az3/onZ9k5+5Mt3iQIBC0Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="klQO7//Q";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 970E4606A8A1
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 02:08:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 970E4606A8A1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=klQO7//Q
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b7bfefba55so873756a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 18:08:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794535693; cv=none;
        d=google.com; s=arc-20260327;
        b=bANnj0lKUZFEtPzVt4TxVJIWAlgT4JRBuMCH9oFe9UNbcWEcgkYTAusAEWcYjuZeeM
         KwgUfSa5OuA4auUna0yN7sIhrEhah2djTPh98IgfaKMXtvoIZkkVccM8qaB7XaqwhXBN
         hsxzDmGIOgq/Bm5F/7/HAkW28PoOdJ7JCd94RZDrqMdESpHnqO7eeZlt0PSM96ROsNwg
         l5zflhxXaSJ/1LkLaWtDjl+yFORu6MrTsFGYi+/SbEgp0Bc6EvEhceSfMz4AF4ZlSfpn
         b4LNvpLlDC04fo9ogUPt2llrtI9KFs1FghFNsqDj3bVxqKV6LCjGNaQGNoQlXVhk3FdH
         1jQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=aNvdaJwzrU7dKbL8hglaP0KiPMauObfmKP0USfT2P2w=;
        fh=u1sKYV835EsMJiFvyqAlztA6G7+lY6TSNolOOd1vWM8=;
        b=WesXDHeD9eN5LfBlZFbGb0M4X9DKHN7MDTemNlmJVdLzkNIJXV4T8eAPnGqZXQEhMm
         LJ3Vv0ppSSenWUxmEpVhx0yP1Ndbvj1ae7Obks1qIvOS46PGouKaiOpL04LDKS/pSHov
         PJvvxAbYsFyNreL1WCFDK6N4waifxsMvYOigE/qWkKBjKJ20KDg2srSDqrYbPxhM0nIA
         22aD9ohZmvyfOULmpKErmIc7mt/1iFrrLuj/4iF0n1Qiahf+PQ9HZvdbJJxROZqNt0in
         VMKL40agkwkxBaECrlJ1SNdlrR9rG+TUE4Is0HRPq3D7RHl8PFepdZjUCAOlaFFIJoZA
         kCNA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794535693; x=1795140493; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aNvdaJwzrU7dKbL8hglaP0KiPMauObfmKP0USfT2P2w=;
        b=klQO7//QtkDbV02g+GY1OMb3W1hSic4rJYk88HUuiEVnV5r3FG8JRUJwSbhV5qSD3H
         94P8F+D343ui8GrXJY04mxHXR7wzUoT143X+PFLuNOdHLlD/wDspORt0zXmfjzw4Rfxd
         9ZsjoGKCwSc7P2wgZ+mSbb3J0pe4iZ41gzBoMpkWh6H8WXjrUPN1iLp/1W+H/wjp4pEu
         eEv5gQb3IRLvhJD4mpelZiS9eY/kYinkX9ozq3pVHofOIWGBpjQtjj4+RIqgAShakbxp
         NbrKDUFqRIGjIB5DVRd/NpXdbKC8nSbem+IczdCrPWDPH0rU/D0gLNAP+gl86bjvJjA2
         symA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794535693; x=1795140493;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aNvdaJwzrU7dKbL8hglaP0KiPMauObfmKP0USfT2P2w=;
        b=yHvqsL5tr4CGCQ7G6MXi1mG6WpYLegfJy0i9Feqzo4lCZS79Tiisrt9Sltjnx9n9Nf
         xswD3BIDaWOCT/Z9jokeLx8glH4s8qAc94ls0VybTM645JParj0KNq4z5bBJBsUzyaH8
         wfbkgYzw1U5GRKbWp4DNFLnfZYqwU3Qee0oPzokvUILQKntxDNY1Tm2aseJqrkjysedn
         6crX+NzVyc3YayNV0opus0mMvRDXmvw1AfhFgeIEkVrNv3arQpm4Fa7idnNiWf8vnLg4
         vJVG5zwDli+Qonmq2h445A1iku/+QLyrKX3Xh03LXsuLhrC1eG6dgWc/JG/MW8OGAR58
         IRzQ==
X-Forwarded-Encrypted: i=1; AL+hErHOx1ioJPqzOyHAJBAAUVtI8U7dh9+UP7esbEu7SHfNYzsddnVy3l/efVbNfe6yKe2jylfkPjtQkliwtg8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9hO1rmfNM0MGVHvZ9CRTemT34aemRQHRpwrtLwS/7SE273hHRp
	TayUJlSoKi9vyHY4OtMCcAJxyaZvTc0gNxJov8QiNkgaoJ71/qUdxoHY2TgbNDmPHHlOBAbUIjF
	kCOPw39PJCNcMkxY7Qn3jO94nGg19r+8=
X-Gm-Gg: AYBFou1tvt23/noy2vcksj9ZEtzT1jfkF36zMKMwU4PrPkFFnFhCSFv0AUOgqnMZK6p
	eYWnxXJLvgbgwSrxHrkrryTE3q7tFgCo//bD3aS5AIcxeiOAr3weMja9k9sCmBsc0GAfrlKwgcZ
	2wW6hIBKCOh1qdOqy0zjC6gYW3hDp5B9mZE08LbmyffJ9Wcp1PCOe26f+NnZurJgzIwzK+BH2tH
	Ax/HRX2HZKZgqaP5QQZmqfqD/zUB2JgxSWOweEASaMaYvP3WTSUV7nxzkUFjl8fGhAyhk1Z8Sdm
	mUEIVHhEGQ9b0hyRM8ePJPoOy2ro8F5ePVuEH3/infJAV8/qaIQiaDm1wdIOusddXwESgXZxw5U
	2V52JDC/qrSeFkpQviLS2ChDcTL0d3g+VuUGCq1I1P8df7GtvyCI8BFUEBPSYXALQkbp4ZwI=
X-Received: by 2002:a05:6402:1f82:b0:6b4:21f6:ff48 with SMTP id
 4fb4d7f45d1cf-6b7c08adce2mr1021917a12.3.1794535692714; Thu, 12 Nov 2026
 18:08:12 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112-powervr-sgx-v1-0-c69b84bac011@telaak.dev> <20261112-powervr-sgx-v1-2-c69b84bac011@telaak.dev>
In-Reply-To: <20261112-powervr-sgx-v1-2-c69b84bac011@telaak.dev>
From: Gabriel Gama <operatingsystemsdepression@gmail.com>
Date: Thu, 12 Nov 2026 23:08:01 -0300
X-Gm-Features: AclHuK_17nK0vdrM7hFH-08XQ5C2OxqtJhKel7UqIVpBLviQdlvTl_RWXYPiYVU
Message-ID: <CAFGNeagBWpdG7a9A-c6WRiPsd4oPXcWai9o=xnkZDyY+axcniw@mail.gmail.com>
Subject: Re: [PATCH RFC 02/13] drm/gma500: Publish the Cedarview SGX as an
 auxiliary device
To: Joseph Telaak <joseph@telaak.dev>
Cc: dri-devel@lists.freedesktop.org, 
	Patrik Jakobsson <patrik.r.jakobsson@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Alessio Belle <alessio.belle@imgtec.com>, Luigi Santivetti <luigi.santivetti@imgtec.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	imagination@lists.freedesktop.org, Frank Binns <frank.binns@imgtec.com>, 
	Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>, 
	Philipp Stanner <phasta@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Joseph, I noticed that gma_sgx_set_irq_handler() updates sgx_data
before publishing the new handler pointer.
During unregister, could an in-flight IRQ still be using the previous
handler while sgx_data is being changed?
Would it make sense to clear the handler first, call
synchronize_irq(), and only then clear sgx_data?

Otherwise, the auxiliary-device approach looks interesting, especially
for keeping the display and render responsibilities separate

ty,
gabriel
