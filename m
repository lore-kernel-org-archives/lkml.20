Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DA423E4107
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 02:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789094376; cv=pass; b=sAgBHMoWYWzIEIDzBKpKGVPXFJR5qqJjzQ8+Va6+EtePAhmRuKp+RX4H/VEU2EzNsZpWGzQ+/tO/3Br7mp+sef5n1SEeuEOscj33YWFQew2EPm6mf2rsB1Xs+ELNvTj2vUlchgKIdtK3501S6S9l9CkO/JDAtzI2D/3VJnJ4PsI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789094376; c=relaxed/simple;
	bh=OfSgPMHyPcfe9C+HEDHdSPecHBgxUdzMeajgKpSpE5w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PK3L3IMpqpSTSxCSbDaw6Gu40U+pGi/EwUEXhSYrPxJlUd1UzqHsnsjnH2GWnK3kb5bvExS/XtNagOE1HsDgEJ1u5iqrXxzvNBT5dfbCwYndP/HQI4MM0CR9LpV0LJpqZCuPSSIAjEi4PVY7jNDRKOW3vIZk83aji0fzeLSq8YY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SieBQV1C; arc=pass smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SieBQV1C"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-52fb769ca2eso5959271cf.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 19:39:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789094374; cv=none;
        d=google.com; s=arc-20260327;
        b=mrKPxRMq755s0tU2gM83w6LcCtNuQ+ELLghWSXCLVKbimoJRcRj2oncQo0tWLTIpYN
         whSPnu32ME9ijtXZtO2JEGSCE/PPDTK42pe2Rf0naPM3vFbMhmIdrGQk6qqWQg0RBUc8
         MgNYbrkGaQ3FL8m0yH4VtKY9iyMRNHvbsyvAXGRu9ymph00BGN8qHgoXrenWqmiJ38eS
         RKbU2pxqfa49vOGUcA+PDNQdW87jDv8/opxr+tgLkw1kJkMKoMvp9+6JHkfjxp9sh8+4
         hfI0/iwG6eWrsfEnTNeZCNHmAAcEyvUr4BSWROyZOolDkgdquvqYw0LEAvMwMlUGmlKl
         K4lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RUDfrm8jdk65W+DYIk8XE8Q/Uaw6XoTn7o68Z+TcLK0=;
        fh=5f9QyKh1e4zN+Yuo8MYvQ31MmiIzysrI7I+H4HkTazU=;
        b=sVSclIh3Fwt8gM/aE8u6K3FZcJQCVpbIwUffkilQPPKeffppxG/wsDBEmne6xv03C/
         D5GPvY+PBEh2RGwkL2kwCWPZn1L3fUFRee/gMyc31xknrKaO7xZM3ADPn15XfsrIwXqR
         z91fyGnaTtJSK3cccT1EcADDp97eKVRK2NpsGgySDvOVtjiYlRSyUM22/Wb+RmwX/p17
         XZSXkU7lxmdOJGxa6DdGRlqpzIqlodq6q70VVjBSwSDIXyd6Zq6en41mmf3GyYd3N7Uy
         3qekbFvk31IoxnGgpNS+TwtB2L6cLD3wN6LQwEfed/C9JihkJAABkEobB2WRUqk1hseA
         Xoyg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789094374; x=1789699174; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RUDfrm8jdk65W+DYIk8XE8Q/Uaw6XoTn7o68Z+TcLK0=;
        b=SieBQV1C6Ft1AoOBrBgv9wOH6+V6XrGhtP1WFxwNRFoJdaliFL7g+DPpe52tPK2SFv
         kTIpp/PEBYSzGCwrDIKcTfo7423FlDKvp/RlxNMXEAf0iNfkXgZfHgjfvRh7HK+v0NYk
         5/hatZf+4M6aVPE9WAj5QFvnbXFN3kcsz49q9jKzu3zwer1aoPSKgf/owSS3gz96/Tem
         niqBco3CJHRgQ/NOXt4iOfkBiAGFXN4Akl4BzFQFdkrrMDiRpcJ3D5e0dUGqyXMuAxd5
         JLPHvQg6zOzwFuCIbMyr2ciqdRlY707mYGAARVwqY/pHzW3JV64e5o4EBb+GOSNPhj9z
         hzFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789094374; x=1789699174;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RUDfrm8jdk65W+DYIk8XE8Q/Uaw6XoTn7o68Z+TcLK0=;
        b=QJM1RXA+Kp6b5NR2LxFcqHS+EyM4lEHOK5tzUHiCMTA91bPRLeL20WbN+r9UCnUAxA
         bgPghlg5XRD35eKg2MlsUgtys3TSpPTJrZcEGJbuXEipGSzCzN1TbJT++FNoYBjFxadC
         cNsjrkO9iY52VjGP7kuNZ8eyh7NeNjwuP1NFTX6ArLjMzwSJga47zP2p53TxoiSvgHef
         1Mo6AV/48HPkPaxnutwARsrH2QSOGROyxJayXdjD/t4JeW3zPptnmBh6QpLCibgP4j47
         0n80L5Kudyde00VPR0ismIlJEq3pdfJgIdL7xEAeM3hu1+wdL0KNQKyht5gYZywWt24S
         Mrrw==
