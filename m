Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793703478;
	b=ttM5lVNGrO7/IcO1QLlRX6/5kAl2Mv2AVk9QUAuViaNk7Y3KEc2tM9d9NmAjqMyjbh78
	 W2ukX+P0MIGxGkjsJBgr9S4+we2xpZWNNsp+lLBK1icqo2lEPGYUsEj86QE1vfNf2xxFH
	 w0N7+edJ/tbh9zmy9zL76DwuE+njQPA1oIwU6Gzppf/PIrp14Rl+HZBGccphhmnXFflW/
	 QIQ74vqoIV1HwtENw4akwfQWztx+BCUPYmRDCST9b1Q08MZ75CjRmqZsOnxOysL1hq6ta
	 4wXo0Tvl3lLIHWaQCJEf131Cv7fumOEyaOHNHJqR0BaZ9UgSvdqwoEa3yRhlDIJBrkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793703478;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=uecybL+gqfrB8HHj3vVKJyhfRKn7L+ejiH5DOEaosNc=;
	b=pc2cUAPQuwgLTHp6qwSa40X444sOXJ9XNYtSmQ7tv0pQwpbD8cIT+UfrWq7IG9aLqSMW
	 Ifkx9XHmGZcj/9h9OQp6g9U5KGTP6JhLUycT5+DPOE2NJuxQjqHhyrvBQalvv1LwhF2e8
	 OUzEWDhp1I8Z7smbC3gyiEH+HcbreKeViOGWAQ/nlM+9iR1bvmds8UxkIRccnNPbaw/m2
	 S/MenyBUfZZhrZTgLryJS8Dd6ArA5B30FFtpiNm8wfFB+FHROjLbwkTV5dVTIMHnGqJU3
	 hqipNU/y+y1NH6EHfX0zqJhm75PD6ckIxnhFlPh4RGDHBHr7daFJO8lpACNj1Pn2ANw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bBa7T2lO;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=IR7HKpyH;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D5ED606C5B7
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 10:57:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D5ED606C5B7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bBa7T2lO;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=IR7HKpyH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793703477;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uecybL+gqfrB8HHj3vVKJyhfRKn7L+ejiH5DOEaosNc=;
	b=bBa7T2lOJ+4pF2WLhuJ0Y1S/bo5D48zOxrbNpkeP0iS0LOi67rlAAT3sznN229mI9G3Cy/
	kMYmP/+nP8amZ7BywKn3sLSxA80NwooEqQggcMYv7ZUw/iT1mPr2fOtMRvjlPCJX6AHSyq
	apDQurP5hOTmEwx7YKaWSiT0Kzlockc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-354-nPGZRfyLMvOWx-3BStztLA-1; Tue, 03 Nov 2026 05:57:56 -0500
X-MC-Unique: nPGZRfyLMvOWx-3BStztLA-1
X-Mimecast-MFC-AGG-ID: nPGZRfyLMvOWx-3BStztLA_1793703475
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-48b00febba3so2752210f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 02:57:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793703475; x=1794308275; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uecybL+gqfrB8HHj3vVKJyhfRKn7L+ejiH5DOEaosNc=;
        b=IR7HKpyHpsu6vhKrQ2umLvoyYUPBYAXMIoBY7nB3Guu/f+JDm/h4J8Eu/Yde4UqUyy
         pwI1kjp429XrY3TRPE3QkcTlZmhy+Zui6gkCSUr0mxWKOl0Cx84ul0mY4+Woz3AktlBN
         PG+0YoaN1x0c2ZvdoVXkJswZJWBLMQ9fVki2P5xN3O9mnjKYKzysByPpWC/U/XKpthB6
         sXs3P84hbEpNBy0K0rrBeDfsDY9s7oStI78pwNsWs2+xoSL/xoVBGNMKhz4a3a1LVona
         dDx0JUDNe679Q4woAXHDbi7QJTWRWXo/RLnFCuGFfmwG+qLUTmcf+81v7R3C0Mdfv2ZK
         aB5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793703475; x=1794308275;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uecybL+gqfrB8HHj3vVKJyhfRKn7L+ejiH5DOEaosNc=;
        b=g9QHvAoXSUegbb7dmgI/+4HiiDTmgbwl0J8R+bQoVYfI4kPKtmz795iYTNUtg9dbLP
         x5kdmNNfdr8uWQgZ44k9M9ElspLcNdzZPnkogt7CgfbyIkrkcmLN2gx4cOW4qm42sd8x
         68Bfk1Y7+GqJjyhOi4rDhbggcRTOAHZZ9W5IEPXtQy5S6V2CXmDLYxsQ+7wPwCQglr+4
         vbwsgilYtfX6zBsqlIF7RhNyEN30ylUBqFEu57YYyP/xGHzDDOIzo+e1813p1xk74QVs
         uReIVH5XZss5GxqjP3F0Ii77XnBmxilapyvOmYnsJbPp3PICB1ujhiOudxOou+YdlU/s
         9U1A==
