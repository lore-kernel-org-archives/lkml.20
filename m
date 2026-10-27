Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793101796;
	b=WB/E3nSZTEkblmIPck4M+9f2/H+W6OdEFo8vqW0GW2Z8XIuVfuoycmZwMgoBvNkYjNrP
	 uKH2/kjvdMcNCF+yp8jpRNiigpXj+gHLCC4kjKNgeDzvLrZ81UwrZGS4zwtmpmQxadpYf
	 WqXYBIj4qPXOmk+UiirTj2Hj1k3YkDefXKvWAUDY86wJH66qPUkVEbj5HLJ1Lj/fxlbnZ
	 1iJa889+mKdfgYISMh0cHnxIAze3jiUpwxhjDGjfOw5/US5Z7mW78hb4KS89GSAnsZRsU
	 Na0j+LNCVrvtz/3+wJinFU3j/jyXF54RvmXk8I1ZeruMwQX8EkEN5leQQW6UOLw0Odg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793101796;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Toy1KB2l9TskJSYparsyEzIH0pnl+RyxkKZ4uTyQvZE=;
	b=EhI/DOpJnIVjDS05qZODjmRlMnen6Ov/EFMjkwFP9JyKSLsO7HEAU/zI2/dXY+zvGieG
	 SnDERA/2Sze3TITDYAr7Bg72zhciTr2k33wPwpkdxZ3SNv6fiYbqsTS1QcX9tnW/sShkI
	 9P6HvrUGWiZyE3jQqI1n3B+Bul8fA9gvjsJtYbleZCZ/DOV6LeGXQZVrwgjZcqDBUM4Dk
	 WqvW219ZqzzPYfv12C1pWinZOqFB8dv5RkKk2egBxTbWv1vFRmowO5DYubGfsUbFvX5HK
	 WXO7dMqSb24IENEz1IlNAr4KK+mOfNiXTZwD/u+USwgcers+ov5sfPG8GXDSYbiPQRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=h2jW7dEa;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=B4hfE8EH;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDAC8606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:49:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EDAC8606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=h2jW7dEa;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=B4hfE8EH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793101790;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Toy1KB2l9TskJSYparsyEzIH0pnl+RyxkKZ4uTyQvZE=;
	b=h2jW7dEaEPDc2nmYS1ILgXIgPpNfhnx5VB65jJyRJvHk+Jqik7oUV/Q6jv+eVYpD5xAl2C
	N3EfzyEeAjA1gH105dRNPcAeMkKCXrWataNSFGEBLXnS5BbIYL8KqNS3OY87yBZ/9xZU1r
	DWfkIbaU4FYYnnHtrP9bm8sPOX0Au8A=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-182-BznL055pPlm6tTGQoN2wQA-1; Tue, 27 Oct 2026 07:49:48 -0400
X-MC-Unique: BznL055pPlm6tTGQoN2wQA-1
X-Mimecast-MFC-AGG-ID: BznL055pPlm6tTGQoN2wQA_1793101787
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-48dff112181so4209747f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 04:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793101787; x=1793706587; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Toy1KB2l9TskJSYparsyEzIH0pnl+RyxkKZ4uTyQvZE=;
        b=B4hfE8EH0wkRUhkNpP27oYtpTVWt/gDNXnEp983VhEtbH5Xm3IM88VENP646FWin8U
         D2NpkuPgjoqFEw3jqs0Izrvzs63Z6jsmMHpulh9afv0fyeQJijOpyFhJhwQ3cNqKh4dp
         6tQOVxUeYMLAn2EEReC9ke3bU9vszuht85Epsv/GwCreeRKbRH69as41+RpMgThoUxQV
         bdAWHObUv82gtHDNPLrqhMytIPZr9EZeX6lRMbU19h8Xo9AlEXMqjRy82gdcsR0lpCde
         ATBSHXuXJGYSqkZ1RaRAB6UanCagX+3bqSc3XU1WINKkyOPRVY1ZZifuc154T20Tq+nu
         FENA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793101787; x=1793706587;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Toy1KB2l9TskJSYparsyEzIH0pnl+RyxkKZ4uTyQvZE=;
        b=gUeZmDkUJhASSRr42a+DMozAo28OBrza8n0COIUXXVBnYqcxF9SmExCYHhV/yGVJF5
         FqaVlKtDOkWUrtLbxggHetcDB17PFxBDmHU6JXbOs9fkKr3TFE71WsOEfcOBQ845pAA+
         YJIsfTPraeLxvSBYDpuPfEYuLJGOzq/iKZZkLLE+7aalE3CPwIkXE6IHfRA7pNE0dhzV
         8fDinst1aOyJM2XUhnQ/sNsRfw//8s/hk2o4WVnBFDcw3TtKJheA+ciMEgggxQ5eGvRR
         AeUocPfscAlUspg+anxlICoiSIOwjffvbfMbtRn7lYi6lELzOJhX9k0ZCx2qvaApjM6j
         wAPQ==
