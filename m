Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792644398;
	b=D4luISnwzgNu7+frTpl75npJ37BdaZ+DQaVVDZhTKIzNjlbvIA0bmX8peFUIgl8lJtlJ
	 Y/m4xBTtmu1kNwFEhos3g+YQVUnJJ2ankhl+5D7JVH6mPdXOJxmqVcLmhMMEyou9efcu6
	 1uPwKnuJnr8JKNvS37dW6jKmTq3lI7lETJRaD7d/Zr74Ss8+qp26Bh6DkuhWbev0XLIrq
	 ptYXuUsxJCupOjItuvd6jMgMOaQGKq+IChXjDDKwuIzhhfrAOHycTlkx1sb6lZrIZsCfo
	 DgtJogbWz559KfTWq3ZvRHDaHf0ITu1NZC4bEIDS4M1Vf7igADqSl2l86PfoWjxTNSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792644398;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:X-Mailer:Content-Transfer-Encoding:MIME-Version;
	bh=5+SumxBfrxjsgvn/QRWIFxElRphz0iCgG1RZWJvYrNA=;
	b=4iZxWlnZd9ySljcDZd8i3Hbz9pA1S8yjgzte9DepGjeasZ2HpZ6286PmO8qS+d62X87v
	 h/F2QDv9ZybDg7UTsfhQkjgygLjUzBUsUZCwUNviQFQjjDDd1mdZy9zqN9psH7BrGSa4A
	 NE5/Yw/zbqhI/2Hl9U6aRYQE0kuh9WyJie8VELX0+P4dlUgg/qfj06DkFVKH0bwj/40sH
	 KZYJpjMRYdI9bPU/VRo5mKzcvzwELk5Y4Fbnahe67tegGWENn68rFBvCb71Vvsft5SAWq
	 SwIkKI5lNLcZFkPG7XS2EtmCrgBBQJ4v8RPcH8xvCr/AUQbhX1UaBKu7oq0GJQ4E/yQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=cWRKB84X;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E724606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 04:46:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E724606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=cWRKB84X
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3ad787e0593so822738a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 21:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792644397; x=1793249197; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5+SumxBfrxjsgvn/QRWIFxElRphz0iCgG1RZWJvYrNA=;
        b=cWRKB84XbahQi2H3i46ML90oKr8CoWeebcyTgeT4j29KM45JaBHNkY3VVfQToaWRCY
         BGNsb8PfqrzJsbVEzZvQCYt5KGMeUYhIhPJNpLzQSbuy1vGgt9seEBMk4IpgKNd6djdU
         vqSr/AcJTa0uq4ffUsVtNbx/0nhEePAqgJUPllxtYC8LA8rdxYXo8Ii0M1jSkPbJNKTd
         2/by9H4JWo+P4e4Lt4Dhn9wL5ezmyy0QNutBAnHpxeX09Zx6cgFu7/DoyBc/o7Ou8MRT
         7D9IdTPjmWfRm6Anb0/PpfQKnsabgtQ5SoXX3gp+mGf25XKu3vCamXHGCAb6wLLe0lgp
         117w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792644397; x=1793249197;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5+SumxBfrxjsgvn/QRWIFxElRphz0iCgG1RZWJvYrNA=;
        b=DYbUeeeqnyAsC6g8f4WBtoLS5yfDPixfZQxToIIET+YnDoLcY94kx2vG/4O6L50lO5
         8VB4n3Z/QtTjIeqIU4vJcVNh/dmQSVbE6w3wdzBOJMX1gjmGzGdP5HEgHx0XOX/HziDx
         p4JNjlPO5Ws3KjtBDiwz81TnMOqBWdkIKFW9jfVHp6sKl29WWq2awp0GG5BSrASLtgJo
         K3wBHFSxsNFrbQIfVUkWtgorPpKzzw5BAeAXjOQaKKgbBphSRvHnf2oQ+TfnouczvAIn
         hA7tlrd1x90wud1E7VXkKEO156+gjMFiKRJ66VrxyWYSCKtTxhq/Qupik7Cbon5Mpotk
         si5A==
X-Forwarded-Encrypted: i=1; AKwUvByBDnYKH1RbmOnI5D1Y/ZK8frZ1jiqalIpxHaBm/hZ/9lmJ83CKsfSYrTp3vBA9IPiigjO3ZrPKFwIPrzc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJXo2jKVGqkNExwLw0a46m0VRigFryubZqot+VcGOzWhPNvYksG
	R+GLaArrxo+cdRaBn9yWTn6dbINMDtGIjLf8VZrIyK1CmxVRoDcSx1QX
