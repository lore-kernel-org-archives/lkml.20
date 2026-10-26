Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793001530;
	b=EJ4WBAlNJq14Xk/eR/CpNKhhF6AjWRWR+TbVyExChez0Iw3WVbIHhd1ingnAU+eaUOyv
	 LoOnTeStApvxXUEE7tGrwpSSbxuwzxWhCQ2b9xxp0EvvJlIr9H8kXlo2W2Y1StucVbPKP
	 /kiNJKJxnRfyTMTJ+SO47R11Hlsz/3cHG8V4pZpLKAH4HNpooDwEUSMrn7VJqrd6TeS23
	 8HVuln07CZkrjtWceZ5lfKoX6huB7y1tieTmK2/8I4DQ5EQj6MSZvZ5QwNxp39Y5WWznE
	 tW5aS+O4jbg++tuvGGfgYTNX8W3yrufA/48W+8zGrPKKclULO/mRq/JnhshggllGGQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793001530;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:Content-Language:To:
	 Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Qy+l+P3/Ur6+HWnHNoQlQuqGZxsGTPMqagOFnx35yX4=;
	b=0MtGTuQ++znmw50Xz/KCEXoJZbmYPgEsIqVoNJHMxcqeyKS+n2gqJOaU8eezyIuZXRRW
	 RM5Zpwko2br2s4+ZAHPWkoDyTNySkFF0zAj1TUNXU2YPYQF+iiAxXxvF7ATTB5rv9utUR
	 5NpWozFjl36bVuErGJMXPV7sEuZ+PF5RceC22qDmzEdqe3PjKtvdkdj3e4ResUmcL6U3T
	 O6YjzYRBJhRuPuQl5LH31eT2jNK2+FHLathIna8Yh/aenaxzvL/scG3dsgBqtBgNHsfL4
	 mC+ceKO3scWKndR8WRjQw4Gzq8+uO4K4j2RXQjvxx6FI7QacRSYEwilW5vX0MRDz6RQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=blackwall.org;
	spf=none smtp.mailfrom=blackwall.org;
	dkim=pass header.d=blackwall.org header.i=@blackwall.org header.a=rsa-sha256 header.s=google header.b=JhBY4Kpu;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B682606A321
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 07:58:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B682606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=blackwall.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=blackwall.org header.i=@blackwall.org header.a=rsa-sha256 header.s=google header.b=JhBY4Kpu
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48dfaa3fa12so2624247f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 00:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall.org; s=google; t=1793001527; x=1793606327; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qy+l+P3/Ur6+HWnHNoQlQuqGZxsGTPMqagOFnx35yX4=;
        b=JhBY4KpuTb8AB7KiwzftXNeqirFzEIxFpxEZIiFZzWEFmfZSU94eBuSFZdmf9CZd8y
         uddB/AFRX3Q67r5jexNNnB9kII4vlxzT0b4z8ZJdlPu8y9XP/DV9nItnKNymMYIpfeio
         LlOeMmZyD0/JjjclK0290FZsTxObBB4+M7bKM9QLZHLCi/SMCzZ/bfoH2qKPZW+OY7va
         HVDqA4INsP6zaexrA1AupraSc0OjBvSmM28yXQxOvZAUUTenVeOWgbaD4pm5gbJo6ACA
         ll5pEg8Y/2GL1MzDv7RCmoKkhWP8yQh1vG4hxiYpg6XV4FGqbHnWb6QRSpTq2oLboQ9Q
         NekQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793001527; x=1793606327;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qy+l+P3/Ur6+HWnHNoQlQuqGZxsGTPMqagOFnx35yX4=;
        b=rNrFuVBXydFSJsvSWQLj58WW+VDdij6/LsPQiWsReGggAxPMBZmCtUX1s0T/cYkTsH
         jNJfBRPLSt8cXRZ2SLb3h4p6MaCtTxaIULNzzoR3omQPEZ78O0Zbbtib37uZ6dZ4Th8r
         PYF8N4gYndRqt3yEm1dU+jqZlaZNutIRH/RgVJwIcg6fRPF2YYqKYkHpi8GGFmkWW8Xl
         ug0L/ZMolsTwMGrjEIKrjZPlUj9SgkW312uULfJiWIifiPbJomgbtwe5dUmKk7XOTAI8
         7K0+0qD3zG9DqBTe0C5fJFnD2LtKCCbhLrNCTTtZqBproGhZviRDUBCIG/PnSkG7RXg4
         AHtw==
X-Forwarded-Encrypted: i=1; AKwUvBwV9DZLdgv9jTEZ7a7dgvB4iH832Moj5y1qxQGsQhPjGUTdGgNX9A7LKjQWNdSkV/yVszeovwawfVMcODw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLc4Hwj+ksAVxtGpm400czFCPWlO2Gj/OFvcbl0gM1I3npFrJY2
	A28wvXaicv+Q7yy9h1CmsNdjPAg6J50i19Mdh1GasD5o+Va0zLVlI8IwOsew2MMjq8M=
