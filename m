Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8346522686
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 08:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790066818; cv=none; b=ZkRL4WL1XJexV0wQcLmeP6UR71FbTnbIlJdnFBquricsZvILpz7WUVfzSGArm+BVZU8IJTuCeb618jbLSGUe3xcPZ67Cy3nJTwSsANE3R1tm3BHkOezom7K3ReLUa6vO0EKpFp+vXroBSv7J8hV+PgYaTAzyEYoj8d1PRUzVqpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790066818; c=relaxed/simple;
	bh=hEj5nL9MRpMH+JX12YZNspzZFd1+3Fuf+CZGgePMxM4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gM5WtwUk3M7TrubweHF/xQnThN4UYAla/oGRBmSUKy6voiWj4klKWMyqu+3tkK8sXj/5i5TuCowbSzhlHpw4Xn4UfHbZ02+P/7dlZIm3UGnV7e1GFQDDY8Pae+coJznRsTi4kPtlzWqEv325gdMp357r1/rGbM6VOlR9kOS5WNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IYBKNLtQ; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=WaYJ8M0W; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IYBKNLtQ";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="WaYJ8M0W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790066815;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=C95bRAv5IkFCsxK5LjzncGYLGpBLHTNK6JTZFhyWW0M=;
	b=IYBKNLtQq8wTUycH85md9ifO3UzdBdQpmXnhcI9WuMUbzlJTZb2nJoqTJfUGv/jkxW+2df
	Q6/0abTDQLcb41eolbGg5OtlRpucdzzl5QIHymKupyLRdX/r9s70yGIJ1MliJgs8JNm5Z+
	SWpooAx5kvmxb+KysJsp5NFMcJny9wA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-231-1h1d9rLcMZ6agkLUYPHl_w-1; Tue, 22 Sep 2026 04:46:54 -0400
X-MC-Unique: 1h1d9rLcMZ6agkLUYPHl_w-1
X-Mimecast-MFC-AGG-ID: 1h1d9rLcMZ6agkLUYPHl_w_1790066813
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-49e7631c43aso50743555e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 01:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790066813; x=1790671613; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C95bRAv5IkFCsxK5LjzncGYLGpBLHTNK6JTZFhyWW0M=;
        b=WaYJ8M0WDXY41t6aJdV7dAtLD/WG9BCa/2mVdYHEDhRiXod0jioeiS2VtDV6Az20T7
         +Gr5LExcSy4Ohg55uWipz3cTnR3X5yZ5Vrt3O1jcfjIJXGVmEb62WZWwUXYJfrNtTYV3
         gjCLuime50/prA+2ewWPzEGdksjxsuIW2XXn+WOC49hXygfCGlALNjwZD+au/Rmiarrz
         a8hNui9wBUadUJBh10cz5P/IAhq1F8jYrrl8p64nuynZB/YFqgf+HF+ASUJIMXfAu9Tq
         6iWjtEM/9Wp196S8wQxONv3r6kNIo0cZfqqbyuIVxvcyXASjjndyrHKkyhslSraLunjy
         aWJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790066813; x=1790671613;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C95bRAv5IkFCsxK5LjzncGYLGpBLHTNK6JTZFhyWW0M=;
        b=Ct3eGyacFMi39Y+x4BxmlXC3JP9iL8D/fZJNbFXPzOhUlJK6ylntlHzndmzNbryFJe
         e1aXIkDx7KFClES3ODi+Lzs1RDqqw+7zv4oj/gJ8Ii4xBUhGxOAsriHi6p8wlxreFw1L
         Scf0GUaOZYihNxhV387TAHZfKJWapvMNNddDKnGeZYSwmWMIYxTfxVczoVhtovC5C435
         4mAjhtO8wYFB3lmNCQJ5S/qUeXPhjcwe2aYeTj4JEjK9OyZf6lWIQR6uEfkIojeb77uf
         BXnI9f8ryhzA3ApIWh6+8ahxe7Nw+bUomhd9agbyMvXAKVTLhgCWc6H3QNVqyBxfGq3I
         wrZw==
