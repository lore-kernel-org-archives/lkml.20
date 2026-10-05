Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA6C48640B
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 13:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791206859; cv=none; b=nzI/WFntlTMrrk0nGYQliqZrxIX+qW0vIJBICciBT9XeO+kU2v3vojVaSH/s0NpLPW2E/vY5bG7jIuvoI//7DBTURIipmZemZFzpl3OhC+Fm7hAzffgLkaG/Hea7EvBieSdcGWHGhtRgxNEDp7ZJpJYFrP8dSeE2PwRqcJ4PK70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791206859; c=relaxed/simple;
	bh=r6ZRYKg6n0znee49d3Np2ffRCdfaqtHaBrhNvX0INgo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DrJLsD+fqJ2TKDdtOb7hNBuxpzPV+T3IP18sLS6PQxq+cpgsh2OzYPmXJNwOt4VaYN9afq1AdhZvsm2A/nMXS45dF563A3UYBdTKNQTxJyGch/svRj8ugZueIE9H2QlP6CBtrvr7lvym8MC6qhHwyb2M4BZVDL05Q3/CHHJWjns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HgYcoBHU; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HgYcoBHU"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2dd58e1e2c7so6632575ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 06:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791206849; x=1791811649; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RZ23UM/r/7jCgi85nywLMWzbpiSS1mIXS7a54cP8xb4=;
        b=HgYcoBHUdj+qFb/th+cE3tfCccqg/659rfI/nWZx8OgpxmHeK8oeBu1EVyO+aDAsvv
         F93d9Y2VuAnX3ggDiepewmQ62O+xridXanJEWDqDj82e78cbEoO491PzAU+oP4aKreBy
         07C+lZRRIPLwcV/x2JXszxBjTnbXuutUFCyp3edtDS+lNltmXrJ8glpoCulkUrAtYzeZ
         sld1OqMMiDjXttUnA+m1mvhipQad+CTS18HSiHBoffNJezFJbhbbMXu6T/IyKnECsPLt
         c1htW9btVhqa+0Imh3n2f1I7IXLOplBJ9An7xUFOTfm+VwBoifAE3Pc2sE+AY4EgMYPg
         By9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791206849; x=1791811649;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RZ23UM/r/7jCgi85nywLMWzbpiSS1mIXS7a54cP8xb4=;
        b=HjnErOKZd/a9lQB9JY6byZSLpwLRIHX/rikU4Cb0eddQCswYWKedBOkCNqExYKEeaI
         OaQKSEHo5BKTZLyY86AOgnQBmu6Sx/MShBQijVvlgrstCmkYz4PBBmlNX7qnu/lp3KXK
         /CKCilYYnAT5oPRb//pK4p0C24yd9+BVy803s+T/I/2Xh8GEA+ZDvnNLYOOX6rP41lHN
         iqUWH4k7MuMABY8OV1MDdFeukYt5uROTM1OqtiEBGw41ilDX2zldZDCUshScgp9GmQlI
         l14O1eyDfryPtLFn3s8EFit2Mz4QcMzAlkvMpvI4dKlTb+VlQJSZCAHEM8lFR0qSHhWb
         /u3g==
X-Forwarded-Encrypted: i=1; AKwUvBw/tPPlHM5e4WxmWa+L96UQWCipQunSL3vC3qk2zZCpBA9jRanMbFH6soLI0f5WgWPYPDLeixJp4TVnO1Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYJNLNitk9KamWRAAutGUXcwADYWNaXLKBNGEHHXWAtTk7Ck9fkd
	YST4TtCFHUamNOEAg6KdeUuqL3Ym6YsTfccyICR+F8b6/cxz5HTY9h5N
X-Gm-Gg: AYBFou3cRYqnZ5Uz1HQaYqSYz2FXM8j+4EAqPP4l3KJ+nDutT73gXi0XF1uGLdCueEc
	Bpnzrm1MMOetOJF1hUp9Oxq/oM/HjQmVJa0lKML4Z2rIhfyGu7IpP5H/QN1kdfKsf4hT1kKGGc6
	+6wAq/1vKaSavZq3QL0jvodekkUq6rvJq/haeJXEwC0mQbra39AhyAQcL8pvRAezg06FfhiHv3J
	DbSkOsJwnPi1sgUa43n26+1VPy88rKBofhe6PejxMjcJ7rVtyIiGFvsXGF0+MAVcvjGqk01fz5P
	STW89xIDXbEYVLMGktVFvQ/L/6NATL4NajVdcCzSc7XbIAnu/fMMeXdhnaP3uUaebOmuz0PKtHT
	2idF1B6bMZUCV2/WGJBsn+2d5vVwTmAzFgQdanQYDcLO7idmGY85kmalNONNltoskQhEL+HodUV
	IWPiarp8AoT0l9yPfPL7k+eur15+x9m5o3/Gw8LB1RX0H1X0nFstjlBIzdvEa2ZrI1BdfRn1rIX
	m3bO6mN7lunQtgjLGx7bQbHoA+dcVKCAJ4=
X-Received: by 2002:a17:902:dad1:b0:2dd:b6e7:ac1b with SMTP id d9443c01a7336-2e49b0bf34cmr103029815ad.2.1791206848642;
        Mon, 05 Oct 2026 06:27:28 -0700 (PDT)
