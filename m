Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1D3651FCD1
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 17:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790702043; cv=none; b=mSHIoiBIj+YJL6OfjjGK4LzgxyHtVOW1+QKxFEbcIjhZDJn4bWr79nh60Rw2lmAeS46fGUQVwfSTP0N3Wx00vT+uhZ23hJDa7GEvshF0j8E7YoZp0mrvIsNdTlcaM53v7t8FHSQ4AmIWWMw4Yp0J6WFS8M4LDFKUM3YpcL5TIa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790702043; c=relaxed/simple;
	bh=VPZj7kr9gHB3FwhI+2ZFN/POZDkm9HRFS8/Ru/rNotQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=l/ZXdnq/rsvMt7XXmj+1unGyO0ZRsKtccvy7kuxt/8zfr/wQfhXR1aoVeMpAmaqKIMzIifQ9YLmfIoXMz1scUYB3ZovrobadySwmcJKqp6A/BhGtKvSMssXSo0qmJWFSIxrkKWcJ0kWQUSB30T/PBlQSVeEjpWrPTpI3IQDZEw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ASiWdXxX; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=BnObrI82; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ASiWdXxX";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="BnObrI82"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790702040;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s3HOGLeK7DPs4Uoyow7bfGzTo+R8F/Q0t/X17pZ0Blk=;
	b=ASiWdXxXyFkPOGMrPCI4RlBxWBjReJPbFClmX4b/GGt8Eqk8S0n9qwR/dUxQoXVpQ3Pb/8
	o3fiFkk1Rd3+yqJ2fQSkL7Q6iN67wN0CrV1VAvOth4bIG0V5f8w00EmXIIlustkjs7CU7a
	zxmhxNszSp+hVHUBQhE0Z7LiYGRIKKc=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-502-UNk49oE6OW-8AlpH0bPczg-1; Tue, 29 Sep 2026 13:13:57 -0400
X-MC-Unique: UNk49oE6OW-8AlpH0bPczg-1
X-Mimecast-MFC-AGG-ID: UNk49oE6OW-8AlpH0bPczg_1790702037
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-53124d6a362so128135111cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 10:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790702037; x=1791306837; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s3HOGLeK7DPs4Uoyow7bfGzTo+R8F/Q0t/X17pZ0Blk=;
        b=BnObrI8277p4mh+37nBdpA0Hewfe6EvOQe3ZuaGd8QNP+6poL310PZSM3B0nYnE4Nd
         sAcs5ayf88g0AVdJyWzH1hqelY3WZfpghKNGDuqlQgLIRgeVDSBdLRC9RwwReXkvrny+
         CoAMPHlwYmowLmS4bnz6dxacBQ5jfHMWNogj9LQ0H5HxQeJhFNtnolZGPVK8fnxpyqpq
         +3pMvWR1mtuvw364lIrAu/vz0dl6K54nfdZV3qPyNDhhfeW3URSDDINJndiilxCcifMJ
         dAVnT44Bz5nVuQHES0bRM154MDyj9PPLkKM/zeF19xLT7MzJH8LxVm5MoM4KKre5LL4e
         FcXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790702037; x=1791306837;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s3HOGLeK7DPs4Uoyow7bfGzTo+R8F/Q0t/X17pZ0Blk=;
        b=isEKekC+BYWcKKAW6s7trP2lAkdgBfLXn2T7crxEsqmjQ5ikg/ZaFS/CslK6w0qIlz
         KN9sARtCOp1i0ShqYnVnkjClpshSBNwICAQz20JJcUOXISBcBniaJ93ff4yB+dx++NtU
         +pOA/Y5z7rd+WfGpDd5K9i6RmcJyY8VQ9RwzqNIYc89WllxIuB9JlauX6jDy7kSYA4HQ
         0PZtjtKumBntEEOVO4by8/8YQqekoUBMclyHpGCj0/SEu4BuUwab6UKW5FuWWkX2ZmXc
         T7ufn2gWCi+vgh1S2ayEXBV3lvcgcmDoFtoP19KkjmvUe0UjFuYvyPn9cyEO5JzMPd0n
         Xafw==
