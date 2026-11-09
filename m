Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794247954;
	b=RfCeWhD59fQyegMyV96vIci4ioISqrCoeFoP29LByu0IjmTFCxPhVXG/JO3nbuSYjO6P
	 lKqZZhOckKdsMlBZx8QnlALL3rjMPMnKOD9aeId71G6lS9nQ+mkYpS73IZF2+MIfPD7S7
	 HJ0WPo9BPvkfLSfexm/abo3oE9sMULfFOSMGJmugZ5rUPMSWEI4jdNhF3nxqDywEPnEar
	 XjvAvohlGBKNkwC0C89gMlwb2MqidGSPqoWOAwCSjYySFt/lKZeFj6+cIsmBl38Y0eXp1
	 cvfhIXFep8fpy5LeGovCu34A6vedjUP/chRvIvaJi616UqutjTG+Lx++2bMKLHJQm5Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794247954;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=dGm8nmvLy6E2sFmoRptp+D8SP6z/MqgZLc9I2o+BU6Y=;
	b=sgBNEgV8hMLqhHwyw1zGJWqKw3bASGnBDRpF71e+ucS39cC2Wyr8H+mzEkNam67yWJLq
	 Easn8VtN8eZgVD0ONr8rmuvmluezLA13QUExzpr6FiA4xgGA3bdbWEBGGyVd8omiS/ZeG
	 yfrURuEdCgxNPzXPQvwj8FU5iIW3UsbELvgUh8+F4L8cP2DV3tUgoSPL08AxTl3bCZNKx
	 fgkluPVMQknxLZenz1HVDoH0tTilYV+D8c/g0m7Cic/44TOjg/0q7bOtZtcL2jXp1/1MW
	 Ji7gyWZ3vuQRblZURbf8Wyc6dvAZLJsKdwnBMiwIWm/+IZOsdEa7qcoRmC0DvAEyVvw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=PSUh0CjE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.179
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EDBC606A326
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 18:12:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4EDBC606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=PSUh0CjE
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-5383c97c8cfso6361cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 10:12:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794247953; cv=none;
        d=google.com; s=arc-20260327;
        b=To62IKLC6zDVYCvUHSDdqVLa+Fdbwwdb41H7lHzlzvwDInMOp4q2I9T/url9F2Jucw
         3KahYtl5Sp5jpXOK72GCfrdEqmZlbzXEZW4TKdjQJFUxfWYpReZABxIOKFqZW2ulyH9v
         GBGKY2VsweGIUX43iPbArWA76PBZecoRROVP8XxDlFJraXcS1192zqPIu0NpBCf/cF+X
         gjz0ZDW5xk0nMOQMKHA7HmE9uGaHQMCs7ZrATKNrFXQDNiUc/+hGn3Agih3YTWW/tXpX
         SuS24pAIvCJ82sVq3Q0+QGRE7ibNkr+NfsMo5BDn2lMfy0Sg4ruG97Vd/WfWM0UXbrhp
         KbaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dGm8nmvLy6E2sFmoRptp+D8SP6z/MqgZLc9I2o+BU6Y=;
        fh=T8aNAvp4EN+wbcQzpzHslBBrgcFoCKNGPMYc5LWnzAA=;
        b=hdl6bUiWh1CLtPEPjHuBcxQ/CNy9LUku4Cs3IWBLtxwNlubd7EpO8az4GZ2S2HIRFi
         gYN+rFva2hmPJs350mz2C4m9O8rccM805aXkSVZqSTZME1VipKMnf7sQaCWwawUglM9T
         y/M4txLKoadP9yn0yIWg4K3zW+lN7UcHuqN7rsCzTIg6M2iie+dCAcg0eChOUv4rDwfV
         K8IxlJRc5OhjB7H7zwoaExFJqWqs12IBB6FBlzBLzyeEUfYhjACkDYKPXHoRjt2xllfJ
         LUiIT8XXyf4rJOsIMSBjBamEaRuhpOXUL+JOW4EzcueYUm/3WPkc1ly/a73NkBumwLtH
         30DQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794247953; x=1794852753; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dGm8nmvLy6E2sFmoRptp+D8SP6z/MqgZLc9I2o+BU6Y=;
        b=PSUh0CjEMxfsN7BHYMDVYvAEhdCcCyr1A8NrN35WuqIsTR+9oBEIETRFwRAro1JVm3
         MV1+5v+uMk+26jLTq5uauyK8cGUBpvkuLmmMzmvpKYsVEfLOqM2QWxhNxm1WSDiG39Hc
         LTAHnyvY/X2rS+nkN/lKmAHpLiddGtkYrHVxvMKhJ1moyY8860W6RLabyNh1z4jjpx9a
         Lz/KEShc71fQvc5/8eK4Hguy0S8PE5R3o4K2oCTZ3AWeX1mUJLqTjoK1wyGAzD8xoDjv
         AB3YDwby5q0KbeUR9WvSXdj+JayLNpn2bGQrzWfko+Ha4+FTzwUgMYg6unYT0fWJaxiG
         CyPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794247953; x=1794852753;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dGm8nmvLy6E2sFmoRptp+D8SP6z/MqgZLc9I2o+BU6Y=;
        b=n/SZ4Lz9Bobj9BVn61mIsxrexcjMzmFv6NDRrZ2/+acUPC1Eu+uZYOBMWREu8XGGIf
         eibIfMVRK4OBtDTNmAUqcWMkez1EzjiK4yp2AD1kXz7exmZgCRpujENy3DIbW6VDifgW
         U7jf76wU9mUPXXZVDmgchSiJcp/4bu48x4eUAxOfnjcQGnb3J3HMf54cAUSgrSmAusPN
         tT3dG48Glab+wyyslQMIGkqDYIsDMisn0+Z1LIIBildRzaX5QxUfujr1pVZ7yKDR7sHU
         sA+Fz2LgTDPd7+tprQ4ftZO/OXPJFQMHTePluW5PZ97EcyG09O9l5Wagq65VORotvPJQ
         TkKw==
