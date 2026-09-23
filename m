Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFA813ABD9F;
	Wed, 23 Sep 2026 14:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790174689; cv=none; b=pXYBoYppZhuaT4MUQ/JSRZzijTXf1ne98ghGxcA4/bDRRaKFtCwxtMjcfrU2yVEXdXmRgyDg+ALfHtA60+LQvix9dXsV9mvd3zLPfmfZ8NjWQfhnDwUgN4meCWgOSm720wtceP0VONWrD0SSoX9fksDP2Wl3aUKiqdRhC2PRxlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790174689; c=relaxed/simple;
	bh=/JmUZUUQVEnGyzgLGoeyEISBe25LwBJ5Zzt0t42U2oA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NukiPhZxKBgRPR8HBaWhIt6R4AuhPsGh/mIqQdcM5XGJOzdyMLJS4r/TKqgERHUJarFmQnBpNkx6hPMW9LXexJukA1gZhFIF/xNUpWwkVclqEiiYGbQyHah8wHIwkUBBLqR5JWmin9H+FGqaPjUVkrtV1llGCjdA85pXVr5UvLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marmottus.net; spf=pass smtp.mailfrom=marmottus.net; dkim=pass (2048-bit key) header.d=marmottus.net header.i=@marmottus.net header.b=OllAVupJ; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marmottus.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marmottus.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marmottus.net header.i=@marmottus.net header.b="OllAVupJ"
Received: by mail.gandi.net (Postfix) with ESMTPSA id BF17E3EF85;
	Wed, 23 Sep 2026 14:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marmottus.net;
	s=gm1; t=1790174680;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6UvPIEYLWI4qKxOFyEYK4Yr1zMjX9eCBeX/pI0bCjOQ=;
	b=OllAVupJ0tSAR+vUV+MbPfy9bk6iHs/vMk9YzEMR1Lvkj5m7klB9kG7YOVXFgx7OOyVkPR
	i/JPfaBy9+xnLZxcpx2lyeeg0zyx6S7M9z87DH9MBZD3MBaNLk0AHULHiDwtfdaN/fBJfr
	cD1zzFs4o2nap8zKRZqbh6qC8sPEpWtgqQKPtYQY0LBmVDjO2zOf9roDJkt8E6IfZwRklS
	70NXW4xqqacGvpdsSs79O8puOmXhAjum6qMMDzbKxrpdbkuiuAOyyxq3xSh7P4be5IvLSi
	RNo7cg0Yp4AYKXysLoz4uYbuPJJqT/8g2Am07Vak8oo2K2afmXyjnQnnjYzWQA==
From: Arthur Crepin Leblond <arthur@marmottus.net>
Date: Wed, 23 Sep 2026 16:44:16 +0200
Subject: [PATCH v5 2/2] docs: ABI: testing: document hid interval
 attributes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-usb_hid_interval-v5-2-7e0e2879ba8b@marmottus.net>
References: <20260923-usb_hid_interval-v5-0-7e0e2879ba8b@marmottus.net>
In-Reply-To: <20260923-usb_hid_interval-v5-0-7e0e2879ba8b@marmottus.net>
To: linux-usb@vger.kernel.org
Cc: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>, 
 Ben Hoff <hoff.benjamin.k@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 linux-kernel@vger.kernel.org, Arthur Crepin Leblond <arthur@marmottus.net>
X-Mailer: b4 0.15.2
X-GND-Sasl: arthur@marmottus.net
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: dmFkZTEbjhOFP4uAjz8YkYMcG4sq9I33JT5d5sb/PCRSNmJGZucSG8H0AYeultMITC48U51DTz6c3jAj4GeoSn7V2GmpNfeLnVk7nsdnrNN2rPMIOrukrtLb5y4HQEnXKTeOZyeSpDmeutYzXLdmUMJNId3h+RUrQcP67SNr7XkU0x0mzazEhx1dA8pyKtfo0Wm57sjbcuniE6i8MF6Mgh6RSUy2tCj9YM/8cg1HL59bdkfmdxfpUmWTkcDu5nZIUhwbIbo2XfzDwqP3QOrUL/IV348DBCBDMxUxdhM9vipvlWSa5HwW+oTJygNDXx4w7hb+1/3ndaYc7ZOLRpyGW3qtMq+ObtJb5zAjOfnOpxysEJjy/AwfF+QZSErM+xFEZ3D/H6hCRdsRHMayypMrCWAKeSzhtn7Te5gfRwq57kQr45El2MCYvVgscutwTziFtUzG/sj4/3oK0SFs3ySah4DcECgn6Wl/3IhWJQD4ULralTG3+uJUYh37Hny67z+hkpzjQK17//HIgGkQFLrRg8baQRkqVpsKp5nGhIJHaHDvS554MatD6eMFmOaqYLq97vz0VcjxUytTHAnNUNOt35IVeVQRl1drwpEPWIWK1GI780Ftyl5N/0LeefSRZ+PFF7/dR9WOQ2LufGxbB0qZBqZf+LxLxWKx5pny4c0IX4Fr9m/8+Q

Add usb gadget hid function interval attributes documentation
- interval
- interval_fs
- interval_hs
- interval_ss

Signed-off-by: Arthur Crepin Leblond <arthur@marmottus.net>
---
 Documentation/ABI/testing/configfs-usb-gadget-hid | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/ABI/testing/configfs-usb-gadget-hid b/Documentation/ABI/testing/configfs-usb-gadget-hid
index 748705c4cb58..8e0b987ea5ad 100644
--- a/Documentation/ABI/testing/configfs-usb-gadget-hid
+++ b/Documentation/ABI/testing/configfs-usb-gadget-hid
@@ -10,4 +10,12 @@ Description:
 				except the data passed through /dev/hidg<N>
 		report_length	HID report length
 		subclass	HID device subclass to use
+		interval_fs	HID endpoint bInterval for full-speed
+				(in milliseconds, default: 10)
+		interval_hs	HID endpoint bInterval for high-speed, encoded
+				as 2^(bInterval-1) * 125 us (default: 4, i.e. 1 ms)
+		interval_ss	HID endpoint bInterval for super-speed, encoded
+				as 2^(bInterval-1) * 125 us (default: 4, i.e. 1 ms)
+		interval	HID endpoint bInterval for all speeds.
+				Overwrites the per-speed values above
 		=============	============================================

-- 
2.55.0

