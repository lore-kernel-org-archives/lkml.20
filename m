Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 622C72AD35
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 22:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789337806; cv=none; b=cxcgUE3O5qx932SpZWjxU7miVKt6epfJCoxoay0NpTwLid90p2nwbqGfA42qjAFeskdOJ3Qemg0AviLVWfpwP2ptAW08kI1xQy9jGCbShZQigkXrQJXAEBL3sYd9rTTOcAHsSir59wntBdOZlWgmIXmTnQIc0vVnHr4jQS0SL7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789337806; c=relaxed/simple;
	bh=12saGpQCsyPvcyoHas0G7a63bhlRxUB1+FfgpNhnIjc=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=tgVkImWROy8ozM8YX207AK68Zlam4gWofR4Bp/pfIIdy8FW9CHKTUmaq7ED7QYNa6YM4FhD26/SrczGakCgPSNRP+WY4QLYd8BRoQictjaeaANTCMxjroCploWigtBN7rCXCDX0n4buxDOfhGgfK9SpBt2jfWOzu/49a9+E51tE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RbZlQCv/; arc=none smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RbZlQCv/"
Received: by mail-yx2-f12.google.com with SMTP id 956f58d0204a3-66e50968489so1002759d50.0
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 15:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789337804; x=1789942604; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KwJQ6M25sDzikcUA36ZvZh5n4DhA78o4GRWDhlmgmoc=;
        b=RbZlQCv/e41tUD02a3AzvcXzRB5AcOHgbw96AaKkkrRupwNvwAE18SU76Y2vnGPquz
         xAeqUEiw4Upo5O2ekz8uc4jFYTNwAagz8582DzY2hXmOkUiNrASBeJCOUEaFVHREEpXQ
         z1SjMqy1+25rsuGtk3Qft0jcFgutQntSdcm5nG9xOvwTcSpDWPYtDtvKe8ofc6np4djJ
         NAByFOBEUkLmXmGanCWpRNABT1UDwvpCll61/reC5wPviICZ2zFcEn20q3aMCus/XKqg
         t90jJPAPniyBI4SN9d49KPIPfRgwvmBLS70SMXRdzA+V1qYX//Ya9DdAZpeHOWvW3s5O
         YWsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789337804; x=1789942604;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KwJQ6M25sDzikcUA36ZvZh5n4DhA78o4GRWDhlmgmoc=;
        b=naAWzb+o4ZDhCY+xA5MxPcVs9NDzqCM9tfxdu4CZRzi+S39F4NADZj5EUXXqQ5Ik5w
         C6ZRDv6zp1ucF274hvZlJM+CGqPkPt0gxmVAd3rKZSwXEHQ7aY1DDA7Ig9IDL4EHit0w
         zMdoNX6K6pfuZLV0+DPZUuTsU0eCsndpC5qJ5Ro6NfV5AhSFndrIq2gJzpKNfwIhossy
         b8Z2LaJRZPqOG6n+B1zTqId7anEV8//eX3k8lfs3cITLkxAg2uMd0OKFxGBClerB4AO4
         sdjXq93qLTLhh6Sb+TemsNalNu0XQcBwJCS8XoIU9Hf+6N8Oh+IjrX2diXESw1VoCe7B
         N5qA==
X-Gm-Message-State: AFuF++kmGt6LWXhmAceI9gcP51U881IEsrDcMmeThim2LsKtcKxN7tfT
	BFGJ8xw0Nj9vaQjh2j9EuokTWha3hLoLdAOZyjdggDdCHoULbpbwIDBm
