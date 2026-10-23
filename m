Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792774130;
	b=RPK7vlfEF78GyZxOGd6tNV6rt+9XmFMEqsg6K1+Befzpi9M9JUMMAfJ3KEOT34nTmVuv
	 k7HESHGMJLp4PsucnzQ7KUYcLR1Bn13Mq42FSk0QMZ8aPMkhSU0V3Pvn/taHulN/FDeOu
	 XOAtOjOcIA0kUm+n2/o66a82e9mpM/D5VzoeVhIxGahUZf1J3A7TcBSO/G+uhbkpkNdnD
	 9yENKSOtigloNj5BvVHHBHtQklteBWfe5J2jUa+4D306zQumuPHSOCW9yQ7IOxl3AXxvf
	 VflmCmHRxzA3NK0n8m7lRj+CqK+Z2Ly5nL3jAHfXt3+Ttt1I2tEhjSfyFcT9erfX0kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792774130;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=l4yjbuyU9tYNCrKIyPpIJSh4fdlXELraeddszflbbg8=;
	b=qlQXY+q9E86TVUE4hSWyXa26VrxpYMEXt6LdHhdFmVer7X7Q1QVkVqJtKWUR4ZoQ6U4R
	 uJolCz5mzlK3TcyjiMcFl8qoiDSYmedkBNGpxV9DRHTlCGcGWjSIDuC+FvaBYGTmX7HD0
	 eU71iHc4kscMPtVO5Fmgj+5I9PR3hXmu5HrGHUE5D3WL3DgI2Qi677gAip21Mek1do/Lc
	 QiUJfvB+G/yUrtpc5bx1/nL/rmSpVJyE2VpahZAYFyQPSQ6GsaHT57g9Gqblw+E+KCBKK
	 OwkXnfHUmlGdToZt1Me+D/nhypFXlJtYIkq22HgMtinTUNHPgTpKjkbLfDiJ5wDQvIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hknVVBGi;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=BPTSbtP3;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B1A0606A321
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 16:48:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B1A0606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hknVVBGi;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=BPTSbtP3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792774128;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=l4yjbuyU9tYNCrKIyPpIJSh4fdlXELraeddszflbbg8=;
	b=hknVVBGi3BBoXMp9GuJ2irtmN7uo/sD0/Iwsl9Cm6dyxaljk/2u50KNlaiylNHE1aci+fP
	aaZcK+Ud3putda8zqybPqEAQxO1asMcHskvEaGSdWvq0lzN/TPgGbgIUN+9vJbLdu2i3xn
	HGh26ltiYayDZpnzkGpup31bRpAeN4o=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-617-8TboWvApOuWcpQln8DL1bg-1; Fri, 23 Oct 2026 12:48:45 -0400
X-MC-Unique: 8TboWvApOuWcpQln8DL1bg-1
X-Mimecast-MFC-AGG-ID: 8TboWvApOuWcpQln8DL1bg_1792774124
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-48e0461e040so822822f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 09:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792774124; x=1793378924; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=l4yjbuyU9tYNCrKIyPpIJSh4fdlXELraeddszflbbg8=;
        b=BPTSbtP38Ln26csJh7P5NEPySUmwcR/oqoTqdMjgeJkjJBOfGB8oGdKqWEV/5J4sYF
         tQZFeOyjtUZM17SHhTrADGwRtiCxcCFahBStsgRWDzu59gAZSm6ZlcRm5Yu2Acq45xl7
         bq3PxX/+PW7aigDWF5Ew/Y41SiQ5eh1FAZPOyWxn8w1Gu/VWA65StYbjUlx7LXNAMiL2
         dVc4MBmkMHysXZKAuM5sLu+e+Li2DHNMg1GPrnko910TBqQlXSEfXlp4m645oFcA27/y
         aYPiOuNEO1A0vaRAaMqukmjONYIY6oKy/O7nsOAiIQ1z9Yyk5mMfbT2W7m2P73WjIsBv
         7R3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792774124; x=1793378924;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l4yjbuyU9tYNCrKIyPpIJSh4fdlXELraeddszflbbg8=;
        b=Nfus4lfZVpux3M+SDLyypFJU3l6k2uv9L4PB+qfi4XK3sainWpj2rZ6mkxU5jjygQT
         4H4kTX8z+XznQ6sNN7lTca9BWfCQzbXeW0KxO62ulhUghLIlJeJ4NezretSMYH+u/wi8
         leAGKg0PEaC4mCU1ARSSOQWAwHAlXvCYYuQqohtEXNrThpVUMHBcC7DxwYMFRY8Bc5Ex
         IaLqE9JE7yhVCPMPhwtGUl9RSKyvoEtaTCMBXZG0M0RMLyTtGO8IOHTj3SIt0pkDa5O5
         Qg3Eapx8pLbFD9KlmF/nAiZ6VzHo2b1G/2U20fNOGDepZmuwXxcY5aPqZK6sXzidFXEN
         fPzA==
