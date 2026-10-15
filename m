Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B645352759D
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 12:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792068090; cv=none; b=pAv+u6FhMYASalR0UUJG4NU3zAkDLgJKh2c981CMLYLNSpoHcc3b9cvU1AqtQOdd/QW0wReNaH4Qsfc90SYioz3cf0BecLxDzSj5SKQ2U8MrTDfB8Z/8L536nu9hYmF5IjrU/C+F7UQAmItyTXD1GXW9bm+cIQOsy3SZSYDnJec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792068090; c=relaxed/simple;
	bh=B9H+Ad0yi56qqX3Wrqd3mE/6pQkLakPw4j1ZK3PT0YM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t0tQC4lgJJka5Uc27NuorFhbY5HrCrlY3zEKcMMnjdaNSGHi9q6pI373/YPbB2/IrsarMMhcV0UTaLNDjQqcya/XAiuUDTlabph7H5w/qaJLb5Kt2CqjBBALErniS3iNFGLGYw8n8eAl4tVLGSiWJsg6+rFnbXlVdeOFjUIwthg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=atd7Eoj1; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=AbGvYkZ4; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="atd7Eoj1";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="AbGvYkZ4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792068087;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pEV7NzYtQRgE9IRDA9odxEpqlMO8W0BmhwXqYIjgqPM=;
	b=atd7Eoj1VotY7VRlNhYFkqOO9LK2uU8r1j9U3V+Zxzwr2ETnh6EbfOPbkKY4TMH9Ayi0uL
	ZSD07x47EM4BQPmVoHOmJ26J3ShrECB1A/AyiCRrFzQndkHrZwtm4MQsyvPHxwhRWIEOaO
	yDSdhQU7hqyU0agN4vYBBrmzeWKiNlo=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-675-_mhPB82LMtOk8P9-DvcJWA-1; Thu, 15 Oct 2026 12:41:26 +0000
X-MC-Unique: _mhPB82LMtOk8P9-DvcJWA-1
X-Mimecast-MFC-AGG-ID: _mhPB82LMtOk8P9-DvcJWA_1792068085
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-4887e5afd67so4019372f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 05:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792068085; x=1792672885; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pEV7NzYtQRgE9IRDA9odxEpqlMO8W0BmhwXqYIjgqPM=;
        b=AbGvYkZ4TxllfD2DAaTPBCOB5VVDgXqZCK6bJvUrFgWuCRB2MtWe2UKeNmJmFaoR3Z
         GmPytInp9yfZz2pEftYFF3CMZRN+UKCsliNoq9Bt0nIFk0j4HzJiYSNnqRnQzYpxsBdA
         cvSvqIigwC1gEado1848+6X+LHnbvrUp04+vcZR3b+S8ffYGNuik/vIIvH9hmXwRLTGV
         aOdIQxPCzjRKvvsYEjbjgZ+Ioi/vpEs0qEwRj7qXNTeyNrlDmawIYMdd1ogvX6s+uYYk
         5MIKSqvCaSHjy7eq+4wc6SPhRNgppDxdQMAcSvJjlDduG8rzyQiLjBrAm84kPzCJnaJ6
         Ub6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792068085; x=1792672885;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pEV7NzYtQRgE9IRDA9odxEpqlMO8W0BmhwXqYIjgqPM=;
        b=v3CuRBqk/FY9KwpHKZXWtZkoaZxbniOPX4Wt9JxHQxQFEQz/nwBJF3DoIqiRwy0KpV
         0+U/NueJDCoVQGoPy3c134mhSPEvj8MWqVqNEeARdgQ9ndv/STQBrXY6jwF+kEFz6caJ
         DLMUW9YJnlbY0nmWgL+2x9+EUuM2Z8JIcbYKo+1sf4m/IaQuu5FV23twSvTINwrD5dLC
         A7ynMonPbC3OwBMkEDXP9aEWRKvMRZOWO3I+ez8R4Fy5yS90qxxDral4DFerkzWzKw1Z
         tk2hd9HfcK2ViprBP9Cg6lMpJiAFhTLjxzVlenPZZKR6QZem+Q+uhBHqddSibEKhlqVb
         dYuw==
