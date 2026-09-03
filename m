Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1201A46984E
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 21:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788472626; cv=none; b=QNxKV73yXAxmHIc1NY8dJ88R5VF3GhPn6mxPv9Hj6f4oAf21VhNa40qvkEspVJke1NZiZ5jCaF4OLcFt3/TWM02iRh46YA8fVYsph5KEndkwUHHRafgL730HBEcpXMP/Ro01qUF4tFKfYs/LvK3u2RM0jbGDFHxEJmFvKVOat0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788472626; c=relaxed/simple;
	bh=UUSqtnLWe5aZRYDj9K196OkIKDN+Zyhhau7+NTVDMnU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=FvAKq+hqJCrOViGgROm7TJSYPUphR021vMyL76vTGcMqWfeXziCuB2yqqHEB8/k6xiNnE3+lLD3+t8U3uL7/XK5BIuNK2zHO8zbK2luQeka66Y2z9AS8lzqS7DuG4QVuKOrWYVjvzhH/k+6pvKnGB3YRVZUKKpkqxkywjQ6uWwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=myUeuBjv; arc=none smtp.client-ip=209.85.214.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="myUeuBjv"
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d94f086fedso4470565ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 14:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788472622; x=1789077422; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qPa5Isz91A5PrjltfQrSDK6J910QYzqvDKsVi0XwhYs=;
        b=myUeuBjvcQSfd1cAX26zih9VQxvP5Btgl5CTlWVkjO3Zh5nkDO6Gj02kLpl2ImqB6o
         kKoo19Vj/yPSDrsccRdXEXDSGpumSsdCsHghbUCgoLnvfmDZd2VsOZEm2Z8hqoUGgHu3
         m/0OzdMhhv28tVFgtp/3I4B5+Te4xpnTPD9c/71WCst9BjZDO+hjEDMBy+2+EKyywqAR
         FqxCFwh+KowVJ/PbcIgDdWYxd1NzkEr8AOjMbll/wQblXHGiDn0AypsB0FMqXatn0MJ4
         +2dQuq8yKlhXgxM/9+Wy3o+ruyno96KEX6z3d2goYBNModehKYTxWIEI4jh29K4NbXPE
         tPrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788472622; x=1789077422;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qPa5Isz91A5PrjltfQrSDK6J910QYzqvDKsVi0XwhYs=;
        b=GaSCJENUwyZVmeZPfMjdHupu20i5jVVomC8k/UDHjQEVf5hx4y8y5cTJ1ldcbALfNh
         +8wDD1DJgxf/yz++IDOZFqCCam03wNZfNHRyRDyFuRrNEdvv5U4bOAIzSJ+x8yhHu8fw
         Am88/RAqBBnZc36lXlWDm6ELqtieISBlM50/NkmpBICd6bFHTUdXzlPerfGhkwfqDqZW
         bpzzJdaoGXSwE/88/m5vpE2PGK/oP1chnf1+sQkCI3+mszhskuo2IrFxZhC18Gn9qQQX
         9kV7C0Wl/+MLfUBNZaiqqwkNn5T8WysL/uzBuKwgz8v3p8D9MHJWQGa6HNZ4s/5un7iA
         ITXw==
X-Forwarded-Encrypted: i=1; AKwUvBy/UarE88vX02NFA/qHJHrLoEOmTeQfosgqlapGiQZvWL9jEztAxYClQLBmZylEUcTZAlQv7be10a+116E=@vger.kernel.org
X-Gm-Message-State: AFuF++lnlsEN6NqXXG+n2WIearM3QjIQh4csI8oywwKYna1kajYismpi
	8hJzgw3H9kOLsOydklMmbhqLjAhgJXlPXwRtvW4XEceYl/l8tPaNMRSA07FJbdcbW2Ful22On3A
	lfDLmnw==
X-Received: from plq5.prod.google.com ([2002:a17:903:2f85:b0:2ce:fc5f:e782])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:1844:b0:2da:ef81:37e7
 with SMTP id d9443c01a7336-2db126b1bcfmr32446965ad.21.1788472622253; Thu, 03
 Sep 2026 14:57:02 -0700 (PDT)
Date: Thu,  3 Sep 2026 21:55:50 +0000
In-Reply-To: <5832ba17-c096-4f07-aa73-2e2bb6f79856@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <5832ba17-c096-4f07-aa73-2e2bb6f79856@redhat.com>
X-Mailer: git-send-email 2.55.0.1003.g10538fe699-goog
Message-ID: <20260903215701.2270160-1-kuniyu@google.com>
Subject: Re: [net,v3] udp: revalidate socket family before publishing an IPv6 cork
From: Kuniyuki Iwashima <kuniyu@google.com>
To: pabeni@redhat.com
Cc: 4ncienth@gmail.com, davem@davemloft.net, dsahern@kernel.org, 
	edumazet@google.com, horms@kernel.org, idosch@nvidia.com, kuba@kernel.org, 
	linux-kernel@vger.kernel.org, netdev-bot+sashiko@kernel.org, 
	netdev@vger.kernel.org, vyasevic@redhat.com, willemdebruijn.kernel@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

From: Paolo Abeni <pabeni@redhat.com>
Date: Thu, 3 Sep 2026 15:22:57 +0200
> On 9/3/26 3:05 PM, netdev-bot+sashiko@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 2 potential
> > issue(s) to consider:
> >=20
> > Critical: 0 =C2=B7 High: 2 =C2=B7 Medium: 0 =C2=B7 Low: 0
> >=20
> > - [High] Incomplete fix: the sibling IPv6 socket-dst publisher in the
> >   connect() path is not covered, so an IPv6 dst can still be installed=
=E2=80=A6
> > - [High] The fix is writer-side and after-the-fact, so the mixed-family
> >   socket dst it claims to eliminate remains observable by the unguarded=
=E2=80=A6
>=20
> It looks like fixing this kind of issues, if possible at all, would
> require adding a significant complexity to the data-path.
>=20
> I'm wondering if we could just remove setsockopt(IPV6_ADDRFORM) support?

+1.

The feature was initially defined in RFC 2133 in 1997, but only
two years later, it was removed from RFC 2553 in 1999.

It's 2026 now, and I think most (all?) applications are ready to
be passed IPv6 socekt fd given systemd does not use IPV6_ADDRFORM.
