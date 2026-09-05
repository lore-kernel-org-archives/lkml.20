Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E892425899
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 08:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788596332; cv=none; b=f8JXLl/IPd2NrzKqPKO3VZ97ZWMOTW3IHroG9Q7fXmKmONyNKPzCGH3q9k3KdvFCFgssRIMjIrVvMhS5ycDSIBca/lcbyj5DTz1Y8Iktu+xPTh7qg/X9xbakLMs4jHJt13Zt6g0lfN+1TM8/9LzwL2J9lVS3EO9G8MNCC47l7rE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788596332; c=relaxed/simple;
	bh=LcV6lSrpWLoOW3X9p2m00fvDtaDYlaeaqqnY35X9hKc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BPoCI6T9CuPSyJH1m8R3irk8qSuSNtDXrtq7P8S1/VxqJxn9f+0pksGKZSLMFVvJsIPeQ00tpZxB4B4SJciaZolzBm0xK1OxqHRK4sYMR5Wwo/aqz1w+HGoBkMfANe/weEyU38FKNpnOLlr95YXNOb70OBIeWOl3Y/sBaw0nm30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cKW2f6qZ; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cKW2f6qZ"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-484362f5c4aso2221770f8f.3
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 01:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788596326; x=1789201126; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cgqxDORdFMqtuRxeNyJ9bVyTrltmlrg6V0F9LjNGATA=;
        b=cKW2f6qZC0ek6uWJE5XNB5Nmm3tJoChf8joNq6eZEz1U8zphBKNk59ikWPtB+C+Rhy
         FbxfoXm58JPbTmc6oR0TC7LMR5QEbGD2Axvpjxq0qcd/R1gUqpmCwgUg2rZwRY9XC9vB
         9ftXjT/MSBVtIuOoDhJiFl6K5IUPh/mB3w6bOPc0Uikt3kkGz2R7QDvGmLjqub5adgxk
         D9/KyMU9omzX7hcPHWUighvZqhUndBo+FqjoXdBq8FobUFz1fWormZ/UL9yjlq49lrP9
         nK1uR3uaqi+933ta8h9wBvl6cvRPl/NQdLGjFe+mBeAGAwBIy71mZ39+aKtKH/ng8ji9
         xsxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788596326; x=1789201126;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cgqxDORdFMqtuRxeNyJ9bVyTrltmlrg6V0F9LjNGATA=;
        b=Suh7bwsM0dxq+XNpWrAnsS0AUvdcoSx2TPYEwruicc3aCX/jH7AMjCMVbRN5RRoPWa
         J/c1qrdlrvCaK2P3QRa8lVzGh9Eq1hJT4+iABvHq7wNU3ljzjThdGTUHMdxY0CAJbbvA
         GXBs9jlvmajr3yL2D8nmKQq50Xhq6tutUQ64qMX1JO2E00sVQo5kmhfrEuhce3kDcF35
         OVoIjplow6e+OUKBfiZJMaobMn6hRzV8fd1Dr3eESaQPdJCBbu5YKQMuqb4AEi4tHOAj
         ug0u6UUG1PN7rI2l2oYdFiZFW8h+8mqWN6QGIqaqzkYolA2MiF8kEDV7iT4JIyPh640H
         UT7w==
X-Forwarded-Encrypted: i=1; AKwUvBw3hCIOHexsp7mzJv6La42AlBcCWPwS3yTCQYTP0PUgnXw0o8QOpImr33agTzrh+LGXy3gOIV7CUg6lBT4=@vger.kernel.org
X-Gm-Message-State: AFuF++kxd3ebmVcswX09nUyVMt5b/8S/feLxe+9swJZzWNy9pX823FHx
	Hk4XuSaj2wzma5by+huX6KIBbycFGgmnI5AYXg6lNkQaSDAkzmhN2YyU
X-Gm-Gg: AYBFou0NDFNY57pf8hANaFDqlE/kEGMLGPy7gxCwHZhW1FlGd82Y7FtmEv5lGkCFLe6
	0XO6BX9gRDDrZoMT/kUIwh9WKhcLHrmzAbJCa153K3Fv3/KWuissCArvYuGLVZ5gOrXJSh+x5b3
	hS3r+Mk+zN86vEjzzpExKXQqmr7aus/AaEgAsEHLTyPHFacGEZr59COrV3Zv0RQDf117H1VUUKH
	M/X7CFg7KWAVATrHkYuI7BU4ip5tnmWRRs2lUIOSvy/RI+loHC988uqvpMDgTH0cG+VsLF59ySp
	HBRgerGsg2jvlTXXAEVMHkwgqQzNH4YWgfThiwhoweCcGOq6h1WIOXNUM2OQNg6gt8ThsHE+CBr
	UQGXIffCFYLiqX05G+ic620a4h8PSKBkbIbtpNX7g4Bvt7iQRpL/hY6jj+5xdPm6m2MdRSCEmfF
	+forGqKyApzLpolBM/RY6bjMj4wWpxibC6CpC43lephIh4J8i2rapMGNziul3S01+YDmWNBQ==
