Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794705891;
	b=SEYZpnN9dl1tMYTELabVcukO1OevXRirEZzWpKJ0Z6z4LtP/+UA+ZQqci19kr7GyJC/P
	 vHW0pwqr+8X+QeBPjmB87XFV5jFRG+aCK2mbXHJqQZ+INmn2+za8tQQlVcl/Zhf4BQiA1
	 Us1b8ROFyzwnsPKQ8OYz1QtpPuvxeQFCAFvOc4oyXZX8OFGzy/wFg5e+hdFS2XE344+sN
	 YhsJ1Dv3lNzI/z6mgyvK63YcRWlF4qVLtCMbC1G2QeS4pXfyUApdXth8W7fXOC5GCNG1u
	 xaRl6RYj4i4KhJPcwyQtpY2HKH90bo8XnDQ8eoMe1f1RRpd9Q31sUwxXw+R0YoRslMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794705891;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=tEMmLChOiIwNpNXHWX/4+kW3khLpcCfHhJ/NCZNzzsk=;
	b=mHEc5xspLZGRvd4a5Tc5VsIC94k0+VHQ/G1rXbtjI1TjxiSMTLhlVJXrjA7F2jjNQ1YH
	 Nx1j9WhHvjy473b+D/zrxZU/jN/0RbA02qOi3neH7akVkxlZCym1eLLDGQUoW8Q/W3+Fn
	 sUxIayuVyC+w6/qROmPRMVEeqhpIlihU5177edhHZsz2QpdNwBrK6YTuJtHQ9fepmVAl2
	 PGuVuoVfispDUcSYf4BPepJtnBQpxMZWOJqzF47xsu3AkkjU2HmGaaPxkN2ScWz6wPgg4
	 Vidphk9JO9Ke+JZ5ptCd8myIU1qFuyYvFHwA9qkXjY5AlzkRcY9Hoo3vrck0MXEbaXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=A15tRyoM;
	arc=none smtp.remote-ip=111.22.67.151
Received: from cmccmta8.chinamobile.com (cmccmta8.chinamobile.com [111.22.67.151])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75A81606A323;
	Sun, 15 Nov 2026 01:24:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75A81606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=A15tRyoM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=A15tRyoMpBKbokLfYjSyqFGUCP8idsbscdEmuLEeYrORrwGYM02iOZ3WV3UqvUG3ZVtj6iTWm5fR5
	 jd3IZDxuCrJmgMD6A4oCn+9Wpq1Emhu7fZM11m2PqlczbVhawv9UBT1/kSa+It3IAy6vt28Wq1iYWK
	 9SJUSuQur21LNOIw=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app02-12002 (RichMail) with SMTP id 2ee26af909dadb6-2fe35;
	Sun, 15 Nov 2026 09:24:44 +0800 (CST)
X-RM-TRANSID:2ee26af909dadb6-2fe35
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from [198.18.0.90] (unknown[112.23.105.246])
	by rmsmtp-syy-appsvr01-12001 (RichMail) with SMTP id 2ee16af909daf1f-54b94;
	Sun, 15 Nov 2026 09:24:44 +0800 (CST)
X-RM-TRANSID:2ee16af909daf1f-54b94
From: Xia Yan <yanxia@cmss.chinamobile.com>
To: netdev@vger.kernel.org,
    oe-linux-nfc@lists.linux.dev
Cc: David Heidelberg <david@ixit.cz>,
    "David S. Miller" <davem@davemloft.net>,
    Eric Dumazet <edumazet@kernel.org>,
    Jakub Kicinski <kuba@kernel.org>,
    Paolo Abeni <pabeni@redhat.com>,
    Simon Horman <horms@kernel.org>,
    Thierry Escande <thierry.escande@linux.intel.com>,
    Samuel Ortiz <sameo@linux.intel.com>,
    Samuel Ortiz <sameo@rivosinc.com>,
    linux-kernel@vger.kernel.org,
    yana06070@163.com
Subject: [PATCH net-next v2] NFC: digital: fix target leak after Type 1 Tag discovery
Date: Sun, 15 Nov 2026 01:23:15 +0000
Message-ID: <1794705795184.22628.49502335540847234602.nfc-t1t-v2@cmss.chinamobile.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

digital_in_recv_sens_res() allocates a target for an NFC-A response.
For a Type 1 Tag, it calls digital_target_found() synchronously.
nfc_targets_found() copies the target into dev->targets.

On success, rc is zero and the callback skips kfree(target).
The original allocation is lost when the callback returns.
Each completed Type 1 Tag discovery leaks one struct nfc_target.

Free the target on the exit path, also for a Type 1 Tag:
digital_target_found() does not take ownership of the target. Keep the
target for other tag types, whose discovery continues asynchronously.

Found during a code review of NFC-A target ownership.

Fixes: 2c66daecc409 ("NFC Digital: Add NFC-A technology support")
Suggested-by: Simon Horman <horms@kernel.org>
Signed-off-by: Xia Yan <yanxia@cmss.chinamobile.com>
---
Changes in v2:
- Free the target on the exit path and add a comment on target
  ownership, as suggested by Simon Horman.

v1: https://lore.kernel.org/netdev/20261109031832.37642-1-yanxia@cmss.chinamobile.com/

 net/nfc/digital_technology.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/net/nfc/digital_technology.c b/net/nfc/digital_technology.c
index ae6487c10a25..62d385a49685 100644
--- a/net/nfc/digital_technology.c
+++ b/net/nfc/digital_technology.c
@@ -483,6 +483,7 @@ static void digital_in_recv_sens_res(struct nfc_digital_dev *ddev, void *arg,
 				     struct sk_buff *resp)
 {
 	struct nfc_target *target = NULL;
+	bool res_is_t1t = false;
 	int rc;
 
 	if (IS_ERR(resp)) {
@@ -510,7 +511,8 @@ static void digital_in_recv_sens_res(struct nfc_digital_dev *ddev, void *arg,
 		goto exit;
 	}
 
-	if (DIGITAL_SENS_RES_IS_T1T(target->sens_res))
+	res_is_t1t = DIGITAL_SENS_RES_IS_T1T(target->sens_res);
+	if (res_is_t1t)
 		rc = digital_target_found(ddev, target, NFC_PROTO_JEWEL);
 	else
 		rc = digital_in_send_sdd_req(ddev, target);
@@ -518,10 +520,15 @@ static void digital_in_recv_sens_res(struct nfc_digital_dev *ddev, void *arg,
 exit:
 	dev_kfree_skb(resp);
 
-	if (rc) {
+	/* Release target on error.
+	 * digital_target_found() does not take ownership of target,
+	 * so also release target if res_is_t1t is true.
+	 */
+	if (rc || res_is_t1t)
 		kfree(target);
+
+	if (rc)
 		digital_poll_next_tech(ddev);
-	}
 }
 
 int digital_in_send_sens_req(struct nfc_digital_dev *ddev, u8 rf_tech)


