Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0705F55293F
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 15:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790090875; cv=none; b=VmetuNTEEjtSJtxF/Hrll9PHRJOzoJmBravWrJ/AbwXA7lDpYUXFxbOzTrnwVkESG0PT8xrNoWZm7E1EcPkOgEwLk3LJUerrpYelL4jELHk4vOSlkQBvkcnTaF0i4J3tI5gnrEHwoP+ALX5QCtxRB4bziiqo+0PSf6G6oWS1BWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790090875; c=relaxed/simple;
	bh=H6M2+2ePKHnNXtCxv8bZ8wAVt5XsjCTjUh+IXXp4Ros=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=SJle4Bgr/D6Il2wOHl4+ws2sH3MtYTXk3xsWR9GDzIsTYM+ea5PU8pEviXDD/0Pn+Zf3N2Qv+56bOH17UivRiAEpsqxyNlsZEJCdZ+PVxa3OV7kRVqmsfeg5f1aBL8r1rgG8JgYBpnKKAWEgk31lRt8vv13xqYVLLuZSfZeC8cQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Lar+5f6g; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=cbJN0B15; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Lar+5f6g";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="cbJN0B15"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790090869;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SEowbgJIDHpYJATL6KIUYHLNQoCqqGPHET4KCWOduog=;
	b=Lar+5f6gNfR6QjZqFI0ZY2Fz71wICfMRSCHvd67yzqLNadh70+SPTAwi/bsSubIcYWQb07
	ZGF/lAertlInzVSkaZPC+QrsGo5pNcfaZ5/JbVhWfYQi1Ncfo3qUhKQhW3wz+uIwUhOMS5
	up4vSCf3KBDt8MaTfhQPJsrQNFE6bUw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-361-_N0LdrE8NcCvEpEc1l1-Eg-1; Tue, 22 Sep 2026 11:27:48 -0400
X-MC-Unique: _N0LdrE8NcCvEpEc1l1-Eg-1
X-Mimecast-MFC-AGG-ID: _N0LdrE8NcCvEpEc1l1-Eg_1790090867
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-47d81cf0c4cso27386f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 08:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790090867; x=1790695667; darn=vger.kernel.org;
        h=content-type:mime-version:user-agent:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SEowbgJIDHpYJATL6KIUYHLNQoCqqGPHET4KCWOduog=;
        b=cbJN0B151Ta+VBlvHJEdHry0GaMsQGfYgyiPxEsuqVqLVrWVxOpewoausweIOWbH/3
         Ha4fr8Rtu/iSmvJ+XPobzo2KQrZ5fKqqQiLXgolbT0uUnnb39TMKUZJDuhr7wo4z+xPl
         HFjpX5123qWRXpCx8ky/ZrdBqM4++vy7l4ejzSlZzF+u5iOlo3xjgTGIkF7kdoAeLsrP
         DA5AwMKcHoD8pN+XB8lGEY+mZeSajYvYr18yucGeDOBMNaWDZW82qohRyfPeFHsvkohb
         mPw8wQgKTUq0uhmbXdXuBUifnzp5IXGsHmTzeZth+HHDRAIDiDBu/TKm5NnF7gVS7qAu
         s99Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790090867; x=1790695667;
        h=content-type:mime-version:user-agent:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=SEowbgJIDHpYJATL6KIUYHLNQoCqqGPHET4KCWOduog=;
        b=ZH6k3uid56a9cOqq2yq5DtryzvUw1siFBE5lQXca4MLoOV54NN9dPW4iF/AV5RkhKT
         j4P8XDBTI/mwLEaQVT5TW9/RoH/rfpo0Mp3cpj8hDSs+ckEVlTTRq6bHm1vKI83VCgHo
         BgLRvatfFmlFq9FtPmAmjRpt5PSM4PSQFaY4ZUvJcVdYCnJoowVqTNiYaHAolM5ETwUj
         h2n6eycY1cDo1a0oWyKRK4ggCqNVVn3y1ESG5xNNxz+KFyLpFVl7t6D9SA0eghwsM/d9
         5Xw0B++oGOQ/fm9mI27TwlmF0+6vNWJ4apJnoQ+lrbhen0TVearSoovceSla13290jv7
         6ajw==
