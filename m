Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793755660;
	b=MUT9Ncw7DnGEnGcNue/0aKPNrN4kS+xsA+vVB4LC0kqRzAWcTLllyybd6ETR27L3iyBQ
	 22Gc+f0P2oZafu0yN9HLFszmv1d4Vryhch/fhY2POm6vFPjVTdp90EKWNRf71FvTzpHxh
	 6Ek2/wWL84+EE9Va27HLNlo5EFoGu4yXE3FMRUraYymn7lDzntl+V4a7MPAHPRIWZdVNn
	 8096XmFNCRLJC+K0WcXCTYwjuJ8ymASUZe8mVTK32Z2mu/8H2I10Q4GkI4FbQj35gyYmw
	 BRcfIFQOAjrChDyVPX4Ur7O1iOnAQEBjZ2iYxcHvjh7Jriz7Uad1dDlc9QH5hWR8LgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793755660;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=LcfBCZa5adH08J2gOGj2C4Qobxoxc6wsW6LJTMDHw6Y=;
	b=JPkQ0opfFgVZ9nwitTsw1IE7In1LygJSBAEqY39sS74oqQM/35UTpeWm0a2WSotyNrmL
	 8oXMH1MFrYE1Hxs5Jo/lIcVHBPJVbC0jo/+fxGT8VJPzK2OarqSkCHyFH5fxb0Zh30egq
	 Ttw9M79d+OWpLSNsKfI1lvfGPsnofIafEjH29wMnHaX4WJobFBXoQK2/SVU9hiHhyqGGc
	 zApyxFcMy3qpwWwhOEFleep0Py5qVDq/1+vhZft0rrmU4ruP+ZioRrD9t/Lp/gatEElq1
	 Wi/eUrf8cnbbGlfG5NMqRJwFRwSc7/YChGf+cDI42yvrRM7PINVKX4VEuY832KhGZKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gyjMmLt4;
	arc=none smtp.remote-ip=209.85.215.179
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D04EB606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 01:27:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D04EB606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gyjMmLt4
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cc4be0e5351so80650a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 17:27:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793755659; x=1794360459; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LcfBCZa5adH08J2gOGj2C4Qobxoxc6wsW6LJTMDHw6Y=;
        b=gyjMmLt4u4A5pCxKBpjcV1+7W4eE4pEpOw//Jo0IBR9CJJ0cXZCsimaSkQcfVjNmzt
         JhIKoYGmCDw9Jyx5LmvtOvt4gh93G05bafAt/lkzpOSEwKpldMveM5k+wy83M7R1F/M2
         AjBaCXBp1MV9JADZazesyFX8brExYJxWwBO3xs1ECJ1oNX8qWu7M9tp4ooOxvRT5Dcxu
         czMlAV7tVQ/9cwFJoZKusQFIuVy9amhCFyYoFRbJ3xfJS+Dv74DxVnnkqu/UivFx7l5Z
         g6H1hknBoF7NzBTiuwiens2zvQA5WbXbxy+SphHR1gzdP6x9dNtBpA+CS6TcEDHbalS9
         ofLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793755659; x=1794360459;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LcfBCZa5adH08J2gOGj2C4Qobxoxc6wsW6LJTMDHw6Y=;
        b=eLEERGPrHJGGdCxEFUAwR6uhGLKsAq37FTwTTwuxhYy5jgKGPYk8wfvedeNVxX2ESr
         K7PXKr5NEvh1yTRWKoHLAYd7jAzt/q49UotzSaHOaioCVmWf08lVel+J9oK/PC5vMoJr
         W13IaWUU6Qx/arY16dsaV/FYn+z6iWboqZ52hyxv1mGllV8j+AvWECv+laBodNjbSj40
         AJI+FnsOzlDGTotsnsgNLgiv0ypeL3tAGeEaQzQUWRyDC6IHoECImQE0LUTOUB2qrzi3
         xNcVE2cQHTHw/tK8kwU2vNFeWq2TPD946xNeargnimDCO2Lxi9YDyyPcrb9ErQWBa3z2
         fcJA==
X-Forwarded-Encrypted: i=1; AKwUvBwBIEzrLNomcUbzbIDDXWQElkX3ea7evlWCKLNCAfNb6u2I2ChWFGGMV+j4uqbgoUPg19uMSrTA27k0iAM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+iVQYDAfxacST+jAlMPhnh4eAdqNs8Jiax5k/BjsI7wahrU8if
	xqMYVttlWMT1p1kQ39pQlyB0ziK0LeWCDtIUiaWQbwoAEXtDGA5+pfdO
