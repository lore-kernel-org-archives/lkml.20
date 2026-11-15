Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794764190;
	b=LHoPCvJK7uhkR37jCN0TMchs7onYVT7H4uVJV2+knpzTzXsSaFpJug4tUG9u57CjZhQ0
	 b9Pe3Bgv1RF4r8fkYWosg0VupT+ChK2ZGBE4CdiyjD16UISgJmCyrwLstNwMA1ASQVz8+
	 hfQNhlvnpW5CbJbmYfki5s+l2L0NNyNSd7O3/DoZ6DnHnYTvnaFlhtwkXPpHqNEIx5ZtC
	 W58zDltmS2A4UpRyQkeospqbplubZnof2SOiNwq3SqEfdGQhs4sHdHkpc1X3ssR5V8ciZ
	 A78MmtxmlMsoMPJO+7wJ74O78eh+BRt7zpvFZnrWwR0pGRGBb8tknOJY1kyKmjK6rCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794764190;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=GRWYSuLQP9sZfKWWqP+UL8TabCKmkxKc6qkoZFoAHOo=;
	b=G/O9Wolqr6xHK3N0Q3o5MWYItwP/YnzrUFmY3/XeFESSb8Ga1jopNq2kxsp+Hi8cJI6i
	 erDJx5A8kyqzrgi5yrf9W0P/SdkLgnSsvD88R22uWxEx9cWNdrommmmb2guXcNAzZ/Fmp
	 4eAqzB3/4DO5o+g7UhW7IB7+lPBJANoDX7MBdK4XpYmGNKLT6XMUXBcsC4EKP1eN+oQWI
	 r9CDTGWLngYZnpcD4C0ZiHNgPLqRQ8Od8a/wHKq0c1ERdAcK2p2hBeeRnkxPxVXv9rfJl
	 sisY9O3OJ+5eEHYgXnOzy77Nfl+yo9shuw7o5TRM1uSJxtZdCkvy/Fv3AY7udzuSuRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=purestorage.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=Ut76e44E;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A682606A323
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 17:36:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A682606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=Ut76e44E
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso2225056eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 09:36:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1794764188; x=1795368988; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GRWYSuLQP9sZfKWWqP+UL8TabCKmkxKc6qkoZFoAHOo=;
        b=Ut76e44Eer+SVkzm7j6VbbdgAJUYEtAvHPQkRWwmhc8sTzHTEX2gX9c8INz0D3UkTZ
         c5Q8nQf/Ja72N6pQ86DzQVnTj7X9LvwZf/XCdcLhHU9cldDr65Uuqd+XNN2qCKkJd+tQ
         Gaf0IGiVv3s+DiUjMKfKgvGIFS/EYzaldtN5cACuzLuYRIse2xyhxfiY6mUSuQAaohM/
         6LbmQmF7zIL3DEh/wKcmfNrxcCEs2LG+fMzejSLo5cjQ01LLrGBeO11vcy9Q5loUR4q9
         j2x+QU/H9bYI7aQH6Ns7oqnPpudKbrq0uK7bpL9fHm9EI+HBMMzh/LX9Hk8/odxHIohu
         z3pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794764188; x=1795368988;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GRWYSuLQP9sZfKWWqP+UL8TabCKmkxKc6qkoZFoAHOo=;
        b=BR7KVnRrURxxUIO3jHh3pnP6P5fjfkRyqDJOF9yEotH9rIyU6z28LJYV5BbdIf/l3x
         mR5LgBYi7Touf53bOLz7FBcjU2RXG2HrFWemieAbzAjPAaelcD7XIBYDeG7sayiPH8Et
         2VM/Y8V/JewunofHBIz+cEiUzIjcKcmkWHl7sQxj7rC/+XQZ0Wk9fFs6acgI49IugFJ/
         1n3imPLM2+IIB8fRcvi8UntT5wYwB3NaT3g/mCsP3KRV9zqkLs3263NGoc7ABtFcfU+D
         xtscTExLZ2rBwDpKOPFl5isegIjhMo6nIZsglOtAizqLdE78HkjtoyoW1BKJ2LnZlP3e
         CI9g==
X-Forwarded-Encrypted: i=1; AL+hErG/fl7gra6AwRBkELST6qu9mTxvW2ILxoith5bfGl6Iz4NRXg4mZCThDe93JrP4Kfxj/Zm8t6VkTgC2ODg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/gj6HBPcHzciZNqDID4bZ+ZEYEA64OvATmhcszsIyH+smp+qQE
	Ho7QomdXyjEWXoiDP8p1bsKzZhkTX8ergLMmfQr2uvtQjGDmdU3QexqMSkhHGYLZ/Fo=
