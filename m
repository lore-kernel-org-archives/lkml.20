Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793017933;
	b=HhowIGWhKd7/5UWU2XC2tbgn5OPCzu+/UAnnzOgeNmbFjEEkGT/q/Flwzp0uRwx+carn
	 LS1O8iY5YiK2kLwib3WFQlA4zOEgSPnYHPus8Lb+lw3UYg3ffEKHiDV8B+Xv61S3+dFpq
	 o1LBrIjlX6NpxDkkQjKDoaueisy+yALZGnBu3hUPvgy6OFvJ+MZ6I+tn7sVJ6pPtNz/+a
	 l0CfSWQKX8oHFRzzMbW/VMJyh/XjO4CsalcTkxEjWIbSSA66H6IICjP2rm3G682vnvYSz
	 FCJ8s7laoFFOTpP3dk7JPKzqiiEWQvBZp45LB3O+dWTqrFUHFm0CHaVp2nIjQiTB59Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793017933;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ktUKdiKYfb7DoM5zhVHml/g4TQZHJlrIih9rFWqZVKQ=;
	b=nzpvS/V9wfd6It8bIu7g3bNUVjZdxBJpaFr599zd7LS+7YPbmFSx8b9yc+tezE9v557t
	 0BZiYN0cF59eJL+9DOukAjWryoGe9F0FC8NLYAtwXqeNYoTf4Y8fmPQThmsPL4bjhUs5X
	 lZ8qMJDeykRduV0rO0THT8dx5cpaEClXwlDzL+a7gjVjt4sepeX07v0DlyyFJmy6bZUf1
	 NTMhLh+RmO08NsI6GkpcbZmAdMPwpGK0avqV5myQayGZrTCRpfEEqPmSypZSmYSU5XuRy
	 Fe/SRZY6HD1413pHmY3vxERLTCYxoUQmkBLLipdFCHbnnO64b2kPX4QsAsxbunu1LfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mivMcba8;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DDA4606A32C
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 12:32:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DDA4606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mivMcba8
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so9683365e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 05:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793017932; x=1793622732; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ktUKdiKYfb7DoM5zhVHml/g4TQZHJlrIih9rFWqZVKQ=;
        b=mivMcba8uYDlFfKaqTMPiPMpITmJGgJrVgHOAE8jYmLoBhYW45mBdXMQ02LqG2updu
         9LeHTzDGRg5A4F89RhWaUFJZ5c+VI/1ilvjcrv5DlQxsAoj2wFryqCx3b/uPou7AXDeb
         Wss9LdDOSh3+0Gu7kqjVfhjI8DS+Lu5UP/fenZyhi4gwhMFIDpqrbDyquPelPmXH+51y
         m+m44LxpXGLxus7eX+O3txTAid5lu69y7VhycvS1snpdVZw/LgFjEanIemDgwrso3110
         rirMGQoCitHWBLayc4HPMr+aanfRqUmn39o06PX8Oae+V0uea0+PN4brPriZTVyZxsuE
         4C4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793017932; x=1793622732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ktUKdiKYfb7DoM5zhVHml/g4TQZHJlrIih9rFWqZVKQ=;
        b=RUL1N/F4Tu+x6P7tPYGZPwAfFh2MS5gZAdZ3uKgAqSiNsafsf9wWL2qMnD+qP6/p4r
         FmyR2uyGMC8o9Buz2jOQIhlIerlXU8TiwRpIDxwVIE2seGvA2dYkygfgBkPsjSSmiD9A
         ec5UH4PSJ2S4BOlqHj5keRl4VU3Wpsa8LvdLXBOSkIUw0q1H3ZGtS1xc4ZKNNxaWn9xe
         05pzMg1Rjcz7a+9wZGyT9nebF5vNA7zDWUfnP5mixvrQYPuZRJ2rDad3ulz5KEN6uLRv
         gx3qqzFt97LKyCqtsBlgPkygHR5jPqzxthXXrPv9pksT4I8LnsjCOeKFpgQBxEeS/0Kv
         xPTw==
X-Forwarded-Encrypted: i=1; AKwUvBw+rqhatxOJzXlveMcFIVtcXpBN6CaY6hbskBAkeXwBk5/LUubqhdDmpsIAspvLdjoGrhXNv6vMcBse6zM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLdpai1+6osn4EPOoENqJWOsudib4iUbbDyrtI5LEPucF+99Woc
	aHyzyuEpWQ9QMQA2LPwbC72aSyP7HHdRfa8JY+7Kwk8CSk7nBAXzaV84
