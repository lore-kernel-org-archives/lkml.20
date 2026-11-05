Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793898546;
	b=kIPGlmvV7zBsFY8aBOOnwNIIDQzTGUU4WbOzkSY4XC7ddX/z0LFQVJjv+mmBZjdShFlZ
	 /D7LDs01iTxwTMberokENcjoYCpXYoL2LXjYIeWfIZmofO0xVVMnkoZEZvgUHBbGkEIqg
	 4LHlyHY8ro3ms+ipisEqVXqum0U0jaetiYxIr9KP06Navr59usJ65vrwIOzyKaFPxyOGo
	 VnPrEdiNNpG7WVberRE8DY7xQpa+Wo0zaI8NJXuGmYyzuIcCTuJTFciC0BypOSOAqs9cF
	 WQrZT3BtTem6mi/InZ8gyNVcWfOGAmEmGbiSQjfFKTA20tUaKm7IFPN5/a5HKRE1MuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793898546;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=E6BV30veFVp7vAa8zjNCmhugAJtv5Cf8HFJzEFbMAY4=;
	b=wmIZChKaWDhpYt1cnx8FZ1GOLxEHArlxuClNM9kdA32rF2dyiZ21pwfLDykUZnQEpdtM
	 7qHMMTvnT0N8tOgq2zGN6CcQPx/skUny+z2LdDz4q9wB8x0W4HP31tPH2WHIeQMj9oWu8
	 pPPFfu+5bwVEkirfetOWkNx6v7FN9zR2z5hTTfxVT2ZLy9nWRZX2Okszn8mEUmdA14XK5
	 BE9t6q0PAlIa179S4Q3W0p8kfHiBkkM6SLrLR/GV/RFA2V8pbKBZ0YseFn2uCeu9yspGA
	 SwSGbPhInPN7p2bI2nSM+eJtP3HWvd7RP5TEtORm11ocmRuVOO445hsW3Dj3d4zy0vA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DvNZZl8D;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62571606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 17:09:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62571606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DvNZZl8D
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-36a0f27c9f4so3982849eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 09:09:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793898546; x=1794503346; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E6BV30veFVp7vAa8zjNCmhugAJtv5Cf8HFJzEFbMAY4=;
        b=DvNZZl8DHCM+t5QbEFLP8gJaxizCxoWDmQWhhJ0985oCei1Da1pacOVjUKDHORo/JC
         RTK8t5FgZTvNe65/3QVQRkC7D+Keowo/BjFxUfMLX3wHJEVyMbX7QU3eFyUYsE5hTEZw
         HuAgZ+hsgOz/Qtzwl2CJeRRM8I1EAN3owgyByAq5pv1U/R+vPbnxuCpKRH0WK+MXaPjx
         f8dcE7tkrP5DS/iyddaQwLxtoZ0HTzOZrquiAKhEcRzolib5NR0fGXM8XC2YOwv5NaDI
         aJl92R6UWmdGpAIRgV5Js3QSPvJjbq+neD8w4xw9f+rvRaCJZjONRXLFJKa2LwKNqJPA
         /9fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793898546; x=1794503346;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E6BV30veFVp7vAa8zjNCmhugAJtv5Cf8HFJzEFbMAY4=;
        b=X9dxpz5fUJYej5DIB7xbK3QZoSSOYZaezDOiXGY/nTx/AbU8lHW8Z8N6zLcG7EeusG
         GA4wfzR4O4Y9rs/coVAjrkPytuWkezhCrC6aaoUadrTxNsGQmGlI5eccKjFXgpYZDSQD
         6GjRHIa/NRlSIU37tealeP56RplrIrRQpUt4m7jBlnxlmhEPqQo1ZsTmzKgPY8ZGvoge
         rphm9dd8NT4DKD3rzah0Mj5oeF2XLNgVdESXH7DZbKOwpQklBfWlwqPptDiSjeFiwZ8u
         ZiZDERyBHe971oDn8CR+Y1xnZBse7xAmX1RRNGdtVSm7TCZKlmsCuA6T2WdVQAXIfaaa
         lT6Q==
