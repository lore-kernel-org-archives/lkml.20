Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793892941;
	b=EDqhMmzOnEHrjrENhq20qfMTuSqBlrILAZt2MKIVuy+llvFkM5WZvBkaN4CY8FNQXbS8
	 aBiBU1TBsSSp5qelZeTXorD5XptMy6BNu9zf3gFaY1RSiM9RgEGV4FTsBACpyavk4Eu4m
	 0EtPnYldwoXKao2uaKf/5jQBXS/VYdgWns4zbnBFo6XvNun8yXTzhT2s0n7rf5BnK9LkG
	 5jCcXcTjT3Ge8sFMugGY3PZTBu/znagHt0KMbdDWKjOqb5pdD678P66gfCwPo9c3ef56F
	 LklZo1LIqtOCfO4WyKnwfu8jHhtGzCW/+LSksy9r6hAbKmm/ZXPpuMxgNT+LrKXLC8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793892941;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 X-Relaying-Domain:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=lvinUM9bdOIzQQT+vOy1XPr/IQD9o1XMDhdE9KnkQhw=;
	b=MSgtxKh2WRAOpvcDwgQgkBHG7n2ZkZk4BBOFsc4ya9q/IqQyK0+nuvOp2eEm7lLuNAG0
	 D04byeTfPRvt71dmMnnhdPnXwbR6rOHrihw2ekRM6J5BEhwR7re3b1sXMGDSWCFIYZQ5Z
	 MGX2IRyw7kKPOmW5tW5g5flpNsPOm+BZbyc3HqfPVObeYqX2KycWmYXxPnAUPPpATWOo7
	 l/CwtH2Zo8//Hrk8NARlOlR/rKUDHVnOxYGWxUaI3mQi+RBZ++RGyjnEdUZLvXHZxSU79
	 D1GuKu+ppHYxFrtot+m7FhMmqei4n4vIwFmGnJqrSfsxOLu9NomjawwzHZAk07O40ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=purestorage.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=PWCM5JUG;
	arc=none smtp.remote-ip=209.85.208.100