X-Gm-Gg: AYBFou3wri567rOCOG55FbR7QQp2yA77F6Vrm13y5FROcSyyIPnfCWAh8qdHU74cSIP
	EOk5r9R7jTtlTetjGdjQc1w7lf1RBdH1iuylrsDhc51vR77EQC7CffnlN75JcG1BmM1YndL1N/g
	+SNM2HSXkG8BtrdPDws7KZOW/AK4LAMBGD0X7OTBNsyhyIhfkLDEPx8TJn5XV91uHXQ2in8gLZp
	12iRI59guLS0r0cp2W/wqRcb7ezKxsQDYEbs5HlxUOtM6GrR4I0fQfA/9RgbJjjNS0dX9hEuk0m
	OukRp/u4AjaxlxUMKPlqarvAuXivUeFUX+djKsnkXCOFao0o8O6mP7ywfo/1cg8tKIVghSsrWp7
	kMlueyvnxTr+fBuYpLYxRmcXshR0UuYxXlvT2Pie6LQqs6lE0+mUQOnuL6i+AEJsU1FL147c34I
	Cq1gp/MBzYZ8wOLj4AOemMrIqqJ/wYs/v1uwoCq1j3Ai15XFNmCRWmvVMBzy4bM1YeCBBGt86lD
	TgLw4zjubV5X/3nSI1VtVnvNRjd+CQBstRedrF1JahhBKxLlgKDaLIlC1Gnn4CPOCNlH9Wdcy2C
	mYb8WI30
X-Received: by 2002:a05:600c:608e:b0:4a6:42cc:bf66 with SMTP id 5b1f17b1804b1-4a642ccc70emr45612025e9.11.1793017931500;
        Mon, 26 Oct 2026 05:32:11 -0700 (PDT)
Received: from localhost.localdomain ([188.190.249.216])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecdf9bdsm15684045f8f.55.2026.10.26.05.32.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 05:32:11 -0700 (PDT)
From: Vladyslav Tymoshchuk <tvlad744@gmail.com>
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Vladyslav Tymoshchuk <tvlad744@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kuen-Han Tsai <khtsai@google.com>,
	Sonali Pradhan <sonalipradhan@google.com>,
	Kees Cook <kees@kernel.org>,
	Felipe Balbi <balbi@ti.com>,
	Jim Baxter <jim_baxter@mentor.com>,
	Francesco Lavra <flavra@baylibre.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: f_ncm: restart the TX timer if the TX freelist is empty
Date: Mon, 26 Oct 2026 14:31:59 +0200
Message-ID: <20261026123159.53234-1-tvlad744@gmail.com>
X-Mailer: git-send-email 2.45.1.windows.1
In-Reply-To: <20260817192638.437798-1-cosmin-gabriel.tanislav.xa@renesas.com>
References: <20260817192638.437798-1-cosmin-gabriel.tanislav.xa@renesas.com>
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

On Mon, Aug 17, 2026 at 10:26:38PM +0300, Cosmin Tanislav wrote:
> Under sustained TX saturation the request freelist is empty most of the
> time. Since the timer is never restarted, small packets keep getting
> accumulated into the NTB, until either TX_MAX_NUM_DPE packets are stored
> or NTB_DEFAULT_IN_SIZE is reached, which is an unknown amount of time.

I hit this on a OnePlus Pad 3 (SM8750, dwc3, high speed to a Windows 11
host, qmult 5). Pulling 20 MB from the gadget over ssh stalled for 40 s
or more in 2 of 24 runs, and most of the other runs took ~6 s instead of
~1 s. During a stall the sender kept retransmitting, the qdisc backlog
was empty, tx_packets did not move and the ep1in TRB ring had nothing
owned by the controller, so the frames were sitting in the pending NTB.

With this patch on top of v7.3-rc5: 24 of 24 runs at ~0.9 s, no stalls.
Host to gadget is unchanged.

Francesco Lavra posted the same fix in July [1], but without the
hrtimer_forward_now(), so the timer would fire again right away.

[1] https://lore.kernel.org/linux-usb/20260727165441.1969927-1-flavra@baylibre.com/

Tested-by: Vladyslav Tymoshchuk <tvlad744@gmail.com>
