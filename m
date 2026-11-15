Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794758565;
	b=pFnMfJ7sd8x0lexU7nt3HP6p6kuSW/VmAL1gkaTC76dJIADNBQNtYftuma80z5ce0ouJ
	 kmmCG/mBzHY6ChoQl8I9wf0AuAX8dAZGw/GY2vxLonPOJm6jUZ4029ZXSv8WxXzSR0taU
	 wYftsHZsUs2Hm5CHbkzJW4KeYDTfgBpjwy0XtR33mQ5PElRVa3H2H90YF9e6weARtbxu2
	 y3mPBt+ekpSc1+Z34O3FFlgoFimtXqlKG1M9v0WaQXa72xBbfIezinjVKOo+yjI8LZPlO
	 i/Saq1PgChSVux47SSRTeKbhen/O6fzwjzL0pt6pJfazz4ZsSy4cc/2HetSqkG5dYsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794758565;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=NHZIeryU1J/9Tg4kQWcesLp+ZRL5MdN2PYnUzIdJe2U=;
	b=Cag65YWt1ki6wAvHtKkdpM5/uyTq5S65vB7Tv1S6kMfrla4d/t6fd40bRfHgacAtxK2L
	 z6m6z7EpfywmSsS6llfVr2FEqBQFNHiA7bB0ZNVSzvmt/ojO4A9BHFKDfsFVOY6Hn8PqI
	 AF6tZs75jSZZh6TLhUHJQDo/b4pzYvGuYtAOCeLMe0UD5WEOcvREoxdk2QFu/lr9Ivke9
	 qs8JrKhi+p2vvZQ2CJv+XSmQDAK7JBBJjtGDVvHL2be/px45zMOgNNI6eBWMU/6Hgtx38
	 HkEKtElKFkusOo9pw5hzCUqP111yjC+7DYV9X0COMU39ikO8y2fQNyHffrAYz2anB5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d0CvdoTu;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B92606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 16:02:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63B92606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d0CvdoTu
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a00so5112225e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 08:02:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794758564; x=1795363364; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NHZIeryU1J/9Tg4kQWcesLp+ZRL5MdN2PYnUzIdJe2U=;
        b=d0CvdoTuIvE++rWcm5VTuDMedIWzBhDY2Ecca18KGLJnmD5yqtq8OL2LZilAYTIz8q
         yqfjUjDP4qq1gxPaFSPMSCcagtNBQSTPKDqERthyk2fPovKH8ZN69wlacZ27A55Rsw7W
         K54MlsENIWsPcjsk71AwQdKkxcGDQxRD+RnHwXmRHf17IqXWQHj5tsl50Wp0lC773MHt
         bLNf8/iGWYdrME3iRJ8OfBpQc6GYUsyr+BleFLvD+216hxgooo3PaymDo0JYSmzznqdf
         6DKOlMMVO8MA9y8hFbmmhrYXftgbkqgZm6/jsGaw0lmFsELH3R1SnFsmYKXsqyMrGOoQ
         6r6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794758564; x=1795363364;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NHZIeryU1J/9Tg4kQWcesLp+ZRL5MdN2PYnUzIdJe2U=;
        b=ec6rEXYe9I8N6gddmX5YmR5CplVB8enPqpEoObOIrN7Rqs0iblSUAQN8rZ4SqLyKIF
         GfqupifoAeDlTqoIEbiNCcOeGWozcRFMU5WNYosBjjz+Z7WdPnuK/90RxoQfiISV8T6J
         9M8YEHHu5VXkw8nSVjrsITe5Dr6zm2HlCyM3L7O03GkHZk7TPb8d/vS5couMCdyjdhBe
         L1odGBu2PPk9rknS6YIg5k/sWOGwVgM6sIKgVZo8+pWU/TXepkY2QJUqdB/gI5iAOt/E
         7I+6qEFFtYBzp10Z3UHuyagfQtJg/qCTMznZD33yE0VeDqpqrfvlFGVGcgkJQDeJqJ4L
         axMw==
X-Forwarded-Encrypted: i=1; AL+hErEkDhOi8sN8/8p6GWVs/YS6NaUsJOVhYldqqbuxlkxnUd+JCsdQMp6DkroyDwIi8wmH0TPuTTl/dNI5X3U=@vger.kernel.org
X-Gm-Message-State: APuU4Z+nLhCXTQRAH/562uElV8mQyDFKPFmqAC6X6wG1KX1Jr7M2KeQj
	70Tqpor/K4ZmA48b7pu6jCUCsPgWseo3OVB9rdcJn3Q1GCvTNhe1w+q+
