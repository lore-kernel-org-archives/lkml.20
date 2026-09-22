Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61FAB53F6A1
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 12:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790081391; cv=none; b=m6w0daKZRDlJcOaNvZRUKac5RzmCPtwtFEHL1pvEDpj+VQZVtIFYR3X4D2Pn7kFrbOyCot7u4ELSkgq47LD+BpW6MuMnrQwb25udqkBcKIXXJv12LUgCQqI9rzeKMVbBaWT1vNeQX06aJTNRxF37BwUzpg2kydAIBrBfon1CWtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790081391; c=relaxed/simple;
	bh=H77B/1XoUbsQHeqCDGjv35YwEIvkYUiwrSWHUSL0kKQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cP2qzVlVrxrOHkbhstDs0KAhRQ6TU+q2M3ed8zXr8l5f64DfjHn/8Jv33Ll/nq25NjEd3JQfjXtgrRRyT84xkVsFJNLTuc/qCMWApxyioRSEQrweGFN+MhCFA0UZeoQ49CYcprDqI/BRacb/kq3Zw/EKP6tobCSzzrGVC20sXms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=f8LNTFsj; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=NAKPTNG7; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="f8LNTFsj";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="NAKPTNG7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790081388;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BMtW18PYGgs3eeFoZyurBYg14pG+Ej8vE9R6o+NDZ70=;
	b=f8LNTFsjBBwprx81ljPz0eqAFJ8weo5xB6IsBL4zcBVh9rj+BN7P3vIe/70y2UnHaGoAHu
	M0u68Gn42shPOY/0kxqaJcT6TmGju42DPkBaeWaGSDU8KiexuBLgu4tGWvEkOPEsDh79JA
	I/sHLIS6C5DNC5jKou9BUzA9ten+jl4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-189-CnNt-uaaNmea25lv0aWJqA-1; Tue, 22 Sep 2026 08:49:46 -0400
X-MC-Unique: CnNt-uaaNmea25lv0aWJqA-1
X-Mimecast-MFC-AGG-ID: CnNt-uaaNmea25lv0aWJqA_1790081386
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-487038a4a88so1355580f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 05:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790081386; x=1790686186; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BMtW18PYGgs3eeFoZyurBYg14pG+Ej8vE9R6o+NDZ70=;
        b=NAKPTNG7JdTsB6Bxm9bX3sdN5LtnyRqQRgd9sST3DNWU/CQME57S0/v0WwCOBbfKua
         zCJesy6cqYJd9svn1R/c9cJr2XYzZH6aDwWKtZ9n+fmtarn2doDbfZ+uqq2MdSRTJTJ2
         CCX2VrQ3uVm3h0d9uq44pgXcCdjdnesXb+zinP3OamE2eQX6NGazRdV8UCdYOi0JNjkM
         EkAD+Y5Tf4Y8T2AxfkdswCiyIZegK/2/khJ9XEdWSYjm1hU8UYYtNOSC7Nuw0FrSgdE9
         KDL3ayokHFzp6SrnlLqVQJZgBjDpcTmOrxSqumK7oCopNgBjXKpErkdKZD5bq9Fs8hCw
         DbAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790081386; x=1790686186;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BMtW18PYGgs3eeFoZyurBYg14pG+Ej8vE9R6o+NDZ70=;
        b=VrDD/qSCB62x0yDmPdW0+AL7ygH0kdecOGDCASM1UlTo5CFmalIULOoJ0NLhslMyNq
         1BXdl6mXcWhO/OBvS3Y7hk6iVGNx8x/papuYq0VWwBQHOoXKhAHyBOqXAyFQ7lqY+78n
         ig8k91sMiDdO3K+Vtg9hNsDwoQWCgMhxvn2ToxNtP9sRyDqpTFWsj1+LeW0gkJezgoFz
         WegocVNDM3ESgMxIv+xZUuBSk6eBufvGqhRyps7BhGFEA1Xwkhac7mq/BRw+fvfSnEPe
         Zd7lJ6MV3vBFCU3pqKatEqKRHr+Vpds0EEclABmAHO7tdUMBLB8L2E+YgRw2wTDa/xoe
         3XrA==
X-Forwarded-Encrypted: i=1; AKwUvBwtTPl4pj8xipDsT5gPYOjq7HlqN22j7GSayCoI+qdMIx/irkqB7+QV4/wFLow3gxY4zLnU3nQg9IrOWr0=@vger.kernel.org
X-Gm-Message-State: AFuF++m9sMZdhlh6WsVPaooo/hl1duzY3mfO1/kU6M3ljYfZPJsw4Ss1
	AWba/Ix44fxHtDaar7/M3f+Cw/OP7gCFkTAZ5cUX8nzRohaBf4l3ZEWhpny9dfJpzccWJxl5E6O
	Cdi4Z/iUkYjbGR2TsSWM83Kkb7NzgDDTLTapF/718AZzTbzs9NJdfmGSqwIqOU1c+EQ==
