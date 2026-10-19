Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50D614E533B
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 12:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792411402; cv=none; b=liYgmyObCiy7kAcgqroE8XEGw4VpLp2SmIBTsrf6BAukI43zjhGkt2CQeUa0EONcxjgkWQL2BCCpMWM2cwdMwtuhg0FSvxBh5N+tfqKQwm6/CK9AyguASSI5j6NW2jYwjoLQwYvjXlzG4uR9XAtGGEpa1kS0RWKUpbEeUg0UPAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792411402; c=relaxed/simple;
	bh=q3RS+TwRg3t5oZH6IrcoVIYjH3/jmXqxC3p1mYXXgks=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jA7pBT7vQER8p4mdeFwuneupMEvQcdTe4JK4C/HrHWqhaSWM5Wamz7SSw5Php/rvlzOTNWY0WW4ODSYPpKpfZjGv1d0Hzj4DBZdmb1fG/nmbNp2VvCbTVMIMeZIo5381lRyTslcHPU5/pYs5qOu3MjMSOS+RDh/XpUTLTb4RRtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EPiFHZY5; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=PLpwLsyb; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EPiFHZY5";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="PLpwLsyb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792411400;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+e+7zZS8Om0Hv5D5NOXTDcthbJqXRoYdlzoN2ljcZOk=;
	b=EPiFHZY5fICb2NVnDxyAOcqA4B9G6/T6GafpI0CpYiF+SA0KioKr/jJnnuGVW0CNPlGAfP
	rZHdx+MUbpTueXPhyJrktRhReqKnBIMbOkW6/+Liy1iRL82ZNMNtHnXzt95Eh6atQt0bDT
	g3c3TEbqY1dOSipw+IlUF79gNatYbkE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-642-tauDIM2xORmsDSkqKgCtlg-1; Mon, 19 Oct 2026 12:03:12 +0000
X-MC-Unique: tauDIM2xORmsDSkqKgCtlg-1
X-Mimecast-MFC-AGG-ID: tauDIM2xORmsDSkqKgCtlg_1792411392
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-49febef74e3so21750795e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 05:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792411391; x=1793016191; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+e+7zZS8Om0Hv5D5NOXTDcthbJqXRoYdlzoN2ljcZOk=;
        b=PLpwLsybiSr9hSYWNcfpnEYJomXj3jSTyqzLZvm8DFunH5Gc4gTd4qneCAQbAnwYVV
         lbfX2xs18w++JnKvY/ZckC29TZxw6q4OkDiymrkfXNEC8JnKrSXlbxxnTt7CpmxYjsjO
         iBoVLc53e6mxC/WKwGFF+kx6AssFeXn+eYEVFk+ius3DK1whOge4+JxPkWKTy7F/rb+f
         54HyCBAesO7948TpAAWbsBq9+8eEOka38GMYfdK3dduTQSq2JLX4c3keFitNjlWHj7Ey
         qwQVv5gajp8i02bZU795/hFeD603jeD3DI1DKoxNFc2uf0NIWdrJFNIClZJ2kGiS482+
         YDpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792411391; x=1793016191;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+e+7zZS8Om0Hv5D5NOXTDcthbJqXRoYdlzoN2ljcZOk=;
        b=NLrysvtWFc7o6uUAbCbpQJstObqB89mo/G2epxT9tXmY1cQEHaERiGpYieD9GCZ//U
         cRYSax7JR+QtZ7kIdkKObAzzhWuFACx9T8ZfkwOT1KcFXpBrPAcwN8xCvh3djoiJSXW4
         yjGl8+HtObY8N5Le3YUR9FkyTgKNa+peQ6laxnT90R4RlWOo6QmcERehKx/rbF3VOtp6
         R9ovni5qDnIuO+TXihdhhFxYiGA292CCqRMtUCkiAQ6VfoDlYE2rYfWPefUNqjWrdqFy
         ogqkZudaE85oecLAJu9oESldtpH3pkwVcj4orlS+46Q0tpVK6oXLaEmHbBqOBscZqFSb
         Xhfg==
X-Gm-Message-State: AFq9FYLd9yHk+NJID371ZAIc8dJR0If2vvyObyxiIFnQ0EKWXgE039Wh
	Z9iNoOj60WC8tTY9xGMAG73sQSfTN+NBtMwOR0HyIiALtPc2ZbRu/7wLo4p21T65MC6DKG4vGEE
	exOcuq/tEeXtv3g+lz4PgNwkXKGgiRoqE6wifrS/eDDK9W4JYadSrCeiwIcsrv+gMQDqU1NtQSG
	3bqNuNrXmi5kvhgyd8cXPFXjoMNEBc19BVoNNIG1BnaCQ=
X-Gm-Gg: AYBFou3u+3OuIto7mm1Syn7v7OtBbCIdr9stKiLKziO+tlXt39s8FxIekCnCwDE+mFC
	zWBrClZpPMIatczutqqiXWNxowXKqCulw0wO7isXsaxginlWmiOqR5FVF/EAi61sTyrnvFjuZyZ
	JgbHxGB52R4JOCAlnjH+d8szbNzKcGsJmZbg2GsGPCBViZtofbxThAKW0TwYqg6JtmJ1koPwWtE
	5gkQtWnBVkxm1umLjhgqiQNkrLI3AaTc3xTY3+++3fPs3iqJxVIPn+gAdfRKyVsx28TNBPgbSCo
	Z8vUSxMTWxU4VwfhTcCQgWKYfYZqYcqS+/ImPonxm8sh6x2STQKeeNaUHhzcKaF+6F2LlA==
X-Received: by 2002:a05:600c:2319:b0:4a1:877b:d4e0 with SMTP id 5b1f17b1804b1-4a1c66bdcafmr171831925e9.12.1792411391252;
        Mon, 19 Oct 2026 05:03:11 -0700 (PDT)
X-Received: by 2002:a05:600c:2319:b0:4a1:877b:d4e0 with SMTP id 5b1f17b1804b1-4a1c66bdcafmr171831005e9.12.1792411390490;
        Mon, 19 Oct 2026 05:03:10 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:3fd7:5300:3d6b:52a4:a23f:9d0b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4c0894sm20719207f8f.12.2026.10.19.05.03.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 05:03:09 -0700 (PDT)
Date: Mon, 19 Oct 2026 08:03:06 -0400
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
	Rusty Russell <rusty@rustcorp.com.au>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	linux-um@lists.infradead.org
Subject: [PATCH net v3 2/8] um: vector: honor virtio net hdr conversion
 failures
Message-ID: <554a7cf11f82676fcadde914c7044dcad9bbd0b5.1792411304.git.mst@redhat.com>
References: <cover.1792411304.git.mst@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1792411304.git.mst@redhat.com>
X-Mailer: git-send-email 2.51.2.2891.g4157995a80.dirty
X-Mutt-Fcc: =sent

virtio_net_hdr_to_skb() refuses packets whose checksum metadata
it cannot make sense of, but the vector raw transport ignored
its return value: rejected packets went on into the stack with
their metadata unvalidated.

Propagate the failure.

Note that a follow-up patch will modify virtio_net_hdr_to_skb()
to return a negative value on error and a non-negative value on
success.  This is why we don't just propagate its return value
directly.

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

