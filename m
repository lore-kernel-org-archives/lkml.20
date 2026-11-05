Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793871233;
	b=BkcaoxyhPDrTfGtfw0TCQDCFpEbJ5U11rxtLK4Cw0E1swcxVdiWy1tsKTclMJzStqTO6
	 6upirEYAs8t3PDI4maSgJq9+LIWHKpr6R2cSkE/K9oWLLqsJc/qdWx3NIlpEKHy3GS8kS
	 GehYwQhpDQOvTcQxB3DEI4hcrHBUSuZxxoSkULzv/ZGZRJQJOGjWKqz7CYPO1UJtB0F1M
	 qpaNt9/Gmf230TE5gfccRlpHBiYy40shdIWA2P5NymHdGVEj4R3OqndtrxtMr8zte+2Bo
	 jlVpSv5hM0EcTWdQLEZfKJGU+AuuqXie+CgtcKzbDpyEawzhIAoMiM161fYKd0rWxWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793871233;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=YyMbqjO+UegeRmy6DgvDbjX/Wf0GYEt6KMjPad/OgWY=;
	b=Aa+hZibI2NxOU9pDhznWT7E6OrBD0fZalz3284YxT94MLem4uYCqLWpB7VwSX0/cD5H/
	 EIyN3lfF0EYUGCaAR+M0960yhnFY3/yxGfKO0uJ8sNt8mgwWaRCOvkQp29eQ/wj9iuQ1H
	 7Jfd6ck9x1oJ4SOxKkvmXBj1S2LtRpKCNnUFGg4TFqM58vMh5IuzhDswSuK3BCZYG27oz
	 WqYSXNd7Tk4pFCYx7zofGSK0fJpgjuFlHGxsTAteB9gln3JqD4TjRXwaXDVquS7NmYePM
	 jSqEuftU2LEYQABqbtDxV1TIN2DC9fC9ynkVRyjlBulGc6PRmncyUcbliYhuFTu2X9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VKlITHYj;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4360606A333
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 09:33:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4360606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VKlITHYj
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a5720b0a57so2390705e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 01:33:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793871231; x=1794476031; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YyMbqjO+UegeRmy6DgvDbjX/Wf0GYEt6KMjPad/OgWY=;
        b=VKlITHYjn4rMf67yDTvYadu+rZm8xzOxTpN/TKthk0zOHL/e42TxxIyfWJ+mrpRVje
         em3H8WxTWiSWlO4HBekqBRgX65X+rwMCQMmIxTclo9MWBMTf4kMog/FCNKUiesviV253
         CjpIQk2pjFgXRBqAG2C3RUiKwaI95B4CdJa0hcpTZflS7BDnNRxUyDkw8b+NY9r+/u4z
         8DFepbhDHZy1IvarML+OXYTqK+i4+Ebj5ZWraY9YUG44As4V9SgVZJsYZG4syTTwBCbO
         3L6rPolPJ8RBsfbZVyTf0AWeCL6BUF/FJv3sWfAYZwB2N5J8UoDRnOl/C+Rr7QPwIbMk
         izKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793871231; x=1794476031;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YyMbqjO+UegeRmy6DgvDbjX/Wf0GYEt6KMjPad/OgWY=;
        b=zQoi+pJBLLA34TP/Nl34o9iSzVCNXVzeSXI+2bNq64McGoI6EtHcu2f9KFXGTbwce5
         geG7DhePAbKVNxaf/qnVQx+FhWv85eqwc/2B34nM/23KYHMzgzFqk+fl88eUV3zXHnkf
         m6hmdJgRujT0XnlAf/AlxekSq2DfvKADxiuxxb4br4itABObJZGClza5gUTrUBIHSZli
         rj+0goozgxgVnwrjL6Hbe+lGeaZsw8+Z3cSF7hCxzQSt5IQC40TOdn4LPsNBN1ycPrPP
         3g3rbdegTDBhVE51s8PdDDsOmAZkUQ+LJnliaNIyYVgLoul+IadTCkg6IisbszEoNRkg
         T+mA==
