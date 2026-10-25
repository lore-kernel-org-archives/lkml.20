Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792899824;
	b=10ta5D/gIwfY1cWNPoaTatcIcTtrbKv8gCCnDuDaxITVJ7USj6UBC1NF3/7QAdSqXm3G
	 7pVIKbxF7/s5SzwRk9A/pcm7ThpUuHMx0AzgeIXzjwbCXQhRlSRsdAcc7wbCTOwBSoEq0
	 fLQMouU1e7J+l+WNHnnc03OZZIzVh1JJ0/PtvUA9giYVFXu/kZ58qWslfGJBPI0U/X8qG
	 laStekNed5BlmoqVYbzENk8GcGbcbPNjH8otTZgBNovvUIqL+vXQ/a/iBlIeJOn6pGAET
	 w4rSZs8k+xKayy6xGXVNJICBRNllTOC+Q1nCBGBgnBpTO6yVEDNiPwbxRduX9hKK/5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792899824;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=X5OzgRH/1V88QEQk/qEsTmnI1GvbJFJUj713/504BL8=;
	b=DTtK3FQdtDUZk1yHj38Nz2fP5KBLpbPOhi2u9uxb8USKSJkjjqh8TmDYduUF6haM0OGz
	 6eZJgSUFxFU1WB1hj7X8fgjKCcqA3J4KarzPQ6PcuT3KSfhUn/rCH5MaKvy2dDI2lCZJK
	 qiFFDuSQ+kf8aUVNo7Fku1CgfW+GTRlunCSgE5Wjk+DwOWtPHK85iAVI+PenIiNIGCa+/
	 d5ZbcaYH44uPRYxA62ZUF9BvPXsr74gV5KatOAzKPiPjxqm3zEIVQkHWP9bcEl77MYnRf
	 Qdkxs0rmY08hRLS6tegTPLGfAuYRNgNlmXPD2BT/TxM8O0rp3bcyLnZGqFrr33ksnWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=N16Ofwvg;
	arc=none smtp.remote-ip=74.125.227.138
Received: from mail-pj2-f10.google.com (mail-pj2-f10.google.com [74.125.227.138])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B818C606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 03:43:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B818C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=N16Ofwvg
Received: by mail-pj2-f10.google.com with SMTP id d9443c01a7336-2df921c1d0eso7868985ad.1
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 20:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792899823; x=1793504623; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X5OzgRH/1V88QEQk/qEsTmnI1GvbJFJUj713/504BL8=;
        b=N16OfwvgmmwPMQDqB+lHEvh+zA08Sn8PNtt5nWqyL4kj7TtV6iahTavuqONDGHEBo/
         RbSbWLe6FJVOTZLHiZQ0tDMURGZNbWXtKXDEae4HcuG2plbenNgJtSS2v6cdqU2WtUL9
         YYglL+PJCqLn5YnHaGVSlXt2KnAVwsCFXsftv+ms8kseuiFbCPnK789lW2sPaYYBKPBb
         gwXEL60ec6G5RrZxvpg5OvyrB/P/MYw1uybQcbtxl4Vl51pcgBMPsHtuYhwi2DAWgEJ+
         wt4qF2p3+n35tCoC7KB+/hjlGuuEURHSl+X7QhLGUYRbHduh095EC8e+aAq9BVn7lXFr
         3l/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792899823; x=1793504623;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X5OzgRH/1V88QEQk/qEsTmnI1GvbJFJUj713/504BL8=;
        b=H2e7bqVpTEqxuHwaQW0tY+MJndya+HMV/78ZrQMWZaFUIxk/R5WULkX2j73wRVF4Wi
         8+e4O5EKCagAyc8HlQP9ABXeFQrc8YswRUH2wpn1CE4R8ZCXwrCGeaL0YdJaKGPVZCv2
         PYZSwx8swlxd65nZhkxnB+RagBX5LQQipXGDkjPKtzxC8rVOOYN7tsU8TSZ5e8E5tIQ7
         WgxwaCuh+mLcbngPsZSrgTOODNOp0hCdf22RYUM+RUD7paRX5q1uK2+qt9jRUTd7uGbv
         34hyyq9od/bwnHSeYl+H5Jvi5D9+GypvJXoL9OC81fw+5BIQMBtQXK8kNIoE9UEFhj4+
         0J5A==
