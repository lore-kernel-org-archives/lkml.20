Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793725205;
	b=hujucfHGW2eQLBOUYHHEbPlqZuDnKNeZZeznc7bFMrLcpcfJR208wNLOgTGJ6aTX9dSQ
	 SdBJ1X8L4LsUScbNwxtnirErADKKVSFmnEB94YNL9zNOyk/Y3yGOxewRbbjDXcCAV8q3c
	 H1vm6AZeY6B1SqpdWdrjTPFtIsLZE14FzGLb7C+G2gQfFDqQpgcNSlnMF9qQJ/MzNK0iB
	 kr7rlaE6YSBcT2fn5gABpasvzIHlpiBOQ03U7sK2LQFUly08KT8YDh6hTa2JAatrVplh8
	 nNDQV7qznzZ+M1mNKvRQSalZhCB7O94m6u2/4q/Mvt6BK0J3yIyh6Rjc4q+HdyA5CkA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793725205;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=IwENZntiJlarlvFQZtJA8Hi2kPGzvUj5L+0sjlz0GhM=;
	b=QUp13qymUV5q/kOXpp5B+ySxE6VP3MTrBQtooEmIKx42JMavK5i98DmM3OclKdkS2ZZk
	 ymxtMREsS9XWxc3iD3O2tqDWfsl9sXXck/q2TbVanrEZMzRaqBcyFijWu8Daowt/NRLQ9
	 L/FRD7NY4xPB1ENZmgPvOEbpTg2juMPyiWn8ExB8iMcWt9b+DygPKPk9bXfoqJ3wVPVyG
	 h4O3L07UHmp8OCQ7dCsiYPOyg6QLrWoAHIvUYIpTzK7mwLi2kq09gHaL8yqPJcoHkLRy0
	 7WZ9IEhxvEaZN0NxiU13rNNk6aepNFrl+5/VVQLF68hX9I3mrHiPgoz/IESktgQhA3A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k4H569jS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.179
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B534F606A32E
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 17:00:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B534F606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k4H569jS
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-8b308fca7c3so1002987b3.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 09:00:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793725204; cv=none;
        d=google.com; s=arc-20260327;
        b=N/WxsiuSysGo+bQkIMDSV4oGZej1h0IPRqxqGYWfywIryT19jgtBk7Gm+r2+q3jbS/
         wNTyH1fhNI1ElGE5K5ljHm+NTN/6f+kUkcBaxFtxzY61AXIXtCKH+P69/pT2T3Fu3iq2
         yuR+TxGsXAvNNI1c5EkchuZTgnj6YngYP6NrwCB3/5Z8Q0kq+uBDUNTpXd3HFDtn66Ww
         cW+rRPhtAtcgCYmEgMOZxx/c2CEkmnSUBocW6lagiTnB6pa/yCi3dpm6k/e/7wSDjbe8
         9wK9f3VPnNbQW80v2plE1qXgrpGKayhcSTpOpI1Hzm/vp1sWIGcEyID1YTxLVE+m4LOm
         tTDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IwENZntiJlarlvFQZtJA8Hi2kPGzvUj5L+0sjlz0GhM=;
        fh=TYILW3OTy8vrAP5FE2qS8xUQJh4YfCdrDNVN7UZPgzk=;
        b=GhP4KY7gcNGjCBfjPLJl5tuVrf3tOK0LsvGZZY9eHMCQ3QTGHEX+v7YVOf9RA9wFCj
         +lTZUzDVLzyoY8Y6eMlIYpsy2PjoGjhYm++f2XkDRQpC9XRKxkwH8Fz3NqAoU8ghXcl0
         O51/W64V8E7npCsVr3KwaJN/G5k9SqVg/LhF6nuRiPx2/oPB0Y15EomQMUTW8wIJeUJG
         AGn6itJy8C40BfIV7IfXD+ODv7wq+25fEgdXAsXf6efF2YTMkZZsBEsU+/YmGeRk5uYG
         1EzEbuSY4bUwk4CGH7A8GGhoTBpchpRc3yDV/B1wlWQaRhX4OqTkNswvuFgCKBvPixnf
         JzLg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793725204; x=1794330004; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IwENZntiJlarlvFQZtJA8Hi2kPGzvUj5L+0sjlz0GhM=;
        b=k4H569jSNCl7pmw98TBgG0nbexJM78aST+cZIQiq6SpBtwiyvbDsZORQ8P8bhuI0Uz
         ckpHp7quXXbxiZHFqZrc+iNY/6HcmMAy5gh20AP3xQOLYCMxdY3AYEJxfTKfxlHEz7j8
         p6liLVWp9qEzHIIJoV+jkW3mzum+kQzNQ+K6EKG9f1EHL5UXr2tELlypFdr1s9/FpqQu
         /R6q9+4CFmEe6/e9lDzuR7MngJfmG4FFUrJkDRJkS+VdBPL+Tzm/rjXXckE6kLS2tOLk
         Pye+oyypvdm5kKNAorqaCwXXk1GC35JVwaBdS1PWPrRbXRg9LLS1mYu7tkoND+xM1wJk
         RGOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793725204; x=1794330004;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IwENZntiJlarlvFQZtJA8Hi2kPGzvUj5L+0sjlz0GhM=;
        b=htlVmLbSctm+20YMi6A0FLgci+mfODHUuO5qorWKaSUQ0u0xtbm6Umaoc7fG9wVdj1
         hizumJIwSBLzEMF+S/eGMvUitu1p+e6rPvCywyWdxojRVmuLILnvN09hoUxlR1eM5Oao
         aGSZCDU0R0OLGmo2BKa8yJjwSvYAYgMFvHkSI3d+PloxVh7g2/HgOaeId0ft9zL8yggb
         5qpC9NR3y4cQMy+/PtbXpNagn+QMXxpN7vnHuiDSgEPpbbptwubApEg2UyrVko6huAyg
         hrfOGpyDO5KuqR9yzI9xjdvumyUblp8kbio5BH8WqN/xgsg9qWxZ6hDkVExYgFPNAejN
         mlKQ==
