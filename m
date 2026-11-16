Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794837315;
	b=zQpeyOIrWDETD765pJEk9ChzBllfKP9JVVEMw7TX81LsMxyyG92+l5snBVPziXNGlKii
	 ELGh6nipSrlu3OThV20uFQqS8OXWW6JkYUfiHZR3L0mJDax0PCyPawCAV/tsOv/W5Y2E5
	 4nu7CPiuy/Bfg1++geqm/b9T4NRcXuk5j8V17oIloGk3DYl2yzR+ostAbJ/MDw/S8KqoQ
	 cNEEWEJC2qwihN0dZ+FEfAge2zymoyFwOEcz0TcVyO7pSJ4nLokv4jpGPnRGkjVVUMnsB
	 i0dKIu4O8V8a+rVZKuGr/hXiuzrXvv9hWWUW2KjbVTqguPYMxExJxj9wFooNXvF55Sg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794837315;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=/9wpVOZwBGSpML6w0dv4cYL1XU5LV1ARw6J+/sHWHb0=;
	b=bqEUhC4VNir21WVHIET+wfc9VuIwCy2MmsfjanEmnW/V3vZRjOgohaKq2SGXvRp2kp4l
	 gU3Ua/cFDfG4ivahDFfItOieIYegolh9zGMlHyy6LEWf48YbuF1TrcaI80ZUY3NqNUKc/
	 KyiLqodCPtx3ypaFbDqokm059T87t/oY4cggaVKureQSnNq0N9Tx4zoHzEv3N8yGSrG1j
	 QngihiAXrfV773fxKLGL+WIMw+km0xqR80jOUnExKGsMuAXkDv23yxu/9/uiQfzeVoo7l
	 bZjARYxCicihfM3wG60K/C3OqSoqdp4uJwvUWrTuVBURWvWlmVUPAyGSFWNgTE4K+mA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mvlVuGLh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3AEB606B776;
	Mon, 16 Nov 2026 13:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mvlVuGLh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAFB21F000C6;
	Mon, 16 Nov 2026 13:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794837315;
	bh=/9wpVOZwBGSpML6w0dv4cYL1XU5LV1ARw6J+/sHWHb0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=mvlVuGLhcyGi7pAoTuxUMiIQyCd3zRVYl5MiRg6ctusklhUTZeRBAo4MNRhPo3TXs
	 k/nEiSNBmjN1dYGeXuH6jTxtW5KMCEYLKLi22kYknDeLMZIDzSIaIv6g8BDQ5cdI2U
	 TDQVb9KkyIW0G52uiB5/BMIa9vBMU0WvYVp7V1A6lKzd6nWW2YhMaaPqSKHbxwkRfX
	 OanWHJo3p/T0kbxybLLBKPVDmdcVbhTqACMD4iIKEwBHQDcTRVVEg502Z+rpIwhPQJ
	 F67+VQFCO48mebdcsy9gwmqGglhHs7WzYIJxsq1u2ZP9uWD3pFLv+yIaJ2hGsGtTue
	 pVf2S/D3kAa/w==
Subject:
 Re: [PATCH net v2] octeontx2-af: fix TX scheduler queue index width for CN20K
From: netdev-bot+sashiko@kernel.org
To: kmahammadraf@marvell.com
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org, sgoutham@marvell.com,
 rkannoth@marvell.com, gakula@marvell.com, sbhatta@marvell.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, skoteshwar@marvell.com
Date: Mon, 16 Nov 2026 13:55:14 +0000
Message-ID: <179483731427.3136.10912668844633725634@kernel.org>
In-Reply-To: <20261112121907.2576520-1-kmahammadraf@marvell.com>
References: <20261112121907.2576520-1-kmahammadraf@marvell.com>
X-sashiko-severity: High
Content-Type: text/plain; charset="utf-8"
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

Thank you for your contribution! Sashiko AI review found 4 potential
issue(s) to consider.

Critical: 0 · High: 2 · Medium: 0 · Low: 2

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The fix is incomplete: on CN20K, the TX scheduler PARENT index
  is still cut to 9 bits in the SMQ flush hierarchy walk and in the…
- [High] octeontx2-af: username handle used in Signed-off-by trailer
- [Low] The Fixes tags point at commits that did not introduce the CN20K
  defect.
- [Low] The commit message is inaccurate about what the patch changes.

--

octeontx2-af: fix TX scheduler queue index width for CN20K

This commit widens TXSCHQ_IDX_MASK to 11 bits and NIX_TX_SCHQ_MASK to
bits 26:0. On CN20K it also decodes the parent index in
is_txschq_hierarchy_valid() with 11 bits. The goal is to support CN20K's
up to 2K TX scheduler queues per level.

> Without this, queue IDs above 1023 can be truncated on CN20K, which can
> cause invalid hierarchy validation and incorrect TX scheduler register
> access for higher queue indices.

[Severity: Low]
Is this description accurate? Before this patch, is_txschq_hierarchy_valid()
masked the parent with 0x1FF. So parent indices above 511 were truncated,
not only those above 1023.

On CN20K, the pre-patch effect also looks more like a bypass of the
ownership check than invalid validation. A PF/VF could write parent =
512 + owned_index. is_valid_txschq() would then check owned_index, and
the hardware would attach the queue to a parent the PF/VF might not own.

