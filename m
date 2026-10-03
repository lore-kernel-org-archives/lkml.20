Received: from mail-lr2-f34.google.com (mail-lr2-f34.google.com [74.125.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C45AA41441C
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 10:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791023050; cv=pass; b=IAi8RwECHbeMbCzLzazz9KukG8Eny9uBREDo2pC2PGxOO+rhROljvVrYmhfxJGxVi19j1ovmWoRnhOGUdh9nBrXMBEyClnyeiZK3h72BxwOgi+gk2n5zLpEupeTPbl7ndZLqU7ep5qA1U2Gk5EgYoX4VvBaMdeI6Y6xV87RJ+vY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791023050; c=relaxed/simple;
	bh=sgu4JSbp6cYgNijyoqtv3f0TarB6ixKdQIPpCsjQk7Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N9t9MhkyLiKbgNi00c3Z8AgYdNICFA2jyxPvVP5nuNT+zBoDVjmk0GD5fUPCUUQ7ACpM3ngnwNrMsYlh6NIrK3GhGjFmU/UrRxhK+xGt5YIWnFbZREDfAx5FFq/gmzp9unaU+9ohiem0A80w63AXwDxH0U8fPO2mdSJDWzYALWM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fRaME8Z+; arc=pass smtp.client-ip=74.125.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fRaME8Z+"
Received: by mail-lr2-f34.google.com with SMTP id 38308e7fff4ca-3a78129ac98so867931fa.2
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 03:24:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791023047; cv=none;
        d=google.com; s=arc-20260327;
        b=aTYzXHMSqsJ96GRwnR9OLr/dnFiQRrtcp/iZan2YlFnzZ+/3LF3nsF7gJrYskxKLXa
         NGyYD5CpLp58OfcFnkzKGC8sFTlBuYywRAdZQxr13qO3xY4WZEKXNUA7sOFgHG7u/C3Q
         /rFfONlMaRhyCPUaHz6QiJjK0EwZOEhPn4Ygn1HJDUjFhkmDI1bveV41EPuz4xvr0O+a
         TfiHmqhrEwANMqMwycb7dYwfLYUfJHYX0rprP2elrwit+Y0aTboklBNFGtCwCHzpnUJU
         lpvsgkpbOCKvtlRpZPD5h4MpEU3jZGNgO1m4hynDd1q5iYuulSa0oetMi6PO1mR58hBA
         u6BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sgu4JSbp6cYgNijyoqtv3f0TarB6ixKdQIPpCsjQk7Q=;
        fh=82eorfZbRLK0jw20bKPWnrgYnURLCX+POvhbqxtTifU=;
        b=WUEin9J3ybJ75ugiA8gbqBcrfKExtgH7P3zInPqCmqHtyjOdeKHG7zSpjc2EwJbXhg
         Ig437/np1V3HjFNCEEwEVXeSJHWoLEF2DkgxNhbWiRr8zuvQgb7FIuZunP9ZCLdN/hrO
         Pr1UipWmgtZSFqG8kRZVBoNo3shtvScYLOocUzj/jX31w3ifas8ohg9oK16TGgEKS1kq
         7qh8Sek1SC6zZTqUQu7RQkt6V4jgZi1YA0V/PgFCdnF5Rx0imAnEt5M4boXgZOsvUvFB
         XEDT77KGcq4KuW4lQCWn4tf3nxmTn2OdRSvcAreplPAKp3+XqQsjJuNbFeSs0U3pQPe6
         6Mtg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791023047; x=1791627847; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sgu4JSbp6cYgNijyoqtv3f0TarB6ixKdQIPpCsjQk7Q=;
        b=fRaME8Z+QwZa7zX+rub7EWmDQ9NyBR94KxTWwD224tHGqYpPE5tISxPHXqwE2YZOLu
         5XASDPZulwRlXT+oAydX0ju2vdCYFzdhV85lDbgvBPDUQUqsX3U/3dOGKbCfAjnKoBvC
         dbGsw/NlnqZ9l8DkmNReqx4pg9WEMJ11Lxcyg6H33wgTnom2E5PveNytAkahv7QSZCjb
         qjN5fxTMrvfz9J7CP/91e4T9c89Ak8HUNNixtzDWtJuqwYze2Myu6Po74Zj8iUcffE1R
         qHBPyOEafLGq4enBPGalgdUf1azmHvAEH9MshriJ1eHDE6LpUx0aSx/aJ/li7yKueItC
         kHkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791023047; x=1791627847;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sgu4JSbp6cYgNijyoqtv3f0TarB6ixKdQIPpCsjQk7Q=;
        b=t8/FsjCR56MaUzscEsyTf5Qpp7UhcX0k66THIBlnTxk5JgTrmpMY0M1dT586/FV1Ov
         rAJccQG8eUejHV4gJgPHrGhBafNP4wTxB/ums5L6x3QkXr0mzHO1o4P64y2Bvc62Lidc
         H8QPyLyaHgXmFn5Z8VHsRDlu1dJzVbp5JgkQxqp+1ybT6Hoi9+YjUaQXfNRCh/z29JeO
         Jpl6e7DU5tSL53xvLj28NXq+rP0/FnvJ0Yn6b07vHNIuKeZCfPfCJFCfv/4BO8kyonwh
         2oK81/uob2uyrwisbdC74pQ8t3mWpk2aNQBbIQPKgy/l49YbZH2BEoPuKEQVjSSZjRgN
         ssxQ==
X-Forwarded-Encrypted: i=1; AKwUvBz3gA0um07ITl/2/I9SmL5nRg96OOJ69G31xbNyV7n0zdfGKvAtUdsU3wL7FYTsfBasJWWaoas7zXLH45U=@vger.kernel.org
X-Gm-Message-State: AFq9FYJrwB2Qb+uZRRDoYuOhdj6k35i0RmKZ+q4Nruyu/NF62QV+LYri
	8JGDAPpPAWfmAQ2EeA6W1NNAG3nCHplLrlkaVO+iqA+/17PF3AxzBNNSGf8HBKS5ybXONlBEX4y
	PHOD+E+E7gx5cHJMXGsrAgJDl4b5LbbU=
X-Gm-Gg: AYBFou3eGDRgQLrqQlBxpLd8jSPsPj+B933KhFsMQQ+XJf+RfbRSV8JnC1cK/jKA2Fk
	AEiAhfDA6gVuz/3mGuu0pkK4hKaQtzy57p/kQylp0H5B9iv1xLdl6lhixwrHaDXRua3FBJ/4dgW
	HW1wTihcbKlEfboM8nCatiI6Qu8FNLkHzSzyu4IC7N8gexZBvzdDe0DyVcgB3Wyxxy9RCoLMYoZ
	YXO2ZeqOjUzlK5CIUcMo7hNd9rsA+8t33nK7pW/w2r9GOYX459GP+8nM+op/8e+9bSnskpeZKx+
	26hRezwdWh7hgyLp3knZhUZj1TaMtj888VEbIvdb98xp961SkeimhU2Wa7cQJah/vGcmA1oqELJ
	p7VHbgPUNgBI+S6HDL7lxMSdxN+8N4JjchZXj
X-Received: by 2002:a05:651c:1612:b0:3a7:6b01:849e with SMTP id
 38308e7fff4ca-3a87ec283c0mr14770191fa.0.1791023046561; Sat, 03 Oct 2026
 03:24:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929131142.266819-1-chenyou910331@gmail.com>
 <20260929131142.266819-2-chenyou910331@gmail.com> <asCIcsjSHdqF3oI-@wyuan.org>
In-Reply-To: <asCIcsjSHdqF3oI-@wyuan.org>
From: =?UTF-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>
Date: Sat, 3 Oct 2026 18:23:55 +0800
X-Gm-Features: AclHuK_NTbWNX2dM7QqOvgSjfu1HuPqVHS6q_wtYl901z9CYUgOhTaKfFyCxsLA
Message-ID: <CAKspUhLQJ7BiOEULudkq5AM5-FB-DEqfyQTsbq5YBHvG2YS-Ag@mail.gmail.com>
Subject: Re: [PATCH 1/3] docs/zh_TW: add a notice for translations not kept in sync
To: Weijie Yuan <wy@wyuan.org>
Cc: corbet@lwn.net, alexs@kernel.org, dzm91@hust.edu.cn, si.yanteng@linux.dev, 
	srcres258@furdevs.cn, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

T24gU2F0LCBPY3QgMDMsIDIwMjYgYXQgMTI6NDU6MzhQTSArMDgwMCwgV2VpamllIFl1YW4gd3Jv
dGU6DQo+ID4gKyDlh7rlhaXvvIzoq4vku6Xoi7Hmlofljp/mlofvvIjopovkuIvmlrnnmoRPcmln
aW5hbOashOS9je+8ieeCuua6luOAguWmguaenOaCqOmhmOaEj+WNlOWKqeabtOaWsOacrA0KPg0K
PiBTbyBoZXJlIG1lYW5zIHdlIHN0aWxsIG5lZWQgdGhlIE9yaWdpbmFsIGZpZWxkLj8gOykNCg0K
R29vZCBjYXRjaCAtLSB0aGUgbm90aWNlIGRvZXMgbGVhbiBvbiBpdC4gQXMgbG9uZyBhcyB0aGUg
ZmllbGRzIGFyZSB0aGUNCnByYWN0aWNlLCB0aGUgc2VudGVuY2UgaXMgYWNjdXJhdGUsIHNvIEkg
d291bGQgbGVhdmUgaXQgYXMgaXMgaGVyZS4gSWYNCndlIGV2ZXIgZGVjaWRlIHRvIGRyb3AgdGhl
IGZpZWxkcywgcmV3b3JkaW5nIHRoaXMgbGluZSBiZWxvbmdzIGluIHRoYXQNCnNhbWUgY2hhbmdl
Lg0KDQpUaGFua3MsDQpDaGVuLVl1DQo=
