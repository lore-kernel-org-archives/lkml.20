Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793333190;
	b=M6stxyEEjbqxK9ulrfm7JQ+JP410LrC3wuHlkOg0z6NG3UlimAJfpGm4KRxFEZVZe0Jw
	 KVYRPnsqqfJt40cRazKM0ZeVPLS08QP75M2BYMTTgMehqz0HGU0844u1kL8IuXOBto5KE
	 vvXEI3qfhacWJIGv7JulFnUQDdEQHGOWNDhN5FOvNtEGEdgJPHNh0yZkvl1Kp1VYJE28P
	 OcXN19X7Ce9pAnDLG6gGFbQyQ6KBmv/X5MwiYoZ33FGWltnDiRp38Ydff3Sf8/blsxYBi
	 y3ofyR7iCPSJC1Zl3+xwsZ6RPBYp8YeuUqht4om6vF7mjyUzV4N8kFjNeLJNaDXHZYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793333190;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=uWhG69hUkv8+lJDJp2Q5DGOfAlOtWL0/OT+J3s73WV0=;
	b=jGEJeuYu+XdZuEM7Cm+Ch933bzLNNXDp/DsjU+7mN+6yvPaO8dtYszwSTbFl1eHQEIsP
	 POpq9On60F4apSGSPtfnA6TCZp/lL8GlFM6q4ySD7qbo/+wwjn2/yxxOj3Hni4sHXKvQm
	 uRShHNEITv3zwYGIq4ChFERVoAKr0bW7LtuWRX/jfxoBdaNFuvBVsP79EInMh+iTy15nP
	 D/Y6cfYnx0WVB0KDdTvl3cVcWBLKrbibw2884E575Z2D1UYq/2C9jmaHquLm1qF4zKkZe
	 jOBTbtmnchxj1CYePWozwrkOYSRyKOShfETj0UGqBvINHhQePXHVN1p176w54ov8SmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=naBneU0i;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A5D4606A331
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 04:06:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A5D4606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=naBneU0i
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1438d9363fbso235582c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 21:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793333189; x=1793937989; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uWhG69hUkv8+lJDJp2Q5DGOfAlOtWL0/OT+J3s73WV0=;
        b=naBneU0iFArIi8eqr15ZeHE2r6fXY4sAd/jMYwWUqKEfJ4URpBQDycYcimswKQEL/L
         xULs8W2YWVcJ+buOF71p+LlkpLMO9OfgnA+PonDj99//Uf6h0V6CBE0cfqltgdR4S1oX
         vxX7kzYLECZHT44TEdA+MT9lnpq70obLs4xS0j33mzTBNQ17ijO0rL0caBCoSlhdEqzW
         gx8VrIuzCibPrsVuQmwAZ7T6BiVf54vGvHOinKLNTFKgh8tG2lb8Y1Bd5zXRFG34Txf/
         1745NZPHkTCmod+I097nJLFts98YmLHHFWnAIoJfTqZFQzQcSi5rGRlQDNHd8Uf20xPt
         v3cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793333189; x=1793937989;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uWhG69hUkv8+lJDJp2Q5DGOfAlOtWL0/OT+J3s73WV0=;
        b=benG849KhxmJU6tGcp5Y8GKw8RnP2DzY+NaAzk71snqNW8OsPBU75Tt6fPv7AskwaK
         oMBQOAGDCMEc7EnVlQ+HBg9Wh9NmosLfd3DA57zKZjyfLzBa1BGh+BPYgHKSykiCyAGf
         uLtW1cJfYTOo7yuwVNXNZ0zhZ3ySpYESiLNiOupm5kctgNMwC6/IJH28ztYaidI9iWBv
         Sa6t3y7Kj9WfooUiwIh1mBwswtCJotEurTm7NOl/1J3U54xAZ88i2PThokbEUv0lX7hT
         pmwOMipyjUIYYVr1duZ+q7pnAUyG8omi6rFa9j7ee0h77DpbvOaCyf5QNVtS30NjlISP
         QEDw==
X-Forwarded-Encrypted: i=1; AKwUvBy+VSLrjLaqgkX8LdBIgB44WYvxBHUA8rj2YckJ7LGTqAwcyE16vAttFi2Add9sYvrJAv/PpD0vOl8s6y8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ9DydOQMV3AikfX1wFmMhCvCCX07waGah2Ls0b8YJQOCOaWMvq
	0Ig8+NKXjEvmzfs9zPSh1xqOuF0fzJ9DxRtrbyc/a3zOngj1e6iMqWmd