TXSCHQ_IDX_MASK in mbox.h and NIX_TX_SCHQ_MASK in rvu_nix.c are also
widened on every silicon, not only on CN20K. On OcteonTX2/CN10K, a
mailbox reg with bit 26 set used to be masked off and accepted. Now it
decodes to schq >= 1024 and is rejected with NIX_AF_INVAL_TXSCHQ_CFG.

Could the commit message mention the 512 boundary, the ownership impact,
and the mask change on all silicon?

> Fixes: b279bbb3314e ("octeontx2-af: NIX Tx scheduler queue config support")
> Fixes: d06411632e80 ("octeontx2-af: enable tx shaping feature for 96xx C0")

[Severity: Low]
Are these the right commits to blame? Both were written for OcteonTX2
96xx, where the 10-bit index and 9-bit parent widths were correct. The
patch itself keeps 0x1FF for non-CN20K silicon.

The fix also depends on is_cn20k(), which was added by commit
25d51ebf0f54f9 ("octeontx2: Set appropriate PF, VF masks and shifts based
on silicon"). Stable trees picked from these tags go back to v4.20. There
the patch would not build, and it would fix nothing because CN20K is not
supported in those trees.

Should the tags point at the commit(s) that added CN20K NIX/TX scheduler
support instead?

[ ... ]

> diff --git a/drivers/net/ethernet/marvell/octeontx2/af/rvu_nix.c b/drivers/net/ethernet/marvell/octeontx2/af/rvu_nix.c
> index 29559db689290..72d13d34829d4 100644
> --- a/drivers/net/ethernet/marvell/octeontx2/af/rvu_nix.c
> +++ b/drivers/net/ethernet/marvell/octeontx2/af/rvu_nix.c
> @@ -2755,7 +2755,7 @@ static bool is_txschq_hierarchy_valid(struct rvu *rvu, u16 pcifunc, int blkaddr,
>  	if (!is_valid_txschq(rvu, blkaddr, lvl, pcifunc, schq))
>  		return false;
>  
> -	parent = (regval >> 16) & 0x1FF;
> +	parent = (regval >> 16) & (is_cn20k(rvu->pdev) ? 0x7FF : 0x1FF);

[Severity: High]
The first Signed-off-by uses kmahammadraf, which is just the local part
of the email address rather than a person's name.
Documentation/process/submitting-patches.rst asks that the DCO be
certified under a known identity. A handle copied from the address does
not really say who is certifying the patch. Could this be respun with
the contributor's name as they are normally known, for example
"Firstname Lastname <kmahammadraf@marvell.com>"?

The trailer chain also looks inconsistent. The From: line credits Satha
Rao as the author, but the mail was sent from kmahammadraf@marvell.com
and that sign-off comes first. If kmahammadraf co-developed the change,
a Co-developed-by tag is needed with it. If they are only handling the
submission, their Signed-off-by should come after the author's.

[Severity: High]
Is this fix complete for CN20K? After this change,
is_txschq_hierarchy_valid() accepts parents of 512 and above. But
nix_smq_flush_fill_ctx() still decodes the same PARENT field with a 9-bit
mask:

drivers/net/ethernet/marvell/octeontx2/af/rvu_nix.c:nix_smq_flush_fill_ctx() {
    ...
		/* get parent txsch node */
		if (parent_off) {
			regval = rvu_read64(rvu, blkaddr, parent_off);
			schq = (regval >> 16) & 0x1FF;
		}
    ...
}

Take an MDQ whose TL4 parent is 600. The walk would continue from TL4 88,
and every level above that would be read from an unrelated node.

nix_smq_flush() then uses this context in three places:

  - nix_smq_flush_enadis_rate() zeroes CIR/PIR on the wrong
    MDQ/TL4/TL3/TL2/TL1 queues and later restores them. Those queues may
    belong to another PF/VF. The shapers on the real path stay armed.

  - tl2_tl3_link_schq is taken from the truncated context. So
    NIX_AF_TL3_TL2X_LINKX_CFG[ENA] is cleared and set on an unrelated
    queue, and the real link stays enabled.

  - nix_smq_flush_enadis_xoff() skips the wrong TL2 and matches PF_FUNC
    against pfvf_map[] of the wrong TL2. It can then XOFF TL2 queues it
    should leave alone.

Can the rvu_poll_reg() on SMQX_CFG bit 49 then time out with "SMQ flush
failed"?

A PF/VF can reach this by writing NIX_AF_SMQX_CFG with BIT(49) set:

rvu_mbox_handler_nix_txschq_cfg()
  nix_smq_flush()
    nix_smq_flush_fill_ctx()

The same flush also runs on teardown through nix_txschq_free() and
nix_txschq_free_one().

The shared masks in rvu_reg.h also keep their old widths:

#define NIX_AF_MDQ_PARENT_MASK         GENMASK_ULL(24, 16)
#define NIX_AF_TL4_PARENT_MASK         GENMASK_ULL(23, 16)
#define NIX_AF_TL3_PARENT_MASK         GENMASK_ULL(23, 16)
#define NIX_AF_TL2_PARENT_MASK         GENMASK_ULL(20, 16)

print_tm_tree() in rvu_debugfs.c walks the parent chain with these masks.
On CN20K it would read the PARENT registers of the wrong queues and print
the wrong tree.

The commit message says this fixes "incorrect TX scheduler register access
for higher queue indices". The same truncation seems to remain in these
decoders, though.

Would a single silicon-aware PARENT field width shared by all of these
decoders work better than an inline mask in is_txschq_hierarchy_valid()?

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261112121907.2576520-1-kmahammadraf%40marvell.com
