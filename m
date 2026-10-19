Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.143
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792436483;
	b=PnKapdg2HqMmd6LobF09BgztVHOmaAvmI2u7P4e7G+Z6PkuVjiKc4rFcuDtHtFldKB/0
	 myZ233S2euKGlSR64YsAT2W8ID3KlnwWVpsAeWzk4BZ2BBFMBPZEjy6Mc8H70bCN1AwDB
	 lkFHfB3MeRmCdKiwqDVHpqRYDEcf+rOsVJdU47Yzo9n6FplGsd/73b6yV+899Wgy3E4CL
	 8u0W4Tnhy118eL+CPIRbS7hQKtgFbXqtIiD+O1AktOONBj2BFtPZrQrInKXPGAVOdaMtc
	 wFv8Zp80J0DUtW+QwgvZ8s7SyNIw5Lp3eUDuFrG0OZ91j0w0lGucq8YwMg5BR5P57Yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792436483;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:MIME-Version:Date:Content-Type:
	 Content-Transfer-Encoding:From:Message-ID:TLS-Required:Subject:To:Cc:
	 In-Reply-To:References;
	bh=09iLhdKoA+WjgjSiEhQrFgF/+LcrRb1ryygNNtnygEA=;
	b=0dtKcNel2RL28Rd6JvtjqENxTBxdnY//sEftgmw5fEDK36szRyP1+LA7E/PrdqYC+eYE
	 MvfJOJbOA9iudDdWWWVIXfLOZUfrpBbARiVd1IGRrtZc7lyfSj/ieFdSUf3nWXWMoh0TO
	 F/r3Co7GAysH4QJX1o3jwg784/7MBkOX9G02wwNHHpSsP4M9hFCyBlqMwd2NwLq5bS1AL
	 n7LTlRuUWn8TNLi8Sc0cJokAsJog+6Vj4hg0rFRO+217Hwo7SnpEjvZEnsfNjPJtZsKP7
	 eacTg38NxVcLzZIK0eELD/U3YogTFirC7gVK/gJb82213GIEocsWTXNVCqD12nOfK7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=rgjBWiNm;
	arc=none smtp.remote-ip=91.218.175.143
Received: from mta0.migadu.com (out-143.mta0.migadu.com [91.218.175.143])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38032606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 19:01:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38032606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=rgjBWiNm
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=09iLhdKoA+WjgjSiEhQrFgF/+LcrRb1ryygNNtnygEA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792436477; v=1; x=1793041277;
 b=rgjBWiNm7ij4VVOmDH6xN6QfCVE9RSCvwfDSiGdgvkdbaAc93sbHB9qYMf/97/P5wITWQIWd
 iKRpVi6p8UrK30ulueNymZxOXCUUuWN1sK2625k+ha7kGQTnVC6vwbIRwYULQzLytQ7eZcsw8JE
 P/7Xzq0Nkarf7qUiIMnr+mDM=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id d7dc869a0a89dcb8;
	Mon, 19 Oct 2026 19:01:17 +0000
X-Mizu-Trace-ID: d7dc869a0a89dcb8
X-Migadu-Flow: FLOW_OUT
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Mon, 19 Oct 2026 19:01:17 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: "Luka Gejak" <luka.gejak@linux.dev>
Message-ID: <5ae48a49833ada4e600ba4a72dc82d240bb3b354@linux.dev>
TLS-Required: No
Subject: Re: [PATCH] wifi: rtw88: allow key removal when the CAM table is
 full
To: "Hungyu Lin" <dennylin0707@gmail.com>, pkshih@realtek.com
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 reza1234khan1234@gmail.com, "Hungyu Lin" <dennylin0707@gmail.com>
In-Reply-To: <20261019165103.5990-1-dennylin0707@gmail.com>
References: <20261019165103.5990-1-dennylin0707@gmail.com>

October 19, 2026 at 6:51 PM, "Hungyu Lin" <dennylin0707@gmail.com> wrote:


>=20
>=20rtw_ops_set_key() looks for a free CAM entry before checking the
> command. When all pairwise entries are in use, DISABLE_KEY returns
> -ENOSPC without clearing the existing entry.
>=20
>=20Move the allocation and bounds check into SET_KEY. DISABLE_KEY uses
> the existing key->hw_key_idx.
>=20
>=20Fixes: 10d58823cb44 ("wifi: rtw88: fix out-of-bounds CAM write when k=
ey table is full")
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
> ---

Looking good to me.

Reviewed-by: Luka Gejak <luka.gejak@linux.dev>

Best regards,
Luka Gejak
