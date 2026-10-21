Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792606047;
	b=mmpNugAnE+o2gFxzwI1IdBGu6r14dkE3pQKnnF2KoIIfB7WJZaGkxeEsymz3/d/VpnMG
	 PKY7iEIPoUj2wH7HaZAjWshScR9ZDmgMgr3HBz+BJxN5Oy1fU4+XHI4YUk1gxk34jUAoa
	 vUQl1kkUCVFRVZEgwi2l1CDopmVzCBkBM6qOvM+z5+eZ814P4gQlau3m921la+cWWDk8g
	 4Oq3sJ2q4HJVNuKRu33uh3YHGdN2ztCxKINN+SNSCsSWzPX/aptkk+xGqpeYQn4tlwWbh
	 6em2iVizOZLNJ7uMIksxurCje7NIfRaVsP/n7nlLsjxUP1B+gQGRNaj+lxQxrN6UkSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792606047;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=BD3PH8sn/SG/F7DO7wxZvYQbvmrfrsBI3sjtEwqgqnY=;
	b=JBQMcJKRhKkV4DxWJ/4DzBTu8s1u+qF04PJsgkMI2+B4eerpVLvHpFyGb0GQ1IQnpQxW
	 OjF3AXEs4NfI/gKuYN8K7PpBzRx9wmgLsZUQ+oYZUk60VeENF5rGHjyIA/6ljT2FJI73R
	 Ed5dAu0JtvOozz71LY8/43EGRhbyNqYtOxqvgsjOCRa/IklLK47rn2hA1PSNY+8RVKjI7
	 HIMl/zaDmoCy8TPG5E7INk5cU7CXZpfqrBZJA0A3kKMkqkULI1ilKSgcr8fuEKzNvT9VP
	 vn0+8tST7UtqwIIIC33j48H6gTkfQV8Fyzm/Ku9P50REsi5kVvK5+fv81PjyOotO7pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jmPuaxZx;
	arc=none smtp.remote-ip=209.85.221.178
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CABA606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 18:07:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CABA606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jmPuaxZx
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5eac925bac3so209246e0c.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 11:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792606046; x=1793210846; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BD3PH8sn/SG/F7DO7wxZvYQbvmrfrsBI3sjtEwqgqnY=;
        b=jmPuaxZxGSuX2iUAkX5etUFc8l3rPMvgto8XSo5wtZwb/bT/7hXZd5zXz76Q3zTryw
         AHoQ+fHEfCnELueNC6j6PX5Fnc4K2VpLXakAFunBe+Mpc3uphKEEaJacETiZEaTxZZy+
         e2sKCGJviofNwT48s5JFb8OqqmXNunlx7Ty0tftUlJMIVauQaexhNpF67R8w8uEvVXIx
         N8dG1+T2D4Bp0ksb5ZmHMTflDJg4/I5YuUcP/iAGYZeZ0fdISC0jX82sJbCMoU0xlxhZ
         OqdwJicC/jegzyXcMpNBV17k1XuIQq3PE6tqJCnMnD1ulnQ7w0qBvYPGCkJ9hV+PjTge
         loxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792606046; x=1793210846;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BD3PH8sn/SG/F7DO7wxZvYQbvmrfrsBI3sjtEwqgqnY=;
        b=K6NUbQFh4HmTeeJ/OPd/iKQ08tXOcfTcys4ZxW89FRIIFCaMGt0XWtun0wxoG1cJzg
         /pXpSfJAKzhPlzuDpXfyD9zsXcuRaqWprEF5QwW2OC3txNEezb7FLqtwGuMAAQeOOloq
         tuNlc8EAcjDdizmHfabuxBekzvrTlFfYLaZFgzQpAgGK8I8l22bl4NwQb5yV7jQ7occa
         YLI26VgSHJP+tixYZ/6dCLYYXl/f5L06tS9seDv1MBxE2tVClDxPawDFu2Gh0p04RR2g
         BGEzVltM8wg/9tUCTQJ3i5DNBgSDyhMJBBr9fmPr+fj0dAs2D0M6LG29PAznHPhk31dS
         +0HQ==
X-Forwarded-Encrypted: i=1; AKwUvBzrGEcjBjzeG5R1DzgU/cmRpP/2iL2pvag1yePiZMHUGTmA8l52mcWKVHRd4FXUoZlxzYKbRNxVi/7uTo0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLs6C5Chp6OdGIyLSGtw751MCV0PNDDEhxCziUo341jHw7FxAcJ
	494jHYb5SoB40ZFFvQyHmIwQJbEaa80N3thXRg43/IdOHuKWUR+3ac6P
