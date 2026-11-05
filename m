Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793895487;
	b=msgNfo4zzXcAKyEc+n24u2Qx4VTH8HjmvKg99qI041dc5LVCkLhhhEDl01U4IfIXhCb6
	 5yKPVMZ6lTKG8QkdyXBZdIVmq8WfzmoT8LTQT5yxZSBVpElRm4uVabBYhnHl3MOEdpIEJ
	 KRyREjGZ5Ddi9mLsYMNNeyBgLE45yM5uqajVWQILT8JhqmRChp3yuigB6KEWaqIT5F2+2
	 TbHa1Uo7vaWZlvVinHXXoJJdxq1edYe8QRdMrnlpL6BkpTKoNFEceA0L6AJK4Fu5TlSNn
	 BKZq1vuXZk6OhRMEk0xBc5aq+pXw9X9Cf81d1R6Hgpy1kIJzLa7aKbwQroQtGs3gKGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793895487;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:To:Cc:Subject:In-Reply-To:References:Date:
	 Message-ID:User-Agent:MIME-Version:Content-Type;
	bh=5btkYgoCas6QGdDdEV99M1LT/zc64JzXRUD+6MRR7mA=;
	b=ND6UMy8LkD1q9e7K6zlt5YaEQ97e6ta/eBBnKsrd8yvOSFMA8s+Js+yZmRxAxFXFJAWp
	 gRIokXcseg+zZlbAnywoOvx5y6o9utaF+FjcuqodoDBUnYM76GgRLydX4dUdzmB6w4hpI
	 i7mQzSjC+fxSvQH8vbQPZBwSy3vBXRdXLj8NIeSUXuwiw7Teq7o55C+OKVcSGIUsZGqs3
	 bDBzqbbIQnH02RaXMYLIMa9GUO8xbp+5gW8ISTOt4OQ+Uyrzbq9VeXv2yDq70nAByG9gR
	 FSav6mDzUARUMxhQ9+tPaWvGPei0jySCVQTJ1G9Fu9kzl2axXDS7npV8MRsyhjB6l1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=S5iL25OR;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=icvQ0q2+;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 940EA606A33D
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 16:18:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 940EA606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=S5iL25OR;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=icvQ0q2+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793895485;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5btkYgoCas6QGdDdEV99M1LT/zc64JzXRUD+6MRR7mA=;
	b=S5iL25ORlwfJuyOEN20HyeCp3FYVI8Da+tnY98mDd6yHCFiZeCpRc4Gc9t1btRzuXhPXdr
	1vHHdOPborJtspGTx7Q/wd3GVSd3W4icgpgoKTU+MzMOV46tk90IJwsXyR8lqJu+8nivMO
	O/D9e2qBUAT1LpxCxUynfqW6uQ3Xkc4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-265-m0_txVSFML6t4Le3HxmlRQ-1; Thu, 05 Nov 2026 11:18:04 -0500
X-MC-Unique: m0_txVSFML6t4Le3HxmlRQ-1
X-Mimecast-MFC-AGG-ID: m0_txVSFML6t4Le3HxmlRQ_1793895483
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4a2065a2ef9so19454805e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 08:18:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793895483; x=1794500283; darn=vger.kernel.org;
        h=content-type:mime-version:user-agent:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5btkYgoCas6QGdDdEV99M1LT/zc64JzXRUD+6MRR7mA=;
        b=icvQ0q2+/7npzbgW8GUq9laWEqHVJNMxVd2QK4Wx6lFoO4gsSt+lmep30txehm6dLJ
         SDFHV9B2Fzzoa4DMvjCiXN8NvHAWJUoqnY1BTNtLQ12c+A5AFwpYtRwy6Xt5ItYYPVFJ
         CxUusrqa3wnbpdD8LhTemA21wRrKMsjRNW5rgrWImFtMVstDVRbEURaH7goNjNKpeoba
         x3y77F0yAse/oOOCKxhGUE2rkkQgq5rUr4ybrdyu9TF2HBm3ZU8atbodbkRXW+h8DkB1
         Li48htykwc7VjByZnpGIz/PT1ndhJjv9DHpbaMEPZV1Gy2itwLbro/xzhash9WTqPuNG
         A5jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793895483; x=1794500283;
        h=content-type:mime-version:user-agent:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=5btkYgoCas6QGdDdEV99M1LT/zc64JzXRUD+6MRR7mA=;
        b=xVHwPQltVkO2lSlJ4hfG+DJbcp6Gc4FiGemeNwZIhwI3NgBizuUKxB5hsFJWSk1Qn4
         fiyllMiRKSIqGMVKb4tEyXsRxpROOz8WI2iWNUFn0P1mFun27ynZPdWFkb0FhpDyQ1N1
         ep/6qEQn6acqVXGDNLAiUQXmx2sbuRA/Ufb/vugg9MafHuedc9gpMoAAFA/xXaTd75v/
         sYSz6hII70BEYHRc+6JccNG0F9B9Wrqiru3hOZDDe3n209x8mStLhjb9M2NNz1fcgxH9
         RNRk5k/utK0DKPFTca1Udjb1E3URI1oro42ez8GjIyNpm8lmAtnsyC2C1IMsXxccMlhH
         7uZw==
X-Forwarded-Encrypted: i=1; AKwUvBxM335qJL89ub5yFkG7QrvTICXxauTPEF+fF5sHBXCIvdjfX+y2WUHasqZj2MMJnoXXmlPvJ8PuVJCTAaE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+b/2YN79YTdosRFtUzP4X3VPzKu8spQt4TM7ptMNbCk9rJBLyJ
	5AI2qkXCHpppEtLlyDawckkmyLjoQ+hulp381e2kFb8AN6u/3LOi6Oc493d9zh1rNxKlCgIUet5
	qCJEKbSAe3yyNMQtvbJF5ewL1DnzitYjrwggT0jARPJ8qOduPDaQUVdHurAtri0t1Ig==
