Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794881894;
	b=FnGvLKnB+W2kXYrAAnv/XrZdg03F0TinV9gVOBAku+7BTMPDZQd/jE56vb1W5mH/oYnZ
	 Xjihdv+WxAq79+OiRFoUGJ32J5+Cp0qx7P0pPZCD9tj3Qw/ON8TzjGLRYJiwFzNBpr7mC
	 nha9erFlxtTVh1ogV4iG41wPVRH8/qStKJ/XgryGGS2z9a/pqY87mjfTyMr+5NbVsrtqs
	 onSNxdfH19aRfHuN3FyA3YlYCmWGuVYD9ZFtd9uZLf6QlcyshSKaKoKuCz9eeNbuF+vfW
	 +9R/Ck6mj1QRsIPTvtN+gQ9i6f/xPL6M0RemIZ0TxiL+a4PI1ovis3wAT2dKdssJI/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794881894;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=NcnjKRzqIty6DSvUi988wG09npHOupeuFWZpOtOlzJo=;
	b=p7p8stlsf/WEnP10MIo43Cw/dvPsCTWHLwOE8/OThLP2HCqoGnreUyUCAMLqSWZmB6zH
	 muhnBSbep9vXUYnP6cwTjmYks8ql/Gkn6mDZQnIGrpkGPPBiuHf0P4a7Gy3nh1spg3gib
	 BqtAOLeFvLMX21Hdl12mQ0hstLMa7ik9zC7gWHjfy9atFYGexb/mXyn9XgGuU3EYboPF5
	 aD0aGYzXdw4W0MvBgg2V+Ira5Ybb3wPrM+W3pH/kfikn+wzuZ+ndHmPQM4FSaZBVeCyXJ
	 0ETc2/sfrIC4EfiUTM6LgJ/2FA+pso2/uIqggEBGnaBY2u9WGmEh0X6wSfb1u2kTMjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V6CTV3wS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97F4F606A88D;
	Tue, 17 Nov 2026 02:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V6CTV3wS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 670EA1F000C9;
	Tue, 17 Nov 2026 02:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794881894;
	bh=NcnjKRzqIty6DSvUi988wG09npHOupeuFWZpOtOlzJo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=V6CTV3wS09f0lFxHDCayEnBSSkaeazxm3wk6QWIgezC3/I0uf1vCriCMo5tFW8BrB
	 pdsJMfT0rdBDmYT/gqOyqYULJFyrti7FiOXzWhRiep/QOeBD7LoBGngkfmYUEg6XL8
	 1kX7L4J986t0fzmK3UglhsYxhMLtVCBYO13qR7Sqkeei/FH0Vb4XujigaVAy5AmQJP
	 qdTdVvepUpkbOF1IXb8ktbdzsXxei3WSxniUa9zjL7rlo1Jw/2djFwOizGwUJ1nRM0
	 xxJkk107VQ+PQDLp+IXfd/HwtdjoSTAkgr1LC0dLSSGExOlIS86BrBuq0Ujo6GPnO+
	 OmNvKCtIqnY3g==
From: Jakub Kicinski <kuba@kernel.org>
To: arouhi@sitime.com
Cc: Jakub Kicinski <kuba@kernel.org>,
	jiri@resnulli.us,
	vadim.fedorenko@linux.dev,
	arkadiusz.kubalewski@intel.com,
	ivecera@redhat.com,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	cjubran@nvidia.com,
	Oleg.Zadorozhnyi@devoxsoftware.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	devicetree@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v15 05/13] dpll: sit9531x: read DPLL types and pin properties from system firmware
Date: Mon, 16 Nov 2026 18:18:11 -0800
Message-ID: <20261117021811.2220116-1-kuba@kernel.org>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261110202607.55744-6-arouhi@sitime.com>
References: <20261110202607.55744-6-arouhi@sitime.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.
---
dpll: sit9531x: read DPLL types and pin properties from system firmware

This commit adds prop.c. It reads the DPLL type from "dpll-types". From the
input-pins and output-pins firmware sub-nodes it reads each pin's label,
connection type and supported frequencies. It also builds package labels
for the inputs, the outputs, the XO and the INTSYNC pins, and gives outputs
with no supported-frequencies-hz a 1 Hz to 1 GHz range.

> Read the DPLL type and, for each pin, its label, direction, capabilities
> and supported frequencies from the firmware node, with defaults for a
> node that gives none.

[Severity: Low]
Does this description match what sit9531x_pin_props_get() does?

The direction is not read from the firmware node. It is the dir argument
passed in by the caller. It only selects which sub-node ("input-pins" or
"output-pins") sit9531x_prop_pin_fwnode_get() searches.

The capabilities are not read from firmware either. Each pin class gets a
fixed value: DPLL_PIN_CAPABILITIES_STATE_CAN_CHANGE, or 0 for the XO.

The message also leaves out two things the code does:

- It parses the per-pin connection-type property into DPLL_PIN_TYPE_*.

- The getter writes sitdev->ref[index].freq, using the first
  supported-frequencies-hz entry.

Could the commit message be updated to match the code?

> diff --git a/drivers/dpll/sit9531x/prop.c b/drivers/dpll/sit9531x/prop.c
> new file mode 100644
> index 0000000000000..b9405eba49a39
> --- /dev/null
> +++ b/drivers/dpll/sit9531x/prop.c
> @@ -0,0 +1,327 @@

[ ... ]

> +	if (!fwnode_property_present(props->fwnode,
> +				     "supported-frequencies-hz"))
> +		goto skip_fwnode_props;
> +
> +	/* A -hz property is 32-bit; no rate of this part needs more. */
> +	num_freqs = fwnode_property_count_u32(props->fwnode,
> +					      "supported-frequencies-hz");

[ ... ]

> +	rc = fwnode_property_read_u32_array(props->fwnode,
> +					    "supported-frequencies-hz",
> +					    freqs, num_freqs);
> +	if (rc) {
> +		dev_warn(sitdev->dev,
> +			 "failed to parse supported-frequencies-hz for %s: %d\n",
> +			 props->package_label, rc);
> +		goto err_alloc_ranges;
> +	}
> +
> +	/* The first listed rate seeds the input's rate */
> +	if (num_freqs > 0 && dir == DPLL_PIN_DIRECTION_INPUT && !xo)
> +		curr_freq = freqs[0];

[Severity: Medium]
This reads supported-frequencies-hz as u32. Does that match the other
driver that uses this generic property?

The property is defined in the shared dpll-pin.yaml, which does not give a
cell width. zl3073x_pin_props_get() reads the same property as u64:

drivers/dpll/zl3073x/prop.c:zl3073x_pin_props_get() {
    ...
	num_freqs = fwnode_property_count_u64(props->fwnode,
					      "supported-frequencies-hz");
    ...
	fwnode_property_read_u64_array(props->fwnode,
				       "supported-frequencies-hz", freqs,
				       num_freqs);
    ...
}

The microchip,zl30731.yaml examples also use /bits/ 64 for it.

Suppose a SiT9531x board DT follows that convention:

    supported-frequencies-hz = /bits/ 64 <10000000>;

That is one item, so it passes the sitime binding's maxItems: 1. But
fwnode_property_count_u32() returns 2, and freqs[] becomes {0, 10000000}.

curr_freq = freqs[0] is then 0, so sitdev->ref[index].freq never gets
set. The pin also advertises a DPLL_PIN_FREQUENCY(0) entry next to the
real rate.

The reverse also breaks: zl3073x would read a 32-bit cell list as packed
u64 values.

Should the shared binding define one width that both drivers follow, or
should the sitime binding state the 32-bit width explicitly?

[ ... ]
