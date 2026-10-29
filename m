Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793259165;
	b=fS5x+KanZavhDgTWU4J3+k63UE11PpiKg3KSNcb5i/5bfUSn7GkWAIaNT2G8qobG085g
	 tAMXXLHHEOj0NKPuPS2JRV1BNm5O9KnQlM2kTZex79J2QSkj+mFzueNafHcTQydhy2sGM
	 ivrn1106qi24lthH6KmoSUDOSj7LU0NcKAI2o02nYRL4aBlhlq//z98lEd3a6pe7LaZLr
	 xzpDqKhOe+q02+ofod7WxaBCpvdIYjQwkIxC2jdJzW4g+V2k1Xqm3arLkM7/Nz9mVG8vY
	 fXohCSdKav/w1fErAlQV4iynRHks3vCc/G4ftbKlKDD3Lg/gZ7sfRRYWMKjsPCjfdNw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793259165;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=j4Ed4CEOWJoumy28IJz+IqA5FsEQuqQ4XRpEYMNLtlg=;
	b=dmCLYVVEnoEQV8B6OqIk1unzWnT0+k9rC4jB5z3iPAvxGBGM8OHuQrkACo9ywc/GeYZB
	 1Zdi2Cj+WHFW8+5JBkObVSNeluBMD5uxow8uNrW1jkaeomviRcqHNRKwPnL15RKvPh+oX
	 qtZlSdZALCir8deYeItCuIJAUL4y0JsIasRSZdE03aGA8fCGfVIgFnCmlpreS2Bwg3PaR
	 mpCRZfoX9yq4DLpzcRT5nmR+Df6mm5C23+2G0WITsOOpQEoow2AjPuYvK4v/TT8mFatzZ
	 ykp5mcESBT5ucruFpZDZ4oQOWrdMXffdfi7biSvOm8YBs1GROEXQsSGvfkaShgn8FHQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yuzi.co;
	spf=pass smtp.mailfrom=yuzifovich.name;
	dkim=pass header.d=yuzi.co header.i=@yuzi.co header.a=rsa-sha256 header.s=google header.b=KHTI00+I;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DC2C606A324
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:32:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DC2C606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yuzi.co
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yuzifovich.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=yuzi.co header.i=@yuzi.co header.a=rsa-sha256 header.s=google header.b=KHTI00+I
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso1021250eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 00:32:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793259164; cv=none;
        d=google.com; s=arc-20260327;
        b=KfWT6gsw9P7pifwMYcQNcs+gUVJhMBSeB9g8hzIBoHLBuBRwq5IYSw+n6URcxuJa8h
         ju0/DySC7bGWZnpXrL+DutZaXLbaDA9Qm1yl/aCjnvbYTeeBX8AYgwVME1xqRzVDK9kG
         gweW6hso7R7v8v19Tu2fTf69BgBOeL0cCrY6VXWpMFXaQ3Mok5WrkX08GPXeSw7YMiqb
         dvwyicJaXnT6KZLDg7Dsu6Gpscj5jArk9QPK3zCw8DCz2rHLW2RaoQpTxxLj8MH5phYP
         GqWlhuGf76JkxIP9OsR0R21QFXVAzspXPvuqLMQrPp0hhaYxhRKqiIPyidk0Y7kNJzax
         m1rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=j4Ed4CEOWJoumy28IJz+IqA5FsEQuqQ4XRpEYMNLtlg=;
        fh=CFNk6adGdIQYB2YCOcaSx0fFH8CM3juoA7LW0yV/1mo=;
        b=OVCieKFa6Ymq7M1ZYIcK/vTq+UezCa5xn5Ests4p87GD1pLGqNBpVWwbnPHqDLzlot
         UET5h9ejL0PGeIaMcXkV7cSe39ZgHteCwGzpKp2lsPLh8IbwmyZXhlvTDd2Tmw2XXcvy
         A1Z1kWpwgsMXtowrXl+fuhf5U3+RG2Quh/kxLfwabuabFeZmgDSiH3JW8aIvMzqHolnE
         Dy/KKYQhjtVrC5EcM//Sp8VU65UZm9+wxe3bP1yrvZ2O5oj/ZiEGzhCwSigmR6rErgz5
         9RD8Yhc1WCJhsIKg0KFP1rT06sa6NuuV3yYF9qM3L+NKUDw3MUllFTBYn/UQAXHJ3QyC
         TSNA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=yuzi.co; s=google; t=1793259164; x=1793863964; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=j4Ed4CEOWJoumy28IJz+IqA5FsEQuqQ4XRpEYMNLtlg=;
        b=KHTI00+I1+8dcBXcZ+DZoOAJPZ1OAC7c05KTPTRFrSk32K4BqX/NxuMewmgRAG04sa
         gckqJUXiHJM/mG7sOxIhszrkHQpix7n/TQ6xprf9K291yb1M22mloRz4Wtb9FW1kIF0l
         OICwzXgxqKuRAYpETNyEq8M1ewbXo36yVuzJ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793259164; x=1793863964;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=j4Ed4CEOWJoumy28IJz+IqA5FsEQuqQ4XRpEYMNLtlg=;
        b=pmJiTWloya+Kp5G+Ij70qzAV3Int1/RGEuiMN+rAqVVJYBDemPuK9VyHvoKEnGru9D
         zkL2jqrd9OI3qXcct5EgSEo8rUXE1mOmfu4yKJduJopKB9YA1JeNNKM1quHfoZCDBDy8
         Xzof40d14P7VATammo7D5jaGXNDvGZ08b+aiDw4mP8JUHSOkFYuDGa2SjucUQfMxwSs7
         k0cSCzCxjboWwTEwOIUUUNXYqWm5RinrT4WmWlHvPrp9PhmH+P+hw3BVQ879YC8RSOKv
         GDHUV5nqclIr6bKszh3aMCXYupJ87WG9FMg/MNhVb3/Pwh8/ZvCKmPoYURPlFNe2mB7a
         DfHw==
