Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793266384;
	b=06i25RebcDOKQ++qNcJ28P4yChJIGBf+/TEbnUvP7q2RbCmtcuZHU4OAudRl2TzYX6uq
	 9ObfG2QnxnE1eWImt1UV+gow7uOuKIIFMq3UvJtbq54ADpybn7OecHLiQSHTX8+KdRC9U
	 1pA1yjI1Dp8Tx9G+8ndtWjRs1vECfVkFlImmB2fcsstCAa3FujTvPwlc2cct+2ombqZYB
	 6475mbt00ckPpYjuUsawhR4py2MKiVJsjlKHPXxbqK4FX82ncuLD7fbAH0bkUxQLrElG+
	 AKakFdoASvfgKasmFLdQLMvqniMDpoA6tKU3epUWLEm4hBXSncfHsPZkUrM5JZRUSag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793266384;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=25Xe2LGlhfjUVvHKZS8zB+EQgKUVnKIy/4iS8f7+DSY=;
	b=ggYXLeZgZiWMcWD75beJyIeu1KrBSncarcnerRMWpUfDh032D7HEi1pSV2c4V8gM9EeK
	 2d+Vs9Qyw0fSFZ6nJyj2t37gWpv7xHotTqIAQZRp516dhU9UHxvnBjxccVCxBjyu4sVS/
	 MWNMFm/yZWOwChrgEW0whedxOgBiSa4V2CtJrQ0jtucFiVtL+Y6es7IrfXUrMDo5yvdo3
	 I4d3Af6+1gVn3ZNm9qtNY2ILJuLbVhI4jSmWGnyhDXggxqv5KGVU44SOgwpodzVI0HrgY
	 JpAgcluoJtuBm+WnjawyQ+2hSSbQXzGaaaC33Qf6Qxb5xEZWqzh7f85ti3CaYSJoWNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB8B8606A321
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:32:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB8B8606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so19101045e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 02:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1793266377; x=1793871177; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=25Xe2LGlhfjUVvHKZS8zB+EQgKUVnKIy/4iS8f7+DSY=;
        b=QH69CTU+mXD9r/mvEuahgml2HOKFQRQJRW8BDZn+++9cViMZQc/pcNx8tmGqUlzfst
         VGUgif0Z8D7dZmUQqjKAyfKtT49slL0aATVCJvSp8Pah7juV8r8n2umG7Hsbtw7LWYXs
         e3Lidy6xFzE4p4IJ/Ru/yw1c4e6NtsU5b+8JxoyD6sa+3d/+tTabLmRxA/oJ9qkiL1Ir
         hP8YXvceBTsFHvjt4RNrthEjgcD61ucWib5a7uANRq+iQ6GS+WgvB3ZcOP3yzxdiOdOl
         LJph8ZfuS8zWbl59DoBWEwStQfyFGxQ/qLXI6YS4TDEaxNEqX+9iCbR8qm/HQnRzaKUm
         NX2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793266377; x=1793871177;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=25Xe2LGlhfjUVvHKZS8zB+EQgKUVnKIy/4iS8f7+DSY=;
        b=EvXnfKbF83gu7054PGs2XLOgSDm2bCu/RD00I+6PD2eFZ9UIn7LngKmWl7FtKzucQb
         YwpbakWvKGcsdPvm+ioggfWxpi7797KJitAUAjCr1dhqf1fOyzKXDZ/F6MalDVDirSuh
         Yxe7+YksOUSWl/1mgfcLZe4ItsLjPk+/2sku7e/L9mG7elcB6mi0V4ezl/AiqDQcE/tb
         0wYwLWM/zrPDDALadO3eq69Q1Kr9Wlleat0SmdMT/ksdPv5GxMDhsvrXEm6Gv3c5zT+6
         BGCnzTkhb5YoULYTrHexPVJ5Rq4X1lM2oEwTKeCL9dOK2wvPL/Lp8A5DKzz/VQH2cnbr
         yDqg==
X-Forwarded-Encrypted: i=1; AKwUvBw4Aco3SM+b1UwoGXvh9UF7xbTRs0LYBMJDEfzkvX2rJsMvGc/8mb4yuLmf60CmNTXHnxRyLs4dsdMjyPo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLatLs4VpZbGdlfRWWizDUT1t9RDoIsZGMK+PaIcy0pykqfba4j
	hpGM5MUiKABGWLQ3oGnZLv5RRlmWcKxgaETwz/nGKpk6vaZOZOiINF7nmeuOipL+P7g=