X-Gm-Gg: AYBFou3R4o5GQnotbkm3f24D+b/2iIUJ+FImb7HxK93FORKiE9w2RBemxI1Fy1mDJTL
	XCKcPDU5SUSVAXxRjfrX1hb0y5yU+o7ryInVBbEVwUZY3Snqgv02Py/Nsqc7H6hQHFSxV4/HMl3
	SfiQZ8vm5n7EsryGvFbsGS2MCuBljVgb7SVbGXLO9yVenVmebBoip8sHoxqHDryOQKZyTqvTeBH
	5jaK8I27R3yxIIPvTHKsskZcRSf40h0krboey7Fx9L9dDC6q8G8lUULSdwdjvDCckylKJVlGRzD
	fH0tCtnLCJVcfAxsaESmDj/u0tf0SZcJ+uNoK66UNINF5Dj3Cc3IjYjyXVhIXDh8Lgc3ymk3rPU
	m81dGP1yP7IZZ5ex2RNPHqEC/1ZXr8pkugRtuBV3saUjYZTaJg7EekeVh+OlRN+OOu9S1VA0oVo
	rwWzCP6h64/8l7rAVo6P1yiB4FNfizNlp8ZCj2F0TkNyjP5+frQNfiXVMRQpZl05i6hPQw70W46
	yBSr6xWba1WAqVJ4a7NmBzqNF7u2ITdqDXl921DXyFQICOK5+lw8z12j40vp56pyRJtmU9i9rcr
	zLYFndDjcBkVxS54IEeU0tMQuqx2fBvki2mZlvIYvJ60AFolw2okh2GqEnuw8MsK
X-Received: by 2002:a05:6123:6d:b0:5d2:4a4c:ad83 with SMTP id 71dfb90a1353d-5eaebefa0bemr1334431e0c.23.1792606046270;
        Wed, 21 Oct 2026 11:07:26 -0700 (PDT)
Received: from MaquinaLab.. ([179.179.238.247])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5eae9697814sm4054490e0c.1.2026.10.21.11.07.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 11:07:25 -0700 (PDT)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-serial@vger.kernel.org,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	Andre Przywara <andre.przywara@arm.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Enzo Adriano <enzo.adriano.code@gmail.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 1/4] serial: 8250_dw: Keep the BUSY-safe divisor hook when DLF is present
Date: Wed, 21 Oct 2026 15:07:14 -0300
Message-ID: <20261021180714.473749-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <atj0iRFTxHKmhxVG@ashevche-desk.local>
References: <cover.1792439398.git.vinicius.eduardo.pedrosa@gmail.com> <cc358c2be6b0b4ea0323e4f694a581ffb667112d.1792439398.git.vinicius.eduardo.pedrosa@gmail.com> <20261020104753.28703-1-vinicius.eduardo.pedrosa@gmail.com> <athe0QikG2mzCAtd@ashevche-desk.local> <20261021100049.16504-1-vinicius.eduardo.pedrosa@gmail.com> <atjB-BnXclL3FcUm@ashevche-desk.local> <20261021153732.1978410-1-vinicius.eduardo.pedrosa@gmail.com> <atjqZPuAbHDdaexv@ashevche-desk.local> <20261021170403.2052449-1-vinicius.eduardo.pedrosa@gmail.com> <atj0iRFTxHKmhxVG@ashevche-desk.local>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Andy,

On Wed, 21 Oct 2026, Andy Shevchenko wrote:

> Yes. but is it only a single device/platform affected or a big class of the
> devices? I assume only narrow part of them which unfortunately use DFL register
> offset for something else in their RTL.

The A733 is the only case I've seen, and the false DLF is what exposed
it. But I don't think the BUSY problem depends on the DLF offset being
reused: with a real DLF on a UART that isn't 16550-compatible,
dw8250_setup_port() also replaces the BUSY-safe setter with the dwlib
one, so the same path exists. I haven't confirmed that on hardware.

With patch 2 the A733 no longer takes that path.

> It all depends on the outcome of the above discussion. Maybe others can share
> their opinions, but I lean towards a series-as-a-fix rather than a bit ugly fix
> + proper refactoring on top.

I'm fine with a series-as-a-fix, and with deferring the deduplication
patch.

Thanks,
Vinicius
