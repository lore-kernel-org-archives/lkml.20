Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793180616;
	b=BAxGOp7TGOpn+wsSS+4iQTxH8hUibibBDjYRw6JwccA/GirfKNrt8hUugdiYLYkeuG5G
	 CZIDR9/zTArWCc0A1m4l6B6mP8ShvbdZXYLfEh5ProdK8oL8iuwrVIS+LQxPLP3NtEq6U
	 5EihvPiJ1oC0r37qz4BwLWH5bh2UsP6PqQB5L/pvycnMqOaWejGG8TCHYlDrrqxnqgnS8
	 Y8X17eV6vkcTfmiR2eZrbvXQMILQVCEgwISTXpeps9WVVTVIwXJexTjNLAeYWy0hLAmo4
	 WGIRHU3fd+qZENrLPxs9wOMAgUNx7pQF7fM3MxfXDEHvgwxD89wNh3b+SSbpkniIFRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793180616;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=Uik1EuYMBAB4IuJ3lkD8ogKL5A8K0R8JHX7Ne40Kvnw=;
	b=BUxQ1kyY80REXKiZQDJ7vGN3t8UWlYH0GN69PFiFDz8ZNQqNeiui6ZSgBgCLbvrqMN0T
	 FvsZ2sPr5ABmb89MVHZmJ/L/2neEzxz6XaP7JcMRtvcwJm897pi02mqWE9OkMgUOh2QZ8
	 wyRFdiPc3HX5pwzuzsBclXGIZrJIIa43DKP6kZV63Fc3rxbfnF2tCPcWF2pOEp6zEbqMO
	 DKqHz/ZunQi/IThKc/opuuZQ597hNSruUfIuj2CapMfBOdWnIPzu2ayhiud9azKH7oSzA
	 15YhpY8I7TcywfvTnVPVwwr9yP93Gt+1vjRN+eLs2HZjw8Yr+eYcZ1GBJ5EtrxUO3SQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o+xL8Olm;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24CB3606A31F
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:43:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24CB3606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o+xL8Olm
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a20a37703bso5717065e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 02:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793180613; x=1793785413; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Uik1EuYMBAB4IuJ3lkD8ogKL5A8K0R8JHX7Ne40Kvnw=;
        b=o+xL8OlmBVwp14ASpE2+HCEJsGeFsArqMQQFsxc0Dt29li2itU4avjU6MZ8shFnJew
         Evp3zVF/RMp6kmotUj16EHMxJjkLF3dHq1j7I4AEOAhwYf524PNo+5vyNw+62UJ/W4BS
         JIo/WJECdnwyY8FG8UaNFEUZfu8KIKNPDG5eSFMcO94snPnGVI54wWppMzaAVj7QpDpW
         aVfidSP0w5K0wNQMqIK18YuYiTMU7wrGUL4T7nXcne3ulULJHyJB3GBR2SGbDVA0c5Xm
         G0KzbPFNhIcW8SrEV4KF508zMVxHazWUjpDl9NS+VJVNUrWXMVx+NARAHsiRuRZf7N0T
         lZHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793180613; x=1793785413;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Uik1EuYMBAB4IuJ3lkD8ogKL5A8K0R8JHX7Ne40Kvnw=;
        b=ok02ElgMfWexGbncaVa0ZlGtUsF61rxt9WV5h9BD3lxryGOeNqCaUQswXTpjpL1hNT
         xpKWEVvJ7nmMWP3zpz5e13pzO5A8tnWqrXRwAHPtFczkQ+y4R2XIwBH6/qQXGddy8P8l
         JGZToow0cwUiCVmfNHS8o5fDEEvceFBrfdoItzrRq6zhEpb6DOzhOAfPzYpvEcn0Nnkw
         V28EebJwjc/v8KxXENRrGVuYe0J8sM63CkaqFq88KootOFsFWhCZhCuuEec2KJbFQIQn
         gCRx6iSI6+oLz3/8PN8u8ijGJiXU2X2uN+r/2LnKFTfalWG0GU9YrjuUEnEw6o26Sdk3
         AE5Q==
X-Forwarded-Encrypted: i=1; AKwUvBzHj36Tm5om7wGocxX4naDp8rkoIxzXW5LZ5rWP18Y3kaubI6uZ3eVoVPE/itk5zzG0CuFrqKdwHiRnomw=@vger.kernel.org
X-Gm-Message-State: AFq9FYL3ge56Na5nl2/eS5/ucjk9JfMN1lTVeICV6N31LFOIRH4yix8c
	b/bTZApFzarF1w/jsLoPYSTgwMqn22ggAJlygi2+y+p/MSR5A7faITwB