X-Forwarded-Encrypted: i=1; AKwUvBzg1YT6RcjSPY5Mv+CqyfxTc4bbTuZfjRPWaN0qXphyhYlU1upqil9/l4fXQtF5nTAxp9iIe8f7+LZZ3Gw=@vger.kernel.org
X-Gm-Message-State: AFuF++kzDzFceW+HO0BsRe3RPwTymRJE8STOi2S1o0lOGeGN3KIweRQG
	Noe7LWfqCnUyhIZhnO6M4j8PJPr6YxiencYMFnmkwvr89NoD2jugVubd0tZaK1z6yC1Tvg11gu/
	4vdDD7hvvW/fyz69d8Kf/NPX9ZmC77sixflIDwhyoaE43x4FJLGQ0+yVwuQNZ04ry7Q==
X-Gm-Gg: AYBFou0y4ewzXNQX6aHEdlT7uuA2M5LYhhoBbNt8vlzLcx0xRTXmjpmewcREc7gq1Ym
	qkKN9e0Njr0A5uOwl32w4M1JIA2llqNUw7d0zROvJpj7KevKvjpVqrQWyj3F5q6CSA7xCBXsLct
	BJ64nNl1nSlMR4W+T//ftrWD/dtpFzhtRhfXSeJv6afSXYvVa0//fkR09kCW7TcdlD0upp14Hb6
	zMNczQ3T4a/2+ul1tSAcCynVdB5RA8Tko7Mo43aeugCfvNuK90VtJRBq7LSoeIU45V3isJq5Izz
	BDhuw9NjdnD7ei44CNQkuVrMENhPfF+QM06Ir7S6uou3/wDUMVl/iYxEhXpcfj1+5ZVbZ94bIsg
	sBtzx7oy4tE4pMAspKSS2s85/V8tZbv4KO9fK7W5zT9r/YmJQsRI=
X-Received: by 2002:a05:622a:e343:10b0:533:290c:642b with SMTP id d75a77b69052e-533290c886emr151965451cf.13.1790702036824;
        Tue, 29 Sep 2026 10:13:56 -0700 (PDT)
X-Received: by 2002:a05:622a:e343:10b0:533:290c:642b with SMTP id d75a77b69052e-533290c886emr151965161cf.13.1790702036370;
        Tue, 29 Sep 2026 10:13:56 -0700 (PDT)
Received: from bmasney-x1.rmtuswv.csb (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53369c038b6sm3451cf.25.2026.09.29.10.13.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 10:13:54 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: sboyd@kernel.org, Pengpeng Hou <hppiscas@163.com>
Cc: bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 mturquette@baylibre.com, s.hauer@pengutronix.de
In-Reply-To: <20260920034124.15700-1-hppiscas@163.com>
References: <20260920034124.15700-1-hppiscas@163.com>
Subject: Re: [PATCH v2] clk: si5351: fail prepare when PLL reset times out
Message-Id: <179070202964.199845.17628699480491234980.b4-ty@b4>
Date: Tue, 29 Sep 2026 13:13:49 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=304; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=aRL3zJkbQmdjhJGBcYFcwWocOTDPkNk7SYGlKZZInGI=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLJ2f7z4X2BS1oSDLIu6utznP+h7dKqT2+dEqF7xz7QuZ
 /07fGeEOkpZGMS4GGTFFFmW5BoVRKSusr13R5MFZg4rE8gQBi5OAZhITT0jww3+xyoc0n35E7iF
 q36tMOaf8rBX+Fv/IQORIzVaN1dP6GVkePJk60+BbS1HmY6a/s1NDSo4LnHfeLad0UK/c56yx0L
 uMgEA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087


On Sun, 20 Sep 2026 11:41:24 +0800, Pengpeng Hou wrote:
> clk: si5351: fail prepare when PLL reset times out

Applied, thanks!

[1/1] clk: si5351: fail prepare when PLL reset times out
      commit: b6685c30d15cd7f28c40b2daaeacc00f21b2f12a

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

