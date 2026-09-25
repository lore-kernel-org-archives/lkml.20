Received: from mail-lr2-f34.google.com (mail-lr2-f34.google.com [74.125.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E86D4E4321
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 22:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790373607; cv=pass; b=NuUZKnYBEavXgcN/WMBaBa8eO8wy7tHF7ZRWLfutGDM0q1ZvuAf9e5lll4OvTTf0eWc+zxNFjhj/w+DKnJbPY1V9TBko57YzrXmsktY+RlENWGChzhtfVAi+k0rxMopKLyk5r2NVkslt1QRbtn6nPiEhigEo6LKrtFCISoiE5us=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790373607; c=relaxed/simple;
	bh=MxdQLe7hyBl8hjFd/SN5xKlhnp38XIhnYsFcGcSz7cQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q/JsXWcSqKgFDTkpnBi1Zve0ZDxA37sG/bTrRC0JQarV9Xj72REL1Jw9AUFb2mvinMDmUA6jBxeUBh9U0v4p/WVUAwmyEiwqemsosnCgIYZ2o0fNUswEnG4LQHHiaqN37qUt2gYnQNG3DqKNK0HKmXYVjl/jURs2YZaw5h4RKyI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JuSrOq2o; arc=pass smtp.client-ip=74.125.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JuSrOq2o"
Received: by mail-lr2-f34.google.com with SMTP id 38308e7fff4ca-3a6502af787so8914031fa.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 15:00:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790373603; cv=none;
        d=google.com; s=arc-20260327;
        b=pDFjtrgY3z9ABHjRlpkIifWHm8cvpdAcWV0r9mrTquw+C5witb+m6FM8M4RdCWOHyX
         oqqI3lpn94sKGYC33sxDg8VAvjMbqO8Q1bp0e2yw85UZ3KHrmAO26Q19rGOzCz8qk46X
         8k2btUBl/8g5S33cBZhdHmyxOq4oO4Ev8wShKcBe/CYdVPgwi072eUdPItfLdCrQItJN
         6NFoK1fYkygxdn1dnD1l8RvLwdYORZka/RpvPiPBc1R6PGvwBV7vYY+cUfbPVefiu1IC
         KqHlXon3GJO9ZLTJIGh7VX6vHbqgvYF6yzNZCK7OyttITkzIVsjO/bQu0Kbjfqoe0LNs
         PKSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Ovx48gw0JCa9z93E+yMUXGbpBD5xdcukSN06uG3r4cs=;
        fh=pOin6kZ8Phs/LImhafE41HhBdIlcZ+ohccCMCsy+6TY=;
        b=J1A2Hp86y+DvkKHqcpF4ZA9IwSmkpSzQd10cOJRK+0hX8RWqWVekNTAAv5m6vOhils
         mTpWtjqQ3k0XuUCs8odPvrjU9J31PPBH82EWhaKgsI+mdcRheP3ZSDtQK2DOBoGs67pG
         h7pX+EQiaWOl8KK9sCcFGq+NoLhHsGLi0PpK0RLpllLG4ZeNG3zXQbJiMF9nFRnCbnQ4
         f3XanOxZBn1lUNBsRwVwAdGBEAKKo+xj+Ja40DHSAg2R773xUlrrltRHKY+7kUgUvQsh
         iePQ2fQkr9WHgtt7OtSOio9F0MSeJQE43lrFntihjddaWA3S4GRQ+kZSsU8jphri2h8/
         ynQA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790373603; x=1790978403; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ovx48gw0JCa9z93E+yMUXGbpBD5xdcukSN06uG3r4cs=;
        b=JuSrOq2oDdMoL9VsnN1SwpkxEtNJpCeefrXn6BfwF0xa5EsQPeyrKs+jYzJnmJoD+U
         Dv17YBqlP/3BswyBDeC09Ue8VKeL+xrZjfua96AqNqd43vSNVzc/iteJzb7vLuecUx9o
         KZlU8vZ74xBw3SF0hULtoYxAuS65+Yf/RQuURgmH1QmEh2bE6NPav26Z2TUkuSX9zIPM
         GS2zHEigl+o0Lj8/PNOFAT7JdhY5W2yq+gJbNAx1IaMVUx+RzSsJtXw0B1zgCNtWwv+X
         kVjIaRykmYtUjMR800flULPXy4EnyAwRVev9b9UjOYRp290iiNABYuypztEnobiLgE6G
         FBRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790373603; x=1790978403;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Ovx48gw0JCa9z93E+yMUXGbpBD5xdcukSN06uG3r4cs=;
        b=Ksf5EhHCkghWKR9FIZ0oJJWULBKcMnGrF4VSxI1uNTqsHclC8HQKkGoHoNw6q/Q5VY
         DHhA65K8Gn0CGYqvfgR0Dgf8kB/lwH5V4KUvkmHCxMwao4ZPCqygysbs2kHH1roRgCSS
         DBw7Js9CS6uu10UWb2O83EurAf8+srZ0gvEonRt6t5WdaazcUqOtyn3kUMrqZkzFVOWv
         wF+sa8xQEfUMD2UPQntSD0IWsOuVmqTpLY1pVkwNv57JtorN+WQc4E74Bs77PwhG4n8p
         cBvXVbBYXXYma5/HICiktkKtTWBqQ0WHRCYvW7MbZ5DqKUbTZrTQqmqHZHXMWsPwgP35
         dqcQ==
X-Forwarded-Encrypted: i=1; AKwUvBxnpx09OGvzmFrUJRkqJK7cHCuJscn4xooNRAfFVzCg8lfp6ecGqPob8amDk7Zp66XeARDKB7+aHn3A/3k=@vger.kernel.org
X-Gm-Message-State: AFuF++mTGwpMER/pfX2VbZHEPDZ8CPWLUxTPzgYNMstAMQ5oIwo14X1o
	QqjhuB1mEXUVf7gLCC87tmxzgt8z9AsOwbDKqGVtPWt5swC99JdPEJpMBkRUgffaiOGair2mMp8
	AW+qpKaaBprcgqVjPij7WHkq049VjosY=
X-Gm-Gg: AYBFou1Gu25rgdDfEYwzkA4xhYJoVxMwq0yt13HPfewVA0nMTdc9N3MUVmECpPBB6ux
	BR+KuyL3JE9/DRhvTV/l2hLGCR80DWaGrTPaafeKwrHFKS/r7PFegIQHvvaNlPYTr+JDSSuUCeJ
	7V3KPEI/MZWQjfPoLHRP8fjY53VxaDbHpMXv+YK3lx4kxiOzf95pzs3WV7T0ut9mqbJ9hH/stsO
	BS6Zk21JwG9SlIAKCPROjP0eOaaT07EjgHFDcow1ND4Tq8zjh6yGeNcubgAJUtl0TtqN+XcgNy8
	X3QfOydbuBwoHHTMvGoMXEo9/7vq6i245IRrmgKKVYx+vXxD9WQxxF4=
X-Received: by 2002:a2e:a9a5:0:b0:3a5:f911:12bf with SMTP id
 38308e7fff4ca-3a63c0b0486mr17043371fa.4.1790373603049; Fri, 25 Sep 2026
 15:00:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260922190159.509836-1-oss.patchbox@gmail.com> <araXBOapuzox1ljT@p14s>
In-Reply-To: <araXBOapuzox1ljT@p14s>
From: Yuho Choi <oss.patchbox@gmail.com>
Date: Fri, 25 Sep 2026 17:59:51 -0400
X-Gm-Features: AclHuK9yIriexrqyiVeocPPSkgwQzrfkJ626VWzsA0WLJe_KCr5Mt7oEw8zUrxk
Message-ID: <CAGG=RgB0WAPJHGNYTw1W5TGcsykKgJT=yixq2L6hsCGVKhUThA@mail.gmail.com>
Subject: Re: [PATCH v1] remoteproc: virtio: Load rvring->vq once in rproc_vq_interrupt()
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-remoteproc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 25 Sept 2026 at 11:45, Mathieu Poirier
<mathieu.poirier@linaro.org> wrote:

> We could lose the CPU right here and meanwhile, __rproc_virtio_del_vqs() deletes
> @vq.  I don't see how READ_ONCE/WRITE_ONCE would change that.

You're right, the single load only closes the NULL window, not the
use-after-free.
I'll send a v2 that protects rvring->vq with SRCU, so that
__rproc_virtio_del_vqs()
waits for rproc_vq_interrupt() to finish before freeing the virtqueues.
