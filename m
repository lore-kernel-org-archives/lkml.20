Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793001539;
	b=k/ED073eUxdYN32gvpM5K0kAQ4VruvewdBUeuKN2XpTVnneqxK6oKQW7cflMIohDKQhs
	 6cSF/txxuP98Wf7xbhSY5svOxMdriPeFvwPQ5ZTxs9dGYeLX5GnyZbGe9RMkbcjLofCPz
	 YVGae+mb+pkcVWf+VgyaCG5+Yc/i+qGA7PHXBLxNngiHs7ERNh6BIB1EvUgEO6r5uLqVb
	 3ykl/A0bEbnImhJuWX6BkiLu/U5Ihv28GaAJnX1hirwPo74PhbTazWU19w+y16uAhPdD/
	 W4mYun7sQTzwVFPIcZagwekFT6wpRVjTKWXy1OmEfblvQ0Oe8Glr7aMwLwqzKSdAfYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793001539;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:Content-Language:To:
	 Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=ENqpIp5OCMvGLbQfuRT56moz6XxyZs/DH9YB2R1VAX4=;
	b=1OV4Ubqu5mX/clri630733fRMLLUHTB6TY/y7P6zylQGALJXTsrhNFl3daQ4qi0djbC4
	 FiKzqnTB5/E4RCCiPlYLoVTultg20ABxIC1IPtJxNGutYde8jTU35ieBhEYl04wBQn91L
	 Urxl72kysL0J8SpqhdYEFI4JXOF8WAfF/GSn8XSuT6ZmjyK83jETgLSAA428o1pTM4em2
	 iHW5eIgpqqn8XMOQwDgdwtXR5HXE8nOC7IpP5Ml3Etkkx/sse+aSYexmRdK6Q1PLtwFVG
	 KsbvQvAQOZ+ttZ1jYUrReKbrwZQAXE5/XttQRSRngyoc4CrBPwR1c/6AuwsmBWrmJ4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=blackwall.org;
	spf=none smtp.mailfrom=blackwall.org;
	dkim=pass header.d=blackwall.org header.i=@blackwall.org header.a=rsa-sha256 header.s=google header.b=YIkiyv88;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0312A606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 07:58:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0312A606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=blackwall.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=blackwall.org header.i=@blackwall.org header.a=rsa-sha256 header.s=google header.b=YIkiyv88
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso2419595f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 00:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall.org; s=google; t=1793001537; x=1793606337; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ENqpIp5OCMvGLbQfuRT56moz6XxyZs/DH9YB2R1VAX4=;
        b=YIkiyv88wEEaX9fcSbw7nvWAWwnKoGCpr68rh8SmVrnPxrMcW6i9lXw/gEkPqfFhM2
         Bi1bYj966tUFjI83HwGRD0kb1x4mwoQUdBo0tYT/3xHhIy0pancQ9TR5VXrmUoow3B8W
         RlUhVzzYnLVHUS8XO7S7GNahgM08iD/hnciCfwkxkqAQBRcXVZfX7DvM1JNTgaCtnHir
         fChs2UF2cPdCpY/nM39VMhXhDrQs6MSQRqKmhyLFukXx/c+rGEU13D2cXlwk4+aRI8Xt
         0ElwE487d5xkJZg3S62lGaXygv/SZlDeZIhe3CosQ0+blDs69NwWZ4ywEHW1WjamGOxR
         A37g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793001537; x=1793606337;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ENqpIp5OCMvGLbQfuRT56moz6XxyZs/DH9YB2R1VAX4=;
        b=Z5a4eAS6zMVESsCtuvu/GB4PhJ8pFNjCwD4iRbfxSuGMYipQqxBvDSKNrBSJyJuxyo
         qzFaeTF4e0cQHcxYQAV0dsFA0B5eTj3ySYIfzg5QuFY11O6i30VA/lDldNrJThDaov6E
         SOXuVCC7CfdS4iAilrdNjX7RyoZ/wyrIyNAvYhz9CirTL3OgIS+CiIsCxm26CMcXxmRp
         o5qMK3fM4zyp66zTwEeaEWQzYebK3/X9y6f3KhkwJwPrrJ9XvlXGiuGeBm6GpmV3w8yK
         +0y2UQk7177JEdCWEKX4umaDATmnOmV2lL1oEt9DberhMxenY1/4LxGOugI41U1DWCeK
         J4Xw==
X-Forwarded-Encrypted: i=1; AKwUvBxlfEF7uwGgonm9FZ8s4Ov3MJKW6zaKO9f/5Kb0x38SuHCJSDKjy0XZ3xm3HLdgGGfnuVkmR8q4KKhOGC8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLB7XZRqMKHIWXlLU/7YTcYI8M4QlE+I5QA58D1snR0vA4QGFwJ
	jz/GqDD0isXMXLV3A0aoD13jAX9kTKEIshrPt3tiS77J+2HUvjXltrrgeZWJ8GynuQw=
X-Gm-Gg: AYBFou0r8isLM/Cd4V1CpgolSdmAwJNFk3fa4JnOyVVcWL44PoHl5psRy1FMR0n6OhV
	hgZ6syDZHAtb9MgOlonvk++WuFWhUxsPA26p+JwEyWFJlDC6zR7FeW59kcUwYmOiI6uV2b/3Mdp
	if0LtJkyTr1fYREAjg6wsV0kbmz7W9ZxgUQp9248g1BFlsaq0owlHNkT0MsM8PaQinfhMEZM6Xv
	2CYi66TzCLfEXo4imFWUxW6rpNMDH9rqkEemi3zXU7wA8exvJuLUyygpQPERqW6sf1WShJ6uRHJ
	RHgorA1cuomO7O3qmD7IvYq/lohAFVEnkexx2TUEir5pXK+CFVI7/MRS+TEcQ4tm+xOgptcBYrj
	l8rbIyFJKQ9v01dkvVduBK2Q6gJpGac9WFoRrUnSNM+lwUxTLkRPUL1YAT91r7iVB1v50wqUs3E
	ZlWw8lYjegxAjoThKlkNR2ut9XyDYnN12vjA6MfYZRaq6NG+4L3RBTVA67/qtBHjch70Ty/1V53
	TM8SrBY4RS3TEapFKTFX0Rm3mWIAg1ZMLtOPzGxHhHw+HRhRewhZBHp8oEpF6pm6+QQM0PSOxj4
	y7/4KPiDag==
X-Received: by 2002:a05:600d:c:b0:4a3:7344:13b5 with SMTP id 5b1f17b1804b1-4a373be2a9emr75329375e9.16.1793001537419;
        Mon, 26 Oct 2026 00:58:57 -0700 (PDT)
Received: from [192.168.0.161] (78-154-14-127.ip.btc-net.bg. [78.154.14.127])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a5697a7sm170954675e9.7.2026.10.26.00.58.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 00:58:56 -0700 (PDT)
Message-ID: <c561b8e2-40f3-48d4-8f2f-85b46163466b@blackwall.org>
Date: Mon, 26 Oct 2026 09:58:55 +0200
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
Subject: Re: [PATCH net 2/2] selftests: forwarding: vxlan_reserved: add gbp
 changelink test
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
 <20261023-b4-vxlan-changelink-gbp-v1-2-f0d13951c09b@proxmox.com>
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <20261023-b4-vxlan-changelink-gbp-v1-2-f0d13951c09b@proxmox.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23/10/2026 14:14, Hannes Laimer wrote:
> On a device created with gbp, run the reserved bit probes before and
> after an unrelated changelink. Check that what the device accepts has
> not changed.
> 
> Signed-off-by: Hannes Laimer <h.laimer@proxmox.com>
> ---
>   tools/testing/selftests/net/forwarding/vxlan_reserved.sh | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
> 
> diff --git a/tools/testing/selftests/net/forwarding/vxlan_reserved.sh b/tools/testing/selftests/net/forwarding/vxlan_reserved.sh
> index 709845123727..0ce264cc57f8 100755
> --- a/tools/testing/selftests/net/forwarding/vxlan_reserved.sh
> +++ b/tools/testing/selftests/net/forwarding/vxlan_reserved.sh
> @@ -40,6 +40,7 @@
>   	reserved_31_test
>   	reserved_56_test
>   	reserved_63_test
> +	gbp_changelink_test
>       "}
>   
>   NUM_NETIFS=4
> @@ -338,6 +339,20 @@ reserved_63_test()
>   	    reserved_test 63
>   }
>   
> +gbp_changelink_test_do()
> +{
> +	vxlan_device_add gbp
> +	__default_test_do 25 "gbp"
> +	ip link set dev vx1 type vxlan ageing 300
> +	__default_test_do 25 "gbp after changelink"
> +}
> +
> +gbp_changelink_test()
> +{
> +	in_defer_scope \
> +	    gbp_changelink_test_do
> +}
> +
>   trap cleanup EXIT
>   
>   setup_prepare
> 

Reviewed-by: Nikolay Aleksandrov <razor@blackwall.org>