X-Forwarded-Encrypted: i=1; AKwUvBz/9SOJWnQbDWOI1fCsN7ctLNw2ydRVVf93e8/i3rm58/3LPouCresJQ+ls0TZ7hba6bFJpnGYvcYlQHBk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9RsrmcAJ3RtzM/qsX+XlEwNiE07YmweniAHew4Gs7xGhTdo8O3
	5LOh5u7HioVEAUMRZottynRtDMkpjxCpYLHu1l0kJHR7Dq7qayM90zjsCB3GQU48f4pE+coseLR
	Ap9OSQyzQ8ZALISYuaS6Xjo3Uk1KnO0XX1LNt28T6m/Zm7BSqr4tk78C55EdebSLBVw==
X-Gm-Gg: AYBFou064m/3bWHi82106gtpCxLoKDgIwaaWdNn4ucgB85yb/khB7m+jzngvvC0P8mQ
	bozOw0XGfE+L5SEGu+22AgEN83U4gJxjUcCUcL6fbz3wiMxlgZTG7BiHvWQUZqJwMk6c7dWJD9I
	w/82frg0z+gK9lhQDx9aMQ8tm6XjvjAw2tWkXvLJkRUqLHUu1F9EFBgEyQ420BVnotg5t282iwU
	fWI1q1i9kgQPedgEdj6OMp4JJyrnhXSF96kiqTQ3yIPThhGpFshbClgZ2ZocT3dwbN0klxkU+kE
	KYL8KCsOx3C+MghPvrF2q7y7umRdGO0ADVGD4OxmXsC9c4TYdHZahm3cLx84zEqozIuCZoY3RrU
	zjqj2UdlAvbkxqUGt7kQI9liKL1iSAlLrK5qPMauSCw==
X-Received: by 2002:a05:6000:25fd:b0:48e:2406:57d0 with SMTP id ffacd0b85a97d-48e6e2f6620mr27753773f8f.19.1793703474650;
        Tue, 03 Nov 2026 02:57:54 -0800 (PST)
X-Received: by 2002:a05:6000:25fd:b0:48e:2406:57d0 with SMTP id ffacd0b85a97d-48e6e2f6620mr27753733f8f.19.1793703474133;
        Tue, 03 Nov 2026 02:57:54 -0800 (PST)
Received: from redhat.com ([2a0d:6fc0:1506:fd00:9e19:9994:44b1:e6f2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b8c6e9sm24257782f8f.43.2026.11.03.02.57.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 02:57:53 -0800 (PST)
Date: Tue, 3 Nov 2026 05:57:50 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Fang Xieyan <fangxy@xiaopeng.com>
Cc: Jason Wang <jasowang@redhat.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Stefano Garzarella <sgarzare@redhat.com>,
	virtualization@lists.linux.dev, kvm@vger.kernel.org,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, Guanglei Zhu <zhugl3@xiaopeng.com>
Subject: Re: [PATCH] vhost/vringh: reject zero-length indirect descriptor
 tables
Message-ID: <20261103055650-mutt-send-email-mst@kernel.org>
References: <20261102122942-mutt-send-email-mst@kernel.org>
 <20261103032935.58823-1-fangxy@xiaopeng.com>
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
In-Reply-To: <20261103032935.58823-1-fangxy@xiaopeng.com>

On Tue, Nov 03, 2026 at 11:29:35AM +0800, Fang Xieyan wrote:
> Hi Michael,
> 
> Yes, same fix - sorry. The October 21 posting is a duplicate
> of the v2 I posted on September 26:
> 
> https://lore.kernel.org/virtualization/20260926160755.21485-1-fangxy@xiaopeng.com/
> 
> I resent it as a new patch instead of a v3.
> 
> The !len form is equivalent to v2's len < sizeof(struct
> vring_desc) check when combined with the modulo check -
> zero is the only length below one descriptor that is also
> a multiple of the descriptor size.
> 
> The diagnostic change is to pass the byte-order converted
> len instead of the raw desc->len, so the reported length is
> correct when the vring byte order differs from the CPU byte
> order.
> 
> Would you prefer that I send a v3 on the original v2 thread
> with this diagnostic correction, or should I drop the
> October 21 posting and leave v2 as is?
> 
> Thanks,
> Fang

pls take a look at my tree, vhost branch. if you want any
changes made wrt that, pls let me know.

-- 
MST

