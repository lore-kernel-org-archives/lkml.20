Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CBAE346AE3
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 07:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789198814; cv=pass; b=HIq5CNeQlxaT5efXZBJPY4HNnZyYcLGsujfUaUNg/XzQ3zKFBaJQsah+FdlabJoBClfdYwcWcT+DjdLo8H4lkLa5H3GYpi4xCwqz6Pv3AK5falNFdjOcUvpGB2I+Z3aAMrS59T3fpdrTxuelP0LXaO3G1VPd3ypMnYwncB5Rgb4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789198814; c=relaxed/simple;
	bh=a5BgZIa2nN3V7GG8MnhDOEO9Xluz3rwKpxUKZrZY1y0=;
	h=From:MIME-Version:Date:Message-ID:Subject:To:Cc:Content-Type; b=NqtXTAMDvrQgYkqOq5mxz3i5h/hSjkydBLcOG9AyGJy3Q6UvjpRb4FMbv+fzATp4bYomUwB5RnZhH2OSYfnz9c/aBegG37dXiU6E2VqkDlSKdFL/9RwcSm3wAeSlbCZblJBcu4EOaiaCW0ynA1hrN/n6Cv95zK4Zp47T8HTlOlM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu; spf=pass smtp.mailfrom=berkeley.edu; dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b=OMN+nqkl; arc=pass smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b="OMN+nqkl"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-85469e25187so464949b3a.2
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 00:40:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789198811; cv=none;
        d=google.com; s=arc-20260327;
        b=MBlpoWLFgbblyJRY1zSEFqzwmA/oXCLIhTmLHXcZ2rUENyeUkmHlbD3itd3saWxfdr
         qxF3+USRV7N2YfUbMghCr4h7/C0hhev6qjBFe9ovQIkKDA8y96oSCY8eu5DAIfGZej5l
         UYtyJC9Tv5RO/aaj6U6PvVRe1D2Ari3UUMlIkcKKtaGimOvsRyb4axHUELTDg+OlUeVR
         jMbuDbW7Kqz5t6VZnbpC0w04ioZQMGZ06Cz6SVXdYg9lRQD3bPSuVFnBkYzAXdt8QU/j
         VJ8J5k2srtw8OybpIPSp/rUeytHAdMFCK8GCm59mmWvTFNA10i5YbcHEP5yIBu3BA89L
         XyWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=QG2SNeNOqKf6itNXVRATkNtIQBJP4qkHEst2cXeq/Oc=;
        fh=c2Efnc4D9BfHAIu0V1UPo/gspWySKdagKbvfZcCm0Tg=;
        b=A6o4gbVJqTbkIHNk686AtjKbLHdwS1MelnXNxJhAx9xWX4mmNv5cMYu8eKA+2OA/Sd
         S3+mQHGAV0eYR5Oqa1CYU3OJFcSaTzczdEDRpuT+Uc+v6p1GxQn5vg1gMvcazaKVu2Uu
         jIDIlKoBGtN+L96EUXCi/nUEsTaksSzqGsVxJT3AT7A4MI9znbnAFcGAQFTswS+r/Sib
         yiiViZBXOgUK09CiQTqMq0pg0scMLtWsauuxVo5xcRSiDNSgq2FwySyMVwiSCq6ltx1S
         nKq9MQs5hWDA6GOFwmtYo+PpP/FgUsjNlRrJSre7P9pVHGXLuuojIuDp4ClfU7VemViS
         4f1Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=berkeley.edu; s=google; t=1789198811; x=1789803611; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QG2SNeNOqKf6itNXVRATkNtIQBJP4qkHEst2cXeq/Oc=;
        b=OMN+nqklVDfMdt0nt/oR8IX/v2tMsZLPn7d5gYUNxzhpm9jH0ORZw2hKmqg8lWA0rB
         lzwa1bcYSLxPxJbrw0VCk6T4Zrq03uEZfbeDk1GQbLSbRhMoZHUrIySl0qSiMFCrWOe7
         LEDz/C7y57r0G14FWil9ccCN5nfGtSkZ/ryy2NWWN47c3JLy0cRu14fi5nIm2bV2P2NI
         X3PsPA4NxDRDgVqXTkSAsPvQEjMBtr9G6u8VZ3NCmxsYpM22RI1/40hd3uFJVOkbylCI
         e6otxTorETJ0MtznvOJNQLO3YpPQu/IADoppXDIwBE9my5qCEu9brIez2rm+oGKdeHNb
         UDLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789198811; x=1789803611;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QG2SNeNOqKf6itNXVRATkNtIQBJP4qkHEst2cXeq/Oc=;
        b=pJilnnOuAv02h/l9fNKk4cXvmVk4k2OfmhLrpLJVvH9GjJ16f02PPTtShpvPn+3c+R
         7BwZDmqyRJS1gT/UWHBIF2evi1cacqiJbLYIHS/jJJ96Gy2FfVndTvJ1tSf4qyEONdcv
         VO57oXO54Iy6HdFJHTwAlfwIhQaiqOm25VvH9DyOsICa0jsfIi9K90Q2MQj4yGWb7XGy
         B1I/7JPZ8k+p28dRn2K1zptQTg2NvpQJmf9EzCp1zjVeMjsnsKPEheIi0YJ86DU0aUDf
         Kl46KssyBQttPXsOw0pOJEn2r+MrUlw1lvQ7GUxGav9B0w+Yn9SEPa6MeylNa8H9VF5o
         5l4A==
