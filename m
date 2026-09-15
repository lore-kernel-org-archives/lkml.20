Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F318C2EEE7C
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 02:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789437735; cv=none; b=BcqYnMjVybj7FLUiJnrI59P8duutX7LjN2tj+RiktgLlJWRehxO7GyoXZw17rF2WKxUfmzdoiie0ce/IFIa0QfAMl1kj05oOFyMMOcbcKMTawEODzSgUSvJDf0faelFUyUbxQzLWZozujOv9jyNpjno2srqxI4LeucX3zoys0Oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789437735; c=relaxed/simple;
	bh=9kGKsaAo2kA1qFBiYQUe0iHybsQYYEdGYH5qAdbCdxo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bSkRnFWnt0KP7G/Rat9P5IR1FE3GN0fc1eobEWi2f81TNqQl3bJsPNHK+X1gA3iB2W4SknoKGyTxaOrWyxt3K9bU3AakbEMHpoD8Ly64yyERHXjuCRharZif58RwpF0uMsHgQ/m3oahsBhFKy7zYZFiH4xhNjU8v3d+SWnyCKS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=of5Lc1Ql; arc=none smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="of5Lc1Ql"
Received: by mail-qk2-f12.google.com with SMTP id af79cd13be357-939695b5741so320747485a.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 19:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789437733; x=1790042533; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iceODlE59LZgcWKBaJw9C8XVX53Oy1oOaAJoPg+TsVs=;
        b=of5Lc1QlLGjUJK7dlfdaXYlqe0tq4gNbFR11T6KbaP9N7mE6//XCLhX+oxOqUxc7G+
         gPnEFPzedj+FbuxG52Rn052qSRY8SL98XpXEj1+gbK/H6koS92VXS/Q/Dut3B+hVC5JQ
         kAe3sFd1PjcTeeL+KTBRsnAAiG435HJ2Tv7PNJYkQWOTBCni4Qk57tPiHW5PcpHJjgJM
         cs3Ex9aozZCz7bweWgPb/Yqykox5WbCG/9ILERMUCAK9JCKiWMGLpjd958/fBiRw1LCB
         mEkM3JribBsfta0WpxwSQOHMt6yV90eqnMGbGUUMVXRYOIy0VzNcuuyXNIHmFvvLQ7yw
         J/Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789437733; x=1790042533;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iceODlE59LZgcWKBaJw9C8XVX53Oy1oOaAJoPg+TsVs=;
        b=TwFfxr2CtyrMvDD200qEVHH1+oNUJWK5l5uV9SQ7I78/EjI/Lfe/LO1XvwmqGfSkSK
         r9tcmZb4bJCTti6keoh7Je93KJTKsZek+MV16oRQCZOCF7Z3XUPgMHKH66oNWTrP/uyL
         fgtptovFQYLdeJuLOiY56VQAUpxHXKzAyR6hC+nN+Zh0oykD+JhGBiXKDUtZik6rl9Nz
         H9nHttRFvj92Dovc36X29NZbwDaCYTv2pjjtI7MwWNEGxLej6zcZwJuXVqcGdVLNsq1K
         /hu6wzPNk9IqRGOpNWYq7MMplRHm5YuFNLOOUyCpic4OyEMHOmymEd+hKGA/QMIvUsov
         Z3VQ==
X-Forwarded-Encrypted: i=1; AKwUvBwXSmgUJoUlYwQqrGAQG5ajzcdGzjHVOj8ejTtnpyoxkE6Iql3oHFEJakqeGfdetL9Al+Hl4Am926+pXgw=@vger.kernel.org
X-Gm-Message-State: AFuF++nPZtAKJViaIqMdJ3Ux85KCrWwlBQSo5kglaK1xtE5zTB3Plxtw
	Kd6qH0sauxOdfjptqXiRXkJ9tUjmA8TJA84tsCgaZo3MRX5QJNQd0t8=
