Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792936377;
	b=WV+XrA8s0/YyqBKk7KxwOi2HANdSoJOIb5XocROCnYpWKHf+nCwr6hpO553Ub1dm47/E
	 z87e59kDFFDcTB3XZHjc1XFMT1qDoId5Vdt8mNZIT65wTXeVge9Tn1MHsm10XA/uy/Lwo
	 m0kxwfgX6RRpbVwTLTYA5gbI7TmM4wqdzG3y728fj/Nr8AsjwyaXgfz5OozE2Z36vyzlj
	 iR5Jq6Fgad3R0CjApInbU5S7/qYZyD0gCn1rqZ/JHdY2StDqY2EIJTv0LL3iDPDHpD5L+
	 eu9Ym/BkaNveyxrXMrf3GNFXZdUrcr1Rt/Bj0/gse/wRjaEizJOOr5zmP8wQeMbmcWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792936377;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=w+35OHT8eig97D6eOQL/H2On44eSSo3B/P3W218Fgsk=;
	b=fxjHswknLCi9NTfVGA2394Lby3YL483UdJyocv0HvHLSf7Vhe2pLGhU9ZMGciUimj8px
	 EijiykS04K+08KBKA+NEfxGUqMcrgp1v2KzGKenq3fUDg1LNijgKqoB8h8+1GOIyDA2A5
	 MDBv0bXn+V2hIgYhFABYZMR0iWF9zNkMrejlbZ4tp4VVlcRN2ZFHUhAEMaKld2ECI/3iy
	 53RHZhvYa7AEQjKTWV3HLWXgRG6Fb5AWE6LqndajiQjfjLtibUDFFZLOMe/EKp4rdw82z
	 fM9sElFJ0LiO2mDpfoHQASaFE8m6dzxhIgMQd5fd0iychzZQ/+ywWmBtI9HLPXuHr2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jLAkP2eI;
	arc=none smtp.remote-ip=209.85.128.182
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40210606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 13:52:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40210606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jLAkP2eI
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-8565d77c277so16981267b3.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 06:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792936376; x=1793541176; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=w+35OHT8eig97D6eOQL/H2On44eSSo3B/P3W218Fgsk=;
        b=jLAkP2eI3nFD6ECuhVjuy9y5smABETQRmxjSpdOTM3eBnvN2TYHqpJa+H7DqtOizYk
         hfL2TkHM9UPjR+sRMCx2qBGYp8D8hS3XE55juNHLJDpeXyr6r4p1grytvkomF+6Jqoog
         s8Nv4gEP1k1pTOlMs/oZIHM7wKFFci4X6XAaNeQvLqRdqEjBkq3mAkePOempRC9DrorX
         gU7jmSYenlJJnB/YwSfN52jFm8DIMz+JeT6NLcv7Cw+dbwR0/lb02GMlO9yiVNoPMfyI
         gO8EJE7LlBtj3PkxlToBVgg2eWd0uIlnq6j0loSqoXCEypnCdIUSfLqPvNLUd6kbwFRA
         hMfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792936376; x=1793541176;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w+35OHT8eig97D6eOQL/H2On44eSSo3B/P3W218Fgsk=;
        b=OHfyMMIQEFMVwV4I7yz+7lZ6yTvtodM6jqjTEJT+RF53QOFi0TRWcfp0sToC5WSWqs
         B1lM1Hr5MPJcZ7kIdevg7EULPffazy0z/ka0GhaWx12+y2jd72D7DBMdck1ghT3pmLD5
         Qk3629nUnPKFdC15DaYMoBfHSx6b3yPwOgzKMHHl/+RxtMJLev0ETvNsU8S6qzsskpUz
         BCb6IJjUJFRQJkrNEHaZOnVmi/P+KdNnJUMds6NdTIvkTg3GHqFjvUBpDSpUDXhsY1GR
         QTQYvBAasLK8pKQZQnxC7CFIthzEmeiX15JlUrPpLU1E53NZN6JLqOj7mG+poEn9vqYx
         wFLw==
X-Forwarded-Encrypted: i=1; AKwUvBxc8YL/H/C2Yk4XUje9jAsT2Tk4nwHlMnv3+7TAqXdA8StGb48SgNzQFfYAu0uCA4yL7xckf+vshZEpZKo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJbT1c6ZJ5isWnkHMUjVj3VF4yp0bgjjqzy0Y4n1CRcKTfyzjuU
	Nt+igZ6kEA4zCfFvV5QdijEQJzkvpvzX6q44AE+Mv54ctxrkO1RjNajDpaNcyg==
X-Gm-Gg: AYBFou1DPf6Rg7QPOxLDucMmtQpROZry3jglxRA6eaPy2xvjxSZCauarKSKK9iNDSze
	+vJLjFgRDXGOC4GdI45r2q7QcML3fHl1FVxWybtq35ZQar1i54HlmwOAPh4xFYWvrSMSBF/+AGM
	1IN8SUoRYgw7K0L6JauRkNNxIwy0gtH/Fmc4XD0Qh1XAC631MAvcH6IhdTkffpLUywzy5mFyx6O
	NGJa7D29NEAUVZyS98eoujBHa/KQ9BzikwSP24FAcyzYFAsV1aUF9rW8jIdeYILlJEA0eZ0JZe/
	SIuYJjQFw7JJUAEshbu+7ZpJ9dXrfADstmttHIB0kPH5VcCO5ueSxf999p8eV3cymZOh/KVRWTl
	h69H7J3pBSajf1gLmaZMLvI5ngbT0IvBWzsvH3YvkGbPn+fqcprVt7UBjiwalPbcgNAo0gATlXN
	N0OM35DNhud5ukJVLrwdfDdskXwr38OoJebRdqpiEYPe7xwY2x+sKAPfFwQ/ABTY7Ud5+tAia/T
	LDjmhFxaQDR21KmcT0Y+qTKo0NictkOlsy2oKvTpvtGeTE9HgjD1unBGel1+NLI6lEPO0kYlsh3
	KuwC532XuZOsew/ATde6qKj9gMfZwA5iM9BnHOHhPrQCeg1tCsBAFmMSng==
X-Received: by 2002:a05:690c:d8a:b0:8b0:6866:c5b6 with SMTP id 00721157ae682-8b1669b73d7mr28746487b3.9.1792936376071;
        Sun, 25 Oct 2026 06:52:56 -0700 (PDT)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b166dd1571sm19902957b3.13.2026.10.25.06.52.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 06:52:54 -0700 (PDT)
Date: Sun, 25 Oct 2026 09:52:52 -0400
Message-ID: <20261025095252.1749067.mattst88@gmail.com>
From: Matt Turner <mattst88@gmail.com>
To: Magnus Lindholm <linmag7@gmail.com>
Cc: richard.henderson@linaro.org, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org
Subject: Re: [PATCH] alpha: fix PR_GET_UNALIGN flag mask
In-Reply-To: <20261025074237.1050419-1-linmag7@gmail.com>
References: <20261025074237.1050419-1-linmag7@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

On Sun, Oct 25, 2026 at 08:38:50AM +0100, Magnus Lindholm wrote:
> GET_UNALIGN_CTL clears the flags it needs to read, so PR_GET_UNALIGN
> always returns zero. Keep the UAC bits when translating them to prctl
> flags.
>
> This was uncovered while running the strace test suite on Alpha.
>
> Fixes: 3185bd261882 ("alpha: separate thread-synchronous flags")
> Signed-off-by: Magnus Lindholm <linmag7@gmail.com>

Reviewed-by: Matt Turner <mattst88@gmail.com>

This has been broken since v3.7, so please add

Cc: stable@vger.kernel.org