X-Gm-Gg: AYBFou0HyyJdFw0lBFKxYt9TiJL663oBvNnSZjRv+zVASIVNnHcSLyrXbpQLzMuvpIR
	hx2evGGj3eoncPyDE7tyS76J3UOPJ4TK1YL1p+5LD/1FIZ/eVpZMBCV83mM0J4nPjDThioUl8Ez
	bC4VMqX11I+0OfdMbRMgNtM7vjBe6U0uHV9nHMZ0YC7yR8QbIVxliUSvR06A7T28/4dS6nqOJq+
	QU9fZErkqFFImn4KE6i4cOF/NRNu4I7Dl8oRj4zYtF7FD/CIYqRvvPk/IIt0I3WRa8hb9JO8HhN
	ziLfItRTRPoLbyD55PkJ7iq6jroCl6YQ7s7zWAadx+gC/QCGHfZ20JzWHp0tCzwU2NME6Ok6IOy
	ybGLXl+V7GlieYvJ7Ws3TkV11EOICDIhytah6cdIKNDG6u5nuDJwYrKGYbHcIypJ+rHPD6Y59jm
	FFk6WuFqtjDSoaBZNhmiE8XRi8n7dNGpVZWN/3Ixj7dmui7PY4zT7zjHTVZPv06+xc3MObew/cK
	LsjW0GZU1JBSE4QW0wCQISi7n5Uppguks8zR0uZpm1LNBRWJGuy35RsGHn7uCtlVQv2RE0ZjWPK
	GqAHDm/Q+tGACwnT+nROZEU6YDTo/BD7pVY1UA==
X-Received: by 2002:a05:600c:1909:b0:4a2:1e1:d55 with SMTP id 5b1f17b1804b1-4a9675dc5cfmr104826795e9.28.1793266376792;
        Thu, 29 Oct 2026 02:32:56 -0700 (PDT)
Received: from localhost ([208.127.45.21])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa80285b2dsm52889635e9.13.2026.10.29.02.32.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 02:32:56 -0700 (PDT)
Date: Thu, 29 Oct 2026 10:32:51 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Dave Jiang <dave.jiang@intel.com>, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-api@vger.kernel.org, x86@kernel.org, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, david.quigley@intel.com, lukas@wunner.de, ksinyuk@kernel.org, 
	rodrigo.vivi@intel.com, cedric.xing@intel.com, sameo@meta.com, drdeeglaze@gmail.com, 
	James.Bottomley@hansenpartnership.com, aik@amd.com, jpiotrowski@nvidia.com, qinkun@google.com, 
	pgonda@google.com, jic23@kernel.org, alistair.francis@wdc.com, ankita@nvidia.com, 
	suzuki.poulose@arm.com, kas@kernel.org, rick.p.edgecombe@intel.com, 
	elena.reshetova@intel.com, dave.hansen@linux.intel.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com
Subject: Re: [PATCH RFC 00/20] attestation: Add a common subsystem and TDX
 support
Message-ID: <auMSPNNXZv1f43v7@FV6GYCPJ69>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <592d643f-e97d-4de8-9a87-e47d57dc8457@intel.com>
 <20261027193629.GK1685504@ziepe.ca>
 <5f33aeed-a20d-4881-9ccf-a69bc308d348@intel.com>
 <20261027234658.GL1685504@ziepe.ca>
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
In-Reply-To: <20261027234658.GL1685504@ziepe.ca>

Wed, Oct 28, 2026 at 12:46:58AM +0100, jgg@ziepe.ca wrote:
>On Tue, Oct 27, 2026 at 04:09:19PM -0700, Dave Jiang wrote:
>

[..]

>
>> >> 6. tdx_attestation_test's discovery_and_construction_fields expects an
>> >>    inheritance chain of 4, but the TDX family inherits ctlv-attestation
>> >>    directly, which gives 3. In a real TDX guest it fails with
>> >>    "Expected 4 (4) == ctlv_chain_len(self->dev) (3)".
>> > 
>> > I would have naively guessed this should inherent from some SPDM family?
>> 
>> The TDX family is the TD's own attestation (TD report, Quote and RTMRs), with
>> no device or SPDM in it. In wip_attestation_all_1 it inherits ctlv-attestation
>> directly, so I think the test's 4 is what's stale. Jiri would know for sure.
>
>I think TDX report/quote/rtmrs should be a different familiy from TDX device
>assignment SPDM. They are completely different things.

correct:
1) ctlv-attestation-tdx
2) ctlv-attestation-spdm

The spdm instance is backed by particular implementation/transport.
