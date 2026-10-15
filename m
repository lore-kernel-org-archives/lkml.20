Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F53E53CA9A
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 19:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792093248; cv=none; b=SZSLRpVbReWBatpEhSl+gAFm1Gelb1NY8KGuWvH/zDmv95Mlq0PSRVlQrODKift8XtE5VPYBVT9F6mFwUiAfhngChxwN1bZy+9hLyqxLqQO9T1vENzeMdEe67uEqfui1f3Yhc+iAdVWVXMrgvba9/d5UaaCHzyAnBwCXl8U188s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792093248; c=relaxed/simple;
	bh=exYz8HojfNFpfT1r/TAXOuBExCBpvaaa/xfi09cNlzo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C5E+gA1xcbtrBDydLsZslcLo/1XtLWLX8uPvZPT63teg1U0v4pB/9GtXcITg2G5nyzlJzVJpXOCX20YhptR6hmXBQ5CH4MKnrMWl0vieWlL/nCDj9DdDI7Eu7BmRYHyDOio8JJ1JhGPgv6dgxdjuo6R5zjqPn+dc9N1RUuTYOu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qacgLhXK; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qacgLhXK"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-487049569b6so3960745f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 12:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792093245; x=1792698045; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=REOYRPOTLjq9QJv9FoE0sRCG3Um2XhJ02u8RHdOrcGU=;
        b=qacgLhXKOC+sSCreea5CASCXLhJqmqczd4HPBRBVZ58M1/N5wAU1qkMTLA0u4TAscx
         Xl3vo7HyLmtX7XpTuAJvyxcTgUjob6OPH8OqerEq4bq7Za4y+aaWb7ge0JpvcVLGH3Ez
         SMok+dIm8wBV5woC55bUWD8gUyOUrC1JDdO8GTJwmnD2ssrWwVwPnouKMef9SWuvAdz0
         rXgibQly6FrJ1e9Kqt1kPJcTY2jw0kBfOe5ZTkddnAXneMfMx3tgW7A83l3XWtbMh1Uc
         v2Nqyy/3wHsd6b0G4JehbYnTdot4SZg40FjzITOTdljnqq3dty42dNHXS0UcNe+MwsdN
         0hfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792093245; x=1792698045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=REOYRPOTLjq9QJv9FoE0sRCG3Um2XhJ02u8RHdOrcGU=;
        b=Vhw3wXxI74p9b9I3Ev2APPtiQ8EDblb49HFYzOIAjp0IzZIHV7H+fOBxCpysVGEsjT
         /mAAGX/WyYcQaO4W7KCnTcw8d4rkPDpydhI95mIiHyvSWxQO5uaSGu7TnvLaVS3kyqIc
         g+/rzb0osz14wQbS6SkC/zx55jVcbnOYYcUx7VI70jNNtaLwajpyote4mlV8V1Izfp00
         ou1kuF/V1f+D/cH38YFq0EpEgH4ARXIT7MN2weTgJFVfqaEYV9lexed2X8YNYccifIf0
         NQLGeFGJbf26SPI5p3/G3jPwL9hzgnJ/fA50vwfTNGoGmqcvvLtAo8I3STuN0CWPApwY
         Kwaw==
X-Forwarded-Encrypted: i=1; AKwUvBxZhg38BtQbkAvSQ8Mjq2T0lQqb3XDz97ufBfHsxXqiMoViOedyE/f8Ome+kiuPqQL0g7VVdJuxNN1XbwM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJgJaHbx42jT4AkWV34tzqPOvMzQKyV2u+jbAZkLnbHJ9NxLCIA
	LKD0j7U0B7XqyIu/dwM9ewKc2VnZ6lo+YUbSEYqBa1Y59v+o6JcowyvS
X-Gm-Gg: AYBFou3Ku9lFPQJCeeLqYNHAZA+ex4sS7hIy5Ya6R2s148jNGQHFpTz4XRgnBTvmlWZ
	GvmZ7S978lgElccdOd3r7CNUZn1H/VWPom1QG2Yobmt35YHUpR856CNJ+Ud2Y6bhH5Q8KK7ihpF
	owIj3Xgr6YxFQ6q5XINI5hE/wlNFNyagdW440eqY+ROM2EQ006ahqw9EddcGyQfk3SW9AxPykmY
	FkD8lnMinB3SqLez8ftljiDBQV27oBYK0L5Bdau65oShORxvn45jQ4uIHa4lmqFl7OFtI09XA7N
	VHJrwU7S1BeDFsZvSRbgXv6JosM83rycOhs0ebjvR/bZGIydy1VSLanM09xfVlRxcpv4QKMOZbq
	OMI3F+aUfHlFuH+aYW5QSHwzAiGWi0DMZHCXwahumvHHp4qupeq2OX99LmofKpHM1GX4XCeFUvA
	Fv5BoLzDm3m08RlOfkgvvOF48xRmM+YDuGwoPo/xH29ju/dvpya4YXb3Y85UjehVCN4zGcdI6Fm
	/ifNdY05NP9Q9+UKziFtLLiViFZvVLzJsdaA+cVA+570a8HThdWkMS+MAmEE10QwjqlLwAbpvnv
	Rodq+ieApUWQOCbh
