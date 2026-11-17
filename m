Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794882971;
	b=YP0bnJVCIpKmEUsLRETRjc+1A3/oQ8cIOg15VBIN5ZwUs3TsjGCVKLl5PvQshpq7IoYn
	 ne6/ujo0LEioStTKObfloIjAKs54v9JS5IBKaYQ1agTT2jDSfI2f/wSTlxyybmbJW7Wlw
	 jtqS4jB1wiOuVDjFV73m/jOgBK62ic7GzBRiCrVP9SaBdrKfvPz7hcPWktP/2tGDpVuCZ
	 4smwtDcuYkr7vqpE8OGJ0F0I9vcFOty72dHuh0HVU34SjpSpqmJc3u/1F0mhrqz3cxItA
	 jaKGbOQjqzTwVcAawuc1cli3wb/w1xAPxPDC/hr4mzZdtEGcW68XHBUvOJXA79uBtQA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794882971;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=P7WYFYjupt1wh2sDDV74CfGFKi15+W2RgoXEiZ717ZY=;
	b=ychpEw/IQyOuCh6XNITyiRIqEvYYM0XCXdhZUpxnUVtws+5Vov+Q3JSH5EAo9u1zF6xL
	 6ejVf49UR/aaxn31iADlvb9tkmGrMDiuBqCmqUUx+OyC+kMrc4YXSd6IomxewcZ1agq3K
	 o9p+Y3SceqzcvqYzVI0pcRqx18QQDCs50hyr1iRYDyHJkQUsbGYhi+dfTn6zUfupSs8Gu
	 g8ur/bTHkMBvcLKbPdAlYQ1vq2K5orpSTJ7D7DBcSWQSXy1E4aig03Bzz55rfplc/jEnE
	 QNn3CLiRUNNO12aJPyXQfz5qNxCswoIjVSWGKNGXa152bXzVtnW1X31gDrUhQT+eZhg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sfH85jx6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.52
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B9D2606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 02:36:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B9D2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sfH85jx6
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-98301b325c4so966218241.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 18:36:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794882969; cv=none;
        d=google.com; s=arc-20260327;
        b=MHROowq6uZGnDOkd5ELJTXDMLWsL4LAqV2rrBv+vUgEPvYLc6ynC1VUG0w27Bzwtqa
         yFzRKWSTrUO800UVEjQsVwcohg+Mp/93s3k8yJRwHGuFvWrDEdJRk/8wFzBxLFA6TvDh
         uscft8G3FV1nU+WPVG6B+bIDQ4BG2sFGOyXGtM7JLkiXGLqU3btL+a7lL7Quw/PF2JlU
         57sVgiyWHN5BVydiwchFHTgJHi5+4H0IeoSZmu6NHpGHx5QrPcpMyEw37WoJ0SBAVzZK
         eFjWWDTsQTE+Tm/AUg628+ceFiTq3Uhbb2ZMjyZvaxVT6xCG51jPskPPRLAGYOB/DiXe
         81iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=P7WYFYjupt1wh2sDDV74CfGFKi15+W2RgoXEiZ717ZY=;
        fh=O4Kz5Fh7Yjdf6a96jJ9Gjwy8qcvZcea4ZKIBn1Fwul4=;
        b=ejLtxL/80xAlkjIcSdMLogC9fgNWkPAz3E7d2L9YvXBTc6A7sxZ14S9bN9YF59Wiet
         B9C72aYVt8TPkT1Ph6HnFu3QR6SQhiGIjevV9TXb2xpCImuEulUckMd9QW8/NhSFCIIh
         YhvrqAE48RFz+AMvtoJ+aoYeehazhABLnIDtupgVgblqACdvBwAAiKIgBWbHSuxAtWeE
         Zr3LoKHq2tAGWfrmaOAwMayTmCHhb6uuACjTKrWD+hNADTYPMo93anmGdJJ+3f8hcjJF
         FFx/eH4fl64OPUmT3c5EpCgwP9vY9o2QO9Ybxtb9kXoWbEck1z9SKa4JzgDa+AwDird/
         dPww==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794882969; x=1795487769; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=P7WYFYjupt1wh2sDDV74CfGFKi15+W2RgoXEiZ717ZY=;
        b=sfH85jx6UDOHVe/QfxY8fPLUXzDqrNp76LfpcusrA+iGe+RSnmlNIPSvZZXUmbcjHx
         yxQ0i4ret+BIx+nuJVVHLsbg1P+g/5xFbZpBqVR7V9pi4sVIAS7HAzJdwEYvwvR+VRX/
         HFINyp2Yl67AgenwoscipuqoUUGq8iUd/0mEbxT8zfEg9UTAviXlt7Ioj3JA2wufDaoj
         o+GP6/uT1/yc/3yn+w9UG2Z8MFYaYNFhn1hV+/Ju828W4K/DoX8Zr4AoyFW5KGYRRW/p
         S+qqZVzJDJrbP0FB+BFUHa9WN9+mEX35WBBpUVBXfST+p0DTDfWODiesu1wl+rAcrw1g
         2HgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794882969; x=1795487769;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P7WYFYjupt1wh2sDDV74CfGFKi15+W2RgoXEiZ717ZY=;
        b=hjCmN8MaSW+yVmkR9heSXB+gB1Rni5O0Xy5cYzgaod1htWUfYsNpqJKy1zdgX7XX5z
         0aMHkQGNNVRZ6uQoBurNnCS0ZRW0sAL2z880DAwWvWh6dMrQsRjtXehbs9y8eT1EAGV6
         jCOca9VtKy434ToZ+l7i8+yNNvO1oO3HqC2jqK4LGHNCrdgFAyIdKZbqFodqPipzaii8
         itL/TJB/BMBgY/DNu0zwxzKnGR/Spb5xdo+Lpsg/sb5dDAUczB/u1Sw4F1cyhrNpLnBr
         bQTeF+UYU1PGgvvzhCaFOEj428FcyTfSiZbE5VGy80OSUadGVpBK0FgZxhlv99np/ofV
         PTtA==
