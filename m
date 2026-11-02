Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.133.124
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793643710;
	b=otGQb4ZRWUm9P8OWUDuMSHjnHbKrIaWCAY7vPIZZEewGYLKjyrNyGrrKHfejNxVMNKGn
	 dm3f9hDJPmuXdpzOJeVk8SCVAiNDx02abmyFLyt33tZRXgN7MkLK/SlICuzVJVSQLhygK
	 ZaTCvdTiOiz7aTlOy6pCVAVvZnmObERmasAd+zewK6N5DAWnnWeiOh+AvLXFxFoHwXFZ+
	 r935dy+pCkk64Iv9NU1n5VAzl/wKFhzpQWZ2LU33ZblUO3Wzn1UV2TxSwC9ffpNWJ/LSN
	 y+DIbqvEFCbpqV0lpdFz6gpmKMk1Gu6/GDUGvy6LbF7CbBwkWYtFKlsl+4bq5CX3zyA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793643710;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=6odvKjJX5uaeX8gp4PjtCpDvxv131iO0vErthI5phGU=;
	b=iZCctnJfHXJldTeZyV1SBRKuSxKS9YCA7j9BFsM8a0Q9iuV6vQxVdqYwY198IaSNrG0C
	 sVILROuPJrQuO7g+H3VoBT+D7HFCCoiZdE7Z4TQoHeTnWiV8UEmq1NTWbrMVpt61pavkM
	 8wyrIREw4+cPbRL9oPGEZPtAGlh0tSDJFSvgbj2oR8WK67RPzsdWaLHvTgKakfkBX/Tj3
	 H1smLUfAKC5FA4AQ6TBOr2y7tiPUAfotN2/LxzhXzGxnzX5G8Luf8A87CotI+oX+gw5+c
	 xSMa8D/ol/tADOQZh39RexW6JPghcprPQr1N7+oanDQKN5GNu01bephMkIXL11S9ECg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RLvyEPiI;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=AdvNFd+Q;
	arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72BE5606A331
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 18:21:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72BE5606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RLvyEPiI;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=AdvNFd+Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793643708;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6odvKjJX5uaeX8gp4PjtCpDvxv131iO0vErthI5phGU=;
	b=RLvyEPiIC6XxUI62HLhY5vn8MF5RdNTuLVHcZVkETa91e8J6/3hVROK6CqioUpLQ+blE3v
	TTaYVdhdghbP2OfYBmVye0zyuvgEyhjL/mns08jWFvfFEPWtAD+Wuhftu9pdGva/ilM90O
	4pW+mtlXznd8dH91Z1eNwJqUcI8K6LM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-112-XqcthrctNte0ZzYZU6hRRQ-1; Mon, 02 Nov 2026 13:21:46 -0500
X-MC-Unique: XqcthrctNte0ZzYZU6hRRQ-1
X-Mimecast-MFC-AGG-ID: XqcthrctNte0ZzYZU6hRRQ_1793643706
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-48df5b058ddso2218858f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 10:21:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793643705; cv=none;
        d=google.com; s=arc-20260327;
        b=OSLWVmMdxcLOhVbOtDk1lrBDT0Clz2bFmDC4LAfC9DM/OUZV4O6SpSV1hP2dqgt/6H
         FVxwrI8PZpSmRK2D394FF4auK6pbAntRoS8+Jv+5/0KKldzHtMZ3f3GfXf8oJh5qivFe
         twVJbIsmtQ9Xjsdc//xc89t41WRSGdSuzHe9g990R2WwFyhf8FO4GO1HzEKQ0/VOLUKF
         OrnG0Zgi3Q/PGW5nYySNefiDkvsGWDvUWTarseHNrqzCg8ced/Vke7rsThKth99ahv0A
         mgE8WvKBkNGHAMGKXfiTUNf55624ZReMqhFY0Do3qpAXj+SEbBBGbgVOEMfKRfBGwQpb
         Mcvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6odvKjJX5uaeX8gp4PjtCpDvxv131iO0vErthI5phGU=;
        fh=3I9eS2Vb3cjbocxoPyLBgwf7aNGUlhr7HnHu/HG2u5c=;
        b=hKUKD9Qg1kNEKeCvJgupTxBaqoUJn9sD8QQygRWwlFcI2oLJh5tp0RdPEiMVbkZbur
         88QL8XstnvHElQXBUYT1ch9gxUvj1pDHGCNUvltTgXihiKAQ3BSGOR7o9iEoi7USRJYC
         2FDvO4QhQxH+M3wBTCubJXDZtqZEhhUywbue594pmgBu25z9um+XlFw8eHKr8F0LKquM
         2HIIkxHBWGvL6dE1Hgro5NzNy3NpODZdofVEglEmhzsTtOkrTZc2OZBJYL3bmlS26rku
         C2KNso2MRHozo+pUPCOUMzdfNH+4qcQ1hLSmrygIj+xufr9Qdd7j0NhH9lKWCS0q9eXc
         HqaQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793643705; x=1794248505; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6odvKjJX5uaeX8gp4PjtCpDvxv131iO0vErthI5phGU=;
        b=AdvNFd+Qp5s56ThcrRXPY51RUzsx7WTKHs1dZxlWqOvdJskt8ls5VuDJpN8MxxW4ms
         yu9nb3NceMKlmZBWv/2nyUcPw5ROysQ3zZOEy7G2Y1qZjnIRE/Lr5lu8JtU4eAoOUQst
         g2nGOUi3YDwAsNbrU/QkxB3hVdDkEoe0IC1D+0Q67intbztlbduUjiy4TMA4bdXd5gHI
         eQZluXMjZgD/2X/relRb0cqd6yz286g+9998yxW7SG0iO8BbRiQ+xcH8Iy+etqLQubEj
         UTAwchB+pnGlVOaq/d6o3nT1fHKjFImkwBxnkPADSnYjSvRnBNyOul7xcDlNOdEwlLJd
         lz/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793643705; x=1794248505;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6odvKjJX5uaeX8gp4PjtCpDvxv131iO0vErthI5phGU=;
        b=uhDP8LlWZ3ghz7EERytuUzboxBAqanwUnYvKUZvFXnGa68QmoKH4TPaeb6h9Or85Rx
         c7RyzAPE0CaZJ5rYgm4h3zEamAZdEIojQkg15j8YGnKWGsI07+oC5gNkWmn0MBIgOiZV
         eYI9cqX3+BlkthBlnZS1ZtjNsiyo9EEnLNojhYvBCAzwja4rHchFedR9KWg56UK4WiFw
         UANhkPjekMTUixQRELNl3n4EfVxMjh/74mySs4s5q4wZfTITuCVoTiYmN2b47xQdLLwL
         BfqKaJOkuhY3GG1IiRds4oW8L7KSjonMYfn2L3np6kj7kv/tZngu9O5DHXM2xP7gYdrH
         2DGA==
