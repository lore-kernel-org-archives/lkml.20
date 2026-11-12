Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794515818;
	b=Frzy5yyH8G8DhbnhsQFr1CXtl/yLEIY2ff7s369Ma+I9wbeDPTQc0/2WNNRq18OdVE40
	 a9FGA1mddWT3LnGQk8JEkLOkinYp60TCrg2Y19LuMwDpAu8Inf5SZG6xh11ZRO6ReuK/6
	 Q81PCeRMjnKyldx2RSsfUNk6VaFoLMRzmkNVax9H+BDEZLbi20ocLPwLZ/ZyOVkc3YPiz
	 v5UHSr02sdPRMQrl8S9GQZZTnyNpFXq6CHdJmmCe40s/7LWd/4oi7oqmq59iZ30Lmf5hG
	 Q+kBh37nVdcmNg4mSECqHkLtlSKmXEHmOtc+nxuqNEf6gmQIJI06j5iyHqqbWXOqdUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794515818;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=jTWXcQAEVRNiJ37CZvBOzUnHBbdFQM+hm9VF7G9FXek=;
	b=JRumXilHquGI/Fcygl+qo+5SM0j4n0By5QW0TFpHWWXCC9aoHGmuAkLdDmraZHEeLwJW
	 w4QK/yGWqJ2otDp8Q3cXXR5y4lToxpPEE2BTUNDctxhfIlzw5EiIb2h9oAkD2PuX+Q5+C
	 wCy+IIZLIUfq7h5Kd+Oi/7ahJICKZLwNMmj4w/pkmScosCsJLLVsbbxz1vBsatC6MgUaZ
	 AM/+R0812lsjBNIhDUKFJ53R3CiBFh2rAdZjvQ986LaA/qIBndwjuvLVELu7T7jyxaq11
	 T6jrzqU0Ijs3TfVy2tThljbjntdFspg6sbWWc7pZL6S0EHmbh8cnF3OJET8jBbS/G/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=joUWLRfh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D37E4606A327
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 20:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=joUWLRfh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77D121F000CF
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 20:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794515818;
	bh=jTWXcQAEVRNiJ37CZvBOzUnHBbdFQM+hm9VF7G9FXek=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=joUWLRfh/F4X2DVorHfnYB/IDXtZrEVITyXQl1zPB0u5DmL02wbZtZioQQ5t44sUK
	 gSTkiDM8CBitNqoExoE6NnAWgB8qikoG3mMUmzrbLyr71MATULfiYhhvMJBHtP5WDB
	 oJe6XZ/SKMxGhi6bEVcqm/ckQGm+tZBQupPU8YzWkn74LF1FY4ctk5+tRUhC/q5NSc
	 zkn/noi+FvCdBXzThJJ+GIY2WW5PW4uygJUiFpQqetBJ8sLzOYImiXwGm5tiAoesDh
	 j0dfkgb1K8vdJFqsfgy02nxdNZrrWTBF9HUNVdV+ZYXMjCJmzn+Xt/up5SkrJIQ3Zk
	 /1qKS7pW7qDyg==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5c102ad8420so236454e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 12:36:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErF71AhvMjmNGC74f8GeJarWhPfDlhl48WlQLt8mI2Z51QC3QlWS6NGtHjFvgaZed/nk2TVWKF/JTUpDM0w=@vger.kernel.org
X-Gm-Message-State: APuU4Z9UgLWBi/y5S4eiRVxKM7EqvdoRwEof8lOxpAcX49zoC0ADCp0w
	xqp7BQIFGdGWxC928UwyzAya7YpO0TqNclpL/1x6t6nEXthqZfCOzSPEg7St3EQ4DMS7skkAjB5
	qbCzCfMFga9nOBVoqEgkWWXAV+Se5dMg=
X-Received: by 2002:a05:6512:401c:b0:5bf:b952:e57f with SMTP id
 2adb3069b0e04-5c170b68b50mr169690e87.59.1794515817248; Thu, 12 Nov 2026
 12:36:57 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112-rtl8365mb-dcb-ingress-v2-0-f8e6fbdf8c99@pengutronix.de> <20261112-rtl8365mb-dcb-ingress-v2-10-f8e6fbdf8c99@pengutronix.de>
In-Reply-To: <20261112-rtl8365mb-dcb-ingress-v2-10-f8e6fbdf8c99@pengutronix.de>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 12 Nov 2026 21:36:45 +0100
X-Gmail-Original-Message-ID: <CAD++jLnuUdZeGz=rZyPayJEC2EK-RsKm7obecA7Jy0SETSD5jw@mail.gmail.com>
X-Gm-Features: AclHuK-6O1MZON6TJKg3hL1WcNrsf_X-QgpBux5gGIeVOIdYXCWrRn5tPX8QLAg
Message-ID: <CAD++jLnuUdZeGz=rZyPayJEC2EK-RsKm7obecA7Jy0SETSD5jw@mail.gmail.com>
Subject: Re: [PATCH net-next v2 10/10] net: dsa: realtek: rtl8365mb: report
 the DCB DSCP-to-priority map
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Luiz Angelo Daros de Luca <luizluca@gmail.com>, =?UTF-8?Q?Alvin_=C5=A0ipraga?= <alvin.sipraga@analog.com>, 
	Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 9:38=E2=80=AFAM Oleksij Rempel <o.rempel@pengutroni=
x.de> wrote:

> Report the DSCP-to-priority map through dcbnl, so that "dcb app show"
> lists, on every port, the priority a DSCP value gets once the port
> trusts DSCP.
>
> The switch has one DSCP-to-priority table for all its ports, with
> exactly one priority per DSCP value. dcbnl, in contrast, configures DSCP
> priorities per port and allows several priorities for one DSCP value.
> DSA could mirror a change to every port (dscp_prio_mapping_is_global),
> but a request on one port would still change the classification of all
> ports. Keep the map read-only. The QoS baseline seeds it with the
> default mapping from ietf_dscp_to_ieee8021q_tt(). Requests to change a
> DSCP entry fail with -EOPNOTSUPP.
>
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> ---
> Q: The v1 review (Linus) suggested DSCP get, add and delete callbacks
> in the common code, and setting ds->dscp_prio_mapping_is_global when
> registering DSCP offload. Why are add, delete and the flag gone in v2?
> A: The DSCP get moved into the shared code as asked. Add and del were
> dropped because the table is chip-wide, as the commit message explains.
> Without add and del, nothing would use the flag, so it is not set.
>
> Changes in v2:
> - make the DSCP map read-only, as the table is shared by all ports of
>   the chip and per-port remapping would change every port
> - drop the DSCP add/del ops, whose delete path could leave the hardware
>   out of step with the remaining APP entries (sashiko)
> - do not set ds->dscp_prio_mapping_is_global; without DSCP add/del
>   nothing needs its global set/del path (sashiko)
> - retitled (was "offload DCB DSCP-to-priority")
> - move the DSCP get handling into rtl83xx-qos.c behind a new
>   qos_get_dscp_prio callback (Linus)
> - DSCP table seeding moved to the baseline patch
> - read the table entry through rtl8365mb_qos_regmap_read_field(), which
>   uses field_get() (Luiz)

Excellent revision here, all requests fulfilled from my PoV:
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