X-Forwarded-Encrypted: i=1; AKwUvBx4YMzFTX/9s6g2eH4CbSsY0DYjvenZn7miD2m2HZO9fxLvsUzayuBVZ74Ac+IyudK6zR+BqhBmwvaLs8Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z8iYJjCgKX17frZTZxQHLfdGIsdtw6Mi2tuUF6lhThqfxJqjzT2
	Gp3PkX897x3xkHNu0NQ2kAUeyO135L0oLH0vNcZDZY0P+q31z6bkrKC6
X-Gm-Gg: AYBFou0Bh5d7fjGq0OOsUKrm0gi/lYWZNn3ukOKxpJT9m8ieDrNlCY5fuSZl5/EL3b7
	n5bgyeoUgg7R+lk4L7cFDMeqal2wxAV1NhxxJoKDQUrzwDt6g6ZgS+lvE2Mx6xshwfsxner5UVL
	IhbMzL3clJ5yTdunS7zZhjKjaz9R/PVszNZ9kThks1FCoJyDHDu3dK5wT6ocQiEW1GLaSMAS+Xn
	8uuh5QggVGq9/4jc2X0kDgFkJthwlqrRxzH/Qqe0QQoLywEdqg74Jhqssgm8Fo2RJbEG2qVO8pi
	uMmuTkvA6IX9EG2ap07bsMDUuZaUs9cvNmJrVbxivaq1gEQki9hoh16N9SCfrPcb7hFQeF66OeK
	FaR5nSxhbQcmute+ShR4rqh3ngQ4TsvM71yLGUz4rDGARk+xVHNgmq4Q22S68qHjBWauOhuieXq
	wPgnewo+cQipsrZvNU36EtchfHgqA+CsLv+sHTwsqZWjVIG7jOkhmQpNfyzgLylcIaQBG5Fc1lH
	8EcR8ggmqZI8z23bUSBkMQQIGpAGQ8OgSf45EWo60XAcXOybzYrsvMT8GiqHlPV0kxT7Ts+zo4L
	pEwS5KfFU7YjD1AUaysusmIf+MzCgnslVwr2qPoTQ0anJbwOz/fnV0vckD0RtzaJ4w==
X-Received: by 2002:a05:7301:4306:b0:369:44b3:99c0 with SMTP id 5a478bee46e88-36a42340c9bmr28415945eec.8.1793898545495;
        Thu, 05 Nov 2026 09:09:05 -0800 (PST)
Received: from ?IPV6:2620:10d:c085:21c8::1368? ([2620:10d:c090:400::5:f848])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca394f297sm20589091eec.21.2026.11.05.09.09.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 09:09:05 -0800 (PST)
Message-ID: <619a4027-0709-4b13-9367-866a06d2cd02@gmail.com>
Date: Thu, 5 Nov 2026 09:09:03 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 4/5] net: sparx5: Add hardware programming for
 the port policer
To: Daniel Machon <daniel.machon@microchip.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Steen Hegelund <Steen.Hegelund@microchip.com>, UNGLinuxDriver@microchip.com
Cc: robert.marko@sartura.hr, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261105-b4-lan966x-pci-fdma-sparx5-lan969x-port-policers-v3-0-b45a3a26bed5@microchip.com>
 <20261105-b4-lan966x-pci-fdma-sparx5-lan969x-port-policers-v3-4-b45a3a26bed5@microchip.com>
Content-Language: en-US
From: Mohsin Bashir <mohsin.bashr@gmail.com>
In-Reply-To: <20261105-b4-lan966x-pci-fdma-sparx5-lan969x-port-policers-v3-4-b45a3a26bed5@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



