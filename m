Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794672832;
	b=xYtV+G1jl0Es44Lo0G18Jrc3+UYQsDIqy1DXSfiL6os1ub4dS5IEs5HV+OZLHjiD357F
	 PaMMoKOJGnzi8ZoJVW+QwF2v/i5ote0ugpnmNtsbIQ1xb2bAY6dk9zSmFxp/KIclwgv4o
	 qcewhu0izJbIvwo+KRWvji0eMjwVhiaGSWtabMDKHCszLTx/gRmOuI2h3KvCiEaGnsxDJ
	 LZ+feAIhbl1nLO4+mpK2HkHtmiO5lsFEfLwWyxfZuUVmDqbS+8k22ozl14wdQYWabSRc2
	 dLEFm9RKvSWQaVMDnKnVHX0hDRdaLSK2W5UM2Z9py0HwG/rFl/nebNMu6o7XD7u6WCA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794672832;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=8Tl9o8/ajPwx7BAy1yOh5VYBJUvFApl5E8YYkNIIX5Q=;
	b=LwBzzf8OLSa/NLbE/uGJgv4fBjXRVpbzatTiwSjD3tgYmpKnO4oQz9i1GH+SMR40fgcF
	 huwCVg+eAjapJ/YZiKYCvAgcPOu+04lTV9p/6YoQhrLlPVMjPVX6Xg3epGUSh5YJiofSO
	 YvvdaY3R6VVhZmg3eNgLLBh3AosT3KqgcaO+rgZW/eVQSiLt16crT3UcmNrIcCOLWWfXw
	 8vkosWR98Zfj86dbSm4eosEL+mgSXHoMAAxV7nl7qhfi81V+sri1W2CYL8YR63p1uEqXH
	 ei3yaQqFKvvhvkaqx6d3dfxIoRqWLmsjGZVio5Iqzc7x/7+J1miuRC0JK2GVkaJvNgA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=fWYykvaf;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.181
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23387606A329
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 16:13:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23387606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=fWYykvaf
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-55c7445cf85so114761cf.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 08:13:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794672831; cv=none;
        d=google.com; s=arc-20260327;
        b=TIvZaKglnWpUXnSttPkFjGJvHOrAToOPouqjyRzlA4DqAoB6uDJTfSzZthX7eGwHDN
         DtUsaQlYhmNx+u8+xxOwQGaS6WwA+w+5n5dkdocActVw/ajDQL854t3/YuO/tH3ZNwLB
         4tZx0TiDOQ+IId3++5avyyLHkcrI3P35ITVrcBSsvqhxvbzLLsp/aS0lS/xcGTggLlMC
         JkaGboWx6ZODUQ4xEG5xBXzQkL9IQ+xKvbUK0KYk9zjh4Z4Utymc9vKT43gkk3ARJrM1
         M/n0ISjezXqnh6UhJuiUtq/YDQ3bHDfu55SpJYwvJa6Uhvf3ZMQINnUbJ3vPKJiliR5C
         fJTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8Tl9o8/ajPwx7BAy1yOh5VYBJUvFApl5E8YYkNIIX5Q=;
        fh=QGrkye3uGmDCLe/3zE1kPt9tC0sXB7L2u6b+UZrvGYQ=;
        b=cO7UqHS9r8bPmPEWoDb0O0qTlkpPv4+at+8wtxOws1LZog59NjtNRD/SiBW53ehU1J
         +mRiC+NuO5THpj4MTM2v2IxVnCvCVSIKf8dCv7Dvy27//Y2qjw/P8+bE7mtZbKjkKjGP
         LLG/X7MNyoxBAmRHhJdala0GF3sGzxY9zunzdC08jxq3ff8SQu5mcNNB03AQ8oR0e2Zj
         gYEgB2aN0O+t3tVdP9MVWImOZy4a+R/PHXO9dB28q2cl/XWZ1JpTbyjvluQCn6A48ywj
         ZLTSMA3NN8luduNqvjKTu0CksFu052b1wN8uuMly8VWuci4ayRdCHRI7rwqqzPPDJlxz
         MFkA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794672831; x=1795277631; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8Tl9o8/ajPwx7BAy1yOh5VYBJUvFApl5E8YYkNIIX5Q=;
        b=fWYykvafZEoWUCoWkp7dZs1CDSFqWz95hiQCzldSRaPDAmnUc0YgkC/SZtmGv2c30P
         1nDiyPcFjnWek1jFrBaj9qVb8aLW1fzi4iNqW+MTldpKCfvjsv+HGc6ddi9lHpOkz5F/
         UFE1AbyPMHE3tiY8F7wdlXNnOrAzbUcMOYkiGKDtR/qKYz2+fXhSkFdsXCjLntFYfx9Z
         d2EDrsDG7UGMeJvyXA2LEh7hLf0POdeXeWGPUXff3tXibHM1m2KAJo0r8vd10EP5sdb0
         GXc7WopONhL1DFJ9Vm7Pfb6y8jfg93Nmnr4C7x/Cqy0nKyguWvbp7eBJzqROWn1htufV
         pgXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794672831; x=1795277631;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8Tl9o8/ajPwx7BAy1yOh5VYBJUvFApl5E8YYkNIIX5Q=;
        b=UjR3rIq6M8b3m6ukG9fa/kzxupXORi5i/Wn8gQgxGcUcVL0IuuxndtK6wFZWWLCkop
         T0nYDPGWlmOZzmOkJ6HzZbPmHwaRpytdVu5rzTogCdFi4CM7vjIU/eHT20a3ADsay1KZ
         rwxj4JSm7jeDUTNteW+NWZrQhoT0+3VSiVWnIJUY4VgxPxWy1Uqe8TSJoIgN3xBHjBAn
         2D3MdhfFRqCzaWc4MoZjwijoH+hJNqzNCIj5sB0WlKohfBcLfdXKHuE1Cc00+mOvmT87
         wv0SfWX+gZLjftKBVjTLvLe7eOPxCZKi6nQVNjtixCqQjr/AhoKNrnHQd5vmqRe5YITK
         V14Q==
