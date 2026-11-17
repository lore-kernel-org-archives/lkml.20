Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.129.124
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794933733;
	b=cgL2DeVSKJUYbyToKJaEUMOXfcZG7LmE8aYhK2TG+vaAhaqHgvIOo4Dss8prkJcT7sPt
	 eUO8K0sER+CKv2nx6x1eiVTPSwapvVKBfUihMstMamJY3CocTz4sMMV8AaA6gS75XM3JV
	 kxIotkmNSe1IZkHDU7C0nzYbU2QHYWJlaTa4qj/y+MN71BiciNllEBioF6bnmJZLFa8kS
	 BLcsQUlnnLzo7MhJ+CyTpvkjU1SCTPMXX7LsbF2LVXb4DmL7pQHBnFw7fRYABo7Xq7ISb
	 r/catN4P5Bp8MmcEbSskE1J0Wg0+4poIaHvjfW6pBPsMiwO3F3ZyApVjeiApDqeGZPQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794933733;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=PDP3cyiEiUUbsLZojQrUFbDLGHRXcHrl8qd/n4GWkaA=;
	b=YXX6rXGytyTJq1mFIB/lc4f7ReORyC6fi5jQVmfvCtwneAHMruyL/C4FRzUWz2OOq48u
	 l5HIAoZbZQ+ZFWhkHxevWsuV7HNAtU0CkyQM/bejot9ZXyn+Mq7AtLWdASg26vswlVmDL
	 TY+tcX3P9ivsyaydVD7rBTHX7vH3kZ1TsTxZX4O3Ld38KnBj4A2b3NlDBqhC4qxJHiiLq
	 T4cdYx7k9PkqWhVh4j0FGynUMXFA5ONF/VMA8qMmj6EGEiH0f9gMQQQBxA4oGQRigG8nV
	 W7YKtGCcMN/7Nie7Of3apt7SHDVVwiu0vzMhH5nXvZ3Lw13XQnZX2bRIk2IliqTNHJA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ipp1bo2m;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=MbaPRpYF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB839606A33D
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 16:42:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB839606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ipp1bo2m;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=MbaPRpYF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794933731;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PDP3cyiEiUUbsLZojQrUFbDLGHRXcHrl8qd/n4GWkaA=;
	b=ipp1bo2mjs9ngr/RuxqrizCMEIY/b5IgJPtX3YKTgEhEaCmZwQWgYDzyZewFQDllZf4DAG
	BapHpMkP8LJHEgbSb/xMKg0WerF1LPdNbu+oCSKFfyYhRJVGwsmqMGNsHnu6myMbsOthq1
	pRl1Tlto6Fld20hpgbQrKNLcTUxNiM4=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-611-TL8eVPy_MPW_F29FOBA8WQ-1; Tue, 17 Nov 2026 11:42:10 -0500
X-MC-Unique: TL8eVPy_MPW_F29FOBA8WQ-1
X-Mimecast-MFC-AGG-ID: TL8eVPy_MPW_F29FOBA8WQ_1794933729
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b3b4208826so696626a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:42:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794933729; cv=none;
        d=google.com; s=arc-20260327;
        b=NkAcF1XtUR8Y//0BabFmP2CluawwzP0JJ9jsgCZwB+6O7lv+xxgq4O3DShSjnyS1or
         MWlCOim4rh3Ni1OG31dM9+Bq+Jh6543RrDww9kNSdMpFW9q+HQnnwkXkSTGgtW7qNBXK
         v+4nNXi0fIEnX3JdOKB59htnbE6IUuN0aMvTndk0Q9yxTC15w9Eep9O3Ecx+CzU93ein
         7ae8OrQHobQE9UsrQtReMVQW72nl41ux3a28qAzAd1J6UX5frxFrFO/XX5Gui/Dv4cAT
         vNILeLqfVpY6Jg7vNURy2tCLbjI5ldeS7uEvF1a7LAPC3pq2uG03kTfxmw3NpvOWrBiM
         g/Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PDP3cyiEiUUbsLZojQrUFbDLGHRXcHrl8qd/n4GWkaA=;
        fh=eSSd5wKlO7kB1YBNGPccZfeluj3wCIj9BRA28LOowy0=;
        b=OWYuhyfpR+kBMpmMXuWP2D8L3PZi9GkyMomUiCYyNrawOUG04GKsh8lXqLJzPwvCAz
         hqRn1kbSNm3qwXmIz3I/7kFcqX3u5aHbAO4bqgwVJ5835so47WTICsf/+i6peFmMbqDH
         ADzxUklQYmq5WxcMgXFStluao/rjHtlDELfRWdag/kyW8ABB0oOzJ6ZYoa12hPNViSOA
         EGnQmU+8E/AO5secPyu3chj32/vpRlAF9Sxnf1Cg0kcMz4Zt42uZ83uncEbKUKGUqXro
         Xk9Tf4Vcj6q5Ba+iuzaAoQlODWBbM5hBScnTmlaDqgSx4k/EmCqfTBHw2IoVBuMT1cYz
         arvw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794933729; x=1795538529; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PDP3cyiEiUUbsLZojQrUFbDLGHRXcHrl8qd/n4GWkaA=;
        b=MbaPRpYFs3+a/Ow8JTHk85Z44QlG9ZJcT7CC2z9hNPrvF0mC6Ip3qVUzAUj974hzgO
         9kXe/WMvVDiIj3ocCGOTGREeHK1N00VBd43Iw/mo2cJ0nm1t6kSqXyR+EhiKDZCm3mO5
         Qkn8vjk+QChMVHJQK2M6LUcxCVMsCaG0kh824AKu9L2d5TfNCkr8VQIBYQyk5nvo3zWl
         OXOUEhwRuZNZnKleleaJN9yvIAX7ZFbMSPBZpGDHxkDcI2z3aAUF0oRzS4JjdC0Qp5cL
         dP+zGp3dsHRo2UMo1qo3NdHLjXgCb1mc0mTvMghXhp+y/wVlaVhRU58Pm3q9dw48qkhG
         dVAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794933729; x=1795538529;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PDP3cyiEiUUbsLZojQrUFbDLGHRXcHrl8qd/n4GWkaA=;
        b=U8f3uPkxXnGadIakDd39DHg52KD/JzvsA00snrZpLVNf2Jh39suEOt2oZIC1R0zOgN
         47Rvsf4pBzmwU+zKrb0VPhRlzlm/e1VpF5zfZOdqST76ddT9Y6pcfnMu2jj5m+5hQtuX
         dUaSgI69WMufmeDoayVthFE3ePBevtdTwFb4piPzKNe1J2KirKMyhT9Y31gqtNM+Jwig
         vykS7gFWuy2B+vjcNn5ZWd8TBLoZs1krA7kYRoDJOFuslLtPyN10PDLSI5FksOQU8YkD
         ASgr+ylHUTzFyZS7+NHjzpUhoMhGznl6D7eawSJsOJGzxurP744rBn4yLoEHVp4ga2cF
         dLEg==