X-Forwarded-Encrypted: i=1; AKwUvBxfGHid2Yjz1U1V8Uka5Aa8cSQikZMSdcwW6y1OVhGFD1tzuZHR7dcQEF4OtTGIex2OI4wSqa6PEKKrpBY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+JrQU66BRKLzwUqbZZd938V/GkWTuBDqWzGqfU1EcoqKFhA0qD
	gUi21EKVnoEfi57LFabS1YV5mtWztS3Tte/nvwahkShevibEyqU8vS/bBIBv/42BgNeB00RHSk+
	V9B1K2B0zmUZ3pkgDodkXW9aefo0ZwdOf733ykeMnOxgdS88vJVT/58s766Z9bP205mqDQxtb8b
	66bDxeWn+W5rhCyo8t+BY4Ju7cuWo0tOHSij0ubO5F
X-Gm-Gg: AYBFou0B9646I/MbPsoj1ewUiQzP2829GDHzOCScMtSCGFR9B4tyt1o8hbi+huyIKYT
	jGAokdHZndc0UCTk6WXizoF9n8iJfKpbM+1aWArYz03F2v9Dr8f4UPZUq/TJNUijXxQtW6O5VRl
	sLgPz3lGEY0DP91F4RyOKW4unvW6WPRntm+Lm8+5B0wJDPuqLisQJormXf6lIWIQFTCkDcTyHhc
	hLnI9tWn1J2HIqFfkN9NzoSRsb2zSdKzmYXie3jsFkyiOcK8iA81++8qu0W
X-Received: by 2002:a5d:64c4:0:b0:48c:6fa4:fc89 with SMTP id ffacd0b85a97d-48e6e3072d7mr26355763f8f.12.1793643705692;
        Mon, 02 Nov 2026 10:21:45 -0800 (PST)
X-Received: by 2002:a5d:64c4:0:b0:48c:6fa4:fc89 with SMTP id
 ffacd0b85a97d-48e6e3072d7mr26355729f8f.12.1793643705320; Mon, 02 Nov 2026
 10:21:45 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261016235221.33726-2-amirmohammad.eftekhar@cispa.de>
 <atpGGKVAL3bAnmnk@google.com> <atqdBFgoztW0nhoC@google.com>
In-Reply-To: <atqdBFgoztW0nhoC@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 2 Nov 2026 19:21:33 +0100
X-Gm-Features: AclHuK-M5UTgxV4aiMUN9HCDx78On7qRFnJSTS_KiHaFMNraEqE7Xlhs5LdbZek
Message-ID: <CABgObfb0=KB-TvSWJaerc6ZABB8-tjyxBdFwwnLNDjhPsv_27Q@mail.gmail.com>
Subject: Re: [PATCH] KVM: nSVM: Reset the virtual VMLOAD/VMSAVE bit in vmcb02
 on every nested VMRUN
To: Yosry Ahmed <yosry@kernel.org>
Cc: Sean Christopherson <seanjc@google.com>, 
	Amirmohammad Eftekhar <amirmohammad.eftekhar@cispa.de>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jim Mattson <jmattson@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 23, 2026 at 1:45=E2=80=AFAM Yosry Ahmed <yosry@kernel.org> wrot=
e:
> Actually, looking at nested_vmsave_vmload_test.c, I make sure that the
> intercepts are honored (in L1) *even* if VLS is enabled. I also *think*
> that in that test, KVM will end up setting both the intercepts and VLS:
> 1. nested_vmcb_needs_vls_intercept() will return false because the guest
>    supports VLS, has NPT, and enables VLS.
> 2. KVM still copies the intercepts from vmcb12 anyway, including VMSAVE
>    and VMLOAD, see nested_vmcb02_recalc_intercepts(). KVM (correctly)
>    doesn't clear VMSAVE/VMLOAD intercepts if VLS is enabled by L1 (but
>    it does the opposite).
>
> So this test case passing should be confirming my allegation that
> intercepts take precedence over VLS.

Yes, absolutely. The APM is very unclear but I am pretty sure I tested
it on bare metal too.

The only clue is that the "attempted execution of a VMLOAD or VMSAVE
in the guest will result in a #VMEXIT with a VMSAVE/VMLOAD exit code",
meaning that VMSAVE/VMLOAD vmexits can still happen and - like other
intercepts, for example IRET - the hypervisor can turn them on and off
at will.

Paolo