X-Forwarded-Encrypted: i=1; AKwUvByXUxWTWzF6CmyPdpfXYC6ZfzgsoUUv6BMCEb0uPhdRLzv8Jwr9LUlL9ENT97G02WOYpeNA6mvW4mhhnVc=@vger.kernel.org
X-Gm-Message-State: AFq9FYITdu99KJTn8ofIriRZ45xlwgUhEKwtxbdyUVOa/XJvuukVO7Zi
	8Q9sDohe7EOt83/P4KlHt3jV7Rj0PxLMEPlegDCDuKLc+PDvtYskgN0s
X-Gm-Gg: AYBFou0aXmcoQ+NjXADcw+WKH43tI/d4SG405IyfZJF99h+blyxUVk38cUwzH6Yylhf
	uw7DqzOSB4oO1gJAjkEcwIpxV+WGO2/QWvyGk3xe8oS9W0CaZO8IqDGNo8VqP5PfuRStM6ZuwE2
	DHWUjMxJrgVaVHm9Yn1FJKPct+BhMGGNoPoMnoY+hvSCMVsKYKMn82QgMnGAfOnKF/2zJekc4GF
	3HDJ5YUd5lIiel4hIrh6eXkrkSC25tLJ2kq0Xgp1nP4zVeD53oBmuQdCBg6qzs8LWmqNr7xZxU0
	MJF86nmZq28wZacXURFx1b6BkC8ZQHOdKP+X+crZE5NsG/LqG+Vfo5TMUdb755PCPompClgcFld
	hhJfAUnbLrilIMFMatQ782SZg05k7hQiwau9lNhr399JZVpGEzAzAu+49ehWeJm2HrYmI6U6Oqa
	MhS3FjlETV5v7kxMgsQeginhk0xtGjI4bI70bBDquvHuIdS+HtotfnhJQEza0UZkIzn2jlmX0gv
	NxmATFXb8WEax0DYo7TOEOnybdWzDTlrC4SS5qnlHNZ/nshnturmXF3xsFjsTYK3GHoX+xtW37i
	DxN7+nGxd8Dnwy3BL/zWYfv9UwkaujTf6ryrxLPJuQ==
X-Received: by 2002:a17:90b:2e8c:b0:3ac:c005:cf07 with SMTP id 98e67ed59e1d1-3adead4c1aemr3019182a91.42.1792899823172;
        Sat, 24 Oct 2026 20:43:43 -0700 (PDT)
Received: from localhost.localdomain ([240e:46d:2000:332b:d93b:afb8:5ea6:9575])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebaca727sm4265968a91.3.2026.10.24.20.43.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 24 Oct 2026 20:43:41 -0700 (PDT)
From: Rongzheng Wang <testwrzwrz@gmail.com>
To: Jason Xing <kerneljasonxing@gmail.com>
Cc: Rongzheng Wang <testwrzwrz@gmail.com>,
	Magnus Karlsson <magnus.karlsson@intel.com>,
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	netdev@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v2 1/2] xsk: defer software checksum until the skb is complete
Date: Sun, 25 Oct 2026 11:43:27 +0800
Message-Id: <20261025034327.95300-1-testwrzwrz@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <CAL+tcoBQHudeQC+B0J0mwqbh1CH82XQWfQrtyXqVMF3ybopr3w@mail.gmail.com>
References: <20261024091256.17918-1-testwrzwrz@gmail.com> <20261024141157.59301-1-testwrzwrz@gmail.com> <20261024141157.59301-2-testwrzwrz@gmail.com> <CAL+tcoBQHudeQC+B0J0mwqbh1CH82XQWfQrtyXqVMF3ybopr3w@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Jason,

Sorry for the noise. I posted v2 too quickly and incorrectly threaded it
under the v1 patch. I should have waited and replied to your review here
first. I will hold off on any further revision until this discussion settles.

You are right that I did not answer your questions directly. The cover letter
only summarizes the drop behavior:

> On a checksum failure the packet is now dropped after the descriptors have
> been consumed. Metadata validation makes this path unreachable in the
> current copy-mode implementation; keeping the defensive drop avoids a
> retry path for an skb that is no longer complete.

Let me expand on the two points you asked about.

Drop vs retry: in v2 the checksum is calculated after xskq_cons_release().
At that point the descriptors for the completed packet have already been
consumed, so returning an error and retrying the same skb is not safe. Drop
is intentional for this failure path.

skb_checksum_help() error cases: based on the current XDP_COPY path, I do not
see a reachable error. The skb is not GSO, the fragments are readable kernel
pages, the skb is not cloned or shared, and the metadata validation has
already checked the checksum range. If you think I missed an error case,
please point it out; otherwise I would keep the defensive drop.

I also applied your literal-else and unlikely suggestions, and split/reused
the selftest as 2/2.

Thanks,
Rongzheng
