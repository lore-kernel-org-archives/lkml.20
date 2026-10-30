Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793338994;
	b=VvWW+EbSiWF1Q9AhT6fZjdm+zYfQrQH8YdRJsOI09RCU94zTG0skSwrFkRoIJhCXx2JR
	 5jw3N8uiwXgyE1SiZ+4NLWFmaAZsVXsJL+6OUd5I0PJUdbjfdjB/VuIFpbhtaQWknVDYK
	 obhTsm5j8pdePyLN8DMU8qi/4F3vglx4yrtj0eBFh8q4YTJllK/J6RkrXZ00dUOoPBkd1
	 4MBAE5Atvh0jgl48qWYzM1MI1MGa/2rOpdbO1KEM75cbG8NCKt3DiMKfcfxDpxD72b0g5
	 3evp79FvVkWSO6HnWXXFwyUPKsCHIkCLgnTQJ9ay1kcxX1BWgY7PNkMzUgGggx9I+Vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793338994;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=bCWYMiBYjhAym3CK4+93yurIeQTmlbS6kD3ZxpQIRR4=;
	b=HY88jRRs3Va3WxSYkpxq31gq1ZwhXp8PoTDIg8K5Csvr6VZ28zOYorSGZxQENiQ/ul6R
	 oURdjG2OK+2By0FGH+hViBuajoD7XjIZsHoepI6Tcv4w6jXG9V5eAkySeiXbJpjGZwJ4V
	 U0IbMsLOog6wG9i9kDhnJmJ7n9b6dIHgkTmPcugJwgHbxVbkoaSW++2+vdcFO7QgXDoN3
	 XHjhVYx59dkObtYVhcr8qCbXcyZegKF6usgsb4agpeubrYixN+oKF+rnl/e24x0krJ1oR
	 jfeTkOEL/hC4FpHRm+iOz3h08lAn8zRGaoASqvDnjT+W1Nbj0Ltzn48mktWJRENLKHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="AQTXK/7n";
	arc=none smtp.remote-ip=74.125.227.130
