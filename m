Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793169426;
	b=Go3D8p2tjnidmPE7m+4hPhWauDzbq2iurTYfbvCWjmXs7N0n+os0+3ZibKM7fqpqkjvg
	 q7ClULAuXC/7S68/jX5CIC4zbdg5t4f9vYA8Ipfi1T1iGRbTZPz5KbhL0vjVRrCiZJx4B
	 y1L230DFz1Kdx3Dr4Y6XjTcqrjR0bUzZkBiZR0sOwZuCQoW5t4xQWP/DCqQEd8QUpAtUd
	 s+wiRuDaMDIWZ6THUJxlOe2HbXHtT/QZrHZ7Yrks8yUHhzPJC7WWW8xLJ7E/W8NfmE0UM
	 eH5/qUmde2aJnsi1c4vTZJgkatNX0WFFTpX4jnFlierbQgf/eIb4DfuI7YC40gVTwfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793169426;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:X-DetectorID-Processed:
	 Content-Type;
	bh=F6vVG15WdmBao/p50FYImwYFoqMRWsQ1u1XxQjUWc3Q=;
	b=uAitTKG2UFgE/Sb97c+1qAu/lwZ0mP13M5plgJzZgUwtMgTrCg6ulMJ6NnqwgJV+BiGA
	 gUqQstdnngn8Beou/4zNQ3W8DltIXWe0E3eqsyeX/2sNAaaNzS+2hT54nvmOpRjkp/BLt
	 k5pfAL+fgu0SpPeJAQSVcuha8kYQoO15IhA0G5V0OmaCc2P5eAcoksuIxLFcEAgV3+kIC
	 Td7goSJsb2li6v3RaLwnfDGaclqgbEHuBcpWNpCxJfL7FK+Pe/svPCrGK8GM8+aQa2ZOl
	 dTQ+1E7WRVvw9FDtPVJnnGRJn5UcRsLegFcDMVinew4b0nw8HxmOZjFCP2FFAJ1t6mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Ti54BAVg;
	arc=none smtp.remote-ip=209.85.216.97
Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11347606A323
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 06:37:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11347606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Ti54BAVg
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-3ace9e6e1a5so1056969a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 23:37:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793169425; x=1793774225;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=F6vVG15WdmBao/p50FYImwYFoqMRWsQ1u1XxQjUWc3Q=;
        b=qBgLInzV8Ax+d/lVJOH7ETvDc5VcvZUosr5CKwDK41xGouHhFJ5DPWzhn4TSPaKbZM
         SYClLjm9RKEAu3QY0R4X+wtuWa9xgOlw2C5ABZDLEYLqWNwWBiUHoRxAHxy7vOm5rCSj
         2yXXlNR9maH6k0J5xbCHMK+EGHtt2mvEseMiCbyQt+mzk9BzRhGZYvEOBOm7lLhHEbnj
         +xjf5JOoedKT8BDp6A0t8oVtS6jRNHa38ovAebrj6so2XsOnDJ36nlWUsPRUVcXTTNMb
         zMu4xbV40kW4VbWk8N0SMWcmMpaStSlBcw1Rl/V2t1iWpNQmkmFOHqEf8UbBvKCnTzpp
         PPkA==
X-Forwarded-Encrypted: i=1; AKwUvByk7Mkbo/W33fORRdL67R8up7czBqrTV1sQIEFTF4A4x/76dWAvlPiS/GoBWoQGxV7RN6q0sN4lsvL7Xms=@vger.kernel.org
X-Gm-Message-State: AFq9FYJzASG7s8tXN+aFt5SuKwonUd+PP3erwmMT/MVQm6pXIihiSn/d
	58uMLGqQqKl2Pgz7eM7g1OOPDTfDD2qXdLyeFShnbmwNG/u8AXWrlBdpDJH+zSCM+kksjzDN+m4
	u1oNyWmeOeeGlWzBfcB7Gr6Rqmzw8vGhFGUYAFcZmGxfiPGZh1IKaz6+0lzRUrgcN/CWaCWdNlo
	8DQscXF1nM10PgBVjF+TnlTlyKWOEOfs9DrM19tWj4sxgKyvajtJcEA1mIqwkv/47Kl81a14XE3
	2fJKm75GcZ1qo8Wzg==
X-Gm-Gg: AYBFou2GclCpX7yR4NdsmMEkyp/bvk2+6o+2sTtK7tFZasd7Y1QbByH1y5Iog7F8Kq/
	U0VQsvpQ1hONhYDfJVdNPrhMeZUv9Ie+IROpQ6DaDJXgGi+CHoPbXkE+WO9aK/XNRotipJGuJr3
	Rb2Djp/vcYEdsE6cQZVETS98TISI5BZfmAYsM/3pkvvXnEgQEpqsOuP3X1Y+HQvd8RawKWFtq00
	ZAjNvW4K0mLDhYNTD1yo3LQ4HwFa66XPJ4ulVUjOV0f9ETwTkPku7vw6ATS4aOVH3jZieZNHFXo
	vKtg75ydCzNHRcODtvtSQ0EEhzYRE+BM9ONToWB6HS12FB5Fa4EjvguZolbn9T4qsP7JSVllPsM
	ZJyCv5BFPrTcJ6Nlt1rXpTU5hgop+z6srSO7yMOEsINAPUy6bK+CeDb5sbQlwOnaE4ixoG8v+/o
	P9J+vOxIHMMw2y4XmRPuIWq5neqngj3C339g==
