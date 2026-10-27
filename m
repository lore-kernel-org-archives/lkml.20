Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793144492;
	b=iHxyNBEn6Z6iy6r1UdmZECDSjWCYtrlkL/APhFyecyCo8L+4sk76PZmCjbwHz3utQ3jH
	 VXaKt1qWOXlNf2H/tMRAOp8Be78VViAVUA4qRlfFUjHl83MZkI3cZG0JzYokii4n+jWtc
	 iKvLjd7HvORcsnfiIB6BbIcq0XKpVfQ+akKgfBJDI8d7KyUx1z+5nHfrzjbJ8uKxFJhvS
	 34TTaewVaCUMrARKR8AjPWbMolKsqlmYcGJ2XySIItfd97oAYX5VNtrBQO36bU2Jc9KBr
	 vf3JxEbIXhBqUuU5PB5RSxPjvs3K3cBWH1NAfj3IqA3QllbJwdYvMLkKEoKaJu5UzTQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793144492;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=0I1FBZ956wGLn/X8olCE/kflFcHGoe1hSLvpL3SotdI=;
	b=JQiiBQjXM6Bqem/Rc3iRl0OkCKRAFmtfI2PgUzbjQj1ZZCWdvNFNvOtWctfPpO5teJ9b
	 ZPgdafPpVJVL9agFjYqCwuFv2tiiLpO2z7LC9PEfTgcj6keK4eTM5/Rx/6MuHj1VR+AnU
	 dSB6NsI2bdWn37I2xdbVQ6sfvcse0VwVlSOosUddzUFN06jI8HDPuyv37cU/4AKrUJoRJ
	 NfZRTgbe3O0Avxd6b+MIth7uWfThy5+GtTlExSIxpux5nweWxmpoBjXKLFuuqd84mcmP4
	 N9o3guEQ5R45briMNthYOK8I4sU/F2XodIiOuU6R73UgJCrY2qrT6qpPeI7OHDfoFhw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q7QASbKg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.44
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B40E606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 23:41:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B40E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q7QASbKg
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-6df5e315bd1so357826eaf.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 16:41:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793144491; cv=none;
        d=google.com; s=arc-20260327;
        b=D5pqx0ur5Pe/2UntESbpxHKLfJxGoz75f2gDLZu/EV9EE+O0FytlpABNpv7vIK3zi6
         zQT6ns7WrdYURaAiAL8IL2Y4ZSQSpXo/sMoh2GIcCnqHMrPZ6pHEgYHvo5YxG8z+DPWH
         c8+lypeHTRLd/jRR7XEVvwQdeTSM3YXZK6LNBWrO9OirkXEE+qhcS1VdzzT998BnuXDn
         B38O2afk+/stXldnNYQdavqsle35KFGDecs6loG/ht2D0y8FpofWdQfu4POfu4oai47W
         bdwJeNxOlB0ciTb2teafGsMoQcoSZbmlz+edxoERp2JVf8KHqPBXVyvj2Fpld0Cq6eA4
         YRkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=0I1FBZ956wGLn/X8olCE/kflFcHGoe1hSLvpL3SotdI=;
        fh=JllkhPsf9e6ukPbiTPsDPltMkt3qIE+Dhr/yyytuZbk=;
        b=gAtlwf3a92+lvJm985w7onqrM46QiW6XHjCDFYa8dqmLpmXwyYGstyRi+2eUCBLTBL
         bRdwggihK7XpEPXC3hvVEs6k6rnNtPuSo2TuCUAaT03EFV+QvtmhnfBTdIok1iAkD+nF
         eDXiYhCo+rxQO/3PwNfw/W6X2VGoG1BsahUK0TnCpjw92wv+LN6MMFOZzVVRxw562o0U
         Ekt6Eu2UNlMBtsVOYGQ5oZCGwS/50BZjNasF/xzITZ8L0hcDTz8DUNiRFNrbBYPxl8kd
         OGdsCc072/8LT19E48l0uSnsCHo/mGXdc+OjuxplJJjf8rn9zGLD5pcEmYch+dPnpDnb
         Ow7Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793144491; x=1793749291; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0I1FBZ956wGLn/X8olCE/kflFcHGoe1hSLvpL3SotdI=;
        b=Q7QASbKg2H6XxG9/YowWVGCNfGIQ8KZYkWMnuqExkdNFXLcCWVLT7rnfAyE2iQcVFV
         4LnF85d4oQp/1xY2FfTLvUUR4gnpBLnOFK0RLWybfVxT7Zv+VNCG4tm7Q4wtFliyQXui
         Qi15iO4kcWpA0q4O/HODfzkGz/d4YRZQlg2/lWgC+ZT0nwXRoGPWDQvk55tnmbhxEHoE
         LWmygWZVqDVaeqDpbyaB/x9LRbm0k+TXyPpXVx/m1KQrfoUo4Toyj6uWFAswyMZeubjx
         U8m0E/rillRqW5NSvLfTNZqNrl0fs5sWoIdcu4iN5C0ULpsSkJgR+up5cgMp0O+BrPPJ
         HizA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793144491; x=1793749291;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0I1FBZ956wGLn/X8olCE/kflFcHGoe1hSLvpL3SotdI=;
        b=yeyQkhZfE80NlAyrmOa7R53kInffoc0ZQk9vQZ/PANlV9YYkF9BT6KHEzf5BCmlPIK
         GidZnu36a2sTqWd/0STkuh+pX+lvmk/OrLjKyC9uaUj4MuF2Qw73+JUPwopjDpUYdFos
         vLctON5PDKDqYTIYeW5/Y6wXUA0F7LQflPN/Euo35DFT0p6AW9MM9UYinfubbfFd8HSX
         WD7mT1CQvR0hQWIdCDqWJd8MSBNthO3KLk8uqdK9DzpXwmlQ4hwfKU4gKl+kzvgf4Xcm
         STsuItXK/gO0/U312/eqv+DQ+zoA/MEG0kkFl4TZ0w4F6Ba3j9aa+MoOltGGTCySTIlh
         yXAA==