X-Gm-Gg: AYBFou3vp++B9+Gs6LbndWvCVcKaHj5P1H/t5hEGZblxbU9TKnxKFuRy5QlgyaDSFS1
	Se0qYOoIou6quCJHCooMyHJU2mwhjqH2dunE3WeXTw6ghvg7Lzf4Tmn4Vbyx6u8DDH2pctB4lGV
	SXJUxp4lpeSdkX45NDChZ5SFQnTsAQDXGnvdlUT3/rY/A67xR0atMxwgBkSfyoCVsDEs2YBOhxx
	39t1jVuuHf5VnTqmV7CQ5zLF6RfQakKkey+G33fz+IPfpQF9hnEYgeaddlcGkN4OOZjEdzrjIxO
	Zp5jjomzmcTYdvvMNV7c5BUxHTinTHRQNoLQloq+pNxJO9x0AIDJZdKHwrXkeVGkthCWMzgrLNG
	qIfF3vl62dZTMVUV/PwY1q20JHyWm/LKB5J5ulb66cyYG89iCaVk0qlTqc425fef8oBxOqwWEOe
	/WloP0EGLUoUxVlQziHH6nTfTZcyqnRjbAVOtvYgdevnlIiadr8gjRvu5kExaK3+3Pq438ekFeI
	l3Nurn003pWF4R4OPmH59mFfrCDvQD7eHO03I+34zArhbcLXK7SHQ/Uch1ShwQp116lrJBUllLs
	8O4rbF21X1BlFl8FuWpxnZSndNoM48MwafiLvQRhmasIG1rGPJ39oIHMzoUm26sIpC24E6icOKJ
	4ev7y
X-Received: by 2002:a05:620a:4620:b0:93a:1101:a21c with SMTP id af79cd13be357-93a299f084bmr785854485a.25.1789437732441;
        Mon, 14 Sep 2026 19:02:12 -0700 (PDT)
Received: from 6e-wmo5420-02.ad.psu.edu.net (6e-wmo5420-02.ad.psu.edu. [104.39.213.233])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939f19f94a1sm1022872285a.42.2026.09.14.19.02.09
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 14 Sep 2026 19:02:10 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Ion Badulescu <ionut@badula.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH net] net: starfire: Disable PCI device on probe failures
Date: Mon, 14 Sep 2026 22:01:50 -0400
Message-ID: <20260915020150.87982-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

starfire_init_one() enables the PCI device but leaves it enabled on
subsequent probe failures. Route all failures after successful enablement
through pci_disable_device(), preserving the existing error codes and
resource unwind order.

This issue is already present in the initial Git import; its pre-Git
introduction is unknown.

This issue was identified during our ongoing static-analysis research
while reviewing kernel code.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/net/ethernet/adaptec/starfire.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/adaptec/starfire.c b/drivers/net/ethernet/adaptec/starfire.c
index f1109d9..f7bd765 100644
--- a/drivers/net/ethernet/adaptec/starfire.c
+++ b/drivers/net/ethernet/adaptec/starfire.c
@@ -638,6 +638,7 @@ static int starfire_init_one(struct pci_dev *pdev,
 	void __iomem *base;
 	int drv_flags, io_size;
 	int boguscnt;
+	int err = -ENODEV;
 
 	if (pci_enable_device (pdev))
 		return -EIO;
@@ -646,12 +647,14 @@ static int starfire_init_one(struct pci_dev *pdev,
 	io_size = pci_resource_len(pdev, 0);
 	if (!ioaddr || ((pci_resource_flags(pdev, 0) & IORESOURCE_MEM) == 0)) {
 		dev_err(d, "no PCI MEM resources, aborting\n");
-		return -ENODEV;
+		goto err_out_disable;
 	}
 
 	dev = alloc_etherdev(sizeof(*np));
-	if (!dev)
-		return -ENOMEM;
+	if (!dev) {
+		err = -ENOMEM;
+		goto err_out_disable;
+	}
 
 	SET_NETDEV_DEV(dev, &pdev->dev);
 
@@ -818,7 +821,9 @@ err_out_free_res:
 	pci_release_regions (pdev);
 err_out_free_netdev:
 	free_netdev(dev);
-	return -ENODEV;
+err_out_disable:
+	pci_disable_device(pdev);
+	return err;
 }
 
 
