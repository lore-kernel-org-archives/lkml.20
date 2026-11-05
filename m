Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793888896;
	b=4hSlyITP+/YzOgzx498oTZAwftGkJwoupjwxU2Kb+9Hjmszt4D+7+wHz+T355P+QruRw
	 b0YuNFfyaY0VdOCIbd/zXOpednGhxNmeaHkY1PUzVHxNXPjiuExE3P782yIsu1a4Oxwmo
	 7MT4sBjmN+Dp5ogbCmlDzvOapb5OwnkV0/ktuS/udwdo5JEcrPwcIUaFKBS7vzzTsYf/x
	 35IhqlUPKE13QGcWQ5uqlBrGnD+nE1I/7MlilHJQTxP4HTSftieg6M1P8z6IczAnG9Isq
	 xMSqMKfJYF/zyhmwdIig/3mDByX0neIXKkqhjBfL+LymGKOtzs7CmyfmWOU1YKxERjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793888896;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=95WxaNJo3zmGTXZd+gdzfT31Rv8uiLPoGQxEyB+r8Gk=;
	b=s4chMGpoA6h+WppDXa0U6RpMJtwY8t76t9YyOvxJClZzdRayV/Fth6u6XJsajmQQd8sJ
	 a2myQiOxNQosmi1rRSWZIz/uamhrYi06CQxwRgWvpskrcJ7ycY10edow6j8AoEfkVWbfr
	 2kHKCzVM6ua8pRqm8DGdicL4o3oX58YAbRxgjgDHqfjOhuNdWnY2bU5vmmg4PpmXxkP/S
	 GRcUmc7+Wg8FCgQpmjOWbjUWt+kRYFhvTDUSuFWZ4vHRA51yiHhN7e/Teu3MTb4qghskp
	 KQ83YkrXsgiftkwqnaK9dw0jluILSukaW0zUiK1yF1n/zw34Jj8QdsXSZUCjicwR6Xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gNT1QnqJ;
	arc=none smtp.remote-ip=192.198.163.15
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E287A606A328
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 14:28:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E287A606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gNT1QnqJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793888895; x=1825424895;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:to:cc;
  bh=7XBPAVgF7jXa9u0u8XGa62/I7XNKU0bOZC3A0FdkxAI=;
  b=gNT1QnqJMFDKCRcUaneDhJIC7+dPUgWyW2VJVjgz5YYrBHo/opXd+rIo
   mtPV5qTIIYEYIVWVPrJ/0m7rrtdV6kYHATR+3zYEou85nTkGLoZfOSr30
   TAeTt1GSsmBsu/SqgpZhefxj2obaeR9DZqKFFnU8tI2AEbKo4iMAdZmKd
   xmybFP9bK7MDkdD/5Vy6RQuRKz++YZjNey5+5TD8L+BtXeb1GzdxDgcqj
   Brds7CWZ78siXZmXyXJ358GQpTn76eVLbWYhYGcgeNCC+diFelMyro9HT
   x9Jvlgwn+Nt3R6cI1YgIyt53oa+SxkIpv9yC4kvpBF+ZJ7PpWd+ElmNHO
   w==;
X-CSE-ConnectionGUID: lK9IsNe0TWeos7sd09AOhg==
X-CSE-MsgGUID: jpesz0XwQw+FJDz3ibtIew==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2671842"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2671842"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 06:28:15 -0800
X-CSE-ConnectionGUID: AdR6HPinR0GlWZFKyouJ4A==
X-CSE-MsgGUID: 6gs6K+U2SQK3Nif5Fx6alA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7444130"
Received: from sannilnx-dsk.jer.intel.com (HELO [127.0.1.1]) ([10.12.231.107])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 06:28:13 -0800
From: Alexander Usyskin <alexander.usyskin@intel.com>
Date: Thu, 05 Nov 2026 16:28:03 +0200
Subject: [PATCH char-misc-next] mei: mei_lb: add info prints in flow
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-mei_lb_add_info-v1-1-2668d32c7e05@intel.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3M0QqEIBBA0V+JeW5ADTfqVyLEdNwGykIjgujf1
 /bxPNx7Q6bElKGvbkh0cuYtFsi6Ajfb+CVkXwxKqI+UQuNKbJbJWO8Nx7ChCNpNqtWhayyUak8
 U+Pofh3eRcOXsMNJ1wPg8P7/sXXpxAAAA
