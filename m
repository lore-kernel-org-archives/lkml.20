Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1D074F55B8;
	Fri,  2 Oct 2026 16:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790958592; cv=none; b=ZgssluCwusArQQ8NsANAI8dnpZSPVQ4+5QMUneUkV9PNEjFX8p1mtjJ8hhUjSH3kcMtoB8oQ2Egqu36HOcUrXxqMt1Aqyl9A4oy0aA/m9i4dBXVimznSEFXmUTinH3KBq3sE3Ee6yM5METrklVaiUx0aBXPUtrTNqNWuqzTrw2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790958592; c=relaxed/simple;
	bh=LqY4nAIw7vDPjok9zkXL24YJtAS8SbC2dzrCAPs1vOo=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=huQHNbNh95dwiA3CsdEO54kyImmcPcUupuzeueAyqE85TF5lvvrLifEl+pVSGp5RX0NPFXAnzoOswz9zUQ2qC5rWjqNg2AOLjus4qKDewhCmK+qfQ6fZXqRSWcEV7ftZdKXrtaLDXOPQQplmMqo2E2FyPLdMfV5qcP0sC8G1nPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=gZ4Si6UN; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=AwEJmznj; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="gZ4Si6UN";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="AwEJmznj"
Date: Fri, 02 Oct 2026 16:29:47 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790958589;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Mp/raz6owP1ak11y9HmCXn/mq4h+isx1J4PTpvRxRVc=;
	b=gZ4Si6UNYiBeqn5lXY4kkm53OOXhAEy/VkUnpLfk122KfEz5JjNe4LfqUEwUQIfjPQTiT9
	JtIFar/f2JkXSpV3hdT9kx5E23ujPI40hdDYVTrmCJVzDKVmDA3V6DWlchxgLymR6vBtXM
	fAZ4RogjgVEfakB5PN88/q7yEmAnE24iZy4A4IdGuISGs0A6g+HOK03OcymeNvgw8tN0MS
	8ouOEW813Fsb4mGC2Mdq+ZQ6+v0UjncUS50y1T2Nakruvv4yr2pjE2+X+UQ5IMgDKF92o/
	2F1MvfSYQXVB+vw19lufDfGrIsoaywP38UZVT4xVRxiRkl1G7LmOhiH+PZkXOA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790958589;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Mp/raz6owP1ak11y9HmCXn/mq4h+isx1J4PTpvRxRVc=;
	b=AwEJmznj2bSFcNuSwhWiCAXJcUWifcWTAni/9hQsztFsZ+yWXngiWZcBKEAoDp0854eF58
	n8T7bAnIZZjSOUCg==
From: "tip-bot2 for Peter Fang" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: x86/tdx] virt: tdx-guest: Calculate the Quote buffer size safely
Cc: Peter Fang <peter.fang@intel.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 Tony Lindgren <tony.lindgren@linux.intel.com>,
 Xiaoyao Li <xiaoyao.li@intel.com>, Binbin Wu <binbin.wu@linux.intel.com>,
 "Kiryl Shutsemau (Meta)" <kas@kernel.org>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260930103739.2851980-4-peter.fang@intel.com>
References: <20260930103739.2851980-4-peter.fang@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179095858756.3910103.10386457781781400916.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/tdx branch of tip:

Commit-ID:     683cc6010d113bd19693add9150a77862b1231ff
Gitweb:        https://git.kernel.org/tip/683cc6010d113bd19693add9150a77862b1=
231ff
Author:        Peter Fang <peter.fang@intel.com>
AuthorDate:    Wed, 30 Sep 2026 03:30:52 -07:00
Committer:     Dave Hansen <dave.hansen@linux.intel.com>
CommitterDate: Fri, 02 Oct 2026 09:03:18 -07:00

virt: tdx-guest: Calculate the Quote buffer size safely

struct tdx_quote_buf has a trailing flexible array member.
struct_size() calculates the size of this kind of struct safely. It
handles overflow, which helps since the Quote size comes from the host.

Use it to rewrite the bounds check logic, since

  "header_size + data_size > buf_size"

... is more readable than "data_size > buf_size - header_size".

This also prepares for a later change that needs the same
"header_size + data_size" calculation for the Quote buffer size.

AI was used under supervision to collect/apply feedback, review code and
workshop logs.

Signed-off-by: Peter Fang <peter.fang@intel.com>
Signed-off-by: Dave Hansen <dave.hansen@linux.intel.com>
Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.int=
el.com>
Reviewed-by: Tony Lindgren <tony.lindgren@linux.intel.com>
Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
Reviewed-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
Reviewed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
Link: https://patch.msgid.link/20260930103739.2851980-4-peter.fang@intel.com
---
 drivers/virt/coco/tdx-guest/tdx-guest.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/virt/coco/tdx-guest/tdx-guest.c b/drivers/virt/coco/tdx-=
guest/tdx-guest.c
index 83322cd..77c63c3 100644
--- a/drivers/virt/coco/tdx-guest/tdx-guest.c
+++ b/drivers/virt/coco/tdx-guest/tdx-guest.c
@@ -170,8 +170,6 @@ static void tdx_mr_deinit(const struct attribute_group *m=
r_grp)
 #define GET_QUOTE_SUCCESS		0
 #define GET_QUOTE_IN_FLIGHT		0xffffffffffffffff
=20
-#define TDX_QUOTE_MAX_LEN		(GET_QUOTE_BUF_SIZE - sizeof(struct tdx_quote_buf=
))
-
 /* struct tdx_quote_buf: Format of Quote request buffer.
  * @version: Quote format version, filled by TD.
  * @status: Status code of Quote request, filled by VMM.
@@ -313,7 +311,7 @@ static int tdx_report_new_locked(struct tsm_report *repor=
t)
=20
 	out_len =3D READ_ONCE(quote_buf->out_len);
=20
-	if (out_len > TDX_QUOTE_MAX_LEN)
+	if (struct_size(quote_buf, data, out_len) > GET_QUOTE_BUF_SIZE)
 		return -EFBIG;
=20
 	buf =3D kvmemdup(quote_buf->data, out_len, GFP_KERNEL);