X-Gm-Message-State: AFq9FYKDy0Ix3Jlc6zebNOLCNIMp1h91/r6p7SS4IlradmXdJX1voY2M
	MCEe+p/DzEqir5ZqgGWFils4GVWZbi4ESsbedck6+3KaKzuNESk3JGRXq4Btv51SU3cPbLQ9afn
	ZnJigtHQI/aCPuKjowLKiiLcp2PaiI5mmSPRJzHrAtrz3tHUH3r5S91mb4VEJwtnB2mIptFZeXo
	SDlagGqK5b6WckBTSkYYGYfjJ/7rkApFZY0hr86z7m9uY=
X-Gm-Gg: AYBFou2+yjC5x2LCOwTKWrCiBwzSGtc5et2Ggw6z2nU/m2HiwOMMy0CQpIpYj2luFIu
	ygjqOo+advawWr6E1qORuPzVoyt8AtZAJxGdCUW+Eu+M9MvSd5PRMABKFRpA/OvHBWf6WXaUG81
	CXNinpYk9YVt0E6EWKYeBy14eopumDeyLVnmL3Pyx/SQSmbg5JMJKoWENi7ZyUSN9qzh5LuB9rl
	vGed9CtVWnzD3TNfuyXqcz4OkS0FI6YI1+MojDQIcvQVfrJTSmSeU/okgqDWkJCLbpPEKLFRf+R
	7BOsQ/cBBkZvmHcl+czfkMqZeLa2Wof9+I0OJyLQ9SpchGzSsR/UrllAnST7q7TCFD8+OA==
X-Received: by 2002:a05:6000:1868:b0:48d:db43:9187 with SMTP id ffacd0b85a97d-48dece6d67amr10912260f8f.16.1792068085166;
        Thu, 15 Oct 2026 05:41:25 -0700 (PDT)
X-Received: by 2002:a05:6000:1868:b0:48d:db43:9187 with SMTP id ffacd0b85a97d-48dece6d67amr10912175f8f.16.1792068084547;
        Thu, 15 Oct 2026 05:41:24 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:3fd7:5300:3d6b:52a4:a23f:9d0b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de09693c7sm23198836f8f.4.2026.10.15.05.41.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 05:41:22 -0700 (PDT)
Date: Thu, 15 Oct 2026 08:41:20 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	Jason Wang <jasowangio@gmail.com>,
	Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, virtualization@lists.linux.dev,
	Rusty Russell <rusty@rustcorp.com.au>,
	Max Krasnyansky <maxk@qualcomm.com>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	linux-um@lists.infradead.org
Subject: [PATCH net-next v2 2/7] um: vector: honor virtio net hdr conversion
 failures
Message-ID: <6716834884238de0ab1ab313004044122aa2adbf.1792067836.git.mst@redhat.com>
References: <cover.1792067836.git.mst@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1792067836.git.mst@redhat.com>
X-Mailer: git-send-email 2.51.2.2891.g4157995a80.dirty
X-Mutt-Fcc: =sent

virtio_net_hdr_to_skb() refuses packets whose checksum metadata
it cannot make sense of, but the vector raw transport ignored
its return value: rejected packets went on into the stack with
their metadata unvalidated.

Propagate the failure.

Assisted-by: LLM
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 arch/um/drivers/vector_transports.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/um/drivers/vector_transports.c b/arch/um/drivers/vector_transports.c
index e1fb2a76fdff..8b7548458663 100644
--- a/arch/um/drivers/vector_transports.c
+++ b/arch/um/drivers/vector_transports.c
@@ -210,7 +210,9 @@ static int raw_verify_header(
 		return 1;
 
 	skb_set_network_header(skb, ETH_HLEN);
-	virtio_net_hdr_to_skb(skb, vheader, virtio_legacy_is_little_endian());
+	if (virtio_net_hdr_to_skb(skb, vheader,
+			virtio_legacy_is_little_endian()) < 0)
+		return -1;
 	return 0;
 }
 
-- 
MST