X-Forwarded-Encrypted: i=1; AKwUvByqzZKEtAiEqcQArJpWHFRe/h9MBvknKJgaOD0O02g+Bk3+c+fK8epXLhAFiq8Qjhmyp2t7EOWxZ5+unFo=@vger.kernel.org
X-Gm-Message-State: AFuF++lAVHK02H7APKPVttfLIR1q3u0twuKtHsRkrepaB+ZEPZlwB8Gx
	t9qAtGqiqFZ+23YexvDo8iPv5VkMACQRVdnkgN6rLDY8CujR6iiA4af18WYYHZIdOTEZRTFXr65
	0K+BvW4HB/8uFszqIUNRRLyE/20fFUXdfNaqINS+Q
X-Gm-Gg: AYBFou0fZUmpepeaUONPq8tgN5Fu8F3MXNkxrrxIOP0Q1Rtswo/FuGIIbsrZDkMsmc0
	nXcELEsaha1HNWkmsXJ3CmxMy6K2mNo/K9fBpeooqwx7CIRwcn/O12FKynQ4n3y1FmbH/3RK+XK
	ClZFBQzn+krNSb5MF4gZ2Dk40q4DJr9Hvjapm/k2othsCGXD4B+6Pt3K1JC4HRhK6I+yMBbrZRi
	eESC/C/U7X+Zh6hQQO8javjcQ6Q8tRu4uSrqezzDUosjFOSFwBe9RdV9RaMM0KMzpPEltmBosOr
	/Z6f948OZzglar+x31aKBwYV4arGGl1Pjp/+LGu8uudxU4bhgUgD5NfMdifEy9Vm4XkSYaX2XYO
	hWLJQAZ4pYOKjMUOcwaEr8337qZKDpU8PDnAsMwZ8AbWvu7yC8XPzx072dP3tnQ52Wm2AlpoKAu
	BNRIo5JK6sGbAQXIg9erMqezwiIZM6isc=
X-Received: by 2002:ac8:6104:0:b0:52d:8743:bc83 with SMTP id
 d75a77b69052e-530c86d5bcbmr52047871cf.34.1789094368979; Thu, 10 Sep 2026
 19:39:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260911020438.3502801-1-kris.pan@intel.com>
In-Reply-To: <20260911020438.3502801-1-kris.pan@intel.com>
From: Eric Dumazet <edumazet@google.com>
Date: Thu, 10 Sep 2026 19:39:16 -0700
X-Gm-Features: AcwNN1UmG-09lqNpFifG9eMrL0aAKirFhylmMFlnO8B_rmhq4zvEOVMQ2vDehcc
Message-ID: <CANn89iLpbdkmA0QKLXcV5LdzCsDjgJEUXb5-2eqWJTveNG-uJg@mail.gmail.com>
Subject: Re: [PATCH] net: iterate online nodes in skb_defer_free_flush()
To: Kris Pan <kris.pan@intel.com>
Cc: davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	atomasov@redhat.com, oliver.sang@intel.com, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2026 at 7:07=E2=80=AFPM Kris Pan <kris.pan@intel.com> wrote=
:
>
> skb_attempt_defer_free() only queues skbs on the current CPU's node
> (numa_node_id() of a running CPU), which is always online, so the
> flush loop never needs to visit nodes that are merely possible.
>
> for_each_node() walks node_possible_map.  On machines where the
> possible map is much larger than the online map -- e.g. a POWER10
> LPAR with 32 possible but 1 online node -- the flush loop touches 31
> cold, always-empty per-node lists on every softirq pass, showing up
> as skb_defer_free_flush() and _find_next_bit() overhead.
>
> Use for_each_online_node() to iterate only node_online_map.
>
> Loopback UDP throughput in a QEMU guest with 32 possible / 1 online
> nodes (bench_udp, 8 senders, 6 interleaved runs) improves by ~5%.
>
> Fixes: 5628f3fe3b16 ("net: add NUMA awareness to skb_attempt_defer_free()=
")
> Reported-by: kernel test robot <oliver.sang@intel.com>
> Closes: https://lore.kernel.org/oe-lkp/202512112119.5b9829a-lkp@intel.com
> Signed-off-by: Kris Pan <kris.pan@intel.com>
> ---
>  net/core/dev.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/net/core/dev.c b/net/core/dev.c
> index 290e0f099e6bf..b528b6a986fcf 100644
> --- a/net/core/dev.c
> +++ b/net/core/dev.c
> @@ -6907,7 +6907,7 @@ static void skb_defer_free_flush(void)
>         struct skb_defer_node *sdn;
>         int node;
>
> -       for_each_node(node) {
> +       for_each_online_node(node) {

SGTM, but you probably could have added

Suggested-by: Adrian Tomasov <atomasov@redhat.com>

(Assuming you read
https://lore.kernel.org/oe-lkp/20260910143041.18106-1-atomasov@redhat.com/)

Reviewed-by: Eric Dumazet <edumazet@google.com>

Thanks.
