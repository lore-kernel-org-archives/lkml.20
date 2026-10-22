Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792673931;
	b=3K4jqTbNr0txLCV+ulelXyMkb6S3qNpldIqfKEFc0gjbp5PW+NBEUKn7VLiaowWZvtoZ
	 CtXB6rWVu16eSPNI5SYFFsYMC9lfoGRm7c+NSBNCwQwK9gkwoI64w+d1+iX9n6QjnfdJj
	 88f2Uous37rw9c6J1KtbKgXr4jCqqwSU0Zkh88PKWJp09zuSRzsAwpOS5ymTlOwKdqo0Y
	 7+Bth2pivt7a1XkPspG7voiG52BWX7nJSOC2VRhQlTpUqKpnnXq1gV+diJRPmHU7Ic2ZL
	 f1TFaroU625/O9KMoQIZEm6z7fNC4YRmwKYy+oYNjf/ehmCSIzotdDNafNL8aiU+GEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792673931;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:X-Mailer:
	 X-Mutt-Fcc;
	bh=Wm2lsA+w7xm6rhMTdU3cXhV3KJ+IpR+CE+ng3KKGWSc=;
	b=aTtCXs08zK0XPR3fjAJ0NuX61p02VI8jLKYOYSDz3JimpKG6KLNd38KmWS5IBSYHK80/
	 zEX0jDV0ZfozufRjtboJaZwBQwPHhhtw1bG36nHKhqL9CB8Z74bvpmLaeZhx1txPputIe
	 l8bO8MRQx7ti/OZTgj5/GGQNg7LkTgrh7j7pj67h3x1gBylY8WKyxpk5VRLH88xBb5LaV
	 09/TAcU0XDhYmyqKDK0tUOrzSSd3LPnnXTY//AmriL2LxI770pbXe7TBjvWNkQ1GlgPaI
	 hh1LfdH6qctuL2P1Q2Z8HbS3TsFSAhJM7Jdqrz7qKE6TXeWq/K0B93bocq+Dj189s3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UOkwyOw5;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=sVwcwAZQ;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57029606A327
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 12:58:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57029606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UOkwyOw5;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=sVwcwAZQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792673930;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Wm2lsA+w7xm6rhMTdU3cXhV3KJ+IpR+CE+ng3KKGWSc=;
	b=UOkwyOw50uxrdcB9rIjqagYxPIZVft2fckvoA+xmP12eoGHqDb8j76NlOUpEonoPVdtOvB
	jGOOpDxyhvPS950jjhlIuvkmQfzPno2bQy/YUzaIVlpk5gecFKxpGrbVhtOwtdaKyPqMuc
	1T/FXe0fGu0sn/xk4J2C9v9zKHVXomQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-442-H9SIt9jZPy28l_PC_kOPdg-1; Thu, 22 Oct 2026 12:58:43 +0000
X-MC-Unique: H9SIt9jZPy28l_PC_kOPdg-1
X-Mimecast-MFC-AGG-ID: H9SIt9jZPy28l_PC_kOPdg_1792673922
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-48e0af48c18so1550737f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 05:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792673922; x=1793278722; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Wm2lsA+w7xm6rhMTdU3cXhV3KJ+IpR+CE+ng3KKGWSc=;
        b=sVwcwAZQhTs/O2+eL8iiHNYEuYXjpLOtcs/sTjpZAHC/YnK1MwdcOPe6LsosJtz55V
         y2PT8jdpEgnaLP32JCcgJIiE51q3jw6KgCJ80LTeJmRhSFCvKoKM0XN+OqObDDKA3nFz
         Fw+JM2SEnbyUKGuY+QJxztRr87u5yyEvIfysWhNBv0JrWcdHWQ2gBjtP7InL5B6zZ2Aa
         +v+r4BkvNCZ+GKVD/KpZjPthMgzymD7PaCyVRoSz/ZnIpWHoBYgkRm0FkEfhPy+FGVCH
         SF5BkiTldp1I/SgJT0t5NDPTKtAL7zCTO/GYQykZGkWPITFupdCzKscJTpgrLICVbSre
         aXzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792673922; x=1793278722;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Wm2lsA+w7xm6rhMTdU3cXhV3KJ+IpR+CE+ng3KKGWSc=;
        b=AFSZCFnmpm8chPd/C39NzIwafiim/jpsWcjKhjPT6g3PdDyq4wa/o7/CukpXOQS7xA
         R4GlzqmvvaLB2u5omy6RPCTSS0wXVux789CYXz9aWbSQ5vbFLvyznE/1bwjQdQVbYmdh
         bA8Sw4Ezi0vHxtOnGYoicbuxlE+/e1BfMOHH842fp3XVsNCdTSsn9h0TD2SG5TdtGTzt
         fRqI368LEMiqrm1n9qXf1STG6W3TO6UHeINqUBBDmC9y88BcT3l2lIiaw+UGyuhuZEz5
         B9g/qCnZbC3nAFtxTl+Cl9l0sLdG7Q3O+QjQsLIYuCv7XnKZPJU/Vjp6Yn3HV8wz+Wya
         VQyg==
