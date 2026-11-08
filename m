Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794114282;
	b=QICgx+rr7u6BG2tPN+9sq4roVmSvYCg/VSidDbWxiao+e6ujJmtbvgBs4afho7Bu3d/L
	 oo/3CsTiJ5R+83ZXLUlSq8l3xmfc2eRtRlSvkppbLwJEn7p2oHtd68pr6g7N4m7+cKe/O
	 4LYiY7o8YgxHdR3SLifKkm8+iYWFhPrsqKTjSaPky3TniuLn3aUKsl/8dfnllyuyDT/MF
	 P5rujVfzRgizXfgLdeY06zhzuHfCy0Z+ywV+Inx6ET5NWRdbWiGxWXbBrcx9RWGH1MyD4
	 ejgctBtzW2n0bxLQN6GOck5B/oXlv3dZfhQAoZSkok6JbIQ9qYr0hcyGsv9aQkeBjoQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794114282;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=QEKHb5MJBvVmkBuLyEsrJmpMsyORSfp6gXnGRGehkh0=;
	b=h8D5bJX4wdpU/9XLrfwPXa96E3e139HoBWTIE5dCK13/R2f2P/v2R4hdkPkv+tgDrTkK
	 8YqUaqoWYuqxfsY9B7AOanfJzWj5VNmyyakT/CZwbkEcBfhmAs5FGX0SfU7e6SWNbOyr6
	 l3GTNcl8Xs6l8TzfDZRH36EWCLn30AUpCQJUeAyFfPMOomVegsXIuAGmEHXf8rd4q4MXc
	 aeVHgURgaKA0ea01N1U2d9pys+gAyQ7z+xmDIdHwXus/CQ4gGcF2KxbaLz3a+WBFvfWJQ
	 ClrEkzjMAZX9rthUqp8NvnFgaQmUJaAZOdvgUizapI1yhqmHoK8oeHzAE+P6WsFf7zA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="TkhPy/Vm";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A597E606A31A;
	Sun,  8 Nov 2026 05:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TkhPy/Vm
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794114281;
	b=qtMKXuCxl7q7JzOfticpvs5hoJKJ8DCBIJoYBtlQXXhsDALh1AP4svL4jdoGv6lC3ro+
	 mKN7EhA9wyfgoA3skSxEyl95YJIcz5/S5YhCqkdYM/54aJ0vcRL5uZS7Vv0NttS36/l+U
	 8CnwVNYIXJdklm2T8ZTPbXGWQoV8BALl06XIDQX0kc/KS6dhsn++c577Yb0a2kvcpTL7l
	 E44BJm5hLiinmCs778Fup05GuZfXB0brgzLNyXPYlMdjrsQqceOKau6LMbJ4K1wPUCURw
	 zsNTkiekipYHJvbZcPidZGhKDBTJXuFmfdKBzcRTSJj1N94OIm2mJKegA+uhNGfGBHw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794114281;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=QEKHb5MJBvVmkBuLyEsrJmpMsyORSfp6gXnGRGehkh0=;
	b=td5ZxiW0REPr+F4wb20u0Yml4Ed7RM/LsUNDgyInkgBBWfs2aOiLR7vN+2vGZuFaMveY
	 d7rAjvAijrpCKCIvMhDNdxG7IyjoYT8PYphTE9/p6bL+JacBWk03mJ8E+HaaAr01t+dM7
	 enf90YzME5hu0BnTrQURiP42epyMPYz0lyi6fDh/h+XH666ytA9ykc/hWu6pLo0NxnqzU
	 PL8ngP28R/520d3tyR6pauKxtMr/TVXUafZI4+5Ozb5bHlmFooXUVPTk7tggEQIyBzZVK
	 uT3JB9skcLTNdfNzwREfrz4mpsv0ilmEC9YfnqIHdc9uvO3vuGJPwnYXFvdEN+6bGGQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EB2341F0089F;
	Sun,  8 Nov 2026 05:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794114281;
	bh=QEKHb5MJBvVmkBuLyEsrJmpMsyORSfp6gXnGRGehkh0=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=TkhPy/VmWFvVwGJAwI0FuTVclTIFPZIYAMXlirZda8IsYTVl6X5q8WIUCPSsEZ1BD
	 kUTC77aWoEt0LgYDTJYclCwyyFoul/wAmuIJRTpTsQQJn/rZDhPoCWATVv/a1NcDD7
	 CPwbGHF67RxesIHgiIJtqfk7MJ3XM73ZmK21Cl6cH9Mq6bZ/4G0X1RDDpCaSahJ2X2
	 WEdlRbJuYk23/d9LXvr6rB5emnnI+nZjATQgHkqOh+vDSooc5YqFB35dVJHRPUsV+5
	 JVihFYWFaoWRhTPlhrlDY9cb7bhMyTKh+hwvjgKK01Kw/FOhowbuG5Zw9jOYnA9BNr
	 OtcCRFRI2m73Q==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 7919B47DCF;
	Sun,  8 Nov 2026 05:04:40 +0000 (UTC)