X-Received: by 2002:a17:90b:3e8b:b0:3ab:b39f:41ca with SMTP id 98e67ed59e1d1-3ae5c8a5379mr339693a91.31.1793169425158;
        Tue, 27 Oct 2026 23:37:05 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae5ab93669sm851648a91.3.2026.10.27.23.37.04
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Oct 2026 23:37:05 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8a08903566dso1315641b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 23:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793169423; x=1793774223; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F6vVG15WdmBao/p50FYImwYFoqMRWsQ1u1XxQjUWc3Q=;
        b=Ti54BAVg4HeJn7w5GI+/xlLCL4bKZiVVBkXmqVPkd7lIpR0+6VZOB/zJIlYT1MS3wj
         tlgH6vzlc0IemXJM7aM0O7h/vMYI9dDYxNjlW2WNTC1P1rJ7pzFHtR9A6hh+di/xLCer
         QuQBO5C79nSquPRNtfWRzkhwQQkkEiJ2Vsb0A=
X-Forwarded-Encrypted: i=1; AKwUvBwu+TdHJMTzqW33TQIHyAPDtCTm3l5OXMJtsOnlUTa2zC1hitTgneTlNgYIjOpb/NJw0KR7jUCHMkkxQX4=@vger.kernel.org
X-Received: by 2002:a05:6a00:2ea8:b0:8a0:2882:852c with SMTP id d2e1a72fcca58-8a5a61ebd1bmr2630266b3a.51.1793169423209;
        Tue, 27 Oct 2026 23:37:03 -0700 (PDT)
X-Received: by 2002:a05:6a00:2ea8:b0:8a0:2882:852c with SMTP id
 d2e1a72fcca58-8a5a61ebd1bmr2630256b3a.51.1793169422838; Tue, 27 Oct 2026
 23:37:02 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261025040523.678027-1-weiwan@google.com> <20261025040523.678027-2-weiwan@google.com>
In-Reply-To: <20261025040523.678027-2-weiwan@google.com>
From: Kiran Kella <kiran.kella@broadcom.com>
Date: Wed, 28 Oct 2026 12:06:23 +0530
X-Gm-Features: AclHuK-xiaLaTaJffCEzdjnvnAHPfm-GS44uQy8U-8XXD_ERkLiZ6X7YePgcL9w
Message-ID: <CAPHeo3e4aySBroVOr9WeScb=nc_NR8dmjc-mhmCYvVNOqQPV5Q@mail.gmail.com>
Subject: Re: [PATCH net 1/2] net: Make PSP skb extension survive packet scrubbing
To: Wei Wang <weiwan@google.com>
Cc: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>, Shuah Khan <shuah@kernel.org>, 
	Simon Horman <horms@kernel.org>, Jakub Sitnicki <jakub@cloudflare.com>, 
	Daniel Zahka <daniel.zahka@gmail.com>, Willem de Bruijn <willemb@google.com>, netdev@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	bpf@vger.kernel.org
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="00000000000082f5ea065ee0cae8"

--00000000000082f5ea065ee0cae8
Content-Type: text/plain; charset="UTF-8"

> +void skb_ext_scrub(struct sk_buff *skb)
> +{
> +       unsigned int id;
> +
> +       if (likely(!skb->active_extensions))
> +               return;
> +
> +       for (id = 0; id < SKB_EXT_NUM; id++) {
> +#if IS_ENABLED(CONFIG_INET_PSP)
> +               if (id == SKB_EXT_PSP)
> +                       continue;
> +#endif
> +               skb_ext_del(skb, id);
> +       }
> +}

Thanks for the fix.
We saw the same issue with skb extension reset when testing with
vxlans associated to a psp device.

> +EXPORT_SYMBOL(skb_ext_scrub);
>  #endif /* CONFIG_SKB_EXTENSIONS */
>
>  static void kfree_skb_napi_cache(struct sk_buff *skb)
> --
> 2.56.0.257.gf7497c7d27-goog
>
>