X-Forwarded-Encrypted: i=1; AKwUvBw8DtiLS+oPXcxPMmjVmECvvMDeGVS11c++02OYUNVTzIt0Utlip5OrI+cSHp1EnBviKouStOEMBqOYTyY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9qv4a7UAqAnNzQnzeXJb77AK/s7mfeKXy5giUCAjhx53utesMx
	QXQdBrasjvpMKgB4HUpuwWD6LQPK7mC92y+x8R9hM4SDtYmUOR03oUqMDqt6kgwNMw3150miNK6
	ls1eUzG9x1TNWxfpOtFKpPv+PDrUIvmM=
X-Gm-Gg: AYBFou3f1ojtrRnmxobROLwkHDaIO1JdvLAyWX9v/PTuXPmI6yA+zTpNabstQ83CWw/
	8ohix2/ub8L+Hf4WRd+va2ZM8xxJv93YkS+3zr3q2dxsr757lRgDedF/6hY2zXP74I9lPUhCI0U
	ZQa3hKTlT9RROvxqqsQWCSoA7uWb16J2NrO/IuKiQE3kJFLKYpPaDumzYcLoWltxSc/co/WP4GS
	G+K2NtgWk1+6QGTTuz2FnGjaWiz1ssExyriEE+p4gedF2Mg1FTkoWSELtnZIEo4NkTGwVhoivR1
	keH6Tx5TK7elNTah1U/EqU7CoBN3viR3I+N3JvNbhk30Kv22idk7DHe5SzbCea4a8MshDWXTQrh
	vj494DK5HMCzAmp30qzI+Jlvcd8oXkSU+altLfmXmlVb6n0d4qlqimn8lxGIyiNt+CTACfA==
