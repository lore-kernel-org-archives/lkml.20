Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88899430314;
	Mon, 31 Aug 2026 13:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788184687; cv=none; b=M9VIByl+d9cBjzQc5QtTeF6+atkbci9Qn6yiDSRiGGCISIpvHveIA2B4EwNbLAgXTjHRAtD49i7S4tgG/y4dseahkrUgEN5U6N0fF73R3Gqhp30PCkRErC5TQVF5t+SGV5uwSqS4Wj1YhU3zcm5WmLhA+8V63YOuigOUsrKKVVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788184687; c=relaxed/simple;
	bh=uwNRHe9oEdd+Az66CwMiY13D7DzYIBVF+4Bk6egNFm8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZLyDvjeU2vidIrnXggzyy1NtZFu5ps5R8icGfFp+NJKc+O+8+ItUqW7ah7SQmbKeVAV67ac3rFlFLOlv5/KOxxDi5Vfcpuio/7eqkW8E3szNiVa0b9fu5kQW3Zv4WyJkvYI1raKwkiCc+uzqhZMSKqp2m9O4lJncneD8DL7vZi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marmottus.net; spf=pass smtp.mailfrom=marmottus.net; dkim=pass (2048-bit key) header.d=marmottus.net header.i=@marmottus.net header.b=QYahQhw+; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marmottus.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marmottus.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marmottus.net header.i=@marmottus.net header.b="QYahQhw+"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 50DAE3EC13;
	Mon, 31 Aug 2026 13:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marmottus.net;
	s=gm1; t=1788184677;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qwQ77NLJdaDzor+bfxnMka8nUJ89yrwzWWtXG8TTC3c=;
	b=QYahQhw+8EwR3D6iqj1IGM5giLPVBLJIiY6QUZ3pZdkWHVSvvKp3iGuusMnQlmOJGWUSWQ
	E+0b+4eNU4KaNQNiMhTOTbxZwAmv8mOV/TnY3yioDbeNWE3HWnfVxFr+0hd4YVENPvIF4F
	J31lA+IH7kzSwVwc8JADDHl3lH2lnsOFfmE3MIT2mkGGtKyIxJfpB26Dh8FYdV6iBC+rVH
	CoJHUkJO+XB5yWEw4Pj65ORSiPYwWZwbxJqyrXVnwOB1gAM3p6WbaU1WR77GjIwGQYHurP
	KXDPh64VwJEEHRS8YvA9QBU5XwhmWvUS2yg+2NDnSdW7OfP4t3ZFd9vz91bbow==
From: Arthur Crepin Leblond <arthur@marmottus.net>
Date: Mon, 31 Aug 2026 15:57:23 +0200
Subject: [PATCH v4 2/2] docs: ABI: testing: document hid interval
 attributes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-usb_hid_interval-v4-2-609394103dcb@marmottus.net>
References: <20260831-usb_hid_interval-v4-0-609394103dcb@marmottus.net>
In-Reply-To: <20260831-usb_hid_interval-v4-0-609394103dcb@marmottus.net>
To: linux-usb@vger.kernel.org
Cc: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>, 
 Ben Hoff <hoff.benjamin.k@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 linux-kernel@vger.kernel.org, Arthur Crepin Leblond <arthur@marmottus.net>
X-Mailer: b4 0.15.2
X-GND-Sasl: arthur@marmottus.net
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: dmFkZTFsjoR8r0nNKrYTLPTkgNDX8KDWXiJDogWGk5/G/nb/gAHu3UKChiJzoPGLsw0cHPBeTRLWMQgv30rpEFRw4if01usPYSWO0+bapokZwe7E+siZGpMCnQkInBCDnU3wEQcFXw7laomBHhUj3+GiYQxSU34Yfh5zhOlBCo8m7Y9H+buN2Woh2OlqX4UPBNIWzocLpdMk9pVQeH7NQMrsHX2iCq5en+/yUyx2H7h7FQnYNIpGj9HsBR73Z3Mpwg3BlXj+PBzWy7D9vhFyi/G3TFOEwzAzRl4qaSkLy1hpzWa3nceIaURZ3kDgUgUklSfU/6gyazj9HYUjzL43DSd/wGLwg1Qd9ncYQGh8hVJ/GIbDI/dT3uuWMBOZzLJt3O9cA09RNqfN8+X9IGTrAdCy4ynOeEY6QkgDJjrYGhR+MObtIuyc0ljQBHXYRNI3KzBRFMABwubKkbIdcC8++5JwnC+b8BlO1M5uQiYDaasy0aW1wEyceHM1TjEdQrUNcuRTMasBGBWnK/pKWBNrozzpDrKRYGIifhv1sK9vVjB1plHfZM48HeLN2ioH37d8GVQ9Fpig02Bvvu39785rc0ucwsW7vSYNyI8n2KS5dKMgTuyk/KIoHHY5xwez2ZTTjdtz24aPpgXBhreXghn9sPZhB+axg2tBDjiS8tii1yVH9rj91Q

Add usb gadget hid function interval attributes documentation
- interval
- interval_fs
- interval_hs
- interval_ss

Signed-off-by: Arthur Crepin Leblond <arthur@marmottus.net>
---
 Documentation/ABI/testing/configfs-usb-gadget-hid | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/ABI/testing/configfs-usb-gadget-hid b/Documentation/ABI/testing/configfs-usb-gadget-hid
index 748705c4cb58..a889cae15a69 100644
--- a/Documentation/ABI/testing/configfs-usb-gadget-hid
+++ b/Documentation/ABI/testing/configfs-usb-gadget-hid
@@ -11,3 +11,21 @@ Description:
 		report_length	HID report length
 		subclass	HID device subclass to use
 		=============	============================================
+
+What:		/config/usb-gadget/gadget/functions/hid.name
+Date:		Aug 2026
+KernelVersion:	7.4
+Description:
+		The attributes:
+
+		=============	============================================
+		interval	HID endpoint bInterval for all speeds; if
+				set, it takes precedence over the per-speed
+				attributes below
+		interval_fs	HID endpoint bInterval for full-speed
+				(in milliseconds, default: 10)
+		interval_hs	HID endpoint bInterval for high-speed
+				(in 125 us units, default: 4)
+		interval_ss	HID endpoint bInterval for super-speed
+				(in 125 us units, default: 4)
+		=============	============================================

-- 
2.55.0

