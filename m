Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794220132;
	b=u9FAGo+e+wLMD9KHtq0CL1CRgbehFvaOiPrfV5S/K7dOUx0zVVI5VnGSYUXuba98rYWU
	 u+lG/tp6gLVfvDoEoxfMsy9TgsZHLwPzwZnwFYNmOSDAsWs3ObhyQ8F8JkSStISRLT/w0
	 gXpUDcpybLBHBf46z0T92Sv/lyQFH9sKMgMZNgJrGFKnFNc4Uaa3e4+xDtOzYQdpVDjj6
	 xfLdQgAAISR/YFmuy49GXrGkPAVvB5pZ9LZOFfFoaDj6hoIsviGEd3WFOVMLEHN6lme1b
	 O5wmUSbjiS/zrRVAuEbmoBG4heF8X4yh+oiZT1iiteyiV/rPwDjTrU2lR6EBcqdv06Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794220132;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=ep5ShbwNy4Ud26de6VAtnzZOW23LrgMlmNEZoFSSBcg=;
	b=PMdqiSOBedBAYKxu614e5IyD2LJfw1a0U0taR2GnXy+v6Y0xiDkx5Afx59J7nLL9JE+w
	 bn9woeT2qGr40++fogW79Ik63PgX9YNTmwZuTN5iNGA3hP+pwSam//d65AN1t9iTyCn1g
	 VtHFDq6qCAVcjJRvGBg+gXDhpH+w9HkTnLEqIv4brASU5i3c8G1gNmuGuMPMpbvn52IM4
	 Wz9L3lKMvJ63s7lgNLGhcFc+v0yAIVQN7vOw+QOMb0yVkniOCXX7ahUg7nZAxcZyzV0bS
	 mN97e+3StG3CpxJbtE3p0t1ZrMQwVi0BVT/V4i77kDpQAvrfpyAyhPGNN4Iq5jjcQvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L0cZQrCp;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EBB9606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 10:28:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EBB9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L0cZQrCp
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a214af2076so4740865e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 02:28:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794220131; x=1794824931; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ep5ShbwNy4Ud26de6VAtnzZOW23LrgMlmNEZoFSSBcg=;
        b=L0cZQrCpBmu0jyEsRyplQ8A3IgtO9APOOt5xa8TcH+P7fin8hXsrP8XXtN7DoXzLc9
         hs8aA5DFA7xWk5enTgwvpxNK1tuh9wGci8DTpXMOCpvjxims3O3BVijRiG5hCaATcSLh
         iVL8240bxdbTB4wtIMA5fxPiuYSzmpo2vZy0YCB8GKTBazXkX8gBPSZNvplwwxMhL4aU
         GyvnO3HV4HZJ3QAp7EYXQ3Wd8/QJToIVtC7goj90YtGrQJ96RX0Z3yajqK2VQOhktwXy
         RIaeK/4StIRWIOsJmGGVqgepaehuaSvXxP+Xj6QT6JJ1A8OzCavKmOQaM0o1tZCI3Fga
         LcpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794220131; x=1794824931;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ep5ShbwNy4Ud26de6VAtnzZOW23LrgMlmNEZoFSSBcg=;
        b=qBT78dOdN1K84kX2hcJUjt1hV6rMGO7Cg08kcr6bJ2N5lW+G3vDuIu+dKXKDZAfqZa
         g+v3YmT3t7mOUW1SRMOkcwyV2sOp2tUQ6S6426dMKhiT1wCVp6L5Tawtc4pKN+eoj0HQ
         bOTIrVYcUGXK1RH+lymSTMvXeAZYnxAkscNtehENkq5V13LfvnRska55AmZXr4HI8Sja
         BF4uccI0gEkbr+a9ADXfpbkj0ZpxaF9iX5Ev1/Km0WjzICu3C0bAYMSsHMsDWSxSuKBp
         KGD0eq2lTxr++azbSU+8RQ1iKUt51/0WpLhFSvZxTBmae35Zm0BW5oyEzExx0D4J6JJr
         wuAw==
X-Forwarded-Encrypted: i=1; AL+hErGseaBEdaNrLe9oJwTTMfEiC6SNenEDCn8VdtTh4v1uf2oo+kQtSKdxSGzukxNEzTDPHO27EVJOMLqQ/RY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/2YDYsmUQ3bnu4Wzx3/ETIj0inBIM145UIfyIDuLjMFX5D2Xun
	jlIqIF6C36BfimvWz81yLeHaetIxi6aSMUStPjIpxeOgKixQhYXL7nxuZ7VgeWZ2
