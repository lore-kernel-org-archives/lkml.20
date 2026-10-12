Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92BF025B099
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 02:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791771216; cv=none; b=NwUXhy1LYfo8R014zATqwkroIpE7tBHtPQhdtwt+Q3mOwIAL3AGnZo96cADomfyJ1IGrZWrgIUJ4klyucYaZdPIhQ0CoLrBLLmLG5EKFRLuN5Ta1BWEphgX+r4imXA0AoH3VAX9P6I/TJhnX3hay5qKamNu8eMNeR3+TgA4SuF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791771216; c=relaxed/simple;
	bh=ahq+e9skKdY0g3kYWgKoS8r9WsNxNIbkj2z/vRFvSzs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HXl+lSjK/KKXBG4s8mct2E+5JipBryzW9EG9zeWQFC6suxg0gjvcxbqE9p6xmvClb5N5uUuQzuPwD5JNgx2Mf+PfMBzm9Gukgons6+wlP0I2SfUCNTUPT27G1aStkODmRLRu/rojXVXgGYm9FFLgEPPBt+zesFLvEl90ZHnAeh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EAwVpZf3; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EAwVpZf3"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3aacde0cc0fso483301a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 19:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791771214; x=1792376014; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r51QjOdjyHDS4ydy0g2u1yWXhQuhvDWqYc0+ObYdvlY=;
        b=EAwVpZf3LCjfr75ptJdl8Fb6M/TxzvJz7bvrBUhdH/B3n4pe333L1c0X/enHLg+Yby
         tB2DXnaLgRsLT2xsAqyQBdiFzag4WnL77JO4YAeLY+Z+E4vwBZNmgC9bE9S0CUh/wDb4
         cMOM5rbiwLmG+OjaD5FTuDl7IjYNj+VtSY8dC8Fp84YXklkZUC5ybCG8nkCWnfvE5XnM
         HuxJyDk0mHLaieJlALtfBPSPkZ2FmvX22x41bzPO1Fu8Il5Aq1hWXmEYG0Kw9/BAiAfd
         6AWkt67YBtJUG1oF1ubFNPwGns3Z6d6zIZPhC0ADCWG78VBMdjXwSakvp4t8gduODBP+
         jjOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791771214; x=1792376014;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=r51QjOdjyHDS4ydy0g2u1yWXhQuhvDWqYc0+ObYdvlY=;
        b=uRrv+6U2c1tq+8k2Ebz3UqjOkpZVFlFFb40euZEvPjkVzhrmGj8ffBETYwvgpV1Apg
         92o5SDm5goAkh9/ysHKqdOyDyKTIsaZlCv6eNPhy6w2oKM8ZNhQMqENy1UukiJVwrCqs
         tlrVXM/ymYXmNwVwOnG3ZrbS08OMQ12Ug4AOnatLszLBzTwHFc55wToK0O3Uz3yvdPwV
         D3ybcvQBN9kDTdudMYondomgzZUCfdygZJOy9PJ9NfyOyvhpR6s/XW7Rj+AMqWlaprLo
         OyR8P347o07qI8SZIqYBlwzvYX+5nyK/EhdaCHeWrc3i3FAvE2hvQ0BZr8XOp+RygsXt
         cmZg==
X-Forwarded-Encrypted: i=1; AKwUvBzJz9uQ1ydQPduXv9FGaVOZ9dm+jk33+tyjNJ7aetdn34YNghsmtTFC3MC8nPc6ynA5C3zt7ZjpED2AMqo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLo+w6bvjW/3lvedxTEpVQtDkBvI1FshnOix3PMSMCtOd3usniD
	7wtwxF2B1sILnhvDI1iWwAaMfHrPMfwQFLMHyP9yq+D+O3pLmlfGv/S6