X-Gm-Message-State: AFq9FYJ7lrSrSPMkMPYRmQ67gMuD83Hlm7E7DXyXauJCz+OuqC6En1s8
	Yj7K++mwTkAJv7+mH5X5+uoLzBK5aco689XKYyqSfl56vBjn7PMUAKdufcGAQQbgd3er4l8HGg9
	RuESgzs2D1vtveCFJ4gek5+HLJ97nc01moU2Cg/B7j7qOxvcFr4x69QfTL/3xeEQKA3LwLKANzL
	uvZQ0BFELJ9bhSohg9hrXcIcRPEUEnC7ejNXNsB6C8nzI=
X-Gm-Gg: AYBFou3cIaJkUfAdSJ0rSG7REQqnsoPxqyAZYdIO4RiM4OfMVRUt8LnYjiiAR5Z59n8
	TxZB59/sl4di8zqFmmjNxS7r65nfPt+uCYO929ktZzryU7bMLo/DNysWM2+3+IrCfEOTJQukLPP
	58jTv1LgI+3nWP5YblltiIjnUKWxZKarSfZDRohOICzNdTNARvDpeQkgGPAHWZ5+868pCgxI7SY
	mY/76VDb1yn7kAc4slf9RN74WgSInNH+iFHs6NY+775X4vOii/u4WmP+zJHNEfyWl3hXeYM+QTt
	xLGxZ/PMSdYIrcH2ryvjTw+RVZ0FRzXgvWwPREDQ7hCVUCEMJxiftRhFvmOx1NJY1ik=
X-Received: by 2002:a7b:cbd0:0:b0:4a1:f9e6:f418 with SMTP id 5b1f17b1804b1-4a1fdd22fb0mr76175265e9.34.1792673921703;
        Thu, 22 Oct 2026 05:58:41 -0700 (PDT)
X-Received: by 2002:a7b:cbd0:0:b0:4a1:f9e6:f418 with SMTP id 5b1f17b1804b1-4a1fdd22fb0mr76174745e9.34.1792673921125;
        Thu, 22 Oct 2026 05:58:41 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1536:fc00:b838:383:1c7:6e81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a203a62aaasm69570865e9.15.2026.10.22.05.58.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 05:58:38 -0700 (PDT)
Date: Thu, 22 Oct 2026 08:58:36 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	Chris Arges <carges@cloudflare.com>,
	=?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
	Phil Sutter <phil@nwl.cc>, Jason Wang <jasowangio@gmail.com>,
	Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, virtualization@lists.linux.dev,
	Max Krasnyansky <maxk@qualcomm.com>,
	Rusty Russell <rusty@rustcorp.com.au>
Subject: [PATCH net v5 7/7] virtio_net: cleanup protocol calculation
Message-ID: <f8621d16cf0c67335641d07c1555ec1e43f17628.1792668082.git.mst@redhat.com>
References: <cover.v5.git.mst@redhat.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.v5.git.mst@redhat.com>
X-Mailer: git-send-email 2.51.2.2891.g4157995a80.dirty
X-Mutt-Fcc: =sent

A trivial cleanup removing a duplicated code line.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Björn Töpel <bjorn@kernel.org>
---
 include/linux/virtio_net.h | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/include/linux/virtio_net.h b/include/linux/virtio_net.h
index 063cc116e51a..e984e446ba44 100644
--- a/include/linux/virtio_net.h
+++ b/include/linux/virtio_net.h
@@ -613,8 +613,8 @@ virtio_net_hdr_tnl_to_skb(struct sk_buff *skb,
 			return -EINVAL;
 	}
 
-	skb_set_inner_protocol(skb, inner_isv6 ? htons(ETH_P_IPV6) :
-			    htons(ETH_P_IP));
+	inner_proto = inner_isv6 ? htons(ETH_P_IPV6) : htons(ETH_P_IP);
+	skb_set_inner_protocol(skb, inner_proto);
 	if (hdr->flags & VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM) {
 		if (!tnl_csum_negotiated)
 			return -EINVAL;
@@ -638,7 +638,6 @@ virtio_net_hdr_tnl_to_skb(struct sk_buff *skb,
 	 * We know VIRTIO_NET_HDR_F_NEEDS_CSUM was set so __virtio_net_hdr_to_skb
 	 * set CHECKSUM_PARTIAL.
 	 */
-	inner_proto = inner_isv6 ? htons(ETH_P_IPV6) : htons(ETH_P_IP);
 	if (virtio_net_csum_partial_ok_at_offset(skb, gso_inner_type, inner_nh,
 						 inner_proto))
 		return 0;
-- 
MST

