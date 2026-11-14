Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794682230;
	b=RhItE/uR4KPl//dF1m6um5vjNa+CGUVU0M9sBDSg1Zuthom+Zn6vw4zmVmX4IIEq6W6E
	 7g/IHYOiNvYXOIsykcRSMlVBIu2KYFOAmuKIQo1xvq8tpBCfINnmlhIGgCMnFz8dsoh2/
	 HkwiG+uClV7MWiU8iN2l2qKE+4j4EFU0yv4KTzbUPLql5z+W1YjOIQu5LEZESiBvqBRVY
	 3Q27TiDkTheWk/97+5NRXt/cL/T78tMf/8Ry1UPD5JQIxG0yaqn97s9LLO3uQbQE+jjg5
	 sSvHwANTWu/DUoBLDluA/aWozrFHlHSeDxgdOwPHyoXCB5Z7bpmw+jKCzjXu+850vtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794682230;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=J7v9/YPEzjxZ/LGBEzvQ09s+gFXT8pS/d7xVKdjrCoE=;
	b=m7ZQB5AmvOX64/y8OjOsAjpC3KUt8KsD/LmAQcH/QvlDlRyvIiIrcA0TQwfr+K/sXI5K
	 YadMnWgyC0LG21vupOe+m0F25metWgWcgnwghXKsE8LmuYADodq2eBloj+LSDBxgXCjSa
	 NCfiiW5ywg4psjvXCdMX9kajRf2www/BzchrpF1J1ijHDw92WDqUpWOK9tO/81W8oJC08
	 OZB+m5UMIeGnAyu0KDZvn/PZSB/GynWpKF0q0ptnxUta7rAPGnTqBmOBXbgPfZ/zmc2GX
	 GdGgHq1UJZtb79ilgrUPUuVntRIkzSTZgPvn9CcgkAmH6nB3rvqO9Y9tjbrpRyak7yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GLhZMEfG;
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8295606A889
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 18:50:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8295606A889
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GLhZMEfG
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2e8da6ef7ddso10893565ad.3
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 10:50:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794682229; x=1795287029; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=J7v9/YPEzjxZ/LGBEzvQ09s+gFXT8pS/d7xVKdjrCoE=;
        b=GLhZMEfGifRuC596AndpNsLBIA9hBtwq3Fl2rl3RpCiUBa8JAgBi68PRu+6UvL0g+9
         Xzpu5p86rL78arrOM1QXBYNA9uv/mQu8WneFiAYdgeLD3BArt1DXcWip0vvdIfwC1ddG
         0N7V1Ecf+4SbVcB6y4tQNetroGzQmR9Z6fFcA0F6Ilqp1eKHvae2lq5iaUBEk0SCv3fZ
         JsSK0yuswuP9WHl5IzYpDImD+QbhCfQvlc2i+GAF3wnXupHdatzhSaYbY7MO1Gbgv/tJ
         /1lWvvJ7uBAc0QGCLV5ij/aoOAMBqbIa9aK22/g81KNbLj5WqLzMp41HokYHr0zzbrFb
         IZ1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794682229; x=1795287029;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J7v9/YPEzjxZ/LGBEzvQ09s+gFXT8pS/d7xVKdjrCoE=;
        b=VlKn2fVTG0MG3F5+ZSvOslxBg9lTy91463vdPt08N64N2M/2Vl/uZmYV6U+10bT5DR
         fnSMlk9Wm5TLPLreUdbCvzCuRKKEivpu/4tTDjs6+53hoIpH7uPe2qkI8GK0ht3AfEVN
         iKZoWoUl15bO4vE5X2qMrIXqfH3nmKhObTLWh4Smj9cervDd+wjpAImQ/NT25Y2eaGOJ
         E1hCBukM0D9sQG5ml/hfuCIpESY6PDZViJU09nn8G6ifzl/BPBCjBRhc7wrJdIslY1u0
         4YZJY/TycqT4zakM4RN8T8n9mhXTbQiYeN9nxXuQFYH7+vH2QvhUa56b03nOAPEB9hFp
         4gTw==
X-Forwarded-Encrypted: i=1; AL+hErGgAj6oX2J4Bx9atbefawR8M5/gmqVnRwlT3hV5UQIH/2r3dM+9b7EQWn0p4l+jjs/XLmVUVzdI60dpIuI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/EttoM7TRa2nJaZLUGZ/FmzsD6teXqSksnCn7cX1nyDBweWEIe
	mYB6ax3XY2I+o+xWPKpAXLjAstG4nJMBjjUoVUXP8PA8TfZ/EdYCD/Es
