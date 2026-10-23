Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792738148;
	b=i3VssqaULlOAm+/wRIDUkt70+8sRYtDZhl1vwfI8ZlShezVEVXuYNyERgCFo0jtKCG7N
	 JCXOx+0A8qVLeOLNXf39BWbt6Bmmz5Xr1FYMue3FJsUGwwTpTzELsWhyVKf1v+7cQjbVz
	 ZBjshz0JIU4MYJySEKzlyQcRJK1TAXYaWSEJKVcggULapTuJ6Cu+GGevyjKo/5LgFKLw1
	 emaaOre6MVq51VfOWXSHHUMYzv8OVQodLIfmaXaVmEtgMS8jlCm5hfH91TSM8G4pGB7LH
	 eeJOw9PyECyOsuqAH0VqjI54OPQDpoJGQXdRdqBc9TFrm69lcZxoLWOwjZWhL7BCqWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792738148;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=erqFqVawVO5JWIlkFRt7XSARlkgrx+IN+sYh7a5xpOU=;
	b=sCyc2bqX1jhZhPWhWU8mhSQg83MEfHk6vSH9uJqcVVpNQN0kLg/2WMi9JCD3fzFJhfUb
	 V9aF137IN4A83yAYf9lrWBnW8G6g9e4shp5l2gHHBgndxf3qMsl2F7bXCVzJ2kLfgJTXr
	 Kx0eckFZ2JH9UKJEvBx1hNVlSmMPbRZNwZHwa1LAX/UJ9E1+F8FhqtlobyDcSqoOuE2hX
	 gVS3kOexsGWZxtrJrorpI2VuA7rz6wR9s/dYH1kD1zfLjLE+z4LUOtXdZCpBmbK0FZpBC
	 bxfAa/rsv1o3E4yDtLM+VpfNY2A3dSpDxNZnk5WfpzXMTvZ/ouCSAdxGhop9KRdy9/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=i7uMGkMX;
	arc=none smtp.remote-ip=209.85.215.180
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2589D606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 06:49:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2589D606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=i7uMGkMX
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cc4b1f7e8f4so198868a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 23:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792738147; x=1793342947; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=erqFqVawVO5JWIlkFRt7XSARlkgrx+IN+sYh7a5xpOU=;
        b=i7uMGkMXscHjhDENCGznN0F0LdwXhaeeK4wgq1V7J4s27ItdUdgiunUqSxsF8PqGG/
         RDNvW27StQY6+J/7pi2NNhXsIBii5GWnzc0xn9xTKKIFh8JsYVTB9OmSKlOBQxgM23++
         1qayxyHKXlS7JCxOnpQwsMiqvhs/BITHAtV2XcR+u52UGYFT99pDYDdbrT2EpjGofscq
         Hy+ASifE6Vm/184hsyDxfFrP2DfFgsVzwMdjGBP4X+j97Afa8pEqJ53zMJ5TI7nLRVXo
         OnffgizhsnSq2tku16pbj2V2RImO0esUxWDeT5yDhDMEzAn5j2FgguIN3aVETuFQaB0a
         d08w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792738147; x=1793342947;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=erqFqVawVO5JWIlkFRt7XSARlkgrx+IN+sYh7a5xpOU=;
        b=cD8orYBvpiifE7w8SnOeA4rljxKtORGKXQQODnwuwxDPXq1u5pCv8vNmLYTHyxa+GD
         0PRakUtqM66c312HDcD+t9ZOyVXRx2NvyPVxXFL2a+eN0ldc8Ni55lbGTitXzvtNtogV
         V3Xi1qjSCE9Tc8Ni9E+NAevcr01xg1xi3+BqKYl6GAoDSuuQEqGCy0JIe5Y4XHyRkPIq
         8UcHKJQ/b5hIh9VMCRRGWYmp1iQA9N8c7OJu4mNr0KChFA5K13G+E8jRcqnhJHejTmO0
         /ofwCaEoppiblGeW+YZa3vzNtQP3/1ALDcCH7xTsKdDOD946ENvVskoW427WRNb94Get
         Mn1g==
X-Forwarded-Encrypted: i=1; AKwUvBzJH/Rbup0UJ1bHjV4d/6BD7csOEknnHE4S8vyZQP5EnFs4RgM9zv/M8FxLjhvrLZtQN53gM2AbLL251RY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKdqoKPQxQjglT/YPR4+wLwdZJJ66cMRSDJnOe7X95gliL368Sp
	m90fiZltxgAQr+30awRgn/rDJOS4ydbDiFJ+O/u9uJI1ciRuzl7nV0uV
