Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794571109;
	b=0ORCv4RNPXeJ47SCxMhAtPCTKRIcfsCdz6K6oMer8mla39loNlgySuVACqdW2G9R5zUC
	 9hICK1kCoFw4dfH4w3yG7fAaY1B1DANzE8x2D4rZhg2lFRgv8Jwfg7bWLwXB0+7gj9vBf
	 z6tS1u8H7LZwbP6s+CcFLNuQQ9VE3FF4ID/9yhSonMOSQuWLrxKwleQmn5PN/Ms63MwDU
	 J8CGdUMvLlJ9xeQZXjMEdXdAxUCVICojFBKkPcFvpbXyIrKiK+Z7U0hXaS9cm0J2da0++
	 0MlsNSYh1ORBGqlHPX5I6QOU1EHyrfvm/R8Q7yj35DQ9W3nGNcso4Y1ARdbPMvMzvYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794571109;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=NSdHvJ1c4zpPbn3GmTZcrFFhDVtyN2FOhraiFJ68E5o=;
	b=CnmAZZ7+DY7TcRajSbnuxUAJhFfFhyc4c2abVEu7GXAtc/J18LEs+LqBAKLp9cKuVBxL
	 sZZ3Rb7a7wTi2OOd8gvG15Plo67T/P0WgB+OC2CdSRlZmPHZxOGtA735pmwpOPk429JGn
	 WG2y4pzPopK9wMHLBUbqpRFaQlWdSI7zrFFWXM3KBgSovQ0ZCsxVjykd0WNq+f/R3PsKj
	 B6Gtpdb42Ry6pGuXeWkBph555ypxfevZdZtU0jIvddDHZSCMFGAfZF/MPhoRZOL7TBPtW
	 QOIrdR2yECldMq+0neEpBc4AQMZ4lTSSAqu8t9UbRk/ZsVH2RFV6QZbjGMkRCO8O8lQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="s0gU/OWm";
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EBBE606A327
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 11:58:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8EBBE606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s0gU/OWm
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a5036bbac7so4415175e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 03:58:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794571107; x=1795175907; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NSdHvJ1c4zpPbn3GmTZcrFFhDVtyN2FOhraiFJ68E5o=;
        b=s0gU/OWm8v6mJwnBITQZHRyZGMnBastiVUUJwJ2grcp9wWCzIeqbZDGsdqUNCmEdK4
         o+pImQoBBA/w8RERNzYVlVY2C+JvnkGPwFEapewM9oGDxf4hYi+ZjE7KjtAUuayw+NEe
         6cmf377gs9AYu3Uz7NhknAparrBPlDUhxuC1rw/tkRbrDS/PscoPpbjs9/TbkcTrIig9
         HAHmteYPcZu8tIGnotVcY9HpR3w/vxtGpqip+B2Xhjh++yveRZpYhDxE/jPxDpHk8uFc
         m4dv7PSytl7uJ2SMIP0N9tHj2FVGa/eQjWNquFtIDvTgqol2+FCa5xi/HMSL1slKwnCF
         k6vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794571107; x=1795175907;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NSdHvJ1c4zpPbn3GmTZcrFFhDVtyN2FOhraiFJ68E5o=;
        b=I3xNpWspmtj6BAKmskT+Z2Z2CStua8WB1Q2iUGvq+SXct+fs4y/NFX2hAjNnGfsWHF
         z3dsS1gdmlpC7v05MCfpbqfpJZ9RLdABqa/EYnZm6AXWmB5TgJw/uT1GHqJcPxPVU5KP
         e3o3R0Ic3mPjYjAcXJDYCDqpa9ol936MziV/Zi2nkRFW7MUMk9UnMFH/r3P4IiyBndii
         Z4tXsyK2M+qo2RkEApMxrPWm/pQqhOIQgcSJ2P7AV5e1thD2hT4dE9zy3kARRlvz9KKD
         JyW9FkO6Kkzhf0RoTfWN5iVfjTWL6+ylxoBkm5ABUrChipmXcd70maCAyF+srxB0zq9s
         irZg==
X-Forwarded-Encrypted: i=1; AL+hErFoHFLSN4qATOp/0nXdETSlaYG8gdQWigqAQ0Mj8xeqCuHJEGF1Qpqk1XIAZuk8SaIz4OQ4EE/rAw2AV80=@vger.kernel.org
X-Gm-Message-State: APuU4Z9O1e452mpRmYlL0o82HhLnRLPZnYpeqxE8MHVkS+++BhMZsBpW
	NXn2Y0zUG2jx8If+NjYEIh29OO+gF8EtHU1XNmMh23Zya4osKNTFso89
