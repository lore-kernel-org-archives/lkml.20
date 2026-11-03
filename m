Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793672913;
	b=lX8tgwXxe7Eu3I2dcVdXn+Y2Cd4TRlxQidSJRnBQWvsOMnptFHGbUQfW66ZYyaOJYV1K
	 gOoEBXkvs8+lipUkYgjLT460rx/bK50dMmhs9vgd4LEnHU/cmLAEIt1drrlR3yn+gHeyP
	 CEJwiZ/mvoKEvv83hewQuftI/+FyQL9Ztq4ES/IDSlFIKVzsZGlkN7ntYujmtNGt7qNdO
	 6cOMXV9aQKe6egKO9igwaRxQ+GZ7iQYA5qWG4U9QKH0yLhykrCBEnGM8RFZN9XJpuJcVq
	 S9fGRlLtntaXxIcnp6wIS/IPp6glnWrqhjDie+LHbmW7cZJp755TjMxTpl7bcdIwGdA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793672913;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=43k2JoRgmvLGktezxg5Tqe/6VKPUAsfo21mLYAXJ+uI=;
	b=uqvzaK3ydp1tlIna5GbILNbvMc4UCtfEWd8ZUgEt1pmyyXgOeEK76WtZKBIkTZLu8uVN
	 aFP4mXVPhuPScOFB+/f6xr5tnriNiWC5nEoqxZSmc23/a3Ru3UhjIBFXDsztqPYtdYloA
	 rU0Npf5JvzEIkejyMurJDHEe3Su3YA3FhrQkmoC5MRfj7WAJf1pKblNqrNyjCbWuRIWuN
	 +kXN1vcDsmfh5vVEqsoIQf+jUksbtD4Arjy/kuWodmEcPvxFGpLzGUlO98/SsT2vSV3u2
	 zaRYjq6ALSgvon3Mw91LwAkCFdhaWQyjJudCIC8XhWUptKOyd23gw03+JZnbJLoobig==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TBcVpV3N;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.176
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2371C606A327
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 02:28:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2371C606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TBcVpV3N
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-533778ab0bdso53012551cf.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 18:28:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793672912; cv=none;
        d=google.com; s=arc-20260327;
        b=CmXik7Qjmq2os80txx3qIOEW+jaABHQ915eYPPKtV4n17sbkIwrMp75Qj4hlDNrOvw
         Lc4hIM1vYdXgpB0aHBGXB+LqsRgo2IBgdq1HM3cVEGhO/gbF9AsjsrqC9PjDerG0pDJo
         Mjbji625cA1zPRGVzDr62UE3VN9uPQnFtd/o7DH8o8Ph5FnKOy8Hp4aoDKrw+TNsZypq
         6ndpBqUtPEHyfGwYHK2l3kq7TDSV/mF5aZSDFOSmIXprCWclKIjZyZial3m4zdFOLiyI
         5ne4lBKetrDN23UbBf63ril8f86/4nfWPdYmkuxu4JKpc0wR023DD6E/Jcpn5c1Oaiyw
         CiCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=43k2JoRgmvLGktezxg5Tqe/6VKPUAsfo21mLYAXJ+uI=;
        fh=WCyrcxGpTHSB56xeRhvxNWrnG51luZBQ/iOd8K0/Gt8=;
        b=ixgmyGQBdsRbWNNAfCpTqcoEcmD7ieUu0ZxVi4iJZMwavzUMRW2M/XVxrRiTjV3le8
         aoeQUtHx8GIEMl0eIRi/4e0pIjvAMxNKsULKrJ6rxYw9Pgwr+JfGqBcV97JwveqKp0ne
         p/RV8j7eA8o38IqjNW68XEJgnCx6fzkPYErfHOmBPXrzuOXZ0nqrbqbNGAlMVArIq7Wc
         li6BSbEJLFf5xE6XlgReHcMIGZ8u6kXqNP5fq3AWx1yhwhSV7qY1M823SCCA/VBDd+Fn
         wdbiQzXLTJbAacErK69Gek38AzEEnoitfkOVD1uWcjqVDOaV7E9lh3nyFf3nqLQjVjpR
         2QuQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793672912; x=1794277712; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=43k2JoRgmvLGktezxg5Tqe/6VKPUAsfo21mLYAXJ+uI=;
        b=TBcVpV3Nm0DEYNMpivFPwbeMW+Qgh+kb04TIohJNdNrJXXHNLdU09nGHewGUewzNB9
         kGC2oUWJ6M26At3CDIR3ChUKw8t/UezDkoB22nnJOwjzv3syJrngkTRCnZp90UBO+KJR
         jw2tK1G9qf563Dq/aHrzwejkDJKKaNuQ1oPPe9Wu+sk8CrTm01ftG8UFfK+Op3Ky5V3K
         a1J7/HcjRla/z9oh2iSNS34iC5Dy0pJSl4thJ8LmoAhb81bYvvJ5JCBeB8gO4pD8WLtK
         zJEMycOpLbu7GrSQ9VNPnvdK0Y9R0s398SjtBGUIQg+zf5y7TWhZpymUFUFrUSS0me02
         shaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793672912; x=1794277712;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=43k2JoRgmvLGktezxg5Tqe/6VKPUAsfo21mLYAXJ+uI=;
        b=S3t8pOxevYcmoa71qgmuVMH8xG7cR/Q7EASemw91XVw/6C032lpMMXeP6h8bb9eG6o
         Y773gRK14IYBkFJmsmU4zfjR9J/5PImr/jCH6sGjnpvYyoF8fsTg0nz6dQN3s40MmRmv
         2AwrOYiHwsBt17a2/wBuSNnnE0r5oCzuE4TBhfBwR6BeSHBK6eXhYGUyVt1Lzm/+9utB
         AIJAL0t031ZQKTwONkeoGxusLV5+KTZD7c7cH10k79ugAZGtyqjVAgVDomrFHyVOWDEK
         WRG1q1fR6/7PFk0D63pPrbk3l80qJQu3cr4aPQFUMfCN+btnVJbBzCX8gmnEh3eu1lEv
         GimA==
