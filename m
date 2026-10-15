Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A4E53D0AD
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 16:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792081396; cv=pass; b=GWcS28OZf+dII/o5hcZYLfXsfC0crLPiEIn9qidNQKjsjY63bKR5YR7J1KhluphtPmCUaexOlXXeUa5XPWeBusiABhYrYcstfrrhs4sCwl0Ud0kPFpB2xayvWLSrloODlFhltCcrDjrMmGJPDJ4MtzWZavqY09PgSq/2RLilMl8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792081396; c=relaxed/simple;
	bh=B/yCQsQtMKDM8DM/5G2ilFhH7RPMWtxJE0jv5juoXoY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AkwdNTgbuozGC/xHyAGzBueGbJqDvrfPaaSPyiXDRKqlK4+LH6S1Ot1x7+3Puqn/taNqYnbdUjOq9n9h500mK5b5YP0Lqk0hsIWVMio9V4ue98m6S4PUn3xWoN5rcoJBqKQRBMtDB88aulIogEKAabSI28YrX7d5eZT8ZEz/Q7o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ly/WiXZZ; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=eAGJMHSV; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ly/WiXZZ";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="eAGJMHSV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792081379;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nx4sPS7ADcpxuloB7jlHG+Ce8rGDNUHgOUTEK11KwfU=;
	b=Ly/WiXZZOVQ6IYeIBmVdWNka/eHBmW4vcoIndcyZhIMRbTl1W4s6Jmnw4L7yLEbbCcBcIK
	YQ2CWP79LqserunUtNDBWeCg2epD/hqglFEx83IXW0m8u0VO/1C5t1/YbfSxe6T4tgdU9V
	BXOuTTCeOODL8Nvt3trIFO2guEsVACU=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-690-tSEFnGFePo2Buxw-So2xsQ-1; Thu, 15 Oct 2026 16:22:52 +0000
X-MC-Unique: tSEFnGFePo2Buxw-So2xsQ-1
X-Mimecast-MFC-AGG-ID: tSEFnGFePo2Buxw-So2xsQ_1792081371
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5338c59f90dso2317921cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:22:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792081371; cv=none;
        d=google.com; s=arc-20260327;
        b=Y0tMpn7MeCWLbzGz4Y63+CF/l4Rd8bH7EOtYJcr2GeLqMDf+HrJEYOZtkS4cXQ1EXG
         pipRLsWQo4ZZuvuRupba9JNMsF8oMiBlQGecCoSsSxFfkSpVxZxCyqUYqDpyihUP27VZ
         TlQIqk9C/jb7j06q8N0smHzNyEZT33DG7/ClpvaNGthJfePuClNWGx1jG+9RBvDVOASz
         PYh/FNmKhOOS5hBvRYMUEVI56H8woig6rlmmZUW8pV55UK1DJ6YTbYsBYx+0pOGi1E/0
         8mzNr69HUdm/CY6UzxMNJS14g6tgD3oCmUQWVIFEhC4/GylCPKXBaMLDz0klmLH3DBY/
         0v6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nx4sPS7ADcpxuloB7jlHG+Ce8rGDNUHgOUTEK11KwfU=;
        fh=UvobnXNs152ZTj+x9y79/9VJBHbAmFYt9n4s6+arraY=;
        b=VAPYoVp0xWu5WFnhU4Nv2EBMZBNv0Ajy4IeFa1kTgO4AyrDgcWrgr0Byo/mCxmwqkm
         penxkWFVsNSJPZh4a4mNBzTveYCerTLqKKkLoclNgrhHhLKJiE8XlVCo0mAzjRAvZ13o
         KZd3z1CixOMucO0seyr1yPdNR/3CTq9VmFwo3+FSbI83kLegA+F7zbQtL2VhO6yV54Iy
         I79oTTYA6/jhdDpxud0c7QDLeFtIyH5VLWRkK3rnMFolHnGGPKsvJgfMR6Anq27SEBgK
         jzAGBS7/H5FjSBFE2v3C2Xy+nYGmlb2ENTd3Y5AWTgBhLjMh/D2vBTcmwEgQZBULT2DX
         tOBQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792081371; x=1792686171; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nx4sPS7ADcpxuloB7jlHG+Ce8rGDNUHgOUTEK11KwfU=;
        b=eAGJMHSVj7TqYDJBZTcwNPe70vTJSDciYdBCrZ4IeQCA64dcnSCPe2/VCy6KRZzMYy
         ZMYRE0oaQa92dt2UrXp/7JPFX+z9q8Orz75PYIWqvIINUuRljLp4RF43VlxaU47dQQBf
         iWGz1G7Cl/OLc3N0YSOzJcmLcVkilHQz13Hr/qSiqk7LdeE8XBwtRb9mNF+SyC5xszx2
         2eCx0+cDswT2+hUsQgVwlBeCigJRXPEwOUqNzTPhWK+gtf+51SG0U0800qJbwv9YBbsy
         h0CG+xNd9aX+8TnstBd8tWO1bgwjXW6GS3UhIJ00s/+8EyfYmLfs8msZp8W83Q8zXmwv
         alcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792081371; x=1792686171;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nx4sPS7ADcpxuloB7jlHG+Ce8rGDNUHgOUTEK11KwfU=;
        b=foKBT2vBEhkCRQ4tPurGY29XHI4EKUUVWfNv68HFIx6Rz7X91rORTJ2vFmB7NM1gvj
         rpMNng4bf8JD9tQLM1D3zFdyfWbiB3gp24OsRW3n01V5lk/Axsg/aJCuNtACQ6OBF5y9
         LizJL2+NzrPPlA2OW6CDXWzd4uJYEtpWkQCAdVyyObS9TNJPLRmCDaSzd3JUt8txPPnB
         XgIe3EsriHZU3+XWJeKM0pHBbOwGYrOF6VP94lSDOm+M6yYJpjCgbs4L7sJFsZuNKeYG
         5bP+UcgPmks2tRPwwf6tGl6kn4cuzy8noZjLewYEoERwJfSoAMl3zgrfnaHAalmpprD0
         6fbQ==
