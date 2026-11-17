Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.159
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794876341;
	b=u8Emp4O74INJz/+vRgZwbWlaY2v404PowjsOqj/3ft4yxWOnjafCSC33mjoIVZILhYlJ
	 qfnrr+hhiVZdetlTMmOhEclgB/AHUrmKQpuRZyh9r/TG2MymfPSmOJXVEoC4qsIvbG9bT
	 MLdxU3+CnC5dW6e3mhOIi5fROMhOZgHq0N2NcrjC5WR1Dszz2MGhpRnmHXFZAm9BRrfcp
	 L7iN+LTyS9IUO12cNCZH47Il4uRL3/8ycuPB5sHK6y9Qooqv3yO1jvW52mR9oetMzMHvB
	 yOnsvKLUeyR9u1xGIWNtnMU4VzeBbtJ2cSTqpkSAQwJTnFu4eUlIMGdDufHqaW+le/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794876341;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type:Content-Transfer-Encoding;
	bh=yoVmjNYaGAKUStl7neztOQN0Ep2lVscTrhxPcUuhlfU=;
	b=j52jdBB2MVIVZnwHAN3nuRO86reSkIpyE0LsMEureYAxY9pH2OyhicLIfjsBitNnMzMB
	 uYJpDw3WdL/cuKBtbD8SAl7f09FuRsza2LVP9iPgDtiJ2erUrgFNLEfgo/CuydFZqNksC
	 hpJVfl0VMphZAQ6jwLDEx1+7ELFY3fN5dq6A1I+PrYyxi3603vjMo6nsqrte7juDHEi9J
	 ZKxRnPqKutWMSWR1n4WXXdLfE/M087UM/2R/KUL5qBJWKz/hnHMt6V+dC3+mDIm7lXWlL
	 acRWGdmuFwZ5ewqw7GRki/RigpJx71AVoEEppW83/8IAcaQ6BYjrvqIrCON5/ndj28A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=flapping.org;
	spf=pass smtp.mailfrom=flapping.org;
	dkim=pass header.d=flapping.org header.i=@flapping.org header.a=rsa-sha256 header.s=fm2 header.b=TsLNq0Lo;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=Phvz6Dnl;
	arc=none smtp.remote-ip=103.168.172.159
Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23F62606A323
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 00:45:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23F62606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=flapping.org header.i=@flapping.org header.a=rsa-sha256 header.s=fm2 header.b=TsLNq0Lo;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=Phvz6Dnl
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.phl.internal (Postfix) with ESMTP id BDB7814000B5
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 19:45:39 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Mon, 16 Nov 2026 19:45:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1794876339;
	 x=1794962739; bh=yoVmjNYaGAKUStl7neztOQN0Ep2lVscTrhxPcUuhlfU=; b=
	TsLNq0LoX4UQg0NpUArkzXQlNSsxL/n/DjBBqbMG2SfKAT8b8zWkxMGgdhMxeBZ9
	wxMgn/Imme0HJvNDpF2j0vjz+ZIbNdjuppwjLOZ7nXY+o6X6dtvCz/yt07Rs4/5C
	Ywk1Lu5Qhw7voiy1XapfUuPw9lVZ5fXmigr7GYMZx+XGx5I+l6pFur2IB1h7ynND
	Z0p5FCO0pBoaV/Jk5RxGyi2SssHi9yT3pLzr5VtPHVoz0E8audOC4G+ThsjFzgyE
	6nFmR7YHzQ2xJOON79v0ch3Pl7sGkUWXuJNoMHEeIvtCjakACLCWGA605P8w0lXq
	kBejgaTWKUZpm3ODgXNGFA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1794876339; x=
	1794962739; bh=yoVmjNYaGAKUStl7neztOQN0Ep2lVscTrhxPcUuhlfU=; b=P
	hvz6DnlTNT4xwlj556S6/OXVAtFwvb4B+hwD9IRBv3ClqKlj9bkP3oFRjayD+2mZ
	HpHTGJSVSXHw1mtUbmUZDTtnQoKICaKJD8HDDM5nSuhDLbMT0Wrvfecgjt8lN+YM
	qLMtUxuSD9YxdZJRzO+eBnrmzxlm48iIknFvWYXlI1GP+nZc8Sln4hT2tOIote2a
	7B+yYdeGDAX8DQwy6TGQsZxuxc73JwheEY4PBTDRB+UJlGjWujPMAfXtAH3n42FG
	g+fp4Mg7QDa+acXIo+PCyTc0Hvc7m7V4MpV47r+F8uQVON/uk7HWnsZRXFMvcnmb
	C1wkv6gDTzfWESmlPcTrQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=flapping.org a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794876339; d=flapping.org;
	mf=PHRvbW9AZmxhcHBpbmcub3JnPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:CrFa9gpXEa2c5c2UpcOzJMX6d8FFINQ684RmEolbRQ4mhyP
	/r5oM5UGVrr52+O4jBzOKRysMTtuUE1ehWR13bcO9LkYp6+Hc06EdNiNgZZEgkIz
	+1lyVZjIubuig/jT3xX2EDe0JN/edqo6TLLBd81Ay9gacV0g89U6GScSe+L6dnh/
	0P605YOAynRjEEVB19UFYVCeEBg9wjLSIypU4NYtY9nedHU9lLAclxf2yfvZ8dT+
	9GMFdYWg2YwkdXmvyMs6Te4iloaLIbq61pN845/vGxSbGznol2WP8G/rqFT+BSkA
	TdkeEzEVNJ2fWi2Siu6duDMWgl5GwbKVQ4o1z+w==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:7za6rRETpovpKoK81OR4LXJBJIIOFqxRjHIFDeKgWuo=:l49fCnoDEnr1DQepJzhk82iFjB6bWpZ6iLNAqwE+8Ss=;