X-Gm-Gg: AYBFou2zlzIuX+NPXKTkKK/Qy7evw5h96ieCFizZzMSb1aVHdtZZbmHch4sHGfjnjIK
	r9XqAOU+x1PMk6EBrwTtw7ShSS7E3SJLqbnH8+EhmUl6H2m25tWGBIMyKtfp1rPiHNFv/byzIEy
	+bt+DG1pkm4Wjtm/NiVO/Wu9XUYu/idPAgV0oVLBSYNOvcWCOnVuZyWcNEELS3PVwaBSKZB3Dya
	T8/ISGq4iG4CkrpznVGTfQu1/phaM954aBTtJPbO4vFwpGFmS6cAOhIabNeBpP3jpEFbT4a9T9F
	sik61Eqy/ADupFGUCKe3FiuOU8LIOc87tpA5CBz+yAeqhlR3xwLBFnBwLIHaxBwk3/2oYhNZifZ
	2GkBgcRViEU7q2leEMtIBEzt8XM6ZXu3igIta/JyV8IQD160E4FRLwT2BtPW6LY86heh0xmzXDD
	pajj/0V9O8qWGqnN623ABz1OIdF8CUBa0RmBVACbfB2g4sjFyS9kg9K/Tj/FlQE1GxVS0fCXXiQ
	8hAxG+QOoXWbcZ7Ad6rozIQijzU8DG6/JFVWpr7cxtv+V2bE+avkCLb2cS/1s4NVYUaxPn3GU93
	sc9NTO6n4hw/BXyXbhDEyjd3Ax02nULoC4kropOQvB20hII3mJab9gPjkk/nuICmmAs=
X-Received: by 2002:a05:600c:4e49:b0:4a1:78c5:79f5 with SMTP id 5b1f17b1804b1-4bb55aa999dmr44030125e9.33.1794571106573;
        Fri, 13 Nov 2026 03:58:26 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2538b9sm252917195e9.1.2026.11.13.03.58.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 03:58:26 -0800 (PST)
Date: Fri, 13 Nov 2026 11:58:24 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Martin Belanger <martin.nvme.dev@gmail.com>
Cc: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, Christoph
 Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, Hannes Reinecke
 <hare@kernel.org>, linux-nvme@lists.infradead.org,
 linux-kernel@vger.kernel.org, Martin Belanger <martin.belanger@dell.com>,
 stable@vger.kernel.org
Subject: Re: [PATCH v2 1/3] nvme-tcp: use an aligned buffer for the TLS
 record type
Message-ID: <20261113115824.2f96b66b@pumpkin>
In-Reply-To: <bc96a186-5a19-4896-8465-ccd1df5a33bf@gmail.com>
References: <20261111-nvme-tcp-live-ctrlrec-v2-0-6295202b84de@gmail.com>
	<20261111-nvme-tcp-live-ctrlrec-v2-1-6295202b84de@gmail.com>
	<20261112223707.3bf1e1a6@pumpkin>
	<bc96a186-5a19-4896-8465-ccd1df5a33bf@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 13 Nov 2026 06:34:06 -0500
Martin Belanger <martin.nvme.dev@gmail.com> wrote:

> On 11/12/26 17:37, David Laight wrote:
> > Is that right?
> > You are changing something that was CMSG_LEN(1) to one of CMSG_SPACE(1).
> >
> > I've a feeling it would be right if it was a struct, not a union.  
> 
> I think the union is right. buf[] covers the whole control message:
> the header, the data and the padding. CMSG_SPACE(1) already includes
> sizeof(struct cmsghdr). The cmsghdr member only gives the buffer its
> alignment. With a struct, the header would be counted twice.
> 
> On x86_64, CMSG_LEN(1) is 17 and CMSG_SPACE(1) is 24. The union is 24
> bytes with 8-byte alignment. put_cmsg() writes CMSG_LEN(1) bytes and
> sets cmsg_len to 17, as before. It then advances msg_control by
> min(CMSG_SPACE(1), msg_controllen), so CMSG_SPACE() is the size it
> expects.

Ok, you are changing the size - which is what I noticed.
In this case it makes the on-stack buffer 4 bytes bigger - which
probably doesn't matter.

I'm sort of surprised it is 8 byte aligned.
Historically it would have been 4 byte aligned, and the kernel still
has to handle requests from 32 bit apps where I'm pretty sure the buffer
will only be 4 byte aligned.
But I've not checked and it isn't really relevant here.

David

