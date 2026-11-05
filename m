Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=67.231.145.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793912552;
	b=NdSLMKplGYeadcrwbqsB4HuuW9iuKfFKsSRqGXs7f0uKGkPwkiZHpPmf8gPbifkvROg7
	 7Q84LI4f0xaWDxkOl045O7pkeGg2+AI0eNKl5ATIKYiUnsH/D5vBlIdY0Ka3WIvAt8T05
	 +a29ZlhYWnYBCvEhRk9Md9zcLdDlS7czNrIcs7sHZOkJ8HG2fxXq34slWIrHITS04s+Ov
	 3nV2i1cQVoMOW0rEquNXjmGtou6gdgRaEMaMjo7d0ttCzXQ6sh4wRv/PQCk8XdxB6biDj
	 520CYRGp3liaJgo8j1GfJP0eL2oSfFVRUJhj/A/VHEUyYqxZDq4/tjMqu0BaU+1d9rQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793912552;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:From:
	 To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-FB-Internal:Content-Type:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version;
	bh=Nh/PNfZJ+4poa+/4MlOKZcsiZSQUMnjoP1xeoBQtGHs=;
	b=RS0NvJOq21TrM1yvl5L2ybklv6LyG4n0oc1TpkCHsch2WligLmptDViud4o4dc6Fe8HW
	 MA9ZoT51ngsiHKf6PfRoov4ehEhkFAgvcUuAmk4ec/o3WBY8YBReyI53gBkMWjSJtK8tF
	 GDFXNX7QYZzNh1r8obICZ/KtOCyHsWh7UwRzs+ENdO+Clg+5rDcBPbYoJEThBM6xOTEA1
	 TEunrD5LaopUPp0XqIMsOOSqp7TvYIvIs7sPaztrm5EQXseafPW0SbA96o1DAdLgKbv5l
	 pWbaPDPVsGDC7lPRlcRiJEi53+b5QFJ20P4M/KG2Um6r9n8DN2M2Ds5jRyuMgHaqkPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b="NhbQ/54N";
	arc=none smtp.remote-ip=67.231.145.42
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8DC1606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 21:02:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8DC1606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=NhbQ/54N
Received: from pps.filterd (m0109333.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5L2Ki1794341
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 13:02:31 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps82601-s2048-2026-q3; bh=Nh/PNfZJ+
	4poa+/4MlOKZcsiZSQUMnjoP1xeoBQtGHs=; b=NhbQ/54NdkTTqYzT4zKGaqa7N
	dhTKqyKik6osO2OHCwsfUDXZFjj4MqYM5fXkmun8tkYV/ZC5LQDO+dyLtl1EbKg2
	N8JnOoJkUZLrke5Qhl5583kono1icC+lqrvfvXcmhY3JmN6ZFuESMgwKfbID/605
	IyJq1dMeTthVcA8T2oWljZgka4S5bTN0fCQXYL7wbVFfsXUfcpMcqgIJrWYmFt8E
	FAXUvpcC24oXo7698TpgfhL9JZCyedCik8Z4Em/INNUmJoD/3dZCpf9b+s5wtPnd
	QltcTIoHANEErB5/MN5sfOtSmjnuru6qmuF5o6Y/VfHq8aMFpZUBuEmC7imxg==
Received: from maileast.thefacebook.com ([163.114.135.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4hrb4ehejf-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 13:02:30 -0800 (PST)
Received: from twshared9449.02.snb2.facebook.com (2620:10d:c0a8:fe::f072) by
 mail.thefacebook.com (2620:10d:c0a9:6f::237c) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.56; Thu, 5 Nov 2026 21:02:27 +0000
Received: by devvm9890.eag0.facebook.com (Postfix, from userid 139328)
	id 247EB540BD2E; Thu,  5 Nov 2026 13:02:15 -0800 (PST)
From: Jennifer Chan <jenniferchan@meta.com>
To: <bhelgaas@google.com>
CC: <linux-pci@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Jennifer Chan
	<jenniferchan@meta.com>, <stable@vger.kernel.org>
Subject: [PATCH] PCI: Add d3cold delay quirk for NVIDIA LR10 NVSwitch
Date: Thu, 5 Nov 2026 12:10:10 -0800
Message-ID: <20261105201010.2297078-1-jenniferchan@meta.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-FB-Internal: Safe
Content-Type: text/plain
X-Proofpoint-GUID: _RUDsnjY-_3UxVLFtSsVs2OwQBCS-iqT
X-Proofpoint-ORIG-GUID: _RUDsnjY-_3UxVLFtSsVs2OwQBCS-iqT
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA4MyBTYWx0ZWRfX3o973uioViy4
 P5i79q2HcuvBJKlf/+rrTliYtHhdel9ACA3xb0S9JBQ90Nglesxm0pQOQGXH5YZoHlerVIgX23g
 +CyMnfhx9qpRbLU7TN4e2yZtgoWbFb0=
X-Authority-Analysis: v=2.4 cv=DJ8acCNb c=1 sm=1 tr=0 ts=6aeceee6 cx=c_pps
 a=MfjaFnPeirRr97d5FC5oHw==:117 a=MfjaFnPeirRr97d5FC5oHw==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22
 a=tpM8CJlwf7uhpglF1g9U:22 a=VwQbUJbxAAAA:8 a=VabnemYjAAAA:8
 a=AQQVFG2uCnKRw25fG-IA:9 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA4MyBTYWx0ZWRfX78CnY3XoQTzL
 gw7Er9bx9srwxx/tZbXJO1F6+5M8ISJQQoC+OoWGIsh4cm0oMhjY+1CoqsLMAoJS/ezQw416Jqw
 Bw7eYA9wkRFnwvph2OxGxgsRHAk7Vu/QrX1feWFCLl9JkXYtBYZzEFZGPFLdCfjwaWDRC/f1hOj
 eZwezDMAt8uK/tg77VVIUVuREi7yIcArwfyaHpiezl1+aPl6kJ9b1B0XuiSnqNIkTBgziBndh1X
 uTEKaJLi0zBOO+5PEPNgf6gFQi64lfnYl6sxiSaGi+yCi/CnUFOQqiakmJ9cZJq25VVZBAEMmKM
 VdyhLIKtH1CayGWDXBAAWon1u15uq1iJdryOj75zrn0h5aLshnm+qYl2F9b6XSgeJY0t5oLGHFs
 RDWnoJXwYfB6xt1XKcV22qarLKjpPLI4TqVjV4Ihjko+qbJN+85MINDIaD6ONmSuscTET7TbiM+
 HjwAd/m4Xv29H21bc9g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_05,2026-11-04_01,2025-10-01_01

On a Supermicro HGX A100 system (X12DGO-6), each of the six LR10
NVSwitches (10de:1af1) sits alone behind a PLX PEX 8725 (10b5:8725)
downstream port.  "nvidia-smi -r" resets all GPUs: NVML unbinds the
switches from the nvidia-nvswitch driver, resets each one through sysfs
(reset_method "bus", a Secondary Bus Reset of its port) and binds them
again.  The PCI core waits 100 ms after the link comes back, the switch
answers config reads and the reset completes.  When nvidia-nvswitch then
probes the switches, one fails in pci_enable_device() with

  Unable to change power state from D3cold to D0, device inaccessible

four others fail to initialize with -EIO, and the NVSwitch fabric does
not come back.

The same systems recover every time on a kernel that sleeps 1 s after
each Secondary Bus Reset, as pci_reset_secondary_bus() did before commit
ac91e6980563 ("PCI: Unify delay handling for reset and resume").  Adding
a 1 s sleep before the link wait on the PEX 8725 ports of the failing
kernel fixes it too.  Config reads already succeed at that point, so
pci_dev_wait() does not cover it, and the switch's state there is not
known.

Give LR10 a 1 s d3cold_delay, so that pci_bridge_wait_for_secondary_bus()
waits 1 s after the downstream link comes up before the switch is used.
This adds 1 s to each LR10 reset (about 6 s to an "nvidia-smi -r" on
these systems) and to D3cold resume of its port.  Resets issued further
up the hierarchy keep the default delay.

Fixes: ac91e6980563 ("PCI: Unify delay handling for reset and resume")
Cc: stable@vger.kernel.org
Signed-off-by: Jennifer Chan <jenniferchan@meta.com>
---
 drivers/pci/quirks.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
index 7f1f47ea2ee4..4a84095e736f 100644
--- a/drivers/pci/quirks.c
+++ b/drivers/pci/quirks.c
@@ -6569,12 +6569,14 @@ DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_TOSHIBA, 0x=
0220, of_pci_make_dev_node);
  * after reset recovery or resume from D3cold:
  *
  * VideoPropulsion (aka Genroco) Torrent QN16e MPEG QAM Modulator
+ * NVIDIA LR10 NVSwitch (HGX A100)
  */
 static void pci_fixup_d3cold_delay_1sec(struct pci_dev *pdev)
 {
 	pdev->d3cold_delay =3D 1000;
 }
 DECLARE_PCI_FIXUP_FINAL(0x5555, 0x0004, pci_fixup_d3cold_delay_1sec);
+DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_NVIDIA, 0x1af1, pci_fixup_d3cold_d=
elay_1sec);
=20
 #ifdef CONFIG_PCIEAER
 static void pci_mask_replay_timer_timeout(struct pci_dev *pdev)
--=20
2.53.0-Meta