X-Gm-Message-State: AFq9FYLj7uoRK0/+blLxm+Qh2yuRtmfy9nALEHSiOo35XGZGw4RZ/uKa
	1YTx8/Hse8jOvxPUWTIDZIT7NbmnxmWlL60YTqh8ZCL+XiVrC6YDUmqO1S0HjecBzsnTfQUvDi8
	drNtgpaqBD2OPBDcDj1JLKqplgDwnJT5Up9SCyh6yfSS3u/LN/cYXPDcxkA==
X-Gm-Gg: AYBFou00TPlHnDWGg7DHQs4S4vzKYp0IHFHshvLBJL+omK23qWTrYcWZE2loPDDGCkh
	iVuLMXBotAuDyqsBR9XBn1PkPt2x05eEDgqPLPrrp3yqy8BAtuxCbW1UJDQgNC8ieT9/A/YgNoP
	VJJs8Lnqj78Zlt1yZkNMObokvrxgy3RFrBRBbPgtEEveVGI8bh1+z9tD2E3Im/DGeh1sUDeq6gM
	3E1K53YohR2OnuItaEaDHwTCQOxsLW91+5q8kjMdlxFy7d0fq02JiYE+7EoqzPivL/GBBV7DKVI
	lb1XBpbc/6n8JLyncmi7QG3MxUa5tnAgsLcjWM9S3qR1eZ7u0s5fCaMRilsjK4HePXrq5gcDDoc
	A2RLsmx8ohRpbqigWt6O6tHS+v133ZmOwEgqMxJIEq0hjElrD+RXMygFcZQdnFkQOMbIhblg7vd
	rK/+CjCF3bdEDmgDlJvXGO3lLiIRfPAng7Rf19nyopzLIq0WxgqbBEfLw/OzPP5jh15rH1dYqOg
	skiFz27cjEFwzFP4DQqut2d2PpKdkadYUToQQ==
X-Received: by 2002:a05:7301:640b:b0:369:f291:49da with SMTP id
 5a478bee46e88-36a2044be5dmr6538811eec.40.1793259164162; Thu, 29 Oct 2026
 00:32:44 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Vadim Yuzifovich <vadim@yuzi.co>
