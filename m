Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=162.243.164.118
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794853359;
	b=hv8lOCQdfYmrcYHtyGnb5KaWvlN3CFed3NaWRnA3Bw9sHdl/QvIffRS35w7sEqOYmWny
	 EK/D0ruoSs4geB+oALFFxYrVFKyQ7vaB7VOwqjC7EkwEALVjV2BR0CSKsxGNgwngw3on8
	 0UmTUWGY5aWSU8R+HVS0m2lHRk6liDrZiMTTtbrl1CnMNPiX6mdGZCPfTTQJkdTFr+LN7
	 6BjOC0eVogPijU+/P08TdRfdFdCVVMkSVyOFoYZyKKmetSOiMIuF9+SrfBSVNLkEy7TAI
	 /c8Rw4MrA+2xS8agftp1+QNaYbUzP7pCbygtIm4jQwBwkpbHsbFelhDDFEw46lmSjXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794853359;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=nUzQK2bO7zFTjdpmOXstZkGgEn1F3y3A2JYnd8cPk3A=;
	b=EblraOw5zOBXnJ8p31Te9c1bi147jYOm+/O/U/aJz+OTJkpioIUkuKb2Fyu4BldiujV6
	 dK5pvD8TN+5QvF+SLHqiLy8A+lN8hty0fpduoWeXZZJ8YKl8Fe15J2wEQbxre/ihi3thb
	 sc4s0Nq7a5Ptce0GlLTwQNwSKaN2KW4xl/puF/yEcBpIT5Rd8gt7sG7Hdwm8atdPTKqAV
	 vz5IO4/MPSXlQteuSY4NSwhXASfbmlzLBIdU6mqNf5P3qN0IYh4xDJcYteuU5udLqozAH
	 DhSYKNP2Tl4ht1CratNKUYVcNDrVmaLLUAaFTdoAFuMu1C0ne72UfwrPKR0296Avp5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=stu.xidian.edu.cn;
	spf=pass smtp.mailfrom=stu.xidian.edu.cn;
	arc=none smtp.remote-ip=162.243.164.118
Received: from zg8tmtyylji0my4xnjqumte4.icoremail.net (zg8tmtyylji0my4xnjqumte4.icoremail.net [162.243.164.118])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7CC5606A8AF;
	Mon, 16 Nov 2026 18:22:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7CC5606A8AF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=stu.xidian.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=stu.xidian.edu.cn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=stu.xidian.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-Id:MIME-Version:Content-Transfer-Encoding; bh=nUzQK2bO7z
	FTjdpmOXstZkGgEn1F3y3A2JYnd8cPk3A=; b=nWM2EmfMtQwuhwD3GDDj/xbJQS
	wcPP7nwoQdr8VxmsznmRxH8o7LnvxhHdzB6PwI9ramxbg8bQlZIDXGqSgWy57gu+
	NAprmmKyE955Yp62tdaPCXsXNzyV0pAMGT/Pulh4DHTEA+44H7H6fo+11zl2aouP
	KoVGhd43e8rb6cpeM=
Received: from user-virtual-machine.localdomain (unknown [113.200.174.41])
	by hzbj-edu-front-2.icoremail.net (Coremail) with UTF8SMTPA id BLQMCkCm6v_jSftqGL27AQ--.30176S2;
	Tue, 17 Nov 2026 02:22:29 +0800 (CST)
From: YuanZhe Liu <25031212351@stu.xidian.edu.cn>
To: Brian Norris <briannorris@chromium.org>
Cc: Francesco Dolcini <francesco@dolcini.it>,
	Bin Yu <byu@xidian.edu.cn>,
	Cheng Wen <wencheng@xidian.edu.cn>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] wifi: mwifiex: drop RX packets before the interface is created
