Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794470754;
	b=FwZx5vrujqv7U1aTAe44nV9qYddmDAXDEI0YpIVyseQ1JPxSQ7l46L2GrMC3wW84yr2n
	 1UkfiVPR9bDprlBKU7CdeHQmvJip+4j8l3JKGXeBkK84rcruGbxyS8vdrMl51lg6CVAht
	 pvE7YGhJsSyEr3j7sdEK0mQiVDAGgyCDKoXw0G5dZ4Z0AU3pa7zc8kIEYUG+YbbQV/+Os
	 eQ268VYRxajcHPgYpQmFjO3eARx5QF0oB852vOrIFgZJHkbzo1lF/3V4UeRn0Gwx9/8QX
	 leMGvDCoSQFOad58eVq5EBaop/NF3gs6rFxceuXqUkAiADHBi2WsVoSR+HyeXpJkxlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794470754;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=ArZiWLhorJw5ucRbxV10l7039zDtSIU3wClqZur+OXY=;
	b=gzURGxSlSrQTr36FXqbOwvnukotiSKUvQvB/ZPtJPgE7emPiDXOylDNuHFRlPmZG0kqR
	 nDaVptGOLQElQFaXb794jdD9QVwjrS6GHlqtAEUYSQfoiG2nw8UOHOjDDq4uWOPQWJIIN
	 Hui/dNra/prndaNYDQMqfdKq3Oye7oNNb7yG60xFFD31LukiLiXoyua2hXwO8oYRoAbHy
	 355+aXPWY6dBhQONt6qWFa8NNQkJgrUVBWtOpxHINHPNWq1rAo/s/NDR+Y6G+m6ytflvQ
	 XkCJQQlWKTZDv8NFN0gkMv8A+mOYq5TJb8ZYUoLali2qAqldyd6YBuqF1OeYGj3+laA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ShXJCZZh;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAA59606A327
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:05:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EAA59606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ShXJCZZh
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-49412eb1474so2366920f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 00:05:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794470751; x=1795075551; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ArZiWLhorJw5ucRbxV10l7039zDtSIU3wClqZur+OXY=;
        b=ShXJCZZh3r9hFJDuUtCPJodlUXkqzCQOB1+2EM+MSr2/BQ2FkFGpi3pTNh8on5CIZe
         NeKY6TOgYXAOV9MBu8ZCuCDVW3yAwkNFoXm4XT0u+zdX3SgHGxcqUP3q1yLvYlH5XNR0
         L4IWOvBvhJmsslkJWEApkZvYW26ZB4wbfp1gy7orV7SKYNr4MbfW68n+F2/9eSWiKhU3
         I4HI2plZjvrsHr8QtqDzGKaHnbi+EuaqhixeGOb8ZFGL3gicwGhpvlFsD6E+/c9fLVom
         3chpV30pWkbX8LF57Km0CQekllGUhf3lmCNsHQp9/sBmyShviBOHBFxDw3lokCUGQWf9
         Ob9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794470751; x=1795075551;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ArZiWLhorJw5ucRbxV10l7039zDtSIU3wClqZur+OXY=;
        b=IZG/JkvTsBbS+OK0WxUWx8jt7YQp28xG8ta67Y2HsUzZp889xXA/AOaBTYb8k/dcuX
         VfTArb8dbJpq/W0BIcqpeauuW6hPSs+qetU/cgQFnOeLrUajjxSuQ1V4tLhWr+D9WJk5
         K/wAJfWD2X7PFZ75Gwoj1B7AQCKcKFofx5blGidCsa8sBkEb3AebJQLeZIw/Xg282TuX
         bGOUgdzCG5SBMPXOMbHU+UHxMeztJXZcNSd5+xwCTLCsG0Ryq7TFkmyeAMyzkUWE5WYo
         Rw8IVP6z8OoBP4Ma8BELuVwUkx1FfU+RjO4swx0kNMIacvtZWC0DD9f9LjhPbgu/mrLM
         HUMQ==
X-Forwarded-Encrypted: i=1; AL+hErEcsUpES/crVhz//PR0OppKpLeAC00iKOwvEncNSMP63baWH8QL5zM5gzlSOFnZtxjSCDgMuT16OrFFQqI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9LvxIiM8uCSB+5OyI6oDELuN95tggTDTpDUE8n5PSmU7qZxBT3
	7e1aHoEUTqewMaIGOWN2I1wCPrGgUdVm85jRKQQqGSFeBEBv865sYg1N
