Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793752770;
	b=zjKmcLOhWhZXOtJUxu4QU6PpmxuGvXVHDYs/gwP5Ocz9P108WbFOL7D+ZwKzTycOGCgt
	 vMwRhVzwywH5a+Vkt6ITO2QjhXNOXCNqQ0kUSvsRy+ILroUCyQxIF6QGBrb2JiQ5nilG9
	 j4xnnWo+jVbba4Mj/+fxwvu2yIcXlsAxhqd+exyVN+QT2pocvNdUTKybLOa44FEzwIkHP
	 tZop6HwL4ZLqnU/xuUv3cSs4TWivYAoIx1Sj+F2yDMIRP67JpYXQChr6E/+BAaJZq2Qow
	 nzLJBQrXv5oMx8+oi+IDgSXjRA1DM9XlmTxUZp7AnTE7BQP7VBerwV6dA31Evf313zA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793752770;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:From:To:Cc:Subject:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=lQ2xOzxsF+CEtv2Z632brvuKrWBZQypDKsxmzWa1C5s=;
	b=wQ/q3QyOHRdePl6Rgt/OWduPovSTJLZ8h00Xi9TdPL65V48gPu8mwO4U2KlDhbe5naez
	 4h73wcTEQCNPcl4yzwddbfEivP3n09PNnJ4aFgCkKDN2XiEiVm0bO8UApON7tC2J89cG+
	 VCDlcmSwNxFgqpYc78sZpDf0pnllT9MABR8Z4BZtLSTkIPdofHPeoVyhrhIoB5hOU5w3Y
	 MVaaYDb7dS5G/Xtw7ZJ1iN0FbJBIW4Io/EdsO/tMItmQ1ZIMdTDpIdi7RVtGApNwVmO9c
	 YlI6wSBTcS+HF82Uc2cdfyNXEAcqQYHFNC8oj5pZJo+U7Lsojv9ofg+qCOXHnqVs5MA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hr+JzZTf;
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02938606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 00:39:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02938606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hr+JzZTf
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2e8246b13cbso967475ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 16:39:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793752769; x=1794357569; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lQ2xOzxsF+CEtv2Z632brvuKrWBZQypDKsxmzWa1C5s=;
        b=hr+JzZTfML76aUBPRMSo/3TW8wG01zPPhuL/+lyor+y27KaG7K0wNq1h4XbItsLlae
         9aQFRKvZAF64WmcAU2FaEbMNIk3lag9vklnCV1nNbvazHFxJvS86TiagPTxFNZsiE0Xs
         vmuzGeSSudENZM5KFICQTPzdSCrbJ9JQ10LroE06YTO1PjeHV/Dey+drr3CWhXurH1oh
         /BkuNs0yz8eGrh5zbvxZUepb3LrXz0S3lsC414wKo84s+rmkO8uiO1APW2AtNOlMixgt
         ht6OtwB6e0WNLNDXQ1ZF55RHYIVaS/nYeFn69hB3sXqqBm+PAgLA4S4QokHq0OhiU7Ro
         6fUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793752769; x=1794357569;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lQ2xOzxsF+CEtv2Z632brvuKrWBZQypDKsxmzWa1C5s=;
        b=ShT7XI9llIIy0caxA8odRx12JvUhn5gusnIxf+X/tFnrJ77m/Om/eGhdf+Rr8rbtfA
         Q60K2CSH47ltXcxWpcBmGRGTIn7oPpqrUZhaWp8tYek1KzSWqdV7ka5jLY25DuF2kHxP
         1MHZotiSNHDJdxGQtLFyxybxDfLBN7xY5rp+siA86iMwihbmYsCNwj0dYkZlfaUMdc0M
         YUD86NtwZVDhzI8TzTgq6eXzdyeR3vFNdvFhw3gtjkrnW2vb/MCbC+0uffd2Lxz84IEE
         LGtlrpAYfKyKibLzw4Fl63kj9hj+VEnionpXskwTIJOiFbrAjvxMDZGsRcjizkhFuhFA
         Ilgw==
