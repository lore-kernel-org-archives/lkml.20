Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C3D2306746
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 00:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789516819; cv=pass; b=X3ytcKB66UmSxdVM8CN95Taj3ePtxQxNyvDCphUKNWFv3jwD/WThoX8hMIhFpTAeZOvDZxf9kl70Xa5yZZeA56UtcGautZAK2pLeEoM+6hFFy/u0XRuWEDCcnbRaTF6/3Y8IE3j3yvbSTlw+Yl6SO0h6cbwHCI9FV/d2zLFzu3c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789516819; c=relaxed/simple;
	bh=rFk3NaeHNNH0hSNPhaHZllTRrOXlY/xKEfFXelzLWb0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=le7nGVUzyFE3118wtLgK+6M/moYfm/KXsEXorMJH6NMhMwwtM+cNh+Wp5yQmzJk4hTmIFWiuWh0qJmaNoohkgg6476W1Nj1yxQkClRmM1HTd4hnULl/3WwrPaJI3Hd+WhndaIDUXDDRtSjt269tYtfiShhkdwS6Vd7RKFq+Bpjw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oxpdGfRM; arc=pass smtp.client-ip=74.125.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oxpdGfRM"
Received: by mail-yx2-f13.google.com with SMTP id 00721157ae682-85d43da99ddso3015087b3.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 17:00:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789516817; cv=none;
        d=google.com; s=arc-20260327;
        b=P1bAW3R6Sz/FsgEIFTAOPLxIle1tdcJoeDYBcTeqLk/FB9TFS7cKy45pjWyFzlafey
         auHS8rPf+nb3/c2AVe5hhLOfHSD0jqVIK+Fh2xx+fxJadpoyTLTnhaDvS1JSRdkEmoVT
         FAjuSld2k5nt6vC0OXGjnn47coi6wPKb4gsZxkmly5Ki5zf9Nxixfm/IHw6Hqe+xfMjE
         f6hIt/Lmuw44aR87Z6OWqREGvTd8sMLHTaiIFk1VGn+Bg9Z6kX4JVgaXZbRb0c5I52jb
         qgM7i4SE3/ew4Ud66usX3Xhf5s3uTU1QXfci/Ira/Rk+sVHCx9hEfaSLuA80UJrESmjU
         3mmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=m2j/UN3Om6uoh71hgVNZqVY7SOMb3gp+7bzpkgn28wQ=;
        fh=FN6cAZYbJvfJbrJI+Q/tsX35aDN2nzYxYQ64PgkMk30=;
        b=lvSizFc4YXU6vyChugVI8lJUX2tASUEusdOpVQM94RckcETlJ6BpVSQO/sM8cwhScG
         VXSXjLnx93Y6858epCyeyGFhhXXnW/iH8H9PIMUNP7EfSE6sYCudxU50L9511T6UPSke
         8xTMSDdcq+e58KvHu+4IsSgmOPopsIuCBRFnzI/KjNAgQdWJtzgZvUtc7DklNtc9B0NE
         XDWhYs7eTlkMssIseoGF2oqgaUpNgtQCVfGg0gVrHgz33eFRrryCFTp1a7oINIpsfupe
         XtHfpPYfH5fx/XmR6UYrHkAaFo0ydj2mVX6WqRSAf3y9fz493Lds+kNmIuSYG23CFZQB
         hyfg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789516817; x=1790121617; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=m2j/UN3Om6uoh71hgVNZqVY7SOMb3gp+7bzpkgn28wQ=;
        b=oxpdGfRMFo+k6jjRt20bZ+8RCeb1TY1m43tAURUh128lyxMHIfTEwZes0ZXKSbes0R
         eF3aI+lzB4XwRJQ8s+S8pWGLAPVdPd6Yc6e3fAOSEqt9eEyVOK0dtigbABYQGCtDDRU1
         c9Q/jzDMrXyUfsd9oKJw3eDB0uP539AL0PVnVaes+Zq1chfIS2OgXGfa1wIMoqjMzyWI
         chdciJoQ5jeF0HMrLrWQIELyOBRdiVZkCBQN/bC+Rk+8S6+YEMQZGwT+D7q2V53KE4b9
         fsBZHQ+YbebyDRJShlwYXXpIyp0dZ9fNE8lNVtZNw5vE1rNVKLP8q2/Hne8Xy3ETb5hq
         Nhtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789516817; x=1790121617;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m2j/UN3Om6uoh71hgVNZqVY7SOMb3gp+7bzpkgn28wQ=;
        b=20uBeo0K2VDUiV85v4frxv//fkm18009ajltFpuE9RMGt1qf/r3V0I3yyFcPboGzVJ
         SOFecWyaC1Q9ULj8Qzjq8MiHClGnfl7XOaVVYcJUJp6p0jQgOf5/9ISBv1VzpO2IsMMe
         8jQQKzHPshQubuVapmA3eZaMRE43To2BV7/sNj9Sqc24BPGuNa7D96yNpQri26uZ/owf
         cm30d9RwLAXT3EEjrTQR+pwtgcrZ6H7Fw6hn8ZVFGI1Xb0HBQERnze+6QnU86uudURIZ
         q0doTwsD9QK3rEw/L4a/asvtpk/25IaDOnmCK1utLFFOSW6rB63EH7JAih4Fc7E6blRl
         A3JQ==