X-Received: by 2002:a05:6000:18a8:b0:482:ea08:8c8a with SMTP id ffacd0b85a97d-48587090294mr20570721f8f.20.1788596325622;
        Sat, 05 Sep 2026 01:18:45 -0700 (PDT)
Received: from foxbook (bfg95.neoplus.adsl.tpnet.pl. [83.28.44.95])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c6ba4sm13584171f8f.25.2026.09.05.01.18.44
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sat, 05 Sep 2026 01:18:45 -0700 (PDT)
Date: Sat, 5 Sep 2026 10:18:37 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: wakasio <scarabeeta@gmail.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: xhci_hcd / ASMedia ASM4242: Bulk-OUT -EPROTO with Logitec
 0789:0308 during DVD+RW recording
Message-ID: <20260905101837.4b7849c5.michal.pecio@gmail.com>
In-Reply-To: <20260905031011.954183-1-scarabeeta@gmail.com>
References: <20260904203024.52398f1f.michal.pecio@gmail.com>
	<20260905031011.954183-1-scarabeeta@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat,  5 Sep 2026 12:10:11 +0900, wakasio wrote:
> Cluster 1, right at the very start of the cdrecord invocation
> (before any error is visible to userspace), ~45 seconds before the
> actual failure:
> 
>   Stalled endpoint for slot 1 ep 2
>   Hard-reset ep 2, slot 1

Seems unrelated.

> Cluster 2, at the exact moment cdrecord reported the write error
> (matches the timestamp of "write track data: error after 103088128
> bytes" in cdrecord's own log):
> 
>   Transfer error for slot 1 ep 3 on endpoint
>   Soft-reset ep 3, slot 1
>   Transfer error for slot 1 ep 3 on endpoint
>   Soft-reset ep 3, slot 1
>   Transfer error for slot 1 ep 3 on endpoint
>   Soft-reset ep 3, slot 1
>   Transfer error for slot 1 ep 3 on endpoint
>   Soft-reset ep 3, slot 1
>   Transfer error for slot 1 ep 3 on endpoint
>   Hard-reset ep 3, slot 1
>   usb 6-1: reset SuperSpeed USB device number 2 using xhci_hcd
>   xhci_hcd 0000:77:00.0: Stopped on No-op or Link TRB for slot 1 ep 2
> 
> So to answer your question directly: it is not constant background
> noise throughout the write. It's a single, tight burst of 5 "Transfer
> error" events on the same endpoint within about one second.

Short fraction of a second, I suppose. Timestamps would help.

4 is the number of retries without ep->err_count reset, so it seems
they all happened in the same URB, possibly in the same place.

Let's add more debug logging and see if it's some transient stupid
problem that we can wait out or plow through with more retries.

One more dynamic debug will be needed with this patch:

  echo 'func handle_tx_event +p' >/proc/dynamic_debug/control
  echo 'func process_bulk_intr_td +p' >/proc/dynamic_debug/control
  echo 'func xhci_reset_halted_ep +p' >/proc/dynamic_debug/control

--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -2511,6 +2511,8 @@ static void process_bulk_intr_td(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
 
 	switch (trb_comp_code) {
 	case COMP_SUCCESS:
+		if (ep->err_count)
+			xhci_dbg(xhci, "clear err_count at %px\n", ep_trb);
 		ep->err_count = 0;
 		/* handle success with untransferred data as short packet */
 		if (ep_trb != td->end_trb || remaining) {
@@ -2522,6 +2524,8 @@ static void process_bulk_intr_td(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
 		td->status = 0;
 		break;
 	case COMP_SHORT_PACKET:
+		if (ep->err_count)
+			xhci_dbg(xhci, "clear err_count short at %px\n", ep_trb);
 		ep->err_count = 0;
 		td->status = 0;
 		break;
@@ -2534,9 +2538,10 @@ static void process_bulk_intr_td(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
 		goto finish_td;
 	case COMP_USB_TRANSACTION_ERROR:
 		if (xhci->quirks & XHCI_NO_SOFT_RETRY ||
-		    (ep->err_count++ > MAX_SOFT_RETRY) ||
+		    (ep->err_count++ > 10) ||
 		    le32_to_cpu(slot_ctx->tt_info) & TT_SLOT)
 			break;
+		udelay(5 << ep->err_count);
 
 		td->status = 0;
 
@@ -2706,8 +2711,8 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 		status = -EPROTO;
 		break;
 	case COMP_USB_TRANSACTION_ERROR:
-		xhci_dbg(xhci, "Transfer error for slot %u ep %u on endpoint\n",
-			 slot_id, ep_index);
+		xhci_dbg(xhci, "Transfer error for slot %u ep %u on endpoint at %px resid %u\n",
+			 slot_id, ep_index, ep_trb, EVENT_TRB_LEN(le32_to_cpu(event->transfer_len)));
 		status = -EPROTO;
 		break;
 	case COMP_BABBLE_DETECTED_ERROR:






