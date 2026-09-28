Received: from mail-lr2-f34.google.com (mail-lr2-f34.google.com [74.125.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A75403D5C12
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 12:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790597914; cv=pass; b=p9RbEr8966zxqoDS9GbDkSgn51jIkO/zVTsXLQv/Fa1FgHmYeLWqaEFdTLopxjS8XEwRz3NMC7ayvBCoazBviO4g0nlhhxG16d2+fw3Lc3AKdyJT3uS9ih73LKYNKohCXX6ZOXeVD56jRTyb+Lin0DG39VlLAbAxoLD7SAXuwCc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790597914; c=relaxed/simple;
	bh=V6HjbSIA0+Y2ZwCyDnLN+EEAB1LmUxOqge9wnemkGrc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t9761+Pt/lKjUYDPSIZkmq2WmIGLUszg+8FhOVDkDQbm4G6evKLr1whyf/zIhRCnoh0WIfod+2LZdvL1bgNOXeaZE7rtu+zJE46ks2udC0DJsqy2wsoIebfv+Y5eec6V6M+4dhO0ILZ6ZeLxuI/kGStm0l2RclEQi6x2uyv2vso=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ggDTCvMc; arc=pass smtp.client-ip=74.125.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ggDTCvMc"
Received: by mail-lr2-f34.google.com with SMTP id 38308e7fff4ca-3a652b710a5so23678781fa.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 05:18:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790597907; cv=none;
        d=google.com; s=arc-20260327;
        b=AgR3M4CVMK5Ga/IscZnwktZCLS/TKVVDJf2NfAt137LgmR8hLIbRyKIKvqBYn0M3qA
         cAKDRU1sf7eMRa8LAFp05HSvuoldbeIn6dNsQSVAXrAakNxa+Z6oWL38hXysFBOpSiuL
         URMj1oRr1ESwWfJWI9/N36iJQ+ETvlFGgqTk77MiU+mEWPOMY2qpyBTcanLYTS0p8HKv
         I1dllNJ0ziyjFVmC5amC0Dl95tbkJmEbFwHMQsKbcMOIW2d6B0H4bbkcD/uOPeDzn2HU
         8kQ1of97Ty66b238bR5Xq6wT9PaWosISozERTfNAI990UeL3uVzPEZkhwQ5F4aM1/zf4
         9W4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=V6HjbSIA0+Y2ZwCyDnLN+EEAB1LmUxOqge9wnemkGrc=;
        fh=35Pe2hSL5voX6Zklllc3Yr8rmjId7ZG+bOZcFzQDkw8=;
        b=XD8KXz7aDe6M5sG9exrHt82KfoCk4WaEkMlQQdemSqFFC0JJbdYjS+zEfPX48uC86X
         0PFDgyBCL5BHlKffIrsHsZoV3weJaEtNPNHDWTiYaflBRzFHaXq/4Yu2PqGvVvgqd5lE
         aO7c40fcPghnuBJw5uoQLxR36CMIO67Uilfu4pCM4Frws/PwmG2oZ/UYTJpmK/bR7et4
         T6VArP8dXHI4PtyldJfpkDNjnGXcJB/Uafdk7h9jKYDSgnTlVqopuJmKTatS2HVeQAwi
         +d0Adc5Z1LOFEM4Fp5NKLqYfdMLVLW+BrrBCtiTEMvQncptadGmdy03blRlslPgMs/zU
         h3+A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790597907; x=1791202707; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V6HjbSIA0+Y2ZwCyDnLN+EEAB1LmUxOqge9wnemkGrc=;
        b=ggDTCvMc87teue6kRgDl/HJL1j2olytfImFBsoanEZjkyKpv6D+/vJSmVsyFunRY3F
         s0KclcbvSlL9kYWOXJsTIL44QmD9JH9hUSSau2gNe+t/qCFLLz9HFWeC5AHAX+/74viY
         tjFf5WaqQx0F5Bab07+aXXojP97hOSAUKojgjm9NU9U/Dis7+8nd0j55WrmqMmsV6YlL
         Ichv+aYxbd+E7EAJhiU0S1so5GsGby9p7GD7Pp5sdBGgnajjYvvN9oikQzkuPJb2UDpL
         Eg5NXbBWk0mkXr6eXC7a+3W3suzeI+zAo80K1E3g5SMrXWiXlQZO68/ENDjNC0sVPbij
         uvSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790597907; x=1791202707;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=V6HjbSIA0+Y2ZwCyDnLN+EEAB1LmUxOqge9wnemkGrc=;
        b=P4CQeb6j1vR6X51osR9AvUMrSEs5vw9UI8R95K8CL/B+RKD90vpmLdBXvTzGjQvlBq
         V3WCUJQyuehhlwzJBqxPnmqp/oTfVXarR5pagGZpWBKs7HNRXoXGw3+FI3tYoays5UEE
         vcxSKt7NbDcfcuvCry6NF67+hsh0jbZNSs4PQqztGk26aSs+CIrydatZJ0gwisFTv39B
         AJF9Q88pbhzyScxxXobfWRaluv9dh/5VDk3Q3K3N6BrdIBGVsY0P05PcctWZwZoRClOI
         ZSEfcXfr+0GUGxoAN8yNzEJ/t9IYvIWXZvuN+gePL3KFTwJxlhRnbPqS1SFpJEluZKoa
         yL0A==
X-Forwarded-Encrypted: i=1; AKwUvBxYVh1ENTwmiGENh4Ftr3zOnTK60IqNZAkG1Xg7JkII7LeraS93VD/5AtGTG9crhHzgWO1oBN3nrglfghQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIG9LuiBvxJXUAj9nJ1JNrExqKoM49EywWOlLT3H8GWKGZfPqCi
	xwSnungM3m8cNe2vT+W4txIA/vvx9ADDv4U2XW3Jv26PZGrvhwLOTiRr3azuztBzR43cptFC9Bm
	zsJfSMnrzeTTEKajU+jieliIB8jAzdew=
X-Gm-Gg: AYBFou3rgqm43hExHfEYSt5rkkcIy5c64wjFOiIDO20zGsVELBneyApj1onSTCBv6+V
	kols2Bl0CMXd9WI2jpS6CfhsDxJhyOBWxpl33B4kdi1sUoeQisE5cs45gsGc0iWQ1+D9tXhPIUi
	3By8qk5V/9m3MvEoZQhz0gR32I31XC9mEcad8etYxneFeyvk92ZF3w/4lGzJNbb9Sx6BFsdtSaT
	NGG1WE8vV7sSo+b9N7LfgK9VGaWXMwvEdJbnVf+5zvRWtnI8uWsMsitnlIGjKr1Wr5faRSi++Oo
	vn0mRGqsMHFsNiovwbMlDNFUGJhJTfHu5qzgAvmzzRarall6H5Zb5fktBZlKLrpY/+VH5eucR2k
	C8RrVv8eiQ2UA1zE5DzEHXNpeTwdwNcMpXwrTMBj/NQ==
X-Received: by 2002:a05:651c:509:b0:3a1:51e6:fe5c with SMTP id
 38308e7fff4ca-3a63de1882fmr28825211fa.13.1790597906996; Mon, 28 Sep 2026
 05:18:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260924011554.3494-1-sigefriedhyy@gmail.com>
In-Reply-To: <20260924011554.3494-1-sigefriedhyy@gmail.com>
From: Yuyang Huang <sigefriedhyy@gmail.com>
Date: Mon, 28 Sep 2026 21:18:20 +0900
X-Gm-Features: AclHuK_Bo0nUb_h1v37TnseownwCulJ_aL1hcoodmB-NEy2KT06jfSsRCrSTQ4U
Message-ID: <CA+7S2vKCxcQMA_7E3iHMm79v_mz=z-eERZHzTquo9-HJqZQiuA@mail.gmail.com>
Subject: Re: [PATCH net-next v7 0/5] rtnetlink: dump link-layer multicast addresses
To: Yuyang Huang <sigefriedhyy@gmail.com>
Cc: Aleksandr Loktionov <aleksandr.loktionov@intel.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, David Ahern <dsahern@kernel.org>, 
	Donald Hunter <donald.hunter@gmail.com>, Eric Dumazet <edumazet@google.com>, 
	Ido Schimmel <idosch@nvidia.com>, Jacob Keller <jacob.e.keller@intel.com>, 
	Jakub Kicinski <kuba@kernel.org>, Kuniyuki Iwashima <kuniyu@google.com>, 
	Nicolas Dichtel <nicolas.dichtel@6wind.com>, Nikolaos Gkarlis <nickgarlis@gmail.com>, 
	Paolo Abeni <pabeni@redhat.com>, Sabrina Dubroca <sd@queasysnail.net>, Shuah Khan <shuah@kernel.org>, 
	Simon Horman <horms@kernel.org>, Stanislav Fomichev <sdf.kernel@gmail.com>, 
	Willem de Bruijn <willemb@google.com>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Sashiko's comments for v7 arrived late:
https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260924011554.3494-1-sigefriedhyy%40gmail.com

I went through all of them. The only one I will take is the spec doc
wording in patch 4: the ifa-index filter and the zero header fields
are unconditional for AF_PACKET only, AF_INET and AF_INET6 apply them
with NETLINK_GET_STRICT_CHK. I will fix that in v9.

The others are either pre-existing, already discussed in earlier
versions, or not an issue.
