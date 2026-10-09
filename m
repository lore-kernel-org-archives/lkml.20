Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86EC744F57B
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 06:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791527835; cv=pass; b=WS1p36uP/gT2rVOA9F4rxAma/mWN9C3B3CfCxfCBY6OMwdVOEFMf8sg22WtaGmLAv4nvRLyJ3mu41cikkACEPumIoyPYqmGOSiGcRwHN5LYj5KzBTppF5ws5eBDJVCSOwFHvj7mKLYSjrb8RDv+G9iLziz/H31lSh3IYINjwYZU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791527835; c=relaxed/simple;
	bh=SHgbUYashHuCIQzs6sU4+O7MxQHiWiAlj/FB0dKv+Ec=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ubnrbvexlkT02qcKgWXFwzD47P1fi6o9MPFw50s4JRcdYn6PPAljXWd2icWLpPwseHgNra9mbQTUmWhZ8YH/DS2KufB/OW0SImQ3ia4z7M7QwaLHwjxIW9iEenTvdbsS1WzN4pRZQCPrvXgvE2SbiIGcCExGhQJmNgPNhJahlWo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ELlbvpwo; arc=pass smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ELlbvpwo"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-487049569b6so2574956f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 23:37:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791527830; cv=none;
        d=google.com; s=arc-20260327;
        b=TIa+CDTom+BYUeUj28twZfdMS+33fJ5RjwrI5MFJp3F4D0jK3hvK8m1jYuoKJXrrDt
         XY8sVR+YmB8DcoZR3vJCQ/mIMxyMZW+ENxOuR2jiOCJhH+cLeuAcq9jGjxQDwj3YwW/G
         KSYcx15MoxF46U70UfSEnGy6yld8BY/N9inL7mEOQ+9jX9vlaaEmHchhszU4Rvtps2aP
         CMkxlF2I/icMfsqQ6kBq7hV+bMuyMKovJP+4uppRtGXuQmtdiiaKGOA3cNseO2h+gser
         Bdxb6V+NOdOad3u1JhzFTct6TjwtOqSuKYfORRhP2PUcY8pmA2vq8vai4VtfSG0O1Ux8
         euNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EvP1SWOpOajfYwpFnq5wtxRsl5w4aXBljAw9HkukLSA=;
        fh=pIaGXsYaLCQrANaNMi73yjCuU1CZNWhekZRW45G8wNc=;
        b=GvU/9HEzIWnFPr6kXq8X2YA9l6amCxay8m5VDxOblLK31hqCK81NuOiQItoTpUzkms
         Tcn3GM7eyE7awho5qQgowDcU3eN4KoR0tleBK1vKP9CEuWx40Su7SrZ87u3tJenuseuy
         GCuaRm51QeEgT9Vhr1B0rWlPfEXWsesp84rkDt9doh48aWCkxius08ChVmUdnh21F3j/
         gGU/kMLONSA2MhN721abgW8tCwQtPDDnDHKDTdAkLLEPAcFsdBtjL3XVMNNrdCDn+wKy
         9Ap13zpoVqo6uROveX40k6jrI95LiqHTvZBQyko8E5JIGK/aka3DDosTWmCFKFZgSmo0
         Pmdw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791527830; x=1792132630; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EvP1SWOpOajfYwpFnq5wtxRsl5w4aXBljAw9HkukLSA=;
        b=ELlbvpwoIiGPCzHZXZVC1VT3nhYGqddlabLpni0/S9OpcckzFDbQvUjAJph383ZYk2
         wGwHQbrGE66vQP/10Wg7LZgiBiOrErlcklFNIlzXpwvGUC2RIkja9VMxtD0sb2wWXeq3
         Qa0YbPgdvCyR6sw3+Fxqkgva+Uc3ObxstMteUwF3n51HIlMxpXQJnPgzeszl5qEZ02FA
         +UaqEAno2NL4X93vd51XVwLTxLGQcvL0EFNzK9XW7rKxG21bAov4KTDaIvebASNJRjdg
         PvRMtt4M5vjGFraT0W93PsaSr8F73i44M0eSiYWKXzjCaVpRd3qCf8+8s8RENUf6Avtq
         Sdrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791527830; x=1792132630;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EvP1SWOpOajfYwpFnq5wtxRsl5w4aXBljAw9HkukLSA=;
        b=A/U+Vhf+Yd2vtEHBP5wrSpDf4wbLTQEzR+A+rSK+Vv8W++ofFCJX5cDUUb8Rt0gDoO
         7p7dKcWzwPcPdqzaA8zgNhQDnuY2mC1z0t95E3QR/xHilBTSiwHMn81FjyoxRn6OVnD5
         JC1d1eCGt55vi7jtDp6Aa7+7O1xDxDY2IHaRMk9p0kOJAaKwyUrSvZVD84Y22wCQx5NN
         1aLiFrS4xM/qDPNonFlZ8sGD48Ddealo46mXRAptTKbfda/fzO0DgH+dmRzXgJTWgN3C
         3oG9Xn4PUXxqBg6YONPDPKI1JYhBzwSCMM1vMcJjaeeprfQm2kTk8SHxxpyIBv1gD71k
         d/Ig==
