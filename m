Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793114865;
	b=3LfL330DcVz+ufeEvspRj6AlBpimRfVxGZwnCC+LeKbSbKFLnB5zNMmFtxeHe45AjzuH
	 yJVmJMKBvsYJ9xmlVKDMqv1MJEuCNPyfgFq31BBEwAJITORHY135R3aIM1XHsuXPm+LvQ
	 YTw4sS/XQBJkJwLB5fv2Gyan3/VEt8PYC0zUmaj/N8wuyBLIzTVW87u3yAcKXuv6fymeT
	 b7708cFnbG2q9uqiEuh1OJ8sLxQeV4xyPL3+peOhXjchaESu7sGdI8XyeY3fq8qad/nQk
	 W4CIqkA+f3eGLPR2wl+81vCKwk5BO7dHZwQnSrKwRYvFEGiijns5cqRnBnAqcbmrJQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793114865;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=uqwtnNOMKZ62ohb4pCxSL5wBGLnxx/MLeyk7MYe67bc=;
	b=S30cuFHxcgUDuMc6uqfQKWVPy7whQqD2oYo8mHHyGcmoxkCC7RoT3CNyb1gSYlKX3tFl
	 IKkM7LbGRKcFERJ5m68UK57yvl4K4ywugX5DO4NpBtmXw3hStqi8/q3MSJbRxmReccfD/
	 u4ARp8A4DVvMlIQyNrUMMzy/rmQiODTAUb+NpltO9AIg36i7vR3JKqPgvmup81W8ZStZ4
	 KvTzf/spKOfWyreR3ZqnX1ciXOI4bOJVM/3bzaBm+i3ZtsFynzBWbugs5lViK2evllxOX
	 0cPBgDjOFhlsszpT6VGBSLZE6wbprSAvKMynVQacSyDluhw0lIdz7vMPjzEJ9rI6kfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Zx1yak+H;
	arc=none smtp.remote-ip=209.85.219.49
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB7E7606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:27:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB7E7606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Zx1yak+H
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-91c75be77c4so56516d6.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 08:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793114864; x=1793719664; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uqwtnNOMKZ62ohb4pCxSL5wBGLnxx/MLeyk7MYe67bc=;
        b=Zx1yak+HP4vRh1a7K2NP1uGeEoVYSv5PWBRg8nmWiinXpO6HtYk19YC0TO2GKJUQpG
         AbHXCPy5c9GRnlxzBNGwoNDkjI8KfLr1z/1gO1G+XNPdZAw8/IG1XwI30jKNNg4ldjOy
         sh+rPdeZbxz03X42r07RMAnnLSDscRiB92jAOrtz1RZ00JROwLooZP3BvYRFfgusczZr
         n/Et6gNKJv8yxxssxKLyODZIDYq9IquF9P6ip0XYT9P33OlaM/utbO0z/HHvNmqt0iXa
         wJa8DegfBACV2xpO+Lnsn7vCgEhJ6k9a4/7Beoa+fbbcHKsihGspDNfqO112CHzj8A0v
         kZGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793114864; x=1793719664;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uqwtnNOMKZ62ohb4pCxSL5wBGLnxx/MLeyk7MYe67bc=;
        b=O8QtIKzoKA/ht1v9S6XUiPHV3+oSnFi5VhfHxbu5Q6DNg5K5p5nIpoTqppG0PR20fZ
         WewhuBpoaNFBkRJ+BQlzBEbDjEEm/ZEJj4OBS+VXOOKRZc+WdUJzrnL5OUToYqKqytWn
         jsWAz24Ff96fGx2xtJ7U0XO0hgaU3JMM9XOz765fLN8m0IShJDKLqkeJM6ZWs6QM3+Gk
         +TEh+KXoql6wWtnP1FxmpTg3/8TdRsZNg6Pa3qLkXlann6PaeFRs4MPrPY0JGpBEp3qN
         qHnToCW1euIDkQ7yzp8DM588SeRLDmmWtoEQwDS5IebIhZvcCAqp3WWjhTdGWEsna3TF
         3QBg==
X-Forwarded-Encrypted: i=1; AKwUvBzqbAvJdD6UZIURxTM9FEnkGj6fiVY9wh6vLIFPJpy0qi8B8OBDvdchRRYTkGPofV00e62IRg8GrqoaIh8=@vger.kernel.org
X-Gm-Message-State: AFq9FYImtig/iEjzaClkq/GEqt43atLSANyoT5eK3QUD8K3mlcKXzNOQ
	NEKwto0aextAiS91moJjf5IDR51UnG6UfjVziTeSLBIddVf05fLw2nrPtmdIuQ==
