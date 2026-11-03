Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793728675;
	b=lL6R7T4a5Axhuo5/GL624xliDAuTTa9CAAhXbHJyZLiCREMMHs6Lh2zPnrarqtFZCWAB
	 6o7keWLba+fV1F6WkJxVDm6w2nJgqEcEYqmv1azQNaHfRyo3SA9Er6bZi2jK6nzn+/8+S
	 MQLlhsh7L5mPeqcvMXiWHEluSlC7EH41aE6d5f5AB7k8BlGqdGQi8+8VTEABrUULszKmJ
	 Y7XOcxTPu0dVO9sfhMAd2qKIklmZQAjD/tldbGaVuGfmgvJyXfamLe8zyaDs1/x3kxG+d
	 mSyUshbZ3ZQJ0TN9VYEisETz0RRziuadpheBenRg2lLywr+3xArOw2MB0z87qUQEBUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793728675;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Content-Type:Mime-Version:Subject:
	 In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:
	 To:X-Mailer;
	bh=UfwhB7d+jFnDzhdQ9SOzdeKuF6qBwoZCWzda5GUg2nE=;
	b=oVxTh23l9qaaG04bxIHuzV7HvEE6qMt5UxZlgQJ4xHO3wJNkV+p0DdpXyyz+qEbjWGfk
	 N+lU9daLhBav+uiid5rZ1U1vFnGK6wT3zveGBGEBuR4GaDtVr/yTLTwtFVKObY+YJ84Wz
	 as1CkaxY/mTd2tgj4SKQbz29yZSGXbfQg37gy3ytX1dH9OOdj7NLOaC6BvYLZU7HlNwvD
	 rjIuyaRoGDeIDsXASrtSZcyWUMJB8uCONCrwAh4TTN/vb6T0N1F/8a+3Ox1oLOwc7Gqfl
	 v+n6YLP0IaKQOKDJXqde4aBd1oScuWnI3kqaTw1IlaMxup1hMNb5fm9/59Lt85WiFnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cjtWqbY6;
	arc=none smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E308606A32F
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 17:57:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E308606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cjtWqbY6
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b1b13e09ffso6121799a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 09:57:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793728674; x=1794333474; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:subject:mime-version:content-type:from:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UfwhB7d+jFnDzhdQ9SOzdeKuF6qBwoZCWzda5GUg2nE=;
        b=cjtWqbY65Y+iH0vqgkNLVug1GFzj3TX0gT7jH0epqHI9kDWRFlLHgr6kPgPQPmZru7
         QJQbLzcYLwYhQmz9a7Hg+QQtQXq3fdoOvmdePefUk5PxZs3Dg0GuzvKmpFWUTgSsde9m
         pbEjN+yejVAQz9/tRmJH67kU7Bx1Gd91QHYqTXCOge5KW/cBIEpSEhcJNWX7ndLSMTHF
         7/Nk+4SwtYAy29HKcAii25DzO7aduSeFGfsy+2XxUh6JdKwSSbqLqyzm4amhR6IQ3pze
         7Jj9uGJ7KM2m9sd5irxZvhNh7RgoLUzjjlCvyPRxJOhgYIBRLcVb7wCpxuulFlhq8Tug
         cwMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793728674; x=1794333474;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:subject:mime-version:content-type:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UfwhB7d+jFnDzhdQ9SOzdeKuF6qBwoZCWzda5GUg2nE=;
        b=HOKNoQOY4LFgzmZN6kMnzE5dbJ5AUclZSCB8dQwsR7vX48GdGotj+kcg/vYH2Mvcjr
         mQVtzsQtmxn7WxPj2UThxBRfhm5NY1JQ3t05tEWtEeLtbn1AeqpQpKpHLqkznqW92ohy
         rBG1NIBTmgHGVDKIZ2aavcFOHPvHiI7ejulUEFmQ1DfI7xan/xlOu+O1+ymHqfGgCZHv
         oVDQ/d8/Fp6ELmqCi+OT50ChdMVFz7vY0lGMOojkcKTTrpNfo2JPMlhoPxbgXGdPcw/4
         PsJHq9fDP+ujgcsrsCsLduNlbEU0aDoFbSdF4Nr9nx+jJj2TcPkKZXs7zRCHbPxEeCwi
         DE7g==