X-Gm-Gg: AYBFou2uWTyPk82m4Xgji3JtmGerYZ7H8s80y0InqfOUqUD7Nej9mRrCojTFD6E6LNk
	XA1YCIrClCo5MbPjKn1LyyxTGbtiTFrZhlhG/Roj61cq7Ce8soMmrgwBVSbeAYlkTU6JKhfBBeC
	/6VDcz/FNv42d5vZaM/iqlz4DEUO/YXNHUvbuCHVK/FratKQlBeRKvTbhjJEO+ZiGf2QbImRxud
	cYhR0oD4x1k88kXGmZNuerILepeQKdYllHY3h0R7VBlP9kftiYL8afwFslrRK5Zm5XInzm7+DQK
	fPGQlc1G6ktomqjF/f8NVSN/EmyZj1ELfvjZ3unwNIqtLthocKp3wvNTSRmNauZW7+MqArd8rKJ
	K+91fIcz9BDqUfMFfblc/OgvuHWjBBegpbfcirQ3VixKKQ8CaVq9ffghL9AOqMwNPrQnNmwgbf1
	HfojUSMJxTbuoWiFfxV488njj0loCIwxRKtQboOf2f4sezCEKdgIkQAjmPnPP6wFII75n+fm5E+
	qe0FfBsts5Zg1JoVQu/O0qbXL0i3u5y+OL0x1H5icuuoe/BkeR6VUbXdY2biaWZgl94Dpkz/myE
	If9PID0EmFp57PjVlVwWHPUYV4bO4NXLek2qIk6+DZkF2kMpyAguNAV/bRo=
X-Received: by 2002:a05:600c:468b:b0:4a2:16c0:f5e with SMTP id 5b1f17b1804b1-4a965be6173mr31930875e9.10.1793180613431;
        Wed, 28 Oct 2026 02:43:33 -0700 (PDT)
Received: from foxbook (bgu81.neoplus.adsl.tpnet.pl. [83.28.84.81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a978795f42sm37559165e9.8.2026.10.28.02.43.32
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 28 Oct 2026 02:43:32 -0700 (PDT)
Date: Wed, 28 Oct 2026 10:43:29 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Nicolai Buchwitz <nb@tipi-net.de>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] usb: xhci: Relax high-speed bulk max packet size rules
Message-ID: <20261028104329.3d1c8029.michal.pecio@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Nicolai reported multiple dodgy high-speed devices still being made
which declare out-of-spec bulk wMaxPacketSize and actually require
the host to use it for correct operation. Apparently, Windows copies
this field to the EP Context verbatim and other Linux HCDs like EHCI
and DWC2 do similar things for compatibility's sake.

We are also aware of devices like astronomical cameras which use 1KB
to reduce protocol overhead, and audio devices with MIDI endpoints
that specify unusual MPS like 8 or 4 (the latter was full-speed) and
work with larger sizes just fine because they never do multi-packet
transfers where MPS really matters.

I found that sensible (power of two, 8 - 512) MPS are usable on many
xHCI controllers from vendors like AMD, ASMedia, Fresco, NEC/Renesas,
and VIA. Nicolai also tested two Raspberry Pi SBCs and a modern Intel
machine running Windows 11 and 64B endpoints worked.

OTOH, Etron rejects Configure Endpoint if MPS != 512. For such cases,
commit e4f47e3675e6 ("USB: xHCI: override bogus bulk wMaxPacketSize
values") sets HS bulk MPS to 512, which obviously breaks those dodgy
devices that perform multi-packet transfers with other size.

Problematic devices known so far use power of two MPS of at least 64,
so try to recognize them with this heuristic. Non power of two or
small MPS seems to indicate a clueless device which treats bulk like
interrupt and specifies intended transfer size; we will use standard
MPS here to avoid trouble with potential other HCs like Etron.

Reported-by: Nicolai Buchwitz <nb@tipi-net.de>
Closes: https://lore.kernel.org/linux-usb/20261020-fix-usbtmc-short-packets-v1-0-903f4d029193@tipi-net.de/
Link: https://lore.kernel.org/linux-usb/93d5aeb4-f1c7-9342-7bc5-4b277b4ec55e@veikia.lt/
Link: https://lore.kernel.org/alsa-devel/CAE-xCyPhrS6pgY0T9SG0TCubSi0CE2Yd5H=ttOzBmvgrR8fTPA@mail.gmail.com/
Link: https://lore.kernel.org/linux-usb/348c50de-f922-8295-ef87-cf5cdea5c7f4@gmail.com/
Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
---
 drivers/usb/host/xhci-mem.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 83ed26c4f9e4..bbde39ccc4f9 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -1473,10 +1473,22 @@ int xhci_endpoint_init(struct xhci_hcd *xhci,
 	/* Allow 3 retries for everything but isoc, set CErr = 3 */
 	if (!usb_endpoint_xfer_isoc(&ep->desc))
 		err_count = 3;
-	/* HS bulk max packet should be 512, FS bulk supports 8, 16, 32 or 64 */
+
 	if (usb_endpoint_xfer_bulk(&ep->desc)) {
-		if (udev->speed == USB_SPEED_HIGH)
-			max_packet = 512;
+		/*
+		 * HS MPS should be 512, but Windows lets devices use anything.
+		 * Etron rejects MPS != 512, many HCs dislike >512 and a few <8.
+		 * Non power of 2 troubles Fresco, hopefully it means the device
+		 * uses single-packet transfers only and 512 will work. Some 64B
+		 * endpoints (shared FS / HS logic?) use multi-packet transfers,
+		 * so MPS must be exact. 1KB EPs are unlikely to tolerate less.
+		 */
+		if (udev->speed == USB_SPEED_HIGH) {
+			if ((xhci->quirks & XHCI_ETRON_HOST) ||
+			    !is_power_of_2(max_packet) || max_packet < 64)
+				max_packet = 512;
+		}
+		/* FS bulk supports 8, 16, 32 or 64 */
 		if (udev->speed == USB_SPEED_FULL) {
 			max_packet = rounddown_pow_of_two(max_packet);
 			max_packet = clamp_val(max_packet, 8, 64);
-- 
2.48.1
