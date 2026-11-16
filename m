Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794837282;
	b=UrQst3620yDb/m5BSOZk28e9ptWfuki3I7/EUddvuaT8rro+52F/SKfPeksdP2qZf7+u
	 ZixPmHrdutzRqr1htelP0VQLxlF3PVNCJupf7SrsJbLzNp0S5aQuvcY2rixT+8TdbBlyu
	 vMV0gSUU9LxIYuXac96tZzZcuS6i8oxO3xwFLJElr9GppMbmLwqTNofwVlC7YD7mRUQ4J
	 yOaBImf+qmFQriNoZyIC/c8d9jp44Ikd3IY+tJ2FPibh70ON14J/jjTdwF/toFliqION3
	 Yagj9SU4qlgMtAF/4rpVJkxBjuV0SBlX1skFCc2HssPFeXEocTAHQ1xCo/FY83JDP9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794837282;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=ny/zdXTeW2FqtF788MZhitd5whAVSls5SMpGj+3FEDc=;
	b=rdudqBAayp9QVBohv9eLzwWS8VSD6q9fh0uY8jWMc+9Nuo44TS2mBeZ7f5toSM/vK2Di
	 p9akWpN1Pr40H92ZpBhGTeSSXHA/1qG8HsTc0+/hD7vYIpx5EWXz3OboAtEi7TGYIlmNd
	 76hrM2WlBKgtPILvVK5X+Fk8eMnpzWy0dLcLmnLOxfokPgBf75xGOxJaPZUPO5jFW5KFF
	 l3IB8FcfYMR7wCskVvVMLnbxCJpbR1z/uI0BY0sTQ9Q2voR3/dSt5rK65Vj4M74zP9FaT
	 gbB/9iV85bBkKKt6JvjhKani0JhOVhQVdWwM3X13DaCk7zvnvdC55i/yNKUABjrVQCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="l3k/0SIm";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BA0960A261C;
	Mon, 16 Nov 2026 13:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l3k/0SIm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0C821F00925;
	Mon, 16 Nov 2026 13:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794837282;
	bh=ny/zdXTeW2FqtF788MZhitd5whAVSls5SMpGj+3FEDc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=l3k/0SImcJU/3QacxzGcU+n6zwsR4KoveT+NhHEgDNdAcn+N09+s8UlFw86ZVjJmW
	 46mhJJbbl4f9va5oeLKJM/G9WtBV4rFQzRWBNWNK6QArt/LnHt56F23m5E+dMMzQsf
	 mIJLtxZOWJCJkUvYXEUuSfZSeshQq93s1MbH+SQQP53iFwpqaU4I4Wwx6HVDv41MOp
	 z7xJVSV1B9WfHUL4GsGdIzmdKyN8eAyHXaYl9tQKEy83u9NNwuaJlDKFHU0um5LCWp
	 S8TcT8yvzPy7aJTvFEVPMB4iscFux35rHIj7eq47yGWdOJvYFp7IJOpM7dcvrFjwhM
	 Ez7GBbSmqTuDg==
Subject: Re: [PATCH v34 net-next 2/8] net/nebula-matrix: add common resource
 implementation
From: netdev-bot+sashiko@kernel.org
To: illusion.wang@nebula-matrix.com
Cc: dimon.zhao@nebula-matrix.com, alvin.wang@nebula-matrix.com,
 sam.chen@nebula-matrix.com, netdev@vger.kernel.org, kuba@kernel.org,
 andrew+netdev@lunn.ch, pabeni@redhat.com, edumazet@google.com,
 horms@kernel.org, linux-kernel@vger.kernel.org
Date: Mon, 16 Nov 2026 13:54:41 +0000
Message-ID: <179483728123.3136.1375698838793821096@kernel.org>
In-Reply-To: <20261112094925.6098-3-illusion.wang@nebula-matrix.com>
References: <20261112094925.6098-3-illusion.wang@nebula-matrix.com>
X-sashiko-severity: Medium
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

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 2

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] nbl_res_ctrl_dev_sriov_info_init() builds the per-PF BDF table
  from two sources.
- [Low] The commit message says this patch manages 'SR-IOV BDF', and the
  new table is named `struct nbl_sriov_info` and filled by…