X-Forwarded-Encrypted: i=1; AKwUvBwBxscD4qEMRwwoigFmDAPIqlQkLeuU7H4j78FKzelDXqrx0WGGAOegjJwlEhjXkaO51V+9f3zESPyNUbs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+8/H3200keKDuBdFUlgM/ZHp4toXjDg+OM6OgNDKG35Z2SsLRI
	vne1woeXNGjMkRAsF02NcfK7IAymrPvcG/yf+ZamB4katWuvgKtTi3FH
X-Gm-Gg: AYBFou1dJN+4Bo4lPrtg+FLKILtQyimJ25MUbY85/r1rJgoIaDS9u7vTyrwvn0yUHAA
	A1pMzwvkz+PtwC6c3CVJgDq8VciFbU7Y7AcWkDgP2EH5zzfdWZCRGauA3R23KiIz4FvSB4enitW
	MCsiJ4qE+lGaS1VIcmPmmNvuXFWtA6VMAesXTS51WUykpsaLpznh5YHyOWHQQOYWvjBQojqteJk
	zvnb50b00EOULtIFizY+9lPoXlHD9jmY8bj23/PwMAmpnb+zQdwwkF/lSd/Qo4iDSrjS78une+P
	rvF4ARvEeW+tvu0Unwl6lBiq4SYsnE8K76mkwuIVqbhNFXyv4hui01PVA0s52MwHoFVGRaI+9Av
	/oPI5Kwwzv+Yc7Ki+m60oc96v2+sXfyoLzZMQmJBocTaGP+imY27Dzoge2wTYJ+kugOJxGDgvfH
	/vDhAaYOUFu/TVQnPpOEYYnwpqMWlEDCZKrbiayJeqnY36JH/WLZZpeaho5TgBF0+eToLmtl8w2
	DLTLrKL8Weg/qJeNtTMOK5a+cliKCXxeyI0Dj8oIK7e/2VpySsES9k3WBdPBjV0rWYeK4+CgaNR
	LvvnYy7kdi7ipxJkEgUcz7tpMgxbuiiqeK8iss5RbLfiBqr3cjYg+vUFDBEBe4y7umd8Sd5Dss4
	oObtvbm67nOHc5wj6USEEg2lEnxWKd+50vz6DbfJmJhf0lGQP
X-Received: by 2002:aa7:d888:0:b0:6b4:201f:17e3 with SMTP id 4fb4d7f45d1cf-6b4d46766ccmr6791930a12.16.1793728673607;
        Tue, 03 Nov 2026 09:57:53 -0800 (PST)
Received: from smtpclient.apple (ip-80-113-116-3.ip.prioritytelecom.net. [80.113.116.3])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4ec9eeb26sm4301629a12.9.2026.11.03.09.57.52
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Nov 2026 09:57:52 -0800 (PST)
From: mixalhs <mike.michalo@gmail.com>
X-Google-Original-From: mixalhs <Mike.michalo@gmail.com>
Content-Type: text/plain;
	charset=utf-8
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.700.51.1.1\))
Subject: Re: [PATCH 2/2] ksmbd: add AES-GMAC signing support
In-Reply-To: <20261103171742.18816-1-icb@fastmail.org>
Date: Tue, 3 Nov 2026 18:57:41 +0100
Cc: linkinjeon@kernel.org,
 senozhatsky@chromium.org,
 tom@talpey.com,
 chenxiaosong@chenxiaosong.com,
 ematsumiya@suse.de,
 linux-cifs@vger.kernel.org,
 linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <A37137ED-872A-4969-A1BD-C23E9B523EDD@gmail.com>
References: <20261103111453.84804-1-mike.michalo@gmail.com>
 <20261103111453.84804-3-mike.michalo@gmail.com>
 <20261103171742.18816-1-icb@fastmail.org>
To: Ian Bridges <icb@fastmail.org>
X-Mailer: Apple Mail (2.3864.700.51.1.1)

Hi Ian,
Thank you for the careful analysis and the reproducer.=20

You=E2=80=99re right: in the multichannel branch of smb2_sess_setup() =
the binding=20
request is never verified with Session.SigningKey, and with AES-GMAC t
hat turns the existing signing oracle into nonce reuse.
Namjae, please don=E2=80=99t apply this version. I was unaware of this.
I=E2=80=99ll send a v2 that first verifies binding requests with the =
session signing=20
key before they are processed or any response is signed with it, and=20
check whether legitimate binding can also reuse a nonce under=20
the session key.
Thanks,

Michalis