X-Forwarded-Encrypted: i=1; AL+hErE6p/PDLl9k7rHbsQEedLPJ9BexYl4NJYqd+S4F0KXysS3ZozbtrFGLmxEkS3mWCPuk/BwxPppqLDP3T2o=@vger.kernel.org
X-Gm-Message-State: APuU4Z9S5nQ0J8HPqNpInSNzb0AT4rws+hoR2ygfoMb5E0On+ZYw814b
	LmycnT5Iq7cMM25v1Vr4PbqCZlmCnQ5f8ayY4dRhRtTwRxXShInH6Rd/HJXAx9DlcvmgMVNydd4
	ETK2iTDNpei45qQoIQXCxSIWushssFsprNu/Rf/n/
X-Gm-Gg: AYBFou2SvuSVat9qmu2FE+ZOIsZQF6vLiKVT08ads6InCQudTF7boA3J16DbwWt2XVw
	WzF49XrqgZA5OXt03Rg7K+6rDgR344UpL/Zlt7lZlLHaOsN5/LNrz1K6QJKobar8IM3xj9ytghE
	qDW9UPEGcC3ySue3YpcwT5lcK/aaaRclCGNCCxqEjXze7rA9bfjWN0JsJqq2/KFLHq4NGTEKls0
	k9jkncfn5n8ebMT7s9jLbpdu4scdrxCr+rUrL55eah1uIptsj22pCIGWwCWi77dVY4Ow8j+zVHM
	xifCzcyY/OpwBG7JrtsooRy9HVarXBovEsLBwH7tNEp5YHUcw6cIXBrx77I6pqdC/pKlJAjr1B7
	l8HTVfZHJaqa+NwyREoIIdUJs/Rqtc2S+/MoDQNxxovhTcGht2yIEuzdB5HWr1EJZnYWP1HiFvO
	rkATgB7cJ2NuZOCeKftGIbYL4oPD8=
X-Received: by 2002:a05:622a:1f13:b0:536:353e:8d2a with SMTP id
 d75a77b69052e-55c420acbb5mr16418791cf.1.1794672830375; Sat, 14 Nov 2026
 08:13:50 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111-mtu-probing-series-v4-0-6f2e484ca8ea@gmail.com> <20261111-mtu-probing-series-v4-3-6f2e484ca8ea@gmail.com>
In-Reply-To: <20261111-mtu-probing-series-v4-3-6f2e484ca8ea@gmail.com>
From: Neal Cardwell <ncardwell@google.com>
Date: Sat, 14 Nov 2026 11:13:32 -0500
X-Gm-Features: AclHuK-5_dHag13CLSttPyHmBa-mJPoWFf4s1lkgb_n0rEIb8AR91foWfJLHYLk
Message-ID: <CADVnQymoQEy_Qg8NciVFBO857-ks7vsBXYeaBGuLQepBkMD=OA@mail.gmail.com>
Subject: Re: [PATCH net-next v4 3/4] selftests/net: packetdrill: add TCP black
 hole detection tests
To: echoowall@gmail.com
Cc: pabeni@redhat.com, kuba@kernel.org, shuah@kernel.org, edumazet@kernel.org, 
	horms@kernel.org, kuniyu@google.com, davem@davemloft.net, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	netdev@vger.kernel.org, panweiping3@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 11:46=E2=80=AFAM Yongjian Wang via B4 Relay
<devnull+echoowall.gmail.com@kernel.org> wrote:
>
> From: Yongjian Wang <echoowall@gmail.com>
>
> Black hole detection (net.ipv4.tcp_mtu_probing=3D1) has no selftest
> coverage.
>
> Add a test that only sets tcp_mtu_probing=3D1 on top of the default
> settings. A full-sized segment keeps timing out without any ICMP
> feedback. Check that the MSS drops to tcp_base_mss once tcp_retries1
> is exceeded, and that the smaller MSS is also used for new data after
> the retransmission is acknowledged.
>
> Add a shorter variant with tcp_retries1=3D1 and TLP disabled, so that
> every retransmission comes from the RTO timer, which is what
> tcp_write_timeout() counts.
>
> Signed-off-by: Yongjian Wang <echoowall@gmail.com>
> ---

Reviewed-by: Neal Cardwell <ncardwell@google.com>

Thanks!
neal