X-Forwarded-Encrypted: i=1; AKwUvBzwCdbdpaj1fhRodvjohYFjRnjBqIA1cctFNUmEoeZGrBKx01k8I+bP9yfBCe0ZNOb+qrx1MemJjMLM950=@vger.kernel.org
X-Gm-Message-State: AFuF++mJP3Bjir1y+SoCx6cdKVF4kGlXIUbRoXa5iIA8K+dhk9ZLY/7Q
	/m594H8nQWWgp/9OPM17pxWP8L+Kn6oQTM4XhmDXEiY020czTun61PQCMvFCCSGR5G8+YTDZgt6
	SCN31GovHqkbPx9HihYjE4CEmn9AK2a+MGfoB6OaLv17c4WXqTHY6oioYIuNfzFbKbw==
X-Gm-Gg: AYBFou0wAEZuaAbAXA+TyuaqHUokYx+KllXT7nHNdpv+ApkNQr8+btMLilnxjfh9D9a
	GbGYjWqxe84QkfP5sjt+rZEwxrOYpyG9GOxN31wfu7vqdJ9Jal+IwLIy4ZJMRLpMPLiCT5gjpI4
	DxbL4cxgIkVP7Fb1nSWiPeKRsNtISzF5iia/S2Cg2Gvl45m2vE0/ZdNJPtGk3HMUGSMU/3LU+GW
	N8NqdqbV4zlynqnAePFY5zgoCswYhI90/a4uzDD3NX7QC/3CfA8XQEW4dI8ak281M+UH17sF9QK
	EjhIXNEANaZrYwUiKDYnGSHFuUCULLqqKeVqfm++/mIE9xqLEwRiQru1iwWGDB039G0mGuNw2QI
	dVXki7PUx/xcnIEy8XNlDPDctIdBj
X-Received: by 2002:a05:600c:34c7:b0:49c:ff8d:b548 with SMTP id 5b1f17b1804b1-49fc5726cfcmr277167015e9.11.1790090867463;
        Tue, 22 Sep 2026 08:27:47 -0700 (PDT)
X-Received: by 2002:a05:600c:34c7:b0:49c:ff8d:b548 with SMTP id 5b1f17b1804b1-49fc5726cfcmr277166705e9.11.1790090867129;
        Tue, 22 Sep 2026 08:27:47 -0700 (PDT)
Received: from aconole-thinkpadt14gen4.rmtusnh.csb ([216.212.25.12])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fdab0e46fsm13166415e9.3.2026.09.22.08.27.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 08:27:46 -0700 (PDT)
From: Aaron Conole <aconole@redhat.com>
To: Ilya Maximets <i.maximets@ovn.org>
Cc: netdev@vger.kernel.org,  Pablo Neira Ayuso <pablo@netfilter.org>,
  Florian Westphal <fw@strlen.de>,  Phil Sutter <phil@nwl.cc>,  "David S.
 Miller" <davem@davemloft.net>,  Eric Dumazet <edumazet@google.com>,  Jakub
 Kicinski <kuba@kernel.org>,  Paolo Abeni <pabeni@redhat.com>,  Simon
 Horman <horms@kernel.org>,  Eelco Chaudron <echaudro@redhat.com>,  Jamal
 Hadi Salim <jhs@mojatatu.com>,  Jiri Pirko <jiri@resnulli.us>,  Xin Long
 <lucien.xin@gmail.com>,  Marcelo Ricardo Leitner
 <marcelo.leitner@gmail.com>,  netfilter-devel@vger.kernel.org,
  coreteam@netfilter.org,  linux-kernel@vger.kernel.org,
  dev@openvswitch.org,  stable@vger.kernel.org
Subject: Re: [PATCH net 5/6] net/sched: act_ct: remove 'add_helper' dead code
In-Reply-To: <20260921145655.3167436-6-i.maximets@ovn.org> (Ilya Maximets's
	message of "Mon, 21 Sep 2026 16:55:47 +0200")
References: <20260921145655.3167436-1-i.maximets@ovn.org>
	<20260921145655.3167436-6-i.maximets@ovn.org>
Date: Tue, 22 Sep 2026 11:27:43 -0400
Message-ID: <f7t8q4tb91s.fsf@aconole-thinkpadt14gen4.rmtusnh.csb>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Ilya Maximets <i.maximets@ovn.org> writes:

> This variable can only become 'true' when the connection is not
> confirmed, but it is only checked when it is confirmed.  So, it can be
> treated as being always false and just removed.
>
> Fixes: a21b06e73191 ("net: sched: add helper support in act_ct")
> Cc: stable@vger.kernel.org
> Signed-off-by: Ilya Maximets <i.maximets@ovn.org>
> ---

Reviewed-by: Aaron Conole <aconole@redhat.com>