X-Gm-Gg: AYBFou3tpz99vCxx3UUguTmW3eS25rhnB3FCiyaZDSaUCOSGRbBMLU9T7m3Ip+pk2WD
	fFeGq2ABwQGIfsECnWZ7VbYczxfqFQIVyXkLa3LdCik+LLHtXQ0KneNAprhuEPpjDRibHCib0Rb
	XNnst/XwC1iV1bU7+ldXv+EKveG1QAqmEwztgRtGvpO4m6FqS3AKRjvB2/XBKoHYNWFWshoqowV
	ILXZHdsvzZXHHnRPIJ2VTr9CBVevCOhFe1M9RCdBLKuUV7phFPLpRy6ARlwgNabHyiEi0iwmBSf
	gQlw6U6SnIDQqrDmBAjkdy0xdAlYbdur0CQZ1ZwgqbM/0lm62HBAX+sjAmdHo6ak0mihemcKdwf
	5dTmb3fIiqwiv0MI1KR+Yoxuv5SV/OC+JnlcAZCO+wP5jzDGIVlA0c7MMptwnCXDNTGMP3p2oED
	wjBw==
X-Received: by 2002:a05:600c:4715:b0:4a3:598e:e7a8 with SMTP id 5b1f17b1804b1-4ac150b28bamr440224725e9.4.1793895483121;
        Thu, 05 Nov 2026 08:18:03 -0800 (PST)
X-Received: by 2002:a05:600c:4715:b0:4a3:598e:e7a8 with SMTP id 5b1f17b1804b1-4ac150b28bamr440224145e9.4.1793895482697;
        Thu, 05 Nov 2026 08:18:02 -0800 (PST)
Received: from aconole-thinkpadt14gen4.rmtusnh.csb ([213.157.19.68])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56fca22f4sm124635795e9.13.2026.11.05.08.17.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 08:18:00 -0800 (PST)
From: Aaron Conole <aconole@redhat.com>
To: Joas Antonio dos Santos via B4 Relay
 <devnull+joasantonio108.gmail.com@kernel.org>
Cc: Eelco Chaudron <echaudro@redhat.com>,  Ilya Maximets
 <i.maximets@ovn.org>,  "David S. Miller" <davem@davemloft.net>,  Eric
 Dumazet <edumazet@kernel.org>,  Jakub Kicinski <kuba@kernel.org>,  Paolo
 Abeni <pabeni@redhat.com>,  Simon Horman <horms@kernel.org>,
  joasantonio108@gmail.com,  netdev@vger.kernel.org,  dev@openvswitch.org,
  linux-kernel@vger.kernel.org,  stable@vger.kernel.org
Subject: Re: [PATCH net v2] openvswitch: advance by the real header length
 in get_ipv6_ext_hdrs()
In-Reply-To: <20261102-ovs-exthdrs-v2-1-21ceef6a243d@gmail.com> (Joas Antonio
	dos Santos via's message of "Mon, 02 Nov 2026 01:45:35 +0000")
References: <20261102-ovs-exthdrs-v2-1-21ceef6a243d@gmail.com>
Date: Thu, 05 Nov 2026 11:17:59 -0500
Message-ID: <f7tqzgz8d6w.fsf@aconole-thinkpadt14gen4.rmtusnh.csb>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

Joas Antonio dos Santos via B4 Relay
<devnull+joasantonio108.gmail.com@kernel.org> writes:

> From: Joas Antonio dos Santos <joasantonio108@gmail.com>
>
> get_ipv6_ext_hdrs() walks the IPv6 extension header chain to fill
> key->ipv6.exthdrs, but advances to the next header with ipv6_optlen()
> whatever the current header is.  That is only right for Hop-by-Hop,
> Destination Options and Routing headers:
>
>  - an Authentication Header is ((hdrlen + 2) << 2) bytes long
>    (ipv6_authlen()), so with hdrlen = 4 the walk skips 40 bytes instead
>    of 24 and reads the next "header" from the ICV and payload;
>
>  - a Fragment header is always 8 bytes, and the byte read as hdrlen is
>    its Reserved field, which the sender controls and receivers ignore,
>    so a non-zero value makes the walk skip up to 2048 bytes and miss
>    the headers that follow;
>
>  - in a non-first fragment nothing after the Fragment header is a
>    header at all, it is the middle of the fragmentable part, yet the
>    walk keeps parsing it as an extension header chain.
>
> In all cases the OFPIEH12_* bits stored in key->ipv6.exthdrs depend on
> bytes chosen by the sender rather than on the headers that are actually
> present: payload bytes that look like another AH or a Hop-by-Hop header
> add OFPIEH12_UNREP/OFPIEH12_UNSEQ, and real headers after a Fragment
> header can go unreported.  Flows that match on OVS_KEY_ATTR_IPV6_EXTHDRS
> then classify such packets wrongly.  There is no memory safety issue,
> skb_header_pointer() bounds every read.
>
> Advance by sizeof(struct frag_hdr) for Fragment headers and by
> ipv6_authlen() for AH, and stop at the Fragment header if its offset is
> non-zero, as ipv6_find_hdr() does.
>
> Fixes: 28a3f0601727 ("net: openvswitch: IPv6: Add IPv6 extension header support")
> Link: https://lore.kernel.org/all/178905555085.219967.6617611783437228045@kernel.org/
> Cc: stable@vger.kernel.org
> Signed-off-by: Joas Antonio dos Santos <joasantonio108@gmail.com>
> ---

Reviewed-by: Aaron Conole <aconole@redhat.com>