X-Forwarded-Encrypted: i=1; AKwUvByf2NioPi6RTLGFJ8EhOvQR6awKsBo5mUzWRrSvZw+SFy8DVRjjHs/fqY95s9w6KGWUi0DFGOLX8+IjZsM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ5RW/6NrMqnky0ZTVDZNUCEFH4B9ACogPw52yRjFc4GeW0mVID
	wMm5Q6/CpybZ/g/rzqDI0tEMOk6pk0MEFDrCU99mDaB8z07P6LdlNYVxASgLOfXqU4mpm/xfusI
	haoOz0bgyT2Rn0trC0hYk+CHRw2h/AC9f6ADI8XVhTbVeMsd2OEB8T0o4fNmW/iMSWw==
X-Gm-Gg: AYBFou12BMSMqLZ49yG8q38+LOUFD4pCYLRfiS+QBJ58ysRj6WgGVSyE4CEgVFsZ1s5
	X1+TESgeic+KRGUo0xbVZ7ZGJScqp/FWHnHYxR2kTRNl6Pw8nzJVLwsyf2rCrCZcBcbKw32v514
	IZ35Ttt6/iSJVoC75lTBmeM3hLp8FTsayMzKgKKG/RbWGAeoGr3icCkpQb5AXYRNB/U3k+3NjNk
	w6O8YkJ4NU5EpIH65xzQzAYtQJy7quOK5CrpqgPF7U3+EP531/hYjOfFt0TlfgJ9Hf6UH6yh2Me
	YYQZveVsd4kBKGB+jS2uTYNCol2PPU0bK5qcwmnu7SBzl/MvgHbw9tZfuYBrbQ7gc+KGzzQOmbW
	094e1xq83LH70UNZ2c9otnEdrBIVxM2PoNprcNdWvafqQQKYpWooZqSvWRJnqbPMjxVhCfDKS9Q
	==
X-Received: by 2002:adf:e00e:0:20b0:48b:9ed:b81f with SMTP id ffacd0b85a97d-48e3eb75a46mr12581574f8f.10.1793101787214;
        Tue, 27 Oct 2026 04:49:47 -0700 (PDT)
X-Received: by 2002:adf:e00e:0:20b0:48b:9ed:b81f with SMTP id ffacd0b85a97d-48e3eb75a46mr12581524f8f.10.1793101786725;
        Tue, 27 Oct 2026 04:49:46 -0700 (PDT)
Received: from [192.168.188.234] (ip174-129-192-82.pool-bba.aruba.it. [82.192.129.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ece14a1sm23040422f8f.57.2026.10.27.04.49.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 04:49:46 -0700 (PDT)
Message-ID: <cf0a87b7-1039-4688-85eb-9efc8a25dfe5@redhat.com>
Date: Tue, 27 Oct 2026 12:49:44 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2] octeontx2-pf: fix skb use-after-free with ipsec
 crypto offload
To: netdev-bot+sashiko@kernel.org, nb@tipi-net.de
Cc: sgoutham@marvell.com, gakula@marvell.com, rkannoth@marvell.com,
 sbhatta@marvell.com, bbhushan2@marvell.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261022-nb-otx2-xfrm-unshare-net-v2-1-5590c9325bcd@tipi-net.de>
 <179296218017.3134.5170259489302207876@kernel.org>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <179296218017.3134.5170259489302207876@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/25/26 22:03, netdev-bot+sashiko@kernel.org wrote:
> - [High] The fix only partly covers its target.

I've mixed feeling WRT the above points; it's (borderline) pre-existing,
but it's IMHO bad enought that should be addressed in the same fix.
Thoughts?

/P