X-Gm-Gg: AYBFou05seRcE/84tKAAFC+DnLpjWYLi13Xwpl2U7QWq0Hb97+/8R1EDvRJO8RtmjYE
	arEisCIdM8Y2YJK2afElhCkPW0NuYS3R9ylakIU6nIf/WRg0dnSvh4mANZS7SGRzJ3mB3xLthYV
	dJFB+p5/ObuqFyp1f3BETFpjYKRtKNptoMMoTxQastgwi76jzHsrNAp1GiuBBjV+lgrRiuiqdrv
	3iQztRDT7iXHBZjDP36MLCQ2w0Yv4/A56VjHPXbGFPRDuP7kFVtsYiLyKTbDOxMasvOP+ItI/WJ
	A2sEW3a7Nc27Bm8+yburRRDNLDykGOC1MW8AYtZcUzETecp7ngNSuK19QoxyeF7H+AHEZ+ON4u0
	HRO7A855aDK43ULpTfkmA1oaOziGMoyez9Kx/wnuCoVwLWvaiXChntENA5bpPWGAJupnRXl0MUz
	IQ8lLFlhiNv6dQgqnBXXmOWLNBTGocO4j4PRHBtaBO1aDuGOcoYrXPvS4TVS7lNMbxgd3Cpzs2U
	mLYHW1O+yb/kj2j3Xq4GK0Vyks30P2a1fTaPHf/7fEXvsP40MRTpzZ3OUbljl83b1JDdrkhzo8y
	2uYZnwPQChB4lJlNoNgnJ28j6K3M7n9el3lXdqlo
X-Received: by 2002:a05:600c:4e87:b0:4a3:12fb:1ef1 with SMTP id 5b1f17b1804b1-4b963c8c87cmr68207505e9.29.1794220130601;
        Mon, 09 Nov 2026 02:28:50 -0800 (PST)
Received: from foxbook (bfg124.neoplus.adsl.tpnet.pl. [83.28.44.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7d54d6f93sm360827355e9.0.2026.11.09.02.28.49
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 09 Nov 2026 02:28:50 -0800 (PST)
Date: Mon, 9 Nov 2026 11:28:46 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] usb: xhci: Fix ep0 maxpacket update on enabled slots
Message-ID: <20261109112846.04bfeb0f.michal.pecio@gmail.com>
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

A slot in Enabled state has uninitialized output contexts;
it doesn't need and cannot accept Evaluate Context command.
Attempting the command only results in a (harmless) warning,
observed when core uses "old scheme" on a full-speed device:

  WARN: invalid context state for evaluate context command.

This problem doesn't seem to have existed before ep0 update
was moved from urb_enqueue() to endpoint_reset(). USB core
doesn't use URBs before enable_device() or address_device(),
but it may call endpoint_reset() on ep0.

A more serious bug has been identified by Sashiko review bot.
Transaction Error of Address Device may cause the slot to be
reallocated and left in Enabled state, but the input context
is (needlessly) regenerated before actually being needed by
the next Address Device. xhci_check_ep0_maxpacket() corrupts
this context by copying uninitialized ep0 output context.

This matters when core resets a device and doesn't reallocate
udev after address_device() errors. Some HCs reject the next
Address Device with Parameter Error, some break. ASMedia HCs
write a Setup Stage TRB to the event ring and stop working:

  ERROR unknown event type 2
  INFO: task usbreset:4071 blocked for more than 122 seconds.

This exact case is a relatively recent regression, but even
if xhci_setup_device() didn't regenerate the input context
on Transaction Error, next iteration could regenerate it and
keep it there when command timeout leaves the slot Enabled.

We can kill both bugs with one stone by checking slot state.
If it's Enabled, do nothing and let next xhci_setup_device()
configure ep0 later. It will actually ignore the packet size
requested by core, but its defaults match core expectations
at the time of address_device() and enable_device() calls.

Fixes: e34900f46cd6 ("xhci: Reconfigure endpoint 0 max packet size only during endpoint reset")
Fixes: af8e119f52e9 ("xhci: Fix Panther point NULL pointer deref at full-speed re-enumeration")
Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
---
 drivers/usb/host/xhci.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index e5c8b3a945a6..fa367d6cd21f 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -1566,6 +1566,11 @@ static int xhci_check_ep0_maxpacket(struct xhci_hcd *xhci, struct xhci_virt_devi
 	int hw_max_packet_size;
 	int ret = 0;
 
+	/* Only slots initialized by successful Address Device command need updating */
+	if (GET_SLOT_STATE(le32_to_cpu(xhci_get_slot_ctx(xhci, vdev->out_ctx)->dev_state))
+	    == SLOT_STATE_ENABLED)
+		return 0;
+
 	ep_ctx = xhci_get_ep_ctx(xhci, vdev->out_ctx, 0);
 	hw_max_packet_size = MAX_PACKET_DECODED(le32_to_cpu(ep_ctx->ep_info2));
 	max_packet_size = usb_endpoint_maxp(&vdev->udev->ep0.desc);
-- 
2.48.1
