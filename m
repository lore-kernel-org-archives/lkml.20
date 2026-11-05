Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793843805;
	b=NHqv1ffJ34b4nt3vG1u9QaAaIannsQ9yj5/5w6XETOvGPld6aRTAyde+ewk8cfDlRuyt
	 UGouZ8rZ52jG2EkVWw0zM61t9lZmw2zotZSo5aO4UINRXrAUTmIcdr7EtOau1cV0AkovC
	 WOqHY66hNM05AImxPXJ8tgH8nmWDyUO3GFdwRm6wEGRE1OppQtsCxYaNL8RyCMJjeJa7W
	 YaQ/2zFnatDns8MPD7kZgvejoif4eRq6YBiAtiID1zlvDtf4tzN2KiT7e0o3uxx0HvgaW
	 B4gwHoKMQICu83TAjg/8pVdhUTJOwIMSjNq1VcMPTQWDjw10KGRUiQxnnljI9ZGmKIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793843805;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=zua2wKISeB6S1byTyWjx24hQmuvknlx4L4ArzH3c8oQ=;
	b=KeJ2vb06y86Xz8cUOMeVouSCJQsKM27yetH817a9thTLJbXj77IATRSwSmoe27pCNkld
	 dIo4qN4pw3Xn8kj/hHJ07ua5iQ/bof2ERO14mpWvmXJ0WG0l+3I+jvF+SEsa3lAZcXo1J
	 eMpTx6IZEnYW0Ayp4DxPBjTadmPq9ORc+chU/a6JsL22xiVaHDzQW68+aYBDEVMgmjk5E
	 eNBqTYLJRWs/sIbJJgp8dHuPnzrv/WnvZtwIKlIFDxZ7DjypOWfCsa+xFokzz7DuYAgfa
	 X9C/b/ZMPKQhIRaL8OTsdPXOvwUFqZHGXy6cw/IrqKsPE+x4/ZzJJuNarC7Q1Z6KfUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sg8D0+ka;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B999606A328
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 01:56:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B999606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sg8D0+ka
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso3396551eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 17:56:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793843804; x=1794448604; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zua2wKISeB6S1byTyWjx24hQmuvknlx4L4ArzH3c8oQ=;
        b=sg8D0+kaPPpUPvH8Fa+Cei6LuqtopYyEBflLw3ALL3zHuxcJ3l8hfMCApuoapYXBko
         C/4oNFNo6KunjH84xv1nEH5swz/YXSUqyAE/18jbK7uIBFx9Wbkr6CX19BBTKpIecfTw
         DXdOlE8s6O0cMfxjg8oR3F7Bzgn4jIpU0UddZzrW8ZqQYjM1Juqlukl4flzFiphzTW4/
         +gQ6gkEIv1j/FMSkkYJUkIg/XnUsK3tSHswyNm+RETHwHP4yzcCNF34ubVo6zHzrUwdi
         5tchKAr4KUpYBIW6UOoFhVKJXAkf+wbf+v/DWJ3qpYFu2T31EAO7+4jmprAzZLSN9Njw
         Plyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793843804; x=1794448604;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zua2wKISeB6S1byTyWjx24hQmuvknlx4L4ArzH3c8oQ=;
        b=C3zCTGJNFBBgJmA3L0/ilb00H5A+edrbejJPTkV0bxQyZOdZUMNsEncuutKnG8DBBv
         QqVeV9OakENrLzYq6Wa1eFZc8cfRIiy6ULvKz6+eSD44jFl9kiWyt+bjsxQdElh0SqCV
         c08jqA30UoW9zvvHNKCpEITDXLB6QsL2mtehy6m+YRqeiVpBJ+M65xG9Ozs7R4FA2BRO
         l1nbKM2U928y+6nq8XIBifNFwrkTxdoFChh0Vc4qvxvqQniawgBWYiILTiK3N/ZcGZ3u
         MFIx/sjPkPwwxk3b5sRZJfzBt/toOaWfU3D+7ExJ5oGrRZ/Zr3l67uuf80FSLRySzUfD
         yehA==
