Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794117619;
	b=IJ62kthjFkZaPpXlvRW7gPHaSJkWxd7eGQ/yedRfUbjeh9ltKhhJsoP0yuSigb0FSwJp
	 r8EtyT4nYr5O60XeQPXVg/DvRqIjNMmV/xDLgTX+DfQVRxuKz+0/3airqUaJTsEPZH+2N
	 JSOmijvj/br3vSHCue0RnRBWOTdl+Vm/npWigUMiUxrlJ55LuU+XZOXC0/BcZx9TDb6js
	 IDB/tnPYVlx3ObKdlCzhibxyTeGwODrPd8zNXGt+i65zNCGCIx2B45Nv2VoRrXF9XOHAt
	 NSXJW/yjcNrITJJFMzOr02a78GT/0ILUQNnw2d7H4kX2teUB1elP+noHRNk++8ZCfLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794117619;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=v2y1yaggoH6p1mGRTKD+i49Hl5+O8T2kFeVCtW/lYKQ=;
	b=eH66iYUs2l6tP6ySN11cOBvchlnOhu/BDnLOH4hQoM6xvgMcvzb6Biv1FqpDASOQBMRI
	 OpRrFDAyCNQ0XsKs8RcX6kn/zV08faou0x4iRxKbOKRhfH6z+uin2gtIK8Cw144IYi9po
	 1iAw9PYgVKZtYf6pnptOU9Xl7S+6D0/NGx4FBkn/9ZLKnByezTIYRzPT88i3eVg5ty05U
	 HWb+P3uSQDobheuGHCTpFpOjlokKICuN5yUT50SJjaSuTHI7XIs4SamiJBpR6QLK7Egvo
	 UNDEQWiITLTFQW/c+NJhsMONNyRhiGoZ27mNeUlTz/NbGwiuhwYx+XfO5EYiDGDWLCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=VR6TPNP2;
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E6C1606A31D
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 06:00:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E6C1606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=VR6TPNP2
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36cec75d8caso336371eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 22:00:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794117618; x=1794722418; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v2y1yaggoH6p1mGRTKD+i49Hl5+O8T2kFeVCtW/lYKQ=;
        b=VR6TPNP2W/7NeMlUTdv+0HadAVpPaFEh3xJQIyfe02Rs0o0PKxi18SJY/p2C6DR1ab
         8a/14vStMKeYbZSUSLxOq4ScgM7LWS8MMXRoXGObI/U3uEDZ9BJ4BW+0txHBP0d5zwbn
         Rfj5yVBKHd20YUA0/wX9GkTmgNA3ZVmyeB48EahpLG0asD2ACevgPbXFnaAcGS9nCsvY
         uzHfzN3QaaTPgWrS9u/e2wk0RROoFWbrLqIJPyaJP9rEHeHgcAU+E9SCyMOCBm4QRWQC
         GZs5lNpKdhEdwXQcoUDlNUhK409+8X6JIp70j3UVbxEU2A75WeRnsWM9D5/bAVsOT4vi
         SaOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794117618; x=1794722418;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v2y1yaggoH6p1mGRTKD+i49Hl5+O8T2kFeVCtW/lYKQ=;
        b=hfJLpVrc4I4tHhWaYHJmoQgC64XpUxGilX8BJ0bOItNfCziiIAjaFpOhJcddCCFQgr
         n8qfeU5P/zigDIOFLdMVqRxe5TIWYJQUp5dvwhHH5dKD5rnwcpo3ygQ6Zfabh3A7d7xx
         fruFUDnDV+hd0X6Kd1wdCul/Nzsa+P5hs/Ug0C+GY15dkAF+5h1XvQPFwdMlr9yoLiXU
         eUuBUqI+iJWrzCpiu67bobEAFqOUPLKrI3CVjo3jHH3smfEdEyKRXx9qwu8o9tZqdhBd
         q5ugNSm/4BeUOhkHbmyYoAr1u1/jf+XhEXy4CSz5xrhqDw3LyPt7/h6J+BDv9wd2xQrv
         J+Lw==