X-Forwarded-Encrypted: i=1; AKwUvBzoWWIEqqklj08tqOM94NS6ei2FzoKFa3FLgjtbKl8MhsGWjD0aFYubj/7N1AkFAAeayy/h6cyfaCdyqCI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ONpbnbr+wke2TPEcyGZEH3ycJAoqCer5p/S1T35iA9TFwtv1Q
	B9S8RJ2VEWC+NSvnCpiI99mIaaMzbu28sQguN8sewFetAdDz0v2MYFTr2E1Kp/rIsirjd42p7Bc
	7gppxdTjXjhmQybKiDCh/Tm70TWX70Z37XzVxkyg=
X-Gm-Gg: AYBFou3VYsFJ6sx3sOruXWegjVjAgpPP5aiqY6B6SSPmwQjFs/V0fddd/zo7bInuE+L
	us8vLugs3S6etg0BQnPRC1916SwuDdS03WPpKfVrzxIO4fEuNyrw8gwH2B/Ox2ve8y9TsrrA/K3
	UR1P7J7dJo0KjB6Q5El6OUN6Q16SrtpYXaRrYlU8PKy2Z09Ju6Zna0PFjxT9Acov2yTde5jhOcn
	6YOr0NRBgpNLyyqGYFZsiaMogv73srreN5pPxrnKNhx+rkHRuAeEQ/b4i6Lm68XbF1v4XR6R2WD
	tH0P/lSPd4B3IS/r9gIVBqx7cmVHvr1hJiC8iWlmtK5NfVXLyoP1U2raRQpmL1GfZXhHWmENhgy
	y9feTncRiiPEgTLmpkbinjPaIkS63Y39XRvj6gaJaEfsTvT7mRIW37zpZCGsFlHAXE+W1pnyVCs
	n425cjRxcG5eLTqZ2SGM8Ud33dna6aNc107qDdfNu6VaZSUwNWQcIb6gYd0bkH/H1xyvHD07OEQ
	g9/7QlwAoYH/HvPpoUvAPhYTg==
X-Received: by 2002:ac8:59d3:0:b0:536:3a49:f76 with SMTP id
 d75a77b69052e-542b62a60f2mr208129931cf.27.1793672912039; Mon, 02 Nov 2026
 18:28:32 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261013-sahara_protocol_new_v2-v9-0-dc9f24357c4a@oss.qualcomm.com>
 <20261013-sahara_protocol_new_v2-v9-1-dc9f24357c4a@oss.qualcomm.com>
In-Reply-To: <20261013-sahara_protocol_new_v2-v9-1-dc9f24357c4a@oss.qualcomm.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Mon, 2 Nov 2026 23:28:20 -0300
X-Gm-Features: AclHuK-mWSKXd9lnXqiSNJlntbzfXiWNAcEZqwA15ieqTiGdj9OVEQ3Jtku0h9M
Message-ID: <CAMAsx6dwZVCVQpfh9DYVU3NoTrsbRLOiORdMKm3Yo-vQLmpyFQ@mail.gmail.com>
Subject: Re: [PATCH v9 1/7] Add documentation for Sahara protocol
To: kishore.batta@oss.qualcomm.com
Cc: jeff.hugo@oss.qualcomm.com, carl.vanderlip@oss.qualcomm.com, 
	ogabbay@kernel.org, mani@kernel.org, corbet@lwn.net, 
	skhan@linuxfoundation.org, rdunlap@infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, mhi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Kishore,

> +| SAHARA_MODE_MEMORY_DBEUG | 0x2 | Memory debug mode. The host should |

Is "DBEUG" a typo? Shouldn't it be "SAHARA_MODE_MEMORY_DEBUG"? The
rest of the document spells it "debug".

> +| target. The Sahar client interprets|

I think this one is also a typo, right? Shouldn't it be "Sahara client"?

Thanks,
Daniel
