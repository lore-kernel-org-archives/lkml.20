Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792992044;
	b=zENtFzOauTanSt3BJVLJLtQN8avFx8VrR6dzChQSkRSelyTtSK8QI+SkunDd71ib4zCs
	 NOZPzD2/CoSXS8E3pKaIc1V3P6RnAr/Rz1vU6fONhRIniCrP0XP0s8Hk5t9NRIFEdfpCb
	 sR7CF9Z0iylEA8npDZ6qeLDohNNaC4v3N/nbX1RwUzaEtGkjrorxQ1PACtqgmb7MJAdqR
	 ifL9iJ6E77kcZt8V8fsmbpYhz0jMKYP0Iu8b1sS1JxrqebUWOGVMKCwlVJuzqYqXEMAeg
	 6/RJ2QMIyfkPJPRGI9bCl183Fi4TPzk6eyLxR1M+AtPG1pHWfwJ4jnihSWiVbv9bHJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792992044;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=kFxDNEtLaJF9FbohY5ofu4rvslw1141Z4oiCfeRJ8oA=;
	b=dZ9y/O8MyGwWuTmczy5f877L+QIhQTTte2q8krnfWSl40Ap41r5xd4CXeX2j3mMywjpz
	 zCg28vKP+e2u+sQDful0e5jOs3I5+u8yu8S2M/pP1QkN+Oji6e2Buv6CimHv8U366N4C1
	 vN6azUxuUXP7XyCblmJQu7j6iJuTnaE0jKf06CurLU32HUUbk2H3h51lWrXkl17rqzc9i
	 uI2aP0P+jxHk4mWciJ42yy+Ox/ktyw2tzd1g+P+LvK6tuBtFtXgkC5qB618iF8dKO9D9N
	 ha31vrt+qqkxP5EecbFuA05735ELEoGy72Arpl+gvQ7rWCKy2gEgekUUvj+dBJt7eFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=BaNVFCds;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD28606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 05:20:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FD28606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=BaNVFCds
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1517bda04a0so2661164c88.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 22:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1792992042; x=1793596842; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kFxDNEtLaJF9FbohY5ofu4rvslw1141Z4oiCfeRJ8oA=;
        b=BaNVFCdspruHH8GA8OXuVxcDRo7VDhd5uMp2O+cGb20fDefa4YtsvUN6OVZiIr8SQu
         +8mJqMDKykefwy6jzORLyZsw7Zf5Dje3yb5UK4BEFKGn+JU1NwWitamExQ+KX8I2jaOU
         urCfUjq7f37vTIcq1E46c2mxxTBTN9v2u1KfH4ToPmfQxVCu4B01/tSmvXlUo/mUDNtS
         gzF+iv7jOQooNRGVD2yy7iknYgLRdN6iOBjkJfgozq01QS/euJpAPzrQxck3l+y+jCp0
         L638W4cZYZPWxWbUuoBYDWpMbzqrGP8DXhEx83bK/Sc2Sdi8dWO8OmfeoCrn+01qm9Lh
         QIPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792992042; x=1793596842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kFxDNEtLaJF9FbohY5ofu4rvslw1141Z4oiCfeRJ8oA=;
        b=EvCummVnnVsd2BTsMX7s1qnnvctHQpBH2jNQ7F4x8crBX1XSCBdq8vfMZj9f1W7gPh
         b5gnWg/Mp1Vm8wGrdXKPEHFrvDnnRWpx2KZkU2xH1TqSCdV1rlqBV1t7J/WQkuAJiSYC
         pynvpJU9mhm8udPMS4N67+DrPa69uRtVsFBK0q9EUgOHrSIY7gPFfcvioRf+rCj0sjjr
         BO/zmWg0q+zEhD+73idbZy7ZGExJ0CzU2vICdrOIKu1R5oBritLOPryfM8/FAaiycvNb
         acw6+mD5uRqv2qhcCd142Rj2ipxJ4R/1HAkwAOknmXgA8kT4B24gy+WJruJnUA5DjbCb
         A6eQ==
X-Forwarded-Encrypted: i=1; AKwUvBwUfyac/5IRmshbNYEwxyAwrt+N3fmEI9P2xNgNOhjRjUQlQ/dkt5qrcuXSDA95V3ZQoPW9v/q9a1prX68=@vger.kernel.org
X-Gm-Message-State: AFq9FYJMmRLkKjQcVtlb1SiizqV81EREoAv62hfAUPwjHUqbzTJJrASB
	BR1jVyW2hRdmxHjNOLKHy5jlN8WDl2/YpTvPrF4ed+ffqCNXos0YpNf9+TxAOw3+8yc=