Date: Thu, 29 Oct 2026 09:32:17 +0200
X-Gm-Features: AclHuK_gTjrecGKcr20z4umFf70BrnLbeaQXZwtWfSdIOW4KFmRzyuodCJNPJsI
Message-ID: <CAH_=YdDCDyFBn2k18w8Ck5jrmHHZme7TuAA71hSgcAa9ZPb38Q@mail.gmail.com>
Subject: Re: [PATCH] usb: dwc2: Disable gadget descriptor DMA for Sophgo CV18XX/SG200X
To: linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 24, 2026 at 07:52:20PM +0800, Chen-Yu Yeh wrote:
> dwc2_set_cv1800_params() disables gadget DMA (g_dma) but leaves
> g_dma_desc at its default, which dwc2_set_default_params() takes from
> the hardware capability. Descriptor DMA requires g_dma, so
> dwc2_check_params() rejects the combination at probe time:

With g_dma off this only removes the warning, so no objection to the
patch itself.

For the record, in case someone later wants gadget DMA on this SoC:
we run the SG2002 (NanoKVM, DWC_otg 4.20a) as a peripheral with g_dma
and g_dma_desc both on (mass storage, HID, ACM, UAC1). Descriptor DMA
works there, but only with three dwc2 changes. Without them it is not
usable, which may be why the platform parameters turn DMA off.

1. Bulk and interrupt endpoints raise BNA and are never restarted.

With the video pipeline loading DRAM, the mass-storage bulk IN
endpoint hit BNA every minute or two. dwc2 only logs that at debug
level. The endpoint stayed disabled with an 18-byte REQUEST SENSE
reply current and the CSW queued behind it, the host's command timed
out after 30 s and it reset the port, taking HID and the console
with it. Once, after a run of resets, the reset itself wedged the
core. When read in the BNA handler, the descriptor is host ready,
last, short, IOC, 18 bytes (0x0e000012).

2. The cause: the core fetches the descriptor before the CPU's stores
reach DRAM.

dwc2 writes the chain to coherent memory and then enables the
endpoint with writel(), whose fence orders the stores before the
MMIO write. On the C906 that is not enough. A host sent TEST UNIT
READY (plus REQUEST SENSE) to a CD-ROM LUN as fast as it could,
about 2600 a second, while a 1080p60 H.264 stream loaded DRAM.
About 0.8% of transfer starts raised BNA, 99.5% of them within
20 us of the enable, with DxEPDMA still at the head of the chain.
Without the stream: none in 254000 commands.

BNAs per variant, on one boot (diagnostic build, about 780000
transfer starts a minute each):

as is 6215, 6510
mb(), read last descriptor back, mb() 0
th.sync.s 0
udelay(2) 2
descriptor as two word stores, status last,
dma_wmb() between 3728

Mapping coherent memory non-bufferable (MAE type SH) did not change
the rate. Reading the last descriptor of the chain back between two
full fences before setting EPENA fixed it: none in 6.2 million
transfer starts under the same flood, and none in a 60 minute run
at 1080p60.

3. Isochronous OUT endpoints are not restarted after BNA.

After a BNA, dwc2_gadget_handle_ep_disabled() runs its buffer DMA
frame loop and moves target_frame off TARGET_FRAME_INITIAL, so the
OUT token handler never restarts the chain. Meanwhile the core
raises BNA for the disabled endpoint as fast as the handler clears
it. With a UAC1 capture endpoint and eight requests, one 8 ms
interrupt latency was enough to take the whole core until the host
reset the port.

(1) and (3) look generic to dwc2 descriptor DMA. (2) is specific to
the C906 or this SoC's interconnect. We have not checked whether other
drivers that rely on writel() to order coherent-memory stores are
affected too.

The patches, against 7.3:

https://www.google.com/url?q=https://github.com/yuzi-co/linux-sg2002/commit/80fca5c88a2c&source=gmail&ust=1793345520406000&sa=E
https://www.google.com/url?q=https://github.com/yuzi-co/linux-sg2002/commit/ea6319d5d4e1&source=gmail&ust=1793345520406000&sa=E
https://www.google.com/url?q=https://github.com/yuzi-co/linux-sg2002/commit/1efd0cda1069&source=gmail&ust=1793345520406000&sa=E

If there is interest, I can post them as a series.