X-Forwarded-Encrypted: i=1; AKwUvBye5Kfe2tO9fsALQLwoU1BzlcaATsHkxO+/md/OxZeIKpqFPQQnbCNdEjbGX0uYb3ksuYvX3po+iX6wMEg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/qFdQXAmsPwzNs0DD5yUKGj9TFqWOIlOkW+OUlO9vX1ywye2Vd
	At8i+PR/lVZgKM41a/qPPeugL8s3MjF37O8JHjCSpKroO6pFyfHREWRY
X-Gm-Gg: AYBFou3xD7tUmz7s+zWbRnUx8VC+773LuHYLyN8JU2CL/sMWItvI5Dz9hgy8cfIn2HT
	ilQgpxvYZMk67LL/rbJUDxvl7CTi3Hq3MehP+vg+D3RsniK16oMF3wkjbbW/roQp33ARP/IPrUi
	VKX5HbJ/UdpAA3kEzxO2En+arMH0ltkoEccuUtzNueQsJTN9sIUlvB5eorO9vb6OT5eLtIKdwvB
	E5pcNnk4fo3HOexSi2WvztPuKH8lZenDC3Nsa/EIZCXq7taY0W6Wankn2/ns1nn7fBfEXSiftSN
	4+PpbOL69afAEhVRGEfJCEVZctejucUlfwWqFEd8Xlh5L6oOVru6ju8vq/yP0r3H73vzWACtH93
	chKOSPSdXHpbBbasnb5Fi1GTWi/IRgjEicVBaRqe/bJtZEug11vqvkJKPib6Hy3cYH3kgtYaWAJ
	mJ/8GauIECwS6AmK0whooABSvUikbJ3dzTQYTGBSOm4ufZjrekM0O+IqLWKlf8ZFyObRXSl1pLo
	frZ+eJGWmP1NF7XpF79sVCfq0n8gEbML+IPHav3WhnvyaW1CNAmcfIOZKvzKrk9aUzmz02WpQIW
	EH6mo91qqPqK1c8zl/5H24ybwq8Tv5n1I7BtZPg=
X-Received: by 2002:a05:6000:41f0:b0:48e:6625:4190 with SMTP id ffacd0b85a97d-4911906d39fmr3386070f8f.7.1793871230914;
        Thu, 05 Nov 2026 01:33:50 -0800 (PST)
Received: from foxbook (bfg124.neoplus.adsl.tpnet.pl. [83.28.44.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fec8d88e1sm8999211f8f.15.2026.11.05.01.33.50
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 05 Nov 2026 01:33:50 -0800 (PST)
Date: Thu, 5 Nov 2026 10:33:47 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Kuangyi Chiang <ki.chiang65@gmail.com>,
 laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: uvcvideo: Add UVC_QUIRK_CTL_MSG_DELAY_1M for HIK
 camera
Message-ID: <20261105103347.4983b901.michal.pecio@gmail.com>
In-Reply-To: <7c254ab7-579e-4c17-80fb-596e6fdd29a9@kernel.org>
References: <20261029033106.7374-1-ki.chiang65@gmail.com>
	<7c254ab7-579e-4c17-80fb-596e6fdd29a9@kernel.org>
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

Hi Hans,

Kuangyi Chiang has also reported this to linux-usb and linked here.

On Thu, 29 Oct 2026 13:46:04 +0100, Hans de Goede wrote:
> Is this a USB-2.0 camera connected to a XHCI controller ?
> 
> And if yes, how old is this camera model ?
> 
> The reason why I'm asking this is because the EHCI USB-2.0 controller
> interface causes a natural delay between consecutive ctrl commands
> queued one by one till the start of the next USB frrame, so they get
> spaced 1 ms apart.
> 
> Where as the modern XHCI controller interface will put these
> back-to-back on the USB bus. We've seen some issues with (older) USB
> devices before where they needed some delay because they were
> originally only validated with EHCI controllers and the hw/ff assumes
> it will get some "breathing space" between control messages.

Are you sure that this wasn't possible with EHCI at all?

What sort of devices were affected? A bit surprising to see that there
is apparently no quirk for a known issue.

Regards,
Michal