X-Gm-Gg: AYBFou0okW4W//NTv2T8nBDyw+PtwTJ7rDaHlgLlamgMJHLIIQm1d5HHgdApqxS/get
	8kLt6bCtSFOT8t24xAsQlgGnEgOkG79wvSxwkxFGSiVzBCdwt90LXkDokTUDXY6Z2yEqkcF2afK
	HA05i90y8iPyx32+cDyX1eKljXWXDg1ZbzKo54XTJezXPCti5rtR2Thdi/K5rYw972HWh80K4Vc
	KLoGxVpmBsuCLB2JCDg2XqVy8LKYaSnpxlFkAyjTwxD9rePqQ+XIJksH5DRiM8xrfWCUZqRgJU/
	ot/5IaenJOZdmNUXIYO1c7/X0Hv4OzqOn3jZR6fiKAR1UClvV1u1l/nCwE+tTcQGLWDJAU0PeZZ
	uaEPPeV6qxzu72/OD1TTT/xpYHUAyitPQuCRnTT6mGSJHMGJrNDj94hgX2me/JSQRzCH3dzOrWW
	qIrCZAjjFbFZOUPE9+kVKnOE/cB+E+p/71T5oVFoQLEQVePzXNpDBEOohpCc5rs6q1AhrwRYHYx
	6AmYVeQ2QHDPVD9B0r3qFW1nsY3yUEHYPoMOeTIEICytCxfCbs4dtqw/kUYarUINXWDvV4vTTyv
	TwiXGWRvlPnb5l8kr8UbH+QM2CybxS+SFjd04txOcasPL1gJatVYKFXlAXMc6l7QF0sm0sJfuvA
	bJPYqPm2Cm4U37LkNtH5gDTnWg83huSNxGw==
X-Received: by 2002:a17:902:db04:b0:2ed:2b43:483c with SMTP id d9443c01a7336-2ee0dc2a5bfmr60623615ad.38.1794682228921;
        Sat, 14 Nov 2026 10:50:28 -0800 (PST)
Received: from localhost ([153.61.198.243])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f75c980sm22473765ad.25.2026.11.14.10.50.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Nov 2026 10:50:26 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 14 Nov 2026 18:50:24 +0000
Message-Id: <DMV5R4A5D4UE.CX5X9T3GM3GL@gmail.com>
Cc: "Michal Luczaj" <mhal@rbox.co>, <virtualization@lists.linux.dev>,
 <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <bpf@vger.kernel.org>, <stable@vger.kernel.org>
Subject: Re: [PATCH net v6 0/2] vsock/bpf: fix recvmsg deadlock and
 zero-length, OOB, errqueue reads
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: <jrmmhm.kernel@eldare.de>, "Stefano Garzarella" <sgarzare@redhat.com>,
 "Bobby Eshleman" <bobbyeshleman@meta.com>, "David S. Miller"
 <davem@davemloft.net>, "Eric Dumazet" <edumazet@kernel.org>, "Jakub
 Kicinski" <kuba@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>, "Simon
 Horman" <horms@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>, "Alexei
 Starovoitov" <ast@kernel.org>
X-Mailer: aerc 0.20.1-355-gf870624f6c37
References: <20261114-kbh3-1-022-fix-v2-v6-0-96b6029bbffa@eldare.de>
In-Reply-To: <20261114-kbh3-1-022-fix-v2-v6-0-96b6029bbffa@eldare.de>

On Sat Nov 14, 2026 at 11:59 AM UTC, Jerome Mohm via B4 Relay wrote:
> On a vsock socket in a sockmap, a blocking recv() deadlocks with the
> virtio delivery worker and stops all vsock rx on that worker, and
> zero-length, MSG_OOB and MSG_ERRQUEUE reads spin with the lock held,
> wait, or consume stream bytes. Both come from the commit that added
> sockmap support. Patch 1 hands those reads to __vsock_recvmsg(), and
> patch 2 releases the lock around the wait and makes the wait loop.
>
> The deadlock and the MSG_ERRQUEUE case were found with the help of
> Anthropic's Claude, with Stefano adding the stream-byte part; the other
> cases come from the netdev Sashiko reviews and Alexei. The reproducers
> are available on request.
>
> Changes in v6:
> - Split into two patches, the zero-length, MSG_OOB and MSG_ERRQUEUE
>   early return first, as Stefano preferred; the deadlock fix does not
>   need it. This is the reverse of the v3 and v4 order, and 2/2 no
>   longer argues for one patch.
> - 2/2: check the transport in the wait loop before the data, so a
>   reader that wakes after a failed connect() has dropped the transport
>   no longer calls the data check, which warns (netdev Sashiko review).
>   I check the transport instead of swapping the two tests because
>   hv_sock reports the peer's FIN from its has_data() callback. The
>   WARN_ON_ONCE() at the top of vsock_bpf_recvmsg() is unchanged.
> - 2/2: reword the comment above vsock_rx_done() (Sashiko).
> - 2/2: leave Sashiko's signal-and-timeout point as is: such a reader
>   gets -EAGAIN where a native one gets -EINTR (see my v5 reply).
> - Rebase onto current net.
> - Link to v5: https://patch.msgid.link/20261109-kbh3-1-022-fix-v2-v5-1-4d=
9af04f0fad@eldare.de

thanks. lgtm.