X-Forwarded-Encrypted: i=1; AL+hErEDesAD/tXb+EMWhlvylZuliKdtCpTCT10W6n5Qw0v+Bt7lbluVkC8+qVCqEzVfZBc/5+oMshCqg0XL0hE=@vger.kernel.org
X-Gm-Message-State: APuU4Z83YNGuzZd6RPME7IEGQdJQ56X9f4RmuWpH2c4YZ+qJOsnEoJgT
	Bhl4NDHtoAAZAwu1ptXZP31/VUioYLSnh6UGE3SR3DDKB8UWjnYt2MjWPrTg/kTXgG+0gLFb8ri
	D+HAP+6pxRsg0XInfRpGzt6VfcYdEuN8=
X-Gm-Gg: AYBFou0DnThAcrBZmji2SUHVgyJiuHSc6hLMtZfU9IaieHqGb62w7OEq2HSPjVDf/ae
	XslUhhZ1ULfyMoSpStWWx1SYN/pgOBjh7yXtvJDjCSUidSVGGiPLQsuGDTL2BtzppplLz/wzHZt
	qTbTCo7tnI90Cup5SMJ2lhSpxHQ2k+5iOAUgcN9djh79EHpnzU6MA5xBPjKVXnpbt0N07xJ2fE4
	VjPuJ1hd34SlX1N/PmEJVnxri5Q770v3hyl58AHcFLOVFpTd4H89Q9vZAfKrtV5TV8h+PVOlj1V
	hHhybNzwG874nNUXYtmzC/0zlNHovN0+v8nXRSvnPFt1XANX48JuBD4GwfHz0J7PFN8NwyWym/+
	IBet9LjysWND3mGNf+QdDbLVR+Kt9x0sRaOZWR3uTCpUDKc/QD4Sk8AlvlKAO5iCg3zSb0Z4kmu
	8PsID9WVFOyl/2fwm5USd3ih7i5UuCuWepqblW3r7mqnDgTNBGxZGuDwtW2n5vHPQWyFNbkTRx4
	hsSi8MSg26PniytL9WZ/RCjAM0iGg==
X-Received: by 2002:a05:6102:50a9:b0:7cc:2c29:54ef with SMTP id
 ada2fe7eead31-7d64d6f7105mr3309563137.19.1794882969366; Mon, 16 Nov 2026
 18:36:09 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116-submit-acx00-phy-stats-v1-v6-0-8feef8e76cd5@gmail.com>
 <20261116-submit-acx00-phy-stats-v1-v6-2-8feef8e76cd5@gmail.com> <avsBVtVgsluPNpVY@pengutronix.de>