X-Gm-Gg: AYBFou27hI5gcH9Qt16NKdx2BpZpkUNfVx9CWnCtJ+Iw46UdklcmjDe16J2ad4GHc4+
	rRZGbsTBvbJSJz78Z7t6uhKW3f2M6kPeXxG9hneWTJyJ0qbLXp3QEUsHSa6vVSrYzBjCe6y4er+
	hKDyH8XU6VoTl4wmryR74HvNYLCQC1Wg9d9fBSMp/2sadrwCs/e2qZ3bt1UVZwGznSvFcjMwVqc
	SdaT5S9Um9zj/It5MI1Sz7etCAvyZSUfQT1IqEuk9UA27BQtqsoYr/44rDmM0nOb2H9HTfMZ/LI
	dVE8BqUUN8YgMGhec+fKWr+gPHD4IZIqGf0NJlkziIAnglblLUtn5Z6/9/wRHcFyYcoO+n/4Sai
	pmriHhOCBINcCGThFDJD2UNN5m67yU3Ww+5k9pRn/7EUwbpzz2djxm4YFPgL/Jp7FaCJ7AdIeri
	7IckAEnBMBEe+uac0COXLFV8S9MmpJh6/dPPYpRWCesSfdw/FZPgk4u5zP4RiPfJYOEoRmN/vco
	GO5pHSPj+QvUoYxZR8PAQ9aAbiPeN/1biY5/XOKFg0UgXFpw4+y5Gg/qfISckc=
X-Received: by 2002:a17:90b:2b48:b0:3a0:4146:295b with SMTP id 98e67ed59e1d1-3ab3a90e8c1mr5707211a91.17.1791771213579;
        Sun, 11 Oct 2026 19:13:33 -0700 (PDT)
Received: from hanzj-mi.. (ec2-99-79-140-187.ca-central-1.compute.amazonaws.com. [99.79.140.187])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab37139b59sm14401085a91.13.2026.10.11.19.13.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 19:13:33 -0700 (PDT)
From: Zhijian Han <hanzhijian1991@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhijian Han <hanzhijian1991@gmail.com>
Subject: [PATCH v2] usb: host: octeon-hcd: fix kernel-doc comments
Date: Mon, 12 Oct 2026 10:13:20 +0800
Message-ID: <20261012021320.3047735-1-hanzhijian1991@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261011133931.GA12345@kroah.com>
References: <20261011133931.GA12345@kroah.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The file has 31 comments that start with "/**" but are not valid
kernel-doc comments because they lack the "function_name() -" summary
line.  scripts/kernel-doc reports "isn't a kernel-doc comment" for each
of them, and they are silently dropped from the generated kernel
documentation.

Add the missing function and enum name lines, and document the values
of enum cvmx_usb_stage, so all these comments become valid kernel-doc
and are included in the generated documentation.

Found by running scripts/kernel-doc -none on the file.

Assisted-by: LLM scripts/kernel-doc
Signed-off-by: Zhijian Han <hanzhijian1991@gmail.com>
---
 drivers/usb/host/octeon-hcd.c | 175 +++++++++++++++++++++-------------
 1 file changed, 110 insertions(+), 65 deletions(-)

