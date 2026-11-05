Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793876115;
	b=SPyJ42Eq36O93qDgbM5ZEbLB8M+jmdNcaLucfsnUm1Sdt5YGLHu7odsc2ailR7kiwWeC
	 TKy2EU4eb4fWSpR/NvDHeuqgnrakojtPtVIrRa9mpEX/ypBN/rZ/2I6JcJ3vepsCNo8Wg
	 PlBynNWkguaUU9OaLTc3Ejlaj0TTYRAwESZdeDqGjMr8NkzgKwy/QtlIh+pBIzXyYXQkw
	 EMneSjNjGPD5YkJsxDpEc26z524r4OC8A3G6uCjc/h150o+Na9HKBWNZbj+zdrhkSde6c
	 Nu2g3jyqnEYNOGemC9zUVFtH7Q2qzcV1EeXFDA4LzKBWPHa8/zJ5cawt2gquKs8T2Ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793876115;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1ZWtq/VyD1hnCbbTlIRXMxrxGJjkw9yh/4VO0EVDO/I=;
	b=iAGQT7h0YMU2AYvTBuiTOvpQqEDFd3QA8M2eqWb+IUum2VpAi5249SzBVA0T0MShJKqn
	 F6MKIIVDxdiSEf+A7/0E/YXGbqFDmVi1/0PwqW+lTR6ot7M0QUE+KHm08ws9p81Ms2PWd
	 1Wu98PtmQWdaGxQzOvoc4bzdnkdTO3wcusxmfBIOiHlrrlSn6VC0OsynVx2Cy/P1RMM6c
	 NsijtIc9NDPkwESRmAiJbWt/EVheXDQCb1wXqA1LTPqaiS8NihinkM9S5O9dbOT4Ek4q8
	 4DOvMU+aqlHy4AgCFw8N1keBPDQD4VZPcPnoSyHdloDOVncZb5UGI8ySugmbIAbhwrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EMfN4g27;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF6F8606D81B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 10:55:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF6F8606D81B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EMfN4g27
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so5519225e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 02:55:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793876113; x=1794480913; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1ZWtq/VyD1hnCbbTlIRXMxrxGJjkw9yh/4VO0EVDO/I=;
        b=EMfN4g27WoJIdx+SfqqRwikxdtV7CxENSGVaAHGMq7gRM/M2S/vO3nc9V6oTPqn+i+
         QTM4NcWc9a2ZY3G3X6m0jgCUOAd9qD3CHay+WSxXZ2cc7UFQ+WRf2PLdTcRZD4ZItpXm
         OElGRz3FI9Q+mfZycwBpKWP9OfMOhwQ0fVf2hX/MuKEd2SnuQv7fFJp45u3wdhXn5Ex1
         CYt2vNRF6Yzh902s0768ed6DnwVjIbMewDW42cB7WpYfAmTzdVRUQ6ta2mvr/JjOKiSO
         jZAwjnyhaEL2ik/wa7USHtB/DQ+SevVUrQGAwK9QQEVstVHDb5oKneb1Hcvo0k0qxK/F
         I4Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793876113; x=1794480913;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=1ZWtq/VyD1hnCbbTlIRXMxrxGJjkw9yh/4VO0EVDO/I=;
        b=IAjcEuXp7C7OqI46xpvxITkRJU9LWKd8mnKqncjN+GshECV7+8cakrFvvFBwudghlK
         CdyiAj6Czrzu23KShUAo7nkT860vI8XDQcfZXBDqyTTQRz5EqIMpw4O3PvLXaq5mPZ4m
         fJmanQJnrNDtR40BqqG5Gktf47zerNecwH6ew1fY1JnVjhoZL7MzhLkBW+l63mZyuOE9
         kqblRprUMSjzUiJsa99r2G4N8dD2RbcnAFFVrAZaoNy9aLO6QBtjWzcDBsXtsJ+tFlDY
         BTrsG8MArit2G9DOHcppD+J0FJSOinM0hoqHC7Qrb0Pky4DPSLVRzBTR/I1y0ffZYcwd
         lEvg==
X-Forwarded-Encrypted: i=1; AKwUvByPumv5OF2Tsbi/AKovY4zU07lOy8/mWFkSYeAO3zDz4eCSPqORPcTSVepXRSiEA7dkDTATwAKitvzRkXg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/jNEoNdeCnvCuQ1l05cXSsk3IRlqGDOKT99HdnIJAF6tzxtGjs
	x9uiPfyUeGd6YDF5N73/8JtgFwvESlwU0ZMXQ/b3NJ36lyE0I5Ix5Osy
