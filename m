Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.129.124
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792516572;
	b=KWu87R+Ti00PdfXciDSAWd8PZPLSX10ZxkDDQiXQ7cigvodx7oEDigkkUQNzpSIuRwL0
	 pBAGCWnXvysAFB690090eI2ZJyi7As/WDDRu/v2ZUq0Q24iBpcZbcJ1KSes2x7+DWAgPe
	 EyOocrwqnfqOIhaGH8snDExaPj49Vf77XlTDtkcfAkZM2VSDoxZYZkmHY4J9D0jhd0EJ6
	 LlMc0csyznIEeAyS9wSYtfKeXfA8SGQOBRNz6so49nfuzWoMyzwwBkvsLPhqCuVL93l9j
	 w3uYHju8SXeABJqgv8Tk/4iw88ksUvInlzlZELaa81BDL4At0c5rmzOohnG/+zAv62A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792516572;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=Dqa81DbmEVosVhZIeXDqyDww6DzKrf466i3qKtWkyUc=;
	b=WBtLDSKvCxYLj+YHVYx5Ge0YciIQ5BzTfEtnt1HYg83fTWk+u5uaMSkUeSD24kTuc6zM
	 MX/nWoA+C261Yy8TbX6AOad7jKcqtHFhK21dhqUOPT5v/QjaSVgkLuWoqgAgPtOoQ5Xwy
	 6qXxkClbfgVPygfOQr6vZe9yzUJqv+eMWUF+QThfeZQVExoSEmY0uSHCgcV1g4GbMdnoE
	 ZdcBcJ7/6GoGmucthpVZxTo7JTe0SUxFHA1wxV9gtE5GhI27ocB5R8uv3I4enffEKtNzO
	 +1D8kQodG7VUYXmcxpi6CWdK9Wy43rBx1GnCeyRH+77PCvYv3E67XHvT0JR5Sjguj2g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="HAdTSY/x";
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=RTR1tuVd;
	arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ADDC606AA1C
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 17:16:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0ADDC606AA1C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HAdTSY/x;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=RTR1tuVd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792516571;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Dqa81DbmEVosVhZIeXDqyDww6DzKrf466i3qKtWkyUc=;
	b=HAdTSY/xjVIEOV5jak/gtngl8UZ3+Yp2pajm5PiAFIe8xfNVXqF41Rg6Trbd+9nvQZVr8p
	WKol7WmevGyO7zJXw7CM6d8kY4Aqtqnl5RoctBsbySd5C3oiif4nCOoPtZJKz+Iz3r/Shs
	oq0m5qOta5kk/rOsd3KpA+Nf/gPEd+I=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-441-Q5riAOovM9yphc6bQLPy2g-1; Tue, 20 Oct 2026 17:16:08 +0000
X-MC-Unique: Q5riAOovM9yphc6bQLPy2g-1
X-Mimecast-MFC-AGG-ID: Q5riAOovM9yphc6bQLPy2g_1792516568
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-9907539aff7so2897796241.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 10:16:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792516568; cv=none;
        d=google.com; s=arc-20260327;
        b=Y9DiQ/cZ/CZQCd3hXLEUGBQpZfa8Xf6v4PEhmxQtrINx5emRg+HQBvKgyRXWgkVKcG
         eNhHiPcTIDOm0lKXM6lUqeHZK2qXSilCKqKM1PTqUGXiwBU1a04Sgg3B9DTrfMgVK9P7
         xBi16YfXV9aF7JXtLCW9yOtNAtoNLAhbVW1bs6JYiKn16lrfQ4AlRYvdsoQU2pIYi4HF
         HjDdklY2M8n/Ox8n/ImPzww11n/A+BGyqCD2+icR6Y0vepZX6cELITk+0NlwhSPLZ0vR
         x1CCJfXZ9CjhrWLrvqoNLG5qsgHnMJYocchC8eeqivGgtTZO2tDslCCYxjX0CMRXb5Pm
         xHzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Dqa81DbmEVosVhZIeXDqyDww6DzKrf466i3qKtWkyUc=;
        fh=f9N++zfxRdy/dtxyX+WlX1FPOPMkvmdq42+WeARsZRs=;
        b=r90hL7Kqq5LfDk2Vz69xtmAeZ85nqGKIb7VOhqeecq4YwwK5ld+frocljOtX0xluoP
         setlrjml6lCES0qsIsLmfTkCljaSdFWsVpMqeWyeiSj/gnYlc5GAUuB04pqsLT08LiVi
         96lBYa3Jw4p6+NTXVJE2wBayqVGKTEHRf9kCQZCLqbosXmY9QNda+Hi1Tod5BBlO1MLP
         CRr4XxoudZOPBtgEt6Ife6bYn5DJy5KhjfG4/tPW4tz7pEwFaaYiB62/xm5Nuklp37d/
         y+CiTLhR9YQojSlo1hgx3WY1V5K9SO60ZPLoWK/TWH7d44pV0lX+NImWxBY9AvGG0Y3e
         kBPQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792516568; x=1793121368; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Dqa81DbmEVosVhZIeXDqyDww6DzKrf466i3qKtWkyUc=;
        b=RTR1tuVdDUHEn2ze9H0ohlkt3ebd/D9SNxeKWODVXZQhpsFgpYk6JwWTN7hONZN1By
         ilI4c70pSxdaJAD8xOn2Tij9xfPC3yZf264U8QH18P2oaXTYQV1Df0UnpJbAwBQj3scN
         KsNZ9qxMAD5WISFxDRN9lhW4g7WcpnSt24ilP5OOpGpr9tIwm6LI4G3rY4E8L4m8Ywam
         +miLtYZNvR7evgHh4FH3sgCgNx0tjkEGtoYSabCtdfYQg5FwSFyXWtijwKwVGB9mYLSx
         UbBoGu4Y3qufmKbf+VOdR0+k255Uq2ab8Dnj2JkqEi3w1LF1E8zW8y2/Tb7qyEsG3iOh
         aqrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792516568; x=1793121368;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dqa81DbmEVosVhZIeXDqyDww6DzKrf466i3qKtWkyUc=;
        b=YU2+Sgzwh9HOTxaW/CTprmbBE9NKyXDBCz4l2coJUpJ+YhQtT9z9T2uL+qiFLMssgT
         J5a8bTuLetRBccNPbLZNC0+t5AouH/Kaf5XGaEWX/ZLGgQU7GQi5oqWIgvNITXT2tSfs
         dk3TmIugIDfAmbai1AuoLNR0KsOj+CYubw+GJxNES5o/dHe6Ny3ukEZNd4EZsnz1a+0t
         VQAK1w/0BvY+ZhZxUmc/Xi+7Wa/ib8Mb2sI/Wd5hbKHKofh04+i95XVFwpNjwSUUMvTF
         4w8VxND/EP20WJy5HE7F0iWfyEpH4CBMs2lfFuDD1OKQCrewWYRbPm6kVETfy9cFNRy9
         TUbA==