X-Change-ID: 20261105-mei_lb_add_info-0f5cb275f93a
To: Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Menachem Adin <menachem.adin@intel.com>, linux-kernel@vger.kernel.org, 
 Alexander Usyskin <alexander.usyskin@intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793888892; l=2111;
 i=alexander.usyskin@intel.com; s=20260315; h=from:subject:message-id;
 bh=7XBPAVgF7jXa9u0u8XGa62/I7XNKU0bOZC3A0FdkxAI=;
 b=bZ0wor1Kj7VXOk9K2B176DvIRXHcQx4Bl+R7LawJhqvOyRkpZvx7Phnfzm2O5T/TtnSWhEFgx
 ree653dWcq0Ahztu+0BkXPtl+4YlFyZOzbkJRmT3TEGKaYysmo/w67Z
X-Developer-Key: i=alexander.usyskin@intel.com; a=ed25519;
 pk=X+qoF/nFCdDOV04IForWSxnkyoCAbUE10egZi6PSfcU=

Add info prints for late bind flow start and successful completion.
We already have error prints, new info prints will add ability
to trace successful flow and confirm that late bind firmware
loaded to the card.

Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
---
 drivers/misc/mei/mei_lb.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/misc/mei/mei_lb.c b/drivers/misc/mei/mei_lb.c
index 9fa69acf28d5..51794ff994fa 100644
--- a/drivers/misc/mei/mei_lb.c
+++ b/drivers/misc/mei/mei_lb.c
@@ -214,6 +214,8 @@ static int mei_lb_push_payload_v1(struct device *dev, struct mei_cl_device *clde
 	ssize_t bytes;
 	int ret;
 
+	dev_info(dev, "Sending %zu bytes of type %u\n", payload_size, type);
+
 	req_size = struct_size(req, payload, payload_size);
 	if (req_size > mei_cldev_mtu(cldev)) {
 		dev_err(dev, "Payload is too big: %zu\n", payload_size);
@@ -260,8 +262,12 @@ static int mei_lb_push_payload_v1(struct device *dev, struct mei_cl_device *clde
 		goto end;
 	}
 
-	dev_dbg(dev, "status = %u\n", le32_to_cpu(rsp.status));
 	ret = (int)le32_to_cpu(rsp.status);
+
+	if (ret)
+		dev_err(dev, "Error in status: %d\n", ret);
+	else
+		dev_info(dev, "Sent %zu bytes of type %u successfully\n", payload_size, type);
 end:
 	kfree(req);
 	return ret;
@@ -314,6 +320,8 @@ static int mei_lb_push_payload_v2(struct device *dev, struct mei_cl_device *clde
 	ssize_t bytes;
 	int ret;
 
+	dev_info(dev, "Sending %zu bytes of type %u\n", payload_size, type);
+
 	struct mei_lb2_req *req __free(kfree) = kzalloc(mei_cldev_mtu(cldev), GFP_KERNEL);
 	if (!req)
 		return -ENOMEM;
@@ -363,6 +371,8 @@ static int mei_lb_push_payload_v2(struct device *dev, struct mei_cl_device *clde
 		first_chunk = 0;
 	} while (!last_chunk);
 
+	dev_info(dev, "Sent %zu bytes of type %u successfully\n", payload_size, type);
+
 	return 0;
 }
 

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261105-mei_lb_add_info-0f5cb275f93a

Best regards,
-- 
Alexander Usyskin <alexander.usyskin@intel.com>