X-Gm-Gg: AYBFou0wHQLIAHV76Nf0GuXsZNTFAzo9bFbBJxX+pLk3AYWZe9Ov9JxkoMBI7ZATLbv
	P7jy4Ma2fq61FuLxcHWHKoUqICv1kx71MgRqaLWMm/fTLBRSB+KETZmDxeZBzhmhTqj/w2D8IDm
	iTmG3U2nAkMzyarnA2SU8zCHAj0Qy0MCwj10JL+My2rcsP1ZhYlWE39KPhlLwJ2G8IUMiByIWkb
	WebVLqfB6PAPr7L/qcuiJ6mJJOVSkdCQVnCvARgs/jbgoSUMdXD/iV8WS709dla+oe5PfPwE3Yj
	rcUtcyOV44SpL65YNENV3yscXnufyUciNguXy6YJesfF7+9ltzC9YqXnY/okf/Kp+keQ09FczFC
	7kzsoNO8re5sRFQHnqUcWqKxcBmGlOFD8pDtViCbOqj0EauXddrcAfSSAjAYg+D3ssQlTcfIuwt
	fDwDvAhAGT7S1fMnlk77nhMCtycPZD0iOuRf194CCjXhi6km0Ky4fuaGNm9PTHd+lH4Ecy2PbVl
	e+/TuYzzcKf/bpVktzoWWkGqqhHBYvfneuqvGDpRptg1iduj8OvpiFFP+2zDjwzE7uhqHKOkgm+
	Xl2oBEDN+0WgdU2EIstqwwbCLxEiXrhiRWz6C7eSne9r8uJdOufdqQ==
X-Received: by 2002:a05:6000:4b0b:b0:492:b5d9:f627 with SMTP id ffacd0b85a97d-499c8796888mr7998443f8f.46.1794470751084;
        Thu, 12 Nov 2026 00:05:51 -0800 (PST)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4983585923bsm15722919f8f.11.2026.11.12.00.05.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 00:05:50 -0800 (PST)
Date: Thu, 12 Nov 2026 09:05:49 +0100
From: =?iso-8859-1?Q?G=FCnther?= Noack <gnoack3000@gmail.com>
To: pandaWall <mangosteen922@126.com>
Cc: mic@digikod.net, gnoack@google.com,
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] landlock: Fix layer composition of
 LANDLOCK_ACCESS_FS_REFER
Message-ID: <20261112.cb77bc01c8a6@gnoack.org>
References: <20261112025528.443654-1-mangosteen922@126.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261112025528.443654-1-mangosteen922@126.com>