X-Gm-Gg: AYBFou1k/LHKYX88j6zTuJJ7/INQhVV6JUqplrcSPngumaX2TZ40Rp2RQuL3+RqPhUc
	cSmz+bUsj37CocGONxsQxBsWHIBOHg9u5Yf2m86meQ2Arfo3u9Q02HP7miJF5B7/dirxXuK7hdO
	Hs/aETR1ww3wbf7L9c6LXsxm0/qt1edDb81wp8iuZMDixvhfvjd32JLEuMQ0bueGylYCOLJBk4T
	zCgk/2RHRb1uz2eaoLjBncL5IG2I9Tc3VwK+RFUIv9T2LmHy32rHxf9GUOTe2sIsqDR9e2RaBMG
	O5FJKZ9hh2wLO1NmaVhnCOXrQm+0MuR89m1zz5QR/ilylLuuO4o/bTcZxNDU9X3TGqsW1X1VZfQ
	vDdZrS68S4guT0yCIL9gBsxNuaruXnQAwPkq9K34jJ9ssD++EbWPzHrQBDX7ZAwdOq3eVUwKcAU
	6LYrxeOWC5IGSDDEzBUwcRUyI5CUlldTrgpqNjb8T1FVwpF5FVD+J7q/qkhLUPD3nD97KJgYq/v
	pfR0favH2zaBAjRAIG32qlABASmVQP7Vf8ys0rJNmEfk6OSXYDZHy9G8PNtmcg9Bg1jbCYDwH/3
	DCBjYp04eRTt/2YXAN8B6f/8vUv8pl0kLO/3jJ4aRFkY+Q4IS7nIh/HTG52D/hWsAtRK+Qapo06
	2eRPtzQ==
X-Received: by 2002:a17:90b:28cc:b0:3ac:86a0:5764 with SMTP id 98e67ed59e1d1-3ad86f43109mr3159843a91.64.1792644396689;
        Wed, 21 Oct 2026 21:46:36 -0700 (PDT)
Received: from localhost ([153.61.198.240])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada490e5edsm2287101a91.8.2026.10.21.21.46.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 21:46:36 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Thu, 22 Oct 2026 04:46:35 +0000
Message-Id: <DMB3EIGZSALV.3C9PAPO7TB923@gmail.com>
Cc: "Amery Hung" <ameryhung@gmail.com>, "Emil Tsalapatis"
 <emil@etsalapatis.com>, "Nicholas Carlini" <npc@anthropic.com>,
 <bpf@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <kernel-team@meta.com>
Subject: Re: [PATCH bpf-next v2 00/11] bpf: Scope callback arguments to
 their frame
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Ihor Solodrai" <ihor.solodrai@linux.dev>, "Andrii Nakryiko"
 <andrii@kernel.org>, "Daniel Borkmann" <daniel@iogearbox.net>, "Eduard
 Zingerman" <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>
In-Reply-To: <d2369629-846e-4fd8-b567-a0fd8863256c@linux.dev>
References: <20261009202759.50520-1-ihor.solodrai@linux.dev> <DM6EVHTVM3IR.3RCFLKV9WC80J@gmail.com> <d2369629-846e-4fd8-b567-a0fd8863256c@linux.dev>
X-Mailer: mkdraft (claude review draft; edit before sending)
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

On Tue, Oct 20, 2026 at 11:32 AM Ihor Solodrai <ihor.solodrai@linux.dev> wrote:
> Slices are not reached. A slice's parent_id is the dynptr id, and the
> walk from frame_id finds that id only while the dynptr is still in a
> register or a stack slot. R1 is caller-saved, so the bpf_dynptr_data()
> call that creates the slice usually clobbers it.
>
> This can be fixed in your diff with:
>
> diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> index bc12df55d2e2..57859c3baeeb 100644
> --- a/kernel/bpf/verifier.c
> +++ b/kernel/bpf/verifier.c
> @@ -11470,6 +11470,7 @@ void mark_frame_scoped_arg(struct bpf_verifier_env *env, struct bpf_func_state *
>  {
>  	if (!callee->frame_id)
>  		callee->frame_id = ++env->id_gen;
> +	callee->regs[regno].id = callee->frame_id;
>  	callee->regs[regno].parent_id = callee->frame_id;
>  }
>
> i.e. the reg is its own parent again.

got it. you're right. Let's take your one-liner.
I think the reg->id != id hunk can still stay out. The reg is
invalidated in the same pass, so the second pop of frame_id in
invalidate_reference() finds nothing and the loop ends.

> I don't quite understand the concern with the series as is.
> I'm guessing a new weird REF_TYPE in refs[] which is not an actual
> acquirable object gives an ick. Or is it the plumbing?
> I take it you agree that we need some kind of frame-tied lifetime
> tracking, right?

Yes, we need it. I guess it's the plumbing that bothers me a bit.
The id belongs to the frame, but refs[] is in bpf_verifier_state and
the callback runs in a pushed state. That's why setters had to move
out of setup_func_entry(), take a state argument and handle errors,
and why refsafe() and check_reference_leak() need REF_TYPE_FRAME
cases. A u32 in the frame needs none of that.

> I added some refactoring patches in attempt to avoid growing
> bpf_func_state vs v1 (Eduard mentioned we create a lot of these
> objects), and that is what you've just suggested.

Right, it grows. With padding that's 8 bytes on a 960 byte struct,
880 of which is regs[]. I feel it's cheaper than patches 1-3,
but I don't insist.