In-Reply-To: <avsBVtVgsluPNpVY@pengutronix.de>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 16 Nov 2026 19:35:57 -0700
X-Gm-Features: Aa3M54pBz4tT0t7JeZwLsOLmzXp6qqOvkWqH1XF1WpTw3kHr4oh-FwmKwJHq6L0
Message-ID: <CADvTj4qMgKrRZ_uq3K4t2+w_3eai4dwuCPod_vhEKEOsO85_Wg@mail.gmail.com>
Subject: Re: [PATCH net-next v6 2/3] ethtool: include errored frames in PHY
 receive byte counts
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 6:12=E2=80=AFAM Oleksij Rempel <o.rempel@pengutroni=
x.de> wrote:
>
> On Mon, Nov 16, 2026 at 01:59:58AM -0700, James Hilliard wrote:
> > Some PHYs count bytes in all received frames, including frames with
> > errors. A successful-byte count cannot be derived by subtracting a fram=
e
> > error count because the lengths of damaged frames are not available
> > separately.
> >
> > No in-tree PHY driver currently reports rx_bytes. Define this existing
> > counter to include bytes in frames with errors so drivers can report
> > their hardware byte count through it.
>
> I do not think we should change rx_bytes.
>
> Comparing PHY and MAC counters, for example to find frames lost between
> PHY and MAC, only works if both count the same kind of frames.

I did some additional tests to understand where the observed differences
come from. With MAC error and runt forwarding enabled, a bad-FCS
63-byte frame increments the PHY packet, byte and error counters, but
produces no MAC RX descriptor. At 64 bytes, it also produces a MAC
descriptor reporting a CRC error. These lengths include the FCS.

MAC-internal loopback reproduces exactly the same 63/64-byte boundary,
with PHY loopback disabled and all PHY counters unchanged. Good-FCS
frames pass at both sizes. This shows that the MAC alone can produce
the observed filtering; the earlier results do not establish a
CRC-dependent runt filter in the PHY.

It also explains how the PHY error counter can advance without a
corresponding MAC software error count: the MAC can discard the frame
before providing a descriptor. That difference alone does not indicate
a fault between the PHY and MAC.

> rx_packets counts good frames only ("Total successfully received
> frames"), and so do the 802.3 MAC counters aFramesReceivedOK and
> aOctetsReceivedOK (30.3.1.1.5, 30.3.1.1.14). With this patch, rx_bytes
> would also count bad frames, so two counters in the same group describe
> different frames. A PHY without a CRC checker cannot fill either of
> them. A PHY that has one, like ACx00, should keep them consistent.

The original implementation reported the inclusive hardware packet and
byte totals together. I changed rx_packets to subtract the error count
after review of the successful-frame definition. The hardware does not
provide a corresponding errored-byte count, which created this mismatch.

Subtracting the error count also does not necessarily produce the MAC's
successful-frame count. Valid-FCS runts and frames with an incorrect
802.3 length field were counted without PHY errors, even when the MAC
discarded them or reported a length error.

> A separate counter for bad frames, as in v5, does not solve this either,
> because "bad frame" is not one thing. 802.3 counts symbol errors at the
> PHY (30.3.2.1.5) and FCS, alignment, length and frame-too-long errors at
> the MAC (30.3.1.1.6, .7, .23 to .25). A symbol error points at this
> link. A frame with a bad CRC can also come from the link partner.
> rx_errors already means different things: mxl-gpy reports its RXERR
> counter, qcom-phy-lib and dp83tg720 report CRC errors.

The v5 addition was an inclusive byte total, rather than a separate
bad-frame counter. Its purpose was to expose the hardware byte count
without having to infer how many bytes belonged to errored frames.

The ACx00 tests confirm that deliberately transmitting bad FCS from the
link partner increments the PHY error counter. That does not imply a
physical-link fault. Tested valid-FCS runts and length-field mismatches
did not increment it, even when the MAC rejected those frames or
reported a length error.

I have not isolated symbol or non-octet alignment errors, so these
results do not establish that FCS errors are the only events counted.
The proposed metadata could express those distinctions without treating
every driver's rx_errors as the same error class.

> Strict definitions would need a counter for each combination, "include
> everything" would make the counters useless for diagnosis, and moving a
> counter between fields breaks existing users. Also, few people have the
> hardware to confirm what a counter really counts.
>
> I suggest metadata for the existing counters instead, similar to how
> ETHTOOL_MSG_MSE_GET reports the scale of its values next to them. Old
> user space can ignore it, new user space can use it, and it lists only
> what is confirmed for a PHY. Andrew should agree to this direction
> first.

The tests confirm that the PHY counts bad-FCS frames and their bytes,
including FCS, and increments its error counter for them. They do not
establish whether that error counter also includes symbol errors.

Should we return to reporting the inclusive packet and byte totals
together, with those confirmed semantics described through the proposed
metadata, rather than deriving a successful-packet count that still
does not match the MAC's acceptance criteria?

> For this series: keep rx_bytes as it is, report rx_packets and rx_errors
> as you do, and keep the byte total driver-private for now.
>
> @Andrew?
>
> Oleksij