diff --git a/drivers/usb/host/octeon-hcd.c b/drivers/usb/host/octeon-hcd.c
index 34ce771fa..2e222af0f 100644
--- a/drivers/usb/host/octeon-hcd.c
+++ b/drivers/usb/host/octeon-hcd.c
@@ -233,12 +233,23 @@ enum cvmx_usb_pipe_flags {
 #define MAX_TRANSFER_PACKETS	((1 << 10) - 1)
 
 /**
- * Logical transactions may take numerous low level
- * transactions, especially when splits are concerned. This
- * enum represents all of the possible stages a transaction can
- * be in. Note that split completes are always even. This is so
- * the NAK handler can backup to the previous low level
- * transaction with a simple clearing of bit 0.
+ * enum cvmx_usb_stage - Transaction stages
+ *
+ * Logical transactions may take numerous low level transactions, especially
+ * when splits are concerned. This enum represents all of the possible stages
+ * a transaction can be in. Note that split completes are always even. This
+ * is so the NAK handler can backup to the previous low level transaction
+ * with a simple clearing of bit 0.
+ *
+ * @CVMX_USB_STAGE_NON_CONTROL: Non-control transaction stage
+ * @CVMX_USB_STAGE_NON_CONTROL_SPLIT_COMPLETE: Non-control transaction stage,
+ *     split complete
+ * @CVMX_USB_STAGE_SETUP: Setup stage
+ * @CVMX_USB_STAGE_SETUP_SPLIT_COMPLETE: Setup stage, split complete
+ * @CVMX_USB_STAGE_DATA: Data stage
+ * @CVMX_USB_STAGE_DATA_SPLIT_COMPLETE: Data stage, split complete
+ * @CVMX_USB_STAGE_STATUS: Status stage
+ * @CVMX_USB_STAGE_STATUS_SPLIT_COMPLETE: Status stage, split complete
  */
 enum cvmx_usb_stage {
 	CVMX_USB_STAGE_NON_CONTROL,
@@ -512,9 +523,10 @@ static void octeon_unmap_urb_for_dma(struct usb_hcd *hcd, struct urb *urb)
 }
 
 /**
- * Read a USB 32bit CSR. It performs the necessary address swizzle
- * for 32bit CSRs and logs the value in a readable format if
- * debugging is on.
+ * cvmx_usb_read_csr32() - Read a USB 32bit CSR.
+ *
+ * It performs the necessary address swizzle for 32bit CSRs and logs the
+ * value in a readable format if debugging is on.
  *
  * @usb:     USB block this access is for
  * @address: 64bit address to read
@@ -527,9 +539,10 @@ static inline u32 cvmx_usb_read_csr32(struct octeon_hcd *usb, u64 address)
 }
 
 /**
- * Write a USB 32bit CSR. It performs the necessary address
- * swizzle for 32bit CSRs and logs the value in a readable format
- * if debugging is on.
+ * cvmx_usb_write_csr32() - Write a USB 32bit CSR.
+ *
+ * It performs the necessary address swizzle for 32bit CSRs and logs the
+ * value in a readable format if debugging is on.
  *
  * @usb:     USB block this access is for
  * @address: 64bit address to write
@@ -543,8 +556,10 @@ static inline void cvmx_usb_write_csr32(struct octeon_hcd *usb,
 }
 
 /**
- * Return non zero if this pipe connects to a non HIGH speed
- * device through a high speed hub.
+ * cvmx_usb_pipe_needs_split() - Check if a pipe needs split transactions
+ *
+ * Return non zero if this pipe connects to a non HIGH speed device through a
+ * high speed hub.
  *
  * @usb:    USB block this access is for
  * @pipe:   Pipe to check
@@ -559,6 +574,8 @@ static inline int cvmx_usb_pipe_needs_split(struct octeon_hcd *usb,
 }
 
 /**
+ * cvmx_usb_get_data_pid() - Get the correct PID for a pipe
+ *
  * Trivial utility function to return the correct PID for a pipe
  *
  * @pipe:   pipe to check
@@ -647,9 +664,10 @@ static void cvmx_fifo_setup(struct octeon_hcd *usb)
 }
 
 /**
- * Shutdown a USB port after a call to cvmx_usb_initialize().
- * The port should be disabled with all pipes closed when this
- * function is called.
+ * cvmx_usb_shutdown() - Shutdown a USB port
+ *
+ * Shutdown a USB port after a call to cvmx_usb_initialize(). The port should
+ * be disabled with all pipes closed when this function is called.
  *
  * @usb: USB device state populated by cvmx_usb_initialize().
  *
@@ -679,9 +697,10 @@ static int cvmx_usb_shutdown(struct octeon_hcd *usb)
 }
 
 /**
- * Initialize a USB port for use. This must be called before any
- * other access to the Octeon USB port is made. The port starts
- * off in the disabled state.
+ * cvmx_usb_initialize() - Initialize a USB port for use.
+ *
+ * This must be called before any other access to the Octeon USB port is
+ * made. The port starts off in the disabled state.
  *
  * @dev:	 Pointer to struct device for logging purposes.
  * @usb:	 Pointer to struct octeon_hcd.
@@ -950,8 +969,9 @@ static int cvmx_usb_initialize(struct device *dev,
 }
 
 /**
- * Reset a USB port. After this call succeeds, the USB port is
- * online and servicing requests.
+ * cvmx_usb_reset_port() - Reset a USB port.
+ *
+ * After this call succeeds, the USB port is online and servicing requests.
  *
  * @usb: USB device state populated by cvmx_usb_initialize().
  */
@@ -983,9 +1003,10 @@ static void cvmx_usb_reset_port(struct octeon_hcd *usb)
 }
 
 /**
- * Disable a USB port. After this call the USB port will not
- * generate data transfers and will not generate events.
- * Transactions in process will fail and call their
+ * cvmx_usb_disable() - Disable a USB port.
+ *
+ * After this call the USB port will not generate data transfers and will not
+ * generate events. Transactions in process will fail and call their
  * associated callbacks.
  *
  * @usb: USB device state populated by cvmx_usb_initialize().
@@ -1001,11 +1022,12 @@ static int cvmx_usb_disable(struct octeon_hcd *usb)
 }
 
 /**
- * Get the current state of the USB port. Use this call to
- * determine if the usb port has anything connected, is enabled,
- * or has some sort of error condition. The return value of this
- * call has "changed" bits to signal of the value of some fields
- * have changed between calls.
+ * cvmx_usb_get_status() - Get the current state of the USB port.
+ *
+ * Use this call to determine if the usb port has anything connected, is
+ * enabled, or has some sort of error condition. The return value of this
+ * call has "changed" bits to signal of the value of some fields have changed
+ * between calls.
  *
  * @usb: USB device state populated by cvmx_usb_initialize().
  *
@@ -1031,9 +1053,10 @@ static struct cvmx_usb_port_status cvmx_usb_get_status(struct octeon_hcd *usb)
 }
 
 /**
- * Open a virtual pipe between the host and a USB device. A pipe
- * must be opened before data can be transferred between a device
- * and Octeon.
+ * cvmx_usb_open_pipe() - Open a virtual pipe between the host and a USB device.
+ *
+ * A pipe must be opened before data can be transferred between a device and
+ * Octeon.
  *
  * @usb:	     USB device state populated by cvmx_usb_initialize().
  * @device_addr:
@@ -1144,9 +1167,10 @@ static struct cvmx_usb_pipe *cvmx_usb_open_pipe(struct octeon_hcd *usb,
 }
 
 /**
- * Poll the RX FIFOs and remove data as needed. This function is only used
- * in non DMA mode. It is very important that this function be called quickly
- * enough to prevent FIFO overflow.
+ * cvmx_usb_poll_rx_fifo() - Poll the RX FIFOs and remove data as needed.
+ *
+ * This function is only used in non DMA mode. It is very important that this
+ * function be called quickly enough to prevent FIFO overflow.
  *
  * @usb:	USB device state populated by cvmx_usb_initialize().
  */