X-ME-Sender: <xms:sqP7akNoF_ROp--fKRzAPJNaEsUb0FVRkJFtncQEVmV4eE_u_ANqqw>
    <xme:sqP7apWA2oCYAhUTkV5Xy3u_BiFLKYsFiM9pnWOtcvA5buGODqZb4inZ__1_Pk05V
    1jjDxe-vPiVeDLRVHJVAbAh-wMfj_kBQJQt-dKvSrQxrJQBXoUG4Q>
X-ME-Received: <xmr:sqP7anRWVmctN-8o2J9bDTCJ4cwsOfeVqlFIz1173KLpKNgkRdBoo8uRfnA0wLB3jzG10fer6s7NKsDW6olpoOyW>
X-ME-Proxy-Cause: dmFkZTGpddrMU7DTWO1z0Z0br/CEgkbIJ+wswoDJLOHKcDXXjyf4X69Pe40ttRK9xz69Ui
    OtVoNeVbHBsW5Yof96cJKL5HFmafp8G5qN0putY9Wr1rxmdKLaPrxZM4rPYhOFHVTlnkpV
    kPiDuJrSDvom+0/HD20kP6B48wuykA5LSL+38rh7KjEOSYqi8bYb/bOzVSjnvMcdxtHAFW
    vsPKzmW0VBTiVHz7ytsRmcdEetrAXcMssxPwpZ23TLLMyQnWCe/RX088SSb7nrXWDAic6v
    FVlObIIAUIEP8fYsgUxcWcQP48XilhmsEOYmaZsl7c/Rsl69KcUDe7f2Cd08nxWZnZ0LGn
    03UchNTJFowDd8HX8eCCSknjoYaA2LUZ9O+/QDfMadzwcDkYE5e8+Mhhkk26qG/p5Zz0rX
    DlII/+75TbRKnsmy6WeU5nl/nIg4oZdcX2d3dUJaenCBpBDWSy/q6mEhc6W1K/zapFC0Px
    xnrM5mF4j/SpHRyowHG+6t6kQhltllqsuiTXlH8u5XipV/cpRF/hThkS0wfQtIEXRWkyVj
    MtXueI+EYrq/o6M9eWF920hniWht5QwgNyp8vOyJZvB9r8YdVy4T/E3OKEzP06J259VoQW
    DZolk+Qd2Cz2kDgJwR97dyGSBpnbU2GhodrGhsQ2lVLG3Tuw8jPELg+pqSmQ
X-ME-Proxy: <xmx:sqP7av2dupyxDfBRGPQy35A5Fms-2OMF5uNxUsDGXNH_UPcS7I0Njw>
    <xmx:s6P7aki0bHq8YVBeCLIieZ8NKYVG5z3j2QV72Kb2uv9Fygeyqum69A>
    <xmx:s6P7atYmsDbapO0YsZmo9kgnc9QJbWs4qoxVrV2K1q_xLuGPqekk6w>
    <xmx:s6P7atPa5mu5reVur2exjN0kDZjYYZEtRnvVZ6AvEKzazJYHbH7Eyg>
    <xmx:s6P7akEDAMElziy0fUfALS_u_vNLfmL95VOFvm4OL6hIsV_WredPDX3D>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 16 Nov 2026 19:45:34 -0500 (EST)
Date: Tue, 17 Nov 2026 09:45:31 +0900 (JST)
Message-Id: <20261117.094531.2139684707820199268.tomo@flapping.org>
To: dakr@kernel.org
Cc: boqun@kernel.org, gary@garyguo.net, aliceryhl@google.com,
 lyude@redhat.com, daniel.almeida@collabora.com, work@onurozkan.dev,
 ojeda@kernel.org, bjorn3_gh@protonmail.com, lossin@kernel.org,
 a.hindborg@kernel.org, tmgross@umich.edu, tamird@kernel.org,
 acourbot@nvidia.com, viro@zeniv.linux.org.uk, brauner@kernel.org,
 jack@suse.cz, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH v3 1/5] rust: task: add safe schedule_timeout() wrapper
From: FUJITA Tomonori <tomo@flapping.org>
In-Reply-To: <20261117001507.1611984-2-dakr@kernel.org>
References: <20261117001507.1611984-1-dakr@kernel.org>
	<20261117001507.1611984-2-dakr@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Tue, 17 Nov 2026 01:14:42 +0100
Danilo Krummrich <dakr@kernel.org> wrote:

> +pub fn schedule_timeout(timeout: Delta<Jiffy>) -> Delta<Jiffy> {
> +    let timeout = timeout.as_jiffies().max(0);

In earlier reviews of my patches, Gary asked me to use the function
syntax or clamp() for this instead of the method syntax [1][2]:

    let timeout = isize::max(timeout.as_jiffies(), 0);

[1] https://lore.kernel.org/rust-for-linux/DLMME4OBH3P8.3Q6UK95T2WGI@garyguo.net/
[2] https://lore.kernel.org/rust-for-linux/DLUDG2TH77RI.ZQ0T5MH7Q573@garyguo.net/