X-Gm-Gg: AYBFou08adVbhbaAkWDDK4oPExUMStR2dishi13YmEfbZPmx4F8K6+EIR2W1AJHgSnz
	7I2IDQ/1Hi0qwIomGHQHmO2MNa2uHBnB3x1ln857OkRvj6xSj8Bh3igppBYZlFILW/27pbRJlW5
	qdSLEHNzltIKyWRZrGIChU/3dmVT9FQGJkYLrzKrjW5kmQS2af3z37B34O7fsBfNBzJbVMepIft
	vf5c4h2lq9p2Y8qBQbruSi+9eLPbtwUM/ynOtPaPoqDROj21anO9D5owhcvo78hjPrXArze6YwG
	3zun8JJrjRmoVsnldWCRu5cD0IXnBTTeD9LMsp70HSSXTZgHmc6wvA/Mlu+/aNVUcC3qe6z9ltJ
	+4vbdoldflXxi7T5il0Ifdm7pWPtx/uNUxCZoUdL+3w6g8sUygsNUEIkjW+9ANUtAfs0sEyGshN
	Ub7wdROVWH9K2y8DIhiLqz/zCz+UJUDl9SXYmwdzAkyBX9GObJpMhdLvI2ueoEyCD3P1+7ss/oF
	O45lSVIFroOUtFjtSE07fO9XxU5UG2J/3l4dAIdY70=
X-Received: by 2002:a05:6214:5093:b0:91c:7673:a417 with SMTP id 6a1803df08f44-91c7673a830mr20960306d6.50.1793114863756;
        Tue, 27 Oct 2026 08:27:43 -0700 (PDT)
Received: from localhost ([2620:10d:c091:500::4:1ee2])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c6e20ba4fsm27571496d6.14.2026.10.27.08.27.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 08:27:43 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 27 Oct 2026 11:27:42 -0400
Message-Id: <DMFQ63T8HLVV.3L1SY71TO7GHU@gmail.com>
Cc: <netdev@vger.kernel.org>, <borisp@nvidia.com>, <saeedm@nvidia.com>,
 <leon@kernel.org>, <tariqt@nvidia.com>, <mbloch@nvidia.com>,
 <andrew+netdev@lunn.ch>, <davem@davemloft.net>, <edumazet@kernel.org>,
 <kuba@kernel.org>, <pabeni@redhat.com>, <daniel.zahka@gmail.com>,
 <willemdebruijn.kernel@gmail.com>, <horms@kernel.org>, <shuah@kernel.org>,
 <cratiu@nvidia.com>, <raeds@nvidia.com>, <rrameshbabu@nvidia.com>,
 <linux-rdma@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, <bjorn@kernel.org>,
 <dtatulea@nvidia.com>
Subject: Re: [PATCH net v3 2/4] psp: support ipv6 extension headers in
 psp_dev_rcv() decap
From: "Daniel Zahka" <daniel.zahka@gmail.com>
To: "Todd Bert Freed" <toddfreed@meta.com>, <netdev-bot+sashiko@kernel.org>
X-Mailer: aerc 0.21.0-threadmapfix
References: <20261023234640.1459291-3-toddfreed@meta.com>
 <179288570143.3134.8925369868949382653@kernel.org>
 <CADh2yMyYS-PWP4912En9D6B9up6Kz-hnCthNkWot+e7N8-q7ZA@mail.gmail.com>
In-Reply-To: <CADh2yMyYS-PWP4912En9D6B9up6Kz-hnCthNkWot+e7N8-q7ZA@mail.gmail.com>

On Mon Oct 26, 2026 at 6:05 PM EDT, Todd Bert Freed wrote:
>> [Severity: High]
>>
>> The PSP ICV doesn't cover the outer IPv6 header or its extension headers=
.
>> An on-path attacker could take a captured PSP packet, insert one of thes=
e
>> headers, and set saddr to an address they control. This assumes the
>> device authenticates such packets, which this patch's premise implies.
>>
>> Several of those handlers reply with an ICMPv6 error that quotes the
>> packet. With default sysctls, this happens for an unrecognized routing
>> header type (type 0, for example) with segments_left !=3D 0:
>>
>> Before this patch, all of these packets were dropped at the is_udp check=
.
>> Forwarding the decrypted skb itself looks blocked by
>> sk_validate_xmit_skb() ("unencrypted skb with no associated socket -
>> dropping"). That leaves the ICMP error path as the open channel.
>
> Agree with this finding.
>
> Ok, this puts me back in mind of the approach in v0 of this series ; just=
 drop
> packets with extension headers. Actual support for extension headers can =
be
> done separately from this fix.
>
> pw-bot: cr
>
> -Todd

Like Jakub points out, this equally could affect tls offload. We need to
be careful with any features that can result in device-decrypted data
being sent back onto the network. Another gap that exists currently is
xdp tx or redirect. That would also affect both PSP and TLS offload. I
think we should try and make these features work with crypto offload,
rather than building up more and more defensive checks.