X-Forwarded-Encrypted: i=1; AKwUvByEo+nDbxbJP1eQ2FTj19noY+KWszNWE97Ou9DDDdN1ItDBYzHHUo5Dx7dWL3xvZNGlGIC17Ux9hW7OI4Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYL1CaRGSDOB69py69oTjJtR5lhT7Qk3Pd3DFek3F5S0lcopXSGC
	xSsxFJ4GkilXrkXUDT0fXAhvPpPzn5q/yKeh6gw04plMy/WzIeqMP+LAqzSPupYU/PTJYi52V3I
	cizAgeCbotohmNlFKcMA+beZnXhSNfhw=
X-Gm-Gg: AYBFou2Ryoquy79sdVwCHJ2LqtK2ZyYr/SfaPU05C1+t6Kwh8sj24nGozkTQMhyMuuB
	USEdXMLIrQHXxZXnF/ESVbJxnf2u3f3bt0X8UMA/d7deuoz+C1XNMCLSBjS0QT188bcFImPebK1
	JuCD7y6JaIWnT70jtAgiLRAqgC6i3SdmFvJrv+QK3SFan7erjLb6k8tX7Nllh7NjPrGRn6UmojS
	SwKjwC/xm9ESYTuahUn7JLNfLKsak8NO5LvCed20FrctHwnARwp7dGTfN0NBH1cxEBZLHsYcLOq
	WPP6ehLF82R/oXQdBHMdESRfD4d7IRZ7brgrPBy9npo71YTecWjnSsd2HAPeqZvOz9lTfcyFKqe
	KJmy5PUoL2oor
X-Received: by 2002:a05:6000:4681:b0:48c:7386:af18 with SMTP id
 ffacd0b85a97d-48dba784c65mr1075334f8f.8.1791527829623; Thu, 08 Oct 2026
 23:37:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261007153507.50715-1-alex@ghiti.fr> <20261007153507.50715-3-alex@ghiti.fr>
In-Reply-To: <20261007153507.50715-3-alex@ghiti.fr>
From: Nhat Pham <nphamcs@gmail.com>
Date: Fri, 9 Oct 2026 08:36:58 +0200
X-Gm-Features: AclHuK9vvbQEcKxc8F9ncIiH-4LY2ASnROXyq_1dok4ogbPPfoegotvRhFcR0BI
Message-ID: <CAKEwX=PZZi0r4AgSWXW=4S1SDmLQ+pSAKHUuCB=rXRSsZxJqKw@mail.gmail.com>
Subject: Re: [PATCH 2/2] mm/zswap: plug the writeback IO of an LRU walk
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Yosry Ahmed <yosry@kernel.org>, Chengming Zhou <chengming.zhou@linux.dev>, 
	Christoph Hellwig <hch@lst.de>, Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 7, 2026 at 5:37=E2=80=AFPM Alexandre Ghiti <alex@ghiti.fr> wrot=
e:
>
> zswap writeback only appends an entry to the pending bio when its slot
> directly follows the previous one, and submits the pending bio
> otherwise.
>
> Plug the LRU walk so that the block layer can merge what the batch
> cannot.
>
> Kernel build (defconfig, -j4) in a 600M memory.max cgroup with the zswap
> shrinker enabled, swapping to an NVMe partition with iocost enabled. It
> runs alone, and next to a sibling fio random writer with 10 times its
> io.weight so that iocost throttles it. Mean +- stddev, counters from the
> build's cgroup:
>
> Alone:
>
>                                 unplugged       plugged
>   build time (s)                1061 +- 2     1057 +- 2   -0.4%
>   write requests (k)            622 +- 34     579 +- 21   -6.8%
>   pages per write request    1.30 +- 0.02  1.36 +- 0.05   +4.9%
>   iocost debt (s)             14.0 +- 2.5   11.0 +- 1.7   -21.6%
>   iocost wait (s)              7.7 +- 1.8    7.1 +- 1.1   -7.9%
>   IO full pressure (s)        18.3 +- 1.4   17.5 +- 1.3   -4.5%
>
> Next to the writer:
>
>                                 unplugged       plugged
>   build time (s)               2188 +- 45    2104 +- 75   -3.8%
>   write requests (k)            594 +- 21     567 +- 24   -4.6%
>   pages per write request    1.30 +- 0.01  1.35 +- 0.02   +3.6%
>   iocost debt (s)               648 +- 22     645 +- 29   -0.5%
>   iocost wait (s)               624 +- 23     633 +- 29   +1.5%
>   IO full pressure (s)          615 +- 31     550 +- 44   -10.6%
>
> Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>

Acked-by: Nhat Pham <nphamcs@gmail.com>
