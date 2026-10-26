Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793015521;
	b=GR/ON6m4ZysJiAXGU+/CrsCug2krDGyRtmSf91ggz40vSNRelZ+l6/sB73bddoKWNAIh
	 UU11Co/nOWLXeI6gtXwBy0WtoDwiuDix5TD3yVHfjoXu78WN3fO7Zj/z9UIDWEsEITzPI
	 bni5g3NuFG7F8PEWURtNdto6Jy5CLhg1ZtVHVN2x1NR4a2ga/jK4m4uQvDBS+mRfmtBHB
	 hBmQD+P4K78ev42cZwEDYaGRjdvqZfB80osqbdDsxMZ+rpH4au5R757CvetJyzSg1yQzT
	 Z0Hn/qkiALFdDsDGu8KFnDgYhWZkbYGs34dceQuQt65Rh+HGXpFGNGqAnVXS/LIrQRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793015521;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=oXmtbUNcpCmBSBrSPIQ5eCtMYF36AZ7qVO68tUryAUc=;
	b=RQcQlLK4TJVBfoeYUym7VSLBq+wR8WvvpsabbtpK3xHhJGR7qWLsoKpptZ6BI3RgUMqt
	 AcyLbxM0dTtwrhu/ilW4MZyXn5fN+Xqg3VmadQ5WawbO3q1G0Deh4B1/+stE8lq/nVcep
	 reU6LIUiQxgjzNp+B1xGrjU93AA7oNJSKicP6T5chDzQeg5UsJjR3MZhNbqJTxXt8dbML
	 bt3l7RKBw9DZhItE1Z7ylmGwxtvBZL8l/JeamGFicDdiTBirRD8POg4PiS0xKqZNSPmtR
	 3ghEHSL6vrwgee+/T1KWsA8IsAey8XUw91OLIZVCNV8XUjvTOa9+w7bR3+Qb/OjDPew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="B41kM/TU";
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=eWGZbKAX;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3474360A260A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:52:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3474360A260A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=B41kM/TU;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=eWGZbKAX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793015520;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oXmtbUNcpCmBSBrSPIQ5eCtMYF36AZ7qVO68tUryAUc=;
	b=B41kM/TUVn5dYi8/qPNRjW7bniAlyCRppbqCTwBMrsqwGHzcqO0tpCBv9wmvdFw/5QSLFB
	xM1Jlpz2cggrqn7pEbKyLeJKuUOqI/XXGLC3HvZLUPu4vV1tt7lHFc5uIl5IptzBG9pMd8
	jsnGIUCpG2JCSFPhzF+UWkv5iX1+ocI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-519-qTgTiRc4MPGbAiMCiC-hKQ-1; Mon, 26 Oct 2026 07:51:59 -0400
X-MC-Unique: qTgTiRc4MPGbAiMCiC-hKQ-1
X-Mimecast-MFC-AGG-ID: qTgTiRc4MPGbAiMCiC-hKQ_1793015518
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-48e0ef019a4so2593664f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 04:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793015518; x=1793620318; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oXmtbUNcpCmBSBrSPIQ5eCtMYF36AZ7qVO68tUryAUc=;
        b=eWGZbKAXg6voSdVmFRNeRAVajxhVFt4Xje6r63u2FAH4GZOY5WZmkSaSxDO33Yik/9
         H5S2RrBbfLkpsjyZglrOmr/XBmEm0WK/7HpoLz6pIqhdvWTOQ8NoE7UZttwhgoPy1iJD
         W/ApLnfesP2NSz9ni8jsN5QUuexQTfnwduwbVIVClF6mTxs/lXow+zrQphJpg7KrbZt+
         yanZ2SDWfod3m05BGsnPn/p5CcgH7z9r9Lny4gy7IXMcG8RURTTkAtZsPcVIZuByRWWN
         0SfympnV6Dcd21ixn52mfJ2gL5Xgrr0cftJnA7V0pUKHaKKNQMjW8tSQC++9/LFCsZEM
         3gKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793015518; x=1793620318;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oXmtbUNcpCmBSBrSPIQ5eCtMYF36AZ7qVO68tUryAUc=;
        b=g5CcJjOkH9BS77TqMTWeYEnGWGGK8J/Pl3yS0v6tCZW8O2OWkyO6uTgiMQWgVuzVhh
         KhESYIubmE/wEc/bI0yBJyeV3tG7nc97xqhi9Cvpv9NffxhnwFAqtAi5HmfvnvG+67Jd
         hkDXAWOIkmP2NIJdM+uAizZEIpvXntOATzpn3MyU/CQPV2G3SVacd6ELFhatq8tnSyYB
         WO4oi9zWmMbn6Ge3tQvELP827q3OZ5Kz9c9xkJMhs/QJcHRKcabY+IkO5jF2wgBka8JE
         ivKW7YkIiKb463OlgaHaTWcvGTQ5mwOZ5oXj7isms544HPYMEzzZ2X2YY+TxhwTAKA6W
         2xzA==
