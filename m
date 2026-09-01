Received: from mail-4398.protonmail.ch (mail-4398.protonmail.ch [185.70.43.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9476361960
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 23:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788305820; cv=none; b=kCgdBQqxwXhS1WoU1XPbIm1+OJEti6/Tmr/AASt4mnUqJkxckB1lCUxLUfJ9/nrLXZw4gaW5bSOlxMuCa4b6q7RLbSWKkodHDstlpEeHrAATzq70+kf0eK6RJ8zlB8zeLWIXlGmlU4b1tqcaRFkVa/rP7mUh5uSOp7TBcLsA6ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788305820; c=relaxed/simple;
	bh=kFzfT/z7i8u/eQlPJkJrBvsAEjMMsuaPlmVi4qZTaTg=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=HujZ1euv/5HTy83dlcxIXmA2ytF91K9ElSjYApB/YHsMF1XwQluEcVmnMs7uu30Q3A7wwxfyOFfN2hpq5CqVo5B1lfhbpSbHRkhWT1QA/HfyQZPlFYOos1mKLJ/7f+Tsgd8120YjswN43hLKkwpfZWIaOhZfBJlAbEMBn/aatzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tompkel.net; spf=pass smtp.mailfrom=tompkel.net; dkim=pass (2048-bit key) header.d=tompkel.net header.i=@tompkel.net header.b=FzM5rHkN; arc=none smtp.client-ip=185.70.43.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tompkel.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tompkel.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tompkel.net header.i=@tompkel.net header.b="FzM5rHkN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tompkel.net;
	s=protonmail3; t=1788305805; x=1788565005;
	bh=c2W1r5WMq/ndH5dBYNmcAUd4rWXwGFXSSodFJOiRWOs=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=FzM5rHkNxJ9iij4nOW5Te1i0ZGxAmVcojxSxDp0wMbRwMtFvLZ00RK7wUbc3d51SR
	 GFFMZrQ494HG20jKQ3XqO/IgvZSLoL80M1WNuAaDarWJPBBUg4a0Hn58RJyd6uV1RW
	 feiefwtShYXs2JV/+IZxNiz5Z/KUqbuw/gPlmpSoqCQBmejnDowg5HkPpu5TaqpDZK
	 8iQinhWE4LzxQqePi2NjyuEZ0i84M57cl8XrVUT/tkyNRE8iZjpwXkEDucfBn5bf3M
	 UDDJYRkKSgsZX/TkWxE1EJOj4uwli0HCoc9j1TrhfjxW0gqOe8mwsw1nHmKB36Jvs3
	 QVdk31mnDughg==
Date: Tue, 01 Sep 2026 23:36:40 +0000
To: Dave Penkler <dpenkler@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
From: Tom Keller <tom@tompkel.net>
Cc: linux-kernel@vger.kernel.org, Tom Keller <tom@tompkel.net>
Subject: [PATCH] gpib: agilent_82357a: Support some 82357b clones
Message-ID: <20260901233621.1823280-1-tom@tompkel.net>
Feedback-ID: 45376537:user:proton
X-Pm-Message-ID: d74f27e92a4848d8e76bd0584daf15e382b3edd6
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature"; micalg=pgp-sha256; boundary="------f2e6ad6e3c6e710a966f7667faf53d66c9b046a1835b394506ed0d4daf14d5c1"; charset=utf-8

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------f2e6ad6e3c6e710a966f7667faf53d66c9b046a1835b394506ed0d4daf14d5c1
Content-Type: multipart/mixed;
 boundary=fdc75533ae5443978b77f3f54998b6b0ce9cc6c1ef5fc648ee9908c6e234
From: Tom Keller <tom@tompkel.net>
To: Dave Penkler <dpenkler@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org,
	Tom Keller <tom@tompkel.net>
Subject: [PATCH] gpib: agilent_82357a: Support some 82357b clones
Date: Tue,  1 Sep 2026 16:35:56 -0700
Message-ID: <20260901233621.1823280-1-tom@tompkel.net>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0

--fdc75533ae5443978b77f3f54998b6b0ce9cc6c1ef5fc648ee9908c6e234
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Some adapters marked as genuine Agilent/Keysight 82357B devices are in
fact fake. These clones have their own EEPROM instead of loading
firmware on power up, and only respond to the initialization sequence
sent by the vendor drivers. Detect clone adapters that don't respond to
the 0xA0 firmware load request and run the alternate init sequence
against them.

Signed-off-by: Tom Keller <tom@tompkel.net>
---
Because I do not have a genuine 82357B, I can't test whether or not this
patch breaks working adapters, but I did confirm that the clone adapter
doesn't respond to a firmware load 0xA0 request, and the adapter
enumerates as 0957:0718 without loading firmware. A CPUCS read would be
answered by real hardware, but it isn't by the clone.

Vendor init sequences were obtained by running the latest vendor control
bundle (21.3.293) on a Windows 11 VM and capturing the USB packets with
pcap. I confirmed that this change does make my clone function, and as 
far as I can tell th
e clone is fingerprinting the specific sequences. The
clone has poor error handling in hardware and can freeze on a failed or
aborted transaction; in that case, power-cycling the adapter is required.

 drivers/gpib/agilent_82357a/agilent_82357a.c | 151 ++++++++++++++++++-
 drivers/gpib/agilent_82357a/agilent_82357a.h |   2 +
 2 files changed, 152 insertions(+), 1 deletion(-)

diff --git a/drivers/gpib/agilent_82357a/agilent_82357a.c b/drivers/gpib/agilent_82357a/agilent_82357a.c
index 2468a471d..b5c0d34f0 100644
--- a/drivers/gpib/agilent_82357a/agilent_82357a.c
+++ b/drivers/gpib/agilent_82357a/agilent_82357a.c
@@ -566,8 +566,11 @@ static ssize_t agilent_82357a_generic_write(struct gpib_board *board,
 	out_data[i++] = 0; // primary address when AWF_NO_ADDRESS is not set
 	out_data[i++] = 0; // secondary address when AWF_NO_ADDRESS is not set
 	out_data[i] = AWF_NO_ADDRESS | AWF_NO_FAST_TALKER_FIRST_BYTE;
-	if (send_commands)
+	if (send_commands) {
 		out_data[i] |= A
WF_ATN | AWF_NO_FAST_TALKER;
+		if (a_priv->is_clone_82357b)
+			out_data[i] &= ~AWF_NO_FAST_TALKER_FIRST_BYTE;
+	}
 	if (send_eoi)
 		out_data[i] |= AWF_SEND_EOI;
 	++i;
@@ -652,6 +655,15 @@ static ssize_t agilent_82357a_generic_write(struct gpib_board *board,
 		return -ETIMEDOUT;
 	}
 
+	/*
+	 * The write-complete interrupt carries the number of bytes transferred
+	 * in bytes 2..5. Clone adapters do not properly answer XFER_STATUS
+	 */
+	if (a_priv->is_clone_82357b) {
+		mutex_unlock(&a_priv->bulk_transfer_lock);
+		*bytes_written = a_priv->write_complete_count;
+		return 0;
+	}
 	status_data = kmalloc(STATUS_DATA_LEN, GFP_KERNEL);
 	if (!status_data) {
 		mutex_unlock(&a_priv->bulk_transfer_lock);
@@ -1114,6 +1126,10 @@ static void agilent_82357a_interrupt_complete(struct urb *urb)
 	}
 
 	interrupt_flags = transfer_buffer[0];
+	if (urb->actual_length >= 6 && test_bit(AIF_WRITE_COMPLETE_BN, &interrupt_flags))
+		a_priv->write_complete_count = transfer_
buffer[2] |
+			(transfer_buffer[3] << 8) | (transfer_buffer[4] << 16) |
+			((u32)transfer_buffer[5] << 24);
 	if (test_bit(AIF_READ_COMPLETE_BN, &interrupt_flags))
 		set_bit(AIF_READ_COMPLETE_BN, &a_priv->interrupt_flags);
 	if (test_bit(AIF_WRITE_COMPLETE_BN, &interrupt_flags))
@@ -1214,6 +1230,135 @@ static void agilent_82357a_free_private(struct gpib_board *board)
 }
 
 #define INIT_NUM_REG_WRITES 18
+/* Some clone adapters contain firmware already. Genuine adapters only
+ * enumerate as 0x0718 after firmware load; clone adapters enumerate as 0x0718
+ * right away and refuse a firmware load request.
+ */
+static void agilent_82357a_detect_clone(struct agilent_82357a_priv *a_priv)
+{
+	struct usb_device *usb_dev = interface_to_usbdev(a_priv->bus_interface);
+	u8 *data;
+	int retval;
+
+	data = kmalloc(1, GFP_KERNEL);
+	if (!data)
+		return;
+	retval = usb_control_msg(usb_dev, usb_rcvctrlpipe(usb_dev, 0), 0xa0,
+				 USB_DIR_IN | USB_TYPE_VENDOR | USB_RECIP_
DEVICE,
+			0xe600, 0, data, 1, 100);
+	kfree(data);
+	if (retval < 0) {
+		a_priv->is_clone_82357b = 1;
+		dev_info(&usb_dev->dev, "Clone 82357B detected (firmware load request returned %i), using vendor quirks\n",
+			 retval);
+	}
+}
+
+/*
+ * From usb captures of vendor software. Clone adapters require this specific
+ * sequence to function.
+ */
+static int agilent_82357a_init_82357b_clone(struct gpib_board *board)
+{
+	struct agilent_82357a_priv *a_priv = board->private_data;
+	struct usb_device *usb_dev = interface_to_usbdev(a_priv->bus_interface);
+	struct agilent_82357a_register_pairlet hw_control;
+	struct agilent_82357a_register_pairlet writes[19];
+	int retval;
+
+	writes[0].address = RESET_TO_POWERUP;
+	writes[0].value = RESET_SPACEBALL;
+	retval = agilent_82357a_write_registers(a_priv, writes, 1);
+	if (retval) {
+		dev_err(&usb_dev->dev, "write_registers() returned error\n");
+		return -EIO;
+	}
+	// Write init sequence
+	set_current_state(T
ASK_INTERRUPTIBLE);
+	if (schedule_timeout(usec_to_jiffies(2000)))
+		return -ERESTARTSYS;
+	writes[0].address = HW_CONTROL;
+	writes[0].value = NOT_TI_RESET | SYSTEM_CONTROLLER | NOT_PARALLEL_POLL;
+	writes[1].address = LED_CONTROL;
+	writes[1].value = FIRMWARE_LED_CONTROL;
+	writes[2].address = AUXCR;
+	writes[2].value = AUX_CS | AUX_CHIP_RESET;
+	writes[3].address = IMR0;
+	writes[3].value = HR_BOIE;
+	writes[4].address = IMR1;
+	writes[4].value = HR_SRQIE;
+	writes[5].address = AUXCR;
+	writes[5].value = AUX_NBAF;
+	writes[6].address = AUXCR;
+	writes[6].value = AUX_HLDE;
+	writes[7].address = ADR;
+	writes[7].value = board->pad & ADDRESS_MASK;
+	writes[8].address = PPR;
+	writes[8].value = 0;
+	writes[9].address = AUXCR;
+	writes[9].value = AUX_CS | AUX_STDL;
+	writes[10].address = AUXCR;
+	writes[10].value = AUX_LON;
+	writes[11].address = AUXCR;
+	writes[11].value = AUX_TON;
+	writes[12].address = SPMR;
+	writes[12].value = 0;
+	writes[13].address = 
AUXCR;
+	writes[13].value = AUX_RSV2;
+	writes[14].address = AUXCR;
+	writes[14].value = 0x20; // undocumented, sent by the vendor driver
+	writes[15].address = AUXCR;
+	writes[15].value = AUX_INVAL;
+	writes[16].address = AUXCR;
+	writes[16].value = AUX_CHIP_RESET;
+	writes[17].address = AUXCR;
+	writes[17].value = AUX_TCA;
+	writes[18].address = AUXCR;
+	writes[18].value = AUX_CS | AUX_SIC;
+	retval = agilent_82357a_write_registers(a_priv, writes, 19);
+	if (retval) {
+		dev_err(&usb_dev->dev, "write_registers() returned error\n");
+		return -EIO;
+	}
+
+	set_current_state(TASK_INTERRUPTIBLE);
+	if (schedule_timeout(usec_to_jiffies(15000)))
+		return -ERESTARTSYS;
+	writes[0].address = AUXCR;
+	writes[0].value = AUX_CS | AUX_SRE;
+	writes[1].address = AUXCR;
+	writes[1].value = AUX_RPP;
+	writes[2].address = AUXCR;
+	writes[2].value = AUX_SIC;
+	writes[3].address = 9;  // undocumented, sent by the vendor driver
+	writes[3].value = 3;
+	writes[4].address =
 PROTOCOL_CONTROL;
+	writes[4].value = WRITE_COMPLETE_INTERRUPT_EN;
+	retval = agilent_82357a_write_registers(a_priv, writes, 5);
+	if (retval) {
+		dev_err(&usb_dev->dev, "write_registers() returned error\n");
+		return -EIO;
+	}
+
+	writes[0].address = FAST_TALKER_T1;
+	writes[0].value = 0x27;
+	board->t1_nano_sec = 0x27 * 21;
+	retval = agilent_82357a_write_registers(a_priv, writes, 1);
+	if (retval) {
+		dev_err(&usb_dev->dev, "write_registers() returned error\n");
+		return -EIO;
+	}
+	hw_control.address = HW_CONTROL;
+	retval = agilent_82357a_read_registers(a_priv, &hw_control, 1, 1);
+	if (retval) {
+		dev_err(&usb_dev->dev, "read_registers() returned error\n");
+		return -EIO;
+	}
+	a_priv->hw_control_bits = (hw_control.value & ~0x7) | NOT_TI_RESET | NOT_PARALLEL_POLL;
+
+	return 0;
+}
+
 static int agilent_82357a_init(struct gpib_board *board)
 {
 	struct agilent_82357a_priv *a_priv = board->private_data;
@@ -1223,6 +1368,9 @@ static int agilent_8
2357a_init(struct gpib_board *board)
 	int retval;
 	unsigned int nanosec;
 
+	if (a_priv->is_clone_82357b)
+		return agilent_82357a_init_82357b_clone(board);
+
 	writes[0].address = LED_CONTROL;
 	writes[0].value = FAIL_LED_ON;
 	writes[1].address = RESET_TO_POWERUP;
@@ -1346,6 +1494,7 @@ static int agilent_82357a_attach(struct gpib_board *board, const struct gpib_boa
 	case USB_DEVICE_ID_AGILENT_82357B:
 		a_priv->bulk_out_endpoint = AGILENT_82357B_BULK_OUT_ENDPOINT;
 		a_priv->interrupt_in_endpoint = AGILENT_82357B_INTERRUPT_IN_ENDPOINT;
+		agilent_82357a_detect_clone(a_priv);
 		break;
 	default:
 		dev_err(&usb_dev->dev, "bug, unhandled product_id in switch?\n");
diff --git a/drivers/gpib/agilent_82357a/agilent_82357a.h b/drivers/gpib/agilent_82357a/agilent_82357a.h
index 33ac558e5..950d8d4ce 100644
--- a/drivers/gpib/agilent_82357a/agilent_82357a.h
+++ b/drivers/gpib/agilent_82357a/agilent_82357a.h
@@ -126,6 +126,7 @@ struct agilent_82357a_priv {
 	unsigned
 short eos_mode;
 	unsigned short hw_control_bits;
 	unsigned long interrupt_flags;
+	u32 write_complete_count;               // bytes transferred
 	struct urb *bulk_urb;
 	struct urb *interrupt_urb;
 	u8 *interrupt_buffer;
@@ -139,6 +140,7 @@ struct agilent_82357a_priv {
 	unsigned int interrupt_in_endpoint;
 	unsigned is_cic : 1;
 	unsigned ren_state : 1;
+	unsigned is_clone_82357b : 1;
 };
 
 struct agilent_82357a_register_pairlet {
-- 
2.55.0


--fdc75533ae5443978b77f3f54998b6b0ce9cc6c1ef5fc648ee9908c6e234
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="publickey - tom@tompkel.net -
 0x5A43B519.asc"; name="publickey - tom@tompkel.net - 0x5A43B519.asc"
Content-Type: application/pgp-keys; filename="publickey - tom@tompkel.net -
 0x5A43B519.asc"; name="publickey - tom@tompkel.net - 0x5A43B519.asc"

LS0tLS1CRUdJTiBQR1AgUFVCTElDIEtFWSBCTE9DSy0tLS0tCkNvbW1lbnQ6IGh0dHBzOi8vZ29w
ZW5wZ3Aub3JnClZlcnNpb246IEdvcGVuUEdQIDIuMTAuMAoKeHNGTkJHSlJPV0FCRUFDbExobGZ5
czV1RzVRdUNET3hiR1Y2b3lBUlByaGw1eHNyZkx0QUUxSVd4UWhJeE1hRApxQ0VHTkFXZDUzNDBW
cmxhb21yQUw1OFNleHJENS9JSVFhTk1leXA1azUwRTJDMmkrSVlnQzBmaU9tb004TFE0CmI4MTJ6
UktvZUYvUThMR1RaTUkzZkxPb3M4WmRaWDlnbytWUllQMjQ1N1FYSmxOT2QwYWdjbUVpaGIzN2RT
dmUKV0w2NFp3bnZudFFSd1o0QnJkRkZMRTFnSURkMkpsT3pSMHYrZTdJMnpIcTZjbTVYbko2bVdu
QnBwQnRReE9INQpZVDNKbE5DaUlqZFhVSFhkbFB0UUg5NjhGaFVYSXZDSy96Z3BPbTBxMXZhZDBB
SHA1TnhGSXRBZjNxbDZhakNICjg3UUhzYWFHbythajdpYkM3YnFUWm82VGJwcVFQcTFmdU4zNERK
a2FQMUJxd0VoNnhOTE5oS29VSXpPMHFJSXkKK1paMXBLOXpuNjZsTFQ4NjJHZWtXS1hsZXdWUWQ2
M05EbGVqK0R4TXYyMndMT1hOYXpIdUMwYnlZekp0L01INgpIUVcxNEYyVVc1bHFpQmE1cFBxVm92
N2xudGR5QWlSSzZBVGh2anNaelpkcDZTL2ZhQk9KNUNXSFdpdkh3QjZ5CnU5bEdNaWYvSlMwdHJF
Yjl0SWIzdjVQZFJlRGNYV29YSUtjcExiTGJYSDhLTzBob2JYd1hjKytGTVZTenhhU3cKV2VmNjEv
TStsdlMzVWpDWVZSTXBkN1hHVVVobXlDSThqK2VCZG1RcnQ1TDVRaGZXL0p6K1JiVGxvNDQxQWxP
Mwpkcm1FM0FDaG9JZ0tlNy9qRVMrWk44VjByYWhONHRrZlB0ZnhLcDM3WVlEKzJ0STZTZVNKc1RC
QzV3QVJBUUFCCnpTRjBiMjFBZEc5dGNHdGxiQzV1WlhRZ1BIUnZiVUIwYjIxd2EyVnNMbTVsZEQ3
Q3dZMEVFQUVJQUNBRkFtSlIKT1dBR0N3a0hDQU1DQkJVSUNnSUVGZ0lCQUFJWkFRSWJBd0llQVFB
aENSQXZZdzBuaEI1Y0JoWWhCRnBEdFJuNQpMZ1RKaVZCbGR5OWpEU2VFSGx3R3U2MFArZ0t5Z09U
ZW5HS2lyQlk2cUNIODcvclA2aHZEcmhaamE3VjRyOUJLCnN5am1iNy94MXhUWGN2b1pmL1o2UVl2
dzN2bHRiVHp5QnFObnRxeHNHZ0wzQlQyUENKa0lIaDZObXgyZjFNTlgKMGJqakdjY1VjZEt4by9K
bzRvWE4yYTMvV0NTM3BzdXc2ZzNEQVFiazNQS3JEWVI4YkxyZzJheUpQc2xraDdGQQpRVnQyRWMx
clUrV0hqQWVmdWRvMlpRb2dVeHhwckEwN2RLRHFhNDV1aHNzQ1p2d3ViR3FQMklhSTVuOUNrK1Vk
CkppMHBUanhlV09kUnJuMHZxckVib1cvVWZHZXp6dlVVNnVZK05NNWpzbkw5WjJWblFUZTlQeWFQ
RFdSSEhOMTcKaUk2dGdmVFVtbkNMaWtMcWxZOUxTVmNIRGlobWtFdVBQQkpDcnJnbUNjb1JuU3R1
YmxHOXNFSW1qUEk0RThJZwp1QzBWRmJMM3JoN0lzYjc0akdacWptTlBTMmFYc1U5LzJ0NFkrckNS
eldEcTNtdXM4UVFHb1JwSGd4Z1VJZFlSCnNXTGpDYUwvSTV6eEx5SklpSFRFUGhGY1ZsSVF4S3Qw
OHY5R05Ub1AxbC9UeGZrNHlMUXlaaHFjbVhHTUlyU3IKOTVHYXRJWHJXRjBuenY2dmhxL2IrSitD
ZitiV3cvbjlWdkcvWU01VjNXVFgyN3VjRUVFenBLQXphWjNlbmhQVgo5dTY1U205TVpRaFRDK0NK
ZlpSaWE0Z0pVTGZjS2VraVFhSTYrd1VudXhVeE4rMllyOEVqbmxEcFVPTnJrTVJ3ClN2WFUvVnI0
TXdQcVlWOTZEaVJRTzZXQ0hHeVdPczBTOUg0a25GVnZhUTl4d0g4SGpwZEQzOUNnRHNTTGl6bGkK
SXMzRXpzRk5CR0pST1dBQkVBQ3MreXBPeXFDVFRKdXg5ZU90SDRzTEFwNjdGMkYybEc4b1luK3hi
Yit2dFJkdwo2cGhKRld4TW9ZMWxJT0xuNkJweUQyQVZXYllIbTZQQTl1WnhFQzg0VFBNS3FOS3I0
NFJmSFJ0VTU3WWlyb1JCCjBFenNaeDlaZkxpa0VtbjVNZHFUT2M4WHhybVhweVFrd255d1FwRHFK
dEJ6U0dSZGk1OFp3eXVpUWE4SlJ4aTUKQ1pQYU1WWVVmOEhGUjNqQmNCREszYTlsSmo4ZmdWNmNV
bDdsM2dBQWo3cU1MWFYvMkdDV2lDT0ZWWkZIM1JncQp2MDljVHdaRXVyVlRFZFVocnRaRElaZk5q
Y1dyZ3RYWXpwa0JrTUtQVTc5ZXl2eERXSGdRNFRDcFpwaFI4d0NzCnBRYUJVZnNNVWZKNDF1TlNN
aEVKNVFldEowSzRSSjN0MktGVXR6TE4yOFpObmlKb2VGZEVFUkdFREZqQkRsUloKaGcyNVhqcDJs
SjhsaFlJKytGb2Y2MjNlZWhJazNlWThvV1dKanlVSjNNbzRpMkZIMFU1TCtJUGdFdlFybkt1bQpu
anVIcWJlcEhGMms3SDJrTHRpRjViKzI3QWNEeHoyb2V2U2swQStVcXNYNDhBMXhXM0hzODRzUmZx
WE9iQ00zCjh5Y200OWRNRWNoeEFWbkNuSVVVdXJNTExCbnowTkhuR1FnN2RkZHFXR2RES3NqUWdn
L3JRZGpPQkVVR2h4WGQKU3U3WWg3OGI4U2ZwQWpYV3BhZ2xMZlhPcGJtYk5GamtST05mbHkyNHda
b0VIaE53OWovSFo1TlZ0a01XTXc4NAp5eHlXWWRQNXpKdGtlWUg2VkdHblVQaUo1WHZ1c0JraFlv
ZWR1eDc4bnRENmhMd1ZqZHZvMXR4aDBrRkY0UUFSCkFRQUJ3c0YyQkJnQkNBQUpCUUppVVRsZ0Fo
c01BQ0VKRUM5akRTZUVIbHdHRmlFRVdrTzFHZmt1Qk1tSlVHVjMKTDJNTko0UWVYQVpTL0EvOEQ2
WmdyalhSTkt2SXdjY01mU0lGRnVBK3FOaDBYaG1FT3ZWT1k1MHNrVEwzVXhrSgpiYmhvaGd5Rm5J
RHNMSjViSnVOK01jK1lXdW9UYWRSWnd4eTFSTzh1RVNXY05Zdk1KY3J2QjVVOTFNUS92ZXdWCnJj
L05aUStGbmRGSzBpNm80dENRbmd6ZjhzVWJtdDNOdlFyMnIxNitTY0FmeGIrakhBeWNJRUY3VE84
NWpTdEoKeExLWmIxelptYlpMT3N5dFcrK3YzcThYYXp2TmtJOHFsV3FCZnJ0NUswSStSVFU2VnBi
V0M4ZGpKWjFjNUxjMwo1RmZpclE5cnR5aUJIM2djR3pndHFZMWwyQ3JlN05ob0tHZWJteVNTUTRF
VXZkbjdSQXYzNTFxeWkvT2hZUncvCmlCbXhGZ0dWdTJrczBJc2VkMXZGL0UyZkRmdzcwVW43aEE0
SUVTM3FxYWoxcjJKY2c2NkxKcmFMN1VDU1c3U1QKZU5KN2JaQUhXR3QxczBmYUtsZ1grUzdJTVVP
UFlHbnJCK0NldFNBZmZNU3MzOTVBaTgzT2hwdWFKMzh2UmVVeQoxMDVHWnBkQ1kxU1FmdTJqcCtl
cHJjYmNld05RcUQ5bmNwMVlQOXp6alZDWTduRW1CKzhYVXBHdGw2a3c5bFA2Clh6RFYxNXhVbG95
YmxMVWFWbE5BeU5CZWNFQnJVSHIzdGxHZXpoV0FCWWQ0bjRJTGJ6aUFDeU1ibDlIVGlVTHIKblE5
UlB0QmI0cUplYnRpajZWQzluUGUxSm5xMTZmRE14QmRHVElraEowV0NmWFZVcVAwMlpmZ3FacWw5
NUp1SgpWV05xVndDUDVoZXZ0TUVvc2Nlb0pmaDFicm41NFZWaVVRR09NTk1senZYc0FSQ0xSL0FQ
ZzdjU0RMMD0KPTQrNVUKLS0tLS1FTkQgUEdQIFBVQkxJQyBLRVkgQkxPQ0stLS0tLQ==
--fdc75533ae5443978b77f3f54998b6b0ce9cc6c1ef5fc648ee9908c6e234--

--------f2e6ad6e3c6e710a966f7667faf53d66c9b046a1835b394506ed0d4daf14d5c1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: ProtonMail

wsGpBAEBCABdBYJql2GHCRAvYw0nhB5cBjUUAAAAAAAcABBzYWx0QG5vdGF0
aW9ucy5vcGVucGdwanMub3Jn7S/NSXz00WkW5nyBnRTtfRYhBFpDtRn5LgTJ
iVBldy9jDSeEHlwGAABLQw/+OskO70BD8OMasHrcr3e++lNE4ka5lFEOBqm7
A4R+TNAUtC+hCyfgRj+1NLeY1mE3XrDboUmRzRLXa5Im1VsqrjiiF8MfS+oN
eqyJbOiWR9Ts710eoYmL/hE6L/+f4ef55yq0B6ozLRiFzzgTrMoEVxDd13de
km6FpxE0DHnqEEDlWH9e6EWT4AsMVjo237bjKW/cG7US9YBu11wkS8peEU2T
XKIPhzCoWzC/t1N8xodilZ8/uDgHsZW1nAkerDRUxgfU85sfBROoBvjwka6M
Rp4OASVNqrPdDm+DGI32K9evn63fI1SWoY8KSuN5eff8SLe5WV9hP41LIbJf
EM24Gq7Zu4ueHYXNsjn0DT4Ic8Bfn/KNkVU1DL2fxp+ee0yRwj7ViAkm31L5
obC7DPNBEadPNhlxv8gg+iIG5UF6sd27tpBdZyLO/rNs0El8+TnIf7ox7QYD
bm+wIB7P+zjKkVb13/JQtAQ12Rc1zbDTRdzOtKgw63hc3PYhe4eLhRHisGIh
WolyHP/FCa2WyR0JRDOhaw3VDxnUythU1K4cbNxD5NvkRPJOuMKej1p4FXx9
paGrHJsMndcVnwQ5tDEaeh1V8bULoFmYoKh4eJzo7VKaynAuHNnQDrFWV039
YiOUvV8Y43epaGgN53/0GGgO0ZmVgWP62PC4Jg2q3lkYdl0=
=SPfI
-----END PGP SIGNATURE-----


--------f2e6ad6e3c6e710a966f7667faf53d66c9b046a1835b394506ed0d4daf14d5c1--

