Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794637097;
	b=3ccx9EuGXykiiPp3QL/N+LgCDRDP5Y1MRvLtp86Tv4IN7zDVvbNK0s2sf652UjYwkvdV
	 QLGVwUO+LUx8Y4Xd2anYzxdIkBRAenSSyiKwv67fkiZnmpSjRDJvoxkQ1YMh2Eq+pNff3
	 7MpV0qPxtZluuyNYmU/H+EzRqtPf9S9QceCp8Na5w6Zl2rOSn4sNCZYl7lQD/ZYpcOR3r
	 snHAbqO2rJk/2ZF6K4AzasJrtmLqAwT1sIMLlQg22m89eEa2JeChIdVoFPGOjpL80y8zs
	 7TFbdaeeGxaXfTm88yV5M413MtvNwYnmTc2uifgWX0nbwXPCp5oqVdf8AlziPNV1IOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794637097;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=Kbowv03anJ9qQzCXwkdQnDnwVItu8Czzblu9Au/FdN8=;
	b=jEWk27D7NQYqoscSn40lDJepWDKi3mDHC/MzXYBXt/rSSqP3ydXn6KIGMTZfylgGMpLc
	 2oXqI3+UaDeizQOyNS/egqxhBcg5HEMJzUUa6/4S/eLhfBY0Mu6U3lxBn7fMje80+6/Fr
	 5tVInl+uYT2IuhUbVVrJpCATuXY8S8jxWBM66TPGG8to9vmOqoZSLYv8OYpIBK+2LMuHg
	 1TxcZcCXGF2Qp/KYieD1EGsLZYdYSHjWOzxCmQty0F99IrGDa98tzlvPp+MY0iQzBONOQ
	 zt4ENYbTxKERMfgyEiuglDmVvO9+IiwBeqk6Avaa3tdh1prJ5TYc1fZGUfm8s7ouFhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=FVz6fr1k;
	arc=none smtp.remote-ip=209.85.214.200
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42B18606A32E
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 06:18:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42B18606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=FVz6fr1k
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ed47dc8f3dso27737715ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 22:18:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794637096; x=1795241896; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kbowv03anJ9qQzCXwkdQnDnwVItu8Czzblu9Au/FdN8=;
        b=FVz6fr1kxfdVb35gJO5L96Wa3vtaVQ9zIvc2uJMBrnaVvF1Lf0t1L9iCiP+RtzYgBD
         jtrB++6aFlAwb0EN0XaqRh54dmi9e/M9Bn0BEuCBHpl6KUexIVdS4tiMous4XwdXXMc5
         yiYrzoeGGBNq7Xb2CvQpGJbgeeNJwh0AdwVYzDAs3xuhb6ID1VNpv/2As7OUaMD1a3RF
         zkWB9ET6lTFx2oX+7eFT0PPShXB7VXxu84e98alSc5rTPwFdemgFZoGrSAikJDbc6qKS
         LMoh7dy/fiSzqdUa9EI0dNzMwmLSRn6UYOiLpXi0lvTjBdyEqXqOQbz0U76aNsL6qacU
         SNDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794637096; x=1795241896;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kbowv03anJ9qQzCXwkdQnDnwVItu8Czzblu9Au/FdN8=;
        b=GizlmagNM6LL3+UaBgtC9+YI00TB17KxtswRVIbpbHySHmvq7TKXCU0lfne7HpAOQe
         VdpX+XnncgJIcNSYF+EfWREG59L54aqbM2xb/gpKABmR0Uj1Y+hmwWH5fKtjh2EscXEY
         SfnvVZiVVHbine/q688tuFWQbGMGEUXWUXlkzivTQPZTNjpUeox5oor0Zq15sTZERJyN
         us0QWvKWkqkGU+RnxJWrpLO+ompgv1E5Yg8Wq19d0kGWgyEgjIKhHCQ7QLnZaR/AyXc6
         xLvvES3ooiddYKONuyxzubMoLCnC+FyfCYDuQg3sRsa840W2FofExcmnXEUv72gf1T22
         Zs2w==
X-Forwarded-Encrypted: i=1; AL+hErHpd1qx8dKbF4SBaNQYlET48LpplOf/Qdwfvom8CY2w6TJFJcy2gnFUO4NdQWTL9FfnSfw5xLAVYvJuR+Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z/trcFa0PfjY6CIV96YOHAukGjV4bL6Yhx/4cYmOCZ3soCccYLd
	wjbkdnHHg1bSRUvYGYcjBx+LxaBowHhuIvqzM6fguB8azzj8PbIWadRQRLafLTW8krWZwXxjr9l
	SPcfxfw==
X-Received: from plww2.prod.google.com ([2002:a17:902:d102:b0:2e9:b079:3771])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:230b:b0:2ea:e084:332a
 with SMTP id d9443c01a7336-2ee0dee824cmr51445225ad.56.1794637096336; Fri, 13
 Nov 2026 22:18:16 -0800 (PST)
Date: Sat, 14 Nov 2026 06:18:15 +0000
In-Reply-To: <20261111-mtu-probing-series-v4-3-6f2e484ca8ea@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261111-mtu-probing-series-v4-0-6f2e484ca8ea@gmail.com> <20261111-mtu-probing-series-v4-3-6f2e484ca8ea@gmail.com>
Message-ID: <avf9HomOtgXYiRLX@google.com>
Subject: Re: [PATCH net-next v4 3/4] selftests/net: packetdrill: add TCP black
 hole detection tests
From: Kuniyuki Iwashima <kuniyu@google.com>
To: Yongjian Wang <echoowall@gmail.com>
Cc: pabeni@redhat.com, kuba@kernel.org, shuah@kernel.org, edumazet@kernel.org, 
	horms@kernel.org, ncardwell@google.com, davem@davemloft.net, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	netdev@vger.kernel.org, panweiping3@gmail.com
Content-Type: text/plain; charset="us-ascii"

On Wed, 11 Nov 2026 00:45:57 +0800, Yongjian Wang wrote:
> Black hole detection (net.ipv4.tcp_mtu_probing=1) has no selftest
> coverage.
> 
> Add a test that only sets tcp_mtu_probing=1 on top of the default
> settings. A full-sized segment keeps timing out without any ICMP
> feedback. Check that the MSS drops to tcp_base_mss once tcp_retries1
> is exceeded, and that the smaller MSS is also used for new data after
> the retransmission is acknowledged.
> 
> Add a shorter variant with tcp_retries1=1 and TLP disabled, so that
> every retransmission comes from the RTO timer, which is what
> tcp_write_timeout() counts.
> 
> Signed-off-by: Yongjian Wang <echoowall@gmail.com>

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>