X-Forwarded-Encrypted: i=1; AKwUvBwwEZO9qVnqqN3bQck/Q4qQH8VZkyvhVbk5m/X1jc9kcBMPxftjLWhHLTwnbuYoaUE55fyhUmD6ROXW3pU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8c8kPRW8zl4rVz1V7DTEwPgX7Vk9dnRDhfms+4HJ+JGQN5WIle
	avQO9Cayi/8Inlea54EidjqsfD4R6JMPn4qvt0s5AvglVYoxptZa8HkPybep9bjdw44SqI6jo09
	sIs3Y2DDbR0JC+6Qv4fXWb+ohBA==
X-Received: from dycoy13.prod.google.com ([2002:a05:7301:fc0d:b0:35c:eb2a:8c31])
 (user=almasrymina job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7022:264b:b0:13c:f65c:d5b5 with SMTP id a92af1059eb24-1b269a6631dmr4891275c88.3.1794117617306;
 Sat, 07 Nov 2026 22:00:17 -0800 (PST)
Date: Sun,  8 Nov 2026 06:00:11 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
Message-ID: <20261108060016.2131509-1-almasrymina@google.com>
Subject: [PATCH net-next v2 0/5] net: deprecate skb->pp_recycle and skb_mark_for_recycle()
From: Mina Almasry <almasrymina@google.com>
To: netdev@vger.kernel.org
Cc: Mina Almasry <almasrymina@google.com>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Neal Cardwell <ncardwell@google.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>, Pavel Begunkov <asml.silence@gmail.com>, 
	Bobby Eshleman <bobbyeshleman@meta.com>, Stanislav Fomichev <sdf@fomichev.me>, linux-kernel@vger.kernel.org, 
	Steffen Klassert <steffen.klassert@secunet.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	Willem de Bruijn <willemb@google.com>, John Fastabend <john.fastabend@gmail.com>, 
	Sabrina Dubroca <sd@queasysnail.net>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowangio@gmail.com>, 
	"=?UTF-8?q?Eugenio=20P=C3=A9rez?=" <eperezma@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Johannes Berg <johannes@sipsolutions.net>, Byungchul Park <byungchul@sk.com>, Zi Yan <ziy@nvidia.com>, 
	virtualization@lists.linux.dev, linux-mm@kvack.org, bpf@vger.kernel.org, 
	linux-wireless@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Wen Gu <guwen@linux.alibaba.com>, 
	Philo Lu <lulie@linux.alibaba.com>, Justin Chen <justin.chen@broadcom.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Vikas Gupta <vikas.gupta@broadcom.com>, 
	Michael Chan <michael.chan@broadcom.com>, Pavan Chebbi <pavan.chebbi@broadcom.com>, 
	Doug Berger <opendmb@gmail.com>, Nicolai Buchwitz <nb@tipi-net.de>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Satish Kharat <satishkh@cisco.com>, 
	Wei Fang <wei.fang@nxp.com>, Frank Li <frank.li@nxp.com>, Shenwei Wang <shenwei.wang@nxp.com>, 
	Joshua Washington <joshwash@google.com>, Harshitha Ramamurthy <hramamurthy@google.com>, 
	Jijie Shao <shaojijie@huawei.com>, Jian Shen <shenjian15@huawei.com>, 
	Fan Gong <gongfan1@huawei.com>, Tony Nguyen <anthony.l.nguyen@intel.com>, 
	Przemek Kitszel <przemyslaw.kitszel@intel.com>, Marcin Wojtas <marcin.s.wojtas@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Sunil Goutham <sgoutham@marvell.com>, 
	Geetha sowjanya <gakula@marvell.com>, Ratheesh Kannoth <rkannoth@marvell.com>, 
	Subbaraya Sundeep <sbhatta@marvell.com>, Bharat Bhushan <bbhushan2@marvell.com>, 
	Felix Fietkau <nbd@nbd.name>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Tariq Toukan <tariqt@nvidia.com>, 
	Saeed Mahameed <saeedm@nvidia.com>, Mark Bloch <mbloch@nvidia.com>, Leon Romanovsky <leon@kernel.org>, 
	Ido Schimmel <idosch@nvidia.com>, Petr Machata <petrm@nvidia.com>, 
	Horatiu Vultur <horatiu.vultur@microchip.com>, UNGLinuxDriver@microchip.com, 
	Daniel Machon <daniel.machon@microchip.com>, Steen Hegelund <Steen.Hegelund@microchip.com>, 
	Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Yibo Dong <dong100@mucse.com>, 
	Brett Creeley <brett.creeley@amd.com>, Justin Lai <justinlai0215@realtek.com>, 
	Larry Chiu <larry.chiu@realtek.com>, 
	"=?UTF-8?q?Niklas=20S=C3=B6derlund?=" <niklas.soderlund@ragnatech.se>, Paul Barker <paul@pbarker.dev>, 
	Masahisa Kojima <kojima.masahisa@socionext.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Siddharth Vadapalli <s-vadapalli@ti.com>, Roger Quadros <rogerq@kernel.org>, 
	MD Danish Anwar <danishanwar@ti.com>, Jiawen Wu <jiawenwu@trustnetic.com>, 
	Mengyuan Lou <mengyuanlou@net-swift.com>, Ronak Doshi <ronak.doshi@broadcom.com>, 
	Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Juergen Gross <jgross@suse.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Jordan Rhee <jordanrhee@google.com>, 
	Ankit Garg <nktgrg@google.com>, Tim Hostetler <thostet@google.com>, 
	Eric Joyner <eric.joyner@amd.com>, Prabu Thayalan <prabu.ponrajthayalan@amd.com>, 
	"Nikhil P. Rao" <nikhil.rao@amd.com>, Chintan Vankar <c-vankar@ti.com>, 
	Nora Schiffer <nora.schiffer@ew.tq-group.com>, Alexander Sverdlin <alex@sverdlin.org>, 
	Kevin Hao <haokexin@gmail.com>, Karl Mehltretter <kmehltretter@gmail.com>, 
	Aleksandr Loktionov <aleksandr.loktionov@intel.com>, Meghana Malladi <m-malladi@ti.com>, 
	Jacob Keller <jacob.e.keller@intel.com>, StanleyYP Wang <StanleyYP.Wang@mediatek.com>, 
	linux-doc@vger.kernel.org, imx@lists.linux.dev, linux-rdma@vger.kernel.org, 
	linux-hyperv@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-omap@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Remove the per-SKB skb->pp_recycle bitfield and skb_mark_for_recycle()
helper, and reference-count netmems directly by their underlying type
via netmem_is_pp() inside netmem_inc_ref() and netmem_dec_ref().

Establish the invariant that pp_ref_count is only incremented by callers
that already hold an active pp_ref_count (>= 1) on that netmem, and a
raw page_ref_count is never converted into a pp_ref_count:
- Detach page_pool pages in tcp_zerocopy_receive() before mapping them
  into userspace via vm_insert_pages(), so userspace VMAs and subsequent
  GUP callers (such as MSG_ZEROCOPY or vmsplice()) never observe an
  active page_pool page.
- Fall back to copying in tls_push_data() when MSG_SPLICE_PAGES
  encounters a page_pool page, since kTLS device offload record->frags[]
  tracks pages via raw struct page references.
- Keep page_pool_unref_netmem(), napi_pp_get_page(), napi_pp_put_page(),
  and __page_pool_put_page() free of 0 -> 1 pp_ref_count conversion
  workarounds or extra barriers, preserving the non-atomic
  page_pool_unref_netmem() fast path unchanged.

bench_page_pool_simple results (5-iteration interleaved UML runs):
- no-softirq-page_pool01 (fast-path cache recycle): 40 cycles (20.3 ns)
  baseline vs 30-31 cycles (15.3 ns) patched (~9-10 cycles / -24.7%
  improvement over baseline: using __netmem_to_page() in
  page_pool_netmem_is_exclusively_owned() and
  __page_pool_page_can_be_recycled() after checking netmem_is_net_iov()
  eliminates two redundant WARN_ON_ONCE() expansions and out-of-line
  netmem_to_page() calls per recycle).
- no-softirq-page_pool02 (ptr_ring recycle): 81 cycles (40.7 ns)
  baseline vs 74 cycles (37.2 ns) patched (~7 cycles / -8.6%
  improvement over baseline).
- no-softirq-page_pool03 (slow page-allocator path with elevated
  page_ref_count): 458-461 cycles (230.0 ns) baseline vs 454-455 cycles
  (227.6 ns) patched (~5 cycles / -1.0% improvement over baseline).

This series simplifies SKB and netmem reference counting:
- Reclaims 1 bit from struct sk_buff (skb->pp_recycle).
- Unifies reference counting of SKB fragment netmems and regular netmems
  under netmem_inc_ref() and netmem_dec_ref(), eliminating the separate
  skb_netmem_ref(), skb_netmem_unref(), and skb_mark_for_recycle() APIs.
- Removes 95 net lines across 65 files (339 insertions, 434 deletions).

1/5: net: skbuff: skip managed zerocopy frags in skb_frag_ref()
2/5: net: skbuff: refcount spliced page_pool frags via skb_pipe_buf_ops
3/5: tcp: detach page_pool pages before mapping in tcp_zerocopy_receive()
4/5: net: remove skb->pp_recycle and consolidate netmem refcounting
5/5: net: remove skb_mark_for_recycle()

v1 -> v2:
- Patch 2/5: Check page_ref_count(compound_head(buf->page)) <= 0 with
  WARN_ON_ONCE() in skb_pipe_buf_get() to guard against refcount
  overflow, and fall back to copying in tls_push_data() when
  MSG_SPLICE_PAGES encounters a page_pool page so kTLS device offload
  never converts a raw page_ref_count into a pp_ref_count.
- Patch 3/5: Replace zerocopy_fill_skb_from_iter() refcount conversion
  with detaching page_pool pages up front in tcp_zerocopy_receive()
  before vm_insert_pages().
- Patch 4/5: Keep net/tls/ record->frags[] and fallback scatterlists on
  get_page()/put_page() to match mlx5 tx_sync_info_get(), and restore
  page_pool_unref_netmem(), napi_pp_get_page(), napi_pp_put_page(), and
  __page_pool_put_page() to their clean baseline non-RMW fast paths.
- v1:
  https://lore.kernel.org/netdev/20261103211424.127627-1-almasrymina@google.com/

Notes on Medium/Low Sashiko findings intentionally skipped:
- Patch 1/5 (Low): iptfs_output_queued() skb_zcopy_managed() check does
  not carry a separate Fixes: tag as it is part of this net-next
  refactoring series.
- Patch 3/5 (Medium): can_map_frag() requires page_pool_ref_count == 1,
  so drivers holding an undrained fragment bias (e.g. mlx5 mpwqe, fbnic)
  fall back to copying in tcp_zerocopy_receive() (documented in commit
  message; detaching requires holding the sole pp_ref_count).
- Patch 3/5 (Low): page_pool_ref_count() naming kept to mirror
  page_ref_count().
- Patch 4/5 (Medium): skb_irq_freeable() in netpoll_zap_completion_queue()
  does not check netmem_is_pp() (pre-existing for forwarded pp_recycle=1
  RX SKBs; documented in commit message Caveats).
- Patch 4/5 (Low): napi_pp_get_page() and napi_pp_put_page() remain
  out-of-line exported functions in net/core/skbuff.c.

Mina Almasry (5):
  net: skbuff: skip managed zerocopy frags in skb_frag_ref()
  net: skbuff: refcount spliced page_pool frags via skb_pipe_buf_ops
  tcp: detach page_pool pages before mapping in tcp_zerocopy_receive()
  net: remove skb->pp_recycle and consolidate netmem refcounting
  net: remove skb_mark_for_recycle()

 Documentation/networking/page_pool.rst        |   1 -
 drivers/net/ethernet/airoha/airoha_eth.c      |   1 -
 drivers/net/ethernet/alibaba/eea/eea_rx.c     |   3 -
 .../net/ethernet/broadcom/asp2/bcmasp_intf.c  |   1 -
 .../net/ethernet/broadcom/bnge/bnge_txrx.c    |   5 -
 drivers/net/ethernet/broadcom/bnxt/bnxt.c     |   8 -
 .../net/ethernet/broadcom/genet/bcmgenet.c    |   2 -
 drivers/net/ethernet/cisco/enic/enic_rq.c     |   1 -
 drivers/net/ethernet/engleder/tsnep_main.c    |   2 -
 drivers/net/ethernet/freescale/fec_main.c     |   1 -
 drivers/net/ethernet/google/gve/gve_rx_dqo.c  |   9 -
 .../net/ethernet/hisilicon/hibmcge/hbg_txrx.c |   1 -
 .../net/ethernet/hisilicon/hns3/hns3_enet.c   |   6 -
 .../net/ethernet/huawei/hinic3/hinic3_rx.c    |   1 -
 drivers/net/ethernet/intel/iavf/iavf_txrx.c   |   2 -
 drivers/net/ethernet/marvell/mvneta.c         |   2 -
 .../net/ethernet/marvell/mvpp2/mvpp2_main.c   |   2 -
 .../marvell/octeontx2/nic/otx2_txrx.c         |   1 -
 drivers/net/ethernet/mediatek/mtk_eth_soc.c   |   1 -
 drivers/net/ethernet/mellanox/mlx4/en_rx.c    |   1 -
 .../net/ethernet/mellanox/mlx5/core/en_rx.c   |   8 -
 drivers/net/ethernet/mellanox/mlxsw/pci.c     |   2 -
 .../ethernet/microchip/lan966x/lan966x_fdma.c |   2 -
 .../microchip/sparx5/lan969x/lan969x_fdma.c   |   1 -
 drivers/net/ethernet/microsoft/mana/mana_en.c |   3 -
 .../net/ethernet/mucse/rnpgbe/rnpgbe_lib.c    |   1 -
 .../net/ethernet/pensando/ionic/ionic_txrx.c  |   2 -
 .../net/ethernet/realtek/rtase/rtase_main.c   |   1 -
 drivers/net/ethernet/renesas/ravb_main.c      |   2 -
 drivers/net/ethernet/socionext/netsec.c       |   1 -
 .../net/ethernet/stmicro/stmmac/stmmac_main.c |   1 -
 drivers/net/ethernet/tehuti/tn40.c            |   1 -
 drivers/net/ethernet/ti/am65-cpsw-nuss.c      |   1 -
 drivers/net/ethernet/ti/cpsw.c                |   2 -
 drivers/net/ethernet/ti/cpsw_new.c            |   2 -
 drivers/net/ethernet/ti/icssg/icssg_common.c  |   1 -
 drivers/net/ethernet/wangxun/libwx/wx_lib.c   |   2 -
 drivers/net/veth.c                            |   3 +-
 drivers/net/virtio_net.c                      |  16 +-
 drivers/net/vmxnet3/vmxnet3_xdp.c             |   1 -
 drivers/net/wireless/mediatek/mt76/dma.c      |   1 -
 .../net/wireless/mediatek/mt76/mt7996/mac.c   |   1 -
 drivers/net/wireless/mediatek/mt76/npu.c      |   1 -
 drivers/net/wireless/mediatek/mt76/usb.c      |   1 -
 drivers/net/xen-netfront.c                    |   1 -
 include/linux/mm.h                            |   2 +-
 include/linux/skbuff.h                        |  12 +-
 include/linux/skbuff_ref.h                    |  60 +---
 include/net/netmem.h                          |  37 ++-
 include/net/page_pool/helpers.h               |  25 +-
 net/core/datagram.c                           |   2 +
 net/core/gro.c                                |   9 -
 net/core/net_test.c                           | 274 ++++++++----------
 net/core/netmem_priv.h                        |  21 +-
 net/core/page_pool.c                          |   6 +-
 net/core/skbuff.c                             |  74 ++---
 net/core/xdp.c                                |  13 +-
 net/ipv4/esp4.c                               |  11 +-
 net/ipv4/tcp.c                                |  44 ++-
 net/ipv6/esp6.c                               |  11 +-
 net/tls/tls_device.c                          |   8 +-
 net/tls/tls_device_fallback.c                 |   2 +-
 net/wireless/util.c                           |  31 +-
 net/xfrm/trace_iptfs.h                        |   6 +-
 net/xfrm/xfrm_iptfs.c                         |  16 +-
 65 files changed, 339 insertions(+), 434 deletions(-)


base-commit: 7b6ab4dbc156e2f96419715130b3d5738a306c93
-- 
2.56.0.455.g6c5a503b38-goog