X-Gm-Gg: AYBFou11MDx+3TcZQPp2pImVSikZzoYoYKEHdAU230M67+Eha9Tt5yPxKJlLkBUzwpi
	QObhIv+Nx7B0clAeQ/jgFu5hkoJmZm6k5sre6J0drlMyhaog6iUr27y/4REI723XGQ+A9w+kuNp
	jh0UUF9eLGzBVQ9dWUe0F2k2naK0/xyUCb7if67OZnpdQ5sp3/5/ommj6Lf542dG5QVKrIC0Kgp
	GT+kD9UhK87oikyGCy9WhUdrj0L40LmSLMCuZTNlwucAuscms6dkO6/vOgD6ZyHqLcylL3+nt7J
	vT8VG1KLUqm83ABZDrTIueur0BKakjN/Un8dkiCbU2v7dn38WnADUS5GQW8fqCv8BdHS06/42RX
	Sl5q01ilymxk1VLcNAlU8/oz8KKwgB/R9Xz+UnCZ42wImTUBAjXStu9nNwqouFKtq1xyNP9XRoz
	w25WI5bXG7W5XPCm2+6nPNxE4xiPM5KgLb872WqQU0lc7VcBpHbh8KOmaMdTELNsMESztzgrnL4
	G5O0sTaX9zUmIRCfZU0QJxHu9NMzfjmkbAHsIM3/sIUUMh3O85NjTI1PjKnUkc4puSaPK5LXp+8
	MUdQxjjK1R25NCDvQIfiBFkll4pAcSfN/YeTIglgWtErkGw+GipIuMzn+TkBPJ23NYr+IQ==
X-Received: by 2002:a05:7022:418a:b0:151:2e62:fe6d with SMTP id a92af1059eb24-19935beba2amr11889083c88.22.1792992041815;
        Sun, 25 Oct 2026 22:20:41 -0700 (PDT)
Received: from yhlee-960QFG.. ([125.131.91.97])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a0f83cedsm26765774c88.13.2026.10.25.22.20.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 22:20:41 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: Bart Van Assche <bvanassche@acm.org>
Cc: Leon Romanovsky <leon@kernel.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	yhlee@isslab.korea.ac.kr
Subject: [PATCH v2 0/2] RDMA/srp: bound the receive IU the target asks for
Date: Mon, 26 Oct 2026 14:20:27 +0900
Message-ID: <20261026052030.296361-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261025114155.4007867-1-yhlee@isslab.korea.ac.kr>
References: <20261025114155.4007867-1-yhlee@isslab.korea.ac.kr>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The target decides how large the initiator's receive buffers are, and the
initiator never checks the answer.

srp_cm_rep_handler() takes max_ti_iu_len out of the SRP_LOGIN_RSP and
srp_alloc_iu_bufs() sizes every receive IU with it. The first patch refuses
a login that reports less than an SRP_RSP, because such a login hands the
receive path undersized buffers, and a report of zero is worse: kzalloc()
answers it with ZERO_SIZE_PTR, which ib_dma_map_single() accepts on a
virtually mapped transport without looking at the length.

The second patch stops srp_recv_done() from syncing those buffers with
ch->max_ti_iu_len. The receive ring is allocated once and kept across a
reconnect while max_ti_iu_len is taken from every login response, so a
target that reports a larger value the second time around makes the driver
sync past the end of the mapping. iu->size is the length that was mapped,
and the length srp_post_recv() posts.

Changes since v1:
1/2 unchanged. Dropped v1 2/2 (drop a truncated SRP_RSP): the floor makes
the buffer always >= sizeof(srp_rsp) so there is no out-of-bounds read, and
dropping the response would lose its req_lim_delta credit (per review). New
2/2 bounds the two srp_recv_done() DMA syncs to iu->size, the reconnect
case review noted 1/2 did not cover.

Yehyeong Lee (2):
  RDMA/srp: refuse a target that cannot receive an SRP_RSP
  RDMA/srp: do not DMA-sync a receive IU past its mapped length

 drivers/infiniband/ulp/srp/ib_srp.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