- [Low] net/nebula-matrix: single-implementation ops tables and dead NULL
  checks

--

net/nebula-matrix: add common resource implementation

This commit adds a chip-agnostic resource layer for the Nebula Matrix nbl
driver. At probe time on the control PF, it validates the firmware PF mask
and builds the per-PF BDF, Ethernet port and VSI base id tables. It also
adds VSI/PF/Eth ID conversion helpers.

> diff --git a/drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_resource_leonis.c b/drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_resource_leonis.c
> new file mode 100644
> index 0000000000000..d19d87ae044e4
> --- /dev/null
> +++ b/drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_resource_leonis.c
> @@ -0,0 +1,338 @@

[ ... ]

> +static int nbl_res_ctrl_dev_sriov_info_init(struct nbl_resource_mgt *res_mgt)
> +{
> +	struct nbl_hw_ops *hw_ops = res_mgt->hw_ops_tbl->ops;
> +	struct nbl_hw_mgt *p = res_mgt->hw_ops_tbl->priv;
> +	struct nbl_common_info *common = res_mgt->common;
> +	struct nbl_sriov_info *sriov_info;
> +	struct device *dev = common->dev;
> +	u8 hw_bus = 0;
> +	u16 function;
> +	u16 func_id;
> +
> +	hw_ops->get_real_bus(p, &hw_bus);

[ ... ]

> +	common->hw_bus = hw_bus;
> +
> +	for (func_id = 0; func_id < common->max_pf; func_id++) {
> +		sriov_info = res_mgt->resource_info->sriov_info + func_id;
> +		function = common->function + func_id;
> +		sriov_info->bdf = PCI_DEVID(common->hw_bus,
> +					    PCI_DEVFN(common->devid, function));

[Severity: Medium]
Can this BDF fail to match any real requester ID when the OS view of the
topology is different from the physical one?

The bus number is the device's own captured value, but the slot number
comes from the OS view:

nbl_hw_get_real_bus() {
	nbl_hw_rd_regs_lock(hw_mgt, NBL_PCIE_HOST_TL_CFG_BUSDEV, &data,
			    sizeof(data));
	*bus = FIELD_GET(NBL_PCIE_BUS_MASK, data);
}

nbl_core_init() {
	...
	common->devid = PCI_SLOT(pdev->devfn);
	...
}

Reading the bus from hardware instead of using pdev->bus->number only
matters when the two can differ, for example when PF0 is passed through to
a VM. In that case pdev->devfn is also the guest's view. The guest slot is
often non-zero, while a physical endpoint under a root port is device 0.

NBL_PCIE_BUS_MASK is GENMASK(12, 5), so bits [4:0] of TL_CFG_BUSDEV are
not used. Do those bits hold the captured device number? If so, should
that value be used here instead of common->devid?

Later patches in the series program this combination into hardware:
nbl_res_func_id_to_bdf() passes sriov_info->bdf to cfg_msix_info().
nbl_res_intr_cfg_msix_map() passes common->hw_bus, common->devid and
common->function to cfg_msix_map(). nbl_dev_setup_chan_qinfo() passes
common->hw_bus and common->devid to cfg_chan_qinfo_map_table().

With a mismatched device number, would MSI-X delivery and mailbox routing
be misrouted on such a setup?

The function number looks fine. has_ctrl is only set when
PCI_FUNC(pdev->devfn) == 0, so common->function + func_id equals the
absolute PF id.

> +	}
> +
> +	return 0;
> +}

[ ... ]

> diff --git a/drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_resource.h b/drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_resource.h
> new file mode 100644
> index 0000000000000..ae0a3d33198dc
> --- /dev/null
> +++ b/drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_resource.h
> @@ -0,0 +1,69 @@

[ ... ]

> +/* --------- INFO ---------- */
> +struct nbl_sriov_info {
> +	unsigned int bdf;
> +};

[Severity: Low]
This isn't a bug, but the naming doesn't match the contents. The commit
message says the layer manages "SR-IOV BDF". The table is named struct
nbl_sriov_info and is filled by nbl_res_ctrl_dev_sriov_info_init(). It
only holds one PCI_DEVID per physical PF, since the loop runs func_id
from 0 to common->max_pf and VFs are never included.

