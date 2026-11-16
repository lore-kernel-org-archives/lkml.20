Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794865645;
	b=g20/PWW00ZkQZNxMa443fAzo2JMNFV45NnNhul2yoX9CYTG5gOmnuUrLumkm6hdvwwQL
	 14hJH63lRd2GicGK4s9meIZSCV/Hb5n6W1/WpWBUycnQeHq67APOBuntidbyLw6cXSm+K
	 ZRoc1Ws8v4dmQSk/UsluoXuWHAVX97Q+CGrI2XX1OR+5+fIpA9+aKbTchEPb02ux5VVac
	 HeXrC7KZMaUA5Yy3E6UmN21LX05EU3fTTFs3hc8ifqBq22P4lSQ9O0L1TmAVNL99c08Ky
	 pCfGKzfn0S5+XkVoYoGH98mkm8ugtcfYPkOo7h0lz9wXDxQYUyQJsth1Ca+rEt6/jjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794865645;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=xRUD1m3jiy/hrv2ML7hzljeeq/snUMZEtvat+njNg3Q=;
	b=flW6sZx42mziU4uTntmatCeUkZ8YqrStjjLO1ZAb15sX1zVfcm0OP6gjSil+X1nQY/mH
	 xO8L8FQFovi8CrRxSYYpeTq0OhyXc66d4a2K+4SRtVcRtMIqIZPieBNHL5Oxin3bVO6iB
	 YedBdB3/AYsFbTdio/lnhiqmecbCFb2EJbqmkDK33SsCn/wwAvaxYfITDQ1ACHrGwWpMQ
	 Owwedr3+HpA2tSBJL5ssfHSSvKlFY3+Kb+GIqrFXnSqHX1EbWPGVX49pQbO/GKZ0RM6ay
	 NmbuBVs5KP2XtFvCbNsyILyLSxzTEpo1KGXWLZp6z+S9hP8Xp6jqzEa23OeAXzzgF7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="sfBSw6/b";
	arc=none smtp.remote-ip=91.218.175.44
Received: from mta0.migadu.com (out-44.mta0.migadu.com [91.218.175.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61475606A329
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 21:47:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61475606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=sfBSw6/b
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=nUW0iBV2ECp8Knrlsr623UaAJvJftGJk+k9uQjhfGqk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794865642; v=1; x=1795470442;
 b=sfBSw6/bSHN/JSw4jOBe8oNgt8XcrtLUFpryy24FX7sJ2bCXaeOCGvv5rCpo5X6GqbmRy6Ce
 Z1j08+l/6zZcSXoy38y12OBYAlcFOk0aq00ZWg9cflYDUrqKBDQud6lFrQjFwErPxulhkB1j5ky
 EcogVyY0AQcLksXNYVHeZQTw=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 3f9456e79de43322;
	Mon, 16 Nov 2026 21:47:22 +0000
X-Mizu-Trace-ID: 3f9456e79de43322
X-Migadu-Flow: FLOW_OUT
Date: Mon, 16 Nov 2026 22:46:14 +0100
From: Luka Gejak <luka.gejak@linux.dev>
To: Leonard Lausen <leonard@lausen.nl>, Ping-Ke Shih <pkshih@realtek.com>
CC: leonard@lausen.nl, =?ISO-8859-1?Q?David_H=E4rdeman?= <david@hardeman.nu>,
 Shawn Lin <shawn.lin@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>,
 linux-wireless@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_rtw-next_v3_0/2=5D_wifi=3A_rtw88?=
 =?US-ASCII?Q?=3A_reduce_RTL8822CS_SDIO_request_overhead?=
In-Reply-To: <20261116205739.462458-2-leonard@lausen.nl>
References: <20261116205739.462458-2-leonard@lausen.nl>
Message-ID: <0867C5E9-DDCC-448A-A22A-9AEEFE009358@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

Hi Leonard,

On November 16, 2026 9:57:36 PM GMT+01:00, Leonard Lausen
<leonard@lausen.nl> wrote:
>Reduce RTL8822CS SDIO request overhead by filtering hardware-handled
>control frames and combining adjacent TX-capacity reads.
>
>Changes in v3:
>- Include monitor-filter correction in patch 1 as suggested by Luka Gejak.
>- Cache the current FIF_CONTROL request even when changed_flags omits it.
>- Use a shared filter writer in every chip initializer and both
>  beamforming paths, preserving the monitor override and normal default.
>- Keep the TX-capacity read optimization unchanged from v2.
>

Thanks for v3. It looks good to me, so for the series,

Reviewed-by: Luka Gejak <luka.gejak@linux.dev>

Best regards,
Luka Gejak