X-Gm-Gg: AYBFou2COywV2EHta+gUZ+sMBhg8TCSJqYBDdqEGQ2VBlZqq6M6gXhcafQa7FEwbEix
	XYGBZdoMgDmOKmqhIsHUdiSvZz6OeLJYKY9a10Dg790rR1vxCbTX2nmMESTNwzjtmzaeER67dVO
	/0STuCHwyzFYMM3Nhb75K3McGQOpSI55vMyD64Coy8/Fm8NVFcneloiK2NpW3db6/8jGJk43Nl0
	/x0bhe5Yr4j8n9jCuqisOhUnqPePua0his0CcCKvpPoLZLRJNztBgO0/3f5tA0JQ8UPJqanJMft
	hD43bYaHVlrtjAaZJc1Zy7Rg4mltHaVNPe0CZAdyw50vjpQ8MQr48zbVeeZDHysRYiP91Qwmb+K
	hMKqGnVloOR5eC7jbTan63hSpGoVKAlhXT9dGqG+fXZB97zAmqxVL425ZdoDg18jzifRPjTQeLO
	Vpad4YfmdXos8pdOGq54+VdENb34sqbHTc5/28D307AEZhRowMdXzx0SHetGZtTXb1fkqGVJUTe
	4nWuD6k5zHTpcL2nRHkgGx4VOjS3NjE7Tj0RaqRyvoQIXyE8yCxZ0TkT614x2kP9LZParxGjWwQ
	66TQCtzmL6SnhvxGpjMzWff6BHa1ShMCv+nv9P9//kBi9hTobHdwDqeb+Sd5GZeF0xn8hhju9va
	qzZ+V2uzunvSGeSlg4ddoUGsw
X-Received: by 2002:a05:600c:4e91:b0:49e:65f2:db64 with SMTP id 5b1f17b1804b1-4b55cf2fcd5mr37241315e9.5.1793876113275;
        Thu, 05 Nov 2026 02:55:13 -0800 (PST)
Received: from Ansuel-XPS24.lan (93-34-90-148.ip49.fastwebnet.it. [93.34.90.148])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4b57317cb8esm59576355e9.13.2026.11.05.02.55.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 02:55:12 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Qingfang Deng <dqfext@gmail.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Joris Vaisvila <joey@tinyisr.com>,
	Ahmed Naseef <naseefkm@gmail.com>,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net-next v5 3/6] net: phy: add additional helper for PHY package
Date: Thu,  5 Nov 2026 11:54:59 +0100
Message-ID: <20261105105504.1024-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261105105504.1024-1-ansuelsmth@gmail.com>
References: <20261105105504.1024-1-ansuelsmth@gmail.com>
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

Add additional MMD helper for modify/set/clear and poll register in
addition of read and write. These additional helper follow the same exact
implementation of the normal PHY helper.

Also add a helper to derive the offset of the passed phydev in the PHY
package from the PHY package base address.

These additional helper limit complex code in the PHY driver that requires
additional operation on the PHY package like specific PHY calibration that
needs to operate on a specific PHY address of the package.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/phy_package.c | 57 +++++++++++++++++++++++++++
 drivers/net/phy/phylib.h      | 73 +++++++++++++++++++++++++++++++++++
 2 files changed, 130 insertions(+)

diff --git a/drivers/net/phy/phy_package.c b/drivers/net/phy/phy_package.c
index 735806c5bea8..0a649e2f6f74 100644
--- a/drivers/net/phy/phy_package.c
+++ b/drivers/net/phy/phy_package.c
@@ -75,6 +75,19 @@ void phy_package_unlock(struct phy_device *phydev)
 }
 EXPORT_SYMBOL_GPL(phy_package_unlock);
 
