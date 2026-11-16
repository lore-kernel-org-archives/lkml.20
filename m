Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.126
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794831984;
	b=AaQpC/45HDPQ3ZLdyWgWqvr2gY6BR4OPSpfgs8g5AxT3pv1fk3E+O6lljLw7UqOYjMCW
	 MFl3tHyJQ+e4V3Jd1HKeuby70MHdvNVpZfR+Qh/n4JPHlfzDv7BEWjkGW8YGfsivdtGFz
	 fudN4sQBJHOAxYjgoy9pt38JvjKkHfFEKhfFIpNjeE5C3Zwn0SnplWkpPeHRqcPW2EA29
	 9BlNtYsuWsccDJflbkMmEdAx0qpqEGWgX7GuFHlAtSnTne3F3KW6dwxjPQl2A9e+E/esb
	 gHATCnbr33HG7Ny8I6oMdYM5vym8HXDf2RzDWo47XlXI08BPt0aYqjRcGFbbtcmR1BA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794831984;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=n0Epwbp8Lzi+kI0RuXeSMG9mic2jpFCzQkf5ONSBZoI=;
	b=yoWk+i5BxurVCw1HhjWVJrA7phM3sachJYr5Ii01vssMXcWxkYtgnyALYC1oI250GP1i
	 rDaQ2EC+k3Ir3ON6IwFKibP0szuSSAMBZsm27eRiI9+GKvU/ltc+OeI97JABHEpTXgV7a
	 cc/FHJHgzKhR0hqR0nDvRggwYYbq/QrQJPBTqnPVhVNfqvCjbwZuc0+BZ7Rn1pJIls315
	 IiN12i8zYI/QKvYqb2voR0sJGcWtbYYsB67T3T3uCdzMZ3LZ/kSJVPfXXbMqiEjxPw3VH
	 JFBVYboO+4m1Ng18kGaYPgzuYMKR2NS0NCVyKDRYJwmviss/DDtEYG7e1TUiAVM059A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=N87ByHEt;
	arc=none smtp.remote-ip=91.218.175.126
Received: from mta0.migadu.com (out-126.mta0.migadu.com [91.218.175.126])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F315606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 12:26:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F315606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=N87ByHEt
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=rMg7ePytN4P08Ni21SDstdH+iA+/lX/CBMDE9CVdeAk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794831980; v=1; x=1795436780;
 b=N87ByHEtnKIoJqA4ZsSjlcIJPBhTkLAQmsGlX4k9kprKC3mAggidLqu1x0GuQV90Q1ejvSFA
 juJ1qcoNn6B+DAnPpHEnjSIFcM22LdbhPGvrJfn66dfLDoVefUF6AWRtrrJ7kb2dUBzcoSeQ0xD
 sZomJEsfDfZQ0K5f7jvMvNoY=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 214a831be1616a46;
	Mon, 16 Nov 2026 12:26:20 +0000
X-Mizu-Trace-ID: 214a831be1616a46
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5c14bc5a743so9074e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 04:26:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGxoXJCjMU7bko/JbqQQGs3hW1YsDlZQrZt20m3N6v1gD6jpfWZeSOEPLIbUUl8X9XD8IKb8tR7x7hOMaw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+NMbKt+A1e+7yvtkVAd7DjWoToRYElgoQTVCxjmL4sAVe2BNDn
	RJ8ijgSv9E4T+0CmyQ8Xo6Suxtrnx2LbbprnMUreI8vwf3Mh2U2S4LLJOx5c6z/BFLA2zoFFLKz
	4MibPnkVidYzcATRmZpajxv3Q5pO2d6V64LWxb0Gq
X-Received: by 2002:a05:6512:3e22:b0:5c1:56f6:2f50 with SMTP id
 2adb3069b0e04-5c17d6151bemr251895e87.1.1794831979748; Mon, 16 Nov 2026
 04:26:19 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116110549.1863653-1-fuad.tabba@linux.dev> <avro44jUWOARFzul@google.com>
In-Reply-To: <avro44jUWOARFzul@google.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 16 Nov 2026 12:25:43 +0000
X-Gmail-Original-Message-ID: <CA+EHjTxWuiyjmUc3vH_KxRtS_3oX5w=CE76LdsLcrqC+RzLGfg@mail.gmail.com>
X-Gm-Features: Aa3M54okcmr9MdJAy7XSmuEmAJr7gqz5micdc5fGZdFcC1JtmeOKxVLrP8oEceQ
Message-ID: <CA+EHjTxWuiyjmUc3vH_KxRtS_3oX5w=CE76LdsLcrqC+RzLGfg@mail.gmail.com>
Subject: Re: [PATCH] drivers/virt: pkvm: Zero and clean memory before sharing
 it with the host
To: Vincent Donnefort <vdonnefort@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Marc Zyngier <maz@kernel.org>, Mostafa Saleh <smostafa@google.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Vincent,

On Mon, 16 Nov 2026 at 11:28, Vincent Donnefort <vdonnefort@google.com> wrote:
[...]
> > +     /*
> > +      * The host can read the pages as soon as they are shared, possibly
> > +      * through a Non-cacheable mapping. No caller relies on their contents.
> > +      */
> > +     memset((void *)addr, 0, size);
>
> Are we sure we want that? The guest may want to setup memory and then share it.
> I am not sure about modifying this API.

Right! I wanted to fix the bug for the ITS property table, which is
shared before it's initialized, and totally forgot that this is the
path all sharing goes through... I'll drop this, and put that fix back
in the ITS series.

> > +     dcache_clean_poc(addr, addr + size);
>
> I believe the hypervisor is already doing the cache maintainance when the page
> is mapped back into the host. (see stage2_map_walker_try_leaf())

I don't think it does on this path. host_mmu.mm_ops doesn't have a
dcache_clean_inval_poc() callback, so stage2_map_walker_try_leaf()
doesn't do the CMO for a host mapping. On the guest's side,
__pkvm_guest_share_host() only changes the software bits of the
existing mapping, and the walker returns before the CMO in that case.

Cheers,
/fuad