Date: Tue, 17 Nov 2026 02:22:26 +0800
Message-Id: <20261116182226.8663-1-25031212351@stu.xidian.edu.cn>
X-Mailer: git-send-email 2.34.1
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
X-CM-TRANSID:BLQMCkCm6v_jSftqGL27AQ--.30176S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tw1DKFWkZw13tw45uF48WFg_yoW8KF1kpa
	98Gryku3ykJr1qkw4kJF47AF1Y9a18Cry7Crsruw1F9rn3Ca4SqryYgrW0gFWYyFWvva4Y
	yF1jqr15Z347A3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9Ib7Iv0xC_Cr1lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_Gr0_Gr1UM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x2
	0xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18Mc
	Ij6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l
	c7CjxVAaw2AFwI0_JF0_Jw1lc2xSY4AK67AK6ryl42xK82IYc2Ij64vIr41l4I8I3I0E4I
	kC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWU
	WwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr
	0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWU
	JVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJb
	IYCTnIWIevJa73UjIFyTuYvjxUs9mRUUUUU
X-CM-SenderInfo: ysvqjiysrsjkur6v33wo0lvxldqovvfxof0/1tbiAQUTD2r7HFch0wABsx

mwifiex_usb_dnld_fw() submits the RX data URBs as soon as the firmware
image has been downloaded, which happens before _mwifiex_fw_dpc()
creates the default station interface.  A data packet sent by the device
in that window is queued to adapter->rx_data_q and handled by
mwifiex_rx_work_queue() while the remaining initialization is still in
progress.

mwifiex_get_priv_by_id() skips the private structures whose bss_mode is
still NL80211_IFTYPE_UNSPECIFIED, so mwifiex_handle_rx_packet() falls
back to mwifiex_get_priv(MWIFIEX_BSS_ROLE_ANY), which returns the first
private structure of the adapter.  Its bss_role is zero, that is
MWIFIEX_BSS_ROLE_STA, but hist_data is only allocated later by
mwifiex_init_priv_params() when the interface is created, so
mwifiex_hist_data_add() dereferences a NULL pointer:

  KASAN: null-ptr-deref in mwifiex_hist_data_add
  Read of size 4 at addr 0000000000000d28
  ...
  mwifiex_process_rx_packet
  mwifiex_process_sta_rx_packet
  mwifiex_handle_rx_packet
  mwifiex_rx_work_queue

priv->netdev is NULL at that point as well, so the packet would also make
mwifiex_recv_packet() pass a NULL net_device to eth_type_trans().

Such a private structure cannot receive data yet, so drop the packet
instead of entering the receive path.

Co-developed-by: Bin Yu <byu@xidian.edu.cn>
Signed-off-by: Bin Yu <byu@xidian.edu.cn>
Co-developed-by: Cheng Wen <wencheng@xidian.edu.cn>
Signed-off-by: Cheng Wen <wencheng@xidian.edu.cn>
Signed-off-by: YuanZhe Liu <25031212351@stu.xidian.edu.cn>
---
 drivers/net/wireless/marvell/mwifiex/txrx.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/wireless/marvell/mwifiex/txrx.c b/drivers/net/wireless/marvell/mwifiex/txrx.c
index f44e22f24511..6c651bfa3bff 100644
--- a/drivers/net/wireless/marvell/mwifiex/txrx.c
+++ b/drivers/net/wireless/marvell/mwifiex/txrx.c
@@ -43,6 +43,13 @@ int mwifiex_handle_rx_packet(struct mwifiex_adapter *adapter,
 		return -1;
 	}
 
+	if (!priv->netdev) {
+		mwifiex_dbg(adapter, ERROR,
+			    "data: interface is not ready. Drop RX packet\n");
+		dev_kfree_skb_any(skb);
+		return -1;
+	}
+
 	mwifiex_dbg_dump(adapter, DAT_D, "rx pkt:", skb->data,
 			 min_t(size_t, skb->len, DEBUG_DUMP_DATA_MAX_LEN));
 
-- 
2.34.1