> +int sparx5_add_port_policer(struct sparx5_mall_entry *entry,
> +			    struct netlink_ext_ack *extack)
> +{
> +	struct flow_action_police *police = &entry->port_policer.police;
> +	struct sparx5_port *port = entry->port;
> +	struct sparx5 *sparx5 = port->sparx5;
> +	struct sparx5_policer pol = { 0 };
> +	int idx, err;
> +
> +	if (!entry->ingress) {
> +		NL_SET_ERR_MSG_MOD(extack,
> +				   "Policer is not supported on egress");
> +		return -EOPNOTSUPP;
> +	}
> +
> +	if (entry->port->tc.ingress_block_shared) {
> +		NL_SET_ERR_MSG_MOD(extack,
> +				   "Policer is not supported on shared ingress blocks");
> +		return -EOPNOTSUPP;
> +	}
> +
> +	if (police->exceed.act_id != FLOW_ACTION_DROP) {
> +		NL_SET_ERR_MSG_MOD(extack,
> +				   "Policer parameters are not supported");
> +		return -EOPNOTSUPP;
> +	}
> +
> +	if (police->notexceed.act_id != FLOW_ACTION_PIPE &&
> +	    police->notexceed.act_id != FLOW_ACTION_ACCEPT) {
> +		NL_SET_ERR_MSG_MOD(extack,
> +				   "Policer parameters are not supported");
> +		return -EOPNOTSUPP;
> +	}
> +
> +	if (police->peakrate_bytes_ps || police->avrate ||
> +	    police->overhead) {
> +		NL_SET_ERR_MSG_MOD(extack,
> +				   "Policer parameters are not supported");
> +		return -EOPNOTSUPP;
> +	}
> +
> +	if (police->rate_pkt_ps) {
> +		NL_SET_ERR_MSG_MOD(extack,
> +				   "Policer parameters are not supported");
> +		return -EOPNOTSUPP;
> +	}

Curious if we can have distinct messages for several unrelated checks 
sharing the extack "Policer parameters are not supported";

> +
> +	if (!police->rate_bytes_ps) {
> +		NL_SET_ERR_MSG_MOD(extack,
> +				   "Policer requires a rate");
> +		return -EOPNOTSUPP;
> +	}
> +
> +	if (police->burst > ANA_AC_POL_PORT_THRES_CFG_0_PORT_THRES0 *
> +			    SPX5_POLICER_BYTE_BURST_UNIT) {
> +		NL_SET_ERR_MSG_MOD(extack,
> +				   "Policer parameters are not supported");
> +		return -EOPNOTSUPP;
> +	}
> +
> +	if (police->rate_bytes_ps >
> +	    div_u64((u64)ANA_AC_POL_PORT_RATE_CFG_PORT_RATE *
> +		    SPX5_POLICER_RATE_UNIT, BITS_PER_BYTE)) {
> +		NL_SET_ERR_MSG_MOD(extack,
> +				   "Policer parameters are not supported");
> +		return -EOPNOTSUPP;
> +	}
> +
> +	idx = sparx5_alloc_port_policer_idx(port, entry->cookie);
> +	if (idx < 0) {
> +		NL_SET_ERR_MSG_MOD(extack,
> +				   "Only one port policer per port is supported");
> +		return idx;
> +	}
> +

Any reason why police->mtu isn't checked? In software, frames longer 
than the police MTU always take the exceed action. Is this intentionally 
skipped here?

> +	pol.type = SPX5_POL_PORT;
> +	pol.rate = police->rate_bytes_ps * BITS_PER_BYTE;
> +	pol.burst = police->burst;
> +	pol.idx = port->portno * SPX5_POLICERS_PER_PORT + idx;
> +
> +	sparx5_init_port_policer_stats(port, idx);
> +
> +	err = sparx5_policer_conf_set(sparx5, &pol);
> +	if (err)
> +		return err;
> +
> +	port->tc.port_policer[idx].policer = entry->cookie;
> +
> +	return 0;
> +}
> +