Received: from mail-pj2-f2.google.com (mail-pj2-f2.google.com [74.125.227.130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97255606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 05:43:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97255606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AQTXK/7n
Received: by mail-pj2-f2.google.com with SMTP id d9443c01a7336-2ea19bc317dso2872625ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 22:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793338993; x=1793943793; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bCWYMiBYjhAym3CK4+93yurIeQTmlbS6kD3ZxpQIRR4=;
        b=AQTXK/7nV7AtiXcnztdcwiTjjJrOqKxtXmR0kgdEh3k7rNpZox8Rr6/D12TY2CulD0
         1WfqOLcvFVmzKbTwxhQnWcyxSBQGbB1XTlv34xNCGfAgrNMW1dUmw58H7RBELO7BIR+l
         LUUl7odHPoXUMXr0CKwN9+WERWYMTHJhKLsM2TZL6f4y+E/9O2JmpqLhtAzgLPHgTIAT
         wbNHZGVIAyrBxenfjBNIcydy52ZAFAIcLXf/VDwRJWHt8UM/amk0XQi5rhjkFXHTZKav
         LfaZyRgtqNVumd0bSWt3fnHlCWEJ85bKglDw9Z1GOPHSPToWPvShBIRShlQmkgMw3KE1
         hTPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793338993; x=1793943793;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bCWYMiBYjhAym3CK4+93yurIeQTmlbS6kD3ZxpQIRR4=;
        b=a9wJ0d7My51gt7hiquCXg6k+UZTo3n9J23Ag0J9EYVoCg45swBQrsxO83jHbN5aMoZ
         ehOeQ9/cElY77LH3EuFc2AmWnkdqz6WqFxbt44fakJlJSwzFTvzYm9429Qa5EdhJP+SB
         wyuWXAT7+YqEmJDuphveZ2Y8mlF3Ntf9WMRuih9QzhkCxCcwBcAhqVspI10y3Kl4yFoL
         IYcCGpuunVNQhOx8JMc3RnwTxvSACNuSRvwAvQo1WZVD5+FwBAvW/Shq5p+MuxEgDU+0
         oeywii3m9Zrigm7L9anwOHOanR9LTO4qGKOBVTtDAoe1dFCRS12he6uT7YoDcKWNxPLH
         kRpg==
X-Forwarded-Encrypted: i=1; AKwUvBwRCyd1C8mZ+Dgg2AGVMkxsnmHpYo9NcCJthpMpopCMykRovlQeb63EHdbpEZRLOjPSJo2ji3qf9yF1zho=@vger.kernel.org
X-Gm-Message-State: AFq9FYIDs+KZ1mkMdZtzkJX7kXsvKA49lh2rrVpMAMx/RpeT/rq1T1Ra
	cJIQHbxqAadKifakibTSk/YPo7KkhdG2McKrFaRZiureRshHUcqs5jI+
X-Gm-Gg: AYBFou0+PpjcpSFbast08CocuaY07n3Z4X80O+LYUzhpn7Jx4XsgVss0oRBKRotr9ri
	a8DWpi2GzJyxz0Ulj6Bn/4WtVL2CsK9SMLPKLQxNa24WfghOl6JCCOhweIae/l9CL/UC9lkj8jI
	YMdgY537Pv3OoJyqY0gbE4PE3vGqg7Bx0nAN3+BJfS90w9bLbRquLf3y4uH4Y4fnIffnKeqw3w7
	FAjl1C+BE3zixJmwyQSD6xltEOfhJYcNuZT9wyCXf+2GY4vLGw497IWKRumK5FW5g0dYoeRAn/u
	Pqt6+tSd/BFRloZF8iQXEt3rhlpqoo6LaJ/k7VkfxtyFWY+DSd9/9yPD1b9pg38zmBi4eta5wG5
	uBuNoVO9WuCCriLEd6VPI8yk0vffWVsZ0Is0qg4WkngzF0EgKWxI+wOMwtkdFuMrUxsoKCLVK2Q
	7D7HAZbAwBdpI1JcX8J1exZHqZBqQBl9twZJPL9k+dAAhDz3uvevJArgV+exTjt0CbN43Lck7aK
	6H9f0EZ5fULrcvfxyhCZcbaCgX5WDkOIDst8rgHJqg0PZf/n5mNjFkv51B5ltHrHhyMTfQMHn1i
	jlkCaid5hO2qOchDpf8+ZA==
X-Received: by 2002:a17:90b:17c5:b0:3ab:413:49b1 with SMTP id 98e67ed59e1d1-3ae897c0a0dmr1047677a91.48.1793338992989;
        Thu, 29 Oct 2026 22:43:12 -0700 (PDT)
Received: from debian ([169.211.140.146])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e2a703esm7084621a91.0.2026.10.29.22.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 22:43:12 -0700 (PDT)
Date: Fri, 30 Oct 2026 01:42:56 -0400
From: Kwanghoon Son <asdfkwang@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
	Paul Walmsley <pjw@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Anup Patel <anup@brainfault.org>, Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-riscv@lists.infradead.org, linux-serial@vger.kernel.org
Subject: Re: [PATCH RFC 01/12] dt-bindings: vendor-prefixes: Add Bouffalo Lab
Message-ID: <auQuYJqQNv4LMDP8@debian>
References: <20261029-rust-bl808-console-v1-0-b736ee920078@gmail.com>
 <20261029-rust-bl808-console-v1-1-b736ee920078@gmail.com>
 <20261029-unpaired-viper-830e55436015@spud>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261029-unpaired-viper-830e55436015@spud>

On Thu, Oct 29, 2026 at 06:52:15PM +0000, Conor Dooley wrote:
> On Thu, Oct 29, 2026 at 01:05:42AM -0400, Kwanghoon Son wrote:
> > Register bflb for Bouffalo Lab Technology (Nanjing) Co., Ltd. Reuse the
> > prefix already deployed by Zephyr, including its bflb,uart binding.
> > 
> > Link: https://docs.zephyrproject.org/latest/build/dts/api/bindings/serial/bflb,uart.html
> > 
> > Signed-off-by: Kwanghoon Son <asdfkwang@gmail.com>
> 
> Worth noting that last time this came up, we agreed on "bouffalolab"
> because that matched the domain used by the vendor - which is what we
> use as the source for compatible strings.
> 

Right. I'll use "bouffalolab".
I'll also remove the justification based on Zephyr's naming from the
commit message and cover letter. (I thought it matters..)

> https://lore.kernel.org/all/20230607195027.GA3894404-robh@kernel.org/
> > ---
> >  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > index 5471a06f93f1012f08e26f7f105ad846ab3629ac..24c670ff75b6f482ede1bda3b59c70ed9116042f 100644
> > --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > @@ -249,6 +249,8 @@ patternProperties:
> >      description: Shanghai Belling Co., Ltd.
> >    "^bestar,.*":
> >      description: Shenzhen Bestar Electronic Technology Co., Ltd.
> > +  "^bflb,.*":
> > +    description: Bouffalo Lab Technology (Nanjing) Co., Ltd.
> >    "^bhf,.*":
> >      description: Beckhoff Automation GmbH & Co. KG
> >    "^bigtreetech,.*":
> > 
> > -- 
> > 2.47.3
> > 