X-Gm-Gg: AYBFou3Bf/PqxPDy7j/xcXKmt9Pd3o2XpCpkVZYGkXlBdh2r60JzG4CiY5gYJZESkb3
	VoYQTKhaeUzD6n7ZNRQtxPZb1X9hOqBO3GCxQJIWfHnQ4hETaKGe2HwJKVAmzxxYxxRowH5yZqM
	KjpZeJd5ee42lPruhXmzhmD50gs/nYoPqsmhgmIGsv8DNLnI7JGtJ3cXsIlo3Z0UW+bvYdbb9Cm
	so8xaIH3sYiwHoRfrIjkEvoEvsA4LN4ERzxI9mog/5yMgnUV/aR7c9Cz4xykOH5sPentI9CfeSf
	Uy+S2LLD6ach6o1sVf0BPyDDfc+CkYYalXTC3hVYeJTIlW/iz1EywGT/CYTe5HkZCLmRq7Hvhye
	0quLGM2W7VKaDCca533do/+UygJE0g0BxI+6VlNApvhNGSiJnz5/CDzQyPc4b2SHLkzSsiallID
	mm9OfEypw2ZtulHy2+YbSuFAaDxAPfiP//m8cmx0LATIAw09cN+vUF3TVmvGgkucOn0APUK3/Yt
	7KCRL+XgDB4FU72ra/ewjiTuaHhmYcPceE9upDYTDEBgp8PMaRiy/a3mzcr+EQxOCyRQjOaNyKh
	zV5J3cnk9hZdZIY0tX/CaXD0m+Wyp9mCutsGS9EX/mn8Knt3jSK/2jNwd3m+a/x5kyqFDNtaxh4
	=
X-Received: by 2002:a05:7022:ec2:b0:19f:cc98:f603 with SMTP id a92af1059eb24-1a9420e4a4emr7161417c88.1.1793333189327;
        Thu, 29 Oct 2026 21:06:29 -0700 (PDT)
Received: from [127.0.1.1] (67.216.200.102.16clouds.com. [67.216.200.102])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42902649sm3410984eec.11.2026.10.29.21.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 21:06:28 -0700 (PDT)
From: Cheng Yongkang <teel4res@gmail.com>
To: Ido Schimmel <idosch@nvidia.com>
Cc: Nikolay Aleksandrov <razor@blackwall.org>,
 David S. Miller <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>,
 Horatiu Vultur <horatiu.vultur@microchip.com>, bridge@lists.linux.dev,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] net: bridge: flush FDB again after unregistering the
 RX handler
Date: Thu, 29 Oct 2026 21:06:18 -0700
Message-ID: <179333317813.2102764.11838518621146184655@gmail.com>
In-Reply-To: <20261025081919.GA53797@shredder>
References: <179268538303.70821.8213834342995341232@gmail.com>
 <20261025081919.GA53797@shredder>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Ido,

I'm sorry for not getting back to you on this patch sooner — I only found
your reply when I went through my spam folder.

I tested your suggestion.  I applied exactly the reorder from [1] (move
br_mrp_port_del() and br_cfm_port_del() before br_stp_disable_port()),
and ran the same reproducer: a diagnostic switchdev endpoint keeps
del_nbp() between br_fdb_delete_by_port() and
netdev_rx_handler_unregister() for 1.5 s while a flood keeps sending
frames; the test then waits for destroy_nbp_rcu() and sends frames to the
learned MACs.

On an unpatched v7.3 KASAN kernel the port stays in BR_STATE_FORWARDING,
new entries with dst == the dying port are learned in that window, and
the trigger reports:

  BUG: KASAN: slab-use-after-free in br_forward+0x55/0x3c0
  Read of size 8 at addr ffff8880200bf038 by task mrp-poc/9420
  ...
    br_forward
    br_handle_frame_finish
    br_handle_frame

With the reorder the same window is still exercised in all six cycles
(the 1.5 s hold is reached every time), the port is disabled before the
synchronize_net() and the FDB flush, and there is no KASAN report.  A
normal (non-MRP) bridge regression (two veth pairs in separate netns,
ping, FDB learning, port detach and bridge deletion) also passes.

So the reorder is sufficient and the second flush is not needed.  I have
prepared a v2 implementing it and will send it as a separate patch.

Thanks,
Cheng Yongkang