X-Forwarded-Encrypted: i=1; AKwUvBzHX7TrnMRADGxgH+QafimUwPmq11yd2UMTcMKjdmnT0uVMXCaiW96+2vCLBVxjycA4Ge9W4eIyVrjyJvk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLFXMx5Heir4TNbOrU+6gQ6VuB7CVRPaKwCcL8UU/U7CEJ36N4V
	7Xd0cgd2DiPJ7V6MaK5IQmSMFziEUPfCHv2PfzDSQtS9iXdHagpaB2tS9MKYrungP72kKikWMWV
	utLozSu+oNJpTtz3Bp2/V1cgsi0EmRHJ/fHoDjkUDfrfm0LHmbmypXgAcJUmhIXfDM+d6vkiXaA
	dRk2jdo7f5JtzUc2elL9PxgY/uOCRTRbSvq6vstEZy
X-Gm-Gg: AYBFou1vyowev8PXbk+QKhOIuTGIo4V6z33KdI+ZLU9TAECxKnHvkRqjzH6u4yUbdVX
	cCMJMrEeFPT9roBEO2PjO2/rfTQOT+7Y2JCuLc70bArw4UaVPEaqu5U+jBSxDNA9cU9Ixoes1yg
	MufFOBhZvE7+lWKG9YK1+y3JeGahV0k655oRqenFLZOA/iqlyvteXERNGUWvvIxErTfbZEjbBMj
	W3Jlm3XlkTwq9tZInGSjomQs4tK3hy+uANbhany1zqC478w6T4GUaL/42l6mAXAzBtMkuTTmbrG
	K6NjrASbaFuQIa/BHU86taScKw==
X-Received: by 2002:a05:6102:358d:b0:7c3:b15:a981 with SMTP id ada2fe7eead31-7cc3695de87mr3672350137.15.1792516568141;
        Tue, 20 Oct 2026 10:16:08 -0700 (PDT)
X-Received: by 2002:a05:6102:358d:b0:7c3:b15:a981 with SMTP id
 ada2fe7eead31-7cc3695de87mr3672333137.15.1792516567403; Tue, 20 Oct 2026
 10:16:07 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1792498351.git.amarkuze@redhat.com> <20261020160537.GD699485@google.com>
In-Reply-To: <20261020160537.GD699485@google.com>
From: Alex Markuze <amarkuze@redhat.com>
Date: Tue, 20 Oct 2026 20:15:56 +0300
X-Gm-Features: AclHuK8IZ3rN_Kb2MqxIXzdba8gBbiLwQmfRP__gRggxXmiCnqZNpSqi1Sf_34w
Message-ID: <CAO8a2SjWStsoCQ7eeoBb5oY3nSUQVFVMT9Rvj1ZcFGNBctuEvg@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] ceph: support subvolume quarantine
To: Eric Biggers <ebiggers@kernel.org>
Cc: ceph-devel@vger.kernel.org, idryomov@gmail.com, xiubo.li@clyso.com, 
	slava@dubeyko.com, viro@zeniv.linux.org.uk, brauner@kernel.org, jack@suse.cz, 
	linux-fsdevel@vger.kernel.org, linux-fscrypt@vger.kernel.org, tytso@mit.edu, 
	jaegeuk@kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

My bad, resending.

On Tue, Oct 20, 2026 at 7:05=E2=80=AFPM Eric Biggers <ebiggers@kernel.org> =
wrote:
>
> On Tue, Oct 20, 2026 at 12:52:32PM +0000, Alex Markuze wrote:
> > CephFS subvolume quarantine isolates a subvolume while allowing recover=
y
> > clients with q/Q MDS auth caps to access it. Advertise support only aft=
er
> > cached data and metadata access paths can enforce quarantine.
>
> No base-commit given, and this fails to apply to current mainline,
> current linux-next, and also to the current default branch of
> https://github.com/ceph/ceph-client.git which MAINTAINERS lists for
> fs/ceph/.  So it isn't possible to review this.
>
> Note that Sashiko was unable to apply it too, so no reviews from Sashiko
> are available either.
>
> It's getting to the point where I should just immediately delete all
> patches that don't have a base-commit.  It's a waste of time to even
> bother trying to look at them.
>
> - Eric
>