Received: from mail-ed1-f100.google.com (mail-ed1-f100.google.com [209.85.208.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6613E606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 15:35:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6613E606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=PWCM5JUG
Received: by mail-ed1-f100.google.com with SMTP id 4fb4d7f45d1cf-6b167ffd132so3249357a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 07:35:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1793892939; x=1794497739; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lvinUM9bdOIzQQT+vOy1XPr/IQD9o1XMDhdE9KnkQhw=;
        b=PWCM5JUGt2vM7IoWvZ2VRy/K1pZWjolfIrZvNnnrIcVUCmKuwQSNtxHRCsfWsYW2YN
         n5RR3UmHSzqRH84ms8sRvR55ma2onqpmsjP2uhFSHqR9BEXm9vzd4rhtJfYuLMnwcLaO
         4ekvrvwBN531NBXuN8cWbQLvzJVzFsLFQt9LSbiQNLBCPSl8vs+bpW46ZBeEY9hN6H8A
         OQrjLyVKDMSFH/UZTUmIuB5WCmhpYUt/GjaDqeIKC1Y3py7x7L2eSbF2T+dCNRfeWAuv
         IR/ajfFa4PACXPv1H+8IfPasF+e86OENGadezOhGXXbOZhaFtDX/X8ukte0DnN/fcUUK
         2X5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793892939; x=1794497739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lvinUM9bdOIzQQT+vOy1XPr/IQD9o1XMDhdE9KnkQhw=;
        b=cEWy3T6Ck99Sa+UPRkxjTmcpUiEsfdPeAlKL8dPjK8a0ddT3ULzQVenEvCFJVGEStR
         Lb33Qlrk25EWBplvTzDoGqUMBujLcoKRxHXzPQXyx+4gIvib9z3dUcdkTq9CPuids9aC
         6aFZfrWRMb8Um2xc+I5mifoq9BhMYq1oQIyA8Gl5NU48VaCg+yuuhb2UnN/WNkclNsab
         /Kbx+s71Va+jjS0ksave/bS2yft+DgBc0Al1shI/q6sj2xWWZvPonc9A2ZxLxpoxhE1Q
         LTN1AqumPG8qEBYL09KZu/l562M8cioWh/MCIIAtOAQoc9L7/AdkLAkBrrfyhHLsw/R7
         ejtQ==
X-Forwarded-Encrypted: i=1; AKwUvByD2oBlKWy0IixUgXUqTi1N5anFKmf20BmpbYJ1QIbSVTnI2WZt02tBf8McqTRazExcheQDtZTJSzgKZmU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+UzSz/3nMTAIUZkPnFt9TrQdPdVgp7viGLa+kl6Prv5QxCc8mR
	jh72Yz1oaCMPHuR3gcHu5o9/UMV6H3Ha21ZxtOLqsy6yuDHAR1sM7NRnQk+gzMVyOq+Xyp4bC95
	IE4ZO16391nafPlqTbIbBrZsKNqWHAfKAEh2o
X-Gm-Gg: AYBFou31UGnrlAEyzVa47zArr4MBvlkUYkkyWe1UEVqLNuELGi1j77xU8cvV+noUzfs
	vLJcmw6vFqByRtCL4ebLkoCKMi5mjX6pUIke2NTDz+xipcM8cP21k0TIjXkfPDchjbiphe2+0er
	Rrj1g5WHoTpHZxeqlI/RzFv7HSmhxc721Glg547NYr/xgJ7zijfDUw2fOlpu1FsZPJ0Vf+/eWjp
	eLN8tsI2dStFC6creOr3YckQ4Wxj3av9MhDikU5Krpgfz+f/QVNGTFpY/Emyl4G2ZeR7xXG1IiV
	3qeNQIU6fuMKQb7x/PZ3wqFXkyti/ZF48dq0LvLgenJGytUohL8B51XtZ7A9s9Arj3fNh3Ebg4h
	HYIRAmDJT0S7RXU5shqynCw+7rQBdfau8ZWDMIA==
X-Received: by 2002:a05:6402:ea7:b0:6b5:78bc:406b with SMTP id 4fb4d7f45d1cf-6b578bc4265mr1906328a12.23.1793892938711;
        Thu, 05 Nov 2026 07:35:38 -0800 (PST)
Received: from c14-smtp-2023.dev.purestorage.com ([208.88.158.129])
        by smtp-relay.gmail.com with ESMTPS id 4fb4d7f45d1cf-6b55ac1beefsm1194828a12.4.2026.11.05.07.35.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 07:35:38 -0800 (PST)
X-Relaying-Domain: purestorage.com
Received: from irdv-tmenninger.dev.purestorage.com (irdv-tmenninger.dev.purestorage.com [10.32.149.15])
	by c14-smtp-2023.dev.purestorage.com (Postfix) with ESMTPS id E2A1E34040C;
	Thu,  5 Nov 2026 07:35:06 -0800 (PST)
From: tmenninger@purestorage.com
To: trondmy@kernel.org
Cc: anna@kernel.org,
	bcodding@hammerspace.com,
	ebadger@everpuredata.com,
	jcurley@everpuredata.com,
	linux-kernel@vger.kernel.org,
	linux-nfs@vger.kernel.org,
	prabhakar.pujeri@dell.com,
	stable@vger.kernel.org,
	tmenninger@everpuredata.com
Subject: Re: [PATCH v2] pNFS: avoid repeatedly cancelling I/O for the same lseg
Date: Thu,  5 Nov 2026 15:35:07 +0000
Message-ID: <20261105153507.3145077-1-tmenninger@purestorage.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <0a489565ca1693403d08eaef7c3545f5b8366bb2.camel@kernel.org>
References: <0a489565ca1693403d08eaef7c3545f5b8366bb2.camel@kernel.org>
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

> This claim isn't making sense to me.
> 
> If a layout segment is recalled or revoked, we should always be
> clearing the NFS_LSEG_VALID flag bit in order to prevent it being
> looked up again. New RPC calls should not be able to add that layout
> segment.
>
> So the only thing that can be found on a second run of
> rpc_cancel_tasks() is a task that has been attempted cancelled
> previously, but for which that cancel failed.
> If you're seeing actual spinning, where the RPC call is just being
> requeued by the rpc_call_done() callback, then we need to look at why
> the latter is failing to handle the situation correctly.

Agreed. I am not seeing new I/O acquire an invalid lseg.

The issue is that the set of lsegs affected by return processing can
expand while the original I/O drains. Newer lsegs can exist on the same
layout header, with I/O that has not previously been cancelled.
Cancellation and cleanup of the old I/O can then redrive return
processing against that shared header and bring the newer lsegs into the
return scope here:

  pnfs_put_lseg(A)             [final reference]
    pnfs_cache_lseg_for_layoutreturn()
      pnfs_set_plh_return_info(..., seq=0)
    pnfs_put_layout_hdr()
      ...
      pnfs_mark_matching_lsegs_return(..., lo->plh_return_seq)

The zero argument to pnfs_set_plh_return_info() resolves to the current
header sequence. If that sequence has advanced while A was draining, the
pending return cutoff can advance with it.

For example, my trace records, on the same header:

  final put:       lseg A, pls_seq=336
  return info:     input_seq=0, resolved_seq=529
                   plh_return_seq=528 -> 529
  header-put scan: seq=529
  cancel_io:       a different lseg B, pls_seq=529

A was already covered by the previous return boundary of 528. Its final
put nevertheless expanded that boundary to 529, and the next scan
invoked cancellation for B.

B does not need to have encountered an independent I/O error to be
selected by that expanded scan. Its I/O can be cancelled for the first
time because cleanup of A broadened the return scope. As B drains, the
same interaction can affect another newer lseg:

  cancel I/O on A
    -> cleanup redrives return processing with an expanded scope
    -> invalidate B and cancel its previously uncancelled I/O
    -> cleanup of B can repeat the process

Counting only newly requested cancellations does not break that sequence
because each newly selected lseg can supply previously uncancelled
tasks.

This does not require new I/O to acquire invalid A, or the same RPC to
be repeatedly requeued by rpc_call_done(). The feedback can proceed
through completion/release processing and cancellation of different
tasks on different lsegs.

The cache-path sequence update is what I tried to address in [1]. I
asked to hold off merging it because later recovery in [2] ("SUNRPC: let
cancelled RPC/RDMA requests drain before release") testing left some
ranks slow even when the reconnect loop was gone.

[1] https://lore.kernel.org/all/20260921235520.502987-1-tmenninger@everpuredata.com/
[2] https://lore.kernel.org/all/20261105030710.2652306-1-tmenninger@everpuredata.com/