X-Received: by 2002:a05:690e:11c3:b0:678:d394:76e5 with SMTP id
 956f58d0204a3-67ba50b2058mr10515522d50.78.1793725203567; Tue, 03 Nov 2026
 09:00:03 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <tencent_7A270291DDE5CD89DAFFE8A745D094D5BD06@qq.com>
 <179344707641.114606.12665582704521593779@cmss.chinamobile.com>
 <CAMMLpeQKJO52qhba=G-ZudUA57iAdX4SOapOv7YuprBZ3FzM-w@mail.gmail.com> <1793605892000.83333.5506952827930878398@cmss.chinamobile.com>
In-Reply-To: <1793605892000.83333.5506952827930878398@cmss.chinamobile.com>
From: Alex Henrie <alexhenrie24@gmail.com>
Date: Tue, 3 Nov 2026 09:59:00 -0700
X-Gm-Features: AclHuK-cYMiCx2wsZWfJ2YNCFTCxFXBS-_OrcxP7_PfeEMQ65pCJAdArhgcDTmM
Message-ID: <CAMMLpeRtPjuxzJhy-pFe5skx9oUw88NxNi6DfMjoh=+VpGn+jw@mail.gmail.com>
Subject: Re: [PATCH net v3] ipv6: reject wrapped temporary address preferred lifetimes
To: Xia Yan <yanxia@cmss.chinamobile.com>
Cc: Yingjie Wang <1075151112@qq.com>, netdev@vger.kernel.org, dsahern@kernel.org, 
	idosch@nvidia.com, davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, 
	pabeni@redhat.com, horms@kernel.org, linux-kernel@vger.kernel.org, 
	yana06070@163.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 12:51=E2=80=AFAM Xia Yan <yanxia@cmss.chinamobile.co=
m> wrote:

> The remaining worry for me is retention. With a short preferred
> lifetime and temp_valid_lft at its two-day default, deprecated
> temporary addresses stay on the interface until their valid lifetime
> expires, and this path does not check max_addresses. Your 90-second
> configuration ages them out fast; with the default I would expect
> many more addresses held at once, but I have not tested that or
> measured the cost. The creation rate also depends on DAD timing, so
> my earlier one-address-per-second estimate was too definite.

With the default temp_valid_lft of 2 days, creating 1 temporary
address per second would result in a maximum of 172,800 temporary
addresses. If the user explicitly sets temp_prefered_lft=3D1,
regen_min_advance=3D0, and dad_transmits=3D0, that's exactly what should
happen. When I tested that scenario on my desktop computer today,
Firefox worked and overall system stability was fine, but Chromium
failed to load any pages and NetworkManager became unresponsive. It
seems that some software doesn't mind that there are tens of thousands
of IPv6 addresses and other software won't tolerate it.

I'm not convinced that using max_addresses to limit the number of
temporary addresses is a good idea. The default value of max_addresses
is 16, so in the worst-case scenario, after 16 seconds temporary
address creation would be effectively disabled until the addresses
expire 2 days later. Similarly, if the user sets temp_prefered_lft to
1 hour (a perfectly reasonable value), the limit would be silently
reached after 16 hours. If we increase max_addresses to 48 to be sure
that 1 temporary address per hour can be created for 2 days, a brief
period of worst-case router advertisements would still use up all of
the addresses in 48 seconds. To protect the user's privacy, new
temporary addresses must continue to be created no matter what is
happening on the network. (With one exception: If the SLAAC address's
lifetime is so short that it's effectively a temporary address
already.)

We already have regen_min_advance which specifies the lower limit of
regen_advance. Maybe we should also have a regen_max_advance to
specify an upper limit. That way, a misconfigured router could not
cause a Linux client to create a new temporary address long before the
current temporary address expires, nor could a misconfigured router
cause Linux to use a long-lived SLAAC address without creating any
temporary addresses at all. The maximum number of simultaneous
temporary addresses would become temp_valid_lft / (temp_prefered_lft -
max_desync_factor - regen_max_advance), and the user would be expected
to set temp_prefered_lft to a value larger than max_desync_factor +
regen_max_advance. With temp_valid_lft=3D172800 (2 days),
temp_prefered_lft=3D3600 (1 hour), max_desync_factor=3D600 (10 minutes),
and regen_max_advance=3D300 (5 minutes), there would be a maximum of 64
temporary addresses at any given time.

-Alex