X-Forwarded-Encrypted: i=1; AKwUvBzeTuORdzA5GGfh7y8dPGe2ahGe0k7YmnIn6WbN/skIoIhUZW0Y+HQENdEgVbpcMeylOAIjhOlXsKUw9sE=@vger.kernel.org
X-Gm-Message-State: AFuF++nRqpoi+ZT5615tHtpEtYyjop9nWHqhMUokzPi/VdLZSoeJKuVz
	JbMA6Cpx8spCSqVlBhdoWwva7y1AUs+KYXxPj8VLQn8F2ZYJlMpG9r8NjHa5nO0SmFwhvyntCZt
	WR8eIxMS/UwBM29+ZYUf06MHRf2pCCRfiLqchoy+k
X-Gm-Gg: AYBFou0XRmZUakWM3oaLgan60j4yiVHRbLQSPzZbXMm17Kun63CHz5UI8K3wFzPeziT
	9TcfWrgDDcuJBUP1owFIotE7RK1A+0oO3mG9IvcQo5GxFc5mp9F0qpodaFZD1Ys08PLXtlLUhVY
	HUoUjpGvQI89bpEzPlhdXmkhzvKsIc82LzaqVPYeru+DKcochtCGR1bfDRgPyyVxyyoQzTYe2ua
	mzFEFyQavq4pEh76FsA4lH+YDryRy98RBA4kN8NJlp/U5qQfnyiHwBlwC+dSiZffkuoNzH5ZZhG
	BO7HjG2PbmWfq9ROdRMpoUxXaU+MfcjSpF8Hk0fO/B9Rk3BwhOhiEGwH8X9zYa/hvDMdnGMwPhP
	B2qEiMnSidHo6RvZ6VVeFxQpgaY4Q1ENBV2wl0PFJNGQ=
X-Received: by 2002:a05:6a20:3ca8:b0:3d0:868d:8ccb with SMTP id
 adf61e73a8af0-3daed418649mr14691447637.13.1789198810266; Sat, 12 Sep 2026
 00:40:10 -0700 (PDT)
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 12 Sep 2026 07:40:09 +0000
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 12 Sep 2026 07:40:09 +0000
From: Farhad Alemi <farhad.alemi@berkeley.edu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sat, 12 Sep 2026 07:40:09 +0000
X-Gm-Features: AcwNN1U7oiMPPggvAGkLxJ8f4FS-S3NfnynfUNKYcvJ3EJSPIXU-keM5UBnvdpg
Message-ID: <CA+0ovCgKDOk+Bg6Gh5Lwx94u_jJjQ30-vY1JcY2BYfhnWJJbPA@mail.gmail.com>
Subject: [PATCH net v2] net: remove WARN_ON_ONCE() from the
 dev_fill_forward_path() loop check
To: David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: falemi@asu.edu, Simon Horman <horms@kernel.org>, 
	Pablo Neira Ayuso <pablo@netfilter.org>, Florian Westphal <fw@strlen.de>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Xuanqiang Luo <xuanqiang.luo@linux.dev>, 
	netfilter-devel@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

ipip_fill_forward_path() and ip6_tnl_fill_forward_path() look up the
route to the tunnel's remote endpoint and set ctx->dev to its device,
which is the tunnel itself when that route resolves back to the tunnel.
dev_fill_forward_path() then makes no progress and trips
WARN_ON_ONCE(last_dev == ctx->dev) as soon as a flowtable tries to
offload a flow through the tunnel. That routing loop is a configuration
any CAP_NET_ADMIN user can set up, and ip_tunnel_xmit() and
ip6_tnl_xmit() already treat it as a tx error, so remove the warning and
just fail the walk, as commit 008e7a7c293b ("net: remove WARN_ON_ONCE
when accessing forward path array") did for the path stack overflow.

Fixes: ab427db17885 ("netfilter: flowtable: Add IPIP rx sw acceleration")
Fixes: d98103575dcd ("netfilter: flowtable: Add IP6IP6 rx sw acceleration")
Closes: https://lore.kernel.org/all/CA+0ovCgaRvbd0Udj70b2xxG8Cx3CaCpNhnf1V4RWQuDveZYZhA@mail.gmail.com/
Suggested-by: Pablo Neira Ayuso <pablo@netfilter.org>
Assisted-by: Claude:claude-opus-5 syzkaller
Signed-off-by: Farhad Alemi <farhad.alemi@berkeley.edu>
---
v2:
 - Remove the WARN_ON_ONCE() in dev_fill_forward_path() instead of
   rejecting the looping route in the tunnel drivers (Pablo Neira Ayuso).
 - Add the Fixes: tags (Xuanqiang Luo).

v1: https://lore.kernel.org/all/CA+0ovCj+Pd5owGH+51rA8-RDu9YFx5oYUv8bV0zOE72QgVfY0A@mail.gmail.com/

diff --git a/net/core/dev.c b/net/core/dev.c
index ecfbd72d5d1a..c67900354fa6 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -789,7 +789,7 @@ int dev_fill_forward_path(struct net_device_path_ctx
 			goto err_out;

 		stack->num_paths++;
-		if (WARN_ON_ONCE(last_dev == ctx->dev))
+		if (last_dev == ctx->dev)
 			goto err_out;
 	}

-- 
2.53.0