X-Forwarded-Encrypted: i=1; AL+hErE/WMOVujPFGZ59wVh8qRaYyPXSF8xBND7NeIP6vUMYUvBeQHPKqSj4HAe59anL4p9QJjeuf3LkvBB+E6Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z+iPiDVcSpj7BNhNnbbA9WhoEQFd1JkldT95i6//l77wLG2dYop
	iXXOirRiY+UmVXkbgNXlXiDNmQ6c1adaHDqfuYybloMlLtX9pGE36vrESgKIc5WscTrlQIplpAc
	kyBJc+QNQnFmIJMSy+X3zlAf9bRAp1nu+uPxxPyxe
X-Gm-Gg: AYBFou0FzDxZbvev1UCvJ/3+mp83icNkdY2mY+3bPWc+3D/Vtgs5RQnu75AVXZSXXAM
	qAC5mk1wkn9I7Lp5EWmlqHPMKjd8x5K36dl62Zm1XEsFRYTYT2cVJyG+dZ2VUfgYqxdtdCi/2Xb
	M2k0a2xKn6o40hPDmKMtjHyCYMpRqR03p+Mmd8pd2PoADkhiHwYZXAjcnwQjaEA+Nt9jQxc/naO
	NOKC5nA0SuRY/ozjnsfdsEJ5y/64nJno3f0+6AMUyfeTAv9Ta0zEsKWAP0g4VXISp+iXshuiXql
	TJjeg/M+6CT345JjFqOStAwIZwC9o99lRv2uG9P7dSYlJpAaLFzIY1H9P7RFjhXjCVtjQPvbuf/
	hLiJnUKdGXkE2Sl+QLIcj9wfkyXwJUb5qnI4xrf5Uj5Ty43vSGU5X5X2juQG+juAH1R0JT+U2UR
	lDGi0ofxQR5Hj5KBCsBmpaVubVS+Y4dBNz/wFM9LFiuwrSUUw=