X-Forwarded-Encrypted: i=1; AKwUvBzqidtUxvLAPoXlTmMWP8VDSPjzPSPw7N33VYijKNps1Xo2OJ2N3/0jatiLdiDXxg607H8ZZmPAYmcXsh0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLjGUPf1WPpaClh0aYXw9bhOFvihNZn9xTUFZ/iGNKm/J9JZPIa
	WnfCyC3yDVCatreBFVEryOB32hsJOxmPFvgF3a13BS5F/6tEhhL/j/9pKOsSkdIhdTJM+5kyBFV
	3zBeQQLaVybRL9+MFTH3nNYAcU9tuGfHADXqi5IlvBcuua6cLUn4fBg1H5K72qRsIgQ==
X-Gm-Gg: AYBFou3YTpLU/dayIk56aCaGq/mN/TaBbOWycgz5RzEWcADhnBf5+gRrGzAeFj7sGF5
	pnAwla0yvfBs0feZbs4tsD8fbIoJtBnJxV7vc8/nYVfcsY2/1lo07BHocl1OLf+ZvjphQNjRJgG
	7W+NCDn6L3BOz7I6IxUetOwbigd9p6El2A2CVFDZv0OL0/guWbBj3Os4d2HjdjoW5uvR8HF/iZ0
	2jFLK8YPjX3RLUcVayYsaT/coWkp3ESLMuRfKGY7Py3X9P60onOlC5fQNv8a4FxYbCSmewYf54A
	DblTqEKE78Zx4/lAiXlv3p2HMOUBoJwza+rRFhRRchEr2d691oYPlibbx0DLuO7ERVOCP4YSE/5
	vAqOjMq9GPqB3aAOHmh1M93wvyfeWynCmFK7qKD8f75g8sTcGlohG2w==
X-Received: by 2002:a05:6000:430d:b0:48d:ffcb:28e1 with SMTP id ffacd0b85a97d-48e3eb780b0mr11518122f8f.11.1793015517838;
        Mon, 26 Oct 2026 04:51:57 -0700 (PDT)
X-Received: by 2002:a05:6000:430d:b0:48d:ffcb:28e1 with SMTP id ffacd0b85a97d-48e3eb780b0mr11518084f8f.11.1793015517438;
        Mon, 26 Oct 2026 04:51:57 -0700 (PDT)
Received: from debian (2a01cb0580324c0086a938fffe1eee25.ipv6.abo.wanadoo.fr. [2a01:cb05:8032:4c00:86a9:38ff:fe1e:ee25])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebd48eesm16004691f8f.30.2026.10.26.04.51.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:51:56 -0700 (PDT)
Date: Mon, 26 Oct 2026 12:51:54 +0100
From: Guillaume Nault <gnault@redhat.com>
To: Hengyu Liang <hengyul@cs.unc.edu>
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
	pabeni@redhat.com, netdev@vger.kernel.org, horms@kernel.org,
	jchapman@katalix.com, tparkin@katalix.com,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH net] l2tp: only return sessions of the given tunnel in
 l2tp_session_get()
Message-ID: <at8-2mFyrmPxfu29@debian>
References: <20261025145831.2133617-1-hengyul@cs.unc.edu>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261025145831.2133617-1-hengyul@cs.unc.edu>

On Sun, Oct 25, 2026 at 10:58:31AM -0400, Hengyu Liang wrote:
> @@ -315,10 +315,19 @@ EXPORT_SYMBOL_GPL(l2tp_v2_session_get);
>  struct l2tp_session *l2tp_session_get(const struct net *net, struct sock *sk, int pver,
>  				      u32 tunnel_id, u32 session_id)
>  {
> +	struct l2tp_session *session;
> +
>  	if (pver == L2TP_HDR_VER_2)
>  		return l2tp_v2_session_get(net, tunnel_id, session_id);
> -	else
> -		return l2tp_v3_session_get(net, sk, session_id);
> +
> +	/* An L2TPv3 session ID that has not collided may be in any tunnel */
> +	session = l2tp_v3_session_get(net, sk, session_id);
> +	if (session && session->tunnel->tunnel_id != tunnel_id) {
> +		l2tp_session_put(session);
> +		return NULL;
> +	}
> +
> +	return session;
>  }

The original code looks correct to me. L2TPv3 sessions, unlike L2TPv2
ones, are global to all tunnels sharing the same socket.