X-Forwarded-Encrypted: i=1; AKwUvBz6wg7NhMDymE3sS99+jic6Y2/eSaVNRtyCs2s8PHhcHYu8Xk1XlkvFpZPS9z6TnaCeJvWy9xQuRSwp4KU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJHs23ht6Vi0yjVqgjiW1PnqR8pRQnMz7f/jMJ8cTEb0i9rXCTk
	KRg04YAEiYmFHnevmxMNYdGj3mbVxkPSUvuAy06giwa3el/5VEHl57CvoYr/Sdrz14Wnr5CD7X3
	uEh9ObUCwVWC2FZiM7Wv8bUyfEMHKBVQ=
X-Gm-Gg: AYBFou147/yFKVl4QFTcWmHm8+NZ+gDQ8dkgzUqYvmKr9bRU8DLzkmuhnxF53oAMdmo
	92dsRkFcGztaIcuDgzA9076vqRQ3HmKYNIQMIkZVmHQs23bQILBY2GzafmvIs3VYwsT1zm/1cUC
	+/jNS92H2hbiv7Hh36fTWWU9u41EqeZXCvFC5F11k8Mo9laYxpt7vJWotKEse6nmbwvFFgWxjcu
	rclLMrBCqwx7Hk0XA5oDPyPJ+lMTBtnrv8ojjISXWDesZQGgRRUnxN1q4X5seHD6cgkI+4xld+z
	55hDXtY6AcIHHSKExyDPF1U2+1n1CqY/uerHszMVooYeZDHTphfGQpkB3gZRI50iF5N+RdhPkup
	QeB6ZWfosJ2TOoKOjYDdEzrk/bTwkKMkiL0YSEIWIP/kMmNeEhM8=
X-Received: by 2002:a05:6820:3416:10b0:70d:8086:e497 with SMTP id
 006d021491bc7-713f157287fmr289110eaf.38.1793144491336; Tue, 27 Oct 2026
 16:41:31 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021-b4-8139cp-napi-v1-1-c9b683d9564b@gmail.com> <179297317507.3134.14510456592684233796@kernel.org>
In-Reply-To: <179297317507.3134.14510456592684233796@kernel.org>
From: Colton Pawielski <colton.pawielski@gmail.com>
Date: Tue, 27 Oct 2026 18:41:19 -0500
X-Gm-Features: AclHuK9ZlS2Hzsq_FlWB3EDnNwqFet-LXqbCSo5sxsm-OM2xCGrDfP92Bwret24
Message-ID: <CAJpaz4bZ65aQtNDuxRR385GePEvdfWDszz3qufQWPp6+xh5wZQ@mail.gmail.com>
Subject: Re: [PATCH net] net: 8139cp: close race between NAPI completion and
 Rx unmask
To: netdev-bot+sashiko@kernel.org
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org, 
	kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, daniel@0x0f.com, geert@linux-m68k.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 26 Oct 2026 00:06:15 +0000, netdev-bot+sashiko@kernel.org wrote:
> Wouldn't this CPU then spin forever on a cp->lock it already holds? On
> SMP, one ARP request or ping from a peer on the link looks like enough to
> trigger it.

Yes, this is correct. napi_complete_done() flushes GRO into the
stack, and a reply sent from there re-enters cp_start_xmit() while
cp->lock is held. The LANDISK is UP, so it didn't surface in my testing.
I reproduced it in QEMU (x86_64, -smp 4), where v1 locks up shortly
after link up, and on a Raspberry Pi CM4 with an RTL8139C+ PCI card,
where lockdep complains within seconds. I should have tested it on
a wider variety of hardware configs, lesson learned.

v2 will leave cp_rx_poll() as it is and fix the race from the
cp_interrupt() side instead.

Daniel, Geert: thanks for testing. Since the fix is changing, I'll
drop your Tested-by tags from v2 and Cc you on it.

Thanks,
Colton

pw-bot: cr