X-Gm-Gg: AYBFou2Is0KxG4iS61QmEBuSYu6JxVgiCULYSn7hO1O7dlxiGuJ0kAitLhMpVkXhklX
	mRdCkip8K5iI6Eqr6A7t71zItHDw3g2NjNYk/xrWVtBV3QBsiAP3OAulRiL3RYI6RHpzwcWQ6kv
	6xT5zHjFErVYn4YdMlsUew9cofSkjk6xX85PM8r4LaV4oEUocpW7EgggBfu9EndrW0fRNtHuRe5
	LmHV7Q1NBKXbHnPI6tS7iqKx3hO2QiYl8ovxV9Eh8JrRnH3E29VS6x58fvHLOqaNsA16oUcw1/u
	yPU9ZhPMCpOFwqsl4fypVI81NJKMJaO/Rjq17xdaTtPYPwtqa2uiAuZoXY++wCxGdxkHksEedCJ
	VCbs8Mc10RPzVNfbhcwVR9h/5XIQWQSbHWuBzJPryqI7oDFETZN7cslQUqSoAkuDY/xrTUT+gwk
	ZKzkLQUXd8DKos/kGxeV8i5/V7iRgueLIxjkvCy4BspC+B6lMFWc01/c0QIoSCzx5neOeSrijie
	9/W2m2HDx0ldm5VY3VzJp/sGoQ8JqUT26eiGX7Gw79hR8PgS3GPSFEyOjg80dbFsfVSGa2yVIYn
	Llu4vU5YhoABRqLxd3mDm5npZ+r20FyAWtzme/Lf2fm2
X-Received: by 2002:a17:90b:3904:b0:3a8:6045:5a24 with SMTP id 98e67ed59e1d1-3adce45d61bmr1003380a91.38.1792738147399;
        Thu, 22 Oct 2026 23:49:07 -0700 (PDT)
Received: from localhost.localdomain (ip67.244-167-222.hkg.ten111.net. [222.167.244.67])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3add29dcad5sm615871a91.4.2026.10.22.23.49.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 22 Oct 2026 23:49:06 -0700 (PDT)
From: Guoshuai Yang <yangguoshuai@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: Guoshuai Yang <yangguoshuai@gmail.com>,
	Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Sabrina Dubroca <sd@queasysnail.net>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH net v2] xfrm: esp: reset outer TCP GSO metadata on espintcp input
Date: Fri, 23 Oct 2026 14:49:00 +0800
Message-ID: <20261023064900.64877-1-yangguoshuai@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <179268155570.3135.6366960419287611684@kernel.org>
References: <20261020030450.7170-1-yangguoshuai@gmail.com> <179268155570.3135.6366960419287611684@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Thu, Oct 22, 2026 at 03:05:55PM +0000, netdev-bot+sashiko@kernel.org wrote:
> [Severity: Medium]
> Is this reset reached when the outer TCP GRO aggregate carries
> SKB_GSO_FRAGLIST? It only runs after skb_cow_data() succeeds, and
> skb_cow_data() can fail on that gso_type before we get here.
...
> The skb_copy() WARN_ON_ONCE() itself is older than this patch. This is
> still the same stale outer TCP GRO metadata problem the patch sets out to
> fix, and a reset placed after skb_cow_data() can't cover it. Should the
> outer GSO state be handled before or inside the COW step instead?

Good catch. When an ESP record spans an outer TCP GRO aggregate carrying
SKB_GSO_FRAGLIST, __strp_recv() places that aggregate onto
skb_shinfo(head)->frag_list with SKB_GSO_FRAGLIST still set in its
gso_type. In esp_input() and esp6_input(), skb_cow_data() then invokes
skb_copy() / skb_copy_expand() on that frag_list member and hits
WARN_ON_ONCE(skb_shinfo(skb)->gso_type & SKB_GSO_FRAGLIST), failing with
-ENOMEM before skip_cow is reached.

I will send a v3 that unshares/unclones and resets GSO metadata on any
frag_list member carrying SKB_GSO_FRAGLIST prior to skb_cow_data(), in
addition to resetting GSO metadata on the head skb and frag_list members
at skip_cow.

pw-bot: cr