X-Forwarded-Encrypted: i=1; AKwUvBwE/I8oYYcGQ8ZCmyk7zcRUPqcH/sfiChhmTtqnivAUc1p4KhiIjvdEcS3dBJiC76B8+vyJJmsfASczQoE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIrue1egDXptz3IwdW7e8g5wUvKsOSwK7Los+ConUbJmgH1CoBy
	V7LSo4MGpJWGqTct5uTBCp6pZgeP3COaV/FhbHWTFyQagwtfFIJkIxsJ6tb9WEiDEYqfaxFmNIo
	n/JIZJnIdqwhe84TWOmJRmINR0VXvGSABg+Xk5Vi49JWdRtxpI3vjSXpEiw/oK+fwjJljRMLn/j
	CPLGfVZLEYaH5RalncV3Vjs1yy7X66Kp7Cxp2krYs/
X-Gm-Gg: AYBFou1v3odCsiRO20ak7jbq12wicL4qdL5nrKTFGZ2lHIhtDW7CbZUdzyofpKfFO71
	N34mSr+BMl4q5n5KPN66Pf+AsptogtjxwDrvuq4jBptMjipjQASINLL+qe34XrRHIbG+b7p5nnP
	B4zU0Wy47KEzX295E4fItNKmcQTUFKpkbLBjjHGy/69kLDTVpAcFkIk+Ya/jSkXsHVgyYO+HXgE
	d49As4oqgECXQdv8rPoqhIBOcYW5AVL1X9/+pfOfTNGkKZT/K+t/WYmU3LgnaVBSl02S+GlcUX6
	iWsorZ6uZ7hv7j2KdiZKMBh8XQ==
X-Received: by 2002:a05:622a:1905:b0:535:20e0:2778 with SMTP id d75a77b69052e-536272c3576mr10070491cf.20.1792081371513;
        Thu, 15 Oct 2026 09:22:51 -0700 (PDT)