X-Received: by 2002:a05:622a:488c:b0:542:fc60:fe23 with SMTP id
 d75a77b69052e-55530d3d62amr54161cf.3.1794247952273; Mon, 09 Nov 2026 10:12:32
 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110-mtu-probing-series-v3-0-dedfab25d641@gmail.com> <20261110-mtu-probing-series-v3-3-dedfab25d641@gmail.com>
In-Reply-To: <20261110-mtu-probing-series-v3-3-dedfab25d641@gmail.com>
From: Neal Cardwell <ncardwell@google.com>
Date: Mon, 9 Nov 2026 13:12:13 -0500
X-Gm-Features: AclHuK-E7FZmMgLaCJxXz6hIu0FtIdqq3ijAk57SK8zqY5F6VRotgKBpxs38suI
Message-ID: <CADVnQykoJWJL+vZ9GC=RqZuiSEypNtmTONBzV7XRQ1jsXy0X_A@mail.gmail.com>
Subject: Re: [PATCH net-next v3 3/4] selftests/net: packetdrill: add TCP black
 hole detection test
To: echoowall@gmail.com
Cc: davem@davemloft.net, edumazet@kernel.org, pabeni@redhat.com, 
	shuah@kernel.org, kuniyu@google.com, horms@kernel.org, kuba@kernel.org, 
	netdev@vger.kernel.org, panweiping3@gmail.com, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 9, 2026 at 11:44=E2=80=AFAM Yongjian Wang via B4 Relay
<devnull+echoowall.gmail.com@kernel.org> wrote:
>
> From: Yongjian Wang <echoowall@gmail.com>
>
> Black hole detection (net.ipv4.tcp_mtu_probing=3D1) has no selftest
> coverage.
>
> Add a test where a full-sized segment keeps timing out without any ICMP
> feedback. Check that the MSS drops to tcp_base_mss once tcp_retries1 is
> exceeded, and that the smaller MSS is also used for new data after the
> retransmission is acknowledged.
>
> Set tcp_retries1 to 1 to keep the test short, and disable TLP so that
> every retransmission comes from the RTO timer, which is what
> tcp_write_timeout() counts.
>
> Signed-off-by: Yongjian Wang <echoowall@gmail.com>
> ---
>  .../net/packetdrill/tcp_mtu_probing_blackhole.pkt  | 37 ++++++++++++++++=
++++++
>  1 file changed, 37 insertions(+)
>
> diff --git a/tools/testing/selftests/net/packetdrill/tcp_mtu_probing_blac=
khole.pkt b/tools/testing/selftests/net/packetdrill/tcp_mtu_probing_blackho=
le.pkt
> new file mode 100644
> index 000000000000..f10dbb36dd2d
> --- /dev/null
> +++ b/tools/testing/selftests/net/packetdrill/tcp_mtu_probing_blackhole.p=
kt
> @@ -0,0 +1,37 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Test black hole detection with tcp_mtu_probing=3D1: when full-sized s=
egments
> +// keep timing out and no ICMP arrives, TCP falls back to tcp_base_mss.
> +
> +`./defaults.sh
> +sysctl -q net.ipv4.tcp_mtu_probing=3D1
> +sysctl -q net.ipv4.tcp_base_mss=3D1024
> +sysctl -q net.ipv4.tcp_retries1=3D1
> +sysctl -q net.ipv4.tcp_early_retrans=3D0`

Thanks for the test! Though because of all these sysctl settings, this
is testing a fairly non-standard configuration. That's better than no
test at all, but IMHO it's more important to test the default
configurations users will be using.

So I'd suggest renaming this case to be something like
tcp_mtu_probing_blackhole_no_tlp_retries1_is_1.pkt.

Then I'd suggest creating a test like this, but with only the following set=
ting:

`./defaults.sh
sysctl -q net.ipv4.tcp_mtu_probing=3D1`

That way we get test coverage for the most important scenarios and
code paths, and can understand the behavior that users will see if
they just set net.ipv4.tcp_mtu_probing=3D1 and do nothing else.

Thanks!
neal