X-Forwarded-Encrypted: i=1; AKwUvBxPipr6AcEpdDcN6qeDQxxTv2L7UOMluJFSApxy6hGwCyJFjdIkeM0D6o+oej+2VR7cFNrNeqo8BrzRPrk=@vger.kernel.org
X-Gm-Message-State: AFuF++mjU5kVF8ks5OjxAHr1Cx3NbzqfMQuiWetWoGgtY5raAc5ljMpm
	E7o7SJ4yt/Z6IAzkugbKnSQ+ket1Ftbp6QhasmLi05OiirsB18AVTtFxrGy2IJkOWOfOlhwksg0
	jDGY6f4T6z1gwYFZ/Qt9PDdeI3S/xhVegw3DTtDSq
X-Gm-Gg: AYBFou3YDvNf7D5/6yEjBoYyfdG9wUP/OsjzrjyufCx2mOK/paCmkiADZPTYcS4tdHd
	lAvjPZbo6n0OYqGH2OxZ+098DAKvevNmgbezE7lK8EjjfTfGY6uP5ScnyuV0sHCXypETXdiqj2Y
	Dgct9HD8F54pptT9vMEucs4T1qmcTIdnYK0c7QszztC40iFh9FFTwRPE6nUMUDfq+VJoEBhtjWO
	xLRj+Ptd7m5N5ukq7UxK27ppVQ1v5gRYcE1H04axVgL4hvAePCTtoYMXz1tTbJVc272yfPjdgi6
	tcIh3zMj8sLcl43TxQ27Os3UYcoVwqLfBmaBOeaVH2TPoIZniyB+gLtMkR2HQdByeHpAPMRgP34
	50Vferd/WmNFFDEMTlhWsEaEgfLa3uQ6aPRvG+AqkxvmTpQZomm+a3g6B0vT9tNqpGrQyaStbA8
	xjhSC6Dm92FYyIjrDFAxgH
X-Received: by 2002:a05:690c:6602:b0:878:cee5:989b with SMTP id
 00721157ae682-892207639c5mr2133347b3.6.1789516815928; Tue, 15 Sep 2026
 17:00:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260911020438.3502801-1-kris.pan@intel.com> <20260911023804.3503989-1-kris.pan@intel.com>
 <20260915164008.4f65ddc4@kernel.org> <20260915235335.3580993-1-kris.pan@intel.com>
In-Reply-To: <20260915235335.3580993-1-kris.pan@intel.com>
From: Eric Dumazet <edumazet@google.com>
Date: Tue, 15 Sep 2026 17:00:03 -0700
X-Gm-Features: AcwNN1XHLPi6WXJbDgXJBEW9xClFElJ8jnBfY1cNd_Ib0ENvWLhMDV8ounMWFwo
Message-ID: <CANn89i+_mDmngcd2rm_huSOd7y5m-Ek8d_h1vspHZNmTBCeRoQ@mail.gmail.com>
Subject: Re: [PATCH v2] net: iterate online nodes in skb_defer_free_flush()
To: Kris Pan <kris.pan@intel.com>
Cc: Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net, pabeni@redhat.com, 
	horms@kernel.org, atomasov@redhat.com, oliver.sang@intel.com, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2026 at 4:56=E2=80=AFPM Kris Pan <kris.pan@intel.com> wrote=
:
>
> Right, the node-offline race is real.  I'll fix it in a v3 so the flush
> doesn't depend on node_online_map, e.g. a per-CPU mask of pending nodes
> set by the producer and drained by the flush.

Certainly not.

We should not add a per-CPU active-node bitmask updated by
skb_attempt_defer_free(),
as writing to a shared bitmask from remote CPUs would re-introduce the
cross-NUMA
cache line bouncing that commit 5628f3fe3b16 eliminated.

Instead, keep for_each_online_node(node) in the skb_defer_free_flush()
fast path,
and handle cleanup in the cold dev_cpu_dead(unsigned int oldcpu) hotplug pa=
th.