X-Gm-Gg: AYBFou3mBvOBAPycq5SntmNOmazFyUUwKKkinsJ6Zf2co11IHyq6miYV5xKMM8t2AxU
	J7anpJ70jLuRdjfDNjHavD92jVkIdw1iAvAHl5imO31UuQ6Ta0rvfbZLlzx3kZcENenN8iYC9hc
	NAFjzptCC7Rw/YTRxmM3BOLi7230JnAhpipKCxSDnd7UjUIzSSs+/BIy4vTEs0d36cw/MzBWFax
	Ac5ufFZ/i85urLNjjOWQGladjWkPw+RhOCGqDDWItFRFe6Engo9WPIGgEg8RMPHkMF+suVBvtPH
	ayT05vOMBXClBlR30nA+1M+m7apACszR6SMd+x8CjMYOrcGxY3U/kU4tdfM0kDRLRnnxYzSOx01
	OkvGIPWVaYSD1/150Ynx9DQcut0fmyfao+Xuog2u5+kSgv7c8U6NTIEKBTUCvStPTqlFgZRxHz9
	zHKAh0O/XMnUO1JRKzmvyhAP10RWLKP4/mSZH3fuX+PgFck2P4JECbkZB2E8lX3tmaH8Doy1YBA
	5bTjI4zz29dOlhCWFoa+PYI9xV6qccwgHzsIkO0F9uRJ9fT8CRsaMzm27r8tgQAXWEkkgYsHPQb
	PkSjU8eshthJ2rCtJ96NG2Y0E9pvEvKCjfDP91X9CUxivXEYuX9RBsvpGew=
X-Received: by 2002:a05:7301:2024:b0:36a:18e2:64c with SMTP id 5a478bee46e88-379655d3d12mr9319544eec.11.1794764187185;
        Sun, 15 Nov 2026 09:36:27 -0800 (PST)
Received: from medusa.lab.kspace.sh ([2607:fb90:9c20:35a5::cb18])
        by smtp.googlemail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm35343144eec.19.2026.11.15.09.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 09:36:26 -0800 (PST)
Date: Sun, 15 Nov 2026 09:36:18 -0800
From: Mohamed Khalfella <mkhalfella@purestorage.com>
To: Zhu Yanjun <yanjun.zhu@linux.dev>
Cc: Zhu Yanjun <zyjzyj2000@gmail.com>, Jason Gunthorpe <jgg@ziepe.ca>,
	Leon Romanovsky <leon@kernel.org>, linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] RDMA/rxe: Do not re-execute completed local ops after a
 retry
Message-ID: <20261115173618.GD34016-mkhalfella@purestorage.com>
References: <20261113230831.2682071-1-mkhalfella@purestorage.com>
 <e432178a-6e73-4096-9f59-5c5d2bc9d682@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e432178a-6e73-4096-9f59-5c5d2bc9d682@linux.dev>