X-Forwarded-Encrypted: i=1; AKwUvByawKlr/2vDGVeAvKTMqbBbhWYNsbEptTZvUtm596hkIRpYMq1W3s2m6xQqpfQh47IwErlXHBqqltN7ORk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8f7rTAQm0x6nwWjtP2mcnTeXmanYC8pt8jr/AzwVvTAVPqo636
	bF8Pyes1GK6UAGD0qTTctTGt3+6yiA2RrIRBJ8wS/diERVnCKn3d4EZQ
X-Gm-Gg: AYBFou1EXt/6QO3xCeqOtosB6eosWJL1NdzXs/9Ild31iTKI8/9LyADTwI4eFoCWDKW
	QrQ1GwZDwOxwBE8LWKYEV6U53c5Zxx6r/NDgxdv0cA1R41xaVEkdrmPLm0Yrkfd4yKjQ6xCHkSL
	159WkXQjsGl5Mw/rxLkM1KJy+k7KMjgw5RYAmJrDA/3OeFPT6PIGwntvhDDX/Uq8pIMl9Q7tkJc
	MzHaTtld45OyvynSeDAI9t51/+wN3b7C8O6ZIlJpD+w+5VgmY/BEWXoasAZcuOk+Xw7Pg/LAFLy
	tUXbT8FjnxNL7ZXLKI/HtiUBnJ08MiGHwPQiuf9ohlx6x1JUnVZO+NLV63GnGUh0LU8DMIzNhCl
	hUiV+CKQvIkirPU7k2IAlYgKyDpEr4HywlrIbWRgjCJAp2PWoFILZ1hOQ4OQvWkjfkGaYKQzNxC
	2irSKXt1Bi21scvXMqx5HiL887crcXMXp/z/Po8s7d8CnWbT3NIS1g8Mn5sEdpK+Y2FHWfUa3pS
	TGzMQKJOw9oUA46n6NniWEd62AAqOUTPCvQhRn3CTnV+ISUw3mdObqpINfbPV2UjiH8AkAKbO3O
	NVahirfq5jxCO59jLiCC
X-Received: by 2002:a05:7301:2a05:b0:36c:b138:651e with SMTP id 5a478bee46e88-36cb1386818mr7686510eec.22.1793843804409;
        Wed, 04 Nov 2026 17:56:44 -0800 (PST)
Received: from ubuntu.. ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca3785430sm16872570eec.3.2026.11.04.17.56.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 17:56:43 -0800 (PST)
From: Qiliang Yuan <odys.yuan@gmail.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>,
	Keith Busch <kbusch@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	Sagi Grimberg <sagi@grimberg.me>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Josh Triplett <josh@joshtriplett.org>,
	=?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
	Steven Rostedt <rostedt@goodmis.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	rcu@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 1/2] srcu: Add list_splice_init_srcu()
Date: Wed,  4 Nov 2026 20:56:38 -0500
Message-ID: <20261105015638.746024-1-odys.yuan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <5b0e7c55-72b1-410a-982c-a62138b9e44c@paulmck-laptop>
References: <20261104-bug-nvme-remove-ns-srcu-v2-0-feb64ecb96ca@gmail.com> <20261104-bug-nvme-remove-ns-srcu-v2-1-feb64ecb96ca@gmail.com> <9f8c94ff-29e3-4ea5-b9ec-b04b2bc21b1c@paulmck-laptop> <5b0e7c55-72b1-410a-982c-a62138b9e44c@paulmck-laptop>
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

On Wed, Nov 04, 2026 at 05:46:45PM -0800, Paul E. McKenney wrote:
> On Wed, Nov 04, 2026 at 09:14:13AM -0800, Paul E. McKenney wrote:
> > I am not inalterably opposed to adding a list_splice_init_srcu(),
> > especially if quite a few more users show up, but here is what I was
> > expecting people to do:
> >
> > 	static void synchronize_my_srcu(void)
> > 	{
> > 		synchronize_srcu(&my_srcu);
> > 	}
> >
> > 	...
> >
> > 	list_splice_init_rcu(l, h, synchronize_my_srcu);
> >
> > We need at least six uses of the above idiom to break even on the line
> > of code required for introducing a list_splice_init_srcu().
>
> Given Qiliang's response:
>
> Reviewed-by: Paul E. McKenney <paulmck@kernel.org>

Thanks, Paul.

Christoph, with that, please disregard my suggestion to take v1
instead; v2 is the one to apply.

Thanks,
Qiliang