X-Received: by 2002:a05:622a:1905:b0:535:20e0:2778 with SMTP id
 d75a77b69052e-536272c3576mr10070001cf.20.1792081371066; Thu, 15 Oct 2026
 09:22:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904150304.49104-1-max.kellermann@ionos.com>
 <b8c135bf-927e-454e-8bca-cbdbae133d51@huawei.com> <CAKPOu+_Msno=mux+FUc-oV1-ywRFujJcnKS2HNv0sjtRVtUP3A@mail.gmail.com>
 <CAO8a2Sj2UbocxY+_MRdcH1TWht=UJT+ANWmzqLY9MQxZ0ujUpw@mail.gmail.com>
 <CAO8a2SiVWYSR6s=Z34QcfPVNVSLGk+YQQza4DDEt8_8+j37AHg@mail.gmail.com>
 <CAKPOu+9x_7WQmKhW==AmLoSzuPrUqeSV+JR69-TaovjEhuj6Ew@mail.gmail.com>
 <CAO8a2ShEjqyNA41ujmF5GfOM+YbJvXqCHKO9V++KBkJCXNOSUA@mail.gmail.com> <CAKPOu+_+oCzprewMeggY=32eEUt5ukTvhVMbEFGSh3Owa1zJhw@mail.gmail.com>
In-Reply-To: <CAKPOu+_+oCzprewMeggY=32eEUt5ukTvhVMbEFGSh3Owa1zJhw@mail.gmail.com>
From: Alex Markuze <amarkuze@redhat.com>
Date: Thu, 15 Oct 2026 19:22:39 +0300
X-Gm-Features: AclHuK_h7EDDc7jHJBjGn-t3Ju7JmTdSqJwHvcYvOANr8UoOsGNOkrmxHLArJn0
Message-ID: <CAO8a2Sj-_hbqEc=z0jgWW1oP36obzWWPm6KhQEDFAUB4v_2kaA@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] ceph: don't unregister an MDS session before
 removing its caps
To: Max Kellermann <max.kellermann@ionos.com>
Cc: "chenyuxi (D)" <chenyuxi19@huawei.com>, ceph-devel@vger.kernel.org, idryomov@gmail.com, 
	linux-kernel@vger.kernel.org, xiubo.li@clyso.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

  Hi Max,
  git am of the posted v4 onto current origin/testing stops on patch 3.
  Patches 1 and 2 apply. Patch 3 does not. Two context lines still call
  doutc(), and testing calls boutc() there:
    ceph_mdsc_open_export_target_session(): "to mds%d"
    send_mds_reconnect(): "session %p state %s"
  That logging change is already on testing. With those two lines
  updated, the rest of patch 3 applies. Please resend the series from
  that branch so the patch context matches the tree we apply from.
    git clone git@github.com:ceph/ceph-client.git
    cd ceph-client
    git fetch origin
    git worktree add -b ceph-next ../ceph-next origin/testing
  testing is the current head of the Ceph kernel client. That is the
  base we use, because for-linus and mainline are behind the patches
  already queued there.
  Your patchset will be applied on this branch with Xiubos and my reviewed-=
by.
  Unfortunately, it's not scalable for me to rebase every patch sent
to the mailing list, your cooperation is appreciated.

On Thu, Oct 15, 2026 at 5:08=E2=80=AFPM Max Kellermann <max.kellermann@iono=
s.com> wrote:
>
> On Wed, Oct 14, 2026 at 7:42=E2=80=AFPM Alex Markuze <amarkuze@redhat.com=
> wrote:
> > > I see no rebase conflicts with linus/master nor ceph-client/for-linus=
.
> > > What other recent changes would make resending necessary?
> >
> > Please use the ceph fork and the testing branch.
> > Since the last merge with main Linux the testing branch has grown by
> > upwards of 100 acked patches.
>
> I just did that and got no rebase conflicts here either.
> I still need to know why you want me to resend the same patches without c=
hanges.
>
> --
> Max Kellermann
> Principal Architect
> Hosting Technology
>
> cm4all | Im Mediapark 6a | 50670 K=C3=B6ln | Germany
> General information about the company can be found here:
> https://www.cm4all.com/impressum
> A member of the IONOS Group
>

