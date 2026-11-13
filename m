Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794572636;
	b=V8oRYaot1qNNoLixSXPiwEtT0EIms/ZPu9HkLlj+ipcWkKvNMqoogUsirNfbgwiUr7TT
	 wbPJirQGzQw/8LEoVofJHyNJZ/SPVlv/5/3N6XZf7cHLJMg46UGGW3z/YJqW4NrZ/QnWH
	 lAwnhx944RVDt7/9khg3O/VAMYOHMFU0kt2LiODIMMdz36ezDgU0vEN/t72uoKxMIf0qB
	 +85TE+aqqWEraYmrbWBkzsa2tMQTW1FVETzz1IhArgPQVyvLpEVOI9uO98J4sekQuNE3A
	 aDHRnfkFpKo5c/g9V8FmbDE54b0ubs+6e03u8TsBJUcsKXFoI0Udgu+nnZtAC3x2G4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794572636;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=Hqsyk7AnW4+ZlxPzjIHxwwNr9WBzM89At/xELItdEOg=;
	b=lSh2w9QWb6I+TVZDgHURoMfnx/SeMBhszPrRnSMAyrDbdT8yCQxwACxGhYbIZy30fPDx
	 p8NeU1uTk/S25lFB1JO/CiPFkd9VvTumVhbNivdfSyiJiO23jnysmMJ937bOooAHbXKr1
	 sAVkcAgYsO2A23KIRKcVedMFbrinwKPYHqOcgyBPko6hFTKSC1tUAzb+Qea4RcYXxxD4K
	 4zOuaw1GHelgUI24BNckt64mMTnqu7GHJuLwGEWmqa9kCKeMa5SMnMx2WdDO+UK2uOygz
	 SLL5BXmcQTC+PJAJHm6zqKa/Jcn+PhEvBBxVVOJR/pQdkc4j4mpqQGc+87e+vM1LM6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=cFinvfp5;
	arc=none smtp.remote-ip=117.135.210.4
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C457B606A89F;
	Fri, 13 Nov 2026 12:23:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C457B606A89F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=cFinvfp5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Hq
	syk7AnW4+ZlxPzjIHxwwNr9WBzM89At/xELItdEOg=; b=cFinvfp54Yq8uTXPnH
	PebaOU9uNoPCW4PwnNrqpqH9MUN77KuUapnkRM87UlD+MohSsZ2x3FTRRO0iEqi2
	9tiWTBZREVtphpLu5iOn9CDcPCcitA+wk0vq97JjFwGK26fCXO61tMCvLzMAT0C6
	YQl/vJqUk1y1r12j9U6LwMwDU=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wDnr684AfdqBTIvHA--.19870S3;
	Fri, 13 Nov 2026 20:23:27 +0800 (CST)
From: Hongxing Xu <xing1989093@163.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
	mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] bus: mhi: host: Add debug-only channel config macros
Date: Fri, 13 Nov 2026 20:23:02 +0800
Message-Id: <20261113122302.2174-2-xing1989093@163.com>
X-Mailer: git-send-email 2.40.0.windows.1
In-Reply-To: <20261113122302.2174-1-xing1989093@163.com>
References: <20261113122302.2174-1-xing1989093@163.com>
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
X-CM-TRANSID:_____wDnr684AfdqBTIvHA--.19870S3
X-Coremail-Antispam: 1Uf129KBjvJXoWxGFWrKr4rtw1rtr45uF13XFb_yoW5Cr47pF
	4I9as5J3y8Aa4aqa4fA348KF98t3ykWryktr9Fkw1UZ3s8Aw47ArW0g3yjqFWY9ws2qa1F
	ga1jq345ua4UA37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jyE_NUUUUU=
X-CM-SenderInfo: 50lqwiqzyzimqt6rljoofrz/xtbC-B-npGr3AT-ZEAAA3K