X-Gm-Gg: AYBFou002BNMPnjAQ0V66uTAgziFO+beA1wIYtl79bwOt/B8vamy/JuH0mZR0+O/AOo
	5b9eeorug/x1nNv4FkvQDIbsaiPmSxhkQ57CDn/4Lkc8fDHFFr5oW9nQapzapZc/3GlGXJ0l5LP
	bF04KAu37CIqF55wqb22ZGtiQNyVFeKVgcMMALL04xAh5hoaJHJcl32nKfjJSFr4B+xAG75orck
	TQExEVV2WL54kR9A416pwsRvp8v14YyfblsL/AQfrAkNrspSSpZTnl4tRpVJgqgT9lJ8ecazWL+
	TBCh/lP2Fi5i7AubFXKr6640hwky0r8Y5rSz75iPKmNxv43W38ggUwhUx0BegMME5OZL+PKjoU3
	eofftcBVJyawRE29XxE+hxNWFCdrBGIEqREK4+7F5MjNxEzLm7AibxuK2mwaXiRxfqMzOBQG0Jo
	kbeCj202PC37mXD2tPAskt0cCJiUbJCFRvQfiI1gvdkqKV5q9erOfA3UbpXZiNyiAcfIqloi/bs
	5955PupwvDpdn8SltjfphJcS1KlVynKstt/2QUZwQtjWvXG4HgJfxxux8cQxR8mQuZl0cBMp9MB
	5FKm26okJkf57K2+yQR1LPEvjce+PxbodOi3sb4JPGodzwTbB7RdOPVV3WEJiWKjuT+7urMr6xV
	Wk884c/uO7921XuVDLNO8QKcLohTsrENgj3uN1uMGGVQ=
X-Received: by 2002:a05:600c:a0b:b0:4bb:6847:7927 with SMTP id 5b1f17b1804b1-4bb68477b90mr76007525e9.7.1794758563469;
        Sun, 15 Nov 2026 08:02:43 -0800 (PST)
Received: from rebar-v3-testedby.eml (host86-185-73-183.range86-185.btcentralplus.com. [86.185.73.183])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb56689bc2sm132025125e9.2.2026.11.15.08.02.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 08:02:42 -0800 (PST)
From: James R Taylor <jrtaylor11@gmail.com>
To: Geramy Loveless <gloveless@jqluv.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org
Subject: Re: [PATCH v3] PCI: Reserve prefetchable window headroom for Resizable BARs
Date: Sun, 15 Nov 2026 16:02:23 +0000
Message-ID: <1794758543.190740.rebar.hermes@gmail.com>
In-Reply-To: <10fb16fb-2069-4d89-b473-1006ae5abfbc@jqluv.com>
References: <10fb16fb-2069-4d89-b473-1006ae5abfbc@jqluv.com>
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

Hi Geramy,

On Sat, Aug 29, 2026, Geramy Loveless wrote:
> Firmware typically sizes prefetchable bridge windows for the boot-time
> BAR size. Behind a fixed (non-hotplug) PCIe switch fabric, there is then
> no room for a driver to grow a Resizable BAR afterwards

I've been running v3 since 27 October on a different kind of fabric from
yours, a USB4/Thunderbolt eGPU, and it gives the GPU its full BAR there
too. In case the data point is useful:

  Host:  Minisforum UM890 Pro (AMD Ryzen 9 8945HS, Hawk Point),
         BIOS 1.06
  Dock:  Minisforum DEG2 (Intel JHL9480 Barlow Ridge TB5 switch) over
         USB4, link 2 x 10 Gb/s
  GPU:   Intel Arc B580 12 GB, xe driver
  Kernel: 7.3.4 with v3 applied (it applies cleanly)

The firmware gives the USB4 root port 0000:00:03.1 a 64 GiB prefetchable
window, but the tunnel is enumerated as a hotplug event about 12 seconds
after boot, and without the patch the switch windows below it were sized
at 256 MiB, so the B580's BAR2 stayed at 256 MiB and a manual resize
failed.

With v3 the headroom is reserved down the chain:

  pci 0000:6a:01.0: bridge window [mem 0x400000000-0x40fffffff 64bit pref] to [bus 6b] add_size 3f0000000 add_align 400000000
  pci 0000:69:00.0: bridge window [mem 0x400000000-0x7ffffffff 64bit pref] to [bus 6a-6c] add_size 3f0000000 add_align 400000000

and xe then resizes the BAR when it binds:

  xe 0000:6b:00.0: [drm] Attempting to resize bar from 256MiB -> 16384MiB
  xe 0000:6b:00.0: [drm] BAR2 resized to 16384MiB

Both bridges above the GPU (69:00.0 and 6a:01.0) end up with 16 GiB
prefetchable windows, and the whole 12 GB of VRAM is CPU-visible. It has
been stable as a daily VAAPI/compute card since then. On 31 October I
also unplugged and re-plugged the dock while the system was running: it
re-enumerated, xe re-bound and BAR2 came back at 16 GiB.

One interaction that may be worth knowing about: with
pci=hpmmioprefsize=16G also on the command line, the TB5 switch's three
empty downstream (daisy-chain) ports each reserved 16 GiB as well. That
overflowed the 64 GiB root-port window, and the B580's BAR2 was briefly
assigned at 16 GiB and then rolled back with -ENOSPC. Without that
parameter it works as described above.

Tested-by: James R Taylor <jrtaylor11@gmail.com>

Thanks for the patch,
James