From: DelaySystem via B4 Relay <devnull+DelaySystem.tubot.lat@kernel.org>
Date: Sat, 07 Nov 2026 21:04:40 -0800
Subject: [PATCH v2] media: ipu6: declare firmware files with
 MODULE_FIRMWARE
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261107-batch1-s1-ipu6-fw-v2-1-0e8567a1aefa@tubot.lat>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32NwQ6CMBBEf4Xs2TVsG0v05H8YDm1pZY0B0hbUk
 P67Be9mTi+ZebNCdIFdhEu1QnALRx6HAuJQge31cHfIXWEQtVBEdYNGJ9sTRkKeZoX+hZ0S3mu
 lpT0TlN0UnOf37ry1P46zeTibNtHW6DmmMXz204W23j//QljSnaSQ2vvGiGuazZiOT52gzTl/A
 TZpOXXEAAAA
X-Change-ID: 20261107-batch1-s1-ipu6-fw-d62ffa6a3c91
To: sakari.ailus@linux.intel.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 mchehab@kernel.org, DelaySystem <DelaySystem@tubot.lat>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1921;
 i=DelaySystem@tubot.lat; h=from:subject:message-id;
 bh=+GbCL4YspWticqNV8WYJ8X7lc408t7KsybFEoDp2+3U=;
 b=owGbwMvMwCH2SNl4+SzWXm/G02pJDFkfmF5MOxB/6aL/830JWZVTZ8Z/Kr17SCDdf1Yd2+vft
 W2re25s7ShlYRDjYJAVU2QRk+F5X39fJ87aas4JmDmsTCBDGLg4BWAicc8ZGa7s7H5yUcBnnuTX
 w/cceOW1Exh+n49xdw48mTmV/Z3ilmcM/51Py62prXxulpY38cPBv6e0X/K+DPg+O2Zj1iQDkyy
 XGkYA
X-Developer-Key: i=DelaySystem@tubot.lat; a=openpgp;
 fpr=161C0CEF7FDF2C5E3B3A9CC8E22333A79A058D4B
X-Endpoint-Received: by B4 Relay for DelaySystem@tubot.lat/default with
 auth_id=1447
X-Original-From: DelaySystem <DelaySystem@tubot.lat>
Reply-To: DelaySystem@tubot.lat
Content-Transfer-Encoding: 7bit

From: DelaySystem <DelaySystem@tubot.lat>

The driver requests one of eight firmware blobs at runtime depending on
the detected SoC (IPU6, IPU6SE, IPU6EP, IPU6EPADLN, IPU6EPMTL, IPU7,
IPU7P5 or IPU8), selected through isp->cpd_fw_name, but never declares
them.  As a result modinfo shows no firmware: lines and initramfs
generators cannot pick up the dependency automatically.

Add MODULE_FIRMWARE() for every blob the driver can request.

Suggested-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Link: https://lore.kernel.org/all/apqB28RBDZV4BlDZ@kekkonen.localdomain/
Signed-off-by: DelaySystem <DelaySystem@tubot.lat>
---
Changes in v2:
- Resend with corrected Cc list (v1 accidentally reached only Sakari and linux-kernel: repeated --cc flags do not accumulate in b4); no code change.
- Adds linux-media@vger.kernel.org and Mauro Carvalho Chehab to Cc.
- Link to v1: https://patch.msgid.link/20261107-batch1-s1-ipu6-fw-v1-1-1d5323aff7b2@tubot.lat
---
 drivers/media/pci/intel/ipu6/ipu6.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/media/pci/intel/ipu6/ipu6.c b/drivers/media/pci/intel/ipu6/ipu6.c
index cdf812c02960..ec2a9c2bf587 100644
--- a/drivers/media/pci/intel/ipu6/ipu6.c
+++ b/drivers/media/pci/intel/ipu6/ipu6.c
@@ -1028,3 +1028,11 @@ MODULE_AUTHOR("Yunliang Ding <yunliang.ding@intel.com>");
 MODULE_AUTHOR("Hongju Wang");
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("Intel IPU6 PCI driver");
+MODULE_FIRMWARE(IPU6SE_FIRMWARE_NAME);
+MODULE_FIRMWARE(IPU6EP_FIRMWARE_NAME);
+MODULE_FIRMWARE(IPU6_FIRMWARE_NAME);
+MODULE_FIRMWARE(IPU6EPMTL_FIRMWARE_NAME);
+MODULE_FIRMWARE(IPU6EPADLN_FIRMWARE_NAME);
+MODULE_FIRMWARE(IPU7_FIRMWARE_NAME);
+MODULE_FIRMWARE(IPU7P5_FIRMWARE_NAME);
+MODULE_FIRMWARE(IPU8_FIRMWARE_NAME);

---
base-commit: fa4ad798f6f681031775266044ba1b0cf3c670bd
change-id: 20261107-batch1-s1-ipu6-fw-d62ffa6a3c91

Best regards,
--  
DelaySystem <DelaySystem@tubot.lat>