On Thu, Nov 12, 2026 at 10:55:28AM +0800, pandaWall wrote:
> landlock_get_fs_access_mask() unconditionally ORs
> _LANDLOCK_ACCESS_FS_INITIALLY_DENIED (i.e. LANDLOCK_ACCESS_FS_REFER)
> into every layer's handled filesystem mask.  Layers created from
> rulesets that only handle other rule types (network ports, scopes) or
> only permissions therefore report REFER as handled even though
> landlock_upgrade_handled_layer_config() only adds the bit when
> handled.fs is non-zero, and no filesystem rule can ever clear a bit
> of such a layer.
> 
> The consequence is that stacking any non-filesystem ruleset on top of
> a filesystem ruleset makes link(2), rename(2) and
> renameat2(RENAME_EXCHANGE) fail with -EXDEV/-EACCES even when each
> ruleset individually allows the operation: landlock_unmask_layers()
> requires every layer's mask to be cleared, and a non-filesystem
> layer's mask can never be.
> 
> Only implicitly handle REFER for layers that already handle
> filesystem access rights.
> 
> Fixes: fff69fb03dde ("landlock: Support network rules with TCP bind and connect")
> Signed-off-by: pandaWall <mangosteen922@126.com>
> 
> Add a corresponding regression test to the layout1 fs_test suite:
> stacking a network-only ruleset (handled_access_net only) on top of a
> filesystem ruleset allowing REFER and MAKE_REG must not deny
> different-parent rename/exchange.
> ---
>  security/landlock/domain.h                 | 15 +++++++--
>  tools/testing/selftests/landlock/fs_test.c | 37 ++++++++++++++++++++++
>  2 files changed, 49 insertions(+), 3 deletions(-)
> 
> diff --git a/security/landlock/domain.h b/security/landlock/domain.h
> index 935e18b12..07d4a23fc 100644
> --- a/security/landlock/domain.h
> +++ b/security/landlock/domain.h
> @@ -262,9 +262,18 @@ static inline access_mask_t
>  landlock_get_fs_access_mask(const struct landlock_domain *const domain,
>  			    const u16 layer_level)
>  {
> -	/* Handles all initially denied by default access rights. */
> -	return domain->layers[layer_level].handled.fs |
> -	       _LANDLOCK_ACCESS_FS_INITIALLY_DENIED;
> +	access_mask_t handled = domain->layers[layer_level].handled.fs;
> +
> +	/*
> +	 * Only layers that handle filesystem access rights implicitly
> +	 * handle REFER.  A layer that handles other rule types (e.g.
> +	 * network, scopes) must not imply REFER, otherwise it would
> +	 * spuriously deny link and rename operations.
> +	 */
> +	if (handled)
> +		handled |= _LANDLOCK_ACCESS_FS_INITIALLY_DENIED;
> +
> +	return handled;
>  }
>  
>  static inline access_mask_t
> diff --git a/tools/testing/selftests/landlock/fs_test.c b/tools/testing/selftests/landlock/fs_test.c
> index f725882fa..5588f0ee5 100644
> --- a/tools/testing/selftests/landlock/fs_test.c
> +++ b/tools/testing/selftests/landlock/fs_test.c
> @@ -2570,6 +2570,43 @@ const struct rule layer_dir_s2d1_execute[] = {
>  	{},
>  };
>  
> +/*
> + * Tests that a layer not handling filesystem access rights does not
> + * implicitly handle LANDLOCK_ACCESS_FS_REFER, which would otherwise deny
> + * different-parent renames and links stacked on top of a filesystem ruleset.
> + */
> +TEST_F_FORK(layout1, refer_with_net_layer)
> +{
> +	const struct rule layer_fs[] = {
> +		{
> +			.path = dir_s1d2,
> +			.access = LANDLOCK_ACCESS_FS_REFER,
> +		},
> +		{
> +			.path = dir_s1d3,
> +			.access = LANDLOCK_ACCESS_FS_MAKE_REG,
> +		},
> +		{},
> +	};
> +	const struct landlock_ruleset_attr ruleset_net = {
> +		.handled_access_net = LANDLOCK_ACCESS_NET_BIND_TCP,
> +	};
> +
> +	/* layer_fs alone: different-parent rename is allowed. */
> +	enforce_fs(_metadata, LANDLOCK_ACCESS_FS_REFER |
> +				      LANDLOCK_ACCESS_FS_MAKE_REG,
> +		   layer_fs);
> +	ASSERT_EQ(0, test_rename(file1_s1d2, file1_s1d3));
> +	ASSERT_EQ(0, test_rename(file1_s1d3, file1_s1d2));
> +	ASSERT_EQ(0, test_exchange(file2_s1d2, file2_s1d3));
> +
> +	/* Stacks a network-only layer: still allowed. */
> +	drop_access_rights(_metadata, &ruleset_net);
> +	ASSERT_EQ(0, test_rename(file1_s1d2, file1_s1d3));
> +	ASSERT_EQ(0, test_rename(file1_s1d3, file1_s1d2));
> +	ASSERT_EQ(0, test_exchange(file2_s1d2, file2_s1d3));
> +}
> +
>  /*
>   * Tests precedence over renames: denied by default for different parent
>   * directories, *with* a rule matching a parent directory, but not directly
> -- 
> 2.56.0
> 

The same patch (with the same subject live even) was already sent by me in [1].

If you are serious about sending kernel patches, please:

* Start at patch version 1, not 2.
* Send new patch versions as top level threads.
* Wait for feedback before sending V3.
* Clarify in subsequent versions what the difference to the previous one is.
* Contributors must use full names in their submissions, as Sashiko also remarked.

This is wrong on multiple levels and looks suspiciously like it was
lacking human supervision?  In case this was an AI bot, please don't
let your AI bots loose unsupervised on the kernel mailing lists.

Thanks,
–Günther


[1] https://lore.kernel.org/all/20261108-b4-landlock-refer-nonfs-layer-v2-0-2b405fc1b3aa@gmail.com/