X-Forwarded-Encrypted: i=1; AKwUvBxyhC8aqr4Gj2RfwSrgR2BKc3xDoX6bUtPcNd+TlSzpejMyFwhEPLEhGitGy7INn43g7KQn41d9CfEp/pw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/tGreOGMKyJu89Smf8rPOFefzbv7WEnH4WRTSHYvGL5V68LeRc
	wT+ckCtz08+Zc6FPb7sNlmLb5o/IfnFaegz9KoTcyFBzmpblPfCGr4FA
X-Gm-Gg: AYBFou1MXuk2EclfR8W5CTOImzmaGshbsP5kD9nR95bSoYaZ1QqA6VCo7hLO/bGtl3d
	MEhrJxJuTW9mBnGURGp8DfSlzYDrGvsCgj5XIv+KF0SkWfMKW2ZBg2GDNspYm6fW8DAz7y7HA9t
	5A6x9zfWuSlrGxoLZPn4UoWMZLDSTJb74JTCRh24p+XgCOUUD+eM1QL/9b2bswtxLRyxlnMmgza
	weKXCDv7CaZqV1nUkEdvtuY98goWZf/2jScZKM/A9TxkBR+OoC4w4Nkq/HZyWqtv7ui+mFAQcZb
	icwE1Ogj6sFK/YEQpVGgJrIAOkZ6AQX3eC2vQ5zAram9/uiTtu23CE5z9cwaKOBKqbResrWJbHO
	W/JjYHE4WUZ3+4m5hu+02Omig24O8F+LsVVmHsJuw88IB6Gr/pet5V1mpCTgNt1rLUzbW6cPS20
	ebauswApof7Ig2jXuz6EdUQloKYySqy3bS4mMHC2HP/Icdmu5JCPQIFBcB02iIT9iPgRl6inuMA
	TrKMRNwJCIHK3Q9Hap0YaRGGd2BOjqwtacqgYlqrotY4A/TQuM+KMl19/UBd7j/kZ+TyE5rGfjL
	NQpw/mExNuRtRGBCm5o+HD5EmsN/JWZ26DCOag8ToHtkpq4XsFn0PdgHDQSz+kwEwRerw6KtBG+
	rXDd1nEzXj+FzYbtrOyeptgWb+x7qXjAPjzYHS900/yVw1bTm5xtM/es=
X-Received: by 2002:a17:903:2306:b0:2e9:628d:e9c1 with SMTP id d9443c01a7336-2eb364b0c7emr143562815ad.26.1793752769163;
        Tue, 03 Nov 2026 16:39:29 -0800 (PST)
Received: from localhost ([153.61.198.255])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed090f7313sm510055ad.45.2026.11.03.16.39.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 16:39:28 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Nov 2026 00:39:27 +0000
Message-Id: <DMM0ADCEGAAB.2RFNF1ZI5TGWK@gmail.com>
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Antonio Quartulli" <antonio@openvpn.net>, <netdev@vger.kernel.org>
Cc: <saeedm@nvidia.com>, <leon@kernel.org>, <tariqt@nvidia.com>,
 <mbloch@nvidia.com>, <dtatulea@nvidia.com>, <cratiu@nvidia.com>,
 <andrew+netdev@lunn.ch>, <davem@davemloft.net>, <edumazet@kernel.org>,
 <kuba@kernel.org>, <pabeni@redhat.com>, <daniel@iogearbox.net>,
 <hawk@kernel.org>, <john.fastabend@gmail.com>, <sdf@fomichev.me>,
 <linux-rdma@vger.kernel.org>, <bpf@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Antonio Quartulli" <antonio@mandelbit.com>
Subject: Re: [PATCH net-next] net/mlx5e: Prefetch packets of upcoming CQEs
 in the linear MPWQE path