Received: from cccc-E3.. (124-218-129-85.cm.dynamic.apol.com.tw. [124.218.129.85])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e5a5cae8besm7602875ad.22.2026.10.05.06.27.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 06:27:28 -0700 (PDT)
From: Scott Lee <dsix123@gmail.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
	Logan Gunthorpe <logang@deltatee.com>
Cc: linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Scott Lee <dsix123@gmail.com>
Subject: [PATCH] PCI/P2PDMA: Add Intel Haswell client host bridge to the whitelist
Date: Mon,  5 Oct 2026 21:26:51 +0800
Message-ID: <20261005132651.18368-1-dsix123@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

P2P DMA between two devices that do not share an upstream bridge is only
permitted when the traffic goes through a host bridge that is listed in
pci_p2pdma_whitelist[] with REQ_SAME_HOST_BRIDGE.

The Haswell client host bridge (8086:0c08, e.g. H97/H87/B85) is not in that
list, and cpu_supports_p2pdma() returns false on Intel, so
calc_map_type_and_dist() refuses P2P for any pair of devices behind
different root ports of the same host bridge, even though that root complex
handles the traffic correctly.

Measured on an ASUS H97-PRO with a Xeon E3-1231 v3 (Haswell, 8086:0c08 at
00:00.0) and two GPUs on separate root ports of that host bridge
(00:01.0 and 00:1c.4):

  - pci_p2pdma_distance() < 0 before the change; peer access granted after
    (amdgpu stops reporting "PCIe P2P access ... is not supported by the
    chipset" and hipDeviceCanAccessPeer() returns true in both directions)
  - 10 KB cross-device copy: 62-75 us vs 130-131 us host-staged (~2x)
  - 512 MB cross-device copy verified byte-wise against a known buffer:
    no corruption
  - tensor-parallel LLM inference (>25 GB model across both GPUs):
    +53% tokens/s

REQ_SAME_HOST_BRIDGE is the correct flag here: the two devices share the
upstream bridge (two root ports of one host bridge) rather than sitting
behind a PCIe switch.

This entry only permits P2P DMA to be used on this platform, it does not
force it: the existing checks on ACS redirect, on the map type and on
pci_p2pdma_distance() all still apply. Tested on one board only, so the
usual caveat applies - broad testing on other Haswell boards would be
needed before this can be considered generally safe.

Signed-off-by: Scott Lee <dsix123@gmail.com>
---
# --- evidence from the machine this was tested on (stripped by git am) ---
#
# Hardware: ASUS H97-PRO (BIOS 2906), Xeon E3-1231 v3 (Haswell), 32 GB RAM,
#           2x AMD Radeon RX 9060 XT (16 GB each), no PCIe switch
#
# lspci -nn:
#   00:00.0 Host bridge: Intel 4th Gen Core Processor DRAM Controller [8086:0c08]
#   00:01.0 PCI bridge: CPU PEG port; GPU0 is 0000:03:00.0 behind it
#   00:1c.4 PCI bridge: PCH root port; GPU1 is 0000:09:00.0 behind it
#
# unpatched kernel (7.0.0-34-generic, distro stock):
#   $ sudo dmesg | grep 'not supported by the chipset'
#   amdgpu 0000:09:00.0: PCIe P2P access from peer device 0000:03:00.0 is not
#   supported by the chipset
#
# patched kernel (7.0.0-99-generic, same source tree + only this hunk):
#   $ sudo dmesg | grep 'not supported by the chipset'      (no output)
#   $ python3 p2p_verify.py
#     can_access_peer: True / True
#     peer 512 MiB copy, byte-wise compared against a known buffer: OK
#   $ python3 p2p_latency.py     (10 KiB, HIP events)
#     peer 0->1: 62.1 us    peer 1->0: 74.5 us
#     host 0->1: 130.0 us   host 1->0: 131.0 us
#   $ llama-bench, 27B model split across both GPUs, tensor vs layer split:
#     25.05 +/- 0.91 tok/s vs 16.37 tok/s (+53%), greedy output identical
#
# Note the second GPU sits behind the PCH (Gen2 x4) - the setup still works
# correctly despite the asymmetric and slow link, which is what makes it
# interesting for the whitelist argument.
#
 drivers/pci/p2pdma.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pci/p2pdma.c b/drivers/pci/p2pdma.c
index 9334eb3..4f58564 100644
--- a/drivers/pci/p2pdma.c
+++ b/drivers/pci/p2pdma.c
@@ -545,6 +545,8 @@ static const struct pci_p2pdma_whitelist_entry {
 	/* Intel Xeon E7 v3/Xeon E5 v3/Core i7 */
 	{PCI_VENDOR_ID_INTEL,	0x2f00, REQ_SAME_HOST_BRIDGE},
 	{PCI_VENDOR_ID_INTEL,	0x2f01, REQ_SAME_HOST_BRIDGE},
+	/* Intel Haswell (client) */
+	{PCI_VENDOR_ID_INTEL,	0x0c08, REQ_SAME_HOST_BRIDGE},
 	/* Intel Skylake-E */
 	{PCI_VENDOR_ID_INTEL,	0x2030, 0},
 	{PCI_VENDOR_ID_INTEL,	0x2031, 0},
-- 
2.43.0

