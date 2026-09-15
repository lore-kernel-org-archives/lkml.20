Received: from mta0.migadu.com (out-125.mta0.migadu.com [91.218.175.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF6A35E1A8
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 03:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.125
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789441285; cv=none; b=dsgVS0HCUI6KoOxvLInqi6BP+UFFAADstIOauWRD75YqvdIdrsrNHM3LfpKCddq96A6NevUbyPD7FK7aQwN1WGQwrXlemT93L94B+EDRIrC/QcdzQAGIUUfkEPR+9dB2wU6S3/eGXOebUH64CTLo1nHWAlt/RNH9E5j5ArVBWIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789441285; c=relaxed/simple;
	bh=TiPP4zoWgZhKV6OChYx8kSlx8teePQNzPerxB5qfOl0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uzbt4JVHnwvRGzIUL6rSncLUo/KYgnHsiC3Tv6GSNSvfLwoa7OUw8BkQhnH2UJjA496SQrClJqhEE8viJThhPKfpNhNEIFWvf0zUhzXCRpPtgW1vVdsp9v7qcashXDyahbj8YP2oMCj4s08L5EaKi85hHeALy2jbWvmzkfI1XZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=F1noWmZ1; arc=none smtp.client-ip=91.218.175.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="F1noWmZ1"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=TiPP4zoWgZhKV6OChYx8kSlx8teePQNzPerxB5qfOl0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789441281; v=1; x=1790046081;
 b=F1noWmZ1qXVtVH3OkX1RkPYkmt2cyBdaOManBsiYSG1rMV6w0t93Z8gDMauxU2/WWpUpa4i1
 Jw84MbsuBgKzCYwM0JkqrMoJWlgYwtD48YPHnQXFTbxT0KZrgH56r9F65c9Svaax/Ii1ZSqynGj
 /rNmfkizBUatBIPcVm8JavSk=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 760267d13b5f471b;
	Tue, 15 Sep 2026 03:01:20 +0000
X-Mizu-Trace-ID: 760267d13b5f471b
X-Migadu-Flow: FLOW_OUT
Date: Tue, 15 Sep 2026 11:01:06 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: Taylor Bates <tmbates12@gmail.com>
Cc: Donald Hunter <donald.hunter@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Jiri Pirko <jiri@resnulli.us>,
	Stanislav Fomichev <sdf@fomichev.me>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2] netlink: specs: fix duplicate if/then keys
 in netlink-raw schema
Message-ID: <aqi08tn8GKxqJgVT@fedora>
References: <20260914-ynl-robustness-v2-1-c6125003b21e@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-ynl-robustness-v2-1-c6125003b21e@gmail.com>

On Mon, Sep 14, 2026 at 09:53:15PM -0400, Taylor Bates wrote:
> Currently netlink-raw.yaml contains two if keys and two then keys in a
> single mapping that enforces a "len" for "pad" members and a "len" or
> "struct" for binary members.
> 
> During validation PyYAML resolves duplicate keys last-wins, so only the
> binary rule survives. Pad has not been validated since commit
> bf08f32c8ced ("tools/net/ynl: Add support for nested structs") added
> the second if/then pair in January 2024.
> 
> None of the current specs violate this rule, but this validation should
> not be parser dependent and unspecified. Strict YAML validators such as
> Red Hat's VS Code YAML extension and Adrien Verge's yamllint will
> reject the netlink-raw.yaml schema:
> 
> Command:
>   $ yamllint Documentation/netlink/netlink-raw.yaml
> 
> Output:
>   185:13    error    duplication of key "if" in mapping  (key-duplicates)
>   189:13    error    duplication of key "then" in mapping  (key-duplicates)
> 
> The following invalid netlink family spec will pass validation in the
> current ynl tooling:
> 
>   # SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause)
>   ---
>   name: minimal-raw
>   doc: Minimal netlink-raw family for schema validation testing.
>   protocol: netlink-raw
>   protonum: 0
> 
>   definitions:
>     -
>       name: test-struct
>       type: struct
>       members:
>         -
>           name: reserved
>           type: pad
>           # len intentionally omitted
> 
>   attribute-sets: []
> 
>   operations:
>     list: []
> 
> Signed-off-by: Taylor Bates <tmbates12@gmail.com>
> ---
> This is a repost of patch 1 from the "netlink: fix ynl spec tooling
> robustness bugs" series, reduced to this single fix as requested.
> 
> The netlink-raw spec for the Bridge VLAN family that motivated the
> original series will be sent separately once this has landed.
> ---
> Changes in v2:
> - Drop patches 2/4, 3/4 and 4/4 from the series; this schema fix stands
>   on its own.
> - Drop the Fixes tag. This is developer tooling only and is not a bug
>   that needs to reach stable. The offending commit is now cited in the
>   commit message instead.
> - Link to v1: https://patch.msgid.link/20260908-ynl-robustness-v1-0-f255214c0f30@gmail.com
> 
> To: Donald Hunter <donald.hunter@gmail.com>
> To: Jakub Kicinski <kuba@kernel.org>
> To: "David S. Miller" <davem@davemloft.net>
> To: Eric Dumazet <edumazet@google.com>
> To: Paolo Abeni <pabeni@redhat.com>
> To: Simon Horman <horms@kernel.org>
> Cc: netdev@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  Documentation/netlink/netlink-raw.yaml | 31 +++++++++++++++++--------------
>  1 file changed, 17 insertions(+), 14 deletions(-)
> 
> diff --git a/Documentation/netlink/netlink-raw.yaml b/Documentation/netlink/netlink-raw.yaml
> index 4c436b59a34b..18ccfe05048a 100644
> --- a/Documentation/netlink/netlink-raw.yaml
> +++ b/Documentation/netlink/netlink-raw.yaml
> @@ -176,20 +176,23 @@ properties:
>                struct:
>                  description: Name of the nested struct type.
>                  type: string
> -            if:
> -              properties:
> -                type:
> -                  const: pad
> -            then:
> -              required: [ len ]
> -            if:
> -              properties:
> -                type:
> -                  const: binary
> -            then:
> -              oneOf:
> -                - required: [ len ]
> -                - required: [ struct ]
> +            allOf:
> +              -
> +                if:
> +                  properties:
> +                    type:
> +                      const: pad
> +                then:
> +                  required: [ len ]
> +              -
> +                if:
> +                  properties:
> +                    type:
> +                      const: binary
> +                then:
> +                  oneOf:
> +                    - required: [ len ]
> +                    - required: [ struct ]
>          # End genetlink-legacy
>  
>    attribute-sets:
> 
> ---
> base-commit: 043777e948807b5f335f58a0b9f5ed04bba681cf
> change-id: 20260907-ynl-robustness-d62d9693cc12
> 
> Best regards,
> --  
> Taylor Bates <tmbates12@gmail.com>
> 

Reviewed-by: Hangbin Liu <liuhangbin@kylinos.cn>