X-Gm-Gg: AYBFou0PzUMkVVVqoM8FG1pETRSpDoagNMFbVAz1Lh2HtxiiQifz6RlWCvrKaBEdozt
	3AWmtL2l+Xgk0WYkAReUUgrDwJJxZuwTFJ6XpcRlFjCDtkOgq0paVuwukGOU10nlVl7At8DWu3X
	TM1X3UEbMJPMoXmk5rn5FFP2XFURxM36l6VeSdEQJo80ViPxfFz5IlDQIRiDB99ucVbnoGu7QVa
	gDMW/3fNNrMk7lFTV9q23fOX5DPOk71+0WkCDvwGcdDY3WT5VRonmlJpI1SWoXSHfO6p4Oohm1Q
	ubWjQCkwQbDsQ7RwIyx6qQ32QwDjFv5nLw6U/cTIT8LiHm8tvN3qo7xFZXoDVBxW/QlEhp9ddtC
	25eh+8fjZxvxHl+7l5M59QWvzYubDvQ7apSebtVq6InaKjhEOAjjRHj+gZJzRSx4ZWjV+d8AyLy
	fy+byb3vKa6w1eKXyaMUeNhZA4XjCaXAPjK/mSsEcJp+Z5iNb8x0v9kV0LyGYFdL+S1o5EJhfK8
	rWn/QMwoVYwPRKUHM+vBIHSEYnfMiNpIxX7+vs0T/X5nf0ufa9U6/aJqjPzllXkewtFS9UYzAA5
	96NpJ4QLE+iK+eR4uBAH2yFME1nWnj/T4nnow3bsEgCdR5NqNhlbGDyvXV1NZ8RsUVohY+N58zX
	3viHb
X-Received: by 2002:a17:90b:3e83:b0:3ab:2737:3396 with SMTP id 98e67ed59e1d1-3ae89855ccbmr12751140a91.65.1793755659155;
        Tue, 03 Nov 2026 17:27:39 -0800 (PST)
Received: from evo ([183.171.191.8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b093d481a3sm1334902a91.1.2026.11.03.17.27.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 17:27:38 -0800 (PST)
From: Ambareesh Balaji <ambareeshbalaji@gmail.com>
To: mathias.nyman@intel.com
Cc: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ambareesh Balaji <ambareeshbalaji@gmail.com>
Subject: [PATCH] usb: xhci: Tear down host on Reset Endpoint and Set TR Dequeue timeout
Date: Wed,  4 Nov 2026 01:27:25 +0000
Message-ID: <20261104012725.147741-1-ambareeshbalaji@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a command times out, xhci_handle_command_timeout() aborts the
command ring. The aborted command is turned into a No-Op TRB, so its
completion is handled as a No-Op and the command's own handler never
runs.

A timed out Stop Endpoint command already halts the host and tears it
down. Reset Endpoint and Set TR Dequeue Pointer timeouts are not
handled, so the endpoint stays halted (EP_HALTED or SET_DEQ_PENDING)
and its cancelled TDs are never given back. A driver waiting for those
URBs, such as usb_kill_urb() during unbind, then waits forever.

Reset Endpoint and Set TR Dequeue Pointer change endpoint state in the
host controller only and never talk to the device, so a timeout means
the host controller is not responding, as with Stop Endpoint. Handle
them the same way: halt the host and give back all URBs with
xhci_hc_died(). The endpoint state flags are not cleared here, because
the endpoint handlers and URB dequeue check XHCI_STATE_DYING first.

The timeout was reproduced on an AMD xHCI controller passed through to a
QEMU/KVM guest. An endpoint halt was set on a usbhid interrupt IN endpoint
and the doorbell of the Set TR Dequeue Pointer command queued by the
usbhid unbind was suppressed with a kprobe, to emulate a host that does
not answer the command. Without this change the unbind blocks forever in
usb_kill_urb(). With it the command times out, the host is torn down and
the unbind completes. Normal unbind and rebind of the same device is
unaffected.

Fixes: c311e391a7ef ("xhci: rework command timeout and cancellation,")
Signed-off-by: Ambareesh Balaji <ambareeshbalaji@gmail.com>
---
 drivers/usb/host/xhci-ring.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index c23434001e9c..b03ff184c074 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -1755,20 +1755,23 @@ void xhci_handle_command_timeout(struct work_struct *work)
 	usbsts = readl(&xhci->op_regs->status);
 	xhci_dbg(xhci, "Command timeout, USBSTS:%s\n", xhci_decode_usbsts(str, usbsts));
 
-	/* Bail out and tear down xhci if a stop endpoint command failed */
-	if (TRB_FIELD_TO_TYPE(cmd_field3) == TRB_STOP_RING) {
-		struct xhci_virt_ep	*ep;
-
-		xhci_warn(xhci, "xHCI host not responding to stop endpoint command\n");
-
-		ep = xhci_get_virt_ep(xhci, TRB_TO_SLOT_ID(cmd_field3),
-				      TRB_TO_EP_INDEX(cmd_field3));
-		if (ep)
-			ep->ep_state &= ~EP_STOP_CMD_PENDING;
+	/*
+	 * Bail out and tear down xhci if an endpoint command failed. An aborted
+	 * command is turned into a No-Op, so its handler never runs and the
+	 * cancelled TDs of the endpoint are not given back.
+	 */
+	switch (TRB_FIELD_TO_TYPE(cmd_field3)) {
+	case TRB_STOP_RING:
+	case TRB_RESET_EP:
+	case TRB_SET_DEQ:
+		xhci_warn(xhci, "xHCI host not responding to %s\n",
+			  xhci_trb_type_string(TRB_FIELD_TO_TYPE(cmd_field3)));
 
 		xhci_halt(xhci);
 		xhci_hc_died(xhci);
 		goto time_out_completed;
+	default:
+		break;
 	}
 
 	/* mark this command to be cancelled */
-- 
2.56.0

