Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.155
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793605399;
	b=nHL5T6NSn75mv3gVRFa3dRqbRqPLGpF0gIhOQlWgyNt1cVcKyRqe46HrwIXgLlM0sSa+
	 0oFENF4Ju3tx0j2y7GBle1Ojx27VHF09AGk65dZf8dEhw7OxA9aMrvYjTTFgYwjlpKVnS
	 oNS7HUqtwZzACKlUPF8guZ+ZhE6wiUqrKiQocX/bOf50uVl3twKwNsBfpyuJRCpQQfNKd
	 1ZIHyuCIl40VWQkjLZUIkfVu5PBBLjAdYBVRoqO6ief6QbheDMqdKcVZY66fkNgn/UK2/
	 SO5+rNjQM1ZQnIra3fLEeU9fCSa3pPS+r9C7OYmWMXExSnvRXnrUYGL4zYfY7JzQ1FQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793605399;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=QgY35lCDextIuOqdyvUKIub8TzuoGjnL8XiWfm5+rHc=;
	b=bFY0xBbe2/h1hTehhS+RLYB5iSXe37NOPg06w7yfkGRRSxTOe61qBbwU9Y/i3855Ia6p
	 2Nm2Zm6Q8DTT9H/1PyANVNsgwG9L/QAW44uV5zYBSEJIFaKWVCAFhnNV9hsI/OHkyKZZo
	 2kUH+8lQv077TDLMID17Af5HbpPJD9w/hd7bW0NHILgxzJPA6kphFMQGGpH4s0h8nNb+r
	 ZvrERoRvfQm9cyA+W3u4JGcWhSGsBgZuq30OUaphB+Z3bLrjOXCssZ+gqzRLmm1rWjB3d
	 /wTt86PfAgpyDRhp6kIbQx/VOZwu3+IBKWfsNK5HmBBLbAvPiGamFWdd3P70r3jrWcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=Km1JH2kd;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=KAeEirQO;
	arc=none smtp.remote-ip=103.168.172.155