X-Received: by 2002:a05:6000:4288:b0:488:6ed9:b11d with SMTP id ffacd0b85a97d-48dbacf554cmr39361187f8f.52.1792093245329;
        Thu, 15 Oct 2026 12:40:45 -0700 (PDT)
Received: from center.jhjvjihww5qejoy14qwv1cc4td.frax.internal.cloudapp.net ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd471a72sm195253f8f.4.2026.10.15.12.40.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 12:40:44 -0700 (PDT)
From: Orgad Shaneh <orgads@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lkp@intel.com,
	oe-kbuild-all@lists.linux.dev
Subject: [PATCH] usb: octeon-hcd: fix the kernel-doc of struct octeon_hcd
Date: Thu, 15 Oct 2026 19:40:43 +0000
Message-ID: <20261015194043.1597422-1-orgads@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <202610151637.5srThc2q-lkp@intel.com>
References: <202610151637.5srThc2q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The struct octeon_hcd comment opens with /** but names its members
without the @ prefix, so kernel-doc sees none of them and warns about
every member. aebbc7d63407 added sof_timer without a line at all,
which the robot reports as a new W=1 warning.

Prefix the members with @, drop "pipe", which is no longer a member,
and describe the three that were missing: periodic, nonperiodic and
sof_timer. scripts/kernel-doc -Wall reports nothing for octeon_hcd
afterwards.

Fixes: aebbc7d63407 ("usb: octeon-hcd: sleep on an hrtimer for far-off periodic transfers")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202610151637.5srThc2q-lkp@intel.com/
Assisted-by: LLM
Signed-off-by: Orgad Shaneh <orgads@gmail.com>
---
 drivers/usb/host/octeon-hcd.c | 31 +++++++++++++++++--------------
 1 file changed, 17 insertions(+), 14 deletions(-)

diff --git a/drivers/usb/host/octeon-hcd.c b/drivers/usb/host/octeon-hcd.c
index 4929c6a..d6ba52b 100644
--- a/drivers/usb/host/octeon-hcd.c
+++ b/drivers/usb/host/octeon-hcd.c
@@ -348,20 +348,23 @@ struct cvmx_usb_tx_fifo {
 /**
  * struct octeon_hcd - the state of the USB block
  *
- * lock:		   Serialization lock.
- * init_flags:		   Flags passed to initialize.
- * index:		   Which USB block this is for.
- * idle_hardware_channels: Bit set for every idle hardware channel.
- * usbcx_hprt:		   Stored port status so we don't need to read a CSR to
- *			   determine splits.
- * pipe_for_channel:	   Map channels to pipes.
- * pipe:		   Storage for pipes.
- * indent:		   Used by debug output to indent functions.
- * port_status:		   Last port status used for change notification.
- * idle_pipes:		   List of open pipes that have no transactions.
- * active_pipes:	   Active pipes indexed by transfer type.
- * frame_number:	   Increments every SOF interrupt for time keeping.
- * active_split:	   Points to the current active split, or NULL.
+ * @lock:		Serialization lock.
+ * @init_flags:		Flags passed to initialize.
+ * @index:		Which USB block this is for.
+ * @idle_hardware_channels: Bit set for every idle hardware channel.
+ * @usbcx_hprt:		Stored port status so we don't need to read a CSR to
+ *			determine splits.
+ * @pipe_for_channel:	Map channels to pipes.
+ * @indent:		Used by debug output to indent functions.
+ * @port_status:	Last port status used for change notification.
+ * @idle_pipes:		List of open pipes that have no transactions.
+ * @active_pipes:	Active pipes indexed by transfer type.
+ * @frame_number:	Increments every SOF interrupt for time keeping.
+ * @active_split:	Points to the current active split, or NULL.
+ * @periodic:		Pending TX FIFO writes for periodic channels.
+ * @nonperiodic:	Pending TX FIFO writes for non-periodic channels.
+ * @sof_timer:		Polls the block when the next periodic transfer is
+ *			due, so SOF interrupts can stay off until then.
  */
 struct octeon_hcd {
 	spinlock_t lock; /* serialization lock */
-- 
2.53.0