In-Reply-To: <20261103235823.536706-1-antonio@openvpn.net>
References: <20261103235823.536706-1-antonio@openvpn.net>
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Tue, Nov 03, 2026 at 03:58 PM Antonio Quartulli <antonio@openvpn.net> wrote:
> While processing a CQE, look at the CQE MLX5E_RX_PREFETCH_DIST (4) entries
> ahead and, if it is completed, prefetch its packet headers, skb_shared_info
> and page. Also prefetch the CQE twice as far ahead.
>
> Looking ahead requires uncompressed CQEs, so this is enabled only for
> linear striding RQs without CQE compression.

can we prefetch 4 strides ahead without the CQE, like gve_rx() ?
In linear mode a packet takes one stride and HW fills the strides in order.
mlx5e_alloc_rx_mpwqe() allocates all pages of the WQE.
So mlx5e_skb_from_cqe_mpwrq_linear() can compute the address of the packet
4 strides ahead from head_offset and page_idx.

  per packet                 the patch     4 strides ahead
  -------------------------  ------------  ------------------
  CQE reads                  2             1
  dma_rmb()                  2             1
  mlx5e_get_mpw_info()       2             1
  headers, page              prefetch      prefetch
  skb_shared_info            prefetch      no, needs cqe_bcnt
  next CQEs                  prefetch      no
  first 4 strides of a WQE   prefetch      no
  stride is not filled yet   no prefetch   wasted prefetch
  CQE compression            not covered   covered

Then no need for MLX5E_RQ_STATE_PREFETCH_NEXT and mlx5_cqwq_get_cqe_ctr().

Something like this (not even compile tested):

diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en_rx.c b/drivers/net/ethernet/mellanox/mlx5/core/en_rx.c
index 22fea47..31d5bc4 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/en_rx.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/en_rx.c
@@ -2094,6 +2094,29 @@ mlx5e_skb_from_cqe_mpwrq_nonlinear(struct mlx5e_rq *rq, struct mlx5e_mpw_info *w
 	return skb;
 }

+#define MLX5E_RX_PREFETCH_DIST	4
+
+/* A packet takes one stride of a linear MPWQE. The address of the packet
+ * MLX5E_RX_PREFETCH_DIST strides ahead is known without its CQE.
+ */
+static void mlx5e_mpwrq_linear_prefetch(struct mlx5e_rq *rq,
+					struct mlx5e_mpw_info *wi,
+					u32 head_offset, u32 page_idx)
+{
+	struct mlx5e_frag_page *frag_page;
+
+	head_offset += MLX5E_RX_PREFETCH_DIST << rq->mpwqe.log_stride_sz;
+	page_idx += head_offset >> rq->mpwqe.page_shift;
+	if (page_idx >= rq->mpwqe.pages_per_wqe)
+		return;
+
+	head_offset &= BIT(rq->mpwqe.page_shift) - 1;
+	frag_page = &wi->alloc_units.frag_pages[page_idx];
+	prefetch(netmem_to_page(frag_page->netmem));
+	net_prefetch(netmem_address(frag_page->netmem) + head_offset +
+		     rq->buff.headroom);
+}
+
 static struct sk_buff *
 mlx5e_skb_from_cqe_mpwrq_linear(struct mlx5e_rq *rq, struct mlx5e_mpw_info *wi,
 				struct mlx5_cqe64 *cqe, u16 cqe_bcnt, u32 head_offset,
@@ -2114,6 +2137,8 @@ mlx5e_skb_from_cqe_mpwrq_linear(struct mlx5e_rq *rq, struct mlx5e_mpw_info *wi,
 		return NULL;
 	}

+	mlx5e_mpwrq_linear_prefetch(rq, wi, head_offset, page_idx);
+
 	va             = netmem_address(frag_page->netmem) + head_offset;
 	data           = va + rx_headroom;
 	frag_size      = MLX5_SKB_FRAG_SZ(rx_headroom + cqe_bcnt);

> - With XDP, skb_shared_info is not prefetched. XDP_DROP rate, low-rate
>   traffic and multiple queues were not measured.

Pls add XDP_DROP and XDP_TX numbers.