X-Forwarded-Encrypted: i=1; AKwUvBzEyFLagAL3lzUn9OSMNNsYIWQRsClfdf/0JcdQQW/CzkDYk5nXWoNSPtafPtKSp83BSXbmGFF9miNPn1k=@vger.kernel.org
X-Gm-Message-State: AFuF++lqhyuW7XgxhrLvuL+69wCwzabkXcdJw/bf8N773q1DDJEhopjK
	Jyhf+YyPQYfunCouoXIThGmp8V8d5i1rps+3xl8bj6Cly5Xmj+ymZx+JNQlQ9afnuOE082Lt+DJ
	CIA3kGGYPv7BukdefaqgpZQs8C1LWWCKexYawHCnCl8qKbJV894s6FO3lZK/VZMz81Q==
X-Gm-Gg: AYBFou1U9S4n6kOic07k1JxsLZK8Aox6u5NK2H+P5rvC2t3qDb+KH/vE2IFy+Wn9gfM
	jvZm2DtDoR6st9Ok9Itu6ni2YHh++9gcYCyzZzUpkCy2WY6Sla0xi3B/ahmOWNKG23Shyso4FgI
	GKoPS09KceUdmLij6CFzAWJ5PL1Q6ATz5YIld012GGYjxfmAEQ4MGG+J/Mq60qJnPPi4IUXiKra
	e2N7YEqtAgLbjyffaL1McChdezXRebSXQf2T16eaEdsr4EzmfYJD7Tl5f2DHdgzhzayVdSg8egT
	dEhlIcna44S/Gsyto/dNpqAOKP4gy7eozLE05+0D87nmMM3JvXeDpYGi5Hj9DWj6qkuivxqzVBR
	JMKcX/3p3j2SC8AKSrcZqxDk=
X-Received: by 2002:a05:600c:19cd:b0:499:7a15:fcec with SMTP id 5b1f17b1804b1-49fc5695861mr190094735e9.13.1790066813162;
        Tue, 22 Sep 2026 01:46:53 -0700 (PDT)
X-Received: by 2002:a05:600c:19cd:b0:499:7a15:fcec with SMTP id 5b1f17b1804b1-49fc5695861mr190094445e9.13.1790066812661;
        Tue, 22 Sep 2026 01:46:52 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-79-236.inter.net.il. [80.230.79.236])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fd8ccd185sm65246905e9.8.2026.09.22.01.46.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 01:46:52 -0700 (PDT)
Date: Tue, 22 Sep 2026 04:46:47 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Paulos Yibelo <habte.yibelo@gmail.com>, netdev@vger.kernel.org,
	richard@nod.at, anton.ivanov@cambridgegreys.com,
	willemdebruijn.kernel@gmail.com, jasowangio@gmail.com,
	eperezma@redhat.com, xuanzhuo@linux.alibaba.com,
	andrew+netdev@lunn.ch, pablo@netfilter.org, fw@strlen.de,
	phil@nwl.cc, razor@blackwall.org, idosch@nvidia.com,
	dsahern@kernel.org, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
	linux-um@lists.infradead.org, virtualization@lists.linux.dev,
	netfilter-devel@vger.kernel.org, coreteam@netfilter.org,
	bridge@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v6 1/2] net: validate virtio checksum start after
 network header
Message-ID: <20260922044627-mutt-send-email-mst@kernel.org>
References: <20260922030310.8684-1-habte.yibelo@gmail.com>
 <20260922030310.8684-2-habte.yibelo@gmail.com>
 <20260922005353-mutt-send-email-mst@kernel.org>
 <aa560d2d2cbf94e50397740159c12e24e0ecf820.camel@sipsolutions.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aa560d2d2cbf94e50397740159c12e24e0ecf820.camel@sipsolutions.net>

On Tue, Sep 22, 2026 at 07:56:23AM +0200, Johannes Berg wrote:
> On Tue, 2026-09-22 at 01:14 -0400, Michael S. Tsirkin wrote:
> > 
> > >  
> > > +/*
> > > + * Return the L3 offset and protocol of an Ethernet frame starting at skb->data.
> > > + * The offset is unused without NEEDS_CSUM, so avoid parsing and return zero.
> > > + */
> > 
> > for networking code multiline comments:
> > 
> > /* always
> >  * look like this
> >  */
> > 
> > /*
> >  * never
> >  * like this
> >  */
> 
> This, for the record, is't really true any more - we dropped the special
> rule a few years ago.
> 
> johannes

Oh good to know. thanks!