On Sat 2026-11-14 11:05:39 -0800, Zhu Yanjun wrote:
> 
> 在 2026/11/13 15:08, Mohamed Khalfella 写道:
> > Local operations (IB_WR_REG_MR, IB_WR_LOCAL_INV, IB_WR_BIND_MW) are
> > executed inline by rxe_requester() through rxe_do_local_ops(), which
> > marks the wqe wqe_state_done and advances qp->req.wqe_index past it.
> > Unlike wire operations, nothing is posted to the network and no ack is
> > expected.
> >
> > The completer only consumes wqes from the head of the send queue, in
> > order. A done local op wqe therefore stays in the queue until every
> > older wqe has completed, so it can sit behind a SEND or RDMA WRITE that
> > is still waiting for an ack. With nvme-rdma, which posts REG_MR + SEND
> > for every I/O, the queue regularly looks like:
> >
> >    SEND(A) pending, REG_MR(B) done, SEND(B) pending, REG_MR(C) done ...
> >
> > When a retransmit timeout fires or a NAK arrives, req_retry() rewinds
> > qp->req.wqe_index to the consumer so that every unacked wqe is resent.
> > Its loop skips wqe_state_done entries when resetting DMA state, but
> > rxe_requester() itself has no such check. After the rewind it walks
> > forward through the queue, reaches REG_MR(B), sees WR_LOCAL_OP_MASK and
> > calls rxe_do_local_ops() on it a second time.
> >
> > rxe_reg_fast_mr() rejects the repeated registration because the MR is
> > already RXE_MR_STATE_VALID, not FREE. The wqe is given
> > IB_WC_LOC_QP_OP_ERR and the QP is moved to the error state. The
> > completer then flushes the entire send queue with IB_WC_WR_FLUSH_ERR,
> > including the wqe that failed, so the consumer never sees the real
> > error status. nvme-rdma logs only "SEND ... failed with status WR
> > flushed (5)" and tears down the controller.
> >
> > Any packet loss that triggers a retry while a later request is queued
> > is enough to hit this. On a soft-RoCE setup with a few hundred lost
> > frames per run every controller reconnect traced back to the same
> > rxe_dbg_mr() line:
> >
> >    rxe1: mr#776 rxe_reg_fast_mr:  mr->lkey = 0x3084c not free
> >
> > Skip local op wqes that are already done when the requester reaches
> > them again after a rewind. Advance wqe_index past them exactly as a
> > successful execution would and continue with the next wqe. The MR keeps
> > its registered state and the completer still reports the wqe in order
> > with its original status. Only local ops can be in wqe_state_done ahead
> > of the consumer on an RC QP, since wire operations stay pending until
> > acked, so the check cannot match anything else.
> >
> > Fixes: 001345339f4c ("RDMA/rxe: Separate HW and SW l/rkeys")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Mohamed Khalfella <mkhalfella@purestorage.com>
> > ---
> >   drivers/infiniband/sw/rxe/rxe_req.c | 14 ++++++++++++++
> >   1 file changed, 14 insertions(+)
> >
> > diff --git a/drivers/infiniband/sw/rxe/rxe_req.c b/drivers/infiniband/sw/rxe/rxe_req.c
> > index 4f353abd76f5..fdb55366d668 100644
> > --- a/drivers/infiniband/sw/rxe/rxe_req.c
> > +++ b/drivers/infiniband/sw/rxe/rxe_req.c
> > @@ -723,6 +723,20 @@ int rxe_requester(struct rxe_qp *qp)
> >   		goto err;
> >   	}
> >   
> > +	/*
> > +	 * A retry rewinds wqe_index to the send queue consumer. Local
> > +	 * operations that were already executed may still sit in the
> > +	 * queue behind an unacked wqe waiting for in-order completion.
> > +	 * Re-executing them fails (e.g. REG_MR on an MR that is no
> > +	 * longer free) and would move the QP to the error state, so
> > +	 * skip them instead.
> > +	 */
> > +	if ((wqe->mask & WR_LOCAL_OP_MASK) &&
> > +	    wqe->state == wqe_state_done) {
> > +		qp->req.wqe_index = queue_next_index(q, qp->req.wqe_index);
> > +		goto done;
> > +	}
> 
> I understand the need for this check to prevent already-completed local 
> operations from
> 
> being re-executed after a retry rewinds the WQE index.
> 
> However, this check is currently placed in the common `rxe_requester()` 
> path, so it is evaluated
> 
> for every WQE, including normal SEND and RDMA WRITE operations.
> 
> Since this condition is only relevant when a retry causes the requester 
> to revisit an already-completed
> 
> local operation, it is expected to be very rare in the normal execution 
> path.
> 
> Could we move this check into the existing `WR_LOCAL_OP_MASK` handling 
> path, or at least mark
> 
> the condition with `unlikely()`?
> 
> I would prefer moving it into the local operation handling path, if the 
> control flow allows it, so that normal wire
> 
> operations do not pay the cost of an additional state check.
> 
> This would keep the fix while minimizing its impact on the common fast path.

diff --git a/drivers/infiniband/sw/rxe/rxe_req.c b/drivers/infiniband/sw/rxe/rxe_req.c
index 12d03f390b09..8bd1f9b1ce06 100644
--- a/drivers/infiniband/sw/rxe/rxe_req.c
+++ b/drivers/infiniband/sw/rxe/rxe_req.c
@@ -707,6 +707,13 @@ int rxe_requester(struct rxe_qp *qp)
 	}
 
 	if (wqe->mask & WR_LOCAL_OP_MASK) {
+		/* Retry rewinds wqe_index, skip it if already done */
+		if (unlikely(wqe->state == wqe_state_done)) {
+			qp->req.wqe_index = queue_next_index(q,
+						qp->req.wqe_index);
+			goto done;
+		}
+
 		err = rxe_do_local_ops(qp, wqe);
 		if (unlikely(err))
 			goto err;

Does something like the diff above work?

Also, sashiko marked a high severity issue [1] in this version of the
patch. I am not familiar with this codebase enough to know if this is a
real issue introduced by this change or not.

Is the issue reported by sashiko real?
If yes, is it introduced by this patch?

1- https://lore.kernel.org/all/sashiko-outbox-213867@kernel.org/

Thanks,
Mohamed Khalfella