Received: from fhigh-a4-smtp.messagingengine.com (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5AE8606A32E
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 07:43:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5AE8606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=Km1JH2kd;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=KAeEirQO
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.phl.internal (Postfix) with ESMTP id B665414000ED
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 02:43:17 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Mon, 02 Nov 2026 02:43:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1793605395;
	 x=1793691795; bh=QgY35lCDextIuOqdyvUKIub8TzuoGjnL8XiWfm5+rHc=; b=
	Km1JH2kdf1AcQkPVJ0VM/u17rOBM4CyZfRU3SzcNgW5YSNad+kN9ZOPJ0uCc2e40
	nTQVF5hJrifjeZv5OUq61Qx8HjHEAq4P79VnKz9HitfalzQuA3/tdWbbPNYUxNfS
	sgYTFRtmPTdqEHOw3YT86OqI5X0v49QRXR6u3yJULgCT2YCDwQUSo3EFvckhJ0+d
	vNS22CHo3yRKMkJTSPuCnCFCFsvkar5SgIkqvujfrqdyCQ7cuNwBmMj8GsKuaJE5
	h99YB6BKXjfmhoG595wL5EMT1hvtlCiFNw0EfzzgQebW3JQlNozCHLzj4DtS5Kcw
	vEMMDEdv209shP0qMD1t3g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1793605395; x=
	1793691795; bh=QgY35lCDextIuOqdyvUKIub8TzuoGjnL8XiWfm5+rHc=; b=K
	AeEirQOGdX3SIuzEi8APaIUeEcL4vvSyu5/OB15P6adPf6OEXkt/tM4Rn1FZaskt
	IBf5Pu+SMOGS9sB/qpV43+8mPb/W4/K8fnhPNqnwN9+WpLOaGbQz2Brf1hjeR9h1
	TVIEZba2Wnn084BNYTeyi/p5RVJjzE0ShsOc7w7nHX+UsssCy04fNzB65f9Lyyd7
	EPWhQ9Jum9Q3hJXbwDgb+qdiDDtylMnjhQtNgBn2fygMl3lYYo20BbQNORrTQeJi
	/PAwaD/h9YnaeLr52FfAmU7aL421tOzMgulUbUKOaRvHVeeN4GNmlGjDVF5eEeqE
	BL9I3Y4/k40c31+gfBN+w==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793605395; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:Gj7HrAmPYfo3Bq2vsmfi1R4OoMVP++RfDqlh9kHs5b1XndF
	byytW4fCBsNih8hhpNv6imm0uAO5Z/LfzwC+NmVUbnxkSvOUR/xl/ftzmYJeBeWt
	cUBinH3HTetfTxPDJ4YfIfJ5PjFuliVpTCHGy595nEkT8++o3/77G+Oi8lFBbYZC
	kwEQqJXHp2kIDQ3LoNz1WE1PugIbMdKRhNr0a33VMQ7DRavlry0FTlZmlC9VgND5
	Z2NmSHwcYIiJXgbx+qTUBwTY2oZPuQ7qLzI4FJzPeuC2fOGyGkpfSKEELDbBAlKa
	hvyzPtIwdZyjEktRram0WVplKiNwbnLLxuV6mJg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:b/eg0CCuyWl8DY+LJK04yNYm6762OMZrGpanS27HU7s=:pckl64r+/aVYcYuyeZtlv2yLkWqwPNk+1/Cyb2Vr7sA=;
X-ME-Sender: <xms:ET_oaooTI7BH73UWU0HqMoxX4iyQCtzL0zZ8uYrgecmIIVsgFctYoQ>
    <xme:ET_oapchRA0BJjMqkLdkicA5Vk3ibnNHZjws7KAtFd51-VrIpMINiYdC1eUEDXVtG
    iHTkmtTa__6A71WWfKQQRC-x9hUspvF2q3hBnX9rPFqB1sQHnLTTlX8>
X-ME-Proxy-Cause: dmFkZTGD9vgr5IMU7eICCRyAgmLzGB4HFU7Fn2yauga9h1UegFYGJfTnrhFHjyqAJE8aXW
    OQYG01uBYtKf3ccxWgMsTOEbnu+Ezj5VE86m/tcsJMyFVF6a5BnQR/dXzS3Scw5gJlZP22
    MlBO2QSCyWgphZbUPgJvD63IgUOKEGL9hV4Oi/U4oVv29homHOeYamyDkov2H1Du/0bHa7
    6Q34rx+VPzSUZsv9F2glSgM+pSeT4V83WNZNXtRdZudE1k9ItEYuPMKlty+ZRN5//gz7SH
    UeKE9ExNp8Dsk8fasiSlNS0/AU/fkd7V+PoCC/aiYw6VP7HwNkDJ5pe0oTwEpitPIXq0f4
    v5TDrF3L9IBRmNb+rAu4d/UcRt1IbIUYAyY7sskrf2If3iWyjX8hJ1xIyqh7ppYHGpuPhi
    RuuHGxm5DcNjsbqUX5U3NkOYQRkyab7UR1oT53AO/Nc88cS6owrXLZzzFAv6bliEWJTj97
    YOhuYMBdv7NeUE0JIqJm+6L7w0shHhDzeH/odMhtrlD97jhp4H9JpN/ok7y7oHup9rAWkF
    7q3As5cSW85HtIvYkmKRD9r3a83V1Td2oNE4lSpbkfnWLExZAd0ZzvaVx0wQ+6aXt7+2KU
    f504//njAll3ly7UebLj48HtFZepR9lBlIcOf8449HKbg//pKJdTBAJu3tOQ
X-ME-Proxy: <xmx:Ej_oauu4JIj0EnCtxcrja9WyVcYv_xpTmAfk5HkHZPvC8Ub336e7QQ>
    <xmx:Ej_oak8IC75TYR_ZWc7BMzoyJhO_Py52GVXoJhwQLa6VFGi4bJrZ6g>
    <xmx:Ej_oap1AEzQHrEKH2g_LmSEx5jsoAhyV_D6qJel6SuVat98fmRtWag>
    <xmx:Ej_oapDq9zKPaTxUUE2ScQlZW5nIXC9dZcgialCxxJCu1ta3V-ZRJg>
    <xmx:Ez_oajUt4qzm5oSFlYTWhNZfTwqEZOYNPR69V42EohVEFWrOWgG-wv4K>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 4699D32A0097; Mon,  2 Nov 2026 02:43:13 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-ThreadId: ABTlmHOvxHY3
Date: Mon, 02 Nov 2026 08:42:42 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "schuster.simon@siemens-energy.com" <schuster.simon@siemens-energy.com>
Cc: "Dinh Nguyen" <dinguyen@kernel.org>,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "Sasha Levin" <sashal@kernel.org>, linux-kernel@vger.kernel.org
Message-Id: <7b84c967-43f3-4aa5-827f-93303814d759@app.fastmail.com>
In-Reply-To: <20261102064830.slncwl4e7x5qhhrt@dev-vm-schuster>
References: 
 <20261030-nios2-remove-usage-of-libgcc-v1-0-4e341c66082e@siemens-energy.com>
 <802dd722-fab6-496c-a457-c1533ff96132@app.fastmail.com>
 <20261102064830.slncwl4e7x5qhhrt@dev-vm-schuster>
Subject: Re: [PATCH 0/3] lib: Add software mul/div helpers and use them from nios2
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, Nov 2, 2026, at 07:48, Simon Schuster wrote:
>
> thank you for your comments!
>
> On Fri, Oct 30, 2026 at 05:50:58PM +0100, Arnd Bergmann wrote:
>> Just a few minor things that stood out:
>> 
>> - I don't see a need to add the files under arch/ first and then
>>   move them to lib/, just start with the added files there
>
> This is an artifact of (1) not wanting to touch or drop Dinh's patch
> after picking it up and (2) being quite contend with someone with a
> current Altera affiliation doing the initial Sign-off on that check in,
> (even though this is, of course, not strictly required by license); if
> you don't mind to much, I'd prefer to leave it that way?

I think it would be ideal if you adapt Dinh's patch to just add
the files into lib/ instead of arch/nios2/: the Signoff is for
the content of the files regardless of the location.

If you still want to keep it as two patches, we can of course work
with that as well, it just makes the git history a little confusing.

      Arnd