@@ -1190,8 +1214,9 @@ static void cvmx_usb_poll_rx_fifo(struct octeon_hcd *usb)
 }
 
 /**
- * Fill the TX hardware fifo with data out of the software
- * fifos
+ * cvmx_usb_fill_tx_hw() - Fill the TX hardware FIFO
+ *
+ * Fill the TX hardware fifo with data out of the software fifos
  *
  * @usb:	    USB device state populated by cvmx_usb_initialize().
  * @fifo:	    Software fifo to use
@@ -1250,7 +1275,7 @@ static int cvmx_usb_fill_tx_hw(struct octeon_hcd *usb,
 }
 
 /**
- * Check the hardware FIFOs and fill them as needed
+ * cvmx_usb_poll_tx_fifo() - Check the hardware FIFOs and fill them as needed
  *
  * @usb:	USB device state populated by cvmx_usb_initialize().
  */
@@ -1286,7 +1311,7 @@ static void cvmx_usb_poll_tx_fifo(struct octeon_hcd *usb)
 }
 
 /**
- * Fill the TX FIFO with an outgoing packet
+ * cvmx_usb_fill_tx_fifo() - Fill the TX FIFO with an outgoing packet
  *
  * @usb:	  USB device state populated by cvmx_usb_initialize().
  * @channel:	  Channel number to get packet from
@@ -1338,8 +1363,10 @@ static void cvmx_usb_fill_tx_fifo(struct octeon_hcd *usb, int channel)
 }
 
 /**
- * Perform channel specific setup for Control transactions. All
- * the generic stuff will already have been done in cvmx_usb_start_channel().
+ * cvmx_usb_start_channel_control() - Setup a control transaction channel
+ *
+ * Perform channel specific setup for Control transactions. All the generic
+ * stuff will already have been done in cvmx_usb_start_channel().
  *
  * @usb:	  USB device state populated by cvmx_usb_initialize().
  * @channel:	  Channel to setup
@@ -1487,6 +1514,8 @@ static void cvmx_usb_start_channel_control(struct octeon_hcd *usb,
 }
 
 /**
+ * cvmx_usb_start_channel() - Start a channel
+ *
  * Start a channel to perform the pipe's head transaction
  *
  * @usb:	  USB device state populated by cvmx_usb_initialize().
@@ -1831,7 +1860,10 @@ static void cvmx_usb_start_channel(struct octeon_hcd *usb, int channel,
 }
 
 /**
+ * cvmx_usb_find_ready_pipe() - Find a pipe ready to be scheduled
+ *
  * Find a pipe that is ready to be scheduled to hardware.
+ *
  * @usb:	 USB device state populated by cvmx_usb_initialize().
  * @xfer_type:	 Transfer type
  *
@@ -1889,8 +1921,9 @@ static struct cvmx_usb_pipe *cvmx_usb_next_pipe(struct octeon_hcd *usb,
 }
 
 /**
- * Called whenever a pipe might need to be scheduled to the
- * hardware.
+ * cvmx_usb_schedule() - Schedule a pipe
+ *
+ * Called whenever a pipe might need to be scheduled to the hardware.
  *
  * @usb:	 USB device state populated by cvmx_usb_initialize().
  * @is_sof:	 True if this schedule was called on a SOF interrupt.
@@ -2043,8 +2076,9 @@ static void octeon_usb_urb_complete_callback(struct octeon_hcd *usb,
 }
 
 /**
- * Signal the completion of a transaction and free it. The
- * transaction will be removed from the pipe transaction list.
+ * cvmx_usb_complete() - Signal the completion of a transaction and free it.
+ *
+ * The transaction will be removed from the pipe transaction list.
  *
  * @usb:	 USB device state populated by cvmx_usb_initialize().
  * @pipe:	 Pipe the transaction is on
@@ -2100,8 +2134,9 @@ static void cvmx_usb_complete(struct octeon_hcd *usb,
 }
 
 /**
- * Submit a usb transaction to a pipe. Called for all types
- * of transactions.
+ * cvmx_usb_submit_transaction() - Submit a usb transaction to a pipe.
+ *
+ * Called for all types of transactions.
  *
  * @usb:
  * @pipe:	    Which pipe to submit to.
@@ -2174,7 +2209,7 @@ static struct cvmx_usb_transaction *cvmx_usb_submit_transaction(
 }
 
 /**
- * Call to submit a USB Bulk transfer to a pipe.
+ * cvmx_usb_submit_bulk() - Call to submit a USB Bulk transfer to a pipe.
  *
  * @usb:	    USB device state populated by cvmx_usb_initialize().
  * @pipe:	    Handle to the pipe for the transfer.
@@ -2198,6 +2233,8 @@ static struct cvmx_usb_transaction *cvmx_usb_submit_bulk(
 }
 
 /**
+ * cvmx_usb_submit_interrupt() - Submit an interrupt transfer
+ *
  * Call to submit a USB Interrupt transfer to a pipe.
  *
  * @usb:	    USB device state populated by cvmx_usb_initialize().
@@ -2223,7 +2260,7 @@ static struct cvmx_usb_transaction *cvmx_usb_submit_interrupt(
 }
 
 /**
- * Call to submit a USB Control transfer to a pipe.
+ * cvmx_usb_submit_control() - Call to submit a USB Control transfer to a pipe.
  *
  * @usb:	    USB device state populated by cvmx_usb_initialize().
  * @pipe:	    Handle to the pipe for the transfer.
@@ -2254,6 +2291,8 @@ static struct cvmx_usb_transaction *cvmx_usb_submit_control(
 }
 
 /**
+ * cvmx_usb_submit_isochronous() - Submit an isochronous transfer
+ *
  * Call to submit a USB Isochronous transfer to a pipe.
  *
  * @usb:	    USB device state populated by cvmx_usb_initialize().
@@ -2281,11 +2320,12 @@ static struct cvmx_usb_transaction *cvmx_usb_submit_isochronous(
 }
 
 /**
- * Cancel one outstanding request in a pipe. Canceling a request
- * can fail if the transaction has already completed before cancel
- * is called. Even after a successful cancel call, it may take
- * a frame or two for the cvmx_usb_poll() function to call the
- * associated callback.
+ * cvmx_usb_cancel() - Cancel one outstanding request in a pipe.
+ *
+ * Canceling a request can fail if the transaction has already completed
+ * before cancel is called. Even after a successful cancel call, it may take
+ * a frame or two for the cvmx_usb_poll() function to call the associated
+ * callback.
  *
  * @usb:	 USB device state populated by cvmx_usb_initialize().
  * @pipe:	 Pipe to cancel requests in.
@@ -2330,8 +2370,9 @@ static int cvmx_usb_cancel(struct octeon_hcd *usb,
 }
 
 /**
- * Cancel all outstanding requests in a pipe. Logically all this
- * does is call cvmx_usb_cancel() in a loop.
+ * cvmx_usb_cancel_all() - Cancel all outstanding requests in a pipe.
+ *
+ * Logically all this does is call cvmx_usb_cancel() in a loop.
  *
  * @usb:	 USB device state populated by cvmx_usb_initialize().
  * @pipe:	 Pipe to cancel requests in.
@@ -2354,7 +2395,7 @@ static int cvmx_usb_cancel_all(struct octeon_hcd *usb,
 }
 
 /**
- * Close a pipe created with cvmx_usb_open_pipe().
+ * cvmx_usb_close_pipe() - Close a pipe created with cvmx_usb_open_pipe().
  *
  * @usb:	 USB device state populated by cvmx_usb_initialize().
  * @pipe:	 Pipe to close.
@@ -2376,8 +2417,10 @@ static int cvmx_usb_close_pipe(struct octeon_hcd *usb,
 }
 
 /**
- * Get the current USB protocol level frame number. The frame
- * number is always in the range of 0-0x7ff.
+ * cvmx_usb_get_frame_number() - Get the current frame number
+ *
+ * Get the current USB protocol level frame number. The frame number is
+ * always in the range of 0-0x7ff.
  *
  * @usb: USB device state populated by cvmx_usb_initialize().
  *
@@ -2585,7 +2628,7 @@ static void cvmx_usb_transfer_isoc(struct octeon_hcd *usb,
 }
 
 /**
- * Poll a channel for status
+ * cvmx_usb_poll_channel() - Poll a channel for status
  *
  * @usb:     USB device
  * @channel: Channel to poll
@@ -2927,10 +2970,12 @@ static void octeon_usb_port_callback(struct octeon_hcd *usb)
 }
 
 /**
- * Poll the USB block for status and call all needed callback
- * handlers. This function is meant to be called in the interrupt
- * handler for the USB controller. It can also be called
- * periodically in a loop for non-interrupt based operation.
+ * cvmx_usb_poll() - Poll the USB block
+ *
+ * Poll the USB block for status and call all needed callback handlers. This
+ * function is meant to be called in the interrupt handler for the USB
+ * controller. It can also be called periodically in a loop for non-interrupt
+ * based operation.
  *
  * @usb: USB device state populated by cvmx_usb_initialize().
  *
-- 
2.43.0