The debug_only flag added by the preceding patch has no users: set it
per channel config, and there is no helper for the channel entries that
need it, so every such entry would have to be spelled out in full.

Add MHI_CHANNEL_CONFIG_UL_DEBUG_ONLY() / _DL_DEBUG_ONLY() next to the
existing MHI_CHANNEL_CONFIG_UL()/DL() macros. They are those macros with
.debug_only = true and are used for channels that only exist in the
debug port personality, i.e. the diagnostic and debugger channels.

The suffix is _DEBUG_ONLY rather than _DEBUG because the existing _SBL
and _FP variants select a execution environment, while these macros
still target MHI_EE_AMSS: only the enumeration condition differs.
_DEBUG would suggest a third EE and mislead readers into looking for
one.

Use them for the DIAG channels of modem_qcom_v1_mhi_channels, which is
shared by the SDX55, SDX65 and SDX24 modems. The diagnostic port is
what userspace gains by switching to the debug personality on those
devices, and the QDSS trace channel they also expose is not declared
for this channel set.

Signed-off-by: Hongxing Xu <xing1989093@163.com>
---
 drivers/bus/mhi/host/pci_generic.c | 36 ++++++++++++++++++++++++++++--
 1 file changed, 34 insertions(+), 2 deletions(-)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index 7193a38..9a51711 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -197,6 +197,38 @@ struct mhi_pci_dev_info {
 		.doorbell_mode_switch = false,		\
 	}
 
+#define MHI_CHANNEL_CONFIG_UL_DEBUG_ONLY(ch_num, ch_name, el_count, ev_ring) \
+	{						\
+		.num = ch_num,				\
+		.name = ch_name,			\
+		.num_elements = el_count,		\
+		.event_ring = ev_ring,			\
+		.dir = DMA_TO_DEVICE,			\
+		.ee_mask = BIT(MHI_EE_AMSS),		\
+		.pollcfg = 0,				\
+		.doorbell = MHI_DB_BRST_DISABLE,	\
+		.lpm_notify = false,			\
+		.offload_channel = false,		\
+		.doorbell_mode_switch = false,		\
+		.debug_only = true,			\
+	}
+
+#define MHI_CHANNEL_CONFIG_DL_DEBUG_ONLY(ch_num, ch_name, el_count, ev_ring) \
+	{						\
+		.num = ch_num,				\
+		.name = ch_name,			\
+		.num_elements = el_count,		\
+		.event_ring = ev_ring,			\
+		.dir = DMA_FROM_DEVICE,			\
+		.ee_mask = BIT(MHI_EE_AMSS),		\
+		.pollcfg = 0,				\
+		.doorbell = MHI_DB_BRST_DISABLE,	\
+		.lpm_notify = false,			\
+		.offload_channel = false,		\
+		.doorbell_mode_switch = false,		\
+		.debug_only = true,			\
+	}
+
 #define MHI_EVENT_CONFIG_DATA(ev_ring, el_count) \
 	{					\
 		.num_elements = el_count,	\
@@ -314,8 +346,8 @@ static struct mhi_event_config mhi_qcom_sa8775p_events[] = {
 };
 
 static const struct mhi_channel_config modem_qcom_v1_mhi_channels[] = {
-	MHI_CHANNEL_CONFIG_UL(4, "DIAG", 16, 1),
-	MHI_CHANNEL_CONFIG_DL(5, "DIAG", 16, 1),
+	MHI_CHANNEL_CONFIG_UL_DEBUG_ONLY(4, "DIAG", 16, 1),
+	MHI_CHANNEL_CONFIG_DL_DEBUG_ONLY(5, "DIAG", 16, 1),
 	MHI_CHANNEL_CONFIG_UL(12, "MBIM", 4, 0),
 	MHI_CHANNEL_CONFIG_DL(13, "MBIM", 4, 0),
 	MHI_CHANNEL_CONFIG_UL(14, "QMI", 4, 0),
-- 
2.40.0.windows.1