X-Gm-Message-State: AFq9FYLKb7+5TQqB27XSCZfZQ8BtrCPenCPbxSAVX0xIjU1JmcAuVlnT
	enGPun8UlFB5CaUqa9CkIf6na4wXy1fgEgLkJ1UPjjduOXlU50H1iq+HPrxrw38YYwYz+yWv25e
	rIvtayxAJeWSc9fHrtkTyzQmh+74dVPO4N5cv73DAhac6kV8h+907llcIum+z07glO9KzSaAU77
	8n6V59VvaHFbCVz7scwhIyjI1mnlNQIAha4BleUxYPmP8=
X-Gm-Gg: AYBFou1KaUtBbV41sHBwIkeiO5ap8Dp2WPZo4hU5AJrcmX08jhWXwrWwKNoiiHwNIpW
	KuidsHJYVeVNYFnol6Z3dYEDko/0rifKTjfWBwS+HG0fEdooZrcW9w71CJ0I889//chtjmPSUHp
	WXFAlNXqMfJG6+QAemrrO9NWP3pza78nffA/k0Qp129iEqjA5wj92Xc0ymbU2D6zti2Nhp09DfV
	fL2cpdmMflAXjqyC/ARXyb8M6muVdBMnYdCgfyq59AdrraHDhfk22qllxTT0XuHdlRa76jACGii
	iFhD8ufq6jlJOA8mtlelNqfPjh06EJ8xyWmv4CiMj910LagkabAtNrlzdEoHd1F1JqoUYco=
X-Received: by 2002:a05:6000:4026:b0:48d:eb6b:9d0f with SMTP id ffacd0b85a97d-48e385ac430mr4702419f8f.11.1792774124129;
        Fri, 23 Oct 2026 09:48:44 -0700 (PDT)
X-Received: by 2002:a05:6000:4026:b0:48d:eb6b:9d0f with SMTP id ffacd0b85a97d-48e385ac430mr4702351f8f.11.1792774123549;
        Fri, 23 Oct 2026 09:48:43 -0700 (PDT)
Received: from redhat.com ([2a06:c701:73f6:2400:30a8:9e33:7d82:c035])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d37c4b7sm1157431f8f.2.2026.10.23.09.48.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 09:48:42 -0700 (PDT)
Date: Fri, 23 Oct 2026 12:48:39 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	Chris Arges <carges@cloudflare.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
	Phil Sutter <phil@nwl.cc>, Jason Wang <jasowangio@gmail.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, virtualization@lists.linux.dev,
	Max Krasnyansky <maxk@qualcomm.com>,
	Rusty Russell <rusty@rustcorp.com.au>,
	Pablo Neira Ayuso <pablo@netfilter.org>,
	Florian Westphal <fw@strlen.de>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	Ido Schimmel <idosch@nvidia.com>, Simon Horman <horms@kernel.org>,
	David Ahern <dsahern@kernel.org>, netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org, bridge@lists.linux.dev
Subject: Re: [PATCH net v6 6/6] net: add ip4_parse()
Message-ID: <20261023124740-mutt-send-email-mst@kernel.org>
References: <cover.v6.git.mst@redhat.com>
 <970e2341834eadcf265fa7dd61a05ee305fdc1e4.1792687500.git.mst@redhat.com>
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
In-Reply-To: <970e2341834eadcf265fa7dd61a05ee305fdc1e4.1792687500.git.mst@redhat.com>


This one was sent by mistake. Pls ignore.

