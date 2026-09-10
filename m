Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28280280318
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 01:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789005304; cv=none; b=EwjzzxknJ6VfSFHUVFH7CeM4l2DvV9/YocRo9vnCv3aaYeyfJNttT074B8nZm57sf1BecK4zPuAK48BAZBdETJeaIv5PGnaPxrSeXFjc0t7pH7K1KKmr1t+U3HtA4vqq2C6XY7sNQv5dJ2gI0imhL3m/2YBwZe3oR+/g68MVPjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789005304; c=relaxed/simple;
	bh=U50mXAKZslWPGncMaFFrnOpXADVR0A7auDu2s/EoAcE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FwHMjV6nMhhSU82ofC61hinZyNAk/J648Y0KVJzdArcMAvk1NUda8Sc6RMKFpquJAyKSxGUfn2PdoZ3W0WH+jopZRCoRcPo/8VaaRogs8DhizK+o9O3iVenHXP5CJZvLP+UfyeARY/G26oO9o+hSH2YrRoS+ySrVH672nsgUwa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=crusoe.ai; spf=pass smtp.mailfrom=crusoe.ai; dkim=pass (2048-bit key) header.d=crusoe.ai header.i=@crusoe.ai header.b=LbB8j5mX; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=crusoe.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crusoe.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=crusoe.ai header.i=@crusoe.ai header.b="LbB8j5mX"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-382ef647e20so7109943a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 18:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=crusoe.ai; s=google; t=1789005299; x=1789610099; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U50mXAKZslWPGncMaFFrnOpXADVR0A7auDu2s/EoAcE=;
        b=LbB8j5mXCzPCQca2q216DoVlAlaBHT10ww5034cqd5ba9/PAWA84XJLLUrhr2J2EJd
         aoEkg8+1xIZow8S/mEzcD37QRWKWcLeNGr7xPjHm1UxSsarRlHSIV5K9S0MplZhxBemZ
         b5U/PpmonZYnsKI68K2AUcoHEll8iA4YibWysJrdX6HBsWyLZma5k0JoBypL6I4XK2Uv
         fnl0+0g17ci7b2gxRXVxgbN7fgjs9BxLLORv9kuzL+PYy7CXFvLG1vCOQJfrZ3yDtciO
         bOwjjbRGQ719kQC+rwuvABXAbUXGDCrK+ozyPQTQ3uE+bncPwIz0MbF2EPnF49k9rpNa
         ldrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789005299; x=1789610099;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=U50mXAKZslWPGncMaFFrnOpXADVR0A7auDu2s/EoAcE=;
        b=fekfUl7m2nw7kZ7hBQjQwGKlFMfIGnLOlBL9w7lPJpbYIe48Y6X74KXe03yPs2mw5r
         NJs/PBByIpcg9P+08r9IYOFWbmd8BJniJP/atIBCJ8jhWcd2FDS/m0jrJiPhBZhJjEFJ
         uUrdwDEGiTiFpMRZau7/MDfKXawBMr1xxkOpLG3jadiq1q0lgihe0u0aEB3lZaRJqzdA
         tvnbeEJ1q/03zCrHAbt1elFDPG3Mmruq2xFFUhHfIWVNhL4pPYRIdRhu6kqiQYOF7w7O
         ZfHj2/oZnvjfl4/kx8Rn7sXUnEKhywB43az3k/KT5MGsVNLxTKvZoTSdwBy+GbAHWuDA
         dhjw==
X-Forwarded-Encrypted: i=1; AKwUvBxI06Se9dZNWfXEzpq7l4Ljow+T3CFh7K9N6G9C6TxKrMaIVeLnvkaF0n8yiG1uNrCK5xvXsdhSfmmTA1w=@vger.kernel.org
X-Gm-Message-State: AFuF++l4dttIfY2rq5ipdZR0dDKYHqzBuqBBioDSneHTrsECr5gwEZfW
	J1g/8Ax2N+JdRumCVK457/H2lqKrvMhmGjsv2L3rg/1As2tZVCTtd0EBlL25cBSmiMM=