X-Gm-Gg: AYBFou1XjzlO/1rCThtzVRw1GFwuBipKQ5lqV3Cn6eHZuLA5CMm3Tf7i3pvo1J427YN
	966WcyRdxaXkMZcfWAup5/d+VJn+w0rxORs98wPO5ge7O3zL3aN0fxgQAZyRlhWaudTpnwLuY7z
	q6P8AJGoLKTy40bHxk0RjOOtd7VCjZYZTL2oxaGp3C9Wteey4GNSp4En7YCLnX3VLwfoaEadRjb
	7PUZxKrMHRQ4X+53LTCHYISG1trrchaEs3ku1YuQNLG3HvgnXfYtzGjnc4Lzk+ousO2Hsd0LdK1
	1SrKnSOPgGBfArHUrJA4/iD4vsHpNHhz2l4I4wfWd+0rELIL17OLNjb8WlFNZoTAlSjUTcqvM/Y
	VGcy+U+jIR53VuKWuFbPmeEncFeb6jpwzft5qLjlbzwJ7z34jQ/mYKQhlu8fk2yf+BsjuL+4QdD
	vLrNpaBSWAVSce5DbcxU5KMOYyMgA+eYT1Q8CkDBA7B37TnP34osalfB2K3c8/+8YHnHXU2DwKg
	udqlVz5iLH6UBY8C6LzdyOPQcgxQIx23p9jVRgbGIm0DbpuQOtGWX8WD9dYwNlG1hOy72FGoiiG
	/XOKj6PqjLi6ygffBddmKD02QilYzws=
X-Received: by 2002:a05:6000:3102:b0:48e:1ceb:e8a4 with SMTP id ffacd0b85a97d-48e3ed32b8fmr12097363f8f.17.1793001527070;
        Mon, 26 Oct 2026 00:58:47 -0700 (PDT)
Received: from [192.168.0.161] (78-154-14-127.ip.btc-net.bg. [78.154.14.127])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecde7easm15095984f8f.52.2026.10.26.00.58.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 00:58:46 -0700 (PDT)
Message-ID: <af8e4351-d8ac-43c7-939f-810adf35c760@blackwall.org>
Date: Mon, 26 Oct 2026 09:58:45 +0200
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
Subject: Re: [PATCH net 1/2] vxlan: keep reserved_bits across changelink
Content-Language: en-US, bg
To: Hannes Laimer <h.laimer@proxmox.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Ido Schimmel <idosch@nvidia.com>,
 Petr Machata <petrm@nvidia.com>, David Ahern <dsahern@kernel.org>,
 Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20261023-b4-vxlan-changelink-gbp-v1-0-f0d13951c09b@proxmox.com>
 <20261023-b4-vxlan-changelink-gbp-v1-1-f0d13951c09b@proxmox.com>
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <20261023-b4-vxlan-changelink-gbp-v1-1-f0d13951c09b@proxmox.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23/10/2026 14:14, Hannes Laimer wrote:
> vxlan_nl2conf() derives reserved_bits from the extension attributes
> set in the netlink message if IFLA_VXLAN_RESERVED_BITS is absent. A
> changelink having it set is rejected, so this means that every
> changelink will reset all extension bits and reserve them again.
> vxlan_nl2flag() rejects setting a flag on an attribute that is
> create-only on changelink. So also setting an extension attribute will
> fail before it can un-reserve its fields.
> 
> The extension's header bits being reserved again then makes
> vxlan_rcv() drop frames that have them set in their header as invalid.
> The device still reports the extension as enabled, because only the
> reserved_bits are rebuilt and the flags are just copied.
> 
> A simple reproducer is
> 
>      ip link add vxgbp type vxlan id 1 dstport 4789 local 10.0.0.1 gbp
>      ip link set dev vxgbp type vxlan ageing 300
> 
> After setting the unrelated ageing, incoming packets with the GBP bit
> set in the header start getting dropped.
> 
> Keeping the reserved_bits on changelink is safe because anything a
> changelink accepts leaves the header bits enabled extensions use
> unchanged.
> 
> Ran into this when adding support for the GBP flag in ifupdown2, see
> link below. The device kept dropping packets after some time, it
> turned out it always started after a changelink.
> 
> Tested this by changing ageing by hand on a vxlan device that was
> created by ifupdown2 with the gbp flag, and checking the reserved bits
> using
> 
>      ip -d link show vxgbp | grep -o 'reserved_bits 0x[0-9a-f]*'
> 
> Without the fix I got 0xf7ffffff000000ff after the changelink, and
> with the fix it stayed 0x77000000000000ff. The following patch
> contains a selftest that fails without the fix and passes with it.
> 
> Fixes: e4f8647767cf ("vxlan: Track reserved bits explicitly as part of the configuration")
> Link: https://lore.proxmox.com/pve-devel/20260828134708.692354-1-h.laimer@proxmox.com/
> Signed-off-by: Hannes Laimer <h.laimer@proxmox.com>
> ---
>   drivers/net/vxlan/vxlan_core.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/vxlan/vxlan_core.c b/drivers/net/vxlan/vxlan_core.c
> index 278d41f58d89..223539099778 100644
> --- a/drivers/net/vxlan/vxlan_core.c
> +++ b/drivers/net/vxlan/vxlan_core.c
> @@ -4488,7 +4488,7 @@ static int vxlan_nl2conf(struct nlattr *tb[], struct nlattr *data[],
>   		}
>   
>   		conf->reserved_bits = reserved_bits;
> -	} else {
> +	} else if (!changelink) {
>   		/* For backwards compatibility, only allow reserved fields to be
>   		 * used by VXLAN extensions if explicitly requested.
>   		 */
> 

Reviewed-by: Nikolay Aleksandrov <razor@blackwall.org>