X-Gm-Gg: AYBFou31G8MtMxGxQ8Rq2juyv7Do8VVsji/n1ci5RJGppJiWhJQcYWjgMVT+riE2D9H
	ugjeQcbLFUQUJ6AIwfmTfkJomuP2Pqx9sJZbN3EsfqsIL9n7AIaYkkvWolG0YRUjj5U7MaHZ4C3
	AWh4LKjBwtPXkgg9XhV2Z0qUHDXhaMm1FXTLollLH2hO857K5AjcT448COVZsJNhqUfEigJoPsr
	5/TMqH0hCGuxTKUyS9+K6udXLlXibmET3M9UUFsVfaH/GVwhW8Pdrl6JrezVEXB3AzikHRSLMCF
	QUyOAssDceb7ZOcACt5nTQ8Rsz4oTNur9F2SgJTd+GdLGMJgHUuTY+0z+/D2dXC7qEc+fATq4vV
	/kPXpIxODtsDMFrm44sFjlMFLYbTcO8mY1SGoejEMsEi6KzT5ssYFuSO3pdp9KQEtFdKvSkWXT3
	/F1yLv1bA0739nOOFhiuarVZIreXQBh9BHugfpGZFkdYZ/cMSOd1fuUwl3Xj8ASeuE7pXdb12kj
	jI+6GyTivdjHkznt524Hy2wP8gLE06gKsewHfqOED8pv+bcpyDl
X-Received: by 2002:a05:690e:1509:b0:66f:bc5b:1d33 with SMTP id 956f58d0204a3-671245110d7mr4867599d50.9.1789337804364;
        Sun, 13 Sep 2026 15:16:44 -0700 (PDT)
Received: from gmail.com (111.46.245.35.bc.googleusercontent.com. [35.245.46.111])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67125db3459sm3754086d50.6.2026.09.13.15.16.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 15:16:42 -0700 (PDT)
Date: Sun, 13 Sep 2026 18:16:42 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Mark Amirkan via B4 Relay <devnull+markdamirkan.gmail.com@kernel.org>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, 
 Paolo Abeni <pabeni@redhat.com>, 
 Eric Dumazet <edumazet@google.com>, 
 Simon Horman <horms@kernel.org>, 
 Chetan Loke <loke.chetan@gmail.com>, 
 Jakub Kicinski <kuba@kernel.org>, 
 "David S. Miller" <davem@davemloft.net>
Message-ID: <willemdebruijn.kernel.1288a752aca73@gmail.com>
In-Reply-To: <20260913-b4-send-packet-private-v1-1-925eab2cd388@gmail.com>
References: <20260913-b4-send-packet-private-v1-1-925eab2cd388@gmail.com>
Subject: Re: [PATCH net] net/packet: avoid truncating TPACKET_V3 private size
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Mark Amirkan via B4 Relay wrote:
> From: Mark Amirkan <markdamirkan@gmail.com>
> 
> tpacket_req3.tp_sizeof_priv is an unsigned int, and packet_set_ring()
> validates the full value against the block size.  init_prb_bdqc() then
> stores it in the unsigned short blk_sizeof_priv field.
> 
> Commit 2b6867c2ce76 ("net/packet: fix overflow in check for priv area
> size") fixed the validation arithmetic, but an accepted value above
> USHRT_MAX still narrows when it is stored.
> 
> For a 131072-byte block, tp_sizeof_priv=65536 is valid.  The narrowing
> makes offset_to_first_pkt 48 instead of 65584, so packet records can be
> placed in the private area that userspace asked the kernel to preserve.
> 
> blk_sizeof_priv is internal state, so widen it to hold the validated
> UAPI value.
> 
> Fixes: f6fb8f100b80 ("af-packet: TPACKET_V3 flexible buffer implementation.")
> Cc: stable@vger.kernel.org
> Assisted-by: Symbolic
> Signed-off-by: Mark Amirkan <markdamirkan@gmail.com>

Reviewed-by: Willem de Bruijn <willemb@google.com>

> ---
>  net/packet/internal.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/net/packet/internal.h b/net/packet/internal.h
> index b76e645cd7..f5c8cd0eed 100644
> --- a/net/packet/internal.h
> +++ b/net/packet/internal.h
> @@ -21,7 +21,7 @@ struct tpacket_kbdq_core {
>  	unsigned int	hdrlen;
>  	unsigned char	reset_pending_on_curr_blk;
>  	unsigned short	kactive_blk_num;
> -	unsigned short	blk_sizeof_priv;
> +	unsigned int	blk_sizeof_priv;

This could be moved to avoid growing the struct. There is a 4B hole
further down. But it's no big deal for this struct.