Would a PF-specific name, and matching commit message wording, describe
this table better?

Also, nothing in this commit reads sriov_info or common->hw_bus. The later
patch "net/nebula-matrix: add intr resource implementation" adds a reader,
nbl_res_func_id_to_bdf(). The SR-IOV naming is still there at the end of
the series.

[ ... ]

> @@ -0,0 +1,338 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2026 Nebula Matrix Limited.
> + */
> +#include <linux/device.h>
> +#include <linux/pci.h>
> +#include <linux/bits.h>
> +#include "nbl_resource_leonis.h"
> +
> +static struct nbl_resource_ops res_ops = {
> +	.get_vsi_id = nbl_res_func_id_to_vsi_id,
> +	.get_eth_id = nbl_res_get_eth_id,
> +};
> +
> +static struct nbl_resource_mgt *
> +nbl_res_setup_res_mgt(struct nbl_common_info *common)
> +{
> +	struct nbl_resource_info *resource_info;
> +	struct nbl_resource_mgt *res_mgt;
> +	struct device *dev = common->dev;
> +
> +	res_mgt = devm_kzalloc(dev, sizeof(*res_mgt), GFP_KERNEL);
> +	if (!res_mgt)
> +		return ERR_PTR(-ENOMEM);
> +	res_mgt->common = common;
> +
> +	resource_info =
> +		devm_kzalloc(dev, sizeof(*resource_info), GFP_KERNEL);
> +	if (!resource_info)
> +		return ERR_PTR(-ENOMEM);
> +	res_mgt->resource_info = resource_info;
> +
> +	return res_mgt;
> +}
> +
> +static struct nbl_resource_ops_tbl *
> +nbl_res_setup_ops(struct device *dev, struct nbl_resource_mgt *res_mgt)
> +{
> +	struct nbl_resource_ops_tbl *res_ops_tbl;
> +
> +	res_ops_tbl = devm_kzalloc(dev, sizeof(*res_ops_tbl), GFP_KERNEL);
> +	if (!res_ops_tbl)
> +		return ERR_PTR(-ENOMEM);
> +	if (!res_ops.get_vsi_id || !res_ops.get_eth_id)
> +		return ERR_PTR(-EINVAL);
> +	res_ops_tbl->ops = &res_ops;
> +	res_ops_tbl->priv = res_mgt;
> +
> +	return res_ops_tbl;
> +}
> +
> +static int nbl_res_ctrl_dev_setup_eth_info(struct nbl_resource_mgt *res_mgt)
> +{
> +	struct nbl_hw_ops *hw_ops = res_mgt->hw_ops_tbl->ops;
> +	struct device *dev = res_mgt->common->dev;
> +	struct nbl_eth_info *eth_info;
> +	u32 eth_bitmap = 0;
> +	u32 eth_num = 0;
> +	u32 fw_port_num;
> +	int i;
> +
> +	eth_info = devm_kzalloc(dev, sizeof(*eth_info), GFP_KERNEL);
> +	if (!eth_info)
> +		return -ENOMEM;
> +
> +	res_mgt->resource_info->eth_info = eth_info;
> +
> +	fw_port_num = res_mgt->resource_info->board_info.eth_num;
> +
> +	hw_ops->get_fw_eth_map(res_mgt->hw_ops_tbl->priv, &eth_bitmap);
> +	if (eth_bitmap & ~((1 << NBL_MAX_ETHERNET) - 1)) {
> +		dev_err(dev, "FW reported invalid eth_bitmap 0x%x\n",
> +			eth_bitmap);
> +		return -EINVAL;
> +	}
> +	if (fw_port_num != hweight32(eth_bitmap)) {
> +		dev_err(dev, "FW inconsistency: port_num=%u, bitmap=0x%x\n",
> +			fw_port_num, eth_bitmap);
> +		return -EINVAL;
> +	}
> +	/*
> +	 * Firmware is ready before probe. Valid port counts are 1/2/4;
> +	 * 0 (invalid config), 3 (unsupported topology), and >4 (exceeds
> +	 * hardware max) are all rejected with -EINVAL.
> +	 */
> +	if (fw_port_num == 0 || fw_port_num == 3 ||
> +	    fw_port_num > NBL_MAX_ETHERNET) {
> +		dev_err(dev, "FW reports %u Ethernet ports, unsupported (valid: 1/2/4)\n",
> +			fw_port_num);
> +		return -EINVAL;
> +	}
> +	eth_info->eth_num = fw_port_num;
> +	/* Intentional design constraint: each PF maps to exactly one
> +	 * Ethernet port. This couples PF identity to port identity
> +	 * and is required by nbl_res_get_eth_id() which indexes
> +	 * eth_info->eth_id[] by relative PF id.
> +	 */
> +	if (res_mgt->common->max_pf != eth_info->eth_num) {
> +		dev_err(dev, "Invalid PF-to-port topology: max_pf=%u, eth_num=%u\n",
> +			res_mgt->common->max_pf, eth_info->eth_num);
> +		return -EINVAL;
> +	}
> +
> +	/*
> +	 * Any subset of valid bitmap bits is accepted (e.g. 0/1, 0/2,
> +	 * 1/3, etc.).  Firmware only needs to report the correct count
> +	 * of active ports; no hard-coded fixed bit positions required.
> +	 * eth_id[] is filled in ascending bitmap-bit order, so the Nth
> +	 * relative PF owns the Nth logical port (max_pf == eth_num is
> +	 * enforced above).
> +	 */
> +	for (i = 0; i < NBL_MAX_ETHERNET; i++) {
> +		if ((1 << i) & eth_bitmap) {
> +			eth_info->eth_id[eth_num] = i;
> +			eth_num++;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static int nbl_res_ctrl_dev_sriov_info_init(struct nbl_resource_mgt *res_mgt)
> +{
> +	struct nbl_hw_ops *hw_ops = res_mgt->hw_ops_tbl->ops;
> +	struct nbl_hw_mgt *p = res_mgt->hw_ops_tbl->priv;
> +	struct nbl_common_info *common = res_mgt->common;
> +	struct nbl_sriov_info *sriov_info;
> +	struct device *dev = common->dev;
> +	u8 hw_bus = 0;
> +	u16 function;
> +	u16 func_id;
> +
> +	hw_ops->get_real_bus(p, &hw_bus);
> +	if (common->function + common->max_pf > NBL_MAX_PF) {
> +		dev_err(dev, "PF count exceeds available function space\n");
> +		return -EINVAL;
> +	}
> +	sriov_info = devm_kcalloc(dev, common->max_pf,
> +				  sizeof(*sriov_info), GFP_KERNEL);
> +	if (!sriov_info)
> +		return -ENOMEM;
> +
> +	res_mgt->resource_info->sriov_info = sriov_info;
> +	/*
> +	 * Real bus number of the control PF;
> +	 * the BDF table below is built from it.
> +	 */
> +	common->hw_bus = hw_bus;
> +
> +	for (func_id = 0; func_id < common->max_pf; func_id++) {
> +		sriov_info = res_mgt->resource_info->sriov_info + func_id;
> +		function = common->function + func_id;
> +		sriov_info->bdf = PCI_DEVID(common->hw_bus,
> +					    PCI_DEVFN(common->devid, function));
> +	}
> +
> +	return 0;
> +}
> +
> +static int nbl_res_ctrl_dev_vsi_info_init(struct nbl_resource_mgt *res_mgt)
> +{
> +	struct nbl_eth_info *eth_info = res_mgt->resource_info->eth_info;
> +	struct nbl_common_info *common = res_mgt->common;
> +	struct device *dev = common->dev;
> +	struct nbl_vsi_info *vsi_info;
> +	int i;
> +
> +	vsi_info = devm_kzalloc(dev, sizeof(*vsi_info), GFP_KERNEL);
> +	if (!vsi_info)
> +		return -ENOMEM;
> +
> +	res_mgt->resource_info->vsi_info = vsi_info;
> +	/*
> +	 * case 1 one port(1pf)
> +	 * pf0 (NBL_VSI_SERV_PF_DATA_TYPE) vsi is 0
> +	 * case 2 two port(2pf)
> +	 * pf0,pf1(NBL_VSI_SERV_PF_DATA_TYPE) vsi is 0,512
> +	 * case 3 four port(4pf)
> +	 * pf0,pf1,pf2,pf3(NBL_VSI_SERV_PF_DATA_TYPE) vsi is 0,256,512,768
> +	 */
> +
> +	vsi_info->num = eth_info->eth_num;
> +	/*
> +	 * eth_num can be 1/2/4:
> +	 * - 2/4 ports use dedicated gap constants;
> +	 * - 1 port falls back to NBL_DEFAULT_VSI_ID_GAP (1024).
> +	 * All three values produce valid base_id offsets.
> +	 */
> +	for (i = 0; i < vsi_info->num; i++) {
> +		vsi_info->serv_info[i][NBL_VSI_SERV_PF_DATA_TYPE].base_id =
> +			i * nbl_vsi_id_gap(vsi_info->num);
> +		vsi_info->serv_info[i][NBL_VSI_SERV_PF_DATA_TYPE].num = 1;
> +	}
> +
> +	return 0;
> +}
> +
> +static int nbl_res_init_pf_num(struct nbl_resource_mgt *res_mgt)
> +{
> +	struct nbl_hw_ops *hw_ops = res_mgt->hw_ops_tbl->ops;
> +	u32 exp_contiguous_mask = 0;
> +	u32 pf_mask = 0;
> +	u32 pf_num = 0;
> +	int i;
> +
> +	hw_ops->get_host_pf_mask(res_mgt->hw_ops_tbl->priv, &pf_mask);
> +
> +	/*
> +	 * k_pf_mask register rule:
> +	 * bit N == 0  -> PF#N enabled; bit N == 1 -> PF#N masked out.
> +	 * Hardware constraint: bit0 is PF0's mask bit; driver requires
> +	 * PF0 enabled as management PF, so bit0 must be clear.
> +	 * All-zero pf_mask means all PF0~PF7 are enabled, which is unsupported
> +	 * by the driver
> +	 *
> +	 * Product firmware constraint: only 3 valid configurations supported:
> +	 * 1 PF  (PF0 only): pf_num = 1, mask = 0xfe
> +	 * 2 PFs (PF0,PF1):  pf_num = 2, mask = 0xfc
> +	 * 4 PFs (PF0~PF3): pf_num = 4, mask = 0xf0
> +	 * No other PF count or sparse/non-contiguous PF layout is allowed.
> +	 *
> +	 * This is the only validation of the mask in the driver.  The channel
> +	 * layer reads the same raw register value to program the mailbox
> +	 * QINFO table and assumes the layout checked here, so it depends on
> +	 * this running first.  What actually orders the two is not layer
> +	 * setup - nbl_chan_init_common() runs before nbl_res_init_leonis() -
> +	 * but the QINFO programming point: it is reached from nbl_dev_init()
> +	 * via nbl_dev_setup_chan_qinfo(), long after resource init has
> +	 * finished, so the mask has already been validated by then.
> +	 */
> +	for (i = 0; i < NBL_MAX_PF; i++) {
> +		if (!(pf_mask & (1 << i)))
> +			pf_num++;
> +	}
> +
> +	/*
> +	 * Sanity check: enabled PFs must be contiguous starting from PF0.
> +	 * Current resource framework uses relative PF id, sparse PF layout
> +	 * will cause mismatch between resource layer and hardware func_id.
> +	 */
> +	for (i = 0; i < pf_num; i++)
> +		exp_contiguous_mask |= BIT(i);
> +	if ((pf_mask & exp_contiguous_mask) != 0) {
> +		dev_err(res_mgt->common->dev,
> +			"pf_mask 0x%08x: non-contiguous enabled PF, unsupported\n",
> +			pf_mask);
> +		return -EINVAL;
> +	}
> +
> +	/* Only allow product-specified PF count: 1 / 2 / 4 */
> +	if (pf_num != 1 && pf_num != 2 && pf_num != 4) {
> +		dev_err(res_mgt->common->dev,
> +			"Invalid pf_num=%u (mask=0x%08x), only 1/2/4 PFs supported\n",
> +			pf_num, pf_mask);
> +		return -EINVAL;
> +	}
> +
> +	res_mgt->common->max_pf = pf_num;
> +
> +	return 0;
> +}
> +
> +static void nbl_res_init_board_info(struct nbl_resource_mgt *res_mgt)
> +{
> +	struct nbl_hw_ops *hw_ops = res_mgt->hw_ops_tbl->ops;
> +
> +	hw_ops->get_board_info(res_mgt->hw_ops_tbl->priv,
> +			       &res_mgt->resource_info->board_info);
> +}
> +
> +static int nbl_res_start(struct nbl_resource_mgt *res_mgt)
> +{
> +	struct nbl_common_info *common = res_mgt->common;
> +	int ret = 0;
> +
> +	if (common->has_ctrl) {
> +		nbl_res_init_board_info(res_mgt);
> +
> +		ret = nbl_res_init_pf_num(res_mgt);
> +		if (ret)
> +			return ret;
> +
> +		ret = nbl_res_ctrl_dev_sriov_info_init(res_mgt);
> +		if (ret)
> +			return ret;
> +
> +		ret = nbl_res_ctrl_dev_setup_eth_info(res_mgt);
> +		if (ret)
> +			return ret;
> +
> +		ret = nbl_res_ctrl_dev_vsi_info_init(res_mgt);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +int nbl_res_init_leonis(struct nbl_adapter *adap)
> +{
> +	struct nbl_channel_ops_tbl *chan_ops_tbl = adap->intf.channel_ops_tbl;
> +	struct nbl_hw_ops_tbl *hw_ops_tbl = adap->intf.hw_ops_tbl;
> +	struct nbl_common_info *common = &adap->common;
> +	struct nbl_resource_ops_tbl *res_ops_tbl;
> +	struct device *dev = &adap->pdev->dev;
> +	struct nbl_resource_mgt *res_mgt;
> +	int ret;
> +
> +	res_mgt = nbl_res_setup_res_mgt(common);
> +	if (IS_ERR(res_mgt)) {
> +		ret = PTR_ERR(res_mgt);
> +		return ret;
> +	}
> +	res_mgt->chan_ops_tbl = chan_ops_tbl;
> +	res_mgt->hw_ops_tbl = hw_ops_tbl;
> +
> +	ret = nbl_res_start(res_mgt);
> +	if (ret)
> +		return ret;
> +
> +	res_ops_tbl = nbl_res_setup_ops(dev, res_mgt);
> +	if (IS_ERR(res_ops_tbl)) {
> +		ret = PTR_ERR(res_ops_tbl);
> +		return ret;
> +	}
> +	adap->intf.resource_ops_tbl = res_ops_tbl;
> +	adap->core.res_mgt = res_mgt;
> +
> +	return 0;
> +}
> +
> +void nbl_res_remove_leonis(struct nbl_adapter *adap)
> +{
> +	/*
> +	 * No resource release here because all memory uses devm managed
> +	 * allocation
> +	 */
> +}

[Severity: Low]
This isn't a bug, but this looks like the indirection that was asked
to be removed on v22:

https://lore.kernel.org/r/20260730182956.5cbe613a@kernel.org

struct nbl_resource_ops has exactly one instance, res_ops in
nbl_resource_leonis.c, and no later patch in the series adds a second
one. Both of its members are chip-agnostic helpers in nbl_resource.c:
nbl_res_func_id_to_vsi_id() and nbl_res_get_eth_id(). The commit
message says leonis and draco will share this resource logic. If that
is the plan, why does it need a per-chip ops table at all? Could the
callers call the shared helpers directly?

The NULL checks in nbl_res_setup_ops() and nbl_hw_setup_ops() test
members of static tables that are initialized a few lines above in the
same file. The commit message already says they can never trigger. A
future draco table would be a separate object with its own setup
function, so these checks would not protect it either. Is there a
reason to keep them, and to keep the devm_kzalloc() of the ops_tbl
wrapper that comes with them?

Also, res_mgt->chan_ops_tbl is assigned in nbl_res_init_leonis(), but
nothing reads it in this patch or in the rest of the series. Could it
be added in the patch that first uses it?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261112094925.6098-1-illusion.wang%40nebula-matrix.com