--00000000000082f5ea065ee0cae8
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
ksPFF8lRQaSHMJFFWI2usTUpS9gKxRAuJyHc0xlNKy4vK2ZEic8RWs34T6LcL98JR51RaKtE0Dw9
7F/uUf87z+/74aOyyxrTl58LlkxL/+1yMEHZhyn6z30LHQuA52TSp7uD3au8gu0YN+hKIsPBKVbs
dzf/bW6eDpGSwgwRzqF2BcDBOUA9U2mB2cxinBxOxCVbYRy//Q46OuAx0pXw8trIkPDdp8kHAoWD
7JxJ70nrdMy8VRmC02NQp185/6szeMFYLA0CAwEAAaOCAdwwggHYMA4GA1UdDwEB/wQEAwIFoDAM
BgNVHRMBAf8EAjAAMIGTBggrBgEFBQcBAQSBhjCBgzBGBggrBgEFBQcwAoY6aHR0cDovL3NlY3Vy
ZS5nbG9iYWxzaWduLmNvbS9jYWNlcnQvZ3NnY2NyNnNtaW1lY2EyMDIzLmNydDA5BggrBgEFBQcw
AYYtaHR0cDovL29jc3AuZ2xvYmFsc2lnbi5jb20vZ3NnY2NyNnNtaW1lY2EyMDIzMGUGA1UdIARe
MFwwCQYHZ4EMAQUDAzALBgkrBgEEAaAyASgwQgYKKwYBBAGgMgoDAjA0MDIGCCsGAQUFBwIBFiZo
dHRwczovL3d3dy5nbG9iYWxzaWduLmNvbS9yZXBvc2l0b3J5LzBBBgNVHR8EOjA4MDagNKAyhjBo
dHRwOi8vY3JsLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjZzbWltZWNhMjAyMy5jcmwwIwYDVR0RBBww
GoEYa2lyYW4ua2VsbGFAYnJvYWRjb20uY29tMBMGA1UdJQQMMAoGCCsGAQUFBwMEMB8GA1UdIwQY
MBaAFAApNp5ceroPry1QLdugI4UYsKCSMB0GA1UdDgQWBBS/iTArBeV9hFyyktvkwzGbaKne3zAN
BgkqhkiG9w0BAQsFAAOCAgEAdavxLwcm6Kj3S7/bA/IO6B6MTHIndKyB630T3CTPeOeuHV7ZS4wr
rDZbrSjERD36308lnaXSESlcu8LX2SKJ0KqNM3VQNTawSKS4wMXlyTzOBfaslsjtFiT4jQW9Py6u
6nf1EVoQ6YTCGJ+htyKqFgIljJIdBBOvXY+gECh/DC+VbLUVK9CgZLKkFJ5udhYvw1tOc3zOXGOd
kwaK7AtwRSLgNt5RSAaikL6bvU1kUWgITNKKhBK5F3CNUbR0hD/i7yG6Afdh27V1T7FEdV07fBbu
3+AVnAdbZmHfnB2T8lHTaR9GbgkF6lG/a8I+eUG5NPrDEM+afXT7/+zOTjf799qoyhMdfgp90DEW
9ukfyqfUq37ctBG4TdnDlxtkwy9XYw0Avotf2lrYy+6MYjt3cZFF+AF/F6ANk+Gx9zH5gyeUlruJ
+aqmP1U1lX/n2YEXAfiLJulbb3Jfi8lvyYzHXpHLIFtLfyVOzUXdGdj3dVxxFSPJ4uXmpk2SLExM
W7+cvJ+PxSJyWK723U609whQmqbVRz5B49CjNt/exjWtBGGjCwLPMGNWbHbwtDVWcoZzE0KoL7EK
VPB0t6uom5ElZ+qieZghO80tR/MW2eL8i+EiVMwq5GF1Ni3D6uypwZYqgdicI0YGj7JCgrIzr1kC
xwtQkw5ij2CCUWXxadt/C9gxggJXMIICUwIBATBiMFIxCzAJBgNVBAYTAkJFMRkwFwYDVQQKExBH
bG9iYWxTaWduIG52LXNhMSgwJgYDVQQDEx9HbG9iYWxTaWduIEdDQyBSNiBTTUlNRSBDQSAyMDIz
AgxbhXTUwXZ3dIWSpigwDQYJYIZIAWUDBAIBBQCggccwLwYJKoZIhvcNAQkEMSIEIA9Oc71jdteu
Q7Ubx187XkZx1ZNJDDpO0N0E6LFZsz7ZMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZI
hvcNAQkFMQ8XDTI2MTAyODA2MzcwM1owXAYJKoZIhvcNAQkPMU8wTTALBglghkgBZQMEASowCwYJ
YIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQcwCwYJYIZIAWUD
BAIBMA0GCSqGSIb3DQEBAQUABIIBAMDMtL6KInmrnKkQe7mvzgNdLrVIAEcXL2YSXiMEsXeE720k
pWossB2D7FT4J3bYYsKUKJUMllJP6eL1N8fsdxtuMSNita0TpyEMD0wd108JQiqOjNc5KgXhIkG5
oF55YHw6OtwhYPbcL8RHgTfCUoPkR0KKdUz5MxyzY2Phx6gU4etlfaurCQmXbGBxmJPR8TNvCK8e
LsaEStPyKJPz1cnUW5hNi5ZS0648RiZU70o0HzTU4m1PHa5qi+2mdga5f0NMH6d71/P0bwt91c/J
on8GtbKo/IpLomU3lcEHdN0CxmpHA3t1/oJ7QVB/GEVt/ymHXtf060/grL9Tveua01E=
--00000000000082f5ea065ee0cae8--