X-Forwarded-Encrypted: i=1; AL+hErFWHOJrBzIiLu8j4WgMNLkJIE3hHIWN+aRpOGhy25K3jPW0r3iQgz6C9/CfcWXRdgeBjfNukiVHN4flE9Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z/eSu5IPPqZmyZkK/Kd6BZIOtbLPcHD7HoiDAG9153n2s9QsAOs
	bhicDewU9u8trKeiPSt028FWjIY4E4glAa63Oi9bj5FbtrC1NXndl4AEdIzOjddLrQi8jSezIg0
	7yr3xHMmj6hxE/7yCwELPXW4EFm97BXAVpZzCeAF2oq26tYXyE3Wx388qvkIjzjNDiGLDH/+Q3y
	aT6YTvaLBWi4XrxTNeOYG9Y9oSBMJKIV6chd22gw1L
X-Gm-Gg: AZFdTZfJ+h4jTv54/WXCNnHD1tBvGKZ1e98vaEQPL/yWCxfeaN9ZU9QDtMk7qt288KH
	lu2a2GYrZwJhY1CX6JLKdNwRIm0DRN7gXsIZldBAdig22q7oN92Vc0RvXBfHaWnRDsqdkemtzZu
	ObLgs1VJPH8ciz4UWPSNHR0AqHHN9eKRbcDdYhEqd8l/kbmqU1iUMiORZMOSwtrO2zshVpRloay
	J3QO9t8HthojxdudcArM0zHYHXfbel6BTBS2fj4wx4AR+U4kWgujQjR+g6n
X-Received: by 2002:a17:90b:4fc2:b0:39e:6c68:fd91 with SMTP id 98e67ed59e1d1-3b3abe61f72mr2243346a91.38.1794933729156;
        Tue, 17 Nov 2026 08:42:09 -0800 (PST)
X-Received: by 2002:a17:90b:4fc2:b0:39e:6c68:fd91 with SMTP id
 98e67ed59e1d1-3b3abe61f72mr2243339a91.38.1794933728759; Tue, 17 Nov 2026
 08:42:08 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027191914.2341911-1-sashal@kernel.org> <20261117135017.1506973-1-sashal@kernel.org>
In-Reply-To: <20261117135017.1506973-1-sashal@kernel.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 17 Nov 2026 17:41:56 +0100
X-Gm-Features: AclHuK_P7aIZmExD6ZQ5RLxlkBJHQ62XTFmJ7TbsZO02rjCIEyXoAHgbHc5W_dc
Message-ID: <CABgObfawYLhLsSSGunAO0R2A1D_ofWQPco1FGtjDKysTLh1itw@mail.gmail.com>
Subject: Re: [PATCH] KVM: x86: Don't reuse the GPA of a fault on the guest's
 page tables
To: Sasha Levin <sashal@kernel.org>
Cc: Sean Christopherson <seanjc@google.com>, Tom Lendacky <thomas.lendacky@amd.com>, 
	Kyle Zeng <kylebot@openai.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 2:50=E2=80=AFPM Sasha Levin <sashal@kernel.org> wro=
te:
>
> Hi Sean, Paolo,
>
> Ping. Did you get a chance to look at this?

I am looking now. Sorry for the delay, I was busy with KVM Forum. :)

Paolo