+/**
+ * phy_package_unlock - get the PHY offset relative to PHY package base addr
+ * @phydev: PHY device that has joined the package
+ */
+u8 phy_package_offset(struct phy_device *phydev)
+{
+	struct phy_package_shared *shared = phydev->shared;
+	u8 base_addr = shared->base_addr;
+
+	return phydev->mdio.addr - base_addr;
+}
+EXPORT_SYMBOL_GPL(phy_package_offset);
+
 static int phy_package_address(struct phy_device *phydev,
 			       unsigned int addr_offset)
 {
@@ -179,6 +192,50 @@ int __phy_package_write_mmd(struct phy_device *phydev,
 }
 EXPORT_SYMBOL(__phy_package_write_mmd);
 
+/**
+ * __phy_package_modify_mmd - modify MMD reg relative to PHY package base addr
+ * @phydev: The phy_device struct
+ * @addr_offset: The offset to be added to PHY package base_addr
+ * @devad: The MMD to write to
+ * @regnum: The register on the MMD to write
+ * @mask: bit mask of bits to clear
+ * @set: new value of bits set in mask to write to @regnum
+ *
+ * Convenience helper for modifying a register of an MMD on a given PHY
+ * using the PHY package base address. The base address is added to
+ * the addr_offset value.
+ *
+ * Same calling rules as for __phy_modify_mmd();
+ *
+ * NOTE: It's assumed that the entire PHY package is either C22 or C45.
+ */
+int __phy_package_modify_mmd(struct phy_device *phydev,
+			     unsigned int addr_offset, int devad,
+			     u32 regnum, u16 mask, u16 set)
+{
+	int addr = phy_package_address(phydev, addr_offset);
+	int new, ret;
+
+	if (addr < 0)
+		return addr;
+
+	if (regnum > (u16)~0 || devad > 32)
+		return -EINVAL;
+
+	ret = __phy_package_read_mmd(phydev, addr_offset, devad, regnum);
+	if (ret < 0)
+		return ret;
+
+	new = (ret & ~mask) | set;
+	if (new == ret)
+		return 0;
+
+	ret = __phy_package_write_mmd(phydev, addr_offset, devad, regnum, new);
+
+	return ret < 0 ? ret : 0;
+}
+EXPORT_SYMBOL(__phy_package_modify_mmd);
+
 static bool __phy_package_set_once(struct phy_device *phydev, unsigned int b)
 {
 	struct phy_package_shared *shared = phydev->shared;
diff --git a/drivers/net/phy/phylib.h b/drivers/net/phy/phylib.h
index c6e26ac6b28f..6258b1f84bff 100644
--- a/drivers/net/phy/phylib.h
+++ b/drivers/net/phy/phylib.h
@@ -12,8 +12,10 @@ struct mii_bus;
 
 struct device_node *phy_package_get_node(struct phy_device *phydev);
 void *phy_package_get_priv(struct phy_device *phydev);
+
 void phy_package_lock(struct phy_device *phydev);
 void phy_package_unlock(struct phy_device *phydev);
+u8 phy_package_offset(struct phy_device *phydev);
 int __phy_package_read(struct phy_device *phydev, unsigned int addr_offset,
 		       u32 regnum);
 int __phy_package_write(struct phy_device *phydev, unsigned int addr_offset,
@@ -24,6 +26,77 @@ int __phy_package_read_mmd(struct phy_device *phydev,
 int __phy_package_write_mmd(struct phy_device *phydev,
 			    unsigned int addr_offset, int devad,
 			    u32 regnum, u16 val);
+int __phy_package_modify_mmd(struct phy_device *phydev,
+			     unsigned int addr_offset, int devad,
+			     u32 regnum, u16 mask, u16 set);
+
+/**
+ * __phy_package_set_bits_mmd - Convenience function for setting bits in a register
+ * on MMD relative to PHY package base addr
+ * @phydev: the phy_device struct
+ * @addr_offset: the offset to be added to PHY package base_addr
+ * @devad: the MMD containing register to modify
+ * @regnum: register number to modify
+ * @val: bits to set
+ */
+static inline int __phy_package_set_bits_mmd(struct phy_device *phydev,
+					     unsigned int addr_offset, int devad,
+					     u32 regnum, u16 val)
+{
+	return __phy_package_modify_mmd(phydev, addr_offset, devad, regnum, 0, val);
+}
+
+/**
+ * __phy_package_clear_bits_mmd - Convenience function for clearing bits in a register
+ * on MMD relative to PHY package base addr
+ * @phydev: the phy_device struct
+ * @addr_offset: the offset to be added to PHY package base_addr
+ * @devad: the MMD containing register to modify
+ * @regnum: register number to modify
+ * @val: bits to clear
+ */
+static inline int __phy_package_clear_bits_mmd(struct phy_device *phydev,
+					       unsigned int addr_offset, int devad,
+					       u32 regnum, u16 val)
+{
+	return __phy_package_modify_mmd(phydev, addr_offset, devad, regnum, val, 0);
+}
+
+/**
+ * phy_read_mmd_poll_timeout - Periodically poll a PHY register relative to PHY package
+ *                             until a condition is met or a timeout occurs
+ *
+ * @phydev: The phy_device struct
+ * @addr_offset: The offset to be added to PHY package base_addr
+ * @devaddr: The MMD to read from
+ * @regnum: The register on the MMD to read
+ * @val: Variable to read the register into
+ * @cond: Break condition (usually involving @val)
+ * @sleep_us: Maximum time to sleep between reads in us (0 tight-loops). Please
+ *            read usleep_range() function description for details and
+ *            limitations.
+ * @timeout_us: Timeout in us, 0 means never timeout
+ * @sleep_before_read: if it is true, sleep @sleep_us before read.
+ *
+ * Returns: 0 on success and -ETIMEDOUT upon a timeout. In either
+ * case, the last read value at @args is stored in @val. Must not
+ * be called from atomic context if sleep_us or timeout_us are used.
+ */
+#define __phy_package_read_mmd_poll_timeout(phydev, addr_offset, devaddr, regnum, val, \
+					    cond, sleep_us, timeout_us, sleep_before_read) \
+({ \
+	int __ret, __val; \
+	__ret = read_poll_timeout(__val = __phy_package_read_mmd, val, \
+				  __val < 0 || (cond), \
+				  sleep_us, timeout_us, sleep_before_read, \
+				  phydev, addr_offset, devaddr, regnum); \
+	if (__val < 0) \
+		__ret = __val; \
+	if (__ret) \
+		phydev_err(phydev, "%s failed: %d\n", __func__, __ret); \
+	__ret; \
+})
+
 bool phy_package_init_once(struct phy_device *phydev);
 bool phy_package_probe_once(struct phy_device *phydev);
 int phy_package_join(struct phy_device *phydev, int base_addr, size_t priv_size);
-- 
2.55.0

