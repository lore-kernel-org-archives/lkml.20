Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793766651;
	b=cLz/2shhsqxOZtQXBtiN0gpNiPYtQWGtCArGufRBTGJytUwW5+sHFJpGhK8KsiMYvRxS
	 YFJEGuGkJYlXREGfClqOKAW5HOsDk2jUKzKoB9EJpQ1M0UFtFnm/7Z3obfXekHCMA3WiJ
	 M9SV0a+Q7NF9/6qSoxeYK2OZkhpHEn24GbfKpe+YzaHBwAk6SJDVwgHEdXVJY8bSimyC9
	 5HIsVGHEj06dwexRIKRakzxYsVPsG7IkvVoG9Wil5O5gkP0aNc8Q2a7zg1Yx/ZGSLcDJi
	 t0rMLW7w/ak2FKu5v7dDyBoLgFDasirR2acuAUR0W/kkfWm1sCFpmN7atE/lN1RNs8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793766651;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ZpNcQj24yuMM3GQtiTzILqkIccl+qas6VuLsoUlL4Ug=;
	b=2DHfmXeG7QRizVI9hDHPnUXMkuEA4IVde1l1DpJnte1aAca7A2I3fM1JEnWqtsC5+zD8
	 huXtcLpOs28ZpYTIY40POnZ1Vi0+1U8+SihuRD3eK8cIR9xTB3QIlweqeUKBA5rXPQAyM
	 rzNX7RMcHKJ2mbNBpU1B6lnOKzJj8VaQpC4FXXChI6ScRTcujTTZShcxDC2b9j+1NENfV
	 FIcPbNClvZ9HhWdG8eprrTcEvJzqSI6EU4bdjFY8cVcng5JUXqItoFCq1PbhfjLVcZso8
	 FkHwWVhtCHK72l5ez+yfoKw9Knowcq8wjMfWWBRqZo8Et0wXqYF7qwYqeYH8/u/kviQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S6eMCrzx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49B70606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 04:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S6eMCrzx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24F551F00A18
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 04:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793766651;
	bh=ZpNcQj24yuMM3GQtiTzILqkIccl+qas6VuLsoUlL4Ug=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=S6eMCrzxSqAOVgmsmosfiLt8SlqWRJYLyBn3xFly7Axbs+CcnPZ4suZp+uIys3Jgc
	 4PwgTbTlGU+uYOszuV8JP+quWKwBxKS0umYm/RwW51oNPRYy3PUiyHVWkOxVZxjgx4
	 iyfRVBNLA48avCLJMCo3K1GIR3vb4qV6CJQFbxTTr0vjQgzk8W7P81bBsbroB1LPs8
	 yBB7q/qVivwzcHqmmyFRbQkymuYXeNTeHnwepvXQh+s7v3pfcTjSLsX1p7wwCXwz46
	 CC8oUXW94stSS2g68YvdxCf9/IgebUmbDYhrb+JsOZwoZXblciB5A2GLh+57Fk5YtQ
	 PRfyBpOd6IrMg==
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b486e1d02eso251112a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 20:30:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvByyjmz8wy1HPJwdfO/Id4ioLz4D6CzSweYtDKmXTMHH2WtmwMH3mTiZcWf5FC2YRR/tH8PDos0WyOZsfiM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9sUtqF08zCAvBFyJlTUkkSjILpPCW5bqTYHwLLsaEP3gKgTYYl
	DRnq4xOWUV/VMjR08WPDFNENpt3bnJ/rTGBRRgrOpEoUlBz7z9KaxBh75YfQy2mnWCEizbzORS/
	DIBHnmfTu6eEFWou3QtRE7o14BY+iIYk=
X-Received: by 2002:a05:6402:a505:10b0:6aa:e46b:2ca with SMTP id
 4fb4d7f45d1cf-6b4d5537ae9mr7019046a12.30.1793766649804; Tue, 03 Nov 2026
 20:30:49 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103111453.84804-1-mike.michalo@gmail.com>
 <20261103111453.84804-3-mike.michalo@gmail.com> <20261103171742.18816-1-icb@fastmail.org>
 <A37137ED-872A-4969-A1BD-C23E9B523EDD@gmail.com>
In-Reply-To: <A37137ED-872A-4969-A1BD-C23E9B523EDD@gmail.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Wed, 4 Nov 2026 13:30:36 +0900
X-Gmail-Original-Message-ID: <CAKYAXd8ozh-WT+iSLspeZ_h2PM3xLSK4c22EsDD+53z7nbzieg@mail.gmail.com>
X-Gm-Features: AclHuK_UFq3A83cRJ7DhTEK66pNCvFNRdlhviHK4gv1kJtzRQYyXpFPlKH59ijQ
Message-ID: <CAKYAXd8ozh-WT+iSLspeZ_h2PM3xLSK4c22EsDD+53z7nbzieg@mail.gmail.com>
Subject: Re: [PATCH 2/2] ksmbd: add AES-GMAC signing support
To: mixalhs <mike.michalo@gmail.com>
Cc: Ian Bridges <icb@fastmail.org>, senozhatsky@chromium.org, tom@talpey.com, 
	chenxiaosong@chenxiaosong.com, ematsumiya@suse.de, linux-cifs@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 4, 2026 at 2:57=E2=80=AFAM mixalhs <mike.michalo@gmail.com> wro=
te:
>
> Hi Ian,
> Thank you for the careful analysis and the reproducer.
>
> You=E2=80=99re right: in the multichannel branch of smb2_sess_setup() the=
 binding
> request is never verified with Session.SigningKey, and with AES-GMAC t
> hat turns the existing signing oracle into nonce reuse.
> Namjae, please don=E2=80=99t apply this version. I was unaware of this.
> I=E2=80=99ll send a v2 that first verifies binding requests with the sess=
ion signing
> key before they are processed or any response is signed with it, and
> check whether legitimate binding can also reuse a nonce under
> the session key.
Okay, I will check v2 patches.
Thanks!