X-Gm-Gg: AYBFou2vEM7nrCEbkC/cFvC/yfDFgaTcv4nZ6S3cVD13/ukSkKiSRP1eO/EbLvAQA4I
	Xz6n8+f+Zp/e/uENiCGrv1hwVDpTAACCPH6YtUPs0f//AOq6IPbNRf7ve+g5NGL/SGF8d5nltHC
	12jEfe4NcXNUc8ubzsW5ArjPl/tzu9D2rLXUyhaPJaQhRC/V3ZDvJwWwuyXKwikCn93ATjEDT5F
	z7Kcjel47eG3jdOEPFSdfB2x+XxaoS0+aTz9iNnlKsQwszieeOPSBduuNHiqXNX3UyM8TyuaQhD
	B1e7zToXx1Yu5gaxXtx7Vr47CVswXhUb/8O7krKP+ruiPLaLYngxPz701wTuerQ/dqkX+PG8uI4
	to7xGj0kAi3mW1KlKHrTCk24ErqBdkkPpx35ClCbLU1UDEP9SlFc=
X-Received: by 2002:adf:e19a:0:b0:486:fba3:b95d with SMTP id ffacd0b85a97d-4871e2161fbmr20532334f8f.7.1790081385761;
        Tue, 22 Sep 2026 05:49:45 -0700 (PDT)
X-Received: by 2002:adf:e19a:0:b0:486:fba3:b95d with SMTP id ffacd0b85a97d-4871e2161fbmr20532296f8f.7.1790081385348;
        Tue, 22 Sep 2026 05:49:45 -0700 (PDT)
Received: from sgarzare-redhat (host-82-53-134-131.retail.telecomitalia.it. [82.53.134.131])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48862774882sm5070366f8f.13.2026.09.22.05.49.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 05:49:44 -0700 (PDT)
Date: Tue, 22 Sep 2026 14:49:34 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: =?utf-8?Q?Bart=C5=82omiej?= Dmitruk <bartlomiej.dmitruk@isec.pl>
Cc: Bryan Tan <bryan-bt.tan@broadcom.com>, 
	Vishnu Dasa <vishnu.dasa@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	"Michael S . Tsirkin" <mst@redhat.com>, virtualization@lists.linux.dev, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] vsock/vmci: enforce per-netns mode on the
 datagram receive path
Message-ID: <arJ5LVnY1y0MELJF@sgarzare-redhat>
References: <20260919123208.29032-1-bartlomiej.dmitruk@isec.pl>
 <20260919123208.29032-2-bartlomiej.dmitruk@isec.pl>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260919123208.29032-2-bartlomiej.dmitruk@isec.pl>

On Sat, Sep 19, 2026 at 02:31:57PM +0200, Bartłomiej Dmitruk wrote:
>The send hook vmci_transport_dgram_allow() refuses datagrams when the socket's
>netns is not in global mode (vsock_net_mode_global()), but the receive path
>(vmci_transport_recv_dgram_cb() -> vmci_transport_allow_dgram()) did not, so a
>socket bound in a non-global (local) netns received datagrams from peers it
>could never send to, defeating namespace isolation.
>
>Add the check at the start of the receive decision, before the
>VMADDR_CID_HYPERVISOR short-circuit, so the hypervisor CID is covered too
>(matching the send side).
>
>This was found by code inspection; I do not have VMCI hardware to test on
>(compile-tested only).
>
>Fixes: eafb64f40ca4 ("vsock: add netns to vsock core")
>Signed-off-by: Bartłomiej Dmitruk <bartlomiej.dmitruk@isec.pl>
>Assisted-by: Claude (Anthropic)
>---
>v2: perform the netns check first (before the hypervisor early return) so
>    hypervisor datagrams are also gated in local mode -- the Sashiko AI review
>    noted v1 left that path partially bypassed.
>v1: https://lore.kernel.org/netdev/20260917220225.56200-1-bartlomiej.dmitruk@isec.pl/
>

LGTM, but please add a cover letter to a series with multiple patches.

Stefano

>diff --git a/net/vmw_vsock/vmci_transport.c b/net/vmw_vsock/vmci_transport.c
>--- a/net/vmw_vsock/vmci_transport.c
>+++ b/net/vmw_vsock/vmci_transport.c
>@@ -532,6 +532,14 @@
> static bool vmci_transport_allow_dgram(struct vsock_sock *vsock, u32 peer_cid)
> {
> 	u64 access;
>+
>+	/* Enforce the per-netns mode first, symmetrically with the send hook
>+	 * vmci_transport_dgram_allow(): a socket in a non-global (local) netns
>+	 * must not receive datagrams it could never send (this also covers the
>+	 * hypervisor CID).
>+	 */
>+	if (!vsock_net_mode_global(vsock))
>+		return false;
>
> 	if (VMADDR_CID_HYPERVISOR == peer_cid)
> 		return true;
>