X-Gm-Gg: AYBFou2TQYDrBGqE7SG7sjR0xPy1E+UDjjIIZgWb2zsU143XRbt97xO8uG27WmFOsLk
	ebFhce23fUOmpg+R6u64FjChUk8f7EhfehhH608wD9brqsR+8SMPEplBzIN3yiOKsx9UAoD7CSs
	X5GQ6C9Gkb2vWMDJiuz4vLtuTN9m+qLkwrCPRYYf9/wQTBrRy6sYeyYr07m4YCfNgPY/KU/hV59
	mCGtTRYpwQnXIScKgyPrwBhIjOdyfA7Qg8cl680YBPlLUjsDXn+pDqfZQG68EaTNli3qUuXgQ2g
	2wgx64pT3E4RbcZEVYePWJUg3XK04j1OslOO+OdgpmQB2ShwDK9aLrTXTl6DT0z6BPGYpVh/kvS
	e0fm5P8JV2udsorVGxV7OQFOwenxmAPV/2WiQ/7VpCZUGAtHLQnntWMjC5FspGVRDNJvFnklK6z
	N0OZSD1OO031sxbOQApt4EITDyuaCONye987KH3154/V3MdbQ/Ahd+oqR0HCunOC/Ax2BcRxbrW
	FkuMPehs5Aa0n48kLOZEoNha5Z7CD6ivMD3oKVeRNRGXPym
X-Received: by 2002:a17:90b:3c42:b0:38e:fea2:df53 with SMTP id 98e67ed59e1d1-39b260d2977mr56616781a91.4.1789005299313;
        Wed, 09 Sep 2026 18:54:59 -0700 (PDT)
Received: from MBP-Krishna-Iyer.civet-hops.ts.net ([2601:645:c68a:b830:4ca7:3a29:2409:820c])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1434bb7d71fsm16129763c88.15.2026.09.09.18.54.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 09 Sep 2026 18:54:58 -0700 (PDT)
From: Krishna Iyer <kiyer@crusoe.ai>
To: Nilay Shroff <nilay@linux.ibm.com>
Cc: kbusch@kernel.org,
	axboe@kernel.dk,
	hch@lst.de,
	sagi@grimberg.me,
	linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	sj@kernel.org,
	saravanand@crusoe.ai
Subject: Re: [PATCH] nvme-multipath: add fail_io_now sysfs attribute to fail queued I/O
Date: Wed,  9 Sep 2026 18:54:57 -0700
Message-ID: <20260910015457.77845-1-kiyer@crusoe.ai>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <84112f53-5c05-46ca-97d0-550565fb941c@linux.ibm.com>
References: <20260904032605.65758-1-kiyer@crusoe.ai> <84112f53-5c05-46ca-97d0-550565fb941c@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 9/7/26 6:15 AM, Nilay Shroff wrote:

> Does the intention here is to force I/O to fail irrespective of the
> controller state, or the intention here's to fail I/O only when no
> usable path exist? If it's latter then I believe this is not the right
> place to enforce this policy as since this check makes nvme_available_path()
> return false unconditionally when NVME_NSHEAD_FAIL_IO_NOW is set, without
> considering whether a usable path exists.

The latter. nvme_available_path() is only called once nvme_find_path()
has come up empty, so the flag only decides whether pathless I/O is
queued (default) or failed.

Agreed on the rename. For v2 I'll make fail_if_no_path a plain
per-namespace policy: admin-set, no self-clearing, toggleable at any
time including mid-outage.

> This attribute should be only exposed for fabric controller.
> It looks this is being exported for non-fabric controller
> as well. Moreover, I like attribute fail_if_no_path better
> than fail_io_now, since it describes the actual policy being
> enabled: when no usable path exists, fail I/O instead of
> queueing it.

Right, v1 exposes it everywhere. Since v2 makes this a plain
fail_if_no_path policy though, is fabric-only still what you'd want?
The queue-vs-fail choice isn't fabric-specific: a PCIe head kept
alive by delayed_removal_secs parks pathless I/O the same way, and
dm's fail_if_no_path is transport-agnostic. If you'd still prefer
fabric-only, I'll have the visibility callback check a sibling for
NVME_F_FABRICS under head->srcu.

> This patch appears to be based off older kernel branch. Please
> rebase it against the nvme-7.3 branch.

Will do; v2 will be based on nvme-7.3.

Thanks for the review. Unless there are further comments, v2 will
have the fail_if_no_path rename with the persistent semantics above,
visibility per your call on the PCIe question, the nvme-7.3 rebase,
and the fast_io_fail_tmo rationale from Sagi's branch of the thread
folded into the commit message.

Thanks,
Krishna
